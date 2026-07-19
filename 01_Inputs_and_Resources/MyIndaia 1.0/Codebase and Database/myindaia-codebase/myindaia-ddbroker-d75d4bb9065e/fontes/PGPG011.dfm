object frm_solic_adm: Tfrm_solic_adm
  Left = 222
  Top = 124
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Solicita'#231#227'o - Administrativo'
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
    Width = 742
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir: TSpeedButton
      Left = 4
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
      OnClick = btn_incluirClick
    end
    object btn_sair: TSpeedButton
      Left = 457
      Top = 4
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
      Left = 42
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
      Left = 80
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
    object btn_solic: TSpeedButton
      Left = 118
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Solicitar Pagto'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_solicClick
    end
    object btn_marca_todas: TSpeedButton
      Left = 232
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Marcar Todas'
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
      OnClick = btn_marca_todasClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 194
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Desmarcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object btn_canc_lanc: TSpeedButton
      Left = 156
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Cancelar Conta Cont'#225'bil da Solicita'#231#227'o de Pagto'
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
      OnClick = btn_canc_lancClick
    end
    object dbnvg: TDBNavigator
      Left = 302
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_solic_adm.ds_solic_adm
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
      BeforeAction = dbnvgBeforeAction
    end
  end
  object pgctrl_solic_adm: TPageControl
    Left = 0
    Top = 100
    Width = 742
    Height = 404
    ActivePage = ts_lista
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_solic_admChange
    object ts_lista: TTabSheet
      Caption = '   Lista   '
      object dbgrdSolicAdm: TDBGrid
        Left = 0
        Top = 0
        Width = 734
        Height = 376
        Align = alClient
        DataSource = datm_solic_adm.ds_solic_adm
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
            Alignment = taCenter
            Expanded = False
            FieldName = 'LookSolicitado'
            Title.Alignment = taCenter
            Title.Caption = 'Sol.'
            Title.Color = clBlack
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_CT_CONTABIL'
            Title.Color = clBlack
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookCtContabil'
            Title.Color = clBlack
            Width = 156
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcVlTotal'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Visible = True
          end>
      end
    end
    object ts_adm: TTabSheet
      Caption = 'Movimentos'
      object pnl_solic_adm: TPanel
        Left = 0
        Top = 0
        Width = 734
        Height = 376
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_ct_contabil: TLabel
          Left = 99
          Top = 3
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Conta Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_item: TLabel
          Left = 7
          Top = 39
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_contabil: TSpeedButton
          Left = 488
          Top = 15
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
          OnClick = btn_co_ct_contabilClick
        end
        object lbl_favorecido: TLabel
          Left = 7
          Top = 75
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
          Left = 364
          Top = 88
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
        object lbl_dt_pagto_recebto: TLabel
          Left = 400
          Top = 114
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Pagto'
          FocusControl = dbedt_dt_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_vencto: TLabel
          Left = 400
          Top = 76
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Vencto'
          FocusControl = dbedt_dt_vencto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_acesso: TLabel
          Left = 7
          Top = 3
          Width = 42
          Height = 13
          Caption = 'Acesso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_aux: TLabel
          Left = 57
          Top = 3
          Width = 22
          Height = 13
          Caption = 'Aux'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_historico: TLabel
          Left = 7
          Top = 114
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_historico: TSpeedButton
          Left = 364
          Top = 127
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
          OnClick = btn_co_historicoClick
        end
        object lbl_desconto: TLabel
          Left = 126
          Top = 39
          Width = 88
          Height = 13
          Caption = 'Valor Desconto'
          FocusControl = dbedt_vl_desconto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_perc_desconto: TLabel
          Left = 248
          Top = 39
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = '% Desconto'
          FocusControl = dbedt_perc_desconto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_total: TLabel
          Left = 375
          Top = 39
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total'
          FocusControl = dbedt_vl_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_nr_lancamento: TLabel
          Left = 517
          Top = 3
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Lancto'
          FocusControl = dbedt_nr_lancamento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 7
          Top = 152
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_custo: TSpeedButton
          Left = 359
          Top = 165
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
          OnClick = btn_co_custoClick
        end
        object dbedt_vl_pagto: TDBEdit
          Left = 7
          Top = 53
          Width = 101
          Height = 21
          DataField = 'VL_LANCTO'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 3
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_vl_pagtoExit
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 7
          Top = 89
          Width = 47
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_solic_adm.ds_solic_adm
          MaxLength = 4
          TabOrder = 5
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_nm_ct_contabil: TDBEdit
          Left = 175
          Top = 16
          Width = 309
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCtContabil'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_cd_ct_contabil: TDBEdit
          Left = 99
          Top = 16
          Width = 73
          Height = 21
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 2
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_cd_ct_contabilExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 56
          Top = 89
          Width = 304
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_dt_pagto: TDBEdit
          Left = 400
          Top = 128
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_dt_vencto: TDBEdit
          Left = 400
          Top = 90
          Width = 101
          Height = 21
          DataField = 'DT_VENCTO'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 6
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_dt_venctoExit
        end
        object dbedt_cd_acesso: TDBEdit
          Left = 7
          Top = 16
          Width = 32
          Height = 21
          DataField = 'CD_ACESSO'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 0
          OnChange = dbedt_cd_ct_contabilChange
          OnEnter = dbedt_cd_acessoEnter
          OnExit = dbedt_cd_acessoExit
        end
        object dbedt_cd_aux: TDBEdit
          Left = 56
          Top = 16
          Width = 32
          Height = 21
          DataField = 'CD_AUX'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 1
          OnChange = dbedt_cd_ct_contabilChange
          OnEnter = dbedt_cd_auxEnter
          OnExit = dbedt_cd_auxExit
        end
        object dbrdgrp_tp_natureza: TDBRadioGroup
          Left = 517
          Top = 39
          Width = 90
          Height = 53
          Caption = 'Natureza'
          DataField = 'TP_NATUREZA'
          DataSource = datm_solic_adm.ds_solic_adm
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Cr'#233'dito'
            'D'#233'bito')
          ParentFont = False
          TabOrder = 4
          Values.Strings = (
            'C'
            'D')
          OnChange = dbedt_cd_ct_contabilChange
        end
        object dbedt_cd_historico: TDBEdit
          Left = 7
          Top = 128
          Width = 47
          Height = 21
          DataField = 'CD_HISTORICO'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 7
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_cd_historicoExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_nm_historico: TDBEdit
          Left = 56
          Top = 128
          Width = 304
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookHistorico'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_vl_desconto: TDBEdit
          Left = 126
          Top = 53
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DESCONTO'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_perc_desconto: TDBEdit
          Left = 248
          Top = 53
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_PERC_DESCONTO'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_vl_total: TDBEdit
          Left = 375
          Top = 53
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcVlTotal'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_nr_lancamento: TDBEdit
          Left = 517
          Top = 16
          Width = 40
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 17
        end
        object dbrdgrp_tp_lancamento: TDBRadioGroup
          Left = 517
          Top = 98
          Width = 90
          Height = 51
          Caption = 'Lan'#231'amento'
          DataField = 'TP_LANCAMENTO'
          DataSource = datm_solic_adm.ds_solic_adm
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Cheque'
            'Nota')
          ParentFont = False
          TabOrder = 8
          Values.Strings = (
            'C'
            'N')
          OnChange = dbedt_cd_ct_contabilChange
        end
        object dbedt_cd_ct_custo: TDBEdit
          Left = 7
          Top = 166
          Width = 41
          Height = 21
          DataField = 'CD_CT_CUSTO'
          DataSource = datm_solic_adm.ds_solic_adm
          TabOrder = 9
          OnChange = btn_co_custoClick
          OnExit = dbedt_cd_ct_custoExit
          OnKeyDown = dbedt_cd_ct_contabilKeyDown
        end
        object dbedt_nm_custo: TDBEdit
          Left = 51
          Top = 166
          Width = 304
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCusto'
          DataSource = datm_solic_adm.ds_solic_adm
          ReadOnly = True
          TabOrder = 18
        end
      end
      object dbm_tx_historico: TDBMemo
        Left = 6
        Top = 196
        Width = 601
        Height = 115
        DataField = 'TX_HISTORICO'
        DataSource = datm_solic_adm.ds_solic_adm
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = dbedt_cd_ct_contabilChange
      end
    end
  end
  object pnl_filtros: TPanel
    Left = 0
    Top = 49
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_unid_neg: TLabel
      Left = 10
      Top = 7
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
    object btn_co_unid_neg: TSpeedButton
      Left = 224
      Top = 21
      Width = 23
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
    object lbl_data: TLabel
      Left = 265
      Top = 7
      Width = 60
      Height = 13
      Caption = 'Data Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 10
      Top = 22
      Width = 25
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
    end
    object edt_nm_unid_neg: TEdit
      Left = 40
      Top = 22
      Width = 181
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_dt_base: TMaskEdit
      Left = 265
      Top = 22
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnEnter = msk_dt_baseEnter
      OnExit = msk_dt_baseExit
    end
  end
  object menu_cadastro: TMainMenu
    Left = 513
    Top = 4
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
    object mi_solic: TMenuItem
      Caption = 'So&licitar'
      OnClick = btn_solicClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
