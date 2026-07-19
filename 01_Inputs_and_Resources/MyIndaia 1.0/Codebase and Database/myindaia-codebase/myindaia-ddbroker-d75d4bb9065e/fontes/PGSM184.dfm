object frm_mercadoria_exp: Tfrm_mercadoria_exp
  Left = 496
  Top = 137
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Mercadorias - Exporta'#231#227'o'
  ClientHeight = 550
  ClientWidth = 764
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton5: TSpeedButton
    Left = 377
    Top = 131
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
    OnClick = btn_co_moedaClick
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 764
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 2
      Top = 3
      Width = 38
      Height = 41
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
      Left = 117
      Top = 3
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
      OnClick = btn_excluirClick
    end
    object btn_sair: TSpeedButton
      Left = 398
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
      Left = 40
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
      Left = 78
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
    object btn_importador: TSpeedButton
      Left = 162
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Mesmo Importador'
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
      Visible = False
      OnClick = btn_importadorClick
    end
    object btn_grupo: TSpeedButton
      Left = 200
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Mesmo Grupo'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333000003333333333F777773FF333333003333300
        33333337733333773F33330333333333033333733FFFFFFF73F3303300000003
        303337F37777777337F3303330CCC0333033373337777733373F0333330C0333
        33037F33337773FFF37F03333330300033037F3FFFF73777FF7F0300000307B7
        03037F77777F77777F7F030999030BBB03037F77777F77777F7F0309990307B7
        03037377777F7777737330099903300030333777777F377737F3300000033333
        3033377777733333373333033333333303333373FF33333F7333333003333300
        3333333773FFFF77333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_grupoClick
    end
    object SpeedButton1: TSpeedButton
      Left = 248
      Top = 3
      Width = 38
      Height = 41
      Hint = 'Mesmo Grupo'
      Caption = 'IMP'
      Flat = True
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = SpeedButton1Click
    end
    object dbnvg: TDBNavigator
      Left = 290
      Top = 13
      Width = 92
      Height = 22
      DataSource = datm_mercadoria_exp.ds_lista
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      TabOrder = 0
    end
    object pnl_pesquisa: TPanel
      Left = 462
      Top = 2
      Width = 300
      Height = 45
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 6
        Top = 4
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
        Left = 142
        Top = 4
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
        Left = 7
        Top = 17
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = edt_chaveChange
        OnExit = edt_chaveExit
        OnKeyDown = edt_chaveKeyDown
      end
      object cb_ordem: TComboBox
        Left = 143
        Top = 17
        Width = 151
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnClick = cb_ordemClick
      end
    end
  end
  object pgctrl: TPageControl
    Left = 0
    Top = 49
    Width = 742
    Height = 483
    ActivePage = tshIntegracao
    Align = alClient
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrlChange
    OnChanging = pgctrlChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 756
        Height = 473
        Align = alClient
        DataSource = datm_mercadoria_exp.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'CD_MERCADORIA'
            Title.Caption = 'Mercadoria'
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
            FieldName = 'AP_MERCADORIA'
            Title.Caption = 'Apelido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Importador'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_GRUPO'
            Title.Caption = 'Grupo'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_nm_aquisicao'
            Title.Caption = 'Pa'#237's Aquisi'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_nm_pais_origem'
            Title.Caption = 'Pa'#237's Origem'
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
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 756
        Height = 473
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 14
          Top = 4
          Width = 40
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = dbedt_cd_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 156
          Top = 4
          Width = 43
          Height = 13
          Caption = 'Apelido'
          FocusControl = dbedt_ap_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_un_med_comerc: TSpeedButton
          Left = 562
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
          OnClick = btn_co_un_med_comercClick
        end
        object lbl_un_med_comerc: TLabel
          Left = 417
          Top = 4
          Width = 72
          Height = 13
          Caption = 'Unid.Medida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_unitario: TLabel
          Left = 512
          Top = 260
          Width = 78
          Height = 13
          Caption = 'Valor Unit'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_ncm_sh: TLabel
          Left = 14
          Top = 41
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
        object lbl_cd_naladi_sh: TLabel
          Left = 159
          Top = 41
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
        object lbl_naladi_ncca: TLabel
          Left = 285
          Top = 41
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
        object btn_co_ncm_sh: TSpeedButton
          Left = 124
          Top = 54
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
          OnClick = btn_co_ncm_shClick
        end
        object btn_co_naladi_sh: TSpeedButton
          Left = 247
          Top = 54
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
          Left = 378
          Top = 54
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
        object lbl_pais_aquisicao: TLabel
          Left = 416
          Top = 186
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
        object btn_co_pais_origem: TSpeedButton
          Left = 695
          Top = 236
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
          OnClick = btn_co_pais_origemClick
        end
        object Label10: TLabel
          Left = 416
          Top = 222
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
        object btn_co_pais_aquisicao: TSpeedButton
          Left = 694
          Top = 199
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
        object lbl_exportador: TLabel
          Left = 15
          Top = 148
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
        object lbl_fabr_prod: TLabel
          Left = 14
          Top = 222
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
          Left = 377
          Top = 200
          Width = 25
          Height = 20
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
          OnClick = btn_co_importadorClick
        end
        object btn_co_fabricante: TSpeedButton
          Left = 377
          Top = 236
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
        object Label9: TLabel
          Left = 416
          Top = 148
          Width = 104
          Height = 13
          Caption = 'Peso L'#237'q. Unit'#225'rio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_grupo: TLabel
          Left = 14
          Top = 113
          Width = 35
          Height = 13
          Caption = 'Grupo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_importador: TLabel
          Left = 16
          Top = 185
          Width = 61
          Height = 13
          Caption = 'Importador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_importador: TSpeedButton
          Left = 377
          Top = 162
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
        object btn_co_grupo: TSpeedButton
          Left = 251
          Top = 126
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
          OnClick = btn_co_grupoClick
        end
        object lbl_vinculacao_comp_vend: TLabel
          Left = 14
          Top = 77
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
        object Label7: TLabel
          Left = 291
          Top = 4
          Width = 76
          Height = 13
          Caption = 'C'#243'd. Material'
          FocusControl = dbedt_cd_material
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 284
          Top = 113
          Width = 92
          Height = 13
          Caption = 'Estado Produtor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_uf_produtor: TSpeedButton
          Left = 555
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
          OnClick = btn_co_uf_produtorClick
        end
        object Label17: TLabel
          Left = 538
          Top = 148
          Width = 94
          Height = 13
          Caption = 'Peso Bruto Unit.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_finalidade_merc: TLabel
          Left = 14
          Top = 259
          Width = 59
          Height = 13
          Caption = 'Finalidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_finalidade_merc: TSpeedButton
          Left = 377
          Top = 273
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
          OnClick = btn_co_finalidade_mercClick
        end
        object lbl_familia_prod: TLabel
          Left = 14
          Top = 296
          Width = 42
          Height = 13
          Caption = 'Fam'#237'lia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_familia_prod: TSpeedButton
          Left = 377
          Top = 310
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
          OnClick = btn_co_familia_prodClick
        end
        object lbl_moeda: TLabel
          Left = 14
          Top = 333
          Width = 39
          Height = 13
          Caption = 'Moeda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda: TSpeedButton
          Left = 377
          Top = 347
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
          OnClick = btn_co_moedaClick
        end
        object lbl_embalagem: TLabel
          Left = 14
          Top = 371
          Width = 65
          Height = 13
          Caption = 'Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_embalagem: TSpeedButton
          Left = 377
          Top = 384
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
          OnClick = btn_co_embalagemClick
        end
        object lbl_categoria_textil: TLabel
          Left = 416
          Top = 259
          Width = 90
          Height = 13
          Caption = 'Categoria T'#234'xtil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_qt_por_embalagem: TLabel
          Left = 415
          Top = 371
          Width = 92
          Height = 13
          Caption = 'Qt x Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 114
          Top = 77
          Width = 32
          Height = 13
          Caption = 'Linha'
          FocusControl = dbedt_nr_linha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 594
          Top = 4
          Width = 20
          Height = 13
          Caption = 'Cor'
          FocusControl = dbedt_cd_cor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_area: TSpeedButton
          Left = 695
          Top = 384
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
          OnClick = btn_co_areaClick
        end
        object Label13: TLabel
          Left = 513
          Top = 371
          Width = 27
          Height = 13
          Caption = #193'rea'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 377
          Top = 410
          Width = 148
          Height = 13
          Caption = #218'ltima altera'#231#227'o feita por:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 14
          Top = 410
          Width = 87
          Height = 13
          Caption = 'Usu'#225'rio criador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl3: TLabel
          Left = 238
          Top = 428
          Width = 25
          Height = 13
          Caption = ' em:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 599
          Top = 427
          Width = 25
          Height = 13
          Caption = ' em:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cod_imp: TLabel
          Left = 416
          Top = 40
          Width = 94
          Height = 13
          Caption = 'C'#243'd. Importa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_mercadoria: TDBEdit
          Left = 14
          Top = 18
          Width = 136
          Height = 21
          TabStop = False
          AutoSelect = False
          Color = clMenu
          DataField = 'CD_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Enabled = False
          TabOrder = 0
          OnExit = dbedt_cd_mercadoriaExit
        end
        object dbedt_ap_mercadoria: TDBEdit
          Left = 154
          Top = 18
          Width = 135
          Height = 21
          DataField = 'AP_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 1
          OnChange = controle_botoes
        end
        object dbedt_vl_unitario: TDBEdit
          Left = 512
          Top = 273
          Width = 77
          Height = 21
          DataField = 'VL_UNITARIO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 25
          ParentFont = False
          TabOrder = 34
          OnChange = controle_botoes
        end
        object dbedt_cd_un_med_comerc: TDBEdit
          Left = 417
          Top = 18
          Width = 34
          Height = 21
          DataField = 'CD_UN_MED_COMERC'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = controle_botoes
          OnExit = dbedt_cd_un_med_comercExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_un_med_comerc: TDBEdit
          Left = 452
          Top = 18
          Width = 109
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_med_comerc'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_naladi_ncca: TDBEdit
          Left = 285
          Top = 54
          Width = 91
          Height = 21
          DataField = 'CD_NALADI_NCCA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnChange = controle_botoes
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_cd_naladi_sh: TDBEdit
          Left = 159
          Top = 54
          Width = 87
          Height = 21
          DataField = 'CD_NALADI_SH'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnChange = controle_botoes
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_cd_ncm_sh: TDBEdit
          Left = 14
          Top = 54
          Width = 84
          Height = 21
          DataField = 'CD_NCM_SH'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = controle_botoes
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_cd_pais_aquisicao: TDBEdit
          Left = 416
          Top = 199
          Width = 41
          Height = 21
          DataField = 'CD_PAIS_AQUISICAO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
          OnChange = controle_botoes
          OnExit = dbedt_cd_pais_aquisicaoExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_pais_aquisicao: TDBEdit
          Left = 457
          Top = 199
          Width = 236
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_pais_aquisicao'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
        end
        object dbedt_cd_pais_origem: TDBEdit
          Left = 416
          Top = 236
          Width = 41
          Height = 21
          DataField = 'CD_PAIS_ORIGEM'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 29
          OnChange = controle_botoes
          OnExit = dbedt_cd_pais_origemExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_pais_origem: TDBEdit
          Left = 457
          Top = 236
          Width = 236
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_pais_origem'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 30
        end
        object dbedt_cd_importador: TDBEdit
          Left = 14
          Top = 199
          Width = 48
          Height = 21
          DataField = 'CD_IMPORTADOR'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
          OnChange = controle_botoes
          OnExit = dbedt_cd_importadorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_exportador: TDBEdit
          Left = 62
          Top = 162
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookExportador'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
        end
        object dbedt_cd_fabricante: TDBEdit
          Left = 14
          Top = 236
          Width = 48
          Height = 21
          DataField = 'CD_FABRICANTE'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 27
          OnChange = controle_botoes
          OnExit = dbedt_cd_fabricanteExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_fabricante: TDBEdit
          Left = 62
          Top = 236
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookFabricante'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
        end
        object dbedt_pl_mercadoria: TDBEdit
          Left = 416
          Top = 162
          Width = 111
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 21
          OnChange = controle_botoes
        end
        object dbrgrp_fabr_expo: TDBRadioGroup
          Left = 416
          Top = 299
          Width = 305
          Height = 70
          Caption = 'Fabricante/produtor'
          Color = clBtnFace
          Ctl3D = True
          DataField = 'CD_FABR_EXPO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
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
          TabOrder = 38
          TabStop = True
          Values.Strings = (
            '1'
            '2'
            '3')
          OnChange = dbrgrp_fabr_impoChange
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 14
          Top = 126
          Width = 48
          Height = 21
          DataField = 'CD_GRUPO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnChange = controle_botoes
          OnExit = dbedt_cd_grupoExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_grupo: TDBEdit
          Left = 62
          Top = 126
          Width = 186
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_grupo'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_cd_exportador: TDBEdit
          Left = 14
          Top = 162
          Width = 48
          Height = 21
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 19
          OnChange = controle_botoes
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_importador: TDBEdit
          Left = 62
          Top = 199
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_Importador'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
        end
        object cbox_cd_tipo_calculo_item: TDBLookupComboBox
          Left = 14
          Top = 90
          Width = 98
          Height = 21
          DataField = 'CD_TIPO_CALCULO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          KeyField = 'CD_TIPO_CALCULO_ITEM'
          ListField = 'DESCRICAO'
          ListSource = datm_mercadoria_exp.ds_tp_calc_item
          TabOrder = 12
          OnClick = controle_botoes
        end
        object dbedt_cd_material: TDBEdit
          Left = 291
          Top = 18
          Width = 116
          Height = 21
          DataField = 'CD_MATERIAL'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 2
          OnChange = controle_botoes
        end
        object dbchkbx_nec_li: TDBCheckBox
          Left = 596
          Top = 275
          Width = 127
          Height = 17
          Caption = 'Necessidade de LI'
          DataField = 'IN_NECESSITA_LI'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 35
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbx_nec_liClick
        end
        object dbedt_cd_uf_produtor: TDBEdit
          Left = 285
          Top = 126
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_UF_PRODUTOR'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          OnChange = controle_botoes
          OnExit = dbedt_cd_uf_produtorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_uf_produtor: TDBEdit
          Left = 315
          Top = 126
          Width = 239
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookUFProdutor'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object dbedt_pb_mercadoria: TDBEdit
          Left = 538
          Top = 162
          Width = 111
          Height = 21
          DataField = 'PB_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          OnChange = controle_botoes
        end
        object dbedt_cd_finalidade_merc: TDBEdit
          Left = 14
          Top = 273
          Width = 48
          Height = 21
          DataField = 'CD_FINALIDADE_MERC'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 31
          OnChange = controle_botoes
          OnExit = dbedt_cd_finalidade_mercExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_finalidade_merc: TDBEdit
          Left = 62
          Top = 273
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookfinalidadeMerc'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 32
        end
        object dbedt_cd_familia_prod: TDBEdit
          Left = 14
          Top = 310
          Width = 68
          Height = 21
          DataField = 'CD_FAMILIA_PROD'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 36
          OnChange = controle_botoes
          OnExit = dbedt_cd_familia_prodExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_familia_prod: TDBEdit
          Left = 82
          Top = 310
          Width = 294
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookFamiliaProd'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 37
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 14
          Top = 347
          Width = 48
          Height = 21
          DataField = 'CD_MOEDA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 39
          OnChange = controle_botoes
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 62
          Top = 347
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookMoeda'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 40
        end
        object dbedt_cd_embalagem: TDBEdit
          Left = 14
          Top = 384
          Width = 48
          Height = 21
          DataField = 'CD_EMBALAGEM'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 41
          OnChange = controle_botoes
          OnExit = dbedt_cd_embalagemExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_embalagem: TDBEdit
          Left = 62
          Top = 384
          Width = 314
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookEmbalagem'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 42
        end
        object dbedt_cd_categoria_textil: TDBEdit
          Left = 416
          Top = 273
          Width = 89
          Height = 21
          DataField = 'CD_CATEGORIA_TEXTIL'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
          OnChange = controle_botoes
        end
        object dbedt_qt_por_embalagem: TDBEdit
          Left = 416
          Top = 384
          Width = 93
          Height = 21
          DataField = 'QT_POR_EMBALAGEM'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 43
          OnChange = controle_botoes
        end
        object dbedt_nr_linha: TDBEdit
          Left = 114
          Top = 90
          Width = 75
          Height = 21
          DataField = 'NR_LINHA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 13
          OnChange = controle_botoes
        end
        object dbedt_cd_cor: TDBEdit
          Left = 596
          Top = 18
          Width = 61
          Height = 21
          DataField = 'CD_COR'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 5
          OnChange = controle_botoes
        end
        object dbedt_cd_area: TDBEdit
          Left = 513
          Top = 384
          Width = 33
          Height = 21
          DataField = 'CD_AREA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 44
          OnChange = dbedt_cd_areaChange
          OnExit = dbedt_cd_areaExit
          OnKeyDown = dbedt_cd_areaKeyDown
        end
        object dbedt_nm_area: TDBEdit
          Left = 546
          Top = 384
          Width = 148
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookArea'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 45
        end
        object dbedtUsuarioCriador: TDBEdit
          Left = 14
          Top = 424
          Width = 221
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'calcNmCriador'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 46
        end
        object dbedtDtCriador: TDBEdit
          Left = 266
          Top = 424
          Width = 90
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'DT_CRIACAO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 47
        end
        object dbedtUsuarioAlteracao: TDBEdit
          Left = 377
          Top = 424
          Width = 221
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'calcNmAlterador'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 48
        end
        object dbedtDtAlteracao: TDBEdit
          Left = 625
          Top = 424
          Width = 90
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'DT_ULT_ALTERACAO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 49
        end
        object chkAtivo: TDBCheckBox
          Left = 668
          Top = 21
          Width = 51
          Height = 17
          Caption = 'Ativo'
          DataField = 'IN_ATIVO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkbx_nec_liClick
        end
        object dbedt_cd_sulf_ncm: TDBEdit
          Left = 96
          Top = 54
          Width = 27
          Height = 21
          DataField = 'CD_SULF_NCM'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = controle_botoes
          OnExit = dbedt_cd_sulf_ncmExit
        end
        object dbedt_cd_importacao: TDBEdit
          Left = 416
          Top = 54
          Width = 113
          Height = 21
          DataField = 'CD_IMPORTACAO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          TabOrder = 11
          OnChange = controle_botoes
        end
        object dbchkImportado: TDBCheckBox
          Left = 591
          Top = 127
          Width = 126
          Height = 17
          Caption = 'Produto Importado'
          DataField = 'IN_IMPORTADO'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 18
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkbx_nec_liClick
        end
      end
    end
    object ts_descricao: TTabSheet
      Caption = ' Descri'#231#227'o '
      object pnl_descricao: TPanel
        Left = 0
        Top = 0
        Width = 756
        Height = 473
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Label4: TLabel
          Left = 16
          Top = 14
          Width = 139
          Height = 13
          Caption = 'Descri'#231#227'o em Portugu'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 15
          Top = 113
          Width = 116
          Height = 13
          Caption = 'Descri'#231#227'o em Ingl'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 16
          Top = 185
          Width = 134
          Height = 13
          Caption = 'Descri'#231#227'o em Espanhol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 16
          Top = 260
          Width = 130
          Height = 13
          Caption = 'Proced'#234'ncia em Ingl'#234's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 384
          Top = 260
          Width = 148
          Height = 13
          Caption = 'Proced'#234'ncia em Espanhol'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMarcaCLV: TLabel
          Left = 16
          Top = 322
          Width = 63
          Height = 13
          Caption = 'Marca CLV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDescricaoCLV: TLabel
          Left = 16
          Top = 394
          Width = 85
          Height = 13
          Caption = 'Descri'#231#227'o CLV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbmemo_nm_mercadoria: TDBMemo
          Left = 16
          Top = 28
          Width = 697
          Height = 53
          DataField = 'NM_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ScrollBars = ssVertical
          TabOrder = 0
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
        object Panel1: TPanel
          Left = 16
          Top = 84
          Width = 698
          Height = 22
          BevelOuter = bvLowered
          TabOrder = 1
          object Label6: TLabel
            Left = 7
            Top = 5
            Width = 36
            Height = 13
            Caption = 'Linha:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblLinha: TLabel
            Left = 44
            Top = 5
            Width = 6
            Height = 13
            Caption = '0'
          end
          object lblColuna: TLabel
            Left = 137
            Top = 5
            Width = 6
            Height = 13
            Caption = '0'
          end
          object Label18: TLabel
            Left = 91
            Top = 5
            Width = 44
            Height = 13
            Caption = 'Coluna:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 208
            Top = 5
            Width = 106
            Height = 13
            Caption = 'Tamanho da linha:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblTamanhoLinha: TLabel
            Left = 317
            Top = 5
            Width = 6
            Height = 13
            Caption = '0'
          end
          object lblTamanhoTexto: TLabel
            Left = 484
            Top = 5
            Width = 6
            Height = 13
            Caption = '0'
          end
          object Label22: TLabel
            Left = 375
            Top = 5
            Width = 107
            Height = 13
            Caption = 'Tamanho do texto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object dbmemo_nm_mercadora_ing: TDBMemo
          Left = 15
          Top = 127
          Width = 697
          Height = 53
          DataField = 'TX_DESC_INGLES'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ScrollBars = ssVertical
          TabOrder = 2
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
        object dbmemo_nm_mercadoria_esp: TDBMemo
          Left = 16
          Top = 199
          Width = 697
          Height = 53
          DataField = 'TX_DESC_ESP'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ScrollBars = ssVertical
          TabOrder = 3
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
        object dbmemo_nm_procedencia_ing: TDBMemo
          Left = 16
          Top = 274
          Width = 329
          Height = 40
          DataField = 'NM_PROCEDENCIA_ING'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Enabled = False
          ScrollBars = ssVertical
          TabOrder = 4
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
        object dbmemo_nm_procedencia_esp: TDBMemo
          Left = 384
          Top = 274
          Width = 329
          Height = 40
          DataField = 'NM_PROCEDENCIA_ESP'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          Enabled = False
          ScrollBars = ssVertical
          TabOrder = 5
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
        object dbmemo_nm_descricao_clv: TDBMemo
          Left = 16
          Top = 410
          Width = 697
          Height = 53
          DataField = 'NM_DESCRICAO_CLV'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ScrollBars = ssVertical
          TabOrder = 6
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
        object dbmemo_nm_marca_clv: TDBMemo
          Left = 16
          Top = 338
          Width = 697
          Height = 53
          DataField = 'NM_MARCA_CLV'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ScrollBars = ssVertical
          TabOrder = 7
          WordWrap = False
          OnChange = controle_botoes
          OnClick = dbmemo_nm_mercadoriaClick
          OnKeyUp = dbmemo_nm_mercadoriaKeyUp
        end
      end
    end
    object tshDescMercDraft: TTabSheet
      Caption = 'Descri'#231#227'o Draft'
      ImageIndex = 6
      object btn_co_Desc_Merc_Draft: TSpeedButton
        Left = 118
        Top = 29
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
        OnClick = btn_co_Desc_Merc_DraftClick
      end
      object Label23: TLabel
        Left = 28
        Top = 101
        Width = 119
        Height = 13
        Caption = 'Descri'#231#227'o Portugu'#234's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 28
        Top = 197
        Width = 114
        Height = 13
        Caption = 'Descri'#231#227'o Espanhol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label28: TLabel
        Left = 28
        Top = 293
        Width = 96
        Height = 13
        Caption = 'Descri'#231#227'o Ingl'#234's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 28
        Top = 12
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
      object Label32: TLabel
        Left = 28
        Top = 58
        Width = 119
        Height = 13
        Caption = 'Descri'#231#227'o Portugu'#234's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_cd_desc_merc_draft: TDBEdit
        Left = 28
        Top = 29
        Width = 85
        Height = 21
        DataField = 'CD_DESC_MERCADORIA_DRAFT'
        DataSource = datm_mercadoria_exp.ds_mercadoria
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = controle_botoes
        OnExit = dbedt_cd_embalagemExit
        OnKeyDown = dbedt_cd_un_med_comercKeyDown
      end
      object DBMemo1: TDBMemo
        Left = 29
        Top = 117
        Width = 628
        Height = 73
        DataField = 'LookDescMercDraft_Portugues'
        DataSource = datm_mercadoria_exp.ds_mercadoria
        TabOrder = 1
      end
      object DBMemo2: TDBMemo
        Left = 29
        Top = 213
        Width = 628
        Height = 73
        DataField = 'LookDescMercDraft_Espanhol'
        DataSource = datm_mercadoria_exp.ds_mercadoria
        TabOrder = 2
      end
      object DBMemo3: TDBMemo
        Left = 29
        Top = 309
        Width = 628
        Height = 73
        DataField = 'LookDescMercDraft_Ingles'
        DataSource = datm_mercadoria_exp.ds_mercadoria
        TabOrder = 3
      end
      object DBEdit1: TDBEdit
        Left = 30
        Top = 74
        Width = 627
        Height = 21
        DataField = 'LookDescricaoMercDraft'
        DataSource = datm_mercadoria_exp.ds_mercadoria
        TabOrder = 4
      end
    end
    object ts_acordo: TTabSheet
      Caption = ' Acordo/Norma '
      object pnl_acordo: TPanel
        Left = 0
        Top = 0
        Width = 756
        Height = 473
        Align = alClient
        BevelOuter = bvNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object dbgrd_acordo: TDBGrid
          Left = 0
          Top = 0
          Width = 756
          Height = 199
          Align = alClient
          DataSource = datm_mercadoria_exp.ds_merc_acordo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
              FieldName = 'CD_ACORDO'
              Title.Caption = 'Acordo'
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
              FieldName = 'LookAcordo'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 162
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_NORMA'
              Title.Caption = 'Norma'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LookNormas'
              Title.Caption = 'Descri'#231#227'o'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 391
              Visible = True
            end>
        end
        object panel3: TPanel
          Left = 0
          Top = 199
          Width = 756
          Height = 274
          Align = alBottom
          BevelInner = bvLowered
          TabOrder = 1
          object lbl_acordo: TLabel
            Left = 12
            Top = 50
            Width = 81
            Height = 13
            AutoSize = False
            Caption = 'Acordo'
            FocusControl = dbedt_cd_acordo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_acordo: TSpeedButton
            Left = 215
            Top = 63
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
            OnClick = btn_co_acordoClick
          end
          object lbl_norma: TLabel
            Left = 245
            Top = 50
            Width = 81
            Height = 13
            AutoSize = False
            Caption = 'Norma'
            FocusControl = dbedt_cd_norma
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_norma: TSpeedButton
            Left = 684
            Top = 63
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
            OnClick = btn_co_normaClick
          end
          object lbl_ncm_doc: TLabel
            Left = 12
            Top = 89
            Width = 110
            Height = 13
            Caption = 'NCM (Documentos)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_naladish_doc: TLabel
            Left = 12
            Top = 129
            Width = 151
            Height = 13
            Caption = 'NALADI/SH (Documentos)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_ncm_doc: TSpeedButton
            Left = 454
            Top = 102
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
            OnClick = btn_co_ncm_docClick
          end
          object btn_co_naladi_sh_doc: TSpeedButton
            Left = 454
            Top = 142
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
            OnClick = btn_co_naladi_sh_docClick
          end
          object lbl_naladincca_doc: TLabel
            Left = 491
            Top = 128
            Width = 120
            Height = 13
            Caption = 'NALADI/NCCA (Doc)'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object btn_co_naladi_ncca_doc: TSpeedButton
            Left = 583
            Top = 142
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
            OnClick = btn_co_naladi_ncca_docClick
          end
          object lbl_descricao: TLabel
            Left = 12
            Top = 168
            Width = 124
            Height = 13
            Caption = 'Descri'#231#227'o do Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 12
            Top = 11
            Width = 81
            Height = 13
            AutoSize = False
            Caption = 'Mercadoria'
            FocusControl = dbedt_cd_mercadoria2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cd_acordo: TDBEdit
            Left = 12
            Top = 63
            Width = 77
            Height = 21
            DataField = 'CD_ACORDO'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            TabOrder = 2
            OnChange = dbedt_cd_acordoChange
            OnExit = dbedt_cd_acordoExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
          object dbedt_nm_acordo: TDBEdit
            Left = 89
            Top = 63
            Width = 125
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookAcordo'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            MaxLength = 10
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_cd_norma: TDBEdit
            Left = 245
            Top = 63
            Width = 81
            Height = 21
            DataField = 'CD_NORMA'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            TabOrder = 4
            OnExit = dbedt_cd_normaExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
          object dbedt_nm_norma: TDBEdit
            Left = 326
            Top = 63
            Width = 355
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNormas'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_cd_ncm_doc: TDBEdit
            Left = 12
            Top = 102
            Width = 92
            Height = 21
            DataField = 'CD_NCM_DOC'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnExit = dbedt_cd_ncm_docExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
          object dbedt_cd_naladi_sh_doc: TDBEdit
            Left = 12
            Top = 142
            Width = 91
            Height = 21
            DataField = 'CD_NALADI_SH_DOC'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnExit = dbedt_cd_naladi_sh_docExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
          object dbedt_cd_naladi_ncca_doc: TDBEdit
            Left = 491
            Top = 142
            Width = 91
            Height = 21
            DataField = 'CD_NALADI_NCCA_DOC'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
            OnExit = dbedt_cd_naladi_ncca_docExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
          object dbm_descricao: TDBMemo
            Left = 12
            Top = 181
            Width = 472
            Height = 79
            DataField = 'TX_MERCADORIA'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            ScrollBars = ssVertical
            TabOrder = 11
            OnChange = controle_botoes
          end
          object dbedt_cd_mercadoria2: TDBEdit
            Left = 11
            Top = 23
            Width = 140
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CD_MERCADORIA'
            DataSource = datm_mercadoria_exp.ds_mercadoria
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_cd_acordoChange
            OnExit = dbedt_cd_acordoExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
          object dbedt_ap_mercadoria2: TDBEdit
            Left = 153
            Top = 22
            Width = 143
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'AP_MERCADORIA'
            DataSource = datm_mercadoria_exp.ds_mercadoria
            MaxLength = 20
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_nm_ncm_doc: TDBEdit
            Left = 104
            Top = 102
            Width = 349
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNCMDoc'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object dbedt_nm_naladi_doc: TDBEdit
            Left = 103
            Top = 142
            Width = 350
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNALADISHDoc'
            DataSource = datm_mercadoria_exp.ds_merc_acordo
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
    end
    object ts_MarcacaoNestle: TTabSheet
      Caption = 'Marca'#231#227'o - Nestl'#233
      ImageIndex = 4
      object dbgMercadoriaMarcacao: TDBGrid
        Left = 0
        Top = 0
        Width = 756
        Height = 257
        Align = alClient
        DataSource = datm_mercadoria_exp.ds_Mercadoria_Marcacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
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
            FieldName = 'CD_PAIS_DESTINO'
            Title.Caption = 'Cod. Pa'#237's Destino'
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
            FieldName = 'CALC_NM_PAIS_DESTINO'
            Title.Caption = 'Nome Pais Destino'
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
            FieldName = 'DS_MARCACAO'
            Title.Caption = 'Marca'#231#227'o'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 400
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 257
        Width = 756
        Height = 216
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label26: TLabel
          Left = 12
          Top = 53
          Width = 81
          Height = 13
          AutoSize = False
          Caption = 'Pa'#237's Destino'
          FocusControl = dbedtCD_PAIS_DESTINO
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnPaisDestino: TSpeedButton
          Left = 450
          Top = 65
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
          OnClick = btnPaisDestinoClick
        end
        object Label30: TLabel
          Left = 12
          Top = 127
          Width = 57
          Height = 13
          Caption = 'Marca'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 12
          Top = 11
          Width = 81
          Height = 13
          AutoSize = False
          Caption = 'Mercadoria'
          FocusControl = DBEdit8
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 12
          Top = 90
          Width = 81
          Height = 13
          AutoSize = False
          Caption = 'Importador'
          FocusControl = dbedtCD_IMPORTADOR
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCD_IMPORTADOR: TSpeedButton
          Left = 450
          Top = 102
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
          OnClick = btnCD_IMPORTADORClick
        end
        object dbedtCD_PAIS_DESTINO: TDBEdit
          Left = 12
          Top = 66
          Width = 81
          Height = 21
          DataField = 'CD_PAIS_DESTINO'
          DataSource = datm_mercadoria_exp.ds_Mercadoria_Marcacao
          TabOrder = 2
          OnChange = btnPaisDestinoClick
        end
        object dbmmDS_MARCACAO: TDBMemo
          Left = 12
          Top = 142
          Width = 463
          Height = 63
          DataField = 'DS_MARCACAO'
          DataSource = datm_mercadoria_exp.ds_Mercadoria_Marcacao
          ScrollBars = ssVertical
          TabOrder = 6
          OnChange = dbmmDS_MARCACAOChange
        end
        object DBEdit8: TDBEdit
          Left = 12
          Top = 23
          Width = 140
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_cd_acordoChange
          OnExit = dbedt_cd_acordoExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object DBEdit9: TDBEdit
          Left = 153
          Top = 23
          Width = 318
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'AP_MERCADORIA'
          DataSource = datm_mercadoria_exp.ds_mercadoria
          MaxLength = 20
          ReadOnly = True
          TabOrder = 1
        end
        object edtDS_PAIS_DESTINO: TEdit
          Left = 94
          Top = 65
          Width = 353
          Height = 21
          Color = clMenu
          TabOrder = 3
        end
        object dbedtCD_IMPORTADOR: TDBEdit
          Left = 12
          Top = 103
          Width = 81
          Height = 21
          DataField = 'CD_IMPORTADOR'
          DataSource = datm_mercadoria_exp.ds_Mercadoria_Marcacao
          TabOrder = 4
          OnChange = btnCD_IMPORTADORClick
        end
        object edtNM_IMPORTADOR: TEdit
          Left = 94
          Top = 102
          Width = 353
          Height = 21
          Color = clMenu
          TabOrder = 5
        end
      end
    end
    object tshIntegracao: TTabSheet
      Caption = 'Integra'#231#227'o'
      ImageIndex = 5
      object GroupBox1: TGroupBox
        Left = 360
        Top = 4
        Width = 369
        Height = 253
        Caption = 'Declara'#231#227'o de Origem'
        TabOrder = 0
        object btnExcluirFiespDO: TSpeedButton
          Left = 124
          Top = 16
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
          OnClick = btnExcluirFiespDOClick
        end
        object btnCancelarFiespDO: TSpeedButton
          Left = 86
          Top = 16
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
          OnClick = btnCancelarFiespDOClick
        end
        object btnSalvarFiespDO: TSpeedButton
          Left = 48
          Top = 16
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
          OnClick = btnSalvarFiespDOClick
        end
        object btnIncluirFiespDO: TSpeedButton
          Left = 10
          Top = 16
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
          OnClick = btnIncluirFiespDOClick
        end
        object Label21: TLabel
          Left = 12
          Top = 62
          Width = 109
          Height = 13
          Caption = 'Declaracao Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBGrid1: TDBGrid
          Left = 9
          Top = 104
          Width = 348
          Height = 133
          DataSource = datm_mercadoria_exp.dsMERCADORIA_EXP_DO
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dblDO: TDBLookupComboBox
          Left = 12
          Top = 77
          Width = 284
          Height = 21
          DataField = 'ID_DECLARACAO_ORIGEM'
          DataSource = datm_mercadoria_exp.dsMERCADORIA_EXP_DO
          Enabled = False
          KeyField = 'ID'
          ListField = 'Lista'
          ListSource = datm_mercadoria_exp.dsDeclaracaoOrigem
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 4
        Width = 345
        Height = 293
        Caption = 'Pa'#237's / Acordo Comercial'
        TabOrder = 1
        object btnExcluirFiespACP: TSpeedButton
          Left = 124
          Top = 16
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
          OnClick = btnExcluirFiespACPClick
        end
        object btnCancelarFiespACP: TSpeedButton
          Left = 86
          Top = 16
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
          OnClick = btnCancelarFiespACPClick
        end
        object btnSalvarFiespACP: TSpeedButton
          Left = 48
          Top = 16
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
          OnClick = btnSalvarFiespACPClick
        end
        object btnIncluirFiespACP: TSpeedButton
          Left = 10
          Top = 16
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
          OnClick = btnIncluirFiespACPClick
        end
        object Label34: TLabel
          Left = 8
          Top = 106
          Width = 100
          Height = 13
          Caption = 'Acordo Comercial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 8
          Top = 64
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
        object btn_co_pais: TSpeedButton
          Left = 309
          Top = 77
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
          OnClick = btn_co_paisClick
        end
        object DBGrid2: TDBGrid
          Left = 8
          Top = 152
          Width = 325
          Height = 129
          DataSource = datm_mercadoria_exp.dsMERCADORIA_EXP_ACP
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
        end
        object dblAcordo: TDBLookupComboBox
          Left = 8
          Top = 121
          Width = 326
          Height = 21
          DataField = 'CD_ACORDO'
          DataSource = datm_mercadoria_exp.dsMERCADORIA_EXP_ACP
          KeyField = 'CODIGO'
          ListField = 'NOME'
          ListSource = datm_mercadoria_exp.ds_acordo
          TabOrder = 1
        end
        object dbedt_cd_pais: TDBEdit
          Left = 8
          Top = 79
          Width = 50
          Height = 21
          DataField = 'CD_PAIS'
          DataSource = datm_mercadoria_exp.dsMERCADORIA_EXP_ACP
          TabOrder = 0
          OnChange = btn_co_paisClick
        end
        object edt_nm_pais: TEdit
          Left = 60
          Top = 79
          Width = 245
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 596
    Top = 12
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
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Hint = ' '
      OnClick = btn_excluirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
