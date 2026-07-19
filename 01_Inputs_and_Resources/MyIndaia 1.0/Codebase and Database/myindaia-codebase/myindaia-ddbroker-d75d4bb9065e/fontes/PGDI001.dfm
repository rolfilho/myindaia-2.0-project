object frm_DI_capa: Tfrm_DI_capa
  Left = 431
  Top = 156
  Width = 820
  Height = 558
  BorderIcons = [biSystemMenu]
  Caption = 'Declara'#231#227'o de Importa'#231#227'o '
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
    Width = 804
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 380
      Top = 4
      Width = 35
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
      Left = 5
      Top = 4
      Width = 35
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
      Left = 46
      Top = 4
      Width = 36
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
    object btn_adicao_di: TSpeedButton
      Left = 172
      Top = 4
      Width = 35
      Height = 41
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
    object btn_itens_di: TSpeedButton
      Left = 207
      Top = 4
      Width = 35
      Height = 41
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
    object btn_co_armazens: TSpeedButton
      Left = 102
      Top = 4
      Width = 35
      Height = 41
      Hint = 'Armaz'#233'm'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        000557777777777777750BBBBBBBBBBBBBB07F5555FFFFFFF5570BBBB0000000
        BBB07F5557777777FF570BBB077BBB770BB07F557755555775570BBBBBBBBBBB
        BBB07F5555FFFFFFF5570BBBB0000000BBB07F5557777777F5570BBBB0FFFFF0
        BBB07F5557FFFFF7F5570BBBB0000000BBB07F555777777755570BBBBBBBBBBB
        BBB07FFFFFFFFFFFFFF700000000000000007777777777777777500FFFFFFFFF
        F005577FF555FFFFF7755500FFF00000005555775FF7777777F5550F777FFFFF
        F055557F777FFF5557F5550000000FFF00555577777775FF77F5550777777000
        7055557FFFFFF777F7F555000000000000555577777777777755}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_co_armazensClick
    end
    object btn_calculo: TSpeedButton
      Left = 250
      Top = 4
      Width = 35
      Height = 41
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
    object btn_excluir: TSpeedButton
      Left = 137
      Top = 4
      Width = 35
      Height = 41
      Hint = 'Exclui DI'
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
    object btn_trans_DI: TSpeedButton
      Left = 293
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
      Left = 293
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
      Left = 335
      Top = 5
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
    object pnlClaro: TPanel
      Left = 444
      Top = 2
      Width = 358
      Height = 45
      Align = alRight
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object Shape1: TShape
        Left = 1
        Top = 1
        Width = 356
        Height = 43
        Align = alClient
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label92: TLabel
        Left = 6
        Top = 5
        Width = 113
        Height = 13
        Caption = 'Tipo de Declara'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dbedt_cd_tipo_declaracao: TDBEdit
        Left = 7
        Top = 19
        Width = 26
        Height = 20
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'CD_TIPO_DECLARACAO'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_nm_declaracao: TDBEdit
        Left = 34
        Top = 19
        Width = 318
        Height = 20
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'Look_tipo_declaracao'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object pgctrl_capa_di: TPageControl
    Left = 0
    Top = 49
    Width = 804
    Height = 450
    ActivePage = tbsht_carga_TD01
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_capa_diChange
    OnChanging = pgctrl_capa_diChanging
    object tbsht_importador_TD01: TTabSheet
      Caption = 'Importador'
      object lbl_tipo_declaracao2: TLabel
        Left = 12
        Top = 55
        Width = 73
        Height = 27
        AutoSize = False
        Caption = 'Tipo de Declara'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_tipo_declaracao2: TSpeedButton
        Left = 473
        Top = 58
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
        OnClick = btn_co_tipo_declaracao1Click
      end
      object lbl_importador2: TLabel
        Left = 16
        Top = 98
        Width = 61
        Height = 13
        Caption = 'Importador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_importador2: TSpeedButton
        Left = 473
        Top = 94
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
        OnClick = btn_co_importador1Click
      end
      object lbl_nr_registro_di2: TLabel
        Left = 12
        Top = 26
        Width = 66
        Height = 13
        Caption = 'N'#186' Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bl_dt_registro_di2: TLabel
        Left = 228
        Top = 26
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 45
        Top = 126
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
      object dbedt_nm_tipo_declaracao2: TDBEdit
        Left = 116
        Top = 58
        Width = 356
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_tipo_declaracao'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_nm_importador2: TDBEdit
        Left = 136
        Top = 94
        Width = 336
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Importador'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object grpbox_tipo_importador2: TGroupBox
        Left = 12
        Top = 156
        Width = 709
        Height = 145
        Caption = 'Tipo do Importador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object rbtn_pessoa_juridica2: TRadioButton
          Left = 20
          Top = 32
          Width = 117
          Height = 17
          Caption = 'Pessoa Jur'#237'dica'
          TabOrder = 0
          OnClick = rbtn_pessoa_juridica2Click
        end
        object rbtn_pessoa_fisica_pais2: TRadioButton
          Left = 20
          Top = 70
          Width = 225
          Height = 17
          Caption = 'Pessoa F'#237'sica domiciliado no Pa'#237's'
          TabOrder = 1
          OnClick = rbtn_pessoa_juridica2Click
        end
        object rbtn_missao_diplomatica2: TRadioButton
          Left = 20
          Top = 108
          Width = 409
          Height = 17
          Caption = 'Miss'#227'o Diplom'#225'tica ou Representa'#231#227'o de Organismo Internacional'
          TabOrder = 2
          OnClick = rbtn_pessoa_juridica2Click
        end
      end
      object dbedt_nr_registro_di2: TDBEdit
        Left = 88
        Top = 22
        Width = 120
        Height = 21
        DataField = 'NR_DECLARACAO_IMP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 0
        OnExit = dbedt_cd_importador2Exit
      end
      object dbedt_dt_registro_di2: TDBEdit
        Left = 264
        Top = 22
        Width = 109
        Height = 21
        DataField = 'DT_REGISTRO_DI'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        OnExit = dbedt_dt_registro_di2Exit
      end
      object grpbox_retif1: TGroupBox
        Left = 12
        Top = 308
        Width = 709
        Height = 72
        Caption = 'Retifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
        object lbl_nr_retif1: TLabel
          Left = 13
          Top = 22
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
        object lbl_dt_retif1: TLabel
          Left = 69
          Top = 22
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_motivo_retif1: TLabel
          Left = 185
          Top = 22
          Width = 39
          Height = 13
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_motivo_retif1: TSpeedButton
          Left = 572
          Top = 35
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
          OnClick = btn_co_motivo_retif1Click
        end
        object dbedt_nr_seq_retif1: TDBEdit
          Left = 14
          Top = 35
          Width = 45
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SEQ_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_motivo_retif1: TDBEdit
          Left = 216
          Top = 35
          Width = 355
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMotivoRetif'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_dt_retif1: TDBEdit
          Left = 69
          Top = 35
          Width = 107
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_motivo_retif1: TDBEdit
          Left = 185
          Top = 35
          Width = 32
          Height = 21
          DataField = 'CD_MOTIVO_RETIF'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
          OnExit = dbedt_cd_motivo_retif1Exit
        end
      end
      object dbedt_cd_tipo_declaracao2: TDBEdit
        Left = 88
        Top = 58
        Width = 29
        Height = 21
        DataField = 'CD_TIPO_DECLARACAO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnEnter = dbedt_cd_tipo_declaracao2Enter
        OnExit = dbedt_cd_tipo_declaracao2Exit
      end
      object dbedt_cd_importador2: TDBEdit
        Left = 88
        Top = 94
        Width = 49
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        OnChange = dbedt_cd_importador2Change
        OnExit = dbedt_cd_importador2Exit
      end
      object edtCNPJImportador: TMaskEdit
        Left = 89
        Top = 126
        Width = 160
        Height = 19
        BorderStyle = bsNone
        EditMask = '99.999.999/9999-99;0'
        MaxLength = 18
        ParentColor = True
        ReadOnly = True
        TabOrder = 8
      end
    end
    object tbsht_importador_TD05: TTabSheet
      Caption = '&Importador'
      TabVisible = False
      object lbl_importador1: TLabel
        Left = 12
        Top = 98
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
      object btn_co_importador1: TSpeedButton
        Left = 473
        Top = 94
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
        OnClick = btn_co_importador1Click
      end
      object lbl_tipo_declaracao1: TLabel
        Left = 12
        Top = 55
        Width = 73
        Height = 27
        AutoSize = False
        Caption = 'Tipo de Declara'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_tipo_declaracao1: TSpeedButton
        Left = 473
        Top = 58
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
        OnClick = btn_co_tipo_declaracao1Click
      end
      object lbl_nr_registro_di1: TLabel
        Left = 12
        Top = 26
        Width = 66
        Height = 13
        Caption = 'N'#186' Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_registro_di1: TLabel
        Left = 228
        Top = 26
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grpbox_tipo_importador1: TGroupBox
        Left = 12
        Top = 128
        Width = 493
        Height = 145
        Caption = 'Tipo do Importador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object rbtn_pessoa_juridica1: TRadioButton
          Left = 13
          Top = 24
          Width = 117
          Height = 17
          Caption = 'Pessoa Jur'#237'dica'
          TabOrder = 0
          OnClick = rbtn_pessoa_juridica2Click
        end
        object rbtn_pessoa_fisica_pais1: TRadioButton
          Left = 13
          Top = 55
          Width = 225
          Height = 17
          Caption = 'Pessoa F'#237'sica domiciliado no Pa'#237's'
          TabOrder = 1
          OnClick = rbtn_pessoa_juridica2Click
        end
        object rbtn_pessoa_fisica_exterior1: TRadioButton
          Left = 13
          Top = 85
          Width = 237
          Height = 17
          Caption = 'Pessoa F'#237'sica domiciliado no Exterior'
          TabOrder = 2
          OnClick = rbtn_pessoa_juridica2Click
        end
        object rbtn_missao_diplomatica1: TRadioButton
          Left = 13
          Top = 116
          Width = 409
          Height = 17
          Caption = 'Miss'#227'o Diplom'#225'tica ou Representa'#231#227'o de Organismo Internacional'
          TabOrder = 3
          OnClick = rbtn_pessoa_juridica2Click
        end
      end
      object dbedt_cd_importador1: TDBEdit
        Left = 88
        Top = 94
        Width = 48
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        OnExit = dbedt_cd_importador2Exit
      end
      object dbedt_nm_importador1: TDBEdit
        Left = 136
        Top = 94
        Width = 336
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Importador'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_cd_tipo_declaracao1: TDBEdit
        Left = 88
        Top = 58
        Width = 28
        Height = 21
        DataField = 'CD_TIPO_DECLARACAO'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 2
        OnEnter = dbedt_cd_tipo_declaracao2Enter
        OnExit = dbedt_cd_tipo_declaracao2Exit
      end
      object dbedt_nm_tipo_declaracao1: TDBEdit
        Left = 116
        Top = 58
        Width = 356
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_tipo_declaracao'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_nr_registro_di1: TDBEdit
        Left = 88
        Top = 22
        Width = 109
        Height = 21
        DataField = 'NR_DECLARACAO_IMP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 0
        OnExit = dbedt_cd_importador2Exit
      end
      object dbedt_dt_registro_di1: TDBEdit
        Left = 264
        Top = 22
        Width = 109
        Height = 21
        DataField = 'DT_REGISTRO_DI'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        OnExit = dbedt_dt_registro_di2Exit
      end
      object grpbox_retif2: TGroupBox
        Left = 12
        Top = 288
        Width = 601
        Height = 64
        Caption = 'Retifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
        object lbl_nr_retif2: TLabel
          Left = 12
          Top = 17
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
        object lbl_dt_retif2: TLabel
          Left = 68
          Top = 17
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_motivo_retif2: TLabel
          Left = 184
          Top = 17
          Width = 39
          Height = 13
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_motivo_retif2: TSpeedButton
          Left = 570
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
          OnClick = btn_co_motivo_retif2Click
        end
        object dbedt_nr_seq_retif2: TDBEdit
          Left = 12
          Top = 31
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SEQ_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_motivo_retif2: TDBEdit
          Left = 183
          Top = 31
          Width = 31
          Height = 21
          DataField = 'CD_MOTIVO_RETIF'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
          OnExit = dbedt_cd_motivo_retif2Exit
        end
        object dbedt_nm_motivo_retif2: TDBEdit
          Left = 214
          Top = 31
          Width = 355
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMotivoRetif'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_dt_retif2: TDBEdit
          Left = 67
          Top = 31
          Width = 109
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object tbsht_importador_TD14: TTabSheet
      Caption = '&Importador'
      TabVisible = False
      object lbl_tipo_declaracao3: TLabel
        Left = 12
        Top = 55
        Width = 73
        Height = 27
        AutoSize = False
        Caption = 'Tipo de Declara'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_tipo_declaracao3: TSpeedButton
        Left = 473
        Top = 58
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
        OnClick = btn_co_tipo_declaracao1Click
      end
      object lbl_importador3: TLabel
        Left = 12
        Top = 98
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
      object btn_co_importador3: TSpeedButton
        Left = 473
        Top = 94
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
        OnClick = btn_co_importador1Click
      end
      object lbl_nr_registro_di3: TLabel
        Left = 12
        Top = 26
        Width = 66
        Height = 13
        Caption = 'N'#186' Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_registro_di3: TLabel
        Left = 232
        Top = 26
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_cd_tipo_declaracao3: TDBEdit
        Left = 88
        Top = 58
        Width = 28
        Height = 21
        DataField = 'CD_TIPO_DECLARACAO'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 2
        OnEnter = dbedt_cd_tipo_declaracao2Enter
        OnExit = dbedt_cd_tipo_declaracao2Exit
      end
      object dbedt_nm_tipo_declaracao3: TDBEdit
        Left = 116
        Top = 58
        Width = 356
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_tipo_declaracao'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_importador3: TDBEdit
        Left = 88
        Top = 94
        Width = 48
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        OnExit = dbedt_cd_importador2Exit
      end
      object dbedt_nm_importador3: TDBEdit
        Left = 136
        Top = 94
        Width = 336
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Importador'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object grpbox_tipo_importador3: TGroupBox
        Left = 12
        Top = 136
        Width = 493
        Height = 145
        Caption = 'Tipo do Importador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object rbtn_pessoa_juridica3: TRadioButton
          Left = 40
          Top = 44
          Width = 117
          Height = 17
          Caption = 'Pessoa Jur'#237'dica'
          TabOrder = 0
          OnClick = rbtn_pessoa_juridica2Click
        end
        object rbtn_missao_diplomatica3: TRadioButton
          Left = 40
          Top = 88
          Width = 409
          Height = 17
          Caption = 'Miss'#227'o Diplom'#225'tica ou Representa'#231#227'o de Organismo Internacional'
          TabOrder = 1
          OnClick = rbtn_pessoa_juridica2Click
        end
      end
      object dbedt_dt_registro_di3: TDBEdit
        Left = 264
        Top = 22
        Width = 109
        Height = 21
        DataField = 'DT_REGISTRO_DI'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        OnExit = dbedt_dt_registro_di2Exit
      end
      object dbedt_nr_registro_di3: TDBEdit
        Left = 88
        Top = 22
        Width = 109
        Height = 21
        DataField = 'NR_DECLARACAO_IMP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 0
        OnExit = dbedt_cd_importador2Exit
      end
      object grpbox_retif3: TGroupBox
        Left = 12
        Top = 288
        Width = 601
        Height = 64
        Caption = 'Retifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        Visible = False
        object lbl_nr_retif3: TLabel
          Left = 12
          Top = 17
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
        object lbl_dt_retif3: TLabel
          Left = 68
          Top = 17
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_motivo_retif3: TLabel
          Left = 184
          Top = 17
          Width = 39
          Height = 13
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_motivo_retif3: TSpeedButton
          Left = 570
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
          OnClick = btn_co_motivo_retif3Click
        end
        object dbedt_nr_seq_retif3: TDBEdit
          Left = 12
          Top = 31
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SEQ_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_cd_motivo_retif3: TDBEdit
          Left = 183
          Top = 31
          Width = 29
          Height = 21
          DataField = 'CD_MOTIVO_RETIF'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
          OnExit = dbedt_cd_motivo_retif3Exit
        end
        object dbedt_nm_motivo_retif3: TDBEdit
          Left = 214
          Top = 31
          Width = 353
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMotivoRetif'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_dt_retif3: TDBEdit
          Left = 67
          Top = 31
          Width = 109
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object tbsht_importador_TD04: TTabSheet
      Caption = '&Importador'
      TabVisible = False
      object lbl_tipo_declaracao4: TLabel
        Left = 36
        Top = 71
        Width = 73
        Height = 27
        AutoSize = False
        Caption = 'Tipo de Declara'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_tipo_declaracao4: TSpeedButton
        Left = 497
        Top = 74
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
        OnClick = btn_co_tipo_declaracao1Click
      end
      object lbl_importador4: TLabel
        Left = 36
        Top = 114
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
      object btn_co_importador4: TSpeedButton
        Left = 497
        Top = 110
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
        OnClick = btn_co_importador1Click
      end
      object lbl_nr_registro_di4: TLabel
        Left = 36
        Top = 42
        Width = 66
        Height = 13
        Caption = 'N'#186' Registro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_registro_di4: TLabel
        Left = 252
        Top = 42
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nm_tipo_declaracao4: TDBEdit
        Left = 140
        Top = 74
        Width = 356
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_tipo_declaracao'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_nm_importador4: TDBEdit
        Left = 160
        Top = 110
        Width = 336
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Importador'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_nr_registro_di4: TDBEdit
        Left = 112
        Top = 38
        Width = 109
        Height = 21
        DataField = 'NR_DECLARACAO_IMP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 0
        OnExit = dbedt_cd_importador2Exit
      end
      object dbedt_dt_registro_di4: TDBEdit
        Left = 288
        Top = 38
        Width = 109
        Height = 21
        DataField = 'DT_REGISTRO_DI'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        OnExit = dbedt_dt_registro_di2Exit
      end
      object grpbox_retif4: TGroupBox
        Left = 44
        Top = 288
        Width = 646
        Height = 83
        Caption = 'Retifica'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        Visible = False
        object lbl_nr_retif4: TLabel
          Left = 20
          Top = 27
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
        object lbl_dt_retif4: TLabel
          Left = 76
          Top = 27
          Width = 28
          Height = 13
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_motivo_retif4: TLabel
          Left = 192
          Top = 27
          Width = 39
          Height = 13
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_motivo_retif4: TSpeedButton
          Left = 578
          Top = 41
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
          OnClick = btn_co_motivo_retif4Click
        end
        object dbedt_nr_seq_retif4: TDBEdit
          Left = 20
          Top = 41
          Width = 46
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SEQ_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_motivo_retif4: TDBEdit
          Left = 222
          Top = 41
          Width = 355
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMotivoRetif'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_dt_retif4: TDBEdit
          Left = 75
          Top = 41
          Width = 108
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_RETIFICACAO'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_motivo_retif4: TDBEdit
          Left = 191
          Top = 41
          Width = 32
          Height = 21
          DataField = 'CD_MOTIVO_RETIF'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
          OnExit = dbedt_cd_motivo_retif4Exit
        end
      end
      object dbedt_cd_importador4: TDBEdit
        Left = 112
        Top = 110
        Width = 49
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 3
        OnExit = dbedt_cd_importador2Exit
      end
      object dbedt_cd_tipo_declaracao4: TDBEdit
        Left = 112
        Top = 74
        Width = 29
        Height = 21
        DataField = 'CD_TIPO_DECLARACAO'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 2
        OnEnter = dbedt_cd_tipo_declaracao2Enter
        OnExit = dbedt_cd_tipo_declaracao2Exit
      end
    end
    object tbsht_basicas_TD01: TTabSheet
      Caption = 'B'#225'sicas'
      object lbl_urf_despacho1: TLabel
        Left = 79
        Top = 10
        Width = 105
        Height = 13
        Caption = 'URF de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_urf_despacho1: TSpeedButton
        Left = 594
        Top = 23
        Width = 25
        Height = 21
        Enabled = False
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
        OnClick = btn_co_urf_despacho1Click
      end
      object Label1: TLabel
        Left = 82
        Top = 64
        Width = 576
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documentos de Instru'#231#227'o do Embarque'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label2: TLabel
        Left = 82
        Top = 217
        Width = 314
        Height = 73
        Alignment = taCenter
        AutoSize = False
        Caption = 'Processo Vinculado'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbedt_nm_urf_despacho1: TDBEdit
        Left = 144
        Top = 23
        Width = 449
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_urf_despacho'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 3
      end
      object dbg_doc_instrucao_despacho1: TDBGrid
        Left = 82
        Top = 80
        Width = 578
        Height = 125
        DataSource = datm_DI_Capa.ds_di_doc_instr_emb
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Doc_Instr_Emb'
            Title.Alignment = taCenter
            Width = 293
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DCTO_INSTRUCAO'
            Title.Alignment = taCenter
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FATURA'
            Title.Caption = 'Dt. Fatura'
            Visible = True
          end>
      end
      object dbg_proc_vinculado1: TDBGrid
        Left = 82
        Top = 233
        Width = 314
        Height = 166
        DataSource = datm_DI_Capa.ds_di_proc_vinc
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Proc_Vinc'
            Title.Alignment = taCenter
            Width = 153
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PROCESSO_INSTR'
            Title.Alignment = taCenter
            Width = 133
            Visible = True
          end>
      end
      object GroupBox11: TGroupBox
        Left = 412
        Top = 212
        Width = 249
        Height = 187
        Caption = 'Modalidade de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object rbtn_modalidade_despacho_normal1: TRadioButton
          Left = 8
          Top = 17
          Width = 117
          Height = 17
          Caption = 'Normal'
          TabOrder = 0
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_antecipado1: TRadioButton
          Left = 8
          Top = 41
          Width = 93
          Height = 17
          Caption = 'Antecipado'
          TabOrder = 1
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_ant_simp1: TRadioButton
          Left = 8
          Top = 90
          Width = 173
          Height = 17
          Caption = 'Antecipado e Simplificado'
          TabOrder = 2
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_ent_frac1: TRadioButton
          Left = 8
          Top = 114
          Width = 141
          Height = 17
          Caption = 'Entrega Fracionada'
          TabOrder = 3
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_ant_ent_frac1: TRadioButton
          Left = 8
          Top = 138
          Width = 229
          Height = 17
          Caption = 'Antecipado com Entrega Fracionada'
          TabOrder = 4
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_simplificado1: TRadioButton
          Left = 8
          Top = 66
          Width = 93
          Height = 17
          Caption = 'Simplificado'
          TabOrder = 5
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_SobreAguasOEA: TRadioButton
          Left = 8
          Top = 164
          Width = 229
          Height = 17
          Caption = 'Sobre '#193'guas OEA'
          TabOrder = 6
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
      end
      object dbedt_cd_urf_despacho1: TDBEdit
        Left = 80
        Top = 23
        Width = 65
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_URF_DESPACHO'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 0
        OnExit = dbedt_cd_urf_despacho1Exit
      end
    end
    object tbsht_basicas_TD02: TTabSheet
      Caption = '&B'#225'sicas'
      TabVisible = False
      object lbl_urf_despacho2: TLabel
        Left = 77
        Top = 18
        Width = 105
        Height = 13
        Caption = 'URF de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_urf_despacho2: TSpeedButton
        Left = 442
        Top = 31
        Width = 25
        Height = 21
        Enabled = False
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
        OnClick = btn_co_urf_despacho2Click
      end
      object Label3: TLabel
        Left = 78
        Top = 64
        Width = 591
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documentos de Instru'#231#227'o do Embarque'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 79
        Top = 253
        Width = 326
        Height = 23
        Alignment = taCenter
        AutoSize = False
        Caption = 'Processo Vinculado'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbedt_cd_urf_despacho2: TDBEdit
        Left = 77
        Top = 31
        Width = 64
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_URF_DESPACHO'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 0
        OnExit = dbedt_cd_urf_despacho1Exit
      end
      object dbedt_nm_urf_despacho2: TDBEdit
        Left = 141
        Top = 31
        Width = 299
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_urf_despacho'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 78
        Top = 80
        Width = 591
        Height = 133
        DataSource = datm_DI_Capa.ds_di_doc_instr_emb
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Doc_Instr_Emb'
            Width = 271
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DCTO_INSTRUCAO'
            Width = 159
            Visible = True
          end>
      end
      object DBGrid2: TDBGrid
        Left = 79
        Top = 269
        Width = 326
        Height = 134
        DataSource = datm_DI_Capa.ds_di_proc_vinc
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Proc_Vinc'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PROCESSO_INSTR'
            Width = 116
            Visible = True
          end>
      end
      object GroupBox12: TGroupBox
        Left = 421
        Top = 248
        Width = 249
        Height = 156
        Caption = 'Modalidade de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object rbtn_modalidade_despacho_normal2: TRadioButton
          Left = 8
          Top = 24
          Width = 117
          Height = 17
          Caption = 'Normal'
          TabOrder = 0
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
        object rbtn_modalidade_despacho_antecipado2: TRadioButton
          Left = 8
          Top = 50
          Width = 93
          Height = 17
          Caption = 'Antecipado'
          TabOrder = 1
          OnClick = rbtn_modalidade_despacho_normal1Click
        end
      end
    end
    object tbsht_basicas_TD13: TTabSheet
      Caption = '&B'#225'sicas'
      TabVisible = False
      object lbl_urf_despacho3: TLabel
        Left = 76
        Top = 18
        Width = 105
        Height = 13
        Caption = 'URF de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_urf_despacho3: TSpeedButton
        Left = 442
        Top = 31
        Width = 25
        Height = 21
        Enabled = False
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
        OnClick = btn_co_urf_despacho3Click
      end
      object Label5: TLabel
        Left = 78
        Top = 64
        Width = 591
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documentos de Instru'#231#227'o do Embarque'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 212
        Top = 240
        Width = 318
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Processo Vinculado'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbedt_cd_urf_despacho3: TDBEdit
        Left = 77
        Top = 31
        Width = 64
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_URF_DESPACHO'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 0
        OnExit = dbedt_cd_urf_despacho1Exit
      end
      object dbedt_nm_urf_despacho3: TDBEdit
        Left = 141
        Top = 31
        Width = 299
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_urf_despacho'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 1
      end
      object DBGrid3: TDBGrid
        Left = 78
        Top = 80
        Width = 591
        Height = 133
        DataSource = datm_DI_Capa.ds_di_doc_instr_emb
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Doc_Instr_Emb'
            Width = 271
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DCTO_INSTRUCAO'
            Width = 159
            Visible = True
          end>
      end
      object DBGrid4: TDBGrid
        Left = 212
        Top = 256
        Width = 318
        Height = 130
        DataSource = datm_DI_Capa.ds_di_proc_vinc
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'Look_Proc_Vinc'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_PROCESSO_INSTR'
            Width = 116
            Visible = True
          end>
      end
    end
    object tbsht_Transporte_Maritimo: TTabSheet
      Caption = 'Transporte'
      OnShow = tbsht_Transporte_MaritimoShow
      object lbl_transportador2: TLabel
        Left = 19
        Top = 130
        Width = 80
        Height = 13
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transportador2: TSpeedButton
        Left = 502
        Top = 126
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
        OnClick = btn_co_transportador1Click
      end
      object lbl_nm_embarcacao2: TLabel
        Left = 19
        Top = 155
        Width = 71
        Height = 13
        Caption = 'Embarca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_doc_chegada_carga2: TLabel
        Left = 432
        Top = 54
        Width = 5
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 19
        Top = 179
        Width = 51
        Height = 13
        Caption = 'Bandeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais1: TSpeedButton
        Left = 502
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
        OnClick = btn_co_pais1Click
      end
      object lbl_nr_presenca_carga2: TLabel
        Left = 19
        Top = 205
        Width = 127
        Height = 13
        Caption = 'N'#186' Presen'#231'a de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_embarcacao2: TSpeedButton
        Left = 502
        Top = 151
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
        OnClick = btn_co_embarcacao2Click
      end
      object grpbox_conhecimento_transporte2: TGroupBox
        Left = 19
        Top = 260
        Width = 702
        Height = 149
        Caption = '  Conhecimento de Transporte  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object lbl_identif_master2: TLabel
          Left = 316
          Top = 19
          Width = 94
          Height = 13
          Caption = 'Ident. do Master'
        end
        object lbl_identif_conhecimento2: TLabel
          Left = 168
          Top = 19
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
        end
        object lbl_dt_embarque2: TLabel
          Left = 168
          Top = 99
          Width = 106
          Height = 13
          Caption = 'Data de Embarque'
        end
        object lbl_local_embarque2: TLabel
          Left = 168
          Top = 60
          Width = 110
          Height = 13
          Caption = 'Local de Embarque'
        end
        object btn_co_local_embarque2: TSpeedButton
          Left = 424
          Top = 73
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
          OnClick = btn_co_local_embarque1Click
        end
        object dbedt_nr_doc_carga2: TDBEdit
          Left = 168
          Top = 32
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 0
        end
        object dbedt_nr_doc_carga_master2: TDBEdit
          Left = 316
          Top = 32
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA_MAST'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
        end
        object dbedt_dt_embarque2: TDBEdit
          Left = 168
          Top = 112
          Width = 113
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 3
          OnExit = dbedt_dt_embarque2Exit
        end
        object dbedt_nm_local_embarque2: TDBEdit
          Left = 216
          Top = 73
          Width = 207
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_local_Embarque'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 4
        end
        object GroupBox13: TGroupBox
          Left = 16
          Top = 20
          Width = 125
          Height = 113
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          TabStop = True
          object rbtn_BL1: TRadioButton
            Left = 8
            Top = 36
            Width = 49
            Height = 17
            Caption = 'B/L'
            TabOrder = 0
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_BL1DblClick
          end
          object rbtn_House_BL1: TRadioButton
            Left = 8
            Top = 70
            Width = 89
            Height = 17
            Caption = 'House B/L'
            TabOrder = 1
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_House_BL1DblClick
          end
        end
        object dbedt_cd_local_embarque2: TDBEdit
          Left = 168
          Top = 73
          Width = 49
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
          OnExit = dbedt_cd_local_embarque2Exit
        end
      end
      object dbedt_nm_transportador2: TDBEdit
        Left = 155
        Top = 126
        Width = 346
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_nm_embarcacao2: TDBEdit
        Left = 155
        Top = 151
        Width = 346
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object dbchkbox_transporte_multimodal2: TDBCheckBox
        Left = 464
        Top = 24
        Width = 157
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedt_nm_bandeira_transp_itl2: TDBEdit
        Left = 155
        Top = 175
        Width = 346
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Bandeira_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 9
      end
      object DBGrid13: TDBGrid
        Left = 160
        Top = 24
        Width = 297
        Height = 77
        Color = clBtnFace
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 262
            Visible = True
          end>
      end
      object dbrdgrp_cd_util_dcto_carga_mar: TDBRadioGroup
        Left = 592
        Top = 279
        Width = 113
        Height = 113
        Caption = 'Utiliza'#231#227'o'
        DataField = 'CD_UTIL_DCTO_CARGA'
        DataSource = datm_DI_Capa.ds_di
        Items.Strings = (
          'Total'
          'Parcial'
          'Mais de Um')
        TabOrder = 10
        Values.Strings = (
          '1'
          '2'
          '3')
      end
      object gbox_doc_chegada_carga2: TGroupBox
        Left = 539
        Top = 91
        Width = 182
        Height = 133
        Caption = 'Doc. Chegada da Carga'
        TabOrder = 11
        object lbl_identificacao2: TLabel
          Left = 8
          Top = 82
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
        object rbtn_manifesto_carga2: TRadioButton
          Left = 8
          Top = 24
          Width = 129
          Height = 17
          Caption = 'Manifesto de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_manifesto_carga2DblClick
        end
        object rbtn_dta2: TRadioButton
          Left = 8
          Top = 52
          Width = 49
          Height = 17
          Caption = 'DTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_dta2DblClick
        end
        object dbedt_identificacao2: TDBEdit
          Left = 8
          Top = 96
          Width = 153
          Height = 21
          DataField = 'NR_MANIFESTO'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
      end
      object dbedt_nr_presenca_carga2: TDBEdit
        Left = 155
        Top = 201
        Width = 262
        Height = 21
        Color = clMenu
        DataField = 'CD_PRESENCA_CARGA'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_cd_embarcacao2: TDBEdit
        Left = 111
        Top = 151
        Width = 45
        Height = 21
        DataField = 'CD_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 3
        OnExit = dbedt_cd_embarcacao2Exit
      end
      object dbedt_cd_transportador2: TDBEdit
        Left = 111
        Top = 126
        Width = 45
        Height = 21
        DataField = 'CD_TRANSPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_cd_transportador2Exit
      end
      object dbedt_cd_bandeira_transp_itl2: TDBEdit
        Left = 111
        Top = 175
        Width = 45
        Height = 21
        DataField = 'CD_BANDEIRA_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 4
        OnEnter = dbedt_cd_bandeira_transp_itl2Enter
        OnExit = dbedt_cd_bandeira_transp_itl2Exit
      end
    end
    object tbsht_Transporte_Fluvial: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object lbl_cd_transportador6: TLabel
        Left = 20
        Top = 154
        Width = 80
        Height = 13
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transportador6: TSpeedButton
        Left = 376
        Top = 150
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
        OnClick = btn_co_transportador1Click
      end
      object Label20: TLabel
        Left = 20
        Top = 182
        Width = 71
        Height = 13
        Caption = 'Embarca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_embarcacao6: TSpeedButton
        Left = 376
        Top = 178
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
        OnClick = btn_co_embarcacao2Click
      end
      object dbedt_cd_transportador6: TDBEdit
        Left = 112
        Top = 150
        Width = 41
        Height = 21
        DataField = 'CD_TRANSPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_cd_transportador2Exit
      end
      object dbedt_nm_transportador6: TDBEdit
        Left = 160
        Top = 150
        Width = 209
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object grpbox_conhecimento_transporte6: TGroupBox
        Left = 20
        Top = 260
        Width = 693
        Height = 149
        Caption = '  Conhecimento de Transporte  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object lbl_identif_master6: TLabel
          Left = 304
          Top = 22
          Width = 94
          Height = 13
          Caption = 'Ident. do Master'
        end
        object lbl_identif_conhecimento6: TLabel
          Left = 160
          Top = 22
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
        end
        object lbl_dt_embarque6: TLabel
          Left = 160
          Top = 102
          Width = 106
          Height = 13
          Caption = 'Data de Embarque'
        end
        object lbl_local_embarque6: TLabel
          Left = 160
          Top = 63
          Width = 110
          Height = 13
          Caption = 'Local de Embarque'
        end
        object btn_co_local_embarque6: TSpeedButton
          Left = 412
          Top = 76
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
          OnClick = btn_co_local_embarque1Click
        end
        object dbedt_nr_doc_carga6: TDBEdit
          Left = 160
          Top = 35
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
        end
        object dbedt_nr_doc_carga_master6: TDBEdit
          Left = 304
          Top = 35
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA_MAST'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
        object dbedt_cd_local_embarque6: TDBEdit
          Left = 160
          Top = 76
          Width = 45
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 3
          OnExit = dbedt_cd_local_embarque2Exit
        end
        object dbedt_nm_local_embarque6: TDBEdit
          Left = 205
          Top = 76
          Width = 206
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_local_Embarque'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_dt_embarque6: TDBEdit
          Left = 160
          Top = 115
          Width = 113
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 4
          OnExit = dbedt_dt_embarque2Exit
        end
        object GroupBox14: TGroupBox
          Left = 15
          Top = 21
          Width = 125
          Height = 113
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rbtn_BL2: TRadioButton
            Left = 8
            Top = 36
            Width = 49
            Height = 17
            Caption = 'B/L'
            TabOrder = 0
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_BL2DblClick
          end
          object rbtn_House_BL2: TRadioButton
            Left = 8
            Top = 70
            Width = 89
            Height = 17
            Caption = 'House B/L'
            TabOrder = 1
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_House_BL2DblClick
          end
        end
        object dbrdgrp_cd_util_dcto_carga_fluvial: TDBRadioGroup
          Left = 564
          Top = 20
          Width = 113
          Height = 113
          Caption = 'Utiliza'#231#227'o'
          DataField = 'CD_UTIL_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          Items.Strings = (
            'Total'
            'Parcial'
            'Mais de Um')
          TabOrder = 6
          Values.Strings = (
            '1'
            '2'
            '3')
        end
      end
      object dbchkbox_transporte_multimodal6: TDBCheckBox
        Left = 488
        Top = 24
        Width = 165
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedt_nm_embarcacao6: TDBEdit
        Left = 160
        Top = 178
        Width = 209
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 3
      end
      object dbg_transporte_fluvial: TDBGrid
        Left = 176
        Top = 24
        Width = 297
        Height = 77
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 266
            Visible = True
          end>
      end
      object gbox_doc_chegada_carga6: TGroupBox
        Left = 527
        Top = 83
        Width = 185
        Height = 133
        Caption = 'Doc. Chegada da Carga'
        TabOrder = 6
        object lbl_identificacao6: TLabel
          Left = 16
          Top = 81
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
        object rbtn_manifesto_carga6: TRadioButton
          Left = 16
          Top = 23
          Width = 129
          Height = 17
          Caption = 'Manifesto de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_manifesto_carga6DblClick
        end
        object rbtn_dta6: TRadioButton
          Left = 16
          Top = 53
          Width = 45
          Height = 17
          Caption = 'DTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_dta6DblClick
        end
        object dbedt_identificacao6: TDBEdit
          Left = 16
          Top = 98
          Width = 153
          Height = 21
          DataField = 'NR_MANIFESTO'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
      end
      object dbedt_cd_embarcacao6: TDBEdit
        Left = 112
        Top = 178
        Width = 41
        Height = 21
        DataField = 'CD_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 7
        OnExit = btn_co_embarcacao2Click
      end
    end
    object tbsht_Transporte_Lacustre: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      OnExit = dbedt_dt_embarque2Exit
      object lbl_transportador7: TLabel
        Left = 20
        Top = 146
        Width = 80
        Height = 13
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transportador7: TSpeedButton
        Left = 488
        Top = 142
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
        OnClick = btn_co_transportador1Click
      end
      object Label11: TLabel
        Left = 20
        Top = 174
        Width = 71
        Height = 13
        Caption = 'Embarca'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_embarcacao7: TSpeedButton
        Left = 488
        Top = 170
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
        OnClick = btn_co_embarcacao2Click
      end
      object gbox_doc_chegada_carga7: TGroupBox
        Left = 529
        Top = 76
        Width = 185
        Height = 133
        Caption = 'Doc. Chegada da Carga'
        TabOrder = 6
        object lbl_identificacao7: TLabel
          Left = 18
          Top = 84
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
        object rbtn_manifesto_carga7: TRadioButton
          Left = 16
          Top = 26
          Width = 129
          Height = 17
          Caption = 'Manifesto de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_manifesto_carga7DblClick
        end
        object rbtn_dta7: TRadioButton
          Left = 16
          Top = 55
          Width = 49
          Height = 17
          Caption = 'DTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_dta7DblClick
        end
        object dbedt_identificacao7: TDBEdit
          Left = 16
          Top = 100
          Width = 153
          Height = 21
          DataField = 'NR_MANIFESTO'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
      end
      object dbedt_cd_transportador7: TDBEdit
        Left = 112
        Top = 142
        Width = 48
        Height = 21
        DataField = 'CD_TRANSPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 2
        OnExit = dbedt_cd_transportador2Exit
      end
      object dbedt_nm_transportador7: TDBEdit
        Left = 160
        Top = 142
        Width = 327
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object grpbox_conhecimento_transporte7: TGroupBox
        Left = 20
        Top = 256
        Width = 695
        Height = 149
        Caption = '  Conhecimento de Transporte  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object lbl_identif_master7: TLabel
          Left = 304
          Top = 17
          Width = 94
          Height = 13
          Caption = 'Ident. do Master'
        end
        object lbl_identif_conhecimento7: TLabel
          Left = 168
          Top = 17
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
        end
        object lbl_dt_embarque7: TLabel
          Left = 168
          Top = 101
          Width = 106
          Height = 13
          Caption = 'Data de Embarque'
        end
        object lbl_local_embarque7: TLabel
          Left = 168
          Top = 59
          Width = 110
          Height = 13
          Caption = 'Local de Embarque'
        end
        object btn_co_local_embarque7: TSpeedButton
          Left = 428
          Top = 72
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
          OnClick = btn_co_local_embarque1Click
        end
        object dbedt_nr_doc_carga7: TDBEdit
          Left = 168
          Top = 30
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
        end
        object dbedt_nr_doc_carga_master7: TDBEdit
          Left = 304
          Top = 30
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA_MAST'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
        object dbedt_dt_embarque7: TDBEdit
          Left = 168
          Top = 114
          Width = 113
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 4
          OnExit = dbedt_dt_embarque2Exit
        end
        object dbedt_cd_local_embarque7: TDBEdit
          Left = 168
          Top = 72
          Width = 46
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          MaxLength = 5
          TabOrder = 3
          OnExit = dbedt_cd_local_embarque2Exit
        end
        object dbedt_nm_local_embarque7: TDBEdit
          Left = 214
          Top = 72
          Width = 213
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_local_Embarque'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 5
        end
        object GroupBox15: TGroupBox
          Left = 17
          Top = 20
          Width = 125
          Height = 113
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rbtn_BL3: TRadioButton
            Left = 8
            Top = 36
            Width = 49
            Height = 17
            Caption = 'B/L'
            TabOrder = 0
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_BL3DblClick
          end
          object rbtn_House_BL3: TRadioButton
            Left = 8
            Top = 70
            Width = 89
            Height = 17
            Caption = 'House B/L'
            TabOrder = 1
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_House_BL3DblClick
          end
        end
        object dbrdgrp_cd_util_dcto_carga_lacustre: TDBRadioGroup
          Left = 565
          Top = 18
          Width = 113
          Height = 113
          Caption = 'Utiliza'#231#227'o'
          DataField = 'CD_UTIL_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          Items.Strings = (
            'Total'
            'Parcial'
            'Mais de Um')
          TabOrder = 6
          Values.Strings = (
            '1'
            '2'
            '3')
        end
      end
      object dbchkbox_transporte_multimodal7: TDBCheckBox
        Left = 504
        Top = 16
        Width = 181
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedt_nm_embarcacao7: TDBEdit
        Left = 160
        Top = 170
        Width = 327
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NM_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 3
      end
      object dbg_transporte_lacustre: TDBGrid
        Left = 168
        Top = 16
        Width = 329
        Height = 77
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 287
            Visible = True
          end>
      end
      object dbedt_cd_embarcacao7: TDBEdit
        Left = 112
        Top = 170
        Width = 48
        Height = 21
        DataField = 'CD_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 7
        OnExit = btn_co_embarcacao2Click
      end
    end
    object tbsht_Transporte_aereo: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object lbl_transportador1: TLabel
        Left = 36
        Top = 143
        Width = 80
        Height = 13
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transportador1: TSpeedButton
        Left = 384
        Top = 139
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
        OnClick = btn_co_transportador1Click
      end
      object lbl_bandeira1: TLabel
        Left = 36
        Top = 170
        Width = 51
        Height = 13
        Caption = 'Bandeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_doc_chegada_carga1: TLabel
        Left = 523
        Top = 72
        Width = 137
        Height = 13
        Caption = 'Doc. Chegada da Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais4: TSpeedButton
        Left = 384
        Top = 166
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
        OnClick = btn_co_pais1Click
      end
      object gbox_doc_chegada_carga1: TGroupBox
        Left = 500
        Top = 68
        Width = 185
        Height = 133
        Caption = 'Doc. Chegada da Carga'
        TabOrder = 10
        object lbl_identificacao1: TLabel
          Left = 15
          Top = 82
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
      end
      object dbedt_cd_transportador1: TDBEdit
        Left = 128
        Top = 139
        Width = 48
        Height = 21
        DataField = 'CD_TRANSPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_cd_transportador2Exit
      end
      object dbedt_nm_transportador1: TDBEdit
        Left = 176
        Top = 139
        Width = 207
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 8
      end
      object grpbox_conhecimento_transporte1: TGroupBox
        Left = 20
        Top = 252
        Width = 701
        Height = 153
        Caption = '  Conhecimento de Transporte  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        TabStop = True
        object lbl_identif_master1: TLabel
          Left = 304
          Top = 17
          Width = 94
          Height = 13
          Caption = 'Ident. do Master'
        end
        object lbl_identif_conhecimento1: TLabel
          Left = 168
          Top = 17
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
        end
        object lbl_dt_embarque1: TLabel
          Left = 168
          Top = 101
          Width = 106
          Height = 13
          Caption = 'Data de Embarque'
        end
        object lbl_local_embarque1: TLabel
          Left = 168
          Top = 59
          Width = 110
          Height = 13
          Caption = 'Local de Embarque'
        end
        object btn_co_local_embarque1: TSpeedButton
          Left = 424
          Top = 72
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
          OnClick = btn_co_local_embarque1Click
        end
        object dbedt_nr_doc_carga1: TDBEdit
          Left = 168
          Top = 30
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
        end
        object dbedt_nr_doc_carga_master1: TDBEdit
          Left = 304
          Top = 30
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA_MAST'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
        object dbedt_dt_embarque1: TDBEdit
          Left = 168
          Top = 114
          Width = 113
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 4
          OnExit = dbedt_dt_embarque2Exit
        end
        object dbedt_cd_local_embarque1: TDBEdit
          Left = 168
          Top = 72
          Width = 48
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          MaxLength = 5
          TabOrder = 3
          OnExit = dbedt_cd_local_embarque2Exit
        end
        object dbedt_nm_local_embarque1: TDBEdit
          Left = 216
          Top = 72
          Width = 207
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_local_Embarque'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 5
        end
        object GroupBox16: TGroupBox
          Left = 18
          Top = 22
          Width = 125
          Height = 113
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rbtn_AWB: TRadioButton
            Left = 8
            Top = 24
            Width = 49
            Height = 17
            Caption = 'AWB'
            TabOrder = 0
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_AWBDblClick
          end
          object rbtn_House_AWB: TRadioButton
            Left = 8
            Top = 54
            Width = 89
            Height = 17
            Caption = 'House AWB'
            TabOrder = 1
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_House_AWBDblClick
          end
          object rbtn_DSIC: TRadioButton
            Left = 8
            Top = 86
            Width = 89
            Height = 17
            Caption = 'DSIC'
            TabOrder = 2
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_DSICDblClick
          end
        end
        object dbrdgrp_cd_util_dcto_carga_aereo: TDBRadioGroup
          Left = 571
          Top = 22
          Width = 113
          Height = 113
          Caption = 'Utiliza'#231#227'o'
          DataField = 'CD_UTIL_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          Items.Strings = (
            'Total'
            'Parcial'
            'Mais de Um')
          TabOrder = 6
          Values.Strings = (
            '1'
            '2'
            '3')
        end
      end
      object rbtn_termo_entrada1: TRadioButton
        Left = 515
        Top = 91
        Width = 125
        Height = 17
        Caption = 'Termo de Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = rbtn_manifesto_carga2Click
        OnDblClick = rbtn_termo_entrada1DblClick
      end
      object rbtn_dta1: TRadioButton
        Left = 515
        Top = 118
        Width = 49
        Height = 17
        Caption = 'DTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = rbtn_manifesto_carga2Click
        OnDblClick = rbtn_dta1DblClick
      end
      object dbedt_identificacao1: TDBEdit
        Left = 515
        Top = 164
        Width = 153
        Height = 21
        DataField = 'NR_MANIFESTO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 6
        OnEnter = dbedt_identificacao1Enter
        OnExit = dbedt_identificacao1Exit
      end
      object dbchkbox_transporte_multimodal1: TDBCheckBox
        Left = 480
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedt_cd_bandeira_transp_itl: TDBEdit
        Left = 128
        Top = 166
        Width = 48
        Height = 21
        DataField = 'CD_BANDEIRA_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 3
        OnEnter = dbedt_cd_bandeira_transp_itl2Enter
        OnExit = dbedt_cd_bandeira_transp_itl2Exit
      end
      object dbedt_nm_bandeira_transp_itl: TDBEdit
        Left = 176
        Top = 166
        Width = 207
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Bandeira_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 9
      end
      object dbg_transporte_aereo: TDBGrid
        Left = 184
        Top = 8
        Width = 289
        Height = 77
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 245
            Visible = True
          end>
      end
    end
    object tbsht_Transporte_Postal: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object bvl_postal5: TBevel
        Left = 145
        Top = 159
        Width = 447
        Height = 191
        Shape = bsFrame
      end
      object lbl_codigo_barra5: TLabel
        Left = 176
        Top = 194
        Width = 92
        Height = 13
        Caption = 'C'#243'digo de Barra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_postagem5: TLabel
        Left = 176
        Top = 226
        Width = 105
        Height = 13
        Caption = 'Data da Postagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_local_postagem: TLabel
        Left = 176
        Top = 258
        Width = 109
        Height = 13
        Caption = 'Local de Postagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_obs5: TLabel
        Left = 224
        Top = 290
        Width = 297
        Height = 31
        AutoSize = False
        Caption = 
          'Quando constar mais de um C'#243'digo de Barra, utilize o campo Infor' +
          'ma'#231#245'es Complementares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_local_postagem5: TSpeedButton
        Left = 540
        Top = 254
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
        OnClick = btn_co_local_embarque1Click
      end
      object dbedt_cd_barra5: TDBEdit
        Left = 288
        Top = 190
        Width = 89
        Height = 21
        DataField = 'NR_DCTO_CARGA'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 18
        TabOrder = 1
      end
      object dbedt_dt_postagem5: TDBEdit
        Left = 288
        Top = 222
        Width = 89
        Height = 21
        DataField = 'DT_EMBARQUE'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_dt_embarque2Exit
      end
      object dbg_transporte_postal: TDBGrid
        Left = 200
        Top = 24
        Width = 337
        Height = 97
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 290
            Visible = True
          end>
      end
      object dbedt_cd_local_postagem5: TDBEdit
        Left = 288
        Top = 254
        Width = 48
        Height = 21
        DataField = 'CD_LOCAL_EMBARQUE'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 3
        OnExit = dbedt_cd_local_embarque2Exit
      end
      object dbedt_nm_local_postagem5: TDBEdit
        Left = 336
        Top = 254
        Width = 203
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_local_Embarque'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 4
      end
    end
    object tbsht_Transporte_Ferroviario: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object btn_co_transportador4: TSpeedButton
        Left = 424
        Top = 141
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
        OnClick = btn_co_transportador1Click
      end
      object lbl_transportador4: TLabel
        Left = 35
        Top = 145
        Width = 80
        Height = 13
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_presenca_carga4: TLabel
        Left = 35
        Top = 186
        Width = 127
        Height = 13
        Caption = 'N'#186' Presen'#231'a de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbox_doc_chegada_carga4: TGroupBox
        Left = 512
        Top = 79
        Width = 185
        Height = 133
        Caption = 'Doc. Chegada da Carga'
        TabOrder = 5
        object lbl_identificacao4: TLabel
          Left = 16
          Top = 83
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
        object rbtn_manifesto_carga4: TRadioButton
          Left = 16
          Top = 25
          Width = 129
          Height = 17
          Caption = 'Manifesto de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_manifesto_carga4DblClick
        end
        object rbtn_dta4: TRadioButton
          Left = 16
          Top = 49
          Width = 49
          Height = 17
          Caption = 'DTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_dta4DblClick
        end
        object dbedt_identificacao4: TDBEdit
          Left = 16
          Top = 99
          Width = 153
          Height = 21
          DataField = 'NR_MANIFESTO'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
      end
      object dbedt_nm_transportador4: TDBEdit
        Left = 216
        Top = 141
        Width = 208
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 4
      end
      object dbedt_cd_transportador4: TDBEdit
        Left = 168
        Top = 141
        Width = 48
        Height = 21
        DataField = 'CD_TRANSPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_cd_transportador2Exit
      end
      object grpbox_conhecimento_transporte4: TGroupBox
        Left = 16
        Top = 252
        Width = 697
        Height = 149
        Caption = '  Conhecimento de Transporte  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object lbl_identif_master4: TLabel
          Left = 320
          Top = 17
          Width = 94
          Height = 13
          Caption = 'Ident. do Master'
        end
        object lbl_identif_conhecimento4: TLabel
          Left = 184
          Top = 17
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
        end
        object lbl_dt_embarque4: TLabel
          Left = 184
          Top = 101
          Width = 106
          Height = 13
          Caption = 'Data de Embarque'
        end
        object lbl_local_embarque4: TLabel
          Left = 184
          Top = 58
          Width = 110
          Height = 13
          Caption = 'Local de Embarque'
        end
        object btn_co_local_embarque4: TSpeedButton
          Left = 436
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
          OnClick = btn_co_local_embarque1Click
        end
        object dbedt_nr_doc_carga4: TDBEdit
          Left = 184
          Top = 30
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
        end
        object dbedt_nr_doc_carga_master4: TDBEdit
          Left = 320
          Top = 30
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA_MAST'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
        end
        object dbedt_dt_embarque4: TDBEdit
          Left = 184
          Top = 114
          Width = 113
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 4
          OnExit = dbedt_dt_embarque2Exit
        end
        object dbedt_cd_local_embarque4: TDBEdit
          Left = 184
          Top = 71
          Width = 48
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 3
          OnExit = dbedt_cd_local_embarque2Exit
        end
        object dbedt_nm_local_embarque4: TDBEdit
          Left = 232
          Top = 71
          Width = 203
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_local_Embarque'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 5
        end
        object GroupBox17: TGroupBox
          Left = 17
          Top = 19
          Width = 125
          Height = 113
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object rbtn_RWB: TRadioButton
            Left = 8
            Top = 24
            Width = 49
            Height = 17
            Caption = 'RWB'
            TabOrder = 0
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_RWBDblClick
          end
          object rbtn_House_RWB: TRadioButton
            Left = 8
            Top = 54
            Width = 89
            Height = 17
            Caption = 'House RWB'
            TabOrder = 1
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_House_RWBDblClick
          end
          object rbtn_TIF_DTA: TRadioButton
            Left = 8
            Top = 86
            Width = 89
            Height = 17
            Caption = 'TIF/DTA'
            TabOrder = 2
            OnClick = rbtn_BL1Click
            OnDblClick = rbtn_TIF_DTADblClick
          end
        end
        object dbrdgrp_cd_util_dcto_carga_ferr: TDBRadioGroup
          Left = 567
          Top = 19
          Width = 113
          Height = 113
          Caption = 'Utiliza'#231#227'o'
          DataField = 'CD_UTIL_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          Items.Strings = (
            'Total'
            'Parcial'
            'Mais de Um')
          TabOrder = 6
          Values.Strings = (
            '1'
            '2'
            '3')
        end
      end
      object dbchkbox_transporte_multimodal4: TDBCheckBox
        Left = 488
        Top = 16
        Width = 177
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbg_transporte_ferroviario: TDBGrid
        Left = 168
        Top = 8
        Width = 313
        Height = 97
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 267
            Visible = True
          end>
      end
      object dbedt_nr_presenca_carga4: TDBEdit
        Left = 168
        Top = 182
        Width = 262
        Height = 21
        Color = clMenu
        DataField = 'CD_PRESENCA_CARGA'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 6
      end
    end
    object tbsht_Transporte_Rodoviario: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object lbl_placa_veiculo3: TLabel
        Left = 52
        Top = 130
        Width = 99
        Height = 13
        Caption = 'Placa do Ve'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_transportador3: TLabel
        Left = 52
        Top = 158
        Width = 80
        Height = 13
        Caption = 'Transportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_transportador3: TSpeedButton
        Left = 436
        Top = 154
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
        OnClick = btn_co_transportador1Click
      end
      object lbl_nr_presenca_carga3: TLabel
        Left = 52
        Top = 186
        Width = 127
        Height = 13
        Caption = 'N'#186' Presen'#231'a de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object gbox_doc_chegada_carga3: TGroupBox
        Left = 516
        Top = 79
        Width = 185
        Height = 133
        Caption = 'Doc. Chegada da Carga'
        TabOrder = 6
        object lbl_identificacao3: TLabel
          Left = 16
          Top = 88
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
        object rbtn_manifesto_carga3: TRadioButton
          Left = 16
          Top = 21
          Width = 129
          Height = 17
          Caption = 'Manifesto de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_manifesto_carga3DblClick
        end
        object rbtn_dta3: TRadioButton
          Left = 16
          Top = 43
          Width = 49
          Height = 17
          Caption = 'DTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_dta3DblClick
        end
        object rbtn_MIC_DTA3: TRadioButton
          Left = 16
          Top = 64
          Width = 73
          Height = 17
          Caption = 'MIC/DTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = rbtn_manifesto_carga2Click
          OnDblClick = rbtn_MIC_DTA3DblClick
        end
        object dbedt_identificacao3: TDBEdit
          Left = 16
          Top = 104
          Width = 153
          Height = 21
          DataField = 'NR_MANIFESTO'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 3
        end
      end
      object dbedt_nr_placa_veiculo3: TDBEdit
        Left = 183
        Top = 126
        Width = 150
        Height = 21
        DataField = 'NR_VEICULO_TRANSP'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
      end
      object grpbox_conhecimento_transporte3: TGroupBox
        Left = 20
        Top = 248
        Width = 693
        Height = 149
        Caption = '  Conhecimento de Transporte  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object lbl_identif_CRT3: TLabel
          Left = 14
          Top = 32
          Width = 122
          Height = 13
          Caption = 'Identifica'#231#227'o do CRT'
        end
        object lbl_dt_embarque3: TLabel
          Left = 14
          Top = 108
          Width = 106
          Height = 13
          Caption = 'Data de Embarque'
        end
        object lbl_local_embarque3: TLabel
          Left = 14
          Top = 72
          Width = 110
          Height = 13
          Caption = 'Local de Embarque'
        end
        object btn_co_local_embarque3: TSpeedButton
          Left = 394
          Top = 68
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
          OnClick = btn_co_local_embarque1Click
        end
        object dbedt_nr_doc_carga3: TDBEdit
          Left = 142
          Top = 32
          Width = 129
          Height = 21
          DataField = 'NR_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 0
        end
        object dbedt_dt_embarque3: TDBEdit
          Left = 142
          Top = 106
          Width = 113
          Height = 21
          DataField = 'DT_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 2
          OnExit = dbedt_dt_embarque2Exit
        end
        object dbedt_cd_local_embarque3: TDBEdit
          Left = 142
          Top = 68
          Width = 45
          Height = 21
          DataField = 'CD_LOCAL_EMBARQUE'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
          OnExit = dbedt_cd_local_embarque2Exit
        end
        object dbedt_nm_local_embarque3: TDBEdit
          Left = 187
          Top = 68
          Width = 206
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_local_Embarque'
          DataSource = datm_DI_Capa.ds_di
          ReadOnly = True
          TabOrder = 3
        end
        object dbrdgrp_cd_util_dcto_carga_rod: TDBRadioGroup
          Left = 562
          Top = 19
          Width = 113
          Height = 113
          Caption = 'Utiliza'#231#227'o'
          DataField = 'CD_UTIL_DCTO_CARGA'
          DataSource = datm_DI_Capa.ds_di
          Items.Strings = (
            'Total'
            'Parcial'
            'Mais de Um')
          TabOrder = 4
          Values.Strings = (
            '1'
            '2'
            '3')
        end
      end
      object dbchkbox_transporte_multimodal3: TDBCheckBox
        Left = 488
        Top = 16
        Width = 193
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dbedt_cd_transportador3: TDBEdit
        Left = 183
        Top = 154
        Width = 45
        Height = 21
        DataField = 'CD_TRANSPORTADOR'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 3
        OnExit = dbedt_cd_transportador3Exit
      end
      object dbedt_nm_transportador3: TDBEdit
        Left = 228
        Top = 154
        Width = 207
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_transp_itl'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 5
      end
      object dbg_transporte_rodoviario: TDBGrid
        Left = 160
        Top = 8
        Width = 321
        Height = 97
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 202
            Visible = True
          end>
      end
      object dbedt_nr_presenca_carga3: TDBEdit
        Left = 183
        Top = 182
        Width = 262
        Height = 21
        Color = clMenu
        DataField = 'CD_PRESENCA_CARGA'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 7
      end
    end
    object tbsht_Transporte_Tubo_Coduto: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object bvl_tubo_conduto9: TBevel
        Left = 120
        Top = 152
        Width = 505
        Height = 201
        Shape = bsFrame
      end
      object lbl_local_embarque9: TLabel
        Left = 184
        Top = 202
        Width = 110
        Height = 13
        Caption = 'Local de Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_embarque9: TLabel
        Left = 184
        Top = 234
        Width = 106
        Height = 13
        Caption = 'Data de Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_obs9: TLabel
        Left = 216
        Top = 286
        Width = 329
        Height = 31
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'Para qualquer informa'#231#227'o adicional sobre esta Via de Transporte,' +
          ' utilize o campo Informa'#231#245'es Complementares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_local_embarque9: TSpeedButton
        Left = 552
        Top = 198
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
        OnClick = btn_co_local_embarque1Click
      end
      object dbedt_dt_embarque9: TDBEdit
        Left = 300
        Top = 230
        Width = 89
        Height = 21
        DataField = 'DT_EMBARQUE'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_dt_embarque2Exit
      end
      object dbg_transporte_tubo_conduto: TDBGrid
        Left = 176
        Top = 16
        Width = 385
        Height = 105
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 329
            Visible = True
          end>
      end
      object dbedt_cd_local_embarque9: TDBEdit
        Left = 300
        Top = 198
        Width = 45
        Height = 21
        DataField = 'CD_LOCAL_EMBARQUE'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        OnExit = dbedt_cd_local_embarque2Exit
      end
      object dbedt_nm_local_embarque9: TDBEdit
        Left = 345
        Top = 198
        Width = 206
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_local_Embarque'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 3
      end
    end
    object tbsht_Transporte_Meios_Proprios: TTabSheet
      Caption = '&Transporte'
      TabVisible = False
      object bvl_meios_proprios8: TBevel
        Left = 136
        Top = 152
        Width = 473
        Height = 193
        Shape = bsFrame
      end
      object lbl_local_embarque8: TLabel
        Left = 176
        Top = 194
        Width = 110
        Height = 13
        Caption = 'Local de Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_embarque8: TLabel
        Left = 176
        Top = 226
        Width = 106
        Height = 13
        Caption = 'Data de Embarque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_obs8: TLabel
        Left = 208
        Top = 282
        Width = 329
        Height = 31
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'Para qualquer informa'#231#227'o adicional sobre esta Via de Transporte,' +
          ' utilize o campo Informa'#231#245'es Complementares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_local_embarque8: TSpeedButton
        Left = 544
        Top = 190
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
        OnClick = btn_co_local_embarque1Click
      end
      object dbg_transporte_meios_proprios: TDBGrid
        Left = 168
        Top = 16
        Width = 409
        Height = 97
        Color = clMenu
        DataSource = datm_DI_Capa.ds_via_transporte
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_VIA_TRANSPORTE'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 361
            Visible = True
          end>
      end
      object dbedt_cd_local_embarque8: TDBEdit
        Left = 292
        Top = 190
        Width = 48
        Height = 21
        DataField = 'CD_LOCAL_EMBARQUE'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 1
        OnExit = dbedt_cd_local_embarque2Exit
      end
      object dbedt_nm_local_embarque8: TDBEdit
        Left = 340
        Top = 190
        Width = 204
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_local_Embarque'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_dt_embarque8: TDBEdit
        Left = 292
        Top = 222
        Width = 89
        Height = 21
        DataField = 'DT_EMBARQUE'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnExit = dbedt_dt_embarque2Exit
      end
    end
    object tbsht_carga_TD01: TTabSheet
      Caption = 'Carga'
      object pgctrl_carga1: TPageControl
        Left = 0
        Top = 0
        Width = 796
        Height = 422
        ActivePage = tbsht_carga_TD01_Page13
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_carga1Change
        OnChanging = pgctrl_carga1Changing
        object tbsht_carga_TD01_Page11: TTabSheet
          Caption = 'Page &1'
          object lbl_pais_procedencia1: TLabel
            Left = 47
            Top = 21
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
          object btn_co_pais_procedencia1: TSpeedButton
            Left = 419
            Top = 17
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
            OnClick = btn_co_pais_procedencia1Click
          end
          object lbl_urf_entrada_pais1: TLabel
            Left = 45
            Top = 53
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
          object btn_co_urf_entrada1: TSpeedButton
            Left = 539
            Top = 49
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
            OnClick = btn_co_urf_entrada1Click
          end
          object lbl_dt_chegada1: TLabel
            Left = 67
            Top = 142
            Width = 100
            Height = 13
            Caption = 'Data da Chegada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_agente_transportador1: TLabel
            Left = 25
            Top = 174
            Width = 142
            Height = 13
            Caption = 'Agente do Transportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_peso_bruto1: TLabel
            Left = 78
            Top = 81
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
          object lbl_peso_liquido1: TLabel
            Left = 65
            Top = 113
            Width = 102
            Height = 13
            Caption = 'Peso L'#237'quido (kg)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 382
            Top = 76
            Width = 322
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
          object lbl_recinto_alfandegado1: TLabel
            Left = 23
            Top = 202
            Width = 99
            Height = 13
            Caption = 'Rec.Alfandegado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_recinto_alfandegado1: TSpeedButton
            Left = 587
            Top = 198
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
            OnClick = btn_co_recinto_alfandegado1Click
          end
          object lbl_setor1: TLabel
            Left = 83
            Top = 226
            Width = 31
            Height = 13
            Caption = 'Setor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_setor1: TSpeedButton
            Left = 393
            Top = 222
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
            OnClick = btn_co_setor1Click
          end
          object btn_ag_transp: TSpeedButton
            Left = 587
            Top = 170
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
            OnClick = btn_ag_transpClick
          end
          object dbedt_nm_pais_procedencia1: TDBEdit
            Left = 207
            Top = 17
            Width = 211
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Pais_Procedencia'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_urf_entrada_pais1: TDBEdit
            Left = 239
            Top = 49
            Width = 299
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_urf_entrada'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 12
          end
          object dbedt_dt_chegada1: TDBEdit
            Left = 175
            Top = 138
            Width = 77
            Height = 21
            DataField = 'DT_CHEGADA_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 5
            OnExit = dbedt_dt_chegada1Exit
          end
          object dbedt_peso_bruto1: TDBEdit
            Left = 175
            Top = 77
            Width = 121
            Height = 21
            DataField = 'PB_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 3
          end
          object dbedt_peso_liquido1: TDBEdit
            Left = 175
            Top = 109
            Width = 121
            Height = 21
            DataField = 'PL_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 4
          end
          object grpbox_op_fundap1: TGroupBox
            Left = 405
            Top = 250
            Width = 301
            Height = 143
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 14
            object grpbox_op_cambial1: TGroupBox
              Left = 8
              Top = 12
              Width = 281
              Height = 117
              Caption = 'Adquirente da Mercadoria'
              TabOrder = 0
              object lbl_cnpj_op_cambial1: TLabel
                Left = 8
                Top = 88
                Width = 97
                Height = 13
                Caption = 'CNPJ Adquirente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_cnpj_consignatario1: TDBEdit
                Left = 112
                Top = 84
                Width = 121
                Height = 21
                DataField = 'NR_CONSIGNATARIO'
                DataSource = datm_DI_Capa.ds_di
                TabOrder = 2
              end
              object rbtn_Contratante_prop_impo1: TRadioButton
                Left = 8
                Top = 16
                Width = 133
                Height = 17
                Caption = 'Importa'#231#227'o Pr'#243'pria'
                TabOrder = 0
                OnClick = rbtn_Contratante_prop_impo1Click
              end
              object rbtn_contratante_outro1: TRadioButton
                Left = 8
                Top = 37
                Width = 198
                Height = 17
                Caption = 'Importa'#231#227'o por conta e ordem'
                TabOrder = 1
                OnClick = rbtn_Contratante_prop_impo1Click
              end
              object rbtn_contratante_por_encomenda1: TRadioButton
                Left = 8
                Top = 59
                Width = 198
                Height = 17
                Caption = 'Importa'#231#227'o por encomenda'
                TabOrder = 3
                OnClick = rbtn_Contratante_prop_impo1Click
              end
            end
          end
          object dbchkbox_op_fundap1: TDBCheckBox
            Left = 427
            Top = 224
            Width = 129
            Height = 17
            Caption = 'Operacao FUNDAP'
            DataField = 'IN_OPERACAO_FUNDAP'
            DataSource = datm_DI_Capa.ds_di
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_op_fundap1Click
          end
          object dbg_volumes: TDBGrid
            Left = 382
            Top = 89
            Width = 323
            Height = 75
            Color = clMenu
            DataSource = datm_DI_Capa.ds_di_volumes
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            TabOrder = 7
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
                Width = 195
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_VOLUME_CARGA'
                Title.Alignment = taCenter
                Width = 95
                Visible = True
              end>
          end
          object dbg_armazem1: TDBGrid
            Left = 24
            Top = 255
            Width = 221
            Height = 120
            Color = clMenu
            DataSource = datm_DI_Capa.ds_di_armazem
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
                FieldName = 'NM_ARMAZEM_CARGA'
                Title.Alignment = taCenter
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 190
                Visible = True
              end>
          end
          object dbedt_nm_recinto_alfandegado1: TDBEdit
            Left = 191
            Top = 198
            Width = 395
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Recinto_alf'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 13
          end
          object dbedt_nm_agente_transp: TDBEdit
            Left = 318
            Top = 170
            Width = 268
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_agente_transp'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 15
          end
          object dbedt_nm_setor_: TDBEdit
            Left = 159
            Top = 222
            Width = 233
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Setor'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 16
          end
          object dbedt_cd_pais_procedencia1: TDBEdit
            Left = 175
            Top = 17
            Width = 33
            Height = 21
            DataField = 'CD_PAIS_PROC_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 1
            OnExit = dbedt_cd_pais_procedencia12Exit
          end
          object dbedt_cd_urf_entrada_pais1: TDBEdit
            Left = 175
            Top = 49
            Width = 65
            Height = 21
            DataField = 'CD_URF_ENTR_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 2
            OnExit = dbedt_cd_urf_entrada_pais1Exit
          end
          object dbedt_agente_transportador1: TDBEdit
            Left = 175
            Top = 170
            Width = 142
            Height = 21
            DataField = 'NR_AGENTE_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 6
            OnEnter = dbedt_agente_transportador1Enter
            OnExit = dbedt_agente_transportador1Exit
          end
          object dbedt_cd_recinto_alfandegado1: TDBEdit
            Left = 127
            Top = 198
            Width = 65
            Height = 21
            Color = clMenu
            DataField = 'CD_RECINTO_ALFAND'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 8
            OnExit = dbedt_cd_recinto_alfandegado1Exit
          end
          object dbedt_cd_setor1: TDBEdit
            Left = 127
            Top = 222
            Width = 33
            Height = 21
            Color = clMenu
            DataField = 'CD_SETOR_ARMAZENAM'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 9
            OnExit = dbedt_cd_setor1Exit
          end
        end
        object tbsht_carga_TD01_Page12: TTabSheet
          Caption = 'Page &1'
          object lbl_pais_procedencia2: TLabel
            Left = 8
            Top = 10
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
          object btn_co_pais_procedencia2: TSpeedButton
            Left = 212
            Top = 24
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
            OnClick = btn_co_pais_procedencia1Click
          end
          object lbl_peso_bruto2: TLabel
            Left = 336
            Top = 10
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
          object lbl_peso_liquido2: TLabel
            Left = 336
            Top = 42
            Width = 102
            Height = 13
            Caption = 'Peso L'#237'quido (kg)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_urf_entrada_pais2: TLabel
            Left = 8
            Top = 58
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
          object btn_co_urf_entrada2: TSpeedButton
            Left = 196
            Top = 54
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
            OnClick = btn_co_urf_entrada1Click
          end
          object Label17: TLabel
            Left = 378
            Top = 72
            Width = 323
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
          object Label15: TLabel
            Left = 16
            Top = 193
            Width = 120
            Height = 13
            Caption = 'Recinto Alfandegado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_recinto_alfandegado2: TSpeedButton
            Left = 654
            Top = 189
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
            OnClick = btn_co_recinto_alfandegado1Click
          end
          object Label16: TLabel
            Left = 17
            Top = 226
            Width = 31
            Height = 13
            Caption = 'Setor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_setor2: TSpeedButton
            Left = 325
            Top = 222
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
            OnClick = btn_co_setor1Click
          end
          object Label23: TLabel
            Left = 8
            Top = 121
            Width = 100
            Height = 13
            Caption = 'Data da Chegada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_nm_pais_procedencia2: TDBEdit
            Left = 40
            Top = 24
            Width = 169
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Pais_Procedencia'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_peso_bruto2: TDBEdit
            Left = 456
            Top = 8
            Width = 121
            Height = 21
            DataField = 'PB_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 2
          end
          object dbedt_peso_liquido2: TDBEdit
            Left = 456
            Top = 40
            Width = 121
            Height = 21
            DataField = 'PL_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 3
          end
          object dbedt_cd_urf_entrada_pais2: TDBEdit
            Left = 136
            Top = 54
            Width = 59
            Height = 21
            DataField = 'CD_URF_ENTR_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 4
            OnExit = dbedt_cd_urf_entrada_pais1Exit
          end
          object dbedt_nm_urf_entrada_pais2: TDBEdit
            Left = 8
            Top = 80
            Width = 263
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_urf_entrada'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 11
          end
          object DBGrid6: TDBGrid
            Left = 378
            Top = 88
            Width = 324
            Height = 84
            Color = clMenu
            DataSource = datm_DI_Capa.ds_di_volumes
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            TabOrder = 6
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
                Width = 195
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_VOLUME_CARGA'
                Title.Alignment = taCenter
                Width = 95
                Visible = True
              end>
          end
          object dbedt_cd_recinto_alfandegado2: TDBEdit
            Left = 140
            Top = 189
            Width = 63
            Height = 21
            Color = clMenu
            DataField = 'CD_RECINTO_ALFAND'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 6
            ReadOnly = True
            TabOrder = 5
            OnExit = dbedt_cd_recinto_alfandegado1Exit
          end
          object dbedt_nm_recinto_alfandegado2: TDBEdit
            Left = 204
            Top = 189
            Width = 449
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Recinto_alf'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 12
          end
          object DBGrid5: TDBGrid
            Left = 16
            Top = 269
            Width = 170
            Height = 111
            Color = clMenu
            DataSource = datm_DI_Capa.ds_di_armazem
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 7
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'NM_ARMAZEM_CARGA'
                Title.Alignment = taCenter
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 143
                Visible = True
              end>
          end
          object GroupBox1: TGroupBox
            Left = 404
            Top = 257
            Width = 301
            Height = 133
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            object grpbox_op_cambial2: TGroupBox
              Left = 11
              Top = 14
              Width = 278
              Height = 107
              Caption = 'Adquirente da Mercadoria'
              TabOrder = 0
              object lbl_cnpj_op_cambial2: TLabel
                Left = 8
                Top = 83
                Width = 97
                Height = 13
                Caption = 'CNPJ Adquirente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_cnpj_consignatario2: TDBEdit
                Left = 114
                Top = 79
                Width = 121
                Height = 21
                DataField = 'NR_CONSIGNATARIO'
                DataSource = datm_DI_Capa.ds_di
                TabOrder = 2
              end
              object rbtn_Contratante_prop_impo2: TRadioButton
                Left = 8
                Top = 16
                Width = 133
                Height = 17
                Caption = 'Importa'#231#227'o Pr'#243'pria'
                TabOrder = 0
                OnClick = rbtn_Contratante_prop_impo1Click
              end
              object rbtn_contratante_outro2: TRadioButton
                Left = 8
                Top = 36
                Width = 201
                Height = 17
                Caption = 'Importa'#231#227'o por conta e ordem'
                TabOrder = 1
                OnClick = rbtn_Contratante_prop_impo1Click
              end
              object rbtn_contratante_por_encomenda2: TRadioButton
                Left = 8
                Top = 57
                Width = 201
                Height = 17
                Caption = 'Importa'#231#227'o por encomenda'
                TabOrder = 3
                OnClick = rbtn_Contratante_prop_impo1Click
              end
            end
          end
          object dbchkbox_op_fundap2: TDBCheckBox
            Left = 556
            Top = 224
            Width = 129
            Height = 17
            Caption = 'Operacao FUNDAP'
            DataField = 'IN_OPERACAO_FUNDAP'
            DataSource = datm_DI_Capa.ds_di
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbedt_nm_setor2: TDBEdit
            Left = 88
            Top = 222
            Width = 236
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Setor'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 13
          end
          object dbedt_cd_pais_procedencia2: TDBEdit
            Left = 8
            Top = 24
            Width = 33
            Height = 21
            DataField = 'CD_PAIS_PROC_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 5
            TabOrder = 0
            OnExit = dbedt_cd_pais_procedencia12Exit
          end
          object dbedt_cd_setor2: TDBEdit
            Left = 57
            Top = 222
            Width = 32
            Height = 21
            Color = clMenu
            DataField = 'CD_SETOR_ARMAZENAM'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 8
            OnExit = dbedt_cd_setor1Exit
          end
          object dbedt_dt_chegada_pg12: TDBEdit
            Left = 8
            Top = 135
            Width = 85
            Height = 21
            Color = clWhite
            DataField = 'DT_CHEGADA_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 14
          end
        end
        object tbsht_carga_TD01_Page13: TTabSheet
          Caption = 'Page &1'
          object Label30: TLabel
            Left = 24
            Top = 10
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
          object btn_co_pais_procedencia3: TSpeedButton
            Left = 228
            Top = 24
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
            OnClick = btn_co_pais1Click
          end
          object Label34: TLabel
            Left = 336
            Top = 18
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
          object Label35: TLabel
            Left = 336
            Top = 42
            Width = 102
            Height = 13
            Caption = 'Peso L'#237'quido (kg)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label31: TLabel
            Left = 24
            Top = 65
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
          object SpeedButton18: TSpeedButton
            Left = 216
            Top = 61
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
            OnClick = btn_co_urf_entrada1Click
          end
          object Label32: TLabel
            Left = 24
            Top = 121
            Width = 100
            Height = 13
            Caption = 'Data da Chegada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label33: TLabel
            Left = 25
            Top = 164
            Width = 142
            Height = 13
            Caption = 'Agente do Transportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 384
            Top = 74
            Width = 324
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
          object Label36: TLabel
            Left = 24
            Top = 202
            Width = 120
            Height = 13
            Caption = 'Recinto Alfandegado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_recinto_alfandegado3: TSpeedButton
            Left = 468
            Top = 217
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
            OnClick = btn_co_recinto_alfandegado1Click
          end
          object Label37: TLabel
            Left = 25
            Top = 250
            Width = 31
            Height = 13
            Caption = 'Setor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_setor3: TSpeedButton
            Left = 333
            Top = 246
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
            OnClick = btn_co_setor1Click
          end
          object btn_agente_transp: TSpeedButton
            Left = 499
            Top = 178
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
            OnClick = btn_ag_transpClick
          end
          object dbedt_nm_pais_procedencia3: TDBEdit
            Left = 56
            Top = 24
            Width = 171
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Pais_Procedencia'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 1
          end
          object DBEdit36: TDBEdit
            Left = 456
            Top = 14
            Width = 121
            Height = 21
            DataField = 'PB_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 2
          end
          object DBEdit37: TDBEdit
            Left = 456
            Top = 38
            Width = 121
            Height = 21
            DataField = 'PL_CARGA'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 3
          end
          object dbedt_cd_urf_entrada_pais3: TDBEdit
            Left = 152
            Top = 61
            Width = 63
            Height = 21
            DataField = 'CD_URF_ENTR_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 4
            OnExit = dbedt_cd_urf_entrada_pais1Exit
          end
          object DBEdit33: TDBEdit
            Left = 24
            Top = 85
            Width = 217
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_urf_entrada'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit34: TDBEdit
            Left = 24
            Top = 135
            Width = 85
            Height = 21
            Color = clWhite
            DataField = 'DT_CHEGADA_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 6
          end
          object DBGrid8: TDBGrid
            Left = 384
            Top = 90
            Width = 324
            Height = 81
            Color = clMenu
            DataSource = datm_DI_Capa.ds_di_volumes
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            TabOrder = 8
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
                Width = 195
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_VOLUME_CARGA'
                Title.Alignment = taCenter
                Width = 95
                Visible = True
              end>
          end
          object dbedt_nm_recinto_alfandegado3: TDBEdit
            Left = 84
            Top = 217
            Width = 383
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Recinto_alf'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 10
          end
          object DBGrid7: TDBGrid
            Left = 15
            Top = 271
            Width = 162
            Height = 114
            Color = clMenu
            DataSource = datm_DI_Capa.ds_di_armazem
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 11
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'NM_ARMAZEM_CARGA'
                Title.Alignment = taCenter
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 134
                Visible = True
              end>
          end
          object dbedt_nm_agente: TDBEdit
            Left = 165
            Top = 178
            Width = 333
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_agente_transp'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 13
          end
          object DBEdit1: TDBEdit
            Left = 96
            Top = 246
            Width = 236
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'Look_Setor'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 14
          end
          object dbedt_cd_pais_procedencia3: TDBEdit
            Left = 24
            Top = 24
            Width = 33
            Height = 21
            DataField = 'CD_PAIS_PROC_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 0
            OnExit = dbedt_cd_pais_procedencia12Exit
          end
          object dbedt_agente_transp: TDBEdit
            Left = 25
            Top = 178
            Width = 141
            Height = 21
            DataField = 'NR_AGENTE_CARGA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 7
            OnEnter = dbedt_agente_transportador1Enter
            OnExit = dbedt_agente_transpExit
          end
          object dbedt_cd_recinto_alfandegado3: TDBEdit
            Left = 24
            Top = 217
            Width = 61
            Height = 21
            Color = clMenu
            DataField = 'CD_RECINTO_ALFAND'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 9
            OnExit = dbedt_cd_recinto_alfandegado1Exit
          end
          object dbedt_cd_setor3: TDBEdit
            Left = 65
            Top = 246
            Width = 32
            Height = 21
            Color = clMenu
            DataField = 'CD_SETOR_ARMAZENAM'
            DataSource = datm_DI_Capa.ds_di
            ReadOnly = True
            TabOrder = 12
            OnExit = dbedt_cd_setor1Exit
          end
          object GroupBox2: TGroupBox
            Left = 404
            Top = 258
            Width = 301
            Height = 128
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
            object grpbox_op_cambial3: TGroupBox
              Left = 17
              Top = 13
              Width = 266
              Height = 107
              Caption = 'Adquirente da Mercadoria'
              TabOrder = 0
              object lbl_cnpj_op_cambial3: TLabel
                Left = 8
                Top = 83
                Width = 97
                Height = 13
                Caption = 'CNPJ Adquirente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_cnpj_consignatario3: TDBEdit
                Left = 114
                Top = 79
                Width = 121
                Height = 21
                DataField = 'NR_CONSIGNATARIO'
                DataSource = datm_DI_Capa.ds_di
                TabOrder = 2
              end
              object rbtn_Contratante_prop_impo3: TRadioButton
                Left = 8
                Top = 16
                Width = 133
                Height = 17
                Caption = 'Importa'#231#227'o Pr'#243'pria'
                TabOrder = 0
                OnClick = rbtn_Contratante_prop_impo1Click
              end
              object rbtn_contratante_outro3: TRadioButton
                Left = 8
                Top = 36
                Width = 201
                Height = 17
                Caption = 'Importa'#231#227'o por conta e ordem'
                TabOrder = 1
                OnClick = rbtn_Contratante_prop_impo1Click
              end
              object rbtn_contratante_por_encomenda3: TRadioButton
                Left = 8
                Top = 56
                Width = 201
                Height = 17
                Caption = 'Importa'#231#227'o por encomenda'
                TabOrder = 3
                OnClick = rbtn_Contratante_prop_impo1Click
              end
            end
          end
        end
        object tbsht_carga_Page2: TTabSheet
          Caption = 'Page &2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          OnExit = tbsht_carga_Page2Exit
          object Label70: TLabel
            Left = 14
            Top = 272
            Width = 149
            Height = 13
            Caption = 'C'#225'lculo do Seguro:   Base'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label82: TLabel
            Left = 630
            Top = 272
            Width = 10
            Height = 13
            Caption = '%'
          end
          object grpbox_vl_tot_mle1: TGroupBox
            Left = 16
            Top = 12
            Width = 697
            Height = 100
            Caption = 'Valor Total das Mercadorias no Local de Embarque'
            TabOrder = 0
            object lbl_moeda_mle1: TLabel
              Left = 8
              Top = 30
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
            object btn_co_moeda_mle1: TSpeedButton
              Left = 88
              Top = 26
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
              OnClick = btn_co_moeda_mle1Click
            end
            object lbl_vl_real_mle1: TLabel
              Left = 401
              Top = 31
              Width = 84
              Height = 13
              Caption = 'VMLE em Real'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_moeda_mle1: TLabel
              Left = 133
              Top = 31
              Width = 94
              Height = 13
              Caption = 'VMLE na Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_moeda_despesa: TLabel
              Left = 117
              Top = 60
              Width = 110
              Height = 13
              Caption = 'Despesa na Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object lbl_vl_real_despesa: TLabel
              Left = 385
              Top = 60
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
            object dbedt_cd_moeda_mle1: TDBEdit
              Left = 56
              Top = 26
              Width = 32
              Height = 21
              DataField = 'CD_MOEDA_MLE'
              DataSource = datm_DI_Capa.ds_di
              TabOrder = 0
              OnExit = dbedt_cd_moeda_mle1Exit
            end
            object dbedt_vl_real_mle1: TDBEdit
              Left = 488
              Top = 27
              Width = 121
              Height = 21
              DataField = 'Calc_VL_TOT_MLE_MN'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              TabOrder = 2
              OnExit = dbedt_pc_seguroExit
            end
            object dbedt_vl_moeda_mle1: TDBEdit
              Left = 231
              Top = 27
              Width = 122
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_TOT_MLE_MNEG'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              ReadOnly = True
              TabOrder = 1
              OnExit = dbedt_pc_seguroExit
            end
            object dbedt_vl_moeda_despesa: TDBEdit
              Left = 231
              Top = 56
              Width = 121
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_TOT_DESPS_MNEG'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              ReadOnly = True
              TabOrder = 3
              Visible = False
              OnExit = dbedt_pc_seguroExit
            end
            object dbedt_vl_real_despesa: TDBEdit
              Left = 488
              Top = 56
              Width = 121
              Height = 21
              DataField = 'Calc_VL_TOT_DESPESA_MN'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              TabOrder = 4
              OnExit = dbedt_pc_seguroExit
            end
          end
          object grpbox_frete_tot1: TGroupBox
            Left = 16
            Top = 152
            Width = 697
            Height = 93
            Caption = '  Frete Total  '
            TabOrder = 2
            object lbl_moeda_frete1: TLabel
              Left = 8
              Top = 18
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
            object btn_co_moeda_frete1: TSpeedButton
              Left = 88
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
              OnClick = btn_co_moeda_frete1Click
            end
            object lbl_frete_collect: TLabel
              Left = 175
              Top = 43
              Width = 52
              Height = 13
              Caption = '"Collect"'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_frete_prepaid: TLabel
              Left = 171
              Top = 18
              Width = 56
              Height = 13
              Caption = '"Prepaid"'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_frete_terr_nacional: TLabel
              Left = 104
              Top = 68
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
            object lbl_vl_real_frete_collect1: TLabel
              Left = 400
              Top = 43
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
            object dbedt_cd_moeda_frete1: TDBEdit
              Left = 56
              Top = 14
              Width = 32
              Height = 21
              DataField = 'CD_MOEDA_FRETE'
              DataSource = datm_DI_Capa.ds_di
              TabOrder = 0
              OnExit = dbedt_cd_moeda_frete1Exit
            end
            object dbedt_vl_frete_collect1: TDBEdit
              Left = 232
              Top = 39
              Width = 121
              Height = 21
              DataField = 'VL_TOT_FRT_COLLECT'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              TabOrder = 2
              OnExit = dbedt_pc_seguroExit
            end
            object dbedt_vl_frete_prepaid1: TDBEdit
              Left = 232
              Top = 14
              Width = 121
              Height = 21
              DataField = 'VL_TOT_FRT_PREPAID'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              TabOrder = 1
              OnExit = dbedt_pc_seguroExit
            end
            object dbedt_vl_frete_terr_nacional1: TDBEdit
              Left = 232
              Top = 64
              Width = 121
              Height = 21
              DataField = 'VL_FRETE_TNAC_MNEG'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              TabOrder = 3
              OnExit = dbedt_pc_seguroExit
            end
            object dbedt_vl_real_frete_collect1: TDBEdit
              Left = 488
              Top = 39
              Width = 121
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Calc_VL_TOT_FRETE_MN'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              ReadOnly = True
              TabOrder = 4
              OnExit = dbedt_pc_seguroExit
            end
            object dbcheck_embut_frete: TDBCheckBox
              Left = 8
              Top = 43
              Width = 141
              Height = 17
              Caption = 'Embutido nos itens'
              DataField = 'IN_EMBUT_FRT_ITENS'
              DataSource = datm_DI_Capa.ds_di
              TabOrder = 5
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              OnExit = dbedt_pc_seguroExit
            end
          end
          object grpbox_seguro_tot1: TGroupBox
            Left = 16
            Top = 308
            Width = 696
            Height = 76
            Caption = '  Seguro Total '
            TabOrder = 4
            object lbl_moeda_seguro1: TLabel
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
            object btn_co_moeda_seguro1: TSpeedButton
              Left = 88
              Top = 22
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
              OnClick = btn_co_moeda_seguro1Click
            end
            object lbl_vl_moeda_seguro1: TLabel
              Left = 136
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
            object lbl_vl_real_seguro1: TLabel
              Left = 400
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
            object dbedt_cd_moeda_seguro1: TDBEdit
              Left = 56
              Top = 22
              Width = 32
              Height = 21
              DataField = 'CD_MOEDA_SEGURO'
              DataSource = datm_DI_Capa.ds_di
              TabOrder = 0
              OnExit = dbedt_cd_moeda_seguro1Exit
            end
            object dbedt_vl_moeda_seguro1: TDBEdit
              Left = 232
              Top = 22
              Width = 121
              Height = 21
              DataField = 'VL_TOT_SEGURO_MNEG'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              TabOrder = 1
            end
            object dbedt_vl_real_seguro1: TDBEdit
              Left = 488
              Top = 22
              Width = 121
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'Calc_VL_TOT_SEGURO_MN'
              DataSource = datm_DI_Capa.ds_di
              MaxLength = 20
              ReadOnly = True
              TabOrder = 2
            end
            object dbcheck_embut_seg: TDBCheckBox
              Left = 8
              Top = 52
              Width = 137
              Height = 17
              Caption = 'Embutido nos itens'
              DataField = 'IN_EMBUT_SEG_ITENS'
              DataSource = datm_DI_Capa.ds_di
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
          object dbchkbox_mesma_moeda1: TDBCheckBox
            Left = 16
            Top = 125
            Width = 313
            Height = 17
            Caption = 'Mesma moeda na condi'#231#227'o de venda nas Adi'#231#245'es'
            DataField = 'IN_MOEDA_UNICA'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchkbox_mesma_moeda1Click
          end
          object dbedt_pc_seguro: TDBEdit
            Left = 551
            Top = 268
            Width = 73
            Height = 21
            DataField = 'PC_SEGURO_MLE'
            DataSource = datm_DI_Capa.ds_di
            MaxLength = 20
            TabOrder = 3
            OnExit = dbedt_pc_seguroExit
          end
          object dbchkbox_REB: TDBCheckBox
            Left = 660
            Top = 129
            Width = 49
            Height = 17
            Caption = 'REB'
            DataField = 'IN_REB'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 5
            ValueChecked = '1'
            ValueUnchecked = '0'
            Visible = False
            OnClick = dbchkbox_REBClick
          end
          object dbrdg_tipo_seguro: TcxDBRadioGroup
            Left = 168
            Top = 252
            DataBinding.DataField = 'CD_TIPO_BASE_SEGURO'
            DataBinding.DataSource = datm_DI_Capa.ds_di
            Properties.Columns = 3
            Properties.DefaultValue = '1'
            Properties.Items = <
              item
                Caption = 'VMLE'
                Value = '1'
              end
              item
                Caption = 'VMLE + Frete'
                Value = '2'
              end
              item
                Caption = 'VMLE + Frete + L.E.'
                Value = '4'
              end>
            Properties.WordWrap = True
            Style.BorderStyle = ebs3D
            TabOrder = 6
            OnClick = dbedt_pc_seguroExit
            Height = 48
            Width = 289
          end
        end
        object tbsht_carga_Page3: TTabSheet
          BorderWidth = 2
          Caption = 'Page &3'
          ImageIndex = 4
          object Panel1: TPanel
            Left = 0
            Top = 344
            Width = 784
            Height = 46
            Align = alBottom
            Alignment = taLeftJustify
            BevelInner = bvLowered
            TabOrder = 0
            object Shape2: TShape
              Left = 8
              Top = 7
              Width = 15
              Height = 15
              Brush.Color = 14280953
              Pen.Color = clGray
            end
            object Shape3: TShape
              Left = 8
              Top = 24
              Width = 15
              Height = 15
              Brush.Color = 16774621
              Pen.Color = clGray
            end
            object Label21: TLabel
              Left = 27
              Top = 9
              Width = 264
              Height = 13
              Caption = 'duplo-clique para consulta on-line das moedas'
            end
            object Label22: TLabel
              Left = 27
              Top = 25
              Width = 440
              Height = 13
              Caption = 
                'duplo-clique para alterar a forma em que o item ser'#225' rateado ( v' +
                'alor ou peso )'
            end
            object SpeedButton5: TSpeedButton
              Left = 586
              Top = 6
              Width = 130
              Height = 34
              Caption = 'Retirar do Rateio'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
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
              OnClick = SpeedButton5Click
            end
          end
          object ntbPage3: TNotebook
            Left = 0
            Top = 0
            Width = 784
            Height = 322
            Align = alClient
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'ntbAcrescimos'
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 784
                Height = 322
                Align = alClient
                BevelInner = bvLowered
                BorderWidth = 4
                Ctl3D = False
                ParentColor = True
                ParentCtl3D = False
                TabOrder = 0
                object dbg_acrescimos: TDBGrid
                  Left = 6
                  Top = 23
                  Width = 772
                  Height = 293
                  Align = alClient
                  BorderStyle = bsNone
                  Ctl3D = False
                  DataSource = datm_DI_Capa.ds_acrescimos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  OnDblClick = dbg_acrescimosDblClick
                  OnExit = dbg_acrescimosExit
                  OnKeyDown = dbg_acrescimosKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'lck_nm_despesa'
                      Title.Caption = 'Despesa'
                      Title.Color = clBlack
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 447
                      Visible = True
                    end
                    item
                      Color = 14280953
                      Expanded = False
                      FieldName = 'CD_MOEDA'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      Title.Caption = 'Moeda'
                      Title.Color = clBlack
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 56
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VL_MOEDA'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      Title.Caption = 'Valor'
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
                      Color = 16774621
                      Expanded = False
                      FieldName = 'TP_BASE'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ReadOnly = True
                      Title.Caption = 'Tipo de Base'
                      Title.Color = clBlack
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 100
                      Visible = True
                    end>
                end
                object Panel2: TPanel
                  Left = 6
                  Top = 6
                  Width = 772
                  Height = 17
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = ' Rateio de Acrescimos'
                  Ctl3D = True
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
            object TPage
              Left = 0
              Top = 0
              Caption = 'ntbDeducoes'
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 722
                Height = 327
                Align = alClient
                BevelInner = bvLowered
                BorderWidth = 4
                Ctl3D = False
                ParentColor = True
                ParentCtl3D = False
                TabOrder = 0
                object dbg_deducoes: TDBGrid
                  Left = 6
                  Top = 23
                  Width = 710
                  Height = 298
                  Align = alClient
                  BorderStyle = bsNone
                  Ctl3D = False
                  DataSource = datm_DI_Capa.ds_deducoes
                  Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                  ParentCtl3D = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = [fsBold]
                  OnDblClick = dbg_deducoesDblClick
                  OnExit = dbg_deducoesExit
                  OnKeyDown = dbg_deducoesKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'lck_nm_despesa'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      Title.Caption = 'Despesa'
                      Title.Color = clBlack
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 447
                      Visible = True
                    end
                    item
                      Color = 14280953
                      Expanded = False
                      FieldName = 'CD_MOEDA'
                      Title.Caption = 'Moeda'
                      Title.Color = clBlack
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 56
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VL_MOEDA'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clNavy
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      Title.Caption = 'Valor'
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
                      Color = 16774621
                      Expanded = False
                      FieldName = 'TP_BASE'
                      ReadOnly = True
                      Title.Caption = 'Tipo de Base'
                      Title.Color = clBlack
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 100
                      Visible = True
                    end>
                end
                object Panel5: TPanel
                  Left = 6
                  Top = 6
                  Width = 710
                  Height = 17
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = ' Rateio de Dedu'#231#245'es'
                  Ctl3D = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 1
                end
              end
            end
          end
          object TabSet1: TTabSet
            Left = 0
            Top = 322
            Width = 784
            Height = 22
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            SoftTop = True
            Tabs.Strings = (
              '  Acrescimos  '
              '   Dedu'#231#245'es  ')
            TabIndex = 0
            OnClick = TabSet1Click
          end
        end
        object tbsDE: TTabSheet
          Caption = '  DE'
          ImageIndex = 5
          object btnExcluirDE: TSpeedButton
            Left = 270
            Top = 0
            Width = 28
            Height = 28
            Hint = 'Exclui DE'
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
            OnClick = btnExcluirDEClick
          end
          object dbgDE: TDBGrid
            Left = 0
            Top = 0
            Width = 265
            Height = 394
            Align = alLeft
            DataSource = datm_DI_Capa.ds_DE_DI
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_DE_MERCOSUL'
                Title.Caption = 'N'#250'mero da DE'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_RE_INICIAL'
                Title.Caption = 'In'#237'cio'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_RE_FINAL'
                Title.Caption = 'Fim'
                Width = 40
                Visible = True
              end>
          end
        end
      end
    end
    object tbsht_carga_TD16: TTabSheet
      Caption = '&Carga'
      TabVisible = False
      object Label51: TLabel
        Left = 60
        Top = 6
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
      object Label52: TLabel
        Left = 60
        Top = 38
        Width = 102
        Height = 13
        Caption = 'Peso L'#237'quido (kg)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label53: TLabel
        Left = 56
        Top = 76
        Width = 287
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
      object Label54: TLabel
        Left = 56
        Top = 197
        Width = 120
        Height = 13
        Caption = 'Recinto Alfandegado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_recinto_alfandegado4: TSpeedButton
        Left = 560
        Top = 212
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
        OnClick = btn_co_recinto_alfandegado1Click
      end
      object Label55: TLabel
        Left = 156
        Top = 266
        Width = 31
        Height = 13
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_setor4: TSpeedButton
        Left = 352
        Top = 280
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
        OnClick = btn_co_setor1Click
      end
      object DBEdit53: TDBEdit
        Left = 180
        Top = 2
        Width = 97
        Height = 21
        DataField = 'PB_CARGA'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 0
      end
      object DBEdit54: TDBEdit
        Left = 180
        Top = 34
        Width = 97
        Height = 21
        DataField = 'PL_CARGA'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 1
      end
      object DBGrid9: TDBGrid
        Left = 56
        Top = 92
        Width = 285
        Height = 81
        DataSource = datm_DI_Capa.ds_di_volumes
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 2
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
            Width = 195
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_VOLUME_CARGA'
            Title.Alignment = taCenter
            Width = 65
            Visible = True
          end>
      end
      object dbedt_cd_recinto_alfandegado4: TDBEdit
        Left = 56
        Top = 212
        Width = 53
        Height = 21
        DataField = 'CD_RECINTO_ALFAND'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 3
        OnExit = dbedt_cd_recinto_alfandegado1Exit
      end
      object dbedt_nm_recinto_alfandegado4: TDBEdit
        Left = 112
        Top = 212
        Width = 445
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Recinto_alf'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 4
      end
      object DBGrid10: TDBGrid
        Left = 56
        Top = 243
        Width = 93
        Height = 82
        DataSource = datm_DI_Capa.ds_di_armazem
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_ARMAZEM_CARGA'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end>
      end
      object dbedt_cd_setor4: TDBEdit
        Left = 156
        Top = 280
        Width = 29
        Height = 21
        DataField = 'CD_SETOR_ARMAZENAM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 6
        OnExit = dbedt_cd_setor1Exit
      end
      object edt_nm_setor4: TEdit
        Left = 188
        Top = 280
        Width = 161
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 7
      end
    end
    object tbsht_carga_TD18: TTabSheet
      Caption = '&Carga'
      TabVisible = False
      object Label56: TLabel
        Left = 24
        Top = 50
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
      object Label57: TLabel
        Left = 24
        Top = 82
        Width = 102
        Height = 13
        Caption = 'Peso L'#237'quido (kg)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label58: TLabel
        Left = 308
        Top = 28
        Width = 287
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
      object Label59: TLabel
        Left = 40
        Top = 142
        Width = 120
        Height = 13
        Caption = 'Recinto Alfandegado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label60: TLabel
        Left = 108
        Top = 234
        Width = 31
        Height = 13
        Caption = 'Setor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_setor5: TSpeedButton
        Left = 304
        Top = 248
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
        OnClick = btn_co_setor1Click
      end
      object btn_co_recinto_alfandegado5: TSpeedButton
        Left = 544
        Top = 157
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
        OnClick = btn_co_recinto_alfandegado1Click
      end
      object DBEdit59: TDBEdit
        Left = 144
        Top = 46
        Width = 97
        Height = 21
        DataField = 'PB_CARGA'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 0
      end
      object DBEdit60: TDBEdit
        Left = 144
        Top = 78
        Width = 97
        Height = 21
        DataField = 'PL_CARGA'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 1
      end
      object DBGrid11: TDBGrid
        Left = 308
        Top = 44
        Width = 285
        Height = 81
        DataSource = datm_DI_Capa.ds_di_volumes
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 2
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
            Width = 195
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QT_VOLUME_CARGA'
            Title.Alignment = taCenter
            Width = 65
            Visible = True
          end>
      end
      object dbedt_cd_recinto_alfandegado5: TDBEdit
        Left = 40
        Top = 157
        Width = 53
        Height = 21
        DataField = 'CD_RECINTO_ALFAND'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 3
        OnExit = dbedt_cd_recinto_alfandegado1Exit
      end
      object dbedt_nm_recinto_alfandegado5: TDBEdit
        Left = 96
        Top = 157
        Width = 445
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Recinto_alf'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 4
      end
      object DBGrid12: TDBGrid
        Left = 8
        Top = 211
        Width = 93
        Height = 82
        DataSource = datm_DI_Capa.ds_di_armazem
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NM_ARMAZEM_CARGA'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end>
      end
      object dbedt_cd_setor5: TDBEdit
        Left = 108
        Top = 248
        Width = 29
        Height = 21
        DataField = 'CD_SETOR_ARMAZENAM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 6
        OnExit = dbedt_cd_setor1Exit
      end
      object GroupBox9: TGroupBox
        Left = 348
        Top = 224
        Width = 285
        Height = 161
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object grpbox_op_cambial5: TGroupBox
          Left = 8
          Top = 12
          Width = 265
          Height = 141
          Caption = 'Adquirente da Mercadoria'
          TabOrder = 0
          object lbl_cnpj_op_cambial5: TLabel
            Left = 8
            Top = 102
            Width = 97
            Height = 13
            Caption = 'CNPJ Adquirente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cnpj_consignatario5: TDBEdit
            Left = 117
            Top = 98
            Width = 121
            Height = 21
            DataField = 'NR_CONSIGNATARIO'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 0
          end
          object rbtn_Contratante_prop_impo5: TRadioButton
            Left = 8
            Top = 22
            Width = 133
            Height = 17
            Caption = 'Pr'#243'prio Importador'
            TabOrder = 1
            OnClick = rbtn_Contratante_prop_impo1Click
          end
          object rbtn_contratante_outro5: TRadioButton
            Left = 8
            Top = 44
            Width = 193
            Height = 17
            Caption = 'Importa'#231#227'o por conta e ordem'
            TabOrder = 2
            OnClick = rbtn_Contratante_prop_impo1Click
          end
          object rbtn_contratante_por_encomenda5: TRadioButton
            Left = 8
            Top = 68
            Width = 193
            Height = 17
            Caption = 'Importa'#231#227'o por encomenda'
            TabOrder = 3
            OnClick = rbtn_Contratante_prop_impo1Click
          end
        end
      end
      object dbchkbox_op_fundap5: TDBCheckBox
        Left = 412
        Top = 196
        Width = 129
        Height = 17
        Caption = 'Operacao FUNDAP'
        DataField = 'IN_OPERACAO_FUNDAP'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object edt_nm_setor5: TEdit
        Left = 140
        Top = 248
        Width = 161
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 9
      end
    end
    object tbsht_pagamento: TTabSheet
      Caption = 'Pagamento'
      object Label13: TLabel
        Left = 200
        Top = 76
        Width = 324
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'D'#233'bito em Conta'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label14: TLabel
        Left = 186
        Top = 376
        Width = 341
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = '  Compensa'#231#227'o de Tributos  '
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object dbtxt_vl_ii: TDBText
        Left = 200
        Top = 243
        Width = 101
        Height = 17
        Alignment = taRightJustify
        Color = clBtnFace
        DataField = 'VL_TOTAL_II'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxt_vl_ipi: TDBText
        Left = 200
        Top = 263
        Width = 101
        Height = 17
        Alignment = taRightJustify
        Color = clBtnFace
        DataField = 'VL_TOTAL_IPI'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxt_vl_ad: TDBText
        Left = 200
        Top = 283
        Width = 101
        Height = 17
        Alignment = taRightJustify
        Color = clBtnFace
        DataField = 'VL_TOTAL_AD'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxt_vl_icms: TDBText
        Left = 200
        Top = 303
        Width = 101
        Height = 17
        Alignment = taRightJustify
        Color = clBtnFace
        DataField = 'VL_TOT_ICMS'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label88: TLabel
        Left = 88
        Top = 243
        Width = 100
        Height = 13
        Caption = 'Totais            I.I.'
      end
      object Label89: TLabel
        Left = 159
        Top = 263
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'I.P.I.'
      end
      object Label90: TLabel
        Left = 162
        Top = 283
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'A.D.'
      end
      object Label91: TLabel
        Left = 141
        Top = 303
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'I.C.M.S.'
      end
      object Bevel5: TBevel
        Left = 28
        Top = 348
        Width = 677
        Height = 9
        Shape = bsTopLine
      end
      object Label94: TLabel
        Left = 200
        Top = 24
        Width = 63
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Banco'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label95: TLabel
        Left = 264
        Top = 24
        Width = 68
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ag'#234'ncia'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label96: TLabel
        Left = 333
        Top = 24
        Width = 191
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Conta Corrente'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 104
        Top = 323
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'PIS / COFINS '
      end
      object dbtxt_vl_pis_cofins: TDBText
        Left = 200
        Top = 323
        Width = 101
        Height = 17
        Alignment = taRightJustify
        Color = clBtnFace
        DataField = 'VL_TOT_PIS_COFINS'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Bevel6: TBevel
        Left = 28
        Top = 236
        Width = 677
        Height = 9
        Shape = bsTopLine
      end
      object dbg_DARF: TDBGrid
        Left = 200
        Top = 92
        Width = 325
        Height = 134
        DataSource = datm_DI_Capa.ds_di_darf
        Enabled = False
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_RECEITA_PGTO'
            Title.Alignment = taCenter
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_TRIBUTO_PAGO'
            Title.Alignment = taCenter
            Width = 103
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CALC_VL_ADM_TEMP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Caption = 'Valor Adm Temp (R$)'
            Width = 125
            Visible = True
          end>
      end
      object dbg_compensacao_tributos: TDBGrid
        Left = 186
        Top = 392
        Width = 339
        Height = 25
        DataSource = datm_DI_Capa.ds_di_comp_trib
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Visible = False
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_RECEITA_CREDITO'
            Title.Alignment = taCenter
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_COMPENSAR_CRED'
            Title.Alignment = taCenter
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_DCTO_GERADOR_CR'
            Title.Alignment = taCenter
            Width = 117
            Visible = True
          end>
      end
      object dbedt_nr_conta_pagto_trib: TDBEdit
        Left = 332
        Top = 40
        Width = 193
        Height = 21
        DataField = 'NR_CONTA_PGTO_TRIB'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 4
      end
      object MskEdt_cd_agencia: TMaskEdit
        Left = 263
        Top = 40
        Width = 70
        Height = 21
        EditMask = '9999;0; '
        MaxLength = 4
        TabOrder = 3
        OnExit = MskEdt_cd_bancoExit
      end
      object MskEdt_cd_banco: TMaskEdit
        Left = 200
        Top = 40
        Width = 64
        Height = 21
        EditMask = '999;0; '
        MaxLength = 3
        TabOrder = 2
        OnExit = MskEdt_cd_bancoExit
      end
    end
    object tbsht_informacoes_complementares: TTabSheet
      Caption = 'Complementares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnExit = tbsht_informacoes_complementaresExit
      DesignSize = (
        796
        422)
      object Label87: TLabel
        Left = 80
        Top = 177
        Width = 166
        Height = 13
        Caption = 'Informa'#231#245'es Complementares'
      end
      object btn_co_obs: TSpeedButton
        Left = 256
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
        OnClick = btn_co_obsClick
      end
      object Label24: TLabel
        Left = 80
        Top = 8
        Width = 148
        Height = 13
        Caption = 'Observa'#231#245'es Autom'#225'ticas'
      end
      object dbmemo_info_complementares: TDBMemo
        Left = 80
        Top = 193
        Width = 580
        Height = 224
        Anchors = [akLeft, akTop, akBottom]
        DataField = 'TX_INFO_COMPL'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnKeyDown = dbmemo_info_complementaresKeyDown
      end
      object btnObsAutomatica: TBitBtn
        Left = 240
        Top = 0
        Width = 25
        Height = 21
        Hint = 'Carregar observa'#231#245'es autom'#225'ticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnObsAutomaticaClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000520B0000520B00000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDDBDBDBDB
          DBDBDBDBDBDBDBDBDBFDFFFDF7F7F7F7F7F7F7F7F7F7F7F7F7FDFDFDE4090909
          0909090909090909DBFDFFFD07F608080807070707070707F7FDFDFDE4090707
          0707070707070709DBFDFFFD07F607070707070707070707F7FDFDFDECF64952
          F509090909090909DBFDFFFD07F6495B0708070707070707F7FDFDFDECFF5249
          52F5090909090909DBFDFFFD07F65B525B07080707070707F7FDFDFDEDFF075B
          5D1392ED07070709DBFDFFFD07FF079BA4529B0707070707F7FDFDFDEDFFFF5B
          5C9BD992F5090909DBFDFFFD07FFF69B9BA4A49B07070707F7FDFDFDEDFFFFFF
          9BEBEAD992F50909DBFDFFFD07FFFFF6A407F7A49B070707F7FDFDFDEDFF0707
          9B09F4EAD992EDF5E4FDFFFD07FF0707F70807F7A49B0707F7FDFDFDEDFFFFFF
          FF9B09F4EAD992F5EDFDFFFD07FFFFFFFFF70807F7A49B0707FDFDFDF5FFFFFF
          FFFF9B09F4EAD992EDFDFFFD07FFFFFFFFFFF70807F7A49B07FDFDFD09FF0707
          0707079B09A42F0101FDFFFD07FF0707070707F708F7F75B52FDFDFD09FFFFFF
          FFFFFFFF9B670E0E0101FFFD07FFFFFFFFFFFFFFF7F7A4A45B52FDFD09FFFFFF
          FFFFFFFF090E671F0EFDFFFD08FFFFFFFFFFFFFF089B07A4A4FDFDFD09FFFFFF
          FFFFFFFF09E30E0EFDFDFFFD07FFF6F6F6F6F6F608F79B9BFDFDFDFD09090909
          09090909EDDBFDFDFDFDFFFD070808080807070807F7FDFDFDFD}
        NumGlyphs = 2
      end
      object dbmemo_info_complementares_auto: TDBMemo
        Left = 80
        Top = 27
        Width = 580
        Height = 140
        DataField = 'TX_INFO_COMPL_AUTO'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object btnLimpar: TBitBtn
        Left = 269
        Top = 0
        Width = 25
        Height = 21
        Hint = 'Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnLimparClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          00006FF6FF6666666666666666666666666666660000FFFFFFFF666666666666
          66666666666666660000FFFFFF8111666666666666666888666666660000FFFF
          F89111166666666666668888866666660000FFFFF91911116666666666688888
          886666660000FF6F619991110666666666687888888666660000F66669191910
          8066666666688788888866660000666666919103780666666666887888788666
          00006666666910BB3780666666666888778788660000666666663BF7B3780666
          66666687F778788600006666666663BF7B303066666666687F77888800006666
          6666663BFB0333666666666687F788880000666666666663B37B336666666666
          68787788000066666666666637BBB36666666666668777780000666666666666
          63FBBB66666666666668F7770000666666666666663FBB666666666666668F77
          0000}
        NumGlyphs = 2
      end
    end
    object tbsht_aux: TTabSheet
      Caption = 'Auxiliar'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 796
        Height = 422
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label18: TLabel
        Left = 22
        Top = 36
        Width = 64
        Height = 13
        Caption = 'N'#186' Adi'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vinculacao_comp_vend: TLabel
        Left = 307
        Top = 19
        Width = 252
        Height = 13
        Caption = 'Vincula'#231#227'o entre o Comprador e o Vendedor'
      end
      object lbl_metodo_valoracao: TLabel
        Left = 21
        Top = 71
        Width = 122
        Height = 13
        Caption = 'M'#233'todo de Valora'#231#227'o'
      end
      object Label66: TLabel
        Left = 21
        Top = 95
        Width = 146
        Height = 13
        Caption = 'Regime de Tributa'#231#227'o I.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_reg_trib1: TSpeedButton
        Left = 284
        Top = 109
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
        OnClick = btn_co_reg_trib1Click
      end
      object Label67: TLabel
        Left = 21
        Top = 142
        Width = 125
        Height = 13
        Caption = 'Fundamento Legal I.I.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_fund_legal1: TSpeedButton
        Left = 284
        Top = 156
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
        OnClick = btn_co_fund_legal1Click
      end
      object lbl_cd_incoterm: TLabel
        Left = 176
        Top = 36
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
      object lbl_perc_icms: TLabel
        Left = 407
        Top = 231
        Width = 44
        Height = 13
        Caption = '% ICMS'
      end
      object lbl_reducao_icms: TLabel
        Left = 407
        Top = 256
        Width = 117
        Height = 13
        Caption = '% Redu'#231#227'o de ICMS'
      end
      object Label73: TLabel
        Left = 407
        Top = 206
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
      object Label8: TLabel
        Left = 21
        Top = 189
        Width = 176
        Height = 13
        Caption = 'Regime de Tributa'#231#227'o I.C.M.S.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_tributacao_icms: TSpeedButton
        Left = 284
        Top = 203
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
        OnClick = btn_co_tributacao_icmsClick
      end
      object Label10: TLabel
        Left = 21
        Top = 237
        Width = 148
        Height = 13
        Caption = 'Dispositivo Legal I.C.M.S.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_fund_legal_icms: TSpeedButton
        Left = 284
        Top = 251
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
        OnClick = btn_co_fund_legal_icmsClick
      end
      object lbl_fabricante: TLabel
        Left = 20
        Top = 375
        Width = 61
        Height = 13
        Caption = 'Fabricante'
        FocusControl = dbedt_fabricante
      end
      object lbl_pais_origem: TLabel
        Left = 376
        Top = 375
        Width = 86
        Height = 13
        Caption = 'Pa'#237's de origem'
        FocusControl = dbedt_pais_orig
      end
      object lbl_exportador: TLabel
        Left = 20
        Top = 335
        Width = 62
        Height = 13
        Caption = 'Exportador'
        FocusControl = dbedt_exportador
      end
      object lbl_pais_exportador: TLabel
        Left = 376
        Top = 335
        Width = 104
        Height = 13
        Caption = 'Pa'#237's de Aquisi'#231#227'o'
        FocusControl = dbedt_pais_fornec
      end
      object btn_co_nm_fabric: TSpeedButton
        Left = 337
        Top = 387
        Width = 26
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
        OnClick = btn_co_nm_fabricClick
      end
      object btn_co_pais_orig: TSpeedButton
        Left = 689
        Top = 387
        Width = 26
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
        OnClick = btn_co_pais_origClick
      end
      object btn_co_nm_export: TSpeedButton
        Left = 337
        Top = 347
        Width = 26
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
        OnClick = btn_co_nm_exportClick
      end
      object btn_co_pais_export: TSpeedButton
        Left = 689
        Top = 347
        Width = 26
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
        OnClick = btn_co_pais_exportClick
      end
      object btn_co_metodo_valoracao: TSpeedButton
        Left = 541
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
        OnClick = btn_co_metodo_valoracaoClick
      end
      object Label19: TLabel
        Left = 586
        Top = 231
        Width = 77
        Height = 13
        Caption = '% Redu'#231#227'o II'
      end
      object dbedt_nr_adicoes: TDBEdit
        Left = 90
        Top = 32
        Width = 33
        Height = 21
        Color = clMenu
        DataField = 'QT_ADICOES'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 3
        ReadOnly = True
        TabOrder = 1
        OnExit = dbedt_cd_importador2Exit
      end
      object dblkpcbox_vinc_comp_vend: TDBLookupComboBox
        Left = 307
        Top = 32
        Width = 253
        Height = 21
        DataField = 'CD_VINC_IMPO_EXPO'
        DataSource = datm_DI_Capa.ds_di
        KeyField = 'CD_VINC_EXPO_IMPO'
        ListField = 'DESCRICAO'
        ListSource = datm_DI_Capa.ds_tp_vinc_expo_impo
        TabOrder = 3
        OnClick = dbedt_cd_incotermChange
      end
      object dbedt_cd_metodo_valoracao: TDBEdit
        Left = 150
        Top = 67
        Width = 32
        Height = 21
        DataField = 'CD_METODO_VALORACAO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 4
        OnChange = dbedt_cd_incotermChange
      end
      object dbedt_nm_metodo_valoracao: TDBEdit
        Left = 182
        Top = 67
        Width = 358
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Met_Valoracao'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 21
      end
      object DBEdit18: TDBEdit
        Left = 45
        Top = 109
        Width = 238
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Reg_Trib_II'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 22
      end
      object DBEdit41: TDBEdit
        Left = 53
        Top = 156
        Width = 230
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Fund_Legal'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 23
      end
      object dbrgrp_aplicacao: TDBRadioGroup
        Left = 588
        Top = 96
        Width = 123
        Height = 55
        Caption = 'Aplica'#231#227'o'
        DataField = 'CD_APLICACAO_MERC'
        DataSource = datm_DI_Capa.ds_di
        Items.Strings = (
          'Consumo'
          'Revenda')
        TabOrder = 13
        TabStop = True
        Values.Strings = (
          '1'
          '2')
        OnChange = dbedt_cd_incotermChange
      end
      object grpbox_cond_mercadoria: TGroupBox
        Left = 588
        Top = 156
        Width = 123
        Height = 59
        Caption = 'Condi'#231#227'o Merc.'
        TabOrder = 14
        object rbtn_Bem_sob_encomenda: TRadioButton
          Left = 5
          Top = 34
          Width = 114
          Height = 17
          Caption = 'Sob encomenda'
          TabOrder = 1
          OnClick = rbtn_material_usadoClick
        end
        object rbtn_material_usado: TRadioButton
          Left = 5
          Top = 16
          Width = 113
          Height = 17
          Caption = 'Material Usado'
          TabOrder = 0
          OnClick = rbtn_material_usadoClick
        end
      end
      object dbedt_pc_icms: TDBEdit
        Left = 526
        Top = 227
        Width = 49
        Height = 21
        DataField = 'PC_ICMS'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 11
        OnChange = dbedt_cd_incotermChange
      end
      object dbedt_pc_reducao_icms: TDBEdit
        Left = 526
        Top = 252
        Width = 49
        Height = 21
        DataField = 'PC_REDUCAO_ICMS'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 12
        OnChange = dbedt_cd_incotermChange
      end
      object dbedt_destaque_ncm: TDBEdit
        Left = 526
        Top = 202
        Width = 29
        Height = 21
        DataField = 'CD_DESTAQUE_NCM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 10
        OnChange = dbedt_cd_incotermChange
      end
      object dbrg_reg_tributacao: TDBRadioGroup
        Left = 325
        Top = 96
        Width = 244
        Height = 94
        Caption = 'Regime de Tributa'#231#227'o I.P.I.'
        Color = clBtnFace
        DataField = 'CD_REG_TRIB_IPI'
        DataSource = datm_DI_Capa.ds_di
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
        TabOrder = 9
        TabStop = True
        Values.Strings = (
          '4'
          '5'
          '2'
          '1')
        OnChange = dbedt_cd_incotermChange
      end
      object DBCheckBox3: TDBCheckBox
        Left = 23
        Top = 10
        Width = 225
        Height = 17
        Caption = 'Repassar dados para Adi'#231#245'es'
        DataField = 'IN_REPASSA_DADOS_ADICAO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnEnter = DBCheckBox3Enter
      end
      object dbedt_cd_incoterm: TDBEdit
        Left = 251
        Top = 32
        Width = 37
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_INCOTERM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_cd_incotermExit
      end
      object dbedt_nm_tributacao_icms: TDBEdit
        Left = 46
        Top = 203
        Width = 237
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'LookTributacaoICMS'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_nm_fund_legal_icms: TDBEdit
        Left = 54
        Top = 251
        Width = 229
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'LookFundLegalICMS'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_nm_fabricante: TDBEdit
        Left = 73
        Top = 388
        Width = 263
        Height = 21
        TabStop = False
        DataField = 'LookFabricante'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_nm_fornecedor: TDBEdit
        Left = 73
        Top = 348
        Width = 263
        Height = 21
        TabStop = False
        DataField = 'LookExportador'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 27
      end
      object dbedt_pais_origem_: TDBEdit
        Left = 425
        Top = 388
        Width = 263
        Height = 21
        TabStop = False
        DataField = 'Look_pais_orig'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 28
      end
      object dbedt_pais_export: TDBEdit
        Left = 425
        Top = 348
        Width = 263
        Height = 21
        TabStop = False
        DataField = 'Look_pais_export'
        DataSource = datm_DI_Capa.ds_di
        ParentColor = True
        ReadOnly = True
        TabOrder = 29
      end
      object dbrgrp_fabr_expo: TDBRadioGroup
        Left = 21
        Top = 278
        Width = 694
        Height = 45
        Columns = 3
        Ctl3D = True
        DataField = 'CD_AUSENCIA_FABRIC'
        DataSource = datm_DI_Capa.ds_di
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Fabric/prod. '#233' o export.'
          'Fabric/prod. n'#227'o '#233' o export.'
          'Fabric/prod. '#233' desconhecido')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 16
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbedt_cd_incotermChange
      end
      object dbedt_pc_reducao_ipt_bli: TDBEdit
        Left = 666
        Top = 227
        Width = 49
        Height = 21
        DataField = 'PC_REDUCAO_IPT_BLI'
        DataSource = datm_DI_Capa.ds_di
        MaxLength = 5
        TabOrder = 15
        OnChange = dbedt_cd_incotermChange
      end
      object dbedt_cd_reg_trib_ii: TDBEdit
        Left = 21
        Top = 109
        Width = 25
        Height = 21
        DataField = 'CD_REG_TRIB_II'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 5
        OnChange = dbedt_cd_reg_trib_iiChange
        OnExit = dbedt_cd_reg_trib_iiExit
      end
      object dbedt_fund_legal_ii: TDBEdit
        Left = 21
        Top = 156
        Width = 33
        Height = 21
        DataField = 'CD_FUND_LEGAL_II'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 6
        OnChange = dbedt_cd_incotermChange
      end
      object dbedt_cd_tributacao_icms: TDBEdit
        Left = 21
        Top = 203
        Width = 26
        Height = 21
        DataField = 'CD_TRIBUTACAO_ICMS'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 7
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_cd_reg_trib_iiExit
      end
      object dbedt_cd_fund_legal_icms: TDBEdit
        Left = 21
        Top = 251
        Width = 34
        Height = 21
        DataField = 'CD_FUND_LEGAL_ICMS'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 8
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_cd_fund_legal_icmsExit
      end
      object dbedt_exportador: TDBEdit
        Left = 20
        Top = 348
        Width = 54
        Height = 21
        DataField = 'CD_FORNECEDOR'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 17
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_exportadorExit
      end
      object dbedt_fabricante: TDBEdit
        Left = 20
        Top = 388
        Width = 54
        Height = 21
        DataField = 'CD_FABRICANTE'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 19
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_fabricanteExit
      end
      object dbedt_pais_fornec: TDBEdit
        Left = 376
        Top = 348
        Width = 50
        Height = 21
        DataField = 'CD_PAIS_AQUIS_MERC'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 18
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_pais_fornecExit
      end
      object dbedt_pais_orig: TDBEdit
        Left = 376
        Top = 388
        Width = 50
        Height = 21
        DataField = 'CD_PAIS_ORIG_MERC'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 20
        OnChange = dbedt_cd_incotermChange
        OnExit = dbedt_pais_origExit
      end
      object GroupBox3: TGroupBox
        Left = 575
        Top = 13
        Width = 147
        Height = 73
        TabOrder = 30
        object Label113: TLabel
          Left = 9
          Top = 32
          Width = 132
          Height = 13
          Caption = 'Data Pagamento DARF'
        end
        object cxdbedtDT_PAGAMENTO_DARF: TcxDBDateEdit
          Left = 8
          Top = 47
          DataBinding.DataField = 'DT_PAGAMENTO_DARF'
          DataBinding.DataSource = datm_DI_Capa.ds_di
          Properties.ImmediatePost = True
          Style.BorderStyle = ebs3D
          TabOrder = 0
          Width = 121
        end
        object dbchkIN_FMA: TDBCheckBox
          Left = 9
          Top = -1
          Width = 126
          Height = 25
          Caption = ' Recolhimento de impostos via Darf '
          DataField = 'IN_FMA'
          DataSource = datm_DI_Capa.ds_di
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          WordWrap = True
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'C'#226'mbio'
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 796
        Height = 422
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Bevel2: TBevel
        Left = 301
        Top = 142
        Width = 402
        Height = 255
        Shape = bsFrame
      end
      object Bevel4: TBevel
        Left = 24
        Top = 202
        Width = 257
        Height = 135
        Shape = bsFrame
      end
      object lbl_pc_comissao_agente: TLabel
        Left = 42
        Top = 239
        Width = 74
        Height = 13
        AutoSize = False
        Caption = 'Percentual'
        FocusControl = dbedt_pc_comissao_agente
      end
      object lbl_nr_banco: TLabel
        Left = 42
        Top = 295
        Width = 42
        Height = 13
        AutoSize = False
        Caption = 'Banco'
        FocusControl = dbedt_nr_banco
      end
      object lbl_nr_praca: TLabel
        Left = 182
        Top = 295
        Width = 38
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Pra'#231'a'
        FocusControl = dbedt_nr_praca
      end
      object lbl_nr_identificacao_agente: TLabel
        Left = 42
        Top = 267
        Width = 74
        Height = 13
        AutoSize = False
        Caption = 'Identifica'#231#227'o'
        FocusControl = dbedt_nr_identificacao_agente
      end
      object lbl_nr_rof: TLabel
        Left = 18
        Top = 165
        Width = 48
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'N'#186' ROF'
        FocusControl = dbedt_nr_rof
      end
      object lblComissao: TLabel
        Left = 31
        Top = 208
        Width = 54
        Height = 13
        Caption = 'Comiss'#227'o'
      end
      object lbl_Contrato_Cambio: TLabel
        Left = 319
        Top = 158
        Width = 94
        Height = 13
        Caption = 'Contrato C'#226'mbio'
      end
      object lbl_cd_mod_pagto_2: TLabel
        Left = 300
        Top = 54
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
      object btn_co_mod_pagto1: TSpeedButton
        Left = 679
        Top = 68
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
        OnClick = btn_co_mod_pagto1Click
      end
      object lbl_cd_mot_sem_cob: TLabel
        Left = 300
        Top = 14
        Width = 172
        Height = 13
        Caption = 'Motivo sem Cobertura Cambial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_motivo_sem_cob1: TSpeedButton
        Left = 679
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
        OnClick = btn_co_motivo_sem_cob1Click
      end
      object btn_co_inst_financ: TSpeedButton
        Left = 679
        Top = 106
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
        OnClick = btn_co_inst_financClick
      end
      object lbl_inst_financ: TLabel
        Left = 300
        Top = 92
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
      object lbl_total_cambio: TLabel
        Left = 318
        Top = 342
        Width = 92
        Height = 13
        Caption = 'Total do c'#226'mbio'
        FocusControl = dbedt_vl_tot_cambio
      end
      object dbedt_pc_comissao_agente: TDBEdit
        Left = 126
        Top = 235
        Width = 97
        Height = 21
        DataField = 'PC_COMISSAO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 6
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object dbedt_nr_banco: TDBEdit
        Left = 126
        Top = 292
        Width = 53
        Height = 21
        DataField = 'NR_BANCO_COM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 8
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object dbedt_nr_praca: TDBEdit
        Left = 226
        Top = 292
        Width = 41
        Height = 21
        DataField = 'NR_PRACA_COM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 9
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object dbedt_nr_identificacao_agente: TDBEdit
        Left = 126
        Top = 263
        Width = 133
        Height = 21
        DataField = 'NR_IDENTIFICACAO_COM'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 7
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object dbedt_nr_rof: TDBEdit
        Left = 71
        Top = 160
        Width = 97
        Height = 21
        DataField = 'NR_ROF'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 5
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object dbg_cobertura_cambial: TDBRadioGroup
        Left = 24
        Top = 37
        Width = 184
        Height = 105
        Caption = 'Cobertura Cambial'
        DataField = 'CD_COBERTURA_CAMBIAL'
        DataSource = datm_DI_Capa.ds_di
        Items.Strings = (
          'At'#233' 180 dias'
          'De 180 a 360 dias'
          'Acima de 360 dias'
          'Sem Cobertura')
        TabOrder = 1
        Values.Strings = (
          '1'
          '2'
          '3'
          '4')
        OnChange = dbedt_cd_mot_sem_cobChange
        OnClick = dbg_cobertura_cambialClick
      end
      object dbedt_nm_mod_pagto2: TDBEdit
        Left = 328
        Top = 68
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Modalidade_Pagto'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object DBEdit74: TDBEdit
        Left = 328
        Top = 28
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Mot_sem_cobertura'
        DataSource = datm_DI_Capa.ds_di
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 13
      end
      object dbchkbox_repasse: TDBCheckBox
        Left = 23
        Top = 10
        Width = 193
        Height = 17
        Caption = 'Repassar dados para Adi'#231#245'es'
        DataField = 'IN_REPASSA_DADOS_CAMBIO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = dbedt_cd_mot_sem_cobChange
        OnEnter = dbchkbox_repasseEnter
      end
      object dbrdg_contrato_cambio: TDBRadioGroup
        Left = 417
        Top = 145
        Width = 269
        Height = 39
        Columns = 3
        DataField = 'CD_FORMA_PAGAMENTO'
        DataSource = datm_DI_Capa.ds_di
        Items.Strings = (
          'Antecipado'
          'A Vista'
          'Parcelado')
        TabOrder = 11
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrdg_contrato_cambioChange
      end
      object dbedt_inst_financ: TDBEdit
        Left = 328
        Top = 106
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'DESCRICAO'
        DataSource = datm_DI_Capa.ds_inst_financ_
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 14
      end
      object dbedt_vl_tot_cambio: TDBEdit
        Left = 319
        Top = 356
        Width = 163
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'VL_TOTAL_CAMBIO'
        DataSource = datm_DI_Capa.ds_di
        ReadOnly = True
        TabOrder = 10
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object ntbk_cambio: TNotebook
        Left = 320
        Top = 231
        Width = 366
        Height = 106
        PageIndex = 1
        TabOrder = 15
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          object lbl_moeda_nac: TLabel
            Left = 11
            Top = 14
            Width = 98
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Moeda Nacional'
          end
          object lblNR_OP_CAMBIO: TLabel
            Left = 110
            Top = 14
            Width = 74
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'N'#186' Contrato'
            FocusControl = EditNR_OP_CAMBIO
          end
          object lblCD_BANCO_PAGAMENTO: TLabel
            Left = 216
            Top = 14
            Width = 42
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Banco'
            FocusControl = EditCD_BANCO_PAGAMENTO
          end
          object lblCD_PRACA_PAGAMENTO: TLabel
            Left = 278
            Top = 14
            Width = 38
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Pra'#231'a'
            FocusControl = EditCD_PRACA_PAGAMENTO
          end
          object lblNR_COMPR_CAMBIO: TLabel
            Left = 15
            Top = 52
            Width = 110
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Comprador (M.Est.)'
            FocusControl = EditNR_COMPR_CAMBIO
          end
          object dblkpcbox_moeda_nac: TDBLookupComboBox
            Left = 17
            Top = 27
            Width = 57
            Height = 21
            DataField = 'IN_MOEDA_NACIONAL'
            DataSource = datm_DI_Capa.ds_di
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_DI_Capa.ds_yesno
            TabOrder = 0
            OnClick = dbedt_cd_mot_sem_cobChange
          end
          object EditNR_OP_CAMBIO: TDBEdit
            Left = 117
            Top = 27
            Width = 97
            Height = 21
            DataField = 'NR_CONTRATO_CAMBIO'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 1
            OnChange = dbedt_cd_mot_sem_cobChange
          end
          object EditCD_BANCO_PAGAMENTO: TDBEdit
            Left = 220
            Top = 27
            Width = 53
            Height = 21
            DataField = 'NR_BANCO_PAGAMENTO'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 2
            OnChange = dbedt_cd_mot_sem_cobChange
          end
          object EditCD_PRACA_PAGAMENTO: TDBEdit
            Left = 278
            Top = 27
            Width = 41
            Height = 21
            DataField = 'NR_PRACA_PAGAMENTO'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 3
            OnChange = dbedt_cd_mot_sem_cobChange
          end
          object EditNR_COMPR_CAMBIO: TDBEdit
            Left = 17
            Top = 69
            Width = 133
            Height = 21
            DataField = 'NR_COMPRADOR_ME'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 4
            OnChange = dbedt_cd_mot_sem_cobChange
            OnExit = EditNR_COMPR_CAMBIOExit
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '1'
          object lbl_NRparcelas: TLabel
            Left = 16
            Top = 18
            Width = 98
            Height = 14
            AutoSize = False
            Caption = 'Nr. de Parcelas'
          end
          object lbl_periodicidade: TLabel
            Left = 120
            Top = 18
            Width = 98
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Periodicidade'
          end
          object lbl_indicador: TLabel
            Left = 8
            Top = 70
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
          object dbedt_nr_Parcelas: TDBEdit
            Left = 16
            Top = 33
            Width = 40
            Height = 21
            DataField = 'QT_PARC_FINANC_360'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 0
            OnChange = dbedt_cd_mot_sem_cobChange
          end
          object dbedt_periodicidade: TDBEdit
            Left = 140
            Top = 35
            Width = 40
            Height = 21
            DataField = 'QT_PERIOD_PGTO_360'
            DataSource = datm_DI_Capa.ds_di
            TabOrder = 1
            OnChange = dbedt_cd_mot_sem_cobChange
          end
          object rbtn_ind_per_diaria1: TRadioButton
            Left = 256
            Top = 68
            Width = 69
            Height = 17
            Caption = 'Di'#225'ria'
            Enabled = False
            TabOrder = 3
            OnClick = rbtn_ind_per_diaria1Click
          end
          object rbtn_ind_per_mensal1: TRadioButton
            Left = 176
            Top = 68
            Width = 69
            Height = 17
            Caption = 'Mensal'
            Enabled = False
            TabOrder = 2
            OnClick = rbtn_ind_per_mensal1Click
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = '2'
          object DBGrid14: TDBGrid
            Left = 44
            Top = 2
            Width = 237
            Height = 101
            DataSource = datm_DI_Capa.ds_pagto_cambio_prev
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnKeyDown = DBGrid14KeyDown
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'DT_PREV_PGTO_360'
                Title.Alignment = taCenter
                Title.Caption = 'Mes / Ano'
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
                Title.Caption = 'Valor da Parcela'
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
      object dbrgrp_parcelas: TDBRadioGroup
        Left = 320
        Top = 184
        Width = 366
        Height = 41
        Columns = 2
        Ctl3D = True
        DataField = 'IN_PGTO_VARIAV_360'
        DataSource = datm_DI_Capa.ds_di
        Items.Strings = (
          'Parcelas Fixas'
          'Parcelas Vari'#225'veis')
        ParentCtl3D = False
        TabOrder = 16
        Values.Strings = (
          'False'
          'True')
        Visible = False
        OnChange = dbrgrp_parcelasChange
      end
      object dbedt_cd_mot_sem_cob: TDBEdit
        Left = 300
        Top = 28
        Width = 29
        Height = 21
        DataField = 'CD_MOTIVO_SEM_COBERTURA'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 2
        OnChange = dbedt_cd_mot_sem_cobChange
        OnExit = dbedt_cd_mot_sem_cobExit
      end
      object dbedt_cd_mod_pagto_2: TDBEdit
        Left = 300
        Top = 68
        Width = 29
        Height = 21
        DataField = 'CD_MODALIDADE_PAGTO'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 3
        OnChange = dbedt_cd_mot_sem_cobChange
      end
      object dbedt_cd_inst_financ: TDBEdit
        Left = 300
        Top = 106
        Width = 29
        Height = 21
        DataField = 'CD_ORGAO_FIN_INTER'
        DataSource = datm_DI_Capa.ds_di
        TabOrder = 4
        OnChange = dbedt_cd_mot_sem_cobChange
        OnExit = dbedt_cd_inst_financExit
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 648
    Top = 49
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_armazem: TMenuItem
      Caption = '&Armaz'#233'm'
      Enabled = False
      Hint = 'Aramaz'#233'm'
      Visible = False
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Hint = 'Excluir'
      OnClick = btn_excluirClick
    end
    object mi_adicao_di: TMenuItem
      Caption = '&Adi'#231#227'o'
      Hint = 'Adi'#231#227'o'
      OnClick = btn_adicao_diClick
    end
    object mi_itens_di: TMenuItem
      Caption = '&Itens'
      Hint = 'Itens'
      OnClick = btn_itens_diClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Ca&lcular'
      Hint = 'Calcular'
      OnClick = btn_calculoClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
