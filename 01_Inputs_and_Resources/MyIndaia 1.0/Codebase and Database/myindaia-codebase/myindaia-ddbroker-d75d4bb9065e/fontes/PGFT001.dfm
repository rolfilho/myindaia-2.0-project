object frm_fat_cc: Tfrm_fat_cc
  Left = 199
  Top = 127
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conta Corrente - Faturamento'
  ClientHeight = 504
  ClientWidth = 741
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
  object TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 48
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 2
      Top = 5
      Width = 38
      Height = 38
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
    object btn_sair: TSpeedButton
      Left = 392
      Top = 5
      Width = 38
      Height = 38
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
      Top = 5
      Width = 38
      Height = 38
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
      Top = 5
      Width = 38
      Height = 38
      Hint = 'Cancelar Opera'#231#227'o'
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
    object btn_cancelamento: TSpeedButton
      Left = 116
      Top = 5
      Width = 38
      Height = 38
      Hint = 'Cancelamento'
      Enabled = False
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
      OnClick = btn_cancelamentoClick
    end
    object dbnvg: TDBNavigator
      Left = 187
      Top = 11
      Width = 100
      Height = 25
      DataSource = datm_fat_cc.ds_fat_cc
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Pr'#243'xima'
        #218'ltima')
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 434
      Top = 2
      Width = 305
      Height = 44
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 2
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
        Left = 166
        Top = 2
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
        Left = 6
        Top = 16
        Width = 153
        Height = 21
        TabStop = False
        Enabled = False
        TabOrder = 0
        OnChange = edt_chaveChange
      end
      object cb_ordem: TComboBox
        Left = 166
        Top = 16
        Width = 133
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        TabStop = False
        OnClick = cb_ordemClick
        Items.Strings = (
          'N'#250'mero'
          'Data')
      end
    end
  end
  object pnl_selecao: TPanel
    Left = 0
    Top = 48
    Width = 741
    Height = 77
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl_cd_cliente: TLabel
      Left = 7
      Top = 38
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
    object lbl_nr_processo: TLabel
      Left = 519
      Top = 3
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
    object btn_processo: TSpeedButton
      Left = 631
      Top = 15
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
      OnClick = btn_processoClick
    end
    object Label3: TLabel
      Left = 267
      Top = 3
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
    object btn_cd_produto: TSpeedButton
      Left = 483
      Top = 15
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 7
      Top = 3
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 231
      Top = 15
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
      OnClick = btn_cd_unid_negClick
    end
    object lbl_cd_servico: TLabel
      Left = 267
      Top = 38
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
    object msk_nr_processo: TMaskEdit
      Left = 519
      Top = 16
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 267
      Top = 16
      Width = 24
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
      OnChange = msk_cd_produtoChange
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 291
      Top = 16
      Width = 192
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 7
      Top = 16
      Width = 24
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
      OnChange = msk_cd_unid_negChange
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 31
      Top = 16
      Width = 201
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 7
      Top = 53
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_CLIENTE'
      DataSource = datm_fat_cc.ds_processo
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_servico: TDBEdit
      Left = 267
      Top = 53
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_SERVICO'
      DataSource = datm_fat_cc.ds_processo
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 47
      Top = 53
      Width = 210
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'AP_EMPRESA'
      DataSource = datm_fat_cc.ds_processo
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_nm_servico: TDBEdit
      Left = 306
      Top = 53
      Width = 203
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NM_SERVICO'
      DataSource = datm_fat_cc.ds_processo
      ReadOnly = True
      TabOrder = 8
    end
  end
  object pgctrl_fat_cc: TPageControl
    Left = 0
    Top = 125
    Width = 741
    Height = 379
    ActivePage = ts_lista
    Align = alClient
    HotTrack = True
    TabOrder = 2
    OnChange = pgctrl_fat_ccChange
    OnChanging = pgctrl_fat_ccChanging
    object ts_lista: TTabSheet
      Caption = '&Lan'#231'amentos'
      object dbg_faturamento_cc: TDBGrid
        Left = 0
        Top = 0
        Width = 733
        Height = 351
        Align = alClient
        DataSource = datm_fat_cc.ds_fat_cc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO'
            Title.Caption = 'N'#250'mero'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_LANCAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_nm_item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 268
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_vl_lancamento'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor da Despesa'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_cancelado'
            Title.Caption = 'Cancelado'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '&Dados Basicos'
      object pnl_dados_basicos: TPanel
        Left = 3
        Top = 3
        Width = 726
        Height = 344
        BevelOuter = bvLowered
        Enabled = False
        TabOrder = 0
        object lbl_favorecido: TLabel
          Left = 11
          Top = 10
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
          Left = 334
          Top = 24
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
          OnClick = btn_co_favorecidoClick
        end
        object lbl_item: TLabel
          Left = 10
          Top = 51
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
        object btn_co_item: TSpeedButton
          Left = 334
          Top = 64
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
          OnClick = btn_co_itemClick
        end
        object lbl_vl_lanc_fatur: TLabel
          Left = 10
          Top = 94
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_lanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_ir: TLabel
          Left = 129
          Top = 94
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
        object lbl_despachante: TLabel
          Left = 254
          Top = 93
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
        object btn_co_despachante: TSpeedButton
          Left = 520
          Top = 106
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
          OnClick = btn_co_despachanteClick
        end
        object lbl_vl_assist: TLabel
          Left = 553
          Top = 93
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
        object lbl_banco_fatur: TLabel
          Left = 169
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
        object lbl_nr_cheque_fatur: TLabel
          Left = 169
          Top = 190
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cheque N'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 445
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
        object Label4: TLabel
          Left = 361
          Top = 49
          Width = 79
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Complemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 640
          Top = 7
          Width = 15
          Height = 13
          Caption = 'N'#186
          FocusControl = dbedt_nr_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 496
          Top = 7
          Width = 28
          Height = 13
          Caption = 'Data'
          FocusControl = dbedt_dt_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 480
          Top = 236
          Width = 72
          Height = 13
          Caption = 'Proced'#234'ncia'
          FocusControl = dbedt_dt_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_in_restitui: TLabel
          Left = 604
          Top = 49
          Width = 44
          Height = 13
          Caption = 'Restitui'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cancelado: TLabel
          Left = 419
          Top = 23
          Width = 61
          Height = 13
          Caption = 'Cancelado'
          FocusControl = dbedt_dt_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lbl_faturado: TLabel
          Left = 169
          Top = 236
          Width = 204
          Height = 13
          Caption = 'Faturado na Solicita'#231#227'o / N'#186' Fatura'
          FocusControl = dbedt_dt_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label8: TLabel
          Left = 376
          Top = 238
          Width = 98
          Height = 13
          Caption = 'Data Concilia'#231#227'o'
          FocusControl = dbedt_dt_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 11
          Top = 24
          Width = 44
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 0
          OnChange = dbedt_cd_favorecidoChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = msk_nr_processoKeyDown
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 58
          Top = 24
          Width = 271
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_favorecido'
          DataSource = datm_fat_cc.ds_fat_cc
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_item: TDBEdit
          Left = 10
          Top = 65
          Width = 33
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 2
          OnChange = dbedt_cd_favorecidoChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = msk_nr_processoKeyDown
        end
        object dbedt_nm_item: TDBEdit
          Left = 46
          Top = 65
          Width = 283
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_item'
          DataSource = datm_fat_cc.ds_fat_cc
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_complemento: TDBEdit
          Left = 363
          Top = 65
          Width = 235
          Height = 21
          DataField = 'NM_ITEM_COMPLEMENTO'
          DataSource = datm_fat_cc.ds_fat_cc
          MaxLength = 30
          TabOrder = 4
          OnChange = dbedt_cd_favorecidoChange
        end
        object dbedt_vl_lanc: TDBEdit
          Left = 10
          Top = 107
          Width = 111
          Height = 21
          DataField = 'VL_ITEM'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 6
          OnChange = dbedt_cd_favorecidoChange
          OnExit = dbedt_vl_lancExit
        end
        object dbedt_vl_ir: TDBEdit
          Left = 130
          Top = 107
          Width = 111
          Height = 21
          DataField = 'VL_IR'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 7
          OnClick = dbedt_cd_favorecidoChange
        end
        object dbedt_cd_despachante: TDBEdit
          Left = 254
          Top = 107
          Width = 33
          Height = 21
          DataField = 'CD_DESPACHANTE'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 8
          OnChange = dbedt_cd_favorecidoChange
          OnExit = dbedt_cd_despachanteExit
          OnKeyDown = msk_nr_processoKeyDown
        end
        object dbedt_nm_despachante: TDBEdit
          Left = 291
          Top = 107
          Width = 228
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_despachante'
          DataSource = datm_fat_cc.ds_fat_cc
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_vl_assist: TDBEdit
          Left = 553
          Top = 107
          Width = 101
          Height = 21
          DataField = 'VL_ASSIST'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 9
          OnChange = dbedt_cd_favorecidoChange
        end
        object dbedt_cd_banco: TDBEdit
          Left = 169
          Top = 157
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 11
          OnChange = dbedt_cd_favorecidoChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = msk_nr_processoKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 207
          Top = 157
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_banco'
          DataSource = datm_fat_cc.ds_fat_cc
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_nr_cheque: TDBEdit
          Left = 169
          Top = 204
          Width = 104
          Height = 21
          DataField = 'NR_CHEQUE'
          DataSource = datm_fat_cc.ds_fat_cc
          MaxLength = 8
          TabOrder = 12
          OnChange = dbedt_cd_favorecidoChange
        end
        object dbedt_nr_lancamento: TDBEdit
          Left = 585
          Top = 22
          Width = 68
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_fat_cc.ds_fat_cc
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_dt_lancamento: TDBEdit
          Left = 496
          Top = 22
          Width = 77
          Height = 21
          DataField = 'DT_LANCAMENTO'
          DataSource = datm_fat_cc.ds_fat_cc
          TabOrder = 16
          OnChange = dbedt_cd_favorecidoChange
        end
        object dbedt_tp_procedencia: TDBEdit
          Left = 482
          Top = 252
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_tp_procedencia'
          DataSource = datm_fat_cc.ds_fat_cc
          ReadOnly = True
          TabOrder = 17
        end
        object dbrdgrp_forma_pagto: TDBRadioGroup
          Left = 10
          Top = 137
          Width = 148
          Height = 184
          Caption = '&Forma de Pagamento'
          DataField = 'CD_FORMA_PAGTO'
          DataSource = datm_fat_cc.ds_fat_cc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Dinheiro'
            'Cheque'
            'TED'
            'DOC / D'#233'bito Conta'
            'Sem Desembolso'
            'L&&P'
            'Outros'
            'PisCofins')
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          TabStop = True
          Values.Strings = (
            '$'
            'C'
            'T'
            'D'
            'S'
            'L'
            'O'
            'P')
          OnChange = dbrdgrp_forma_pagtoChange
        end
        object dblkpcbox_restitui: TDBLookupComboBox
          Left = 604
          Top = 65
          Width = 50
          Height = 21
          DataField = 'IN_RESTITUI'
          DataSource = datm_fat_cc.ds_fat_cc
          DropDownRows = 3
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_fat_cc.ds_yesno
          TabOrder = 5
          OnClick = dbedt_cd_favorecidoChange
        end
        object dbedt_nr_solic_fat: TDBEdit
          Left = 169
          Top = 252
          Width = 81
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_FAT'
          DataSource = datm_fat_cc.ds_fat_cc
          MaxLength = 8
          ReadOnly = True
          TabOrder = 18
          OnChange = dbedt_cd_favorecidoChange
        end
        object dbedt_nr_nota_fatura: TDBEdit
          Left = 259
          Top = 252
          Width = 81
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_NOTA_FATURA'
          DataSource = datm_fat_cc.ds_fs_fatura
          MaxLength = 8
          ReadOnly = True
          TabOrder = 19
          OnChange = dbedt_cd_favorecidoChange
        end
        object edt_dt_conc: TEdit
          Left = 377
          Top = 252
          Width = 93
          Height = 21
          Color = clMenu
          TabOrder = 20
        end
      end
    end
    object ts_pagto_cliente: TTabSheet
      Caption = '  Pagtos. Cliente  '
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 733
        Height = 351
        Align = alClient
        DataSource = datm_fat_cc.ds_fat_cc_cliente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_LANCAMENTO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NM_ITEM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 268
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_ITEM'
            Title.Alignment = taRightJustify
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 116
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TX_YESNO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 544
    Top = 292
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
    object mi_cancelamento: TMenuItem
      Caption = 'Cance&lamento'
      Enabled = False
      OnClick = btn_cancelamentoClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
