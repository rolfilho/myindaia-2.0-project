object frm_LI_Itens: Tfrm_LI_Itens
  Left = 187
  Top = 78
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Licença de Importação'
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel11: TBevel
    Left = 224
    Top = 0
    Width = 193
    Height = 37
  end
  object Label6: TLabel
    Left = 231
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
    Left = 291
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
    Width = 221
    Height = 37
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 191
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
      Hint = 'Novo'
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
    object btn_capa_li: TSpeedButton
      Left = 137
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Capa LI'
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
      OnClick = btn_capa_liClick
    end
    object btn_duplica: TSpeedButton
      Left = 108
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Duplicação de Item'
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
    Left = 333
    Top = 8
    Width = 80
    Height = 25
    DataSource = datm_LI_Itens.ds_li_itens
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    Flat = True
    Hints.Strings = (
      'Primeiro item'
      'Item Anterior'
      'Próximo item'
      'Último item')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object dbedt_nm_item_inicial_li: TDBEdit
    Left = 260
    Top = 10
    Width = 29
    Height = 21
    TabStop = False
    Color = clMenu
    DataField = 'NR_ITEM'
    DataSource = datm_LI_Itens.ds_li_itens
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
    Left = 300
    Top = 10
    Width = 29
    Height = 21
    TabStop = False
    Color = clMenu
    DataField = 'QT_TOTAL_ITEM'
    DataSource = datm_LI_Itens.ds_li
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
    Left = 0
    Top = 40
    Width = 629
    Height = 393
    ActivePage = ts_item1
    TabOrder = 4
    object ts_item1: TTabSheet
      Caption = '&Mercadoria'
      object Label20: TLabel
        Left = 24
        Top = 32
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
      object Label21: TLabel
        Left = 404
        Top = 317
        Width = 88
        Height = 13
        Caption = 'País de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_pais_aquisicao: TSpeedButton
        Left = 589
        Top = 287
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
        OnClick = btn_co_pais_aquisicaoClick
      end
      object Label22: TLabel
        Left = 404
        Top = 271
        Width = 104
        Height = 13
        Caption = 'País de Aquisição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais_origem: TSpeedButton
        Left = 589
        Top = 332
        Width = 25
        Height = 22
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
        OnClick = btn_co_pais_origemClick
      end
      object Label23: TLabel
        Left = 6
        Top = 271
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
      object Label24: TLabel
        Left = 5
        Top = 317
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
        Left = 369
        Top = 287
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
        OnClick = btn_co_exportadorClick
      end
      object btn_co_fabricante: TSpeedButton
        Left = 369
        Top = 333
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
        OnClick = btn_co_fabricanteClick
      end
      object btn_co_produto: TSpeedButton
        Left = 584
        Top = 28
        Width = 21
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
        OnClick = btn_co_produtoClick
      end
      object Label25: TLabel
        Left = 19
        Top = 58
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
      object Label26: TLabel
        Left = 25
        Top = 7
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
      object Label27: TLabel
        Left = 2
        Top = 84
        Width = 90
        Height = 13
        Caption = 'Valor Unit. MLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 5
        Top = 110
        Width = 87
        Height = 13
        Caption = 'Valor Item MLE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 405
        Top = 110
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
      object Label32: TLabel
        Left = 20
        Top = 159
        Width = 76
        Height = 26
        Caption = 'Unid.Medida Estatística'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label33: TLabel
        Left = 300
        Top = 138
        Width = 156
        Height = 13
        Caption = 'Quant. na Unid. Estatística'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 23
        Top = 138
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
      object btn_co_unid_med: TSpeedButton
        Left = 298
        Top = 54
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
        OnClick = btn_co_unid_medClick
      end
      object btn_co_naladi_sh: TSpeedButton
        Left = 189
        Top = 135
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
        OnClick = btn_co_naladi_shClick
      end
      object btn_co_ncm: TSpeedButton
        Left = 581
        Top = 107
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
      object Label36: TLabel
        Left = 400
        Top = 58
        Width = 56
        Height = 13
        Caption = 'Peso Líq.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 345
        Top = 84
        Width = 108
        Height = 13
        Caption = 'Valor Unitário MCV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_Destaque: TLabel
        Left = 412
        Top = 166
        Width = 112
        Height = 13
        Caption = 'Destaque Anuência'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbrgrp_fabr_expo: TDBRadioGroup
        Left = 404
        Top = 199
        Width = 213
        Height = 65
        Color = clBtnFace
        Ctl3D = True
        DataField = 'CD_FABR_EXPO'
        DataSource = datm_LI_Itens.ds_li_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          '&Fabr./Prod. é o exportador'
          'Fabr./Prod. não é o &exportador'
          'Fabr./Prod. é &desconhecido')
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 12
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrgrp_fabr_expoChange
      end
      object dbedt_cd_mercadoria: TDBEdit
        Left = 96
        Top = 28
        Width = 117
        Height = 21
        DataField = 'CD_MERCADORIA'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentFont = False
        TabOrder = 1
        OnExit = dbedt_cd_mercadoriaExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_pais_origem: TDBEdit
        Left = 404
        Top = 333
        Width = 37
        Height = 21
        DataField = 'CD_PAIS_ORIGEM'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 16
        OnExit = dbedt_cd_pais_origemExit
      end
      object dbedt_cd_pais_aquisicao: TDBEdit
        Left = 404
        Top = 287
        Width = 37
        Height = 21
        DataField = 'CD_PAIS_AQUISICAO'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 14
        OnExit = dbedt_cd_pais_aquisicaoExit
      end
      object dbedt_cd_exportador: TDBEdit
        Left = 4
        Top = 287
        Width = 45
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        TabOrder = 13
        OnExit = dbedt_cd_exportadorExit
      end
      object dbedt_cd_fabricante: TDBEdit
        Left = 4
        Top = 333
        Width = 45
        Height = 21
        DataField = 'CD_FABRICANTE'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        TabOrder = 15
        OnExit = dbedt_cd_fabricanteExit
      end
      object dbm_descricao_mercadoria: TDBMemo
        Left = 4
        Top = 205
        Width = 389
        Height = 58
        DataField = 'TX_DESC_DET_MERC'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 11
        OnExit = dbm_descricao_mercadoriaExit
      end
      object dbedt_cd_unid_comercial: TDBEdit
        Left = 96
        Top = 54
        Width = 30
        Height = 21
        DataField = 'CD_UN_MED_COMERC'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 2
        ParentFont = False
        TabOrder = 2
        OnExit = dbedt_cd_unid_comercialExit
      end
      object dbedt_qt_mercadoria: TDBEdit
        Left = 96
        Top = 3
        Width = 117
        Height = 21
        DataField = 'QT_MERC_UN_COMERC'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        TabOrder = 0
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbedt_vl_unitario: TDBEdit
        Left = 96
        Top = 80
        Width = 117
        Height = 21
        DataField = 'VL_UNIT_MLE'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnEnter = dbedt_vl_unitarioEnter
      end
      object dbedt_vl_item: TDBEdit
        Left = 96
        Top = 107
        Width = 117
        Height = 21
        DataField = 'VL_TOTAL_MLE'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnEnter = dbedt_vl_itemEnter
      end
      object dbedt_cd_ncm: TDBEdit
        Left = 460
        Top = 107
        Width = 117
        Height = 21
        DataField = 'CD_NCM_SH'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnExit = dbedt_cd_ncmExit
      end
      object dbedt_qt_unid_estat: TDBEdit
        Left = 460
        Top = 135
        Width = 117
        Height = 21
        DataField = 'QT_MERC_UN_ESTAT'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
      end
      object dbedt_cd_naladi_sh: TDBEdit
        Left = 96
        Top = 135
        Width = 89
        Height = 21
        DataField = 'CD_NALADI_SH'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnExit = dbedt_cd_naladi_shExit
      end
      object dbedt_peso_liq: TDBEdit
        Left = 460
        Top = 54
        Width = 117
        Height = 21
        DataField = 'PL_MERCADORIA'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnEnter = dbedt_peso_liqEnter
        OnExit = dbedt_peso_liqExit
      end
      object dbedt_vl_unitario_mcv: TDBEdit
        Left = 460
        Top = 80
        Width = 117
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_UNIT_MCV'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object dbedt_destaque: TDBEdit
        Left = 536
        Top = 163
        Width = 42
        Height = 21
        DataField = 'NR_DESTAQUE_NCM'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 10
      end
      object dbedt_nm_mercadoria: TDBEdit
        Left = 219
        Top = 28
        Width = 358
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookMercadoria'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object dbedt_nm_unidade: TDBEdit
        Left = 128
        Top = 54
        Width = 166
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookUnidMedida'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object dbedt_nm_exportador: TDBEdit
        Left = 52
        Top = 287
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookExportador'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object dbedt_nm_fabricante: TDBEdit
        Left = 53
        Top = 333
        Width = 313
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookFabProd'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_nm_pais_aquisicao: TDBEdit
        Left = 444
        Top = 287
        Width = 140
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookPaisAquisicao'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_nm_pais_origem: TDBEdit
        Left = 444
        Top = 333
        Width = 141
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookPaisOrigem'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
      end
      object edt_unid_med_estat: TEdit
        Left = 96
        Top = 163
        Width = 161
        Height = 21
        TabStop = False
        Color = clMenu
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
      end
    end
    object ts_item2_li: TTabSheet
      Caption = '&N.V.E.'
      Enabled = False
      object Label4: TLabel
        Left = 52
        Top = 20
        Width = 24
        Height = 13
        Caption = 'NCM'
      end
      object dbedt_cd_ncm2: TDBEdit
        Left = 52
        Top = 36
        Width = 77
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'CD_MERC_NBM_SH'
        MaxLength = 8
        ReadOnly = True
        TabOrder = 0
      end
      object dbedt_nm_ncm: TDBEdit
        Left = 132
        Top = 36
        Width = 421
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'DESCRICAO'
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbg_nve: TDBGrid
        Left = 80
        Top = 68
        Width = 437
        Height = 237
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            FieldName = 'Look_abrangencia'
            Title.Alignment = taCenter
            Title.Caption = 'NÍVEL'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 200
          end
          item
            FieldName = 'CD_ATRIBUTO_NCM'
            Title.Alignment = taCenter
            Title.Caption = 'ATRIBUTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
          end
          item
            FieldName = 'CD_ESPECIF_NCM'
            Title.Alignment = taCenter
            Title.Caption = 'ESPECIFICAÇÃO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 116
          end>
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 544
    Top = 4
    object mi_novo_item: TMenuItem
      Caption = '&Novo'
      OnClick = btn_novo_itemClick
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
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
