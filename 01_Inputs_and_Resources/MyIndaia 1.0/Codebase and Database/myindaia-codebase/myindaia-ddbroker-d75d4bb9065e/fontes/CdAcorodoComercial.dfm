object frmCdAcordoComercial: TfrmCdAcordoComercial
  Left = 375
  Top = 171
  Width = 750
  Height = 550
  Caption = 'Acordo Comercial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      734
      49)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
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
    object btn_excluir: TSpeedButton
      Left = 119
      Top = 4
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
    object btn_sair: TSpeedButton
      Left = 391
      Top = 4
      Width = 38
      Height = 41
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
      OnClick = btn_sairClick
    end
    object btn_salvar: TSpeedButton
      Left = 43
      Top = 4
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
      Left = 81
      Top = 4
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
    object dbnvg: TDBNavigator
      Left = 281
      Top = 11
      Width = 96
      Height = 26
      DataSource = dsMain
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 423
      Top = 2
      Width = 309
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 12
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
      object Label2: TLabel
        Left = 148
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
      object edt_chave: TEdit
        Left = 12
        Top = 17
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 148
        Top = 17
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object pgctrl_cntr: TPageControl
    Left = 0
    Top = 49
    Width = 734
    Height = 442
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_cntrChange
    OnChanging = pgctrl_cntrChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 726
        Height = 414
        Align = alClient
        DataSource = dsMain
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbg_cadastroDblClick
        OnKeyPress = dbg_cadastroKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ACORDO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACRONIMO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindow
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 562
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 414
        Align = alClient
        BevelInner = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_nm_pais: TLabel
          Left = 14
          Top = 8
          Width = 41
          Height = 13
          Caption = 'Acordo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 110
          Top = 8
          Width = 53
          Height = 13
          Caption = 'Acr'#244'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 174
          Top = 8
          Width = 54
          Height = 13
          Caption = 'Desci'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 14
          Top = 48
          Width = 46
          Height = 13
          Caption = 'Fiesp Id'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 81
          Top = 59
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
          OnClick = SpeedButton3Click
        end
        object dbedt_Acordo: TDBEdit
          Left = 14
          Top = 22
          Width = 87
          Height = 21
          DataField = 'ACORDO'
          DataSource = dsMain
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = dbedt_AcordoChange
        end
        object dbedit_Acronimo: TDBEdit
          Left = 110
          Top = 22
          Width = 55
          Height = 21
          DataField = 'ACRONIMO'
          DataSource = dsMain
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = dbedt_AcordoChange
        end
        object dbedt_Descricao: TDBEdit
          Left = 174
          Top = 22
          Width = 527
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = dsMain
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_AcordoChange
        end
        object dbedt_Fiesp: TDBEdit
          Left = 14
          Top = 62
          Width = 59
          Height = 21
          DataField = 'FIESP_ID'
          DataSource = dsMain
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_AcordoChange
        end
      end
    end
    object tsPaises: TTabSheet
      Caption = 'Pa'#237'ses'
      ImageIndex = 2
      object Panel1: TPanel
        Left = 0
        Top = 49
        Width = 726
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 2
          Width = 27
          Height = 13
          Caption = 'Pa'#237's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBLookupComboBox: TDBLookupComboBox
          Left = 10
          Top = 20
          Width = 175
          Height = 21
          DataField = 'PAIS_CODIGO'
          DataSource = dsPaises
          Enabled = False
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dsPais
          TabOrder = 0
          OnCloseUp = dbedt_AcordoChange
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 98
        Width = 726
        Height = 316
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 8
          Top = 4
          Width = 177
          Height = 120
          DataSource = dsPaises
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 2
        object btnIncluir: TSpeedButton
          Left = 5
          Top = 4
          Width = 38
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
          OnClick = btnIncluirClick
        end
        object btnSalvar: TSpeedButton
          Left = 43
          Top = 4
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
          OnClick = btnSalvarClick
        end
        object btnCancelar: TSpeedButton
          Left = 81
          Top = 4
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
          OnClick = btnCancelarClick
        end
        object btnExcluir: TSpeedButton
          Left = 119
          Top = 4
          Width = 38
          Height = 41
          Hint = 'Excluir'
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
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 525
    Top = 356
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
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      OnClick = btn_excluirClick
    end
    object TMenuItem
    end
    object mi_sair: TMenuItem
      Caption = '&Sair'
    end
  end
  object dsMain: TDataSource
    DataSet = qryMain
    Left = 228
    Top = 256
  end
  object dsPais: TDataSource
    DataSet = QryPais
    Left = 228
    Top = 344
  end
  object QryPais: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CODIGO,DESCRICAO FROM TPAIS')
    Left = 200
    Top = 344
    object QryPaisCODIGO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TPAIS.CODIGO'
      FixedChar = True
      Size = 3
    end
    object QryPaisDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TPAIS.DESCRICAO'
      FixedChar = True
      Size = 120
    end
  end
  object updMain: TUpdateSQL
    ModifySQL.Strings = (
      'update ACORDO_COMERCIAL'
      'set'
      '  ACORDO = :ACORDO,'
      '  ACRONIMO = :ACRONIMO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FIESP_ID = :FIESP_ID'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into ACORDO_COMERCIAL'
      '  (ACORDO, ACRONIMO, DESCRICAO, FIESP_ID)'
      'values'
      '  (:ACORDO, :ACRONIMO, :DESCRICAO, :FIESP_ID)')
    DeleteSQL.Strings = (
      'delete from ACORDO_COMERCIAL'
      'where'
      '  ID = :OLD_ID')
    Left = 172
    Top = 256
  end
  object qryMain: TQuery
    CachedUpdates = True
    AfterPost = qryMainAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ID, ACORDO, ACRONIMO, DESCRICAO, FIESP_ID FROM ACORDO_COM' +
        'ERCIAL'
      'ORDER BY'
      'ACORDO')
    UpdateObject = updMain
    Left = 200
    Top = 256
    object qryMainID: TAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'DBBROKER.TIPOACORDOCOEMRCIAL.ID'
    end
    object qryMainACORDO: TStringField
      DisplayLabel = 'Acordo'
      FieldName = 'ACORDO'
      Origin = 'DBBROKER.TIPOACORDOCOEMRCIAL.ACORDO'
      FixedChar = True
      Size = 30
    end
    object qryMainACRONIMO: TStringField
      DisplayLabel = 'Acr'#244'nimo'
      FieldName = 'ACRONIMO'
      Origin = 'DBBROKER.TIPOACORDOCOEMRCIAL.ACRONIMO'
      FixedChar = True
      Size = 10
    end
    object qryMainDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TIPOACORDOCOEMRCIAL.DESCRICAO'
      FixedChar = True
      Size = 255
    end
    object qryMainFIESP_ID: TIntegerField
      DisplayLabel = 'Fiesp Id'
      FieldName = 'FIESP_ID'
    end
  end
  object dsPaises: TDataSource
    DataSet = qryPaises
    Left = 228
    Top = 292
  end
  object qryPaises: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ID, ACORDO_COMERCIAL_ID, PAIS_CODIGO FROM ACORDO_COMERCIA' +
        'L_PAISES'
      'WHERE ACORDO_COMERCIAL_ID = :ACORDO_COMERCIAL_ID')
    UpdateObject = updPaises
    Left = 200
    Top = 292
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ACORDO_COMERCIAL_ID'
        ParamType = ptInput
        Value = 0
      end>
    object qryPaisesID: TAutoIncField
      FieldName = 'ID'
      Origin = 'DBBROKER.ACORDO_COMERCIAL_PAISES.ID'
      Visible = False
    end
    object qryPaisesACORDO_COMERCIAL_ID: TIntegerField
      FieldName = 'ACORDO_COMERCIAL_ID'
      Origin = 'DBBROKER.ACORDO_COMERCIAL_PAISES.ACORDO_COMERCIAL_ID'
      Visible = False
    end
    object qryPaisesPAIS_CODIGO: TStringField
      FieldName = 'PAIS_CODIGO'
      Origin = 'DBBROKER.ACORDO_COMERCIAL_PAISES.PAIS_CODIGO'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object qryPaisesPAIS_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldKind = fkLookup
      FieldName = 'PAIS_NOME'
      LookupDataSet = QryPais
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'PAIS_CODIGO'
      Size = 30
      Lookup = True
    end
  end
  object updPaises: TUpdateSQL
    ModifySQL.Strings = (
      'update ACORDO_COMERCIAL_PAISES'
      'set'
      '  ACORDO_COMERCIAL_ID = :ACORDO_COMERCIAL_ID,'
      '  PAIS_CODIGO = :PAIS_CODIGO'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into ACORDO_COMERCIAL_PAISES'
      '  (ACORDO_COMERCIAL_ID, PAIS_CODIGO)'
      'values'
      '  (:ACORDO_COMERCIAL_ID, :PAIS_CODIGO)')
    DeleteSQL.Strings = (
      'delete from ACORDO_COMERCIAL_PAISES'
      'where'
      '  ID = :OLD_ID')
    Left = 172
    Top = 292
  end
end
