object frm_cotacao: Tfrm_cotacao
  Left = 328
  Top = 146
  Width = 769
  Height = 741
  Caption = 'Cota'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 54
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      753
      54)
    object shp2: TShape
      Left = 499
      Top = 3
      Width = 260
      Height = 46
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 42
      Height = 45
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
    object btn_excluir: TSpeedButton
      Left = 131
      Top = 4
      Width = 42
      Height = 45
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
    object btn_sair: TSpeedButton
      Left = 451
      Top = 4
      Width = 45
      Height = 45
      Anchors = [akTop, akRight]
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
      Left = 47
      Top = 4
      Width = 42
      Height = 45
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 89
      Top = 4
      Width = 42
      Height = 45
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
      OnClick = btn_cancelarClick
    end
    object btn_busca_tarifas: TSpeedButton
      Left = 183
      Top = 4
      Width = 36
      Height = 45
      Hint = 'Busca Tarifas'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76080000424DB608000000000000B60000002800000020000000100000000100
        2000000000000008000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00008080000080
        8000008080000080800000808000008080000000000000FFFF007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000008080000080
        8000008080000080800000808000008080007F7F7F007F7F7F007F7F7F00FFFF
        FF00008080000080800000808000008080007F7F7F007F7F7F00008080000080
        8000008080000080800000808000008080000000000000FFFF007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000008080000080
        8000008080000080800000808000008080007F7F7F007F7F7F007F7F7F00FFFF
        FF00008080000080800000808000008080007F7F7F007F7F7F00008080000080
        8000008080000080800000808000008080000000000000FFFF007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000000000008080000080
        8000008080000080800000808000008080007F7F7F007F7F7F007F7F7F00FFFF
        FF00008080000080800000808000008080007F7F7F007F7F7F00008080000080
        8000008080000080800000808000008080000000000000FFFF007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF000000000000808000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00007F7F7F007F7F7F0000000000000000007F7F7F00000000007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000000000000000007F7F7F007F7F7F0000FFFF00000000007F7F7F00FFFF
        FF00008080000080800000808000008080000080800000808000008080007F7F
        7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000000000000000000007F7F7F0000FFFF0000FFFF00000000007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF0000808000FFFFFF00FFFFFF00FFFFFF007F7F
        7F007F7F7F00FFFFFF00FFFFFF007F7F7F007F7F7F007F7F7F0000000000FFFF
        FF000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
        000000000000000000000000FF0000000000000000007F7F7F007F7F7F00FFFF
        FF007F7F7F007F7F7F00008080007F7F7F007F7F7F007F7F7F00008080007F7F
        7F007F7F7F007F7F7F007F7F7F00FFFFFF007F7F7F007F7F7F0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000008080000000FF000000FF000000FF0000808000008080007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000808000FFFFFF007F7F
        7F00FFFFFF007F7F7F007F7F7F007F7F7F00FFFFFF00FFFFFF0000000000FFFF
        FF0000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
        00000000FF000000FF000000FF000000FF000000FF00008080007F7F7F00FFFF
        FF007F7F7F007F7F7F007F7F7F007F7F7F00008080007F7F7F00008080007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        FF000000FF000000FF000000FF000000FF000000FF000000FF007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF0000808000FFFFFF00FFFFFF00FFFFFF007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFF
        FF000000000000000000FFFFFF00000000000000000000000000000000000000
        0000008080000000FF000000FF000000FF0000808000008080007F7F7F00FFFF
        FF007F7F7F007F7F7F00008080007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F00008080007F7F7F007F7F7F007F7F7F00FFFFFF000080800000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00000000000080
        8000008080000000FF000000FF000000FF0000808000008080007F7F7F00FFFF
        FF0000808000FFFFFF00FFFFFF007F7F7F00FFFFFF00008080007F7F7F000080
        8000008080007F7F7F007F7F7F007F7F7F00FFFFFF000080800000000000FFFF
        FF0000000000BFBFBF00FFFFFF0000000000FFFFFF0000000000008080000080
        80007F7F7F000000FF000000FF000000FF0000808000008080007F7F7F00FFFF
        FF007F7F7F007F7F7F00008080007F7F7F00FFFFFF007F7F7F0000808000FFFF
        FF007F7F7F007F7F7F007F7F7F007F7F7F00008080000080800000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000000000000000008080000000FF000000
        FF000000FF000000FF000000FF000080800000808000008080007F7F7F00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF007F7F7F007F7F7F00008080007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F00008080000080800000808000000000000000
        0000000000000000000000000000000000000080800000808000008080000080
        80000080800000808000008080000080800000808000008080007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F000080800000808000008080000080
        8000008080000080800000808000008080000080800000808000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_busca_tarifasClick
    end
    object btn_imprimir: TSpeedButton
      Left = 223
      Top = 4
      Width = 36
      Height = 45
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
    object Label1: TLabel
      Left = 505
      Top = 8
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 618
      Top = 8
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object shp1: TShape
      Left = 340
      Top = 12
      Width = 108
      Height = 30
      Anchors = [akTop, akRight]
      Pen.Color = clGray
    end
    object btn_calculo: TSpeedButton
      Left = 262
      Top = 3
      Width = 35
      Height = 46
      Hint = 'Calcular as Taxas'
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
    object btn_Duplicar: TSpeedButton
      Left = 301
      Top = 3
      Width = 35
      Height = 46
      Hint = 'Duplicar Cota'#231#227'o'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6696BA6696BA6696BA669
        6BA6696BA6696BA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA6696BF3D3A4F0CB97EFC68AEDC180EBBB76A6696BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7756BF6DDBA707BCE0F2E
        F36E75BFEEC484A6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFBC8268F8E7CE0F30F7001EFF0F2FF3F0CC96A6696BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1926DFBF2E27486E70F30
        F8727FD7F3D7ABA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFDA9D75FEFAF3FBF4E7FAEEDCF8E7CFF6E1C0A6696BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79FFFFFFFEFBF8FCF7
        EEA6696AA6696AAC6C5AA46769A46769A46769A46769A46769A46769A46769A4
        6769FF00FFE7AB79FFFFFFFFFFFFFEFCFBA6696AC67F4EFF00FFA46769E9C49D
        D8A57BD8A373D59D66D1965AEAB66CA46769FF00FFE7AB79D1926DD1926D2A70
        27A6696AFF00FFFF00FFA46769BB76507D1800821F00811F00811E00DCA162A4
        6769FF00FFFF00FFFF00FF015A062CC5581C9631FF00FFFF00FFA7756BF6E9DD
        8A2A087F1A007B1600AB5B30FCDD9FA46769FF00FFFF00FF005D0330BD5741E0
        7522B63E087511FF00FFBC8268FFFFFFC99379791400892907E6BD99FFEAB5A4
        6769FF00FF2D6718067F141A922F27BB45149A260C8816036307D1926DFFFFFF
        FBF4F299411EBF7D59FAEDD4D4BCA0A46769FF00FFFF00FFFF00FF01550315A5
        2805700BFF00FFFF00FFDA9D75FFFFFFFFFFFFE7D0C4F7EEE3A46769A46769A4
        6A5AFF00FFFF00FFFF00FF036007099613036C07FF00FFFF00FFE7AB79FFFFFF
        FFFFFFFFFFFFFCFFFFA46769D18649FF00FFFF00FFFF00FF036E0704780A058C
        0D026005FF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DA46769FF00FFFF
        00FF02660602660601770705840C026606FF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_DuplicarClick
    end
    object dbnvg: TDBNavigator
      Left = 342
      Top = 14
      Width = 104
      Height = 26
      DataSource = datm_cotacao.ds_cotacao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      TabOrder = 0
    end
    object edt_chave: TEdit
      Left = 505
      Top = 22
      Width = 110
      Height = 21
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 618
      Top = 22
      Width = 135
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 2
    end
  end
  object pgctrl_cotacao: TPageControl
    Left = 0
    Top = 54
    Width = 753
    Height = 629
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_cotacaoChange
    OnChanging = pgctrl_cotacaoChanging
    object ts_lista: TTabSheet
      Caption = 'Lista'
      object dbg_lista: TDBGrid
        Left = 0
        Top = 77
        Width = 745
        Height = 524
        Align = alClient
        Ctl3D = False
        DataSource = datm_cotacao.ds_cotacao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = dbg_listaDrawColumnCell
        OnDblClick = dbg_listaDblClick
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'NR_PROPOSTA'
            Title.Caption = 'Nr Cota'#231#227'o'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 96
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'CD_EMPRESA'
            Title.Alignment = taRightJustify
            Title.Caption = 'C'#243'd.'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_EMPRESA'
            Title.Caption = 'Empresa'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 151
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_DESTINO'
            Title.Caption = 'Local Destino'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 123
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'STR_ESTUFAGEM'
            Title.Alignment = taCenter
            Title.Caption = 'Estufagem'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_ABERTURA'
            Title.Alignment = taCenter
            Title.Caption = 'Abertura'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 117
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_VALIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento'
            Title.Color = 6974058
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_STATUS'
            Title.Caption = 'Motivo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 49
        Align = alTop
        BevelInner = bvLowered
        TabOrder = 0
        object Label19: TLabel
          Left = 9
          Top = 7
          Width = 98
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_unid_neg1: TSpeedButton
          Left = 295
          Top = 20
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
          OnClick = btn_co_unid_neg1Click
        end
        object Label23: TLabel
          Left = 325
          Top = 7
          Width = 66
          Height = 13
          Caption = 'Data Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label131: TLabel
          Left = 421
          Top = 7
          Width = 82
          Height = 13
          Caption = 'Data Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label132: TLabel
          Left = 513
          Top = 7
          Width = 80
          Height = 13
          Caption = 'Dias de Validade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 681
          Top = 8
          Width = 30
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edt_nm_unid_neg: TEdit
          Left = 34
          Top = 20
          Width = 258
          Height = 19
          TabStop = False
          Color = clMenu
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 9
          Top = 20
          Width = 24
          Height = 19
          Ctl3D = False
          EditMask = '99;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnExit = Consiste_Filtra
          OnKeyPress = Somente_Numeros
        end
        object rx_dt_abertura: TDateEdit
          Left = 325
          Top = 20
          Width = 90
          Height = 21
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 2
          OnChange = Consiste_Filtra
        end
        object rx_vencto: TDateEdit
          Left = 421
          Top = 20
          Width = 90
          Height = 21
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 3
          OnChange = Consiste_Filtra
        end
        object rx_dias_vencto: TRxSpinEdit
          Left = 528
          Top = 20
          Width = 48
          Height = 21
          Hint = 'Contados a Partir de Hoje'
          Decimal = 0
          AutoSize = False
          Ctl3D = False
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnChange = Consiste_Filtra
          OnKeyPress = rx_dias_venctoKeyPress
        end
        object cb_status: TComboBox
          Left = 587
          Top = 20
          Width = 147
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          Style = csDropDownList
          Ctl3D = False
          ItemHeight = 13
          ItemIndex = 2
          ParentCtl3D = False
          TabOrder = 5
          Text = 'Aguardando Aprova'#231#227'o'
          OnChange = Consiste_Filtra
          Items.Strings = (
            'TODOS'
            'Aprovado'
            'Aguardando Aprova'#231#227'o'
            'Cancelada'
            'Rejeitada'
            'RO Aprovado'
            'No Feedback'
            'Just Inquiry')
        end
      end
      object pnl_Legenda: TPanel
        Left = 0
        Top = 49
        Width = 745
        Height = 28
        Align = alTop
        TabOrder = 2
        Visible = False
        object Shape25: TShape
          Left = 381
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = 8454143
          Pen.Color = clGray
        end
        object Label27: TLabel
          Left = 196
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Aprovado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape1: TShape
          Left = 8
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = 16771515
          Pen.Color = clGray
        end
        object Label28: TLabel
          Left = 25
          Top = 8
          Width = 134
          Height = 13
          Caption = 'Aguardando Aprova'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape2: TShape
          Left = 477
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = 4210943
          Pen.Color = clGray
        end
        object Label29: TLabel
          Left = 398
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Cancelada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape3: TShape
          Left = 179
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = 11206570
          Pen.Color = clGray
        end
        object Label30: TLabel
          Left = 492
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Rejeitada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape4: TShape
          Left = 272
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = 10797567
          Pen.Color = clGray
        end
        object Label32: TLabel
          Left = 289
          Top = 8
          Width = 77
          Height = 13
          Caption = 'RO Aprovado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape5: TShape
          Left = 564
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = 16711808
          Pen.Color = clGray
        end
        object Label44: TLabel
          Left = 579
          Top = 8
          Width = 77
          Height = 13
          Caption = 'No Feedback'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape6: TShape
          Left = 667
          Top = 6
          Width = 16
          Height = 16
          Brush.Color = clBlue
          Pen.Color = clGray
        end
        object Label45: TLabel
          Left = 682
          Top = 8
          Width = 66
          Height = 13
          Caption = 'Just Inquiry'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object Label8: TLabel
        Left = 0
        Top = 152
        Width = 745
        Height = 16
        Align = alTop
        AutoSize = False
        Caption = 'Observa'#231#227'o ( Cliente )'
        Color = 14548991
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object btn_cd_obs: TSpeedButton
        Left = 134
        Top = 154
        Width = 21
        Height = 14
        Cursor = crHandPoint
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
        OnClick = btn_cd_obsClick
      end
      object dbmmoOBS: TDBMemo
        Left = 0
        Top = 168
        Width = 745
        Height = 41
        Align = alTop
        Ctl3D = False
        DataField = 'TX_OBS'
        DataSource = datm_cotacao.ds_cotacao
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = ChecaBotoes
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 152
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Label20: TLabel
          Left = 4
          Top = 2
          Width = 98
          Height = 13
          Caption = 'Unidade de Neg'#243'cio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_cd_unid_neg: TSpeedButton
          Left = 176
          Top = 15
          Width = 21
          Height = 19
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
          OnClick = btn_co_cd_unid_negClick
        end
        object Label22: TLabel
          Left = 289
          Top = 2
          Width = 75
          Height = 13
          Caption = 'Status Proposta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 465
          Top = 2
          Width = 56
          Height = 13
          Caption = 'Data Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 205
          Top = 2
          Width = 76
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Nr. Cota'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 4
          Top = 39
          Width = 80
          Height = 13
          AutoSize = False
          Caption = 'Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 298
          Top = 73
          Width = 41
          Height = 13
          Caption = 'Validade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 78
          Top = 112
          Width = 37
          Height = 13
          Caption = 'Contato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 401
          Top = 36
          Width = 32
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_cd_empresa: TSpeedButton
          Left = 726
          Top = 47
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
          OnClick = btn_co_cd_empresaClick
        end
        object Label81: TLabel
          Left = 94
          Top = 36
          Width = 37
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object brn_co_produto: TSpeedButton
          Left = 364
          Top = 48
          Width = 20
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
          OnClick = brn_co_produtoClick
        end
        object Label15: TLabel
          Left = 401
          Top = 73
          Width = 84
          Height = 13
          Caption = 'Via de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 5
          Top = 112
          Width = 41
          Height = 13
          Caption = 'Incoterm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btnCoViaTransp: TSpeedButton
          Left = 725
          Top = 87
          Width = 21
          Height = 20
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
          OnClick = btnCoViaTranspClick
        end
        object DBText2: TDBText
          Left = 4
          Top = 54
          Width = 80
          Height = 15
          DataField = 'DT_ABERTURA'
          DataSource = datm_cotacao.ds_cotacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_motivo: TLabel
          Left = 543
          Top = 1
          Width = 87
          Height = 13
          Caption = 'Motivo da rejei'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label33: TLabel
          Left = 403
          Top = 112
          Width = 53
          Height = 13
          Caption = 'Frequencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label34: TLabel
          Left = 608
          Top = 112
          Width = 58
          Height = 13
          Caption = 'Transit Time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lbl_dias_horas: TLabel
          Left = 651
          Top = 131
          Width = 19
          Height = 13
          Caption = 'dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label36: TLabel
          Left = 281
          Top = 111
          Width = 67
          Height = 13
          Caption = 'Tipo de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 6
          Top = 73
          Width = 63
          Height = 13
          Caption = 'Solicitada em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 154
          Top = 73
          Width = 56
          Height = 13
          Caption = 'Enviada em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label48: TLabel
          Left = 93
          Top = 73
          Width = 32
          Height = 13
          Caption = 'horario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label49: TLabel
          Left = 241
          Top = 73
          Width = 32
          Height = 13
          Caption = 'horario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object dbedt_nm_cliente_temp: TDBEdit
          Left = 446
          Top = 49
          Width = 277
          Height = 19
          Ctl3D = False
          DataField = 'NM_CLIENTE_TEMP'
          DataSource = datm_cotacao.ds_cotacao
          ParentCtl3D = False
          TabOrder = 24
          OnChange = ChecaBotoes
        end
        object dbedt_nm_empresa: TDBEdit
          Left = 444
          Top = 49
          Width = 281
          Height = 19
          TabStop = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_EMPRESA'
          DataSource = datm_cotacao.ds_cotacao
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_nm_unid_neg: TDBEdit
          Left = 29
          Top = 15
          Width = 147
          Height = 19
          TabStop = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_UNID_NEG'
          DataSource = datm_cotacao.ds_cotacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_nm_produto: TDBEdit
          Left = 119
          Top = 49
          Width = 244
          Height = 19
          TabStop = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_PRODUTO'
          DataSource = datm_cotacao.ds_cotacao_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_nm_via_transp: TDBEdit
          Left = 425
          Top = 87
          Width = 300
          Height = 19
          TabStop = False
          Color = clMenu
          Ctl3D = False
          DataField = 'NM_VIA_TRANSP'
          DataSource = datm_cotacao.ds_cotacao_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_cd_unid_neg: TDBEdit
          Left = 4
          Top = 15
          Width = 24
          Height = 19
          Ctl3D = False
          DataField = 'CD_UNID_NEG'
          DataSource = datm_cotacao.ds_cotacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = ChecaBotoes
          OnExit = dbedt_cd_unid_negExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
          OnKeyPress = Somente_Numeros
        end
        object dbcbx_cd_status: TRxDBComboBox
          Left = 289
          Top = 14
          Width = 171
          Height = 21
          Style = csDropDownList
          Ctl3D = False
          DataField = 'CD_STATUS'
          DataSource = datm_cotacao.ds_cotacao
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Aprovado'
            'Aguardando Aprova'#231#227'o'
            'Cancelada'
            'Rejeitada'
            'RO Aprovado'
            'No Feedback'
            'Just Inquiry')
          ParentCtl3D = False
          TabOrder = 3
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
          OnChange = dbcbx_cd_statusChange
        end
        object rxdbde_dt_validade: TDBDateEdit
          Left = 298
          Top = 86
          Width = 88
          Height = 21
          DataField = 'DT_VALIDADE'
          DataSource = datm_cotacao.ds_cotacao
          NumGlyphs = 2
          TabOrder = 14
          YearDigits = dyFour
          OnChange = ChecaBotoes
        end
        object dbedt_nm_responsavel: TDBEdit
          Left = 78
          Top = 125
          Width = 176
          Height = 19
          Ctl3D = False
          DataField = 'NM_RESPONSAVEL'
          DataSource = datm_cotacao.ds_cotacao
          ParentCtl3D = False
          TabOrder = 18
          OnChange = ChecaBotoes
        end
        object dbedt_cd_empresa: TDBEdit
          Left = 401
          Top = 49
          Width = 42
          Height = 19
          Ctl3D = False
          DataField = 'CD_EMPRESA'
          DataSource = datm_cotacao.ds_cotacao
          ParentCtl3D = False
          TabOrder = 8
          OnChange = ChecaBotoes
          OnExit = dbedt_cd_empresaExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
          OnKeyPress = Somente_Numeros
        end
        object dbedt_cd_produto: TDBEdit
          Left = 94
          Top = 49
          Width = 24
          Height = 19
          Ctl3D = False
          DataField = 'CD_PRODUTO'
          DataSource = datm_cotacao.ds_cotacao_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          OnChange = ChecaBotoes
          OnExit = dbedt_cd_produtoExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
          OnKeyPress = Somente_Numeros
        end
        object dblkp_cd_incoterms: TDBLookupComboBox
          Left = 5
          Top = 125
          Width = 62
          Height = 19
          Ctl3D = False
          DataField = 'Look_nm_incoterm'
          DataSource = datm_cotacao.ds_cotacao_item
          ListField = 'CODIGO'
          ParentCtl3D = False
          TabOrder = 17
          OnExit = ChecaBotoes
        end
        object db_dt_status: TDBEdit
          Left = 465
          Top = 15
          Width = 72
          Height = 19
          Color = clMenu
          Ctl3D = False
          DataField = 'DT_STATUS'
          DataSource = datm_cotacao.ds_cotacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnChange = ChecaBotoes
        end
        object dbedt_cd_via_transp: TDBEdit
          Left = 401
          Top = 87
          Width = 22
          Height = 19
          Ctl3D = False
          DataField = 'CD_VIA_TRANSP'
          DataSource = datm_cotacao.ds_cotacao_item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 15
          OnChange = ChecaBotoes
          OnExit = dbedt_cd_via_transpExit
          OnKeyDown = dbedt_cd_unid_negKeyDown
          OnKeyPress = Somente_Numeros
        end
        object db_nr_cotacao: TDBEdit
          Left = 204
          Top = 16
          Width = 77
          Height = 16
          TabStop = False
          AutoSize = False
          BorderStyle = bsNone
          Color = 15791607
          Ctl3D = False
          DataField = 'NR_PROPOSTA'
          DataSource = datm_cotacao.ds_cotacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnChange = db_nr_cotacaoChange
        end
        object dbt_motivo: TDBEdit
          Left = 542
          Top = 13
          Width = 203
          Height = 21
          Color = 15791607
          DataField = 'TX_STATUS'
          DataSource = datm_cotacao.ds_cotacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = ChecaBotoes
        end
        object db_freq: TRxDBLookupCombo
          Left = 402
          Top = 125
          Width = 82
          Height = 19
          DropDownCount = 8
          Ctl3D = False
          DataField = 'TP_FREQUENCIA'
          DataSource = datm_cotacao.ds_cotacao_frete
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRICAO'
          LookupSource = datm_cotacao.ds_tp_frequencia_
          ParentCtl3D = False
          TabOrder = 20
          OnChange = db_freqChange
        end
        object db_transit: TDBEdit
          Left = 624
          Top = 125
          Width = 27
          Height = 19
          Ctl3D = False
          DataField = 'TRASMIT_TIME'
          DataSource = datm_cotacao.ds_cotacao_frete
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 22
          OnChange = ChecaBotoes
          OnKeyPress = Somente_Numeros
        end
        object pnl_Demurrage: TPanel
          Left = 678
          Top = 111
          Width = 69
          Height = 37
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 23
          Visible = False
          object Label35: TLabel
            Left = 2
            Top = 2
            Width = 61
            Height = 13
            Align = alTop
            Caption = ' Free Time'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 34
            Top = 19
            Width = 19
            Height = 13
            Caption = 'dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object db_demurrage: TDBEdit
            Left = 7
            Top = 15
            Width = 27
            Height = 17
            AutoSize = False
            Ctl3D = False
            DataField = 'NR_FREE_TIME_DEMURRAGE'
            DataSource = datm_cotacao.ds_cotacao_frete
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnChange = ChecaBotoes
            OnKeyPress = Somente_Numeros
          end
        end
        object rxcombx_tp_carga_ag: TRxDBComboBox
          Left = 280
          Top = 123
          Width = 106
          Height = 21
          Style = csDropDownList
          Ctl3D = False
          DataField = 'TP_CARGA'
          DataSource = datm_cotacao.ds_cotacao_frete
          EnableValues = True
          ItemHeight = 13
          Items.Strings = (
            'Normal'
            'Dangerous'
            'Perishablel'
            'Chemical'
            'Others'
            'All')
          ParentCtl3D = False
          TabOrder = 19
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5')
          OnChange = ChecaBotoes
        end
        object cb_semanal: TcxDBCheckComboBox
          Left = 484
          Top = 130
          DataBinding.DataField = 'TX_SEMANAL'
          DataBinding.DataSource = datm_cotacao.ds_cotacao_item
          Properties.Delimiter = ','
          Properties.EmptySelectionText = '( selecione os dias )'
          Properties.ShowEmptyText = False
          Properties.Alignment.Vert = taVCenter
          Properties.EditValueFormat = cvfStatesString
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Description = 'Seg'
            end
            item
              Description = 'Ter'
            end
            item
              Description = 'Qua'
            end
            item
              Description = 'Qui'
            end
            item
              Description = 'Sex'
            end
            item
              Description = 'Sab'
            end
            item
              Description = 'Dom'
            end>
          Properties.ValidateOnEnter = False
          Properties.OnCloseUp = ChecaBotoes
          TabOrder = 21
          Visible = False
          Width = 117
        end
        object db_dt_Solicitada: TDBDateEdit
          Left = 6
          Top = 86
          Width = 88
          Height = 21
          DataField = 'DT_SOLICITADA'
          DataSource = datm_cotacao.ds_cotacao
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 10
          YearDigits = dyFour
          OnChange = ChecaBotoes
        end
        object db_dt_Enviada: TDBDateEdit
          Left = 154
          Top = 86
          Width = 88
          Height = 21
          DataField = 'DT_ENVIADA'
          DataSource = datm_cotacao.ds_cotacao
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 12
          YearDigits = dyFour
          OnChange = ChecaBotoes
        end
        object db_hr_Solicitada: TcxDBTimeEdit
          Left = 92
          Top = 86
          DataBinding.DataField = 'HR_SOLICITADA'
          DataBinding.DataSource = datm_cotacao.ds_cotacao
          Properties.ImmediatePost = True
          Properties.TimeFormat = tfHourMin
          Properties.OnEditValueChanged = ChecaBotoes
          TabOrder = 11
          Width = 51
        end
        object db_hr_Enviada: TcxDBTimeEdit
          Left = 240
          Top = 86
          AutoSize = False
          DataBinding.DataField = 'HR_ENVIADA'
          DataBinding.DataSource = datm_cotacao.ds_cotacao
          Properties.ImmediatePost = True
          Properties.TimeFormat = tfHourMin
          Properties.OnEditValueChanged = ChecaBotoes
          TabOrder = 13
          Height = 21
          Width = 51
        end
      end
      object pgctrl_mercadorias_tarifas: TPageControl
        Left = 0
        Top = 209
        Width = 745
        Height = 392
        ActivePage = ts_mercadoria
        Align = alClient
        TabOrder = 2
        OnChange = pgctrl_mercadorias_tarifasChange
        OnChanging = pgctrl_mercadorias_tarifasChanging
        object ts_mercadoria: TTabSheet
          Caption = 'Mercadoria'
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 737
            Height = 33
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object lb_estufagem: TLabel
              Left = 9
              Top = 10
              Width = 77
              Height = 13
              Caption = 'Tipo Estufagem:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object rxcom_estufagem: TRxDBComboBox
              Left = 89
              Top = 6
              Width = 100
              Height = 21
              Style = csDropDownList
              Ctl3D = False
              DataField = 'TP_ESTUFAGEM'
              DataSource = datm_cotacao.ds_cotacao_item
              EnableValues = True
              ItemHeight = 13
              Items.Strings = (
                'LCL'
                'FCL')
              ParentCtl3D = False
              TabOrder = 0
              Values.Strings = (
                '0'
                '1')
              OnChange = rxcom_estufagemChange
              OnEnter = rxcom_estufagemEnter
            end
          end
          object nbMercadoria: TNotebook
            Left = 0
            Top = 33
            Width = 737
            Height = 281
            Align = alClient
            PageIndex = 1
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'Vazio'
              object pnlVazio: TPanel
                Left = 0
                Top = 0
                Width = 745
                Height = 291
                Align = alClient
                BevelOuter = bvNone
                Caption = 'Escolha um tipo de Estufagem antes de continuar!'
                Color = 15791607
                Font.Charset = ANSI_CHARSET
                Font.Color = 6250335
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
            object TPage
              Left = 0
              Top = 0
              HelpContext = 1
              Caption = 'Dados'
              object Label14: TLabel
                Left = 0
                Top = 0
                Width = 745
                Height = 16
                Align = alTop
                AutoSize = False
                Caption = 'Itens Embalagem'
                Color = 14548991
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object Label43: TLabel
                Left = 0
                Top = 242
                Width = 124
                Height = 13
                Align = alBottom
                Caption = 'Observa'#231#227'o ( Indai'#225' )'
                Color = 14548991
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object dbgrid_mercadoria: TDBGrid
                Left = 0
                Top = 16
                Width = 745
                Height = 226
                Align = alClient
                Ctl3D = False
                DataSource = datm_cotacao.ds_mercadoria
                Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
                ParentCtl3D = False
                PopupMenu = pop_status_containers
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnColExit = ChecaBotoes
                OnDrawColumnCell = dbgrid_mercadoriaDrawColumnCell
                OnDblClick = dbgrid_mercadoriaDblClick
                OnExit = dbgrid_mercadoriaExit
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NR_PROPOSTA'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CD_SERVICO'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CD_TAB_FRETE'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'CD_PROPOSTA_EMB_ITEM'
                    Title.Alignment = taCenter
                    Title.Caption = 'Item'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'Look_nm_cntr'
                    PickList.Strings = (
                      'BB'
                      'FCL'
                      'LCL')
                    Title.Caption = 'Contanier'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 92
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'QTD_EMBALAGEM'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Qtd Emb.'
                    Width = 51
                    Visible = True
                  end
                  item
                    Color = 13303807
                    Expanded = False
                    FieldName = 'calcEmbalagem'
                    Title.Caption = 'Embalagem'
                    Width = 99
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Color = 13303807
                    Expanded = False
                    FieldName = 'CD_NCM'
                    Title.Alignment = taCenter
                    Title.Caption = 'NCM'
                    Width = 63
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TX_MERCADORIA'
                    Title.Caption = 'Mercadoria'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 157
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'QTD_VOLUMES'
                    Title.Alignment = taCenter
                    Title.Caption = 'Qtd'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 77
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_PESO_KG'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'P Bruto (kg) Total'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 96
                    Visible = True
                  end
                  item
                    Color = 14211288
                    Expanded = False
                    FieldName = 'VL_PESO_TON'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 4210816
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Title.Alignment = taRightJustify
                    Title.Caption = 'P Bruto (ton) Total'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_PESO_KG_LIQ'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'P Liquido (kg) Total'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_COMPR'
                    Title.Alignment = taCenter
                    Title.Caption = 'Compr /Vol'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 74
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_LARGURA'
                    Title.Alignment = taCenter
                    Title.Caption = 'Largura /Vol'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 74
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_ALTURA'
                    Title.Alignment = taCenter
                    Title.Caption = 'Altura /Vol'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 74
                    Visible = True
                  end
                  item
                    Color = 14548991
                    Expanded = False
                    FieldName = 'VL_CUBAGEM_M3'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = 4210816
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Cubagem(m3) Total'
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clBlack
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = []
                    Width = 103
                    Visible = True
                  end>
              end
              object DBMemo1: TDBMemo
                Left = 0
                Top = 255
                Width = 745
                Height = 38
                Align = alBottom
                Ctl3D = False
                DataField = 'TX_OBS_INDAIA'
                DataSource = datm_cotacao.ds_cotacao
                ParentCtl3D = False
                ScrollBars = ssVertical
                TabOrder = 1
                OnChange = ChecaBotoes
              end
            end
          end
          object Panel5: TPanel
            Left = 0
            Top = 314
            Width = 737
            Height = 50
            Align = alBottom
            BevelInner = bvLowered
            TabOrder = 2
            object Label50: TLabel
              Left = 238
              Top = 9
              Width = 95
              Height = 13
              Caption = 'Cubagem Total (m3)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label25: TLabel
              Left = 121
              Top = 9
              Width = 103
              Height = 13
              Caption = 'Peso Bruto Total (ton)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label24: TLabel
              Left = 9
              Top = 9
              Width = 101
              Height = 13
              Caption = 'Peso Bruto Total (Kg)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lb_peso_cubado: TLabel
              Left = 349
              Top = 9
              Width = 64
              Height = 13
              Caption = 'Peso Cubado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object DBEdit3: TDBEdit
              Left = 11
              Top = 24
              Width = 98
              Height = 19
              Color = 15791607
              Ctl3D = False
              DataField = 'VL_PESO_KG'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEdit4: TDBEdit
              Left = 121
              Top = 24
              Width = 98
              Height = 19
              Color = 15791607
              Ctl3D = False
              DataField = 'VL_PESO_TON'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEdit5: TDBEdit
              Left = 238
              Top = 24
              Width = 98
              Height = 19
              Color = 15791607
              Ctl3D = False
              DataField = 'VL_CUBAGEM'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_vl_cubado: TDBEdit
              Left = 347
              Top = 24
              Width = 98
              Height = 19
              Color = 15791607
              Ctl3D = False
              DataField = 'VL_CUBADO'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object pnl_peso_tarifado: TPanel
              Left = 552
              Top = 5
              Width = 141
              Height = 41
              BevelInner = bvRaised
              Color = 15263976
              TabOrder = 4
              object lb_peso_tarifado: TLabel
                Left = 2
                Top = 2
                Width = 137
                Height = 16
                Align = alTop
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Chargeable Weight  '
                Color = 8404992
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
                Layout = tlCenter
              end
              object db_peso_tarifado: TDBEdit
                Left = 3
                Top = 20
                Width = 128
                Height = 15
                AutoSize = False
                BorderStyle = bsNone
                Color = 15263976
                Ctl3D = False
                DataField = 'VL_CHARGEABLE'
                DataSource = datm_cotacao.ds_cotacao_item
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentCtl3D = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
          end
        end
        object ts_tarifas_areas: TTabSheet
          Caption = 'Tarifas'
          ImageIndex = 1
          object Panel6: TPanel
            Left = 0
            Top = 0
            Width = 745
            Height = 159
            Align = alTop
            BevelInner = bvLowered
            TabOrder = 0
            object Label51: TLabel
              Left = 744
              Top = 100
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Resultado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 31
              Top = 2
              Width = 33
              Height = 13
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_origem: TSpeedButton
              Left = 339
              Top = 15
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
              OnClick = btn_co_origemClick
            end
            object Label11: TLabel
              Left = 381
              Top = 2
              Width = 36
              Height = 13
              Caption = 'Destino'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_destino: TSpeedButton
              Left = 714
              Top = 16
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
              OnClick = btn_co_destinoClick
            end
            object Label12: TLabel
              Left = 31
              Top = 35
              Width = 34
              Height = 13
              Caption = 'Agente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_agente: TSpeedButton
              Left = 339
              Top = 48
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
              OnClick = btn_co_agenteClick
            end
            object lb_cia_arm: TLabel
              Left = 381
              Top = 35
              Width = 53
              Height = 13
              Caption = 'Companhia'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_cia: TSpeedButton
              Left = 714
              Top = 49
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
              OnClick = btn_co_ciaClick
            end
            object Label18: TLabel
              Left = 31
              Top = 69
              Width = 33
              Height = 13
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_moeda: TSpeedButton
              Left = 339
              Top = 82
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
              OnClick = btn_co_moedaClick
            end
            object Label21: TLabel
              Left = 594
              Top = 101
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Compra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label26: TLabel
              Left = 679
              Top = 101
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total Venda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_armador: TSpeedButton
              Left = 715
              Top = 49
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
              OnClick = btn_co_armadorClick
            end
            object lbl1: TLabel
              Left = 381
              Top = 69
              Width = 75
              Height = 13
              Caption = 'Tabela de Frete'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btnCoFrete: TSpeedButton
              Left = 714
              Top = 82
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
              OnClick = btnCoFreteClick
            end
            object lbl2: TLabel
              Left = 6
              Top = 117
              Width = 24
              Height = 13
              Caption = 'Via 1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_via_1: TSpeedButton
              Left = 339
              Top = 113
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
              OnClick = btn_via_1Click
            end
            object Label40: TLabel
              Left = 6
              Top = 140
              Width = 24
              Height = 13
              Caption = 'Via 2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_via_2: TSpeedButton
              Left = 339
              Top = 136
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
              OnClick = btn_via_2Click
            end
            object Label41: TLabel
              Left = 527
              Top = 101
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor FOB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label42: TLabel
              Left = 381
              Top = 101
              Width = 57
              Height = 13
              Caption = 'Moeda FOB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object btn_co_moeda_fob: TSpeedButton
              Left = 488
              Top = 114
              Width = 18
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
              OnClick = btn_co_moeda_fobClick
            end
            object DBEdit1: TDBEdit
              Left = 744
              Top = 113
              Width = 74
              Height = 19
              Color = 14211288
              Ctl3D = False
              DataField = 'VL_RESULTADO'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 25
            end
            object dbedt_cd_cia: TDBEdit
              Left = 381
              Top = 48
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_CIA_TRANSP'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 7
              OnChange = dbedt_cd_origemChange
              OnExit = dbedt_cd_ciaExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object dbedt_nm_origem: TDBEdit
              Left = 73
              Top = 14
              Width = 264
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_ORIGEM'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_nm_destino: TDBEdit
              Left = 422
              Top = 15
              Width = 291
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_DESTINO'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_nm_agente: TDBEdit
              Left = 73
              Top = 48
              Width = 264
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_AGENTE'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_nm_cia: TDBEdit
              Left = 422
              Top = 49
              Width = 291
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_CIA_TRANSP'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
            end
            object dbedt_nm_moeda: TDBEdit
              Left = 73
              Top = 81
              Width = 264
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_MOEDA'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
            object dbedt_vl_compra: TDBEdit
              Left = 583
              Top = 113
              Width = 74
              Height = 19
              Color = 14211288
              Ctl3D = False
              DataField = 'VL_CUSTO'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 20
            end
            object dbedt_nm_armador: TDBEdit
              Left = 422
              Top = 49
              Width = 291
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_ARMADOR'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
            end
            object dbedt_cd_destino: TDBEdit
              Left = 381
              Top = 15
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_DESTINO'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnChange = dbedt_cd_origemChange
              OnExit = dbedt_cd_destinoExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object dbedt_cd_armador: TDBEdit
              Left = 381
              Top = 49
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_ARMADOR'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 6
              OnChange = dbedt_cd_origemChange
              OnExit = dbedt_cd_armadorExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
            end
            object dbedt_vl_venda: TDBEdit
              Left = 663
              Top = 113
              Width = 74
              Height = 19
              Color = 14211288
              Ctl3D = False
              DataField = 'VL_VENDA'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 21
            end
            object dbedtNmFrete: TDBEdit
              Left = 423
              Top = 81
              Width = 290
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_TAB_FRETE'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 13
            end
            object dbedtCdFrete: TDBEdit
              Left = 381
              Top = 81
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_TAB_FRETE'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 12
              OnChange = dbedt_cd_origemChange
              OnExit = dbedtCdFreteExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object dbedt_cd_moeda: TDBEdit
              Left = 31
              Top = 81
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_MOEDA'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 10
              OnChange = dbedt_cd_origemChange
              OnExit = dbedt_cd_moedaExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object dbedt_cd_agente: TDBEdit
              Left = 31
              Top = 48
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_AGENTE'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 4
              OnChange = dbedt_cd_origemChange
              OnExit = dbedt_cd_agenteExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object dbedt_cd_origem: TDBEdit
              Left = 31
              Top = 14
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_ORIGEM'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnChange = dbedt_cd_origemChange
              OnExit = dbedt_cd_origemExit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object db_via_1: TDBEdit
              Left = 31
              Top = 113
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_PORTO_TRANSBORDO'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 14
              OnChange = ChecaBotoes
              OnExit = db_via_1Exit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object db_nm_via_1: TDBEdit
              Left = 72
              Top = 113
              Width = 265
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_TRANSBORDO'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 15
            end
            object db_via_2: TDBEdit
              Left = 31
              Top = 136
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_PORTO_TRANSBORDO_2'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 16
              OnChange = ChecaBotoes
              OnExit = db_via_2Exit
              OnKeyDown = dbedt_cd_unid_negKeyDown
              OnKeyPress = Somente_Numeros
            end
            object db_nm_via_2: TDBEdit
              Left = 72
              Top = 136
              Width = 265
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_TRANSBORDO_2'
              DataSource = datm_cotacao.ds_cotacao_frete
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 17
            end
            object dbt_vl_fob: TDBEdit
              Left = 511
              Top = 113
              Width = 64
              Height = 19
              Color = clWhite
              Ctl3D = False
              DataField = 'VL_FOB'
              DataSource = datm_cotacao.ds_cotacao_item
              ParentCtl3D = False
              TabOrder = 19
              OnChange = ChecaBotoes
            end
            object db_cd_moeda_fob: TDBEdit
              Left = 381
              Top = 113
              Width = 40
              Height = 19
              Ctl3D = False
              DataField = 'CD_MOEDA_FOB'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 18
              OnChange = ChecaBotoes
              OnExit = db_cd_moeda_fobExit
              OnKeyPress = Somente_Numeros
            end
            object tx_nm_moeda_fob: TDBEdit
              Left = 422
              Top = 113
              Width = 66
              Height = 19
              TabStop = False
              Color = clMenu
              Ctl3D = False
              DataField = 'NM_MOEDA_FOB'
              DataSource = datm_cotacao.ds_cotacao_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 22
            end
            object BitBtn1: TBitBtn
              Left = 590
              Top = 134
              Width = 148
              Height = 23
              Cursor = crHandPoint
              Caption = 'Exibir Resultado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 23
              OnClick = BitBtn1Click
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFA87D78B78183B78183B78183B78183B78183B781
                83B78183B78183B78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAB7F79FF
                FCDCFBE6C4FAE2B9F7DCACF6D7A1F4D499F4D499FDDF9DB3897BFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFAF8279FFF6E2F5E2CAF5DEC0F2D8B5047009EFCE
                A0EDCB98F6D59AB3897BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3867AFF
                FCEEF7E7D3F6E3C904700944D273047009EFCF9EF6D699B3897BFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFB88A7BFFFFFAF9EBDE04700949CC725CE78E38C6
                58047009F7D9A1B3897BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE8E7CFF
                FFFF0470091097262EA8483ECA6026AF3D199F29047009B3897BFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFC4937DFFFFFFFDF9F5FBF2EA03700827B8400470
                09F5DDBEFCE4BAB3897B93460F93460F93460F93460F93460F93460F93460F93
                460F93460FFEF9F5097B1114AB25047009FCECD1F2E4C3B3897B93460F2BF9FF
                33EFFF31EEFF2CF1FF2DF1FF2DF3FF26FFFF93460F0A88120C91160EA31B0470
                09D7B9A9BEA49CB5858793460F47EBF841E0F551DBE972CBC58FB79C8FAF8F04
                70090470090490120D9C1907800FE3CFCABB846FE2A15AB3817693460FE1D4A9
                D4BD8FDEAC70EC9949EA882FE47B19D9751293460FFFFFFFFFFFFFFFFFFFE1D2
                D4B38176E7AF76FF00FF93460FFFCA8FFFB06EFBA45DE99847DF8A35D87E21D8
                6F0693460FDAA482DAA482DAA482DAA482B38176FF00FFFF00FF93460F79C26B
                66AC4B799B3CE59C51E29141D9842DD77A1993460FFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF93460F26D96608B33167BB6EFAE7DBFAE6D6F6E4D1F9
                E7D593460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93460F43D777
                A0DCAFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF93460FFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF93460F93460F93460F93460F93460F93460F93460F93
                460F93460FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Spacing = 8
            end
            object pnl_profit: TPanel
              Left = 2
              Top = -13
              Width = 741
              Height = 48
              Color = clSilver
              TabOrder = 24
              Visible = False
              DesignSize = (
                741
                48)
              object dbg_Profit: TDBGrid
                Left = 9
                Top = 7
                Width = 724
                Height = 4
                Anchors = [akLeft, akTop, akRight, akBottom]
                Ctl3D = False
                DataSource = datm_cotacao.dsResumoProfit
                Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentCtl3D = False
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnExit = dbg_ProfitExit
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'Moeda'
                    Title.Alignment = taCenter
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 146
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Total_Venda'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Total Venda'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 135
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Total_Compra'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Total Compra'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 135
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Total_Geral'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Resultado Geral'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 141
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Total_Indaia'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Resultado Indaia'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 141
                    Visible = True
                  end>
              end
              object Button1: TButton
                Left = 604
                Top = 17
                Width = 123
                Height = 25
                Cursor = crHandPoint
                Anchors = [akRight, akBottom]
                Caption = 'Ocultar Resultado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Times New Roman'
                Font.Style = [fsItalic]
                ParentFont = False
                TabOrder = 0
                OnClick = Button1Click
              end
            end
          end
          object nbEstufagem: TNotebook
            Left = 0
            Top = 159
            Width = 737
            Height = 205
            Align = alClient
            PageIndex = 1
            TabOrder = 1
            object TPage
              Left = 0
              Top = 0
              Caption = 'FCL'
              object pnl_fcl: TPanel
                Left = 0
                Top = 0
                Width = 745
                Height = 217
                Align = alClient
                TabOrder = 0
                object Label5: TLabel
                  Left = 1
                  Top = 96
                  Width = 743
                  Height = 18
                  Align = alTop
                  AutoSize = False
                  Caption = 'Taxas'
                  Color = 14548991
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Layout = tlCenter
                end
                object dbg_containers: TDBGrid
                  Left = 1
                  Top = 1
                  Width = 743
                  Height = 95
                  Align = alTop
                  Ctl3D = False
                  DataSource = datm_cotacao.ds_mercadoria
                  FixedColor = clMenu
                  ParentColor = True
                  ParentCtl3D = False
                  PopupMenu = pop_status_containers
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDrawColumnCell = dbg_containersDrawColumnCell
                  OnKeyDown = dbg_containersKeyDown
                  Columns = <
                    item
                      Alignment = taCenter
                      Color = 14211288
                      Expanded = False
                      FieldName = 'TP_CNTR'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'C'#243'd.'
                      Title.Color = 6974058
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 46
                      Visible = True
                    end
                    item
                      Color = 14211288
                      Expanded = False
                      FieldName = 'Look_nm_cntr'
                      ReadOnly = True
                      Title.Caption = 'Contanier'
                      Title.Color = 6974058
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 172
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Color = 14211288
                      Expanded = False
                      FieldName = 'QTD_VOLUMES'
                      ReadOnly = True
                      Title.Alignment = taCenter
                      Title.Caption = 'Qtd'
                      Title.Color = 6974058
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 73
                      Visible = True
                    end
                    item
                      Color = 14211288
                      Expanded = False
                      FieldName = 'VL_PESO_TON'
                      ReadOnly = True
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Peso (Ton)'
                      Title.Color = 6974058
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 122
                      Visible = True
                    end
                    item
                      Color = clWhite
                      Expanded = False
                      FieldName = 'VL_CUSTO'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Unit'#225'rio Custo'
                      Title.Color = 6974058
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 137
                      Visible = True
                    end
                    item
                      Color = clWhite
                      Expanded = False
                      FieldName = 'VL_VENDA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Unit'#225'rio Venda'
                      Title.Color = 6974058
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 142
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VL_COMPRA_TOTAL'
                      ReadOnly = True
                      Title.Alignment = taRightJustify
                      Title.Caption = 'COMPRA TOTAL'
                      Title.Color = 6250335
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 136
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VL_VENDA_TOTAL'
                      ReadOnly = True
                      Title.Alignment = taRightJustify
                      Title.Caption = 'VENDA TOTAL'
                      Title.Color = 6250335
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 130
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VL_RESULTADO'
                      ReadOnly = True
                      Title.Alignment = taRightJustify
                      Title.Caption = 'RESULTADO'
                      Title.Color = 6250335
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clWhite
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = [fsBold]
                      Width = 117
                      Visible = True
                    end>
                end
                object dbgrid_maritimo: TDBGrid
                  Left = 1
                  Top = 114
                  Width = 743
                  Height = 102
                  Hint = 
                    '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
                    's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
                  Align = alClient
                  Ctl3D = False
                  DataSource = datm_cotacao.ds_cotacao_despesa
                  ParentCtl3D = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnColExit = Consiste_grid_taxas
                  OnDblClick = Consulta_Online_Despesas
                  Columns = <
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'CD_ITEM'
                      Title.Caption = 'C'#243'd.*'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 16776176
                      Expanded = False
                      FieldName = 'calcItem'
                      Title.Caption = 'Descri'#231#227'o'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 168
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'CD_MOEDA'
                      Title.Caption = 'C'#243'd.*'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 16776176
                      Expanded = False
                      FieldName = 'calcMoeda'
                      Title.Caption = 'Moeda'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 49
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_tp_calc'
                      Title.Caption = 'Tipo Base'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 97
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_INTERVALO_INICIAL'
                      Title.Caption = 'intervalo Inicial'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_INTERVALO_FINAL'
                      Title.Caption = 'Intervalo Final'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_despesa_por'
                      Title.Caption = 'Origem'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 119
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_BASE_AG'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Compra'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 66
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_MINIMO_COMPRA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Minimo'
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_COMPRA_CIA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Companhia'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_BASE_DESPESA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Base'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_VENDA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Venda*'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 71
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_MINIMO'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Minimo'
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_mencionado'
                      Title.Alignment = taCenter
                      Title.Caption = 'Mencionado no House/Awb'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 142
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_origem_custo'
                      Title.Caption = 'Origem Custo'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Alignment = taCenter
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_in_profit'
                      Title.Alignment = taCenter
                      Title.Caption = 'Profit'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 48
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_COMPRA_TOTAL'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Total Compra'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_VENDA_TOTAL'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Venda Total'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_RESULTADO'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Resultado'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end>
                end
              end
            end
            object TPage
              Left = 0
              Top = 0
              HelpContext = 1
              Caption = 'LCL'
              object pnl_lcl: TPanel
                Left = 0
                Top = 0
                Width = 745
                Height = 217
                Align = alClient
                Caption = 'pnl_lcl'
                TabOrder = 0
                object Label16: TLabel
                  Left = 1
                  Top = 38
                  Width = 743
                  Height = 18
                  Align = alTop
                  AutoSize = False
                  Caption = 'Taxas'
                  Color = 14548991
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlue
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Layout = tlCenter
                end
                object pnl_valores_unitarios_lcl: TPanel
                  Left = 1
                  Top = 1
                  Width = 743
                  Height = 37
                  Align = alTop
                  Color = 14211288
                  TabOrder = 1
                  object Label38: TLabel
                    Left = 293
                    Top = 2
                    Width = 117
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor Unit'#225'rio de Compra'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object Label39: TLabel
                    Left = 473
                    Top = 2
                    Width = 112
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Valor Unit'#225'rio de Venda'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                  end
                  object DBEdit8: TDBEdit
                    Left = 246
                    Top = 15
                    Width = 164
                    Height = 19
                    Color = clWhite
                    Ctl3D = False
                    DataField = 'VL_CUSTO_UNIT_LCL'
                    DataSource = datm_cotacao.ds_cotacao_item
                    ParentCtl3D = False
                    TabOrder = 0
                    OnExit = ChecaBotoes
                  end
                  object DBEdit9: TDBEdit
                    Left = 421
                    Top = 15
                    Width = 164
                    Height = 19
                    Color = clWhite
                    Ctl3D = False
                    DataField = 'VL_VENDA_UNIT_LCL'
                    DataSource = datm_cotacao.ds_cotacao_item
                    ParentCtl3D = False
                    TabOrder = 1
                    OnExit = ChecaBotoes
                  end
                  object Panel1: TPanel
                    Left = 38
                    Top = 1
                    Width = 141
                    Height = 34
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 15263976
                    TabOrder = 2
                    object lb_peso_tarifado_tarifas: TLabel
                      Left = 1
                      Top = 1
                      Width = 139
                      Height = 16
                      Align = alTop
                      Alignment = taRightJustify
                      AutoSize = False
                      Caption = 'Chargeable Weight  '
                      Color = 8404992
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWhite
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentColor = False
                      ParentFont = False
                      Layout = tlCenter
                    end
                    object DBEdit7: TDBEdit
                      Left = 3
                      Top = 18
                      Width = 128
                      Height = 13
                      AutoSize = False
                      BorderStyle = bsNone
                      Color = 15263976
                      Ctl3D = False
                      DataField = 'VL_CHARGEABLE'
                      DataSource = datm_cotacao.ds_cotacao_item
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clRed
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentCtl3D = False
                      ParentFont = False
                      ReadOnly = True
                      TabOrder = 0
                    end
                  end
                  object cb_IN_FIXO: TDBCheckBox
                    Left = 599
                    Top = 15
                    Width = 81
                    Height = 17
                    Caption = 'Valor Fixo'
                    DataField = 'IN_FIXO'
                    DataSource = datm_cotacao.ds_cotacao_item
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                    TabOrder = 3
                    ValueChecked = '1'
                    ValueUnchecked = '0'
                    OnClick = ChecaBotoes
                  end
                end
                object dbgrid_despesa_aerea: TDBGrid
                  Left = 1
                  Top = 56
                  Width = 743
                  Height = 160
                  Hint = 
                    '*Campos em amarelo s'#227'o edit'#225'veis'#13#10'*Campos em Azul abrem consulta' +
                    's OnLine'#13#10'*Ctrl + Delete exclui registro selecionado'
                  Align = alClient
                  DataSource = datm_cotacao.ds_cotacao_despesa
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnColExit = ChecaBotoes
                  OnDblClick = Consulta_Online_Despesas
                  OnKeyPress = dbgrid_despesa_aereaKeyPress
                  Columns = <
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'CD_ITEM'
                      Title.Caption = 'C'#243'd.*'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 31
                      Visible = True
                    end
                    item
                      Color = 16776176
                      Expanded = False
                      FieldName = 'calcItem'
                      Title.Caption = 'Descri'#231#227'o'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 180
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'CD_MOEDA'
                      Title.Caption = 'C'#243'd.*'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 16776176
                      Expanded = False
                      FieldName = 'calcMoeda'
                      Title.Caption = 'Moeda'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 51
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_tp_calc'
                      Title.Caption = 'Tipo Base'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 121
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_INTERVALO_INICIAL'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'intervalo Inicial'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_INTERVALO_FINAL'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Intervalo Final'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_despesa_por'
                      Title.Caption = 'Origem'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 106
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_BASE_AG'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Agente'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 74
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_MINIMO_COMPRA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Minimo'
                      Width = 62
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_COMPRA_CIA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Companhia'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_BASE_DESPESA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Valor Base'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = False
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_VENDA'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Venda'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 67
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_MINIMO'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Minimo'
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_nm_mencionado'
                      Title.Alignment = taCenter
                      Title.Caption = 'Mencionado no House/Awb'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Width = 172
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Color = 13303807
                      Expanded = False
                      FieldName = 'Look_in_profit'
                      Title.Alignment = taCenter
                      Title.Caption = 'Profit'
                      Width = 44
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_COMPRA_TOTAL'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Total Compra'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_VENDA_TOTAL'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Total Venda'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end
                    item
                      Color = 13303807
                      Expanded = False
                      FieldName = 'VL_RESULTADO'
                      Title.Alignment = taRightJustify
                      Title.Caption = 'Resultado'
                      Title.Font.Charset = DEFAULT_CHARSET
                      Title.Font.Color = clBlack
                      Title.Font.Height = -11
                      Title.Font.Name = 'MS Sans Serif'
                      Title.Font.Style = []
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 448
    Top = 24
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object mi_buscar_tarifa: TMenuItem
      Caption = 'Buscar Tarifa'
      OnClick = btn_busca_tarifasClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = datm_cotacao.ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 15000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\FI_COTACAO_I_FCL_PROFIT.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 532
    Top = 32
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 391320
      mmPrintPosition = 0
      object ppRegion3: TppRegion
        UserName = 'Region3'
        Brush.Style = bsClear
        Caption = 'Region3'
        ParentWidth = True
        ShiftRelativeTo = ppSubReport6
        Stretch = True
        Transparent = True
        mmHeight = 32279
        mmLeft = 0
        mmTop = 260351
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape21: TppShape
          UserName = 'Shape21'
          Brush.Color = clSilver
          Pen.Color = clGray
          Pen.Style = psClear
          StretchWithParent = True
          mmHeight = 23019
          mmLeft = 1323
          mmTop = 266966
          mmWidth = 178065
          BandType = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'REMARKS'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 23548
          mmLeft = 1058
          mmTop = 266966
          mmWidth = 178330
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppShape20: TppShape
          UserName = 'Shape20'
          Brush.Color = 16742726
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 1058
          mmTop = 262203
          mmWidth = 178330
          BandType = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'REMARKS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3471
          mmLeft = 1058
          mmTop = 262732
          mmWidth = 178330
          BandType = 0
        end
      end
      object ppShape62: TppShape
        UserName = 'Shape62'
        Brush.Style = bsClear
        Pen.Color = clNavy
        mmHeight = 17463
        mmLeft = 5027
        mmTop = 18256
        mmWidth = 174890
        BandType = 0
      end
      object ppRegion1: TppRegion
        UserName = 'Region1'
        Brush.Style = bsClear
        Caption = 'Region1'
        ParentWidth = True
        Pen.Style = psClear
        Stretch = True
        Transparent = True
        mmHeight = 24606
        mmLeft = 0
        mmTop = 100277
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape70: TppShape
          UserName = 'Shape70'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 118534
          mmWidth = 54504
          BandType = 0
        end
        object ppDBText62: TppDBText
          UserName = 'DBText62'
          DataField = 'FREE_TIME'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 40217
          mmTop = 118534
          mmWidth = 53975
          BandType = 0
        end
        object ppShape29: TppShape
          UserName = 'Shape29'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 123825
          mmTop = 106627
          mmWidth = 56621
          BandType = 0
        end
        object ppShape28: TppShape
          UserName = 'Shape28'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 123825
          mmTop = 110596
          mmWidth = 56621
          BandType = 0
        end
        object ppShape30: TppShape
          UserName = 'Shape30'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3440
          mmLeft = 123825
          mmTop = 114300
          mmWidth = 56621
          BandType = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText34'
          DataField = 'Rota'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 124354
          mmTop = 114300
          mmWidth = 56092
          BandType = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'LOCAL_DESTINO'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 124354
          mmTop = 110596
          mmWidth = 56092
          BandType = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'LOCAL_ORIGEM'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 124354
          mmTop = 106363
          mmWidth = 56092
          BandType = 0
        end
        object ppShape33: TppShape
          UserName = 'Shape33'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 114300
          mmWidth = 54504
          BandType = 0
        end
        object ppShape31: TppShape
          UserName = 'Shape31'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 110331
          mmWidth = 54504
          BandType = 0
        end
        object ppShape32: TppShape
          UserName = 'Shape32'
          Brush.Color = 15263976
          Pen.Color = clGray
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 106363
          mmWidth = 54504
          BandType = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText301'
          DataField = 'NR_TRANSIT_TIME'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 40217
          mmTop = 114300
          mmWidth = 53975
          BandType = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'NR_FRQUENCIA'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 40217
          mmTop = 110331
          mmWidth = 53975
          BandType = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText26'
          DataField = 'calc_servico'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3471
          mmLeft = 40217
          mmTop = 106627
          mmWidth = 53975
          BandType = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'FREQUENCIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 5027
          mmTop = 110331
          mmWidth = 34660
          BandType = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'TRANSIT TIME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 5027
          mmTop = 114300
          mmWidth = 34660
          BandType = 0
        end
        object pp_lbl_origem: TppLabel
          UserName = 'lbl_origem'
          AutoSize = False
          Caption = 'PORT OF LOADING'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 94986
          mmTop = 106363
          mmWidth = 28046
          BandType = 0
        end
        object pp_lbl_destino: TppLabel
          UserName = 'lbl_destino'
          AutoSize = False
          Caption = 'PORT OF DISCHARGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 94986
          mmTop = 110331
          mmWidth = 28046
          BandType = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          AutoSize = False
          Caption = 'SERVICE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 5027
          mmTop = 106627
          mmWidth = 34660
          BandType = 0
        end
        object ppShape19: TppShape
          UserName = 'Shape19'
          Brush.Color = 16742726
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 4763
          mmTop = 100277
          mmWidth = 175419
          BandType = 0
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'SHIPMENT INFORMATION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3471
          mmLeft = 5292
          mmTop = 100806
          mmWidth = 174890
          BandType = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = 'ROUTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 94986
          mmTop = 114300
          mmWidth = 28046
          BandType = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label30'
          AutoSize = False
          Caption = 'FREE TIME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3471
          mmLeft = 5027
          mmTop = 118534
          mmWidth = 34660
          BandType = 0
        end
      end
      object ppTpCntr: TppSubReport
        UserName = 'SubFreteCont'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ShiftRelativeTo = ppRegion1
        TraverseAllData = False
        DataPipelineName = 'ppDBPipeline4'
        mmHeight = 16669
        mmLeft = 0
        mmTop = 125942
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          AutoStop = False
          DataPipeline = datm_cotacao.ppDBPipeline4
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 15000
          PrinterSetup.mmMarginRight = 15000
          PrinterSetup.mmMarginTop = 5000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipeline4'
          object ppTitleBand8: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppShape27: TppShape
              UserName = 'Shape27'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3175
              mmLeft = 70379
              mmTop = 4233
              mmWidth = 18785
              BandType = 1
            end
            object ppDBText50: TppDBText
              UserName = 'DBText50'
              DataField = 'CD_INCOTERM'
              DataPipeline = datm_cotacao.ppDBPipeline1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline1'
              mmHeight = 3471
              mmLeft = 71438
              mmTop = 4202
              mmWidth = 17198
              BandType = 1
            end
            object ppShape57: TppShape
              UserName = 'Shape57'
              Brush.Color = 16742726
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 5292
              mmTop = 0
              mmWidth = 175419
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              AutoSize = False
              Caption = 'FREIGHT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3471
              mmLeft = 5292
              mmTop = 265
              mmWidth = 174361
              BandType = 1
            end
            object ppLabel68: TppLabel
              UserName = 'Label302'
              AutoSize = False
              Caption = 'CURRENCY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clSilver
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3471
              mmLeft = 93927
              mmTop = 3969
              mmWidth = 14023
              BandType = 1
            end
            object ppLabel69: TppLabel
              UserName = 'Label69'
              AutoSize = False
              Caption = 'SELLING'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clSilver
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3471
              mmLeft = 138642
              mmTop = 3969
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel70: TppLabel
              UserName = 'Label70'
              AutoSize = False
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clSilver
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3471
              mmLeft = 152929
              mmTop = 3969
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              AutoSize = False
              Caption = 'INCOTERMS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3471
              mmLeft = 53446
              mmTop = 3969
              mmWidth = 16140
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              AutoSize = False
              Caption = 'BUYING'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clSilver
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3471
              mmLeft = 110067
              mmTop = 3969
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel66: TppLabel
              UserName = 'Label66'
              AutoSize = False
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clSilver
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3471
              mmLeft = 124354
              mmTop = 3969
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel71: TppLabel
              UserName = 'Label701'
              AutoSize = False
              Caption = 'PROFIT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clSilver
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3471
              mmLeft = 167746
              mmTop = 3969
              mmWidth = 11113
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppShape92: TppShape
              UserName = 'Shape92'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 166952
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape91: TppShape
              UserName = 'Shape91'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 152665
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape90: TppShape
              UserName = 'Shape90'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 138377
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape89: TppShape
              UserName = 'Shape89'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 124090
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape88: TppShape
              UserName = 'Shape88'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 109802
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape87: TppShape
              UserName = 'Shape801'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 95515
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText57: TppDBText
              UserName = 'DBText57'
              DataField = 'VL_PROFIT'
              DataPipeline = datm_cotacao.ppDBPipeline4
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 167746
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText56: TppDBText
              UserName = 'DBText56'
              DataField = 'VL_TOTAL'
              DataPipeline = datm_cotacao.ppDBPipeline4
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 152929
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'VL_VENDA'
              DataPipeline = datm_cotacao.ppDBPipeline4
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 138642
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'VL_TOTAL_COMPRA'
              DataPipeline = datm_cotacao.ppDBPipeline4
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 124354
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'VL_COMPRA'
              DataPipeline = datm_cotacao.ppDBPipeline4
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 110067
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText48: TppDBText
              UserName = 'DBText29'
              DataField = 'QTD_VOLUMES'
              DataPipeline = datm_cotacao.ppDBPipeline4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 19579
              mmTop = 0
              mmWidth = 6085
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'DBText17'
              DataField = 'AP_MOEDA'
              DataPipeline = datm_cotacao.ppDBPipeline4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 95779
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText47: TppDBText
              UserName = 'DBText18'
              DataField = 'NM_ITEM'
              DataPipeline = datm_cotacao.ppDBPipeline4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsItalic]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipeline4'
              mmHeight = 3471
              mmLeft = 26723
              mmTop = 0
              mmWidth = 66675
              BandType = 4
            end
            object ppDBText91: TppDBText
              UserName = 'DBText91'
              DataField = 'Profit'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3683
              mmLeft = 179652
              mmTop = 0
              mmWidth = 9790
              BandType = 4
            end
          end
          object ppSummaryBand8: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 20373
            mmPrintPosition = 0
            object ppSubReport9: TppSubReport
              UserName = 'SubTotFrete'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ShiftRelativeTo = ppSubReport10
              TraverseAllData = False
              DataPipelineName = 'ppDB_PROFIT_Total_frete_FCL'
              mmHeight = 14023
              mmLeft = 0
              mmTop = 5821
              mmWidth = 180000
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport11: TppChildReport
                AutoStop = False
                DataPipeline = datm_cotacao.ppDB_PROFIT_Total_frete_FCL
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 5000
                PrinterSetup.mmMarginLeft = 15000
                PrinterSetup.mmMarginRight = 15000
                PrinterSetup.mmMarginTop = 5000
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Units = utMillimeters
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppDB_PROFIT_Total_frete_FCL'
                object ppTitleBand11: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 3440
                  mmPrintPosition = 0
                  object ppLabel1: TppLabel
                    UserName = 'Label301'
                    AutoSize = False
                    Caption = 'TOTAL FREIGHT'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3471
                    mmLeft = 95515
                    mmTop = 0
                    mmWidth = 27781
                    BandType = 1
                  end
                end
                object ppDetailBand12: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 3440
                  mmPrintPosition = 0
                  object ppShape86: TppShape
                    UserName = 'Shape86'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 166952
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape85: TppShape
                    UserName = 'Shape85'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 152665
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape84: TppShape
                    UserName = 'Shape84'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 138377
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape80: TppShape
                    UserName = 'Shape80'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 95515
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppDBText53: TppDBText
                    UserName = 'DBText53'
                    DataField = 'AP_MOEDA'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_Total_frete_FCL
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_Total_frete_FCL'
                    mmHeight = 3471
                    mmLeft = 95779
                    mmTop = 0
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText54: TppDBText
                    UserName = 'DBText54'
                    DataField = 'total_VENDA'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_Total_frete_FCL
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_Total_frete_FCL'
                    mmHeight = 3471
                    mmLeft = 138642
                    mmTop = 0
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppDBVL_TOT_LIQ: TppDBText
                    UserName = 'DBVL_TOT_LIQ'
                    DataField = 'VL_PROFIT'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_Total_frete_FCL
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_Total_frete_FCL'
                    mmHeight = 3471
                    mmLeft = 167746
                    mmTop = 0
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppDBText67: TppDBText
                    UserName = 'DBText67'
                    DataField = 'total_VENDA_GERAL'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_Total_frete_FCL
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_Total_frete_FCL'
                    mmHeight = 3471
                    mmLeft = 152929
                    mmTop = 0
                    mmWidth = 11113
                    BandType = 4
                  end
                end
                object ppSummaryBand11: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
            object ppSubReport10: TppSubReport
              UserName = 'SubReport4'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ParentPrinterSetup = False
              TraverseAllData = False
              DataPipelineName = 'ppDB_PROFIT_A'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 265
              mmWidth = 180000
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport12: TppChildReport
                AutoStop = False
                DataPipeline = datm_cotacao.ppDB_PROFIT_A
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 5000
                PrinterSetup.mmMarginLeft = 15000
                PrinterSetup.mmMarginRight = 15000
                PrinterSetup.mmMarginTop = 5000
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Units = utMillimeters
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppDB_PROFIT_A'
                object ppTitleBand12: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppShape83: TppShape
                    UserName = 'Shape83'
                    Brush.Color = 16762544
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 20108
                    mmTop = 0
                    mmWidth = 160073
                    BandType = 1
                  end
                  object ppLabel2: TppLabel
                    UserName = 'Label63'
                    Caption = 'FREIGHT FEES'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWhite
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3471
                    mmLeft = 20638
                    mmTop = 0
                    mmWidth = 16171
                    BandType = 1
                  end
                end
                object ppDetailBand13: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 3704
                  mmPrintPosition = 0
                  object ppShape79: TppShape
                    UserName = 'Shape79'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 166952
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape78: TppShape
                    UserName = 'Shape78'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 152665
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape77: TppShape
                    UserName = 'Shape77'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 138377
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape75: TppShape
                    UserName = 'Shape75'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 124090
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape74: TppShape
                    UserName = 'Shape74'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 109802
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape73: TppShape
                    UserName = 'Shape73'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 95515
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppDBText74: TppDBText
                    UserName = 'DBText74'
                    DataField = 'VL_VENDA'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    DisplayFormat = '#0.,00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 138642
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText77: TppDBText
                    UserName = 'DBText77'
                    DataField = 'NM_BASE_CALC'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 75406
                    mmTop = 265
                    mmWidth = 16933
                    BandType = 4
                  end
                  object ppDBText75: TppDBText
                    UserName = 'DBText75'
                    DataField = 'NM_ITEM'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3429
                    mmLeft = 19844
                    mmTop = 265
                    mmWidth = 53446
                    BandType = 4
                  end
                  object ppDBText76: TppDBText
                    UserName = 'DBText76'
                    DataField = 'AP_MOEDA'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 95779
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText78: TppDBText
                    UserName = 'DBText78'
                    DataField = 'VL_VENDA_TOTAL'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    DisplayFormat = '#0.,00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 152929
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText64: TppDBText
                    UserName = 'DBText64'
                    DataField = 'VL_COMPRA_TOTAL'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    DisplayFormat = '#0.,00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 124354
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText65: TppDBText
                    UserName = 'DBText65'
                    DataField = 'VL_COMPRA'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    DisplayFormat = '#0.,00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 110067
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText66: TppDBText
                    UserName = 'DBText66'
                    DataField = 'VL_PROFIT'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    DisplayFormat = '#0.,00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3471
                    mmLeft = 167746
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText84: TppDBText
                    UserName = 'DBText84'
                    DataField = 'Profit'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clRed
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3175
                    mmLeft = 179388
                    mmTop = 265
                    mmWidth = 10319
                    BandType = 4
                  end
                  object ppDBText92: TppDBText
                    UserName = 'DBText32'
                    DataField = 'TX_PC'
                    DataPipeline = datm_cotacao.ppDB_PROFIT_A
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDB_PROFIT_A'
                    mmHeight = 3471
                    mmLeft = 139436
                    mmTop = 265
                    mmWidth = 2646
                    BandType = 4
                  end
                end
                object ppSummaryBand12: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
          object raCodeModule5: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppShape63: TppShape
        UserName = 'Shape63'
        Brush.Color = 16598272
        Pen.Style = psClear
        mmHeight = 5821
        mmLeft = 5027
        mmTop = 18521
        mmWidth = 174890
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = 'IMPORT  QUOTATION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 5292
        mmTop = 19579
        mmWidth = 174625
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape16'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 67733
        mmWidth = 56356
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape15'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 124090
        mmTop = 63500
        mmWidth = 56356
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape14'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 124090
        mmTop = 59796
        mmWidth = 56356
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 124090
        mmTop = 55563
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'EMAIL_UNID'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124354
        mmTop = 67733
        mmWidth = 56092
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'FAX_UNID'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124354
        mmTop = 63765
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FONE_UNID'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124354
        mmTop = 59796
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'END_UNID_NEG2'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124090
        mmTop = 55563
        mmWidth = 56092
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 67733
        mmWidth = 54504
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 39688
        mmTop = 63500
        mmWidth = 54504
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 39688
        mmTop = 59796
        mmWidth = 54504
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'EMAIL_CLIENTE'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 67733
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'FAX_EMPRESA'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 63765
        mmWidth = 54240
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'FONE_EMPRESA'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 59796
        mmWidth = 54240
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 39688
        mmTop = 55563
        mmWidth = 54504
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'END_EMPRESA2'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 55563
        mmWidth = 54240
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 40481
        mmWidth = 54504
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NM_EMPRESA'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 40481
        mmWidth = 54240
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 44450
        mmWidth = 54504
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NM_CONTATO'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 44186
        mmWidth = 54240
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape11'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 44450
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'NM_USUARIO'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124090
        mmTop = 44186
        mmWidth = 56092
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 40481
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NM_UNID_NEG'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124090
        mmTop = 40481
        mmWidth = 56092
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape12'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 6879
        mmLeft = 124090
        mmTop = 48419
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'END_UNID_NEG'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6879
        mmLeft = 124090
        mmTop = 48419
        mmWidth = 56092
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 6879
        mmLeft = 39688
        mmTop = 48419
        mmWidth = 54504
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        CharWrap = True
        DataField = 'END_EMPRESA'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6879
        mmLeft = 39952
        mmTop = 48419
        mmWidth = 54240
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 123825
        mmTop = 25135
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NR_PROPOSTA'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 123825
        mmTop = 25400
        mmWidth = 55298
        BandType = 0
      end
      object ppShape54: TppShape
        UserName = 'Shape54'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 123825
        mmTop = 30163
        mmWidth = 55827
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'DT_VALID'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 123825
        mmTop = 30163
        mmWidth = 55298
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape23'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 86254
        mmWidth = 54504
        BandType = 0
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 77258
        mmWidth = 54504
        BandType = 0
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 39688
        mmTop = 81756
        mmWidth = 54504
        BandType = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 39952
        mmTop = 25135
        mmWidth = 54240
        BandType = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubCustoOrigem'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ShiftRelativeTo = ppTpCntr
        TraverseAllData = False
        DataPipelineName = 'ppDB_PROFIT_7'
        mmHeight = 8467
        mmLeft = 0
        mmTop = 142875
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = datm_cotacao.ppDB_PROFIT_7
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 15000
          PrinterSetup.mmMarginRight = 15000
          PrinterSetup.mmMarginTop = 5000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDB_PROFIT_7'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShape35: TppShape
              UserName = 'Shape35'
              Brush.Color = 16742726
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 5000
              mmTop = 0
              mmWidth = 175419
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = 'LOCAL FEES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3471
              mmLeft = 5000
              mmTop = 265
              mmWidth = 174625
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShape72: TppShape
              UserName = 'Shape72'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 166952
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape71: TppShape
              UserName = 'Shape71'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 152665
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape69: TppShape
              UserName = 'Shape69'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 138377
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape68: TppShape
              UserName = 'Shape68'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 124090
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape67: TppShape
              UserName = 'Shape67'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 109802
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape66: TppShape
              UserName = 'Shape66'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 95515
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'NM_ITEM'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 5556
              mmTop = 529
              mmWidth = 67998
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'NM_BASE_CALC'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 75406
              mmTop = 529
              mmWidth = 17463
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText1'
              DataField = 'AP_MOEDA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 95779
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText2'
              DataField = 'VL_COMPRA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 110067
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              DataField = 'VL_COMPRA_TOTAL'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 124354
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText71: TppDBText
              UserName = 'DBText71'
              DataField = 'VL_VENDA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 138642
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText72: TppDBText
              UserName = 'DBText72'
              DataField = 'VL_VENDA_TOTAL'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 152929
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText73: TppDBText
              UserName = 'DBText701'
              DataField = 'VL_PROFIT'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3471
              mmLeft = 167746
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText85: TppDBText
              UserName = 'DBText85'
              DataField = 'Profit'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3175
              mmLeft = 179652
              mmTop = 529
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText93: TppDBText
              UserName = 'DBText93'
              DataField = 'TX_PC'
              DataPipeline = datm_cotacao.ppDB_PROFIT_7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_7'
              mmHeight = 3471
              mmLeft = 138907
              mmTop = 265
              mmWidth = 2646
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 16140
            mmPrintPosition = 0
            object ppSubReport12: TppSubReport
              UserName = 'SubTotCustoOrigem'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppDB_TOTAL_PROFIT_7'
              mmHeight = 16140
              mmLeft = 0
              mmTop = 0
              mmWidth = 180000
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport14: TppChildReport
                AutoStop = False
                DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_7
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 5000
                PrinterSetup.mmMarginLeft = 15000
                PrinterSetup.mmMarginRight = 15000
                PrinterSetup.mmMarginTop = 5000
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Units = utMillimeters
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppDB_TOTAL_PROFIT_7'
                object ppTitleBand14: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 3440
                  mmPrintPosition = 0
                  object ppLabel50: TppLabel
                    UserName = 'Label50'
                    AutoSize = False
                    Caption = 'TOTAL LOCAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3471
                    mmLeft = 95779
                    mmTop = 0
                    mmWidth = 35190
                    BandType = 1
                  end
                end
                object ppDetailBand15: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppShape65: TppShape
                    UserName = 'Shape65'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 166952
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape64: TppShape
                    UserName = 'Shape1'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 152665
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape61: TppShape
                    UserName = 'Shape61'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 138377
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape58: TppShape
                    UserName = 'Shape58'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 95515
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppDBText59: TppDBText
                    UserName = 'DBText801'
                    DataField = 'AP_MOEDA'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_7
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_7'
                    mmHeight = 3175
                    mmLeft = 95779
                    mmTop = 529
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText87: TppDBText
                    UserName = 'DBText87'
                    DataField = 'total_VENDA'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_7
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_7'
                    mmHeight = 3175
                    mmLeft = 138642
                    mmTop = 529
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppDBText88: TppDBText
                    UserName = 'DBText88'
                    DataField = 'total_VENDA_GERAL'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_7
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_7'
                    mmHeight = 3175
                    mmLeft = 152929
                    mmTop = 529
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppDBText89: TppDBText
                    UserName = 'DBText89'
                    DataField = 'VL_PROFIT'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_7
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_7'
                    mmHeight = 3471
                    mmLeft = 167746
                    mmTop = 529
                    mmWidth = 11000
                    BandType = 4
                  end
                end
                object ppSummaryBand14: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D6167651E1C0000FFD8FFE000104A4649460001020100C800
          C80000FFEE000E41646F626500640000000001FFDB0084000604040405040605
          050609060506090B080606080B0C0A0A0B0A0A0C100C0C0C0C0C0C100C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010707070D0C0D18
          101018140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108005B
          00D103011100021101031101FFDD0004001BFFC401A200000007010101010100
          00000000000000040503020601000708090A0B01000202030101010101000000
          00000000010002030405060708090A0B10000201030302040206070304020602
          73010203110400052112314151061361227181143291A10715B14223C152D1E1
          331662F0247282F12543345392A2B26373C235442793A3B33617546474C3D2E2
          082683090A181984944546A4B456D355281AF2E3F3C4D4E4F465758595A5B5C5
          D5E5F566768696A6B6C6D6E6F637475767778797A7B7C7D7E7F7384858687888
          98A8B8C8D8E8F82939495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACA
          DAEAFA110002020102030505040506040803036D010002110304211231410551
          1361220671819132A1B1F014C1D1E1234215526272F1332434438216925325A2
          63B2C20773D235E2448317549308090A18192636451A2764745537F2A3B3C328
          29D3E3F38494A4B4C4D4E4F465758595A5B5C5D5E5F5465666768696A6B6C6D6
          E6F6475767778797A7B7C7D7E7F738485868788898A8B8C8D8E8F83949596979
          8999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C030100021103
          11003F00F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D
          8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD0F54E2A926B7E
          71D0F4797D1B994BDC815304439B0AF4E5D97E9CC8C5A59CC58E4E1E7D763C46
          89F57724E3F35341E4434170ABD8F1535FA3965FFC9F3EF0E2FF002C63EE923E
          D3F30FCA972789BBF418F6994A7E3B8CAA5A2C83A37C3B4F0CBAD7F593FB6BCB
          4BA8C496D324C87F6A360C3F0CC79448E61CD84E32160DAAE4593B15762AEC55
          D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8AB
          B157FFD1F54E2AF0CD7219D35EBE8AE09F58DCB8773FE536C7FE04E743888E01
          5DCF1FA88919240F3E27AE693E56D0F4EB68E386D6391828E53C8A1DD8F7249A
          E69726A2723B97A6C3A4C7014004835CF34F92ADE792D1EC12F64889593D3893
          8861B11C8D3F0CC9C3A7CC45DF0B85A8D5E9E2787878FE0910D47F2F65979C02
          EF45B8ED35B96500FB852C3FE1732383381BF0E41E6E1F8BA526C71E23FD14F7
          4DD575D515D3354B4F305B8FF744A443754F9F427FD6198F931C3F8A32C47FD3
          41CCC59B27F04A39C7FA4C8AD71F9ABE4FD36E4597982EC685A870127D56F7E1
          25492392B0AAB2D46512D2CB9C7D63FA2E663D644ED2071CBFA489D27F33BC81
          ABEA10E9DA66BB6B777D704886DE27ABB15058D053C06572C1302C86E8E68134
          0B27CA9B5D8ABB15762AEC55D8AA5BAFF99342F2F592DF6B77D1585A33889669
          8F152EC090BF3A29C942064680B6329888B2C7C7E71FE5712147996C89240003
          F52761DB2DFCB64EE2D7F98877B32041008DC1DC650DCEC55D8ABB1549BCC5E7
          3F2AF96CC035DD4E0D38DCF2FAB89DB8F3E14E54F95464E18E52E42D84F2463C
          CA5B61F9ADF973A85EC16365E60B4B8BCB97115BC08F56776E8A053A9C99D3CC
          0B2188CD0268165794B6A95DDDDB5A5B4B75752AC36D0234934CE42AAA28AB33
          13D001840BD904D311FF0095CBF95B4AFF0089AC69FF00193FB32EFCB64EE2D5
          F98877B27D2358D3758D3E2D434C9D6E6CA6A98674078B006955A8151954A262
          68B6C6408B08CC8A5FFFD2F54E2AC0FF00323CAEF3A7E99B44E5246BC6F2351B
          941D241EE9FB5FE4E6C743A8AF41FF0035D2F6A692FF00791FF3FF00E2936F22
          7991356D2D6DE561F5EB450928EEE8365907CFF6BFCACA7578382563E99395D9
          DAA192147EB8FE389E75E67D21F4AD7A682E01FABC927AD1B8FDA89DAA69EEBB
          AE6D3065E380239BA2D5E1F0F290797D5FE6BD66CB44F2F8B3885B595B9B7640
          50F056AA91506A46F5CD2CF2CEF726DE971E9F1708A8C69057BE45F2C5D9E5F5
          316F2F512DB931303FEC76CB21ABC91EB7EF6AC9D9F865D384FF0047D2F943F3
          96E0BFE626A56BF5A96EE3D38476714B3B727023404AD7FC9766CDA6037106B8
          6DC09C384F0D9970FF003930FC85825FF1D8BE867B7827B1B691E0175511C8F2
          D23E1C87D962A5A8D833806344123FA2884CC6428C632FE9FF0017F45F46C5F9
          A7E55B7BE974BD76F6DF48D5ADE827B69A642B522A28E0D370797C59AD9E94D5
          C7D717638B5809E198E097FB1FF4C9CE99E71F2A6A82E1B4ED5ED2E96D104972
          D14C8C23435A33907E15DBBE512C721CC3923244F22914FF009D3F95B05D7D5A
          4F31DA7A95A12A59D01F775529FF000D960D364EE607510EF65BA7EA361A8D9C
          77B61711DD5A4C39453C2C1D187B32D465241068B6820EE1BBDBFB2B0B57BABD
          B88ED6DA2159279982228F7662062013C949039B10FF0095D7F957F59FAB7F88
          ED7D4AD3955B857FD7E3C3FE1B2EFCAE4EE6AFCC43BDE65FF3943E61B4BBD37C
          B765653A5C5BDCBCD7A258983A32A288D082B507777CCAD0C082497175B3B000
          78E7907481ABF9E341D348AADC5EC3EA7FA91B7A8DFF000A999B965C3027C9C4
          C51B900FB9259A28626966758E2415777215401DC93B0CD08776C3F50FCE2FCB
          1D3E568AE3CC569EA29A32C4C65A1FF9E61B2F1A6C87A349D440755B65F9D1F9
          5D78E121F31DA0726804ACD17E2E146274D907451A881EACC2DEE6DEE604B8B6
          95268241CA396360C8C3C430A8394914DA0DBC53F3CBCA9A3F99FCC764B77E6F
          D37446D3AD8A7D46EC832F295B9973F1A503284A66769721844D44CADC3D4E31
          23F508A47F959F94BA15A79E74ED4ADFCDFA76B4FA717B9FA8DA0AC868A515BE
          DB51519C1E993CFA826047098DB0C1800903C424FA12F6FECAC6DDAE6F6E23B5
          B74FB734CEB1A0F9B310335C013C9CF240E6F19FCE0F39F943CD1A5268363E79
          D3F4CB377E5A8811CB72D305A148F945F088EBF137F3E66E9F1CA06CC4970F51
          923214240311FCB6F21FE4FC7ACA5CEB3E6FB0D6DD08367A7906D612E3F6A513
          1AC9BFD98FECFF00AD97E7CB96B6898B561C58EF79093E99844422410F1F4B88
          F4F8538F1A6DC69B5299AA2EC9762AFF00FFD3F54E2AE2010411507A8C55E75E
          65F2BDFE857E35DF2F82B1212F342BBFA75FB5F0FED44DFB4BFB39B4C1A88E48
          F04FF1FF001E745ABD24B0CBC5C5CBFDCFFC713359F45F3D68FE8B1106A700E4
          17F6A373B721FCF1365353D3CEF9C4B90258F598EBE998FF0063FF001D4BBCB5
          E61BDF2E5E0D035F531C20FF00A35C1355504EDBF788F63FB19767C2328E3838
          FA5D4CB04BC2CBCBF865F8FE17A0B4B1AC4662C3D355E65FB7102B5CD5D3BCB7
          C19AF6A6FAAEBBA8EA6E6AF7D7535C1F948E587E19D0423400747295925EEDFF
          0038C5E5AB1BBD035FBFBFB749E1BAB88ED50482A38C09C9A9FECA4CC1D66531
          90A34E5E970C6713C43883C43CDF716F77E6BD66E2015B77BD9C41525BF768E5
          1373B9F85733E1742F9B866201A1C93FFCBDF20799BCDD61AADB6937696B6086
          237B6FCA8F72CB528AB18A7A8230C5BE23C7E2FE6C8649C624197FA648122088
          EE7F98C4F53D3E4D3B52BAD3E53592D25785C814DD0D3A1E9F2CB18036F78FF9
          C51BBBE27CC367CD8E9F1FD5E548FF0065667E618AF872551CBFD5CD76BC0D8F
          5761A12770F3DFCE5FCC5BFF0037F99EEADD276FD01A74CF0D85AA9A2398CF16
          9DC7ED33B03C6BF6533274D84423FD22D1A8CC672FE8B7F94BF94B73E7EB9BC7
          92ECD869761C566B8440EEF2B8256340C42ECA393B63A8D4787E64AE0C1E27B9
          20F3E79667F2AF9A2F3CB6F74D770E9CC05B48761E9CCA25D92A4213CBE30BFB
          596629F1C78BBDAF2C3865C3DCCCBFE71B749FAEFE652DD32D63D32D269C93D9
          E4A44BFF00126CA35B2AC7EF6ED1C6E7EE7A67E77F92FCD1E63BB8CCDE67D3B4
          5F2CC318F4ECEEE5922F565EAF2494F85E9F6517F6731B4B96311C8CA4E4EA71
          CA5D4462F32F2C7907F2A2CAFA5FF1779D2C6EEDD54082DB4D795416A9E46493
          8741FB2AB9953CD908F4C4FF009CE34316307D52FF004AC23CED67E58B4F335E
          DBF962E9AFB425286D2E1C96279282EB520160ADF0D6997E232311C5F5346411
          12F4F27B2FFCE2A6A1AA33EBDA71919B4A85609A28C9256399CB06E1FCBCD57E
          203F973075E06C7AB99A12771D1E57F9B5AA8D5FF323CC179F6916E9ADA2277F
          82D80847E2873334F1E1800E2E795CCBD2BFE71534657D575ED64A0FDC450D9C
          6DEF2132BFE0A998BAF96C0393A18EE4A37F387F2F7CC9AF6BF3DFEB9E6FD274
          ED291A9A6E9D752C9188A2ECC5294691BABBE474D9A318D0892596A31191B320
          0316F2AF923F256D239C79B7CE16D7D725A9047A7BCB142894EA5B87277AFF00
          B15CBB265CA7E98B5431E21F549E61ACDBE9B16AD7D069D31BAD3639E44B3B87
          1BC9086211C8FF0029732A24D0BE6E2C80BDB93E9AFF009C63D4B54BBF22DD43
          792B4B6D6578F0D897258AC7C158A027F6559BE1CD5EBA204F6767A324C777AF
          E61396FF00FFD4F54E2AEC55C402287A62AC23CC7E47B88AE7F4BF9718DB5EA1
          E6D6E878863DCA7615EE87E06CD860D58238726E1D46ABB3C83E262F4CBF9AA1
          69AEE8DE66B7FD11E62845A6A6878A48470F8FA5509FB0FF00E437DAC94B0CF1
          1E2C7EA8B086A31EA07879470CD2CD762F38796B44D474C8D85E69B756F2C167
          74D5A42F221552D4A94A57A7D9FE5C9C7C3CC41FA66C09CDA5147D78BBFF009A
          F95F52D1F51D267FAB5FC0D0B8FB2C774703BA30D9866716B84C48587D3FF961
          C3CADF909FA5643C1CDA5D6A4C7FCA939327E0133519FD79ABFCD76D87D38ADF
          2A2722A0B6EC7763EE7739B7756FA83F287C99629F94BA7EA72B359EA0C6E351
          8EFA3F864452E4AF2FE65E08BB66B72EA4C7211F547E9E173068E33C625F4CFF
          00866F99EFEF66BFBFBABF99CC935DCD24F2487AB348C589FA6B9B102B670EC9
          E6FA4FFE71B3459A1FCBCD56FE2F86E754B995616E9B43188D3FE1CBE6AF5B2F
          581DCECB471F413DEF9A2786782E2682E1592E2191E39D185195D5886041EF5C
          DA02EB69EC9F929F9C1E54F25795F50D37588EE3EB4F72D7503411FA8250E8AA
          12B51C5815FDACC2D4E9A539021CCD36A2308905E5DE6CF305D798FCCBA96B97
          29E9CB7F3B49E975F4D3ECA27FB040AB9978E1C3103B9C69CF8A44BD9BFE71AA
          DFF47797FCD9E6731191A0558A24037616F134CCA3E6CEB983AD3728C5CCD18A
          1293C4B5EF30EADE64D4E6D5F58B86BABBB93CC9724AA29DD5235E88883650B9
          9D08088A0E14A6646CBD13C8DA47E4545E525D57CDBA9C971ACFC6D2E948D223
          27162123448C0F50B2D1B997FDACC7CB2CBC5511B3918A38B86E477799DF4B6D
          35F5C4B6B07D56D6495DADEDAA5BD38CB1289C8EEDC576AE650E4E31E6FA33FE
          71CA04D1BF2DB5CF30CA0012CD34DC8ED58ECE2A0FF86E79ACD69E2988BB1D20
          A812F9BE5B896E6692E6524CB70ED2B93DDA462C7F139B3AA75B76FA0FF2CEF2
          F3CA1FF38FDAD799AD107D7EE1EE2E2DDD8546CCB6F1B11E094E79AECE04F308
          9E4EC30930C4641F3F5F5D5DDF5D4B797B33DDDE4C4BCB3CCC5DDD8EE49639B1
          000D8380493B97AADB699F905A5792E2BEBABC935EF324B6E0FD4124951BEB2E
          BFDDFA69C42246FB16639886598CAAB862E508E211BFAA4F2515037FA732DC47
          D87F90BA47E8DFCAED22ABC64BD125E480F8CCE4AFFC204CD36AE5790BB7D2C6
          A01E8398CE43FFD5F54E2AEC55D8ABB15487CCBE4FD2F5C8CBC8BE8DE8144BA4
          1BFB071FB6B99383532C7FD570B55A18661BED2FE7318875AF31F9558586BB01
          BFD28FC11CE3E2F87C031EBFF18E4CCB38B1E6F540F0CDD7C73E5D37A720E3C7
          FCEFC7FB9921F5AFCBFF002AF9B74F964D1E489E390132D84BF6031F01F6E16F
          9631D4CF19E1C83FCE49D1E3CBEBC12E13FCDFC7D2E3A8E9F0E823C9BE6ED25A
          DF4930A5A8F47908DA18E814554F2A7C23E246C074FC478F19B2CA3AE30F4668
          F0FF0049BB1FC93FC97D421F56CB4C8A78CF74B89CD3E63D4A8CA27A8CD13476
          73B1E2C33171F533B87CBFA441A02E810C1E9E92B6FF00535B756614878F0E3C
          ABCBECF7AF2CC5333C5C5D5CAE0155D183DD7FCE3DFE573DABC76DA40827E3FB
          A93D69C8561D2A0B9A8F1CC98EB260EE7671F2692241AD8A33C85AE689A3DBC3
          E545B15D25AD5DE18A2466788C85C961C9C9705989A72CB353A627D60F107134
          9AE8DF8721C12FA7FA2A9E6FFC97F20F9AEFDB51D46CDE1D41E9EB5D5A486179
          29B0E74AAB1FF2B8F2CA31EA670143939D934F091B285F2E7E427E5BE857E97F
          158C97B73130685AF6533AA30E85508095FF005970CF57390AB4434B089B549F
          F21BF2B279E49E6D183CD33B492399E7A9672598FDBEE4E01ABC83AA4E9A07A3
          27F2C7947CBDE58D31B4BD12D05AD8BC8D2BC5C99EAEF40C4972C77A6553C929
          9B2D908088A0C2754FF9C73FCB2BFBD92E96DAE6C8CAC59A1B59DA38B9135255
          086E3F25F872F8EB32014D32D2409B44F97FF207F2D745BE8EF52C64BDB88583
          C26F65332AB0DC109B21FF0064AD827ABC921569869611369779DFF2AFF29B43
          D0F56F33DEF97DAECDB2BDD5C471CF32B48CCD56A55C28A96C962CF924444163
          9306300921318353FC9FD234A1E403796F6505E208A4D25A69390FAE0E5E9B49
          53C1A4E7DE4C898E5278FED640E303818E0F24FF00CE367E9A6D0E96BFA55261
          6C6D3EB371CBD6AF1F4C1E7C4BD76E20E5BE2E7ABE8D7E161BAEA9FE8BE74FCA
          FB1F25DB69D74D6DA6E833ADCDBD969F349F59F52D6191A391D82FA84216E5CB
          9FD9FE6CAA58F21958DE4D83240468F261373F971FF38F7279A57435BDBAB6BD
          B98E09EDA18AE1FD061747F72913B07AB302AC16BF619732066CDC374D070E2E
          2A4C3CB1A37E4579674E4D5B508E3B0B9BA96EED2DE4D42E3EB53116EED04AF1
          FA5C953A7DA55E51FF00AD919CB348D065086288B2ADA8F927FE71AB4E4B5FAE
          0B5892F615B8B6617370EAD04868B2725760A8DFCEDF0E08E5CE7924E3C239BD
          7F4AB0B0D3F4DB5B1D3D047636D12456B1A92408D5405009AD76CC29124D972E
          20014115812FFFD6F54E2AEC55D8ABB15762AB27820B889A19E3596271474700
          823DC1C20906C319444851E4C2B55FCBD9ADAE0DFF0096EE5ACEE17716E5885F
          92B761FE4BF25CCFC7AD0470E41C41D4E6ECC313C584F0CBF9A858FCE92464E9
          5E70D3763B194A5411E253A1FF005A33933A5BF5629358D791E8CF1FC7E3F9AB
          CF9274ABD1FA43CADAA1B773B85572CA3DAA0874FF006583F3728FA7246D3F90
          84FD5865C3F8FF004CA6FABFE63687B5DDB8BFB74FF76F1E7B7FAD1D1BFE0972
          431E0C9C8F0962736AF0FD438C7E3F9AA2DF9B17DC4AFE8F8965A53E291A80FF
          00ABC41C3FC9C3BD8FF2CCBF9A2FDEC2EF2F66BABB9AF267FDFCCE65775DA8C4
          D76F0A76CCF8C40000E4EA673329191E65EE1A2CF733E916735D295B89214694
          1D8F22A2B5CE7F2802440E56F5F8244E38997D5483B5F34E9EFA94BA5DE1FA9E
          A113504521F864077568DFA1E43B7DAC9CB4F2E1E21EA8B543591333097A263F
          1E94E72872D2F6D7B4C5D7068864235136E6EC47C1B8FA41B8579D385797ECF2
          E592E0357D18F10BA57BCD534DB2B592EEF2EA2B7B5888592791D5514921402C
          4D01A9A601127609240567B8811433C8AAA4D03330009FA71A4DA4FE73D020F3
          2796350D024BAFAA0D4A2F43D700332D48350A48E5D3278E7C3207B984E3C429
          866A1F93AB77AB5EB47E617834CD4EEED750BFD2C5BC2CD24D682300ACCC7D44
          56685795065C3534396E1A4E0B3CF66331FE5BF9D64F3B471C6823D02DBCC2FA
          D6F716D244A8CECECC1428BBF55CB71E0FFBB4CB7C68F07F4B8785AFC1971797
          1712BF9A7F273CB767E59B27B9F30BC365A3A5C412DC0B55B87617D726415113
          07F85E4E207C4BFB5C7063D4C8CB97D5FEF567A78F0F3E4CA63FCAF306B9A3DF
          E9FE65B8B592C2C6D2C2EE2F4E1796EE0B393D55E4EDF147EA578C9C57EC655E
          3EC411CCB68C3B820F441FFCA9C685ECA4D27CC6D65A9598D417D6FAB4338683
          51B833BA7A521217D366E2AF92FCCF78DB6FF628F03B8F7A51E78FCA0D0E4D32
          6BED43CCCF6F61A5E951D95E48D6F1CCD1C76F52D32AC653D36727F78823C962
          D41BA03996393003B93D1EB7A21B73A3581B697D6B636F17A33538F34E038B53
          B721BE624B997263C823322C9FFFD7F54E2AEC55D8ABB15762AEC55D8AA1B50D
          32C35180C17B024F11FD9715A7C8F51F464E19251360D35E4C5198A90E20C2F5
          0FCB8BBB498DDF97AF5E0946E21762A7E4B20FF8DF33E1AE0456416EA72F65CA
          278B14B84FE3F890B1F9DFCD7A24820D76C4CC836F548E0C7E4EB58DB267498F
          26F02D63B43362359237F8FF004A9BC3E6AF22EAE00BD8A28A56EAB75101BFFA
          F423FE1B283A7CD0E5FEC5C98EB34D97EA007F5C26F63A1F94F9ACF656968ECB
          BABC611A9F757289E5CBC8993958F4F839C4453924015268075394396F25FCC6
          BDB1BCF3029B57593D1844733AEE0B8626951FCA0E6EB4503186FDEF33DA9923
          2CBE9E81997E5EEB32EA3A1FA53B17B8B26F4598EE4A52A84FD1F0FF00B1CC1D
          6E2119D8E5276BD999CCF1D1E70F4B16FCC9FCBEF366BFAC6AD75A54B1A4177A
          17E8EB70F33C645CFD6D26A90A3E11E9A9F8F061CD18800FF39C9CB8E5226BB9
          2AD63F252F65D3BCCDA7E9B6F6F1D9DFC3A74DA5DB4934A6317F6C49B99181E5
          C4CAA78F3F8B964E3A91609E97FE9584B4FB103C903E61FCA2F3A6A3A7E8DE9D
          969B12DA45791CBA341338B789AE240D1C8AF3ACDEA3851477E2ADFC9C70C351
          104F3FEB319E091039277A2FE4CC92EAD6F37991CDCC361A5E9B6F63730DCCA2
          68EF2CD8B48EA76FF2539B7C4E99096A76F4F79671C1BEFDC10FA4FE526BD67A
          9D86B45615D6A2F305D5EDCDE09E424E9937329153A1DD97945865A80411D387
          FD928C041BEBC5FEC522F2E7E4B7E60D9EA53CF3DC5BDA3DC596A36B3DE413B1
          2F2DDA11149C422BF0573FEEC92475FD9CB27A9811F10D50D3CC1F9ABDA7E4FF
          009C93CBBAAD95BE9BA768F757367676A86D2F2E5CDC4B05C24B24F297F810B2
          2B745E7F17DAE380EA23C40D99321825C2455236F3F297CDD2F9DDF528E1B30A
          FAD45AA2F983EB338BC4B442A5AD0434E1C28A53ED71F8B223511E0AFE8F0F0F
          FBE49C12E2BF3FA917A37E51EB3A6DE691ABC0B145AE43AADFDC6A7782795B9D
          8DC09BD18A9D19579C3CA3C8CB500823F8687FA64C701147ADB19D27F24BF302
          DA2D4C4BF5547BED22FAC26E3705966B8B8A189DA91A9E1CBFDF8D23A7F365D2
          D540D7BC35C74F217EE7BB797ECA7B0D074EB29E9EBDADAC30CBC4D579C71856
          A1F0A8CD7CCD925CD88A0023F22C9FFFD0F54E2AEC55D8ABB15762AEC55D8ABB
          15762AB658629A331CA8B246DF6918020FD070824724188228B19D4FF2E7CBB7
          9C9A146B295BF6A13F0D7FD4355CCBC7ADC91E7EA75F97B2F14F97A0FF00458C
          5E7E57EB56EC5B4FBA8E71D812D0BFE155CCB8EBE07EA1FEF9D7CFB27247E920
          FF00B14AAEFCB1E738C149ADAEA54EE164322FE0C72E8EA317421C69E9350398
          97CF890D0F94FCCB2B844D36607C5D4228FA49C99D4E31FC41AE3A3CC7944BD2
          FC93E5A9B43D3E45B960D7772C1E50BBAA8028AA0F7A66A7559C6496DC83D068
          34A70C4DFD5264598AE73B15762AEC55D8ABB15762AEC55D8ABB15762AEC55FF
          D1F54E2AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15
          762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABFFD2F54E2AEC55D8ABB157
          62AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AEC55D8ABB15762AE
          C55D8ABB15762AEC55D8ABFFD9}
        mmHeight = 17198
        mmLeft = 2117
        mmTop = 0
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        Caption = 'QUOTE NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 25135
        mmWidth = 19981
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label3'
        Caption = 'ISSUE DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 6350
        mmTop = 25135
        mmWidth = 13674
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label4'
        Caption = 'FROM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 36777
        mmWidth = 7112
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        Caption = 'TO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 5085
        mmTop = 36777
        mmWidth = 3260
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'COMPANY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 40481
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'CONTACT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 44186
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'PHONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 59531
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 63500
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'EMAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 67733
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'ADDRESS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 48154
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'TYPE OF GOODS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5000
        mmTop = 86254
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'COMPANY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 40481
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'CONTACT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 44186
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'ADDRESS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 48154
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'CITY, STATE, ZIP CODE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 55298
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'PHONE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 59531
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'FAX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 63500
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'EMAIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 67733
        mmWidth = 28046
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 40746
        mmTop = 25400
        mmWidth = 13970
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D61708EBD0000424D8EBD0000000000003600000028000000DD00
          000049000000010018000000000058BD0000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7F7FFFFF7FFFFEFFFFFEFFFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEEF7F7F7FFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFF7F7F7
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFEEF7F7F7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7F7F7FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFEEF7F7EEF7F7FFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FF
          FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7F7F7F7F7F7F7
          FFFFFFEEF7F7F7FFFFF7FFFFF7FFFFF7FFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FF
          FFF7FFFFEEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFF
          F7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFF7F4F8EFF7FFFFF7FF
          FFF7F7F7F7F7F7FFFFFFFFF6F7F7FFFFF7FFFFF7FFFFF7FFFFFFF6F7FFFFFFFF
          FFFFFFFFFFF7FFFFEEF7F7F7FFFFF7F7F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFEEF7F7EEF7F7FFFFFFFFFFFFFFFFFFFFFFFFF8EDEFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFF
          FFFFFAD8DEA48485A48485C9ABB0E2CBCFF9E4E7FFEFEEFFFFFFFFFFFFF7F7F7
          F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFF6
          F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7EEF7F7EEF7F7FFFFFFFFFFFFFF
          FFFFFFFFFFF7F7F7FFFFFFF7F7F7FFFFFFFFFFFFFFF6F7FFF6F7FFF6F7F7FFF7
          F7FFF7F7FFF7FFFFFFFFFFFFFFF6F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FF
          F6F7FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFDEC2C18F6964733741
          763F4878474F845557795758977D7DD6C4C5FFFFFFFFFFFFF7F7F7F7FFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFE0D7D688717588717588
          7175977D7DF0DBD9FFFFFFE7E7E786787A887175887175887175F0DBD9FFFFFF
          FFFFFFFFFFFFFFF6F79F8A8D8D6B6C7F636386787AE7E7E7F7FFFFF7FFFFF4F8
          EFAC94928D6B6C8D6B6C8D6B6CD6C4C5FFF6F7F7FFFFF7FFFFE3E0DB8871757F
          6363887175977D7DF9E4E7FFFFFFFFFFFFFFFFFFFFEFEE9D86848D6B6C8D6B6C
          86787AF8EDEFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEFEECFBDBE67454B7337417B3742883C487B3742732B
          376A313A78474F8D6B6CCFBDBEFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFF0DBD94B30343D1B1C43252A43252AD5BEBC
          FFFFFFF4F8EF6666664021204A20214A2021AD898FE2CBCFE2CBCFE2CBCFCFBD
          BE5A3B3A53282B4A20216D5654FFF7F0EEF7F7F7FFFFF7F7F78871753D1B1C4A
          20214A20219F8A8DFFFFFFF7F7F7FFFFFFF8EDEF7F636343252A43252A3D1B1C
          AC9492F0DBD9E2CBCFF0DBD9D5BEBC5843463D1B1C40212059484BFFEFEEFFF6
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFF
          FFFFF6F7956F755B29297B37428536438536437A2E3A6A282D7B374286414C78
          474F977D7DF9E4E7FFF7FFFFF7FFFFF7FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEFEE795758592D34592D3453282BBCA3A1FFFFF7FFFFF7CCB7
          B6523330592D34592D34592D345A3B3A5A3B3A5A3B3A5A3B3A592D34592D344A
          20218D6B6CFFF6F7FFFFFFF7F7F7FFFFFFAC94924A2021592D344A20218D6B6C
          FFFFFFFFFFFFFFFFFFFFFFFFCCB7B64B303453282B53282B592D345843465A3B
          3A5A3B3A52333052333053282B53282B887175FFF6F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7B6A19F66333373
          374186414C853643853643732B377A2E3A853643853643884953763F48C9ABB0
          FFF7FFFFF7FFFFF7FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA4716F522220732B37582824977D7DFFFFF7FFFFF7FFFFF7947A743D1B1C6A
          313A6633334A20214A20214A20214A20216633336633334A2021AF9A9DFFFFFF
          FFFFFFFFFFFFFFFFFFBEA9AC48292A592D345222208F6964F9E4E7FFFFFFFFFF
          FFFFFFFFFFF6F77F63634A202166333358282453282B3D1B1C53282B53282B53
          282B6633334A2021B7999EFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFFFFFFFE2CBCF763F486A313A883C48883C487B3742
          7B3742732B37732B37853643853643853643793D478D6B6CF9E4E7FFFFFFFFFF
          FFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFF7B79A9563282C73
          2B376A282D795758FFEFEEFFFFFFFFFFFFD5BEBC592D345828245B29296B4344
          AD8285AD8285855B5C5828245B292953282BD5BEBCFFFFFFFFFFFFF7F7FFF7F7
          FFD6C4C55A3B3A53282B5B29296B4344FAD8DEFFFFF7FFFFFFFFFFFFFFFFFFCF
          BDBE52333063282C63282C693A42AD898FAD898F78474F5B29295B292953282B
          D5BEBCFFFFF7FFFFF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFFFFFFFA4848563282C853643883C487B37427B3742763F48A4716F7337
          417A2E3A8536437A2E3A88495378474FC9ABB0FFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFF7D5BEBC66333363282C63282C5A3B3A
          E3E0DBFFFFF7FFFFF7FFFFF78D6B6C5222205B29296B4344F0DBD9FFF7F0A484
          8553282B592D345A3B3AF0DBD9FFFFFFFFFFFFFFFFFFFFFFFFF0DBD95A3B3A53
          282B66333353282BE6DBC8FFFFFFFFFFFFFFFFFFFFFFFFFFEFEE7F6363582824
          58282472524DFAD8DEFFF7F08D6B6C5B29295B29295A3B3AF0DBD9FFFFF7FFFF
          F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFF
          EEF7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E4E77847
          4F732B37853643853643853643733741733741D7ADAE8B58606A282D85364385
          36437B37426A313A9F8A8DFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF0DBD9693A425B29295B2929523330D2CDBDFFFFFFF7F7
          F7FFFFFFCCB7B6592D34522220522220B79A95FFFFF78F69644A202153282B6D
          5654F9E4E7FFFFFFFFFFFFEEF7F7FFFFFFFFEFEE67454B53282B53282B53282B
          D5BEBCFFFFF7FFFFF7F7F7F7F7F7F7FFFFFFCCB7B652333052333048292AB79A
          95FFFFF7855B5C4A20214A2021766456FFEFEEFFFFF7FFFFF7F7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFE2CBCF693A427B37427B374285
          3643883C48793D4778474FCC99998B58606A282D733741733741793D4778474F
          7F6363F9E4E7FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDFFF7F7FF
          FFFFF7F07957585B29295B292948292AAF9A9DFFFFFFF7FFF7FFFFFFFFF6F78D
          6B6C4A2021592D3478474FFAD8DE6B43445828244A2021887175FFF6F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFF7F07F636348292A48292A48292AAC9492FFFFFFFFFF
          FFEEF7F7F7FFFFFFFFFFFFF6F76D565448292A48292A855B5CFAD8DE84555753
          282B53282B977D7DFFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDFFF7EFFF
          FFEFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFEEF7F7FFFFFFFFFFFFB6A19F53282B7B3742883C48853643732B378B5860
          D7ADAEC9ABB08D6B6C956F75AD8285733741763F48693A42855B5CFAD8DEFFFF
          FFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7FFFFFF88717552
          2220663333522220947A74FFF6F7F7FFF7F7F7F7FFFFFFCFBDBE48292A582824
          663333B68C8D78474F6633334A20219F8A8DFFFFFFF7F7F7FFFFFFFFFFFFFFFF
          FFFFFFFFA484854A202153282B53282B977D7DFFFFFFFFFFFFFFFFFFFFFFFFF7
          F7F7FFFFFFCCB7B648292A48292A5A3B3AAD8285763F485B292948292AB6A19F
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF6F7BCA3A16A313A732B378536438536437337418455578D6B6C7F63635A3B
          3A67454BAD898FAD82858455576A313A855B5CF9E4E7FFEFEEFFEFEEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D6D6C4C5D6C4C5D6C4C5EFE5E5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5
          F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFB79A95522220663333582824
          855B5CFFF6F7FFFFFFF7F7F7F7F7F7F7F7F77F63635222206633337337416A31
          3A6A282D582824CCB7B6FFFFFFF7FFF7F7FFF7FFF6F7FFF6F7FFF6F7CC99995B
          29295828245828248F6964FFF6F7FFF6F7FFF6F7FFF6F7FFF6F7FFFFFFFFEFEE
          6E585A4A20216633337B37426A313A5B2929523330D5BEBCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7F9E4E7F0DBD9
          DEC2C1DEC2C1E2CBCFCFBDBEE0D7D6EFE5E5F8EDEFD8D6D6AF9A9D7F6363693A
          427B3742853643853643853643693A424021202E1A192E1A1920181940212067
          454B4B30345A3B3A795758DEC2C1AD828572524D9D8684CFBDBEF9E4E7FFF7FF
          FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5A4848572
          524D5828245828245828245828245828245828246633338D6B6CCFBDBEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF582824582824582824582824582824582824582824582824582824855B5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF582824582824582824582824582824
          582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824A48485FFFFFFFFFF
          FFFFFFFFFFFFFFAC949258282458282458282458282458282458282458282458
          2824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7D5BEBC592D345B29295B29296B4344EFE5E5F7F7
          F7F7F7F7F7F7F7F7FFF7BFB7A866333363282C63282C63282C6A282D6A313AE3
          E0DBF7FFFFF7FFFFE3E0DB86787A7F63638D6B6C84555763282C663333663333
          6633338D6B6C947A74786F62BEA9ACFFFFFFFFFFFFFFFFFFBEA9AC53282B6633
          3363282C63282C63282C693A42F0DBD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7F0DBD9B6A19F956F757F6363855B5C855B5C8B58608B58
          607957586D56548871759F8A8DAF9A9D86787A67454B763F488536438536437A
          2E3A7B3742763F48763F4843252A33282A33282A2E1A192E1A1940212048292A
          5A3B3A8D6B6C8D6B6C693A42693A4278474F887175AF9A9DD8D6D6FFFFFFF7FF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8EDEFA48485582824582824582824663333A48485
          CFBDBED6C4C5D6C4C5B6A19F72524D5828245828246B4344D6C4C5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5BEA9AC72
          524D582824582824582824582824947A74BEA9ACE0D7D6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD6C4C5BEA9AC6B434458282472524DBEA9ACE0D7D6FFFF
          FFFFFFFFFFFFFFFFFFFF855B5C582824663333F8EDEFFFFFFFFFFFFFFFFFFFEF
          E5E5D6C4C5A4848558282458282458282458282472524DBEA9ACD6C4C5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFF
          FFFFFFFFE3E0DB5A3B3A592D345B2929663333D6C4C5FFFFFFF7F7F7EFFFFFEF
          FFFFF7F7F77F636353282B592D34592D3463282C795758F8EDEFF7FFFFEEF7F7
          E7E7E759484B3D1B1C52222058282463282C6633336633335B29295B29294829
          2A402120887175FFF6F7FFF6F7FFFFFFFFEFEE79575853282B66333358282453
          282B795758FFF7F0FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEAC94
          926B43445B29295B29296A282D793D47793D47793D4786414C73374167454B6D
          5654BCA3A1D6C4C55843465A3B3A8849537B37428536438536437A2E3A884953
          AA7F7C8D6B6C4021205A3B3A7F6363977D7D6D56545345476D56548D6B6CC9AB
          B0956F7573374186414C88495378474F795758BEA9ACFFF6F7FFF6F7FFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F8EDEF72524D582824582824582824947A74F8EDEFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFB6A19F582824582824582824BEA9ACFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824582824
          582824582824F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFA48485582824CFBDBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
          E5E5582824582824582824B6A19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7FFF7F7FFF76D
          56544021204A20214A2021AF9A9DFFFFFFFFFFFFFFFFFFEEF7F7FFFFFFC9ABB0
          48292A43252A43252A3D1B1C8D6B6CFFFFFFEDFFF7F7F7F7FFFFFF8871752E1A
          1948292A48292A5B292952222052222053282B53282B40212040212059484BFF
          EFEEFFFFFFFFFFFFFFF6F7C9ABB03D1B1C4A202153282B3D1B1C86787AFFFFFF
          F4F8EFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFE2CBCF592D344A202163282C63
          282C732B377A2E3A8536437A2E3A85364373374178474FC9ABB0FFF6F7887175
          20181967454B8B5860733741733741733741793D47733741AA7F7CDEAFB18D6B
          6C592D34956F75E2CBCFF0DBD9CFBDBECFBDBEE0D7D6FFEFEE9C7063732B3785
          36438536438536438849538F6964956F75E2CBCFFFF6F7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C5828245828
          24582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB6A19F582824582824582824BEA9ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF947A74582824582824
          5828246B4344FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFEEF7F7EFFFFFEDFFF7F4F8EFB0A8A99386849D8684
          9D8684CFBDBEFFF6F7FFF6F7FFFFFFF7FFFFFFFFFFFFF6F7AF9A9D9386849386
          84938684CFBDBEEEF7F7EEF7F7FFFFFFFFFFFFBEA9AC86787A86787A977D7D94
          7A74977D7D977D7D977D7D9D86849D868486787A86787AE7E7E7F7FFFFEEF7F7
          FFFFFFEFE5E5B6A19F9D86849D86849D8684CCB7B6FFFFFFF7FFFFF7FFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7
          FFFFF7FFFFFFFFFFFFFFFFFAD8DE693A424A202163282C6A282D732B377A2E3A
          7A2E3A86414C7B37426A313AB79A95FFF7FFCFBDBE2A1F212A1F216D5654977D
          7D592D346A313AAD8285D7ADAE763F48AD8285FFF7FFB7999E592D346A313A95
          6F75FAD8DEDEC2C1977D7DFFEFEEDEAFB1733741733741883C48853643853643
          853643793D478849538B5860C9ABB0FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F582824582824582824582824EFE5E5FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF72524D
          582824582824663333EFE5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFFFFFFFFFFFFFFFFFFFFEFE5E5582824582824582824582824582824BEA9
          ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFF
          EFFFFFEFFFFFEFFFFFEEF7F7F7FFFFFFFFF7FFFFF7FFFFF7FFF7F0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFF6F7FFFFFFF7
          FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F0FFF7F0FFF7F0FFFFFFFFF6F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7EEF7F7EFFFFFEFFFFFEFFFFFF7FFFFF7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFE2CBCF6B434463282C63282C63282C63282C5828246A313A63282C6328
          2C8F6964FFEFEEE2CBCF59484B2A1F212A1F215843466D56546D5654B79A95FA
          D8DEFAD8DE693A4278474FF0DBD9E2CBCF855B5C845557592D348D6B6CE2CBCF
          F0DBD9F9E4E7956F756A313A6A313A8536438536438536438536438536437B37
          42884953855B5CB6A19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF6B4344582824582824582824947A74FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC5828245828245828
          24947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFFFFF
          FFFFFFFFAC949258282458282458282458282466333372524DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFEEF7F7F7FF
          FFF7FFFFF7FFFFFFFFF7FFFFF7FFEFEEFFF6F7FFEFEEFFEFEEFFF6F7FFF6F7FF
          F6F7FFF6F7FFEFEEFFF6F7FFF6F7FFF6F7FFFFFFF7F7F7F7F7F7F7FFFFFFF7FF
          FFF7FFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFEF
          EEFFF7F0FFF7F0FFF7F0FFF7F0F7F7F7F6F3E6F6F3E6FFF6F7FFF6F7FFEFEEFF
          EFEEFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFF0DBD94B30
          343D1B1C592D34592D34693A42855B5C8D6B6C79575878474FA48485BCA3A159
          484B2E1A194B30346D5654938684AC9492DEC2C1F0DBD9FFF6F7D7ADAE5A3B3A
          67454BD6C4C5FFFFFFE2CBCFDEC2C18D6B6C592D348D6B6CB7999E9D86846745
          4B67454B763F48763F48732B37732B377B37427B37427B37427B37426B43446D
          5654AF9A9DF0DBD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBDBE582824
          582824582824582824CFBDBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5582824582824582824582824F8EDEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFFFFFFFF8EDEF66333358
          2824582824582824855B5CAC9492582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7E0D7D69D
          86846E585A6D56546E585A7F63637664566E585A6E585A795758795758795758
          7957586E585A86787ACCB7B6F8EDEFFFFFFFF7F7F7FFFFFFFFF6F7F7FFFFEEF7
          F7F7FFFFEEF7F7F7F7F7FFFFFFEFE5E5C9ABB07F63637F636379575879575879
          57587957586E585A7F63637F63637F63637957587F63637F6363977D7DE0D7D6
          FFFFFFFFFFFFF7FFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D667454B67454BBEA9ACE2
          CBCFE2CBCFFFF6F7FFEFEEF9E4E7A484856E585A43252A2E1A1958434667454B
          6E585AE2CBCFFFF7FFDEC2C1855B5CFAD8DEB7999E795758DEC2C1E0D7D6CCB7
          B6AC9492956F755A3B3A52333043252A43252A43252A40212048292A48292A53
          282B763F4888495363282C63282C53282B53282B592D3452333043252A86787A
          FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC94925828245828245828245828
          24FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF663333582824582824582824BEA9ACFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFFFFFFFFFFFFFAC9492582824582824582824582824
          CFBDBEF8EDEF663333855B5CFFFFFFFFFFFFFFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFD6C4C567454B2E1A193D1B1C53282B
          4A20214021204021204021204021204A20215828245828245828245828244A20
          214A202186787AEFE5E5FFFFFFF7F7F7FFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFEFE5E5947A744B30344A20215B29295222205222205222205222203D1B1C
          4A20214A20214A20214A20213D1B1C4A20213D1B1C584346E2CBCFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8EDEFCFBDBED8D6D6FFF6F7FFFFFFFFFFFFF7F7F7
          FFFFFFF9E4E772524D43252A48292A67454BD7ADAEDEAFB1693A426B4344AD89
          8FF0DBD9FAD8DEFFEFEEAA7F7C78474F956F756D56544B30342E1A192E1A192A
          1F212A1F212A1F212A1F212018192A1F212A1F212A1F214B30347F6363A48485
          5A3B3A693A42956F75C9ABB0D5BEBCC9ABB0938684AF9A9DEFE5E5FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF8D6B6C5828245828245828246B4344FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          855B5C582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFFFFFFFFF8EDEF6633335828245828245828246B4344FFFFFFFFFFFFA484
          85582824D6C4C5FFFFFFFFFFFFFFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7
          F7F7F7FFFFFFFFFFFFBEA9AC8F6964AD8285AA7F7CAA7F7C956F75AA7F7C937A
          6DAA7F7CAA7F7CAA7F7C8455575B292966333366333366333353282B48292A86
          787AF8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7887175402120
          53282B66333363282C6633336633338B5860A4716FAA7F7CAA7F7CAA7F7CAA7F
          7CAA7F7CAA7F7CAA7F7CAA7F7C956F75B7999EFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFCFBDBE5A3B
          3A592D34693A42693A42DEAFB1FFEFEE956F75592D34763F48956F75DEAFB1AD
          8285884953693A42693A42693A423D1B1C2A1F212A1F212A1F212A1F21201819
          2018192018192018192018192A1F214B30344B3034AC9492D6C4C5CFBDBEFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF855B5C582824582824582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C5828245828
          24582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFFBEA9
          AC582824582824582824582824BEA9ACFFFFFFFFFFFFEFE5E5582824947A74FF
          FFFFFFFFFFFFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFF8EDEFBEA9
          ACAD898FB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB68C8DB6
          8C8D9C706366333363282C66333366333353282B48292A6E585AEFE5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E76E585A4A202158282463282C6328
          2C63282C5B29298F6964B68C8DB79A95B68C8DB68C8DB68C8DB68C8DB68C8DB6
          8C8DB68C8DB68C8DB68C8DC9ABB0F9E4E7FFFFFFFFFFFFFFF6F7FFF6F7F7FFFF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFEEF7F7F7FF
          FFF7FFFFFFFFFFFFF6F7FFFFFFFFFFFFFFF6F7977D7D592D346A313A793D476A
          313A8B5860F9E4E7E2CBCF78474F592D34733741733741733741793D47793D47
          793D478B58607957584021202018192018192A1F214A444586787A86787A3333
          3333282A33333333282A4B30347F6363FFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824
          582824582824855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824582824582824855B5CFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C5FFFFFFFFFFFF6B434458282458282458
          28246B4344FFFFFFFFFFFFFFFFFFFFFFFF947A74582824EFE5E5FFFFFFFFFFFF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFF4F8EFD7CFC45C544948292A4A20214A20214A
          20214A20214A20214A202140212053282B52222052222052222058282463282C
          66333366333352222072524DBEA9ACF9E4E7FFF6F7FFFFFFF7F7F7FFFFFFFFFF
          FFEEF7F7F7FFFFFFFFF7F9E4E7CC999978474F5222205B29295B292966333358
          2824582824301E083D1B1C4A20214A20214A20214A20214A20214A20214A2021
          4021204021207F6363E0D7D6FFEFEEFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFF8EDEF9F8A8D6E585A6B4344845557D7ADAE8B5860663333CC9999
          FAD8DE8D6B6CA4716FA4716F763F4873374186414C86414C7B3742793D47D7AD
          AE947A744B303433282A5C5449CCCCCCE0D7D6B0A8A9CFBDBE99999959484B2A
          1F212A1F216E585AFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C582824582824582824855B
          5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF855B5C582824582824582824855B5CFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824D6C4C5FFFFFFBEA9AC582824582824582824582824BEA9ACFFFFFF
          FFFFFFFFFFFFFFFFFFEFE5E5582824947A74FFFFFFFFFFFF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFEEF7F7FF
          FFFFFFFFFFFFFFFF86787A59484B59484B72524D6B43446B43446B43446B4344
          6B43446B43446B43446B43446B4344592D34592D3453282B53282B48292A9D86
          84EFE5E5FFFFFFFFF6F7FFF6F7FFF6F7E7E7E7FFFFF7FFFFF7E7E7E7E7E7E7FF
          FFFFFFFFFFFFFFFFF0DBD9977D7D52333052333058282458282463282C72524D
          72524D6B43446B43446B434472524D67454B72524D67454B67454B67454B5345
          47938684FFF6F7FFF6F7F7FFFFEEF7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFF7FFFFF7FFB7999E
          5A3B3ACCB7B6FAD8DEDEC2C1D7ADAEA484857957585843467F6363BEA9ACFFF6
          F7CDA7A5763F4886414C7B374286414C853643793D47B68C8DFFEFEE99999986
          787AD8D6D6B0A8A95C54495C544986787A6E585A3333332A1F212A1F21666666
          E7E7E7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFAC949258282458282458282472524DFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          6633335828245828245828248D6B6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5
          FFFFFF6B43445828245828245828246B4344FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF947A74582824EFE5E5FFFFFF582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFEFFFFFEEF7F7F7FFFFF7F7F7F7F7F7F8EDEFCFBDBE
          BEA9ACBCA3A1CDA7A5D7ADAED7ADAED7ADAED7ADAED7ADAECDA7A5CDA7A5CDA7
          A5D7ADAECC9999693A4253282B53282B523330BEA9ACFFF6F7FFFFFFFFFFFFF0
          DBD99386846E585ABFB7A8E2CBCFCFBDBECCB7B66E585A9F8A8DE3E0DBFFFFF7
          FFFFF7FFFFF7AF9A9D5233306633336A282D6A313ACC9999CDA7A5CDA7A5CDA7
          A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5CDA7A5BCA3A1BEA9ACCFBDBEFF
          F6F7FFFFFFF7F7F7F7F7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFF7FFFFF7FFFFF7F7F7FFF7FFE2CBCF78474F693A42CC9999FFF7
          FFE2CBCF947A74D6C4C5AC94926E585A9F8A8DEFE5E5FFFFFFF9E4E784555773
          374186414C883C48883C487B37428B5860FAD8DEB0A8A93333335C54494A4445
          33282A20181953454786787A4A44452018192A1F215C5449F7F7F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCFBDBE582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF5828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC9492582824D6C4C5BEA9AC5828245828
          24582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D7D658
          2824947A74FFFFFF582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEF7F7EEF7F7FFFFFFFFFFFFE0D7D67F63635233305233305233306633
          33663333663333663333663333663333663333663333733741732B376A282D6A
          282D5828245A3B3ABEA9ACFFFFF7FFFFF7F8EDEF9386844B303443252AB6A19F
          947A74977D7D9D8684956F75B7999E48292A5A3B3A9F8A8DFFF7F0FFF7F0FFFF
          F7BCA3A166333363282C6A282D6A313A6A313A66333366333366333366333366
          3333663333663333663333592D34693A425A3B3A5233307F6363F0DBD9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7F7F7F7F9E4E78D6B6C6A313A7337418B5860FAD8DEFFEFEEF0DBD9AF
          9A9D86787AB0A8A9FFF6F7FFF6F7FFF6F7FFFFFFAD898F6A313A86414C853643
          883C48883C48733741BCA3A1FFFFFFCFBDBE6666662A1F212A1F212018193328
          2A4A444533282A2A1F212A1F21666666E7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF663333
          582824582824582824E0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFBEA9AC582824582824582824582824E0D7D6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824
          582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFAC9492582824D6C4C572524D582824582824582824663333F8
          EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF855B5C663333F8EDEF
          582824582824582824582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7F7FF
          FFF7F7F7FFEFEE7F63633D1B1C5A3B3A5B29295B29296633335B29295B292966
          333366333366333366333363282C63282C6A282D6A282D6A282D5B29299F8A8D
          FFFFFFFFFFFFFFEFEED5BEBC67454B2E1A19938684BCA3A13D1B1CA48485A484
          8553282BCDA7A5A4716F40212067454BD6C4C5F8EDEFFFF6F7FFF6F7B68C8D52
          22205B29295B29295B29295B29295B29295B29295B29295B29295B2929663333
          6633336633335B29295B2929592D343D1B1C7F6363F9E4E7FFF6F7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF
          9A9D53282B7B37427B37426A313AAD8285FFEFEE86787A5C5449D8D6D6FFF6F7
          FFFFFFEEF7F7F7FFFFFFFFFFE2CBCF78474F7B3742883C48883C48883C486A31
          3A8D6B6CE0D7D6999999B0A8A986787A4A444566666633282A20181920181933
          282A33282A86787AFFF6F7FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA484855828245828245828
          24A48485FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF855B5C5828245828245828246B4344FFFFFFFFFFFFEFE5E5AC9492
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5AC9492FFFFFFFFFFFFFFFFFFFFFFFFAC
          9492582824AC9492582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824AC94925828245828245828
          24582824AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFEEF7F7FFFFFFEFE5E5CC
          B7B6CDA7A5D7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAEDEAFB1
          DEAFB1DEAFB1DEAFB184555763282C522220795758F8EDEFFFFFFFF9E4E78F69
          648B5860DEAFB1B79A95D5BEBC6B43443D1B1CA48485977D7D3D1B1C67454BDE
          C2C1B79A95CCB7B66E585A786F62FFEFEEFFEFEEFFEFEE78474F53282B663333
          845557D7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAED7ADAEDEAF
          B1CDA7A5D7ADAED7ADAEBEA9ACFFEFEEFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E572524D6A313A853643
          883C487B374278474F7F63634B30344B3034BFB7A8FFF7FFFFFFFFF7FFFFEEF7
          F7FFFFFFFFEFEE956F75793D47883C48883C48883C4886414C6B4344B7999E6E
          585A86787AE7E7E7B0A8A986787A786F6233282A2A1F2120181933282ABEA9AC
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF6B4344582824582824663333F8EDEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5582824
          582824582824582824D6C4C5FFFFFFFFFFFFD6C4C5582824FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFD6C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD6C4C5582824FFFFFFFFFFFFFFFFFFFFFFFFAC9492582824663333
          582824582824582824663333F8EDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF72524D663333582824582824582824582824AC9492FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E593868467454B795758855B5C795758
          855B5C855B5C855B5C795758845557845557845557855B5C845557855B5C7957
          586A313A5B2929592D34C9ABB0FFFFF7FFFFF7AD898F52222063282C63282CDE
          C2C1F0DBD9CC9999CC9999DEC2C1CCB7B6BCA3A1C9ABB0E2CBCFD5BEBC523330
          402120402120AD898FFFFFFFFFF6F7C9ABB040212053282B693A427957587957
          58795758795758795758845557845557845557845557845557855B5C72524D7F
          63636E585A5C5449938684F8EDEFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7BEA9AC6A313A7B37428536438536437B3742693A
          4248292A2E1A192018194A4445999999FFFFFFF7FFFFF7FFFFF7FFFFFFFFFFCC
          B7B6693A42793D47883C48883C48883C48763F486B43449F8A8D86787ACCCCCC
          86787A33282A86787A4A44452A1F212A1F21584346C9ABB0FFF6F7FFFFFFF7FF
          FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE0D7D666333358282458282472524DF8EDEFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEF6B4344582824582824582824AC94
          92FFFFFFFFFFFFFFFFFFD6C4C5582824D6C4C5FFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5582824582824582824582824FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F
          582824E0D7D6FFFFFFFFFFFFFFFFFFAC94925828245828245828245828245828
          24947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBEA9AC582824582824582824582824582824AC9492FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEFEE6E585A2E1A194021204A20214A20214A20214A20214A20214A20
          214A20214A20214A20214A20214A20214A20214A20214A20215B292952222069
          3A42F0DBD9FFFFFFD8D6D658434653282B663333663333B6A19F5C544972524D
          8F6964C9ABB0C9ABB07F636372524D6B4344D7ADAE6B434453282B53282B5843
          46E0D7D6FFFFFFEFE5E54B303448292A48292A4A20214A20214A20214A20214A
          20214A20215222205222205222205222205222204A20214A2021402120402120
          2E1A19666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFF
          FFFFF6F7956F756633337B3742883C48883C486A313A592D3440212040212033
          282A20181933282A999999E7E7E7F7FFFFF7FFFFFFFFFFFFF6F78D6B6C6A313A
          793D47883C48883C48883C48693A42BEA9ACFFF6F7F8EDEFB0A8A93333334A44
          456E585A48292A43252A6D5654855B5CD5BEBCFFFFFFFFFFFFFFFFFFF7F7F7F7
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE0D7D66B434458282458282472524DCFBDBEFFFFFFFFFFFFFFFFFFFFFF
          FFF8EDEFBEA9AC663333582824582824582824B6A19FFFFFFFFFFFFFFFFFFFFF
          FFFFD6C4C558282472524DA48485AC9492AC9492AC9492947A74582824582824
          582824582824A48485AC9492AC9492AC9492947A746B4344582824D6C4C5FFFF
          FFFFFFFFFFFFFF947A74582824582824582824582824582824EFE5E5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B4344
          582824582824582824582824947A74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C59F8A
          8D977D7DA48485A48485A48485A48485A484859D86849D86849D86849D86849D
          8684A48485A48485A48485A48485A48485A48485A48485B7999EFFF6F7FFF6F7
          9F8A8D402120592D3463282C845557CDA7A548292A48292A3D1B1CA48485947A
          743D1B1C48292A5B2929CDA7A5855B5C5B29295B292948292A9D8684FFFFF7FF
          FFF7AF9A9DA48485A48485A48485A48485A48485A48485A48485A48485AD8285
          AD8285AD8285AD8285AD8285A48485A48485A48485A48485938684938684F7F7
          F7FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFF7FFFFEFEE78474F63
          282C86414C8536437A2E3A693A42B7999E956F752E1A192A1F212A1F212A1F21
          201819666666B0A8A9F7F7F7F7F7F7FFFFFFCFBDBE67454B73374186414C8536
          43883C48883C488B5860FAD8DEFFFFFFFFFFFFCFBDBE4A444543252A43252A53
          282B763F4878474F8D6B6CE0D7D6FFFFFFF7F7F7F7F7F7F7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8ED
          EFAC9492663333582824582824663333855B5C855B5C72524D58282458282458
          28245828248D6B6CE0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6A19F582824
          5828245828245828245828245828245828245828245828245828245828245828
          24582824582824582824582824582824582824BEA9ACFFFFFF855B5C6B434458
          28245828245828245828245828248D6B6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC94925828245828245828
          245828245828246B4344855B5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEFFFFFFFFFFFFFFF
          F6F7FFFFFFFFFFFFFFF6F7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFEFEE79575853282B6633
          33522220AD8285AD82854A2021663333582824AD8285AD828552222066333358
          2824AA7F7CAA7F7C5828245828245828247F6363FFEFEEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFF6F7FF
          FFFFFFFFFFF7FFFFEEF7F7FFFFFFFFFFFFDEC2C1693A426A313A883C48883C48
          6A282D8D6B6CFFEFEEFAD8DE5A3B3A2E1A192A1F212A1F212A1F212018196666
          66E7E7E7FFFFFFF7F7F7F7F7F7AD898F5A3B3A86414C883C48883C48883C486A
          313AB68C8DFFF6F7FFFFFFFFFFFFE0D7D6977D7D7957586B43446B4344793D47
          845557AF9A9DFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
          C4C5AC9492947A74855B5C855B5C855B5C855B5CAC9492BEA9ACEFE5E5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6C4C5AC9492AC9492CFBDBED6C4
          C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6C4C5D6
          C4C5B6A19FAC9492AC9492D6C4C5FFFFFFAC9492AC9492AC9492AC9492AC9492
          AC9492AC9492E0D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF8EDEFAC9492AC9492AC9492AC9492AC9492AC
          9492AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF7F7FF
          F7F7FFF7F7FFF7FFFFFFFFF6F7F0DBD95A3B3A4A20214A2021582824CC999985
          5B5C522220522220522220AA7F7CAA7F7C5222205828244A2021855B5CAA7F7C
          4A20214A20214A20216B4344F0DBD9FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7FF
          FFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFF7FFFFFFFFFFCCB7B6592D347337417337417B3742733741D5BEBCFFF7
          FFFFF7FFAC94924B30342E1A1920181933282A201819333333938684F4F8EFFF
          FFFFFFFFFFF0DBD97957586A313A793D47853643883C487B37426A313AC9ABB0
          FFFFFFFFFFFFFFFFFFD5BEBC693A426A313A6A313A7B374278474F8D6B6CF0DB
          D9FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF6F7FFF6F7FFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFEFEE9F8A8DAD898FA48485A48485DFCFBFBCA3A1AA7F7CAA7F7C
          AA7F7CDEC2C1CCB7B6AA7F7CAA7F7CAA7F7CCDA7A5DFCFBFA69080AC9492A484
          85977D7DF9E4E7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7F7F7F7FFFF
          FFF0DBD96D565453282B793D477A2E3A884953CC9999B68C8D8D6B6C8D6B6C69
          3A424B303443252A201819333333786F62333333B0A8A9FFFFFFF7F7F7FFFFFF
          C9ABB0693A42693A42883C488536438536436A313A795758DEC2C1FFF6F7E2CB
          CF956F7567454B592D34793D47853643853643845557A48485F9E4E7FFF6F7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7F7F7F0DBD9
          A48485977D7D977D7D977D7DDFCFBFBCA3A1947A74AA7F7C977D7DC9ABB0CCB7
          B6947A74AA7F7C977D7DB79A95DEC2C1947A74977D7DA48485A48485F9E4E7FF
          F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9ABB048
          292A6633337B374286414C763F4878474F78474F78474F763F48693A42592D34
          48292A59484BAF9A9D2A1F2186787AFFFFFFFFFFFFFFFFFFFFF6F7A484856A31
          3A7B374285364385364386414C663333845557BEA9AC956F75AD898FAD898F53
          282B733741883C487A2E3A763F48763F48D5BEBCFFF7FFFFF7FFFFF7FFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFF
          F7FFFFFFF6F7FFFFFFFFFFFFEEF7F7EFFFFFF7FFFFF0DBD95A3B3A5222205222
          20522220B79A958F69644A20215828243D1B1CAA7F7CA484853D1B1C4A20214A
          20218F6964AC94924A20214A20214A20215A3B3AF0DBD9FFFFFFFFFFFFEFFFFF
          EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFF8EDEF947A74592D346A282D
          6A282D85364385364386414C7A2E3A853643883C48733741693A4259484B786F
          62201819887175FFF7FFFFF7FFFFF7FFFFF7FFEFE5E58D6B6C73374185364385
          36437A2E3A7B3742763F4878474F956F75AD898FDEC2C178474F63282C853643
          853643793D47693A42B68C8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFEFFFFFEEF7F7FFF7F07957585B2929663333522220AD8285AA
          7F7C5828245B29295B2929AD8285AA7F7C53282B592D344A2021AD8285AD8285
          4A2021592D3453282B7F6363FFF6F7FFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7F7F7FFFFFFFFFFFFFFF6F7F9E4E7855B5C3D1B1C732B37883C488536
          438536438536438536437B3742763F48592D344B303453454743252A59484BC9
          ABB0E2CBCFFFF6F7F8EDEFFFF6F7D5BEBC8849536A282D853643883C487B3742
          7B374288495378474F956F75FAD8DEB68C8D63282C7A2E3A883C487B37427847
          4F8D6B6CFFEFEEFFEFEEFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFF7FFFFFF9F8A8D4A20215B29295B29298F6964CC9999522220592D34
          3D1B1CAA7F7CAA7F7C3D1B1C53282B53282BCDA7A5855B5C53282B53282B5328
          2BAC9492FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F7FFFFFFD6C4C567454B4A20216A282D7B3742732B37732B3773
          2B3753282B53282B584346BEA9ACEFE5E5D6C4C57F636359484B6E585A7F6363
          7F63637F63637F636378474F5828247A2E3A7A2E3A853643853643883C487B37
          42884953A4716FA4716F66333366333373374173374173374178474FF9E4E7FF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          E2CBCF5A3B3A53282B53282B592D34CDA7A572524D72524D8D6B6CD7ADAED7AD
          AE8D6B6C79575872524DD7ADAE53282B5A3B3A523330584346F0DBD9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFD6C4C57F6363592D34693A42693A42592D3467454B8D6B6CBCA3A1
          EFE5E5FFF6F7FFFFFFFFFFFFF8EDEFEFE5E5E2CBCFBCA3A19F8A8DAC9492C9AB
          B0E2CBCF8D6B6C5222206A313A86414C7B37427B37427A2E3A86414C86414C88
          4953793D476A313A5B292963282C4A20218B5860F9E4E7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D86844829
          2A4A20216B4344DEC2C1DEC2C1BCA3A1AC9492CCB7B6CCB7B6A48485BCA3A1FA
          D8DEDEC2C172524D402120402120AC9492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFFF
          EFE5E5E2CBCFDEC2C1D5BEBCE2CBCFF9E4E7FFF6F7FFF6F7FFF6F7FFFFFFF7F7
          F7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE5E5AD
          898F4A2021592D34733741793D4786414C7B37427B374286414C86414C884953
          793D474A202178474FCCB7B6FFF6F7FFFFFFFFFFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFFFFFFEFEE7F63638D6B6CD7ADAEB6
          8C8DDEC2C172524D2E1A19977D7D9D86843D1B1C67454BDEC2C1B68C8DD5BEBC
          7F6363887175FFEFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7EEF7F7F7FFFFF7FFFFF7
          F7F7F7F7F7FFFFFFF7F7F7F7FFFFEEF7F7F7FFFFFFFFFFFFFFFFBEA9AC67454B
          53282B53282B6A313A6A313A7B37427337417337417337416A313A855B5CD5BE
          BCFFF7FFFFF7FFFFF7FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF6F7FFF6F7D5BEBC67454B2E1A19AD898FBCA3A1
          43252A9D8684977D7D402120C9ABB0977D7D2E1A1959484BE2CBCFF8EDEFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEEF7F7F7FFFFF7FFFFEEF7F7FFFFFFFFFFFFF9E4E7B7999E7957584A20
          21592D346A313A592D34592D344A2021795758E2CBCFFFFFFFFFFFFFF7F7F7FF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFF
          FFFFFFFFFFFFFFFFFFF9E4E79F8A8D4B303433282AAC94929386849386849F8A
          8D977D7D9F8A8D2E1A195843469F8A8DF8EDEFFFFFFFF7F7F7F7F7F7F7F7F7FF
          FFFFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF
          FFF7FFFFF7FFFFF7F7F7F7F7F7FFFFFFFFFFFFF0DBD9BCA3A1B7999EBEA9ACBE
          A9ACBEA9ACBEA9ACF9E4E7FFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFF
          F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7FFFFF7FFFFF7F7F7FFFF
          F7FFFFF7FFFFF7E0D7D69F8A8D6E585ACCB7B6E2CBCFE2CBCFCCB7B66E585AAF
          9A9DE0D7D6FFF7FFFFF6F7F8EDEFFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7
          F7F7FFFFFFF7F7F7FFFFFFFFF6F7FFFFFFFFFFFFFFFFFFFFF6F7FFF6F7FFFFFF
          F7F7F7F7F7F7F7F7F7FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF7F7F7F7FFFFF7FFFFF7FFFFF7FFFFF7F7F7FFFFFFFFFFFFF8EDEFFF
          FFFFFFFFFFFFF6F7EFE5E5FFFFFFFFFFFFEFE5E5FFF6F7FFF6F7FFFFFFF7F7F7
          FFFFFFFFFFFFF7F7F7F7F7F7F7FFFFEEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEF7F7FFFF
          FFFFFFFFEEF7F7F7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FF
          FFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFF
          F7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FF
          FFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
        mmHeight = 14023
        mmLeft = 133879
        mmTop = 2117
        mmWidth = 45244
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'CITY, STATE, ZIP CODE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 55298
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'GROSS WEIGHT (KG)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5000
        mmTop = 77523
        mmWidth = 34660
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'MEASUREMENT (M3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 5000
        mmTop = 81756
        mmWidth = 34660
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'VL_PESO_KG'
        DataPipeline = datm_cotacao.ppDBPipeline1
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 39952
        mmTop = 76994
        mmWidth = 43921
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'VL_CUBAGEM_M3'
        DataPipeline = datm_cotacao.ppDBPipeline1
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 40217
        mmTop = 82021
        mmWidth = 43921
        BandType = 0
      end
      object ppImage3: TppImage
        UserName = 'Image3'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170E6430000424DE64300000000000036000000280000004C00
          00004C0000000100180000000000B04300000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          D6E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF99CCFFF0FBFFFFFFFF
          99CCFF99CCFF99CCFF99CCFF99CCFF99CCFF99CCFF99CCFF6699CC6699CC6699
          CC99CCFF99CCFF99CCFF6699CC6699CC6699CC6699CC99CCCC99CCFF6699CC66
          99CC6699CC99CCCC66CCFF99CCFF99CCFF99CCFFF0FBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF0FBFFFFFFFF6699FF0099FFF0FBFF3399FF99CCFF3399
          FF99CCFF66CCFF3399FFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F85555555F5F5F86
          8686555555777777FFFFFF808080555555868686777777555555B2B2B2A4A0A0
          5555557777777777775555559999CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFC6D6EF3399FF6699FFFFFFFF0099FFCCFFFF6699FF3399FFFF
          FFFF0099FF66CCFFC6D6EF3399FFD6E7E7FFFFFFFFFFFFFFFFFFB2B2B24D4D4D
          C0C0C0FFFFFF999999555555CCCCCC555555969696FFFFFFEAEAEA555555C0C0
          C0555555555555FFFFFFFFFFFF5F5F5F336699FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF3399FFC6D6EF0099FF99CCFFFFFFFF0099FFFFFFFF0099FF
          3399FFF0FBFF3399FF3399FFCCFFFF3399FFF0FBFFFFFFFFFFFFFFFFFFFFF1F1
          F1EAEAEAFFFFFFEAEAEA666666555555C0C0C0555555B2B2B2FFFFFFC0C0C055
          5555B2B2B2F1F1F1F1F1F1FFFFFF9999995F5F5F336699FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF0FBFF3399FFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF3399FF3399FFC6D6
          EF3399FF66CCFF6699FF0099FF99CCFF3399FF0099FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF969696555555555555C0C0C0D7D7D7555555C0C0C0DDDDDD
          4D4D4D555555A4A0A0FFFFFFD7D7D75F5F5F55555566666699CCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3399FF66CCFFFFFFFF3399FFCCFFFFC6D6EF3399FF99
          CCFF3399FF66CCFFFFFFFFC6D6EFF0FBFFFFFFFFF0FBFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF666666555555808080F1F1F1FFFFFFCCCCCC555555C0C0
          C0FFFFFFFFFFFFFFFFFFFFFFFFC0C0C05555555F5F5FC0C0C0FFFFFFC6D6EFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF0FBFF3399FF0099FFF0FBFFFFFFFF0066FFCCFFFFF0FBFFFFFFFF6699FF
          99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFCCCCCC555555999999FFFFFFD7D7D7C0C0C0D7D7D755
          5555B2B2B2FFFFFFEAEAEA868686CCCCCC777777555555FFFFFFFFFFFFC0C0C0
          6699CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC6D6EF3399FFF0FBFF0066FFF0FBFF3399FF0099FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3555555868686FFFFFF6666664D4D4D
          FFFFFF555555666666F1F1F19999994D4D4DCCCCCC868686555555E3E3E3C0C0
          C0555555336699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFC6D6EF0099FF66CCFF6699FF66CCFFD6E7E73399FFF0FBFFCCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B25F5F5F4D4D4D5555
          55C0C0C0FFFFFFDDDDDD6666664D4D4D555555A4A0A0FFFFFFF1F1F17777774D
          4D4D4D4D4D80808099CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF3399FFCCFFFF66CCFF3399FF3399FF3399FF6699FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF99CCFFCCFFFF0099FFCCFFFF99CCFF6699FFF0FBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF3399FF99CCFF0099FF66CCFF3399FF3399FF99CCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          C6D6EF99CCFF66CCFF66CCFF66CCFF99CCFFC6D6EFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFFCCFFFF6699FF66CCFF6699FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF3399
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FFC6
          D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFA4A0A0B2B2B2B2B2B2B2B2B2A4A0A0FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF0099FF99CCFF3399
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCFFFF3399FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF3399FFCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5555556666665F5F5F5F5F5F555555FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
          CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF0099FF
          0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF66CCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666
          555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0099FF0066FF3399FFC6D6EF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF6699FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F6666666666
          66666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF99CCFFFFFFFFC6D6
          EF3399FF66CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66CCFF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099FF66CC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F66
          6666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF0066FF33
          99FFC6D6EFC6D6EF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6EF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099
          FF0099FF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FFC6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF
          FFFFFF99CCFF3399FF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF00
          99FF0099FF99CCFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6
          EF0099FF0099FFFFFFFF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF99CCFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF
          0099FF0099FFC6D6EFFFFFFFCCFFFF0099FF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF3399FFF0FBFF6699FF99CCFF99CCFF66CCFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399
          FF0099FF0099FFD6E7E7FFFFFFFFFFFFFFFFFFD6E7E70099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF3399FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666555555FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC6D6EF3399FFF0FBFF0066FF3399FFC6D6EFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF0FBFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FBFF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666555555FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFC6D6EFF0FBFFF0FBFFF0FBFFCCFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFC6D6EF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF0FBFF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFC6
          D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666666666666666
          555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF3399FF3399FF3399FF0099FF0066FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F6666666666
          66666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF3399FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFCCFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399FF0099FF0099FF0099FF0099
          FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F66
          6666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D5555555F5F5F55
          55554D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFF99CC
          FF0066FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3399FF0099FF00
          99FF0099FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5F5F5F666666666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F666666
          666666666666555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFF0FBFFFFFFFF66
          CCFF0099FF0099FF0099FF66CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          3399FF0099FF0099FF0099FF0099FF99CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFEAEAEA5F5F5F666666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777
          776666666666666666665F5F5FEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0
          FBFF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FFFFFFFF
          66CCFF0099FF0099FF0099FF0099FF0099FF66CCFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF3399FF0099FF0099FF0099FFF0FBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFD7D7D75F5F5F666666666666666666777777FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF8686866666666666666666665F5F5FCBCBCBFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF6699FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF0099FF3399FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFB2B2B25F5F5F666666666666666666969696FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB2B2B2666666666666666666666666999999FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF66CCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF8080806666666666666666665F5F5FC0C0C0FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD7D7D75F5F5F666666666666666666666666FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF3399
          FF0099FF0099FF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555555666666666666666666555555
          EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5555556666666666666666665F5F5F
          DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF3399FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B25F5F5F6666666666666666
          66666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8686866666666666666666
          66666666868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6699FF00
          99FF0099FF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66666666666666666666
          6666666666B2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D75F5F5F66
          6666666666666666555555EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3399FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099FF0099FFF0
          FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B25F5F5F666666
          666666666666555555F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          666666666666666666666666666666777777FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6699FF0099FF0099FF3399FF0099FF0099FF0099FF00
          99FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF0099FF0099FF
          6699FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5555556666
          66666666666666666666868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFCCCCCC555555666666666666666666555555A4A0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D6EF0099FF0099FF0099FF0099FF
          0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099
          FFC6D6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777A4
          A0A0666666666666666666555555F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF777777666666666666555555C0C0C0868686D7D7D7
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99CCFF3399
          FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF0099FF3399FF99
          CCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999
          666666C0C0C0F1F1F1A4A0A05F5F5FA4A0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1555555666666DDDDDDC0C0C0EAEA
          EA424242E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF0FBFF99CCFF66CCFF6699FF3399FF6699FF66CCFF99CCFFF0FBFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2
          B2555555969696DDDDDDE3E3E3999999666666FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C05F5F5FEAEAEA86
          8686555555C0C0C05F5F5FD7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4
          A0A0555555DDDDDDEAEAEA777777D7D7D7555555EAEAEAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999999
          555555B2B2B2F1F1F1C0C0C0666666777777A4A0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          777777666666A4A0A0E3E3E3808080EAEAEA424242CCCCCCFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF8686865F5F5FD7D7D75F5F5FA4A0A0E3E3E3777777666666EAEAEAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCC
          CC555555A4A0A0666666D7D7D7969696C0C0C0777777B2B2B2FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF868686555555D7D7D7C0C0C0B2B2B2666666CCCCCC
          424242868686EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D777
          77774D4D4DC0C0C0808080F1F1F1555555D7D7D74D4D4DB2B2B2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4A0A05F5F5FC0C0C0666666E3E3
          E3666666D7D7D7C0C0C0555555777777C0C0C0F1F1F1FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAB2B2B2666666
          777777A4A0A0E3E3E3DDDDDDA4A0A0969696FFFFFF555555D7D7D7FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D74D4D4DB2
          B2B2E3E3E3777777FFFFFF666666DDDDDDB2B2B27777775F5F5F666666868686
          B2B2B2C0C0C0CBCBCBCCCCCCCCCCCCC0C0C0A4A0A08686865F5F5F5555556666
          66999999EAEAEA868686555555D7D7D7F1F1F16666665F5F5FF1F1F1FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF8686864D4D4DC0C0C0B2B2B2777777F1F1F1F1F1F1DDDDDD7777777777
          77D7D7D7868686999999969696777777777777666666999999777777B2B2B2E3
          E3E3555555EAEAEAA4A0A0999999CCCCCC5555555F5F5FB2B2B2FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEAEAEA777777555555999999D7D7D7C0C0C0DDDDDD55
          5555C0C0C0808080868686EAEAEA666666DDDDDDCBCBCB777777EAEAEA555555
          DDDDDDCCCCCCB2B2B2B2B2B2969696B2B2B2666666969696FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEA9696964D4D4D868686
          808080555555D7D7D7B2B2B2777777F1F1F1808080D7D7D7D7D7D7777777DDDD
          DD808080E3E3E3868686CBCBCB666666666666A4A0A0FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFD7D7D7A4A0A0777777555555868686555555B2B2B2868686969696B2B2B277
          7777A4A0A0868686555555808080A4A0A0E3E3E3FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEADDDDDDC0C0C0C0C0C0B2B2B2
          B2B2B2CBCBCBD7D7D7EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        mmHeight = 14552
        mmLeft = 118004
        mmTop = 2117
        mmWidth = 16404
        BandType = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape18'
        Brush.Color = 16742726
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 5000
        mmTop = 71967
        mmWidth = 175419
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'DESCRIPTION OF GOODS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 5027
        mmTop = 72496
        mmWidth = 174890
        BandType = 0
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubCustoDestino'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        DataPipelineName = 'ppDB_PROFIT_8'
        mmHeight = 13758
        mmLeft = 0
        mmTop = 151607
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = datm_cotacao.ppDB_PROFIT_8
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 15000
          PrinterSetup.mmMarginRight = 15000
          PrinterSetup.mmMarginTop = 5000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDB_PROFIT_8'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppShape56: TppShape
              UserName = 'Shape56'
              Brush.Color = 16742726
              Pen.Style = psClear
              mmHeight = 4763
              mmLeft = 4763
              mmTop = 0
              mmWidth = 175419
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              AutoSize = False
              Caption = 'INTERNATIONAL FEES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3471
              mmLeft = 5556
              mmTop = 794
              mmWidth = 173567
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppShape55: TppShape
              UserName = 'Shape55'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 166952
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape53: TppShape
              UserName = 'Shape53'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 152665
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape52: TppShape
              UserName = 'Shape52'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 138377
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape50: TppShape
              UserName = 'Shape50'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 124090
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape49: TppShape
              UserName = 'Shape49'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 109802
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppShape47: TppShape
              UserName = 'Shape47'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 95515
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'VL_COMPRA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 110067
              mmTop = 265
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'NM_ITEM'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 5556
              mmTop = 265
              mmWidth = 67733
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText40'
              DataField = 'AP_MOEDA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 95779
              mmTop = 265
              mmWidth = 11000
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText38'
              DataField = 'NM_BASE_CALC'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 75406
              mmTop = 265
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText51: TppDBText
              UserName = 'DBText51'
              DataField = 'VL_COMPRA_TOTAL'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 124354
              mmTop = 265
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'VL_VENDA_TOTAL'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 152929
              mmTop = 265
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText79: TppDBText
              UserName = 'DBText79'
              DataField = 'VL_VENDA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 138642
              mmTop = 265
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText80: TppDBText
              UserName = 'DBText80'
              DataField = 'VL_PROFIT'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              DisplayFormat = '#0.,00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3471
              mmLeft = 167746
              mmTop = 265
              mmWidth = 11000
              BandType = 4
            end
            object ppDBText90: TppDBText
              UserName = 'DBText90'
              DataField = 'Profit'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3175
              mmLeft = 179917
              mmTop = 265
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText60: TppDBText
              UserName = 'DBText60'
              DataField = 'TX_PC'
              DataPipeline = datm_cotacao.ppDB_PROFIT_8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_8'
              mmHeight = 3471
              mmLeft = 138907
              mmTop = 265
              mmWidth = 2646
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 17198
            mmPrintPosition = 0
            object ppSubReport11: TppSubReport
              UserName = 'SubTotCustoDestino'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppDB_TOTAL_PROFIT_8'
              mmHeight = 16933
              mmLeft = 0
              mmTop = 0
              mmWidth = 180000
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport13: TppChildReport
                AutoStop = False
                DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_8
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 5000
                PrinterSetup.mmMarginLeft = 15000
                PrinterSetup.mmMarginRight = 15000
                PrinterSetup.mmMarginTop = 5000
                PrinterSetup.mmPaperHeight = 297000
                PrinterSetup.mmPaperWidth = 210000
                PrinterSetup.PaperSize = 9
                Units = utMillimeters
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppDB_TOTAL_PROFIT_8'
                object ppTitleBand13: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 3440
                  mmPrintPosition = 0
                  object ppLabel46: TppLabel
                    UserName = 'Label501'
                    AutoSize = False
                    Caption = 'TOTAL INTERNATIONAL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3471
                    mmLeft = 95779
                    mmTop = 0
                    mmWidth = 35719
                    BandType = 1
                  end
                end
                object ppDetailBand1: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppShape46: TppShape
                    UserName = 'Shape401'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 166952
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape45: TppShape
                    UserName = 'Shape45'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 152665
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape44: TppShape
                    UserName = 'Shape44'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 138377
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppShape41: TppShape
                    UserName = 'Shape41'
                    Brush.Color = 15263976
                    Pen.Color = clGray
                    Pen.Style = psClear
                    mmHeight = 4233
                    mmLeft = 95515
                    mmTop = 0
                    mmWidth = 12965
                    BandType = 4
                  end
                  object ppDBText41: TppDBText
                    UserName = 'DBText41'
                    DataField = 'AP_MOEDA'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_8
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taCentered
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_8'
                    mmHeight = 3175
                    mmLeft = 95779
                    mmTop = 265
                    mmWidth = 11000
                    BandType = 4
                  end
                  object ppDBText81: TppDBText
                    UserName = 'DBText81'
                    DataField = 'total_VENDA'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_8
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_8'
                    mmHeight = 3175
                    mmLeft = 138642
                    mmTop = 265
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppDBText82: TppDBText
                    UserName = 'DBText82'
                    DataField = 'total_VENDA_GERAL'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_8
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_8'
                    mmHeight = 3175
                    mmLeft = 152929
                    mmTop = 265
                    mmWidth = 11113
                    BandType = 4
                  end
                  object ppDBText83: TppDBText
                    UserName = 'DBText83'
                    DataField = 'VL_PROFIT'
                    DataPipeline = datm_cotacao.ppDB_TOTAL_PROFIT_8
                    DisplayFormat = '#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Calibri'
                    Font.Size = 8
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppDB_TOTAL_PROFIT_8'
                    mmHeight = 3471
                    mmLeft = 167746
                    mmTop = 265
                    mmWidth = 11113
                    BandType = 4
                  end
                end
                object ppSummaryBand13: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
        end
      end
      object ppSubReport6: TppSubReport
        UserName = 'SubTotalGeral'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport4
        TraverseAllData = False
        DataPipelineName = 'ppDB_PROFIT_ValoresTotalPorMoeda_FCL'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 165629
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = datm_cotacao.ppDB_PROFIT_ValoresTotalPorMoeda_FCL
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 15000
          PrinterSetup.mmMarginRight = 15000
          PrinterSetup.mmMarginTop = 5000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDB_PROFIT_ValoresTotalPorMoeda_FCL'
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShape51: TppShape
              UserName = 'Shape51'
              Brush.Color = 16742726
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 95779
              mmTop = 0
              mmWidth = 84402
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3471
              mmLeft = 96309
              mmTop = 265
              mmWidth = 21431
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppShape40: TppShape
              UserName = 'Shape40'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 166952
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppShape39: TppShape
              UserName = 'Shape39'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 152665
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppShape38: TppShape
              UserName = 'Shape38'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 138377
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppShape48: TppShape
              UserName = 'Shape48'
              Brush.Color = 15263976
              Pen.Color = clGray
              Pen.Style = psClear
              mmHeight = 4233
              mmLeft = 95515
              mmTop = 265
              mmWidth = 13000
              BandType = 4
            end
            object ppDBText70: TppDBText
              UserName = 'DBText70'
              DataField = 'VL_PROFIT'
              DataPipeline = datm_cotacao.ppDB_PROFIT_ValoresTotalPorMoeda_FCL
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_ValoresTotalPorMoeda_FCL'
              mmHeight = 3471
              mmLeft = 167746
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText69: TppDBText
              UserName = 'DBText69'
              DataField = 'total_VENDA_GERAL'
              DataPipeline = datm_cotacao.ppDB_PROFIT_ValoresTotalPorMoeda_FCL
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_ValoresTotalPorMoeda_FCL'
              mmHeight = 3175
              mmLeft = 152929
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText68: TppDBText
              UserName = 'DBText68'
              DataField = 'total_VENDA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_ValoresTotalPorMoeda_FCL
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_ValoresTotalPorMoeda_FCL'
              mmHeight = 3175
              mmLeft = 138642
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'DBText43'
              DataField = 'AP_MOEDA'
              DataPipeline = datm_cotacao.ppDB_PROFIT_ValoresTotalPorMoeda_FCL
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB_PROFIT_ValoresTotalPorMoeda_FCL'
              mmHeight = 3175
              mmLeft = 95779
              mmTop = 529
              mmWidth = 11000
              BandType = 4
            end
          end
          object ppSummaryBand7: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'VALIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 30163
        mmWidth = 12065
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'NM_CARGA'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 40217
        mmTop = 86519
        mmWidth = 43921
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label401'
        AutoSize = False
        Caption = 'FOB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 80963
        mmWidth = 28046
        BandType = 0
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = 'AP_MOEDA_FOB'
        DataPipeline = datm_cotacao.ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124354
        mmTop = 80963
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VL_FOB'
        DataPipeline = datm_cotacao.ppDBPipeline1
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 137848
        mmTop = 80963
        mmWidth = 32279
        BandType = 0
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = 15263976
        Pen.Color = clGray
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 76729
        mmWidth = 56356
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText17'
        DataField = 'VL_PESO_KG_LIQ'
        DataPipeline = datm_cotacao.ppDBPipeline1
        DisplayFormat = '0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3471
        mmLeft = 124354
        mmTop = 76729
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label303'
        AutoSize = False
        Caption = 'NET WEIGHT (KG)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 94986
        mmTop = 76465
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Profit - Import FCL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 155840
        mmTop = 14817
        mmWidth = 21040
        BandType = 0
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = True
        DataPipelineName = 'ppDBPipeline5'
        mmHeight = 9525
        mmLeft = 0
        mmTop = 90223
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = datm_cotacao.ppDBPipeline5
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 15000
          PrinterSetup.mmMarginRight = 15000
          PrinterSetup.mmMarginTop = 5000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipeline5'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'DESCRICPTION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3471
              mmLeft = 39688
              mmTop = 0
              mmWidth = 17314
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label55'
              Caption = 'MEASUREMENT(LxWxH)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3471
              mmLeft = 150813
              mmTop = 0
              mmWidth = 28956
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label66'
              Caption = 'PACKAGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3471
              mmLeft = 126207
              mmTop = 0
              mmWidth = 11261
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppShape22: TppShape
              UserName = 'Shape22'
              Brush.Color = 16119285
              Pen.Color = 33023
              Pen.Style = psClear
              mmHeight = 3440
              mmLeft = 39158
              mmTop = 0
              mmWidth = 85461
              BandType = 4
            end
            object ppDBMerc: TppDBText
              UserName = 'DBMerc'
              DataField = 'MERC'
              DataPipeline = datm_cotacao.ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3471
              mmLeft = 39688
              mmTop = 0
              mmWidth = 83873
              BandType = 4
            end
            object ppShape26: TppShape
              UserName = 'Shape37'
              Brush.Color = 16119285
              Pen.Color = 33023
              Pen.Style = psClear
              mmHeight = 3440
              mmLeft = 126207
              mmTop = 0
              mmWidth = 22225
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText201'
              DataField = 'NM_EMBALAGEM'
              DataPipeline = datm_cotacao.ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3440
              mmLeft = 125942
              mmTop = 0
              mmWidth = 21431
              BandType = 4
            end
            object ppShape93: TppShape
              UserName = 'Shape69'
              Brush.Color = 16119285
              Pen.Color = 33023
              Pen.Style = psClear
              mmHeight = 3440
              mmLeft = 149754
              mmTop = 0
              mmWidth = 29898
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText27'
              DataField = 'DIMENSOES'
              DataPipeline = datm_cotacao.ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3440
              mmLeft = 150813
              mmTop = 0
              mmWidth = 26194
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'MERCADORIA (NCM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3471
        mmLeft = 9260
        mmTop = 91017
        mmWidth = 28046
        BandType = 0
      end
      object ppRegion2: TppRegion
        UserName = 'Region2'
        Brush.Style = bsClear
        Caption = 'Region2'
        ParentWidth = True
        ShiftRelativeTo = ppRegion3
        Stretch = True
        Transparent = True
        mmHeight = 34396
        mmLeft = 0
        mmTop = 295805
        mmWidth = 180000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 16742726
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 1323
          mmTop = 297392
          mmWidth = 178330
          BandType = 0
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'NOSSAS OBSERVA'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3471
          mmLeft = 1588
          mmTop = 297921
          mmWidth = 178065
          BandType = 0
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'REMARKS_INDAIA'
          DataPipeline = datm_cotacao.ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 25665
          mmLeft = 1323
          mmTop = 302155
          mmWidth = 178330
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppShape34: TppShape
        UserName = 'Shape64'
        Brush.Color = 16119285
        Pen.Color = 15790320
        mmHeight = 22225
        mmLeft = 0
        mmTop = 7673
        mmWidth = 180182
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'Label11'
        Caption = 
          '"Conduzimos nossos neg'#243'cios de acordo com o modelo FIATA de Serv' +
          'i'#231'os de Agentes de Carga".'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8421440
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 36195
        mmTop = 0
        mmWidth = 110448
        BandType = 8
      end
      object ppLabel73: TppLabel
        UserName = 'Label32'
        Caption = 
          '"All business transactions are in accordance with FIATA Model Ru' +
          'les for Freight Forwarding Services"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8421440
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 33777
        mmTop = 3704
        mmWidth = 115274
        BandType = 8
      end
      object ppLabel74: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 
          ' - Rua Senador Feij'#243', 14 - 7'#186' andar - Centro 11015-500 Fone: 55-' +
          '13-3211-4000 Fax: 55-13-3211-4020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 56886
        mmTop = 8996
        mmWidth = 84667
        BandType = 8
      end
      object ppLabel75: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 
          ' - Alameda dos Nhambiquaras 1518, 10'#186' andar Moema 04.090-003 Fon' +
          'e/Fax: 55-11-5090-4400'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 55298
        mmTop = 11377
        mmWidth = 89408
        BandType = 8
      end
      object ppLabel76: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'www.myindaia.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3471
        mmLeft = 77788
        mmTop = 25929
        mmWidth = 36248
        BandType = 8
      end
      object ppLabel77: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = 'Santos,SP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 42333
        mmTop = 8996
        mmWidth = 14023
        BandType = 8
      end
      object ppLabel78: TppLabel
        UserName = 'Label52'
        AutoSize = False
        Caption = 'S'#227'o Paulo,SP '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 38894
        mmTop = 11377
        mmWidth = 16669
        BandType = 8
      end
      object ppLabel79: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Rio de Janeiro,RJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 41010
        mmTop = 13758
        mmWidth = 21167
        BandType = 8
      end
      object ppLabel80: TppLabel
        UserName = 'Label57'
        AutoSize = False
        Caption = 
          ' - Rua da Quitanda, 187 / 9'#186' andar Centro 20.091-005 Fone/Fax: 5' +
          '5-21-2516-3021'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 62706
        mmTop = 13758
        mmWidth = 77682
        BandType = 8
      end
      object ppLabel81: TppLabel
        UserName = 'Label58'
        AutoSize = False
        Caption = 'Guarulhos, SP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 12965
        mmTop = 16140
        mmWidth = 16933
        BandType = 8
      end
      object ppLabel82: TppLabel
        UserName = 'Label59'
        AutoSize = False
        Caption = 
          ' - Rodovia H'#233'lio Smidt s/n'#186' - Edif'#237'cio Teca sala 2'#186' andar, sala ' +
          '2.05 '#8211' Aeroporto Internacional de Guarulhos '#8211' 0741-970 Fone/Fax ' +
          '55-11-24455328'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 30163
        mmTop = 16140
        mmWidth = 136102
        BandType = 8
      end
      object ppLabel83: TppLabel
        UserName = 'Label60'
        Caption = 'Campinas, SP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 5556
        mmTop = 18521
        mmWidth = 16404
        BandType = 8
      end
      object ppLabel84: TppLabel
        UserName = 'Label61'
        AutoSize = False
        Caption = 
          ' '#8211' Rodovia Santos Dumont Km 66-A '#8211' Centro Empresarial Viracopos,' +
          ' unidade 101 '#8211' Aeroporto Internacional de Viracopos '#8211' 13055-900 ' +
          'Fone/Fax 55-19-3725-5997'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 22225
        mmTop = 18521
        mmWidth = 151892
        BandType = 8
      end
      object ppLabel85: TppLabel
        UserName = 'Label62'
        AutoSize = False
        Caption = 'BUENOS AIRES (ARG) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 39688
        mmTop = 20902
        mmWidth = 26194
        BandType = 8
      end
      object ppLabel86: TppLabel
        UserName = 'Label601'
        AutoSize = False
        Caption = 
          '  - Peru 590 - Piso 14 Of C., 1068 - Ciudad Autonoma de Buenos A' +
          'ires - Argentina '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 65617
        mmTop = 20902
        mmWidth = 77343
        BandType = 8
      end
      object ppLabel87: TppLabel
        UserName = 'Label64'
        AutoSize = False
        Caption = 'MIAMI,FL (USA)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 37306
        mmTop = 23283
        mmWidth = 18785
        BandType = 8
      end
      object ppLabel88: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = 
          ' '#8211' 8405 NW 53rd Street A100 Doral, FL - Mailbox: 33166  - (305) ' +
          '471-4870 / (305) 675-2467'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3471
        mmLeft = 56356
        mmTop = 23283
        mmWidth = 86784
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Calibri'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3471
        mmLeft = 167217
        mmTop = 26458
        mmWidth = 12912
        BandType = 8
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 564
    Top = 32
  end
  object pop_status_containers: TPopupMenu
    OnPopup = pop_status_containersPopup
    Left = 488
    Top = 32
    object ATIVACONTAINER1: TMenuItem
      Caption = 'Ativa/Desativa linha'
      OnClick = ATIVACONTAINER1Click
    end
  end
end
