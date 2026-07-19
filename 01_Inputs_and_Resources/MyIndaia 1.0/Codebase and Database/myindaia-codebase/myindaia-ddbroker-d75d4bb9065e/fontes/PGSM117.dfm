object frm_mercadoria: Tfrm_mercadoria
  Left = 433
  Top = 211
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Mercadorias'
  ClientHeight = 591
  ClientWidth = 789
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
  object Label6: TLabel
    Left = 24
    Top = 235
    Width = 58
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Apelido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 44
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 34
      Height = 37
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
      Left = 107
      Top = 4
      Width = 34
      Height = 37
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
      Left = 400
      Top = 4
      Width = 34
      Height = 37
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
      Left = 39
      Top = 4
      Width = 34
      Height = 37
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
      Left = 73
      Top = 4
      Width = 34
      Height = 37
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
      Left = 147
      Top = 4
      Width = 34
      Height = 37
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
      Left = 181
      Top = 4
      Width = 34
      Height = 37
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
    object btn_pesq: TSpeedButton
      Left = 362
      Top = 4
      Width = 34
      Height = 37
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
      OnClick = btn_pesqClick
    end
    object btn_duplica: TSpeedButton
      Left = 216
      Top = 4
      Width = 34
      Height = 37
      Hint = 'Duplica'#231#227'o de Mercadoria'
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
    object dbnvg: TDBNavigator
      Left = 254
      Top = 8
      Width = 104
      Height = 26
      DataSource = datm_mercadoria.ds_lista
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
      Left = 484
      Top = 2
      Width = 303
      Height = 40
      Align = alRight
      BevelInner = bvLowered
      ParentColor = True
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
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
      object Label2: TLabel
        Left = 144
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
        Top = 16
        Width = 129
        Height = 21
        TabOrder = 0
        OnExit = edt_chaveExit
      end
      object cb_ordem: TComboBox
        Left = 144
        Top = 16
        Width = 153
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
    Top = 44
    Width = 789
    Height = 547
    ActivePage = ts_dados_basicos
    Align = alClient
    TabOrder = 1
    OnChange = pgctrlChange
    OnChanging = pgctrlChanging
    object tsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 781
        Height = 519
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label18: TLabel
        Left = 22
        Top = 20
        Width = 40
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = edt_cd_mercadoria
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 22
        Top = 64
        Width = 43
        Height = 13
        Caption = 'Apelido'
        FocusControl = edt_ap_mercadoria
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 22
        Top = 112
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
      object bnt_co_grupo: TSpeedButton
        Left = 259
        Top = 125
        Width = 25
        Height = 21
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
        OnClick = bnt_co_grupoClick
      end
      object Label21: TLabel
        Left = 22
        Top = 158
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
      object bnt_co_importador: TSpeedButton
        Left = 388
        Top = 172
        Width = 25
        Height = 21
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
        OnClick = bnt_co_importadorClick
      end
      object Label22: TLabel
        Left = 22
        Top = 210
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
      object bnt_co_pais_aquisicao: TSpeedButton
        Left = 225
        Top = 224
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
        OnClick = bnt_co_pais_aquisicaoClick
      end
      object Label23: TLabel
        Left = 22
        Top = 258
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
      object bnt_co_pais_origem: TSpeedButton
        Left = 225
        Top = 272
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
        OnClick = bnt_co_pais_origemClick
      end
      object edt_cd_mercadoria: TEdit
        Left = 22
        Top = 34
        Width = 108
        Height = 21
        AutoSelect = False
        MaxLength = 15
        TabOrder = 0
      end
      object edt_ap_mercadoria: TEdit
        Left = 22
        Top = 76
        Width = 136
        Height = 21
        MaxLength = 25
        TabOrder = 1
      end
      object edt_cd_grupo: TEdit
        Left = 22
        Top = 125
        Width = 45
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 2
        OnExit = edt_cd_grupoExit
      end
      object edt_look_nm_grupo: TEdit
        Left = 70
        Top = 125
        Width = 186
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edt_cd_importador: TEdit
        Left = 22
        Top = 172
        Width = 45
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 4
        OnExit = edt_cd_importadorExit
      end
      object edt_look_nm_importador: TEdit
        Left = 70
        Top = 172
        Width = 315
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edt_look_nm_pais_aquisicao: TEdit
        Left = 70
        Top = 224
        Width = 151
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edt_look_nm_pais_origem: TEdit
        Left = 70
        Top = 272
        Width = 151
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 7
      end
      object edt_cd_pais_aquisicao: TMaskEdit
        Left = 22
        Top = 224
        Width = 45
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 8
        OnExit = edt_cd_pais_aquisicaoExit
      end
      object edt_cd_pais_origem: TMaskEdit
        Left = 22
        Top = 272
        Width = 45
        Height = 21
        MaxLength = 3
        TabOrder = 9
        OnExit = edt_cd_pais_origemExit
      end
    end
    object ts_lista: TTabSheet
      BorderWidth = 4
      Caption = '&Lista'
      object dbg_cadastro: TDBGrid
        Left = 0
        Top = 0
        Width = 773
        Height = 511
        Align = alClient
        DataSource = datm_mercadoria.ds_lista
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
            Title.Caption = 'C'#243'digo'
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
            Title.Caption = 'NCM/SH'
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
            FieldName = 'AP_MERCADORIA'
            Title.Caption = 'Apelido'
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
            FieldName = 'NM_EMPRESA'
            Title.Caption = 'Importador'
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
            Expanded = False
            FieldName = 'NM_GRUPO'
            Title.Caption = 'Grupo'
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
            Expanded = False
            FieldName = 'NM_PAIS_AQUISICAO'
            Title.Caption = 'Pa'#237's aquisi'#231#227'o'
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
            Expanded = False
            FieldName = 'NM_PAIS_ORIGEM'
            Title.Caption = 'Pa'#237's Origem'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 200
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = 'Dados B'#225'sicos'
      object pnl_entrada_de_dados: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 519
        Align = alClient
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object Label3: TLabel
          Left = 15
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
          Left = 174
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
          Left = 347
          Top = 57
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
          Left = 15
          Top = 41
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
          Left = 556
          Top = 41
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
          Left = 391
          Top = 4
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
          Left = 15
          Top = 82
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
          Left = 143
          Top = 82
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
          Left = 512
          Top = 17
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
          Left = 102
          Top = 95
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
          Left = 240
          Top = 95
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
          Left = 440
          Top = 198
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
          Left = 720
          Top = 250
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
          Left = 440
          Top = 236
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
          Left = 720
          Top = 211
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
          Top = 198
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
          Left = 15
          Top = 236
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
          Left = 381
          Top = 211
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
          Left = 381
          Top = 250
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
          Left = 440
          Top = 160
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
          Left = 15
          Top = 120
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
          Left = 15
          Top = 160
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
          Left = 381
          Top = 174
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
          OnClick = btn_co_importadorClick
        end
        object btn_co_grupo: TSpeedButton
          Left = 381
          Top = 133
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
          Left = 281
          Top = 82
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
          Left = 391
          Top = 41
          Width = 99
          Height = 13
          Caption = 'Material ( Artigo )'
          FocusControl = dbedt_cd_material
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 440
          Top = 120
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
          Left = 719
          Top = 133
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
          Left = 568
          Top = 160
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
          Left = 15
          Top = 278
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
          Left = 381
          Top = 292
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
          Left = 15
          Top = 629
          Width = 149
          Height = 13
          Caption = 'Fam'#237'lia (Left:15; Top:245)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_familia_prod: TSpeedButton
          Left = 381
          Top = 643
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
          Visible = False
          OnClick = btn_co_familia_prodClick
        end
        object lbl_moeda: TLabel
          Left = 15
          Top = 316
          Width = 39
          Height = 13
          Hint = '(Left: 15; Top: 280)'
          Caption = 'Moeda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object btn_co_moeda: TSpeedButton
          Left = 381
          Top = 330
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
          Left = 15
          Top = 667
          Width = 172
          Height = 13
          Caption = 'Embalagem (Left:15; Top:315)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_embalagem: TSpeedButton
          Left = 381
          Top = 681
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
          Visible = False
          OnClick = btn_co_embalagemClick
        end
        object lbl_categoria_textil: TLabel
          Left = 416
          Top = 699
          Width = 204
          Height = 13
          Caption = 'Categoria T'#234'xtil (Left:416; Top:219)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lbl_qt_por_embalagem: TLabel
          Left = 15
          Top = 434
          Width = 119
          Height = 13
          Caption = 'Qtde Por Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_ONU: TLabel
          Left = 440
          Top = 82
          Width = 58
          Height = 13
          Caption = 'C'#243'd. ONU'
          FocusControl = dbedt_cd_onu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_classe: TLabel
          Left = 168
          Top = 434
          Width = 38
          Height = 13
          Caption = 'Classe'
          FocusControl = dbedt_cd_classe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_area: TLabel
          Left = 15
          Top = 355
          Width = 27
          Height = 13
          Hint = '(Left:15; Top:351)'
          Caption = #193'rea'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
        end
        object btn_co_area: TSpeedButton
          Left = 381
          Top = 368
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
          OnClick = btn_co_areaClick
        end
        object Label24: TLabel
          Left = 248
          Top = 434
          Width = 141
          Height = 13
          Caption = 'Necessita Ato Drawback'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 15
          Top = 705
          Width = 173
          Height = 13
          Caption = 'Propriet'#225'rio (Left:15; Top:385)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_proprietario: TSpeedButton
          Left = 381
          Top = 718
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
          Visible = False
          OnClick = btn_co_proprietarioClick
        end
        object Bevel4: TBevel
          Left = 440
          Top = 478
          Width = 304
          Height = 25
          Shape = bsFrame
          Style = bsRaised
        end
        object lbl1: TLabel
          Left = 65
          Top = 481
          Width = 48
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Cria'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxtUsuarioCriacao: TDBText
          Left = 123
          Top = 481
          Width = 297
          Height = 13
          DataField = 'calcNmCriador'
          DataSource = datm_mercadoria.ds_mercadoria
        end
        object Label28: TLabel
          Left = 16
          Top = 499
          Width = 97
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = #218'ltima altera'#231#227'o:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbtxtUltimaAlteracao: TDBText
          Left = 123
          Top = 499
          Width = 297
          Height = 13
          DataField = 'calcNmAlterador'
          DataSource = datm_mercadoria.ds_mercadoria
        end
        object Label29: TLabel
          Left = 15
          Top = 392
          Width = 61
          Height = 13
          Hint = '(Left:15; Top:388)'
          Caption = 'Planejador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_planejador: TSpeedButton
          Left = 381
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
          OnClick = btn_co_planejadorClick
        end
        object Label73: TLabel
          Left = 556
          Top = 5
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
        object Label35: TLabel
          Left = 523
          Top = 82
          Width = 81
          Height = 13
          Caption = 'C'#243'd. Cat'#225'logo'
          FocusControl = edtCdCatalogoProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNrVersaoCatProd: TLabel
          Left = 621
          Top = 82
          Width = 94
          Height = 13
          Caption = 'Vers'#227'o Cat'#225'logo'
          FocusControl = edtNrVersaoCatProd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_mercadoria: TDBEdit
          Left = 15
          Top = 17
          Width = 149
          Height = 21
          TabStop = False
          AutoSelect = False
          Color = clMenu
          DataField = 'CD_MERCADORIA'
          DataSource = datm_mercadoria.ds_mercadoria
          ReadOnly = True
          TabOrder = 0
          OnExit = dbedt_cd_mercadoriaExit
        end
        object dbedt_ap_mercadoria: TDBEdit
          Left = 174
          Top = 17
          Width = 205
          Height = 21
          DataField = 'AP_MERCADORIA'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 1
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_ap_mercadoriaExit
        end
        object dbedt_vl_unitario: TDBEdit
          Left = 556
          Top = 57
          Width = 123
          Height = 21
          DataField = 'VL_UNITARIO'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 25
          ParentFont = False
          TabOrder = 11
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_un_med_comerc: TDBEdit
          Left = 15
          Top = 57
          Width = 38
          Height = 21
          DataField = 'CD_UN_MED_COMERC'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_un_med_comercExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_un_med_comerc: TDBEdit
          Left = 53
          Top = 57
          Width = 290
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_med_comerc'
          DataSource = datm_mercadoria.ds_mercadoria
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 50
        end
        object dbedt_naladi_ncca: TDBEdit
          Left = 143
          Top = 95
          Width = 99
          Height = 21
          DataField = 'CD_NALADI_NCCA'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = dbedt_ap_mercadoriaChange
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_cd_naladi_sh: TDBEdit
          Left = 15
          Top = 95
          Width = 90
          Height = 21
          DataField = 'CD_NALADI_SH'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnChange = dbedt_ap_mercadoriaChange
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_cd_ncm_sh: TDBEdit
          Left = 391
          Top = 17
          Width = 118
          Height = 21
          DataField = 'CD_NCM_SH'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_ncm_shExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_cd_pais_aquisicao: TDBEdit
          Left = 440
          Top = 211
          Width = 41
          Height = 21
          DataField = 'CD_PAIS_AQUISICAO'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_pais_aquisicaoExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_pais_aquisicao: TDBEdit
          Left = 481
          Top = 211
          Width = 238
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_pais_aquisicao'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 21
        end
        object dbedt_cd_pais_origem: TDBEdit
          Left = 440
          Top = 250
          Width = 41
          Height = 21
          DataField = 'CD_PAIS_ORIGEM'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 24
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_pais_origemExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_pais_origem: TDBEdit
          Left = 481
          Top = 250
          Width = 238
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_pais_origem'
          DataSource = datm_mercadoria.ds_mercadoria
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 25
        end
        object dbedt_cd_exportador: TDBEdit
          Left = 15
          Top = 211
          Width = 48
          Height = 21
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_exportador: TDBEdit
          Left = 63
          Top = 211
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookExportador'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
        end
        object dbedt_cd_fabricante: TDBEdit
          Left = 15
          Top = 250
          Width = 48
          Height = 21
          DataField = 'CD_FABRICANTE'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 22
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_fabricanteExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_fabricante: TDBEdit
          Left = 63
          Top = 250
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookFabricante'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 23
        end
        object dbedt_pl_mercadoria: TDBEdit
          Left = 440
          Top = 174
          Width = 111
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbrgrp_fabr_expo: TDBRadioGroup
          Left = 440
          Top = 318
          Width = 303
          Height = 61
          Caption = 'Fabricante/produtor'
          Color = clBtnFace
          Ctl3D = True
          DataField = 'CD_FABR_EXPO'
          DataSource = datm_mercadoria.ds_mercadoria
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
          TabOrder = 35
          TabStop = True
          Values.Strings = (
            '1'
            '2'
            '3')
          OnChange = dbrgrp_fabr_expoChange
        end
        object dbedt_cd_grupo: TDBEdit
          Left = 15
          Top = 133
          Width = 48
          Height = 21
          DataField = 'CD_GRUPO'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_grupoExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_grupo: TDBEdit
          Left = 63
          Top = 133
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_grupo'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 51
        end
        object dbedt_cd_importador: TDBEdit
          Left = 15
          Top = 174
          Width = 48
          Height = 21
          DataField = 'CD_IMPORTADOR'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_importadorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_look_nm_importador: TDBEdit
          Left = 63
          Top = 174
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_importador'
          DataSource = datm_mercadoria.ds_mercadoria
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
        object cbox_cd_tipo_calculo_item: TDBLookupComboBox
          Left = 281
          Top = 95
          Width = 149
          Height = 21
          DataField = 'CD_TIPO_CALCULO'
          DataSource = datm_mercadoria.ds_mercadoria
          KeyField = 'CD_TIPO_CALCULO_ITEM'
          ListField = 'DESCRICAO'
          ListSource = datm_mercadoria.ds_tp_calc_item
          TabOrder = 7
          OnClick = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_material: TDBEdit
          Left = 391
          Top = 57
          Width = 105
          Height = 21
          DataField = 'CD_MATERIAL'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 2
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbchkbx_nec_li: TDBCheckBox
          Left = 440
          Top = 279
          Width = 100
          Height = 17
          Caption = 'Necessita LI'
          DataField = 'IN_NECESSITA_LI'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 29
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkbx_nec_liClick
        end
        object dbedt_cd_uf_produtor: TDBEdit
          Left = 440
          Top = 133
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_UF_PRODUTOR'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_uf_produtorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_uf_produtor: TDBEdit
          Left = 470
          Top = 133
          Width = 248
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookUFProdutor'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_pb_mercadoria: TDBEdit
          Left = 568
          Top = 174
          Width = 111
          Height = 21
          DataField = 'PB_MERCADORIA'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_finalidade_merc: TDBEdit
          Left = 15
          Top = 292
          Width = 48
          Height = 21
          DataField = 'CD_FINALIDADE_MERC'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_finalidade_mercExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_finalidade_merc: TDBEdit
          Left = 63
          Top = 292
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookfinalidadeMerc'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 27
        end
        object dbedt_cd_familia_prod: TDBEdit
          Left = 15
          Top = 643
          Width = 68
          Height = 21
          DataField = 'CD_FAMILIA_PROD'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 33
          Visible = False
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_familia_prodExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_familia_prod: TDBEdit
          Left = 83
          Top = 643
          Width = 297
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookFamiliaProd'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 34
          Visible = False
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 15
          Top = 330
          Width = 48
          Height = 21
          DataField = 'CD_MOEDA'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 36
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 63
          Top = 330
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookMoeda'
          DataSource = datm_mercadoria.ds_mercadoria
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
        object dbedt_cd_embalagem: TDBEdit
          Left = 15
          Top = 681
          Width = 48
          Height = 21
          DataField = 'CD_EMBALAGEM_SCX'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 38
          Visible = False
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_embalagemExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_embalagem: TDBEdit
          Left = 63
          Top = 681
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookEmbalagemScx'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 39
          Visible = False
        end
        object dbedt_cd_categoria_textil: TDBEdit
          Left = 416
          Top = 714
          Width = 150
          Height = 21
          DataField = 'CD_CATEGORIA_TEXTIL'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 28
          Visible = False
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbedt_qt_por_embalagem: TDBEdit
          Left = 15
          Top = 448
          Width = 140
          Height = 21
          DataField = 'QT_POR_EMBALAGEM'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 45
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_onu: TDBEdit
          Left = 440
          Top = 95
          Width = 69
          Height = 21
          DataField = 'CD_ONU'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 8
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_classe: TDBEdit
          Left = 168
          Top = 448
          Width = 69
          Height = 21
          DataField = 'CD_CLASSE'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 46
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_area: TDBEdit
          Left = 15
          Top = 368
          Width = 48
          Height = 21
          DataField = 'CD_AREA'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 40
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_areaExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_area: TDBEdit
          Left = 63
          Top = 368
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookArea'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 41
        end
        object dblckpbox_in_ato_drawback: TDBLookupComboBox
          Left = 248
          Top = 448
          Width = 108
          Height = 21
          Ctl3D = True
          DataField = 'IN_ATO_DRAWBACK'
          DataSource = datm_mercadoria.ds_mercadoria
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_mercadoria.ds_yesno
          ParentCtl3D = False
          TabOrder = 47
          OnClick = dbedt_ap_mercadoriaChange
        end
        object dbedt_cd_proprietario: TDBEdit
          Left = 15
          Top = 718
          Width = 48
          Height = 21
          DataField = 'CD_PROPRIETARIO'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 49
          Visible = False
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_proprietarioExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_proprietario: TDBEdit
          Left = 62
          Top = 718
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'LookProprietario'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 52
          Visible = False
        end
        object dbrgrp_in_tipo_m_e: TDBRadioGroup
          Left = 440
          Top = 386
          Width = 304
          Height = 92
          Caption = 'Tipo de Mercadoria'
          Columns = 2
          DataField = 'IN_TIPO_M_E'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Mat'#233'ria-Prima'
            'Equipamento'
            'Revenda'
            'Consumo'
            'Ativo Fixo'
            'Amostra')
          ParentFont = False
          TabOrder = 42
          Values.Strings = (
            'M'
            'E'
            'R'
            'C'
            'A'
            'O')
          OnChange = dbedt_ap_mercadoriaChange
        end
        object dbchk_in_cat63: TDBCheckBox
          Left = 448
          Top = 482
          Width = 97
          Height = 17
          Caption = 'CAT63'
          DataField = 'IN_CAT63'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 48
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchk_in_cat63Click
        end
        object chkAtivo: TDBCheckBox
          Left = 705
          Top = 17
          Width = 50
          Height = 17
          Caption = 'Ativo'
          DataField = 'IN_ATIVO'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkbx_nec_liClick
        end
        object dbchk_in_necessita_li_siscomex: TDBCheckBox
          Left = 582
          Top = 279
          Width = 163
          Height = 17
          Caption = 'Necessita LI - Siscomex'
          DataField = 'IN_NECESSITA_LI_SISCOMEX'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 30
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkbx_nec_liClick
        end
        object dbedt_cd_planejador: TDBEdit
          Left = 15
          Top = 405
          Width = 48
          Height = 21
          DataField = 'CD_PLANEJADOR'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 43
          OnChange = dbedt_ap_mercadoriaChange
          OnExit = dbedt_cd_planejadorExit
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_planejador: TDBEdit
          Left = 63
          Top = 405
          Width = 317
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'CALC_NM_PLANEJADOR'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 20
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 44
        end
        object dbchkDrawBack: TDBCheckBox
          Left = 440
          Top = 297
          Width = 132
          Height = 17
          Caption = 'Solicitar DrawBack '
          DataField = 'IN_DRAWBACK'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 31
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkIN_ANTIDUMPING: TDBCheckBox
          Left = 582
          Top = 297
          Width = 94
          Height = 17
          Caption = 'Antidumping'
          DataField = 'IN_ANTIDUMPING'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 32
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedt_destaque_ncm: TDBEdit
          Left = 556
          Top = 17
          Width = 70
          Height = 21
          DataField = 'NR_DESTAQUE_NCM'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 53
        end
        object edtCdCatalogoProdutos: TDBEdit
          Left = 523
          Top = 95
          Width = 86
          Height = 21
          DataField = 'CD_CATALOGO_PRODUTOS'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 54
          OnChange = dbedt_ap_mercadoriaChange
        end
        object edtNrVersaoCatProd: TDBEdit
          Left = 621
          Top = 95
          Width = 86
          Height = 21
          DataField = 'NR_VERSAO_CATALOGO_PROD'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 55
          OnChange = dbedt_ap_mercadoriaChange
        end
      end
    end
    object ts_descricao: TTabSheet
      Caption = 'Descri'#231#227'o'
      object Bevel2: TBevel
        Left = 0
        Top = 0
        Width = 781
        Height = 519
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label4: TLabel
        Left = 25
        Top = 19
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
      object Label8: TLabel
        Left = 25
        Top = 139
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
        Left = 25
        Top = 259
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
      object dbmemo_nm_mercadoria: TDBMemo
        Left = 25
        Top = 32
        Width = 432
        Height = 94
        DataField = 'NM_MERCADORIA'
        DataSource = datm_mercadoria.ds_mercadoria
        ScrollBars = ssVertical
        TabOrder = 0
        OnChange = dbedt_ap_mercadoriaChange
      end
      object dbm_tx_ingles: TDBMemo
        Left = 25
        Top = 152
        Width = 432
        Height = 94
        DataField = 'TX_DESC_INGLES'
        DataSource = datm_mercadoria.ds_mercadoria
        ScrollBars = ssVertical
        TabOrder = 1
        OnChange = dbedt_ap_mercadoriaChange
      end
      object dbm_tx_esp: TDBMemo
        Left = 25
        Top = 272
        Width = 432
        Height = 94
        DataField = 'TX_DESC_ESP'
        DataSource = datm_mercadoria.ds_mercadoria
        ScrollBars = ssVertical
        TabOrder = 2
        OnChange = dbedt_ap_mercadoriaChange
      end
    end
    object ts_nve: TTabSheet
      Caption = '&NVE'
      object Bevel3: TBevel
        Left = 0
        Top = 0
        Width = 781
        Height = 519
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Label12: TLabel
        Left = 25
        Top = 20
        Width = 28
        Height = 13
        Caption = 'NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 25
        Top = 69
        Width = 32
        Height = 13
        Caption = 'N'#237'vel'
        FocusControl = dbedt_cd_nivel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 238
        Top = 69
        Width = 61
        Height = 13
        Caption = 'C'#243'd. Atrib.'
        FocusControl = dbedt_cd_atributo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 477
        Top = 69
        Width = 70
        Height = 13
        Caption = 'C'#243'd. Espec.'
        FocusControl = dbedt_cd_especif
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sp_nivel: TSpeedButton
        Left = 207
        Top = 82
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
        OnClick = sp_nivelClick
      end
      object sp_atrib: TSpeedButton
        Left = 446
        Top = 82
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
        OnClick = sp_atribClick
      end
      object sp_espec: TSpeedButton
        Left = 689
        Top = 82
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
        OnClick = sp_especClick
      end
      object dbedt_cd_ncm: TDBEdit
        Left = 25
        Top = 32
        Width = 103
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'CD_NCM_SH'
        DataSource = datm_mercadoria.ds_mercadoria
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        OnChange = dbedt_cd_ncmChange
      end
      object Panel1: TPanel
        Left = 25
        Top = 117
        Width = 684
        Height = 253
        BevelInner = bvLowered
        Caption = 'Panel1'
        TabOrder = 1
        object DBGrid1: TDBGrid
          Left = 2
          Top = 2
          Width = 680
          Height = 249
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = True
          DataSource = datm_mercadoria.ds_nivel_merc
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
              FieldName = 'LookNivel'
              ReadOnly = True
              Title.Caption = 'Nivel'
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
              FieldName = 'CD_ATRIBUTO_NCM'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CD_ESPECIF_NCM'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 267
              Visible = True
            end>
        end
      end
      object dbedt_cd_nivel: TDBEdit
        Left = 25
        Top = 82
        Width = 37
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_NIVEL_NVE'
        DataSource = datm_mercadoria.ds_nivel_merc
        TabOrder = 2
        OnChange = dbedt_cd_nivelChange
        OnExit = dbedt_cd_nivelExit
        OnKeyDown = dbedt_cd_un_med_comercKeyDown
      end
      object dbedt_cd_atributo: TDBEdit
        Left = 238
        Top = 82
        Width = 63
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_ATRIBUTO_NCM'
        DataSource = datm_mercadoria.ds_nivel_merc
        TabOrder = 3
        OnChange = dbedt_cd_nivelChange
        OnEnter = dbedt_cd_atributoEnter
        OnExit = dbedt_cd_atributoExit
        OnKeyDown = dbedt_cd_un_med_comercKeyDown
      end
      object dbedt_cd_especif: TDBEdit
        Left = 477
        Top = 82
        Width = 62
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_ESPECIF_NCM'
        DataSource = datm_mercadoria.ds_nivel_merc
        TabOrder = 4
        OnChange = dbedt_cd_nivelChange
        OnEnter = dbedt_cd_especifEnter
        OnExit = dbedt_cd_especifExit
        OnKeyDown = dbedt_cd_un_med_comercKeyDown
      end
      object dbedt_nm_ncm: TDBEdit
        Left = 129
        Top = 33
        Width = 585
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'LookNCM'
        DataSource = datm_mercadoria.ds_mercadoria
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        OnChange = dbedt_cd_ncmChange
      end
      object dbedt_nm_nivel: TDBEdit
        Left = 62
        Top = 82
        Width = 144
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookNivel'
        DataSource = datm_mercadoria.ds_nivel_merc
        ReadOnly = True
        TabOrder = 6
      end
      object dbedt_nm_atrib: TDBEdit
        Left = 301
        Top = 82
        Width = 144
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookNomeAtrib'
        DataSource = datm_mercadoria.ds_nivel_merc
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_especif: TDBEdit
        Left = 539
        Top = 82
        Width = 149
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookNomeEspec'
        DataSource = datm_mercadoria.ds_nivel_merc
        ReadOnly = True
        TabOrder = 8
      end
    end
    object ts_Padrao: TTabSheet
      Caption = '&ICMS Padr'#227'o'
      ImageIndex = 5
      object GroupBox1: TGroupBox
        Left = 67
        Top = 37
        Width = 600
        Height = 321
        TabOrder = 0
        object Label26: TLabel
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
        object Label31: TLabel
          Left = 359
          Top = 17
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
        object Panel2: TPanel
          Left = 20
          Top = 60
          Width = 561
          Height = 65
          BevelInner = bvLowered
          TabOrder = 1
          object Label27: TLabel
            Left = 12
            Top = 14
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
          object dbedt_pc_icms: TDBEdit
            Left = 12
            Top = 28
            Width = 53
            Height = 21
            Color = clMenu
            DataField = 'PC_ICMS'
            DataSource = datm_mercadoria.ds_mercadoria
            Enabled = False
            TabOrder = 0
          end
          object ChkAliqDif: TDBCheckBox
            Left = 144
            Top = 31
            Width = 185
            Height = 17
            Caption = 'Al'#237'quota Diferenciada (NCM)'
            DataField = 'IN_ALIQ_DIF'
            DataSource = datm_mercadoria.ds_mercadoria
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
            OnClick = dbchk_in_cat63Click
          end
        end
        object Panel4: TPanel
          Left = 20
          Top = 127
          Width = 561
          Height = 178
          BevelInner = bvLowered
          TabOrder = 2
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
          object Label33: TLabel
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
          object Label34: TLabel
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
            DataSource = datm_mercadoria.ds_mercadoria
            TabOrder = 0
            OnChange = btn_co_disp_legalClick
            OnExit = dbedt_cd_disp_legalExit
            OnKeyDown = dbedt_cd_un_med_comercKeyDown
          end
        end
        object dbedt_cd_tributacao_icms: TDBEdit
          Left = 20
          Top = 30
          Width = 32
          Height = 21
          DataField = 'CD_TRIBUTACAO_ICMS'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 0
          OnChange = btn_co_trib_icmsClick
          OnKeyDown = dbedt_cd_un_med_comercKeyDown
        end
        object dbedt_nm_tributacao_icms: TEdit
          Left = 53
          Top = 30
          Width = 271
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object dbeReducaoIcms: TDBEdit
          Left = 359
          Top = 31
          Width = 53
          Height = 21
          DataField = 'PC_REDUCAO_ICMS'
          DataSource = datm_mercadoria.ds_mercadoria
          TabOrder = 4
        end
      end
    end
    object ts_PIS_COFINS: TTabSheet
      Caption = 'PIS/COFINS'
      ImageIndex = 6
      object lbl6: TLabel
        Left = 260
        Top = 60
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
      object btn_FUND_LEG_PIS_COFINS: TSpeedButton
        Left = 466
        Top = 75
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
        OnClick = btn_FUND_LEG_PIS_COFINSClick
      end
      object gbPIS: TGroupBox
        Left = 15
        Top = 104
        Width = 697
        Height = 73
        BiDiMode = bdLeftToRight
        Caption = 'PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 3
        object Label30: TLabel
          Left = 12
          Top = 22
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
        object dbedt_PC_PIS: TDBEdit
          Left = 12
          Top = 36
          Width = 53
          Height = 21
          Color = clMenu
          DataField = 'PC_PIS'
          DataSource = datm_mercadoria.ds_mercadoria
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbchk_IN_ALIQ_DIF_PIS: TDBCheckBox
          Left = 96
          Top = 38
          Width = 147
          Height = 17
          Caption = 'Al'#237'quota Diferenciada'
          DataField = 'IN_ALIQ_DIF_PIS'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchk_IN_ALIQ_DIF_PISClick
        end
      end
      object gbCOFINS: TGroupBox
        Left = 16
        Top = 184
        Width = 697
        Height = 73
        BiDiMode = bdLeftToRight
        Caption = 'COFINS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 4
        object Label32: TLabel
          Left = 12
          Top = 22
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
        object dbedt_PC_COFINS: TDBEdit
          Left = 12
          Top = 36
          Width = 53
          Height = 21
          Color = clMenu
          DataField = 'PC_COFINS'
          DataSource = datm_mercadoria.ds_mercadoria
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbchk_IN_ALIQ_DIF_COFINS: TDBCheckBox
          Left = 96
          Top = 38
          Width = 147
          Height = 17
          Caption = 'Al'#237'quota Diferenciada'
          DataField = 'IN_ALIQ_DIF_COFINS'
          DataSource = datm_mercadoria.ds_mercadoria
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchk_IN_ALIQ_DIF_COFINSClick
        end
      end
      object dbrg_CD_REG_TRIB_PIS_COFINS: TDBRadioGroup
        Left = 14
        Top = 11
        Width = 235
        Height = 86
        Caption = 'Regime de Tributa'#231#227'o'
        Color = clBtnFace
        Columns = 2
        DataField = 'CD_REG_TRIB_PIS_COFINS'
        DataSource = datm_mercadoria.ds_mercadoria
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
        TabOrder = 0
        Values.Strings = (
          '1'
          '3'
          '2'
          '4'
          '5')
      end
      object dbedt_CD_FUND_LEG_PIS_COFINS: TDBEdit
        Left = 260
        Top = 75
        Width = 29
        Height = 21
        DataField = 'CD_FUND_LEG_PIS_COFINS'
        DataSource = datm_mercadoria.ds_mercadoria
        TabOrder = 1
        OnChange = dbedt_CD_FUND_LEG_PIS_COFINSChange
      end
      object edt_NM_FUND_LEG_PIS_COFINS: TEdit
        Left = 288
        Top = 75
        Width = 177
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 669
    Top = 18
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
    object mi_pesq: TMenuItem
      Caption = '&Pesquisa'
      OnClick = btn_pesqClick
    end
  end
end
