object frm_numerario: Tfrm_numerario
  Left = 188
  Top = 100
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Solicita'#231#227'o de Numer'#225'rio'
  ClientHeight = 437
  ClientWidth = 632
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
  object pnl_cadastro: TPanel
    Left = 1
    Top = 0
    Width = 629
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 278
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Volta ao Menu Principal'
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 8
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
    end
    object btn_cancela_numerario: TSpeedButton
      Left = 136
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelar Solicita'#231#227'o de Numer'#225'rio'
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
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancela_numerarioClick
    end
    object btn_salvar: TSpeedButton
      Left = 36
      Top = 8
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
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Cancelar Dados'
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
    object btn_excluir: TSpeedButton
      Left = 92
      Top = 8
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
    object btn_cambio: TSpeedButton
      Left = 526
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Tabela de Moedas/C'#226'mbio'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FF555FFFFFFF5FF0075500000005000775F57777777F7770B0550CC0090
        50E07F7F57FF77F7F7F70B055000000050E07F75F7777777F7F70B7750CC0090
        50E075F7F7F577F7F7F777B050CC009050E057F7F7F577F7F7F750B050CC0090
        50E057F757F577F7F7F750B770CC009050E0575F77F577F7F7F7577B00CC0090
        50E0557F77F577F7F7F7550B30CC00905000557F57FF77F7F777550B30000090
        50E05575F77777F7F7F7557000CC00905000555777FF77F7F777555550000090
        55555555577777F7F5555555555550005555555555555777F555555555555090
        55555555555557F7F55555555555500055555555555557775555}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cambioClick
    end
    object btn_duplica: TSpeedButton
      Left = 177
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Duplica'#231#227'o '
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
    object btn_print_: TSpeedButton
      Left = 217
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Impress'#227'o de solicita'#231#227'o'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_print_Click
    end
  end
  object pgctrl_numerario: TPageControl
    Left = 0
    Top = 126
    Width = 630
    Height = 309
    ActivePage = ts_item
    Enabled = False
    HotTrack = True
    TabOrder = 1
    OnChange = pgctrl_numerarioChange
    OnChanging = pgctrl_numerarioChanging
    object ts_solicitacao: TTabSheet
      Caption = 'Solicita'#231#227'o'
      object dbg_solicitacao: TDBGrid
        Left = 1
        Top = 2
        Width = 618
        Height = 274
        DataSource = datm_numerario.ds_solinum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
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
            FieldName = 'NR_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_SOLICITACAO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 71
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Look_ap_usuario'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Alignment = taCenter
            Title.Caption = 'Solicitado'
            Title.Color = clBlack
            Width = 88
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DT_EMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Emiss'#227'o'
            Title.Color = clBlack
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Recebido'
            Title.Color = clBlack
            Width = 87
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Status'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 113
            Visible = True
          end>
      end
    end
    object ts_item: TTabSheet
      Caption = 'Itens'
      object dbg_itens: TDBGrid
        Left = 1
        Top = 1
        Width = 618
        Height = 152
        DataSource = datm_numerario.ds_itens_solinum
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'NR_SOLICITACAO'
            Title.Caption = 'Solic.'
            Title.Color = clBlack
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LK_NM_ITEM'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 198
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_SOLICITADO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_RECEBIDO'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 70
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LK_NM_STATUS'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Caption = 'Tipo do Destino'
            Title.Color = clBlack
            Width = 64
            Visible = True
          end>
      end
      object pnl_item: TPanel
        Left = 0
        Top = 155
        Width = 621
        Height = 126
        BevelInner = bvLowered
        BevelWidth = 2
        TabOrder = 1
        OnEnter = pnl_itemExit
        OnExit = pnl_itemExit
        object Label3: TLabel
          Left = 10
          Top = 42
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
        object Label5: TLabel
          Left = 368
          Top = 42
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Solicitado'
          FocusControl = dbedt_vl_solicitado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 10
          Top = 79
          Width = 58
          Height = 13
          AutoSize = False
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_banco: TSpeedButton
          Left = 324
          Top = 93
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
          OnClick = btn_co_bancoClick
        end
        object Label6: TLabel
          Left = 368
          Top = 79
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_item: TSpeedButton
          Left = 324
          Top = 56
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
          OnClick = btn_co_itemClick
        end
        object lbl_favorecido: TLabel
          Left = 158
          Top = 6
          Width = 71
          Height = 13
          AutoSize = False
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_favorecido: TSpeedButton
          Left = 460
          Top = 17
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
          OnClick = btn_co_favorecidoClick
        end
        object Label4: TLabel
          Left = 10
          Top = 6
          Width = 91
          Height = 13
          AutoSize = False
          Caption = 'Tipo de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_solicitado: TDBEdit
          Left = 368
          Top = 56
          Width = 117
          Height = 21
          DataField = 'VL_SOLICITADO'
          DataSource = datm_numerario.ds_itens_solinum
          TabOrder = 3
          OnChange = dbedt_cd_bancoChange
        end
        object dbedt_cd_banco: TDBEdit
          Left = 10
          Top = 94
          Width = 41
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_numerario.ds_itens_solinum
          MaxLength = 3
          TabOrder = 4
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_bancoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_banco: TDBEdit
          Left = 53
          Top = 94
          Width = 264
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_numerario.ds_itens_solinum
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_vl_calculado: TDBEdit
          Left = 368
          Top = 94
          Width = 117
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_ITEM_CALCULADO'
          DataSource = datm_numerario.ds_itens_solinum
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_cd_item: TDBEdit
          Left = 10
          Top = 56
          Width = 41
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_numerario.ds_itens_solinum
          MaxLength = 3
          TabOrder = 2
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_item: TDBEdit
          Left = 53
          Top = 56
          Width = 264
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LK_NM_ITEM'
          DataSource = datm_numerario.ds_itens_solinum
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 158
          Top = 19
          Width = 47
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_numerario.ds_itens_solinum
          MaxLength = 5
          TabOrder = 1
          OnChange = dbedt_cd_bancoChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 208
          Top = 19
          Width = 245
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_numerario.ds_itens_solinum
          ReadOnly = True
          TabOrder = 8
        end
        object dblckpbox_tp_destino: TDBLookupComboBox
          Left = 10
          Top = 20
          Width = 145
          Height = 21
          DataField = 'TP_DESTINO'
          DataSource = datm_numerario.ds_itens_solinum
          KeyField = 'CD_TP_DESTINO'
          ListField = 'NM_TP_DESTINO'
          ListSource = datm_numerario.ds_tp_destino
          TabOrder = 0
          OnClick = dblckpbox_tp_destinoClick
        end
      end
    end
  end
  object pnl_selecao: TPanel
    Left = 1
    Top = 43
    Width = 629
    Height = 81
    BevelOuter = bvLowered
    TabOrder = 2
    OnExit = pnl_selecaoExit
    object lbl_cd_cliente: TLabel
      Left = 8
      Top = 41
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
      Left = 379
      Top = 2
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
      Left = 491
      Top = 16
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
      OnClick = btn_processoClick
    end
    object Label1: TLabel
      Left = 185
      Top = 2
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
      Left = 347
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 2
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
      Left = 155
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
      OnClick = btn_cd_unid_negClick
    end
    object lbl_cd_servico: TLabel
      Left = 266
      Top = 41
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
      Left = 378
      Top = 16
      Width = 111
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 185
      Top = 16
      Width = 21
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
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 209
      Top = 16
      Width = 136
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 16
      Width = 21
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
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 30
      Top = 16
      Width = 124
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object dbedt_cd_cliente: TDBEdit
      Left = 8
      Top = 55
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_CLIENTE'
      DataSource = datm_numerario.ds_processo
      ReadOnly = True
      TabOrder = 5
    end
    object dbedt_cd_servico: TDBEdit
      Left = 266
      Top = 55
      Width = 39
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CD_SERVICO'
      DataSource = datm_numerario.ds_processo
      ReadOnly = True
      TabOrder = 6
    end
    object dbedt_nm_cliente: TDBEdit
      Left = 50
      Top = 55
      Width = 211
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'AP_EMPRESA'
      DataSource = datm_numerario.ds_processo
      ReadOnly = True
      TabOrder = 7
    end
    object dbedt_nm_servico: TDBEdit
      Left = 308
      Top = 55
      Width = 206
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NM_SERVICO'
      DataSource = datm_numerario.ds_processo
      ReadOnly = True
      TabOrder = 8
    end
    object dbrdgrp_base_calculo: TDBRadioGroup
      Left = 519
      Top = 2
      Width = 102
      Height = 74
      Caption = 'Calcular pela'
      DataField = 'CD_BASE_CALCULO'
      DataSource = datm_numerario.ds_solinum
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'D.I.'
        'Previs'#227'o')
      ParentFont = False
      TabOrder = 9
      Values.Strings = (
        '0'
        '1')
      OnChange = dbrdgrp_base_calculoChange
    end
  end
  object menu_cadastro: TMainMenu
    Left = 568
    Top = 364
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
      RadioItem = True
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
      OnClick = btn_excluirClick
    end
    object mi_cancela_numerario: TMenuItem
      Caption = 'Cancelar &Numer'#225'rio'
      Enabled = False
      OnClick = btn_cancela_numerarioClick
    end
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      OnClick = btn_duplicaClick
    end
    object mi_print_: TMenuItem
      Caption = 'Im&press'#227'o'
      Enabled = False
      OnClick = btn_print_Click
    end
    object mi_saida: TMenuItem
      Caption = 'Sai&r'
      RadioItem = True
      OnClick = btn_sairClick
    end
  end
end
