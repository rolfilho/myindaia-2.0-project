object frm_pe_capa: Tfrm_pe_capa
  Left = 90
  Top = 56
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu]
  Caption = 'Pedido de Exportação'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 1
    Top = 1
    Width = 211
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 167
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
      Left = 8
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
      Left = 36
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
    object btn_itens_pe: TSpeedButton
      Left = 116
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Itens do PE'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF666FFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF6F666FF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF66F6FFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_itens_peClick
    end
    object btn_excluir: TSpeedButton
      Left = 85
      Top = 8
      Width = 25
      Height = 25
      Hint = 'Exclui PE'
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
  object pgctrl_pe_capa: TPageControl
    Left = 2
    Top = 45
    Width = 623
    Height = 388
    ActivePage = tbsht_capa_02
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_pe_capaChange
    OnChanging = pgctrl_pe_capaChanging
    object tbsht_capa_01: TTabSheet
      Caption = 'Básicas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object pnl_basicas: TPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 359
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_processo: TLabel
          Left = 8
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
        object Label26: TLabel
          Left = 264
          Top = 3
          Width = 37
          Height = 13
          Caption = 'Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 315
          Top = 39
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
        object Label28: TLabel
          Left = 136
          Top = 3
          Width = 66
          Height = 13
          Caption = 'Dt.Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 392
          Top = 3
          Width = 54
          Height = 13
          Caption = 'Dt.Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_importador: TSpeedButton
          Left = 584
          Top = 53
          Width = 24
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
          OnClick = btn_co_importadorClick
        end
        object Label30: TLabel
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
        object SpeedButton15: TSpeedButton
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
        object Label31: TLabel
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
        object SpeedButton16: TSpeedButton
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
        object btn_co_exportador: TSpeedButton
          Left = 277
          Top = 53
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
          OnClick = btn_co_exportadorClick
        end
        object Label32: TLabel
          Left = 8
          Top = 39
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
        object Label33: TLabel
          Left = 8
          Top = 74
          Width = 93
          Height = 13
          Caption = 'Local de Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_origem: TSpeedButton
          Left = 277
          Top = 89
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
          OnClick = btn_co_origemClick
        end
        object Label34: TLabel
          Left = 315
          Top = 74
          Width = 97
          Height = 13
          Caption = 'Local de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_destino: TSpeedButton
          Left = 583
          Top = 89
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
          OnClick = btn_co_destinoClick
        end
        object Label35: TLabel
          Left = 8
          Top = 111
          Width = 123
          Height = 13
          Caption = 'País de Destino Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_pais_destino: TSpeedButton
          Left = 277
          Top = 126
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
          OnClick = btn_co_pais_destinoClick
        end
        object Label36: TLabel
          Left = 315
          Top = 111
          Width = 102
          Height = 13
          Caption = 'Via de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 464
          Top = 111
          Width = 77
          Height = 13
          Caption = 'Tipo do Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 8
          Top = 148
          Width = 84
          Height = 13
          Caption = 'Representante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_representante: TSpeedButton
          Left = 277
          Top = 163
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
          OnClick = btn_co_representanteClick
        end
        object Label39: TLabel
          Left = 315
          Top = 148
          Width = 120
          Height = 13
          Caption = 'Forma de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 464
          Top = 148
          Width = 67
          Height = 13
          Caption = '% Comissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 536
          Top = 148
          Width = 50
          Height = 13
          Caption = 'Incoterm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 8
          Top = 185
          Width = 157
          Height = 13
          Caption = 'Instrumento de Negociação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_instr_neg: TSpeedButton
          Left = 277
          Top = 200
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
          OnClick = btn_co_instr_negClick
        end
        object Label43: TLabel
          Left = 315
          Top = 185
          Width = 98
          Height = 13
          Caption = 'Agente Comissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_seguradora: TSpeedButton
          Left = 583
          Top = 200
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
          OnClick = btn_co_seguradoraClick
        end
        object Label44: TLabel
          Left = 8
          Top = 223
          Width = 105
          Height = 13
          Caption = 'URF de Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_urf_desp: TSpeedButton
          Left = 277
          Top = 238
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
          OnClick = btn_co_urf_despClick
        end
        object Label45: TLabel
          Left = 315
          Top = 223
          Width = 104
          Height = 13
          Caption = 'URF de Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_urf_emb: TSpeedButton
          Left = 583
          Top = 238
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
          OnClick = btn_co_urf_embClick
        end
        object Label46: TLabel
          Left = 8
          Top = 261
          Width = 121
          Height = 13
          Caption = 'Termo de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_termo_pagto: TSpeedButton
          Left = 277
          Top = 276
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
          OnClick = btn_co_termo_pagtoClick
        end
        object Label47: TLabel
          Left = 315
          Top = 261
          Width = 102
          Height = 13
          Caption = 'Língua do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label48: TLabel
          Left = 450
          Top = 261
          Width = 39
          Height = 13
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda: TSpeedButton
          Left = 583
          Top = 276
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
          OnClick = btn_co_moedaClick
        end
        object Label49: TLabel
          Left = 9
          Top = 299
          Width = 200
          Height = 13
          Caption = 'Descrição do Termo de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_incoterm: TSpeedButton
          Left = 583
          Top = 163
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
          OnClick = btn_co_incotermClick
        end
        object mskedt_nr_processo: TMaskEdit
          Left = 8
          Top = 17
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnExit = mskedt_nr_processoExit
        end
        object dbedt_dt_abertura: TDBEdit
          Left = 136
          Top = 17
          Width = 121
          Height = 21
          DataField = 'DT_REGISTRO_PEDIDO'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 1
        end
        object dbedt_nr_fatura: TDBEdit
          Left = 264
          Top = 17
          Width = 121
          Height = 21
          DataField = 'NR_FATURA'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 2
        end
        object dbedt_dt_fatura: TDBEdit
          Left = 392
          Top = 17
          Width = 121
          Height = 21
          DataField = 'DT_FATURA'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 3
        end
        object dbchkbx_drawback: TDBCheckBox
          Left = 523
          Top = 19
          Width = 83
          Height = 17
          Caption = 'Drawback'
          DataField = 'IN_DRAWBACK'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object dbedt_cd_exportador: TDBEdit
          Left = 8
          Top = 53
          Width = 42
          Height = 21
          DataField = 'CD_EXPORTADOR'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 5
          TabOrder = 5
          OnExit = dbedt_cd_exportadorExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_exportador: TDBEdit
          Left = 52
          Top = 53
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmExportador'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 24
        end
        object dbedt_cd_importador: TDBEdit
          Left = 315
          Top = 53
          Width = 42
          Height = 21
          DataField = 'CD_IMPORTADOR'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 5
          TabOrder = 6
          OnExit = dbedt_cd_importadorExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_importador: TDBEdit
          Left = 357
          Top = 53
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmImportador'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
        end
        object dbedt_cd_local_origem: TDBEdit
          Left = 8
          Top = 89
          Width = 42
          Height = 21
          DataField = 'CD_LOCAL_ORIGEM'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 4
          TabOrder = 7
          OnExit = dbedt_cd_local_origemExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_local_origem: TDBEdit
          Left = 52
          Top = 89
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmLocalOrigem'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 26
        end
        object dbedt_cd_local_destino: TDBEdit
          Left = 315
          Top = 89
          Width = 42
          Height = 21
          DataField = 'CD_LOCAL_DESTINO'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 4
          TabOrder = 8
          OnExit = dbedt_cd_local_destinoExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_local_destino: TDBEdit
          Left = 357
          Top = 89
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmLocalDestino'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 27
        end
        object dbedt_cd_pais_destino: TDBEdit
          Left = 8
          Top = 126
          Width = 42
          Height = 21
          DataField = 'CD_PAIS_DESTINO'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 3
          TabOrder = 9
          OnExit = dbedt_cd_pais_destinoExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_pais_destino: TDBEdit
          Left = 52
          Top = 126
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmPais'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 28
        end
        object dblkcbox_via_transp: TDBLookupComboBox
          Left = 315
          Top = 126
          Width = 145
          Height = 21
          DataField = 'CD_VIA_TRANSPORTE'
          DataSource = datm_pe_capa.ds_pe
          KeyField = 'CD_VIA_TRANSPORTE'
          ListField = 'NM_VIA_TRANSPORTE'
          ListSource = datm_pe_capa.ds_via_transporte
          TabOrder = 10
        end
        object dblkcbox_tp_frete: TDBLookupComboBox
          Left = 464
          Top = 126
          Width = 143
          Height = 21
          DataField = 'CD_TIPO_FRETE'
          DataSource = datm_pe_capa.ds_pe
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pe_capa.ds_tp_frete
          TabOrder = 11
        end
        object dbedt_cd_representante: TDBEdit
          Left = 8
          Top = 163
          Width = 42
          Height = 21
          DataField = 'CD_REPRESENTANTE'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 5
          TabOrder = 12
          OnExit = dbedt_cd_representanteExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_representante: TDBEdit
          Left = 52
          Top = 163
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmRepresentante'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 29
        end
        object dblkcbox_forma_pagto: TDBLookupComboBox
          Left = 315
          Top = 163
          Width = 145
          Height = 21
          DataField = 'CD_FORMA_PAGTO'
          DataSource = datm_pe_capa.ds_pe
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pe_capa.ds_forma_pagto
          TabOrder = 13
        end
        object dbedt_perc_comissao: TDBEdit
          Left = 464
          Top = 163
          Width = 60
          Height = 21
          DataField = 'VL_COMISSAO_PERCENT'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 50
          TabOrder = 14
        end
        object dbedt_cd_incoterm: TDBEdit
          Left = 536
          Top = 163
          Width = 44
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_INCOTERM'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 3
          TabOrder = 15
          OnExit = dbedt_cd_incotermExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_cd_instr_neg: TDBEdit
          Left = 8
          Top = 200
          Width = 42
          Height = 21
          DataField = 'CD_INST_NEGOC'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 5
          TabOrder = 16
          OnExit = dbedt_cd_instr_negExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_istr_neg: TDBEdit
          Left = 52
          Top = 200
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmInstNeg'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 30
        end
        object dbedt_cd_seguradora: TDBEdit
          Left = 315
          Top = 200
          Width = 42
          Height = 21
          DataField = 'CD_SEGURADORA'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 5
          TabOrder = 17
          OnExit = dbedt_cd_seguradoraExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_seguradora: TDBEdit
          Left = 357
          Top = 200
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmSeguradora'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 31
        end
        object dbedt_cd_urf_despacho: TDBEdit
          Left = 8
          Top = 238
          Width = 65
          Height = 21
          DataField = 'CD_URF_DESPACHO'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 7
          TabOrder = 18
          OnExit = dbedt_cd_urf_despachoExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_urf_despacho: TDBEdit
          Left = 72
          Top = 238
          Width = 203
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookURFDespacho'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 32
        end
        object dbedt_cd_urf_embarque: TDBEdit
          Left = 315
          Top = 238
          Width = 62
          Height = 21
          DataField = 'CD_URF_DESTINO'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 7
          TabOrder = 19
          OnExit = dbedt_cd_urf_embarqueExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_urf_embarque: TDBEdit
          Left = 376
          Top = 238
          Width = 204
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookURFEmbarque'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
        end
        object dbedt_cd_termo_pagto: TDBEdit
          Left = 8
          Top = 276
          Width = 65
          Height = 21
          DataField = 'CD_TERMO_PAGTO'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 6
          TabOrder = 20
          OnExit = dbedt_cd_termo_pagtoExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_termo_pagto: TDBEdit
          Left = 72
          Top = 276
          Width = 203
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmTermoPagto'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 34
        end
        object dblkcbox_tp_lingua: TDBLookupComboBox
          Left = 315
          Top = 276
          Width = 133
          Height = 21
          DataField = 'CD_LINGUA_PEDIDO'
          DataSource = datm_pe_capa.ds_pe
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pe_capa.ds_lingua
          TabOrder = 21
        end
        object dbm_termo_pagto: TDBMemo
          Left = 8
          Top = 313
          Width = 439
          Height = 42
          DataField = 'TX_TERMO_PAGTO'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 23
        end
        object dbedt_cd_moeda: TDBEdit
          Left = 450
          Top = 276
          Width = 35
          Height = 21
          DataField = 'CD_MOEDA'
          DataSource = datm_pe_capa.ds_pe
          MaxLength = 3
          TabOrder = 22
          OnExit = dbedt_cd_moedaExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_moeda: TDBEdit
          Left = 485
          Top = 276
          Width = 95
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmMoeda'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 35
        end
        object DBEdit39: TDBEdit
          Left = 319
          Top = 381
          Width = 223
          Height = 21
          TabOrder = 36
        end
        object dbedt_nm_incoterm: TDBEdit
          Left = 526
          Top = 163
          Width = 9
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmIncoterm'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 37
          Visible = False
        end
      end
    end
    object tbsht_capa_02: TTabSheet
      Caption = 'Totais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object pnl_totais: TPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 359
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
        object Label6: TLabel
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
        object SpeedButton2: TSpeedButton
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
        object Label7: TLabel
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
        object SpeedButton3: TSpeedButton
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
        object Label1: TLabel
          Left = 9
          Top = 11
          Width = 132
          Height = 13
          Caption = 'Marcação dos Volumes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 313
          Top = 11
          Width = 194
          Height = 13
          Caption = 'Informação Geral das Embalagens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 8
          Top = 97
          Width = 137
          Height = 13
          Caption = 'Qtde. Total de Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 314
          Top = 158
          Width = 108
          Height = 13
          Caption = 'Frete Internacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 158
          Width = 86
          Height = 13
          Caption = 'Cubagem Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 314
          Top = 97
          Width = 55
          Height = 13
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 8
          Top = 127
          Width = 155
          Height = 13
          Caption = 'Qtde. Total de Embalagens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 314
          Top = 127
          Width = 59
          Height = 13
          Caption = 'MLE Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 8
          Top = 187
          Width = 109
          Height = 13
          Caption = 'Peso Líquido Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 314
          Top = 187
          Width = 41
          Height = 13
          Caption = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 217
          Width = 96
          Height = 13
          Caption = 'Peso Bruto Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 314
          Top = 217
          Width = 113
          Height = 13
          Caption = 'MCV Total Incoterm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 8
          Top = 247
          Width = 63
          Height = 13
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 314
          Top = 247
          Width = 74
          Height = 13
          Caption = 'Taxa Câmbio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 277
          Width = 90
          Height = 13
          Caption = 'Total de Pallets'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 314
          Top = 277
          Width = 116
          Height = 13
          Caption = 'Comissão do Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 8
          Top = 302
          Width = 119
          Height = 13
          Caption = 'Total de Contêineres'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbm_marc_volumes: TDBMemo
          Left = 8
          Top = 25
          Width = 297
          Height = 50
          DataField = 'TX_MARCACAO_VOLUME'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 0
        end
        object dbm_inf_geral: TDBMemo
          Left = 312
          Top = 25
          Width = 297
          Height = 50
          DataField = 'TX_INF_EMBALAGEM'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 1
        end
        object dbedt_tot_mle: TDBEdit
          Left = 445
          Top = 119
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_FOB'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_qt_total_emb: TDBEdit
          Left = 168
          Top = 119
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_QTDE_EMBALAGEM'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_qt_total_prod: TDBEdit
          Left = 168
          Top = 89
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_QTDE_PROD'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_vl_desconto: TDBEdit
          Left = 446
          Top = 89
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DESCONTO'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_tot_pl: TDBEdit
          Left = 168
          Top = 179
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_PESO_LIQUIDO'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_vl_seguro: TDBEdit
          Left = 446
          Top = 179
          Width = 137
          Height = 21
          DataField = 'VL_SEGURO'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 4
          OnEnter = dbedt_vl_seguroEnter
          OnExit = dbedt_vl_seguroExit
        end
        object dbedt_vl_cubagem: TDBEdit
          Left = 168
          Top = 150
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_CUBAGEM'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 12
        end
        object dbedt_vl_frete_intern: TDBEdit
          Left = 446
          Top = 150
          Width = 137
          Height = 21
          DataField = 'VL_FRETE'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 3
          OnEnter = dbedt_vl_frete_internEnter
          OnExit = dbedt_vl_frete_internExit
        end
        object dbedt_tot_pb: TDBEdit
          Left = 168
          Top = 209
          Width = 137
          Height = 21
          DataField = 'VL_PESO_BRUTO'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 5
        end
        object dbedt_tot_incoterm_mcv: TDBEdit
          Left = 446
          Top = 209
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_MCV'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 14
        end
        object dbedt_tot_exw: TDBEdit
          Left = 168
          Top = 239
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_EXW'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 15
        end
        object dbedt_tx_cambio: TDBEdit
          Left = 446
          Top = 239
          Width = 137
          Height = 21
          DataField = 'VL_TX_CAMBIO'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 6
        end
        object dbedt_tot_pallets: TDBEdit
          Left = 168
          Top = 269
          Width = 137
          Height = 21
          DataField = 'VL_TOT_PALLETS'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 7
        end
        object dbedt_vl_comissao_agente: TDBEdit
          Left = 446
          Top = 269
          Width = 137
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_TOT_COM_AGENTE'
          DataSource = datm_pe_capa.ds_pe
          ReadOnly = True
          TabOrder = 16
        end
        object dbedt_tot_conteineres: TDBEdit
          Left = 168
          Top = 298
          Width = 137
          Height = 21
          DataField = 'VL_TOT_CONTAINER'
          DataSource = datm_pe_capa.ds_pe
          TabOrder = 8
        end
      end
    end
    object tbsht_capa_03: TTabSheet
      Caption = 'Complementares'
      object pnl_complementares: TPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 359
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 0
        object Label20: TLabel
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
        object Label21: TLabel
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
        object Label22: TLabel
          Left = 9
          Top = 266
          Width = 149
          Height = 13
          Caption = 'Declaração do Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 313
          Top = 266
          Width = 122
          Height = 13
          Caption = 'Declaração Adicional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 8
          Top = 11
          Width = 93
          Height = 13
          Caption = 'Carta de Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label50: TLabel
          Left = 8
          Top = 51
          Width = 96
          Height = 13
          Caption = 'Agente de Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_agente: TSpeedButton
          Left = 277
          Top = 65
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
          OnClick = btn_co_agenteClick
        end
        object Label51: TLabel
          Left = 312
          Top = 51
          Width = 76
          Height = 13
          Caption = 'Despachante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_despachante: TSpeedButton
          Left = 581
          Top = 65
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
          OnClick = btn_co_despachanteClick
        end
        object Label52: TLabel
          Left = 8
          Top = 93
          Width = 91
          Height = 13
          Caption = 'Transportadora '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_transportadora: TSpeedButton
          Left = 277
          Top = 107
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
          OnClick = btn_co_transportadoraClick
        end
        object Label53: TLabel
          Left = 312
          Top = 93
          Width = 131
          Height = 13
          Caption = 'Licença de Importação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_consignatario: TSpeedButton
          Left = 436
          Top = 151
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
          OnClick = btn_co_consignatarioClick
        end
        object Label56: TLabel
          Left = 9
          Top = 136
          Width = 78
          Height = 13
          Caption = 'Consignatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 9
          Top = 176
          Width = 70
          Height = 13
          Caption = 'Notificado 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_notificado1: TSpeedButton
          Left = 436
          Top = 191
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
          OnClick = btn_co_notificado1Click
        end
        object Label55: TLabel
          Left = 9
          Top = 218
          Width = 70
          Height = 13
          Caption = 'Notificado 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_notificado2: TSpeedButton
          Left = 436
          Top = 233
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
          OnClick = btn_co_notificado2Click
        end
        object dbm_decl_exportador: TDBMemo
          Left = 8
          Top = 280
          Width = 297
          Height = 68
          DataField = 'TX_DECL_EXPORTADOR'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object dbm_decl_adicional: TDBMemo
          Left = 312
          Top = 280
          Width = 297
          Height = 68
          DataField = 'TX_DECL_ADICIONAL'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object dbedt_nm_carta_credito: TDBEdit
          Left = 8
          Top = 25
          Width = 121
          Height = 21
          DataField = 'CD_CARTA_CREDITO'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbedt_cd_agente_carga: TDBEdit
          Left = 8
          Top = 65
          Width = 42
          Height = 21
          DataField = 'CD_AGENTE'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 1
          OnExit = dbedt_cd_agente_cargaExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_agente_carga: TDBEdit
          Left = 52
          Top = 65
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmAgente'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object dbedt_cd_despachante: TDBEdit
          Left = 312
          Top = 65
          Width = 42
          Height = 21
          DataField = 'CD_DESPACHANTE'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
          OnExit = dbedt_cd_despachanteExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_despachante: TDBEdit
          Left = 356
          Top = 65
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmDespachante'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object dbedt_cd_transportadora: TDBEdit
          Left = 8
          Top = 107
          Width = 42
          Height = 21
          DataField = 'CD_TRANSPORTADORA'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 4
          ParentFont = False
          TabOrder = 3
          OnExit = dbedt_cd_transportadoraExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_transportadora: TDBEdit
          Left = 52
          Top = 107
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNmTransportadora'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object dbedt_nr_li: TDBEdit
          Left = 312
          Top = 107
          Width = 121
          Height = 21
          DataField = 'NR_LI'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object dbedt_cd_consignatario: TDBEdit
          Left = 160
          Top = 151
          Width = 42
          Height = 21
          DataField = 'CD_CONSIGNATARIO'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 6
          OnExit = dbedt_cd_consignatarioExit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_consignatario: TDBEdit
          Left = 204
          Top = 151
          Width = 229
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcNmConsignatario'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object dblkcbox_consignatario: TDBLookupComboBox
          Left = 9
          Top = 151
          Width = 145
          Height = 21
          DataField = 'TP_CONSIGNATARIO'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pe_capa.ds_tp_pessoa_exp
          ParentFont = False
          TabOrder = 5
          OnClick = dblkcbox_consignatarioClick
          OnExit = dblkcbox_consignatarioExit
        end
        object dblkcbox_notificado1: TDBLookupComboBox
          Left = 9
          Top = 191
          Width = 145
          Height = 21
          DataField = 'TP_NOTIFY1'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pe_capa.ds_tp_pessoa_exp
          ParentFont = False
          TabOrder = 7
          OnClick = dblkcbox_notificado1Click
          OnExit = dblkcbox_notificado1Exit
        end
        object dbedt_cd_notificado1: TDBEdit
          Left = 160
          Top = 191
          Width = 42
          Height = 21
          DataField = 'CD_NOTIFY1'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnExit = dbedt_cd_notificado1Exit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_notificado1: TDBEdit
          Left = 204
          Top = 191
          Width = 229
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcNmNotify1'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object dblkcbox_notificado2: TDBLookupComboBox
          Left = 9
          Top = 233
          Width = 145
          Height = 21
          DataField = 'TP_NOTIFY2'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pe_capa.ds_tp_pessoa_exp
          ParentFont = False
          TabOrder = 9
          OnClick = dblkcbox_notificado2Click
          OnExit = dblkcbox_notificado2Exit
        end
        object dbedt_cd_notificado2: TDBEdit
          Left = 160
          Top = 233
          Width = 42
          Height = 21
          DataField = 'CD_NOTIFY2'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnExit = dbedt_cd_notificado2Exit
          OnKeyDown = dbedt_cd_exportadorKeyDown
        end
        object dbedt_nm_notificado2: TDBEdit
          Left = 204
          Top = 233
          Width = 229
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcNmNotify2'
          DataSource = datm_pe_capa.ds_pe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 552
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
    object mi_itens_pe: TMenuItem
      Caption = '&Itens'
      OnClick = btn_itens_peClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
