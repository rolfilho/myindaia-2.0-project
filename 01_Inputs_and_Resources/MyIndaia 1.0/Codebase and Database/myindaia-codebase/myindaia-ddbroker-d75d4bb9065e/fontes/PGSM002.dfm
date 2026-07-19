object frm_ensaios: Tfrm_ensaios
  Left = 122
  Top = 76
  Width = 640
  Height = 480
  Caption = 'Ensaio de Receitas'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 12
      Width = 25
      Height = 25
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
      Left = 92
      Top = 12
      Width = 25
      Height = 25
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
      Left = 289
      Top = 12
      Width = 25
      Height = 25
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
      Top = 12
      Width = 25
      Height = 25
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
      Left = 64
      Top = 12
      Width = 25
      Height = 25
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
    object btn_imprimir: TSpeedButton
      Left = 121
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Excluir'
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
    object dbnvg: TDBNavigator
      Left = 157
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_cliente_faturamento.ds_cliente_faturamento
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pgctrl_ensaios: TPageControl
    Left = 0
    Top = 48
    Width = 629
    Height = 385
    ActivePage = ts_ensaios
    TabOrder = 1
    OnChange = pgctrl_ensaiosChange
    OnChanging = pgctrl_ensaiosChanging
    object ts_ensaios: TTabSheet
      Caption = '   Ensaios   '
      object lbl_item1: TLabel
        Left = 16
        Top = 180
        Width = 36
        Height = 13
        Caption = 'Item 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item2: TLabel
        Left = 16
        Top = 220
        Width = 36
        Height = 13
        Caption = 'Item 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item3: TLabel
        Left = 16
        Top = 260
        Width = 36
        Height = 13
        Caption = 'Item 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_periodo: TLabel
        Left = 16
        Top = 137
        Width = 120
        Height = 13
        Caption = 'Selecione o per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_a: TLabel
        Left = 100
        Top = 156
        Width = 8
        Height = 13
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_unid_neg: TLabel
        Left = 16
        Top = 58
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
        Left = 409
        Top = 73
        Width = 25
        Height = 22
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
      object lbl_cd_cliente: TLabel
        Left = 16
        Top = 20
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_cliente: TSpeedButton
        Left = 409
        Top = 32
        Width = 25
        Height = 22
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
        OnClick = btn_co_clienteClick
      end
      object lbl_produto: TLabel
        Left = 16
        Top = 99
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_produto: TSpeedButton
        Left = 409
        Top = 111
        Width = 25
        Height = 22
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
      object btn_co_item1: TSpeedButton
        Left = 409
        Top = 193
        Width = 25
        Height = 22
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
        OnClick = btn_co_item1Click
      end
      object btn_co_item2: TSpeedButton
        Left = 409
        Top = 233
        Width = 25
        Height = 22
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
        OnClick = btn_co_item2Click
      end
      object btn_co_item3: TSpeedButton
        Left = 409
        Top = 273
        Width = 25
        Height = 22
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
        OnClick = btn_co_item3Click
      end
      object msk_dt_inicio: TMaskEdit
        Left = 16
        Top = 151
        Width = 73
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 3
        Text = '  /  /    '
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_fim: TMaskEdit
        Left = 124
        Top = 151
        Width = 73
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  /  /    '
        OnExit = msk_dt_fimExit
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 16
        Top = 74
        Width = 26
        Height = 21
        EditMask = '99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 1
        OnExit = msk_cd_unid_negExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_unid_neg: TEdit
        Left = 48
        Top = 74
        Width = 358
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 8
      end
      object edt_nm_cliente: TEdit
        Left = 59
        Top = 33
        Width = 346
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 9
      end
      object msk_cd_cliente: TMaskEdit
        Left = 16
        Top = 33
        Width = 39
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 0
        OnExit = msk_cd_clienteExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object msk_cd_produto: TMaskEdit
        Left = 16
        Top = 112
        Width = 26
        Height = 21
        EditMask = '99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_produto: TEdit
        Left = 48
        Top = 112
        Width = 358
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 10
      end
      object msk_cd_item1: TMaskEdit
        Left = 16
        Top = 194
        Width = 32
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 5
        OnExit = msk_cd_item1Exit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_item1: TEdit
        Left = 51
        Top = 194
        Width = 353
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 11
      end
      object msk_cd_item2: TMaskEdit
        Left = 16
        Top = 234
        Width = 32
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 6
        OnExit = msk_cd_item2Exit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_item2: TEdit
        Left = 51
        Top = 234
        Width = 353
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 12
      end
      object msk_cd_item3: TMaskEdit
        Left = 16
        Top = 274
        Width = 32
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 7
        OnExit = msk_cd_item3Exit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_item3: TEdit
        Left = 51
        Top = 274
        Width = 353
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 13
      end
    end
    object ts_itens_servicos: TTabSheet
      Caption = 'Itens X Servi'#231'os'
      object pnl_entrada_de_dados: TPanel
        Left = 3
        Top = 8
        Width = 617
        Height = 345
        BevelOuter = bvLowered
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object lbl_cliente2: TLabel
          Left = 9
          Top = 9
          Width = 40
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_unid_neg2: TLabel
          Left = 9
          Top = 47
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
        object lbl_produto2: TLabel
          Left = 9
          Top = 83
          Width = 45
          Height = 13
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_cliente5: TDBEdit
          Left = 9
          Top = 25
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CLIENTE'
          DataSource = datm_ensaios.ds_cliente_projecao
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_cliente5: TDBEdit
          Left = 52
          Top = 25
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCliente'
          DataSource = datm_ensaios.ds_cliente_projecao
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_unid_neg5: TDBEdit
          Left = 9
          Top = 61
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_UNID_NEG'
          DataSource = datm_ensaios.ds_cliente_projecao
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_unid_neg5: TDBEdit
          Left = 52
          Top = 61
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookUnidNeg'
          DataSource = datm_ensaios.ds_cliente_projecao
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_cd_produto5: TDBEdit
          Left = 9
          Top = 98
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_PRODUTO'
          DataSource = datm_ensaios.ds_cliente_projecao
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_produto5: TDBEdit
          Left = 52
          Top = 98
          Width = 313
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookProduto'
          DataSource = datm_ensaios.ds_cliente_projecao
          ReadOnly = True
          TabOrder = 5
        end
        object dbg_cadastro: TDBGrid
          Left = 5
          Top = 133
          Width = 606
          Height = 203
          Color = clWhite
          DataSource = datm_ensaios.ds_cliente_projecao
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
          ReadOnly = True
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CD_ITEM'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LookItem'
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
              FieldName = 'CD_SERVICO'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LookServico'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 270
              Visible = True
            end>
        end
      end
    end
    object ts_rec_imp: TTabSheet
      Caption = '   Receita Atual   '
      Enabled = False
      object Label7: TLabel
        Left = 4
        Top = -1
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 210
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 420
        Top = -1
        Width = 108
        Height = 13
        Caption = 'Regime Tributa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 210
        Top = -1
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
      object Label15: TLabel
        Left = 4
        Top = 72
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
      object Label16: TLabel
        Left = 210
        Top = 72
        Width = 172
        Height = 13
        Caption = 'Data Base para Moeda/'#205'ndice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 4
        Top = 35
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 419
        Top = 72
        Width = 30
        Height = 13
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nm_cliente3: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_nm_servico3: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_unid_neg3: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_item3: TDBEdit
        Left = 4
        Top = 86
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 3
      end
      object dblckbox_dt_base3: TDBLookupComboBox
        Left = 210
        Top = 86
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_ensaios.ds_receita_imp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_ensaios.ds_dt_base
        TabOrder = 4
      end
      object dbedt_nm_produto3: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 5
      end
      object dblkpcbox_in_ativo3: TDBLookupComboBox
        Left = 419
        Top = 86
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_ensaios.ds_receita_imp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_ensaios.ds_yesno
        TabOrder = 6
      end
      object pnl_taxa3: TPanel
        Left = 4
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 7
        object Label19: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 5
          Top = 3
          Width = 29
          Height = 13
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_taxa3: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_ensaios.ds_receita_imp
          TabOrder = 0
        end
        object dbedt_vl_den_taxa3: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_ensaios.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
        end
        object dbedt_calc_taxa3: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 4
        end
        object dblckbox_base_calc_taxa3: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_ensaios.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
        end
        object dbedt_cd_moeda_taxa3: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_TAXA'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_moeda_taxa3: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaTaxa'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_acr3: TPanel
        Left = 4
        Top = 160
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 8
        object Label23: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 5
          Top = 3
          Width = 59
          Height = 13
          Caption = 'Acr'#233'scimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_acr3: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_ACR'
          DataSource = datm_ensaios.ds_receita_imp
          TabOrder = 0
        end
        object dbedt_calc_acr3: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Acr'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
        end
        object dblckbox_base_calc_acr3: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_ACR'
          DataSource = datm_ensaios.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 1
          TabStop = False
        end
        object dbedt_cd_moeda_acr3: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_ACR'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_nm_moeda_acr3: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaAcr'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_vl_den_acr3: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_ACR'
          DataSource = datm_ensaios.ds_receita_imp
          MaxLength = 4
          TabOrder = 5
        end
      end
      object pnl_fora_regiao3: TPanel
        Left = 4
        Top = 208
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 9
        object Label27: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 5
          Top = 3
          Width = 88
          Height = 13
          Caption = 'Fora da Regi'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_fora_regiao3: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_FORA_REGIAO'
          DataSource = datm_ensaios.ds_receita_imp
          TabOrder = 0
        end
        object dbedt_vl_den_fora_regiao3: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_FORA_REGIAO'
          DataSource = datm_ensaios.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
        end
        object dbedt_calc_fora_regiao3: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Fora_Regiao'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 4
        end
        object dblckbox_base_calc_fora_regiao3: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_FORA_REGIAO'
          DataSource = datm_ensaios.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
        end
        object dbedt_cd_moeda_fora_regiao3: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_FORA_REGIAO'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_moeda_fora_regiao3: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaForaRegiao'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min3: TPanel
        Left = 4
        Top = 256
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 10
        object Label31: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 5
          Top = 3
          Width = 42
          Height = 13
          Caption = 'M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_min3: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_ensaios.ds_receita_imp
          TabOrder = 0
        end
        object dbedt_vl_den_min3: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_ensaios.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
        end
        object dbedt_calc_min3: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Min'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 4
        end
        object dblckbox_base_calc_min3: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MIN'
          DataSource = datm_ensaios.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
        end
        object dbedt_cd_moeda_min3: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MIN'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_moeda_min3: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMin'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_max3: TPanel
        Left = 4
        Top = 305
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 11
        object Label35: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 358
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 5
          Top = 3
          Width = 43
          Height = 13
          Caption = 'M'#225'ximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_max3: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_ensaios.ds_receita_imp
          TabOrder = 0
        end
        object dbedt_vl_den_max3: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_ensaios.ds_receita_imp
          MaxLength = 4
          TabOrder = 1
        end
        object dbedt_calc_max3: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Max'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 4
        end
        object dblckbox_base_calc_max3: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MAX'
          DataSource = datm_ensaios.ds_receita_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
        end
        object dbedt_cd_moeda_max3: TDBEdit
          Left = 358
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MAX'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_moeda_max3: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMax'
          DataSource = datm_ensaios.ds_receita_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object dbgrd_reg_trib3: TDBGrid
        Left = 421
        Top = 13
        Width = 196
        Height = 55
        DataSource = datm_ensaios.ds_receita_imp
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'LookRegimeTrib'
            Visible = True
          end>
      end
    end
    object ts_rec_imp_proj: TTabSheet
      Caption = '    Proje'#231#227'o    '
      object lbl_cliente3: TLabel
        Left = 4
        Top = -1
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_servico3: TLabel
        Left = 210
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_regime_trib: TLabel
        Left = 420
        Top = -1
        Width = 108
        Height = 13
        Caption = 'Regime Tributa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg3: TLabel
        Left = 210
        Top = -1
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
      object lbl_item5: TLabel
        Left = 4
        Top = 72
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
      object lbl_dt_base: TLabel
        Left = 210
        Top = 72
        Width = 172
        Height = 13
        Caption = 'Data Base para Moeda/'#205'ndice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_produto3: TLabel
        Left = 4
        Top = 35
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_in_ativo: TLabel
        Left = 419
        Top = 72
        Width = 30
        Height = 13
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nm_cliente: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 7
      end
      object dbedt_nm_servico: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 8
      end
      object dbedt_nm_unid_neg: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_item: TDBEdit
        Left = 4
        Top = 86
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 10
      end
      object dblckbox_dt_base: TDBLookupComboBox
        Left = 210
        Top = 86
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_ensaios.ds_ensaio_imp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_ensaios.ds_dt_base
        TabOrder = 0
        OnClick = dbedt_vl_num_taxaChange
      end
      object dbedt_nm_produto: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 11
      end
      object dblkpcbox_in_ativo: TDBLookupComboBox
        Left = 419
        Top = 86
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_ensaios.ds_ensaio_imp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_ensaios.ds_yesno
        TabOrder = 1
        OnClick = dbedt_vl_num_taxaChange
      end
      object pnl_taxa: TPanel
        Left = 4
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 2
        object Label2: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_taxa: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_taxa: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_taxa: TLabel
          Left = 5
          Top = 3
          Width = 29
          Height = 13
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_taxa: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_taxaClick
        end
        object dbedt_vl_num_taxa: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_taxa: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_taxaExit
        end
        object dbedt_calc_taxa: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxaChange
        end
        object dblckbox_base_calc_taxa: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_ensaios.ds_ensaio_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_taxaClick
        end
        object dbedt_cd_moeda_taxa: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_TAXA'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_taxaExit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_taxa: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaTaxa'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_acr: TPanel
        Left = 4
        Top = 160
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 3
        object Label1: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_acr: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_acr: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acr: TLabel
          Left = 5
          Top = 3
          Width = 59
          Height = 13
          Caption = 'Acr'#233'scimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_acr: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_acrClick
        end
        object dbedt_vl_num_acr: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_ACR'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_acr: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_ACR'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_acrExit
        end
        object dbedt_calc_acr: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Acr'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_acrChange
        end
        object dblckbox_base_calc_acr: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_ACR'
          DataSource = datm_ensaios.ds_ensaio_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_acrClick
        end
        object dbedt_cd_moeda_acr: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_ACR'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_acrExit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_acr: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaAcr'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_fora_regiao: TPanel
        Left = 4
        Top = 208
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 4
        object Label6: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_fora_regiao: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_fora_regiao: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_fora_regiao: TLabel
          Left = 5
          Top = 3
          Width = 88
          Height = 13
          Caption = 'Fora da Regi'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_fora_regiao: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_fora_regiaoClick
        end
        object dbedt_vl_num_fora_regiao: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_FORA_REGIAO'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_fora_regiao: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_FORA_REGIAO'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_fora_regiaoExit
        end
        object dbedt_calc_fora_regiao: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Fora_Regiao'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_fora_regiaoChange
        end
        object dblckbox_base_calc_fora_regiao: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_FORA_REGIAO'
          DataSource = datm_ensaios.ds_ensaio_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_fora_regiaoClick
        end
        object dbedt_cd_moeda_fora_regiao: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_FORA_REGIAO'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_fora_regiaoExit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_fora_regiao: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaForaRegiao'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min: TPanel
        Left = 4
        Top = 256
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 5
        object Label10: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_min: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_min: TLabel
          Left = 359
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_min: TLabel
          Left = 5
          Top = 3
          Width = 42
          Height = 13
          Caption = 'M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_min: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_minClick
        end
        object dbedt_vl_num_min: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_min: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_minExit
        end
        object dbedt_calc_min: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Min'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_minChange
        end
        object dblckbox_base_calc_min: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MIN'
          DataSource = datm_ensaios.ds_ensaio_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_minClick
        end
        object dbedt_cd_moeda_min: TDBEdit
          Left = 359
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MIN'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_minExit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_min: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMin'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_max: TPanel
        Left = 4
        Top = 305
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 6
        object Label14: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_max: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_max: TLabel
          Left = 358
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_max: TLabel
          Left = 5
          Top = 3
          Width = 43
          Height = 13
          Caption = 'M'#225'ximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_max: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_maxClick
        end
        object dbedt_vl_num_max: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxaChange
        end
        object dbedt_vl_den_max: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_vl_den_maxExit
        end
        object dbedt_calc_max: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Max'
          DataSource = datm_ensaios.ds_ensaio_imp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_maxChange
        end
        object dblckbox_base_calc_max: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 134
          Height = 21
          DataField = 'TP_BASE_CALC_MAX'
          DataSource = datm_ensaios.ds_ensaio_imp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_imp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_maxClick
        end
        object dbedt_cd_moeda_max: TDBEdit
          Left = 358
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MAX'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxaChange
          OnExit = dbedt_cd_moeda_maxExit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_max: TDBEdit
          Left = 400
          Top = 19
          Width = 176
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMax'
          DataSource = datm_ensaios.ds_ensaio_imp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object dbgrd_reg_trib: TDBGrid
        Left = 421
        Top = 13
        Width = 196
        Height = 55
        DataSource = datm_ensaios.ds_ensaio_imp
        Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 12
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'LookRegimeTrib'
            Visible = True
          end>
      end
    end
    object ts_rec_exp: TTabSheet
      Caption = '   Receita Atual   '
      Enabled = False
      object Label39: TLabel
        Left = 4
        Top = -1
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label40: TLabel
        Left = 4
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label41: TLabel
        Left = 210
        Top = -1
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
      object Label42: TLabel
        Left = 210
        Top = 35
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
      object Label43: TLabel
        Left = 419
        Top = -1
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 4
        Top = 72
        Width = 172
        Height = 13
        Caption = 'Data Base para Moeda/'#205'ndice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 210
        Top = 72
        Width = 78
        Height = 13
        Caption = 'Tipo da Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label46: TLabel
        Left = 355
        Top = 72
        Width = 129
        Height = 13
        Caption = 'Tipo do Valor da Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 500
        Top = 71
        Width = 62
        Height = 13
        Caption = '% Red. RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 567
        Top = 72
        Width = 30
        Height = 13
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nm_cliente4: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_nm_servico4: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_nm_unid_neg4: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nm_item4: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 3
      end
      object dbedt_nm_produto4: TDBEdit
        Left = 419
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 4
      end
      object dblkpcbox_in_ativo4: TDBLookupComboBox
        Left = 567
        Top = 85
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_ensaios.ds_receita_exp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_ensaios.ds_yesno
        TabOrder = 5
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dbedt_pc_reduc_re_canc4: TDBEdit
        Left = 500
        Top = 85
        Width = 61
        Height = 21
        DataField = 'PC_REDUC_RE_CANC'
        DataSource = datm_ensaios.ds_receita_exp
        MaxLength = 6
        TabOrder = 6
        OnChange = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa_valor4: TDBLookupComboBox
        Left = 355
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA_VALOR'
        DataSource = datm_ensaios.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA_VALOR'
        ListField = 'NM_TP_FAIXA_VALOR'
        ListSource = datm_ensaios.ds_tp_faixa_valor
        TabOrder = 7
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa4: TDBLookupComboBox
        Left = 210
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA'
        DataSource = datm_ensaios.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA'
        ListField = 'NM_TP_FAIXA'
        ListSource = datm_ensaios.ds_tp_faixa
        TabOrder = 8
        OnClick = dblckbox_tp_faixa2Click
      end
      object dblckbox_dt_base4: TDBLookupComboBox
        Left = 4
        Top = 85
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_ensaios.ds_receita_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_ensaios.ds_dt_base
        TabOrder = 9
        OnClick = dbedt_vl_num_taxa2Change
      end
      object pnl_taxa4: TPanel
        Left = 5
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 10
        Visible = False
        object Label49: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label51: TLabel
          Left = 351
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label52: TLabel
          Left = 5
          Top = 3
          Width = 29
          Height = 13
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_taxa4: TDBEdit
          Left = 0
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_ensaios.ds_receita_exp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_taxa4: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_ensaios.ds_receita_exp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_taxa2Exit
        end
        object dbedt_calc_taxa4: TDBEdit
          Left = 128
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa2'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxa2Change
        end
        object dblckbox_base_calc_taxa4: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 122
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_ensaios.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_taxaClick
        end
        object dbedt_cd_moeda_taxa4: TDBEdit
          Left = 351
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_TAXA'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_taxa2Exit
        end
        object dbedt_nm_moeda_taxa4: TDBEdit
          Left = 392
          Top = 19
          Width = 183
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaTaxa'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min4: TPanel
        Left = 5
        Top = 160
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 11
        object Label53: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label55: TLabel
          Left = 351
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 5
          Top = 3
          Width = 42
          Height = 13
          Caption = 'M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_min4: TDBEdit
          Left = 0
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_ensaios.ds_receita_exp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_min4: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_ensaios.ds_receita_exp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_min2Exit
        end
        object dbedt_calc_min4: TDBEdit
          Left = 128
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Min2'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_min2Change
        end
        object dblckbox_base_calc_min4: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 121
          Height = 21
          DataField = 'TP_BASE_CALC_MIN'
          DataSource = datm_ensaios.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_min2Click
        end
        object dbedt_cd_moeda_min4: TDBEdit
          Left = 351
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MIN'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_min2Exit
        end
        object dbedt_nm_moeda_min4: TDBEdit
          Left = 392
          Top = 19
          Width = 183
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMin'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_max4: TPanel
        Left = 5
        Top = 209
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 12
        object Label57: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 350
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 5
          Top = 3
          Width = 43
          Height = 13
          Caption = 'M'#225'ximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_num_max4: TDBEdit
          Left = 0
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_ensaios.ds_receita_exp
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_max4: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_ensaios.ds_receita_exp
          MaxLength = 4
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_max2Exit
        end
        object dbedt_calc_max4: TDBEdit
          Left = 128
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Max2'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_max2Change
        end
        object dblckbox_base_calc_max4: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 120
          Height = 21
          DataField = 'TP_BASE_CALC_MAX'
          DataSource = datm_ensaios.ds_receita_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_max2Click
        end
        object dbedt_cd_moeda_max4: TDBEdit
          Left = 350
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MAX'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_max2Exit
        end
        object dbedt_nm_moeda_max4: TDBEdit
          Left = 392
          Top = 19
          Width = 182
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMax'
          DataSource = datm_ensaios.ds_receita_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object ts_rec_exp_proj: TTabSheet
      Caption = '    Proje'#231#227'o    '
      object lbl_cliente4: TLabel
        Left = 4
        Top = -1
        Width = 40
        Height = 13
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_servico4: TLabel
        Left = 4
        Top = 35
        Width = 44
        Height = 13
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unid_neg4: TLabel
        Left = 210
        Top = -1
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
      object lbl_item6: TLabel
        Left = 210
        Top = 35
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
      object lbl_produto4: TLabel
        Left = 419
        Top = -1
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_base2: TLabel
        Left = 4
        Top = 72
        Width = 172
        Height = 13
        Caption = 'Data Base para Moeda/'#205'ndice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_tp_faixa: TLabel
        Left = 210
        Top = 72
        Width = 78
        Height = 13
        Caption = 'Tipo da Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_tp_faixa_valor: TLabel
        Left = 355
        Top = 72
        Width = 129
        Height = 13
        Caption = 'Tipo do Valor da Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_pc_reduc_re_canc: TLabel
        Left = 500
        Top = 71
        Width = 62
        Height = 13
        Caption = '% Red. RE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_ativo2: TLabel
        Left = 567
        Top = 72
        Width = 30
        Height = 13
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nm_cliente2: TDBEdit
        Left = 4
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookCliente'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 9
      end
      object dbedt_nm_servico2: TDBEdit
        Left = 4
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookServico'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 10
      end
      object dbedt_nm_unid_neg2: TDBEdit
        Left = 210
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidNeg'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 11
      end
      object dbedt_nm_item2: TDBEdit
        Left = 210
        Top = 49
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookItem'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_nm_produto2: TDBEdit
        Left = 419
        Top = 12
        Width = 196
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookProduto'
        DataSource = datm_ensaios.ds_cliente_projecao
        ReadOnly = True
        TabOrder = 13
      end
      object dblkpcbox_in_ativo2: TDBLookupComboBox
        Left = 567
        Top = 85
        Width = 50
        Height = 21
        DataField = 'IN_ATIVO'
        DataSource = datm_ensaios.ds_ensaio_exp
        DropDownRows = 3
        KeyField = 'CD_YESNO'
        ListField = 'TX_YESNO'
        ListSource = datm_ensaios.ds_yesno
        TabOrder = 4
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dbedt_pc_reduc_re_canc2: TDBEdit
        Left = 500
        Top = 85
        Width = 61
        Height = 21
        DataField = 'PC_REDUC_RE_CANC'
        DataSource = datm_ensaios.ds_ensaio_exp
        MaxLength = 6
        TabOrder = 3
        OnChange = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa_valor2: TDBLookupComboBox
        Left = 355
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA_VALOR'
        DataSource = datm_ensaios.ds_ensaio_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA_VALOR'
        ListField = 'NM_TP_FAIXA_VALOR'
        ListSource = datm_ensaios.ds_tp_faixa_valor
        TabOrder = 2
        OnClick = dbedt_vl_num_taxa2Change
      end
      object dblckbox_tp_faixa2: TDBLookupComboBox
        Left = 210
        Top = 85
        Width = 142
        Height = 21
        DataField = 'TP_FAIXA'
        DataSource = datm_ensaios.ds_ensaio_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'TP_FAIXA'
        ListField = 'NM_TP_FAIXA'
        ListSource = datm_ensaios.ds_tp_faixa
        TabOrder = 1
        OnClick = dblckbox_tp_faixa2Click
      end
      object dblckbox_dt_base2: TDBLookupComboBox
        Left = 4
        Top = 85
        Width = 197
        Height = 21
        DataField = 'TP_DT_BASE'
        DataSource = datm_ensaios.ds_ensaio_exp
        DropDownRows = 4
        DropDownWidth = 120
        KeyField = 'CD_DT_BASE'
        ListField = 'NM_DT_BASE'
        ListSource = datm_ensaios.ds_dt_base
        TabOrder = 0
        OnClick = dbedt_vl_num_taxa2Change
      end
      object pnl_taxa2: TPanel
        Left = 5
        Top = 112
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 5
        Visible = False
        object Label3: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 351
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_taxa2: TLabel
          Left = 5
          Top = 3
          Width = 29
          Height = 13
          Caption = 'Taxa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_taxa2: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_taxa2Click
        end
        object dbedt_vl_num_taxa2: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_TAXA'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_taxa2: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_TAXA'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_taxa2Exit
        end
        object dbedt_calc_taxa2: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Taxa2'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_taxa2Change
        end
        object dblckbox_base_calc_taxa2: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 122
          Height = 21
          DataField = 'TP_BASE_CALC_TAXA'
          DataSource = datm_ensaios.ds_ensaio_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_taxa2Click
        end
        object dbedt_cd_moeda_taxa2: TDBEdit
          Left = 351
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_TAXA'
          DataSource = datm_ensaios.ds_ensaio_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_taxa2Exit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_taxa2: TDBEdit
          Left = 392
          Top = 19
          Width = 183
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaTaxa'
          DataSource = datm_ensaios.ds_ensaio_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_min2: TPanel
        Left = 5
        Top = 160
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 6
        object Label8: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_min2: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_min2: TLabel
          Left = 351
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_min2: TLabel
          Left = 5
          Top = 3
          Width = 42
          Height = 13
          Caption = 'M'#237'nimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_min2: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_min2Click
        end
        object dbedt_vl_num_min2: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MIN'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_min2: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MIN'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_min2Exit
        end
        object dbedt_calc_min2: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Min2'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_min2Change
        end
        object dblckbox_base_calc_min2: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 121
          Height = 21
          DataField = 'TP_BASE_CALC_MIN'
          DataSource = datm_ensaios.ds_ensaio_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_min2Click
        end
        object dbedt_cd_moeda_min2: TDBEdit
          Left = 351
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MIN'
          DataSource = datm_ensaios.ds_ensaio_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_min2Exit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_min2: TDBEdit
          Left = 392
          Top = 19
          Width = 183
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMin'
          DataSource = datm_ensaios.ds_ensaio_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pnl_max2: TPanel
        Left = 5
        Top = 209
        Width = 611
        Height = 45
        BevelOuter = bvLowered
        TabOrder = 7
        object Label13: TLabel
          Left = 75
          Top = 23
          Width = 7
          Height = 13
          Caption = '/'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_base_calc_max2: TLabel
          Left = 219
          Top = 3
          Width = 75
          Height = 13
          Caption = 'Base C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_moeda_max2: TLabel
          Left = 350
          Top = 3
          Width = 80
          Height = 13
          Caption = 'Moeda/'#205'ndice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_max2: TLabel
          Left = 5
          Top = 3
          Width = 43
          Height = 13
          Caption = 'M'#225'ximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_max2: TSpeedButton
          Left = 581
          Top = 19
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
          OnClick = btn_co_moeda_max2Click
        end
        object dbedt_vl_num_max2: TDBEdit
          Left = 5
          Top = 19
          Width = 68
          Height = 21
          DataField = 'VL_NUM_MAX'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 6
          TabOrder = 0
          OnChange = dbedt_vl_num_taxa2Change
        end
        object dbedt_vl_den_max2: TDBEdit
          Left = 85
          Top = 19
          Width = 36
          Height = 21
          DataField = 'VL_DEN_MAX'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 3
          TabOrder = 1
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_vl_den_max2Exit
        end
        object dbedt_calc_max2: TDBEdit
          Left = 129
          Top = 19
          Width = 80
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Calc_Max2'
          DataSource = datm_ensaios.ds_ensaio_exp
          MaxLength = 3
          ReadOnly = True
          TabOrder = 4
          OnChange = dbedt_calc_max2Change
        end
        object dblckbox_base_calc_max2: TDBLookupComboBox
          Left = 219
          Top = 19
          Width = 120
          Height = 21
          DataField = 'TP_BASE_CALC_MAX'
          DataSource = datm_ensaios.ds_ensaio_exp
          DropDownRows = 4
          DropDownWidth = 120
          Enabled = False
          KeyField = 'CD_BASE_CALCULO'
          ListField = 'NM_BASE_CALCULO'
          ListSource = datm_ensaios.ds_base_calc_exp
          TabOrder = 2
          TabStop = False
          OnClick = dblckbox_base_calc_max2Click
        end
        object dbedt_cd_moeda_max2: TDBEdit
          Left = 350
          Top = 19
          Width = 33
          Height = 21
          TabStop = False
          Color = clWhite
          DataField = 'CD_MOEDA_MAX'
          DataSource = datm_ensaios.ds_ensaio_exp
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_vl_num_taxa2Change
          OnExit = dbedt_cd_moeda_max2Exit
          OnKeyDown = msk_cd_clienteKeyDown
        end
        object dbedt_nm_moeda_max2: TDBEdit
          Left = 392
          Top = 19
          Width = 182
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookMoedaMax'
          DataSource = datm_ensaios.ds_ensaio_exp
          ReadOnly = True
          TabOrder = 5
        end
      end
      object btn_faixas: TButton
        Left = 254
        Top = 276
        Width = 96
        Height = 23
        Caption = '&Faixas de Taxas'
        TabOrder = 8
        Visible = False
        OnClick = btn_faixasClick
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 510
    Top = 65534
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
    object mi_imprimir: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object crp_ensaio: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 552
    Top = 79
  end
end
