object frm_pe_itens: Tfrm_pe_itens
  Left = 300
  Top = 381
  Width = 653
  Height = 497
  BorderIcons = [biSystemMenu]
  Caption = 'Pedido de Exporta'#231#227'o '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 439
    Align = alClient
    TabOrder = 0
    object Bevel11: TBevel
      Left = 249
      Top = 0
      Width = 232
      Height = 37
    end
    object Label6: TLabel
      Left = 256
      Top = 14
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
    object Label17: TLabel
      Left = 316
      Top = 14
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
    object pnl_cadastro: TPanel
      Left = 0
      Top = 0
      Width = 245
      Height = 37
      BevelOuter = bvLowered
      TabOrder = 0
      object btn_sair: TSpeedButton
        Left = 206
        Top = 8
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
        Left = 29
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
        Left = 54
        Top = 8
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
      object btn_novo_item: TSpeedButton
        Left = 4
        Top = 8
        Width = 25
        Height = 25
        Hint = 'Novo Item'
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
        OnClick = btn_novo_itemClick
      end
      object btn_capa_pe: TSpeedButton
        Left = 144
        Top = 8
        Width = 25
        Height = 25
        Hint = 'Capa PE'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
          0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
          005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
          0555557575757575755555505050505055555557575757575555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_capa_peClick
      end
      object btn_duplicar: TSpeedButton
        Left = 108
        Top = 8
        Width = 25
        Height = 25
        Hint = 'Duplica'#231#227'o de Item'
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
        OnClick = btn_duplicarClick
      end
      object btn_excluir: TSpeedButton
        Left = 79
        Top = 8
        Width = 25
        Height = 25
        Hint = 'Excluir item'
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
    end
    object DBNavigator: TDBNavigator
      Left = 358
      Top = 8
      Width = 112
      Height = 25
      DataSource = datm_pe_itens.ds_pe_itens_
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro item'
        'Item Anterior'
        'Pr'#243'ximo item'
        #218'ltimo item')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object dbedt_nm_item_inicial: TDBEdit
      Left = 285
      Top = 10
      Width = 29
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NR_ITEM'
      DataSource = datm_pe_itens.ds_pe_itens_
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbedt_item_final_li: TDBEdit
      Left = 325
      Top = 10
      Width = 29
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'QT_TOTAL_ITENS'
      DataSource = datm_pe_itens.ds_pe
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object pgctrl_Item: TPageControl
      Left = 2
      Top = 40
      Width = 629
      Height = 393
      ActivePage = ts_item1
      TabOrder = 4
      OnChange = pgctrl_ItemChange
      object ts_item1: TTabSheet
        Caption = '&Mercadoria'
        object pnl_item: TPanel
          Left = 0
          Top = 0
          Width = 619
          Height = 363
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object Label29: TLabel
            Left = -24
            Top = 366
            Width = 62
            Height = 13
            Caption = 'Exportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton1: TSpeedButton
            Left = 245
            Top = 381
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
          end
          object Label32: TLabel
            Left = 283
            Top = 366
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
          object SpeedButton2: TSpeedButton
            Left = 517
            Top = 381
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
          end
          object Label35: TLabel
            Left = 19
            Top = 34
            Width = 64
            Height = 13
            Caption = 'Mercadoria'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object btn_co_mercadoria: TSpeedButton
            Left = 580
            Top = 29
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
            OnClick = btn_co_mercadoriaClick
          end
          object Label37: TLabel
            Left = 301
            Top = 82
            Width = 72
            Height = 13
            Caption = 'Unid.Medida'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label38: TLabel
            Left = 17
            Top = 82
            Width = 66
            Height = 13
            Caption = 'Quantidade'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label39: TLabel
            Left = 5
            Top = 107
            Width = 78
            Height = 13
            Caption = 'Valor Unit'#225'rio'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label40: TLabel
            Left = 434
            Top = 289
            Width = 60
            Height = 13
            Caption = 'Valor MCV'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label41: TLabel
            Left = 55
            Top = 58
            Width = 28
            Height = 13
            Caption = 'NCM'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label42: TLabel
            Left = 307
            Top = 58
            Width = 46
            Height = 13
            Caption = 'NALADI'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_unid_medida: TSpeedButton
            Left = 581
            Top = 77
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
            OnClick = btn_co_unid_medidaClick
          end
          object btn_co_naladi: TSpeedButton
            Left = 471
            Top = 53
            Width = 25
            Height = 21
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
            OnClick = btn_co_naladiClick
          end
          object btn_co_ncm: TSpeedButton
            Left = 211
            Top = 53
            Width = 25
            Height = 21
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
            OnClick = btn_co_ncmClick
          end
          object Label43: TLabel
            Left = 288
            Top = 107
            Width = 87
            Height = 13
            Caption = 'Peso L'#237'q. Unit.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 434
            Top = 264
            Width = 59
            Height = 13
            Caption = 'Valor MLE'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 30
            Top = 10
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
          object Label46: TLabel
            Left = 212
            Top = 10
            Width = 39
            Height = 13
            Caption = 'Nr. OC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label47: TLabel
            Left = 6
            Top = 136
            Width = 202
            Height = 13
            Caption = 'Descri'#231#227'o Comercial da Mercadoria'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label54: TLabel
            Left = 6
            Top = 262
            Width = 69
            Height = 13
            Caption = 'Embalagem:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label55: TLabel
            Left = 77
            Top = 264
            Width = 40
            Height = 13
            Caption = 'Compr.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label56: TLabel
            Left = 77
            Top = 291
            Width = 44
            Height = 13
            Caption = 'Largura'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label57: TLabel
            Left = 77
            Top = 315
            Width = 34
            Height = 13
            Caption = 'Altura'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label58: TLabel
            Left = 77
            Top = 340
            Width = 29
            Height = 13
            Caption = 'Peso'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label59: TLabel
            Left = 229
            Top = 264
            Width = 76
            Height = 13
            Caption = 'Total do Item'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label60: TLabel
            Left = 229
            Top = 289
            Width = 67
            Height = 13
            Caption = 'P.Liq. Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label61: TLabel
            Left = 229
            Top = 315
            Width = 76
            Height = 13
            Caption = 'P.Bruto Total'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label62: TLabel
            Left = 229
            Top = 340
            Width = 53
            Height = 13
            Caption = 'Cubagem'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 390
            Top = 10
            Width = 86
            Height = 13
            Caption = 'Pedido do Imp.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_prod: TLabel
            Left = 390
            Top = 205
            Width = 123
            Height = 13
            Caption = 'Fabricante / Produtor'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_fabr_item: TSpeedButton
            Left = 584
            Top = 219
            Width = 24
            Height = 22
            Enabled = False
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
            OnClick = btn_co_fabr_itemClick
          end
          object DBEdit15: TDBEdit
            Left = 20
            Top = 381
            Width = 223
            Height = 21
            TabOrder = 23
          end
          object DBEdit16: TDBEdit
            Left = 282
            Top = 381
            Width = 42
            Height = 21
            TabOrder = 24
          end
          object DBEdit17: TDBEdit
            Left = 319
            Top = 381
            Width = 223
            Height = 21
            TabOrder = 25
          end
          object dbrdgrp_fabr_expo: TDBRadioGroup
            Left = 391
            Top = 145
            Width = 216
            Height = 59
            Color = clBtnFace
            Ctl3D = True
            DataField = 'CD_FABR_EXPO'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              '&Fabr./Prod. '#233' o exportador'
              'Fabr./Prod. n'#227'o '#233' o &exportador'
              'Fabr./Prod. '#233' &desconhecido')
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 11
            TabStop = True
            Values.Strings = (
              '1'
              '2'
              '3')
            OnChange = dbrdgrp_fabr_expoChange
          end
          object dbedt_cd_mercadoria: TDBEdit
            Left = 88
            Top = 30
            Width = 161
            Height = 21
            DataField = 'CD_MERCADORIA'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = dbedt_cd_mercadoriaChange
            OnExit = dbedt_cd_mercadoriaExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
          object dbedt_cd_unid_medida: TDBEdit
            Left = 378
            Top = 78
            Width = 30
            Height = 21
            DataField = 'CD_UNID_MEDIDA'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnExit = dbedt_cd_unid_medidaExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
          object dbedt_qt_mercadoria: TDBEdit
            Left = 88
            Top = 78
            Width = 119
            Height = 21
            DataField = 'QT_MERCADORIA'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 17
            ParentFont = False
            TabOrder = 6
            OnEnter = dbedt_qt_mercadoriaEnter
            OnExit = dbedt_qt_mercadoriaExit
          end
          object dbedt_vl_unitario: TDBEdit
            Left = 88
            Top = 103
            Width = 119
            Height = 21
            DataField = 'VL_UNITARIO'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnEnter = dbedt_vl_unitarioEnter
            OnExit = dbedt_vl_unitarioExit
          end
          object dbedt_vl_mle: TDBEdit
            Left = 498
            Top = 259
            Width = 110
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_MLE'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object dbedt_cd_ncm: TDBEdit
            Left = 88
            Top = 54
            Width = 119
            Height = 21
            DataField = 'CD_NCM'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnExit = dbedt_cd_ncmExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
          object dbedt_cd_naladi: TDBEdit
            Left = 378
            Top = 54
            Width = 89
            Height = 21
            DataField = 'CD_NALADI_SH'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnExit = dbedt_cd_naladiExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
          object dbedt_peso_liquido: TDBEdit
            Left = 378
            Top = 103
            Width = 117
            Height = 21
            DataField = 'VL_PESO_LIQ_UNIT'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnExit = dbedt_peso_liquidoExit
          end
          object dbedt_vl_mcv: TDBEdit
            Left = 498
            Top = 285
            Width = 110
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_MCV'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object dbedt_nm_mercadoria: TDBEdit
            Left = 251
            Top = 30
            Width = 326
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmMercadoria'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
          end
          object dbedt_nm_unid_medida: TDBEdit
            Left = 411
            Top = 78
            Width = 166
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmUnidade'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
          end
          object dbedt_nr_processo: TDBEdit
            Left = 88
            Top = 6
            Width = 119
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_PROCESSO'
            DataSource = datm_pe_itens.ds_pe
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nr_ped_imp: TDBEdit
            Left = 257
            Top = 6
            Width = 128
            Height = 21
            DataField = 'NR_PEDIDO_IMP'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 1
          end
          object dbm_descr_mercadoria: TDBMemo
            Left = 5
            Top = 150
            Width = 380
            Height = 91
            DataField = 'TX_MERCADORIA'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 10
          end
          object Panel4: TPanel
            Left = 2
            Top = 249
            Width = 615
            Height = 4
            BevelInner = bvRaised
            BevelOuter = bvNone
            TabOrder = 28
          end
          object dbedt_compr_emb: TDBEdit
            Left = 123
            Top = 259
            Width = 100
            Height = 21
            DataField = 'VL_COMPRIMENTO_EMB'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            OnExit = dbedt_alt_embExit
          end
          object dbedt_larg_emb: TDBEdit
            Left = 123
            Top = 285
            Width = 100
            Height = 21
            DataField = 'VL_LARGURA_EMB'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
            OnExit = dbedt_alt_embExit
          end
          object dbedt_alt_emb: TDBEdit
            Left = 123
            Top = 310
            Width = 100
            Height = 21
            DataField = 'VL_ALTURA_EMB'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            OnExit = dbedt_alt_embExit
          end
          object dbedt_peso_emb: TDBEdit
            Left = 123
            Top = 335
            Width = 100
            Height = 21
            DataField = 'VL_PESO_EMB'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
          end
          object dbedt_vl_exw: TDBEdit
            Left = 309
            Top = 259
            Width = 119
            Height = 21
            DataField = 'VL_TOT_ITEM'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object dbedt_peso_liq_total: TDBEdit
            Left = 309
            Top = 285
            Width = 119
            Height = 21
            DataField = 'VL_TOT_PESO_LIQ'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
          end
          object dbedt_peso_bruto_total: TDBEdit
            Left = 309
            Top = 310
            Width = 119
            Height = 21
            DataField = 'VL_TOT_PESO_BRUTO'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object dbedt_vl_cubagem: TDBEdit
            Left = 309
            Top = 335
            Width = 119
            Height = 21
            DataField = 'VL_CUBAGEM'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
          end
          object dbedt_nr_pedido: TDBEdit
            Left = 477
            Top = 6
            Width = 128
            Height = 21
            DataField = 'NR_PEDIDO'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 2
          end
          object dbedt_cd_fabr_item: TDBEdit
            Left = 389
            Top = 219
            Width = 45
            Height = 21
            TabStop = False
            DataField = 'CD_FABRICANTE'
            DataSource = datm_pe_itens.ds_pe_itens_
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
            OnExit = dbedt_cd_fabr_itemExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
          object dbedt_nm_fabr_item: TDBEdit
            Left = 434
            Top = 219
            Width = 147
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookFabricante'
            DataSource = datm_pe_itens.ds_pe_itens_
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
          end
        end
      end
      object ts_embalagem: TTabSheet
        Caption = 'Embalagem'
        object pnl_embalagem: TPanel
          Left = 0
          Top = 0
          Width = 619
          Height = 363
          BevelInner = bvLowered
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = -24
            Top = 366
            Width = 62
            Height = 13
            Caption = 'Exportador'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton3: TSpeedButton
            Left = 245
            Top = 381
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
          end
          object Label2: TLabel
            Left = 283
            Top = 366
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
          object SpeedButton4: TSpeedButton
            Left = 517
            Top = 381
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
          end
          object Label13: TLabel
            Left = 26
            Top = 15
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
          object Label16: TLabel
            Left = 6
            Top = 45
            Width = 65
            Height = 13
            Caption = 'Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_embalagem: TSpeedButton
            Left = 361
            Top = 39
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
            OnClick = btn_co_embalagemClick
          end
          object Label18: TLabel
            Left = 392
            Top = 44
            Width = 110
            Height = 13
            Caption = 'Classif. Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 8
            Top = 63
            Width = 65
            Height = 26
            Caption = 'Qtde por Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label20: TLabel
            Left = 214
            Top = 63
            Width = 69
            Height = 26
            Caption = 'Qtde de Embalagens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label21: TLabel
            Left = 412
            Top = 63
            Width = 65
            Height = 26
            Caption = 'Valor por Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label4: TLabel
            Left = 6
            Top = 135
            Width = 65
            Height = 13
            Caption = 'Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_emb_sup: TSpeedButton
            Left = 361
            Top = 129
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
            OnClick = btn_co_emb_supClick
          end
          object Label5: TLabel
            Left = 392
            Top = 134
            Width = 110
            Height = 13
            Caption = 'Classif. Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 8
            Top = 153
            Width = 65
            Height = 26
            Caption = 'Qtde por Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label9: TLabel
            Left = 214
            Top = 153
            Width = 69
            Height = 26
            Caption = 'Qtde de Embalagens'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label10: TLabel
            Left = 412
            Top = 153
            Width = 65
            Height = 26
            Caption = 'Valor por Embalagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object Label3: TLabel
            Left = 6
            Top = 108
            Width = 120
            Height = 13
            Caption = 'Embalagem Superior:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEdit1: TDBEdit
            Left = -24
            Top = 381
            Width = 42
            Height = 21
            TabOrder = 14
          end
          object DBEdit2: TDBEdit
            Left = 20
            Top = 381
            Width = 223
            Height = 21
            TabOrder = 11
          end
          object DBEdit3: TDBEdit
            Left = 282
            Top = 381
            Width = 42
            Height = 21
            TabOrder = 12
          end
          object dbedt_nr_processo_emb: TDBEdit
            Left = 84
            Top = 9
            Width = 119
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_PROCESSO'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_embalagem: TDBEdit
            Left = 127
            Top = 39
            Width = 232
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmEmbalagem'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object dbedt_classif_embal: TDBEdit
            Left = 507
            Top = 39
            Width = 102
            Height = 21
            DataField = 'CD_CLASSIF_EMBALAGEM'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 2
          end
          object dbedt_qt_por_embalagem: TDBEdit
            Left = 84
            Top = 63
            Width = 121
            Height = 21
            DataField = 'QT_POR_EMB'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 3
            OnExit = dbedt_qt_por_embalagemExit
          end
          object dbedt_qt_de_emb: TDBEdit
            Left = 288
            Top = 63
            Width = 121
            Height = 21
            DataField = 'QT_EMBALAGEM'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 4
          end
          object dbedt_vl_por_emb: TDBEdit
            Left = 479
            Top = 63
            Width = 130
            Height = 21
            TabStop = False
            DataField = 'VL_POR_EMB'
            DataSource = datm_pe_itens.ds_pe_itens_
            ReadOnly = True
            TabOrder = 5
          end
          object Panel2: TPanel
            Left = 2
            Top = 99
            Width = 615
            Height = 5
            BevelInner = bvRaised
            TabOrder = 15
          end
          object dbedt_cd_embalagem: TDBEdit
            Left = 84
            Top = 39
            Width = 42
            Height = 21
            DataField = 'CD_EMBALAGEM'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 1
            OnExit = dbedt_cd_embalagemExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
          object dbedt_nm_emb_sup: TDBEdit
            Left = 127
            Top = 129
            Width = 232
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNmEmbSup'
            DataSource = datm_pe_itens.ds_pe_itens_
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object dbedt_class_emb_sup: TDBEdit
            Left = 507
            Top = 129
            Width = 102
            Height = 21
            DataField = 'CD_CLASSIF_EMBALAGEM_SUP'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 7
          end
          object dbedt_qt_por_emb_sup: TDBEdit
            Left = 84
            Top = 153
            Width = 121
            Height = 21
            DataField = 'QT_POR_EMB_SUP'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 8
            OnExit = dbedt_qt_por_emb_supExit
          end
          object dbedt_qt_de_emb_sup: TDBEdit
            Left = 288
            Top = 153
            Width = 121
            Height = 21
            DataField = 'QT_EMBALAGEM_SUP'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 9
          end
          object dbedt_vl_por_emb_sub: TDBEdit
            Left = 479
            Top = 153
            Width = 130
            Height = 21
            DataField = 'VL_POR_EMB_SUP'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 10
          end
          object dbedt_cd_emb_sup: TDBEdit
            Left = 84
            Top = 129
            Width = 42
            Height = 21
            DataField = 'CD_EMBALAGEM_SUP'
            DataSource = datm_pe_itens.ds_pe_itens_
            TabOrder = 6
            OnExit = dbedt_cd_emb_supExit
            OnKeyDown = dbedt_cd_mercadoriaKeyDown
          end
        end
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 544
    Top = 4
    object mi_novo_item: TMenuItem
      Caption = '&Novo'
      Enabled = False
      OnClick = btn_novo_itemClick
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
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      OnClick = btn_duplicarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
