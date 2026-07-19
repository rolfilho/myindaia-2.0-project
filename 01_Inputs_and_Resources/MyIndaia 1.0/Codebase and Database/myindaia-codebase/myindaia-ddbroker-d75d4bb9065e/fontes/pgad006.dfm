object frm_pesq_solic_ch1: Tfrm_pesq_solic_ch1
  Left = 122
  Top = 160
  Width = 640
  Height = 480
  Caption = 'Pesquisa Movimentos Financeiros'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
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
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 215
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
    object btn_pesq_solic_ch: TSpeedButton
      Left = 17
      Top = 12
      Width = 25
      Height = 25
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
      OnClick = btn_pesq_solic_chClick
    end
    object btn_cancela: TSpeedButton
      Left = 60
      Top = 12
      Width = 25
      Height = 25
      Hint = 'Cancelar Solicitação de Cheque'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelaClick
    end
    object dbnvg: TDBNavigator
      Left = 101
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_pesq_solic_ch.ds_solic_ch
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pgctrl_solic_ch: TPageControl
    Left = 0
    Top = 56
    Width = 629
    Height = 376
    ActivePage = ts_lista
    TabOrder = 1
    OnChanging = pgctrl_solic_chChanging
    object ts_lista: TTabSheet
      Caption = '&Lista'
      object lbl_Cliente: TLabel
        Left = 12
        Top = 76
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
      object btn_co_cliente2: TSpeedButton
        Left = 270
        Top = 87
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
        OnClick = btn_co_cliente2Click
      end
      object btn_co_usuario: TSpeedButton
        Left = 577
        Top = 14
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
        OnClick = btn_co_usuarioClick
      end
      object lbl_nr_cheque: TLabel
        Left = 125
        Top = 110
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cheque Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_status: TLabel
        Left = 304
        Top = 110
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = 'Status da Solicitação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_item: TLabel
        Left = 12
        Top = 110
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_item: TLabel
        Left = 304
        Top = 76
        Width = 25
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_item2: TSpeedButton
        Left = 577
        Top = 87
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
      object lbl_dt_inicio: TLabel
        Left = 12
        Top = 1
        Width = 34
        Height = 13
        Caption = 'Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_dt_termino: TLabel
        Left = 103
        Top = 1
        Width = 46
        Height = 13
        Caption = 'Término'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_usuario: TLabel
        Left = 304
        Top = 1
        Width = 44
        Height = 13
        Caption = 'Usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_banco: TLabel
        Left = 12
        Top = 143
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_banco: TSpeedButton
        Left = 270
        Top = 156
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
        OnClick = btn_co_bancoClick
      end
      object lbl_favorecido: TLabel
        Left = 304
        Top = 143
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_favorecido: TSpeedButton
        Left = 577
        Top = 156
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
        OnClick = btn_co_favorecidoClick
      end
      object lbl_nr_processo: TLabel
        Left = 201
        Top = 1
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_unidade: TLabel
        Left = 12
        Top = 40
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_unidade: TSpeedButton
        Left = 270
        Top = 52
        Width = 25
        Height = 23
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
        OnClick = btn_co_unidadeClick
      end
      object lbl_cd_produto: TLabel
        Left = 304
        Top = 40
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
      object btn_co_prod: TSpeedButton
        Left = 577
        Top = 52
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
        OnClick = btn_co_prodClick
      end
      object Label1: TLabel
        Left = 12
        Top = 180
        Width = 44
        Height = 13
        Alignment = taRightJustify
        Caption = 'Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton1: TSpeedButton
        Left = 285
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
        OnClick = btn_co_favorecidoClick
      end
      object dbgrdSolicCheque: TDBGrid
        Left = -1
        Top = 232
        Width = 621
        Height = 117
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            FieldName = 'DT_SOLIC_CH'
            Title.Color = clBlack
            Width = 63
          end
          item
            FieldName = 'NR_SOLIC_CH'
            Title.Color = clBlack
            Width = 69
          end
          item
            FieldName = 'LookBanco'
            Title.Color = clBlack
            Width = 169
          end
          item
            FieldName = 'LookFavorecido'
            Title.Color = clBlack
            Width = 172
          end
          item
            FieldName = 'VL_SOLIC_CH'
            Title.Color = clBlack
            Width = 81
          end
          item
            FieldName = 'LookStatusSolicCh'
            Title.Color = clBlack
          end
          item
            FieldName = 'look_usuario'
            Title.Color = clBlack
          end>
      end
      object msk_cd_cliente: TMaskEdit
        Left = 12
        Top = 88
        Width = 43
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 6
        OnExit = msk_cd_clienteExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object msk_dt_inicio: TMaskEdit
        Left = 12
        Top = 15
        Width = 77
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 0
        Text = '  /  /    '
        OnExit = msk_dt_inicioExit
      end
      object msk_dt_termino: TMaskEdit
        Left = 103
        Top = 15
        Width = 79
        Height = 21
        EditMask = '!99/99/9999;1;_'
        MaxLength = 10
        TabOrder = 1
        Text = '  /  /    '
        OnEnter = msk_dt_terminoEnter
        OnExit = msk_dt_terminoExit
      end
      object msk_cd_usuario: TMaskEdit
        Left = 304
        Top = 15
        Width = 43
        Height = 21
        EditMask = '9999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 4
        ParentFont = False
        TabOrder = 3
        OnExit = msk_cd_usuarioExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_usuario: TEdit
        Left = 353
        Top = 15
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 13
      end
      object edt_nm_item: TEdit
        Left = 353
        Top = 88
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 15
      end
      object msk_nr_cheque: TMaskEdit
        Left = 125
        Top = 122
        Width = 82
        Height = 21
        EditMask = '999999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 6
        ParentFont = False
        TabOrder = 9
      end
      object msk_cd_item: TMaskEdit
        Left = 304
        Top = 88
        Width = 43
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
        OnExit = msk_cd_itemExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object msk_cd_favorecido: TMaskEdit
        Left = 304
        Top = 157
        Width = 43
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 12
        OnExit = msk_cd_favorecidoExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object msk_cd_banco: TMaskEdit
        Left = 12
        Top = 157
        Width = 43
        Height = 21
        EditMask = '999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        TabOrder = 11
        OnExit = msk_cd_bancoExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_banco: TEdit
        Left = 60
        Top = 157
        Width = 207
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 16
      end
      object edt_nm_favorecido: TEdit
        Left = 353
        Top = 157
        Width = 217
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 17
      end
      object edt_nm_cliente: TEdit
        Left = 60
        Top = 88
        Width = 207
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 14
      end
      object msk_vl_solic_ch: TMaskEdit
        Left = 12
        Top = 122
        Width = 101
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnExit = msk_vl_solic_chExit
      end
      object dblckbox_cd_status: TDBLookupComboBox
        Left = 304
        Top = 122
        Width = 225
        Height = 21
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = datm_pesq_solic_ch.ds_status_solic_ch
        TabOrder = 10
        OnClick = dblckbox_cd_statusClick
      end
      object msk_nr_processo: TMaskEdit
        Left = 201
        Top = 15
        Width = 96
        Height = 21
        TabOrder = 2
      end
      object msk_cd_unidade: TMaskEdit
        Left = 12
        Top = 53
        Width = 33
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 4
        OnExit = msk_cd_unidadeExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_unidade: TEdit
        Left = 60
        Top = 53
        Width = 207
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
        TabOrder = 19
      end
      object msk_cd_prod: TMaskEdit
        Left = 304
        Top = 53
        Width = 33
        Height = 21
        EditMask = '!99;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 2
        ParentFont = False
        TabOrder = 5
        OnExit = msk_cd_prodExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object edt_nm_prod: TEdit
        Left = 353
        Top = 53
        Width = 217
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
        TabOrder = 20
      end
      object MaskEdit1: TMaskEdit
        Left = 11
        Top = 194
        Width = 43
        Height = 21
        EditMask = '99999;0; '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 5
        ParentFont = False
        TabOrder = 21
        OnExit = msk_cd_favorecidoExit
        OnKeyDown = msk_cd_clienteKeyDown
      end
      object Edit1: TEdit
        Left = 58
        Top = 194
        Width = 222
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 22
      end
    end
    object ts_solic_ch_: TTabSheet
      Caption = 'Solicitação'
      object pnl_solic_ch: TPanel
        Left = 0
        Top = 3
        Width = 619
        Height = 79
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_nr_solic_ch: TLabel
          Left = 8
          Top = 3
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº Solic.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_solic_ch: TLabel
          Left = 67
          Top = 3
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_hm_solic_ch: TLabel
          Left = 152
          Top = 3
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_solic_ch: TLabel
          Left = 205
          Top = 3
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_cheque2: TLabel
          Left = 313
          Top = 3
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cheque Nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_status_cheque: TLabel
          Left = 432
          Top = 3
          Width = 138
          Height = 13
          Alignment = taRightJustify
          Caption = 'Status da Solic. Cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_banco2: TLabel
          Left = 8
          Top = 41
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_favorecido2: TLabel
          Left = 313
          Top = 41
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_solic_ch: TDBEdit
          Left = 8
          Top = 19
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_solic_ch: TDBEdit
          Left = 67
          Top = 19
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_hm_solic_ch: TDBEdit
          Left = 152
          Top = 19
          Width = 41
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'HM_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_vl_solic_ch: TDBEdit
          Left = 205
          Top = 19
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nr_cheque: TDBEdit
          Left = 313
          Top = 19
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_CHEQUE'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 4
        end
        object dblckbox_status_solic_ch: TDBLookupComboBox
          Left = 432
          Top = 19
          Width = 169
          Height = 21
          DataField = 'CD_STATUS_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Enabled = False
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pesq_solic_ch.ds_status_solic_ch
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_banco: TDBEdit
          Left = 8
          Top = 54
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          MaxLength = 3
          TabOrder = 6
        end
        object dbedt_nm_banco: TDBEdit
          Left = 45
          Top = 54
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 313
          Top = 54
          Width = 45
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          MaxLength = 3
          TabOrder = 8
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 361
          Top = 54
          Width = 214
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          ReadOnly = True
          TabOrder = 9
        end
      end
      object pnl_solic_ch_itens: TPanel
        Left = 1
        Top = 84
        Width = 619
        Height = 268
        BevelOuter = bvLowered
        Caption = 'pnl_solic_ch_itens'
        TabOrder = 1
        object pgctrl_solic_ch_itens: TPageControl
          Left = 4
          Top = 2
          Width = 610
          Height = 263
          ActivePage = ts_lista2
          TabOrder = 0
          object ts_lista2: TTabSheet
            Caption = '    Lista    '
            object dbg_contatos: TDBGrid
              Left = 0
              Top = 0
              Width = 605
              Height = 233
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  FieldName = 'NR_LANCAMENTO'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                end
                item
                  FieldName = 'CalcNrProcesso'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 56
                end
                item
                  FieldName = 'LookCli'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 182
                end
                item
                  FieldName = 'LookItem'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 142
                end
                item
                  FieldName = 'VL_ITEM'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                end
                item
                  FieldName = 'LookStSolicChItens'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                end>
            end
          end
          object ts_solic_ch_itens: TTabSheet
            Caption = 'Discriminação'
            object lbl_unid_neg: TLabel
              Left = 4
              Top = 1
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_produto: TLabel
              Left = 305
              Top = 1
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
            object lbl_processo: TLabel
              Left = 4
              Top = 44
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_cliente3: TLabel
              Left = 129
              Top = 44
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_servico: TLabel
              Left = 385
              Top = 44
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serviço'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_item2: TLabel
              Left = 4
              Top = 90
              Width = 25
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Item'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_item2: TLabel
              Left = 4
              Top = 140
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Valor'
              FocusControl = dbedt_vl_item
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_ir: TLabel
              Left = 113
              Top = 140
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'IR-Fonte'
              FocusControl = dbedt_vl_ir
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_vl_assist: TLabel
              Left = 305
              Top = 188
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'C.Assist.'
              FocusControl = dbedt_vl_assist
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_despachante: TLabel
              Left = 4
              Top = 188
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Despachante'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lbl_status2: TLabel
              Left = 305
              Top = 89
              Width = 203
              Height = 13
              Alignment = taRightJustify
              Caption = 'Status da Discriminação do Cheque'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_item: TDBEdit
              Left = 4
              Top = 156
              Width = 101
              Height = 21
              DataField = 'VL_ITEM'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              TabOrder = 1
            end
            object dbedt_vl_ir: TDBEdit
              Left = 113
              Top = 156
              Width = 101
              Height = 21
              DataField = 'VL_IR'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              TabOrder = 2
            end
            object dbedt_vl_assist: TDBEdit
              Left = 305
              Top = 203
              Width = 101
              Height = 21
              DataField = 'VL_ASSIST'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              TabOrder = 4
            end
            object dbedt_cd_item: TDBEdit
              Left = 4
              Top = 106
              Width = 33
              Height = 21
              DataField = 'CD_ITEM'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              MaxLength = 3
              TabOrder = 0
            end
            object dbedt_nm_item: TDBEdit
              Left = 41
              Top = 106
              Width = 229
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookItem'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_cd_despachante: TDBEdit
              Left = 4
              Top = 203
              Width = 33
              Height = 21
              DataField = 'CD_DESPACHANTE'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              MaxLength = 3
              TabOrder = 3
            end
            object dbedt_nm_despachante: TDBEdit
              Left = 42
              Top = 203
              Width = 228
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'LookDespachante'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              ReadOnly = True
              TabOrder = 6
            end
            object dblckbox_st_solic_ch_itens: TDBLookupComboBox
              Left = 304
              Top = 105
              Width = 169
              Height = 21
              DataField = 'CD_STATUS'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              Enabled = False
              KeyField = 'CODIGO'
              ListField = 'DESCRICAO'
              ListSource = datm_pesq_solic_ch.ds_status_item_solic_ch
              ReadOnly = True
              TabOrder = 7
            end
            object dbedt_nr_processo: TDBEdit
              Left = 4
              Top = 58
              Width = 101
              Height = 21
              DataField = 'CalcNrProcesso'
              DataSource = datm_pesq_solic_ch.ds_solic_ch_itens
              TabOrder = 8
              OnChange = dbedt_nr_processoChange
            end
            object msk_cd_unid_neg: TMaskEdit
              Left = 4
              Top = 16
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
              TabOrder = 9
            end
            object edt_nm_unid_neg: TEdit
              Left = 32
              Top = 16
              Width = 238
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 10
            end
            object edt_nm_produto: TEdit
              Left = 338
              Top = 16
              Width = 223
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 11
            end
            object msk_cd_produto: TMaskEdit
              Left = 305
              Top = 16
              Width = 29
              Height = 21
              EditMask = '99;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 2
              ParentFont = False
              TabOrder = 12
            end
            object msk_cd_cliente2: TMaskEdit
              Left = 128
              Top = 58
              Width = 36
              Height = 21
              EditMask = '99;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 2
              ParentFont = False
              TabOrder = 13
            end
            object edt_nm_cliente2: TEdit
              Left = 168
              Top = 58
              Width = 197
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 14
            end
            object msk_cd_servico: TMaskEdit
              Left = 385
              Top = 58
              Width = 29
              Height = 21
              EditMask = '99;0; '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              MaxLength = 2
              ParentFont = False
              TabOrder = 15
            end
            object edt_nm_servico: TEdit
              Left = 418
              Top = 58
              Width = 182
              Height = 21
              TabStop = False
              Color = clMenu
              ReadOnly = True
              TabOrder = 16
            end
          end
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 569
    Top = 4
    object mi_pesq_solic: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesq_solic_chClick
    end
    object mi_cancela: TMenuItem
      Caption = '&Cancela'
      OnClick = btn_cancelaClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
