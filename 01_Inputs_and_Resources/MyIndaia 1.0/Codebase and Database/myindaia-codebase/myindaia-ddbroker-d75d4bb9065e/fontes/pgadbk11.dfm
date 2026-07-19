object frm_pesq_solic_ch1: Tfrm_pesq_solic_ch1
  Left = 118
  Top = 80
  Width = 640
  Height = 480
  Caption = 'Pedido de Exportação'
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
  object pgctrl_solic_ch: TPageControl
    Left = 0
    Top = 39
    Width = 632
    Height = 395
    ActivePage = ts_lista
    TabOrder = 0
    OnChanging = pgctrl_solic_chChanging
    object ts_lista: TTabSheet
      Caption = '   Lista   '
      object dbgrdSolicCheque: TDBGrid
        Left = -1
        Top = 8
        Width = 621
        Height = 341
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'DT_SOLIC_CH'
            Title.Caption = 'Processo'
            Title.Color = clBlack
            Width = 106
          end
          item
            FieldName = 'LookBanco'
            Title.Caption = 'Importador'
            Title.Color = clBlack
            Width = 281
          end
          item
            FieldName = 'LookFavorecido'
            Title.Caption = 'Data do Pedido'
            Title.Color = clBlack
            Width = 97
          end>
      end
    end
    object ts_solic_ch_: TTabSheet
      Caption = 'Informações Básicas'
      object pnl_solic_ch: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 367
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_nr_solic_ch: TLabel
          Left = 7
          Top = 1
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_dt_solic_ch: TLabel
          Left = 220
          Top = 1
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_banco2: TLabel
          Left = 7
          Top = 325
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 283
          Top = 49
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
        object Label2: TLabel
          Left = 316
          Top = 37
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 594
          Top = 49
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
        object Label3: TLabel
          Left = 7
          Top = 73
          Width = 93
          Height = 13
          Alignment = taRightJustify
          Caption = 'Local de Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 283
          Top = 85
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
        object Label4: TLabel
          Left = 316
          Top = 73
          Width = 97
          Height = 13
          Alignment = taRightJustify
          Caption = 'Local de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton4: TSpeedButton
          Left = 594
          Top = 85
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
        object Label5: TLabel
          Left = 7
          Top = 108
          Width = 105
          Height = 13
          Alignment = taRightJustify
          Caption = 'País Destino Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton5: TSpeedButton
          Left = 283
          Top = 120
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
        object Label6: TLabel
          Left = 316
          Top = 108
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'Via de Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 468
          Top = 108
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo do Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 7
          Top = 143
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Representante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton6: TSpeedButton
          Left = 283
          Top = 156
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
        object Label9: TLabel
          Left = 316
          Top = 143
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Forma de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 468
          Top = 143
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = '% Comissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 551
          Top = 143
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Incoterm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 316
          Top = 178
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seguradora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton8: TSpeedButton
          Left = 594
          Top = 191
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
        object Label13: TLabel
          Left = 7
          Top = 178
          Width = 157
          Height = 13
          Alignment = taRightJustify
          Caption = 'Instrumento de Negociação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton9: TSpeedButton
          Left = 283
          Top = 191
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
        object Label14: TLabel
          Left = 7
          Top = 215
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'URF Despacho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton10: TSpeedButton
          Left = 283
          Top = 227
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
        object Label15: TLabel
          Left = 316
          Top = 215
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'URF Embarque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton11: TSpeedButton
          Left = 594
          Top = 227
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
        object Label16: TLabel
          Left = 316
          Top = 251
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = 'Língua do Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton12: TSpeedButton
          Left = 283
          Top = 264
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
        object Label17: TLabel
          Left = 7
          Top = 251
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Termo de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 403
          Top = -175
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Moeda: TLabel
          Left = 316
          Top = 286
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton7: TSpeedButton
          Left = 593
          Top = 299
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
        object Label18: TLabel
          Left = 94
          Top = 1
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 7
          Top = 286
          Width = 170
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descrição do Termo de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label74: TLabel
          Left = 316
          Top = 1
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data da Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label75: TLabel
          Left = 7
          Top = 37
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exportador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_processo: TDBEdit
          Left = 7
          Top = 15
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_dt_pedido: TDBEdit
          Left = 220
          Top = 15
          Width = 87
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_banco: TDBEdit
          Left = 7
          Top = 50
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
        end
        object dbedt_nm_exportador: TDBEdit
          Left = 44
          Top = 50
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 93
          Top = 15
          Width = 120
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 4
        end
        object DBCheckBox1: TDBCheckBox
          Left = 435
          Top = 17
          Width = 97
          Height = 17
          Caption = 'Drawback'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object DBEdit2: TDBEdit
          Left = 316
          Top = 50
          Width = 43
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit3: TDBEdit
          Left = 362
          Top = 50
          Width = 230
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit4: TDBEdit
          Left = 7
          Top = 86
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit5: TDBEdit
          Left = 44
          Top = 86
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit6: TDBEdit
          Left = 316
          Top = 86
          Width = 43
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit7: TDBEdit
          Left = 362
          Top = 86
          Width = 230
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit8: TDBEdit
          Left = 7
          Top = 121
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit9: TDBEdit
          Left = 44
          Top = 121
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 316
          Top = 121
          Width = 149
          Height = 21
          DataField = 'CD_STATUS_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pesq_solic_ch.ds_status_solic_ch
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 468
          Top = 121
          Width = 147
          Height = 21
          DataField = 'CD_STATUS_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pesq_solic_ch.ds_status_solic_ch
          ParentFont = False
          ReadOnly = True
          TabOrder = 15
        end
        object DBEdit10: TDBEdit
          Left = 7
          Top = 157
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 16
        end
        object DBEdit11: TDBEdit
          Left = 44
          Top = 157
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 17
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 316
          Top = 157
          Width = 149
          Height = 21
          DataField = 'CD_STATUS_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pesq_solic_ch.ds_status_solic_ch
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object DBEdit12: TDBEdit
          Left = 468
          Top = 157
          Width = 64
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 19
        end
        object DBEdit15: TDBEdit
          Left = 551
          Top = 157
          Width = 50
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 20
        end
        object DBEdit16: TDBEdit
          Left = 316
          Top = 192
          Width = 43
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 21
        end
        object DBEdit17: TDBEdit
          Left = 363
          Top = 192
          Width = 226
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 22
        end
        object DBEdit18: TDBEdit
          Left = 7
          Top = 192
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 23
        end
        object DBEdit19: TDBEdit
          Left = 44
          Top = 192
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 24
        end
        object DBEdit20: TDBEdit
          Left = 7
          Top = 228
          Width = 67
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 25
        end
        object DBEdit21: TDBEdit
          Left = 78
          Top = 228
          Width = 200
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 26
        end
        object DBEdit22: TDBEdit
          Left = 316
          Top = 228
          Width = 67
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 27
        end
        object DBEdit23: TDBEdit
          Left = 387
          Top = 228
          Width = 200
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
        end
        object DBLookupComboBox4: TDBLookupComboBox
          Left = 316
          Top = 265
          Width = 149
          Height = 21
          DataField = 'CD_STATUS_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = datm_pesq_solic_ch.ds_status_solic_ch
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
        end
        object DBEdit24: TDBEdit
          Left = 7
          Top = 265
          Width = 67
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 30
        end
        object DBEdit25: TDBEdit
          Left = 78
          Top = 265
          Width = 200
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 31
        end
        object DBEdit13: TDBEdit
          Left = 316
          Top = 300
          Width = 34
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 32
        end
        object DBEdit14: TDBEdit
          Left = 354
          Top = 300
          Width = 235
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 33
        end
        object DBMemo1: TDBMemo
          Left = 7
          Top = 301
          Width = 302
          Height = 61
          TabOrder = 34
        end
        object DBEdit76: TDBEdit
          Left = 316
          Top = 15
          Width = 87
          Height = 21
          TabStop = False
          DataField = 'DT_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 35
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Inf. Complementares'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 367
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label39: TLabel
          Left = 403
          Top = -175
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 6
          Top = 4
          Width = 132
          Height = 13
          Alignment = taRightJustify
          Caption = 'Marcação dos Volumes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 316
          Top = 3
          Width = 194
          Height = 13
          Alignment = taRightJustify
          Caption = 'Informação Geral das Embalagens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 6
          Top = 88
          Width = 137
          Height = 13
          Alignment = taRightJustify
          Caption = 'Qtde. Total de Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 316
          Top = 88
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label24: TLabel
          Left = 6
          Top = 115
          Width = 155
          Height = 13
          Alignment = taRightJustify
          Caption = 'Qtde. Total de Embalagens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 6
          Top = 141
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cubagem Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 6
          Top = 168
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso Líquido Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 6
          Top = 195
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso Bruto Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 6
          Top = 223
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'EXW Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 6
          Top = 251
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Pallets'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 6
          Top = 279
          Width = 112
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Containers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 316
          Top = 115
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'MLE Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 316
          Top = 141
          Width = 112
          Height = 13
          Alignment = taRightJustify
          Caption = 'Frete Internacional '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 314
          Top = 168
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 316
          Top = 195
          Width = 113
          Height = 13
          Alignment = taRightJustify
          Caption = 'MCV Total Incoterm'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 316
          Top = 223
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'Taxa Câmbio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 316
          Top = 251
          Width = 116
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comissão do Agente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBMemo2: TDBMemo
          Left = 6
          Top = 17
          Width = 302
          Height = 61
          TabOrder = 0
        end
        object DBMemo3: TDBMemo
          Left = 316
          Top = 17
          Width = 302
          Height = 61
          TabOrder = 1
        end
        object DBEdit26: TDBEdit
          Left = 172
          Top = 84
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit27: TDBEdit
          Left = 448
          Top = 84
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit28: TDBEdit
          Left = 172
          Top = 111
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBEdit29: TDBEdit
          Left = 172
          Top = 137
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBEdit30: TDBEdit
          Left = 172
          Top = 164
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBEdit31: TDBEdit
          Left = 172
          Top = 191
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit32: TDBEdit
          Left = 172
          Top = 219
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object DBEdit33: TDBEdit
          Left = 172
          Top = 247
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit34: TDBEdit
          Left = 172
          Top = 275
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit35: TDBEdit
          Left = 448
          Top = 111
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBEdit36: TDBEdit
          Left = 448
          Top = 137
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit37: TDBEdit
          Left = 448
          Top = 164
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit38: TDBEdit
          Left = 448
          Top = 191
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit39: TDBEdit
          Left = 448
          Top = 219
          Width = 136
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit40: TDBEdit
          Left = 448
          Top = 247
          Width = 136
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 16
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Inf. Complementares 2'
      object Label37: TLabel
        Left = 8
        Top = 293
        Width = 149
        Height = 13
        Alignment = taRightJustify
        Caption = 'Declaração do Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label38: TLabel
        Left = 319
        Top = 292
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = 'Declaração Adicional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label48: TLabel
        Left = 8
        Top = 1
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Carta de Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton13: TSpeedButton
        Left = 283
        Top = 50
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
      object Label40: TLabel
        Left = 8
        Top = 37
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agente de Carga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton14: TSpeedButton
        Left = 283
        Top = 88
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
      object Label41: TLabel
        Left = 8
        Top = 75
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
      object Label42: TLabel
        Left = 8
        Top = 148
        Width = 131
        Height = 13
        Alignment = taRightJustify
        Caption = 'Licença de Importação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton15: TSpeedButton
        Left = 438
        Top = 198
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
      object Label44: TLabel
        Left = 8
        Top = 186
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Consignatário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton16: TSpeedButton
        Left = 438
        Top = 234
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
      object Label46: TLabel
        Left = 8
        Top = 222
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Notificado 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton17: TSpeedButton
        Left = 438
        Top = 269
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
      object Label49: TLabel
        Left = 8
        Top = 257
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Notificado 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton20: TSpeedButton
        Left = 283
        Top = 123
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
      object Label76: TLabel
        Left = 8
        Top = 110
        Width = 87
        Height = 13
        Alignment = taRightJustify
        Caption = 'Transportadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBMemo4: TDBMemo
        Left = 8
        Top = 306
        Width = 302
        Height = 61
        TabOrder = 0
      end
      object DBMemo5: TDBMemo
        Left = 316
        Top = 306
        Width = 302
        Height = 61
        TabOrder = 1
      end
      object DBEdit50: TDBEdit
        Left = 8
        Top = 15
        Width = 136
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 2
      end
      object DBEdit42: TDBEdit
        Left = 8
        Top = 51
        Width = 67
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit43: TDBEdit
        Left = 78
        Top = 51
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit44: TDBEdit
        Left = 8
        Top = 89
        Width = 67
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 5
      end
      object DBEdit45: TDBEdit
        Left = 78
        Top = 89
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBEdit46: TDBEdit
        Left = 8
        Top = 162
        Width = 136
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 7
      end
      object DBEdit47: TDBEdit
        Left = 162
        Top = 199
        Width = 34
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 8
      end
      object DBEdit48: TDBEdit
        Left = 199
        Top = 199
        Width = 235
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 8
        Top = 199
        Width = 149
        Height = 21
        DataField = 'CD_STATUS_SOLIC_CH'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = datm_pesq_solic_ch.ds_status_solic_ch
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object DBEdit49: TDBEdit
        Left = 162
        Top = 235
        Width = 34
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 11
      end
      object DBEdit51: TDBEdit
        Left = 199
        Top = 235
        Width = 235
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 8
        Top = 235
        Width = 149
        Height = 21
        DataField = 'CD_STATUS_SOLIC_CH'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = datm_pesq_solic_ch.ds_status_solic_ch
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit52: TDBEdit
        Left = 162
        Top = 270
        Width = 34
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 14
      end
      object DBEdit53: TDBEdit
        Left = 199
        Top = 270
        Width = 235
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 8
        Top = 270
        Width = 149
        Height = 21
        DataField = 'CD_STATUS_SOLIC_CH'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = datm_pesq_solic_ch.ds_status_solic_ch
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
      end
      object DBEdit77: TDBEdit
        Left = 8
        Top = 124
        Width = 67
        Height = 21
        DataField = 'CD_BANCO'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 17
      end
      object DBEdit78: TDBEdit
        Left = 78
        Top = 124
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'LookBanco'
        DataSource = datm_pesq_solic_ch.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
    end
    object TabSheet5: TTabSheet
      Caption = '   Despesas   '
      object dbgrd_proc_embalagem: TDBGrid
        Left = 3
        Top = 11
        Width = 615
        Height = 124
        DataSource = datm_manut_proc.ds_proc_embalagem
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            FieldName = 'LookEmbalagem'
            Title.Caption = 'Seqüência'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'QT_EMBALAGEM'
            Title.Caption = 'Cód'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
          end
          item
            FieldName = 'PB_EMBALAGEM'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 251
          end
          item
            Title.Caption = 'Valor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 150
          end>
      end
      object pnl_proc_embalagem: TPanel
        Left = 0
        Top = 144
        Width = 624
        Height = 50
        BevelOuter = bvLowered
        TabOrder = 1
        object lbl_embalagem: TLabel
          Left = 88
          Top = 8
          Width = 25
          Height = 13
          Caption = 'Item'
          FocusControl = dbedt_cd_embalagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_embalagem: TSpeedButton
          Left = 403
          Top = 23
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
        object lbl_qt_embalagem: TLabel
          Left = 14
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Seqüência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_pb_embalagem: TLabel
          Left = 431
          Top = 10
          Width = 30
          Height = 13
          Caption = 'Valor'
          FocusControl = dbedt_98798
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_784: TDBEdit
          Left = 137
          Top = 23
          Width = 263
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'LookEmbalagem'
          DataSource = datm_manut_proc.ds_proc_embalagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbedt_cd_embalagem: TDBEdit
          Left = 88
          Top = 23
          Width = 46
          Height = 21
          DataField = 'CD_EMBALAGEM'
          DataSource = datm_manut_proc.ds_proc_embalagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 4
          ParentFont = False
          TabOrder = 0
        end
        object dbedt_98798: TDBEdit
          Left = 431
          Top = 23
          Width = 83
          Height = 21
          DataField = 'PB_EMBALAGEM'
          DataSource = datm_manut_proc.ds_proc_embalagem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object DBEdit41: TDBEdit
          Left = 15
          Top = 24
          Width = 62
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Lista dos Ítens'
      object Label112: TLabel
        Left = 10
        Top = 12
        Width = 53
        Height = 13
        Caption = 'Processo'
        FocusControl = dbedt_nr_processo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_nr_processo3: TDBEdit
        Left = 10
        Top = 25
        Width = 119
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'nr_processo_calc'
        DataSource = datm_manut_proc.ds_processo
        ReadOnly = True
        TabOrder = 0
      end
      object dbg_manut_proc: TDBGrid
        Left = -1
        Top = 53
        Width = 626
        Height = 308
        DataSource = datm_manut_proc.ds_proc_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            FieldName = 'nr_processo_calc'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 29
          end
          item
            FieldName = 'CD_CLIENTE'
            Title.Caption = 'Cd. Produto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 108
          end
          item
            FieldName = 'AP_EMPRESA'
            Title.Caption = 'Cód NCM'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
          end
          item
            FieldName = 'CD_SERVICO'
            Title.Caption = 'Desc. Resumida'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 139
          end
          item
            FieldName = 'NM_SERVICO'
            Title.Caption = 'Quantidade'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 69
          end
          item
            FieldName = 'look_cancelado'
            Title.Caption = 'Valor Unitário'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 85
          end
          item
            FieldName = 'look_liberado'
            Title.Caption = 'EXW Item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = '   Ítens   '
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 624
        Height = 367
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label43: TLabel
          Left = 4
          Top = 5
          Width = 53
          Height = 13
          Caption = 'Processo'
          FocusControl = DBEdit54
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label45: TLabel
          Left = 207
          Top = 5
          Width = 73
          Height = 13
          Caption = 'Seq. do Item'
          FocusControl = DBEdit55
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label47: TLabel
          Left = 410
          Top = 4
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ped. Importador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton18: TSpeedButton
          Left = 519
          Top = 24
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
        object Label50: TLabel
          Left = 4
          Top = 29
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
        object Label51: TLabel
          Left = 252
          Top = 54
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
        object Label52: TLabel
          Left = 5
          Top = 54
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
        object btn_co_naladi_sh: TSpeedButton
          Left = 433
          Top = 50
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
        end
        object btn_co_ncm: TSpeedButton
          Left = 211
          Top = 50
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
        end
        object Label53: TLabel
          Left = 4
          Top = 78
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label54: TLabel
          Left = 254
          Top = 78
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
        object btn_unid_med: TSpeedButton
          Left = 543
          Top = 74
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
        end
        object Label55: TLabel
          Left = 4
          Top = 102
          Width = 78
          Height = 13
          Caption = 'Valor Unitário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label56: TLabel
          Left = 251
          Top = 102
          Width = 87
          Height = 13
          Caption = 'Peso Líq. Unit.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton19: TSpeedButton
          Left = 337
          Top = 193
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
        object Label57: TLabel
          Left = 6
          Top = 198
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Embalagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label58: TLabel
          Left = 374
          Top = 198
          Width = 110
          Height = 13
          Caption = 'Classif. Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label59: TLabel
          Left = 4
          Top = 227
          Width = 118
          Height = 13
          Caption = 'Qtde por Embalagem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label60: TLabel
          Left = 235
          Top = 216
          Width = 69
          Height = 26
          Caption = 'Qtde de Embalagens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label61: TLabel
          Left = 440
          Top = 219
          Width = 56
          Height = 26
          Caption = 'Valor por Caixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label62: TLabel
          Left = 6
          Top = 122
          Width = 202
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descrição Comercial da Mercadoria'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label63: TLabel
          Left = 6
          Top = 261
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Embalagem:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label64: TLabel
          Left = 80
          Top = 261
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Compr.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label65: TLabel
          Left = 80
          Top = 287
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Largura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label66: TLabel
          Left = 80
          Top = 314
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Altura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label67: TLabel
          Left = 80
          Top = 341
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label68: TLabel
          Left = 235
          Top = 261
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'EXW Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label69: TLabel
          Left = 235
          Top = 287
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso Liq. Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label70: TLabel
          Left = 235
          Top = 314
          Width = 96
          Height = 13
          Alignment = taRightJustify
          Caption = 'Peso Bruto Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label71: TLabel
          Left = 235
          Top = 341
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cubagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label72: TLabel
          Left = 442
          Top = 261
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor MLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label73: TLabel
          Left = 442
          Top = 287
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor MCV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBEdit54: TDBEdit
          Left = 88
          Top = 1
          Width = 113
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'nr_processo_calc'
          DataSource = datm_manut_proc.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit55: TDBEdit
          Left = 285
          Top = 1
          Width = 119
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'nr_processo_calc'
          DataSource = datm_manut_proc.ds_processo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit56: TDBEdit
          Left = 505
          Top = 1
          Width = 115
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit57: TDBEdit
          Left = 88
          Top = 25
          Width = 113
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit58: TDBEdit
          Left = 206
          Top = 25
          Width = 310
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_cd_ncm: TDBEdit
          Left = 88
          Top = 50
          Width = 113
          Height = 21
          DataField = 'CD_NCM_SH'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 11
          ParentFont = False
          TabOrder = 5
        end
        object dbedt_cd_naladi_sh: TDBEdit
          Left = 340
          Top = 50
          Width = 89
          Height = 21
          DataField = 'CD_NALADI_SH'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit59: TDBEdit
          Left = 88
          Top = 74
          Width = 113
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 7
        end
        object dbedt_cd_unid_comerc: TDBEdit
          Left = 340
          Top = 74
          Width = 30
          Height = 21
          DataField = 'CD_UN_MED_COMERC'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 8
        end
        object dbedt_nm_unid_med: TDBEdit
          Left = 375
          Top = 74
          Width = 162
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_nm_unid_comerc'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_vl_unitario: TDBEdit
          Left = 88
          Top = 98
          Width = 113
          Height = 21
          DataField = 'VL_UNITARIO'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
        end
        object dbedt_peso_liq: TDBEdit
          Left = 340
          Top = 98
          Width = 129
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
        object dbrgrp_fabr_expo: TDBRadioGroup
          Left = 340
          Top = 123
          Width = 272
          Height = 65
          Caption = 'dbrgrp_fabr_expo'
          Color = clBtnFace
          Ctl3D = True
          DataField = 'CD_FABR_EXPO'
          DataSource = datm_DI_Itens.ds_ad_itens
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Fabr./Prod. é o exportador'
            'Fabr./Prod. não é o exportador'
            'Fabr./Prod. é desconhecido')
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 12
          TabStop = True
          Values.Strings = (
            '1'
            '2'
            '3')
        end
        object DBEdit60: TDBEdit
          Left = 86
          Top = 194
          Width = 44
          Height = 21
          DataField = 'CD_BANCO'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 3
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit61: TDBEdit
          Left = 134
          Top = 194
          Width = 200
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookBanco'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object DBEdit62: TDBEdit
          Left = 490
          Top = 194
          Width = 122
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit63: TDBEdit
          Left = 126
          Top = 223
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
        end
        object DBEdit64: TDBEdit
          Left = 332
          Top = 223
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
        end
        object DBEdit65: TDBEdit
          Left = 506
          Top = 223
          Width = 106
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object DBMemo6: TDBMemo
          Left = 4
          Top = 136
          Width = 291
          Height = 53
          TabOrder = 19
        end
        object DBEdit66: TDBEdit
          Left = 126
          Top = 257
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 20
        end
        object DBEdit67: TDBEdit
          Left = 126
          Top = 283
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 21
        end
        object DBEdit68: TDBEdit
          Left = 126
          Top = 310
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 22
        end
        object DBEdit69: TDBEdit
          Left = 126
          Top = 337
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 23
        end
        object DBEdit70: TDBEdit
          Left = 332
          Top = 257
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 24
        end
        object DBEdit71: TDBEdit
          Left = 332
          Top = 283
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 25
        end
        object DBEdit72: TDBEdit
          Left = 332
          Top = 310
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 26
        end
        object DBEdit73: TDBEdit
          Left = 332
          Top = 337
          Width = 106
          Height = 21
          DataField = 'PL_MERCADORIA'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 27
        end
        object DBEdit74: TDBEdit
          Left = 506
          Top = 257
          Width = 106
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 28
        end
        object DBEdit75: TDBEdit
          Left = 506
          Top = 283
          Width = 106
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_SOLIC_CH'
          DataSource = datm_pesq_solic_ch.ds_solic_ch
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 29
        end
        object Panel3: TPanel
          Left = 0
          Top = 251
          Width = 623
          Height = 3
          TabOrder = 30
        end
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 317
    Height = 38
    BevelOuter = bvLowered
    TabOrder = 1
    object btn_incluir: TSpeedButton
      Left = 8
      Top = 7
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
    end
    object btn_excluir: TSpeedButton
      Left = 92
      Top = 7
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
    end
    object btn_sair: TSpeedButton
      Left = 276
      Top = 7
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
      Top = 7
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
    end
    object btn_cancelar: TSpeedButton
      Left = 64
      Top = 7
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
    end
    object dbnvg: TDBNavigator
      Left = 144
      Top = 7
      Width = 104
      Height = 25
      DataSource = datm_item.ds_item
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Próxima'
        'Última')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnl_pesquisa: TPanel
    Left = 320
    Top = 0
    Width = 309
    Height = 38
    BevelOuter = bvLowered
    TabOrder = 2
    object lbl_pesquisa: TLabel
      Left = 12
      Top = 1
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
    object lbl_ordem_pesquisa: TLabel
      Left = 148
      Top = 1
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
      Left = 12
      Top = 14
      Width = 129
      Height = 21
      TabOrder = 0
      Text = 'edt_chave'
    end
    object cb_ordem: TComboBox
      Left = 148
      Top = 14
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object menu_cadastro: TMainMenu
    Left = 564
    Top = 392
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
      Hint = ' '
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = ' '
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
