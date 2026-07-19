object frm_impressao_rd: Tfrm_impressao_rd
  Left = 492
  Top = 153
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 2
  Caption = 'Rela'#231#227'o de Despesas'
  ClientHeight = 463
  ClientWidth = 336
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panel_fundo: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 463
    Align = alClient
    BevelInner = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 2
      Width = 332
      Height = 33
      Align = alTop
      BevelInner = bvLowered
      Color = clSilver
      TabOrder = 0
      object Label1: TLabel
        Left = 17
        Top = 9
        Width = 224
        Height = 16
        Caption = 'Rela'#231#227'o de Despesas - Du Pont'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel4: TPanel
      Left = 597
      Top = 320
      Width = 185
      Height = 41
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object tab: TTabSet
      Left = 3
      Top = 439
      Width = 332
      Height = 21
      BackgroundColor = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Tabs.Strings = (
        'Border'#244
        'Arquivo Texto (txt)')
      TabIndex = 0
      OnChange = tabChange
    end
    object note: TNotebook
      Left = 4
      Top = 40
      Width = 329
      Height = 396
      TabOrder = 3
      object TPage
        Left = 0
        Top = 0
        Caption = 'bordero'
        object Label2: TLabel
          Left = 11
          Top = 10
          Width = 52
          Height = 16
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 11
          Top = 47
          Width = 47
          Height = 16
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 11
          Top = 82
          Width = 37
          Height = 16
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 11
          Top = 118
          Width = 41
          Height = 16
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_unid_neg: TSpeedButton
          Left = 295
          Top = 24
          Width = 21
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
          OnClick = btn_co_unid_negClick
        end
        object btn_co_produto: TSpeedButton
          Left = 295
          Top = 61
          Width = 21
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
          OnClick = btn_co_produtoClick
        end
        object btn_co_grupo: TSpeedButton
          Left = 295
          Top = 96
          Width = 21
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
          OnClick = btn_co_grupoClick
        end
        object btn_co_cliente: TSpeedButton
          Left = 295
          Top = 132
          Width = 21
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
          OnClick = btn_co_clienteClick
        end
        object btn_print_: TSpeedButton
          Left = 208
          Top = 295
          Width = 109
          Height = 29
          Hint = 'Gera relat'#243'rio baseado nos itens solicitados'
          Caption = 'Imprimir'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_print_Click
        end
        object btn_chama: TSpeedButton
          Left = 208
          Top = 349
          Width = 109
          Height = 29
          Hint = 'Reimprime relat'#243'rio baseado no Nr. do RD'
          Caption = 'Re-Imprimir'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_chamaClick
        end
        object Bevel3: TBevel
          Left = 9
          Top = 213
          Width = 312
          Height = 9
          Shape = bsTopLine
          Style = bsRaised
        end
        object lbl_ult_rd: TLabel
          Left = 11
          Top = 222
          Width = 194
          Height = 16
          Caption = #218'ltimo RD impresso n'#186': 06/00001'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Bevel4: TBevel
          Left = 8
          Top = 336
          Width = 312
          Height = 9
          Shape = bsTopLine
          Style = bsRaised
        end
        object edt_cd_unid_neg: TEdit
          Left = 11
          Top = 25
          Width = 50
          Height = 19
          MaxLength = 2
          TabOrder = 0
          OnExit = edt_cd_unid_negExit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_cd_produto: TEdit
          Left = 11
          Top = 62
          Width = 50
          Height = 19
          MaxLength = 2
          TabOrder = 1
          OnExit = edt_cd_produtoExit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_cd_grupo: TEdit
          Left = 11
          Top = 97
          Width = 50
          Height = 19
          MaxLength = 3
          TabOrder = 2
          OnEnter = edt_cd_grupoEnter
          OnExit = edt_cd_grupoExit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_cd_cliente: TEdit
          Left = 11
          Top = 133
          Width = 50
          Height = 19
          MaxLength = 5
          TabOrder = 3
          OnEnter = edt_cd_clienteEnter
          OnExit = edt_cd_clienteExit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object Panel3: TPanel
          Left = 8
          Top = 159
          Width = 201
          Height = 49
          Hint = 'Per'#237'odo baseado na data de solicita'#231#227'o de pagamento'
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          object Label7: TLabel
            Left = 3
            Top = 9
            Width = 48
            Height = 16
            Caption = 'Per'#237'odo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 91
            Top = 28
            Width = 8
            Height = 16
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dt_inicio: TMaskEdit
            Left = 3
            Top = 25
            Width = 80
            Height = 19
            EditMask = '99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
            OnExit = dt_inicioExit
          end
          object dt_final: TMaskEdit
            Left = 107
            Top = 25
            Width = 81
            Height = 19
            EditMask = '99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
            OnExit = dt_inicioExit
          end
        end
        object edt_nm_cliente: TEdit
          Left = 61
          Top = 133
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 5
        end
        object edt_nm_grupo: TEdit
          Left = 61
          Top = 97
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 6
        end
        object edt_nm_produto: TEdit
          Left = 61
          Top = 62
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 7
        end
        object edt_nm_unid_neg: TEdit
          Left = 61
          Top = 25
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 8
        end
      end
      object TPage
        Left = 0
        Top = 0
        HelpContext = 1
        Caption = 'txt'
        object Label12: TLabel
          Left = 11
          Top = 241
          Width = 90
          Height = 16
          Caption = 'N'#250'mero do RD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 11
          Top = 10
          Width = 52
          Height = 16
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 11
          Top = 47
          Width = 47
          Height = 16
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_produto2: TSpeedButton
          Left = 295
          Top = 61
          Width = 21
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
          OnClick = btn_co_produto2Click
        end
        object btn_co_unid_neg2: TSpeedButton
          Left = 295
          Top = 24
          Width = 21
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
          OnClick = btn_co_unid_neg2Click
        end
        object Label14: TLabel
          Left = 11
          Top = 297
          Width = 58
          Height = 16
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 11
          Top = 82
          Width = 37
          Height = 16
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 11
          Top = 118
          Width = 41
          Height = 16
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object btn_co_grupo2: TSpeedButton
          Left = 295
          Top = 96
          Width = 21
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
          OnClick = btn_co_grupo2Click
        end
        object btn_co_cliente2: TSpeedButton
          Left = 295
          Top = 132
          Width = 21
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
          OnClick = btn_co_cliente2Click
        end
        object btn_co_processo2: TSpeedButton
          Left = 124
          Top = 315
          Width = 21
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
          OnClick = btn_co_processo2Click
        end
        object Bevel1: TBevel
          Left = 8
          Top = 232
          Width = 312
          Height = 9
          Shape = bsTopLine
          Style = bsRaised
        end
        object Bevel2: TBevel
          Left = 9
          Top = 290
          Width = 312
          Height = 9
          Shape = bsTopLine
          Style = bsRaised
        end
        object btn_txt_: TSpeedButton
          Left = 168
          Top = 348
          Width = 154
          Height = 29
          Hint = 'Gera arquvio TXT baseado nos itens montados'
          Caption = 'Gerar Arquivo Texto'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
            07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
            0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
            33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_txt_Click
        end
        object edt_cd_produto2: TEdit
          Left = 11
          Top = 62
          Width = 50
          Height = 19
          MaxLength = 2
          TabOrder = 1
          OnExit = edt_cd_produto2Exit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_cd_unid_neg2: TEdit
          Left = 11
          Top = 25
          Width = 50
          Height = 19
          MaxLength = 2
          TabOrder = 0
          OnExit = edt_cd_unid_neg2Exit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_nm_unid_neg2: TEdit
          Left = 61
          Top = 25
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 8
        end
        object edt_nm_produto2: TEdit
          Left = 61
          Top = 62
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 9
        end
        object edt_processo: TEdit
          Left = 11
          Top = 316
          Width = 112
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
          OnExit = edt_processoExit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_cd_grupo2: TEdit
          Left = 11
          Top = 97
          Width = 50
          Height = 19
          MaxLength = 3
          TabOrder = 2
          OnEnter = edt_cd_grupo2Enter
          OnExit = edt_cd_grupo2Exit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object edt_cd_cliente2: TEdit
          Left = 11
          Top = 133
          Width = 50
          Height = 19
          MaxLength = 5
          TabOrder = 3
          OnEnter = edt_cd_cliente2Enter
          OnExit = edt_cd_cliente2Exit
          OnKeyDown = edt_cd_unid_negKeyDown
        end
        object Panel6: TPanel
          Left = 8
          Top = 159
          Width = 201
          Height = 42
          Hint = 'Per'#237'odo baseado na data de solicita'#231#227'o de pagamento'
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          object Label17: TLabel
            Left = 3
            Top = 1
            Width = 48
            Height = 16
            Caption = 'Per'#237'odo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 91
            Top = 20
            Width = 8
            Height = 16
            Caption = 'a'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object dt_inicio2: TMaskEdit
            Left = 3
            Top = 17
            Width = 80
            Height = 19
            EditMask = '99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 0
            Text = '  /  /    '
            OnExit = dt_inicio2Exit
          end
          object dt_final2: TMaskEdit
            Left = 107
            Top = 17
            Width = 81
            Height = 19
            EditMask = '99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
            OnExit = dt_inicio2Exit
          end
        end
        object edt_nm_cliente2: TEdit
          Left = 61
          Top = 133
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 10
        end
        object edt_nm_grupo2: TEdit
          Left = 61
          Top = 97
          Width = 233
          Height = 19
          Color = clMenu
          Enabled = False
          TabOrder = 11
        end
        object edt_nr_rd: TEdit
          Left = 11
          Top = 260
          Width = 78
          Height = 19
          Ctl3D = False
          MaxLength = 8
          ParentCtl3D = False
          TabOrder = 6
          OnExit = edt_nr_rdExit
        end
        object check_imp: TCheckBox
          Left = 13
          Top = 203
          Width = 180
          Height = 17
          Hint = 'Op'#231#227'o indispon'#237'vel em txt'#39's por RD'
          Caption = 'Incluir impostos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
      end
    end
    object pnlAux: TPanel
      Left = 80
      Top = 170
      Width = 177
      Height = 113
      BevelOuter = bvNone
      BorderWidth = 3
      Color = clBlack
      TabOrder = 4
      Visible = False
      object pnl_rd: TPanel
        Left = 3
        Top = 3
        Width = 171
        Height = 107
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object btn_print_2: TSpeedButton
          Left = 8
          Top = 70
          Width = 81
          Height = 29
          Hint = 'Reimprime relat'#243'rio baseado no Nr. do RD'
          Caption = 'Imprimir'
          Enabled = False
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_print_2Click
        end
        object btn_sair: TSpeedButton
          Left = 92
          Top = 70
          Width = 73
          Height = 29
          Caption = 'Sair'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btn_sairClick
        end
        object Label10: TLabel
          Left = 10
          Top = 11
          Width = 122
          Height = 13
          Caption = 'Re-imprimir o RD n'#186':'
        end
        object edt_rd2: TEdit
          Left = 19
          Top = 39
          Width = 137
          Height = 19
          TabOrder = 0
          OnExit = edt_rd2Exit
        end
      end
      object pnl_aguarde: TPanel
        Left = 3
        Top = 3
        Width = 171
        Height = 107
        BevelOuter = bvNone
        TabOrder = 1
        object Label19: TLabel
          Left = 22
          Top = 60
          Width = 125
          Height = 13
          Caption = 'Gerando Nr. do RD ...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 67
          Top = 6
          Width = 29
          Height = 53
          Caption = '6'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clBlack
          Font.Height = -48
          Font.Name = 'Wingdings'
          Font.Style = []
          ParentFont = False
        end
        object bar: TProgressBar
          Left = 8
          Top = 82
          Width = 155
          Height = 16
          Step = 1
          TabOrder = 0
        end
      end
    end
  end
  object ds_imp_rd: TDataSource
    DataSet = qry_imp_rd_
    Left = 272
    Top = 304
  end
  object qry_imp_rd_: TQuery
    DatabaseName = 'DBbroker'
    DataSource = ds_imp_total
    SQL.Strings = (
      'SELECT'
      ''
      '  CASE '
      
        '       WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) WHE' +
        'RE CD_SERVICO = P.CD_SERVICO) IN ('#39'01'#39', '#39'12'#39', '#39'02'#39') THEN'
      
        '                   (SELECT NM_EMBARCACAO FROM TEMBARCACAO (NOLOC' +
        'K) WHERE CD_EMBARCACAO = P.CD_EMBARCACAO)'
      
        '       WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK)WHER' +
        'E CD_SERVICO = P.CD_SERVICO) IN ('#39'07'#39') THEN'
      '                   '#39'Caminh'#227'o: '#39' + P.NR_CAMINHAO '
      
        '        WHEN (SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) WH' +
        'ERE CD_SERVICO = P.CD_SERVICO) IN ('#39'04'#39') THEN'
      '                    '#39'V'#244'o:'#39' + P.NR_VOO'
      '   END AS TRANSPORTE,'
      ''
      '   CASE'
      '     WHEN :CD_PRODUTO IN ('#39'01'#39','#39'03'#39') THEN '#39'Importa'#231#227'o'#39
      '     WHEN :CD_PRODUTO IN ('#39'02'#39','#39'10'#39') THEN '#39'Exporta'#231#227'o'#39
      '   END AS PRODUTO,'
      ''
      '   P.NR_CONHECIMENTO, SP.NR_PROCESSO, SP.NR_RD,'
      '   (SUBSTRING(P.NR_PROCESSO, 5,10)) PROCESSO,'
      '  (CASE'
      
        '     WHEN ISNULL((SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM' +
        ' TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_' +
        'REFERENCIA = '#39'08'#39'), '#39#39') = '#39#39
      
        '       THEN (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TREF' +
        '_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REFER' +
        'ENCIA = '#39'01'#39')'
      
        '       ELSE (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TREF' +
        '_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REFER' +
        'ENCIA = '#39'08'#39')'
      '   END ) CD_REFERENCIA ,'
      '   SP.CD_ITEM,  SP.CD_FAVORECIDO, P.CD_CLIENTE,'
      
        '   (SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = SP.CD_ITE' +
        'M) NM_ITEM,'
      '   SP.VL_PAGTO, SP.DT_PAGTO,  P.CD_UNID_NEG, P.CD_PRODUTO,'
      '   EN.NM_EMPRESA,'
      
        '   (SUBSTRING(EN.CGC_EMPRESA,1,2) + '#39'.'#39' + SUBSTRING(EN.CGC_EMPRE' +
        'SA,3,3) + '#39'.'#39' +'
      
        '   SUBSTRING(EN.CGC_EMPRESA,6,3) + '#39'/'#39' + SUBSTRING(EN.CGC_EMPRES' +
        'A,9,4) + '#39'-'#39' + SUBSTRING(EN.CGC_EMPRESA,13,2)) CGC_EMPRESA,'
      '   F.NM_FAVORECIDO,'
      
        '   (SUBSTRING(F.CGC_EMPRESA,1,2) + '#39'.'#39' + SUBSTRING(F.CGC_EMPRESA' +
        ',3,3) + '#39'.'#39' +'
      
        '    SUBSTRING(F.CGC_EMPRESA,6,3) + '#39'/'#39' + SUBSTRING(F.CGC_EMPRESA' +
        ',9,4) + '#39'-'#39' + SUBSTRING(F.CGC_EMPRESA,13,2)) CGC_EMPRESA_1,'
      
        '   (SELECT NM_BCO FROM TBCO WHERE CD_BCO = B.NR_BANCO) AP_BANCO,' +
        ' B.NR_CONTA, B.CD_AGENCIA,'
      
        '   (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TREF_CLIENTE ' +
        '(NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REFERENCIA = '#39 +
        '07'#39') AS SAP_USA'
      
        'FROM   TPROCESSO P    (NOLOCK), TSOLIC_PAGTO SP (NOLOCK),  TEMPR' +
        'ESA_NAC EN (NOLOCK),'
      '       TFAVORECIDO F  (NOLOCK), TBANCO B        (NOLOCK)'
      ''
      'WHERE SP.CD_STATUS  = '#39'0'#39'                            AND'
      '      SP.TP_DESTINO = '#39'5'#39'                            AND'
      '      SP.NR_PROCESSO = P.NR_PROCESSO                 AND'
      '      SP.CD_FAVORECIDO = F.CD_FAVORECIDO             AND'
      '      P.CD_CLIENTE = EN.CD_EMPRESA                   AND'
      '      F.CD_FAVORECIDO = SP.CD_FAVORECIDO             AND'
      '      B.CD_BANCO =* F.CD_BANCO                       AND'
      '      ISNULL(SP.NR_RD, '#39#39') = :NR_RD  AND'
      '      P.CD_CLIENTE = :CD_CLIENTE AND'
      '      SP.CD_FAVORECIDO = :CD_FAVORECIDO'
      
        'ORDER BY SP.NR_RD, P.CD_CLIENTE, SP.CD_FAVORECIDO, SP.NR_PROCESS' +
        'O, SP.CD_ITEM'
      '     ')
    Left = 272
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_RD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end>
    object qry_imp_rd_NR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qry_imp_rd_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_imp_rd_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      FixedChar = True
      Size = 15
    end
    object qry_imp_rd_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_imp_rd_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_imp_rd_VL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      currency = True
    end
    object qry_imp_rd_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_imp_rd_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_imp_rd_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      EditMask = '##.###.###/####-##;1;_'
      FixedChar = True
      Size = 14
    end
    object qry_imp_rd_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      EditMask = '##.###.###/####-##;1;_'
      FixedChar = True
      Size = 50
    end
    object qry_imp_rd_CGC_EMPRESA_1: TStringField
      FieldName = 'CGC_EMPRESA_1'
      EditMask = '##.###.###/####-##;1;_'
      FixedChar = True
      Size = 14
    end
    object qry_imp_rd_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      FixedChar = True
      Size = 10
    end
    object qry_imp_rd_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      FixedChar = True
      Size = 10
    end
    object qry_imp_rd_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qry_imp_rd_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_imp_rd_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_imp_rd_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_imp_rd_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_imp_rd_TRANSPORTE: TStringField
      FieldName = 'TRANSPORTE'
      FixedChar = True
      Size = 40
    end
    object qry_imp_rd_PROCESSO: TStringField
      FieldName = 'PROCESSO'
      FixedChar = True
      Size = 10
    end
    object qry_imp_rd_PRODUTO: TStringField
      FieldName = 'PRODUTO'
      FixedChar = True
      Size = 10
    end
    object qry_imp_rd_NR_RD: TStringField
      FieldName = 'NR_RD'
      Size = 8
    end
    object qry_imp_rd_SAP_USA: TStringField
      FieldName = 'SAP_USA'
      Size = 15
    end
  end
  object ppBDEimp_rd: TppBDEPipeline
    DataSource = ds_imp_rd
    UserName = 'imp_rd'
    Left = 273
    Top = 337
    MasterDataPipelineName = 'ppBDEPipeline1'
    object ppBDEimp_rdppField1: TppField
      FieldAlias = 'NR_CONHECIMENTO'
      FieldName = 'NR_CONHECIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField2: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField3: TppField
      FieldAlias = 'CD_REFERENCIA'
      FieldName = 'CD_REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField4: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField5: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField6: TppField
      FieldAlias = 'VL_PAGTO'
      FieldName = 'VL_PAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField7: TppField
      FieldAlias = 'DT_PAGTO'
      FieldName = 'DT_PAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField8: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField9: TppField
      FieldAlias = 'CGC_EMPRESA'
      FieldName = 'CGC_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField10: TppField
      FieldAlias = 'NM_FAVORECIDO'
      FieldName = 'NM_FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField11: TppField
      FieldAlias = 'CGC_EMPRESA_1'
      FieldName = 'CGC_EMPRESA_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField12: TppField
      FieldAlias = 'AP_BANCO'
      FieldName = 'AP_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField13: TppField
      FieldAlias = 'NR_CONTA'
      FieldName = 'NR_CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField14: TppField
      FieldAlias = 'CD_AGENCIA'
      FieldName = 'CD_AGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField15: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField16: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField17: TppField
      FieldAlias = 'CD_FAVORECIDO'
      FieldName = 'CD_FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField18: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField19: TppField
      FieldAlias = 'TRANSPORTE'
      FieldName = 'TRANSPORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField20: TppField
      FieldAlias = 'PROCESSO'
      FieldName = 'PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField21: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDEimp_rdppField22: TppField
      FieldAlias = 'NR_RD'
      FieldName = 'NR_RD'
      FieldLength = 8
      DisplayWidth = 8
      Position = 21
    end
    object ppBDEimp_rdppField23: TppField
      FieldAlias = 'SAP_USA'
      FieldName = 'SAP_USA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 22
    end
    object ppBDEimp_rdppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'CD_CLIENTE'
      DetailFieldName = 'CD_CLIENTE'
      DetailSortOrder = soAscending
    end
    object ppBDEimp_rdppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'CD_FAVORECIDO'
      DetailFieldName = 'CD_FAVORECIDO'
      DetailSortOrder = soAscending
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppBDEimp_rd
    Template.FileName = 'C:\DDBroker\rel_desp.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 189
    Top = 329
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        UserName = 'Label19'
        Caption = 'Fornecedor: Indai'#225' Log'#237'stica Internacional Ltda.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 14552
        mmWidth = 68527
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label24'
        Caption = 'Cadastro No: 58.156.084/0001-37'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 17992
        mmWidth = 42757
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText17'
        DataField = 'CGC_EMPRESA'
        DataPipeline = ppBDEimp_rd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEimp_rd'
        mmHeight = 3969
        mmLeft = 12965
        mmTop = 7673
        mmWidth = 46831
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText18'
        DataField = 'NM_EMPRESA'
        DataPipeline = ppBDEimp_rd
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEimp_rd'
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 2910
        mmWidth = 94456
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 2646
        mmTop = 265
        mmWidth = 190765
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label25'
        Caption = 'Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 1852
        mmWidth = 7144
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 190236
        mmTop = 1852
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label7'
        Caption = 'CGC:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3937
        mmLeft = 3704
        mmTop = 7673
        mmWidth = 9017
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText7'
        DataField = 'NM_GRUPO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 2646
        mmLeft = 179652
        mmTop = 18256
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppBDEimp_rd'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEimp_rd
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.DatabaseSettings.DataPipeline = ppBDEimp_rd
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEimp_rd'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText23: TppDBText
              UserName = 'DBText5'
              DataField = 'TRANSPORTE'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2381
              mmLeft = 2646
              mmTop = 794
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText6'
              DataField = 'NR_CONHECIMENTO'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2371
              mmLeft = 32808
              mmTop = 794
              mmWidth = 24342
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText7'
              DataField = 'PROCESSO'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2371
              mmLeft = 59531
              mmTop = 794
              mmWidth = 16140
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText8'
              DataField = 'CD_REFERENCIA'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2371
              mmLeft = 77788
              mmTop = 794
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText9'
              DataField = 'CD_ITEM'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2371
              mmLeft = 99484
              mmTop = 794
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText10'
              DataField = 'NM_ITEM'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2371
              mmLeft = 106098
              mmTop = 794
              mmWidth = 34131
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText12'
              DataField = 'VL_PAGTO'
              DataPipeline = ppBDEimp_rd
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2910
              mmLeft = 142611
              mmTop = 265
              mmWidth = 17992
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3704
              mmLeft = 32014
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3704
              mmLeft = 58471
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line8'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3704
              mmLeft = 76485
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line9'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3704
              mmLeft = 98161
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine31: TppLine
              UserName = 'Line10'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3704
              mmLeft = 141552
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine32: TppLine
              UserName = 'Line101'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 3704
              mmLeft = 161132
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText1'
              DataField = 'SAP_USA'
              DataPipeline = ppBDEimp_rd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppBDEimp_rd'
              mmHeight = 2381
              mmLeft = 163248
              mmTop = 794
              mmWidth = 30692
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup4: TppGroup
      BreakName = 'CD_CLIENTE'
      DataPipeline = ppBDEPipeline1
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline1'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'NR_RD'
      DataPipeline = ppBDEPipeline1
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline1'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel45: TppLabel
          UserName = 'Label42'
          AutoSize = False
          Caption = 'RELA'#199#195'O DE DESPESAS - No.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 53181
          BandType = 3
          GroupNo = 1
        end
        object ppDBText30: TppDBText
          UserName = 'DBText19'
          DataField = 'NR_RD'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 56356
          mmTop = 1852
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLine34: TppLine
          UserName = 'Line201'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 1588
          mmTop = 1058
          mmWidth = 190765
          BandType = 3
          GroupNo = 1
        end
        object ppLine35: TppLine
          UserName = 'Line25'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 1852
          mmTop = 6615
          mmWidth = 190765
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'CD_FAVORECIDO'
      DataPipeline = ppBDEPipeline1
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline1'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 45244
        mmPrintPosition = 0
        object ppLabel46: TppLabel
          UserName = 'Label1'
          Caption = 'A favor de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 11377
          mmTop = 23019
          mmWidth = 16669
          BandType = 3
          GroupNo = 2
        end
        object ppDBText31: TppDBText
          UserName = 'DBText2'
          DataField = 'NM_FAVORECIDO'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3440
          mmLeft = 29369
          mmTop = 23283
          mmWidth = 142346
          BandType = 3
          GroupNo = 2
        end
        object ppLabel47: TppLabel
          UserName = 'Label2'
          Caption = 'CGC:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 11642
          mmTop = 27517
          mmWidth = 8202
          BandType = 3
          GroupNo = 2
        end
        object ppDBText32: TppDBText
          UserName = 'DBText3'
          DataField = 'CGC_EMPRESA_1'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3440
          mmLeft = 20638
          mmTop = 27781
          mmWidth = 28840
          BandType = 3
          GroupNo = 2
        end
        object ppLabel48: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'TRANSPORTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 2381
          mmTop = 38100
          mmWidth = 28575
          BandType = 3
          GroupNo = 2
        end
        object ppLabel49: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'B/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 42598
          mmTop = 38365
          mmWidth = 5556
          BandType = 3
          GroupNo = 2
        end
        object ppLabel50: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'INDAI'#193
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 59002
          mmTop = 38365
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object ppLabel51: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'N'#218'MERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 78317
          mmTop = 36513
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object ppLabel52: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'DESPESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3969
          mmLeft = 109273
          mmTop = 38100
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
        object ppLabel53: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 145786
          mmTop = 38100
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
        object ppLabel54: TppLabel
          UserName = 'Label31'
          Caption = 'Solicitamos pagamento no valor de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 8467
          mmTop = 1588
          mmWidth = 58738
          BandType = 3
          GroupNo = 2
        end
        object ppLine36: TppLine
          UserName = 'Line11'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6615
          mmLeft = 32279
          mmTop = 36777
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLine37: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6615
          mmLeft = 58473
          mmTop = 36777
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLine38: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6615
          mmLeft = 77258
          mmTop = 36777
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLine39: TppLine
          UserName = 'Line14'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6615
          mmLeft = 98161
          mmTop = 36777
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLine40: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6615
          mmLeft = 141817
          mmTop = 36777
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLine41: TppLine
          UserName = 'Line18'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6615
          mmLeft = 161132
          mmTop = 36777
          mmWidth = 6350
          BandType = 3
          GroupNo = 2
        end
        object ppLabel55: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = 'OUTRAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 161925
          mmTop = 36513
          mmWidth = 32279
          BandType = 3
          GroupNo = 2
        end
        object ppLabel57: TppLabel
          UserName = 'Label4'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 62971
          mmTop = 27781
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppDBText33: TppDBText
          UserName = 'DBText14'
          DataField = 'AP_BANCO'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3440
          mmLeft = 74877
          mmTop = 28046
          mmWidth = 46567
          BandType = 3
          GroupNo = 2
        end
        object ppLabel58: TppLabel
          UserName = 'Label16'
          Caption = 'Ag'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 122238
          mmTop = 28310
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppDBText34: TppDBText
          UserName = 'DBText15'
          DataField = 'CD_AGENCIA'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3440
          mmLeft = 137054
          mmTop = 28046
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel59: TppLabel
          UserName = 'Label17'
          Caption = 'Nr. Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 152929
          mmTop = 28310
          mmWidth = 15346
          BandType = 3
          GroupNo = 2
        end
        object ppDBText35: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'NR_CONTA'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3556
          mmLeft = 170127
          mmTop = 28046
          mmWidth = 13504
          BandType = 3
          GroupNo = 2
        end
        object ppLine43: TppLine
          UserName = 'Line16'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 1588
          mmTop = 35983
          mmWidth = 191823
          BandType = 3
          GroupNo = 2
        end
        object ppLine44: TppLine
          UserName = 'Line21'
          Weight = 0.750000000000000000
          mmHeight = 1058
          mmLeft = 1852
          mmTop = 44186
          mmWidth = 191823
          BandType = 3
          GroupNo = 2
        end
        object ppLabel60: TppLabel
          UserName = 'Label6'
          Caption = 'Por conta de:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 8202
          mmTop = 18521
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object ppDBText36: TppDBText
          UserName = 'DBText13'
          DataField = 'NM_EMPRESA'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3440
          mmLeft = 29369
          mmTop = 18521
          mmWidth = 141817
          BandType = 3
          GroupNo = 2
        end
        object ppDBText37: TppDBText
          UserName = 'DBText1'
          BlankWhenZero = True
          DataField = 'VL_PAGTO'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#.0,0;-#.0,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 68527
          mmTop = 1323
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object ppDBText38: TppDBText
          UserName = 'DBText4'
          DataField = 'calc_ValorExtenso'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 10583
          mmLeft = 8202
          mmTop = 5821
          mmWidth = 186796
          BandType = 3
          GroupNo = 2
        end
        object ppLabel61: TppLabel
          UserName = 'Label32'
          AutoSize = False
          Caption = 'DESPACHO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 78317
          mmTop = 39688
          mmWidth = 19315
          BandType = 3
          GroupNo = 2
        end
        object ppLabel4: TppLabel
          UserName = 'Label34'
          AutoSize = False
          Caption = 'REFER'#202'NCIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 161925
          mmTop = 39688
          mmWidth = 32279
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 52388
        mmPrintPosition = 236220
        object ppImage4: TppImage
          UserName = 'Image2'
          MaintainAspectRatio = False
          Stretch = True
          Picture.Data = {
            0A544A504547496D6167659A000100FFD8FFE000104A4649460001020100C800
            C80000FFE10C3A4578696600004D4D002A000000080007011200030000000100
            010000011A00050000000100000062011B0005000000010000006A0128000300
            0000010003000001310002000000140000007201320002000000140000008687
            690004000000010000009C000000C80000004E000000010000004E0000000141
            646F62652050686F746F73686F7020372E3000323030363A30333A3234203133
            3A35303A31320000000003A001000300000001FFFF0000A00200040000000100
            0001C2A003000400000001000000D60000000000000006010300030000000100
            060000011A00050000000100000116011B0005000000010000011E0128000300
            00000100020000020100040000000100000126020200040000000100000B0C00
            00000000000048000000010000004800000001FFD8FFE000104A464946000102
            01004800480000FFED000C41646F62655F434D0002FFEE000E41646F62650064
            8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
            131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
            110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0CFFC0001108003D008003012200021101031101FFDD
            00040008FFC4013F000001050101010101010000000000000003000102040506
            0708090A0B010001050101010101010000000000000001000203040506070809
            0A0B1000010401030204020507060805030C3301000211030421123105415161
            1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
            3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
            85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
            B7C7D7E7F7110002020102040403040506070706053501000211032131120441
            51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
            250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
            94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
            8797A7B7C7FFDA000C03010002110311003F00F554924925292492494A492516
            595BF76C7076C25AE820C3872D77F2925325533F3DB88DADAC61BB2721DE9E35
            0246E744CBDE03FD2A2B6FBEFBB6FE8D9FE92DF4EAB255F52E9F6DC31EAC9AAC
            B8EA18D78278DDD8FEEB77AABD31BF6CC9BBAB3C1DB64D18409D063B4EB7347F
            DDDB9BEB6EFF00098D5E17FA35246156660D0E9B7113F2845F645998592DC2B7
            33272EE3954536BDA297BAAA43F6EE6FE82BFE7195399FA26E47AFFF0008B5DB
            BB68DDA3A3503C552EA40DC71F09A7FA4581D68EFE8D445B6FF62C7FA38CFF00
            FC30AF25324C637D493FE0A86EA492494695249249294924924A7FFFD0F5559C
            7A8DD6D4DC8C76B2BC471117DC757827655E850CFA7EBB9DB6AF56DA7FE2968A
            E4E8ABA57ED5BEFC9BECC4C475CFB7199BECAB1AD7C7A6FC9A9EDDB8EC7B6CF5
            FE8D9EBDF7FA997FCCFD8D4B86025C44827875DB8BF0FDE412F43659954566EB
            AFA58C1A9DED2C68FE4BACF59FB554B3ACDF7B99474CC675D759B87AD6CB31D8
            19EDB5FEA46FC8F4DCE6EDF419E9DDFE9EBFD27A61AC605D60774CC5FB55ED77
            B3372F7B98C77EF579197BAFBDDB777B30FF0073D3B6EC7FE7152EB34DC2EABA
            3D76BACCBCCA8B69B1DA6E758F79CFCDC8F4F633FC9D8FEEC3ABF9AF5F2AB66C
            FE6FD39218E265521AEFEA1C3C31FDE9421FBA824F44DFB5F2B3F09AE6870ADD
            63987D2FD1D97B9CF77D931315FBB753BF19ACBF3EFF00FB4D47F36FDFEBDD8A
            0E95D1D9D4AFBF22C70AFA70DB41C7C49A28BECA45B5DE7F47B1F6E154FBBD1A
            F73FF5AB68F53FA2FD9EA52EA5D3B270DF8981836B2BA1953AAC576D22DA1D63
            F1F09F92C7B5DB2FBFD2C9BDF5BDEC66CFD2D8FF00B42D9C815E1E253D3B0436
            9B2C6FA18B5B47D06B46D75BB7FD1E357EFF00FB6EAFE72D4F94C463FAAF4FB8
            4D7F52313F314577E8D1EACF16F44C4C6977DA335D4534D8C86BD8E716EFCAAD
            CC1FA17D14FA96EEFDFF00D1ADAAEBAE9A99556D0CAAB686B1A340D6B46D6B47
            F55AB1719ADCFEB0F7545DF65E9918CC8FA3B990FB99B8FBB7BAEF477FFA3FB1
            7FDDB50C8EAF6F54CEC8E8F834B5F5D0F6B72EE7BCB18F607359938CC70AEC77
            ADB9DE9DBEC7FE87FC251EBD36264A06404468237967FD4F736483D7E81D2E9F
            195659D48805B700CC53CFE81BAB6CFF00D0AB3F4DEDFA747D97F715E55EFCEC
            4C6A1D7D8F1E956ED8ED80BC874ECF4F6541EFDDB96463E767E63C3F1AF21994
            EA9CC96B40AD84FAFE954C731CEDDF61FD2E55977A9FA6B6BA69F43FED3C7C12
            9DCBE588D35DBC936068EF1206A7855EFEA18D463D990E717B6B77A7B583739D
            64ECF46B68FE72D759FA3DBFBEB3BEB165596507A66349BB2FF43EDE7DD1BBFA
            ACF4DDBEFF00FBAE85D25F81143EB79B71B1DBE9F4EAD81D6BB696C599D902A6
            BF6DF952FF004ECB3FED3BFF00EEDE4548C70FA04E57BFCA3F77FF00424196B4
            DD674D7E6836F5702E2F1A614EEC7AC6BED7320372ADFF00496DDFFA0F5D3F9E
            FD3C3F1B3F2BA7B5C5D8D5D74DF40712E358B4DF53E8DCE2E77A2D762FA94FFA
            3F57D1FE66AA95875F96F91463C1ECFB9C1ADFF36BF56CFF0039B5A7C5C4141B
            2D7BBD5C8BC875B6C0131A575B1BF994D4DFE6EBFF00D1B65962066786424451
            F960368EBFF3534D8492494497FFD1EFBAADF7E75EEE8B8361AAC7B3766E4B44
            9A6A769E9B3F37ED593FE0BFD1D5FA7FF44961F58C4C5C6AF1337F41998E1B4B
            F1D953FDC5BFA36BF0E9A98EF571ED8DF57A1FCDFF0035FCE2D4653556E7BAB6
            358EB5DBEC2D00173A1ACDEF8FA6FD8C6314D4BEE47844387D235D0D4B8FF4BD
            48A376D0163DC4F50CE1F64C7C56BDECADCE0486C7E9327276FB1AE6D7BFD3A9
            AF7FA75FF39FA4B3D3C7CCC5A3A9BF29BF58EDAAC36DA1D53700C07D784EDAEA
            DAD6B8B5BF6CF5AB665E435CFF00A0FF00B2FF0039454B6B37068CEAD94E44BA
            A6D8CB5D588DAF359F52B65BA7BABF5032CD9FF07FE8D584865006805CBD27B4
            71FEE8FEF2A9E73ACF53AD993879A2AB5B8D558197DB756FA2BACB9CCF49F759
            915B3653B87BEE6B6CA98897661A5B7D981FAE754C82DA1990E696D21CEDCEAA
            AA9C7F9DA3199EADF6D78DEAFF00356D99366F5BAF632C6398F68731C0B5CD70
            9041D0B5C0AC5A7A5E0E5F51B2A7D1EA6174C02AA596B8D8CF5AC6B6DB76576B
            9FB598F8FE8555FF0083FD35F529213818D18902035FD2E28DE825F27E9A0837
            E6E6E665E4E1635581D16DF4B1AC61A6ACDF48DA5F90E739D9995A16EFF46BFD
            6DF97E9D98D65BEAD1FA5BDECF49DB9D5E11E9B8BD3B16D76457EAD3457EE657
            73AC1EABEEB3232195BEE67E8BED19CFF49F7556FF0063D5E859D3C37AA59D45
            F617B9D4B68A6B20015B438D976CFF00C30FF4BD4FF88AD46DE9345FD4EBEA57
            3DEFB71DA1B8CD986D64EF17B9A07D2764B2CD976FFF00455A3EFE3D88BD0C89
            FDFC928FE9FCBC5F37FDE2384B8386CFB3F4AC5B6AB4E5F54EA751BCBDC36B76
            DA1CE7C307B2AA6BCAEA1BFD3FE7F22E7FFDB763A55F8B88712A7827229C1A71
            F1B19BEE7979DFF6CDBF99FCE62D2CBB22CFD157E97E92D57ABE80C6E5FAA6F7
            9C666F34E3B26B2C3638585BEBD2E63ECA2A7FA8FC6A5DFCCFADFF0013E96963
            E3D58D50AAA0430127525C4971363DCE73F739CE7BDDB92C99A041DE4646CFE8
            FF0082900BCB5B5579DD4CBB308FB23EE763645C1C7612D1B9D81A866CA6EBBF
            5577FA6FB3E456FF00F95FD35D635AD6B435A035A34006802AF89D3F0F0F0998
            345606330168ADC4BE413B9DBCD9B9CFDCE77E7210E89D2DADD8CA3D360322BA
            DCF6307C2AADCDAFFE8A8F2648CE85C8463A474BD3F7AB8BD325004372CB2BA9
            85F6B8318397388007CCAA4FEB9D31AFD95DA721F13B7198FBFEFF00B2B2DDBF
            DA536748E96C78B062D46C1C58E6873FFEDC7EE7AB7C68133F563F7A5FF33FF5
            6275683BA867BC0FB374EB5D27E95EFAEA6C7F65D7DFFF008027ADFD71D630DB
            5E2D3548DED6D965AEDBF9DB5E6AC66EEFEC2BE925C63A423E7EAFFBE5578BFF
            D2F554924925292492494D7CFCBFB1E1DB90186D7B045753797D8E3B29A9BFF1
            B6B995A6E9F8830F0EBA09DCF12EB9FF00BF6BC9B6FB7FEBB73DEF4F93F65F5B
            1FED1F4BD4FD04CEDF536BB6CFE6EED9BFD3DFFF009F1584EBF450077B91FF00
            A1FF0074AEAA49249354A4924925292492494A4924925292492494FF00FFD9FF
            ED10F850686F746F73686F7020332E30003842494D0425000000000010000000
            000000000000000000000000003842494D03ED00000000001000C80000000200
            0200C80000000200023842494D042600000000000E000000000000000000003F
            8000003842494D040D000000000004000000783842494D041900000000000400
            00001E3842494D03F3000000000009000000000000000001003842494D040A00
            000000000100003842494D271000000000000A00010000000000000002384249
            4D03F5000000000048002F66660001006C66660006000000000001002F666600
            0100A1999A0006000000000001003200000001005A0000000600000000000100
            3500000001002D000000060000000000013842494D03F80000000000700000FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF03E800003842494D040000000000000200013842494D04
            02000000000004000000003842494D0408000000000010000000010000024000
            000240000000003842494D041E000000000004000000003842494D041A000000
            00034D000000060000000000000000000000D6000001C20000000C0053006500
            6D0020007400ED00740075006C006F002D003200000001000000000000000000
            00000000000000000000010000000000000000000001C2000000D60000000000
            0000000000000000000000010000000000000000000000000000000000000010
            000000010000000000006E756C6C0000000200000006626F756E64734F626A63
            00000001000000000000526374310000000400000000546F70206C6F6E670000
            0000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000
            00D600000000526768746C6F6E67000001C200000006736C69636573566C4C73
            000000014F626A6300000001000000000005736C696365000000120000000773
            6C69636549446C6F6E67000000000000000767726F757049446C6F6E67000000
            00000000066F726967696E656E756D0000000C45536C6963654F726967696E00
            00000D6175746F47656E6572617465640000000054797065656E756D0000000A
            45536C6963655479706500000000496D672000000006626F756E64734F626A63
            00000001000000000000526374310000000400000000546F70206C6F6E670000
            0000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000
            00D600000000526768746C6F6E67000001C20000000375726C54455854000000
            010000000000006E756C6C54455854000000010000000000004D736765544558
            5400000001000000000006616C74546167544558540000000100000000000E63
            656C6C54657874497348544D4C626F6F6C010000000863656C6C546578745445
            585400000001000000000009686F727A416C69676E656E756D0000000F45536C
            696365486F727A416C69676E0000000764656661756C74000000097665727441
            6C69676E656E756D0000000F45536C69636556657274416C69676E0000000764
            656661756C740000000B6267436F6C6F7254797065656E756D0000001145536C
            6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F7574
            7365746C6F6E67000000000000000A6C6566744F75747365746C6F6E67000000
            000000000C626F74746F6D4F75747365746C6F6E67000000000000000B726967
            68744F75747365746C6F6E6700000000003842494D0411000000000001010038
            42494D0414000000000004000000023842494D040C000000000B280000000100
            0000800000003D0000018000005B8000000B0C00180001FFD8FFE000104A4649
            4600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F
            626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C
            0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E
            0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108003D00800301220002110103
            1101FFDD00040008FFC4013F0000010501010101010100000000000000030001
            020405060708090A0B0100010501010101010100000000000000010002030405
            060708090A0B1000010401030204020507060805030C33010002110304211231
            054151611322718132061491A1B14223241552C16233347282D14307259253F0
            E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3
            462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767
            778797A7B7C7D7E7F71100020201020404030405060707060535010002110321
            3112044151617122130532819114A1B14223C152D1F0332462E1728292435315
            637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D3
            75E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737
            475767778797A7B7C7FFDA000C03010002110311003F00F55492492529249249
            4A492516595BF76C7076C25AE820C3872D77F2925325533F3DB88DADAC61BB27
            21DE9E350246E744CBDE03FD2A2B6FBEFBB6FE8D9FE92DF4EAB255F52E9F6DC3
            1EAC9AACB8EA18D78278DDD8FEEB77AABD31BF6CC9BBAB3C1DB64D18409D063B
            4EB7347FDDDB9BEB6EFF00098D5E17FA35246156660D0E9B7113F2845F645998
            592DC2B733272EE3954536BDA297BAAA43F6EE6FE82BFE7195399FA26E47AFFF
            0008B5DBBB68DDA3A3503C552EA40DC71F09A7FA4581D68EFE8D445B6FF62C7F
            A38CFF00FC30AF25324C637D493FE0A86EA492494695249249294924924A7FFF
            D0F5559C7A8DD6D4DC8C76B2BC471117DC757827655E850CFA7EBB9DB6AF56DA
            7FE2968AE4E8ABA57ED5BEFC9BECC4C475CFB7199BECAB1AD7C7A6FC9A9EDDB8
            EC7B6CF5FE8D9EBDF7FA997FCCFD8D4B86025C44827875DB8BF0FDE412F43659
            954566EBAFA58C1A9DED2C68FE4BACF59FB554B3ACDF7B99474CC675D759B87A
            D6CB31D819EDB5FEA46FC8F4DCE6EDF419E9DDFE9EBFD27A61AC605D60774CC5
            FB55ED77B3372F7B98C77EF579197BAFBDDB777B30FF0073D3B6EC7FE7152EB3
            4DC2EABA3D76BACCBCCA8B69B1DA6E758F79CFCDC8F4F633FC9D8FEEC3ABF9AF
            5F2AB66CFE6FD39218E265521AEFEA1C3C31FDE9421FBA824F44DFB5F2B3F09A
            E6870ADD63987D2FD1D97B9CF77D931315FBB753BF19ACBF3EFF00FB4D47F36F
            DFEBDD8A0E95D1D9D4AFBF22C70AFA70DB41C7C49A28BECA45B5DE7F47B1F6E1
            54FBBD1AF73FF5AB68F53FA2FD9EA52EA5D3B270DF8981836B2BA1953AAC576D
            22DA1D63F1F09F92C7B5DB2FBFD2C9BDF5BDEC66CFD2D8FF00B42D9C815E1E25
            3D3B04369B2C6FA18B5B47D06B46D75BB7FD1E357EFF00FB6EAFE72D4F94C463
            FAAF4FB84D7F52313F314577E8D1EACF16F44C4C6977DA335D4534D8C86BD8E7
            16EFCAADCC1FA17D14FA96EEFDFF00D1ADAAEBAE9A99556D0CAAB686B1A340D6
            B46D6B47F55AB1719ADCFEB0F7545DF65E9918CC8FA3B990FB99B8FBB7BAEF47
            7FFA3FB17FDDB50C8EAF6F54CEC8E8F834B5F5D0F6B72EE7BCB18F607359938C
            C70AEC77ADB9DE9DBEC7FE87FC251EBD36264A06404468237967FD4F736483D7
            E81D2E9F195659D48805B700CC53CFE81BAB6CFF00D0AB3F4DEDFA747D97F715
            E55EFCEC4C6A1D7D8F1E956ED8ED80BC874ECF4F6541EFDDB96463E767E63C3F
            1AF21994EA9CC96B40AD84FAFE954C731CEDDF61FD2E55977A9FA6B6BA69F43F
            ED3C7C129DCBE588D35DBC936068EF1206A7855EFEA18D463D990E717B6B77A7
            B583739D64ECF46B68FE72D759FA3DBFBEB3BEB165596507A66349BB2FF43EDE
            7DD1BBFAACF4DDBEFF00FBAE85D25F81143EB79B71B1DBE9F4EAD81D6BB696C5
            99D902A6BF6DF952FF004ECB3FED3BFF00EEDE4548C70FA04E57BFCA3F77FF00
            424196B4DD674D7E6836F5702E2F1A614EEC7AC6BED7320372ADFF00496DDFFA
            0F5D3F9EFD3C3F1B3F2BA7B5C5D8D5D74DF40712E358B4DF53E8DCE2E77A2D76
            2FA94FFA3F57D1FE66AA95875F96F91463C1ECFB9C1ADFF36BF56CFF0039B5A7
            C5C4141B2D7BBD5C8BC875B6C0131A575B1BF994D4DFE6EBFF00D1B659620667
            86424451F960368EBFF3534D8492494497FFD1EFBAADF7E75EEE8B8361AAC7B3
            766E4B449A6A769E9B3F37ED593FE0BFD1D5FA7FF44961F58C4C5C6AF1337F41
            998E1B4BF1D953FDC5BFA36BF0E9A98EF571ED8DF57A1FCDFF0035FCE2D46535
            56E7BAB6358EB5DBEC2D00173A1ACDEF8FA6FD8C6314D4BEE47844387D235D0D
            4B8FF4BD48A376D0163DC4F50CE1F64C7C56BDECADCE0486C7E9327276FB1AE6
            D7BFD3A9AF7FA75FF39FA4B3D3C7CCC5A3A9BF29BF58EDAAC36DA1D53700C07D
            784EDAEADAD6B8B5BF6CF5AB665E435CFF00A0FF00B2FF0039454B6B37068CEA
            D94E44BAA6D8CB5D588DAF359F52B65BA7BABF5032CD9FF07FE8D58486500680
            5CBD27B471FEE8FEF2A9E73ACF53AD993879A2AB5B8D558197DB756FA2BACB9C
            CF49F759915B3653B87BEE6B6CA98897661A5B7D981FAE754C82DA1990E696D2
            1CEDCEAAAA9C7F9DA3199EADF6D78DEAFF00356D99366F5BAF632C6398F68731
            C0B5CD709041D0B5C0AC5A7A5E0E5F51B2A7D1EA6174C02AA596B8D8CF5AC6B6
            DB76576B9FB598F8FE8555FF0083FD35F529213818D18902035FD2E28DE825F2
            7E9A0837E6E6E665E4E1635581D16DF4B1AC61A6ACDF48DA5F90E739D9995A16
            EFF46BFD6DF97E9D98D65BEAD1FA5BDECF49DB9D5E11E9B8BD3B16D76457EAD3
            457EE65773AC1EABEEB3232195BEE67E8BED19CFF49F7556FF0063D5E859D3C3
            7AA59D45F617B9D4B68A6B20015B438D976CFF00C30FF4BD4FF88AD46DE9345F
            D4EBEA573DEFB71DA1B8CD986D64EF17B9A07D2764B2CD976FFF00455A3EFE3D
            88BD0C89FDFC928FE9FCBC5F37FDE2384B8386CFB3F4AC5B6AB4E5F54EA751BC
            BDC36B76DA1CE7C307B2AA6BCAEA1BFD3FE7F22E7FFDB763A55F8B88712A7827
            229C1A71F1B19BEE7979DFF6CDBF99FCE62D2CBB22CFD157E97E92D57ABE80C6
            E5FAA6F79C666F34E3B26B2C3638585BEBD2E63ECA2A7FA8FC6A5DFCCFADFF00
            13E96963E3D58D50AAA0430127525C4971363DCE73F739CE7BDDB92C99A041DE
            4646CFE8FF0082900BCB5B5579DD4CBB308FB23EE763645C1C7612D1B9D81A86
            6CA6EBBF5577FA6FB3E456FF00F95FD35D635AD6B435A035A34006802AF89D3F
            0F0F0998345606330168ADC4BE413B9DBCD9B9CFDCE77E7210E89D2DADD8CA3D
            360322BADCF6307C2AADCDAFFE8A8F2648CE85C8463A474BD3F7AB8BD3250043
            72CB2BA985F6B8318397388007CCAA4FEB9D31AFD95DA721F13B7198FBFEFF00
            B2B2DDBFDA536748E96C78B062D46C1C58E6873FFEDC7EE7AB7C68133F563F7A
            5FF33FF56275683BA867BC0FB374EB5D27E95EFAEA6C7F65D7DFFF008027ADFD
            71D630DB5E2D3548DED6D965AEDBF9DB5E6AC66EEFEC2BE925C63A423E7EAFFB
            E5578BFFD2F554924925292492494D7CFCBFB1E1DB90186D7B045753797D8E3B
            29A9BFF1B6B995A6E9F8830F0EBA09DCF12EB9FF00BF6BC9B6FB7FEBB73DEF4F
            93F65F5B1FED1F4BD4FD04CEDF536BB6CFE6EED9BFD3DFFF009F1584EBF45007
            7B91FF00A1FF0074AEAA49249354A4924925292492494A4924925292492494FF
            00FFD93842494D042100000000005500000001010000000F00410064006F0062
            0065002000500068006F0074006F00730068006F00700000001300410064006F
            00620065002000500068006F0074006F00730068006F007000200037002E0030
            00000001003842494D04060000000000070008000100010100FFE11248687474
            703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F78706163
            6B657420626567696E3D27EFBBBF272069643D2757354D304D7043656869487A
            7265537A4E54637A6B633964273F3E0A3C3F61646F62652D7861702D66696C74
            657273206573633D224352223F3E0A3C783A7861706D65746120786D6C6E733A
            783D2761646F62653A6E733A6D6574612F2720783A786170746B3D27584D5020
            746F6F6C6B697420322E382E322D33332C206672616D65776F726B20312E3527
            3E0A3C7264663A52444620786D6C6E733A7264663D27687474703A2F2F777777
            2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
            232720786D6C6E733A69583D27687474703A2F2F6E732E61646F62652E636F6D
            2F69582F312E302F273E0A0A203C7264663A4465736372697074696F6E206162
            6F75743D27757569643A34316438313031342D626235362D313164612D393463
            632D386133646463613236333836270A2020786D6C6E733A7861704D4D3D2768
            7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F273E
            0A20203C7861704D4D3A446F63756D656E7449443E61646F62653A646F636964
            3A70686F746F73686F703A62613338333966652D626235342D313164612D3934
            63632D3861336464636132363338363C2F7861704D4D3A446F63756D656E7449
            443E0A203C2F7264663A4465736372697074696F6E3E0A0A3C2F7264663A5244
            463E0A3C2F783A7861706D6574613E0A20202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020200A2020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020200A202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020200A20
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020200A20202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020200A2020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020200A202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020200A20202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020200A2020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020200A202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            200A202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020200A20202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020200A2020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020200A202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020200A20202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020200A2020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020202020200A
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020200A202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020200A20202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020200A2020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020200A202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020200A20202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020202020200A2020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20200A2020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020200A202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020200A20202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020200A2020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020200A202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020200A20202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            0A20202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020200A2020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020200A202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020200A20202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020200A2020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020200A202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020200A20
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020200A20202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020200A2020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020200A202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020200A20202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020200A2020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020200A3C3F787061636B657420656E643D2777
            273F3EFFEE000E41646F626500644000000001FFDB0084000101010101010101
            0101010101010101010101010101010101010101010101010101010101010101
            0101010202020202020202020202030303030303030303030101010101010101
            0101010202010202030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303030303FFC000110800D6
            01C203011100021101031101FFDD00040039FFC400BB00010001050101010101
            000000000000000009010207080A060503040B01010001050101010000000000
            0000000000060102050708040309100000060202000502030605040201050001
            02030405060007110821311213094114516115F07181A1221691B1C13223D1E1
            2417F11842525325261911000201030303030204030505060504030102030011
            0421120531060741221351617132140881231591A1B14252C1E1332416F0D1F1
            62B217829243533472A2C225D28318FFDA000C03010002110311003F00EFE314
            A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A629
            4C5298A5314A6294C5298A5314A629541F2CA1D075B53AF5AA7E3F51010E7E9E
            63FC7E9946DDB4FB6FFEDA5C1361D457C69EB041556164AC766988C8080876AA
            3E969B997CDE322A35923C0AAEDF3F76A24D9A374807FA8E7314A1E1C8F8E7AB
            1B1F2337221C5C485A4C991ACAAA096627D001A935E79B2A2C581F27265DB020
            B96B741F80D6A3D7697C8FD16ABAF360ECFD7942B76C7A0EB683733D65D85C21
            58A3B466DA7D0AE709494A97F5176A399350E52148D7DC04DBAEAFA44A9706DE
            FC2F80F973DC7C5F6DF7AF33170FC9E60631C3B464C84246257BFC2E511963F7
            6D7707500EA6A343B9FF005A8CFC36219F1C1B17DDB00D7FD2EA09BFDAA2D7AE
            BF295F205DA7BBDF5BE99D4D549F86A657E72EEA3477AD2DEDEB01091B371AC4
            94E25B8D2EC8F337F5D9C828A316689D0752693272A20D8C640515366721E32F
            DBB70F830E2F2BDDB990643B0419422C96B358DDCC5B0A85B8B10031BB03A25C
            AE432C7766334327F4956041BA7C918E96FF0035CFD7EDD2A657A69DC48EED4C
            35CA32629CEF5B6D7D5F2CDA1B60D19CBE1966688BF2B93464EC0CC0B28E3BB8
            C91166B26AB759149DB0768A891CAA202D5DBBD2FE61F1066F8AF3F8B9A1E497
            91EDAE4632F89961042660AB13481A1F92468CA195402C6D20F72FAAAFCB85E7
            E3E4F232F02683E2E431EDBD6FBBF36BD4285FEC26B763EA19A6813EADA548AF
            E95765D4A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A
            5314A6294C5298A5314A6294C5298A57FFD0EFE314A6294C5298A5314A6294C5
            298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A
            5507C03CB9FCB15426C2F6AA01B9CA2DCA8245A97B8BAEA2A8611F48F1F978FF
            0010E7FC031B8000F5AB87D85CD616DF9BF758F5AB5A4DED6DB33E94157227D0
            D5A364C525A6ACD3CE88A7E9356ABC728AA232B629851230228FA889A6421D65
            D445B24B2C9C9BB4BB4F9EEF6E7F07B6FB6F07E7E53209DABB9505954B316676
            55501549D4827F2A82C541F34D3A62E34D9931DB120BB7AFD874D7FB0543152A
            A7BD7E55ECAC374F610EFB4BF43AA322EE7E83AA5196750D25B2C918DDB1D1B1
            5B1F227645928941605D53CCAE74D9B6040108C6A3EB71286EB5E4F98ED4FDB0
            E26676E76648BC9F9A664D93E69528B82AFF001B88842E7231E66643628A6E1B
            DD2B5D5631AFB13125EF2CEFD472516FE19376C4BECEA3ADD7631D403AFE034B
            9A97EACE8DA02CCE06346951111ACAA250FEC1D6831A82706458581588DAEC50
            6BB520292A46E274A3D9BB058EC9150CBAFC3C54A8B0E50E4BBAF97C87CF926C
            C2FCB661FE7CD61BDC060C115ADEC5040DDF1ED0F655B155179D62E3A8C8197F
            16D651EDD7A5C153A74E84F51A5EE35AD861F21FAFEEF0F3E7F1FDF912B88D45
            CD7BCDD6EC3AD42EEB03C7D27E6777655A198A31CD6F9A44B68912018CA19C48
            AD17AD5FBB708FA8C262124649A385CC022602AA9AA24020286F5760F74C8799
            FDA3F8FB2B29B7CF819D3016D36AB65E4C401B000FB4A8BF5E849BDEF0691645
            EF98640F6F9233B8581BDA2B0D7D3F28E9F4FBD4D2F90F1C7EE1CE400A145874
            A9C0B9BDFD2AEC55698A5314A6294C5298A5314A6294C5298A5314A6294C5298
            A5314A6294C5298A5314A6294C5298A5314A6295FFD1EFE314A6294C5298A531
            4A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A62
            94C5298A50714EBD6AC11F0F00FE7C7D7282C0A022DD6AB637D3AD622DEBBC35
            E75D3575B36F6D097087A854D915C38148A45A4A5A417508DA26BD04CCCA25F7
            F3D3922AA6D9A2227214CAA80273A6981D42C8FB4BB539DEF5EE1E3BB63B770F
            E6E53219822EE5516552EC599D95542AAB3124EB6B0058807E193950E1C2F919
            2FB614EA6C4FF70D6A0C3ADFA8F607CAA6E877DB0ED02138D3AD942B0B969A0F
            4E1D3625A6D9D935917C2EDACFB559D2C9CA3562541B27352083511B23E051AF
            DC378D609B373D89DFBDC1C47EDBFB557C6DD813AFFEE1E646A792CC1F22CB18
            037C2511FE58959E39DD63314BFCA505B6995C3A4172D24EFB9D52587676D424
            1F8AE087716B92FEC905D96E46A3D3A695D079E1639CB5691FF6A9A1191CAB53
            B78C40A541A81D81915587AD247D0009B43A49A8927FEC0F4944439028178917
            2258E479B75E6607DC753AE87AFD7A5FAFD2A6270E17C64C5318FD1A800A7D40
            20AEB7B8B100FDFA1AFBBC78F21F51F1F1FC878FF3CF1E8413D6F5EEB924023A
            507910F0FE39407EA2EE2ABEDD49E950D1A71263B23E62FB2F70642D1E31D39A
            6E0E9A0F0897B2E9199B0C66BD6866C3C265172DDA3C879D43DC39B9054A7217
            D452FF00475EF7A24BDBFF00B50F14E1C916C9B97CDCA76F75F7471654F22F42
            C07E685ADED3F504EEB421506477B3B0E98F1D8FFF001C7A7FEAF4BD4CC873CF
            E59C880DFF001A9BE9616AAE294C5298A5314A6294C5298A5314A6294C5298A5
            314A6294C5298A5314A6294C5298A5314A6294C5298A5314AFFFD2EFE314A629
            4C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C52
            98A5314A6294C5298A5504780E7286E07B45CD2AC37A87C83CBE9FBFF3C29B13
            BB4BF4A589B5CFB7FC6B9B2DE960B07CAB779D9F5D2A8FCE8F52FAD16C21361C
            D212E660DAE76568B4A475A0CD9045E463D9497965E0A421ABE2D4C22D22994C
            4B24BFF59103777F63E2E1FEDCBC427C85C9635FC91CF42CB871B0378A30F63B
            8832C61151A29A412468C6464818836648072724DCCF37161C726EE3A2237741
            A902FAE84DED616274048AE8B6AD53ACD260A36B14F8089ABD7221B11AC64241
            B06F1B18C504CA05224D99B52248A45000FA07223E223F8F0DE76765F2197366
            676434B952B1666637249D49353C45005C2D81F4AF41E9FAF9F9FE3E1E5F9FE5
            9E3B051A9D3D7EF57837B1B6B570FEECA8BDB76DF752E17D6BE259AC30D51AE4
            F5AAC4F908A80AD4349D82724DD1BD0DA3A1E199AD2326FDC1F81F422CD9373A
            861FA14A39E9C1C39F3B371B07122DD93348A882E06E6721545D8802E4817240
            1D49B519B62B3F50A09FECA88BF87E6D2176AC7673B27614564E7F7BEFA9A7A2
            2EC1232E9454324ACD159A0649B36F6D9319FBA3F6C9978F4FA5B87A7FA3D223
            D4DFBA878B81E43B13C6986C4F1BC0F1C765C1B839263B8249249DB02B5EED6D
            C45FD0437B4DDB25F96E41C7F32575BFF00DFF007D4C7F8F3E21FB87F8672785
            B588D3EA2A67E875ABB2EAA5314A6294C5298A5314A6294C5298A5314A6294C5
            298A5314A6294C5298A5314A6294C5298A5314A6294C52BFFFD3EFE314A6294C
            5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298
            A5314A6294C5298A5507C007CBF88F01FE3E38AA1E9518DF2AFDB01EB375AE56
            26A92EA31DC1B84EB5275D37606134C346863B3FEF4B43321115D444D0700F05
            06CB1405424A3E660403184033A07F6DBE313E48F2161FEBF08CBDBB81FCEC9F
            76D07DAFF0A5C491BFBE45BDD375829DC2C6B1BCAF2C386C493291AD95A7C63E
            A6E2FE8C06D06FA8B1E95E9BE34FA931FD59EB954D9C8B2453D917D60CAE7B0D
            74D374D85295966FF731702BB65D73019C54615C251A654C503A8A24A9C3D045
            3DB2FC7F711E57CAF2977F721910C857B7F0DCC38A8429B2AAA2C8E182231134
            88641BFDC14AA9B6D0047BB47808F0639394996D95900123E80136D6F6D7F016
            E95227C7E3FC33420BDB53534AA73CFD3C70541EB55B5A8223FB7D7F97D32D42
            4DEE34FAD50F43A546FF00CA8ED295D7FD4AB5D5EAED8CFEE5B8E462F5740472
            2E1349776D271D115B336214C0275465ABED578B4FD1C188EA4911E7CF3A23F6
            BBDAD87DC5E56E273B9BB2703C6472E4CC5812A19637105D9594A9129594117D
            23371B6E4477BA7913C6F0D932C67F9ED6551F5DC403E87A027AF5E9EB5B55D6
            6D38CB40E89D67A91919354F50AD376F2CE924136C490B1C8ACBCC59A481BA2A
            2C9205909F9072B148073814A700F50F1CE6ADF24778E6F7EF7D77177765017C
            C9AEA07F9638D562885F6A924448809DAB73AED1D2BEFDBDC58E2B87C4C3BFBC
            0249FA9625BEA7A5EDD7D2B3B078F1F8F8E428DF7000E83AFF00B2B39F5ABB2B
            54A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6
            294C5298A5314A6294C5298A57FFD4EFE314A6294C5298A5314A6294C5298A53
            14A6294C5298A5314A6294C5298A55079E3C0391FC39E328490341735437B682
            A803CFD3F7FE595F417EB575B4D7AD044439E0BCFF00100CA13A1B6A6A874171
            A9A7ABF10E39F2CAB594124E954BD9B6DA8223C880073F878F1CE52E35DBAB0F
            4AA9E971D68261E3900FE1CFF8F8800F96514DE835B5504C3F40F11F20E78E7C
            BF2CADCD8D87B87A5518ED03FD47D2AA06F0F10E07F0F3FE7C65BB8ECDDB75A0
            3D01D0D5A73814A63088001439111100000FA8888F8071975C696D6F5759BFCA
            B73F4AE74B54021F251F28D65DC2E81691EB87511B47C7D0D23BC4462AD56583
            9B922D465D920450AA3A6962B53591B02CB264298D1ACA21B3BE5354123772F7
            140FE04FDBAF1FC36C3177A774963235C930C6A54CB6B34D1122174803298DAF
            27C8A37A1290149BFAB7764908FF00F1F18036FA9DA3EC0F5FC7A7D2BA2EE3C4
            043F3FF0FC38F2F0CE1A5B100DAA7A6FF5ABF2BF5A5507CB2D6BDB417FB534F5
            AB7E9C7EC1C8FF001CA0DCCA1BFCD55D4936A855DC3EFF006A3E54756E9814C5
            E6B5EAA551A6CCBAA0AFBCAB175685423ECCC9BFA7808E58179F795648E9184C
            A8918BC2880940E04EC4ED31FF00B65FB66EE7EEB92431F39DD93AE3E215BEE1
            1E3CD24325CDD95484FD4BAB1546BB2ED24D9920FC9EDE47BAF8BC4DDEC80316
            16EA76871F4FA0F5B7F819ABF4FE7FCBFC338F5AE7F29B1A9B8D3F0F4AA80719
            6AA04E9FC7EF4FC6AB97D298A5314A6294C5298A5314A6294C52A83CF1E01C8F
            E1E594370341735437B6835A00F21E585248B916A5FE829EA0CA3B04B5EAA411
            5401F0E78FE7945756048E95417FF30B5540447E9FCF2FD08B8355D3EB55C529
            8A5314A6294C5298A5314A6294C5298A57FFD5EFE314A6294C5298A5314A6294
            C5298A5314A6294C5298A5314A6294C5298A550C220022181551D6BE44E4EC35
            662246C162968C80838768B3F969A997CDA3226318B720A8E1EC8483C5126AC9
            A2098098EA286290A01C888067D71717232E75831319E4CA90D82A82CCC47A00
            2E4E9F415F39258F1E3324CD68C7AD69936F927E8E3EBA455059F62A98F67A6A
            5232163DDB367677750525A65CB865111EE36137815280C5D4A3D6A641B95793
            4C565CC9A65E4EAA407DB72FEDFF00CBC9DBB377549D9937F4148CB96F971B7E
            D16D443F37CEDA9E8B193D74D0DB083B9B842E11B3003FFE97FF001DB6ADE1E7
            801E7C38E7C07C3F1FAFE03C669EB5ACA9A0ACF100916AFE29292610F1CFA5A5
            5F338C8B8C66E642464645CA4C983060CD13B878F5EBB706220D1A356E999451
            450C521085113080008E7D21479A658A28CB48C40006A493D001EA4FDAAC7912
            24691CDA21D4D46E48FC8C42DFE6ECF11D5AD7EF371D6B5FAEF92D93BC2C12A4
            D6BA3A8E93268B2EE1CA36FB4336E16FFB6320731FECC136CB204155BB858862
            7AB7F63782A4E130F1737CA1DC2BC1E46547BF131562FD66564A82A1FD904968
            028653FCD20DCB0655D8E57013771433168786C7FD5E6AB59D6E6254BF43BDD7
            6B5FE83FDB5A434BF93EEDFF0061B6E9F4B681EBCCFC1D88F153CF22EE5B434B
            EDBADEB0726838C792CDD6B1DA64E31BB1ACA33A8B25138D174BB66928B10A8A
            4F1059C22534A5BC71E0CE0B032F239EEFFCA9B2A3640634C4C852BF215170D6
            0AC141DFEADB548DAC7DB5F59B23B8B1BE26FE8EAF1EB706545B7D35173A9FA5
            6F07597BE93B6CD883D71ED76B71D01D8D455499C1313AABB8A3ED37056AFDCB
            E5697202791422DD2248E50C8B55DFBD41FA024518BD763EE9128C7907C1F8BC
            476DA790FC6DDC9FD7FC7C2E259FE238F26336F48C2C914AE2470CEE3DCB1829
            A891156CEDE783B8E35CCC7E3796C5FD2F27293B63DC640475D1D415E9AEA7ED
            7BE95F1BE5C3B4AAF5CBAA73B5FAC2F201B4B7B99EEADA1121CAA9A598339267
            CDDACAC8ADC4AF7EF22AB6B9DAB016C077213320C7D241289CC4B3F6DBE3AFFD
            C1F21E1CD9D8E4F6E71844F90D7B7BACE71D3DAE8F77912F74BD8235EC35AF67
            3BCB47C460CB32B7FCC9B045D75248075B102C093AF5B5BD6B317C7775799754
            7AB7AE682F239BB5BF4B45A771D9EF0AD9249D2F77B32494848C52EE089A2A3C
            6D506A64215A28A14153338E484E007136477CE3E4797C99E44E779D84EDE215
            C458AA0DD4451284DE2E88D794A994EF1B86F09D1140F0F6C70E38CC14C89E3F
            F9E945D8DFD2FA0D091D3E96ADE700E38FE79A7FA1D7526A4E3EA7AD5D9752A8
            61100F0F3F0FE63FC72A3AD34F5E95E1365DFE0F566BDBAEC8B2AA546068F5A9
            7B2C989D52A2276D12C96762D9254C060070F0E98249070222A1CA1C78E65BB7
            F84CCEE4E6B8AE130A327332A758D40B1B16362752A2CA2EC6E400012481735F
            09E518D04B92C7DAAA4DBF0FEDA8E2F8AAD772EF35CECBED95F5934FFD99DB7B
            FCD5EDD4820DDC34337D7B133538D68F10564B11145AA2A3A7D252653A04F42E
            94925FF22C44D33E740FEE67B8123EE1E03C5BC3E56FED3ED5C51063AE848932
            238659CB3DB7B1D2342ACCDB1D1EDB7715115ED784E44FC973AC965CB6054FD9
            6EA45BAF51EA05F43AF5A959CE67A98D314A6294C5298A5314A6294C5298A531
            4A629541F2CA3743AD2ADF1E3C03F778FF008E0F5EB73546BDAEBA9AAFD3F2F0
            FF003FC439E72B6D6E3F355C0936FAD5BC800F8798788873E41FFC60B680FF00
            96A9726E2F5501E47CFF006FA634B9D35A5FD0ADAAFC5298A5314A6294C5298A
            5314A6294C5298A57FFFD6EFE314A629541E403C0391FC39E3F9E50DC0D05CD5
            0DC0D05CD57E9E5E3F86547DE9ADBA6B54E47F0FE796DCD8D87BBE955D3EBAD5
            3D43F8703F873FEA01952480491545B900916AA7AB90E403C47E9CF1F9798865
            4E848AAB022F6D4D579F0E78F1FC39E3F7F8F1E4196824ADF6EB4D3EBA504C21
            CF873F5F3E038FAF88871E1971BDAEA2E6A849B74D6AA038FC6AA35AA7A87F0F
            E794621475D69A7A1D680611E3C3C3EBE3E595FAFF00ABE954520AEE3A504DE1
            C8073F97EDE794F76DB95F77D2AA74FC69C8FD003EBC78FE1F8F878635B74D6A
            9717154F5878078788F01C8F1CF873E1F88F003FE18F76DBEDF77D3FDF57116D
            4D3D7E1E3C00FE0221FC7C7F20C5FDBB80D2AD17D370B1AC23D81EC3EADEB3EB
            896D9BB5E7D286848F4D54E363D214969EB54D15BAAE5A56EB11AAAA87EA132F
            8A81843D6749B3648A770E9641AA2B2E9CA3B3FB3F9FEFAE720EDEED9C1391C9
            3826DB95155429666679195140504EAD7246D5058807E5993A616264E6CBFF00
            0A25B9FEDB0FA9D4FD01FAF4A882ABE81DEBF29D6087DD5D9B99B4EA7EA199C3
            29DD57D7A80937714EAF910D97965A12CF6870D1F3470634A20E9B2C7907AD7D
            C5D120963106CD9707ABF546677AF68FEDAF1333B6BC70B1F25E56DAF164F28C
            0AAE29DF1B98560904D0C876EE474470239141959A45312C138DC23DD131E579
            8BB719A858B55FB03B94A9EBADC8D7A7437AFADF273D53E92EA0E916C188AED0
            F536A9BCA0C0B3DAC166C9358EBF5D25AAF21132767AFB39958EEADD6F3CD567
            EE1A3A2B955D26533A4D5544A6021F311E03F27F9339DF31F19CCE772793C841
            27CA32D7F96912AC914888DB4462288894A11F1A2B305283DA58548F9D8B0870
            5938B3229C5DA36AEA082A411EE1EE3A8BEA6DF5AC0BFF00FAFF00B1348744BA
            D37BB36B6939EBDEC8D7B2148A6D86C56BA82B66D9175D68C4955B5EC9774E8F
            72BCF235C4A79B11C3953ED0E81DDAC0DDCAAC4EBB4FB9CC72DE02ED0C9F2D77
            276A0EE7DB9716424A70C63CBFCB59D639D21F9FE508C0C6F6DC1C15057AB6E0
            912E3333B8E6E0A09F121F8B0E304196F1B5EC4A8F637BB4361D0DED7E95AB06
            B47C90FC836A4FFDCDB519581EF52A11770FCD41AAB8AED2D2D8C15D9044AEDE
            BD4A06BABCC59EAED671A269BD7AE5ABE6915EDACBB360F1666E0E8EEFE1713C
            11E1FEEDC4E038348303CA8EA635693F5990319E640231BA469202D3432EE545
            742C088DE446656382C88F9DE4F0E7973F34E5C3158AD9122EB6DDA2DAFD06A4
            1B5B41D6BA2DE9ECAE88DB5A075B5B74DD2A3EA1AD99AEEC6275C0C7A2CD6A65
            C6B728B474CB4B4352A8E0B256E83B04728607AAA8E05754A47A455431D158BC
            27E57C0EF0EDAEF9EE5E27BC330CBDCAEEAD3CF743F32CA892C65447744428CB
            FCB43B57F25805B56CDE164C7CEC4833A38F6851654D7D847B48BE9BBA7523FB
            EB720438FAF9FD7CB80FAF8E6AC1EE5D75159C3D2F6E95177F2B1A01D6C8EBCB
            CDC1446E78DDD3D7A76C36652ED11855119D6B1B5B7E8CACBB741CA2450C7087
            2A412EDCA620988E190908748ABAE26E8DFDB2F7C63F6FF7D2F6B73DB5FB479B
            438F910BED31BBFC7208377B1988677311452A1FE41BF7050B51DEE9C21C870D
            931325EC5586A411B58126E083E9F5A8C1D31B09F7CA97C8E69CB5D9A1CEA6A5
            EB16B081BACD43A2DD75AB81B05B34839192408758AB3645A4EEE61203132C6F
            766A16A46310A64CAB0A3BC7B8B804FDBAF827B8B022CDDBDE1DC593F146E97B
            A451CCD737BBA8270D8DC8DAD14D2FB198A87117C09E6E639AC3FD6FBE300DC5
            80E8A4FF0097FF0030FE23FB2BA84028787E5E5F4FF5CE01D75D74AD90554906
            DAD57CB0001D0509F5F4A73F965A0920DD7DDF4AA9207AD5044DC0F01E3F40E7
            8E7F1F1FA786377DBDDF4AA1B81702E7E95105F245757BB9EFFA3BE3E290A3B3
            4E6F4B4444FEDB7CC5559246B5A8ABEBBC9C972BE728B576423B928DAF3E70DD
            15413496559A09287295CA7EBEABFDBEF12DDA5C1F78F9E790847E938284478A
            AFD26C8C9DD8FA58EEB2B3AC7BB632DDDB5528CE907EEB94E4E5717C303679D9
            8D87A85B7AFA585CF517FECA963AEC0C3D520A0AAF5D8F6D115FAEC4C7C14244
            B32891A46C444334584647B52898E246ECD9B722640E7C0A50CE5DCCCDC9E472
            F233F324BE5CF23BB9B0F73B12CC7DA0017249B0007A015364558D63894D9545
            87DC01FECAFB99F0ABE98A5314A6294C5298A5314A6294C529FCF286E0682E69
            54E7281AFD29F8D5A26F0FA00F1CF1CFD39FC78F2C374200B9FA74A75FCB5A61
            DB9EF4697E9F42B40BA3C7166D8B3ED15714FD575B55B9AD13A002A22DDFC8AA
            B8833ABD6D57A4F64641E89533A807220470A90C966D6F157873BC3CB5CA7E8F
            B7F14271F0BA7CF3B347B6147BFB951E48CCCC02B7B10F5B06640C0D61F9AE6B
            1F85C713640BB35F6AEBA916BEA01B751A9FE17A8E781D67F259DFA70DED5B63
            634B74CF444991779034AA02B23117978CC4C62B133C2347B5CBC487DDA7EA2B
            85279C4537112916421C533FA8FBDB3F97FDBC785D23E3B82E257BC3BB226225
            C876C8C58A37045800C2588EDB9FF82AF7B6D7901E912C1C0E5FB9A27CAE632A
            DC7391B620A14D81FF0052156EA3FCD6FB0AFDE6FE143FB523DCDB344F6B7755
            5373B25D57D1366919C3C24748A9FF008664E3A51F53491D38D0AE556C6159D0
            99FF003EE087DB8904E99EB0FEEE7FAD4D2717DFBD818DC8768CA815F1966D8C
            3AFB8388BDC07B76AFB08B1BC86FA64B23B13809E30D140D1E70E92EF90DBA6B
            B0381A5ABDEF537BFF00B3291B8DA74A7BED1A5AB6F23BE6D0FAEB6AFD83488A
            8ED1FBC0146063A4D66A8B2844AC964704F6A2A4238811736E7967ED33922035
            7116F29787BB7B3BB6DBCAFE1ECA195D96771C8C6F787C2B18D2DBB224334BEE
            662EA5374606E05A36057E3C1721C8E0647F47E667F91BA23ED55D05CDACB7BD
            FEA4FE3AD4D194DCF1E1C7EDE5F4F1E33972E7DB71A9A9C037B822CC2AEC5FA5
            FAD56AB95A5314A6294C5298A5314A6294C52BFFD7EFE314A629541F2CA13617
            A7E3541F00E78FDBF8738B01A03626845CFD6BF9DCB96ECDBAEEDD2E8B66ADD2
            3AEE1C2EA152410412289D559658E209A49269944C6308800007223C65C88CDB
            638C5DCF4AB259123466736515A11B77E48FAEFAD2C47A35552BEEFCD8282A64
            1E53B43D4DC5DDC46AA0ED68C324FEC6B388AA611E23309919ACCD2925A41070
            BA20A37282A4136E2EDFF0577FF3FC3A770E4E143C7F6FB0244F952A460AA825
            9963DC65215559AFB00215AC4ED36C23771F18D91FA5C694CB97FE950C3E9EA4
            05FEFAF3711D87EFCED37A09EBEE94C0EA3AC3851EA8C6F1D80DC7189C89D9A0
            650AD537FAB69B0ABD963649E97D0604C5F1912018DEA5404A50532BC8763785
            382E2E3CBC9F32C9C9735ED1261E2F19908158FE62B972BFC2E8BAD98282DA0D
            A2E76FD3FA8F2EB22A0EDCDC87FCCD90AB6FA5D4024FF6E95FD014DF939B69D5
            3CA6ECEB4EA321396CDD0A4EB1B36C35574572A9F7128EDC5D9F4225F7D1CB1F
            D0D10493222B113228B9B931899E1C1E77C1FC3075CAEC6E4797918A9BCB9AF8
            A14002EA0401EE1BFCC49B8B9DA4696A9979695CDB19225B7A306BFD3AFD3FF1
            AFED6BA37E428555FEEBBE14A45351D3604134BA994C70AA4C518D326E15FB81
            BD3444AF1F4C1814F68C9AA441B00260A1CE02A1B28FDF7E07B40D0F805FDBBB
            75F9DCE1BAFD34F8895DA3EFADF5F4B7C827384440E4843ADC6D437FE3E9FC2B
            EAB2B37C80D06616673B53EBF761619A2467428D2E766F4CEC474C7ED848900B
            3B71AC54B78F7EF87FA5423964D54280A67140DFD791F8B8EF1173B23C8399E4
            3B7E273ED124473E25FA8BC4526B7A5D816D41008D2AA792E4E36F80F1AB2B8E
            A448148FE0458DFF001D2B64F536F1A9EDA6AE9062CAC151B9441520B4EB6BCC
            5295FBCD5965B904BF518B54CAB77D1CB9CA62A320C16771CB9C87226B98E9A8
            5241F9EED2E4FB70634B3EC9B8B9C130E444C1E29941D4A906EACB71B91C2BAD
            C12B62A4FBA1E4219A6FD33DE3CAF553A91A023D2DD0FA1ACCA03E7F88F1C073
            FEBE3E1E19185E961D2B2075B8FA5793BADEE9BADEB9216EBFDA6069B578A454
            71233F6594670F12CD349351638ACF5F2A8A007F692308179131B8FE9011CF6F
            1DC7E772D9B06071B86F3664AC0055D492741FEF3D07A9AF2E4E66361C467CA9
            36423D753FE009A856DD5F3235CBA4E7FE99E8AD0AF3BE36B58CE58EADD9636B
            6AB080159C3255759EC0C6D8DA1245F1A2D3E1651DC9316F0ED914C5670A0361
            F7B3AE7B43F6B39BC24393DCFE6CE4E2E17B63076BCE975C8660CCAA8AEF8B31
            2A2466551F117737006D2748BCDDD78D90628F86C4396CF70BEE31FD6FF9D7D2
            C7AD8695E2BB27B83B095D9DE86EA5DF161AFF00FF00666E378ABA6BC7D11844
            2D5FA7CD6C1DC6DAA313B2DC2CF05CC53DB5D2758B476C5AA8D989189E45F489
            882448C894DEDEC7E07B224C4F32F76F6C70E26EC3C240A9F23C9BA48D607678
            977DB212296421CEE3BEC91AB063BB6793939F9595380C5C87D992E5F7A8DA77
            9BAEDD468A506971D6E7E95343D81DF9AEBACFAA2D1B7F6849AAC6B359686508
            CD891271376296508618DACD6D8ACBB645ECECBAA41224551541B24503AEE566
            ED525D74F953B2FB3BB83BF3B8F8FED6EDCC4F9F96C82DB4164450A8ACEEECCE
            5555551493ADCDB6A86765532EE433A1E3F15A797402D61AEBA816E86A27BADB
            D67D85DEDDA31BDE2EE7C7990A3A0B3B3F5B3AEEB818D00C28AA3C0750764B6A
            0266E122D253EDDBBB145544427DC229BC5CC68C08E608F4FF00903C81C2785B
            B7737C3BE25CBF97967BA72BC9A82AD2C80B8681629448229630DB0C90C968AD
            B54FCDB8C5139B8E93BC32E0CCE5A1F8F808B58B1AE1AE59406632AEC92C5D43
            D9858DF68B20D762FBB1DFE79A4EDF4AEB775D6A8DB6FF00683663D462E3ABED
            399289D68C5C78A360B54720E6389312076C8AEB2313FA8469516C819DBF74C9
            AFB2771AF3C47E138FBCF8AE67BF3BD796FE95E3AE3ADBE6285CCEDB8028811B
            E44404A869823FB9B646ACC2431E6F3F9E878E64C6C3C4FD5670207C5B8C7A11
            FEB208D0106DFE151A5DDBEBB075B3A7DB577DF6AF672BBC3B9FB8E36B3AD281
            212AE8DFA4D41FD8A698BBB4D4B5BC626DFF004E64D21EA894ABB7326466D5BA
            499542B266C856391CEF5F18F9223EEBF23F03D95E37EDB3C3F8A310CF2E4C0B
            2190CEDF0CA239A69A4513D8C9F1EC803B31DBBDF704022C1CFC7E4CAF0F2BDC
            9C87CDC86C2228F62A88C1FCCA1A3B06D08F711A7A7537FDBE30FE375C6E6A5D
            2B78770A246D54683A9A15CD25A82C254CD14E6B0FDCC9CBC8C9DC2BE4202015
            C3C94A89E2E396E45FFA8EE9F8384C59F1F7FDC379EA3ED7CEE4FB37C6B2AC3C
            9E481FD4F2D46E2CCA8A890A8950812A20DAF2467DA36A06F91488F1BC2F6FC9
            CAAC4FC9CBBB0E1276C760376ED4DD9482003623EBF875E95D846B18C62CE363
            5A20CA3A35A20C5847B62820D1A346C4226DDBA08A60044914124CA54CA01C10
            A5E0380CE039A69277967772D339B927A93EA6B61E3E341063C58F1C3B604160
            2E4D87F1373FC6A3DBA6500CB556F4EE169A8C45BB1834EFF13B72BF1AD08E93
            45B27B25FDBCD2843A2A3970D915521886842FA4133288153398BC090737EF97
            265E77B13C47DD923349CB4D89918F91230B17681A1086F605BF34973A8DD7F5
            2CCD1AEDF071793E670BFF00A3B9193EDA1BFD7EDD6A46043C3C3F8673F02752
            35152F07507EB5A41F231BD5975E7A79B92EE716879C98AEA9AF69EC5E908BA7
            2169BF08D658FF00E3AE451BBC2C3B37CE2495455E1359BB150A63073CE6D8F0
            8F66E477DF933B5F828E431C2253348C369DAB02990685D37067544215B700C5
            ADA1AF172199160E2C93640DD18046DD45EFE970091F5AD3EF82AD315FD79D28
            89D8CCD91D3B3EE9B55A65E7DF392A80E5489A25A6C741A9C58089BDAFB460CE
            1D7725E3D46F7A416F51CC3FEDDAFF00BC2EE3E4390F2B6476B4B291C4F0D044
            B0C775215B271E09E57B850D77BA02199F48C10403B4463B331123C7CCE4107F
            F90C2E7EBB370FAE9624FA0A9A3CE51A9A53286D6D7A52AC30F9F1FD421C7879
            7EDCE095E8C6836B1FC2BC66C6BED6F57512DDB16DEF938DACD2E024EC532ED5
            3949EDB28B6AA3A3A6909B803BA7064C134481FD4A2A72900044403329C170F9
            DDC1CB71BC271901933F2A511A28FA93D49240000BB312405504920026BE3913
            C78D1493CCF68945CFFD85469FC6FEBD96D9AFF667C806D4877486C9EC94DC9A
            7AD19CB1172B9A1683877A58AAAC3C73755DB92340B7121D19058C5131176893
            212184A1C9BA1BCFBCEE37010F01E0FEDECA8E4EDCEDF8EF3489D7233260B34A
            5C9171F13BB2950D6F919F705D891C513E0F11B3F90C9EE4E450FC8C40801FFE
            9A58A35B691BB77D5C5C01EDEA4995F0E7D5E3C79701FEBF5CE6616B69D2A67F
            5D2AFC55298A5314A6294C5298A5314A6294C52838EBD0D0E95F988FF48F1E02
            21E1F97EE11010E728480C2FD4D54824DAF5181DD4EF548EBD9E8FEB0F57D04F
            62F6EEF8F584145C5B166D64E2F597EA4991F04B5A4EFF00D107FDC0B40A6BBA
            68CDCA82DD83727EA52809C7A652BAE8AF10786F17B870F27C89E43C8381E2BE
            3ECD34C4331C821C27C2890B8C8542C42B4B1A925BF971DDB73471FC9EE0C483
            23F418EBFA8E42F6D9AA75FAB15DB71D7AFE3F7FA3D48F8FA87D576169BFB7FC
            C1772F6A659270FE5EE72E1F790F4F909370F9D2E854105D3289E49B232276A3
            28B1416236006ED08CDA015B878FCA1E6FC9EE9C37ECAECDC5FE95E39842A478
            AA7799021DDB9E464126C2DEF58AFB41B16DCC06DF0E076EBCD9B0F35CE647CF
            CC283AED0BB74B0D1085276FADAA4BF8101F3FC78FDB9CD0001DC4FF0096A5C0
            0F5AAFD07F3CB81BD88AB7F2D4647CA7F52E33B21D6FB05A60A243FF0073E966
            2EAF7ADAC11E7519CD95B452AD652D15B41EB53A6F4E8CA45C70B86A92672A85
            9666CD54CC53900477BFEDEBC8F93D87DF5818B2E491DB5C8BAC39296B86243A
            C2FF00F0DDC1491C7E4B6E04863B6B0FCBF143904DF19B6526AA7FD9A903FB6B
            20FC6BF68647B65D51A45FAD0E5173B1AB4EE575C6CD51232026756EA8AA9A29
            CF3949B318D6AD1D5CEB0E63A7146C920449A9E4851200953011C379CFB0B13C
            73E46E6780E3496E11C24D8C4FFF006E540C535666022937C4BBCEF6540C6FBA
            E5C37243918183AED9E2215875D75B1BD80D6D7D2B7D807E823C8FEEE39CD3CA
            6DB45FFDF598171D4D5D97D5698A5314A6294C5298A5314A6295FFD0EFE314A6
            29569F9F48F1E7E1FE618276EB54276EA05EB54BB7DDABACF5375932B84A44B8
            B4DB2DB616948D694664E4CD1DDC2EB22D1EBF6B187902B2902C5304D9C72C75
            5CA891CA07F6D1201975D121F6478AFC6FC9793BB9578683206371F1A3499190
            CA19608941F7105E3DCCC74550E0DB737E5462313CDF269C5E0BE413FCFD028F
            A927F03FE1FE35A2B4EEA46E7ED7DAE5EC1DEFD876796874946B3F1FD5BA603D
            A9EAEA42328B39423184EDF6BE46C4B9CD368B4D4133560F1E3C646010792209
            BA2B736ECE4BCADDB1E27C4C1C7F077111E3F2810C6FCD4AC659B35368DE5707
            256418CBF20B7B942BD83A44010563385C1C5CB49FAEE7E133E6AEAB1866409A
            FD50853A6B6B1FA13F5938D4FA174D68A8A3446A1D6750D7AD1749149E9ABB10
            D9AC8CA7B201E85A6E68C5566271C8701CACF175D51E3C4D9CDBDCBDE5DCFDE7
            C84BC9F74F35365E7BB1625EC1549EBB1102C680FF00A515547D2A731A858E38
            D502A28B01A74FC7A9FE37AF19D827D0B6A8C0D1462FEA131B422DFB25221098
            5609DA91044965973A52A826BAEC953A4C5C2A53826A80A6D15E4A200399FEC5
            C6CBC19323BD3E6F8B0B8E65F7941259E4BA28D97B9D580BDAC09041045C6139
            89F718B0213BA496E0AF4B8D0F53D3FB6B2A6ABA42BAD759EBDD76B4FCA5AD6A
            252AB15056D13861526AC6AD7215944293D2EA194585494973B415D737A8DEA5
            5430F390FE6B903CBF35CA72C22F8972721E4D97DDB77B16DBBACB7B5ED7DA2F
            D6C2B29878B161E2E3E3451D9116D6B9362753A924EA493FE15EEC407E9E3FBC
            4039FE598DB9FCC0E9F4AF4DF68B8D48F4A7D39F2E40447C7C07F7F3E01E018D
            4B25F4EBA55C74D08D2B58BB395EA4BAAB46DAE6EFB0FAB2E54C7632945BE493
            A55B8B074472CA464611DA2D5DB37F235EB1B788041FB640FEE9900131383138
            1D87E3AE53958390C8E370F897E478BCD5D9918C0AA09400DF19DEC8C2368DD8
            3A9B5891B5AEA4D61B9AC5C49B14ACD204947FC36F71DA6E0B0B022FBAD6D7A5
            EE3A546BA3F2B9B076CC2C4D0FAB1D7DB66E4DE9FA73869685E31B95CEB7AC4E
            20C9448CE246E6A044D5128C33FE07EE05EFD91D64946C92AA08A6B1BA067FDB
            676FF6B654BCF7913BDE3E2FB225901C773119249C5AFF00188A399E6054FB4D
            958EDB39B5C81129BB9B9178A0C48D0A72FF00E6D03FFF00C766ABF7F5FA8A8E
            4DE7A03B7FD88DFD4AD3FD86BD85E3B077A2FF0075D7B4D43CA03ED5FA4F5933
            76D1ADAB655BE621574A2AA6455D9906716DD9C62CE2585B2C651C99433123CD
            EFD97DF9E28F1EF69F3BDC9D91C0AC3D9D00449F2CC932CD9B92095822860C94
            32C84DE52C772471DC5EEA321B1F0795C666B67637F51632725313F0F4B0000F
            909D84A8D0AFE61AFA7A5FA01E94742F4E748E90AC4D2525AD3B0AC0C63D2D85
            B62791312C96D74C5248BF6CC9BA8F2412AA551276432E844B454C811538AAB1
            D77065173F0E796BCC1DD1E5AE562CBE5AD070D8CCFF00A5C3520A40AFB775E4
            DAAD2C8FB41791C0B9D11634B20DA1C7F198FC6C25117F9AE06F6FF511D3D4D8
            0BF41FC6F510C9DAE077EFCDADF7674EC9B54F4D7486953CEEC366983963E02B
            21ADE972F557A12CBBD74570518ADB77A9E7891D34CA99CB0A0B08014A075BA4
            C2C7D9BFB4AC1E122C6B772774CC3E30B63F27FCE2BDD8FB917FE4D1412C54AE
            E03AA5D634F8F3E5F798C488EE112DF6F4DBFCB07AFAEA6FD7D6B2FEB3A85ABE
            5A77E2DBDF69C5CB56FA43A6E71C47692D72F84C9AFB767E2E45FC6CB58AC26F
            B621091CF556070964D231CC8A7EC4522B08924CEA6279DE560FDB2766C5DA1D
            BD948DE61E563DDC8CC353808363C31C7712C326F8E5611B23060774AE031891
            7C780B1F74F2F2CF9284F158C46C5D46FDC0826E36B0B328246BE8BD2F7DFEF9
            00EE236EA66A962C69ACD5B1EFFDB0E55A6685A1C745399C7D276559660C169F
            561993772E1EC5D60D2A8181B813D4FDF2CD9997D3EF9954B48F85BC62DE48EE
            777E525583B3F007CBC8643300B1C7B257456FE646F695A228CE8C3E34DF2161
            B45E4BDC3CB47C4F1F2E67C97C862020B1D5890A7D0F406FA8D7A7AD63FE8974
            E6B3D3DD716ADE9BB2C2C2D7D83BDC3495DB756E2B23B41FAD5D843A7FDC7350
            4C6C06792492510D7EDFEF66DFA2B9BF577A894E738B36718DD9E73CD9E54CAF
            29735C576A76CE3B63761F1A463F1D88A405D44719725923908731AFC4B35CC2
            9A0D859C553B6B884E330C4462DB992125F5DDADCD85EE4743A9075F5A85E8F9
            2BAFCCA7C89C104A369588EAFE964A466D9B13B63AF1CC35BB4B03714D091F74
            848D3DD37AC943B441EA0650E76D1A828548AB8451CCA74C4BC771FF00B5FF00
            0EE464B329F20F261100B1659A7537BDEF246B161A4CE40B219C8B1D8D2DD234
            F912733CD4506DB62B93717FCA1547DB52C47A74FBDB5EB713294A5294A02052
            7F41438E0382871E1E3E5C067E72B12581074AD86000BB40B0AB8C0201FD3E23
            FBF8F3FE03F8E5BA2804EB6A7DC0D47A5476F595F0D8BB99DD6B0B77865231B4
            4691816E9A28AA0C5CBB8C97DD31EE9D15D94A93476AB708B226005050E9FA8C
            6130155286741F93314F1BE23F09E24B1DA77FEA4FAF5019B11EC45CD89F92E4
            7B48E845EA19C0BFEAB9DE7A656F6A7C600FC7783AE9F4FBD48908F8797201E7
            E3C7E79CF657DB70BEEFA5FF00DB534B7B7AD735DF2F57C9AEC9763F50F4BE86
            F147F5ED6EC5E6D7DCC5609A8BB28F945D8FBA92732E136E608E7350D7A75D42
            1C4E540EBDA5AA2A28454E4F4F7CFED5B81C0ECEED5EE1F2877263223E5B4506
            1166B16559244942156663F24C141568C1FE46F5BA9B8D77DE99AC248B095AD3
            5B704B5F774B9DD6B2D812753F61D6A63BA0302957BA79A15BB76048A672B517
            16F611A998144D8C6DF67A62EF1ADD33822DCDE84D8D813000317D601E061318
            04C3CC7E75E6A2EE1F2C77972B14E65433471EF236926182281BDA00B58C6474
            17B5EC2F6A91F6A4422E070548D6CC6DF4BBB1B7DFAF5ADC6CD4B521AA08F01C
            F9E286FE82E6ACF1E07F873FB703E5943EE5B01A7A500B7BADA9A86DEF1DA9EF
            6D3B0FAB7E3BF5DCDB94A04EFD9ED0ED44D43BC06CA436B7AE2ECDF215523D4D
            15546D32FDD2AD449E903824FDEC799428A655BD1D5BE1BC04F18762F7179DF9
            3DABCEC6160E1A371749E594C98F90FED6E91AEE243AAEE8D25084310E908EE5
            78790E538CEDF77BA392F22D8EAA0060370E9D0FAF523F033030D151D0515190
            90EC908D89878F6717171ED48046CC63A3DB26D18B36E40F04D06AD91290850F
            22800672B64644D99953E54EF7959CB31D3DCCC4926C00B6BAD8695358C5A340
            06D500003AD87A6B5F4C3CFF00D3FEF9F2550A2C058556E4EB6E94F50FE1FCF1
            BE3D2CDD68BB8DF72DAAA23C0780723F40F2E7F8E5C6F6D05E86E01205EA9EAF
            C7C32D56DC0B5BDB55FAD0447F0E7F8E5C74D3D6A97F6DC75AAF8FE1FCF155AA
            08F1F4FE7824017274A1D0123534F50F1E5FCFFEC38D2D7BE95407FD5A1AA09B
            8E780E7F8F1E7FCFC72DDDA683DFF4AAF5175D4D61791EC1EAE8BDDF5CEBBBB9
            C5876B5A2AF29708B806B1B20F91241C394E77CE24E499B75D943095220189F7
            6744AAFB89948263A8429A5F8DD8FDCB95DA3C877CC780076CE2CA91C92B491A
            9DEECA8A123671249EE6B131A3016624808D6F21CC857260C476B6449BAC353F
            945CEA0587F123ED59A0479010F2F2FF00BE44770056FD4D7AEF61BBAD472F7E
            BBA0E7AFD0F01A8351463EBA767F719D185D715183644967F02DA45D19829709
            166A019B0090135C91A471C3755D227597E193478A27BEBC1BE268BBEB3733B9
            7BAE5189E39E2489336726E08B332C5659125DAE54ABBC6094074B121963BDD3
            C9CBC4F18AD17FF9331DA9EBD08DC7A1E80E97B5EFA74AFEEE86F48627AC95B9
            0BDDED18EB2764F64FDEC9EC9BD9965A59F47A732F5397714B8A9974B2AB3B8F
            45F90ABC83C004CF2F2202E140F415BA6959E6DF2FBF91B95C7E2782438DD83C
            6811E1E3696002AA34A58C69210FB014490B18D740149615F6E038C6E3706F30
            B7232EB21EB7B1254752BA036256D7EA6F521C01E5E5C87D78F1FAFF00D7344D
            676F4E07CF9FE594B955D7534FF0AA073940B66241D3E954BDC7D2BF15D24DC2
            2AA0B2445D05D33A4B24A001935133944A74CE51010310E5110101F0101C7BE3
            669236F7E9550C56CC3F38E95051F05083F8CD6DD9D8222CC94808FDE8C95604
            45744AF0932B51E118CD0B88E06ADDCB56831F131C5495398E55562AE5011324
            7514EC1FDDF498591DC3D9D9F18719EF8B32CA76B6D2A8D198C063652C0BC858
            28B8054B7E65A88F6C2B7EA398668F6DDD0DAF7B1F75F5A9DDE0444047C38E7C
            3F7E72011ADEFA54AC0276B1EB5762AEA6294C5298A5314A6294C5298A57FFD1
            EFE314A629543790F1E1F987EFC7F1A5C0D4F4A8A9F96FD0BB136CF5CA2F6369
            74E5DC6E3EBBDCA2F6A535BC01575675DB164BB709F243B441C22ABE9086FB66
            B3246A9828BBE08933445351570521BA0FF6E3DF1C576AF79E5F03DC9B0F6973
            30987215EE50BA24861DDB5598AB33B44545813282C76822B09CDF1B93CA6328
            C292D3A9BAE835D45F5245BA5FF856B0F5D3E7D7A957818382EC12562EBCEC35
            616198D9A6A7E1CF25A9242D45771316F93AC59A09D4DCD47C21A4655D392AF3
            6C5822CE31A19572B97FA4CA5DDEBFB7FEE9EDFE564E378695790C6BDE337485
            C822E772BCBB45AC05F7FB892768AF88E45E211E44F8DB18FE7F702058803A5E
            F7EBA0D2A59BB01D99D6DD7FD1963DED392EC66ABF1F14552AC8453E41C16F16
            192454FED7ADC0BE6E0E1A2CE6C4F4A54D3583D48A49899639812218C1ABBB27
            B1B99EF8EEEC0ECFC280C79D239F9375818A351BA4721D92E5101609B8163651
            626BD597CE60626049C8997763A0FA36A49DA068091EE36E9F7E95A11F1E1AE2
            7934EE1DF6ED15B22D1DA7D928F8F98A2B0B04EA058ED5FA7E5D16723131516B
            C88334621C5C5BB760A2CD5029504E363234A6295E7DF0A9BA7CE5DCDC7DF8BF
            0D78FB14B769F03232BBA072F9594DB5A566575322FC3299508DC55E4DCDAAAC
            41711C5AB4F99FD6798900CD61FCB5D3D8B6B755B037523A8BDBEF7ADD0D87DE
            DE9BEAB6EF17BB764B51472EC0EB22EA1E36E31B68B202EDCA632CD92AB55559
            BB2387497A443DA49A1D4137F48008F866A0EDDF16790FBB7363C1E07B532A6C
            96E9B82C2A7FFF0064ED1C63F8B564F27B9388C48FE49B3940FC18FF0082935A
            5B64F99DEB7B9542374FD7AFBB8A7DE3732F0D0153AECABBB3C990554DB26A92
            A4CA36467A285478E50448DE5D28976A2AB26504C01448C7DD1C77ED43BEE287
            2B2BBBB260E321C71794B3C32845D9BEE59670A7DB724C7F20014DF5040C48EF
            0C6C890A71984729B4D3718EF7207F992BCC9B707CB67653D0C757E80A7753A8
            F2499D252FBBAA558AD764993E4914C5DB3A647BF9A99859860D8EA2C8A4E634
            C51702994EB24243816F1DB7FB6DEC783FA8725DED3774722B6FF92860CAC542
            41F70FD483B0AFA121C12BAA8AF57C9DCB96850E10C50468C591EF7FB7A5BAF4
            D6B2554BE28A87609142D1DB6DCBB57B6B6A2BE4A53F4EB64CBEA1EB56EF9BBB
            3BB6C642854B956E8BD047FA087FBF76F0AE4A437B8412A8720E2B92FDC9739C
            707C2F177038FDB3C3140BB10A664B60003FCFC886E2E6E40550574B35C5EBE1
            0F6E644F13C5CC724D950BFE65D823048371AA35F420743AFAD790E9DDAB5FEA
            EB3FC90EDBA556A21AE8BD6B7465055185D7B10C58924A4B56C0DAD6BB572A11
            842C5C79DF494B3E64D583727B48BD74A26A104C9B84D75333E5B8F3BB8FB4FF
            006F9DA934D2C9DE4D8D98D942404BAFEA2580C2D203A8DA892176F40ADBCEE5
            60BE0EDD83178CCCEE39B1620BC5A18FE3B12413B4EFB5EEDAB5AD7FE1A5659D
            130559E9DEACDB1DC0EE1DCDB40EDCDEB36CAEBB72C93C651E38ABC580AB1FAB
            346D4A2211B3B72E8B4C80709B3422E3917AEDC49AAE0A559E14A92B90CEEBCC
            CFF2877076CF8B7C63852CFDB3C5FCB0F1D013182CD2DA5CBC87964119B4D2AB
            49799F6AAEAAB16E318C942ABC5B66F70736E133A7DBB96D7D817D8AB74B863B
            76F45FC493735ADFB97E737AC705AF2E6EB5847ECF9BB92D48B1ADAE64A5284E
            E26A0F360908B46D6E0A61DBD338976088CB0FBCBBA3462B1E46ED1728AC2B94
            A81E6DC4FED0FC9F8DCB71ADDD5C7E2E370E93219FFE62391847752C00864B92
            41B0DAC3537DC3AD5B1F7771F38630C4D28B74D5751F72BF5A842E916B5B976C
            A113EB1EBF79648EB06EDD929EDEEDC6E75D57E64DDEA7A619D2553AD2CAB655
            F924157566B44C4E2493F5514E5EC0F111120A0D4CB8761F95F93E37C5F3C7E4
            BE6A54971388C7F8385C1B14067CA8D62CAFE6A6E27F94AA544A87646B37C7AB
            DD61187919BDC13E7E2631BCF95B3E6934D163165F690A3A5C7B6DAD89D6BB4B
            D6DAF6A5A928150D654288460A9D44AFC656AB912DCC7395A4545354DB372AAB
            282A2CE9D2A527B8BAEA18EAAEB1CCA1CC63984C3F93FCFF0037CAF73F33C873
            FCDE5B4FCAE5CA6491CDBDCC7D00002AA8165555015140550140036AF1D85071
            9871E0624768A31A0D7D4DC9D6E75249EB5079D50AFA9DF0F915DFFDB9B64838
            96D45D62B60EA2D0F0C9BB3290B2135151EF58A33ECD66CAA8D9C45271CF9DD8
            040A3CBB5EC6C4E73095A112275CF7F72EDE20F05F6878D3898D22EE5E79259F
            94247F315524474528DB80660EB08914AFB31DC15DE7D91A585B9EE5A691FDDC
            3E3D82AFA3961A9BE8E2CC375B5BFE075BFE6AFB2F6441850BA67AC157EF6736
            F357139B51AD6DB2F2D3EA524AE918EAC53108A8B41ECB2BFDEB33F70E954932
            15476DE2C1A002C8BB5C81F5FDA478F38E9F3399F26F7200B83C58B62EFD10B9
            493E79890C2C2150A1598325DDC8B3C40AFA3B939768B165C0C33BA67166FAA0
            36B0D46BBAFE9A8B7DEA4A7A21D598EEA8682AD5257611496C39A6ACA7F684AC
            62867847B6955A9514E311935413348C6D5638138E6CB1526C474089DD8B7455
            72B17344F9A3C972794BBDF3B9D8B7270915A2C58C9B848D55559BFE1C6C4CCE
            0CA77AEF50CB1925635B7A3B6785FE9187BE537CB9F590F4E97DA34246809E96
            EBAD6E97907878FE3F4FF0FA07866A4A9257C3B34DB7ADD7676C2E8C911B4244
            C84AAC65D42A28FB6C1AAAE4C0A2A7FE9210C09F0239EAE3B064E4B92C2C0407
            74D2AA0B7FE6207D47F88AF9CD2AC30C92B1D145EB433E3A215FB8D71B5F6949
            B774473B6F77DD255828FC00ABAF0F464E3B5802EDC481ED8444A5929F2922CC
            49EA4D545F82C0222B184776FEE0B2561EEEE2FB72191BF4BC5F1F0AEC2187C6
            F3C6B39166035D8F10275BD8036236AC5FB531F76365E611FCB99F4FC10B2F5B
            DCEB7EB6FE35B53D83DD559EBAE93D95BB6DE451682D73567F6159822B2683A9
            97C9FB6DA12BAC15580532C9D926DCB760D40C1C0B870401F3CD59D9DDAD9DDE
            9DD1C376BF1C3FE73366083A1DA002CEDAB203B1159AC596F6B5C548F33320C2
            C7972A76B4283EFEB6006809EA40E95CBB695A96C93F58774F6E2CEF64643B0D
            DDED8CF68DAB5F2E9A86524609FD8DB402AE6019B7700E5B44DB7735923D22B4
            314C1FA457190B6E11390B9FA37CF66F0707923B6BC6D8A90E2F64767E219729
            98B32A3E4C1F2C776706451142AC43A4AE2F3FBCA98FD9ACB20E4644395CB321
            9392CA60216B85DA148461B4595AE2CBEE00FB6E2E4D7569AC690C7596BAA06B
            88D54CBC750A9959A6C7AC64C13155956211942B654C42F25219445900880780
            79067E6A735C8B731CC729CBB47B1B2B22494ADEF632396B5ECB7B5ED7DA2FF4
            15B2F060931B12081DB7322D89D05CFE15EF33175EBAA1B9E0780E7F78F1FCFC
            7287EE6D5437B682E6B563B89D9B84EA868BB3ED17ACD39EB37FE3406BBA602A
            A11EDD6F534B91941C1B345B91574B908AA82E5C951299516A8280980A82428E
            C7F15F8EB90F26F78E076C61CA20C565792698D8AC51468CEC6CCC80B36DDAA3
            70D4DCD943118DE57924E2B15A793DD27F957A6E371A7436EBFF0063587BE3D7
            AC169D15AD277606E47C4B0F63B7FCC97656DF9C74C90249C1BC976E4791FAE8
            9209A8B2AEA3EA2A395CCA014C56E324E9D19B9126DEC229C93CE3E45E27BE7B
            871B8AED6C56C6EC4E222FD3E143B9992C368795772870242ABB4396611AA5F6
            EA8B8FE078DC8C66C9E479037CFC820B0D34DB70355363716BD80B1FAF5A9060
            0F487E3FEBFEB9A52D7216DED1524BEEAAF3C873F5CADC0B82696F4BD50DCF02
            01F97EDE439616D8001D683ADEF54F5703E7E61E01F8FEDC65EA3DAB63A55AA1
            8966B7B6AA23F4FA887F01FE396D9859B7FB47DAAA2FD6D4E447C7CBFD3F88F1
            CE5D7FCC2DA8AAD853D5CFD3FEFF008FEDF5CB07BCEA341402AA3E5FBFF8FD72
            E2C148FA53D6BF33AA44D3328A18A44D3298EA1CE6021489943D4739CC3C14A5
            214044479E0003282F2282A3AFA7D6A97014B745A825BA7CB948D7BB29B4E3A1
            63E933DD73D5FAEE6564889BF6ECAF374BE12560E2A11C42CC3A9518FF00B476
            F9E383FE9E468774945A2ABA57FE528A09F69F15FB56199D8FDB1939B9F341DE
            7CA4B7DBF1EF8F1D10BB3872B2EC2A6050413B099DA38C48AA4DE093F7AC2330
            C58B00931D54DDB7152DA0B6856E2C74D3D2E6D5997E322A964D9F67DF9DEDB8
            3993317B113ADABBA9E125DBFB4EA035750E4A6997DFFA9647DC2296D9D58EA9
            C1054CD154992074C043D27186FEE2391C2E0317B43C41C6A287E06166C97524
            ABCD90914A80061706352C490CC089147B4A945F6F0103E6C8799C8D75213F0D
            549D2DF86A3FEFADBDEE7F6C2B3D4AD46F6E6ED1653B7E9D3290BABE86ABA513
            7B6FB3AAAB46A1E96AD135E45686843C822B3F3A2989C0864D12882CBA206D61
            E23F18727E52EEC8B81C498C1C5C6A64C99F6AB08630091A33A6E6761B55435F
            52F6288D6CD729CC63F1106F9F599BF226BEF208BEA01B581BDCFE1D6B5E3A1D
            D4CB4404ACCF6F3B2E5929FED36DE45590512B20B659C6A6AA4924991AD56299
            B74CAD60E69E45268A6FD14794E35B9138D438224B9DCCE3CCDE4DE2B93C2C3F
            1878F6D0F8C38C63F1ED325F2646632BBB34BFCDF8D2567288CC77B5E6627F94
            B16278CE1F2E5CEFEB7CCBEEE408F60B28F896DB6DEC203165B0B91A741ADC99
            4300F2F1E78FCB8FE5F4CE76F5B0D00A95686E474ABB2B4AA08721C62A845C58
            D53F70723F873FEBC0E5ABB6E05F4F4AADEF606B5CBB65BFE13AC7D7CD99B966
            176447355AE3CFED866F962A48CD5D244BFA7D4E147803AA749F4D384BEE0532
            28745A1165BD2254CD937F1F767E6F7E778F09DAF82BEFC994EE2740B146A649
            5BAAEA2346DA372EE6DAB7048AF365E5C38303E44BF90741AEA7D07ADB5AD45F
            888D1363D29D458A95BB43AF0B78DCF6D9FDB93AC1FA0D91964584E0338BA91A
            4C120FB84DDC9D4E19A4928DDC8FDCB559FA892A54952A8913667EE63BB38EEE
            BF2872517099C66E1F8F8E3C78DECEA0B850D3D91D5594ACACD135EFBBE30431
            5DA062380C59E0827CA9E1DB3CE412B707417B1B8D3506F6D2A51C0791E38F10
            E39FE219CF6A17FF0088567EE09FBD5D97D5698A5314A6294C5298A5314A6295
            FFD2EFE314A629541F2F0CB5BA1B2DFEDD29560F3F8721F5F1FA8F1F500E43C4
            3E9976A16F6F750ED2877572FDDEEE9D41777BE44E334BE9FD5D5FD6953ADC4A
            2FFB2DD8FA3B062FDFC8DD26DABCB8AF1772AFFDEB284632F175E2913425C5A3
            D9193999D4507AA26D5A1B3B3FC67CFE478D3C3B3F76775E40CBE379193FFEBF
            8F62B134AD1E418A6759E3DF2AA8B7C9B244552223F1DF793519E4F37FA87271
            F1B8ADBB3A11AB5ADF1060ADEA02BEE5FB9DBF635A4DA0BE2CEBDDB9DD3B1699
            D7ED833E9F5374E4A92B0FB73D998C71DB5E2DEB472449536BFA6C09636A6607
            ABFB8E533001CC9C1998B872B02F2092296F7EECF3B9F1DF68F6C727DE5C401D
            EF9DF2B7F4C49577430891D63924C858DD0031FC7FE40CD216454FE5CBF1C6B1
            385C6E4B92E4D221FC805774BAFB9B6F40B716B1B8D0DADAFA8BCF340FC4350D
            8A51C858BB4BDB0B43660915B99896E546ACB672D13143DA8F55FD6B5F47DA05
            8A691144C0A7923AA09ABE90503D04E39373FF0073DDDD34992F83C1F1B02B3E
            ED63329049249BB594B12412428B9049B922D9C4EC3ED4592291F8E77DB7D3E5
            945F4FA87BE9D7FBAB22D43E22BA2B575D83F92D532BB06598BF59F924365EC2
            BF5CCAE3DD6EB372B2908692B20D6A45837072A289A6BB253D2B1BDC11139486
            2E3B95FDD1F9B797C6CAC29BBB845852A85291E3622587D15C41F28FC43DFF00
            85EB2D8DDBFC4622C47130FE3643A5DDDFFF0053106B7E691ADB5F6B2882C0EB
            9A3D4A890891132271351AFC557638844804A98033896AD501F6CA23C7F4FF00
            9E688CFE5F91E5667C8E473A5C89AF7BBB163AF5D4D67A49E5948676BFDAC07F
            85ABDAFD39E3C478F0F1FC7EBE03FF00E39E20588D45BFBEBE41BDA3D0545B77
            97B9D330EB9BA99D4E4DF6C1EDEED245C41C221555989E3F52C6A32114DACF6B
            B84E2FF70D2B8F22E1DFAC282A74954E35C015C3A02FA5145D742787FC59819E
            8DE46F23BAE278AB8F3799D892D3C8DEC8A148A2719055A42B76446B81B40DA5
            9D235CE72C2209C6E1497E5A6B6C16E82E0937236F4FA916BDFEC7667AABD5FA
            C7583AF14FD3CE2546C4EA09756E379B6BA5DEB42D9AFCF24C2C9396354177CB
            AE94635944C84688B8596149934408B194314C73417C99E48E53C91DF3C97784
            F02E3BCEA228E25B37C70AC7F12A6EDABB98ADCB36D17663B42AED51ECE2F8C5
            E37022C50754D4FE24DC9EA7FEC2A2B34F4441FCB376CAEBBD6EF329CC7533AC
            F621A4E9BD4CB1CC938B8D98F190D2B2773B4B43364CC8D6ACA83A6B23E81383
            B78D8CC5929ED20DDF24F3A33B933794FDB478DB8FED0E131CC1E46E7E232721
            9570C2148A4711450EB2C4CE124740E846D05A42048E9F1C7204C6EE4E6249DD
            B7C18A418D751A902E4F4BDCAF437FA7406FAB5F3ABB6EA0FEDFA33A91AE5842
            B66FAA08FAEF718284886CD9BC14C5BA2DBB1A1D5A3508D4FF00E0582B6E1FC9
            3A62936FF90AFA38E51309840B39FD9C768F219F85DD1DE9CC090FF507892076
            724CA2069BE773EFBE8FB56F2283ED6D8482D4EF3CF687E062DEE4BEE161AEEB
            6DE834B58E83F8D6F27443A81BC7A4DA8E3765C55623EEF71D914C46D1B3F593
            84DA572E751918A8C9393AE51236C893E9D6B668F23370568666A25EFC6CF2AA
            B86EBA8CD755A935B79ABCB1D97E60E7E7E0E4CD930387E3E62B8B91B5E64C80
            FF001AC8E622B1B425595CAB16B490D832A48AA1B1F81C4F35C56161F230389A
            4209912C8A6DADBDC49F4B7417047DCD7A8AC7CD0F5BB6AEBDEC346D754B76A0
            EC06A3D57B42E10DABB7141358395B4C9512AD609432D46926CB4DD7ADC56D21
            0C063B329CB24088FAD4645282804D619FE06EF3EDDEEAE1B8EE5B8D3370D919
            70AFC91BC4C0C4EEA0B958A67755D86ECD7017FD76B1A976273033311F25E3F8
            976922E6FD2E0FA0E8C2DA8D6BC0FC645F75C74F7E2CE1778EC47C66ABDF2C9B
            73663F62077033376B1B5B24CD4E023615ABB481507D3156A030F52A70068813
            D6EDC2A9B7051426CDFDC3F6FF0037E47FDC872FDA5C1E2179208B0A1162A047
            1B63453BB16768D4D8CCE6CCF763ED53D05623B7F263C0E0173B264B8258936B
            5FDFB06801FB0D07DCD600F898D693DDC5ECA6EBF913DF119F7536D6E44435CC
            4A8DDDA95D8BB3BD825E3945E1D77C427EA2DB59521765051627202881CCB385
            401D1880DA51FB87E58F8B7C6FD9DE11E0B276C72E3BB648F69731ACC93293A3
            10679CCAE592455F63A6D2ADB57CBC02A729CBE7F2245C8DB7EA2FA597E96DA1
            47DCFAFDFA5BE079FDDE5E5E1FB0670A11EA2A7E0800014308FE1E23F4E7FD72
            C61B9C2DF4FF000AA0274047B8D6877C866E796D53A2D686A8366927B17684C3
            0A2506116211C3A95B2CDBD65135E6AC18AA4320FD57972948966A90E25049AB
            B557E4011110DD9E07ED9C6E7FBCE2E4B93C858783E32369F21DAE155423DB71
            560CA00577DC2E2E8158A86DC239DD395262F172087595C851FDA3EB7BDFA7F1
            AD96D0FAA22346699D6BA8A0D32830A153E22BE6541CBF7BF7B20D9B82931247
            7726BB99072A4ACC2CBB93995389C4CA8F3C73C06BBEF1EE5CEEF4EE6E6FB979
            472D959736ED76DC2801634F6AA0FE5C6A88085170B722F596E3B0C606163624
            6B608BAFD89249F537B927D6A177E602EF63DF5B57ADBF1D9AA9F1BFBA3675B2
            26F1B1DDB4F7D50AEC2FBCFA36AAE255149EB66AFE221A31B4F59241929FF314
            B0CC544FD26552137517ED7B8DE2FB3786EFAF38771E3C878BE2F1843020DC3E
            67958A49B4A92410DF144ACC863DD235D87C6CCB1BEE8C95964C5E362606494F
            B87D2C45B5FED3A6BA7DEB2F33A344EC1EF3691D13A8DAB26BA17A4954ABD9AE
            648D74AAD1F1F2B1556B2C16A5A4B9059C9153D81C591FAD32B1C8450828C211
            43985571EA1C4C9CA1E07C21DC9DCDDD0666EF5EED9DD31D885B148B223FD535
            941408221F1A8210A33844522353179658133BB8F0716171FA3805ED63A593A7
            A1249B7F8FD6F33DC087894BC8F1C79F1E1CFD3F6F1CE4D25AC4EDD6A767402C
            351E95709B800E03911F20FF00B800E07A5F434B8B804F5AF396DB75728B599A
            B8DBA5D8C056ABD1EBC9CCCC48AE5419B166DC004EA28A1BC4C6398408421404
            EA286029404C2003EDE378FCBE6737178DE3603366CF204441605989D3524003
            D4962140B924004D5B2C8B146F2337B40BD436F5D9A5B7E447B551FDC6BB454A
            43757BAF8FE7A1BABB55946EA366F7ABD24FD58D79B60C828E08BB9087FB1F73
            DC3B50488FC1A3741515635F954EAAEFA930FC11E3ACEF12F17951CDDFDCE246
            79A3B4938D12149B1E0463BE26F91656B346FB82EF69115A48BE383F10077272
            ABCCCB195871F48C5FF3120824FE5B5B43D35D05F4379B32F21C00000071E5F8
            71E5F9F9E72380B18600F4F4A9D28F6D88B7DAAF0E70ADBAFA55C6A8203C7878
            8FE19694B6A05FED54BDBD2F411F01E3CFF01F00FE23C0F197B0F53D2A9E83EF
            50CBD8EEE9EEBDABDAA0E8CF4A4AC92B6D6E30B2FB9B6EBA892CB44545217274
            246099C93845D43D70F5EF4953907CB20F5759F2E2C18A647EDD40CEA4F1DF8B
            BB3FB77B1FFF0077BCBB0B49C0CE76E1E12BBA3659DCC86D24128911EE8C5118
            22141BD9F612521FDC7979F9596383E2A4DB966C58D81B681FAB696DBADEFF00
            6EBA1CD3D31ECADE5B68FDFF0023DAEB7A0EDEF58770EC2D7339B396ADA91436
            8ACD5D9C54C3290522EBB1C2CE766DA1A5548F4C221BAEA3F2A0870455DAAA19
            489795BB2784CAEF3E0E3F18F0AF0F1BCDE1C33E3E1FC8F23444AD9AF24EDBF6
            B15694B4A5552EEB7091E9F7E0F3B220C7E421E4E6BFE92C0B580BDC127451E9
            D3D6FA560AAB77B7B47B0FB61D70ACB3D6F55D71A1B793FB73AAED36CE2496DD
            760D6B5CAFCABD26D4B0B666FD14A8F0F32E85BAB1A87B4B01FED1D905570402
            2A69D64785FB078BF177927977EE56CCEF7E0E2C23314471043364CE2338CA44
            9B6461B591D997DA5949547DC89898B9EE4F2F90E3E6DFF1713396088554970B
            A5EF60CB626FF7B7D35A9A50FF00B797E1FE839C98486B9BD9854FC682C4EB43
            08F90073FCB2F26C2E05DBE955171ADEB43BBB3D94AE6A2D59B41551FBA06B49
            AD23217B5E2948E2BA45D5813F6A99AFDB389445D472560BDBF591F75151158E
            58715444A90B96EE09B9FC3FE3EE4FBA7B9BB676C03E4C9C8638EAC05A518FEF
            C87FF88876C28080D700CB601AEA4545BB873FE18A7850DA3551F21FF4EEB6D1
            6B6BBAFE9D075EB5CAF39EB7DDB736F0D2FA36644E6DDBD8796FFDA577145A3E
            6E4D5957B1A93CF88FDCC6374D049341C54915A6104942260C5AA4DD02FA1458
            C44FF4BF2FC91DBFDB3DADDD3DCF83133F66F6FA471C677B1398ED688C6A5D4C
            B134590C21264077C80DCAA02D5AEF1F8D7CBFD033BDE7CA2D616B5B69D7D40E
            9AFA69D2F5D9E10FAD3AE1A6D9A6F1EC752355E9FA3C7C715DBE38A6CA0EAD55
            8B6F1ECD3302499D55D72B56C9A69A49A6759C2C2521086398A51FC85D9CDF79
            77091144D93CE67E492146D5DF248D73AFB5116E49249544517255469B9218E3
            C3C40AC6D1C69A9FC075F5A8A2EA4D26CBDF0EC1C8F7DB7246BF8BD5F449AFED
            FEA9EBB745769B1042BEA4AB191BA4882EE1249FA8D26841703834282B3887A8
            AAFB71CD899D47E51E5F13C25D863C17DBB32BF73E500FCD4E16D70E567C7882
            B1954318A4452F148008917702F29F8E25C445FD6793979E9CDE1436887E00AB
            1F4E9F71D4FDB59B201E39FDBF8E71FF00BFADB43E9F4A9AE84D87E6ABC47C7F
            D3FEF96F46363AFD284D504DE1C878FEF1E3F7F8F1F40CADEDD47E3550430B8E
            954308F900723E1C073FFCE5585D4E97FB74A6A05C0B9AC5FB73746ACD114E7B
            7CDBD7981A0D5191BDB3CACEB9327F72E04A6541946B16E9B89297903A4998E5
            6ED115971214C6027002219DEDBED9E77BBF96C6E13B738E7C9E51EF6452A340
            09259DD9514000925980FBDEBE19591062E3C99392DB605173D7FD9727F80A89
            CAE6BEDB3F275B869BB7B77D06D3A6FA65A7E68961D49A7EE6CC185D376DAD35
            8166578BBC5ABEC2F0F580649241F6EA26A9564563B666BA8D977AE5CF46E772
            DDB5E07ED7CEEDEED6E623E47CADC8A2A6664C61D178CD9B0B63C64FC90CECDB
            A44DC85191D77C815D638D235C731EE39E3E4F252D81131F8E33EA48B5C91B4E
            8406D4107A0D2E4CDA007978F3E1FE3FCF39548BFE152CFAD54038CAF4D05500
            B557155A6294C5298A5314A6294C5298A57FFFD3EFE314A6294C1FC695F98F97
            FA0F21FBFC400472D56041607F8FFBAAB7F53D6B948DEDB43704576F3B25F1E3
            A7DDD6AA979EDD6D18D6B3FB866675D0908C2C555B4EC497805147D24F08C903
            D66DC8316AC9BBA6EB198C30C43664A3C7E0E83F477B778CECF9FC59E36F2E77
            44B34FC276DE0E418B08A392D27C91E3465648BE32AC3220120778DD37497674
            863464D6D2E4E7F1B9FCC8831C37339A62B4BB957F275F610C9AA1DB6D3A5EC5
            8D749FD7ED0BAE3AD1A96A7A6F5543161AA352666451F5985591979174A0B994
            B04D3B3FF5BD999878732CBA83C10A23EDA654D222699383BBDBBCF9EEFCEE4E
            4BBAFB932BE6E5B24AEE3B510054458D15551554054555D14136DCC4B166334E
            1F8BC7E27021C180EE4D493A8B9249BD8936FA75ACD1E41E1C7D78E478E7CF9F
            DD9132092C36D87D6B2BF8E80504780F2FE1CFEC3F5CB8EE240534001362DD6B
            1DED1DB5ADB4AD45E5EF6B5D602895262BB76AACE589E9593551EBA1383660D0
            80551CBF9071ED18536E826AAC702184A5102888667B7FB7398EEAE5B1784E0B
            8F6C9E526364452A2E7EECCCA8A3EECC074D75AF3CF3C189117C97B281A9D7FD
            97A88E9AEE376B7BD476D54E80EBE9FD65A95CCAC9C7597B61B35841316CA378
            8965A35C128B5D915A44C255D668631BFE07B3029A9ED2ED2254FF00C9274DF1
            FE2DF1CF88465E779CB955CAEED8620D1707089AF28703633E6E33944B03B806
            2A87695DCF7B0C049CE72194817B770FE6DC0DA72CA82320EBFCB916CFA5FF00
            C74A900EA6F4EB59753AAAE59571490B9EC8B2A69AFB2F735BD55E46FBB0E585
            759E2CAC8C83D7722E63A0D27CE9655AC6A4B99144EA9D650CBBB59C3A5F4879
            23C97CD791F914C8CDB63F098F75C4C44B18B162360114854323D9543C8CA0B5
            8001115117EBC2F06BC63CF97933FEA39698DE598AEC321BE9EC04AAED1A580D
            7A9D49AC9BD90945607AF5BDE7523A89A90FA73664A26749C11AAA43C7D2E69D
            14E9BA394E46EA10C9725389440821CF1C646BB4A359BBB3B6A273656CF805FF
            001952F521171BFDD65B1B1FA687FB6A17BE34F72D1FA99F1113DBEE4A353792
            30162DA12D2CC4576CD0F76D86A5C14A7526108F9847AEBA08CBFA21E3C5CAE4
            7266CDCA658786C99534FAD7F701DADCB792FF00736BD9985301F3C38CA86C3F
            950AE289E66D5943B28595C02CA58ED8C11A1A8276AE56361F199BC9E437B1DE
            EEF63AD8903DA05C6A6DA0FBD699FC52F5C6CBDCAECFDAFB8BBA1F296681A65D
            0DB05DC8B96C819B5DB6FCEFB73B5B6ED814F5A2DAB75264AB79345B342A48B1
            1422D1440A8FAD30DB1FB88EF8E2FC51E35E33C5FDA31245979F8E62DBBDDDB1
            7150AEF20C824DE66BB46AED26E51BD92ECA0AE170206EECE725E42737E3D4FB
            FF00F39DB641FE561B7683ED1ADBDDD75EB54038F11F1E380FA721E21CF8F9F8
            8F9E7E68D94D80EA2B6A004580FF00C6A12BE64BAC9A695EB0EDAEC547D523EB
            DB8A08B526A4B743A0462AD812B25D69956952DA41044E32464ABAA2854961F4
            ABEA4924D539D028A79D71FB54F20F789EF9E0FC6E3982DD9F9A7219E0654608
            62C69A7531BDBE45BC88B750E14DC92A4EB50BEE0EDDE2D09E722C3DDC825EE3
            730DFBACBA92DB46D524F4D7A75A8C7DD9D4A8FD07F1934EDD7B3769EC0D9B6C
            BE6BCD6555D574A9091711547D4D0575518ED19B898E8F4659F2D38AAB5B827E
            8AC4F5B662FDC2E43ACC4EAA2DFD9DFDD8FE4F6EF4F3EE5F6A701C2C381C5C6F
            94D9D282259339F1A16C785CEF48CC1F19DB6F8C97755DAECCA4058EA715969C
            2C79F9DC917C686FF1C1B0008247D47C8A7735CFBB506DD05ABA32E8668D3F5C
            FA91A3F553D6448FB043D31A4B5C5029132A89DD2D4BB8B4DA9054C8AABA4A0B
            09A9859B104A712024890A40290A52870D799BBDCF90BC9BDD7DD25818E79D52
            3B680C70449046DAAA11BD225720A820B1B8BD4DBB5F0861F138E08FE6BDCB7E
            3736F5B74B74FF001ADBB1E03C47E9FBFF00D39CD565C827D3FBEB3CC14EADA8
            AFCDC2E9208A8E1C289A08A09A8B2CB2AA153491493289CEAAAA9B8226990851
            13088F0001E3E197DB73A855BBFA55CCCA80B1E82A263504A21DD9EEA59B73FD
            82CF3477529D49D0B5C3858CE08C2C9BA57076CA6A75B18156A574954A01D28A
            7B2B3713A2EE4D0318C22DD110EA2EED81FC45E23C0ECD8F363FFAA3B9409B3E
            2B03241042E8F12F5751F237B4323286113DC16B88A11B23EE2EE08660A7F438
            770DD6CECC3DBFE9236B0BE97BE97D0EB27B7FBBD735951AE5B1AE2F4232A543
            AC4F5C2CD22253280C606B716EA5E55D026501515320C199CC052F898C1C0673
            5717C764F2FC961F1D809BF3726558D05C0BB310AA0936005CEA4D801A936A9B
            5E38E36691B6A01AF53A57301D60DD0844CAF653E59376B5090D836EB2496A5E
            BB5081D3855EBD91930838F918A6292481CEEDB53E1DEC3575B3A6C6301552C9
            954226270397F45FBE7B5F279483B1BF6BFD933CB1F0D8303CFC9CE400ACA4B6
            5C3B848C2ECF289652892ECDCC87408563D6093EEE632BBBB918429886D852F7
            DF74319D57F2DAE356524DEDE97A9CAE8275C6634169B712F7F13B8DDDBB668B
            B5F74BB500BFF836A978E68D63698C80ABB82A51140AF356D16910A714CEB22B
            AE502FBC252F1CF9A3BFF1BBF7BA8C7C42BA768F1C820C288B330540AA2492EC
            A8C4CF22992EE3704D886C10012CEDCE3A6C3866CECB4DBC86510D20D0DB6DC2
            EA095FCBAE805AE41B9ADE51E403F6FC7F201CD422F7B5AFF7A925AFA0A843F9
            6AED3EDCAABED71D5FEB2CBDC22F6E5D5190D816E98A02651B1C3532B2CDEC8B
            3886AECAD9DBA68ACB0453D937A2DC08E138C88301C41BB937ABADFF006D3E2F
            ED0E6B1BB97BFBC958E1BB4B08C3046B27C8125967768B77F25D652524314696
            564779597F325D633DC5CF67F1621C3E26DFD56604AB594EC0B627475643B977
            0D6C47515171B5BBFF00BDBE42E3746F5A35DD725E75C28DEB31FB7D181F6232
            4765DF23536CC26A65CBC8E4E19855A80E9D2632044D051A8A6DDD1CCA2A9148
            90074778FF00C3DD93E17CEEEAF2073BCAAAF191DCC1315940C485CB8D814492
            BCCCEAF1A5D9188D9700924D4539CE7790CFC0C7C18313E3E4E4B065DCADBEC4
            5F5DA11741BB423ADAB797AF9D63F955ACF6DB5BC85DB6A556AFD76D6B226347
            EAEA65E82269E8EAD6458D8461555F56D5AAC9D6BED1EC0C9BB4A156927D232C
            32502E5670BA6029395B97BBAFBD7C37C976F775C78FDA9F3770CFA419AD2E41
            91E56258C86364558C47ED054109665541B46D59241FF50E02F1F81818C21E2F
            5BC5BA36DA2FB8FBD8176DCC49EB715D0E0788F88F8FD7F7887E5C078079672D
            B25C827A54B86EDA2E2BF4F20C016D052AC30F871C73F8F3C87E03F401C100FE
            63EDAA8FC6B5D3B5FB8D1D19D7CD9FB1D2926B172D110EDE16BB20F051168C2E
            16F928FA9D49EBE2AE8B94BF4F8F9E9D6CE5D7A933815A24A1CC51280E4EFC67
            DA53F7D77C76FF006CA2D9322562FD4FF2E28DE69458329B98E360A030258800
            DCD78B2F9187031723308DCB15AE3A6AC428D6C7D4FD0FDEB52BA54953B40F47
            CDD8A5680E638F73A7BBDBF24D60A3A427AF365A290D26FB583CB6BC6916A4CC
            B5C2568EF9B4ACEB97091D36B312722B9CE4400C72EC4F2E6767779794FF00E9
            21CCFCD8B8B90B8B1B10111256D9FA9D91B15B013068D14B12CB1C6A18E951CE
            D8C1C7C3C4CAE4CADA5C9F731D49213705275FB93A01D4D6AFF4B74ABCED7D4D
            8DE36C479D6EA3C7592D9B1ABD4EB2B764832EC6ED3B34D3992B16E0BE324142
            B673AF2089EEB689895132C73A31CEAAA470545354FB37CC3DD7C678D39ECEE3
            BB31C47DFF00363C704D2A6FBF1D8C228C478F0331659249A3605A604B4646E5
            DB218FE0C4719C76673D8EF1E70B712EF7987B4FEA9836E4240B3442222F64B6
            FE8D717BE7BEABEBB95DF3DC9DC1DE5B757C20AAF5CAF37D07D768274BA6BBC4
            EB10EE5F2961BBAE82242271CA4F35769999A5EA151A2726F9AAA422A99CC785
            79379083B07C6DDB1E24C0C863CCCB7CBE51946D47669049045A83F20436F72B
            007E28D88B9D91E5B0447CC732392C74BF1D8B7589F5FE617501CED3664DA74D
            41DDA9160759641E47F301E3F2E3CB91FC4739A411BAC7F30A987B815B0FC6B0
            2762F6F3DD4B454CF568D2D8B68DE2511A3EA5A9028D487B05E659BB851A0AA2
            F1CB26A11500C5B2F26FC545912FDA343901429CE4E65FD87DB789DCDCDAC3CA
            E6FE93B7B1C7CB97394771144A09FCA9676690808A12E413BCFB5588F266E62E
            063364BA6ED400B7B5C936EB636FADEDF6A845DC50D0F64BD46E91BACD3F9AD2
            9D518DFF00ECE779B643A145CB8D93B41AB41998BD7B2EE502C6C6BA732AA38F
            B56ED089B6299BAAAA8926404C825EBBE0790C9E23819BBEB88C4FD3F75F7031
            C2EDDC787518D040C61CA937BFF2C5D0EF7F99136EC8C26DB0F875C491CB940F
            1F9393B99C86CA98802E57DD18D834D7451B08F526F7D7317C436A69DDA933B8
            BE46B6BC5A485F7B1566B137D78D7D4F154ABF462CA110B01E37EFDCBC788B37
            3290EDE19915450C64A36092F40811710C857EE3F9CC7ED2C0ED9F05F093C9FD
            3F84883E531EB2CB3AA4F086BADC15591A5608ED11332FB55A20A923E2E0FEB1
            CC4BDCD9037051B61F4B0DA51FE87EDEE5BEA6DF5AFC3B073169F91EEDD31EA8
            505FBE0EAA6859D6760EC1DC2BEF85B32B45A22945D052AA49A68745C91C3599
            49C43B36A998AA83F6B232253731AD4E399EC6C3E3FF006FBE315F28F30ABFFB
            8FCDC4EBC544C1AF146ADF1CAEFB4C9110524499D25456168E205646629F0E7B
            227E7DFF00E9EE2E4B6303FF0030F61FEA56400300742B7051B5BEBA0D66FAAF
            59AFD2AB90350A9C3B0AFD62B1111F035D818B6E569190B0912D116319151ED9
            30F6DAB260CD0226926500021080001E19C779F9995C8E664F219B2993366767
            7636BB331BB1D2C353AE82DF4A976262E3E0E3C58B8D16C814682E4DBD4F524F
            5FBD7DCE444780F1E3CC3F7F1FC7FD33C22FB36EDF77F857A2E0DBEF5E6EC771
            AAD4DB0BBB3D8A1E05BFA0C729A55FB767EE01448537B2554E55161031CA1C10
            0C3C8806643038DCFE4644878EC579A426D651EA7A5CF41FC6BCD919B8D888F3
            CF305892D73627AD80D0027A91D2B472C9F249A3C2D2FA85A92AFB6FB0F78627
            78DD482D41AFA5A51A11CB35136CB2CE67E6CB09144836CF57492712489DC334
            4540E4E61F01DC1FFF00CFFDF7C771183DC9DDC31386EDFC864DB3E44F09366D
            748A291E4DFB41223608E7691606B1E9DC1C54B2FE9E2999E7FA057FF1B016FB
            D7F036B27C8EEDF49AAF1941D35D56AE4911AA8A85CEC2B6E1D9510D55338055
            618CAE250B5270F4CDC0863333BB6A64044BC3A318544D3FBE671FE0FED2CE65
            8F9FCCEEB0A2D68E19B8D849B29D59DA4945892A0AAB03662401B49F349C9F70
            4DBD31BB756300E921C846DD7F5D9B7DB6FA1BDEBDFD3FA41413D8185F77ED9E
            C7DA2D9314F5948C0D836C24C8F57A63A8E302ACC689ACE2C8852A09566F3D4E
            117EE5BC84D95538F2FCC42A644F03CC795F9718BC870BD95C747C0F6B64105B
            1A07F91DC0036FC99522FCEE46B7B322B5EC56C05AC6EDBFD74B8F3770669CD7
            849315D04623DD6DD61191BB76D5FCD7B5B4EA6FBAE52F03FBBFE839AAB5D0DF
            F8549585D831D7E9F6AFD314A6294C5298A5314A6294C5298A5314A6295FFFD4
            EFE07F2F1C550DC0D05CD539F0E7297D4023AD57F1AB4C6E03CB9E7CBC78E78F
            3FA787195371D356AA1245AC3DFF004AD2DEF576F60FA7FA59DDC01AA73DB2ED
            CE16A9E9DA395276E9CDAAEEE1A28B22759A30417787868344BF72EBD2043383
            FB2C91383B78D887DA5E1EF1866F953BBA1E121730F17021972A720158625524
            5C178C1691804501AEA0B4962B1B5B1BCBE71E3B8ECACB61665B05F5B926C3D0
            FF008546454FE1723B6E75F24AC9D89B94EB4EE5EC59E7FB2A5766B7937D2A85
            3E6A49EB9938EAA49C233928D849A222AB907720E1A95BBB6B26714E39E159B6
            400FD09C8FEEB65ED7EFBC083B038F1FFB5DC720863C33B50E42AC650BACD240
            F3C2A18868909276A8DEABBBE38F0383DBD164F093C5C8C57CD9EC4FB8FB6CD7
            03DAC031D2E4E9D6DADAF5756FFF00F6AFA651B1B504EB548EF1EB68915418D8
            1F595A297C8F884BDCFB78C75392AFAA97C91925813F5FBAF23ECC74CCA0A5F7
            42404C13C7E743FB5DF2744DCA27332F6673ED27BE030E5E5A4B703DE197FE5E
            251F45319363741D4E34E2F73707B21C7CB0DC6ADECBB50DAE6F6DC4973A9BFA
            F5FA57AA3FC9FF007DDDB06448EF8A6DAC49555BFA1751F5AB6120DC24903011
            CA62C57EBD34F613398BCA3EB77ED180C1C2E627FCB98A6F05F86E36791FF719
            80D08D40182D7B7ADBFE74FF00E93F6157B772F26E6344C6208FCC6D7B9F4D36
            8B57D891DA7F36DB85C8D7E95A0F48F5BA29D9D42FF7FDAA7EBF6D916492BEF9
            5BAC662BDA6C27645401A9BDC00AE499D53AC8FA4A9905450BF4C6ED3FDAC769
            26472DC8F91F27B8E744F6E0261E762FC8D7B5BF509B54100EE04C88BA1BEEB8
            154966EEFE41521C29443BBF39DB11D83FF8BF35F5FCA2E2BD6EBAF8976F74B9
            A9B5FBDFBB2E5DB0B80C93F918FA44A4ACDC46A584FBE4998022DEBC93F48C64
            9059B1BFF0E3D3888551238A4A471CA27F562B97FDC8CDC1F18FDBBE19ED58BB
            6B896FF88C1D72A794FA12F3C6DB0EDB8BDDDC5C90E0DAD95C2ED5C48324F239
            F219B2C1041F72853D3A0620FD3A5BED5233AC2C30907B1B61E82AFC14656EB7
            A9EA1A92569B0B08D232360E12A96E8EB3C147D6E1A1E222E3DB4546C3BCD7CE
            0E9A263AE6295C801453441248BA479DE35E4EDEEDCEEA9B2A4973B90972D662
            F7277C0F1D9B71625B72CA01B05036DB53735988735C7219987280B1811FC634
            E9B7DDD069636EA7D74ACFDC080721E3F9FF00F3E390C17BB122B2A6FF004B9A
            F8B65836568ADCF56A51305A3AC50D29072289BC0AAB29566BB074988F03C01D
            BAE60F21F3F2CF561E5CB819B899D0E924322B8E86C54823ADEFA8FA5501B5D8
            AF4EA2FF00EDAFF3F48BBA6EAB4C255BA0F12DD67E4A7F61ED4B255E8B3BA234
            B2ECB9F7F114341A811FA4DCEDDAC44C443B463D4315B8361977CA3904C530F6
            BF65F1F13B3077173BE61CDC911CD2E0421E760E463C1046CCC4002EC24054C9
            65DB68D0817059B4B65E3CFC7C0CA83E5803E91FE5DC5AC3F35C916EA34FA8F5
            AEE43A8BD7180EAB683A1E9E8533375210914D9D5CA7D93751BA569BC3C6ADBF
            B96C054165165506CEDE23EDB544C6116EC92451F24C33F27BCA3DFF00C9F937
            BCB96EEDE500469C858E3163F1C2802C4970ABB8851766DA3731636008036B71
            3C7C5C5F1F061407D82E7F89373D49F53F5AD9710FCB9FE3F4FAFF002CD7CDAF
            5D7E9592FF006544D7CD84D2F0FF001F5B30E828DD3FBCB76AB456FB96E0E135
            9067B060268ED80A2A26043B9FD24130110301F9F40FA40FEB2F4C7ED2608E7F
            37F6EB482E22C7CB6F5D2F8D2A5FEFF9BFBEB03DCEECBC2E60127C6C4A6B6DDF
            E75AD16EF9B415B4EFC4274F5F22C64195CEC5A48B644E540CEDABA4AA90BAD3
            57B566E54481062F1B3F1D9CEC4FFF000087A924C40A5F5026A6D0F0A1C7C3EE
            2FDC1F94629993278A13345B403B9677CB924EB62180812D7163B8DEC402B1FE
            7659A0E2388C631DDA4B122E35DBB7D751FE6FFB6B5D26947F110FA721C790F1
            E59C2E1B71DA459FD456C0EBE9AD50DC880FD38FE79703602E2ED568BDD48372
            3D2A297BD5D9BD8129B0AA3D1BEB431098DD3B75A3B657BB387BA687D5149948
            D12BD7F2EF106CB845C9A300F549815BD6559AB76ED92226A38946203D31E15F
            1FF030705CC799FC82EF1F68711247FA78941DF9991B880B195955D764A234B3
            466372EFB9E358647588F73721948B89C571CDFF003B90587A1B00475B823D4F
            A8B5BD6F5BF5A1F48D1BAEDAA6A7A8B5CC7998D6EACCD5282CE14517909A9890
            72B49582C730E5651551C4BCFCC3A59DB83720429D5F42652245210BA47BE3BC
            79AEFF00EE8E53BAFB8B23E6E572996E76A200A88B1C6804688B648D156E1416
            B6E6BB331324C3C3878FC68F1A04FE5A8E973D49B9D493EA49EBF6E95137F36B
            BFDF416A3A7755696E1BFF007AF6064D290B3AEB396ED9AD73595365E2E4977D
            32F155DBFE931D3D6749AA47742604423D93F29F800E73A3FF0068FD991E6F77
            67F7F67B6DE2B8742ABA33169B263922D0236EF6465AF747077800022E23FDD7
            3CA9878F8718B3E431B2E9EE11952753D2DA1EA2FD35AC7FF1EBA4E17B1D6DD6
            1B552AF4CC2F573A8718D293A22B36C2335E57676E9648A52B77DC36041B82B0
            FED572ED22F5DB151A89CE49E59531546CA3676D4D9EF3A774E7F60F15CFF686
            4E5264790FB85C49CA3EC03F4F8B1B28C485197F94CD2E3AC6AEC96DA8AC1C16
            68CC585EDCC78791E45338215C3C416885CFE675F793EA75BF5BF5D2D6D7A05F
            A07871C79073E5F4FF00000CE26BB0B0BEA6B618BEDD069F4AF8B63B14354EBF
            3B68B0C83688AF56A1E4A7A7A5DE1C5367170D10C96909390747021C48D99B26
            E750E2003C14A239E9C3C49F3B2F1B03123DD932C8A88B70373390A05D880352
            35240FA9AA920076FF003017B7F0FAD70E96BEC0EF8ED6F6C7694BE8A8E9C7BB
            6FB0B6590A4D4C5994529AA26B772D490A10F1EE048AB5AFB96DAFA2126B3526
            63A4934687903A805F78452FD78E3FB53B43B1FC51C1F03DD79C9176D7051893
            2E42B215696598C91B94466727F5326E458CBDA428C02ED5034AE699F2B917E4
            4B969263ED16D6C005B69F616E834A95EF86AD2297577B67DC5EB56CD655190D
            C948A86A797819A884CF2442D69C7EB72B6956B72F24C5BCAB58D916977AA8BC
            E4A819E2C9A62A24028938E5FF00DCDF7043DEBE36F1277DF072CABC2E74B9EB
            2235D4EF592248C3ADEC4A18261750541E8C4105A69C147FA1E5F92C19210242
            10817BFE517D0FF1BFA574155362FD49DBBD99FB868E139A9B6F195E2251CF23
            DE46D62AF1E8450C64A1DC48BD6F26E54B99A6DFA0ED145A10EC5FA090A66322
            2BABC619AE7F4F83865405894B1FBB4966DD7EBF9020B5CFE5F4B9A95E3A2B4B
            91960583D87F669FF6D3D6B17F687B3BAFBA99AC14DA1B0DB4ECAB2567232B10
            75EAD231AACED86C12C574BA11EC0D31230D0CD41BC7B072ED759D3B4122376C
            A7063A9EDA6791F61760F37E45E7E1EDFEDE8D0E618DE425D82AAA20F71F7117
            3A8007524FA0B915CFCB8F8EC493325FF86A40B7DC9B0FAFE3597E857688D8F4
            6A6EC1AF11E920AF356AFDC2153926C6632448AB24535988F248323FACECDE95
            A3B282A90888A6A00979F0E7237CA71995C47279FC567285CCC699E29002080F
            1B156170483660750483E95761E4A66E2439717E47171FDB6F5B56967C8F6DAD
            9FAD745C4D7F475B22AADB976E6C0AD6B5A57DCB54DF4E492134670A59D0A8A4
            69162AB1B2A3048A8668FC1377F66E0C988A40262AA9ED8F04F6B76FF7277C63
            CDDE78DBBB2F0A1966CB24C8B1802293E10EF1B2B2DE501AC0FB951F70D81C8C
            4774E54F85C1664D8926DCC25153404925D41B5C11F9776A47F7915CD5774FAD
            9B03AF3D83D7FD4D88BDD966217B40AE9A9EB3306F3AE5F2165B9BFB038A13A9
            0548F1CFEA0A3F6569997FEC3E57D978E9AB820280A1910F6FBE7C63E53EDAEF
            CED95F2072BC547067F6E8CA8EF73FC981D6F60CA88ACAD0247B815203A16013
            4AD73C870078693E38814866DBEA5B51A742C4E849FEDF5A9BFEF9C9DBF77546
            CBD22EBB49AF5187AA436B780DA9778E7252C5370B64DC754E93A4DA3A60E519
            5652521EF23212A74849ED4537325C2C067089792BC2D89C1F6AF25C7F96BC83
            8AD91FAC6CC7C3880203B42927EA72498EFB3E372238F725BE4752A3A3C729EE
            69A6F8071985AAC6144DE96DC57E31AF5BEA4ED3D058FD0E6EEF1ED48FEBD689
            A075EB4E47A4C2F7B3BFB734E69EA44300A07244373C456D9C3B33A45706888E
            55170D63CEE8C928466C5470E843D0D5412463C1BDB43BBFBCB95EFAEED2BFF4
            E713BF2F3246D07C922CCE8DB63DAC36BA34BFCB53B4A2AED0AD71EFEE791F1F
            888F071A4F8DA601435B758295D2C7ADC69D7EF5BD5ABB5FC4EABD7B4FD7704A
            2EE236A704CA25378E8DEA7928E534C5591987E7139BD7233322A2CEDC1839F5
            ACB187CB34A772F3F99DCFCE729CFF0020C5F332A5DC6E7A016545040516440A
            8341A28D2A45C761C583858F8B1AFB1069FC753EA7A924F5AF7E3CF201F5FA07
            887ABF8800F1C660D8AEE5FF0050AF61EA35A87FD9FD87A3C5BFD8BDD4BE4A24
            DAA5406B71D37D3D8176F0BCDA2C118D2553DB5B5E262CA0A90D253AFA2D48A6
            0E1614FD988893FABD917C3CF51F6BF6073D993717E23E2639E3E4F30C795CE0
            2136A22912E14058B25FE38D8CAD1C725CBC858B318CAC50D9F90C7C83C8F322
            D262C015616D46F2C2CFA5AEB663B6E46A0696BEB12D64A76DCDAA3A4FE3FA08
            B235EDC3D9FB70F667BB2E05255CAB4F82937AC64A8753935951006CDB57EB68
            A4245CC7382A6452C0B45360588BAA620F4562735DB7C2F25DD7E6FC957C8ECD
            E071E3C4E0D59CC4267746C7CC28AA0C81A498B46A678587C7FCC5DB1A5E38BC
            2325F078DC58D76F2798CED20D0DF6B5D6E4FB459483A11AE9A9EB2BBDF5ECFD
            2FA35A175DF52B46CA33A96D0B651E1F5FEAF07130D2353D6D408E6E15D1BCCC
            CF4A1926CCDD19BC63945B3E5D527B6E127320731C19992579DFC21E37CDF30F
            79733E41EF2BCFDAB879066CD61AB4B34A18C712C5132CBB0B017112300A1625
            5B312930EE2CCFE91C6418B891FF00CC4A2C897F452BBFDC6E2E2FEA45EB17F4
            FBB29D6AEB2EAB8ED27D64A5EDEEE16CE7124A496D3B868ED613C7AE4ADE9F18
            8431E7EF9714EB90A94341C403664CDCA675D31668A2AAA00AAEA9873BE63ED4
            F22F7EF74C7DE3E4518BDB7DB12284C55C8CAC79CC512A80DB63C77F92491DC1
            77DC8ADAEC04AC68A3C181CC711C5C0B8988ED3E71FCCA15C5CDAF6DC54ADBE9
            636FEDADD26D73F91ADA2532B07A8347F58220E44FD95B675E9C6E6BAA9EE1D1
            032E9C1EBD6D135663ED13DC50535A4963A9FD29882461139353721C3F85BB5F
            271D317BC337B996D7611624BC7463FF002969DDA4FE2AA47F857BBE5EE6E44A
            C91EDC1C7B7AEC989E9F85BF0AFEE5BA93D82BCA0E52DC1DE7DB0F08E08AFA1A
            68EA351749346CB1DCA6BA43EF3A4B63CAB923548A291405C100E51F5183D5CF
            34CEF23F6263AE2B767F8870F07223FCCF9399919DF2696BED710AA9D2FA0DBA
            91B7516FBA700D977FEB99CD9487AA85F87F01746F4FEDAF7D09D0FEAF46BA4A
            4A775C0ECA9827F5A92BB7ED16EDB065D7FB970E88E4D177F9E9F8241CA4A393
            010E8B4484A502807814BC62B37CCBE46CDE34F0E3B84E3F147FFA58F0E3E3DB
            EDBE18924B7D8B9BFAD7AF13B7784C1646C4C1DA16F605E47B5CDFFCECDEBAD6
            D6C3C243D7A39B444045C74244B32024D232299368F60D5228001536CD1AA693
            7448500F002940335ACF913E54AF3E4CCD24CC75662493F893A9ACD5FED5F47D
            1F9FF20CF8585AD6D2A83EFAD544BC8F3FE9F971FE3953D34EB4D2DD29C0F3CF
            3FC38CA585C9B6B54D6F7BFB7E957656AB4C5298A5314A6294C5298A55079E3C
            039FCBCB15437B6835A78FE1FCF282E7A8B5547DE9C8FE1FCF2ED3EB55D3EB5F
            FFD5EFDC7CB16BE94B5F4AB3C7C78F30E3F6F21FA6505FF285B55030B74B9158
            DB6FED8A4E8ED6F6DDABB0A4822AA54C8C3C949AE5295472E0E75126AC22E350
            39D323B96999170935688898A0AB958851314044433BDB1DB9CCF77735C776EF
            098DF2F2B94FB516EA01B02C4966202AAAA96624E801F5D2BE19795161C2F3CE
            D68C0FEDB7E17A836E8A5A23FBF5DBC9DECAF60AE14556D7ABE3A4D4EBBF5A0A
            F993BB0526A649362AFF00ECA731892888BC6D5E5A699362CA9D25977F34E0AE
            8C5628B588487B03CCF812783BC738BE32ED1C394E0729B5F91E40E8B92E8FB9
            22113BCAD13FB46EF8D913E3017F985DB641B173313BA79688E6CA1521BFC78F
            627AA8DC7E4017D406D6FAE82C3AF425C07980788FF1F2F21FF0CE22522C074B
            D6C0EB61E8281F5E7CFF0021E3F1E7CBF7E5ACC53D6E6AB7F4BE94F4F3C71E1E
            001F4F20FF000CAA9BD8A35941FEDFFBAA8CAA6E08BD538E3C78F1F1E079E3F7
            F3E6180801BAAF4E95517DA431B8AF836AB4D728F599FB95BA658576AD56887F
            3D619D945CADA3A221E31B28EE4245F393FF004A4D9AB648C73987C8033D9818
            195CAE7E3F17C7C264CF9DD5110756626C05C9007DC92001A9205EBE393911E2
            4526464BED816D73FC6DE973D4D6847C7E9ED3B389BE7B776F68AC47FF006776
            23177AFEBEAA0922787D3DAAE24F42A0FDD0018EB9E4E5546CFDDAEA7256EE01
            522E8101357D6A6F0F37347DBA3B33C4B8B911CF076CE34A2495430DD939CC99
            338F75FDAA766D00B117218823E34C1F10867CBE539C08522C9F8F60EB611AEC
            3AF5F71D7503EDA6A64587C039F3F4FF00AE6831B9CF5F69F4FAD4906BA03D6A
            343E517BAE874FBAFEEC9599149B6E5DA6DE6EB5ACC8042B85A01366CD11B3EC
            13B637F4AE8D3DAC8B72B62F0A14F2CF591542190158C4DF5E01F143793BBB87
            F518D8F6B71FB64CB6040B960E61848DCAF699A360C5012115B5425586079AE6
            A3E322658DC1CE61EC5B1D7A5CDEC40DA0DF5D0916D6A013E102BB586BDF4907
            BB1A2A4FFBD26B53DDADBAC1DCBAAE3D9526D77F0E9CECC11674432B2B332B5C
            949602B8154C2616CFC5429CE50323D67FB9F4EE0C2F17F22DC3CCC38D972F1C
            67A05520C4AF784B39B95027F8BF2D812C0313A0306E31B0B339BE0BF583F9BF
            CE319D75216E741602D61D7FEFAECABCBC3F0F00FF0051F3FCFF006F3CFCD2BA
            DAE3D2B6A1165FB5547FDBC71CFD7CFF0001E79FE1955D753ADBD6AA491A8D4D
            4417CE4B666E3E3D362FDCA8605D1B86BB5A31B1016133C912D99B1134486453
            504A749BA8AAE0020207147D2002630147A8FF0067792D8FE73E02548F7A7E97
            3036B6D3F4EFF63EB6E9FE17A8EF753C9FD1F2444D66257FF52FD6B5336BBD69
            68F948F8B4A58391FD12AFA120ED11DF6678E59B0B992A4EDE9948A948A452A3
            22D563EB38F113265512002145114CEAFAB269D96B93C7FEDEFF0071DC904FE6
            E4E7E3C4C6E35032514E9A816F99CE8075EA6C2D1FCD995E4ED8C64378ECD63F
            4B153D3FDF5D17F1F87D3C03CBF8F1F867129DC4311AAE9A56C2D6E09F4A8E5E
            E0F7366A953EC7AC3D6368DAF9DBAD869B46104C418B895AC6A26128F239AAD7
            BD88AB764F9AB72C446481E41266A94E522088387852B73A0477BDFC5FE2DC6E
            578FC8F21F7FB36278D301AF238D5F2DC30518F12A3ACA15DC84695475BA232B
            0778A379FCFAA642F1DC6C227E4589056FB42E9D492B6D3ADAFE9AFD0FBDE997
            4AAA3D54819D9D90967BB1F7D6CA3A12FB8B71D89651FD82D538B7FE5BD60C1D
            B8202CCAB4949A8A2C54FD2559E3830B974275CDC970BE53F2CF2DE47C9E2F08
            63AE1767718863C0C24DA531E32A8A7DE1159D888D6E5AE147B102A8D7EBC570
            AF853E4F259B91F3F2B36DDD21016FB45BF2A9DBD2C3A7A5CEBAD6E9BE78CE39
            9BB919074DD8B060D977AF5EBB5936CD19B36C999772E5D3854C44906EDD1218
            E739840A52808888066A5412492AC710264240DA05C927A01F8D6798AC63E46E
            8B5C9B5175ADBBE61FBD5B376E385E620BAC54C906D5A46C253B88E922502193
            74853A0EACD9DB67C442C97804D597729AC648633F5355D7A4144DB22BFE8D4B
            DDD8DFB61F13F0DC2E3C11C9DFB94929007E569DDC3492BDD5D0C702BC71AFE5
            6982228D97768E05C8E1E67764F3411CE63E3D08DAD6076F4BD812A497B1EA6C
            B7B8E82FD535128953D614CACEBFA141B1ACD329F10CE06B9011E5501A464530
            48116EDD332CA2CE16538E4CA2AA9D4556504C750E6398C61FCF9E6796E43B87
            96CFE6F99CA69F94CA94C9239B02CCDD7450AAA0745550155405500002A6D838
            789C7E2C585850FC78C97DAB726D7249D58926E493A9F5AF5BC8880F02003E1F
            5E7C7C078F2F3E3317A31D4DD6BD1702DADC0AE5FF00E5F7E4A99EC68D98E937
            5A5675615ED1390F01B3AFB06AFDD23389B696302FAB690D9BB45DF4B38969E6
            2DDBC83D6E262AE8828CDBA6E0AE14553EE7FDBE78333384C8E37C93DDB22E3C
            8A8CF8D0300D6478C83348C24B46DB19AD1BA131DF736D900D911CEEE4C5C88B
            271705B7486C15F51ADC5C052B637FCBA9FB8A92CF8BCF8FB83E9D6AD6B6FB6B
            36D21BFB6342327574965525BDFA9C5BD2A3204A0C7AEE0E757868A9533CA2A0
            4203B7E897FA7DB6E87A74DF9E7CC937927988F8AE32F1F67F1EEE201A132B92
            03CF7D8AE15B68F8D1892AA49362C517E9C3F04F04E392E446EE4FFCA34FE582
            1811753B58B29172469D07D6B52FBADB7A33A49F27748EC73980B64EC1ED8EA9
            5F29D648BD7F5392B8DB5E4C575DB67312E58D722D23AD31EDBDAF4211C7A8C9
            9526A4154C74D340E2A4DBC79C02F92BC03DCBC04F90AB97C2F2103E3EEDD6DB
            3CDB9C5D40B12AF38504905986E68D496ABB3FF5389CEE049870FCB264248025
            C2EE289AFB9B416163ADBA585CD4EAEBEB4D4AE749AD59E892E84F54A5629AAB
            0726819CF0E59A44040A45D37A99241B3D6C74852708B8211CA2B90E9AA52A85
            30072E735C5F27C372B99C672F8AD07250B912235AE09008D412A410432B292A
            CA43292A41ACCF1D9B8D9B8316561CA2488DEC6C47AD8E8403A1FA8AE77BE563
            67D6F78773741756E66CC9D6B59EB4596B06E89F7EF423E19832958B89BDDD54
            74E115DB3B22D5FD59049A6DD42284F71DCE7DBA7CABC807767EDB385E6BB0BC
            49DE5E51E37004FCEF23B23C28C30D56299F1AEC4EE55066772DBD00091862E1
            589483F787290BE46271E64B40A4991FE97B11EDB5CE9F43D4F4ABA3B79767FE
            50B7FB0A6756AD5B07AE7D53D352F128CCDF609D4855EC402C540501CCDAECDE
            23FAE58A722DB27FA4D597151A3268B83B9545422899471F9BD91E36F0176549
            CB792B8AC7E6FC91C982F162BB48A80860AEA1A22F18893787691D51A420A258
            FB53D789C8739C85B0BB7A4387C7464032D9242C2C081B6417523EC4DFA9A966
            DECFD8D93B8DD31D56FDAB6708B467BC379197588991D19D6BAAD57E9D0EC935
            C3D0B0B5196D9A9BE5124C7DB15E3D039CA2244C49CE5D98830BC5BE58E6C190
            65B0C0C58C063B2D2CECD3332EAA58469B11985D7E46DA6EC6BDFCA44B91CD70
            98F2383131909D35F628207D7AF5B54367CCF4F4D56BBE9D23B051D0565362D6
            626BD234F81088098FD52D4FF6B835A536459A8A11078AAF36DD42026264BD22
            04318C24F57A7A1FF6AFC5F07CAF8DFC9DC77744C22E02792313484B284458D9
            9C928430001BEEB80BB6FA8BD797BBDE4C7FE947123DD9BB9AC3EBAA8F5B8EBE
            953C7D5EEBDC7E89D4551AACB18276F8A397176D8F6D76ED77F276BDA1626EA8
            D9ECB292CB9FDE967A22ECCD1370A14BEB6C913FA130E0A5E51F2277A1EF1EE7
            E4393C78120E2ECB0E3C2A0058E0895511546C5B5C2EE22C2C4ED165000CA713
            C4363C69939CDF2F2526B2BFE52C47E5D14ED1B45869D6D73A9351E3A81CBCED
            A7CAF6EBD8AF13FBED53D17AE36D5D484D72019A0EE3B63696869F956A616C54
            1D3F80648589B2BC2865DA03D6FEA0282841CDDBDCFB7C77FB6EECFE170DC2F2
            3DDF24991957F71F8B1674788AEAC174FD38D0A13EF0431BECF29DFCBF7046AD
            1DB130AE0EBD59C69F43D47A5FA0E97D66AFC400443C7F2F2F2FCFC7394EF7DA
            0697A968DBE95873733974FEBBFD92C1FAD0EADBC8E11B0585174D598552851F
            EC2F759F70E9D2ED41A90F14A7E9E92A92A9BA6EBBF238484BEC98E49376C187
            0F3872F95109A2C5B32C6495F9266B889772FB86D6FE61B02084DA6C1AF5E1CA
            C9680AA46FB5DFFCD6BD80EBA1047436FE37AE776E7B16ADBAAF573EDECE419A
            13A53D17F554FAED462204655ADA3B16215631952ACC6C102A52AA84EDC91652
            122AB743D6844B366C962070E7DAEECC3EDFCDEC3EDFE3BC55C5CFF2799BBBD4
            C9C84A24D8F87041BA6BA7E781FF00E5FF0051142C92C2C2525AFB942A6BE956
            0E4520DF1EDED5C42DF1AEA77B3117B9D251EF209BDC5B4E95FC1A3F71B7E897
            552E3DFCDB8CE3AEDDC5EEE4ACDCAEA6849A78AA8D57AC3D944E4D29E7E78F15
            5DB0A7B955F379778D903A26598250D1697B0A90AB1319DE9DAEDE59F20E0F86
            BB5725713C5BDAEB696645F93E296789A5DBB65649989954E3AA8924087E490F
            B4041ECC6CC8711E4EE5E5C7C99B3B0F8C1BAED0A3636A82C6E2DA951D05BA93
            5B03D13F8EC75D96F5776BE415796DBDB3B69396562A5D2E7D5730D5B8BA826C
            1BA1032161ADC39E258AE57AD485FB4862A08C222C40873B670AAE2A121FE52F
            344DE37697C55E1B9978EE070CC89912A1F9D99E4B33C6872524922689CC81DD
            6467DEDA3234763EC7EDF6EE4225EE35F9308D9962FCBB85BDB768CAB69A1FBF
            43A54FA566A959A5C435AF542BF0D578065EE7D9C2D7E359C44534F7943ACB7D
            B47B04906A8FBAB28639BD250F518C223E239C75999F979F3B65F2192F26539B
            B3392CCC7EA58EA6A5785C7E171F00C7C2842443D05FFDA4D7DEF4F021C0FE3C
            E7954009602E2BD97D40BE83D3EB5788650A8EAFADA9AFA5390E780CAA852372
            F4AADAAB9755298A5314A6294C5298A5314A6294C5298A5314AA0F807EDFF7C5
            29FB7EFC5529C0629615FFD6EFDCDE5E1F97F9E5ADD0D96FF6A57F3AEE106C82
            CE9CA89376EDD33ACE175952A48A08A25F5AAAAAA9840A9A69A6026318C20050
            0F1F0CAA83230445BB31E9FE145BB5801A9AE51FBBBD94D85F221B2596BED128
            4839D1B46BBAB51D6AD23977ACDEEF0DA4F98B3512995639D20CDB24CA221537
            EF6305E1D26B1D10470F9DAA9BA5D16A87E9CF84FC75C0F8278193B97BFF002D
            60EEACC818E41B07FE9F046CFED2D0C92ACCB31F8B718C13F26D0032C6CEBA87
            BA3941CA6749FA72648715ACA355BB3850DD40B9D0DAF7B01A5AFAFD3BEE8CB1
            FC506EDE87EE23D91CD88B729C3D2B7E4FF0A295484632CFAAD5FB8C04218CDD
            9AEBC247556CCAC946A8F401C387300BBC391047D2DDA62F8EEFE5FDCEF67797
            7B5A1E163C69A04C7938E84C85DEE3730667DB19DC6682ECDD152658B636D265
            F665710DDB8DC27228C57214BFCADD7F31000B1247E524683D37686D6EAA4044
            39FF002E3FC79FA79E7E6D9D2EC16E6B69D89B9EA0D5FE3F8E5A35FCBA0AA123
            E9411E3FD03FCF2D7FF3316D07A5074D057C5B0D8A0EA7052B66B4CCC5576BB0
            4C1CCA4DCECE48348A86878D66999777212926F54459B064D50209D455539532
            1439308067A31F1E7CDC98B171A0679D8D82A8BB127A0006A4FD855D1A3CC551
            17DC7D2A21B60DB9CFCA15E98699D40E2C6C7A5D4D74BCA6F2DDEDDA9D8C16EC
            7A93A08F434D6B951E28D1E4D453F488F065251221D0624211520157347A8AF5
            076FE1AFEDE38DC9EE5EE5C543E52CA8EDC7E21657FD2A30657CA9CAB491EA1A
            CB1B00E4AEC420995E08564CD0770F34B811297830C9F94DD975602CA3400F4E
            A0B7D4FD1A5FA161A26B70F175E808D630905031ACA1E161A31AA2CA322A2A35
            B26CE3A32399B6226DD9B162D112248A4994A44D32814A0000019CC12CF365CF
            364CEC5E5918B331372CC4DD89FB93D7EB5330DBEF75F77AD7CCBADCEAFAEEA5
            62BD5D26D8D6EA352877F3F639E92505363151118DCEE9EBC706295450C54914
            C78290A650E6E0A5298C2003F6E378DCDE5737138DE2F1CCB9B338544040DCC4
            DBAB10140EA5988502E49001355552DD05CFF65EB8E497536DFCBF77916FD252
            9281A5311598463C245A6BB2D61A8A2A5CC924E1F9DE3B5A3C2C462ADF70E084
            544D213CE0A544A56ED7D04FD4FE0E3EDBFDB2F885B2F97549B916172B774FD7
            653966550C9F2FC7F1A1DA0D86E8E2BB5AC48D41932E4F3BCA3246C572276165
            B03F1AA017D7456B804FA58E82E4D49EFC9768E79D47B2F50FBC9D76A62E31BD
            535EBFACAF7538651AA22EB518B85E2A2197DE3E4DD03434B30B44E40397EB11
            7382F614173090C918E6E6BF037742F91F07C9BE27EF0E51BF5DDCEB1CD0CCCA
            5AD3E319276215360F66C8E58E2DF1C6162650083B0CD7B97165921E332B1F59
            F16E02E83706DB7D7402C01BDEE4DF4A9C8D5DB329DB975CD276B6BD964A7297
            7FAD455AAB724900905CC5CBB54DD224728183DD6720D04E28B96EA01556EE08
            7494029C8600E49E6F86E43B7B97E4F81E5715A1E5316531C887D187D08B8652
            2CCACA4AB290CA4820D4931E75C98639A3D55857BB1E47FEBC787E7E1F5CC674
            70C47BBD07FBEBEA2C49D2E2A32FE61299FDEBF1EFBD489915FBCAB0512E8D4C
            99BFA114ABBB0EACE665672510121DA275B3BD1539FF00607F5808094043A13F
            6B9CB0E23CDBDA52B481629532E37BFA838739500D8D899152D6D49D3D6B0FCD
            AACBC4E5C6C6C3DBF7E8EA6A29F526C3636FF91DF8A8B53806A28CE7482842E2
            41774A28534C23A53B38C269B383BC707233750D638D59B8FA1348E6584E06F5
            08FAF376E47159BC47817F715C4CE8C331399C3263B00555F3F1E446B8FCE1E3
            6561AB1B5AC6C401164D8D9FDBB305DCECAFEDBDAFB41075E836D89FBDADD6A6
            7F6976B5DDA1DABABBABCD13D83B4A5845B3298F6160A64134F52C83DB33C973
            9089AD5D8957DA151FA4559A383AE924D4EB2A738A1CFBDB5E2F1C5C10776792
            A4FD076B2AAB05D1E598B292912A46FBC3BE97520320DCD2045526BDFCCF3B79
            23E2B8C5DFC9CA481E8142D893765DBD2E2F7FC2E6BDF757FAA14EEB745CCCB8
            3A56E9B72F6566E7666D4994C067ED6F9B10C7FB64D75545DD338649E2CAAC44
            454398EAA8639C47FE32A781F25793B97F21E560C2F0AE2F6DE026CC3C3520A4
            0855148DE115A466D80966FCBF9502A8B566382E1A2E0F8F4C4C6F735C963AEA
            49BFA96B5AFF005D6B6B4C72A64139C408500131CC6300148050F1309B900280
            00788F90066B01BAE6E353D056696E7AAEB5CEDFCBD7766726625C753746CF47
            B84EF6E0B4ED92F6BEB252760B3232DF6CD57A144ABEC9D18C8F7EA392B17874
            0CA3C78BBB224076E826A91F775FED93C2186E90F923BC96CB1867C68DFDAB1E
            DBDF21D9641EE500ED5750A80EF376DA6380F75F2D2AB3E1E39BC42C2403FCE4
            DB68BDAE369B74FCDD3A75960E8875798752FADF4BD64768C497678DFF00BA76
            849B1505624B5F665247F53295D82864DD34AF3241B44B55532A4555A304D414
            CA739F3993CC3DFE7C8DDF9CA73D02ECE2D488B1A3B921628D4286BB223132B0
            694EF5DCBBF67E5450259C3412E271789064ADA5009234362493D469D2C343FE
            DAD3EEF2EDDDD373ED26ADE9C6A6DC096808098D6931B5F666CE6E9913934A25
            16F7314989E6CEA373D7E261A2A96F1DAA28BA8E74E9C2CDC41D11BA0EB36BF8
            63B5FB238DF1C77BF96FBDBB54F34303231E1C7C432C902B3492C71B3978C9B9
            BCABA3C6CA021B02CDED8F7730C9E433B8AE0B1B26D24E242CB6F4517FCDA7F9
            431D08FF000A870BA5AFB68BD3B7D43F5F7B9B72DB9D53D7542986BB3F7AEC01
            5E02A364867AC241F58632A731777BB02DEF9ECECAB91838B7112F917D2EF1C1
            108C4C58941D93A69F8DF12E0BF68F37DDDE2E8781EFECE9FF00E53023C89F29
            C18E444123B40A9026C4659CFCA83E3553AFCA8CA20D8FC2E1ACF9DC2F0AED38
            41FCCBB3A053D6D77621AFF66D7F0AD7FF008C35B5CD17B2F4EECF76760AED5D
            D575C3CC33D6B7C6B55987BAE15DB0DDBA700812C12A9367292DFDB516F5DB82
            231A570A252DEC1941215BFA14CEF9938FEF1EF1ECEE67B2BB1E1C7C8EE69D62
            6C9C7696249BF49B89DD1891D10167455DCC429412AA9F976D66B89CFC2E2B33
            0F1E5C82E509527690031E80E841D1BD0F5B13A576EB53B6562F75C88B752E7A
            1ED5579E6847F0B6082906D291128D1411291C339068A2C83827ACA628894444
            0C5101E040433F2AF3703278CCCC8C0CFC66873A262AE8C086523D0FF0D7F03A
            56D0572EA1D48B1E9EBFDF50B5F2B4E54A7F67FE33765A4606A46FBCE428EFA4
            4EC01F95BB3B85AF54C7AECCA4E0C62AD2718B3D4FD4414942A40A70A9004C39
            D53FB7B2B99E38F38F07247B9E5C4C5745DDB4975196CA6F636DAC88DADC1E84
            104830FEEE17870E546B6D722F6BDEE574B7F0ADB4EC27667A97F1B7AC6D8ED4
            FD1A16765DE4B5AABDA6AB0FDD3DB2DCADF689250C1FA7C228E9F16B309293AE
            C45672246D1CDCBEE8A651380246D5BDB5DB3E42F35F3F8513C8F90D1AC71BE4
            49F12FC712D96E6E62333803FD45D9AC5DC5CB567F222C6C1F9F3A75F8CC962C
            753B8A8B0F6827681F6007E35CC2F497AD37CF956ED96C7B86ECB24D566A51AA
            9B67ED17F5CFB56F2AE82E736ED5A7D3EB667C678946253A2C5F1C8F4105C1AC
            73129121053D8503BC3C9FDE8DFB7DEC0E0B0385C40D9AEAD060237B95020532
            48E4EFDCA81C1DACC1999805B286648070F8DC7F21C8B3BE3FC8273790EE65FC
            BF96DF893E96B7ADEBB54D71AD283A8A9905AFB58D4E1A954CADB32B185AF413
            6068C19A3C89D550DE2659DBE78B98CB3974B99572E9739D558E750E638FE617
            37CE733DC7C8E7733CD6634DCAE4485DDDB6DCB137360A02AA8E8A8A022AD955
            42802B6A33B6D5473ED00003F0FC2B467B136187D5DDEBEAA6CFB7CB3582A4AF
            A2BB615E999D93745463217FB622A81B15D2CE4058A87401581847AE04C55F83
            251E6014C44A511DBBD93C74FCD7877CA5818919932F1F378A745D06E33CEF09
            D49005B68BDCD8037D0026B039A644E678730A5F7ACDB85C0FCA808EBFC7A541
            2EFCDBF63DDDF22FD5DECA5BC51ACEB363BFB5650F5AC5CAC4C983CAA50E0ED7
            4AB9C0CD599B9914176F69DA7137E526116A76C674C1A386C2A98E54C4ADBAD3
            B7BB0F0BB5FC23DE1DA9C6A2CFDCB2F1F2B64B239225C8612A045BB944F83E3F
            8742BBCC64B00E5808149CC49CA721959314BB71372041B7A0005CDC804EEEBA
            F4BE9A5754FBB762135169BDADB5146C2F835CEBAB9DDC1910A5399EAB56AEC8
            CCA4C88532A814EA3B599952280A840131C004C5F30FCF4EDEE2DB9CE6F87E1C
            120E4E4C71E9AD83B8527A8E82E7A8E9D6B6AB3B2C4EFBFF002ADEDF80BDAA3A
            BE18E83335DE9FFF00ECDB418AE2D5D86DA17DDC73522732AA3B930909046A8C
            245CAEA912F74B2CDAAA32090A60289D379EE107FE4111DEBFBA8E430DBCAB9B
            C0F15084E3F8CC58205456BA2B344933EDFF004DBE408C2E6C536E960A237DA4
            D2CBC58CB91AEB2B120DBAD895FC7A8FA6BD6A59C4438F50703C7978887EFE79
            0F0E339C1895EA7F85495C5874B91FEDA8C3ED5BD9CED75A0DD53D3F680838B7
            8AB12EF1D875B3B3752D1B4D8BB02679FA5A0FCCBA268641DC845020E4A98AAA
            CA2E4558F09A483D393A3FC5F87C5F8D38C5F29F7771A3232515BFA762B97459
            2660504A5E30DEE4D4857002AFBC1DE519211DCB23F259F076E4297F9BFE2107
            A016703D3E97D185FA1FA18F0DF54CA97663B4DA3FE3574F9D9D73ABBD5666AE
            C1DE6FD8A4E1145CCBD752FB7B1347D2C2A24423E6ACA78633EEC540F44C4DBC
            554F58B0F6F36E765F2DCA76278FBBBFF709DD5324FDFF00CD3451719BF6DC8D
            CD0B6B1DE3DBF18DFF0003449FCBC5555652DB92EE571526E5B89E0E3F708812
            53A69B437E6E9D05EE493736EBD7C4EA8A1C07CA27C925CAFA92CDDCF517A864
            ABD6E995E224B8405A62A2465A1EA1155E688BA6C831AF5BEC95A7F36AB84B83
            2914D1A36550E174CE8FB396E4F92FDBE783B89C09B8E6C7F23770B4AE260EA5
            A22922B492155F9A16648658E21AA35E4565178DB6FD6DFD4FB8A670DFCA42B6
            3F4DAA05ADA5EE47E15D409532A6529132814A40F480143802943FDA500FA000
            67056E2C58B35DBD6A684924B13A9ABB81F1F1F3E3E9E594F506A87A597434F4
            871C7F87E594D771626F55BEB73D6AECA5BA907AD52A9E41CF9E00655006A7FB
            2ABD69CFE5842596E45AA9A74BEB4E7F0F1CAB10B607A9E955B1AAE01BFE354A
            B791FC3F9E5C6A848B69A9AA80F9787FDB2D52594122C6ABA74F5AA7ABCFC3CB
            8FAFE3E595234D2A848D6C75154F57E01FE23E1FE3E3C652E4922DD2ABA81722
            826FC039E7F11E3E9CF90F8E519B683A6BE9F7AADB43F5AF9D2F35130118EE66
            764984344B0445C3F92947683060C90288019674F1C9D341048BEA0E4C630006
            7DA28A59E448A28CB4AC6C00D49FC2AB1249332A4684B9F4FF00B7DAB4FED5F2
            33D19A6FDC965FB49A71CAED142A2E19D66DACEECFD354E6317D031F4C09F7C2
            627A044E0098FB600226E00078D81C1F897C8FDC855787ED59A476E9BDE286FD
            3D679231EBA7D7D2BCD9393062C7F24D2809F6D7FC2F5AD775F9A8E905759357
            1509DD93B5DD3A58E8847D3F57DB6BEAB6315B19C94CEDD6D461AEE3C0AA1486
            0F422AACB17D22264C0A026CD9FC5FED2BCE79F205CAED48B162B8BB3E661B0D
            7ED1643B1FEC15847EE9E1B649F06499265EAA15C75E9AB2815ABF39F3C2C0ED
            9BBBA5750B62CDB67C574A315EC37F858222A9354857FB83A95AAC5F5A820622
            6A72722C7200A46F110E0736B60FEC879B9612790EF64832C6DBA2E2A482ED6D
            37FEB53EA2DEDD6A332F90626DC98FC76E6F4F7917FED8FE95B39D29F938B3F6
            C76E29AA6C1D5EB5EADFFF00AE494F96E2DAE4376AF305635164BFE956301A4D
            51581712893CE58A8632C9B9F6C43FA04C403EB9F30FEDB57C51DAD07729EF88
            F34BCC23109C610335CD89461933EE2A7AAED1ED0C776963F7E03BE61E6B918B
            8E8F10ABB826FB89B5813D0C6BE83EB52D1EA1FF00F4FF003CE5AB8FFEEFF756
            C1B27D6BFFD7EFDC79E3C328C0B0201B52F6AE7BFE51BBB2F2EF312BD40D152A
            0EE1E2DFA087656EF1324DD08E66C90555192D5A12443A4BA4CA301B99C5B5D2
            0B24835220312E1720A9228A3DD3FB63F0D418F062F963BCD3E385AE78D89977
            091959A36C8F6396565701615923B36E12A063F1B2C33BA7B80624737198DAE4
            30F7BFFF006EFB580B1521F7A9B1B1F6FAFD2B787E3AFAB109AAB54D06F932D9
            37B65715A93FEC73BBAEBAAEBEAB552EB225B14BB9711728CE3A59ADAEEABFDB
            2926A3A6CD5C9593260CCE823F68241D41FB80F253F75F7873BC7F1919878CF9
            2359FDE1CCD2408A8B73B46C48ED6112129F2EF90962548F3769706D12C1CAE6
            7BA75DDF1FA6D0D704E8752C0FA8B8159D3BC3D5A8DEE275CAE7A59CBE8E879B
            905632729D3F2AC9590610D68847655DB9DEB44554D43C74CC628EA2DE18BEA5
            1366FD53A65150A50C80788BC89378BFBEB8AEF18B14E4E344B2A49086543224
            91B2583B249B4AB959345B9D9B2E0313528E678E4E4F025C5E8C6C54EBA1041F
            A8FB8D6A363A05F21F05A92159F4B3BCB6492D57BFB4CC94A5098DB764FBE8D6
            6D75A8758C6ABA337B01415E2509B8F813A28212920B22C6C2C4AD1F3676E967
            8219BB7CD1E19C8EE2C8CBF2C789F0866F8FB9045998464892292EB14A4473B2
            E44A259834842A175767531AA28638CE3F9AFD25B8EE6E5D9C92E9723470755F
            C80AAD9481D6C4006F726A621B6FAD1EF6114B232DC3AC1DD750058CB4EB6BDD
            6178748ADFD62E0CA492526766982054CC27E4E1E9F48F3E439CBEDDB5DC11CC
            3166E0F284F7B0531B8624FA6DB5EB2FFD5B8D001FD52D8FE3FF00756836EDF9
            7DEA56B8F557B58585FF0063B64C8392C456EA3A8593B9C89959F7A572944322
            DD88CD5AFC924F64502A074E14D35229FBA998199CA72F3BB3B4FF006D5E4AE7
            A0C3E5F96E3178BED575DEF95349012910B977F83E6596E8012448231FF986B5
            E47EE1E28398E29FE4C8F4401BDC7D06EDB61F8EB586613AA5DA8F9019AAEDF7
            BFC60D4BA3624E33352EA4D1E7DF347724EDCB522684AEC99E847ED1F8383B65
            39202EB165DA009C89230AA2CF1056587C95D83E14867C2F0ACE792EF1922092
            737224918552FB9E28B0F251E33A0DB7DBB08DAF791802B8EE470F96EE3DB8B9
            3FF25C658178C1494C84105496D192C47A1D6FE9EB3234EA65575ED5E0A93478
            08BABD46B51E8C54057E15A24C62E263DB00824D99B5480089903D42223FEE31
            844C6111111CE5DE5392CCE6F3B2F95E5725A7CF9DCB3BB75663F85801E80000
            000000016A91E1E2636063458785004C64BD85C9B5C927A924DC927AD7A611F0
            F000FCB91F3FC7E82219E123DC189B015E8F71DDA57385F2EBD90B5EE3DB749E
            8369C3C93E49494AF4DEE71AD2EC5E484E3E917CC02BBAF593554A08164A345C
            B77C0472A95BA928F63C15F6C1BAA60EE7FDB276071FDBDC3E6F983B95D62554
            7388CC582C70A0962C995B6B1FCFEE4F7C47622975DDBBDB0DEE7E6D044786C3
            7BE4C8407D3A588651A8B1D6C742351635299F1FDD2E80E9BEA5730CA26C1C6C
            ABF3A653DB1651819472D1A2AC905D1AFD261E45C899EC9C0D29A3B588576BFA
            15929172F240C9371782D91E7CF36F96733CAFDD09963745DBD88193121BDC28
            609F2C97D88DBA7740E430BAAEC8EE765CFB7B6B846E2A09E7C9D79098A990E9
            FE5B851A12BA03E96FA9ADCEB7D3EB17DAC4ED2EE7071D65AA59635CC3CF40CB
            372BA8F948E789FB6BB57289BFDC53147901010310C00628944004354F1BC866
            711C861F2DC6E4343C840E1E371D5587D8DC11E84104117041048A90E4411654
            2F8F911EE85C588BDAFEBE9A8FE06A04DAE82F906F8CCB04D17A8EC51ED4F53A
            52566EC0969B9F7A5FEF1A42CF0E2F5708F11F5D8DBBF76657D3EFC11255ACAB
            B23876EA25B3A7465CDD753F79F87FCED84B3793337FE9DF20C69121CF549F21
            32ACA558FC512A43122ED53B24B32EE01256F7931FC38796E12138B8B8BFACC0
            5168D372C657736E6373763724F5B8FB016ACBF13F3475A845822F76F4EFB4FA
            7E723C59B7B391D55E2E560E05F3E564126C40909D79489D7CC5C8C5AFECAC31
            48A8AFA04012FAE4765FDAE733CA1191D8BDE581CC71B36B0CB6FD3FC8AA14B9
            D864976EC2C010C7A5883EE507D279BF8430CFC5687205AE97DDD6DFE6000AF0
            1B33E48AD3DB5D71B13486A0F8FDEC7EC661B4A0ED1401949C70C29B04DEBB3D
            18E23896A7765610F71838174924E05C344DE3945215D2297EE00C25E73FC278
            338BF1B733C1F71F7B796F1386C8C59125B2E2B64317537689424C19D48BA96F
            8CDC1378C0AF1E572B2664199062F14D911D80B6FD9B81FB91EDB7E3E9A1AE73
            B6DA5BF7ADD7CD4FA9F7F4338D6F6FEB73195FED841BC7D42C724D68D6FB0CEE
            CB53F45507EFE9B7C519C85AE6968A155E3C8EF598D1FE86CAB45FD3DBFDA33F
            66F7C61F74779F6885C9C5E6D904D2879E3F924C44FD3A064936490955403DB1
            C648B4967DC18C2B3F1F37031F8EE332D6E610FB7F2F476DC7A123AFD49FE1D2
            BBBBD2146D6348A0C22DAC4E84A42D821A0250F7351E1A5262F69A912D4B1567
            9D9F5797136FA4E3D44D5058DFD020A7FC65213D250FC85EEDE6B9EE7398C96E
            E196F9713B26C015522DA6C511500500116D3AD85C9EB53DE070F8BC3C569F04
            DCC9F9DFDD76209B5C3136B5C8D2B07763BE417AA5D5C8E76A6C9DA116EECA81
            786D40A680DAEEEF5731D421103C5458A8841905448C51732ABB06643814A658
            A63100D2CEC2F0C791BC939062ED7EDE6931C7E696478E18D469ADE5742FD7A4
            61DBE83435F7CBEE2E230D4493E6594FD15893FD80DBF8DAB4D9BCA774BB9513
            21B0B68C88F45FA76DEBB356259802F14E3794F5619A00F3FB9E725A45370C29
            6CDBC33676B18CF59225662A1552347A29B4914F6A491F89FC4D31E238251DD9
            E4732FC6B2913E2E3624DF9360424A64DD9F5F7754DA648F732561F2F239FE5B
            E38F071FF4185624CDB9256616B83F1B0045FA7DAF7D6D5A5BF1C3A4EB3DB3ED
            CDA7B3F1F5395ADF5BFAE6F232ADA22AF3469596527275A37935A0A52C764B03
            B7B3564B6448BE3DAA61CBD5DEBE4E725D897DF049A2419B6BCF3DE5CA78EFC6
            9C6F8F33F984CBEFFE76232725280176449206448E20AD12C641FD346D1FC619
            21772BF231B60F8BE1F1796E4D1F1DF77098F7016C46E2C09D4921C10DA9EBF4
            E86BA25DB9B8B5A68AA44AEC5DAF6F8AA654219301732928A282670E54FE96D1
            B18C5B26E246625DE9F823768D5259C2C6F0290473867B67B639DEF0E670F82E
            DCE39F2B939C9088A557A02496672AAAA0024B332A802E4D6C1CECDC5C087E6C
            C97647F5B13FDC0135CEB76634C765BE5AD691DF3A675E27AAF59D06A8BC4696
            7B7691675BB66FC21A4539968E4CDDEB77B18318C9532AAC5AB23FFF00069AAF
            144535D7070F546DDBFD83DDFD93FB644C7ECFE6B9E39BDC39D2ABF2022490A7
            1CC1176A92AB22CE2CE777C47E51B6ED18BAA8877230E77734B8F262637C58B1
            06F79209903588F69DA57A7E1AF5D2B41BB39DA379BF6374F74062A96CBAA5AC
            B5AD92193ECA049B4709B57DB3DA4CB1869B7B31110EEEC92EAD7606C0BACEC5
            BFDF4A99CBA59274A2EBA0CCABA7B5BC77E3FC6C4EE0EE7F2EFF00566EE8E7F2
            E36930C2A36237C7B1AC8A4BAC4C648CC68A1E20A9B1769D49AC0E6E68E17B7A
            4E0F1F0063A1B094EFDDB8EF07D4315D7FD2DF8D7461AB3B13F1A3A6B45557AF
            AC37DE935F5E52AB4D60FF0044B84AB11359BED9633F92987D1532DC7FB824E6
            A6CCA3E727452581478E3D450013A603C53DD7D91E6EEE3EF0C9EEBE4FB772D7
            9CCC983875786E960B1C6BBA3755411A0441709655D7A1A9271F91DB18DC47F4
            C6CD593140B37B645DD737E9627D7D0D46B6D7ECFF0058BAA1705362FC756CA9
            79BB4D92422DF597AD9588C7761D1FB7892CCFEE41244D34B04BEB89B62D1B14
            8495826AE9464A2A83651A9DB8A8DC7A2385F19F93FC91C445C6F9B7B713F410
            C4C98BC999A05CAC3DAC14DE1C56032D252AAA3E726DACCACD725B1585C8F15C
            2E57E9380E4C9C52DB9B1BE36DADA136F95C165EBBB43FF97F0D43EF9F687B71
            DB9D2B59EC2CC50ABFA1F4EE91EC1215E8785692EB3ADCB58DB4D635D4724C6D
            892CC9AD9A3578F916CE1250019430003E66A7B0AFA0EE5B483C61D81E39F1C7
            762765E17743F31CFF002D8865DDF04B0C060452EA00DF242FBD199813231DA0
            EAA1D55F259BCCE573316504E23E2C6C561BFF009A1892DAA9FCAA45AC7417BD
            F5E95E57A41D0A7BDE3DC311B1F674BDB65357A53EADACC6B44C48BCB25C2B51
            13ADDA4DCA4FBC6FECA4DDADA1D479ABCD97239FBC9359392550F4B78B319697
            797BCB183E26EDFCCE2BB6D163EE10889081AAC6EE030F6B24897488890A36D5
            D850020BAD44F131391EE375334D7049F965B2E807E5F67B6FBAC16EBD3A9E86
            A58BE1F96F4762FE49A21460C98295FD97ABEBEC9BB640CD0D1D09577BB96A75
            E80459143ED9945C1C1C13645B10854C4A4E49E80214801CFBFBA29124EC1F04
            4CB36FDD8DC8B93F532B60BEEBFF0098B5C9275B9D4F5A9476B4116272DCE63C
            706DC6BC7B05C9B100EED4DCF5FA9D3D34A9D59D9D85AC434CD92C72B1D035EA
            F45BF9C9E9D987ADE3A261E1A29A2AFA4E5A5241DA8934611D1CC5B9D65D650E
            54D2488631840004738CA38A59A48E28AE6476000035249B01FC4D4F6EA0920F
            BFD6B9FCB66E2A77CAD5E66EE10CDDBC5F457A2D738FD8F6AB7DCA15B224DE57
            0846A7919E8DE1FA68C9D775FA1A79D483C599AE2455D34988F5A41BA62BA68B
            4EBFEDFE365F04F078B8A7398F96BB9636C748E3729FD2D3794472C0C98D92D3
            964B3DD1A03B844E6D2130CE7AFCD86C6105F898C867627FE2DB6B016D193610
            DD0FBBD45AC2B4DB6BE95BB6EBE92F61FB94E826E2AF0C7B1F0FBAE1211523B6
            EE2A757975E9E94C1220A758AF3D35FAB3D81588918A1F60857CA8247F78AA97
            37B70DDCBC5760F95BB1BC45C6BABF0A78E9932267B97C8658E7962DE1D1AC44
            A260563601DE4370142A545E0C093944E679894FC6ACD19461AEDDA2CF650413
            7B2F51A7A7A9A979EF46EDFF00DA9F11D7FDDD48214CDB6AE9DD5732445371EC
            999C56C4B750A3ACCCCC72FBDE875171B38ED15531F570AA4621BEBCF297873B
            55387FDC470BDAFCAC45A3C6C9CD5B30DA58261E4BC6FA1246E01245218F5041
            235AD85FAEFD670AD99882FBD4D85FA7BB69D481D05FD3D2D5B3DD3EB3D1E83D
            09EB55C26A7E0EA944AF758F53D8672CD3AF9AC1C1C3C623AE60E465E626A424
            1649AC6A092A655570A2CA0010DEA139B9E47359F9071F3F3FC95DDB8AB1BCB9
            AFCA4E88B6BB1B4ACA807D46D0A17ED6F4AB7B75618786C08623FCA5045FA756
            24F5FB9FAD6A15CBB6DB3BBC4C8FA9FA2C59BADD5AC921350B74EC9CAC72D166
            AA54983C5E1A4256B70D2AD5B49D7A5AC0A22BFE88B3D4D292749A62BB66A54C
            0CEDBEEEE0BC5BDAFE2257EEBF38441F958949C7E18335F2DBA6EFD5E2CB2228
            8B724846AA6DB1CFA1C749DCB919F3CDC776E0BCC36FFCC683E137B9FE548A03
            DC065EBA7E61E9596B6DD934BFC4F74AA55ED120514CD0E446BB5168F9CA9FAA
            6C0D9F604DE2C8CC59E61745F9D63A4937752B24B9CA2442398AC548852269A6
            10EE122EEEFDCA796E05E733C36564DDE57DA8162C7823036AA21801D15631B4
            862CDBD893B9ABE98B89C7767F193644CFF24DFE77B15321DC760DA3705B6EB6
            83A6A75A8CEEAD697B846EA3269C672249BED5F6CE457BE764DCCD91CBA96A95
            55C836B146C0ECA74A919BD6D0958AF5D1A4F58A04EA15E4CD82C29C13839583
            973E9DFDDF9DD1C4CFCE47DE92E23278E3B71522E2109540F232AC739850A8C8
            67796011C2645658E38DB214AA85648A43FAD9A5CA455DDCE65152E34FE505FC
            B76FC8C190826D6B1363737ACF1F1AE309D3AED57677A2F7E23E656DB7DBD3D9
            BA7EE93864C15DA5506F0EAB949899F824CDB3DB012017FD481268455233A466
            C82298B1129A03E6F39FE4DF19F60F9538E63271F00C88736153EDC391E58A34
            3A85622564B335BDB78175DC19B3DC3C31F09CA7238B9527F3320A18DAD6DFB4
            107404816DDA5EDEA6A79C07910CE410DAD82FB7D0D4D874D7D6AFCBA94C5298
            A5314AA0F3C0F1E23FE1FE40394B750C6F4FC2AD1E7E9FE1E1F8F8FE3E595D6F
            D74A0DA3AD3D5C8F97F31E3F2F1E328406B1BE95522C2E2BE6CB4D44C0C7B896
            9B928F878B6698AAEE4651E20C18B64C3FDCA3874E8E9A2826500E7930807867
            DB1E09F2E65820819E73D154124FE0075AF84F3458B199266DB1FD7FF0AD2CBF
            FC94F4635BA9EC4F763A8B2AE048753EDB5F927B6AAC4048E74D42AE5D630D6F
            068722A998820B0A7E930081B8E078DA9DAFE08F2B778E3C93F6FF00674D2408
            6C4C92E3E39D75D172268988FB804561F23B9F84C43B26CE01BECAEDFF00A548
            AD27B6FCE668CFBD3C1E9CD1FBD370D80CE5BB6668270B174E8F921780506276
            3F7EF656D2B0B950DC113087F78E1FD45218BC886DEE0FF681DF72A1CCEEDE53
            1789E2554B19014CA6502E5B722CD180058DCEF3FD95E71DD3C564D9306569D8
            F41B59377D7AAE96FBF5AF16A7783E57F79C8017AF3D1B8FD630472A44179BA1
            8CF19F9456488AFDD3597B84BE95835522140FC820D240A02005F518E20437A5
            7C49FB74EDA94AF75F9BFF0054E8754870A7B13EA1840D90EBFF00CC3EBD2ABF
            D7B922F147176B12C7A933816FE1B40D6BE88759FE65F732FEC6D5EE05274DD6
            1E2C08BB6BAD9844A36060C4FC1D4522CB50A8C0C915D72000007B4898A7F500
            1C49C08DB93DF1FB5BEDB93670BE279B989547E77CCCD823623417599E422F6B
            FF00C322C6C7E95F1697BD9E798624AB898E6D616825234D7565BF5FBFAD7D28
            9F83AD7D637012FBEFB2BBB7724FA860FBA7EE958F6A0E932AC92C529DCDD17D
            95389AA025314CAA2F9231FD627E00E2261BB27F779CDF1B1C58BE3EECEC4E1B
            01136AA349FAA0BE9EDDD0C400B5B420F43AEBA63F27B5394E4D95F95EE2690E
            B71F0A2F5EBAAB56D7D2FE273A2B4F1455574E16DEE10318E55AE96DB9CF373A
            872A24F5AD0AB4FA75C54E40443D222CB92F2201E1E0101E63F747E6CE6219F1
            A7EF011E338B32A62E1AE97B8B30C7DE3F83D5F0761F05EC7CB84CE05F6DCBAD
            AFD7F2B8BDFEFD3D2B646BFD40EAB54D03A35AEBB69B8222A42247345EBDAC34
            5CE926A26A026672946838120A89144C1EAE0DE90E79E33576577FF7B674E93E
            5773E63CA2FA990E97EBA74FEED3D2B211F6576D085B1FFA4A88CF51BE4FADFA
            EFBF5FBD66683A4542B2D4CCE02B70F0ED8C621CC8C7B141A90E620285209BDB
            2009BDB22A602F3CFA40C201C008E4732B95E439097E4CDCA7925FAB1BFF00BB
            FEFACAE3709C662C4B8F8F8A1611D05D8DBF8924D7A80E003F000E03F7079006
            63B524926CDEBEB592B8516234155CF9DC7D2AB63F5AFFD0ED8FB857CDB1ACFA
            D3B6AEBA32A72375DB1135F6A852E062619C58E44246666E2A09C4E35AF344D5
            713CA552364D795FB2287FE50321484400C2213AF19F15DB1CD77D76EF1BDE5C
            8AE2F6CBCAC67918B01B52379150952AC04AEAB112AC186FBA90D6358EE5A59E
            1E3B2A4C6FF8E174D2FA92074FE350E7F1B3F1EDB5DF964F65F6B62262BB4E97
            966F6565A9EC4B1096DDA76732C124AD9F722089117AD2B9192452B84219D0A2
            FA6645574ACBA3F6808B571D65E7EF3D76DAC787DB5E2BCB59648E2B1CC8C3AA
            E3230DAD16307505A5740034A2EB0A58447E525A18576E76C3CB9ADCC72A9BA6
            06EA0E9EED35215AC411E847E3A75E8744079E403F0FAFF0FAE70892141DBE9E
            95B107A9B75F4ABBC390E7CFFCB2961D5CEA6AE074B56B4F60FA7FD74ED1C715
            96EBD67096C7A8C7AF191D644CEFE12DB12CD65017F6236CF02F2366906A4725
            0541B8AC66C653C4C99804C033DEC7F2577B78E7324CCECFE6DB119C59D7E38A
            5561F75992451F8801BEFA57CF261833B1CE26645F26212095B917B1B8F7290C
            35D7435A1E3F063D07FD5D6944EA17241253D9F6E312B9C899AB7F6924C8604D
            E382AF34B02AB27EF70B3A541354C229FA03800DBEBFBB7F342C0B0AF378FBC7
            56FD2E3DCFE23E2DBA7D945783FE9FEDA0014E1AD27D7E597FC0BDAB7FB49F52
            BAE3D7355E3AD2FA92AB4694916FF67213ED11792B687CC81415418BBB5581E4
            B58DC312A8202540EE8522814A005E0A500D41DE9E4BEF9F21E4264F78F70499
            8EA0003645120B5ADFCB81234BE9D76DFA9BEA6FECC7C683150450461631D3A9
            FEF373FDF5B11C7E03FEB905F5B9AFBFD07A5504A3C0F03E39426DEE3AD56FAD
            ED5A63DF0EDD57BA6DD7DB1ECC7A541FDD650FFDADAB6AEA81953586F12282C7
            6AA3948824E20AB4C515A524CE63A45FB26874CAA02CAA4536CFF11F8E33FC9F
            DE7C7F6F63064C2B97C896C088E2504F43247B99C8D8AAADBB52E0108D6C672B
            98D81C7CD96BFF00114683F8FE07A0D7A7DBE951B3F0D9D50BDB26D71EE36FF6
            0B3DD9FB7E517B157A5A614009994FEE040EEE72DAFE3DB9C8D182CED6905924
            40C8B7700B2EF08A262926CD637427EE93C85C46145C5F88FB372ADC3F1E8064
            A22DA352BB4C38E0BA97BC56DCFB5CA6A8B72559562BDA98BFAE67E764170CC7
            E3FADF5566F4FB8D46BA9FA1A9F3E3EBE5F8879FEEF1E738B36FB428D054F05D
            ADB855C203E3F5FC3CBF8E09DA005173F4AAFA5503C7F6FC7041B036F7550FA8
            22A9C723FB787F1F3CA232B6AA7F1AAE806DF4ABBD3E3CFEDE5C79F397100DAE
            2A834AD3AEE2747746774A8A7ADED0AEB546DD0ECA4835DECF8E6A40B96BB977
            ED176BF7F10E81543F518D501C181DC63A31D93C4CC207201FD0A1363F8DFCA3
            DCFE32E5466F07905B02564FD46312BB32110FE52591FE37009092AAEE4B9FCC
            A591BE33C11E54660C94F920FF004FE5F4B7E61A8FADAFAD72C55FEAAE9EE9D6
            D3B2E86F90C67D8EA46BCB958911D77B7B51CFBF474DDB0189DD7DB4F5923225
            9CC3F937F12CDAA1F669312BC948B6F20649FC7A652A2E8DFA1795E46EF7F237
            6EF07DD1E03CEC3C9E63051865E24C9089B1BF5014841264989092D1480DB746
            FB432BD9413AC7FA3F0F87CC4D8DCDE134B8521F6B077502C2F7B212C75207A1
            F5F5AE887A7FD71F8C1A9B96170EAE35D2D7BB630F69CB5B912F88ED1B945483
            74954569068AD867679ED3E596E1515BECD0606E4E70F4813FA4387FCA5E4DF3
            7773492F0FE45E4720470BEB0FC304084FD18C1127C807A6E6717E9AD6C6E3B8
            BC1C68166E3F147C4469EE2DF86AC491E9F4AD6CF9A8EE2B2D7BA6A3FAD5AEEC
            31AEF606F455F445D1AC6C91169681D62C85225823D641998EBA0E6F0E97245F
            A4C2063B1178001EA12086C6FDA8F8DA3EE0EF06EF5E7220384E20AB20752449
            3BABFC6415752BF0B012062ACA58002C41230DDD9952E3610C6FCBF2F53A7404
            1B5BAEBFF8F5AC15D6AEE14C5074AD4BA89F1C3D7CB4EEED9D0F0EAAD70DCF69
            689D4F57AD799751A39B2EC31656077112EBD6E49D03C4A3139C56B6A376AD5A
            A0920E0A42B719CF7C78ADB9DEEBE4FC9FFB84EEB87B7783C89E35831D231992
            490C6A1560BE248595D5027C8D1C726E2CEC0A0B1A8EE3F33362C7170DC2E299
            39017B9240176D6FEE1B7D74B915BD9A4FE38E4EC16687DCBDF1D90E7B49B5E3
            1C3992AED32704CEB4C6BA935A595924DED7AAEA358F8E99906E7F499B0AEC5B
            B28F2895349B28A2093B1D35DDBE74C7C4E3392ECFF0EF01FF004EF69E4D8641
            0FF3646505B6C2D24AAD2416D45A394BB5FDD258EDA91713DBC98D23677267E6
            E48B020EA025BAE80ED6BE9D4585B415963E47FB8519D39EBB4BD8222463DBED
            6BA91C5575142B844EE945A5C48D8B31612C6B629D55D8D3625DFBE52FA7D95E
            41464CCC6299D907233E0CF18E57943BEF078D93199B80C7225CC70400B180C5
            1092E8C7E57509643BF69775B6C247BB9ECD7C2E3A69227FF9836007D7517FB6
            8B73FEFAD04F8BAE80541F6A84EEFD88D6F5FB6CF4DCE495B5FB1BC4334B13D9
            0B74C28C1C30937CF659995E15FD26159A69A472898FFABCACB19537BC52952D
            E7FB93F2FE4E3F737F43ECCE6258F1912304A0D8B18453A2868EE7E46624B06B
            6C44016C6F519ED3C75CD33E6BB0F841B2A917D7A31DDA13D3A11EBA54A4A7D0
            EE9C229AC88F5BF543C4950102A32B5667328B7373C82AC9196FBC4D8382F23C
            288026A0723C1839CE6CCCF30F92333E2FD5F77E4B7C66E2C1135FB9441B81FA
            35C7D454D62C2C5837FC502FBBA8FADBEE6F6FE1594A91D77D0BAD1E7EA7AF34
            B6AAA3C90A0D1B9E4AA940AAD7E4154A3C162B022CFE2E29B3B541983957DAF5
            1C7D1EE9C43FDC3CC4791EE6EE0E5415E4399C99A33AFBE46602FAE8A4DBF857
            D846A176EC554F5161FE3D6B8EDF96FB1BED91DBADF103ACD074E750405BE8EE
            2F13D02A3E6F5E73BA2B747675C953C9A60E7F4E5A620CB1D20CDB39040AA15E
            B7930039C7DD367E9B7EDF38BCEC7F19F617F58C754CD10E6362B1319710C992
            D2381B496DADBA32CAFF0094EC0402001AC3B8FF00410F33992FCF6CE3B372D9
            ACFEC006BF9176AFF6DBEA6BA8AF8DCA7D4ABBD2DEB8CCD608B2AB5C74AEAE9C
            9C7AE5D28EDCA927FD951292F1C5554515168CE19D0AE8A2D9337B48184FC789
            8C23C17E6FE6B98E57C8DDCF073002FE9B2E58E28C2AA858F75D4FB40DCCE2CE
            CE6E589FA58097F6CE2E341C5624B08F7480973A9B90481D4E96E9A7F8D45D68
            778F7A99F35DBE359599E8C2D2BB61173D70AA9DD2AC9A44592D5687A5D8D587
            42E574D154CF5B4D92E10ACD301E577AB2A9FF00C8732226DEDDD58D077DFED5
            BB479CC060F9DDB6E639947E640F3880AFA0F729826E8C552D7235BE3F2124C4
            EEE8E554FE4CEA6DAF43B003D753A83FDB61D2A403E5AED13B5DE95DF9947B87
            D135ABA4844D0B635923D123B715BA159C8F9A49BA34718A0691632F269B3897
            6890E9185A48AA2070E381D61FB5DE138DE7BCBDC162F2984B90638A796284B3
            28796389997DEA46D28374A09B8BC6058922BDFDD13E441C4CD2630BC9750468
            2E0B0F53A0B7F7D6BD4DD8BA7F4BD03A3FA9FD62B16B3B1EA9DA0E50736E7F5E
            9861244BD3764C988306D7A9B8E131DD5E3716C4462584B0C888BB72C48F599D
            32F289092CED5E1FBF398EE6EF8F28F7246CBCDF121400C23043B868098EC3E3
            D9040AFB2408EACDB5D0970587839BC8F83078EC1C2F74336EDBD05EC41B1BEB
            EE63ADC8B7E15260E342571D75BACFA0DB9DB388AB96BAB754A5A514413124BC
            95E62245BCE589D15B7A08A2CFE4E59574224F481790027A4A52F1A126EF0CDC
            9EF483BC265B64A65C72850468B115DA808503F228527659B5257522A53858C3
            17161C576F68521B4EB7BDFEBEA7D2A397E1F0911BC7E3892D47B3E1DB5AEAF0
            764D97AAE72166FD0E5296ACCE3E0BB3662ED24D42BB6AD89157B4D369EA326B
            A6D488A89FA394C437C7EE97F53DADE7ACBEE0E22630724F062642B0D76BA42B
            08D1B72B0221F702BB583156522E5B01DA8AB160CD88AB6891AC17ADB75C9D4E
            A6E493D74F4F4AF805F847A695473500ED9763C9A0C5C99FC6E924A6DB1A1235
            DBD97909599214EED67753518C81DE7A8A52D7D2720E8CB3859C383AA4046E6F
            DD2F24FBB997EC8C13DF6E8164E437905C2A044BC0B1AA8DBB46824DA40036DE
            E4FD8F69700B9DFABC7C268E2EBB3E491B5B58EACC7A9B9E9A5ED7A967D2BA3B
            58F5E75FC56B2D43556152A8C49945CAC9AFBCB3B9291720915F4DCE4A3B5579
            09A9B7E0893DE74E54515314842008264214BCEDDDDDDDDC3DF3CE6677277472
            2D97CC4FB77B9089708A115556354445550000AA07A9D49273B0411E2C621C74
            DB02F45FA5F53A9B9373F5AE6DBE54B7A466EEED4C8D0A56CE95774374B2B2E6
            CD7F7CF21529A4EC7B064021A42721E2214EFA394B3CC28C0CD2218B230A8291
            DB4BB932666843A83DE9FB67ED97ECDEC11DC8DC7364770F72B918C8AC56D163
            1941DF20668E3006F9373AA124A460B3955101EE8C9964E5A1C78A5F744A7D96
            1EE2CA0FE63D2C2C6DADEA753A63A0D2D4340259A5D1932DE36145C3BF9B6730
            BB259FD7A348B4A4D31AF3D5235AB264EAC0693B1BD7D30EFD0B2CBC8BA3A1F7
            0BB468C7DBE43F31F7E9EF1EE168311BFF00EA309D962F6ED0CC563491D575D9
            1911208D2FF957790AF238A9076B71B1E07170C8A969A4DC48B93FE636D49EBF
            5FECF4AF3BDDBE8AD3BB7F075F9969607BACB776BC33975AD76DC011CA73110A
            2A439CB0D28B463E89975E0C5EFA5CA2768EDABE8F761EEB658A551CA2E6EF11
            F98392F17E767ABF1C99FDB19E9B72F0DCAA8982A48A84486295936990960176
            C8BEC7046D2B97E578DC6E6308E1E52F43746B91B1AE35B022FD3A135A5F11DA
            7F922E9F432717DAFEB19BB1B42ADB2FB53EF1D1D628A73605E3E3489A8E672C
            F5F499945F0B66026F75F3C8EAAA4A98806313D42A1C36C4FE38F06792268727
            C77E42FE91CFE5AA6DE267C5C89364CC3688532E6963472EE377B1A5DBBAC05B
            6A887E4727CF76D095B37FE7701000080916D17D09B0663FC40FB9ACFBAAFE61
            BA39B29359197BFCF6A09A6E922AAD01B76A5315B7442AAE5366620CBC6253D5
            517093A5884323FA87BDC1BD404F4018C111EE0FDAC79B3B79566C8ED449B189
            3678B2715BA6BF97E70FA8D47B7EDD6D598C1EEAE333626919FE3B5B4218F5FC
            16B6024BE40BA690EC9BC94AF6175F46317645D468EE45EBF6283C236050CE0C
            C8EEA3D2FBC045348C737B7EAE130F5FFB7C7216BE13F283B98A3ED395A4045C
            0971CDAFAEA7E5B0FE36D74EA2B20BCE716E8AE994086BDB4617B1B1FF002FA5
            79727C99F455C3B691EC3B194C977CF81D8A0DA098DA674C50646315C19D1A1E
            BEF88C0A5F4098A2B8A6074C04E5112009832F8DFB77F31E52CEF17663ED8B6E
            EBE4E1ADB70B8B06C805BFF86F63A1B1D2BE67B838A542FF00AAFF00F6BFD6DF
            E9AF833FF2A7D0B81F5A4B7616A8F1E14C04FB166DA6C1731B8F57FC6ABD8B66
            C940FA720A8873F5F3CC8E17ED93CDB9A11E2EC9708C34272313F8E9FA8BE96D
            74AF84BDD3C342148CADC4FA6D71FF00F1AC66FF00E5A74A4A39463752EA9DFF
            00BAE45D94C7641AFB59CE4D46B9483D69917092896F2FED373BB27B5EB3A401
            C8187C4086E32927ED8BBE3864399DE7C860713840805E59E1723A5F45940240
            37B6EBF4FAD6166EFCC357DB8B88D337A58B2DFF00FD86B17C9776FE4576A09E
            3B457406D7433393AAC119DDC922CE3C8D1D260E3DC767656373AF1049B26089
            BD2631974C4E400E0C2B264191E2789BF6FBC218B27B9FCF11E4DAC5A2830273
            7FA2EF864C83623A951F81F5AF3373BDCBC891FA1C3F86FE87637F7B05AF285E
            B97CC86DD702FB63F6C35DE9B8872890A4AFD0D9355645818AB7DC002A356AAC
            22EAADE20439CB61580E0988014A430F3E89FBEBF6BDDB921C7E17C57372E506
            933E565C48E6FD764CEECBF87C606BD3D2BD10F07CFF002037727CA000FF0094
            228FC75423FC6BD6A9F0EB19B1574A4FB29DB5DF9BB6585531D6202F175E8404
            4C21CB36B1D3C7BE3F6EDC134C84E48EC04781370071E43C6BFBA9CBE0609B07
            C5FD8B85C0F1AD6BA6FF00D512DFEA2CF0C67EA6DAF5EA40AC8627657058F3A6
            4E4C0D2E48BEBBE45EA2C74DE47435B4D42F8BBE8AEBE6A8A2CBAFF56B23A228
            D97564AFAEE76F4EDC2ED080545414ED32B28C1A9390F51926E8A2818FFD424E
            7C735FF717EE2FCC5DD0BF1F27DE320C7008091438F1001AD7B18E156274D096
            247A117ACE41C4F1988CA7170C26D3717666B7FF003137ADC9A5EB6D7DAE18A9
            19AF68F50A2C72C251558542B7115C64A094C73944ED621A3440E20754C21C94
            7C4C23F51CD3F9DC9F23CA389393CE9B21C74323B311F5D49275AC91626D7B58
            7A0007F857B30207E3CFEDFBF3C26E581BD0B557D3E7FCBF2FC7EBF5C300C2CC
            2AC5017A74A01781FDBCFC7C79F3FAE52DD09EB55F526ABC7E795FA5F534F5BD
            38CA150410475AA7E06A9C7E795FA13A9AAF5A71E7C0F1FC39C6BA5CD56FF515
            762A95FFD1EFE0707F1A55BC0F8FD79FDBFC317E954B5FAD0407C3F1FC728340
            7D4D2D72091D283C887879FD32A7A74BD352081A50007EBF5FE594B93B74B52D
            6275D2AECAD5698A5314AA0F3F4FDBFCF14A830EDA74B7B4DDC7EF2D55F5AA22
            2EA7D52D549432158B3C9D8A0657F578F55956672F8E612991761713885D2CF6
            258D1CDD59364847A2D20535D7F7C9ECB675D87E31F2CF8F7C45E24CE9F84CD6
            CBF29726EC2683E39D041F1BCCB8ECD2BC671DD1236F90889BE42D29436B6E48
            7F717159DCE64E2E1080271B092449B94DF70527D970DA11B7536D2FF8CDEC4C
            4C7C14647434432423A2A259358E8D60D4809B662C59209B668D1BA61E09A0DD
            048A42143C00A1C6720E44D365646465CF296C8958B331EA493727E9A93529C6
            C78B131A3C7823DB1A8B01727FBCDEBE88879F878FEFE3FEB9F137B8B57DC13E
            B550E7EBFE194DBD6FFF008D54FDAA9E90F1F3F1E3F0CA95520ADB4AA585EFEB
            55E31617BDB5A0D05AAB95A5504390E3172351D69F81AF336EA6D4EF7012159B
            BD6A16DD5C9240E848C0D822D9CC45BF44E5E0E9398F7C92CD970307D0C51CF5
            6066E6F1B9316660653C59886E1D4ED607EA08E95E3CDC0C3E46038F9B00921F
            A1247F8107FBEB409BFC5EF4860EC5256F8ED469C203D5BEE16866F276A243A0
            F3DD5DD1948384FD55764C4EEC563905BB444A07E4008529F811DE33FEE2FCC1
            99C7E271737738758502AB08314315165024610866B003DCCD7EA4937AC0C3DA
            7C4E14892E22B4512DFDA4965D6F7B6E2483FC4FD34A8B6E9075F354F6C7E407
            7FEE55F5E5765FAFDA1DBB1A7EB7AECC208CF40B8979422E8C19D54D75DCB393
            76D1BB39693588A1572B63C8B703FA94121F37DF96FBA3B83C6DE17ECBEDC973
            DD3BD39C12C9952A595D522912421AEAAE8C5658A350141DA24048B59B0789C4
            E273FCA649C850FC7639B6C37B35EE05AC6FD5775C1D74AE90AA547A750228D0
            345A9D729D0867D2128688AC434741469A4A55D1DEC9C80B18C6ED9B7DEC8BB5
            4CAAEAFA04EB2822630F3E39C279B9F9DC9E43E57239524F3B5AECEC598D85B5
            2753FC6A798B858D871087161091FD05FF00DA6BD47021F987E7E1E1FBFCC38C
            F2016234D3FC2BD5A588B57221BEACFB43BA5F2B727ADAAE58D6D65D717D6147
            D606B15862D381A15535EC8B57D6BD831F12474E9958ED91C56F29608E6C2838
            5D57C7689394FEDD98021FA5FD8ABDA9E26FDBB43CE66E23CB1E6632CD94A04A
            3F5524F21F8E2636904215196012054570A0B1566046B9EE08B2B9DE5E2C389E
            F8D012153DA2F700B1DD753D45ED736B695D67552AD114AAE4455ABED95422A1
            1A15A34074F5E48BD5C44C655C3E9293915DDC94ACAC83A5545DDBB72AACE5D3
            850EAAA73A873187F37791CFCAE5337233F324DD932B5D880A0740000AA02AA8
            002AAA80AAA000000054FB171D3131E1C68BFE1A8B7FDAF735E847D421E01FE4
            1CF3FE3C719E217005CDCD7A3A6A06B5A89DEDDD369D05D5ADB1B128D18BC95D
            9B40290D51F65441308EB05814244309A50CE3944C1067762F0A9983854E8027
            C87AB9CD8FE26ED6E37BCBBF381E1798CA10F16CECF29B31BA46A5F6594A9FE6
            101090C0A862C08B579F2B2860C2F9253795F4E9F6A865F8FAF8BC9FDA5A666B
            60F65269CB085DA34DB637A3525103BBB1B1B15A5C38236DE175933BD16EF2E3
            08065C6BF166070C9A3776774E001EAE74DBF54F9C7F715FD23BAE1E13C7D754
            E3E55F9A6050AC9608CF0A2CB0B940186D6752436DB5996D502E27B6723299B2
            F906DA5EE5B407E526FB490186CD9E800F75F5B54C4F41F406CEEAFF005A6A7A
            4368DAAB36F96A44DDCD0AFC9D55BBE423D2A74ADAA566EBEC9734922DDCAB20
            9232073AA504CA935050AD9332A440ABABCC5E65EFAE27C93DFBCAF7870FC3BE
            0C1951C01A3790CA77C50A425B715502EA8A2C0585AFD49A95F058795C7F1E98
            995667426C74D4124F417F535AF1F28FD2DBCF65A8742D93A0D26CCFB29A2AD3
            1F69D7F2247B190B2526C9AC932992C7B297953211C9CCD7AC916CA5E27EF174
            5B11C3659313A60E941197F807C9BC3F63F35CB707DE48B27627310FC794183B
            0428920462B1C7248CADBDA3745037065663B52C7E7CCF1B2E446B360E99287A
            69AEA3D49005BA8AD71A7FCCFEB993EBEDDDC6ECD64E2037D52DA3CA9CEE9A71
            2959FD2EF36548E8422CE181EC12512E18D65DCA38133D6CE5BA8B366E454897
            DE98A5F5CB394FDB3F370779719176CF31FA8ED0CB2922E6AC6F78236059AEA1
            9B73AA83B2CE3792BB8A5CDBC69CC432E294CD8FDCB70D19206E23A58E87ADBF
            DE2B027C5BFC6954760EADBEED0EC2D6E280BB116928FAB52A0928960DE22227
            5919BD8A7CCEA0DE3841A926621D0C545C70149FA345FBE0531957298B5D95E7
            7FDC172BDB793DBBD93E3DCF3162F1F1DF226D8089DC6CF8D3E39A12C8216572
            763B2CBBD431212D519C6ED1FEB3919DC8F211FC7F215B00776E00586A185B68
            007404F5ADE357E1A3AFED601C52EA5B87B3743D7CE569454DAF6A9B45AB4A62
            432EBBA72E8A8C1BBAEBD6A1CB97CAAA227050CB2EA196585558C650749BFEE6
            3BEF27914E6790C2E3A7E654002630057D005B7F2CAA916034B54A5784E522F6
            63F703A406DEDF86336B0FA9B937A913D05D7ED59D66D6F13AAB4FD6D2ACD4A2
            D572F54441772F1FCB4C3E121A4A766A41E2AB3A9198923A65159639BC8A5294
            0A4294A5D3DDEBDEBDC9E40EE0C9EE6EE8CFF9F94955549088802A285450B1AA
            280A07A0B9372C49249C8F0FC3E270B8898B8ABA7A9B9D4DEF7B126DFC2B34E4
            56B2D541E781E3CF07F0A7F0A88FD79F119A7EBFDA4D83D94D97685771A365BE
            5AF62D435D5AAAE81212A566B4D814B025292CFD69D9535C1ED58EB28DE2C556
            CD104933028AA4B38490592E92E67F729DC79DE34E13C77C2719FD3C418E219F
            25654733C6B6B048CE3A1C7E8354958DB4BFAD43B23B4D33B91395C8657CD013
            729B36EFD34BB06B8DA75D07BBD6A5B438E4039F10E7C38FC7F3CE6EBDC5C0F6
            D4C486B9607DB57FF0CF95B4040D0D56AD0E3EBE5E3C7EC1E5C65EA4924EDB55
            05CEBEB58FAE5A97576C520A3B035D522EE9098A6146DB5785B0A3EA21144C86
            F6A599BB4BD44495314078E400C21F51CC9E0F39CCF16C9FD37929F1EF7FF86E
            C87FB548358BCAE178CCC98E4E461AB4DF524FE1E86D5840DD10E97188098F55
            F4214BE9314C54B57D410F514C7554314E28C59054218CB18440790FEA1FC472
            52BE4EF2082CFF00F57E76E3D6F293F6F5BD61DFB23B5E40A1F8A5257A7BA41D
            7F07AFACCFA59D438F4C1169D61D089241E9E0BFFAA29071E080A1485F5AB0C7
            38A652AC7002F3E9E0C3E1E239E393C87DF590DBE7EEDCF2D6B0FE738FEE040A
            F4A768F6E470FC29C5A6CFA6E7FF006B565586D41AAABCB03981D7348857255C
            CE81C4555E1A3D72B951432AA38059AB3494F7D454C2613F3EA1378F9E6127E7
            B99C85D997C94F229EBB9C91FD95F787B6782C70045C6AAFF16FFF00CAB21269
            11121134CA04210BE9214A1E9294A1E450001E000A1E598C2E5D8316EB599892
            3810451AED8874157017811F1FDB8FFAE5A036DB3B5CFF00655C022DF6AD8D5C
            001C71F4FDBF111FC3009248235AADEFAD57EA1FC7F6FCB041B83E94AAE5694C
            5298A5314A6294C5298A5314A6294C52BFFFD2EFE314A6294C5298A5314A6294
            C5298A5314A6294C5298A5314A6294C5298A5314A62951B1F28FDB92F517AE0E
            2C918564FAE978965E9B568674922E01649DC2C9293D3874161012B3AE31122A
            6538127DD28DD2389415F506F4FDBEF8D65F25F7D4181224ABC5628596695435
            9083BD119974532EC755BF5B1B6B6AC4F3597FA3E3B22652BBC0B00DFE6DDA68
            3D6D7B9FB57A2F8CBEB097AB7D52A5D6E59B112D857D11D99B35521CE64C967B
            2B56C5630ADD3326924D1BD4EACD23E2C5244A091DC3455C089D55D5554F2F9F
            BC849E45F2472FC9E1338E13182E3E32B106C91A85761B5DD2D2CA1E4054EAAC
            B7B904D63FB570DB1F8B8E79B4CB9B5702FB742C176822FF00948BDEF73D34A9
            05CD2B526A62958BA2B48E9D82BCBDD9D0FABA8519B1E441C95F5ED955215BDB
            9D15E1408EC8B585366594311D14A00A17DDE14E03D5CF0199EC8EE9EE4CBE2A
            2E0B279ECB7E152DB60695CC22DD2D196D9A7A69A7A57C571E0590CCB0A894FF
            009AC2FF00DBD6B28E606BED4C52BF8A42363A5DA28C2558339262B7A7DD66FD
            B22EDAABE93018BEE20E08A247F498390E43C073EB0CF363C8B2E3CAC928E854
            9047F11AD5080C2CC2E2BFA104106A8A4DDB229376E890A9A282099124524C80
            052269A640290842943800000000CB1DDE46677625C9B927524FDCD540034034
            AFD72DA5314AD74BEF51FACFB3ECCDAE57CD23AEECB686CA9172CD3FAEB1FBD7
            0B11F37922ACF944134BF51541E3529FD4B82823E203E023933E27C89DF1C160
            BF1BC4F74664180C2DB1646DA06D2B6506FB45891EDB57964C1C499C49263A17
            FADAB3FB08E8F8A6A9318C62D23992042A683462DD16AD914C85021089208108
            9A6421400000000000322334D36448D2CF2B3CA4EA58924FE24EB5E90001602C
            2BFB33E555A6295411E3F6FDBF1C5AA97D40F5AAE2AB54E3F6E32B54B69F7A71
            E1FEB94D01BDAAEBEB4E07F1FE596EDBB5C9F6FD29A7D29C0FE3FCB2B6F7023A
            7AD50585F4D29C06000096F5355B9A71E7F9E2DE8C6E297A7183722C0D8D5B6D
            6F4E3C79E7F76069A7A52C2F7235A71E7F9E05FD4D569C787195161D2834A71C
            79656F4373EB4CB0020DEF4AAE5D4A6294C5298A5314A6294C5298A5314A6295
            FFD3EFE314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C529
            8A5314AB4C20003E3FF5FCBC390CA5C5C5C8FE34D34B916FBD7385DAE891F902
            F941A475F9AC62964D23D5F88143699DD9CEA5682665BF4F9EBA9CAAB370454A
            65D5342412DFEC51376C5C14440A1C877778B3207863C09CE77DCD971C3DCBDC
            1B861AED027FE5B3C51050E9EEB0DF3A9BB27C6E0AADCFBA0DC934BCBF318F82
            AADFA4420B1D76D87E6E87EE069EBD6BA3C4D322442249940A44C85210A1CF81
            4A1C00723C88F019C26CCCECCEC6EC4D4DD1163554450100D00ABF29575314A6
            294C5298A5314A6294C5298A5314A6294C5298A55A3CF808073C73F5E32D6BDC
            0B7B7D684900D850004047FCB2E26E743D29AF52D576294C5298A5314A6294C5
            298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C52BFF
            D4EFE314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A
            550079001F2E439FF5FF002C5056B576F3B0319D62EBE6C5DC0ED049FCAC0C49
            18D3A0CEA1087B15E67DD21095186210445551BAD34FD251D9932A87418A4B2D
            E931533064EBC6BD9199E43EF2E1FB6314592566695C86B47146A5E462CA926C
            B85D88C54AFC8C80F5AF3E565438704993382635F416B9BFA0B9009FB5EB48BE
            2A7AC937ABF564A6FBD980B49EE6EC9CAB8D816A98957067326A434EBE73271A
            574531CCD8CFA7DC3E7B38E154C3D462C9A69187D2DCA52EDDFDC3F907079DE7
            13B2BB61923ECDE1AD1C0912AAC7BC28F9186C3B6CADEC50028055AC093B8C73
            B7B8F9A3F9794CB62679FA2926C8BF40A7F2DEC09B137D2FF6973CE68A95D314
            A6294C5298A5314A6294C5298A5314A6294C5298A5314AA087395141F5AAE5A1
            4026D4A65694C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5
            314A6294C5298A5314A6294C52BFFFD5EFE314A6294C5298A5314A6294C5298A
            5314A6294C5298A5314A6294C5283F97E5FE7E3FCB14AB4C21E5FCBF77F9650E
            E3D2D4FB5EA03BBDB28EBB89F201D77E8CC03A32D49D54E92DADB995622F0C46
            D32F2116943C7CBFA1B011A9E275AB8226CDC114F68EEED89A4731552138EC7F
            0EE20F19786BBDBCC39F8B1FF55CBDB8D801ED775DE61768810AD632B9123248
            4ED88FB3DB678872BBF91E5F0F8C599963424B8048BE8185C7AD80D2E3D7EF53
            CAC98B462DDA3164D1166CA3DBB7419356C99516CD106E899AB76ED914CA5226
            8A2D800A52800014BC0007E1C7F24B24AD2492485A4724B126E4926E49275249
            D6FEB52D55002802C057F767C6AEA6294C5298A5314A6294C5298A5314A6294C
            5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298
            A5314A6294C5298A5314A6294C5298A5314A6295FFD6EFE314A6294C5298A531
            4A6294C5298A5314A6294C5298A5314A6294C52AC288184C21CFF48FA3C7CB90
            F1110FCBC72A740052B156EFDB759D11A96FFB7EE0A18B5FA0D71F4F3C6E99CA
            57522BA252A11B0CC0040DEB929B955D066D8A0022770B90A00223C667FB53B6
            B93EF2E7F8BED9E263DDC865CBB17AD94005D9DAC19B6A22B3B5813B54D81AB2
            5922C789E69DC2C2A2ECC6C2DF4D4E835D05EA2A7E21F4C58E4A376FF77B6C15
            BBFD9FD99B64F3D859538FBCE18527FB89D3E966AC8CA7AD6631EFACA8119A4D
            C04132B28467E8295204C33A47F739DC3C2E06676E7883B4B7AF6E76EC641F72
            959259911D49D9657745662D232862F2C9EA599A1DDAD164E5BE6F3598C0FCCD
            68CEB7DA3437B93F40343616B7E135D9C9D534A6294C5298A5314A6294C5298A
            5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314
            A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C52BFFD7EFE314
            A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C52ADF4F00005F
            A7EDFE63837275354B7A54387C8ADC9E6F4D91AD3A2D498A9A969BB4CB41DDAF
            2E218EC574212BC87DFA51F293CD0EEBDD2C3579C8FEA8A7B8918AA386AD8A41
            13F80F4D784B8E8BB3F89E53CBDCACA91E3E287871F78237C84599118A106470
            DB16CC081BF75D4D6079891F24A7191D8EFD587D47E17D40B5CF5152B5AF2830
            7AD29151A056C8AA15DA556E1AAB04CD438280D6220639946472227F494CB289
            B662513A86E4CA2863187C4739E397E572B99E473793CC72D97912B48EC492CC
            CC4B124B124F5B6A4E80565F1B1A2C5823C7894089458002C3FB0695EDF3195E
            8A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A62
            94C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5
            298A5314A6294C52BFFFD0EFE314A6294C5298A5314A6294C5298A5314A6294C
            5298A5314A6295F8ACE116E0515942900E72244F518A5F528A1CA9A640130940
            4C73980003CC4472E5467B8517B0BFF66A684DABE74A3F76C191156F1EA483E5
            544124993754A9945554E0022ABA5121220D520F151412F814078011E033EF04
            31CD295798244012588F41F417D49F417EB569240D05CD6BE683EAC6BCD08F6E
            7678AFD42D3B1762D825AC372D876A72795B2BF349BC3B94A15A3E74770E58C0
            4625EDA28372A86E48917D663894BE99A778790B9BEEF838BE3B23E3C6E0F0A1
            48E1C6847C7082A2C65641ED695FAB3D87D0002BC78B831E31924DCCF33124B3
            1B9D4F41F41F6AD9AC8157BA98A5314A6294C5298A5314A6294C5298A5314A62
            94C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5
            298A5314A6294C5298A5314A6294C5298A5314A6295FFFD1EFE314A6294C5298
            A5314A6294C5298A5314A6294C5298A5314A6295F92BED8FB7EE09407D61ED88
            FF00FB9C0F1E9E7FFCB8E78CB9776B6E96D6A86DEB5FA7D07C7E83E21E7F9887
            1F5CA7AD56A84FF613C447FA4BE23CF23E01E23CF8F383D4D074ABB294A6294C
            5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298
            A5314A6294C5298A5314A6294C5298A5314A6294C5298A5314A6294C5298A531
            4A6294C5298A57FFD9}
          mmHeight = 24606
          mmLeft = 155840
          mmTop = 4233
          mmWidth = 45244
          BandType = 5
          GroupNo = 2
        end
        object ppImage5: TppImage
          UserName = 'Image1'
          MaintainAspectRatio = False
          Stretch = True
          Picture.Data = {
            0A544A504547496D616765DFB30000FFD8FFE000104A4649460001020100C800
            C80000FFE10EC34578696600004D4D002A000000080007011200030000000100
            010000011A00050000000100000062011B0005000000010000006A0128000300
            0000010003000001310002000000140000007201320002000000140000008687
            690004000000010000009C000000C80000004E000000010000004E0000000141
            646F62652050686F746F73686F7020372E3000323030363A30333A3234203133
            3A34353A34320000000003A001000300000001FFFF0000A00200040000000100
            00012BA0030004000000010000006D0000000000000006010300030000000100
            060000011A00050000000100000116011B0005000000010000011E0128000300
            00000100020000020100040000000100000126020200040000000100000D9500
            00000000000048000000010000004800000001FFD8FFE000104A464946000102
            01004800480000FFED000C41646F62655F434D0002FFEE000E41646F62650064
            8000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518
            131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14
            110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0CFFC0001108002F008003012200021101031101FFDD
            00040008FFC4013F000001050101010101010000000000000003000102040506
            0708090A0B010001050101010101010000000000000001000203040506070809
            0A0B1000010401030204020507060805030C3301000211030421123105415161
            1322718132061491A1B14223241552C16233347282D14307259253F0E1F16373
            3516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A4
            85B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7
            B7C7D7E7F7110002020102040403040506070706053501000211032131120441
            51617122130532819114A1B14223C152D1F0332462E1728292435315637334F1
            250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F346
            94A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F6273747576777
            8797A7B7C7FFDA000C03010002110311003F00E83AA5B9F6FD66B5D5E56461E0
            E3DB8EC7667AC46257631B5DCFC5BF18BC31EECE765E2637F83AFF00E32EDEC4
            EDFAF7D46C38D4B70E8AB232F14659365CE15D15CE4DCE7E4B9B56F733EC38D5
            5EDF631FFA55D0FF00CDBE8C6FFB43E8363FD57646DB2CB1F5FACE1B5D79C7B2
            C7D1EAED3B58FF004FF47FE0D03FE677D5BF4994FD89BB6B25CD3BECDC65A29D
            8FB7D4F56DA7D1632AF42C7FA3E9575D7E9FE8D2538787F5E3AC5F9386DB3029
            6D179C41716D8E73DBF6BADF94DD8CD9F4E9C663EFB6BFF475FF00C2A01FAC3D
            65FD45BD5863007EC58EEC6C0F5EC2C2DEA1955E2E0BB259B7D16666C6DDBBD3
            AFFEB9FA15D28FAA1F56C630C5FB0B0D1EAB2F2C25C77595B7D1ADF639CFDD6F
            E88ECD967B1EA2FE81F567A65673EDA19533118C71BAC7BDE18DA0FAB413EA3D
            FF00D19DFCCFFA2FF06929A9D1FEB3F51CCEA956165E25555577DAAA6DB4DAEB
            09BB05F5D196FDAFAAAFD55F65BB28FF000CA8F52FAC6F39F8FD4DE07ECFC1FB
            5DF45753DFEA5C29FF0025FE9E98F43F58CFCA6331377F35FCEFF84BBD2DAE89
            FF003632727273FA3369764BC9FB4D958878361F55C5CC7ED7D6DC87B7D5FA3F
            AC3D9EA7E911CFD5BE845F65870692EB83DB612D996DB3EB57FF0015639CF7FA
            7FCDFA8F7D9FCE3D2539F6756EA4EFAADD4F3B3E9FB25D55570A0D62DACB87A7
            FA1B18CB9B4E652EF59FE8FE92BA6DFD17ADFA3F5162F4DFAC19F8734E3557E4
            5D94FF00B3328C9B6CCA7D77E1B4B7AB64DADA9D956D555B7DB8B8F4515D9E8F
            FDACB3ECD8F62EBBF6274A3856603B198EC5B9DEA5B53A5C1EF90FF52E73A5D6
            BF7319EEB102DC0FABD9F9593876534DF9353997E5551EE0EB5868AECB23F3AF
            C7A7D27FFA5A3F9DFD1A4A7187D72EA2C7DE3230E967A2195FA35DAEB5E32AD3
            5574607A9555B326DDF77AD97F62F5FEC78DE9FB2CBADD89ADFAD7D72BC9AF19
            B8B8D658CF47ED526CACB7ED1955E061B7D17B5CEC77E5D767DA2AAEE7FA9557
            5EFC8F4FF475AD7C5E91F566F7E4B317128268B1D46431AC86B2C22ABEC6B5B1
            B19639A719FEA53FF05FE891FF00E6F743F46EA0E0D26BC9D87201603EA1ADC6
            DA9D713EEB5CCB1CE7EE7A3A29E5F33EB1E6DDD4F17A8B6BFD571ABCAC8C5C5A
            ADB37DCD0F6F49C3FB657B7D067DB72727D5C6FD15F7D0CAFF007FF46B79B9BD
            4B23EAFE6D99B50C7C98B6AA0D65F5EFDC36635BB1DFACE23EC7BFE859FA7AFF
            009CFD1AB3FF0036FA01DD3D3F1CEE6B9866B69F6BBE95634F6D7FC844C6C3E9
            791D3ABA69A07D89E458DACB5CC976EF5BD4B2BB032CF53D6FD2BFD5FF0009FA
            4414F1985D77AC9CCC290FBDF8D8756156CB6D2DADF9CFB874EC8CECB2C739D6
            D4CB31F2FD3F518FB2DF42DF43F9E576DFAE7D5D98CDB6BC7C5B5C19936B8EFB
            007331F26BE9D43AA1B1FF00D3ECB3F41BFF00E33FE33A57741E88FDE1D83445
            B1BC0ADA276BDD7B381F9B7BDF77FC6BF7A66F40E86DA6DA1B818EDAB21BB2E6
            36B680E6CEED8E81F4377E6A4A71B33EB3F58A3A8646333168F4DB6B198DBDCF
            2EB6B376360DB7D56D4C7E35B6579195E8DB88EB71EFC6B3D3F53E9A333EB075
            1CECDA31BA63318D775D943D5B1CE745189663E35D735B57D37D975D67A4CDD5
            FF00817AD31D03A20168183481788B1A1800225B67D11ED67E92BAECF67F84AE
            BB11B17A574CC3B3D4C4C4A71EC870DD556D6187EC3609635BF4FD1A777FC556
            929FFFD0F55492492529677D61C4BB3BA0F51C3C76EFBF231ADAEA64812F731C
            DADBB9C5AD6FBD68A4929E43AAF4CEAFD4C17D787651432BC5A2DA2C757BF22B
            6D86EC96EDAAF6B7D3A7F47FA3B7268FB47EB55FFC76364F43FAC584C6E73EBB
            76E3605CCB6FC8BDA5B557E8E50F4DBE85CEBB7D5BEAFD06CCBA6CB3D2BFED9B
            EA5E90B07EB459D52AFB237A7E58A9F9773315B8C696DA2C73CEFB6CB1EFFA14
            E361D7937DBEDFF0692587D55C2C9E9D4D947D8ADC4C3BAC0EA69B2CAED35C55
            5FAF6DAF6DD67F4AC86BF6329DFF00E9AD653EB2CACDFABFF591BF6BEA18BB6D
            CCEA8DCBA2EA016D6FAABBDBB70ECFB66FFD2FD93ECB895B3DBFA1F5F27D246E
            9BD67AA542AEA99FD45B6E05B9997897631A18C6D4DA0E57A5763DACDB7FB1B8
            5EF65FEBFE8ADFF82F5103A57D61FAC76BB1F32FB29B46465BBA70E9C40635AF
            F41F9D5E4DB975D6FBD976F67A3633D0F47ECFFA5F47D44B7521ABA1F58C5C2C
            9AFA6F4CBE8AF2D9D431E9C637D4D751F686E0D18B7DAEF5DDB98CFB1DEFFD0D
            F7DBFF006E285FF55BAFE5754BEEB314575E4DE0E5BD96EDF56AFB5D177F3FEB
            D993732BC2ADEEAB7D589F65FE8B8F4ADFB7AA756A3EAB5D96E732FEA62DB71D
            86B686B3D4394FC1A7D2ADEE3FCD6E67A6CB9FFA5D9FA75857FD66FAC143F1A8
            75AF6DB8AEB1DD40595545D5D63269A6AB3AB7A1BABAE8FD9D63EEF5BA6FF38F
            FD37F315DA929351F55FA8D59B8D38CF18F8B90F380EAACA87D9AAFB75993FE1
            4BDCD65DD3FD1FE66BB6CF437E0DBE8AAECFA9DD59D59B7331BED0EF5B17D7A3
            D61BAEC56567ED586DF7B29FD1653997575DF6FBFD0FE90B6FEAEF54EAD7F54C
            8C7EAA6DADD78BAFC1A5CDA7D3F42BBBD1DD5D947E9F7D6DB686BFED1FCE6FF5
            6B5D2A48733EAD6166E0743C4C4CE339153082DDDBF634B9CEA68F54FF003BF6
            7A4D747A9F9FE9AD3492494A49249253FFD1F554924925357A8F53C1E978A72F
            3EE14501CD66E20925CE3B58C63181CF7BDDFBAC6AA0FF00ADFF0057995D369C
            A2E6E436C7D7B2AB5E76D27D3C83636BA9CEA3D17FF3BEB7A7B143EB46EAFF00
            6665B6B6E43B1339B60C573D8C7DBBAABE8DB8BEBBABAEDCBA7D5FB4D356FF00
            D27A0B1461E5F59FAC15DBBDDD11CFC6CB0F6E25B49C90C176333F5968F5DB56
            45FBFD6BFD365BF67FD5BF4FEBA4AD1E8DBF593A3599C302AB9D6DE5CC67E8AA
            B6CAE6C636FAA726AA9F8CDDF4BDB67F3C975ACFE8BD35D8B9BD56E149A9EEFB
            313BCFBDCC7B6C77A556EDDB28F537D8F66CA98B13A3748C019FD4F3B1AF7BB0
            B1AC60C7C5C5C86FD9ECAC61E336722A659E9D963BFEED3FF72C46FAC2EBEEE8
            987474FC77574E4D5FA7353F1C5F4E20ADAFBE9C7B6FC8AF1F759FA2C7B722AB
            EEAEAABF4DFA4FD124AB1DD7AFA6FD4DBFA964F4A6B9F66558CC8F531CDB906B
            032007E77D9F73FECACBDF5E4B7D5FB3FEB15D377EE2B619F569AF7FD64AC178
            A5CFADD6D42D7B459593D36CB2BC3AB7B5F90D6B3EC9F69AB1FD5FB37F84FB3A
            E6874ACCCCEAF6331721BD3CE49BC57955DB5595331DD4E30AE9C2C4AB23D5AB
            AA574575372B2A9FA14FE97D6B6BBF196D7D5F6F50C3FAB7751D3EBA728B7EDC
            FE9F6633EBF4496DAFFB1D3BCDF7FF004A7BDD6D7FE0F16AFD5F2ACF5EBFD2AA
            524FB77D53CCAAAC31EADB5F51764D6CA05793EE73EF69CEB2DAC33F57F4F39D
            ECCABBD2FB2D9EA7D9ADA7F489B0307EA87557368C49C9774F71792EB2F978B2
            DF55D65B6DAFFF002A635B978BBB7D8FCAC5F56854ACE96D66474FC6E9DBF232
            6BC6C7A4751A333D373594DFFAEDD9784DB6BFB432FF00D2B9D631997F69CAFD
            0647A1FCFA97D5FC7C9AB2714D6292EC7E9D4E0D268B6AB05B487BB6F57635AF
            DFF62DB5D7E8B7F9CB2EBB22BFF07EB5CA94E8639FAADD16FCCBF187A778B451
            732B175CE165B39DF65C4C660BB6EFF55F976E3E0D5FF0D6FF0036AEE3FD62E8
            D93954E2E3E48B6CC86B5D516B5E6B3BEB3955D7F68D9F676DEFC66FDA3ECEFB
            7D7F43F4BE9FA6B923D1AEA5CD0CCAA7A9578B941BE8635CDC4BEFBBECF65196
            E392DC9F57F6931FFACE4FAD90CB2DAFED5FF128FD23A2F54664865798D665B2
            F65B939D55E2D66B89E85D87660976CB72EAB85367AD7E3FE9719ECCAF53D4FD
            592A53D864750C2C5B195645CDA9F636CB1A1C63D9500FBEC73BE8B2BA9AE6EF
            7BD0FA7755C1EA75BECC473C8ADC1AF6D95D94BC4B458C3E964B2AB76595BF7D
            766CD8F5CE750E905BD44BB3FA96264BADA2C398CC90DA6DFB20A2CC7B2A6D8C
            B7763E0D9617DD916534FE8EEFD37FC1AD0FAAB899F8EDCB7752B1CFCBB0D52D
            B6CAEDB5AC656DADBEA3F19B555E9BAE6DFE87E8FD4B2BFD35FF00AC596A4A77
            D2492494FF00FFD9FFED138250686F746F73686F7020332E30003842494D0425
            000000000010000000000000000000000000000000003842494D03ED00000000
            001000C800000002000200C80000000200023842494D042600000000000E0000
            00000000000000003F8000003842494D040D000000000004000000783842494D
            04190000000000040000001E3842494D03F30000000000090000000000000000
            01003842494D040A00000000000100003842494D271000000000000A00010000
            0000000000023842494D03F5000000000048002F66660001006C666600060000
            00000001002F6666000100A1999A0006000000000001003200000001005A0000
            0006000000000001003500000001002D000000060000000000013842494D03F8
            0000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E8
            00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000000000
            000200013842494D0402000000000004000000003842494D0408000000000010
            000000010000024000000240000000003842494D041E00000000000400000000
            3842494D041A00000000034D0000000600000000000000000000006D0000012B
            0000000C00530065006D0020007400ED00740075006C006F002D003200000001
            000000000000000000000000000000000000000100000000000000000000012B
            0000006D00000000000000000000000000000000010000000000000000000000
            000000000000000010000000010000000000006E756C6C000000020000000662
            6F756E64734F626A630000000100000000000052637431000000040000000054
            6F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042
            746F6D6C6F6E670000006D00000000526768746C6F6E670000012B0000000673
            6C69636573566C4C73000000014F626A6300000001000000000005736C696365
            0000001200000007736C69636549446C6F6E67000000000000000767726F7570
            49446C6F6E6700000000000000066F726967696E656E756D0000000C45536C69
            63654F726967696E0000000D6175746F47656E65726174656400000000547970
            65656E756D0000000A45536C6963655479706500000000496D67200000000662
            6F756E64734F626A630000000100000000000052637431000000040000000054
            6F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042
            746F6D6C6F6E670000006D00000000526768746C6F6E670000012B0000000375
            726C54455854000000010000000000006E756C6C544558540000000100000000
            00004D7367655445585400000001000000000006616C74546167544558540000
            000100000000000E63656C6C54657874497348544D4C626F6F6C010000000863
            656C6C546578745445585400000001000000000009686F727A416C69676E656E
            756D0000000F45536C696365486F727A416C69676E0000000764656661756C74
            0000000976657274416C69676E656E756D0000000F45536C6963655665727441
            6C69676E0000000764656661756C740000000B6267436F6C6F7254797065656E
            756D0000001145536C6963654247436F6C6F7254797065000000004E6F6E6500
            000009746F704F75747365746C6F6E67000000000000000A6C6566744F757473
            65746C6F6E67000000000000000C626F74746F6D4F75747365746C6F6E670000
            00000000000B72696768744F75747365746C6F6E6700000000003842494D0411
            00000000000101003842494D0414000000000004000000023842494D040C0000
            00000DB100000001000000800000002F000001800000468000000D9500180001
            FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D
            0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C0909
            0C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E
            0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C
            0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108002F00
            8003012200021101031101FFDD00040008FFC4013F0000010501010101010100
            000000000000030001020405060708090A0B0100010501010101010100000000
            000000010002030405060708090A0B1000010401030204020507060805030C33
            010002110304211231054151611322718132061491A1B14223241552C1623334
            7282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E2
            65F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6
            B6C6D6E6F637475767778797A7B7C7D7E7F71100020201020404030405060707
            0605350100021103213112044151617122130532819114A1B14223C152D1F033
            2462E1728292435315637334F1250616A2B283072635C2D2449354A317644555
            367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F556667686
            96A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00
            E83AA5B9F6FD66B5D5E56461E0E3DB8EC7667AC46257631B5DCFC5BF18BC31EE
            CE765E2637F83AFF00E32EDEC4EDFAF7D46C38D4B70E8AB232F14659365CE15D
            15CE4DCE7E4B9B56F733EC38D55EDF631FFA55D0FF00CDBE8C6FFB43E8363FD5
            7646DB2CB1F5FACE1B5D79C7B2C7D1EAED3B58FF004FF47FE0D03FE677D5BF49
            94FD89BB6B25CD3BECDC65A29D8FB7D4F56DA7D1632AF42C7FA3E9575D7E9FE8
            D2538787F5E3AC5F9386DB30296D179C41716D8E73DBF6BADF94DD8CD9F4E9C6
            63EFB6BFF475FF00C2A01FAC3D65FD45BD5863007EC58EEC6C0F5EC2C2DEA195
            5E2E0BB259B7D16666C6DDBBD3AFFEB9FA15D28FAA1F56C630C5FB0B0D1EAB2F
            2C25C77595B7D1ADF639CFDD6FE88ECD967B1EA2FE81F567A65673EDA1953311
            8C71BAC7BDE18DA0FAB413EA3DFF00D19DFCCFFA2FF06929A9D1FEB3F51CCEA9
            56165E25555577DAAA6DB4DAEB09BB05F5D196FDAFAAAFD55F65BB28FF000CA8
            F52FAC6F39F8FD4DE07ECFC1FB5DF45753DFEA5C29FF0025FE9E98F43F58CFCA
            6331377F35FCEFF84BBD2DAE89FF003632727273FA3369764BC9FB4D95887836
            1F55C5CC7ED7D6DC87B7D5FA3FAC3D9EA7E911CFD5BE845F65870692EB83DB61
            2D996DB3EB57FF0015639CF7FA7FCDFA8F7D9FCE3D2539F6756EA4EFAADD4F3B
            3E9FB25D55570A0D62DACB87A7FA1B18CB9B4E652EF59FE8FE92BA6DFD17ADFA
            3F5162F4DFAC19F8734E3557E45D94FF00B3328C9B6CCA7D77E1B4B7AB64DADA
            9D956D555B7DB8B8F4515D9E8FFDACB3ECD8F62EBBF6274A3856603B198EC5B9
            DEA5B53A5C1EF90FF52E73A5D6BF7319EEB102DC0FABD9F9593876534DF93539
            97E5551EE0EB5868AECB23F3AFC7A7D27FFA5A3F9DFD1A4A7187D72EA2C7DE32
            30E967A2195FA35DAEB5E32AD35574607A9555B326DDF77AD97F62F5FEC78DE9
            FB2CBADD89ADFAD7D72BC9AF19B8B8D658CF47ED526CACB7ED1955E061B7D17B
            5CEC77E5D767DA2AAEE7FA95575EFC8F4FF475AD7C5E91F566F7E4B317128268
            B1D46431AC86B2C22ABEC6B5B1B19639A719FEA53FF05FE891FF00E6F743F46E
            A0E0D26BC9D87201603EA1ADC6DA9D713EEB5CCB1CE7EE7A3A29E5F33EB1E6DD
            D4F17A8B6BFD571ABCAC8C5C5AADB37DCD0F6F49C3FB657B7D067DB72727D5C6
            FD15F7D0CAFF007FF46B79B9BD4B23EAFE6D99B50C7C98B6AA0D65F5EFDC3663
            5BB1DFACE23EC7BFE859FA7AFF009CFD1AB3FF0036FA01DD3D3F1CEE6B9866B6
            9F6BBE95634F6D7FC844C6C3E9791D3ABA69A07D89E458DACB5CC976EF5BD4B2
            BB032CF53D6FD2BFD5FF0009FA4414F1985D77AC9CCC290FBDF8D8756156CB6D
            2DADF9CFB874EC8CECB2C739D6D4CB31F2FD3F518FB2DF42DF43F9E576DFAE7D
            5D98CDB6BC7C5B5C19936B8EFB007331F26BE9D43AA1B1FF00D3ECB3F41BFF00
            E33FE33A57741E88FDE1D83445B1BC0ADA276BDD7B381F9B7BDF77FC6BF7A66F
            40E86DA6DA1B818EDAB21BB2E636B680E6CEED8E81F4377E6A4A71B33EB3F58A
            3A8646333168F4DB6B198DBDCF2EB6B376360DB7D56D4C7E35B6579195E8DB88
            EB71EFC6B3D3F53E9A333EB0751CECDA31BA63318D775D943D5B1CE745189663
            E35D735B57D37D975D67A4CDD5FF00817AD31D03A20168183481788B1A180022
            5B67D11ED67E92BAECF67F84AEBB11B17A574CC3B3D4C4C4A71EC870DD556D61
            87EC3609635BF4FD1A777FC556929FFFD0F55492492529677D61C4BB3BA0F51C
            3C76EFBF231ADAEA64812F731CDADBB9C5AD6FBD68A4929E43AAF4CEAFD4C17D
            787651432BC5A2DA2C757BF22B6D86EC96EDAAF6B7D3A7F47FA3B7268FB47EB5
            5FFC76364F43FAC584C6E73EBB76E3605CCB6FC8BDA5B557E8E50F4DBE85CEBB
            7D5BEAFD06CCBA6CB3D2BFED9BEA5E90B07EB459D52AFB237A7E58A9F9773315
            B8C696DA2C73CEFB6CB1EFFA14E361D7937DBEDFF0692587D55C2C9E9D4D947D
            8ADC4C3BAC0EA69B2CAED35C555FAF6DAF6DD67F4AC86BF6329DFF00E9AD653E
            B2CACDFABFF591BF6BEA18BB6DCCEA8DCBA2EA016D6FAABBDBB70ECFB66FFD2F
            D93ECB895B3DBFA1F5F27D246E9BD67AA542AEA99FD45B6E05B9997897631A18
            C6D4DA0E57A5763DACDB7FB1B85EF65FEBFE8ADFF82F5103A57D61FAC76BB1F3
            2FB29B46465BBA70E9C40635AFF41F9D5E4DB975D6FBD976F67A3633D0F47ECF
            FA5F47D44B7521ABA1F58C5C2C9AFA6F4CBE8AF2D9D431E9C637D4D751F686E0
            D18B7DAEF5DDB98CFB1DEFFD0DF7DBFF006E285FF55BAFE5754BEEB314575E4D
            E0E5BD96EDF56AFB5D177F3FEBD993732BC2ADEEAB7D589F65FE8B8F4ADFB7AA
            756A3EAB5D96E732FEA62DB71D86B686B3D4394FC1A7D2ADEE3FCD6E67A6CB9F
            FA5D9FA75857FD66FAC143F1A875AF6DB8AEB1DD40595545D5D63269A6AB3AB7
            A1BABAE8FD9D63EEF5BA6FF38FFD37F315DA929351F55FA8D59B8D38CF18F8B9
            0F380EAACA87D9AAFB75993FE14BDCD65DD3FD1FE66BB6CF437E0DBE8AAECFA9
            DD59D59B7331BED0EF5B17D7A3D61BAEC56567ED586DF7B29FD1653997575DF6
            FBFD0FE90B6FEAEF54EAD7F54C8C7EAA6DADD78BAFC1A5CDA7D3F42BBBD1DD5D
            947E9F7D6DB686BFED1FCE6FF56B5D2A48733EAD6166E0743C4C4CE339153082
            DDDBF634B9CEA68F54FF003BF67A4D747A9F9FE9AD3492494A49249253FFD1F5
            54924925357A8F53C1E978A72F3EE14501CD66E20925CE3B58C63181CF7BDDFB
            AC6AA0FF00ADFF0057995D369CA2E6E436C7D7B2AB5E76D27D3C83636BA9CEA3
            D17FF3BEB7A7B143EB46EAFF006665B6B6E43B1339B60C573D8C7DBBAABE8DB8
            BEBBABAEDCBA7D5FB4D356FF00D27A0B1461E5F59FAC15DBBDDD11CFC6CB0F6E
            25B49C90C176333F5968F5DB5645FBFD6BFD365BF67FD5BF4FEBA4AD1E8DBF59
            3A3599C302AB9D6DE5CC67E8AAB6CAE6C636FAA726AA9F8CDDF4BDB67F3C975A
            CFE8BD35D8B9BD56E149A9EEFB313BCFBDCC7B6C77A556EDDB28F537D8F66CA9
            8B13A3748C019FD4F3B1AF7BB0B1AC60C7C5C5C86FD9ECAC61E336722A659E9D
            963BFEED3FF72C46FAC2EBEEE8987474FC77574E4D5FA7353F1C5F4E20ADAFBE
            9C7B6FC8AF1F759FA2C7B722ABEEAEAABF4DFA4FD124AB1DD7AFA6FD4DBFA964
            F4A6B9F66558CC8F531CDB906B032007E77D9F73FECACBDF5E4B7D5FB3FEB15D
            377EE2B619F569AF7FD64AC178A5CFADD6D42D7B459593D36CB2BC3AB7B5F90D
            6B3EC9F69AB1FD5FB37F84FB3AE6874ACCCCEAF6331721BD3CE49BC57955DB55
            95331DD4E30AE9C2C4AB23D5ABAA574575372B2A9FA14FE97D6B6BBF196D7D5F
            6F50C3FAB7751D3EBA728B7EDCFE9F6633EBF4496DAFFB1D3BCDF7FF004A7BDD
            6D7FE0F16AFD5F2ACF5EBFD2AA524FB77D53CCAAAC31EADB5F51764D6CA05793
            EE73EF69CEB2DAC33F57F4F39DECCABBD2FB2D9EA7D9ADA7F489B0307EA87557
            368C49C9774F71792EB2F978B2DF55D65B6DAFFF002A635B978BBB7D8FCAC5F5
            6854ACE96D66474FC6E9DBF2326BC6C7A4751A333D373594DFFAEDD9784DB6BF
            B432FF00D2B9D631997F69CAFD0647A1FCFA97D5FC7C9AB2714D6292EC7E9D4E
            0D268B6AB05B487BB6F57635AFDFF62DB5D7E8B7F9CB2EBB22BFF07EB5CA94E8
            639FAADD16FCCBF187A778B451732B175CE165B39DF65C4C660BB6EFF55F976E
            3E0D5FF0D6FF0036AEE3FD62E8D93954E2E3E48B6CC86B5D516B5E6B3BEB3955
            D7F68D9F676DEFC66FDA3ECEFB7D7F43F4BE9FA6B923D1AEA5CD0CCAA7A9578B
            941BE8635CDC4BEFBBECF65196E392DC9F57F6931FFACE4FAD90CB2DAFED5FF1
            28FD23A2F54664865798D665B2F65B939D55E2D66B89E85D87660976CB72EAB8
            5367AD7E3FE9719ECCAF53D4FD592A53D864750C2C5B195645CDA9F636CB1A1C
            63D9500FBEC73BE8B2BA9AE6EF7BD0FA7755C1EA75BECC473C8ADC1AF6D95D94
            BC4B458C3E964B2AB76595BF7D766CD8F5CE750E905BD44BB3FA96264BADA2C3
            98CC90DA6DFB20A2CC7B2A6D8CB7763E0D9617DD916534FE8EEFD37FC1AD0FAA
            B899F8EDCB7752B1CFCBB0D52DB6CAEDB5AC656DADBEA3F19B555E9BAE6DFE87
            E8FD4B2BFD35FF00AC596A4A77D2492494FF00FFD9003842494D042100000000
            005500000001010000000F00410064006F00620065002000500068006F007400
            6F00730068006F00700000001300410064006F00620065002000500068006F00
            74006F00730068006F007000200037002E003000000001003842494D04060000
            000000070008000100010100FFE11248687474703A2F2F6E732E61646F62652E
            636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D27EFBB
            BF272069643D2757354D304D7043656869487A7265537A4E54637A6B63396427
            3F3E0A3C3F61646F62652D7861702D66696C74657273206573633D224352223F
            3E0A3C783A7861706D65746120786D6C6E733A783D2761646F62653A6E733A6D
            6574612F2720783A786170746B3D27584D5020746F6F6C6B697420322E382E32
            2D33332C206672616D65776F726B20312E35273E0A3C7264663A52444620786D
            6C6E733A7264663D27687474703A2F2F7777772E77332E6F72672F313939392F
            30322F32322D7264662D73796E7461782D6E73232720786D6C6E733A69583D27
            687474703A2F2F6E732E61646F62652E636F6D2F69582F312E302F273E0A0A20
            3C7264663A4465736372697074696F6E2061626F75743D27757569643A626133
            38333966632D626235342D313164612D393463632D3861336464636132363338
            36270A2020786D6C6E733A7861704D4D3D27687474703A2F2F6E732E61646F62
            652E636F6D2F7861702F312E302F6D6D2F273E0A20203C7861704D4D3A446F63
            756D656E7449443E61646F62653A646F6369643A70686F746F73686F703A6261
            3338333966612D626235342D313164612D393463632D38613364646361323633
            38363C2F7861704D4D3A446F63756D656E7449443E0A203C2F7264663A446573
            6372697074696F6E3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D6574
            613E0A2020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020200A202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020200A20202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020200A2020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020200A202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020200A20202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            0A20202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020200A2020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020200A202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020200A20202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020200A2020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020200A202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020200A20
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020200A20202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020200A2020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020200A202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020200A20202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020200A2020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020200A202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            200A202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020200A20202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020200A2020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020200A202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020200A20202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020200A2020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020202020202020202020200A
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020200A202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020200A20202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020200A2020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020200A202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020200A20202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020202020202020202020202020200A2020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20200A2020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020200A202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020200A20202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020202020200A2020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020202020202020202020202020200A202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020200A20202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            0A20202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020200A2020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            202020202020202020200A202020202020202020202020202020202020202020
            2020202020202020202020202020202020202020202020202020202020202020
            20200A3C3F787061636B657420656E643D2777273F3EFFEE000E41646F626500
            644000000001FFDB008400010101010101010101010101010101010101010101
            0101010101010101010101010101010101010101010102020202020202020202
            0203030303030303030303010101010101010101010102020102020303030303
            0303030303030303030303030303030303030303030303030303030303030303
            030303030303030303030303FFC0001108006D012B03011100021101031101FF
            DD00040026FFC400BA0000010305010100000000000000000000000708090102
            05060A0403010002030101010000000000000000000000040102030506071000
            0006020004040403050408040700000102030405060708001114092112131531
            1617184151617191222324F081190AA1B1C1D132422535E1432637F182B23334
            3638110001030302050301050604050305000001110203001204213141512213
            056132147181A123150691B1C1425233F0E12416D1F1628243729253A2B2C234
            25FFDA000C03010002110311003F00E9FBBCC6C4EC3EAEEB6D1B28EBD65288C6
            B2EBE5F85A6D948F289017496B2444FD66D4F5B338252CCC67A221D58A71082E
            DC07B72EBBA6E998A92E8189E55A3BEC85D187C57B9E435A153A8EC57F81D2AE
            C8E3944A2596C60692A84AFA69AFDB50F59DB6D3BE4E0AC2F45CF169C9789256
            8DF2050F2FCBB6ADD7B11AF6FAFD52E8FD646A6B671A4B9AC435820A167E4164
            631EBA8344B1CD4E6F4FAF45CA6AA89F41F378E64F063C2D59D4194F568C5478
            43A6FC5BD5A695438025C7220CBEE4ABD02DB6C286D76A51D6F23BF1AEAA3106
            59AF65CC4D8832CC62848E8ACC98FA957EACB07CE50EB4ED2EB506772671C4F2
            8941DBD6B14E0C7501301FE048E7E5E528F2E6CD24114EF8C3F771B77D413A1F
            B7D75AA75451B5B90F59468E289D437D028FD94A0339F82919297868F998B7D3
            15F519253F14CDFB5732506AC9342BF8E4E618A2A9DCC61E4189C16401629055
            4840E4E65F1E258F6BC38B4A8050FD6AC4DA403B90BF6561A4AFF43895A6DB4A
            DD2AB1AE2B0D9ABDB220FEC114D16AF337C00664F27125DDA678968ECA601494
            7009914010F288F3E1293C9E144E2C7E423EFB3627AB96DFE5EB5672B0073B40
            6BDF2D6BABC01A2893B62828634EBA4D8C204ACBB08E34C3D540A64DA4595DB8
            445FBA50A70104D2F39C4043C3C78D25CCC7C6B04F25A5DB684A93F4051680D2
            FD40D2BE75DB854EDCDDD3BA9D9EBD676AC9D746EDCD766A3A6D068EC5222E0D
            9CAB18E5C91071E82853F90E206F2980797210E2CC9E2941707DCD0ED34235E5
            507A3DC13F8D267B0CB5C5E626BBD5F15E58AA61BCC767AB4EB3C5978B632859
            A8D86B5B562A3C6F24B576708E19CD32624444CE4A28380450132A291FC9E512
            6C98E17B564B6568B913768E0A8814E8BB8DD2A6C63C88E42446F36E9A9D74D0
            28D7ED1F5A881EC77B039AB3C5336AF25E7BCD73F928B1B94EAD568A52C0F134
            EB35C521A989CA58242ACD7D4E8EBF0F3DEFAD7CCD502B66A5E888A82445965C
            C7E8CD3B5DE330F3A4B446F73B5000440DE92801722FB88D56B09A183072DD00
            DAD08E53A8523624A2A73A9D9693F06FD76CD58CC463C74F23139A68DDABE6CE
            17750CB1932232CDD249539D68C54EA940AB940523098000DE21C73E2CAC79A4
            ED4722C96DC8876545D47AFD6B7B496DC9D355653B0924F24E3A3A5E31FC842B
            849ACCB164F9B3A7912E97408E906F26D9054EB305D66CA1542115290C62180C
            01C84078B3322191CF631EAE6EFA1AA920229DEB282600E5CC7E23C83FD7C6A5
            C022F1A91AAD20BB19277C5316DD2B386329E3EC519BE52B4F6468366C830C9D
            B6221D38674CDD4FCDB9A6924E35E4C35670C0B240B17D7459385925D641C908
            2D965E4CDC382610E4CD6BC36F44274545D073FB7D2ACD60911AE7DA094545D4
            F04D2A2FFB13649C979C35A73666FCB96394B85CF286CDD86657B44957AB75F2
            CBB0618830BC33718A4EAF0D0B1EEA219BF60E9121C11E44548A100444A631BD
            1F96F259DE462F1272B27B91478B1B62E96B4361D4B5A8D014EA497385E57A89
            4A5DB143164C831BDAC16B8EBAB81D4EBB7D069CAA6718D92BB232B27051D3F0
            CFE6A108D5499886526CDD4A4426F55768B2524E3D15D4771E93B5A3DC11232A
            4282864140288890DCBCEC7938D23E5631EB23490EDF7E3C3F7530E56DAE7045
            FBEB30B7FF006940154C8F34CFC962013CE9089443D42FA84513E64F88798A62
            F87880871791E1919707A205DB8254342B8340EA26B994D46C85DD4F761DED10
            E3DEE1351A646E05CC33987EBD252BABF896C6D6FAEE35799502C690B6828352
            B50E31894728DCA62CB2AA8BA58AA024A37E6E1E8E4C576143E4A5059029046A
            EB8B2C2493A16DD7268D288A1574CE5862F92EC7C8C831BBD1B71E29B103EFA9
            0BED65B9195B63D86C661FCFF255DB2E6ED58CB6F71ED9EF14C805202AD77ADB
            B93B2C3D6AC2DD9022DDB2328E252912E55C88A0D09D315AAA28246584A04AF8
            32F1E3CEC683B58EE25A971729086E52878A22705E359478B9383913E3CD97F2
            20775C6FB4311AE3A32D04929AF538A9E22A56DBBF62E8EE136AF1B39519AC76
            CEC882E9AC76AE13294E741C113318C8AC521CA225300080087E61C73A1C88A4
            0FED3958D71693AFB86E35FF009530426A6BD20A1044400DCC40400403988808
            F2E5CC003C3C07F771B35CD71201D681D4146D543A8428733180A01E223F1E41
            E3E3E1F8787C78ACB2470B1D2CA518DD4EFC3E951700403C6B130F6181B1B5EB
            A026E26718828A25D643C8B4926BEB20BAAD96485764B2C90289396E74CE5E7C
            CA7218A21CC0438CE3C98A5D58E56165DC76E7B72AB7D95AA49E5EC570AC5D49
            4A647A2B162CA653AEBB76E6D902DDB37B0AAB0374E09C385A408DDBCB8AE602
            8B750C5509CF99800398F0FE362E465C524F8D03DF8EC04B9C1AE2D6B5A01717
            10340D04293CC73ACDF2323FEE3C03EB4A07980C529FF012808721E601CC39FC
            43C0797E7C2CEB402F27A005FB39FF00954847272DEB9E2EF81B079769B4AC76
            CF5976FC2A12D6DBF34C1F6AC338B6C75187C9416AB11641CC5DF53BCC63DF9F
            AAE3597AD9B46B98D051AB1515916E7723E50310EB78BF2D8B95E631B0A0C80E
            2E215B6FAEEA5BA6FCEB69E0C6760E4BB263421A4872BB56A7B507FF00754F95
            9EE34FC75577369BE5BABD4DAA4320D8256D7719D8BAEC1B12A8A24CD05E526A
            5978F8C662E5D2A4200A87214CA1CA50F1100E2F9F9B062BC4B97288D8E91068
            4852A5022A69CEB1C5687C5188812C0D1FB069C6BDD57B6D62ED5D88B6D36C90
            36FAACFB44DFC159EB12F1F3F5F9A60AF3F49FC54C44B8771D20D15F28F95445
            4390DCBC078DAF616B6407A0851F6EB567B9AC2874151F5DD8F20E4AC49A577C
            CA78932DC9620BB50EC98FE563E562DBC0395AD2DA4EDD175791A69919E889A2
            1BAF65603BC44ADD22AC774C1221CE0DCCB8197C8CE7E13629E2786ABC052D6B
            C105744735C386E9576C58D38922C986F6A1205CE6EBC0AB48FA72D691BD22DE
            D7CE7B52936EF3A5914C836FC4D5BCBE3929D22BC4B3989E9FA05D2D0CABF14E
            85AB18E888D99B340843813CA81112F5A99C0A253000F43CBCD0C4F826409335
            96B40405EE1B6810290BB001694C586C1242C281AE3EA9FB4EA9FC29AB7671CC
            9B4DBA596733EC1668D89BA4B63AC5124FA915AC351CDAB11F4594B2E47316EB
            2CEE65946C4337CEDA63B64DE39BC0AAB82AE922AEA1137444C8E9277A1CA963
            F1BF232830466E6A58C56D96396F6B6E2A0A1E3BA93AD68FC7C38DED86061F94
            B7B9F73B55241169368D50E9F44A9D28CD82C0D36DAC8F61B36E2497674C78D6
            36E0EE332353E41B54E41EBEF6B68CACCBB5985928278EE483A749276291CEE3
            F960027F0E387F99E15D0B4CC8657B5ADD1C6E2EF68DB45F54F5A60C6F68B9CD
            E945A51642C10114F62A3A5272223A4675C28CE1183E9068D1ECC3C4D251C2AD
            629AAEB26BC8394D148C7326914C6021444439008F0D49930432F6DCEFC6B553
            5F6FEC4DFEDACCB8205F6AFDF58DADDF293707136DAA570AB5A5CD6648F0D646
            D5C9F8A9B715F9748CAA6AC5CD2318E9CAB152099D0380A0E013500486012F30
            1E2B8D978D94C92485CA1AF2D3BEE1091A8F5A1E6C2038202156BC52194B19C5
            5846A52990A911B6B0559223597F6B81696105A4932AD1C90C3387E9C8828FD1
            381D12FA7CD528F32F30F1E21D9F88C90C4E9BF13921FF00855835CE0A0688BF
            657D6CB9231F53A52BF0B6EBCD42AB316B91670F5689B1D961A0E4ACB2D20F10
            8F61175F6326F1ABA9A927D20E9241141B115555594290A0263000C4D99891CB
            163CB2A48E01C021D46BC87A1AA82AC73F668E3FC2BE93590A875BB3D3A9362B
            AD5206E391169B46835498B04546D92ECB56637DE6C68D4E11E3A464AC278088
            E4E9E83449516A80828A794A2023B8737BC719AFFC6B6F44FE554FA6FEAB507F
            B7DC3EC545AA4F644A054D39A56D378A85691AE403CB5D8569FB2C343A705578
            F57D17F6499348BC6E58B8064B7F02CF17123648DE06380F193F3319A1F2BA54
            634969D0E846A46D56371202689581FAE385BE3F57B1872FA63F5B39FCFB55FF
            00D9AE7E5FAB5FF75FFDB3F3787BF7FDAF9FFE7F13F2F1FF00F93FF177763ECF
            EADBEEDFD28B4D7FFFD09A2FF3134FC95C21B4E359EAD18EEC374CAF9727A5E0
            6BACD068434CCE7B3B3C5158AE9E59C1117112A5A5E65A748A6722E448536EB1
            D60FE5A472610DE3323744DFF5036769A11E874A7607C70E365CB2FF0068B482
            39842A146A174D69B9F6D4C5F9424B76F70B23771A4ABF1D1382B57AB3AC1980
            998DAD0DAE2EF97F23C8E3D91A4E3AB0492CE93C753B58694CA426E452023964
            F8269A3C55551CBCF55CB9E3656919B2613DCECF76510F0015BF773C1DB7D2D6
            E89E94966C832C63610606E30843C0DFA76B5743EAA4AD2797AC64938FF307E1
            9C4B48B7D99D5571EE47C676DA6D6905C8DEAD8B69359C1715960D8BB1E312BB
            4A2A031E215C8448ADE3D91116C464BAA8229082609997F1F8EC8F33CDC93823
            2DD1C84B892B72850413B971E3C425399397347E370316390766F6B52D011A01
            08A9AE9C554F12B516995F6AF21C06CAEF2E41C21942F70B09B099772B305AC3
            4D9B78D13BF63E1C93605A148EDDB315917045E0146C8305592C81A39B2A76E4
            585BACAB6531C7C4C79E3385343707C9713711BE84A0236E4BAD393E54B85664
            468F11C400083829084829C3545A737DC83B6E5074F71C6A952595CAC378DB2D
            8D7724DF2983C98AE274F8E45C9AB51056B075A3A494D269B1B8DB1BB58E78E5
            CB8F704E31E2C6201C80826FC50E337C878FC4C2C248E37301379EAB4EA7A8E8
            BBE874F5AE4B323CC4D8DE4731F9D735CD7911D8C16072902F4175A345235DF4
            ACE6F96A9DFEEBDD521752F1A5BED3312D6865AEB52AB4AC9BD7B68471A5553C
            4F5187B54E47C13E9F7CBC55369D17052B3CB304976662A4BAC420094E45964F
            022C59733CBE4084B43B21F735495612A5CAA3754B46A137AB49E43263F1B045
            24DFEA8C3F866D011E8435A8021EAD55DA1E34A86876466FDB83753BA2254F67
            62B3E11D78C2B95635EB2959489917D3F6CC6193A9D51C3EE2C3290115171E13
            F67B55865587A29B66864119170637A82C4DE6912AE3E65C7B70B4B8467DDF40
            802EDAF57D09ADDD1CC5DE34649BE47451990E8D45F76834E674FB05666A3A85
            53D83EDFFB03DD937AB2664FB9650B3C1649B3E256B0F665E118C1C842D8A5A8
            F45156314609A0C4F37944019308F600845348716E66E989D5004A06278CF198
            9136380499791F8AE793204924683A36EB74D0FF00495D8210719B2FC9666716
            4597D9C086401B1DAC75CD61216E22E170D135239F1A6FF73A8D529BD92703DA
            A42F16E82B9642DC9C9D6EA756211E4E92957B6D19D56359B1BDB08A232855FE
            558EC7884846AF22A3B74D5C9546AD1423774B8A0CF9381D36478F6886ECC10B
            38A2804F57F4EFC2B6F1D2C85FE4A6B931D8E7DFA0D86A7D76E5CAAED88D559C
            D0DD63D4BDB9A567CCB0CB6176AE89070D31584E45B519AD771EDB712B0B6CBD
            21A5821244F6C4C90AE178A8A70A7B815B2C9108A1924050272A4D0604B92CF1
            BF113B83ADD73B55D1DA70FB08F4AC3125CFBF3339D9EB8CD24C31D8DDC1BA33
            7EFB04EB1C55DB53BCCAFA708F6C6DD8ED713B89F28642B9665CE391A2AB19B1
            F592785E32B13D91BD620A1DB16499C0210728AD4A7237284B1536F2467BFC31
            6DCCA2CAB8054E7A41062439CDC6C586CC46C69B92A01F72B94FD956EFF909F1
            B33273327B93239C196B45A10902E6801C9B2EE77AEA176C36021F5735C32E67
            E9D60EA51A636A8B998422D92682AE2465DD386B0F5F8F04577D1C4511773D28
            D93540AA955148C6F4CA753C843639CE7362EDC4E491EE0C1C752A9BF3F5FDB5
            4C46995D0DED5081C754F5217FC7D2B9569AD568177DB3720F73ADB3C8791F24
            6DEE50611B3F84ADAB644B4C7AB8C1E3DBE1EBD8D12A98D7962BB760FA35DAD2
            2EDB2C63C645C32BD3B34D90B659FABA4F1B3C4E063E1438E065BCB4CCF524B8
            B9BD410B9CC0351ED00A8D0A5698F365E7F919DCF9FB586DB98C606B4840491A
            801DAFAF3534935DB75B21EA1F6CED46D70C50F6D1896D9B2B5ABFEC5E4AC930
            AF4C9DCABD88AE9962ECDEA30F4075EBA4AC3CBD96B916D95192051B15AC4331
            49B891574551BCF936459F9B8381905715B0315BAF500AAD508428D157D6AFE3
            E218F8BE4333BCB9A72DF1B05BEC28A1FC5AEB5DFCA46BBAD2B1DBC714D2F31F
            706D72CCFA0B8B76668583F1B33B7CE6C067CCDF3A6977794CF271722DE5A125
            A5A1E5E731D48BAB13E9866DD06114FDC397A53AD22B374938D41516319DE318
            FCB8208C330A385CC118BCA480E8EB9C4B8E9A22DBA2EF49654F9CD8B1B1A5F2
            7F2F30CC1CF3DB6C763110B1000D7215370EAD50695D76662BEA58AF11653C9E
            BB43C8A38E31D5DEFAA30280F99EA74FAC49D854644F298A6F3392C70903C43F
            E2F8F0A4C1AEC795A4F41611F6256F8E926440C25019037EFAE0CB026D66FDE9
            2E04AF649C6B330348C25BA57FC82FA16E965AFD6ECBD7644AE3C3532E76B465
            5FA4EA7EB0A375852F488E88E58AC489155A226501F00822766B7C6F803928D7
            C4D23A7FF1BBA48E0764FE60ED34DE9B7CB0C72F91CC181DF9A27B82DE59D4D2
            486A1D0A9E28473A921DC4AD5F7B39699D3F15E1ACAAFA4F61F73320E40B5674
            D898B159AD8DFC053AB1FC88AA199FAF2B2B58624756E8F37BAF5AE659059CC8
            39416070F1216B7CC8A09E5C3FD3EC84C7E0606AC8C2AAF42D1234927B8D2FB4
            056BBA7805555703E449264798CB907E60FE961404460A968D05AFB0F12D53C7
            8537FD56C3B019EB64F4E27BB6C622DA2C6CD71CDA82CFB45B8F981ECE7477B7
            EDA5E2E42D50B24F626DB2F8DE4D8BD8F899A871610CA24A4E389C02BA40106A
            A3D0B39B82E98E1E14C21C48E146B11EE56B7A5A2E7756C8149E0BC683939785
            8CF6CF97F2F3E59AE52D6C61AD70E41B69D471D7A9361AE899FB586418EC446E
            AD619C8D61DA7EE217FC9B7FBAE4BCFF0043BBDCAAD17498A5D8CBA2B618978F
            7B78958649BC23271EF36FB2CA3D170C8E8B6844D355C383331CE6F13E327920
            85B856E30473DD7BCA9D9C12E5D4711FB2B6FCC3C9418F265CF91DB9C02C8E1B
            5A6ED016BEF0D46F16DA4268AB4E6F7D32E53B56D2D65ED564B666694D7BC695
            284C89B6B68C48FDDBECAB981D5F262D191ADD5D826E7996B26D61DEAEBBE9B5
            92525FDBDA35996E072AA48E4CAA67245E3B2B287C982FF198ADE98C9784747A
            31C5CD70794680AD520F1D52B58A6CD8BC79CB8B36CF3933FDF631D631C35469
            6D84DCA15153640AB94D71C3988602DFB13B7159D72CF3A21DB9A95A437FC4D6
            A636FB85B295953656E5679870996423D2716292B6339878C7D341B3968E176E
            A4E83249A2CE4EE1DA65E8E3C63CF8CC00DF218DED64601688D8017F72E245D6
            B43DB638DC775251519272D97070F1738BA513B5F2CF601748A5AE6768840A6D
            75CDE91B009517348D3A8963DA5F3FEEA6607B655E4AC17C80C77AE54F426174
            6A68D89BDD226B97CC816B8FF27B6D8D37856B2F02D88E53048A8C7ACA983A85
            DBA8DBA5E43170BC561F83F15049DDCE9258CBA74736D89C03042232E2D36905
            C5FEF72B402002BBCD99972F95CA91B97678E871DCADB1A7B9335C54DC97B2E1
            A2056845DCD4D7ECDDE3325B297DACFB51D42DD7DA4CCE7CC35856D59A724B89
            39293B71282DEA32CCE5694F4EF566B669124234AACABD7E69016EABD522D922
            B18C91A43C9C7C8F178BE5BCC49065E3DDE3B15864B2E70EE3A336ADCD21CDB9
            494D40E477AC9B9536178BC8F210E48F9D91318D8EB41ED07B4BB620B5C9B6A0
            12388048A6E5B57A21A9F807B9D76E6D6CD7FAD39882D86C38CAE3986264EDF6
            3B2BBB245C364B75351130F0655DC9B8612CFA2E8D31D426C8CC9A2699923A68
            A24E62663172606E664E6764331B1714C8C42E21B2464168452E2801DEE078A9
            AAB5B9A3C63A3C9C8334B2C858E716B59D2E1A9468034E410EBBE948BE6DDBEA
            7ED3EEFE75B16CD60FD81DA5C3F8C67A6E898035A715CDDCA1E9506315372555
            6D7CBEFC90A399F8C93998C8A33CF55AA4B2CBBC7EE105054499B56BC717064C
            3C6EFF00986497F96CA3631E8E16C2F0D731B6FB0A39A0DCE6871D8A53B94616
            C38B843C8763C6C2C064FC3BEF7B743C2F0A3912953F3D95359B2EEB86BB64A7
            1952A9298B9BE62CD33F94285862764D497B0634A53D80ADD7A219DA1C1D26C2
            DECD2C8409557291D041D7A49A2ABC49BBD55C356FD6E88F1E38DCEBF20B9CF7
            3D2D5B80E94DBA482546F76DA5729D30CBCA32C053118CEDB4FF00506928E428
            4282343AF335AFF7B474ADDF1BEA7EAD347A9473ADA7DC1C498E1FBD2BD2377C
            CEAC32076B3EF58B755ABB495519B89C667F5142288A67F210E9280A8071CDC8
            63269E0676EE6C2939D53A5875FDABC14FA1A7184331B2DF18BA4730C606C85C
            0EBAE9A26DC577AE72AB13B9E2671BE5DED5F8D8D5D85A7E3FCD9B459A72B5C2
            49E9E19B5869B81992263404C398DAF736D1884AE3D3BD05051509273120C105
            0CC18B338AEF65087CC96E7658FF004D0477B5BAFB9A4A3AE169E288411C4D5A
            370F138F8F0882EF2190E0C3D49A3B7E6DDD06E3D1355DD714DF33AE27ED5F47
            C6388251E434FEF8EEC5CAA554B1C0D8966D34EEBB5EA2503179A8D32AB16059
            0AD297BC8D062D5550CED232B10410129517A22349E16791CAF1BE332BFB2F0D
            9C6FAC654274A1D471257FE9AA62E54986EF25E41D1874F146F8ED29D246B702
            842820F0E3BA52F5DD77B796B46AB5074A314624AE4839CDD983200502DB799C
            B5BF7F2B78865D3ACD5A4157EC1F3A634B8574EADB758D45A2AC236252220229
            1CE52FF01D98B203FCDF8BC31D3E3D8F8DAD6FD1C0342EAED906E47AD618EE7C
            7E273F2B2A459A46B9CD289D45A481A69BF1200D69C4771AD6DA9E7DEF01AA3A
            FD0D6ABED79EE55C4D5A7997ECF0771900966358A4B4CA33E05AD01D27AC2A56
            290ADE2C2A6B98A883459CB968EFA6F5C0CB8AF891E24DE43CB5C00C422495EC
            EA474A5C01D56E0BB2029F6D4B67CC87C6432B321321C2D69B5BD0AD243F6475
            A75B48D7E95BB76A9A3623C55DD4BB87D4B048BDA6609C458F5AE3F6D5B79619
            7968BF7DADDBA022AE3669A98B0C83A7CF9DB2B9D5EC228B978AAC2924F1C14A
            AFA43FC4D4127CAF0F3461A846516300D51967481CD17724B8F135797BB1498E
            D9A5EE13035EE720173B8B906817741A0E02A2E762B1042EB5EE0EC78F723D7A
            CDD97F1965CB65B4F8DB3DD26D89C0CEA649CB64BD82BF7AA23B9758B8CEF970
            1AA2A9B152B736FD018245B9C808FA429F990F0B9380C9323C544DB3C8173AE7
            2BCDE3621082D6EA9A82B4E4C26CC67E166590B597016028ED50A94E1A26D4E1
            2435AF1051BB86768689C3D96B2066AACE47A2EBF6680B964F099B1AD3103557
            B6EBF54E7201B3D722E69CD2C0CE9EB192826E723383552288222532C99FADE3
            A1663E7796C7C7C6ED37E23C937175CE0405EAD42AFA0F4AE5CB3E78C16CD97E
            43E449F2AC1F86D8ED696AA74EE857D4AEFA53FCB25C1BED877F3C595F86919A
            98A4E98637BBBC7ED9BB672C23622E90D1D2F036B7A22ECACDD99BAB71C8D0F1
            8E964C8749EA9148149E7403D51E778A109FCE33266032181D082A7505CDB820
            2360A553ED3B56DE54CD06278D85AFB6374C1FB02A50A7321427FC1699CEAFF6
            F4C09BC5DC277E232C4CA4E1B5F30364AB5C2C75668B7876D64642E568BD5861
            DA027696F28FAC6CEB0746832D2428B651B908E9EA0824B024CCC80EDE2DCC87
            18E74CD0F9A396C8DA545AD600E0F5691722A5AE5E6568F2F2E749262E0E2651
            89AE89B23DF6B5D703734C76B868BA1BC15D100E35D2DFD90EAAF97C9F452A7E
            5FB5FF00B2EF2F9A5F97DAF7ABEB7D1DE5EE9FFEAFEB7F173FFF002F9FFE771B
            FE6792ABF235EEF73DA3DC89CBFCBD294F831222FF002A71DF9EFF0076D5FFD1
            97BDCF26DEE47EE8B89F3955FB7FE6FCBB887525C8C053E1A4256B356AE64EB4
            417CD734C72856ACB206958E826285A2C91AED81944165DD0571029FD055C1D3
            6BBC1164B7BD23CB3B058505CC55FA2DDB2E895BB4B463B9A5C8FB97625427EC
            A4036B99774BEEC96FC518A2CBA7D91F5BB59A66ED1069784B711BB16304D19B
            F78D2C17FC9325706F5B999877090A2BAD14C0D00907AE54CADDB3A556058FA8
            89CC0C99E5AD6001C08735C546A3A557EC3A73AA63465AD9E4CA916E05B6A22B
            0F051CF9EFA524993753F7EF5177BF3D4AEBA6BD646CB6BE41A14FE22D7FCCE9
            43DAED10D49ABDFEBD53A9435F54BE46A51B0B5BC8D8EA94C3D8145A7166ECDB
            B9051C820AB12116E17F1F14D27CE7658688E591C86E6FB49D1E8083CCDBA1D3
            91ADF260C7931F0A2C4CDED358439C2C2ED955AA49E7A1049F45AF8ED8F653CE
            DAE5AD5AE176C4758B3E77C935A5E5ECDB3B014B6DF34CA30B5C8CCD3ECB4F61
            8E698C5AFBFD9A8B557B1AEA264146465249C8024FCE8820AAE0CAD18960CCC7
            7613AE898E1A68DB883BAB8922EE5C298927872B17220F6BC021A752A13429A7
            ECA4B766712F75CD99CF78D36DB216A36584F20BF92AE23886B50D416F2D4DA4
            298E6518BE818AB151275FC94D6378190B18ACFDC297472DD93C70B3853A93B3
            38141A6C52B72A170633B01C09FC466817EBA91BE835E5480C40DC3963932AF7
            B81436A5A48D1A8BAA1D578ED52A1DBCF4FF007B07BA4E64DB6DDBC6D1B0EFD3
            C632A9B1BDC44A545DD526EED666141ABD6E2A8ECA2A4A49E122EAB8D61E4A34
            EA15322C872023A74A28B882EBCCD8443985ACD5E5CD6EBFCAAA0FA2FAEB5492
            3222C4884F7065A49B53500823F8A8A8E991D0FEE5F78D8FEE0D88F17E2C94A0
            E35D86B9E5E98C933B708982ADE3BBED362B225A321E2F82ABDEDDC7BD23C929
            F90B1A468D2C62C2A14CFD524A3868D527808D23C77FE5B06367421B861FDD8D
            1ED71328080A34DC3455BBA42210A829B94C0ECA86706D68686B9DA9E9552D4F
            BD46B5B8AB863BB766AEDF511A2E1A85254FC7384151B43FB4CF49C2D32D9926
            2A9F657F66AF62F82ADCC584A330F584ABB155B1DAA0564F8B16CFFAD29BF824
            37CAEE6488DC58D8E42C685BDAEB8809B04B178AED4BE342CC5CACA709EFC790
            39CC1691AB8AB42EA76D14A7AD6A6F7427B9D67FD3CD3FD6093D61698FF14E3B
            CC990928A929DB45660EF3011991E451B1AF9032D54DF4B84B4254AB8F2CD39E
            92D18619C74826B345623CE31EB49C96D9918B706B5CC89AA43C39537D890A7F
            A46B432088C72CB36775DC7A2C3A7FDC3435335DE63B6F641DB6C138B24F5F57
            90799135CE3A5E16AD8B90928D8D6B77A65AC9508F9B650D273F3507010B7181
            42A2C9DB170E95222BA6DD4404C550E89C8936FF00CC61CB6F5343C2B741AAAD
            D77A72DAB681F8AF825C59CDB7B4A3D09DC25A5A0EC79F03F5D10BD7AD33EE23
            B51BB98776EFB855471E62AAB6B94745A147C7F072D093329659680F7397ACBA
            8889AD5CF224741919DDDD23312929292EB3F74B3241B356A444535DA3D23E00
            EC993B61923945A0DC10A1B9469CF41B560D81904023397DC78769D36A35100E
            2A89B9D6A6237DF5DA536B350F3860AAFBE4A36D172AAB7735072BA8441AAB6F
            A8CD45DD2AD18F5E980C3171B39395F418BB7640151AB672A2A4013140079333
            0CB180D75A0382E8BA0ADB126104CD739E8D7684F2078A714DD38A573957CD1F
            EEE3B1FAAB8EF572E78729B8CF1AEA6532BACAB54D90C9D447D33B176E8C2BB8
            1887D1D6287B4D96263C6A74F5D52A29C9B88161EA3AF15155143231DD49648A
            6304A62B1A1AC68175DEC01A1FA004683DAE53BEB596163430E4CC27F24B8CF7
            B8AF6C840493B02A7FC7AD2BD9CBB6B6FCE42D64D24CB45A7E2677B8DA7F2F05
            52AF61AADAB4D4AB0FB03D55F5754C5F0764796CB334C5B62BBD1A4EA6839964
            1076C621E464B3F45B2875DBB64DCAD99160BBCA63E442C32633B18452B54B6F
            524BDC09370554468089A7AB1860470F96C297C97E13DF23E293B7B02818CB46
            FA05B9C41E06A4B350D5EEB193B35C65C76FAAD8BF57703E3AA73D8C8EC1D8C5
            7A45B6432DDDE558231F1D3533658DB5648775CA9535B28E974D9B5918D50CF8
            1AA629BC45255C1F68CE1C504B1C50168F6341372341690E541B805A88BB9279
            A07158D6B6ECDEEBC3D7D8589A7D75D7FC694BCF720A56CDE52D57BC620D57AA
            D4EC376CBC9AD8E6D7256DB821516F4FC6F6185992DBAC11465D93A4E6669E22
            DD2896E80A88FA0794EAC7D42B63A475446253DA74DDB8CA82E4BB421084DFED
            DE9DC3ED89DAE9727B4D6752DA5D710474A0D942F570A63F09DB06F798FB5151
            74AB625B52A8997317A9312F8BE729D617D7A83AFD8E2A62D6E29CFA79C49C3C
            6114693D03677315351ED4AE1BA0C5D282CD622A5401BEDE5198C733C7E4F8E9
            8B64C76C403C8504C6000035DB0D06A5755DC22D309D1E3E5E71CA90498990F7
            F02DB03C9D742AE207D14722546BD997B7C6D3E7ED1BD315E7C943A56F7E93B5
            8973478DF9A1BDC319DA8697215F8D6ECA76525EBEE98BD99BBC063681931072
            819825266598B950592CB2C4AE598E4CF66706F723900EEB3DB7076B2343B70B
            B2B404E1C1690DAC667E13F23F05CE708DF6AE9A863AD50740550953B1ACA57F
            1477AAD859A8DB8657C9786B4A1B62DA6E43778F283855F16CC8E55CC92906BC
            6D31DE6B8C91FAA5583E294255733B72820FDDBD48826F45A03D322FD9B41D8F
            8CD7FC0706C2F69163981F683C6F785050EED00FA83590C1C3676866E59C8D46
            A1AE8ECF540EEA4E44A1F4A60781FB7D776AD418BD85ADE34C43ACF916D3B435
            491A259F611D6629D5325D15BCC2326C9E59E3EC73E7A94D91255DCFAF34E104
            193D78B4CA2474AA8E45145B8D238B0442971F9054DFAA050342DD8DA54AA855
            43C29DC8831CE4412E3F9548E320DBDA26F00AA5C4F4DC345D537A7151DDA9F7
            0753ACBA739FF552E98D730E6FC1B891EE2ACBD5BCA528F2AB036E889B7B392B
            21054F9E8F8941E4855E213B08C5457BD284771ECA223950158480D9BC43316E
            648FC9777310E3F6EDF69BAE0E0F5009E1EDDBEB59BA2C7C8C79E1393F1E474C
            640EB4C8012115142FD34157ED6E8F774BDE8C757C7B996F141A159598C2D6E8
            BAD58F2E33D19AFF003B12DDCBA9F7974B9585E2B3D213B7841C022DDAB85A3C
            5BA0A1130224894143F1F44FD23E67F4FF00E9EC5F3FDFCB2E7F91F11998C1BD
            B24C0F91AC113AF0497A9B8385AD0814FBB443B059361DD91DD7C33B1E65B4B2
            E682496F6F503815527F66AE0F607B60649B37688A2689E39B2D4DF654C71194
            7B1B9072E9D4051720DC232C4F6D77F81526578C7F27191D60949F91563DEA8D
            533A8F936C6725412517F4FE639AD927970E7826B2581EC70280A9600150E814
            8B935036D6BA38DF0E3CBCE394DFF4B397A9EADDC49E1AEDA70A6DCF3B74F73C
            0BBE97EE4C8E46D79CC7B6180685334F9BA1E538F3D52A15E865DA5C98D36250
            B7E3F8476E2FF35031191655194901F67059EA6D574456F22C75FA867C6FCCA6
            C90F48A4C52C7BB5D64710E739114724000D146F4B331E1762498AECCB48C8BE
            37584A3111AC45D537B8EA7635E16FDAD7B9925B7744DC671B11AEEF332DCFDC
            3EAB5D262AD33656F831BC98AB10AC4611A84DC12F1F6F670D8F943C543ACE17
            AFAED9458DD48B90F3BA517864C683226334865C474442216292474A82A89C74
            E208E7BCB061FC46B22CC2DC96B8126C26F2884EA51AA75F4E14B733D28EE1FA
            63B21B197FD037FAE77CC2BB3366F9FA431E67C97B940A98D2E2ABE93967A944
            A7524122BA8D197B0BDE9DCA2BF9D48D3A2D9DB55946282EBD300451E1CB8D3C
            9BCCE7B1C87A1AE6B40083DC96EE4AFD28CE871738E3656365FC79D91089EDB0
            BEF0149729203549D80D399152CBA9789B2DE19C2D0D56CF19A2633DE60939BB
            35C720E419222ACE2867ADB34EE60F58A4C31CC2481A25399AE946C5B64C8826
            641B7ADE837158504E995937BE3258D0C6B435400153F9880373C77E4A5296ED
            41174C0C466E4A92A789D4945E43414C0375B5CF78B3AEE6EA3E51C5F4EC1ADB
            0CEA9E5984B53191B6E4D981B4DD62AECAD29BE4E997D4E2E36771B00F6A35E8
            99365129A522F5C2AB2C9BA21D33AA29B4DB19D8F177E473FAE485D1A21D0390
            DEBB143A5BA2F315B0831DF8B207E5FE3057B5B61F701D2D554D7FA8E9AEA29B
            84CF699D9CA62FBFF7DC4F7FC2966CA9B8F6DBE522BD297C3D9A05CD035B3284
            9582D591D109E84AA4B11CE50B74C3D8D8B1649316F0EDD9478BBEA9450E9B54
            11646D18D2639003DCFD5DAEAC2112DDBD577ABB43659311CFCD31D8C6926C0E
            EA054B343B1FEAD7FF004D52C9DA4762ACDDB975D35D8978C4753D88D60CB962
            C994093807967734991612760B4CCB58C7F715EBF1F30C2D60FE71B4A8CA2700
            740AE98831E985154CF8AD4CD822F2DE373B02521B042C61507F94EA8ABA6DC3
            75E7463C38ECFCCA09F34BE39DCF707862585FA0696A82E0D55BB73B2568F98F
            B6B774FCB3953136D6D9F38EB5DAB632936333E84A2BEF9B1B606C28CA1BD88B
            4D758F18CBD22CAFAC725EEC2FE6A51C3D608394A45BB23A067264CBE9B0C9A0
            6E4C8F01185842EA78EC9F4A86E3E31C2930DF988D0541B0F5E874D0F4AE9AAD
            3EAC1FDBCB29543B854BEE4666CAB11965B416B6E37C4B42975E3C62EE929901
            8D26A54EC957AB1C33066D2B55D24D2F5B947ED9B303B84C4D687040144A8015
            44218DB1C79D2191679E47352D4461475CA0A6AED2D45407651594AC61871A38
            E5D232344E00733CFF006D34AAD769EDA669B7BB8D308E6B8DC6BAABB5EDB31A
            59064E8EFA0A672A5E617260DD652B74BF62B76389689A7B2A958724C999EBC6
            8F88E9DB56C4222A90CECE66BBE2CAFC7C2971449D3DDBDA101D6D0157868113
            9F0E34C664785952E1E517AC8D635A5A8E1A02496AAA26BBEA6B41B7E8EF7876
            FAB93FA286B06A4E68C01247715BAFE42B2D8AEECF2EC0D1D84F47CBD5E3CE36
            EAED8EBF1B1D080D132B26C46F30FE21B25D23490006ECDD14C88F07CB1C4779
            58C772391A542FF2FF003232DD7F7F15ACA2C3830A49E7C1F285AD7B9CEED98C
            EE4ED7173BFE1C6964CCBDB1F66B1B672D0ACDDA613386ED363D52D71AFEB6BE
            FB817B648B8866955AB172A646E46463A9EC5CCB4FAB371B96279E49332C8353
            24F593114C1D2675534F46CC5F9B9534990444F84B1BD2146D6E837D027EF3C6
            AD1C18B2634CC764F6723BC64BAD2FB890542280D53AAF0D91292DC25D94F68B
            05EE1E2DCEB5BDBD64EEB11EFE22E198EF3EDD2CCF315E279C2C8C9648A2A100
            B2127497F49C8B2C91C8A3C9078AACCD92E5FE8D674D10707A4191363B73E264
            C2C9E1746F258D75EC7169B6D7021855A1C1ED3734B41691BD693478590D8E59
            A57196370B596942E0A925C1C3E858426ABAD491F6CBD16B4691D273935C8764
            A7DC721E68CEB67C92FEC34B6730CA352A82ACA3D8D42BCAA73863BEEA639609
            178A179A85454923A40AAFE9FAEAE64B1B8F062C4D4898DF53D45177D7541E95
            8CC19DD73D9397B48E2DB5353A6E5539D49978F0BA3BFA7D3ECE7FE5596BFE3F
            757FFFD2EFD7CBF8FE5FDBC3F0E7FDDC400E07DDD3CA8A04BE2221E3FA7EBE3F
            BB8872A004E84FDD52ABA51C879721F807887C3F7787E1C4169F6B0A3681407E
            CE5F972FD7E23F980F3E2406824377A094A04BE3CFF1E5FB03E3CF9FEDE7C4EA
            84176F5171D80A3908F8FE9E01FEC1FEFE2A9FF8CED535428007983CA01CF988
            FC3C798F888F200F11FF004F1624116AE8027D9508DE075ABB97E5F0F87C47C3
            FDFF000FD38AF48010F48A9AB479872E41F8FEEFCBFB83803CA90469C3FE1505
            389E355F00F0E43F9FE3FBBE223CFF005E2C350ABC683AA5003C87C7907E9F1F
            11F878F2E7CB8801A039365D6A7D072AA8887C3E3E3F90F87E5C45CD2A1BF4A8
            201DEADE40510F8FF7F31F88F3F8F3E2E03937A94D3D055C2600E7FA7FB847C7
            F2F8701206E684DA8E7E21FA87C3973E5FB797C038A8B94AFB6A138D5DC5A8AB
            4DF878F2F1FCB9FF00F0E025050A95411F87C7F0FC07F5FC7E01F0E29B9F523F
            C1A1537AA07C7FD7FDBFBF89F43EC03EFA35FA8AA88FE3CFC3F6710403A83A81
            42EE57415700712DB88EAA955AA0980BF1FEDFBB8B212A82A3813C8553C7C3C3
            C3C3978FE7C40B882BA3BF6D40476ABA1AAF3F0FCBF0F873E0504390AA6F5247
            2354FD43F1F0E7F1F11E2540035A9D52A8262873E63FB7C07F1FC47F20E2886E
            209D37A870D148D0E9400800720FF68FF6F1E21135B542D54103A01D6ABCC079
            7EBF8FEBFAFE5C5C3BAADE28B53A8AB83F2E0D89D2855AAF1353470514705147
            05147051470514705147051470515FFFD3EFDC79FE1C400789A9D28F1E072E96
            9E3550AA576A388EA50874A9A397E1C5B5FB685A3E1F0E27EB4153C68E5C5485
            20F1A2ABC01577D28AA72F8F005D568E548C6C7BE948BD7ACEF250731335D9A6
            186B283D879FAE2A92360839569479D711F2F04BAEAA2821331AED322CD4EA1C
            842AE42889803C78C32A57C30CF3B0F531848E3A804F15FBC25598D63E48A378
            56B9E011AEAA7D36AE4ABB78E92ED86FFE21B1671FBFDCD18D895BC9921468F6
            2FAD9967204C4ABD88A1576C06B096CCDF33547A14167F6E6ED932FA2E163204
            70732853188437A4679EF2E707C6B9B9E581F8EC711DB8CEA46EB6AEBC9001A2
            7A57E0F8413CF11C1E90483D6FE6878FF1A966ED89B299F28598F69342376B23
            B5B864FD6B8B8FC914FC992F28D152CDE1670DA2D17F27316076D9ABD711F128
            CB444A26F65DC2F2208CCAA839397A2E63CBCDCC89D87367E43433B4E75EEDEE
            68175E8D1A71D0026B038B160E4322C77FFA49180B47271288A493B0E68294E8
            EEFADDBA64F212B464B27D9938D070D5BA192DC506CC963572476F126012432D
            D19A6E3ABE83B58A0A4A3D8F6D185440CB83816E9A8B17978F9A67EDBFB64412
            34398E51D4D77B4A6E14702847115BB999AC8DD29C53DA6EE6E6F0F455FBA97D
            DBAEE79A9DA5B2D5EAC657B4CF4CDCECB0CCAD4C2978F2054B54F234C907120C
            DADBDF2A2E63A0D9C1AAEA2D6227E779D4AC5218C92474CA6317393388C99313
            1E2EEE43585E4286A355154E875234057D2AC229DF00C96444C5721D47F120FD
            D5824BBB06972BAB6DB6ECD7D9A4B13AD9190C44E5A92A92F237787C96B73746
            A7CCD5221192791D2A84193DD47CE6F44F18245923A9EB22551A9667C4CC6798
            AE321011511C787D9FB2AAC6CEF2F68C7EB0D2E02E1AB471DD3F8D695AE7DE6B
            4936572EB0C2351B1DDAA977B0489222985BFD4821A1EED28745EAE930859689
            939E6F18EDD923CE56A9CCFB59DFAA6224D41754E42090BE6904AE9612C0D796
            8D41DBE95593B90863E788B237205507A8F04049DB8ED52B806FCFF7F8F2F8FE
            BC6AA0EBEB56DF5A6E1B7D9AD5D77D63CDD995874879EA463F9C774F6F202911
            83FBF49201078FA2DF28E1445B22CE56ED28C1B2A750E54D34D5131840A023C2
            D99923119139C5039E1ABBA2AEA8855136E35A471DEE00941CEB9CEEC7BB2D9B
            61F69AE9847626ED94A74BB1F846AF9A71839CB966B5CF38B0CF432F292413B5
            02D9E41EA4D9BE46A0C93C93219981537D1D5D494013228A261F43913E44F858
            B165BAE9A368B5C807E1A2008D09C3895FDB4A3E13164BF2608EDC673EC76AB7
            3D492ED750A3F9404F5A987DE8EEC1ABFA1333154AC8EA5AAED92E6A0569D6B4
            5C7ADA0DF3F866ABFAA8D79C5CDECCCE43B7AE31B3BF4144DA8A6578ECC9A2A2
            A0D8C994A27F3472C3E79206852D075E4414B513ED5DAB79192319DC6C6ABEA0
            7EFA884EDC7DC360EAF6DEEF9B9B961EE457F83E3B21E15C8311556A71B358AB
            EC724E41C9F44AEC4C5463D968F816CE5B447B03379E9AE8336EDD990E754089
            FA8A75E6C9C88FC363B720DD21CB468402D6B9A3881AEADE275AC9F0F7BC8C32
            C78C995F0C04B9540713CC346A7FC0A9F9CB9BCFADD8370355B63F255D9681C6
            17377518FAEBF243C8494AC8485D23C65E2D9230F1A93A76AB96B0A92CF5D948
            07E9DAB654E6E7E5001AE563CD87341064B2D9252D0D5E371407E95725DDBC97
            86AF69AE73F6E90D0495FA27055E0B4D93747BC1EA7691DF59E2BBEFCF37EC8E
            B46C1CC4AD5319C6404838AE474F899C460CDC9D9ACB568742624229133B6B1C
            8AEB3E55051050C9A48AE9AC6E64334B95973418B15ED63CC65CA1A9282018D1
            C874506EF6F05AA8195344C97171BB8D315FEE6B7A79EBFB916B315FEEEDA676
            1D51B36E037B4DB1AE3BA65B226896CACBDAA2C4C8F056E9E76D118289795A41
            DB965E8CC347C47883E23D3C774C4540EE0ABB6708A5AE6643704C4323A6E944
            646E8E2AA142AA27D0F3ABC51E5C804671D321CCB836E6EBCB554DF9D23745EF
            BFA3190B2FD6712C3299719B6B95B22A9558CA33541423719CB4DCE3C6515144
            07AA4F9ED8C193A9A904D9A8B39874019A822AB9041A8751C3671F252E9B1CB2
            22E469B9A6EE450150A39ED4BCAECC85AE0EC620B3DDD4DD137FAA7A7D8295CD
            C4EEF1A87A53901BE2BC8D2374BA6422C5252F3557C5D135E9D795445D373BD8
            D65677962B5552263A66563D3EA50620E147BD31D15544934DD3532FC98B37E4
            E44F0E141DD8E2716BCADB6BDA50B51C01281350A0F3A65F1CFDB8A56C251E01
            1A8D57EA57EEA6E1BC5B77A2DB85DAF32864D9FC83988309AF6FA0562D0C3114
            5454467483BEB1B4D5AC2DA8E585BC106A6CE50CD5422ABB878A388BE804CE9A
            2CE0E56FE77064F6323C64B0B91C72E3683C9CA0A6A0AA7ECF5ACDAF58F31B2E
            2DF236179B6E4409A39469BF0D7E95BE6C677B8D43D61B3B7C75210D97323595
            A5671B5895252A1EB8F10084C895B82B556C5492B15B611C3A9D7558B033720D
            CC907AAA384C82A144FE600E4CD91E41D1371C173B2FB248200BCB91035020D5
            46C06CA2A8FF0097162C13C7885D196077B9A2D6A6FAA9289C94D60B36F7E7D3
            1C47271D19051D9272F03C888A927F33408DAB96BB06F65E3CB208D5E4A56C96
            98550F668D054847E8B74566EC9505513AFD436708A75BE4395938F6FE1C1239
            923BFA4B0A3826E53985F45A90729F1B258317B80F0B9ADFDF523FA9FB6387F7
            2F13B3CC386255FBC803C9BDAFCD43CDB4246D96A7648D4DB2EF6BD638D49C3B
            6ED9FA4D1EA0E133A0B386CE5B38496455513394C2CA108E1FDB3B7A8E07D147
            03A8E3568E47B95B2C5648370A0FDE29CCF115A51C1451C1451C1451C1451C14
            51C1451C1451C1457FFFD4EFE3828A3828A3828A3828A3828A3828A3828A3828
            A4E730472D3189728443723951C4AE3BBB46A09B24CAB3C3ACFAB526D9223448
            ECE408A3931D4004CA282C027E40299FFE11CA625B148E076693FB056B080668
            411A170FDF50F1FE5F63344740DC29D2B664EC335DFD799550935DDB759E9EBF
            4957A82B153CCDEBCDD18E141145B263E4590408ED4E4BB95403A5960BE3F16E
            B55C71634FB414AC564391931B8AA4AE0DFA2E83FE7AD443EC6CE4C6C16DE778
            6D91D7A9C1B0636C7DA8CA62E9AB5D64C13B196060F035FAB97F610D27032276
            32B0B2F49C736A5887228BA4E98A023E4209C8A1398EBB0E12447D72E406B87F
            D246FC763C90D377A64E2C2CFEEB5A1CBC91C744DB7E34D51C610DA392EDA4CF
            23053B4E2BDAB69DB9E11CDCD486AAC4EC23CB6C16464B16BE5CD6C928895788
            4B485862CEC1423672DD6710CC4C43141050525DDCC7F98C89B0BC6C923A685F
            63638FA583536B02E809D40BC95E674358C4EC69333367C6F0CB93197B9F2F74
            FF002957741D073D34E037ADC764F5AEE18EE7357A6B12EC3E13CC7B3344D4CC
            693B91B15484A465C06521A0A813923579DC4E5CC151F90B345616C15109B756
            01C2E598523E2C8F508F50AF91223AF6B3B166CA661E05B8B8C089DD7B4D8E62
            DE2D2A5C88AAC509B56518CAC9787F91C6071DCE2582E0373A33A50F13D47EDE
            14DD9FEC6E3C94EDCD9330FD2304D570F6456FB598AEE7709DA6596DB215ABA2
            1378F33792BB26855EFB64B33DAB4C325294AC42A8305C588B23B60214080548
            B5C877E65078D966FF00F50653427361F73B4476A07B77D34A73158C83232DB8
            9D1966075BC6C53D3BF4BAD29BEFC6A507B82D7F01633D27ED2B39AB95DACC76
            4491BA62EB062AB3449A00327BA1462612765D9CBCB471CA949BD1CC12713EF0
            2E0E74DB4E9484E4554C202CE5E5E664F9AC18A794BB099DB898D3FF00C6D36B
            00E205A87D4AB8924935CDC4C78F0B17CACF275CF2B9EE91DB5CE7297140A06A
            786DB0AEBFC870F293F01F2907CBE1E62F98390098004403FE1FD9E03C731ED2
            5EE05BD2BBF3AD18476E32D08D2027DA341FE75031DF52DB7EBE53359F463103
            26D2B9376EB2D2E0D63D5922C7A47AD62D6AC665C2726ECC74D18A8A1B24DC6B
            E55D2C26006D16B9534563872262DC79E6CE85D09D20689974E9319D0EA7543C
            355E469A6CACC6C5C89251719018ECD45F782ADB82A6DBE89CEA21360F15771B
            D31C8BAA3BBBB5B1745B5D6755EDF8F30B414AE3490887474B17536D16A8B8AA
            EBC8681AAD69C1E3AE95397974A1A49D3723A319FC7A0F08DDFADE806D1E416F
            916BF23DF95208EFE6643B5A02053AAE807302A8668B2A16C189E3BB78F0C61C
            5BDC2E491AA09B9C84E9A2056E8B4EBF5A6C983335F7E0DAEB765B9CA1DE98B4
            C793F2580E4645CD16C58EDEB7ACD4F144448C8454815DCE451A7EBB8C539037
            F03A22C8B64A60CE514154DC228BBE29B95E2317F50C104459E4647BC3C876A7
            1C9600DDCB4074880A1B8B490E16AD67E5A0C7CD83C5DFA06398E0109FC400EA
            BA733E8BAD30DAAE39C3527A3FDDCAD740BAAD4AC596FDBEC7F5FAEAB1ED169A
            AF4962EA164AC857AC375649DBE6A9CD3065373B656473BF13355954FD06EA7F
            01D521EC317BBE2B1CF95805EE9E573429D2C6C563D58E00EAF78B48E1AAA84E
            844D6E267B49895E71835C5799249E3C5A34A53FB95E61C5B21D9B3B69E35AB5
            AE0AC97E9083A35C64E2E2E4639E3E6C9D1B095AE9794865D8AA02F18CC25936
            CC46055572104F20DDC0733A899F95F3A1CA3E6BC3E6E4B0C6E0D81ED7A042C0
            1B610D080A81A9425543BA81AE4F8FC76FC6F341A2E6992540A772BAA93A69FC
            BB7D2B63CB59C73765FEE0D951FF006ECD76C7187F33D16B4B45E4ECB1905CE3
            87D69B10D121E854B959F64EB3FBA6B8F292F6AC7896D0E9A1051C4989160903
            E9154E90837669CD93E67319E6DB8B94EF8267944AD6B40B810439E4FB8348DD
            BB0E6A94D491783863F1AECBC2F93E40318184BDECEDB86AD000E9710EE27429
            C0544D535DC8C8686EF24C2D1D3EED6699C34B669ACDC2D81F43413493902EC6
            3338CDD2DA49376AF21D765FD3B22F42B20CDC2E93AE653360549931908C2F0A
            C737A4E635837D069FB811A715DF4AD9B24CFCCF20586C1F09E48D0F5AF3FA27
            A69EB5D00F76CC694BA9F6D5EDB713428CAFB4715DCA7802BD48651B1B171D1A
            F82D1856C6FDEBE114522B36C949D82258C8BB394DFD52BCCC6F50E6F306996E
            966F39883E4974AD9DA1AA393F43AE89C870A4704418B839E046AF31B9C42917
            3ADD9785DCF614D4B09E36DB3CA9DD377AE0B146C060FC0FB0AC32ADBDEAC196
            F1DC0647B04DE397F6698169218A6BB3F036F8A1256AA69C711E3623D8F7AB44
            C82443B9317AA553CF05EF18FE5E3F193164632DFDCD0EAA2D24A8D8EC83454E
            2957CF71963F1524BE284A042CB4196DB5C8A0683A93990869B564EC22B61BED
            D9B8C35FD9AC55B16CA6372F09D62CD5FC6559B23781AEDB68354BCCD4D4BB19
            BC851702BD9656D8DA4D9814B5F4DFC78B58A22C9C8B849576921438FF00E9BC
            444D895A7C8355CBBE8DBB4DF62DFE1C6AD8734CECECDF918DD80DC3710DBAF5
            3768E5007A843CB5A799DB4F0BC1D57BC429559A7565CA47A36AED4EF30D3991
            D38D7F69AEDA26B09EBC4AA76351455A37626675C65921D57A29CB44C241BB35
            5BA227394AF55335096C11FEA98709639248E48DC84F52BC0214EC0A2100A105
            0E84D67E4DB3CB07889669BBB8E32184681B6901C879940BC13EEADB3B465531
            3D1FB836F862ECF10B425AE8C3EAD42C385D19C49D8BB60CB28D80325B14427D
            C2ED5E858EB526C5C2E9FA47F5A21254C273B63A826DBC566C9FED738F8D77CB
            8644780A3F0C34EFA226BAEA7D6A3CA62413F91C47CE05AE42DFFD64943A1FA7
            A539BFF2FA22D0F63DFB92C7484B21AF2EB2B50D96252BB59FAB1655587D4672
            E9B302B904D2095678FE52AA57CA1D323B551334F540A5226505620BE3A291C4
            97995DF674B547AF02BB6A6AD92638FC8BB198E5B620763AF510BE9F45AE93B8
            CEAD47051470514705147051470514705147051470515FFFD5EFE3828A3828A3
            828A3828A3828A3828A3828A3828AC6CC44B09E8894839543AA8C998E7B1522D
            BD4591EA18C8B6559BB43D66CAA2E12F55BAC62F993394E5E7CCA203C878AB85
            CD73551425598E2C735EDDC15A81682FF2FF00E1CAD454F566BDB49B335FAACC
            B73C60C4404BD4A1D47509D20B34185A0CC6BE9C3DBD549B9CE809DDB0F44CD7
            CA9822537A8A2AD63E7790C6C43850E55B0950EE969504211A8242AF03A70A6D
            F3E0CB336797C7ABC151F88E08E55074FDDB54A36AC695606D41C36FB08629AD
            2AEAAD607729277A92B8A8CAC161C8D2D36C928A9390BAB92B0651725EBC3B64
            9915AA2D1B30459A654924085F379923135F1C903C2C4E551CD743F451593A72
            E984C34782A3D10A8A8CA94FF2F66A63F7720D19E68DAA89A24C5A9E5AA57192
            390692F29AA385539046399B442431BB990412866722764DDC2CBB97E48FE697
            500739D61621C8CE8B1F1B00E65DE3A2707363B1A108040EB4B8A03C495FBEB5
            EF60974F3C9E3C3B324055F7BC6A4A936829F4E0BCC694E3376BB3EEAFEEED9A
            A376B74BE47C5B6DA651D863A8F93C4D25578B652B528656457AF4358616C953
            B331788402B28B15B2ADFA47456CA19015BD30201112C7452CF2C5376C484DDA
            5CA495275DBEC41538F970C6C11646309220EBBDCE69E48A3822F0E35145DD1B
            B7E60AD05ED62F2070F31B34EBA43657165FF2164CBA49D7DCDBED1249D56E74
            082F9B9F47424326B5562FE65E8A322E35BB74D83E933BEE42AAD20E1C6E3167
            CD9FC7E3472239F346D2506A0943C91579A8E75764D8EE933B23B418C6E3BCB4
            293B6A02FF0013A7A5482E93F65AD5CD72BAE3BD893D8F2BE54C81175D80B0D7
            23728BEABAB54A5DCA463DBC8C958EBB5B87ABC73F66F929270A2AC929090933
            C7AA20A7AAB394D27047729B263E44D8D33D446F3180837692174FDCA47A9A58
            E5C72E3445B8A2390B7575C5CA0F04D87AFDC9B549750359B1A639CFB9EB652B
            E16353266C732C611990D5909D70E6BE9B0C4B5C5EB15246BF5F211163147E81
            C9CEE95302CAAEA8F303909FC1C62DC9C818CEC3332E3996F441EE4B7745DBD5
            295708DF2473888779B1D8AA756A976DB6E7805AF158355B145A369289B79604
            27A532B633C613B8AE86DDCCD2C6A756E3ACB28F1FCDD923EB8548A992E6FD8C
            8B88D3BF3282031CB992F4F9814E55C37B72F7AFEA2DB0FD157F78AD8CAD7628
            C67B0277AF0755544E6895B2EC56BFE39DA3C317BC159598BD7949BF46123A41
            5897611F3B10F99BB6F290B62AEC98A0E022EC35D986483D62E05350A9394082
            6298BCCA24B132411A9D9E1C3EA363FF003D288263048E7345CC20870D4020EE
            0A6BAFA7D95173B2DD8974FF003BE3EC615DABA765C5170C3B8BE0F1655AE753
            52B8938B8C355E0D9C1575DE5B6EF6B0FC974958F49982A77C8F40FDC98E29AA
            B9902A29A5AE1430C19F0E44CF70C7B8191A0025E155C376A5DB2B484DC56ADC
            A6F66589D8AD734B896F53859C001BDC1BEAA4F134B2EAC769CC07AEDAC39935
            6ED2FA633351F3ACD0C95ECD6913C62CA3568C635BC0B48B5221D22EA39F4049
            C77B9B59049523D4640E551350BE8A3E4E97EA1C8F19E54C6CF17E286163B05C
            82492559554CBF88E711A060B14B7A553A88AA4395951CAC9DF25F2342050074
            EBD3A01C09D77D77A6C74EFF002EA68555A68D2B2B3F9F6F6D3D6895C90170BE
            554218A58E95424DD37709D5681577720CA6516A9B47493959528B5F3013C8A0
            FAA1C58A39E1ED3C64936B83BDA3A88DFE8BE9B568F9F1E50E73B01A1CE5D6E7
            EE7905E1EAA29C06CAF659D26DA0CA73D97EDF0F9129F6BB8C9329BBD35C7378
            520EB374B032048836297AD4B46D86223A79FA08908EDE45A31EE1D18BEB2A73
            38132A358A1EC77BB1296C32485E5A8AB23B775C54EDA2046FA569F2C16C7DD8
            5AF918D0D6B89702D68D8202014D752092BA9ADB89D9EB4058E1ECBF82E030D3
            CAD5033A4E6379EC86945DFAFEEE79F3CC52EBACA7844D9EC1649C9CAF95BACE
            6405C1DA2C92AE8661F09CE267022597E335ED8AF72593097FEE1F6FF97A551D
            9D3B8CC5E7A2488C676D5AEDC6817F8FAD3A3D91D4BC35B5952C6947CB71326F
            2AD8AB2DD0332D6A1E0E4D5846AE2C98E824508689994DB2662C8551FC7CB386
            8F988810ABB7544A5310C0539757B5F2C98F3C535AF8E40F540762A9AF3FA563
            8EE10365646D058F8CB38E80FDFA25211B4BDADF4E36FEFADB29E5DA0CCA5919
            3876B5E796FA4DD2CF4A949B8864D9FB562D27490324D63A557688BFF4CAED54
            05E99BB741B28B19AA444031831CE2CD932E1CA63EEADDA2ABC9527A97F60415
            B3333B707C59630F85740547A6ED20FDF5920ED8BA6DF6BCDF500718B90C344B
            7436419345BDAECCC2E962BE4348317C5B858EFF001928CEDB2B3EF9BB14D8AC
            B9DD7F0C5148C522A4D524124F531071C773B59237B5E1DFF5378A6DEA9B7A56
            6D9CB1CEB0000B0B53FE93C35D7EDDFD6968A6EA16BDD033BCBECA5471EB487C
            C1358BA0B0E3BB2212B3A76E8D06BC30656514C20D79456058AEB34AB44365DD
            26D8AE956D12D53329E54CC07B46D7472E43DA6D648F2E70DD5E7772F05FE908
            34D055657F7A386290288CF4FA0E5A6E854AEFAD209B61DAE753370EE8CB25E4
            BAD5A2BD92DBB38E897F7DC6B6E92A6D82C305160E136B0B644901770730895A
            BA3B7074AB21924DAF9514DCA6910852A8DC26C134F3E1BBB73480DC7DD72953
            A394053C80A663CD7083E34D189200E500A843A85569078F129E94EC702605C5
            DAD18B6B38730E55D0A9D16AC939E89891C387CF5F48483A55FCBCE4DCABE557
            90989C99905CEBB974BA8751439B97810A4295B60706B6E2AF4D4FAFD29228AE
            2D080954E5E9AD2C7C5EA28E0A28E0A28E0A28E0A28E0A28E0A28E0A28E0A2BF
            FFD6EFE3828A3828A3828A3828A3828A3828A3828A3828A3828A3828A3828A38
            28A6A1B8DB5B19A798A5965596C439A333B4776D8BAA9EB78429DF38D8220B23
            1D31247B3581255F473386AAB12438A0ABB555E5D63A6C8814456012A79B9670
            E363DB15EE73C3515375E287956F8FF12F77CDCCEC429EEB1CF53C02375D79EC
            12A251D77FDC6295E69549BC698ECE53212FB3D596117217C8188869B7519336
            83D6BE638AA3BB117B626B1736544A42B270B1D75C8B20898CED24D05E9879B3
            CB334371EC53A9B81B79F0529E9BD3BF17C165E1E44B8DE77BA81C2DECC8DB9C
            1AB629211540BB60AB5E1B3F7E29C90D83C918775CF49328ECCD771FBE988846
            72813B3E16E99F96A511ADCED9D6A1C6E2DB3BF80A7256A7893145D3D5D31103
            A4AA85219C248800E7A664F931F6A16BDC1815AEEE346AD7A8D5B77F490A38D6
            5233F4FE1E3631C8F2F612D6AFE148435C9AC48156D4F7828529E3E8A7763C4D
            B9D7B9DC2960C7D72D7BD808062A4A862DC826EA4D618D66D19BB971AD4D8C74
            2AEE24E1507C938711EF583078760A95DB74DC372B93B77709AFC9C6765363D1
            A35D782800F0E2795679316188E193C7E789A070526C7339A8477A71FBAB37B4
            3DD2F116A8ED25635DB215625D4805308D9B37E4ACB2C64D371198DA2A38B664
            AA700BD52362E566A6A66E1275551A93CCA314DBA8FD8080AC0E07D2599F264C
            D9F1E182E8D901941502E7875BDB4288A0ADC4A704A6A0C08A6C36643F2831E6
            50D0D2D245A9EFB82E80A8B509D17D299CE17EFC6C2FF77C7CE726E9D663C1DA
            E992A792A940EC6D9DD4E49531958A413F3C17BBBD0C7311473C64AABCD13998
            589F3A6C620A9D3AA9798E4DB063CACECDC6C46C4466CA431B10EA25EE280070
            D0924A25293FE50D9B231B0BCAF7A68D6EFC27B108285BD5A69CC143F7D4A76D
            D6EAE17D3CC2D3D97AFD61887EB96325031DD1DA4CB442C395EDCD901F6CA954
            53211EAEB8BE7A7488E9F91BACD235B9CCE17104C83C333C3363C7239F11BDA3
            63A1FB576FA6F55C1C739D316B5F6C0D5BDFB868084E835250E80567F4E766E1
            F7075B316EC5C255E4696CF24464C2EB55255F379479052B5BB3CE53A758049B
            441B2326C529CAF38E95D0228752D453505248C714CB0E89CD6C65C35746D77F
            EE68727D8A8B4B4926309256C1917C6D7100DA42A1D0A1D42D255BF3BFB8CB41
            71CD6EE173AED82FD6CBED88B55C758DAA4A344EC16A9702A22EDC7ACE4153B4
            828951E354DDB841BBD70559E374926EB28B10829E448F85AC1041DC91CE02DB
            8351BAAB94E9A72DCAD378D8F0C8259B372841851B0B9D25A5E89C031BD47452
            BB20E680B6ED42EEF98EB6573749EB4651C2792F56F3637AF4A5963EAF941C34
            2B195651B011F7252281DBC6958B3435A1C5024BE6245ABD884115A1105DCA6E
            0C54C438B62C8FC8664C822B6480290A0F48202AE83DC4040A78ED5ACF8D82F8
            227F8FF21F2192E9FDB7B0A386845DCF968751F63525FBFF0047BB97C897BA56
            9CE63BCEAA6289D86AEDF338C549B741D41127279383879E5A0CD5F5EB853581
            572DFDBE21C4EB59012BA41479D182C521718A491D2C53E447DB81EF0C1FCDB9
            D1DA6BB2F4A70DE987627868A78FC63BCA919BDB0E3F86F201DBB7CB7FE7B93D
            29EEEE17757C53AC181701E74A95267336B0D9355ABCC5D0D1D24B50BDC6AEAD
            712B32B65927F3F02F9F462666CF59356AD8EC0CA3A7D20825CD321854E37CF7
            CD8792CC66C37B8B413A808C29D5EBB8E9F77A034A6262E24ADCD932F33B38F0
            BCB4BAC73D5EA888350A875D856C9A6DBF592B68EF9274BBA6906C8EBDC6B7AD
            CB5A22324643AD4C31C7530DA3A698C6378824BDA6B3469446C726DA49370833
            2325CE7222E0FF00C29240A1E312412F79BED453C75D4041A6FAAEBC2937E778
            373033C779539191DCB4B7B52311A855D738214282D1AEAB525C1F97E9FB397E
            EFC38D4EA2E035A3629570787123E9FF003A9355E26A28E0A28E0A28E0A28E0A
            28E0A28E0A28E0A28E0A28E0A28E0A2BFFD7EFE3828A3828A3828A3828A3828A
            3828A3828A3828A3828A3828A3828AA0F8FF00B7F67FE3C1455A3C8A51E7C80A
            003CFC047C397873E42223E1F1E339658E18A49657246D0493A9D06FB6B40D48
            037AE6C71174DDC87BCB5B73FC2BF6578D59D108686AB52669768235E9BCAE9C
            54A1228B14D5F3504A5178ABE4CCDCFA3269001D108286704505270D0C3B62B6
            2C9F18FCC7B16195C5AC2BEE6A027450468772154815ACA43626404ACB707A72
            0842AEC75E0BF656A9DA85BD7233BBC774989690031CE4B3F944F0E268D1F232
            89FB8E9F7336D537C8372B78E6F2F2526D9C26D0E2999645227221BA73A86D31
            23B7C339C23B4B728B1AE554018A1A9F5D54EBEB5198C777F1B2241D1D9003BD
            549441F5554F4ADFBB893C89C57DE4BB65E5189419C3D92D2F20F1BCDBF62DCA
            591B5B0BDDCE5F1415A4A1DD79E3C4B0F1991D6224BF941D99BB85112A9E62B5
            270A619871B37C8B843749F0A479D484EA0AEE23423615596213E33584E825BB
            EA811387EDA837DE7454DB9CABDC5F74E266EC09C0618CD186F1155E30B5E152
            326825E565B18C2367CFD776DCB0ACE22B7414E51DA256EBBAEBE75B7A85480C
            65149C38257E0479313EE8679884403441739495D15A1102F0E35D0638464479
            015CD6A8F40A74D37D575353EBDC770E52289D8AD2C7757510770986B1A6B616
            BB2C46A93217722858E870459E69ED683564E65660F635D65172898EB2CE0EA2
            8A28B984E6F47E367678DF2B8F24A96A96C7BFBBDB1940A7DC01476878E9AD72
            FA9DF21D0942EB89F555246BCF65E149BE63EDD9AEF973476B1BCB7C3E44B4E4
            9A6F6AAA3C6D2A165ADA945522A13B44D7898B5D5F23ACCDA36ADCFB8B0B2919
            63FACD977AB44A8A9C553461D532A27F3DE49B90CCCCC9A5CF426673FD835914
            95D365D74F68E55B62E54462823186B299402EB8841C93628755E3B549E76915
            5C2BDB7B50CEEA48655636258C0EB0C50054122C94A91B327220924651F46A05
            06EE0E701514593318E739844E67731EF74B13A4F7986324F3716354E9B29D74
            D05270E9366B5EE5719DFC1105C507AA6BAF1A87EEF3358CE3907B926905375F
            26122E604E9D052D8A58CA9221D42D62ECC6F97DB7864170C6621E799743031F
            8EC5E49B959A3B2364635014D232C621545B05D91F993A28E40D88445F2680FE
            187213AEFA91A0D4F014FBC627C06B7324B2376406AA38A28DFA75E7A5227497
            D9875C7B9E41CF77757F4CB5596DBAF97580C39B38D6D0480A4D25BAF5CB4941
            1825AB5058CEBC9958C548D8E05E95F579192612D2AD5D3730A6EC8E1633DDE3
            A383C849232DC821C5B22BBAD9C1960D1ABEE52011B6D577E3B71FE03BC6E677
            F0064343BA2CB5C38F59B8E9C069F6D46161753B814C76E7D9AAB620A13BB0E9
            32B648BB2E5E9D5A2EB6DA560EC74C7F54949579595C66D8DE255A2AC212157B
            591B37956EC58C794845634847855EED742EF1BE346730089C18E6C8AA7B76E9
            1D8DD538879D4EA39D4189DF3B2F2A1C9EB2D700CB7DCED4FB8E8176D902AD48
            AE6DD4ACE9B738D7B4BB1D1CC7F233182E97ABCCDB35C9D236C8EACD571B6647
            F2CC96C91277B76D5D9AC9056B81B3534CE1D2CCA20C26974C1066554E066E4D
            1B1E5C7E5E0CD8A40C863898E8E5E925A423A348C9B9C8D43A823707506A31DF
            13BC7CF0CCFEC39D390ED0BD34171D3D576E5A6F5257A6798379F56B7AABBA09
            B9B945AEC3573326257F9170EE561686465A365AA314F1E4DC41658F1CD65A66
            38EDAB7288C8252C770F5070930749AE52481D10D24CD666F7B1E785A33A2619
            04AD0C635F1DCD6069898C6B5AE05C5D72AEED208B48527C58B119064E1E4993
            124361696969126A4B94B9C7503DA3A7D41515D0207C7FD1CBC3C397E9FA71CF
            425AA5BD5FE35ABE8001C6AA26294399840A02600E623F131840003F69847907
            EBC5C2A05DEA0B80DEAEE7F87F7F054D53987050955E0A28E0A28E0A28E0A28E
            0A28E0A28E0A28E0A28E0A2BFFD0EFE3828A3828A3828A3828A3828A3828A382
            8A3828A3828A3828A3828A3828AD72E128FA0EA9669A8C88736093878099948D
            8167E707736FE3E39CBB6710D4534D53838937089502722987CEA072011F0E17
            CB923871722699C91358E24EA500049283528380DEB488074D0876D78F4E3513
            3D90F04DC70DE96B7B164CA0CCE33C979B724DD727DAE9D66ADBFAA59E0D105D
            A52A05ACC57A51847C94384944D44B2ADDB2C530A2DE4CA00612F9401A8B320C
            AC0F18DC43FE9840D237D4B8025DD4011704E9E1584A25973F3A799A92775C06
            A356A94DB4FE351975F6FB9DA51DCA37AF3F63CD1ECD5B014DC8D63B6C4C5AD5
            D6521075E966377B353322475A6065490B641B192384AE5A394E31B2E7053CE4
            5C525903261C8C6FD4FE1208F33033330B07CA7696487A92DDC30FEC54AE8C91
            E3CB242F746486C03627DC0ED4A562BC15BB3BDBB0774DEDDA2C1737865E6BB6
            2B9A8ED3FC2724905716B465B8F86B4C9D3DF49465B1DC65A0AC6BB6D9833D56
            42511AF164248F180918CC58BA48FB45E47C78C0F33998193DD6C90CB197D8F6
            58D2D5732D70EA4D0DC029540785639937772FC3E2E26398BC7C4E64D22BC3CC
            8F0E208D9A59D3A74E8070275ACBE8876A29DBB7695C8D80360E26CF8CF29E7E
            C9167CCF06D2CCC0F0B66C636581610B55C3CEED1191F22BB99068BB1A5B7929
            18D7E9A2E8ACE61662BA09B84BD5E3AF81E6B230FC462FE4992AD7E158F168EB
            0F68EE316469B6E2D1D43DBFCA46B49CA249FCA4B9F6F6DCC97A468EE869D0F0
            DC13B85A6D438EFB9C6C6EB2E3AED276AD5991C310152B3C1D4327ED04B2328A
            6359AC4F8D645ACC433964F58447CB1659F051060F3AD672AED7B349334C546B
            1CAAEFCEC39ECF3FE3BCB65E13F12627331A58C4D0A3BA7B681C048E6B5A5100
            E9B95541229AC88B1E0C5CC7E3639EFE497FF3128640564D546E9F86106FB0DB
            A41D83C42F8DA499BB04E20804DE4A29AB991B13E32AB028CD123D74389E629D
            4EAF11CBF791F1CD85D18AD9B11570B248242603286021478B7949C0873F3247
            D915AF7B9012810B8A0D49D3929A5F0216C6715B2EA416827F60541FB85360D1
            5A867CD5FED558F6057C45312DB098D30BE4AB243613B04D45309C9BBA9A66F1
            73AB501DCCB07735151CEE6547CD1A266F58C9A0658A45052F298084FE4B14E1
            E0E7422EC5F8B0927A874B626AB908BB542511780AB42D4CAC9130261EFB9137
            2DB8A0E2428E609A6AFBB9AE5BC3942C1A29DC4B00E3BAEB0DABC174060AE51D
            7396B532E9D325C6BE9CA5B6A70D3EFDE54E3EC2112B4E4D413E6EABE8E55CB6
            78559AA82AA428AE9499671721BE560EBF1D263F5F048CA3C9EA05C48015036E
            51A6BA56CD99AFEE452425B0B6525A154A0D01D002A9C3EEAD028DAA7B11DCBF
            6E2276537C35D4FAEF85708E3999C5955D7FB1D919DEDDE44B54FB49B24A4F3B
            156349147AEB325A85FF00B9B66CD0CA3D6116DD23B9064F4FC35E3FC861E59C
            ECFF0016FBCBE07C01E439B6A90EB6D78172686E40A745DC52BE464966387898
            B8E63C264CD9DCF2E06F7856965A4073416EB7028364275A6F958C4FDCEB54B5
            9338F6C8C71A8A399ABD9025F22D6B1A6D4C5DEEA3074E3E33CBA63B3B64BDB6
            0661DA8F18CE9994BBA13A4EDF377ACD6596F4127C8B46C776A6579CC1F20DC4
            F1F9D2987CB441B1DB6B9F735A3DF735A18DB9CA2D24A253D0BE0C4864F22714
            CB9216C8C38B55FBB497A109F5002A294D0AF19BF4037575471668AE43D2FC8F
            6DCA57ED3CAA37A6DDF07B4936CCA9590DC5B6626AC793AEF175DB35863E0E58
            966909F7B10F5A3D05A5890CB34751CE9AC8C711554F25978F83E4B0BCBE433F
            01B0C703DCAED18D4575A012740A81B7705A5BC7493B21C96E78EE19A4329684
            16B9DFCB7342B80545D07140B4AD69F604DC2D95DE443B83EEB6306DAF0B61CC
            68E310E08C3D1F2515252520B4F349446D56F9D7513639E02423742CD2A9B645
            DF91C3972FCA604D24A3925A41CF1D9D81923333B1327BD1484C6D36B988D56B
            C047004EC3540BCF7154CF9F2277626061C271F063FC473890F2F7EADB10B5A5
            BD256E1A6C1095353C7CB97872FC7C3FB7E7CFF7F0C10A415D2AF76BAD025030
            78879B9080807201F12880872E7E1E6030730FD788172953A55480743B2AD5FF
            00DB9F87F6F1E26A68E41C142D57828A3828A3828A3828A3828A3828AA08F2FC
            FE3CBC0047FD403C14557828A3828AFFD1EFE3828A3828A3828A3828AA08807C
            7F6710481BD41206A68F3007EFE5F011F1F8FE01E1C4EF564356994217CBE630
            0798C052FEA6101100FDBC838C27C9871830CEFB439C8342549E1A0350955F39
            4400407980FC043C79FEBE1F871AB1CD9012C2A05074DEBC2D65A31F2CE9BB29
            066ED762B0B77A8B67092EAB45CA220645C912318C82A0251E653721F0E138BC
            9614F3CD8D14EB346E21C11DA1050EA421D791AB398E680E70D0D7B84E52F311
            1E401E23FA078FFBB86DEF6C61CE794002D50155AB0164847901C047979B9073
            11E5F9F2E5CF970AB7C861B9CE6B665706DC743B73DAAF6B834393A49DEAF039
            4C002510103000808788080FC079F0E35C1EC6BDA55A4023E8751555AA184397
            F7F8F873E5F1F1E5FA087017588494153B2AEC954FC39FC79F87C3E3F8F3F0F8
            73E05051C0E9555050A6956898A40131BC000039987F00E5CC479F8F8178CE69
            A3C763E694DB080A4EA7EE0A6AC80B979D00206E4629BCC5378008008F3F1F0F
            CFC03FD1C4C52B27899343AC6E0A0ECA39EBFBA84DC1141CE54F909CDE503180
            8023CFC4C21CF9007FF2F196465418BDB93225B5AF7060D09571520680F23E95
            07F60FF1A5579F3F1FD7F51E61F1FDA1C6ED1B903FCEA114B50FAD504E001E23
            FF003072000E7CC47C7C797E3E1CFF0000E21B2335EAD8A6DB7A50F706217E81
            5057CCEAA29A6A2CAA844D2400E7515318008915201150C7308F94A09800F984
            790007C78C4E540C8E6C832240C5BB43A11A93B2EDC0558B49735AE6EBB8ABC0
            C03C848202021CF987C3C47E3CBC479072E2D0E445931B678A4BA12141423E9B
            EB416D97044FBF5A04C5053C83E226288F8878087887FBFF00607EDE3474CC69
            634BBACFF85AA871282DD39FF955C23C839F3F0FF6788F8FE21CB97162808074
            D7EFA1C789287F6D1CF9788FC3972E7C847E3C847FFA7F5E29248D898F7BCDAC
            0A49DFEEA96A1443A9AA1144CE05310C0629803CA60FE201F1101E421CFE23FE
            AE2B0CD1CCC6CCC2AC3A03AEBF6507A3DDCFEFAF3A3231EE1CBB6683D6AB3B60
            644AF9AA4BA6770CCEE4BEA37074894C2A37170987989E700F397C439871863F
            90C3CB9B220C79AE9E225AE08421050852003AF25A9702D0D2F0809D2AC7D271
            B185495917CD1826B2E9B645478E136E455C2A6F2A4826654C403ACA987914A1
            CC4C3E001C533BCA6178C0C7676476DAE1A68E3AFF00DA0F2AB00E3A257BCA60
            3140E510121800C510F8080873010FD04386E19A2C88619E172C5234169D7504
            283AEBA8E75447071068F300788F878F2E353A2543886EE6BE2576D4CE8EC8AE
            1133C4D049D28D01420B84DB2EA2C8A0E0E880FA8441655BA85298400A632660
            01FE11E587C983E47C4BFF00D4597221F6AA2AA26FEAB560096DE074D62666D1
            5AAE9E3D29F9F86845259E92362C92D24D23CD2520A26A2A9B0600ED54BAB787
            492318124FCC712944797201E10CBF39E2F02766365E5064CE4416B8EFA0D434
            8FBEA431C45C9A5677987C78EA35CD7B43DA7A485FB2A10D1CC38B705E150955
            E0A28E0A28FF004F0515F022042AEAB80F53D4552452373554327E440CB993F2
            222714933F35CDE6314A5130720111F287228AFBF0515FFFD2EFE3828A3828A3
            828A3828AB4DF0FEFE0454A82147A8AB0C3E528987C40A51FD3C43C7F21E21E1
            BB91FF002A1AD24B439DBA70AE4171DE16B577AEDE6DAEBC5AB33648A2EB6E19
            B0C2C05359C0F99772EABAFCF350D498BA333B222A56EAE699468EE2CB30E568
            D7CEC8EA4C8898A405486495C2F0DE2192CDE572E3EF4F2120355ED40482B707
            27A25ABC6B7F35E43CAB063F86F0D93F19AC6073A5B5922BF50458F1C82ADC9A
            A70A903D4FD4ADCCEDCDB3778A453A5EDFB01A0990A8362B338B4586E1521B6E
            23BA55EA73325067469F252CC1EB8B24E49C6A506B0C143B9612ACDE47BB7864
            158E5531CDF063307918E3C2ECE2491B8ADE5CAE3A221570E9275D0695306664
            3E2C183C9CDDECA6968325A1AA38BAD6041CD16A1FBB37F6F5C4BBE9039A3226
            68BBE5580B050EE55008F531BDCE22A8FA61F5BA15CCDD824ECE2E20E4ACC75A
            46459874EE082D103F9D6144545414045FC5C1F192785C539BE2DB3444BA3692
            F91BD2C6B13D8F691EE4D54E9BD67E626F3D8FE559F94F9938AC7441C488A292
            F2E73942480DBA0E159A98D94CD5887137771D3CA3666BFEC6609C59538B8CC5
            97E9D9C5EEB3145AB5A73150B0F5BE10D910A0EFA88B1A55B1FB470D52E71893
            C845D76AD58A0A48987939BE3FC6E2F8F8A3633B11FCB083ADE810F4EAE27ED2
            574F5AEBC1992938E7C90EE67DBACBA36F5040058C168D755F44E5598D27D35E
            D8193B56F0EDEB62772A5F10E6ABB4964A733308C361AAF8E8D06DEAB70755F8
            EAE2905626AF13AF2CEABC8C4CB87520948C8AAFFD44545198228A3EC5DFA6F0
            72618A38FF004B89200D638B8CD28B9C4228491BA6BA81EDDCA579D7E47EB26C
            B93918BFAA8E3E3B5E581BF1B1DE001EAE692BA71AE8CE1B2D614D1869A37A7D
            42A7668C8D54CDA792A1E2CBE569BB8C995E838F84631F3CA59B22DE9DCB8289
            474E058C1E3716292CD5BC6A2E964D26AC19A64E38EF971DD972E039DD89E284
            5B1A3CA3596B1AC52A741A2B89769D454935AE3C6F38D34F9D99DCC973C92EB4
            0EE3DCA49B59D2DB8AEC03470D29DD67A0CADF43F301705231CE335298CAF296
            254A5DDB06319F51D5ACC9129877CEA55A3F8A4D046C266E71EAD21686F2F956
            12A626302398D73F1E488354B816A2A6E0855AD2390C659235AA5A853991AA57
            207B89A419AB4DB586ABB839AF76F2CD6775EC19162DFC263E87BC2924D8B316
            8936B21658B80B6337CA4D2B6CAEC48B8939D926872569C0A658F16CA20283B7
            0947FA7FC162E361BE0F137E6B5ED7BDFDD90239148B4B8B4A1E2374D0256FE3
            73FF0051E76665CB919020C06C64086C89E1011D7786821469621D3D74AD8B78
            F355B765724F6BB8BDB0CC57DC19AD5B0BA9D877246569EA13A908FAA3ABFDA9
            ADED7B95923A0D131E2CCE5EB57B5F6CF05FB392F95A2E60CE7C828A4BA8BF49
            BE1BC5790FD431BA48FBBE41B897302BDBD377B770DDC9D4A9FE168F27C93BC5
            6647E22610CF264BA3EE5AC72AB77B5E138AA6894F2BB0FDDA1AA793F7C70DE3
            4CAD63C99A838A24EA16BC697FBFB193AD1A3C671E5E3DDA4D469289B78E8924
            DC3431567AA18AC8574639078668CCCBAA8A6E8C4C78609ED8BB796DCB732D52
            EE9039EA37D39F1D74A55F2E60C9C6F1D9595F2329B0B6E363584BF63A374D4E
            BA14D505310DE9EE4560DC0DE7D79A9E22BBAB1BAD18BB68703B5C74F7A718C6
            965C8F0F91A2507F981EBD2B307C0C956930BA3088A8B79928B6C2E0504977C7
            4851C6F1F03FCEE0CF906EC96B874EA3F0EE2BA836945236B8D74B25EDC4F1F9
            1163437CDDB717B9511E0158908D5001D63453A6D5DAA93F8932F9807998A051
            0F8F88878FC3FD7CB971ACF10944B13C2C4E0411CC1D0EA351A7DA2B9513DD24
            51BD11C403CD3FE29F7D726BDCF3B6B6A8698E0ABEEC6132D6DBDA339E43B8AB
            038B2109930920169CC3767527644D291422EA49582623106F1CF9D28470FCCF
            5E02456A938178E1131959FC4FE9F9206C0CF02DEE1168777A65544050C96FAE
            DE9A533E3B27F55B67C8C897F5593E3E06BA4EDFC68766A911DC1B76A34BB822
            953A143F78308DDF40FB52E05D56B3DB9E2F953643612C19972EC121615E6A08
            1488A984ABDA4C67549326CF2BD5FB096ACB48FF00120CDECB20E5D282A83930
            9E7C878DF1B9D2F88F178589DA83123648EEA7395F1A832F5107F9BD81CE1E95
            7F0B9FE49A3CC795F2199DC96773DADE8636C89FA86F4847227B880E3E94E8FB
            46563B56D22DC8643C259EB36DD3632898A6EF6894AB6500B46396CE6BF1F065
            6F779BACE3686493A1CF306CD9C1976CCD692B1BE64DDCA6B99538911705EEE6
            E061E260E5F92F19E3191C8E86C7CE1F239C402D71058F75815CD6BBA58A12DB
            9095E7C38FE7659717F30FD4A72BC249902D8BB11C618F7281D6D025716B491B
            DA579A5231AF7A5CF3B94E9F6CDEFEE72C899627364AD1299726B0AB181BAC9C
            453E9AA639AC25275EA9C5D71D2858E1AE48DCD377126445C0A48C2111041466
            F8CE951F3DF927E9FF001BE223B7C787E7CF177DF35F302AF0B6865E58004DC3
            75E00221E849E53F503FCD5DE3FCC7C7F130BBB1D810C2F0F0D7957991CDBC17
            823405410AA49353A7DA1B3CDD762340B08DEB23CEBBB55FA246E38F2CF667CA
            B372F67D7C7B749EABC3CBBD70D5551C3B7EEEB11EC0CE5CBB224E9E39F51C1C
            0E0A95657A6EC5663C3E3FA51AFC68DED0ABA1684FBC1DE9333F766CA218A44C
            E6BB5DC83A9DBEE1494F753DD3B4E2C818AD3ED6E84B2DEB70F642B6FDA52ABB
            4F6EA2B2B51A2BE4675A4EDD0CED270D566130E62A025C221548C3D2291EE5FA
            E64D065C96E767C472B1DF017DB115EE68AB1210EE20851FD3D5CABA585361E2
            BD99598750E0231D5FDCDDAEE9054043A1404A2A85150BD89F6BAF9ADFD86E35
            5C6564B056EE992366F27619A6591B2F25132D5B819594B45FAD92B4876F976E
            BC582ECA11FB0424192A066725266729188EC9C8BB79BF1DE3B2317C4F8E63AC
            F18E82207471588E9CC3C2B473BBEDAB78FCA6BB23C866647E2C8D123983DAB2
            6ED050733B908A8BA68517C415DD2B7F93F5C11D2EDF0CB18AB7A9F5CF1EAB73
            C9994E9B94DAE2DCCB69989B8D7B6AA34CF4ED515211EC94F9D56AD594CACBD7
            A78A278C78670BBF45E17A33F87F0CE6F8D8FC478D6C7858963DCD124AE2638C
            0BA526476E7FA1A575010A171E3433FEA18A3CB9337CC8CF74D7241DB8E0EC34
            A91F88D67E259A33524B89BB4D6B7DCEF9C751769BB8AEC997B99657BD56703E
            159AB5622D70C7F1B097C421A267ABB657754B5C9CA1A9F14F67AB72B26BD2CF
            20A756D39CC2CEC89AEAA684622D0C8784F1FE384BE533F2626C9E4DD33EC532
            0B60D082035D613770705E612BA9993796C8C7F1B81E2BC87C0C76C4D9243647
            35D221041BDA48D1351A6812A73BB2A556B355D5EB9B7C67B1C4D83C28E335DB
            C70FB35E32661E7F0CD499C3D623FE94DAE0E6DEAEA57AC4D1DB53CBB86AC5BB
            38671EEE1231E9A8D1FA4E167A6C06F8E631A604966265B94EAC7816E8A46843
            8E88754202572DB979F9B9123B3230D6C4DED820B4F76C27F1D006965E10F6CA
            DA135E15229B23B018FF005770A640CE793244AC6AB42845E4956E451323F9C9
            55393783AD439151F22F35629659168D483FC3EAAA063094806302BEF6C883DA
            09FD829EC68A39656B6592D8955CE426D6F1283528380D4ED5CE9F6B4CC19C32
            F7765CF19133D57E4A9F74CB9A8CF32441D51EBA6AE4F55C533779C213588200
            5AB72363346119529DF3A29B96EDDF95C395D678924EDDAE5153C7B3123F1BE4
            A3C3292BA77CAE3D5A48E6804A3B43B0D074F214CF94C88A6930DD8B12E231C2
            10E54B9A0920A10082E1A9D154EA6939EDEDAB3AF9DD4DBEE0EC46EC4A4ADCF3
            32196A56124631B5CACB522626A4BEACB09C829166D9BC9336BEC2CCEBBF868E
            6D289BE60CD0AE284F4FD415F8E9F8EC2C2C0F017C3801F95973C8E7CE5EF05E
            F2D65CC11DD63036E526D42A2D40D2BCEF2B91E7F2FCC63B703C8187C542C6B1
            B108E27238172ABDCDBDDC3EA42A926A543B1966EC8F9974BA463F24DA17BCBB
            C2D992DD84EA97378E1B3D919EA2562AF44B156064245A9011945A19ADB8D1C9
            B913AAAAADD9A7EA9CCA81C474CA8628598A191D84C4D2429775155D7FC0E55A
            CF217E448D3AB81209D9483AE9F5E553281C29AF1AA71AAF0514705147051470
            51470515FFD3EFE3828A3828A3828A3828AA0FC3882400568D92AC380F94400D
            CB9F807873F88787147B4C913D83425A47DD468AD3EAA6B9BEEC9764AAEB865C
            DE7D1BBB5820A02F34BD85712F476B38F7DBA6F20448375E8CB1E00250AC559E
            4DAC4D362648A5451059424E7AC0532670314972F1F0FC6E1479525844960284
            DC480810029B1D6B6CF57F916CED77E0BA0000E5D44FD4FECA7939A3B94D5FEF
            BA99DBBA9F8CDC6568FC874EB243660C97559AF78430E4D4840D91518EB0D45B
            575FB37F13051EC1A9A7977328C9360130D93F2AAA9164833F152C5E760FD423
            090E3E14323A490B8000B50596BED2E25742D553D2012452528CCC6CAC09DA16
            09266B2CD3895BEED4EDA5A9EAB5CE8F6ABED5F11BF78D322E45B0663B162B67
            8FEFAC71FB342B1538E97939B77F2B56EDF2CF1D4C494CB740AC0CDACC4224D0
            ECD6E4B011732A628190374307272F0FC5634F8991DB8DEAD4B4396D0D576A09
            0B76DC13D6BAAE9F019932E3E778FEF0F701DC7311CA47F2EFA732953959D3B7
            DE16D1BED49BA78F31336B0DA65AD78D65ADB78BC5C5D24FAD76893AF9917B12
            A2A10CCA3E362216A0802C78E64CDB24DDB09955D5F55C2CE5C2DC9CD747DBC7
            92565E7BCD7EE8AED4AE9FBB6A9EF40FC90E83184515A96DC5DA6AAA4FF04A6C
            1DB97B35698E79D4FC01B0197985E2ED6FC83577761B0C74564A9B81A73A497B
            1CFB76B1A836A9B98D958F16F0A9A0D5C8A6FCAECABA4711508A09C38E8E540E
            C7C965B39ED5AD7220DDC0395753A2A22A145D2B36E642B29182D6C8D716B5F7
            38941A6CA1BEBA8F42B5D2340B2A263282A263783181A7C246444652B1F5508E
            DBB121222B10E8B38CAFD799B95C1778487838F294134C1439104BCC3E01CF84
            67CEC68666C33CFF008AF1A043AA941A809A9A55D73D5C5DBBBF6D672C56087A
            9D7E76D5627E8C557EB50F273F3928E40FD3C6C3C3325A4649F2E2990EAFA2CD
            9375143794A61E451E41CFC38DA691904524CF6F4B1849FB35AA86EA022B8941
            FC3FC1AE3C63055EEF1B9D13B1FB2F7EA4E24D15C657A9182C754ACAF7DA055E
            4ED35DAE057E71C62D86AE9E5A2E4E424B2597D094B8CA2BD424D18AFED6D5EB
            833240C82993E5BC4E0E2C4FF21E43B534F10788AC7B9637AA3EF68202A116E8
            E1C40ADA0676D93BAF596F2395A53DBC8A73E34E236AA0B1A6DA77B3D7FD7CCE
            13C2C35DAAB816BB2D856BD052678CAC6507B60AF4DDD625281B0C2C89508E81
            B93B8759A99DB3F44F201556CC11500EAA26331853C4FC097265776F19ED1DB7
            6AEB98E4409B8D14F505E1A1ABC924B871C321884AE7BD516DB4FD9BEDE835A6
            376EC15B2F4DDA6EE1DA0FDB28262D986676AD5C2655A0582CF4A93589112113
            8F1A582160F205E654A73CC317F727504B83A93078A41A6F92760AC834494073
            C1CD2CBE2E66BA71261B731C1AE2D6B51C58DD360EF68075D0E9C455B3717072
            FC861E7359F1B3840D6BC82F787B038B9109B5AA49D4024734A6DD99F0FEF96A
            1E3DD4EA7668C015FC5B5FC6F9E6CD91F064D79699747F77CE76B99A84C3483C
            8D2743BFDA183D5CA95199A31A83C060A8C322E12170AFA0D4CDFA8D38DF9D78
            9CA643F881D1C4E75C7A817296A6C2EFEA0345D0E94AE4631662F91BB3D71DC1
            C8EB3FB44828F4557DBBA6CEAEF1F1EDBE55CD6F1A4265252A557CDD63C6F176
            BB5E3E859F6D21D2CD4747D71BE441AB24B2FEE33954AB5B2C28B3190226648A
            0E5B7A8629974C0DC49F2F0FF34CAF1F04BF8A2E7B5A557B775AD25C801DC0E0
            7D05658EC7478D0832F705A05E96DE53DD6FF2DDBA7054A876DED886BB19DD63
            B6DEB53845F921F0AB0B7EE25DC557BCA0A66321A69B968A41894DBAC57D2513
            90314366C732C744A56732A817D428A899F5C17B5F3673AD3D88F1C9B87F597B
            5A0268762ABB69B135B973B1E0EF48E463E4B07D5094D1787A0FAD2DFDCAAF9A
            2D48C8BA604DD5C10F32CFCD1936D158C5B707D1AD6671CE2E999742A51F3EFF
            002542BFB4C5B29C809741DB35C5AB88A9C6E446297747492168539937E2624F
            33E6958AFED1D751D2AA880A7DBBD43B37C961C2E970622E80B8079B9A2C1AF5
            75025C9C9B51F9B478730697BB876FBA0EAD51E8D55999BC777E98CDAD3141E1
            2A55D98C33334CB0C0C6293AC6A4C08C4A8BDA11671049C2803D5A2EA3D32094
            C2D8E2B7E9B8BC740EFD4F0F87686E2BB0A4326EE0252E6B5A52452A1C845BA2
            EBEB4DCD907231F026CD05F28CA6B9AF54D1091A040789D7E9B5281DA2F3857F
            0BF6B7CF147C95632522F1A6F6BD83AA648809A9360CEC34E9270F666D30C8FB
            6C8B44D766E25ECB32EE35915C26E7AE9E68E904BCEA10CD5163CE797C0C4C3F
            170E4E45B33B123880B5C6F92D23802029FF00B473AC2381D17919E33125D299
            37F730BBDDBE8A9B6E395388ECA4C63303F6D1D733E52B6C2D3D4CBF79B5CB51
            91B84C4457929A73963234F298C6BD5756464809372790218AD6462DAA2633C7
            9EE0054D231BC07A3E472DB8F1788832FF000E618B14607BB5B411B04D4387FC
            6B0E974D95DA65AC32BB8AAEA79D32FCB5A4FDD8ABFB9DB3DB5587A375D6E337
            9458DF2998EEF578B3924EED8FF0E2B244694DAEE338591AFC4C252320234B6E
            DD90AAA19D47B9548E8CE96155D28B29B88BC73BC74E72F2EF9C35C582C70436
            E815BA1D789FB699C8C76B8E1330BCCF69B735EFFC2BB5E2DEA3F4EA1A5429D5
            30FEC9644ED5790F25A65524F5D3016CDD6AE7458319748D2645E76AF6AA8E75
            957BD0AA1309D523E6ECB5650C739C8E50517997445124455386B9513CE2F889
            3C83CF7AD8C8D020C40091ED3C75E064D0AA68B685ED664F957E31548640D1FD
            53AA87A9D976B4F473A932EE6969EDED92352358EC1A370587A0F666D193B1BB
            3C3B4FC1B155182CAF5C71270E68A94A7E42AAD50884AB694879118F62934964
            BA84E69243D23112072A8798F19078E6FEACF1EFF0401F25F203DCEEAEA8AFEB
            2927485DD3DC380AAC19736478BF21F3019236C2F50A96481A4DDA6F6EBA0E97
            7ECA7A9DBE6A18A28BDC9BB93627CCF115193CFD6CB5D7B25D0A4ECF5C6EC97B
            4E38C8F13236FC96CF17444D9E61567584AC76040D300D5D9CD26602FAC55136
            00725BCA61F8C962F2117968476A4CA94B02B8AC253B7EC3A2752A9BF5EADA89
            72A48CF8B64327E1FC48DD70FEBD4226FC8AEC129AE69D6B4EC7663CB3DC291D
            2CD8575A7D82986EA39F962C74DA0C25C31F5D9A437D4688B1C6D1630EBC0221
            F2EC41AB2220D1FA71C44174D9993319A2228763C31C8F1FE07171229DB1E3B6
            5718018E397F00B596FBD5C2E2342EEAE920D466C1E27C9E743939F1BA477C76
            82417B55E0936A34B47125469AD2E3B7FDB03B9A671A5E1EC7929B898B7662B3
            58C9161C8960472CD19CE1B8F673878C816955673B5FA5A391A2B26D298368E9
            4481BB94993C6479A709727ADDC81E31AEEE3E565432F927B6C8908B5819716B
            9436D88001413D4553F6518F87E271A3CA8B1A576346F694D1F2F5109775389F
            FB746E9EB4D8317B1EE693BDE56223ED967C31019E6B742A03ECEAF29806738A
            66F5482D18BFE7E650F1D34D159A7D689D6E0D936C994235F252C8A2B2674199
            143A9187F94B879EED36EF1F232416750FC6D11A1E7A8142977B35D6A27C2633
            1A08E6F237C81D7C7276C854501B603A6AA55DFB291BCA18F34B7356C4EF258A
            AF98B2B76EB7F45432C43669C30E95ADC6C36C334A93A992BA3D1AA495B69C79
            6757DB2322BB774C3A8ED23AEAB75D04C7DD00E971599A3F4FF8A987CFECFC99
            4C620ED87DC5ED2037B88EB6E6AB6ED138915B771D3BB199E57C1DCE625B377D
            2E0361DB61452755FB35DEA6CBB09D2E76ADDBBA973D6089F697194324651C93
            1E4519959B97F0325621AF41CD2E00820778DE6236B29B862E47CC5751876CAA
            6632474C78EDF906187E131D15920C78CB9AAB692DB91762808D45240AC99364
            76B3BAE40AA817F854CE87E23FAF1CF0101D554AD5B6ABB89A28E0A28E0A28E0
            A28E0A2BFFD4EFE3828A3828A3828A3828AA0FC3C7E1F8F122A0A21BB6AB3C3F
            E5F873FF004F21E7CB9F8F3E5C0135E6B50CB50DB5CC1F77E2F6A63E7C4432FA
            FB0C86D90FC9DF3129A8AD621DDCCB25D143FD3BF9C52C80F196373DE7E5FE90
            237A6396C9EDBD209FF91EDC1C304F8F10BFF36631D8D69F7191BA270ED35C7F
            68FA572721BE69C64FF6F4F3324BCDD6478EF1DCE2BDF923D5136E9F555A72FD
            9B43B6501EEE1A80A5FD4CEBF2633FA966CF68AC8E65F937E6A94F5C502325D7
            C71EC636CFFBB054CDD3839E87DC07D4E8B8EAE4990FE9AC0FCBDB18FD2DDE36
            D86423BA856F33012DD6F2166F6EAB5961B7C937C811E7A695FE6FB02D323206
            1EDDC7618EF7C7EFBBDC6EFB12960ECD01A4C184F34FD8F9B2E9B1FF00D7FB08
            CF8E6522649D096F9328DED0158021D4783410AAF43EDC32421342AF51D787AF
            CF8E76676CC18DF0C463138D9DC22F417AF751D725AB6AB36B75BA9BC519232B
            23F317BDD9C86DB9B1B521B8DA0769CE6901CA85C4487880129F56EA863D1D40
            D9E0CB06B3A78CC7036550BC9E909C02B75256C69533EEA7A6A56B511AC2B6D2
            B5F30C69644E46267BE902E604BCC3C223B025C739401C6BDB7024805ABA825A
            0B802154B4170E009D29D9C651864182E2334B4F6C80D243D3A080F2D6121C88
            1EE6B09D1CE014D62F45FE8C86A0EBC7DBD8D9CD863E96D63E9F8DD4AE097118
            2E883CBF3495731CC162EA3D4EB3D31147A8F3FA3FCAF270E790EE7C905E1A22
            ED32CB54B7B7637B684A3D3B76A5E2E4F7F52D2DE3C4C212329EF7675EEEE970
            635C5EA6E511B9D18D57D8E2DE5A5363DE80D1A1DA7EDDBF73E6B99739065E9B
            FB4C0AB92F06891BE7BC637EA82E434F391916246C5EC1E88C900B403FA9EA07
            4BD5F1BF8B217C8F69B199BE23FDC5E0D9C6DB416AAA7BBF72D5F387962DC5F8
            924ADC31337B96B617023F9838C8E6BC04DCC61CF1C0134F236BFE9CFDB2E7DF
            AC036E0C51F48B207D4C1A11654D70F90FE5891F9B46BE10262CB8BFF63F5F97
            A03E6F2F3E7FC3CF8E5BFE17731FE786F6AF1EEEE5BF6F6FAD3E9AF2A66419A4
            0F80E70C84E9B43095E09DC21ABCAE29CEB93B9C2FF971BD485EBD5D8CEBFA73
            7BF791BEC8757D1F44DBD7F987DC1D74FE9F47E7E5EC3E3E4F53D2FE1F271EA6
            23E3EC86D661F66F162BB2D2FF00E5446DDF4BBA7FAAB83147FAE2E96DCACC2E
            EE1558BC78EAE3FF0098D49BEE80767F1D39D290C9A7B0971885628FF6866C44
            9DA4F9C071BFB3D7FADE948E9525C0B4918AE83E64F7930883EF43CDFF0056E9
            78E7E496D99FF9DB62FCA57AEF32D972689D80645B39704BB5B69A737CB17423
            C54D30F3977E216B31CBCBB5BEE6CAF6C23AF7B1C403A315AA69CBF69C0EDB01
            51C91F6186706B07BBB5FABA37A25BD3CC5E7F5DFF00B27CC217C3A934355EB3
            AEE8BA11F69EBBADE5FD6F57C699FF0023F26F17F18347E9951D9EDF70C77DBA
            2F7525BACDBB9C2EB75BEB3C20F1E4730794924779E43717B636BBB6A3610B9D
            125DC8DDCC22539ADD4FB23F535BBEF47E5104BEE2299F40FE70F99461FEB974
            333F29F5FEC7CA1FA0F43A8F37CC1FF42F5BD2F5FF009BE870B789FCC3BD93F9
            62F77E3BAE445B142A2F1544B7AB953B99D9483BFEDEE353EFDF6D39EF587C99
            F649FE201ADFF3F8B7FBE6FA57917E8582019045E7D2EE86C3F397B98C30863D
            E8FA6F76E8BDE83A9F3F53D1FF001F9F8CB1FE4FC6CDEDA76905FB7B6E09FF00
            D49B6BF656B289963471F8EBC03536D75243B6E43EFAC88FD9B7F8879C5416FF
            007D3F6B83E98380BCFF00FCF3F515B798591941FA69EE1F39F97CC0987BFF00
            4DE6E7FD1F9838983BDF964BF1C0F8DDCEAE6B68DD786DB14DA94CB0DF9D8E72
            DCEEC59D011B6DF76EAD37DC9C0B6C4E2BA564F7C7ECABE8349FDF70D1430E7B
            913A21B904A8CA859FDB653D0FA7C15510BE8DD3D9BADF27B00849743D472FE4
            FADC1E3BE6775FF0B7B4DDB2268AAABF77D9467F63B5F8C48935B102954E940A
            01D7FA881CF4A68BDAEBFC25425B21FF008788D5C6F7ED6DFE781932E522E4BF
            957A963E88340CCC73DA7E49F72E9BD5F6D1F6DEABA7F57F99E871D7F25F9F1F
            0B0FC804782F92512D2CEF5815740EBBB696DDA25D66B7D25843187901F31EF3
            E67B5D378683D95D13B6E746972EE6FE7A257A36C7FC15BEE283EEFF00ED3BEE
            1BCB0DEFBF517A0F75F27B313D887277A5FF00A77D2F97BD1E9FE65FE0E8FA6E
            5FCBE9F86FC37FBC3E237F265F87AA7F677F4EE756DF672ACF37F20F932FCE3F
            8E9AFF0073FF00C74A7B19CBECF796B1FD79FA4FE4FADB8EBED4FE67E83A7FAE
            1EDB21F4CFE9AFA1FC8F7DE87D4F6EF4FF00A7F3FA3E5FE674FC71B07F39F95E
            67E35DF37E34BF22EB6EEDA8EEDD7F1545B7AD76E34F647E57F1FC57C8FEC77A
            3EC7BFFB887B7EDD765F774F3A75BF80FE5CBF4FD3FBBFF1E3902E42BBD754AA
            D33ED58FB31FB737FF006ABF4CBED8FDDB24FB9FCB7E7FA77D67BB4AFD4BEB06
            7FFA6F6C191EABABF3FF0045E8F9BC9FC8F2F1DDF2DF9F7C8F17F99177CBEC47
            D94B17B4A7B69668AAA8BD6BBD72F17F2BECF93F8BFDAEEC9DEF77BD3AFDDE9F
            D3A72A61DA8FFE07FF00712C3ED3FEDFFEE1FD079F29FB7FCDDEEFE87B243F51
            F4CFE78FFA17A7EC1E9FA7F2FF00874BD5FA7FC1D6F1DDCBFF007C7C0CAEFDFF
            0002C37DBDAF6A1BAEB3AED45BBF9537AE33BFDA7F2FC7DE9F37BADED2F77DEA
            2DFF00A7744BB8D2EDBAFF00E16FF5A7127DEB7D25FADFF2A4E7D36F9A3E67F9
            9FE9E79E4FE61F7DF94FF97F4EBD0F76EA3DFBFE8FD17BB73FE9FDCB8E1F8DFC
            F3E14DF97FFF00A979BBFB7EE40BEED764DB4AEAF93FCA3BCDFCCBFBD6E9EFD9
            4FF4E9BAFAD3F7C53F4AFE4C6DF467E4EF90FDF6E3E87C89ED9F2FFCD1F39D83
            EA179BDA7FA5F98BEA0FBA7BD79FFAAF79EABAAFEABD6E3939DF27E549F357E5
            5815536409B69B227A53B83F1BE3B3E081F1F86FF6FBB5A5147973FD797EBF0F
            D397E3C2CDBADF4A6F54F45FBE9BFC27DB2FDC7DD3E5FF00A3FF0075DF4F21FE
            A07B4FCB1F5ABE9775D1FEC5F34F4BFF00AAC6A5D7F49D3F53FD3F9FD1F2FF00
            C9C745DF98FE4ECEE0FF00F91F24A6C9DDB3FF0072D9B2F4EE9AAD734FE5DF9B
            EDFF00F57E3EBEFF00ED5FFF00B3DFFF0077D94CA7687FC1DFEB24AFDDA7D9AF
            D71F70AAFCCBF53FE47F9E7AEF97DA7CB5F39755FD67A1F26F4BE6F73FE47B2F
            4DEBFF0047E871E8BF4F7FBBBB391FEDF5B2C3727696DE297F52AED6F572AE4F
            91FF006BFCA9BE7A7C9B7ABFBDEDE3EDD3F66B52815EF62F6184F95FDAFE5AF6
            88DF973D93A6F65F62E8D1F68F67E8BFA2F6BE83D3E9FD2FE57A5E5F2FF0F2E3
            C8E477BE4CFF002EEF977BAEB96EB94DD77155555D577AF438BF1FE3637C64F8
            D636CDD2C416A2EBB26FAF3ACB872F37EBCBC7F7F197D77A60A5DFF527DD57F1
            3451C1451C1451C1451C1457FFD9}
          mmHeight = 10848
          mmLeft = 159544
          mmTop = 26458
          mmWidth = 36513
          BandType = 5
          GroupNo = 2
        end
        object ppImage6: TppImage
          UserName = 'Image3'
          MaintainAspectRatio = False
          Stretch = True
          Picture.Data = {
            0A544A504547496D6167654B7F0000FFD8FFE000104A46494600010101004800
            480000FFDB0043000604040405040605050609060506090B080606080B0C0A0A
            0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C2020
            2020202020202020FFDB0043010707070D0C0D181010181A1511151A20202020
            2020202020202020202020202020202020202020202020202020202020202020
            20202020202020202020202020FFC00011080154028103011100021101031101
            FFC4001C0001000203010101000000000000000000000506010304070208FFC4
            004C100001030303010603050407050605050001000203040511061221310713
            224151611432711523428191243352A1081643627282B12534C1D1F0175392A2
            E1F1266393B2C235445483A3FFC4001901010101010101000000000000000000
            00000102030405FFC4002D110100020104020006020203010101000000010211
            0312213104411322324251617181236214339152A143FFDA000C030100021103
            11003F00FD528080808080808080808822880808080808080808080808080808
            0808080808080808080808080808080808080808080808080808080808080808
            0808080808080808080808080808080808080808080808080808080808080808
            0808080808080808308820CA2B08328080808080808080808080830481C9E882
            12C5789AE371B88DE1D491777F0B81E4778273E79DB95E8D6D2DB11F973ADB32
            9C5E774101010101010101010101010101010106090064F41D4A0AEE98BBDC6E
            1575E6A1C1D485FBE87C3B488B739B83EBF2FEABD5AFA51588C76E75B72B1AF2
            BA08080808080808080808080808080808080808080808080808080808080808
            0808080808080808080808308820CA0C22B2808080808080808080808080829F
            AD2E55359574FA4E847DFDCDBFB6C9FC14BD24E9EADC8CF1E8393C7AFC7A4446
            F9EA18B4A42CD4ECA4BFD7D333F77DCD3ECFA3411EC3A9535A66D48B7ED9A712
            B02F2BA8808080808080808080808080808080821757571A3B0D498FF7D38F87
            81A3A97CBE1C0FC976F1EB9B7F0CDFA73E9BB53A9AB2A256CB9A68A1868618FA
            F34FBB7C848F3739DFC974D7BE63F9E58A2C4BCAEA20202020202020202020E7
            AFAEA7A1A396AEA1DB6285BB9C7FD00CE392780B55AEE9C12D165BB32EB40DAC
            646E89AE73DBB5DD7C0E2DCF1EB8CAD6AE9EC9C335B65DEB9B42020202020202
            0202020E0BDD74B436E92A610D32B4B4343FE5F1380F2F62BA695374E19B4E1D
            B1BB731AEC6323385898587D28A20C20CA020202020202020202020202020C20
            CA0C22328A2020202020202020202020208CD457CA6B25A66AF9FF0000C451F9
            BE43F2B47D4AE9A3A7BED866D3843682B155C14F35F2EBF797BBB9EF667BBAC7
            0FF6710F4E392001E9E4175F26F19DB1D4252123478FEB45760F3DD4791FA612
            DFF547F29F726D799D0404040404040404040404040404040414BD7F778E8A7A
            42F2D3150C72D7C8C77473E31B6069FF00148EC2F77894E27F7C396A4A574253
            D643A52DFF001AE7BAAE58FBE99D267793292FF1679CE1DCAE1E44FCED513EB8
            3620202020202020202020A16A2B89BCDF65A2886FB6E9F06A2B7D1F52587BAC
            FB47E5EAEEBF2F3F43C6A6DC4CF72E3A93E963D1D049069BA2649F396B9E7FCE
            F2EFF8AF37933F3CB7A7D269706C404040404040404040415FD5553138D1DB8F
            2FA89A37BBCC6C6CAC69CFD4BF8FA15EAF1ABDCFE9CF513E3A2F2B70CA288080
            8080808080808080808080808088228808080830832808080808080808080828
            50976B0D5C662D0ED3F6538849E93546739F42063F4FAAF77FD54FF6B39CF32B
            EAF0BA216D5CDFEEEF0723EE463D086907FD02F46A714873AF69A5E774101010
            10101010101010101010101010793EA3963D43AEA1B4B087D3FC4C6D9D9CF2CA
            721CF19CF192C7FE8BEBE946CD1CBCF7E6CF580BE43D10202020202020202020
            20AC6BDD54FB15B1B1D18EF6F15CEEE2DF00E5C5EEE376DF3C67F5217A3C7D2D
            D3CF50CDAD84449647D8747B2DBBFBDBBDDE568AC9C9C97CD2789FCF52D006D1
            FF0032BD14BEFD4CFAAB9CC70BCD34220A68A11C88DA180FD061786F399CBAD7
            A6D5951010101010101010101079FD35C3EDAD495D55110FA38AE14B434EF183
            BBE14199F8C796E738FE8BE852BB698F7870BF32F405F3DDC404040404040404
            04040404040404040441158443286594510610650101010101010101053F5DDE
            6A24EEB4CDAFC773B9F865C1FDD539F99C71D3233F92F678DA7F7CF50E779F4B
            058ACD4D67B553DBA9BF7708C171EAE71E49FD579F57537DB2DC461DEB9AA134
            CB43A4BAD40E5B2D6BF69F66B5A3FD72BD3E4FDB1FA73A271799D04040404040
            40404040404040404041C37AAFF80B5D4D501992361EE9BEAF3C307E6E216F4E
            B9B612D3C281D98DAC4F7FBA5DA505E69B14B04AEE72FF00ED8E7CCEE6FF0035
            F47CEBE2B1571D3E65E9ABE5BB88080808080808080839AE15F4B4147356553C
            474F034BDEE3C74F2E7CC9E02B5AE6704A93A36DD5D7DBF4FAC6ECDDB1F30D9E
            95D9FBA6349697E0F9E323EA5DECBDBAF68A57647F6E74E794C5562E7AC69E06
            F30DA59DECBC71DE3F186E7D7E477EAB15F934B3EEC93CD9675E475101010101
            0101010101056F5F6A07D974F4CFA6F15C6AFF0066A08C64B8CB2798039E073F
            5E177F1F4F75BF4CDA70E3D3BA785968F4FDA7199A10FA9AC9079CA58771F7F1
            3F1F45D6FA99DD3FD3185C178DD4404040404040404040404040404040404041
            84658541065451065158446514404040404113A9B50D2586D3257547888F0410
            8EB248EF95A175D1D29BCE12650FA1AC558C135FEEE3378B91DCE07FB38FF0B4
            0F2E07E438F55DFC9D58FA2BD439D6BED6E5E375735C6ADB47415154EE90C6E7
            F3EC16F4EBBAD84970692A5969B4FD23661899E0CD20F795C5FCFF00E25BF227
            E79669D261716C40404040404040404040404040404144ED4AEEEA6A386963FD
            E3B32B463397E7630607F889FC97D1F034FEE72D59587475A1F6AD3B494B28C5
            496779539EBDEBFC4ECFD3A2F2F91A9BAED69C62134B83620202020202020202
            0F3BBCD44DACB53C763A571FB0ADEEEF2E33B091DE39BC603BEBC37F33E417BF
            4E3E15374FD53D38DA73C2F6E3496EB7F00434949170D68C06C71B7A01EC02F1
            7369FDCBAF484D1704AFA7AABACDFBDB84A5DF46349007FE22E5E9F2E798AFE2
            1CF4FF002B22F23A8808080808080808080828548D1AAB5D3EB9CDDD68D3A4C5
            4AEFC32557E223C8ED233F9357B67FC7A78F76729E656A04C9A8B19F0C14BCB7
            CF323FFE4D5C7FFE7FDB5ED26B83620202020202020202020202020202020202
            0C2231844C0A8CA8A65032AA32A342020202020F97BD8C6B9EF21AC68CB9C780
            00F3283CF6D8C7EB4D56EBACCDFF0060DA1DB2858EE92CBD4B88F7E0FE402FA3
            7FF0E9E3EE9718F9A5E88BE73B082BFAC643351C1696732DCE56C3F48C106477
            9740BD1E3C73BBF0C5E53ED686B434741C05E796D94040404040404040404040
            404040418283CD2089BAA3B49A82F3BEDB672D78C7CAF919C3413ECEE7DD7D49
            9F87A3FB970EECF4C5F2DDC40404040404040404151D7FA966A1A58ED56D065B
            BDC4F75146CF99AC7705C3DCF41FAF92F5F8BA399DD3D439DEC94D27A7E3B1D9
            E2A4F09A977DE55C8DFC523BAE3A70DE83D972D7D5DF6FD3558C38B5CCF34B47
            059A94E2AEE52B6307F8581C3738FB0FF4CAEBE2C7336FC33A92B0D252C54B4B
            1534231142C11B07B34602F2DAD99CB710DCA28808080808080808082B3AF6FF
            003DB2D4CA6A1C9BADCDE29A89ADF98177CCF1F4CE07B90BD1E369EEB73D4336
            9C3BF4AD8A1B1D8A92DD1B407C6C0672DFC529F9DD9E3CFA7B2E7AD7DD62B0D9
            6CD92D7D7D5B79CB9B067CB10E7A7E6F2B5A91888866BDA4D717410101010101
            010101010101010101010106110CA20808A20C1449151951A6501010101052F5
            ADCEA6BEB21D2D6D3FB4D560D63FC99175E7DB0327D97B7C6A4563E25BD39DA7
            D2D169B6535B2DF0D0D30C470B719F327CDC7DC95E5D4D49B4E5AAC61D8B0D08
            2B5006DC7594D291BA3B4C7DD30FA4B28E7FF292BD73F2E97F2E5DD9655E4751
            01010101010101010101010101010436AFBFC561D3B5B737F2E859889BEB23BC
            2D1FA95D7469BAD849970F67B6036AD3F14938CDC2BFF6AAD79EBBE5F16D3FE1
            CE174F2B5375B1EA18A55675E674101010101010101047DF6F54966B6CB5F539
            2C8F86B1B8DCE71E035B9C72574D3D39BCE12655CD1564ABA9AB97555E066E15
            DCD2427A410746E3DDCDFE5F52BBF91A9111B2BD43158CF2B92F23A2A9606FDA
            DA92BAF849752D3FEC943D369C7CEF6F9FFEE57B35BE4A457DF6E51CCAD8BC6E
            A202020202020202020D73CF1410C93CCE0C8A2697C8F3D035A324AB11914BD2
            71BF515FAA3575437F656834B6789C0711B1C7749F5249FE6BD7AB3B2BB23BF6
            E71CCAE35B5029E8E79FFEE98E77E817969199C372E5B04061B5420FCCFCC873
            D7C64BBFE2BA6BFD4CE9A45716C4040404040404040404040404040404040418
            559610106545608559670A3420CA288080822F51DF29ECB6B96B65F139A310C5
            E6F79E8175D1D2DF6C336B6113A12C9534D4D35DAE23374B9BBBC909EAD8FF00
            0379FD4AEDE5EA6676C750CD216A5E47410735C6B62A1A29EAE5F9216171F538
            F21EE56A94DD3849947694A47C56A6D44A31515A4D4CBE44779C81F9370BAF91
            6CDB1F866909A5C1B101010101010101061CE6B5A5CE3868E493C001052AEDDA
            5D2B6B3ECEB0523EF35CEF0B0C44088BBCF0E3CBC37F111E11EABD9A7E2F19B7
            10E737FC3AEDF6CD77357D2D757DD63A68DAECD4DB218D9244598F9038B43C1C
            F9EE2B37BE96311045656B5E57410101079DEAC9BFAC1AFECFA5C78E8680FDA1
            726F912D6E58D77B72D1FE65EDD1F934E6DEDCADDBD0D789D594040404040404
            04041E7B2FFF001A6AD3003BF4F598E6473482C9A6E9B7CC1CF3FE5FF105EFFF
            00AB4FFDA5CBB97A08E1781D55ED6F749A92D429697C55B7070A781B9C72EE3F
            9E71F9AF578BA79B667A873D494AD9AD915B2D94F431F221600E7FF13FAB9C7D
            DCEE570D4BEEB65BAC61DAB0A202020202020202020A46B6AB9AF371A7D2140E
            F1CE5B2DCA66F3DD42DF160F973C1FD3D57B7C7AC56BBE7FA72BCFA5BE868A9A
            868E1A4A666C82068631A3D02F25AD99CBA4423F51C85D4F0D1B3E7AB95ACFF2
            8702EFE4BB78F1EFF0C5E52ED686B434741C2F3CCB70CA288080808080808080
            808080808080808308820202063840E880AA32A3420202020F97BDAC697BCED6
            B465CE3E402440A3D04736ACD42EB84C3FD836F3B696377F6B20E7383FABBF21
            EABE85BFC34C7DD2E3F54AF417CF76101056EFD236E776A4B0B3C51822AAE183
            FD9B3E461FF13B1FC97AB4636D66FF00D439DBF0B205E5741010101010101010
            577526B7B45909839ACB8F1B6860E5FE2E9BCF2183EBCFA02BBE978F6BFF0009
            3688418B1EA9D552365BE3FECFB4E4385B59D5D820F881C13D3ABFF26F9AF46F
            D3D2FA79B39736FE16FB4D8ED76983B9A081B0B4FCCEEAE763F89C792BC9A9AB
            6BF6E95AC43BD7368404041C975B8C16DB754D74FF00BAA68DD2387AED1D07B9
            E8B54AEE9C0A676576B9E4A7ADD515ECC5C6F52B9F93E51071C63D89FE402F5F
            976C6291E9CA9CF2BF2F13A880839EA6BE8E98B44F336373F88D84F89C7D1ADE
            A4FD16A2B323EA9E73302EEE9F1B41C34BF00B87A81D47E78526132DCA288080
            829BAFF50D44429F4F5ACE6EF752231B4E0B227753EC5C01E7C8027C97B3C6D2
            FBE7A862F29DD3561A6B15A21A0879737C53CBD3BC90FCCEFF0097A0E170D6D5
            DF6CAD2B8849BDED634B9C76B5A3249E985C9A53ECA25BFEA79AF6FE6D743F71
            6DCFE27F47483F53FAE3C97BB53FC7A7B7DCF6E3F54AE4BC2EC2020202020202
            0202085D59A8A2B15A1F558EF2A5FF00774900EAF95DD063DBA95DB434B7CFE9
            2670E3D13A6A5B5D2CB5B5E7BCBC5C0F7B5721E4B73CF760FB15BF275B7711D4
            39D23DACABCCEA85A626BEFB25463F66A21DDC47C9D21F98FBE3A2F4DBE5A63D
            CB9F764DAF33A080808080808080808080808080808080808308820202020C2A
            8CA8A20CA2880829DAC6BAA6E5571697B63C8A8A8C3EBA567F670F9E4FE7FF00
            59C2F6F8F58AC6FB7F4E569E70B45BE829A828E2A3A5608E085BB58D1FF5E6BC
            97B4DA732E911874ACA8834D65545494B3554A71140C748F3ECD192B55AE6709
            3287D254D2BA925BB5537159737999D9E76C47F74C1EC1985DBC89E76C750CD6
            3DA7979DB10101010101068ACAEA4A2A775455CCC82067CD23CED0AD6B33D24C
            A8F57AA6FF00A9A675069789F4F45CB65BB480B78FEE1C787FFBBD82F75742BA
            7CDFFF001CF74CA774C68AB5D8D824C7C4DC0FEF6B24E5D93D76E7A7FAFAAE1A
            DE4CDFF86A28B12F3B62020202020A076A5513DC5F6BD2546EFBFBACC1F57E7B
            69D9FC43AE0BB9FF00295ECF12319B4FA73BCFA5E6929A1A4A58A9616EC86063
            638DA3801AD18038F65E4B4E672DC439EE17BB55BC7ED9551C47C984F8BFF08E
            56E9A56B74937884647A9AAEB48FB2ED935444E196D4C9B628F1FE6209FA2EDF
            022BF54E18DF33D3A23B75EEAB9AFAEEE587FB0A3F071E8643977E98599BD23A
            86B6CBBA92D74148774108121F9A63E290FF0089EECB8FEAB95B526576BAD61A
            10101070DEAED4B69B6CD5F527EEE11C37CDCE3C35A3DC95BD3A4DA70969C2A9
            D9F5AAAAB249B565D46EAEB867E0F3D194E7A380F2DDE5FDD03D4AF5795788F9
            23A873A57DAF2BC4EAAAEB9B94C6182C3427FDA37521831CEC8B3E27BBFBBC1C
            FE6BD7E2D3EE9EA1CEF3E93F6BB6D3DB6DF4F434E3EEA06060CF53EAE3EE4F25
            79F52FBA72DC461D6B0A2020202020202020D7513C3042F9A670645182E7BCF4
            002B11926547B0D2BF556A17EA4AB04DAE8DE596A81DD0B99C779F91C9FF0017
            F857BB56DF0A9B23B9EDC63E65F1781D9197FB83E928710E7E2AA0F754E072ED
            C7CC0F65DB429BA79EA18BCB6596DA2DF6F8E0FED0F8A63FDF3D7F21D07B29AD
            A9BAD95AC61DEB9342020202020202020202020202020C2219418CAA8CA8A202
            01404045111945611194510456A4BED3D96D72564B8DDD2161F37797E5EABB68
            696FB619B5B0E0D19649E8E9A4B8D7E4DCEE38926DDD58DEAD67F3C9F75D3CAD
            5CCED8EA19A47B591795D0404158D4FBEEB72A3D3D19FB97FED372C7942C3E06
            FF0099E3F92F5687CB137FFC73BFE166680D01A0600E817972E90CA020202020
            20AAEA7D7505B2616EB6406E57A7F0DA48FA34FF007C8CFA7CA39FA2F56978D3
            6E678AB337C38283445CEED3B2E7ABAA4CF37CD1DB2338862F6FAFAEDFD4AE93
            E4C538D38FED8DB36ED74A7A6829E1641046D8A18C6D646D18007B00BC56B4CF
            6E910DAA28808080819411F72BFDA6DB1B9F5752D61602E2CCE5D81CF40BAD34
            6D6E99DD0F34D2371BDDFF0053DD353525B9EE74C7E1ADF3CFE1862819D7939C
            BCE0676F4395EFBD694A6D997299E5788EC5A8AAFC574BB9634FCD4F44DEE87D
            3BCF988FC82F27C5A4750D62D2EFA2D3566A47F791D387CDFF007B29323FF57E
            71F92C5FC8B4AFC3849E17174650101010101079F563A5D67A9FECE6F3A7AD8E
            DF56E1F2CAFF00267F9B9FF2E7D42FA11FE1A67EE97199DD2F406B5AD686B461
            AD18007A2F9F32ECD15F5B4F43472D5D43B6431377389FF4FCCAD52BBA702B5A
            36827AD9EA352DC583E2EB5C4520FF00BB81BE16E3EBFF005D57ABC8B6DF923A
            872AC6672B6AF1BA88080808080808080828DAA27AED457C8F4C5017328622D9
            2ED56CF2039EEF3D3D38EB93D300AF6E8C469D77CF7E9CAD39E173A3A4A7A3A5
            8A969D82382168646C1E402F1DAD33397488C363DED630BDC70D68C927D02910
            AADDB5AEBD5E1D74947EC944F73289A47570E0BBF2E7F5C792F66A7F8EBB7DCF
            6E5DCACCBC6EA202020C20CA0202020202020202020C22083088CA28830AA083
            2A2880808328319419456105298C76A7D56673CD9ED0435B9E924D9DDC7B640C
            FB0F75F433F0B4F1F759C63E695D97CF761010735C2BE9A828A5ACA976C8616E
            E71FF403DC9E02D529369C25A7087D21453F7335E2B370ACB99EF5CC773B23C9
            EED83D802BBF916FB63A86291ED615E674101010106AA8A8829A17CF51236182
            31BA495E435AD03CC93C056232932A1DCB56DE75254BAD5A4E37B60076D4DD1D
            963403E6D77568F7F98F905EFA68574E376A7FE396E9B74B1696D1D6DB041F74
            D12D6BC626AB70F11F61FC2179F5FC89BFF0E915C27D79DA1010697D652326EE
            1F331B396EF111700EDBFC58EB8562B2996D0E69E85457157DEED3419F8BAA8E
            2239DA4F8BFF0008E56EBA769E999BC42AEFED219592BA0B0504D7397E50F8C6
            E6077F7DC3C0DFF33C2F5478911F54E1CE6F33D3E1966ED02F277DCEBD967A7E
            BF0F07DE4A47A3B690C1FF0089EB5F174A9F4C64D93ED09ADF4E59EC96986828
            22756DFEF528A7A69EA5DDE3C7237C8D6FC8D3C8196B41195BD0D6B5ED99EA16
            D5887A358ED70DAAD1496E87E4A68DB1E471920789D8FEF1E578352FBAD97488
            772C2880808080808082A7AEF50BE929E3B4507DE5D6E44450C6D3CB5AF38DDF
            F0F6EABD7E2E973BA7A872BCFA4BE99B14364B3C3431F8A40375449FC729F9DD
            CFF2F65C75B577DB2E958C255725522F924BA9EFF1D8A94FFB2A81E24BACDE4F
            7B1DFB91F4C73FFA2F76947C3A6E9EE7A7299CCE175631AC6B58C186B461A3D8
            2F0CCE5D5F48080808080808080821B54DE8DAEDA5D0F8AB6A4F7346CEB991DD
            0E3D976F1F4F74FEA18BCB1A574FB6CB6EEEDEF3356543CCD573BBE673DDCF5F
            6FFD7CD35F577CFE96B184D2E2D2BBA96E2F9A68AC7458755551025775EED9F3
            3B23FC3C9F6FA85EAF1E98F9E7D395E7D27292962A5A68E9E21F7718C0CF27EA
            4F993E6BCF6B6672E91186E59510101010101010101010101010106110451011
            04041F27D02A8C8185010650115945101056F58DD678E18ED341CDC6E1E06007
            05AC3D5DEDF55EBF1B4FEE9EA1CEF6F494B1DA20B4DAE1A18B9EEC7DE3CF573C
            F2E71FA95C3575375B2D56B88482E6D08082A95CF76A1BF32DD1736AB6B8495A
            EFC324C3E58FDC0FF9FA05ECA7F8ABBBEE972B73C2D4D00000700740BC6EACA0
            202020AEEA1D696FB4BFE1618DF5F7377CB47072413D37B8676E7D3AFB2F4697
            8D36E7A8666C866E94D45A9666D4EA89FB8A10EDF05A61E0371D0B8827C5EE72
            7D30BBFC6A69FD1CCFE5CE626DFA85CE8A828E869DB4F490B6085BD18C180BC5
            7BCDA732E95AE1D0B2D08080821AEFA4AC376AA6D5D6D2B65AA8C35AC94F380C
            3B9BE1396F04F985DB4F5ED58C474C5A9946D7F67365AFAB6D4D64F552E3E787
            BC0C6387A1D8D691FE521748F2ED10CFC36DA5ECDF44D33F7B6D51CAECE47C41
            7CE013E8252F0B13E55E7DB5B21628608618DB142C6C713061AC600001EC02E3
            3396E21F6E21A093C01D4A83CF74A9FEB5EB1ABD51282EB75B33476707A67ABE
            4C7A90ECFE63D17BB57FC74DBEE5CBBB3D0D785D440404040404041C379BA416
            BB74D5B31C3631C0F571E00FD574D2D3DF6C24CE158D1369A8AEAA9755DD0135
            559FEE0C3D1901180F03C8B874FEEFD4AF4793A9111B2BD39D633CAEABC6EAAE
            6ACBCD64623B45A3C578ADE1A47F63167C72BBD38E8BD3A1A51F55BE9862F6C3
            BF4ED8696CB6E65241CBCF8E798FCD2487AB895CF5B566F252B84A2E4D880808
            080808080835D454434F0493CCE0C8A2697BDE7A003AAB15CCE055EC14D3DEEE
            6ED475ADC53309659E03E518C8EF8FBBBCBFF65EBD5B6CAEC8FEDCB1BA72B62F
            1BAA2B50DEE3B5D265BE3AA97C14F16324B8F0381C9E48E3CCF0BB68E96E9FD3
            36B61A74DD8DD451C95957E2B9D6132543C9CEDDDCEC69FF005F53ED8C6B5F5B
            7711F4C334AA6D79DD0404040404040404040404040404040418441010101060
            A208328A20202020D15F5D050D1CB573BB6C50B4BDC7E8B54AEE9C25A710AEE9
            0A69EB6A2A750D6732D512CA567F044D38E17ABC9B6D8D91E98A47B5A978DD44
            04103A92EF3C724368B7F8AE55BD3071DD45F8A4279C7B7FE8BD3A1A71F54F50
            E77B7A48DA2D54B6BA18E929DA0068F1BB182E779B8AE3A9A9369CB758C3B561
            44041C972BA505B698D4D6CCD8621C027A93E8D1D49F60B74A4DA710936C2A46
            E9AA3544BDDDADAFB45A3243AB5D8EFA41D3C3D437CF86F3EE3A2F67C3A697D5
            CDBF0E5CDBF8586C3A62D966843606F7937E2A893979CF279F2C95E6D5D79BFF
            000E914884BAE2D0808080808080808082A3DA3DE26A6B4C368A23FED3BE4A28
            A980EA1AF2048FE3C8038CF9672BD3E353339F50C5E53D61B3D3D9ED14D6E80E
            5B4EC0D73CF57BBF138F5EA795C7535374E5A88482C288080808080830784145
            AA7B7586A41421A5D65B53C495320386C8FF00C31FBE4F51FC3E990BDFFF0055
            3FDA5C7EA95E8600C2F03B22EFF7E8AD74E3633BFAE978A6A56F571E993E61B9
            3D7F21CAEDA3A5BE7F4C5AD87369AB03E88CD71AE799AED5BE3A990F46FA35BE
            800C0C67CBF5D6B6AE7E58FA608AA7979DB101010101010101010553504D25EA
            EB169EA577ECEC225BAC83C980E447F572F668C6CAEF9EFD394CE670B4451B22
            8DB146DDAC600D6347400745E499CBAB45CAE34B6FA392AEA1E1B1B079F193E8
            32B5A749B4E12D384458E8AA6B6A4DEAE00EE7F34503C731B48C6EC1E848E00F
            21EE4AEFAD68AFC9573A4679585795D440404040404040404040404040404040
            418440A0C2A8CE5451118540206E086425032832A2B195453AEAE9B52DF7EC78
            1DB6D943B64B8483CC93E160F738E17BA98D2AEEFBA5CADF32E10C31C3132289
            A191C60358C1C0007401786672EB10FB514410F7EBF7D9FDDD2D2446AAEB5591
            4B4C3A71D5F21FC2C6E576D2D2DDCCF10CCDB0586C5F01DE55D5BFE26ED57CD5
            D57FF833D183FEBCB0D5D4CF11F4C2563DA61716C404101A9F5651D9A3EE598A
            8B9C9FB8A469E79E85F8C903D3CCF92F46878F37FE19B5B08FB4E97ADB84ADBA
            EA590CF52EC3A2A4F9638C7F0EDE9F97EA4AEB7D78A7CB4FFD73DB36ED6D8E36
            46C6C71B432360C35AD18000E8005E2997687D20202020202020202020F99246
            46C749238358C05CE71E0003A9291028DA4D8ED4BA9AAF574E0FC0D3E68AC4C3
            C78067BD9B1EAE2EC0FCC1E8BD7ABF25767BF6E5DCFE97B5E47510106B9E68A0
            85F34AE0C8A2697C8F3D035A3249488C8A1457CD7F7B86A6F3A7840DB7F7823B
            7515406FDEC6D387CAF770EDD9F2DC001EA57BBE1E9D78B76E7BE73C745AFB5C
            B7B2A9B6DD4B472D96E40ED94C8334F9C641DFC3803D791C7AF9AC5BC49EEBCB
            5B979A2B850D743DF5154475309E9242F6BDBFAB72179AD598EDACBA16453B5B
            DEEA1F243A7AD6775CEB9C18E03F0B4F24B8F900DF11F65EDF1B4E23E7B750E7
            7B7A4FD82CB4B65B54341072D8F26490F57BDC72F79EBD49FCBA2F36AEA4DE72
            B48C23EE5AB18643436488DCAE278FBAF1431FBC927CA3F55D29A1EEDC41376D
            B2E9D34F3BAE37193E2AEB2FCD29F959ECCE9EBD7F4C26A6B678AF1566B4F729
            D5E77510101010101010101043EA6BD9B5D00EE07795F52E10D1C3D73238E338
            F419CAEFA1A5BA79EA19B5B0FAD3965FB328C994F795D527BDAD9BF8A43FF009
            AFABBA7F50CD2AEEAEAEA6A2A67D4D43B64518C93FFBAE54A4DA710DCCE10541
            4B577DA965CAE51F776F8CEEA0A377E2F312C83F9B47E657A6F68D38DB5EFDB9
            E372CABC8EA20202020202020202020202020202020202020C221E6830AA3E27
            9A28217CB2B83228DA5EF71E81AD1927F4488C8A59D61AA6F2C2ED2B676BE9DB
            2BE335D5EFEEA3219C785ADE4E5DE633D39E7A7ABE0D6BF54B9F32F82EED7699
            D0C845B2B63C1F88A76EF63BE8D90EDF2F3DAB5FE19FD2ED9FCBA28BB49B57C4
            3A92ED4F3DAEAE338787B5D247F5DCD1B80CF9B9A166DE34FAE61372D5475D47
            594ECA9A49D95104832C963707B4FE6385E798C36DF9590CA2ABBAAEF3353C02
            8287C773AC222A78FDDDE64FD393ECBD3A14F73D439DA523A76C70D9AD8CA561
            DF2B8992A663D6495FCB9DFF0001E8172D5D4DD3975AC6128B92BE649191B1CF
            91C18C68CB9CEE0003CC94157AFD57555B3FD9FA6E2F8A9CBB6CB5A47DCC43CC
            F90247BFE5BBA2F5D3C788E6FC439CDF3D246C3A7A2B7092A2777C4DD2A4EFAB
            AC77571F41E800E3FE4381CB575B7711C435154CAE2D080820B56EA0FB1ADE0C
            2DEF2BAA0F77491E33E2FE223CF6E7A79AF478FA3BEDFA62F6C38B4B6967C0F1
            75BAE66BB4DE225E73B73E67CB771E5D3A05D7C8F23EDAFD294AAD4BC4E82020
            202020202020202020A77685719A6869B4BD03BFDA57B708DC47F674D9FBE7B8
            641C6DC8FA657A7C7AFDD3D43165A2DD414D6FA2868A959B20818191B7D87AFA
            93D495C2D6DD396A21D2B2A2020A5F6A9553B6C34F6F83992E7551D2E092010E
            04F25B938DC1B9F65ECF0A3E6CFE218D49E16AB5DBE1B75B69A861FDD5344D89
            BE5F28C67F35E5BDB74E5A887CDCAD36CB9D3BA9EE14B1D542EE0B646877FEC9
            5BCC74AA7CDD95D351D43AAF4D5C6A2CF39EAC6B8C911F4E09DDC67D57AEBE5F
            AB46589A44B4DE2BB5ED8293BDA9B9525402EDB082CE718EA461BD3FC4575D2A
            E96A4F5873B663DB9F4F697D7A279AEF2CF4D4B595E3C523C174F1B0F3B76398
            E6373C123E99E8AEAEBE97D38CC415D39585BA42E35648BDDDA4ADA73D69A36F
            72C3FE2C3B047B6179E7C8AC7D35C3A6C5828ADF454308828E064110FC2C185E
            6B5E6DDB5874ACA8808080808080808083E649191B1CF79DAD68CB89F2012205
            62C94E2F5787EA19C7ECF1662B5B0FF0F3BA4FF3792F66ADB657647F6E55E672
            B156D6D2D1533EA6AA4114118DCF7BBA602F256B333887499C20E9696AAFB3B6
            BAE31F776C661D4546EEB27A4928F4FEE1FCD7A6D68D38DB5EFDB9C44CF32B12
            F2BAB2808080808080808080808080808080808080882288308820E1BCD38A9B
            55653F9CB0C8D1F9B4AE9A53F34332E4D252C32E99B6BA2E00A763481FC4C1B5
            DFF9815AD6FAA52A961EFE4B92B44F4F4D56DDB3C2C9221E52373FA656A2660E
            D59A9ECDAD3F172D55BAAAA6DB2CD8C8A67ED00839DC08C3FF002DD8F65DE3CA
            9F7CB1347D9B3EBDA37B1D457A8ABA204660AE840C8CF3F79161D9C7D526FA73
            EB0BCB8EE5AB75759E99CFBA5AE95DE17384B0CEE6B7C3D7C25AF3C71E6B7A7A
            15B7526EFD3874F57DFE96B1F72BAE9EAE9EAE701B0491F74FEEA23CF3B9D19D
            CF3CBFD16F5B6CC6225985886ADBA3F88B4D5C8F965FF0EC1FCE55E78D18FF00
            EA1D373E1D76D7B5400A4B24145BBA4959521D81E596C21C73ECAECD38F79374
            FE1F4349DCAB8E6FD7696B22DC1FF0700F87878FC2EDBE278CFAA7C788FA6309
            B667B58A9A969E9A16C14F1B61859C36360000FC82F3CDA67B6E21B545101010
            55B5DDAEBA68292EB4203EA6D0F351DCBBF1B5B8791FAC633ED9F35EAF16F119
            ACFDCC5E127A575152EA1B152DD69DBDD89DBF79093931C8D3B5ECCE0670E1C1
            C72395C7574E69386A272965CD440404040404040404041A6B2B29E8E965AAA9
            788E085A5F23CF900AD6B99C0AB68DA1A8B85755EABB8B7F6AADFB9A18B3BBB8
            A561F9074E4BB3BBFF0055EAD79DB1B23FB73AF3395BD791D040404150ED229E
            B7E02DF71A3A5755C96EAD8A69238C6E708FF880EA407ED271E5CF92F578B788
            9989F70C5E13563D496DBC479A52F12346648A46398E6FB72307F22B9EAE8DA9
            DAD6D0955C5A735C2BE9A82924AAA876D8A31F99F403EAB54A4DA710932A958E
            92A7525CBEDBB8B47C0D3BFF006283A873DA719FA30FEA7E8BDDAD78D2AECAF7
            EDC6B1BA5755F3DDD940411B7BBF50DA2063EA0974B29DB4F4ECC77923BD1A0E
            3A79AE9A7A5379E126708CA4BC6B09A612C966861A0E73BAA1DDFF00D767743F
            4EABACE969FF00F5CB3BE7F094B2DF68AEF14EFA6DCD7D2CF25354C520C39924
            670411EFD42E3A9A7356A2522B0A202020202020ACEA196A2EB718F4FD1BF647
            812DCE61F862F28FEAF5EBD18D91BE7FA72BCE7877D75DED765A6653307792C6
            D0D868A1F1498E838F21EE573AE9DB5272D6621CF476DADB94CCAEBD3406370E
            A5B68E59191C87BC9C6E7FD7A7A2D5AF158C57FF00598899ED3EBCCEA2020202
            02020202020202020202020202020202022194182830882A2A14D3374CEA1A8A
            399C5B68B966A289E7E58E7E03E1FF003E72D5EB98F895CFB8739E256289B256
            06CB50C31C792594E7CC79178F5F65E79E1A76AC3420D73CF1C113A590ED6346
            4956B19666551B453CDA8EEEFB955B7FD9948FC5337CA595878FAB223FABBE8B
            D9AB6F875DB1DB358CF2B9AF0BA88ACA02020202064202020F327E3B3DD5B254
            3B234B5F9E37860F0D2D4F938F906919CFB63D17BBFEDA7FB4394F12F4B6B9AE
            68734E5AE190474C2F0BABE90101010101010101010543514F25E2E105A61C9A
            1EF1BDF48D3F3BDA738F76B00C9F5E8BDFA15D95DD3DB8DA733858DB536BA392
            9ADBDFC50CF234FC2D29780F7B59D76B4F2EC79AF14E6DCBAF4EC59510101010
            610090064F00752828D707CBAB6F2DA0A6739B68A421D5338CB73ECDFEF3B181
            E8327D8FD1A7F8699FBA5C3EA94FDC6F14D6A8E2B65BA015370D8D6D25B633B7
            0C1C02E700E11B001D4AF2574E6DCCF4E93386BA486FDF65CB517CAE65354161
            91ECA5C08A0DA3F8DE32EF539FF45ACD738AC261B3475DEAEEDA7E9EB6A9B895
            E5E3238DC18F2D071F973EEB1AF48ADB10B494DAE4DBCC34EDD682F7DA85D2A6
            B2469F811F0B6A638F81CE6B9C1C59E45DE12EC7BE57D1BD66BA3C7BEDCBDAFD
            7CBB0B5DBE4A910BEA66F969E9A3F9A491DC35B93C0C9F33D178B4F4F74B769C
            23744596BAD367964BA48D75C6E13C95D5DB7E46492F2583FC2073FF0025BD7B
            EE9E3A8E12B187DDAF5851DC6F12D045196C183F09584F867733F7818DE0E1BE
            47A1FC95BF8D35AEE48BF2B02F3BA0829B7DADBD5D350476ED3F52F81F6E6B9F
            5D3F1DC6E7636B1DD773B19C37F33D39F66956B5AE6FEDCA6733C3EA6D4FAC2D
            D206DC2C2EA98738EFE89DBF81F8B67888FCD5F83A56EAC66D0D91F695A74BFB
            B9854D3498CEC9E1730ACFFC2BFE8F88C5DBB42B653D238D23259EA240053B43
            382E774FD16A9E15B3CF493A8D562B1DF0D33FBCDF40FAB777B5B3EE0E9A4247
            40472D03F23D56F5B574FF009C256B2B15BAC76EA0739F047995E72E95E773CF
            E65792FAD6B3AC5120B934202020202020202020202020202020202020202020
            2022308307AAA8D15559052C5DE4A71D0340E4B89E0068F32558AE443D5D8A6B
            C5397DC5C619810FA26C67FDDDC396BB3F89F9FC976AEA6DE98C65D76CBA3DCF
            F80AFF00BBB8C639E30D947F1B0F43D391E4B37A7B8E9625267DD72532004149
            D5175A7B8541A2F8A1496DA7C1AFAC77E10FE0323F595E3868EBE7F5F7E95364
            67EE62D394EDB2FB6610C1053B1F4D4DFBAA63244E8E3E380D04F1F4CAF3DF4A
            D9E7B6A26136BCEE8CA020E3BADD292DB48EA9A97ED1F2C6CFC4F90FCAC68192
            5CEF2016E949B4E1267088B70D635DB2A6AE7A7B74679F83899DF3C0FE17BC90
            370E7380BBDBE1D78C658CCCA16A752EA59F5A7F56ADB3C3DCED2FA9AE30EF7C
            018DC90D6EE0D249C0C9E8574F8358A6F98377A588696A69296A21AFABAAAE75
            535CC9649652387750C647B2367E4D5E7F8D8EB85DBF9727FD9F69F652F734AD
            9696403EEEA2295E24691F290ECE785D3FE5DBDF309B18D1774B954BAE74356F
            3531DAEA3E160AE7001F36CF0BF7E38DCD734A9E45223131C65692B3AF336E0B
            DD96DF7AB64D6EAF8FBCA79DB83EA0F939A7C885BD3BCD6730CDA32A7E8FBF1B
            07C6697BECE7BFB678ADF31E4CF4A786B583A9733D3D0F1C74F56B696FF9ABED
            9ADBF2B3C970BECF097D05BDADC8FBBF8C97BBC9F2C88C4A40FE7ECB86CAC772
            D6E4655CDDA0D3C6F9DF3D9E389AD040904ED1BBF84BCBC01F5FE4B51149FC9B
            A52F63BC3EE1016D443F0D5D106FC441B83DA370C82D7B78702163574F6FF045
            928B934D3515B494DB0544CC87BC3B63EF1C1BB8FA0CF5562B33D0DAD735C373
            4E41E8428216F7A82AA86E149434542EAE9EA3324A03B60644DFC5D1D9395DF4
            B4774666710CDAD87C45ACECADA93477093ECCAE003BE1EAF11E5A7A39AFCEC2
            0FD527C7B771CC1B9DD2DFEC91B72EAE83CF8123493B7AE00249C7B2C4695BF0
            6E8724D3DC6EACD94ED7D0D09FDED4CBE195ECF3EEDBD5B9FE2773ECB71114FD
            CB3339470AE86DB4B3DD22A7EF7E6A6B4D1330CDDB72E765EEE1809692F71E00
            195D6F99F97FF52BF95536565AF59D9EF5AB276B6AEE124AD0464C30820C74F0
            B1DE4D6EFCB89F323DC9EDC4E9CC513DF2F4DB85CEDD6DA635570A98E969DBD6
            599C18DFA64F9AF9D5A4CF4ECAACDDA2CD38F89B259AA2E76B89D8A9AF2E1030
            37F11635E32EC0E79C2F5478DF99C4B1BD6DA1ACA7ADA38AAE9DDBE199A1EC77
            B15E6B571386A25BD654404152D5372AAACAD86C56E399A620CCE1CE00E7C58E
            8D6F9FBF1D783EEF1E9158DF671BCE786695B1D14F1E96B44E1B54C8FE26E355
            C3A46879E4E0E4073CF4CF41D0798C5A777CF658E38582DF6BA1A0611037C6EE
            6599E7748F3EAF79E495E7B5E6CDC461E61DA64D5775A9AB9AC5DF3A1B5D3BBE
            D9AB63FEEB63417776C1D4B864EEC718CFD47D0F1A36C7CDEFA73B73D3D1B4B5
            55AEAB4EDBA7B5B04740F819F0F10FC0D031B3EAD3C15E0D6898B4E7B74AB875
            85DA48E286CB43262ED753DCC38CE6388E7BC978E98683B7DFE8574D0A7DD3D4
            16955354686B25AC47572511A8B2318C6D63232E12C4FDF97548DBD4F438F623
            CC2F5E9793368C7B729A2D762D3FA6A91BF6AD24A6A5AF0656D5CB3195A1A79D
            C093B471E6BCBABAD79E25BAD5A25AAA9D4B5A29E81C3EC0A77FED7560E7E25E
            DFECA3C75603F31E87E9906C4469C667EA2673D1ADF4C56DC682967B2BC53DD2
            D7209E9000DC3C379EEF9F08E40233C791E0959D1D6C7D5D4935FC38E97B4734
            ED653DF2D557495C3897BB8F7C648FC4C19DF83E98385D27C4CFD33985F89F97
            74D35F750C462A312D9EDEEE1F54E05952F6FA31A7063CFF0010FC8ACEDA53BE
            6526667A4D59ECD4168A26D1D146238DBCB8FE27BBCDCE3E6E3E6570BEA4DA79
            6AB5C3B561A61EE631A5CEC06B46493E4120566DCC37EBBFDAB2B314144EDB6F
            69FC4E1F34841FE4BDB79F875DBEE7B71EE5685E276101010101010101010101
            01010101010101010101010106328879A020E4B95C29E8294CF39E070C60F99E
            E3D18C1E6E3E416E95CB32E3B5D2564EFF00B46E6DDB5249F87A5072D819FE85
            EE1F33BF20B57988E20884B2E6AE6AEA086B230D9078DA731C83AB4FA85BA5F0
            9308F35D71B7F15B19A8A5CF15318E5ADFEF8FF8AEBB6B6EBB63A426A5D7340C
            A5EEEDF33669652191F77C92E77A0E3A79FE8BBE878DCE659B5D8B5D9EC96AA7
            65CB5054C02687EFA3F88919B623F89FCF06471EA7CB000E8B3ADAB369C43558
            406B0ED085EE92AED9A6DBBE8DAC22BEF32C4EEE581DE0688B3B7C5B9DF31E98
            E015D343C7C7364995BBB39BD555D34BD39AD91B25C2909A5AB7B3A1747F2BBE
            AE6609F75E6F2B4F6DFF0096E966DD65AC23D33150D44D077D4D513F7550F0EC
            3A366D24B9ADC1DC463A2CE8686FCADAD858229639626CB19DCC78DCD3EA0AE1
            31896B2F3ED5D7886975CB25AA717476AB5BAA6829B93DED6D44BDC46C00024B
            8F181F9F92F768D7FC7FCCFF00F8C5BB4AC741AAEC94507D914F0D799B0EADA7
            9E4EEDE2570CBE4EF396B89775FE4B36BE9DE79E30625ACCB169C9A1ACAAA56C
            D78BB4B23A764723B10C0332CCE69933E16606E0D03270AFFD9F2C7D309F4ADF
            04F14F0B2685C1F148D0E63DBC82D3C82178E630E912AEEAAD415D19FB16C519
            9AF754368971F754AD77F6B23BD40E5ADE4F99E17A3474BEEB7D30CCD927A72C
            70592D30DBE1717ECE6491DD5EF772E71FCD73D5D4DF395AC6126B93420F2BD7
            B4F590768B67AC642C93BC8F142F99B987BF27BA2D7E78CE5EC2DE7E9D17D4F1
            66274E625C6FDAF763D4F6EBA4D5144D7B5973A23B2B297CDA4705CDCE37333E
            7FAE1783574A6BFC3A565A3594DA74DB0D25E24189C8F8785BE299D203E13130
            788907D16FC78B6ECC16522D16ED6D66A775D62A493E2E33DECB403F77352606
            18D68DDB5ECF269F17FA2F7EAEAE9EA70E3B661E8B63BFDBAF36E8EBA91FF76F
            6EE731FC39BEA1C3DBF45F33534A6B2ED5B6558ABB2D26A1D7923EAF6555BADD
            4ED0D8B2E3899D9C631868E1E7CF9E3D17AA2F3A7A5C7732C63366F869EE7A56
            E2F2C13DC34FD5BB3DD80E965A67F41B00CE59E5803CBF8B874B5A3563F165C6
            D4ADA6AE92E57BAAAFA5FBC823823A664FB48CBB739EF0D24723C4DCE172D4AC
            D6BB648E652D55434556CD9550473B0746C8D0F1FCF2B845A61D1AA96D16AA43
            BA9A8E185DD4BA38DAD3FA80ACEA4CA61CBA8EB1B050F73DE772EA9CC6253801
            A3192E39F40175F1EB99CFE19BCB8F4A3EB6AC54D554D27C3D1B5FDD5A03DD97
            1A568187ECC0DBBC8DDC9C9FA00AEBF13FBF694849DEAC76BBDD03E82E7009E9
            9E43B6E4B4870E8E6B9A439A7E8571A5E6B3987443C3D9BE8F64A259A81B58F0
            723E28F7AD07183E077879EA78EABB5BCABCB31584FBE3A4A7A37B5CD6C74B1C
            67737A31B1B5B8C63C800171899CB58547B22ABADA9D221F54E73DA2A2514CF7
            F9C3C16F3CE7927FD17A3CCFABFA73D35D9795D04107A9AFBF011329A9C192BE
            A8EC8236F5E78CFF0035E9F1F477733D439DECDF61B28B740E7CA7BCAD9FC53C
            9D71E8C69EBB5BFF0058E8B1ADADBE7F4D56B87C4DA62824B9D4DC98E7C15757
            13619A48CE0F832039A704B5DB5C5B91E4A57566231E89AA1AABB34A0AE734DC
            6EB72AB8DBFD83A70D8CF05BF85A1DD0E3872EB1E5CC751109F0E165A7B3DB69
            EDC6DD0D3B1944E618DD063C25AE1870767AE475CAE13A93339F6DE14EB668ED
            5DA6CD45269BAEA675AA6797C10D707BFB827C9A198CFD777E59C93E9B6B52FF
            005472C6DFC26349E9175A8C971BA547DA3A82ABFDEEE0ECF00F3DDC40F0C60F
            EE81F41D172D5D6CF11C5562AB1B98D7B4B5E3735C3041E842E0D21468AD34D9
            0BE3A4EE43BE68E27C91C67FC8C706E38E985DFF00E45FF2CED84CC30C50C6D8
            A260646C186B1A3000F60B8CCE5A7DA831841940404159D4B515571AD8F4FD0B
            B63A4025AE9BF822F4FCD7B34222B1BE7FA72BF338586969A2A6A78E0846D8E3
            1B5A3E8BC96B6672E91186D51440404040404040404040404040404040404040
            4041844110456154725D2E9476CA292B2B1FDDC318E4F993E4D68F324F002D52
            93329328DB4D156574EDBC5D99DDCFFF00ECA849C8A78CF42E1D0CAE1D4F9745
            D2D6C7109DA7571563CD00A086BFDD5F033E169B3255CBE16B1BF364F468F427
            D7C872BD1A3A79E67A66D2A6CB6CA0B6EA6EF6ED4BF12282DCDAC6C74EDC9925
            926EE9E6367872D85B81F9E57A7E34DABF2FE59D8B4D1583454D4CCAE8E82964
            63D9BBBF9D8247ED1C1DCE9773863183CAF2DED7CE1AC428F574947AA755CD6B
            D3550E7D90CF1D4EA1963E29FBC8B21AD8646F39775E0E323737A657A62FB6B9
            B77E930B14F756691D5754EB8E61D39766C6FA7AA0DCC70D4B3C2F8DD8E4070C
            1E9FF15CBFEDAFFB4351C3E2D94DFD72D5075054C0EFEAEDBE17D2D9E3946055
            3A703BDA9DA7186EDF08047BF0410B336F875C47D4B3197CDBEBAEDA2A7A9B65
            6D1565CAC8F91F35AEB2959DFBA36BC9718A519047278F7FC80B688D4E7D91C3
            E2ED415B35F6835D494128A5A18CB25B6B87ED1DD0DFB672CFE26F784EC3C85B
            ADA22BB33DB32BE51D751D653B2A296664D0480399230E410790BC56ACC76E99
            56A82092F7AA6A6E93C39B65045250D0F78DE24748EC4EE6E7AB7C1B738C1F2E
            857A6D314A623EA67B6BFEA157426686DFA82B28ADD349DF7C2C7B72C24E488E
            4EAD19F2FD72AFFC989EEB994DB3F9582D366A6B6C6E0C7C93CD21DD354CEEDF
            23CFB9E3F4030B85F566CD56B8482E6D08082A9AEA9E390DB1CE19789F6C7C79
            F120FE712F6F87EFF872D475DEF4369CBD548ACABA7736B4000554123E193C3D
            0E584723D570A6BDAB18F4D4D58B0E84D33639FE268A97358739AA99EE964E7A
            F2F271F925F5ED6E3D114585716D1B269CB1BDD31751C7FB4B8BEA00186BDCE1
            8739CD1C12ECF3EABAC6B5A18D90E8B75AEDF6DA614D414ECA6A7049EEE36868
            C9EA7858B5E6DDB511874ACA9841940410D73B09B8DDE96A2A5E1D414AC25B4D
            CF8A571EAEF2C0006177D3D6DB5E3B962D5CA6381C2E0DB28308287A82ED75D4
            F572E9DD3C4328865973BA3865807CA58C1C67EBF8BA0E84AF669E9C69C6EB7F
            50E76B7A85CAD36BA3B55B69EDF46CEEE9A998191B7E9E67DC9E4AF2DEDBA72D
            D630EB59546DEEF505B20DCEF14EFE228BD7DCFB05DB47466F3FA66D6C396C56
            791AF374AFCBEE1380435DFD9348F940F23CF3FA7B9DEB6AFDB1D4335AFB94E2
            F33A08080808080808080808080823AF97616EA5DCD6992A653DDD342DE4B9E7
            80BAE8E9EE9FD3369C3E2C5697D144F9EA4892E3547BCAB97DFF0085BFDD6F92
            BADA99E23A84AD528B8B62020202020202020202020202020202020202020202
            0C22081941AE79A286274B2B8471306E7BDDC00075256A23292AE5BE0FEB05C2
            1BDD46EFB369F9B4D3BBE57BBFFE53879E470CCF4EABBDA7646D8EFDB10B2FE6
            BCED328A208FBBDD22A0A7DCE23BD770C6FD7D976D1D3DD3FA6665CD61B6D434
            BAE15E3F6C9FE58CF3DD30FE1CFF0011FC5FA792D6B6A7A8E8AC3AAED66A6B8F
            72F7B9F154D312EA6A988E1EC2E1870E72D735C382D7020AE34BE1A705CF4558
            AED13197488CE46376D9258DA71ECD7700FA2EB1E45A3A4DB093B5DA6D969A46
            D1DB69994B4CDE44518C0CFA9F53EE570B5A67B69D8E6B5C30E008F42A2B2808
            082166D1DA6A6326EA16012925E185CC04BBE63861039CF2BB479178F6CED84B
            C10C5042C861606451B4323637801A38002E333969F68080808082B3A89CD9F5
            258A8FAB992BAA08C71E169C1CFF0094AF5E8714B4FF004E57ED665E47510101
            01010101010101061CE6B5A5CE38681924FA20A6DC6E35FAA2A65B4D9DC61B63
            32DAFB8793FCBBB67A83E7EBF4EBEDA69C6946EB77EA1CB395A2D96BA2B651B2
            928A2114118C003FD4AF2EA6A4DA732E910EB5857357DC296869CCD52F0C6F46
            8F371F468F32B7A7A7369C425A7082B15BEA6BABDD7DB80E5E36D2438E037C9D
            FF002FD7D17A75B522B1B2BFDB9D63DACABC6EACA02020202020202020202020
            D73CF14113E695DB6360CB9DEC15AC667093281B0472DD6A7EDEAC6160236DBE
            077E0611E277D5DEABD3AD3B23647F6E758CF2B12F2BA8808080808080808080
            8080808080808080808080808088C221E48AC222A93EED575AFA3C1FEAE52B80
            A9783FEF7334E7BB1FFCB6E3C5EABD58F871FECC76B535AD6B435A3007002F34
            CB6CA0F9E072511C974BAD350533A695C071C64E38F53EC175D2D29B4A4CA3AD
            76D96B2A1976B80391E2A381DC6D07F1B87F11F207E5FAF4E9A9A98F96122329
            E5E66CCA0CA8ACA022880808080808080808082AD676BAE3AA2B6E67F714C3B8
            A73EBE5FF0CFE6BDBABF269C57F2E51CD9695E27510101010101010101071DCE
            EB456DA7EFEAE4DADFC2D1CB9C7D1A0724ADD34E6D3C24CC4209D4779D46E1F1
            85F6EB3F514EC389A61FDF3F847FD71D57A77574BAE6CE7CDBF858A8E8E9A8E9
            994D4B188A0886191B7A00BC96B4CF32E91186F515AAA6A21A681F3CCE0C8A31
            B9CE3E8AD6B99C0AE51D34FA86B1B71AC698ED909FD8A9DDC779E5BDDEC7D3CF
            E8BD76B46946D8FABDB8E374ACE178DD99404040404040404040404041F3DE33
            7966E1BC0C96F9E10572B647DFAE7F67D3BC8B65210EAE91BF8DFE5103F972BD
            958F875CCFD53D395A73C3B6B355695B5D43682B2E74B49380036092563081E5
            904F1F9AF2E265D62AEE7DD2DCCA075C5D5310A0630CAEAADE0C6183ABB774C2
            CE0C382A358E98A7B3C77992E30FD972BFBB8EADA77B1CFC96ED1B73CE5A72AE
            176CA28F6B3D9E6D691798DDBD86401AC949C0F5019C1F63CA61764BB6BFB40D
            21414B415755716C74D72697D14FB64731ED6E371DCD690DDBB8677630984DAB
            0348700E0720F208511940404040404040404040404040404040404184465158
            384456AF571A9B95C1DA7AD85CD700D373AC6F02089DF841FE3700BD3A75DB1B
            A7FA6253B41434B41470D1D2B3BBA781A191B3D87B9EA7D4AE16B6672D437A83
            1C2239AE35D4F414AEA89BA0E1AC1D5CE3D1A3DCADD29BA709283B5D14D78A91
            72AE1FB230E69603D1E4721FEED6FE1F53CFA2F4EADF646D866B1F959B0BC6E8
            202022BE9451010101010101010101043EA9B99A0B4C863FF79A8FB9A7FF0013
            BF17F9464AEFE3E9EEB7EA18BDB10D9A72DA6DF698A17FEF5DE397EAEF2FC860
            29E46A6EB2D2128B8B420202020202020F97BD8C6973C86B47249E00432839F5
            0CD572494D618BE2E661DB254BBC34EC3EEFF323D02F4C68C579BF0E736CF450
            586962AFF8BB9548ADBA4BD379C31B81D228FC80C67F9ACDFC9FB6BC435144F2
            E0D3E5F2471B1D248E0C63065CF770001D49282BF07689A227AFF808AF54AEAA
            3D1BBFC271E8FF0090FEAA44E570D0E326A5AFF0498B2D2BBC58CFDF3FEBE5FF
            0025ED8C6957FDA5C7EA974E9ED6BA6AF75F596CB5CE5F516EF0CB198DD18C35
            C63259B800407371C7FC578DD7187DEB0D5F6ED2B6C8EE35F1CB2C324ECA70D8
            434B817E4EE3B8B460069504B5156D35751C3594CFEF29EA18D9227FAB5C3215
            145A2ED46B6ED49A81F62B14B5D57649990C74BDEB58F99AF739A5F8C65B80CC
            EDEA7A2418405676B5DA04378A6B3FF5663A7B956B7F65A6A879DCF760F3C383
            7692D3D4AD6176A6A5D75AC6C1A6EE378D63454545292D659A8629097BDF8717
            0988323780DDDC1E9952530AE4776FE905534C2F8CA68E3A323BD6DB3643DE98
            C8273DD91DE74FC25FBBD96B10442E9A13B4BB76A5D3953719C369EB6DAD7BAE
            548D76768664F78D079DAE0D38CF9823CB2B1630A0596B3B4CED166B8DD6D578
            FB1EDF4B2F774D4FB9ED05D8DE1A7BAF46BC64BB3F4F4D474DCC42F9D98DE75C
            564171A1D5B412C1576F95AC86B5EC0C64ED7673B0B7C2FDA5BF3378C11E692C
            4F6EDED46B6BA8743DC6AE8667D3D4C4612D963739AE1F7EC070E6104705656A
            E1EC9F589D416134D572EFBB5B4F7553B9D97BD87F772F524E4704FF00102ACA
            63087EDE2F9F0B65A2B5C7398A5AB94CB235AEC6E8E218DAEF62E7838F6532D5
            6129D8AC8FFF00B3BA592798BC09AA4EE79F9582677193E5E7CAD6A32F16A9D6
            F50EED06A2FF004D3985B5750639257F8F651C9F7787633D2200E3D96F4A71CC
            F4D5E1ED3DA15C1DA43403D9693DD4F3BD94ACAA2EC39AE9B3BE6CF52EC038C7
            43CF40B1ABA9369CCB3A7553341F63566BF694A5BC5D2A6A22ABAFDD347F0CF6
            6D116488C383D8FC923C47F4496B736C5A2752694ECEB59D0DCE58A7A17B592D
            0776E2461BFBD7E1C3C1901BC7A83CF9A9693DA02B3E1A6EC32864635EDF85BA
            C8D90E719DEE90F4F3F9C0E52F2B54DE8ED35D8C5C74F5BEB6E5514F1DD0D235
            B708E4AE744FEF72373CB048DDA77378C79159998332DBDB8D05A2934C69E8ED
            AC8D96F87BC14421F13363A3046DC705AE6F3BBFE6AD67921EA7A4457374AD9C
            57B83EB45153FC439BC82FEEDBBB9E73CF9AB2C25D4040404040404040404040
            4040404040404184044416ABBECF6EA78A96DEDEF6F15EEEEA861F43E723BD9A
            BBE8E9E799EA199B3A34E58A3B3DBC41BCCF53213255D4BBE6925772E3CF2B3A
            BA9BA7F49584A2E6D31F5446AAAAA82929DF5133B6C518CB9DFF002F53E8AD6B
            99C12AD5253D46A3A8F8AAB6965B18E3B213F8F1F83DC67E73E7D070BD76B469
            4623EA67195AB68C60703D178DB6501010654565144040404040404040404154
            A367DBFA89D70764DB6DA4C749FC2F93F13FFEBD97B6DFE3A63EE971FAA7F4B5
            AF13B392A6EB6DA5ADA4A2A9A98E1ABAF2F6D140F700E94C6DDEF0C1E7B5BC94
            C0EB41F3DE303C30B86F702437CC818C9C7B6420FA4041F25E3706F393EC71C7
            BF441A6B6BE8A861EFEB27653C3B9ACEF25706B773DDB5A327CC9380AC46446D
            55EA5A98A486D50CB24CE610CA8DBB5AC71E03BEF38383CE0F55DA3471F54E19
            DE80D4B45AB60B1BAE0F8BEDDAF80C64DA29DC69E37B73890EE19713B79000F6
            F12D7C78AFD31FDA4573D9DA75EAA2D1A669EDF687360BA5D258E8E8608FC2E3
            BC869D9E9CB9A0FD579EDCBAD22215F6760745F6530CB79AD75F1AC71F896BC0
            87BD773C336976D07FBD9F359374E539D916B0AFBFD9AAE92ED207DE2D33BA9E
            A0FE2733F039D8F3CB5CDCF9E16B1C1673F6EF535B06863DC48E8E296A628AAB
            6F9C6EDDC1E471BF6FD564AA972F671A1F53FC3DBB48D66D9E9E36BEA6E5248F
            9848DC722480B9A01FA06FE817AA74B15DCE5BE72F4FAB7B744F67521EF7E21F
            66A0DAD99CDC19656336B496E4FCF27964FE6BCD69CB75787E999AEDA367D37A
            CA7717DB2F1DF32ACE08223EF30F0EF3396B7BD671CE158FC36F4DEDEA48A7EC
            F23A98640F8BE2E9E489CC236BDAF0E031D7230FCA930CD554EC9B5F5C6C171A
            6D2BA903994B716C53DB677B9AE117C500F8C6E04FDDCC5FE1E7C2EE3E97B6A5
            3BD8E1A78F59EBB807EF7E38B9A4F5D82A6A1BE7CF5571C332FAED0EE115B7B5
            FD1959338B21731F092D1E7297443DB1BA5014AF6BE9CBDBDCAE371D314B3BB1
            6C9A67FC5348F0967791364DC4F1FBB71E3EBE4A57EA23E97B0B400D00700700
            0461E33A2E8E3A5EDC754DBA26EEB7D4433BEA21EB19EF0C121DC3A7CD33C63D
            D2BD372E4AED0FDA3E80ADACAFD1B3BABACF338192958C134C1A0F843E1764BC
            B01DBBA33B88EAA67F2B1395DBB34ED362D55DF5BAB6214D7CA3607CF1B37777
            2373B5C581F8735CC71DAF69E87CCAD619B243B5504E80BC700ED8D8F21DD30C
            958E3FC870B32B5786695ADACD2351A7B5835F2496BAF35305C2263BC5F7533D
            8F8CB78CFDDEC95AD77985BF6AEDD455F4FDA0EB4BCD6095EDB45AAD9533524A
            C690E31523731BB6BB9F14F2EE3903C3C70B3104FE92564D5AEB3761B5ED89DF
            B6D556CD414CDCF8BEFDAD748E6E307C31B9C47E4B56848ED418F5250C5A4AAB
            4F3E8227D6D5D6B2AFED2DF87B431A1A23EEF6E0E46F1F37E2E8ACCFA31ED74B
            9DDEAF52F63509901754E96AE861A991C725F0188C51B87BE26683E7C159B7E5
            61EBDD94CD4B2F67963F87707363A66C7263CA46786407DC3C156EE70AFF0068
            9DA1DB67A0D43A5EDD4F51577486965F887B1AD10C71B5A0CAF73DCE1C303F18
            0324F0165B88797D04ED93B17BA53B0734D7C8DD2B8938C491B31B474EBC63F3
            56CB1DAF9D9EF659A0AEFA2EDB76B8D23E7ABAC8C99A57CF2B30FDC5843431CD
            68E4602D4B9CE5A7B72B6D2DBB4CD86828698476FA198C11B32781DCF0C008F1
            0C739CF92CC4F2DD5E8DA3EED4CFD236696A6A62131A1A73378DA30EEE999CF3
            EAE0ACD659CAC01C1C0169C83C82B23280808080808080808080808080808083
            08820D35755052534B533BB6430B0C923BD1AD192B55AE670932ADE96A6A9B95
            74BA9ABA37466A1A196C81F8FBBA7EBBBEAFCAF46B5A2B1B23FB62BF95A5795B
            151AE69E286374B2BC323602E7BDDC0007A9562328ADFED1A8AA1CC76E86D719
            19E0EE7F5F3E809F6E5A3DCF1ECE34A3FD9CFB59A18A2862645130471B006B18
            D18000E8005E299CBABEBCD0328A15101EE8ACA0CA28808080808080808082B9
            A9AE33CF232C36E77EDB59E19E41FD8C5F89C71D091D17ABC7A63E79EA1CAF3E
            9336DA0A7B7D143474EDDB142DDADFF89FCD79EF79B4E5D2230EA59579C76CF7
            BABD3F4B62BDD346C91D495CE1B5D90EDD253C8D6F8C73B73CB9BF8B8489588C
            A63B32D7549AB74E4538977DCA95AC8AE4DE01EF76F2FC37030FEBC24A61E63A
            8BB5730F6B505CA18FE2AC369CDABBD6E760350419E46B86417FDDF847E20DFC
            D2B2B30F68D497AA5B4DB4CF3CD140E99ED82133CC20697C871FBC21D821B977
            4F2532442B3A5EEDFD5DAEB6E93BC5DDF78ADB8432D4C17799E1DDE4CD970E87
            1976C1B1CDEEC79E1DE6AE49849EBAB86A0A5A6B7C565ACA3A4ACACAD8A0636A
            F70EF9B873DF144E0C9035EE6B0E0969FD56AB31ED30AEF6815D4166ADB5C3A8
            68595BA5EE35222A9B84D34B2CD14CCFBF8BEE43435ADDD1FE1278F21E7A9D4C
            FE88AA7AFBAA286D5AD74F5AA732B1B738AA6389CC7620EF3317761ECC7889C1
            0D20F19F7E31930B5A83C7BB5FBADBBFAC1A2EF22AA39ECF4B703F13342E1231
            A629627BF2E692DF941C8F64AB5E9EC2082323A7AA32F22ECC1D19ED5359FC27
            FB96F7E0347877F7D827CC72E0EC2B1F4B5658FB54D5F63B4D964A0B8E258EB7
            EE6766C32ED6B86E2768C9CED048F3F45DB4F4E319B74E799F4A36A9EC668ECD
            619F53E99BBCEC92DF4C6B58091E2631BBDCE867618DF1F8324755CA6FCBAF68
            8D43AF2E3A83B29B35AE792496EB57713455326CC9999481B237A125CE265841
            F576549ED988C15FA13B68974E535AEA29C545AA89AD7D35BDAEA4DD1F741D8D
            B80242FC388F9CAD59630D12DFFEDAEC266A191A7E26C15D4D1939E7B9925FB9
            3ED80F31E3D966D257B5BB50686A8D57D95E9DAFA4A76FDB56EA084B236F81D2
            C22201D103EBC07B47AFD52D1894ACA2FF00A3C3717FBBB9CF2E95F4CD73F79F
            13B326777BF5E7EAB53D1296EDA1907F5DF463AA80F85EFDBDE923AB7E2E9F70
            3C1C8C792C476B1D2D7DACE8BAAD53A67BAA1C7DA546FEFE95A703BCF096BE3D
            C781B81C8F70123B4ACAB149DBCFC1DBC535EACB546FF08D93430B4323738018
            711210F66EE78DA71EEB7354C377649A7EF35D77BC6B6BEC0EA5AEBA6E8E898E
            696111485AE739AD3E203C0C637201F0E7CD498C1940E94D51AC3B3F7D6E9EB9
            D8AB2E8D3546586A59DE969EF06DCC6ED9207091CDDC39CE49CF2B5B66609858
            3B2AB0DFA7D5B7BD5F77A075B5D5E1CC8A07B1D193DEB98E386BF0EC3444D192
            06E24959C6216573ED0E86BABF455DA9286274F55243F770B3E67608240E9CE0
            2C10F3CB5F67B76AFEC7A6B55452C94D74A6A99EBADB14AD0C7BC824B5AE69C9
            6F78D71660E0ADEA2C4A3FB35D0773A6D1FAB2BEE54EFB7545C68E5A2A16D535
            D04AC6776E2F738386E6B1EF2D1CB73E157133C26E55AD7D90F68B71B5535436
            98C74F33A57C34D3CEC698B731A1B31692478FDB9F0F3E4B7D71270FD054BA2B
            4BC74904325A28A47C513222F34F1BB3B59DDF57071F978E4F45C260DCA6692E
            CB6BACB7FD41473B61A8D237884C622DEEEF31BBEEDBB71D58D7B8673E985AFB
            70B33ED1F4DD94768762F89A7D31A919050543C39CD901638F9648D9300E0001
            B9B82E562498895874CF65B15A74D5E28EA276D45EAF904B0D65C082E1F78C73
            4637F88F2EDCEC9F13BF2599328EB7F63F550767D70D39356C4FB856D50AC155
            B098DAE60635ADC1F17CB1F5F7495CF2ADB7FA3B5D4C1B64BCC59C93DCB63936
            75C839DFEBCFCAB594E1693D8C40FD114BA75F727FC453D4BAB3E336978EF1FC
            16861767686F1D7DD4B4E48B610A7FA3A539196DE835E7E63F08D3FCFBC0532B
            B9EAD60B44767B250DAA391D2B28608E06C8EEAEEEDBB73EDD3A7924CB0EF501
            010101010101010101010101118CA02020F9559557507FB72F50E9D6EEF818C7
            C45D1CDC8C81CB22CFD704FF00E8BD3A7F25777FE333F85A58D6B18D63406B5A
            301A3A003D179A5A7D6515F0E706825C7007249F4551579DD55A92ADB0C19659
            A0766497FEF1CDC1FAFF008474F33E417AE31A5199FA989E56782086089B0C4D
            DB1B061AD1E8BC93396E21B145101105159456501144040404040404041137EB
            C3A8A3653D2344D73A9C8A5A7FA7571F60BBE8E96EE67A862D258AC8DB7C6F96
            6777D70A93BAAAA0F9BBD07B26B6AEEFE212954B2E0E820F2AFE9101E34A504A
            D791DDD6E76F3B4FDCC87247B63848EDA857FB47357A13560D4F668CC76ED414
            92415D1C798D9F10E68FBC6EDF91FF002BC1F5CA4AD555BD699343D85DA2BCFF
            00BCDC2EDF1B33C752D9639238FE9E1637F5548E562D6954FD7FDA3D934EC159
            3D35B0D344FA9EEC1CB647C4FA8738308C0F06C6EE29B7949E21BF56761D069B
            D3F51A86C375AD75DED205530BF660B2221CF70DAD0439A01775F2E8A5A619AE
            5C1ACB5F546A2B0E84BDC4D6BEA69EE87E2E38E3247C753776636B339F9DAEDC
            0027AE3C93DB7D3D37B64D3B5B7DD055B4D41099EB6074753044D1B9E4C4EF10
            68F33B0BB00725496615ED41A12F5ABBB3AD3752D74906A6B453C3240C9F30BD
            CFD8C12B64DDCB5E4C61C09F3FAAD4A44A36E3A83B6DBAD85F649F4D18EA6ADA
            EA59ABE3C3323E527E7DACDC3ABBA7A2CE32DE61648FB1FA19BB35A6D2D5536C
            B8467E2BED0C6F2CAB7F2F2065BB9B871663CC7BAD4CB112AFB2CBFD20ADD442
            CF4B554D5146C68822ACEF2332B221C022491AD7F03CC87159C2EEFD2C9A474A
            B34359FECDA32DADD4973C3E7900C346C6E3CF9EEE3C9C67A92BD3A7489EFE98
            73B593374D016DBB699A9B3D748F3355912CB5CDFDE89DA7735E3767A1F2F458
            D4D5DDFC15AE14EA3EC3EF3F051DAABB56D5CB658FC3F67C6D73632CF2003A47
            06F3E58202E7886F74A7BFEC774E325D3E29E69E3A3D3F2C9511D3121DDF4B23
            DB217C8F3E2CEF60E9C638577728BE2CAAA34BD94E8AA76DDE36D117417BE2B6
            9DD23FBBC07F78046D046CC3CE463A792BB8E566B6DBA8EDB4105051C7DDD2D3
            304713324E1A3DCE49499447DA747698B45C6A6E36CB7454B5B57915134608C8
            73B710074682EE4E132AEEACB55B2B65825ACA486A65A577794CF9636BCC6FFE
            261703B4F1E4A6475A0F9DADDD9C73EA83E9010610650609C75E882B877EA2AF
            18FF00F42A37F8863FDE666E31F58DBFCCAF4FFD71FED2E53F32C6000303803A
            05E6756501061CD6B9A5AE19691820F42106035AD713E6EF541F480808080808
            08080808080808080808308088202020C2A8E2BD5D296D36BAAB8D49C414B199
            1DEA4F9347A971C01EEB54AEE9C24A2B455B2A60B5FC7D7802E7723F1153C7CB
            BFC419F96576F22FCE23A84AC2C4BCEAC1415BAD967BF553A82925D96D87FDEA
            A1BFDA1FE169F41FCFE9D7D7488D38CCF6C769FA5A5A7A5A765353B04714630D
            605E5B5B32DC36A833F4456545630AA32A28808328A20202020202020E0BADD6
            3A18DA1AD33554DE1A6A76FCCF77FD79AEBA7A7BBF862D6C34D9ED5253BA4ACA
            D777D71A8E647F931BE51B3D82D6AEA6788E8AD52AB836202081D67A36D5ABAD
            02D7737CD1C0D904CD7D3B831E1CD6B9BD4870E8F3E48B12D7AB743D9F53D920
            B4576F6C14D2472C0F69F10310DBD7CC16920A491386CAFD13A6ABAD82D75B4B
            DF5A628A1862B7EE7F74C6D392585AD6907779139C9031EA8996FA2D2FA7692E
            A6E7496BA6A7ADEEC422AA38C324D838DBC0181868E898329741A69A92969606
            414D0B20823FDDC51B435ADCFA01803AA8372A08308328382EB74650C4D006FA
            998ECA787CDCE3FF000F55D74F4F77F0C5ACF8B55ABE1DCFABA9777D709FF7B2
            9F207F03473868C2BA9A99E23A5AD524B8B42020202020202020F89648E289F2
            C8EDB1C60B9EE3E40724A0F3EECFBB5866AABED5DB25A665280D74B4043F739E
            C638021D9C78B07771E4AFA3187A228285DB16B4BC695B053555A3BB6D554547
            77DE4ADDED0D6B1CF2DC7F7B6E15AF6617A864EF2163FA6F68763EA14910579A
            992E559F6152C9DDB1E3F6FA8070447E71C7EAF70F4E8BBD315E67BF4E73CBAA
            BEF9A6B4F53C3157D7D2DB62DB88239A464796B78F087104E33CAE16BE679748
            8775357D15551B2B69E764B49233BC65431C0B0B3F8B774C29910771ED07485B
            EA69219EED4FBAB1D88F6B83C6D271BCBDB96B5B91D5C916813FF134FF000FF1
            3DEB3E1F6F79DF6E1B36633BB774C63CD322B347DA8E84ACB9B2DB4F7563AA64
            76C8C96C8D89CFF26B657344649F2E79F24158ED25D490F699A16696BDF048FA
            9313620C2E0D048E73E5DF3DCD84FB15AACAFA4F6A2ED734558AB66A1AAA9966
            ADA77865441044F7161383CB8ED61C0764E093F9ACE5312DD78ED4749DB2CD43
            7374EE9C5CE264F434B10FBE7C6FE7796B8B768F772A3AF47EBCB16AA8A43406
            48AA2100CD49380D9034F01DC1735CD38F23F541634040404040404040404044
            114404184411045103CD114CD62D7DEB505A34B01FB238FDA776F7829DDF7519
            F67CBFFDABD3A3F2D66DFD332B8F45E75633FA20AED65654DEAA9D6DA07ECA16
            65B5B5439DDE5B1A7FD7D57AAB58A46E9ED899F49CA3A3828E06C30376B1BFCF
            DCFBAE17BCDA732D470DF85857D6146B0CA2880882020C20CA28808080808083
            82BAE26378A6A5677F58F1C307468FE279F20BAD34FDCF4CCD9F36DB51A77BAA
            AA64F89AF906249C8C607F0307E16FFAA6A6A6788E2122BF948AE4D880808083
            0829357DB3767B4B52F824B913B1C58E95B14AE8F7076D2038379E9D470AED6B
            6A5B4E6BED25A8A57C169B8327A867260707472103A96B640D2E03CCB7A26126
            161510404041A195B44FA9929593C6EAA88074B007032343BA1737A8CA6068BC
            5E6DD67A07D757CEC829D981BDEE0D05C780D19F32B54AE6444696AFB45E9F25
            DA1AD82BAA7E50217B64F8769E8CC0CED2475F55DB5671F2C74C6DFCB5DEFB4D
            D1164B89B6DC6E6D8EB598EF626B2593BBC8CF8CC6D735BC73C95C22AE9B553E
            DDEE0C97455B6BEDD584C2FAE61865A67E5AFCC1339A439879C16F1CA931CAD5
            D54FDBB680ABB87C0CD254414BE12DB8CCCEEE12E1E23BB07BC6807CDCDC7E5C
            AD4413548EBEED42CBA2E08210C757D7D4B04D0D3F7871DCF4EF1F2BB7E01C78
            7D4AC95AB4F67DDB059756D49B7C917C05D7C46180BF7B250DE5DDDBF0DF1340
            24B48E9CF3CE2E098556F1DBA6A19EAA4B6582C79B8C32CCD933DE55F820796B
            888A26C6EF2E4F40A35884843DAA5F351F67B7BADB3D03597CB7340A88A39738
            A79184BAAA1E1A77340796B3FBBE6968E13DA33B0CD4FA8859EBBE2218FF00AA
            56A6CF2C95CE2EEFC4F8133A360DC4168638B8F03AF5552DDA32A3B4DED3AF62
            E9A96C7DDD269FB3F89F4AEEE9C7686EE3B811BA476CE5C03801E5EAB310BC74
            F54ECD75BFF5BF4F7C7CB1361AB82430554719CB37068787333CED735E3AAD4C
            312E7ED7750FD89A1ABA467EFEB47C1418F5981DC7F28C38ACB5578FCF68AED0
            2CD23AC23267F8E6B66AB80FE07BD9BBBA6F2387D3BDC39E8E693D0E06FDE13B
            5F7B6ED775F6BB2DAE96D1216B6F4D9647D430ED7F72C6B30D6BBAB7799473E8
            B38E70B1C72F35ED13B3BBDE8EB5D2C93D7FC65BABFC33EC0E8D91D53637101C
            D2F707F84BF63BAF51E695ECDD958756DDEE727693A2A6A7AA74535650DB7B87
            E4B9B13AAA47B24F08C03B83B07FF65BAC46ECCA4CF0FAED36086D3DA8E968A2
            95F1B2116F789B24BCBA4AF7B657B9DE65CDEBFA25ADBAC958C5511DA3C761A6
            ED1AED3EA5B8CD7081E3EEE8ED7813445C1BDCC534B3E238F6B7248664F9E067
            9C5621AFFF001F3D9EDF6B1DA275AD9219BEEFECA9AB608A539DB8DCD9CB71C7
            2C737231C9F4CA5A385F6EBD05A12C57BECF750DEA66BDF75A5F8865261EE6B2
            37454CD9631B461AFCEF19DC3D96ECC4E72E1FEBBB9BD8D4368826732586E8FA
            5A9007F62F6BEB2319FE12F201C7902162632DAA55D75B1D45A68E968ED2DA6B
            84007C75C454CB31A8F060E63700C66E778863A745AC985D352DD2EB71AAECD2
            E3552BDF709E1A612B9C30F73995B137BCE3CDFD7A263E64F4E9FEAAC3A8BB71
            BADB6B1824A1F8896A6AA3DC599631916305B939CBC75E0A53DB369E1D36DD2D
            66B976E171B2D6D3865AA8C3DF4F6F6E443B638A3D9086F3B63FBD326D6E067F
            45293DADFA4B4B6CA5D31DB650416768A7A3AB6C45D494E36B58D9D8F89F196F
            42374424FE6AC4E7B3D3DAD65040404040404040404040441144184055041844
            10523414AEB9DFF535F5DE26BEA9B414AEFF00E4D2B73C1F477780FD57AB5E36
            C4559AAEEBCAD2B772AEABBBD5FD976B7EDA71915F5A39C0E858CF7CF53F97AA
            F552B148DD6FE9CE794DDBE829A829994D4CDD9133A0FF0089F75E7BDE6D3996
            E1D2B0ACA2B28A2020202020202020202020F973DAD1B9C7007525304CA39F55
            3D7663A13B21239ABC71FE4F55DA2B15EFB73CCCBAE8E869E923DB0B793F3BCF
            2E77B92B9DAF366E230E8595101010101060A0F0BECB2DD4A3B4FD5167A8A78E
            A68D82B3C12B1AF0047581AC0EC83D4487EAAFA6ACD3DA8D923D037CB56ABB0D
            3B69B7544BDED34276C1E0DAF6B437FB3EF59BD8FC787A6003D507693ED47B5C
            BB4770A6D3FA41F8A89C40E9EB86CC9356D0E8618CC9E16EE6B838B8E30144C3
            4F66BDA8EA866B1FEA86AC789A590982199C63EF23A8630BF61743963C4801E7
            3C1FAAA614A9352EBCD5579AFBC525E63A6ACA23B69EDACAC34B23D9B9FE0A58
            09024200C1C9E723A9CAB13C2ED58BB43BBF68343D9EE959EEF595747707C954
            2E6E8DFF000EF21B934E25742E6F8FBA1D3CF927909ED3088B8E8DD53A334D5B
            F5DD35D9DF1F586092ADAD610F885480F6778F2E7779E3F0BF239CA670BC4B6E
            B4B9576AA1A67506A0B9476ED3D57086BE96173A4984D11736A5F05335B26497
            7803DFF2F9FA1D5B11D251CFD9C5DA8287B58A316192A22B4D7BFE15C2BB677A
            F8CC0E25B2F72433777EDF02CC4F05921D99E8FB7EBAD45A8EBB5007C9DDBBBD
            2D89EE84F7F5724D9778719D823F0F97AE548E96650DAB74D6AED39A4A6B3D6B
            E1ADD3EDB841536FAFA7918EEEE6732463A37464B656195AE6BB01A5A0F9F395
            26D93DACBACF425A6D5D8D5A2BE869E27D6B24A6ACADB8160EF9CDAB0439BBB1
            BB607CAC681E8124ACA2B506A2A57DBFB3FABB6507C66B0FB3E0643572E5CDFB
            A73A9A368886D8A47FC40738170C37F357D91D392D14DABA87B6AB4FDBAE135F
            E6AB8A5AD2C7308D92C2E6119686306D87C87A7192AC7B45AFB03A7745AC7543
            247032C5BA307C44902AA4048DD838E39CF3D14FB4B76D9D9A519A4D69DA05B6
            986E631933190FAED9E6EE8607A35F8E13ED59EDC5D8D5CA1ADECEB5369964B1
            36E134533A8A0DC04B2FC4D18670DF99D87331C0527A4F6A0E95B2693BC5BEE3
            5F7BBF9B3D45178C52FC3F7CE9A2700D6BA3390E7BBBC3B4B1A38E0F9AB9E1A7
            AD7F4708A7FB1EF13BA3736192A226B24FC0E7323F1068EBC6464FFC959E989E
            DF1DB74B2DEB51E9FD1F4C7C73B84CF7756B5F33FBA8DCE1D4EC6B64242CD639
            6A1137AEC0E6B5D8AE17365D4D6D651533E78608A94465EF8DBBB6E7BD3E1E0E
            075FAF4366C45949BF5CEE37ED116861A39CD4E980FA4AAAE637744CA4A96B4D
            339C4125A47758E9818E48C857DE4858BB4DED4EDBAB34BDBADB1534B4D5714C
            DA9AE32966C6BE38DF1E18F1F3825E4E703A7E4A639487C6B0B65C2DF6DD07AB
            3E08B658E929A5AB7873B1DED3BA39A16C8FC7DDEF6671C71C8E56E6672911C3
            4EA8D5FF00D74D7BA7EE305B27A7A382A2969E1DCDEF24976D4B64792581CDE3
            9C3413C73E78522BCE4F4DFA9ECBA8EC7DAA55DE2AAC5F6EC1513CD3D2C32C2E
            9607B651B61398DAF687C430DC3867CFAE0A95AACCB7F667A4351531D574F516
            CA88649EC9514F17790BE30669F96C6C2F0339F649AE20CC6571EC574FDD693B
            3EBC52D750494B535951377505434C6E735D4B130643C703702390A5A0F6AD69
            AECAAF175ECBEE1433D2C94175FB4FE3A8E1AA6774E93B9A66C1B4E796B5F978
            04FD7A22E794150767DDADD551CDA5CD13A1B5CB551D4544954E8F63648E26C6
            D719438BDED0C6B46180F40B5833CAE3AB3B29BE433689A4B1B1D57159C08AAA
            B1EF03639B511CDDE3839C0ED3E32037A631E8A47699E13965D0F7FA4ED92E7A
            8A487FD8F5113CC755DE33C4E95910D9B078BC2633D461482D397C6BDECC6FB5
            9A999AA74B55369AE981DE0738C6E12359DD0918FC3DBCC7E1734B71FAA557D3
            6E90ECDAFACD56ED55AAAA229EBC343A9E089CE9312ECEECBDEE2D601B5BC35A
            D18E511E96A208080808080808080808080808308820202A8E2BC56FC0DA6B6B
            7AFC2C12CDFF00D36177FC16A9199101D97507C1686B6077CF50C754BCF527BF
            7178FF00CA42EBE44E6ECD5D772AEA9B9D43AD96C7ED8D8715D543CBFB8C3EBE
            B8FF00DB5A748AFCD6494B5B6DB4B6FA465353B76B1A31EE7DCAE37BCDA72B15
            7561736994532808ACA0202020C2208ACA0202020E29EED4AC97B88F35151C81
            0C5E23C75C9E83F32BA469CF7E999B35FC04D53289AB9D9637F774ADF907BBBF
            88FF002577E3A4DB9480000C0E8B936CA020202020202020F13D3135BEC7DBAD
            F21A9AA6B3E3454ED27C2DDD3186AB6B8BBDB383FF003561AB38BFA41EB1B65C
            A9EDF60B54CCAE96398D4D4180891A24DAE8A28B2DC82F25E7C3F4F553D90A86
            ADD1DF03AFE92C3A82EEE8686A29A9182F1342C0D6451C1DD34060DACDA1ECD9
            C9E3A9CF2AC0EAA5D27A768BB55B05934F57CD74A48A6A79EA2AA1747E19232E
            98863E118DAD11B4BFF3195728E7AF7F67572A7BFCB74A2A8D31A9E396674145
            4EE7D5533E56FF0067B766D8CEF05AF1E11CE41F211708EA9AA96AFB26A4655D
            64AF6D35FA4869A9DDBDCDEE5D44D739AD7918C31C5DC678DCA2A6AFDDA75C35
            8E91A3D3028A69AEAD3131FDC012099D09CB5ED637EF37B80F940C0E574E31FB
            4C61F1DA0E80BF5934EE9473A964963A7A3732AC00E9190D4CD526A1EC9360E0
            4867DBEF85CE67E64877D92D7A82E7DA1D82F4ED22FB4DBC545337BAA4A7923A
            7688413DEB9DB63E99DD92074C738E7593858E7D35DA4E8CD5D7AACD2540DAFA
            0BBB8BA30EDAE8DBBDC64196F7B139AE89F23803D0B7F965730E0A2EC5B5247A
            12F734D0F79A92E52534F0D1199B9FB897BD26493E533BFBC783E2C7BAB2CE5E
            9559A3ABAE7D9543A5E5EEE0B87D9B4D01DE4BA36D440C61192DE701ECEA1492
            156BA76275B59A674F53D3DC23A2BFD923EE8D4B3798DC0C9DEF85C363C163F9
            69C7E4AC913874D83B17ADB7EA5A0D475B7E757DC2094CD57DF43DE7784B0B30
            2474991B41E0E3F20AC4E0CCAD3A734050D8B53DEAFD4F5324925E5DBDF4EE0D
            DB1973BBC7E08E4E5C7CFA299E06EB4682B2DAB555CF52D33A6F8EBA376CD1B9
            C0C6DCB839FB0637789CD07927DB0A083A5EC474552EA086F70FC509A9EABE36
            1A7EF4772D943B737036EFC071CE377F25723BEE3D91767B5F5CEAEA8B4B7E22
            494CF296492B1AF7BB97658D706F27AF09B9168B7DBE86DD4715150C0CA6A584
            6228631B5AD1D7A7D5499221CEFD3B647DED97C7D144EBBC71F731D696FDE067
            3C03FE621324C24300F07A1454650E9AD3D6F156DA2B753D3B2BFF00DF191C6D
            0D978230F1D08C1230AE51BA9ACF6D8222C652C4D6B800F63580338E9E1E9C2B
            3794DAEDC0C63C965A0000630994C328A20C2020CA0C20CA0202020202020202
            02020202020202020C206511855050567B4BA9F86D097A93D698C7FF00D4219F
            FE4BBF8FF5C24B9A827AD9AD96DB15B8F74E829608EB6A87223C4401630FAFA9
            F2FE63B4D62266D6FCB19592D76AA5B6D23296986236F9F995E6BEA4DA5B8875
            AC2B2A299404045650611194561104040CA020E3AEBB50D1712BF329F92060DD
            238FA068E56EBA732936C39BBABADC3789BF61A43C08D8733387A97746FD02E9
            9AD7F729CCA429A8E9A96311D3C6D8DA001868C74E02E56B4CB510DCB2A20202
            0202020202020F32D51D885BF516A7ADBCD65CE58E1ABD85B4B144CCB5CC6358
            4EF7EF041DB9F9521BDC97D2FD9068AD3D550D6C34CEABB84077415554EDE633
            FDC60DB1823C8EDC8F5466653BA934869DD490C50DEA8C5536076F84EE7B1CD3
            E787465AEE71CF2A60897CD8746E9AD3EFCD9ADD051EE61649235B995C320806
            424BB1C7215470DEFB30D077AB84970B95A229AAE5189650E919BF8232431CD1
            9E7AF5530B9563B54D20FBC6961A7B4ADB2169B74F1D5BA18047035A4EE69645
            F2303DC1E5C7DBEABA6CE3295B72B8E8AD394F64D376AA475243057C14914754
            E8DADC997637BDF1B7AE5C16244F2020202020F9FBDEF4723BAC74F32EFAFA04
            1F45CD6825C700724941A23B8504B3773154C4F9B19EEDAF69763D700E54C8E8
            54705EEF96BB1DB26B9DD2714D45063BC9482EF98ED680D682E2493800050419
            ED3B47FF00561DA94553DD6B6CFF000BB8452779DF671B3BBC6ECF39E7CB9564
            8566B3FA44E83A6CE22AD988F26C4C6FD7F79233A615C1CBBB5276D3A7EC8DB7
            1F82ABAA373A386E108606336C5519EEC3F7B81DC769E14C7233A47B64B5EA6B
            F4569A4B4D74426DFB6ADED6189BB185FF007858E76CCEDC0F75A9A22DFA92E5
            5F6CB2D557D0503EE7570377454319C3E4E40201C38F039E02CABCA6B7B67D7F
            4D4EFAA93493A9A92268124F332AB635C7A39CF31B0004F91FD56A6306D77D47
            6EF15368CA0BB4B6FCDE2E0EA86454AD77DC0F859031CF73FE6DA770C0C6739F
            452639C1108A87B73D5768B9C3FD6FB2FC1DB2A3C796413453361FFBD677AF22
            50DC8DCD0011F5E15C1849576A2EDEE4AAA9F83B1D3C74CD95CDA7C089F98F3E
            176E7D40CE5BE781F40A9874764BDA1EA8D47A82E36DBD3A9DCDA6A7EF1A2266
            C707B65D8705A5CD7B4E7AE7D1262302DBDA2EB21A4F4E3EE0D6779552BC53D2
            07025824702773F18F0B5AD2EEBCF45821E4B2EBEED86C54D6BBFDD9C66B457B
            B743049140D6C8D70DED648638C3E12F672CE7CB91E4B7C1B57EED035DDDA1D1
            56FB9699A79A67DEA30F8EB2189D37C3C4E8FBD2E21A0E0E3804F459C72431D8
            85F2EF77D375B25CEAE4AC922AD73229653B9C18628DDB7779F89C4856C4F6F4
            55904040404040404040404040404041840446506101060AA8A4769134D75D3B
            73B3D07511E6AAA7C99B5C1C18DC7571231EDFE9ECF1A98B44CB16B2C1A5A3A2
            FEAFD04949FBA9A08E50E3F31DCD072E3EAB8EBDA66D395AC25D706994184041
            F48A22B1944100A020202A888AED4D6DA697E1E1DD5B5BE54B4A3BC7FF0098FC
            ACFF00310BAD746679EA0CC3E4375057E0C9B6D94E464C6C3DE4DF42EF95BF97
            EAB5F257FD99E65DB416AA3A21F74DCC87E699FCBCFD4AE77D59B351576AE6D0
            80808080808080808080808080821F546AAB469AB61B85CE42D8B76C8D8C1B9E
            F7904ED68FA0F3E11621E7159FD21A861EE9D258EB29A92A4FDCD64A5BF26706
            46B390FDB9E4072B5C6576B9B58F6B978D35A8E96D761A7A5B8DB6AE969EAA19
            1C2692A267546E3B8161F16F68181B7FF4B3394888876E9FEDD2737782DFAAEC
            EFB232A5DDDC557277AD01E4868DEC923690D2EE3767C3E7EAB31CAE11ADD65D
            AFDFF535EAD3627D2C6CB554CD0BDD1B22616B1B2BE38DC4D477B9C98F9C0FD1
            4C49C2FBA129BB4881D58FD63594D51139ACF846C21A1EC702EEF37163236E08
            DBEAAB395B629229582489E1EC77CAF69C83F9841E4DDA65FB575D35AD0687D3
            954EB719636CF5356C73A37F21CFE5ECF1B58C6C7F87E6270A632D750E2D25AA
            F5B695D71FD4ED5333AE71D635CEA1A82E73C97F765F198E5930E2C93BB7465A
            EE8FE9C75B1D0A553E98D79AB99A9351DD5B5945596E8BE2A9C54C52C7BDE373
            9D4F0E76B9A1918E36B7AE16631832FBB347DA5EB4D230E9EA5C56D9292B9B0C
            F52F93327886F6898C8E1BE0843B200E7E5E385AC24CE1DBDA3694D3BA265B55
            6697B83CDF2091DDEB04B1BA66189B9126D6346DE7C0E69E0838C2D7B23387E8
            D1D1651E19DBA6A79EE97BA3D1F6C8E4AA920709AA2089AE739F398CB98CC372
            4EC8F2E3C79FB29EDB8542DF779E5EC6AEB46DA733361BDD3F7846D0C862998C
            21C4F53995BB7DB3E9C2D5A523B48699ED46D565B7DBA88E9382A5901115C2E4
            430CAF2497BB6FDDE0BF6721AE7F92D6EE4DB090ED76F74BFD74D2FA8ED7FB6C
            4FA3A7A9A48D9BDBDE165439D08F078F25CFC6D1CF979AC67127A5D346F6B174
            ADD4CCD3BA9ACFF6356D4826973BD997F89D873640387869DAE693C8C79AB1CA
            4E1E9CA23CA3FA426A092934ED2D9E1DDBEE32EF9B6F43143C8613FDE90B71F4
            4C665A8FCACD6EECBF49FD8D63A5B9DBA2AAA9B3C7F76F3B80EF9E7BC99C434E
            1DBA5CBB0ECF2B53661E1DAE7585E755DE6D747AA295B65A382A0B0110CAC7B2
            09E56B2594BA42776D637F0F0B34EDB9E9FA075FDEC593465D6E0242C9594EE6
            533DBF377D2FDDC58FF3B824B3579CF632FB7E93D0771D557B93E1E9AB670C89
            FB4B9CE8A0FBA66D0064EE94BF1FAF457D617B96BD7FA86CFDA55A05A74C4F24
            D76A0DD70FB3A58648CCF0C6D31BDB1B88C6F1DE02D19E7FD26DF6BD2AFACF5A
            6ADBC68CA0B35C2C355410DB5D08B857CB1CAC6CB244DEED80831C6C66E2725B
            9EBD13312B0F5DECE44953D93DB19B4B1CFA0746D03938F135A7DF23956EC42B
            1FD1CE7CD8EEF4E472CAA8E4CFA892068FA7F67E89E8B76F5E50101010101010
            10101010101010610101119418451110D5D5F3D6D43EDB6E760B78ABAB1D231E
            6D6FABF1FA7D7A77AD623996265DB1DAE923A075131B885EC2C77A9DC304E7D5
            627527396B6A0345569A7355A6EA886D65ACE606FF001D2BC9EEDCDF5DBF29F4
            E3D576F223EE8F6C556B0BCAE822308328A228882208A20E2AFBC5AE81B9ABAA
            8E13E4D27C5F937927F45D2B499672E075EEE154D1F64DBDEF0E196D455EEA78
            FA71E170EF0FE816E34E23EA94CBE24D395F71D9F6CDC5F244082EA3A5FB885C
            4793F197BDBEC4E15F8B15FA6176FE52F494145471F774B0B208FF0085800FF4
            5C6D799EDAC3A1646514404040404040404040404040404041E43DAFC6FACD79
            A36DB38EF2825A88CBE1763BB76EA98DB267D7C1C63DD217D3D075568EB1EA8B
            536D97388FC3B08746E88EC7B3031E17796470A6089790F69D4F69D1DAEF48D6
            D252E292D94D034C4DC17BA0A4936757FCCF11BF82E3D71CAD42FA706A7BB5C3
            B59D4D67A2B5DA65828E944824A891FB87752BE3EF1EF2CCC6C2D6C7C0DC4925
            5DBED9897CD35D35459BB54D4E74A500AFAE9E7A96CB4D231D2B5AC748D94C99
            0E611F78EF37639FA2956A5E95A7E0ED035469ABDDA759D2C76C656C1DCD1D4C
            00090F7CD707EE884927C9E1EA467A24B31C2CBA2F4AC1A5B4ED3D96099D50C8
            0C8EEF9C0372647979C34741E24991E79DAB5835250EB2B5EB3D3F4EEB855533
            5AD75144D73A5FBBDCD27647E37C6F6CFB5D8F97E854ACF2BE946BA5C757D7F6
            A1A7EE5A8685D6EAAAAAEB78A2A578DA1B4EDA868C373E2EA493BB9C9E816A0C
            70BE76EBAD5F051C5A3ED60CF74BA167C547165D2084BBC110031E39DD86E3D3
            AF50B30426AD13D8BB2AD0D6DA7BDCCFEFAA66FDA5F130C84D4CFE39301BCEC8
            C0C67D00F3499479CF68BD9CC1A4DB16AAB4DC7E299557112B6096361687BCBE
            A1A77038780E6631B52270DE72F68B16B4B3DCAD168AA92A61A5AEBBD347514D
            6F9646326717B7386309CB86738212588786DAACBDA9DBF50555EA2D34EAAB85
            78A86CD2D5C4D7358E99C4CAF6012B369E4B5A727C271CAD6386915A31F3D3E8
            FD4ADADB3FDA9A59AD865AB6F7DDC4CDAC6491320C4ADCB9A00E5DE1F2F7C298
            E09ED6CD51AAB40D7763705AAD9DD5BEB37C0F82CAD904B3C4F8EA0195CF3CB8
            E5A1EEDCEEB9F75252A8ED3FA859A5E1D1635258A965B6ED9EAEDF75943E4AB8
            9B35439DBE36EDC0DBBD8FDA339041182B52984D5E6FD6DD61DAEE99974DF795
            6CA0EECD655061634319277AEFDE00E01AD241CE39771CA560CF0BFDA7B4CA2B
            96BDACD211DBEA22968DB2935726369309687787A869DE0B5DE6A6053AF94953
            AB7B70A5A19603F65E9C6B2499C5A76BB6B5B30CE78F14B23063D02B10A9CEDA
            E1D602D76EADD392D533E0E57C954291CE0786EE6BE46B48DCC6ED39078E54AF
            644283AEF54DCBB4D8E82CF63B05477D4D2991F3498E1C632C7333F231BCF573
            96A29CE485C7B62B3DFA6D2D60D3167A5A9AF32CD1432CED6B9CDFB860630CEE
            19DA1CE76E25DC71959EE485F6DBA62820D2D45A7ABA365C2969A9A2A691B3B4
            39B2774D0325A78EA32A5B948517B4AEC7EDF5BA7D87495B60A2BBD24CD99860
            C41248CC3839824CB4076487024F9257896E2DF9566E27B5FD5762A6D295B63E
            EFBB318A8BA5487461E603E17BDEEE07232E2C0E2EF25AC311187B158AC62CBA
            628ACD0BFBDF82A7641DE3F9DC5ADC39C47B9CF0B33C90A6762BA3751E9AA3BA
            8BCC2DA7F89962F86843DB21C44D2D73CED2E037646067C95F4B6EDE94A20808
            0808080808080808080808088C20202022216AEBEA2E3512DB6D8F31F7586D65
            7019119EA6367ABF1FA2EF5AC5633666652541414D434E20A766D60EBEA4F992
            7CC95CAF79B4B5118742CB486BDE9F6D6C8CAEA47FC35D69F982A079E3F03BFB
            A7CD77D3D5C713CC39DAAE41AAE6A00D65F28E4A53F2FC431BBE23E59CB7207E
            AB73E3C5BE9937FE5254DA92C552018ABA125DC869786BBF4382B94E8DA3D35B
            9D9F1749B7777CCDA7CF7058D9265F66781BD5ED1F98F34DB265C551A82C74E7
            13DC29E370FC2E9599FD3395A8D2B7E177390EB3D35BB6B6B98F77935BB9C7F2
            C05BFF008D7FC33BA1A7FADC67C0A0B556D513D0988C2DFF00C52ED0B5F031DC
            E0CBE8CBACAAB708E0A5B6B5C3C2F7BDD51203FE1686B38FAA98D38FDA65B458
            2B26E6E174A89879C50EDA767FFE7E33F9B967E2C7A8312EAA1B15A280E68E92
            38DFE72632F3F579CB8FEAB36D499ED62AEF5CDA650651584465144040404040
            40404040404040404041E67DB2D25553CDA7B5253C4F9059EAF74C221976D2F6
            4801EA034F745B93C648F548958746A3ED9F4CD269AFB42D150CABB8CED1F094
            7235EDC38F574C3036B58324F3CE300AB30B10AAEA9FB5EF157D9AEA2B9D2771
            5B513B195B0B5A7BB6E678A466D61DEEF1B5A4E09CE123B4F4F6B6318C186343
            41E7846621E5FA7AC15D45DB9DFAB0D3CBF075348658EA5CC3DD9EF453F01FF2
            E77C6E18EBC2912B67A6571AB1455068835D58237FC3364F90C9B7C1BBDB7754
            9210BA12A7565469D864D550329EEFB9E1F1B0347801F017063A46827D8A12AC
            7695A1F53576A1B66ABD2F233ED8B6C7DCF74F2D19665C7C3BFC1CF78E0E0545
            8944D93B34D657BD654BAA35CCF17EC05AFA6A184B5C37C6E2E8DB86E5AD631C
            777524956126CE13D876B475FE6BD7F59D82E0FA87CADB86C91D3ED3E16F5200
            219E1C6700701209B4A7E9BB1B9EAEC95741A9B50D6DE259E58A7A49A473B34C
            F89AF6F83BC7CD9DE2421C3A7E7CA706E947D0FF0047F688E9A8AE9A8AA6B6CB
            4AE2E86D8C618E305C4976DDD2CC19BB71C968079EAAC132B7D6F65DA52B3525
            BF503A2923ABB6B616D3C31BF6C3FB31FB9CB719F07A0207AA65395B54541597
            43E96B2C35F4F6FB7B2386E6FEF2BA37EE91B21E982242E1B71F87A2B911B076
            4BD9E415DF18CB345BC7CB138BDD08392ECF74E71679FA2BB930B1DCECF69BAD
            2FC25CA8E1ACA6EA219D8D7B41C63201CE0E0F5532AD767D3F63B2C060B4D0C3
            43138EE7361606E4FA9C7549B4CA61DC238DAE7383407BFE6701C9C7AA8AFA41
            94184194040404040404040404040404040404040404041844150441042D7D45
            4DC6A1F6DA091D1319C5756B7AB33FD9C67F8CF9FF000AED58DBCCB33CA4A868
            696829594B4B188E160E00FF0053EA4FAAE56B4DA796A3874059510100807AF2
            8A8CADD3760AD766AADF048F3D5E58377EA395D2BAD68EA5998709D01A4FF050
            88FCFC2E7819CE7D7D5758F2EE93486D6E88D2E1A01A063F1E6E249E3F359FF9
            37FCAED86F834AE9C84E63B7419F52C0E3FF009B2B33AD69F661231D35345FBB
            89B1FF008401FE8B9EE957DA88CA2881E6831D5546545328328A202020202020
            20202020202020202020F97B1AF696B80735C30E69E84208C6695D32C9BBF65A
            A904BFC7DC479FCB8E14C2E52981FA745519404184194C820202020C20CA082D
            47ADB4C69C7C71DDEB9B4F34CD2F8A10D7C9239A0E33B581C7192A645719DB97
            67CFAC8E98554C192BDB1B6A9D03DB082FE065C7040C9E785445DFBB76A3B6EA
            2ACB4D3DA66AC6D03E48AA266C81B97443C65AD0D7F85AEE09710B558CA24F46
            F6D1A67525C596D2C92DF5B28FD9C4E586395DFC0C7B4FCFEC40CF929302F755
            5029E966A82322163A423FC232A2BC29BDB9F681719DEEB45923969E3197361A
            6A9AA70CF0373A3200E5C3C96EB19826B2B2CBDAF5EAD7A160BBDF2D6D82F95F
            512C56DA122481B2451E0FC43DB265EC6373F53C74CF12D1CE12215FA5EDBF59
            DA2EB03B565ADB15A6B1A261B227C52B6138FBD8B2E7EF6B7A969F17F20ACACD
            5E9FAA75F596C16D9EA5F2B669C5336A686169FF007812BFBB8FBB774237919C
            74072B9CCE08547B23D7DAA3505EEE1437A9E2998DA66D4D3EC8C44E197ED206
            3AB791D727DD74988C187AAAC020202020202020202020202020202020202020
            C6510411B34F3D738C146FD94E3227AB1D7D0B63F2CFBF92EB118ED9CBB29A9A
            1A685B0C2DD8C6F40B169CAC372CA8808328A202020202230808080808083055
            4654565011440404040404040404040404040404040404040415EED06E15B6FD
            1976ADA199D4F550405D1CCC0D2E6F23246EC8E8B32B0F34B15A7B53BAE978B5
            1516AB733BCDF2474F518E2384B9BE27ED7B0976DCFC9F9AB3A7537CE7A5B3B2
            3D7D5BAA2C35B3DD4B3BFB7CBB4D481B1AF85D187B5EFF00C21C39DD8E3CF857
            0B66DA0EDABB3FADB8B68995E62649FBAACA88DD0D3BBFFEC936E33E5BB0AE0D
            A91D75DA1D97485342FAC0FA8AAA9CFC3D2458DCE6B71B9E4B886B5A370E4A85
            6AE0D23DADD8B53DD61B651D156433CB0BE6EF266C7DD8EEC80E6EE648E27AF0
            7185704C42E35F5469282A6AFBA7CFF0F13E5EE63E5EFD8DDDB5A3D4E3014661
            05A07597F5B6C8EB9FC0496F2D99D098A43BB3B5AD76E63B6B32DF163A75459C
            252E9A7AC5762C373B7D3D6BA2FDD99E36C85BF42E05589C261E155BA7A8750F
            6E1F65DBA18E96DB6C9A29268E9A36C2D0CA30D925C86705CE99C199EB8FA2B5
            9F725E3109AD0D4D15276F5A8E289A1914915590D18F99F2534AEE3CB25C5224
            B43A7B7BD33434F6FA0D476F6328EE34F52D8E4A889A18F76419237E4705D1C9
            182DC8532B57A659AB5D7CD29455CF6F74FB9D0C5339BFC26A210E23CBA6E525
            1F9BBB3FB97699B2E36DD141EF60D935786B60CB1C5A580EE9F187384780D1CF
            0A35984BEA7BE5DFB40D1705DE5859F6869B95F15D228DAFD8FA7AD0DEEEA1AD
            073B7EEB6C8DCF1CBB202BD7270D1DA7F6814DAC6DF6AA7A3B7C9482DEC3357F
            783F74F786B044C78FC0739C90DCF878CF01ED7845DC2B60D451688D3EF929E9
            29EDF490C1F1A5FF0076CEFC0EF4C9BF635AE8DB1723272E3D56B6F29E974EC6
            21A0B5F68975A2154C7C621A9A7B748640FEFA36D4B5CCDAF01A1E4B067C2112
            5EF0B28202020202020202020202020202020202020C22304E3941C6FEF2B460
            663A477CC7187480F90F368F5E32BA75FCA3AD8C6B1A18C1868E0058CABE9441
            159456110404194045101061105505144040402848808328A202020202020202
            020202020202020202020202085D696F6DC7495E688807BEA39C373D376C25A7
            F2761161E4DA5ACDDABD668CA7FB0EF14D4D666F7B1D3D3C8C63652C6B9CC78C
            F74F1CC9B80CBBD0F0B52B88CA16C3574CDEC2351535147DDD70AC6C57568397
            08A59636371CFCA621B78E3AFBACC9ED0B758DFF00D44A5EEB463E9A38DB1CF3
            EA9778CCBE2C4873B062290BBC20BB01BF45ADBC90BB5AA27CFDA0E80A2BB41B
            A0FEAFC5DDD3CFB66619990CC73C6584E199FD149ED3D266110527F481F8785A
            D85B536E326DE81EE2D192D1EBF75E5E84A94EA4B74F5464F0C8E7B6391AF746
            7120690769F43E8A651A686E76DAF63DF4355155322798E4742F6C81AF6F569D
            A4E08F4481B6A6A22A6A796A263B61858E92477A35A324FE81591E5DD88595D2
            1BC6AAA969F88B94EE8A2247E00EEF2570779EE91DB4FF00815F4B643B2FB68D
            37DB8DFABEE8F753514901677BDDBDDE3922A677CAC0E760F74EE54A9770F69D
            AD69B5D496FD3BA6629AA26EF04AC7B98E8F2F90187989E1AEDACDF92F3C0FE6
            AD227242E567ED0A18F567FD9FD051BA336F81F47475B2B8383A6A5A70E6EE63
            790DC30F9F3ECA769879FE81ED3EA74B54DF29753C5512DC2A650FEE62652C4E
            6543439B2EFF00DD1E48681F3018FD6E38263947D86CFDA25A744D45F2CF3D45
            2C2EAA8416D3C40CB342D8DDFB467697BA26BDF8C7CA792B7D2F1293D5BAFEBF
            B40A0B4E9CB2D13FE36791AFA96873240F7805AD71746006C6CCEF7EE031E9C2
            CC579FD242E707F47BD246389D3D455C4FD8D33D341233B9EF4B03642DDD197E
            1C47AACCB7BA10FA234444DED26B292BEDD58EA1B1974D6CACA80F6B37C72B3E
            1CF7A30D93C049033F50B5CE19997B62CA080808080808080808080808080808
            0808083073E4892F8EE9A5C1CEE71E5E5F5C2B94C3ED46844101010651440404
            0404041844101065158446111945110456514404040404040404040404040404
            0404040404041A6B20EFE96683FEF58E67FE218492158ECB34F5CF4F688A1B55
            CD823AD85D3BA48DAE0E003E77BDBC8C8F948411769ECD3BB975A50D6ED167D4
            33B25A4EEB1BDA0B497E4638DAFE884B9E87B3BD62DD353E93ABBDC0EB177429
            695F1C38A8EE37372D79396FEEC39A3EBC929932ECD43A16CF595BA6ADB10B85
            254DA223F665DA9F2E646D83BBCC3512821F991A303A67C5CE50E513A77B3AFB
            2BB4B86E0CBACD75969A9A596E52D460CC26A9CB21DC781B5CC6BB039231E412
            166565D23D9CDBF4CDF2F776A6AB9AA1D7A93BC9239B0761DEE7BBC5D5F973FA
            9E709EB08DFA23405A747C75D15B669A48AB64126C98B4EC0D186B5BB5ADCF5E
            A79413B72B7535CA827A0AA0E34F52C31CA1AE730ED775C398438205B2D9476C
            B7C141451F774B4EC0C89992781EA4F249EA49EA92908AB9E82D1F74BAFDAB70
            B5C5535E435AE964DC77067CBB9B9DAEC7B856249848DBAC766B66EFB3E860A3
            2FF9CC11B232EFF11681949922186D82C6CBA3AECCB7D3B6E8FE1F5C226098F1
            B79931BBE5E3AF44C986D7DAEDAFA9F897D242EA9FFBF31B4BF8FEF6329930E9
            515F2C8628F3B181B9E4E06394CA61F68A202020202020202020202020202020
            2020202020C2022080808328A22308A22328A20202020C221CA020CA2B088220
            8011594510101010101010101010101010101010101010101010101010101010
            1010101010101010101010101010101010101010101010101010101010106110
            40443CD14419451063CD002208328A202020202020C20223088CA28106501144
            0404040404040404040404040404040404040404040404040404040404040404
            04040404040404040404040404040404040404040404041FFFD9}
          mmHeight = 29369
          mmLeft = 94986
          mmTop = 23019
          mmWidth = 62971
          BandType = 5
          GroupNo = 2
        end
        object ppShape2: TppShape
          UserName = 'Shape8'
          Brush.Style = bsClear
          mmHeight = 27781
          mmLeft = 93134
          mmTop = 17992
          mmWidth = 101600
          BandType = 5
          GroupNo = 1
        end
        object ppShape3: TppShape
          UserName = 'Shape1'
          Brush.Style = bsClear
          mmHeight = 27781
          mmLeft = 29369
          mmTop = 17992
          mmWidth = 30427
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape9'
          Brush.Style = bsClear
          mmHeight = 27781
          mmLeft = 60325
          mmTop = 17992
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object ppShape6: TppShape
          UserName = 'Shape5'
          Brush.Style = bsClear
          mmHeight = 27781
          mmLeft = 2117
          mmTop = 17992
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
        object ppLabel62: TppLabel
          UserName = 'Label20'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 147109
          mmTop = 29104
          mmWidth = 13494
          BandType = 5
          GroupNo = 1
        end
        object ppLabel63: TppLabel
          UserName = 'Label5'
          Caption = 'Recebedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 98954
          mmTop = 41010
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
        end
        object ppLine45: TppLine
          UserName = 'Line1'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 94456
          mmTop = 39952
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLabel64: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Recebi os '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 96044
          mmTop = 19050
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppLabel65: TppLabel
          UserName = 'Label11'
          Caption = 'Autentica'#231#227'o do Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 157427
          mmTop = 37571
          mmWidth = 29104
          BandType = 5
          GroupNo = 1
        end
        object ppLabel66: TppLabel
          UserName = 'Label14'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 147109
          mmTop = 20108
          mmWidth = 7408
          BandType = 5
          GroupNo = 1
        end
        object ppLabel67: TppLabel
          UserName = 'Label28'
          Caption = 'Remetemos para'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 62442
          mmTop = 19315
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object ppLine46: TppLine
          UserName = 'Line4'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 62177
          mmTop = 26723
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object ppLabel68: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'os comprovantes '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 64558
          mmTop = 28046
          mmWidth = 22490
          BandType = 5
          GroupNo = 1
        end
        object ppLabel69: TppLabel
          UserName = 'Label30'
          Caption = 'Remetente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 40746
          mmWidth = 13494
          BandType = 5
          GroupNo = 1
        end
        object ppLine47: TppLine
          UserName = 'Line5'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 61913
          mmTop = 39688
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object ppLabel70: TppLabel
          UserName = 'Label22'
          Caption = 'Solicitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 37306
          mmTop = 41010
          mmWidth = 13229
          BandType = 5
          GroupNo = 1
        end
        object ppLine48: TppLine
          UserName = 'Line3'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 33073
          mmTop = 39688
          mmWidth = 22490
          BandType = 5
          GroupNo = 1
        end
        object ppLabel71: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'Recebemos o cheque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 30692
          mmTop = 19579
          mmWidth = 28046
          BandType = 5
          GroupNo = 1
        end
        object ppLabel72: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Unidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 3704
          mmTop = 19579
          mmWidth = 23283
          BandType = 5
          GroupNo = 1
        end
        object ppLine49: TppLine
          UserName = 'Line24'
          Weight = 0.750000000000000000
          mmHeight = 3704
          mmLeft = 3969
          mmTop = 39688
          mmWidth = 23283
          BandType = 5
          GroupNo = 1
        end
        object ppLabel73: TppLabel
          UserName = 'Label3'
          Caption = 'Solicitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 8467
          mmTop = 41010
          mmWidth = 13229
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VL_PAGTO'
          DataPipeline = ppBDEPipeline1
          DisplayFormat = '#.0,0;-#.0,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3969
          mmLeft = 125413
          mmTop = 28310
          mmWidth = 19579
          BandType = 5
          GroupNo = 1
        end
        object ppLabel74: TppLabel
          UserName = 'Label15'
          Caption = 'R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 120386
          mmTop = 28310
          mmWidth = 4498
          BandType = 5
          GroupNo = 1
        end
        object ppDBText39: TppDBText
          UserName = 'DBText11'
          DataField = 'PRODUTO'
          DataPipeline = ppBDEimp_rd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEimp_rd'
          mmHeight = 3175
          mmLeft = 6879
          mmTop = 29369
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLabel75: TppLabel
          UserName = 'Label35'
          AutoSize = False
          Caption = 'Solicitante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 3704
          mmTop = 22754
          mmWidth = 23283
          BandType = 5
          GroupNo = 1
        end
        object ppLabel76: TppLabel
          UserName = 'Label36'
          AutoSize = False
          Caption = 'solicitado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 30692
          mmTop = 22490
          mmWidth = 28046
          BandType = 5
          GroupNo = 1
        end
        object ppLabel77: TppLabel
          UserName = 'Label37'
          AutoSize = False
          Caption = 'de despesas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 64558
          mmTop = 30956
          mmWidth = 22490
          BandType = 5
          GroupNo = 1
        end
        object ppLabel78: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = 'comprovantes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 96044
          mmTop = 22225
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppLabel79: TppLabel
          UserName = 'Label39'
          AutoSize = False
          Caption = 'das despesas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 96044
          mmTop = 25400
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppDBText40: TppDBText
          UserName = 'DBText20'
          DataField = 'DT_SOLIC_PAGTO'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3175
          mmLeft = 155046
          mmTop = 20108
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppLabel80: TppLabel
          UserName = 'Label26'
          AutoSize = False
          Caption = 'AUTORIZAMOS O DEBITO EM NOSSA CONTA CORRENTE NR.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 17992
          mmTop = 9260
          mmWidth = 80698
          BandType = 5
          GroupNo = 1
        end
        object ppLine50: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 3969
          mmLeft = 160867
          mmTop = 31750
          mmWidth = 29898
          BandType = 5
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText5'
          DataField = 'calcConta'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3175
          mmLeft = 99219
          mmTop = 9260
          mmWidth = 14817
          BandType = 5
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'DBText6'
          DataField = 'calcAgencia'
          DataPipeline = ppBDEPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipeline1'
          mmHeight = 3175
          mmLeft = 135467
          mmTop = 9260
          mmWidth = 10583
          BandType = 5
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label23'
          Caption = ' DA AGENCIA '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 115094
          mmTop = 9260
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
        object ppLabel2: TppLabel
          UserName = 'Label40'
          Caption = ',   REFERENTE AO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 146844
          mmTop = 9260
          mmWidth = 25400
          BandType = 5
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label41'
          Caption = 
            ' PAGAMENTO ABAIXO DISCRIMINADO POR CONTA DE DU PONT DO BRASIL S/' +
            'A. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 44715
          mmTop = 13494
          mmWidth = 111083
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object qry_imp_total_: TQuery
    AutoCalcFields = False
    OnCalcFields = qry_imp_total_CalcFields
    DatabaseName = 'DBbroker'
    SQL.Strings = (
      
        'SELECT SP.NR_RD, P.CD_PRODUTO, P.CD_UNID_NEG, P.CD_GRUPO, P.CD_C' +
        'LIENTE, SP.CD_FAVORECIDO,SUM(VL_PAGTO)  VL_PAGTO, B.CD_BANCO, A.' +
        'NM_GRUPO,  B1.NR_CONTA, B1.CD_AGENCIA'
      
        ' FROM  TSOLIC_PAGTO SP (NOLOCK), TPROCESSO P (NOLOCK), TBANCO B ' +
        '(NOLOCK), TBANCO B1 (NOLOCK), TFAVORECIDO F (NOLOCK), TAREA A (N' +
        'OLOCK), TCLIENTE_SERVICO CS (NOLOCK)'
      'WHERE  SP.CD_STATUS  = '#39'0'#39'                    AND'
      '       SP.TP_DESTINO = '#39'5'#39'                    AND'
      '       SP.NR_PROCESSO = P.NR_PROCESSO         AND'
      '       F.CD_FAVORECIDO = SP.CD_FAVORECIDO     AND'
      '       B.CD_BANCO =* F.CD_BANCO               AND'
      '       A.CD_AREA = P.CD_AREA                  AND'
      '       CS.CD_CLIENTE = P.CD_CLIENTE           AND'
      '       CS.CD_UNID_NEG = P.CD_UNID_NEG         AND'
      '       CS.CD_PRODUTO  = P.CD_PRODUTO          AND'
      '       CS.CD_SERVICO  = P.CD_SERVICO          AND'
      '       B1.CD_BANCO = CS.CD_BANCO_DEB_CC       AND'
      ''
      ''
      '')
    Left = 272
    Top = 248
    object qry_imp_total_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_imp_total_VL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      currency = True
    end
    object qry_imp_total_calc_ValorExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_ValorExtenso'
      Size = 255
      Calculated = True
    end
    object qry_imp_total_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_imp_total_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_total_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_total_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_imp_total_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_imp_total_NR_RD: TStringField
      FieldName = 'NR_RD'
      Size = 8
    end
    object qry_imp_total_DT_SOLIC_PAGTO: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DT_SOLIC_PAGTO'
      Calculated = True
    end
    object qry_imp_total_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      EditMask = '999.999-9;0;_'
      Size = 10
    end
    object qry_imp_total_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      EditMask = '9999-9;0;_'
      Size = 5
    end
    object qry_imp_total_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Size = 3
    end
    object qry_imp_total_calcConta: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcConta'
      Size = 10
      Calculated = True
    end
    object qry_imp_total_calcAgencia: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAgencia'
      Size = 6
      Calculated = True
    end
  end
  object ds_imp_total: TDataSource
    DataSet = qry_imp_total_
    Left = 272
    Top = 232
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = ds_imp_total
    UserName = 'imp_rd1'
    Left = 272
    Top = 216
    object ppBDEPipeline1ppField1: TppField
      FieldAlias = 'CD_FAVORECIDO'
      FieldName = 'CD_FAVORECIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField2: TppField
      FieldAlias = 'VL_PAGTO'
      FieldName = 'VL_PAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField3: TppField
      FieldAlias = 'calc_ValorExtenso'
      FieldName = 'calc_ValorExtenso'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = 'CD_GRUPO'
      FieldName = 'CD_GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = 'CD_BANCO'
      FieldName = 'CD_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = 'NR_RD'
      FieldName = 'NR_RD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'DT_SOLIC_PAGTO'
      FieldName = 'DT_SOLIC_PAGTO'
      FieldLength = 10
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object ppBDEPipeline1ppField11: TppField
      FieldAlias = 'NR_CONTA'
      FieldName = 'NR_CONTA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppBDEPipeline1ppField12: TppField
      FieldAlias = 'CD_AGENCIA'
      FieldName = 'CD_AGENCIA'
      FieldLength = 5
      DisplayWidth = 10
      Position = 11
    end
    object ppBDEPipeline1ppField13: TppField
      FieldAlias = 'NM_GRUPO'
      FieldName = 'NM_GRUPO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 12
    end
    object ppBDEPipeline1ppField14: TppField
      FieldAlias = 'calcConta'
      FieldName = 'calcConta'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppBDEPipeline1ppField15: TppField
      FieldAlias = 'calcAgencia'
      FieldName = 'calcAgencia'
      FieldLength = 6
      DisplayWidth = 6
      Position = 14
    end
  end
  object qry_integ_rd_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT  SP.VL_PAGTO, SP.NR_RD, SP.NR_LANCAMENTO, SP.CD_ITEM, SP.' +
        'NR_PROCESSO,'
      '      ( CASE'
      
        '       WHEN ISNULL((SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FR' +
        'OM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND T' +
        'P_REFERENCIA = '#39'08'#39'), '#39#39') = '#39#39
      
        '         THEN (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TR' +
        'EF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REF' +
        'ERENCIA = '#39'01'#39')'
      
        '         ELSE (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TR' +
        'EF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REF' +
        'ERENCIA = '#39'08'#39')'
      '       END ) CD_REFERENCIA ,'
      '       (SUBSTRING(SP.NR_PROCESSO, 5, 10)) PROCESSO,'
      
        '       (SELECT NM_ITEM FROM TITEM (NOLOCK)  WHERE CD_ITEM = SP.C' +
        'D_ITEM) NM_ITEM,'
      '        F.NM_FAVORECIDO,'
      '        SP.DT_PAGTO,'
      '        CS.CD_BANCO_DEB_CC'
      ''
      
        'FROM    TPROCESSO P (NOLOCK), TSOLIC_PAGTO SP (NOLOCK), TFAVOREC' +
        'IDO F (NOLOCK), TCLIENTE_SERVICO  CS (NOLOCK)'
      ''
      'WHERE   SP.CD_STATUS     = '#39'7'#39'             AND'
      '        SP.TP_DESTINO    = '#39'5'#39'             AND'
      '        SP.NR_PROCESSO   = P.NR_PROCESSO   AND'
      '        SP.CD_FAVORECIDO = F.CD_FAVORECIDO AND'
      '        CS.CD_CLIENTE    =* P.CD_CLIENTE   AND'
      '        CS.CD_SERVICO    =* P.CD_SERVICO   AND'
      '        CS.CD_UNID_NEG   = :UNIDADE        AND'
      '        CS.CD_PRODUTO    = :PRODUTO        AND'
      '')
    Left = 189
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'UNIDADE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRODUTO'
        ParamType = ptInput
      end>
  end
  object ds_integ_rd: TDataSource
    DataSet = qry_integ_rd_
    Left = 189
    Top = 296
  end
  object ds_integ_rd2: TDataSource
    DataSet = qry_integ_rd2
    Left = 125
    Top = 296
  end
  object qry_integ_rd2: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT FC.VL_ITEM AS VL_PAGTO, SP.NR_RD, SP.NR_LANCAMENTO, FC.CD' +
        '_ITEM, FC.NR_PROCESSO ,'
      '          ( CASE'
      
        '       WHEN ISNULL((SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FR' +
        'OM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND T' +
        'P_REFERENCIA = '#39'08'#39'), '#39#39') = '#39#39
      
        '         THEN (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TR' +
        'EF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REF' +
        'ERENCIA = '#39'01'#39')'
      
        '         ELSE (SELECT TOP 1(RTRIM(LTRIM(CD_REFERENCIA))) FROM TR' +
        'EF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = P.NR_PROCESSO AND TP_REF' +
        'ERENCIA = '#39'08'#39')'
      '       END ) CD_REFERENCIA ,'
      '       (SUBSTRING(FC.NR_PROCESSO, 5, 10)) PROCESSO,'
      
        '       (SELECT NM_ITEM FROM TITEM (NOLOCK)  WHERE CD_ITEM = FC.C' +
        'D_ITEM) NM_ITEM,'
      
        '       (SELECT NM_BCO FROM TBCO WHERE CD_BCO = B.NR_BANCO) NM_FA' +
        'VORECIDO,'
      '        FC.DT_LANCAMENTO AS DT_PAGTO,'
      '        CS.CD_BANCO_DEB_CC'
      ''
      'FROM    TPROCESSO P (NOLOCK),'
      '        TFATURAMENTO_CC_CLIENTE FC (NOLOCK),'
      '        TITEM I (NOLOCK),'
      '        TBANCO B (NOLOCK),'
      '        TCLIENTE_SERVICO  CS (NOLOCK),'
      '        TSOLIC_PAGTO SP'
      ''
      'WHERE   FC.NR_PROCESSO   = P.NR_PROCESSO      AND'
      '        FC.NR_PROCESSO   = SP.NR_PROCESSO     AND'
      '        FC.CD_ITEM       = SP.CD_ITEM         AND  '
      '        SP.CD_STATUS = '#39'0'#39'                    AND '
      '        CS.CD_CLIENTE    = P.CD_CLIENTE       AND'
      '        CS.CD_SERVICO    = P.CD_SERVICO       AND'
      '        I.CD_ITEM        = FC.CD_ITEM         AND'
      '        I.IN_ITEM_DI     = '#39'1'#39'                AND'
      '        B.CD_BANCO       = CS.CD_BANCO_DEB_CC AND')
    Left = 125
    Top = 312
  end
end
