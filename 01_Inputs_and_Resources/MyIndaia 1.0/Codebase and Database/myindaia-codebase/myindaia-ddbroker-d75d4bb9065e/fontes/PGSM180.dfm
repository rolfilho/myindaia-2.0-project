object frm_familia_prod: Tfrm_familia_prod
  Left = 272
  Top = 160
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Fam'#237'lia de Mercadorias'
  ClientHeight = 560
  ClientWidth = 768
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
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 47
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 3
      Top = 3
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
      Left = 117
      Top = 3
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
      Left = 431
      Top = 3
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
      Left = 41
      Top = 3
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 79
      Top = 3
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
      OnClick = btn_cancelarClick
    end
    object dbnvgr_familia_prod: TDBNavigator
      Left = 316
      Top = 11
      Width = 104
      Height = 25
      DataSource = ds_familia_prod
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
  end
  object pnl_pesquisa: TPanel
    Left = 471
    Top = 0
    Width = 271
    Height = 47
    TabOrder = 1
    object lbl_chave: TLabel
      Left = 8
      Top = 3
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
    object lbl_ordem: TLabel
      Left = 151
      Top = 3
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
      Left = 8
      Top = 18
      Width = 138
      Height = 21
      MaxLength = 8
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cbb_ordem: TComboBox
      Left = 152
      Top = 18
      Width = 111
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnClick = cbb_ordemClick
    end
  end
  object pgctrl_familia_prod: TPageControl
    Left = 0
    Top = 47
    Width = 768
    Height = 513
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 2
    OnChange = pgctrl_familia_prodChange
    OnChanging = pgctrl_familia_prodChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbgrd_familia_prod: TDBGrid
        Left = 0
        Top = 0
        Width = 760
        Height = 485
        Align = alClient
        Ctl3D = False
        DataSource = ds_familia_prod
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrd_familia_prodDblClick
        OnKeyPress = dbgrd_familia_prodKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'CD_FAMILIA_PROD'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_FAMILIA_PROD'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calc_in_ativo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
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
            FieldName = 'calc_nm_unid_neg'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nm_produto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nm_exportador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 280
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados B'#225'sicos'
      object lbl_codigo: TLabel
        Left = 7
        Top = 10
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = dbedt_cd_familia_prod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_descricao: TLabel
        Left = 6
        Top = 47
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o'
        FocusControl = dbedt_nm_familia_prod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_exportador: TLabel
        Left = 6
        Top = 159
        Width = 62
        Height = 13
        Caption = 'Exportador'
        FocusControl = dbedt_cd_exportador
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_exportador: TSpeedButton
        Left = 395
        Top = 171
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
        OnClick = btn_co_exportadorClick
      end
      object lbl_cd_produto: TLabel
        Left = 6
        Top = 122
        Width = 45
        Height = 13
        Caption = 'Produto'
        FocusControl = dbedt_cd_produto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_produto: TSpeedButton
        Left = 395
        Top = 134
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
        OnClick = btn_co_produtoClick
      end
      object lbl_unid_neg: TLabel
        Left = 6
        Top = 85
        Width = 48
        Height = 13
        Caption = 'Unidade'
        FocusControl = dbedt_cd_unid_neg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 395
        Top = 97
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
        OnClick = btn_co_unid_negClick
      end
      object bvl_alteracao: TBevel
        Left = 523
        Top = 10
        Width = 203
        Height = 72
        Shape = bsFrame
        Style = bsRaised
      end
      object lbl_alt_back: TLabel
        Left = 528
        Top = 16
        Width = 139
        Height = 13
        Caption = #218'ltima Altera'#231#227'o Fam'#237'lia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_alt_up: TLabel
        Left = 527
        Top = 15
        Width = 139
        Height = 13
        Caption = #218'ltima Altera'#231#227'o Fam'#237'lia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_usuario_back: TLabel
        Left = 531
        Top = 39
        Width = 48
        Height = 13
        Caption = 'Usu'#225'rio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl_data_back: TLabel
        Left = 531
        Top = 61
        Width = 32
        Height = 13
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblArea: TLabel
        Left = 6
        Top = 198
        Width = 27
        Height = 13
        Caption = #193'rea'
        FocusControl = dbedtArea
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnArea: TSpeedButton
        Left = 396
        Top = 210
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
        OnClick = btnAreaClick
      end
      object dbedt_cd_familia_prod: TDBEdit
        Left = 7
        Top = 23
        Width = 69
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_FAMILIA_PROD'
        DataSource = ds_familia_prod
        ReadOnly = True
        TabOrder = 0
        OnExit = dbedt_cd_familia_prodExit
      end
      object dbedt_nm_familia_prod: TDBEdit
        Left = 6
        Top = 61
        Width = 413
        Height = 21
        DataField = 'NM_FAMILIA_PROD'
        DataSource = ds_familia_prod
        TabOrder = 1
        OnExit = dbedt_cd_familia_prodExit
      end
      object edt_nm_produto: TEdit
        Left = 56
        Top = 135
        Width = 337
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 5
      end
      object edt_nm_exportador: TEdit
        Left = 56
        Top = 172
        Width = 337
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_cd_produto: TDBEdit
        Left = 6
        Top = 135
        Width = 50
        Height = 21
        DataField = 'CD_PRODUTO'
        DataSource = ds_familia_prod
        TabOrder = 4
        OnChange = btn_co_produtoClick
        OnExit = dbedt_cd_familia_prodExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_exportador: TDBEdit
        Left = 6
        Top = 172
        Width = 50
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = ds_familia_prod
        TabOrder = 6
        OnChange = btn_co_exportadorClick
        OnExit = dbedt_cd_familia_prodExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbchk_in_ativo: TDBCheckBox
        Left = 80
        Top = 25
        Width = 57
        Height = 17
        TabStop = False
        Caption = 'Ativo'
        DataField = 'IN_ATIVO'
        DataSource = ds_familia_prod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnExit = dbedt_cd_familia_prodExit
      end
      object dbedt_cd_unid_neg: TDBEdit
        Left = 6
        Top = 98
        Width = 50
        Height = 21
        DataField = 'CD_UNID_NEG'
        DataSource = ds_familia_prod
        TabOrder = 2
        OnChange = btn_co_unid_negClick
        OnExit = dbedt_cd_familia_prodExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 56
        Top = 98
        Width = 337
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_usuario: TDBEdit
        Left = 598
        Top = 34
        Width = 121
        Height = 18
        TabStop = False
        BevelInner = bvLowered
        BevelOuter = bvSpace
        BevelKind = bkTile
        BorderStyle = bsNone
        Color = clSilver
        Ctl3D = True
        DataField = 'calc_nm_usuario'
        DataSource = ds_familia_prod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_dt_alteracao: TDBEdit
        Left = 598
        Top = 57
        Width = 121
        Height = 18
        TabStop = False
        BevelInner = bvLowered
        BevelOuter = bvSpace
        BevelKind = bkTile
        BorderStyle = bsNone
        Color = clSilver
        Ctl3D = True
        DataField = 'DT_ALTERACAO'
        DataSource = ds_familia_prod
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object edtArea: TEdit
        Left = 56
        Top = 211
        Width = 337
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 11
      end
      object dbedtArea: TDBEdit
        Left = 6
        Top = 211
        Width = 50
        Height = 21
        DataField = 'CD_AREA'
        DataSource = ds_familia_prod
        TabOrder = 12
        OnChange = btnAreaClick
        OnExit = dbedt_cd_familia_prodExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
    end
    object tbsPais: TTabSheet
      Caption = 'Pa'#237'ses'
      ImageIndex = 3
      object bvl_basico: TBevel
        Left = 0
        Top = 0
        Width = 760
        Height = 485
        Align = alClient
      end
      object bvl_paises: TBevel
        Left = 7
        Top = 8
        Width = 414
        Height = 229
        Style = bsRaised
      end
      object lbl_pais: TLabel
        Left = 15
        Top = 153
        Width = 27
        Height = 13
        Caption = 'Pa'#237's'
        FocusControl = dbedt_cd_pais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais: TSpeedButton
        Left = 316
        Top = 165
        Width = 25
        Height = 23
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
        OnClick = btn_co_paisClick
      end
      object lbl_nr_dia_performace: TLabel
        Left = 348
        Top = 153
        Width = 65
        Height = 13
        Caption = 'Performace'
        FocusControl = dbedt_nr_dia_performace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dias: TLabel
        Left = 387
        Top = 170
        Width = 26
        Height = 13
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object spd_importador: TSpeedButton
        Left = 316
        Top = 208
        Width = 25
        Height = 23
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
        OnClick = spd_importadorClick
      end
      object Label1: TLabel
        Left = 15
        Top = 194
        Width = 61
        Height = 13
        Caption = 'Importador'
        FocusControl = dbedt_cd_pais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrd_pais: TDBGrid
        Left = 15
        Top = 15
        Width = 398
        Height = 134
        Ctl3D = False
        DataSource = ds_familia_pais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrd_paisDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'calc_nm_pais'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 173
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nm_importador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 194
            Visible = True
          end>
      end
      object edt_nm_pais: TEdit
        Left = 64
        Top = 166
        Width = 250
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
      object dbedt_cd_pais: TDBEdit
        Left = 15
        Top = 166
        Width = 50
        Height = 21
        DataField = 'CD_PAIS'
        DataSource = ds_familia_pais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = btn_co_paisClick
        OnExit = dbedt_cd_paisExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_nr_dia_performace: TDBEdit
        Left = 349
        Top = 166
        Width = 35
        Height = 21
        DataField = 'NR_DIA_PERFORMACE'
        DataSource = ds_familia_pais
        TabOrder = 3
      end
      object dbedt_cd_importador: TDBEdit
        Left = 15
        Top = 209
        Width = 50
        Height = 21
        DataField = 'CD_IMPORTADOR'
        DataSource = ds_familia_pais
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = dbedt_cd_importadorChange
        OnExit = dbedt_cd_importadorExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object edt_nm_importador: TEdit
        Left = 64
        Top = 209
        Width = 250
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
        TabOrder = 5
      end
      object mmo_infos: TMemo
        Left = 424
        Top = 8
        Width = 302
        Height = 262
        TabStop = False
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          ''
          '. antes de cadastrar um pa'#237's(ou mais) '#233' necess'#225'rio que o '
          'produto e exportador estejam cadastrados;'
          ''
          '. ap'#243's cadastrar um pa'#237's ser'#225' habilitado o cadastro de '
          'Instru'#231#227'o de Documentos.')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object ts_paisdoc: TTabSheet
      Caption = 'Docs. por Pa'#237's/Importador'
      ImageIndex = 2
      object pgctrl_paisdoc: TPageControl
        Left = 0
        Top = 0
        Width = 760
        Height = 485
        ActivePage = ts_lista_docs
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_paisdocChange
        OnChanging = pgctrl_paisdocChanging
        object ts_lista_docs: TTabSheet
          Caption = 'Lista'
          object bvl_lista_docspais: TBevel
            Left = 0
            Top = 0
            Width = 732
            Height = 444
            Align = alClient
          end
          object lbl_pais_1: TLabel
            Left = 16
            Top = 10
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
          object btn_co_pais_lista: TSpeedButton
            Left = 397
            Top = 22
            Width = 25
            Height = 23
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
            OnClick = btn_co_pais_listaClick
          end
          object Label2: TLabel
            Left = 16
            Top = 45
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
          object SpeedButton1: TSpeedButton
            Left = 397
            Top = 57
            Width = 24
            Height = 23
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
            OnClick = SpeedButton1Click
          end
          object dbgrd_docs: TDBGrid
            Left = 16
            Top = 93
            Width = 599
            Height = 333
            Ctl3D = False
            DataSource = ds_familia_docs
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ParentCtl3D = False
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'calc_nm_documento'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 568
                Visible = True
              end>
          end
          object edt_nm_pais_lista: TEdit
            Left = 65
            Top = 23
            Width = 330
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
          object medt_cd_pais_lista: TMaskEdit
            Left = 16
            Top = 23
            Width = 50
            Height = 21
            EditMask = '!999;1; '
            MaxLength = 3
            ReadOnly = True
            TabOrder = 2
            Text = '   '
            OnChange = btn_co_pais_listaClick
          end
          object edt_nm_importador_lista: TEdit
            Left = 65
            Top = 58
            Width = 329
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
            TabOrder = 3
          end
          object medt_cd_importador_lista: TMaskEdit
            Left = 16
            Top = 58
            Width = 48
            Height = 21
            EditMask = '!99999;1; '
            MaxLength = 5
            ReadOnly = True
            TabOrder = 4
            Text = '     '
            OnChange = medt_cd_importador_listaChange
          end
          object btn_importar: TBitBtn
            Left = 465
            Top = 55
            Width = 150
            Height = 25
            Caption = 'Importar Informa'#231#245'es'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = btn_importarClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000130B0000130B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
              FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
              00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
              F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
              00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
              F033777777777337F73309999990FFF0033377777777FFF77333099999000000
              3333777777777777333333399033333333333337773333333333333903333333
              3333333773333333333333303333333333333337333333333333}
            NumGlyphs = 2
          end
        end
        object ts_dados_basico_docs: TTabSheet
          Caption = 'Dados B'#225'sicos'
          ImageIndex = 1
          object bvl_basico_docspais: TBevel
            Left = 0
            Top = 0
            Width = 752
            Height = 457
            Align = alClient
          end
          object lbl_instrucao: TLabel
            Left = 15
            Top = 98
            Width = 122
            Height = 13
            Caption = 'Instru'#231#227'o Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_doc: TLabel
            Left = 15
            Top = 10
            Width = 65
            Height = 13
            Caption = 'Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_doc: TSpeedButton
            Left = 396
            Top = 23
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
            OnClick = btn_co_docClick
          end
          object lbl_local: TLabel
            Left = 15
            Top = 49
            Width = 32
            Height = 13
            Caption = 'Local'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object bvl_alt_doc: TBevel
            Left = 514
            Top = 10
            Width = 203
            Height = 72
            Shape = bsFrame
            Style = bsRaised
          end
          object lbl_alt_doc_down: TLabel
            Left = 519
            Top = 16
            Width = 162
            Height = 13
            Caption = #218'ltima Altera'#231#227'o Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_alt_doc_up: TLabel
            Left = 518
            Top = 15
            Width = 162
            Height = 13
            Caption = #218'ltima Altera'#231#227'o Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_user_doc_down: TLabel
            Left = 522
            Top = 39
            Width = 48
            Height = 13
            Caption = 'Usu'#225'rio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_user_doc_up: TLabel
            Left = 521
            Top = 38
            Width = 48
            Height = 13
            Caption = 'Usu'#225'rio:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_data_doc_down: TLabel
            Left = 522
            Top = 61
            Width = 32
            Height = 13
            Caption = 'Data:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_data_doc_up: TLabel
            Left = 521
            Top = 60
            Width = 32
            Height = 13
            Caption = 'Data:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object dbmmo_doc: TDBMemo
            Left = 15
            Top = 112
            Width = 696
            Height = 274
            Ctl3D = True
            DataField = 'TX_INSTRUCAO'
            DataSource = ds_familia_docs
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 3
            OnExit = dbedt_cd_docExit
          end
          object edt_nm_doc: TEdit
            Left = 64
            Top = 24
            Width = 330
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
          object dbedt_cd_doc: TDBEdit
            Left = 15
            Top = 24
            Width = 50
            Height = 21
            Color = clMenu
            DataField = 'CD_DOCUMENTO'
            DataSource = ds_familia_docs
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = btn_co_docClick
            OnExit = dbedt_cd_docExit
            OnKeyDown = dbedt_cd_produtoKeyDown
          end
          object dbrgrp_tp_local: TDBRadioGroup
            Left = 16
            Top = 60
            Width = 265
            Height = 33
            BiDiMode = bdLeftToRight
            Columns = 3
            DataField = 'TP_LOCAL'
            DataSource = ds_familia_docs
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Indai'#225
              'Cliente'
              'Outros')
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 2
            TabStop = True
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object dbedt_user_doc: TDBEdit
            Left = 589
            Top = 34
            Width = 121
            Height = 18
            TabStop = False
            BevelInner = bvLowered
            BevelOuter = bvSpace
            BevelKind = bkTile
            BorderStyle = bsNone
            Color = clSilver
            Ctl3D = True
            DataField = 'calc_nm_usuario'
            DataSource = ds_familia_docs
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3355443
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_data_doc: TDBEdit
            Left = 589
            Top = 57
            Width = 121
            Height = 18
            TabStop = False
            BevelInner = bvLowered
            BevelOuter = bvSpace
            BevelKind = bkTile
            BorderStyle = bsNone
            Color = clSilver
            Ctl3D = True
            DataField = 'DT_ALTERACAO'
            DataSource = ds_familia_docs
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3355443
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
    end
  end
  object pnl_import: TPanel
    Left = 157
    Top = 340
    Width = 428
    Height = 181
    BevelOuter = bvNone
    BorderWidth = 1
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    Visible = False
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 426
      Height = 179
      Align = alClient
      Brush.Color = clBtnFace
    end
    object Panel1: TPanel
      Left = 8
      Top = 8
      Width = 412
      Height = 169
      BevelOuter = bvNone
      TabOrder = 0
      object btn_importador_origem: TSpeedButton
        Left = 382
        Top = 114
        Width = 23
        Height = 23
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
        OnClick = btn_importador_origemClick
      end
      object btn_pais_origem: TSpeedButton
        Left = 382
        Top = 77
        Width = 23
        Height = 23
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
        OnClick = btn_pais_origemClick
      end
      object Label4: TLabel
        Left = 1
        Top = 101
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
      object Label3: TLabel
        Left = 1
        Top = 65
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
      object Label5: TLabel
        Left = 0
        Top = 4
        Width = 131
        Height = 13
        Caption = 'Informa'#231#245'es de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton4: TSpeedButton
        Left = 376
        Top = 0
        Width = 30
        Height = 34
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
        OnClick = SpeedButton4Click
      end
      object btn_familia_origem: TSpeedButton
        Left = 384
        Top = 40
        Width = 20
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
        OnClick = btn_familia_origemClick
      end
      object Label7: TLabel
        Left = 1
        Top = 28
        Width = 42
        Height = 13
        Caption = 'Fam'#237'lia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object medt_importador_origem: TMaskEdit
        Left = 1
        Top = 115
        Width = 47
        Height = 19
        Enabled = False
        EditMask = '!99999;1; '
        MaxLength = 5
        TabOrder = 0
        Text = '     '
        OnChange = medt_importador_origemChange
      end
      object edt_importador_origem: TEdit
        Left = 50
        Top = 115
        Width = 328
        Height = 19
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
      object edt_pais_origem: TEdit
        Left = 50
        Top = 78
        Width = 328
        Height = 19
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object medt_pais_origem: TMaskEdit
        Left = 1
        Top = 78
        Width = 47
        Height = 19
        EditMask = '!999;1; '
        MaxLength = 3
        TabOrder = 3
        Text = '   '
        OnChange = btn_pais_origemClick
      end
      object btn_ok_origem: TBitBtn
        Left = 168
        Top = 143
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'OK'
        Enabled = False
        TabOrder = 4
        OnClick = btn_ok_origemClick
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
      end
      object edt_familia_origem: TEdit
        Left = 112
        Top = 41
        Width = 266
        Height = 19
        TabStop = False
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object medt_familia_origem: TMaskEdit
        Left = 1
        Top = 41
        Width = 108
        Height = 19
        TabOrder = 6
        OnChange = btn_familia_origemClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 713
    Top = 324
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
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
  object qry_familia_prod_: TQuery
    BeforeInsert = qry_familia_prod_BeforeInsert
    BeforeEdit = qry_familia_prod_BeforeEdit
    AfterPost = qry_familia_prod_AfterPost
    AfterCancel = qry_familia_prod_AfterPost
    AfterDelete = qry_familia_prod_AfterPost
    AfterScroll = qry_familia_prod_AfterScroll
    OnCalcFields = qry_familia_prod_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  CD_FAMILIA_PROD, NM_FAMILIA_PROD,'
      '  CD_UNID_NEG, CD_PRODUTO, CD_EXPORTADOR, IN_ATIVO,'
      '  CD_USUARIO, DT_ALTERACAO ,CD_AREA'
      'FROM'
      '  TFAMILIA_PROD'
      'ORDER BY'
      '  NM_FAMILIA_PROD')
    Left = 567
    Top = 240
    object qry_familia_prod_CD_FAMILIA_PROD: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'DBBROKER.TFAMILIA_PROD.CD_FAMILIA_PROD'
      FixedChar = True
      Size = 8
    end
    object qry_familia_prod_NM_FAMILIA_PROD: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_FAMILIA_PROD'
      Origin = 'DBBROKER.TFAMILIA_PROD.NM_FAMILIA_PROD'
      FixedChar = True
      Size = 50
    end
    object qry_familia_prod_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TFAMILIA_PROD.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_familia_prod_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TFAMILIA_PROD.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_familia_prod_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TFAMILIA_PROD.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_familia_prod_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TFAMILIA_PROD.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_familia_prod_calc_in_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkCalculated
      FieldName = 'calc_in_ativo'
      Size = 1
      Calculated = True
    end
    object qry_familia_prod_calc_nm_unid_neg: TStringField
      DisplayLabel = 'Unid. Neg.'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_unid_neg'
      Size = 50
      Calculated = True
    end
    object qry_familia_prod_calc_nm_produto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_produto'
      Size = 40
      Calculated = True
    end
    object qry_familia_prod_calc_nm_exportador: TStringField
      DisplayLabel = 'Exportador'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_exportador'
      Size = 60
      Calculated = True
    end
    object qry_familia_prod_CD_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TFAMILIA_PROD.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_familia_prod_DT_ALTERACAO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_ALTERACAO'
      Origin = 'DBBROKER.TFAMILIA_PROD.DT_ALTERACAO'
    end
    object qry_familia_prod_calc_nm_usuario: TStringField
      DisplayWidth = 50
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_familia_prod_CD_AREA: TStringField
      FieldName = 'CD_AREA'
      Origin = 'DBBROKER.TFAMILIA_PROD.CD_AREA'
      FixedChar = True
      Size = 2
    end
  end
  object ds_familia_prod: TDataSource
    DataSet = qry_familia_prod_
    Left = 568
    Top = 227
  end
  object ds_familia_pais: TDataSource
    DataSet = qry_familia_pais_
    Left = 658
    Top = 258
  end
  object ds_familia_docs: TDataSource
    DataSet = qry_familia_docs_
    Left = 581
    Top = 175
  end
  object qry_familia_pais_: TQuery
    CachedUpdates = True
    BeforeEdit = qry_familia_pais_BeforeEdit
    AfterPost = qry_familia_pais_AfterPost
    AfterCancel = qry_familia_pais_AfterPost
    AfterDelete = qry_familia_pais_AfterPost
    OnCalcFields = qry_familia_pais_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      '  fp.CD_FAMILIA_PROD, fp.CD_PAIS, fp.NR_DIA_PERFORMACE,'
      
        '  fp.CD_USUARIO, fp.DT_ALTERACAO, fp.CD_IMPORTADOR, fp.NR_SEQUEN' +
        'CIAL, p.DESCRICAO calc_nm_pais'
      'FROM'
      '  TFAMILIA_PAIS fp'
      '  JOIN TPAIS p ON fp.CD_PAIS = p.CODIGO'
      'WHERE'
      '  fp.CD_FAMILIA_PROD = :cd_familia_prod'
      ''
      ''
      'order by p.DESCRICAO')
    UpdateMode = upWhereKeyOnly
    UpdateObject = upd_familia_pais_
    Left = 661
    Top = 247
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_familia_prod'
        ParamType = ptInput
        Size = 8
      end>
    object qry_familia_pais_CD_FAMILIA_PROD: TStringField
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'DBBROKER.TFAMILIA_PAIS.CD_FAMILIA_PROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 8
    end
    object qry_familia_pais_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TFAMILIA_PAIS.CD_PAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object qry_familia_pais_NR_DIA_PERFORMACE: TIntegerField
      FieldName = 'NR_DIA_PERFORMACE'
      Origin = 'DBBROKER.TFAMILIA_PAIS.NR_DIA_PERFORMACE'
    end
    object qry_familia_pais_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TFAMILIA_PAIS.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_familia_pais_DT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'DBBROKER.TFAMILIA_PAIS.DT_ALTERACAO'
    end
    object qry_familia_pais_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TFAMILIA_PAIS.CD_IMPORTADOR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 5
    end
    object qry_familia_pais_NR_SEQUENCIAL: TIntegerField
      FieldName = 'NR_SEQUENCIAL'
      Origin = 'DBBROKER.TFAMILIA_PAIS.NR_SEQUENCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qry_familia_pais_calc_nm_importador: TStringField
      DisplayLabel = 'Importadores'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_importador'
      ProviderFlags = []
      Size = 120
      Calculated = True
    end
    object qry_familia_pais_calc_nm_pais: TStringField
      FieldName = 'calc_nm_pais'
      Origin = 'DBBROKER.TPAIS.DESCRICAO'
      ProviderFlags = []
      FixedChar = True
      Size = 120
    end
  end
  object qry_familia_docs_: TQuery
    BeforeEdit = qry_familia_docs_BeforeEdit
    AfterPost = qry_familia_docs_AfterPost
    AfterCancel = qry_familia_docs_AfterPost
    AfterDelete = qry_familia_docs_AfterPost
    OnCalcFields = qry_familia_docs_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '  CD_FAMILIA_PROD, CD_PAIS, CD_DOCUMENTO, TP_LOCAL,'
      
        '  TX_INSTRUCAO, CD_USUARIO, DT_ALTERACAO, CD_IMPORTADOR, NR_SEQU' +
        'ENCIAL '
      'FROM'
      '  TFAMILIA_DOCS'
      'WHERE CD_FAMILIA_PROD = :cd_familia_prod'
      '  AND NR_SEQUENCIAL = :nr_sequencial')
    Left = 579
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'cd_familia_prod'
        ParamType = ptInput
        Size = 8
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'nr_sequencial'
        ParamType = ptInput
      end>
    object qry_familia_docs_CD_FAMILIA_PROD: TStringField
      FieldName = 'CD_FAMILIA_PROD'
      Origin = 'DBBROKER.TFAMILIA_DOCS.CD_FAMILIA_PROD'
      FixedChar = True
      Size = 8
    end
    object qry_familia_docs_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TFAMILIA_DOCS.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_familia_docs_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'DBBROKER.TFAMILIA_DOCS.CD_DOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_familia_docs_TP_LOCAL: TStringField
      FieldName = 'TP_LOCAL'
      Origin = 'DBBROKER.TFAMILIA_DOCS.TP_LOCAL'
      FixedChar = True
      Size = 1
    end
    object qry_familia_docs_TX_INSTRUCAO: TMemoField
      FieldName = 'TX_INSTRUCAO'
      Origin = 'DBBROKER.TFAMILIA_DOCS.TX_INSTRUCAO'
      BlobType = ftMemo
    end
    object qry_familia_docs_calc_nm_documento: TStringField
      DisplayLabel = 'Instru'#231#227'o de Embarque'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_documento'
      Size = 50
      Calculated = True
    end
    object qry_familia_docs_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TFAMILIA_DOCS.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_familia_docs_DT_ALTERACAO: TDateTimeField
      FieldName = 'DT_ALTERACAO'
      Origin = 'DBBROKER.TFAMILIA_DOCS.DT_ALTERACAO'
    end
    object qry_familia_docs_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_familia_docs_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'DBBROKER.TFAMILIA_DOCS.CD_IMPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_familia_docs_NR_SEQUENCIAL: TIntegerField
      FieldName = 'NR_SEQUENCIAL'
      Origin = 'DBBROKER.TFAMILIA_DOCS.NR_SEQUENCIAL'
    end
  end
  object upd_familia_pais_: TUpdateSQL
    ModifySQL.Strings = (
      'update TFAMILIA_PAIS'
      'set'
      '  CD_FAMILIA_PROD = :CD_FAMILIA_PROD,'
      '  CD_PAIS = :CD_PAIS,'
      '  NR_DIA_PERFORMACE = :NR_DIA_PERFORMACE,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ALTERACAO = :DT_ALTERACAO,'
      '  CD_IMPORTADOR = :CD_IMPORTADOR,'
      '  NR_SEQUENCIAL = :NR_SEQUENCIAL'
      'where'
      '  CD_FAMILIA_PROD = :OLD_CD_FAMILIA_PROD and'
      '  NR_SEQUENCIAL = :OLD_NR_SEQUENCIAL')
    InsertSQL.Strings = (
      'insert into TFAMILIA_PAIS'
      
        '  (CD_FAMILIA_PROD, CD_PAIS, NR_DIA_PERFORMACE, CD_USUARIO, DT_A' +
        'LTERACAO, '
      '   CD_IMPORTADOR, NR_SEQUENCIAL)'
      'values'
      
        '  (:CD_FAMILIA_PROD, :CD_PAIS, :NR_DIA_PERFORMACE, :CD_USUARIO, ' +
        ':DT_ALTERACAO, '
      '   :CD_IMPORTADOR, :NR_SEQUENCIAL)')
    DeleteSQL.Strings = (
      'delete from TFAMILIA_PAIS'
      'where'
      '  CD_FAMILIA_PROD = :OLD_CD_FAMILIA_PROD and'
      '  NR_SEQUENCIAL = :OLD_NR_SEQUENCIAL')
    Left = 664
    Top = 184
  end
end
