object frmEtapa: TfrmEtapa
  Left = 138
  Top = 100
  Width = 758
  Height = 596
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Cadastro de Status'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mmCadastro
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvlSeparador: TBevel
    Left = 0
    Top = 53
    Width = 750
    Height = 5
    Align = alTop
    Shape = bsSpacer
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 53
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      750
      53)
    object btnIncluir: TSpeedButton
      Left = 6
      Top = 5
      Width = 43
      Height = 43
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
      OnClick = btnIncluirClick
    end
    object btnExcluir: TSpeedButton
      Left = 135
      Top = 5
      Width = 43
      Height = 43
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
      OnClick = btnExcluirClick
    end
    object btnSair: TSpeedButton
      Left = 340
      Top = 5
      Width = 43
      Height = 43
      Hint = 'Sair'
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
      OnClick = btnSairClick
    end
    object btnSalvar: TSpeedButton
      Left = 49
      Top = 5
      Width = 43
      Height = 43
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
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 92
      Top = 5
      Width = 43
      Height = 43
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
      OnClick = btnCancelarClick
    end
    object pnlPesquisa: TPanel
      Left = 386
      Top = 5
      Width = 359
      Height = 43
      Anchors = [akTop, akRight]
      TabOrder = 0
      TabStop = True
      object lblChave: TLabel
        Left = 139
        Top = 5
        Width = 56
        Height = 13
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOrdem: TLabel
        Left = 244
        Top = 5
        Width = 37
        Height = 13
        Caption = 'Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtChave: TEdit
        Left = 138
        Top = 18
        Width = 97
        Height = 21
        TabOrder = 0
        OnChange = edtChaveChange
      end
      object cmbOrdem: TComboBox
        Left = 243
        Top = 18
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cmbOrdemClick
      end
      object dbnavEtapa: TDBNavigator
        Left = 5
        Top = 6
        Width = 128
        Height = 32
        DataSource = dsEtapa
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeira'
          'Anterior'
          'Pr'#243'xima'
          #218'ltima')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  object pgctrlEtapa: TPageControl
    Left = 0
    Top = 58
    Width = 750
    Height = 492
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 1
    OnChange = pgctrlEtapaChange
    OnChanging = pgctrlEtapaChanging
    object tsLista: TTabSheet
      Caption = 'Lista'
      object dbgrdListaEtapa: TDBGrid
        Left = 0
        Top = 46
        Width = 742
        Height = 418
        Align = alClient
        Ctl3D = False
        DataSource = dsEtapa
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrdListaEtapaDblClick
        OnKeyPress = dbgrdListaEtapaKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_ETAPA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ETAPA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calcInAtivo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = 'Wingdings'
            Font.Style = []
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcUnidade'
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
            FieldName = 'calcProduto'
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
            FieldName = 'calcEvento'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end>
      end
      object pnlUnidProd: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 46
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 6
          Top = 4
          Width = 48
          Height = 13
          Caption = 'Unidade'
          FocusControl = dbedtCodigoUnidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 378
          Top = 4
          Width = 45
          Height = 13
          Caption = 'Produto'
          FocusControl = dbedtCodigoProduto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnListaUnid: TSpeedButton
          Left = 340
          Top = 16
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
          OnClick = btnListaUnidClick
        end
        object btnListaProd: TSpeedButton
          Left = 712
          Top = 16
          Width = 23
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
          OnClick = btnListaProdClick
        end
        object edtListaUnid: TEdit
          Left = 58
          Top = 17
          Width = 281
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object edtListaNmProd: TEdit
          Left = 430
          Top = 17
          Width = 281
          Height = 21
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object edtListaCdUnid: TEdit
          Left = 6
          Top = 17
          Width = 53
          Height = 21
          MaxLength = 2
          TabOrder = 0
          OnChange = btnListaUnidClick
          OnExit = edtListaCdUnidExit
          OnKeyDown = FormKeyDown
        end
        object edtListaCdProd: TEdit
          Left = 378
          Top = 17
          Width = 53
          Height = 21
          MaxLength = 2
          TabOrder = 1
          OnChange = btnListaProdClick
          OnExit = edtListaCdProdExit
          OnKeyDown = FormKeyDown
        end
      end
    end
    object tsCadastro: TTabSheet
      Caption = 'Dados B'#225'sicos'
      ImageIndex = 1
      object bvlDadosBasicos: TBevel
        Left = 0
        Top = 0
        Width = 742
        Height = 464
        Align = alClient
        Shape = bsFrame
      end
      object lblCodigoEtapa: TLabel
        Left = 11
        Top = 10
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbedtCodigoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricao: TLabel
        Left = 11
        Top = 50
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbedtDescricaoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUnidade: TLabel
        Left = 11
        Top = 171
        Width = 48
        Height = 13
        Caption = 'Unidade'
        FocusControl = dbedtCodigoUnidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblProduto: TLabel
        Left = 11
        Top = 211
        Width = 45
        Height = 13
        Caption = 'Produto'
        FocusControl = dbedtCodigoProduto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEvento: TLabel
        Left = 11
        Top = 251
        Width = 41
        Height = 13
        Caption = 'Evento'
        FocusControl = dbedtCodigoEvento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnConsultaUnidade: TSpeedButton
        Left = 418
        Top = 184
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
        OnClick = btnConsultaUnidadeClick
      end
      object btnConsultaProduto: TSpeedButton
        Left = 418
        Top = 224
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
        OnClick = btnConsultaProdutoClick
      end
      object btnConsultaEvento: TSpeedButton
        Left = 418
        Top = 264
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
        OnClick = btnConsultaEventoClick
      end
      object lblDescIngles: TLabel
        Left = 11
        Top = 90
        Width = 104
        Height = 13
        Caption = 'Descri'#231#227'o (Ingl'#234's)'
        FocusControl = dbedtDescIngles
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescEspanhol: TLabel
        Left = 11
        Top = 130
        Width = 122
        Height = 13
        Caption = 'Descri'#231#227'o (Espanhol)'
        FocusControl = dbedtDescEspanhol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtCodigoEtapa: TDBEdit
        Left = 12
        Top = 23
        Width = 50
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'CD_ETAPA'
        DataSource = dsEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtDescricaoEtapa: TDBEdit
        Tag = 666
        Left = 12
        Top = 63
        Width = 431
        Height = 21
        DataField = 'NM_ETAPA'
        DataSource = dsEtapa
        TabOrder = 2
      end
      object edtNomeUnidade: TEdit
        Left = 67
        Top = 184
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 6
      end
      object edtNomeProduto: TEdit
        Left = 67
        Top = 224
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 8
      end
      object edtNomeEvento: TEdit
        Left = 67
        Top = 264
        Width = 350
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 10
      end
      object dbchkInUrgente: TDBCheckBox
        Left = 74
        Top = 24
        Width = 57
        Height = 17
        Caption = 'Ativo'
        DataField = 'IN_ATIVO'
        DataSource = dsEtapa
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
      object dbedtDescIngles: TDBEdit
        Left = 12
        Top = 103
        Width = 431
        Height = 21
        DataField = 'NM_INGLES'
        DataSource = dsEtapa
        TabOrder = 3
      end
      object dbedtDescEspanhol: TDBEdit
        Left = 12
        Top = 143
        Width = 431
        Height = 21
        DataField = 'NM_ESPANHOL'
        DataSource = dsEtapa
        TabOrder = 4
      end
      object dbedtCodigoEvento: TDBEdit
        Left = 12
        Top = 264
        Width = 56
        Height = 21
        DataField = 'CD_EVENTO'
        DataSource = dsEtapa
        TabOrder = 9
        OnChange = btnConsultaEventoClick
        OnExit = dbedtCodigoEventoExit
        OnKeyDown = FormKeyDown
      end
      object dbedtCodigoProduto: TDBEdit
        Left = 12
        Top = 224
        Width = 56
        Height = 21
        DataField = 'CD_PRODUTO'
        DataSource = dsEtapa
        TabOrder = 7
        OnChange = btnConsultaProdutoClick
        OnExit = dbedtCodigoProdutoExit
        OnKeyDown = FormKeyDown
      end
      object dbedtCodigoUnidade: TDBEdit
        Left = 12
        Top = 184
        Width = 56
        Height = 21
        DataField = 'CD_UNID_NEG'
        DataSource = dsEtapa
        TabOrder = 5
        OnChange = btnConsultaUnidadeClick
        OnExit = dbedtCodigoUnidadeExit
        OnKeyDown = FormKeyDown
      end
      object DBCheckBox1: TDBCheckBox
        Left = 12
        Top = 293
        Width = 389
        Height = 17
        Caption = 'Esta '#233' uma etapa que automaticamente ir'#225' alimentar o FollowUp'
        DataField = 'IN_ETAPA_AUTOMATICA'
        DataSource = dsEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox2: TDBCheckBox
        Left = 12
        Top = 314
        Width = 184
        Height = 17
        Caption = 'Este Status '#233' um retrabalho'
        DataField = 'IN_RETRABALHO'
        DataSource = dsEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object tsOrdena: TTabSheet
      Caption = 'Ordena'#231#227'o de Autom'#225'ticos'
      ImageIndex = 2
      object btnEfetivar: TSpeedButton
        Left = 616
        Top = 423
        Width = 119
        Height = 36
        Hint = 'Incluir'
        Caption = 'Efetivar Altera'#231#245'es'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
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
        OnClick = btnEfetivarClick
      end
      object btnCima: TSpeedButton
        Left = 2
        Top = 18
        Width = 33
        Height = 193
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000333
          3333333333777F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333FF7F7FFFF333333000090000
          3333333777737777F333333099999990333333373F3333373333333309999903
          333333337F33337F33333333099999033333333373F333733333333330999033
          3333333337F337F3333333333099903333333333373F37333333333333090333
          33333333337F7F33333333333309033333333333337373333333333333303333
          333333333337F333333333333330333333333333333733333333}
        NumGlyphs = 2
        OnClick = btnCimaClick
      end
      object btnBaixo: TSpeedButton
        Left = 2
        Top = 213
        Width = 33
        Height = 193
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337F33333333333333033333333333333373F333333333333090333
          33333333337F7F33333333333309033333333333337373F33333333330999033
          3333333337F337F33333333330999033333333333733373F3333333309999903
          333333337F33337F33333333099999033333333373333373F333333099999990
          33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333309033333333333337F7F333333333333090333
          33333333337F7F33333333333300033333333333337773333333}
        NumGlyphs = 2
        OnClick = btnBaixoClick
      end
      object lstCod: TListBox
        Left = 38
        Top = 8
        Width = 697
        Height = 408
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
      end
    end
  end
  object mmCadastro: TMainMenu
    Left = 635
    Top = 221
    object mniIncluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      OnClick = btnIncluirClick
    end
    object mniSalvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btnSalvarClick
    end
    object mniCancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btnCancelarClick
    end
    object mniExcluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
      OnClick = btnExcluirClick
    end
    object mniSair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
    end
  end
  object dsEtapa: TDataSource
    DataSet = qryEtapa
    OnStateChange = dsEtapaStateChange
    Left = 611
    Top = 474
  end
  object qryEtapa: TQuery
    CachedUpdates = True
    AfterPost = qryEtapaAfterPost
    AfterDelete = qryEtapaAfterDelete
    OnCalcFields = qryEtapaCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_ETAPA, NM_ETAPA, NM_INGLES, NM_ESPANHOL, IN_ATIVO, CD_' +
        'UNID_NEG, CD_PRODUTO, CD_EVENTO, IN_ETAPA_AUTOMATICA, IN_RETRABA' +
        'LHO'
      'FROM TETAPA (NOLOCK)'
      
        'WHERE ((CD_UNID_NEG = :CD_UNID_NEG) OR (CD_UNID_NEG IS NULL))  A' +
        'ND ((CD_PRODUTO = :CD_PRODUTO) OR (CD_PRODUTO IS NULL))'
      'ORDER BY'
      'CD_ETAPA')
    UpdateObject = updEtapa
    Left = 645
    Top = 474
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qryEtapaCD_ETAPA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TETAPA.CD_ETAPA'
    end
    object qryEtapaNM_ETAPA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_ETAPA'
      Origin = 'DBBROKER.TETAPA.NM_ETAPA'
      FixedChar = True
      Size = 200
    end
    object qryEtapaNM_INGLES: TStringField
      DisplayLabel = 'Descri'#231#227'o (Ingl'#234's)'
      FieldName = 'NM_INGLES'
      Origin = 'DBBROKER.TETAPA.NM_INGLES'
      FixedChar = True
      Size = 50
    end
    object qryEtapaNM_ESPANHOL: TStringField
      DisplayLabel = 'Descri'#231#227'o (Espanhol)'
      FieldName = 'NM_ESPANHOL'
      Origin = 'DBBROKER.TETAPA.NM_ESPANHOL'
      FixedChar = True
      Size = 50
    end
    object qryEtapaIN_ATIVO: TIntegerField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TETAPA.IN_ATIVO'
    end
    object qryEtapaCD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TETAPA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryEtapaCD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TETAPA.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryEtapaCD_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TETAPA.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryEtapacalcInAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkCalculated
      FieldName = 'calcInAtivo'
      Size = 1
      Calculated = True
    end
    object qryEtapacalcUnidade: TStringField
      DisplayLabel = 'Unidade'
      FieldKind = fkCalculated
      FieldName = 'calcUnidade'
      Size = 10
      Calculated = True
    end
    object qryEtapacalcProduto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkCalculated
      FieldName = 'calcProduto'
      Size = 10
      Calculated = True
    end
    object qryEtapacalcEvento: TStringField
      DisplayLabel = 'Evento'
      FieldKind = fkCalculated
      FieldName = 'calcEvento'
      Size = 50
      Calculated = True
    end
    object qryEtapaIN_ETAPA_AUTOMATICA: TStringField
      FieldName = 'IN_ETAPA_AUTOMATICA'
      Origin = 'DBBROKER.TETAPA.IN_ETAPA_AUTOMATICA'
      FixedChar = True
      Size = 1
    end
    object qryEtapaIN_RETRABALHO: TStringField
      FieldName = 'IN_RETRABALHO'
      Origin = 'DBBROKER.TETAPA.IN_RETRABALHO'
      FixedChar = True
      Size = 1
    end
  end
  object updEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TETAPA'
      'set'
      '  CD_ETAPA = :CD_ETAPA,'
      '  NM_ETAPA = :NM_ETAPA,'
      '  NM_INGLES = :NM_INGLES,'
      '  NM_ESPANHOL = :NM_ESPANHOL,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_EVENTO = :CD_EVENTO,'
      '  IN_ETAPA_AUTOMATICA = :IN_ETAPA_AUTOMATICA,'
      '  IN_RETRABALHO = :IN_RETRABALHO'
      'where'
      '  CD_ETAPA = :OLD_CD_ETAPA')
    InsertSQL.Strings = (
      'insert into TETAPA'
      '  (CD_ETAPA, NM_ETAPA, NM_INGLES, NM_ESPANHOL, IN_ATIVO, '
      'CD_UNID_NEG, CD_PRODUTO, '
      '   CD_EVENTO, IN_ETAPA_AUTOMATICA, IN_RETRABALHO)'
      'values'
      '  (:CD_ETAPA, :NM_ETAPA, :NM_INGLES, :NM_ESPANHOL, :IN_ATIVO, '
      ':CD_UNID_NEG, '
      
        '   :CD_PRODUTO, :CD_EVENTO, :IN_ETAPA_AUTOMATICA, :IN_RETRABALHO' +
        ')')
    DeleteSQL.Strings = (
      'delete from TETAPA'
      'where'
      '  CD_ETAPA = :OLD_CD_ETAPA')
    Left = 679
    Top = 474
  end
  object qryUltimoCodigoEtapa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_ETAPA) AS ULTIMO'
      'FROM TETAPA (NOLOCK)')
    Left = 645
    Top = 425
    object qryUltimoCodigoEtapaULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TETAPA.CD_ETAPA'
    end
  end
end
