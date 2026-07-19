object frm_gestao_po: Tfrm_gestao_po
  Left = 281
  Top = 104
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Gest'#227'o de Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_manut_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 51
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    TabStop = True
    DesignSize = (
      742
      51)
    object btn_salvar: TSpeedButton
      Left = 44
      Top = 4
      Width = 37
      Height = 43
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
      Left = 83
      Top = 4
      Width = 39
      Height = 43
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
      OnClick = btn_cancelarClick
    end
    object btn_sair: TSpeedButton
      Left = 698
      Top = 4
      Width = 39
      Height = 43
      Hint = 'Sair'
      Anchors = [akTop, akRight]
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
      OnClick = btn_sairClick
    end
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 39
      Height = 43
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
    object btn_proc_realiza: TSpeedButton
      Left = 172
      Top = 4
      Width = 39
      Height = 43
      Hint = 'Realiza'#231#227'o por Processo - <CTRL+F2>'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_proc_realizaClick
    end
    object btn_excluir: TSpeedButton
      Left = 122
      Top = 4
      Width = 38
      Height = 43
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
    object btn_gestao_po: TSpeedButton
      Left = 211
      Top = 4
      Width = 41
      Height = 43
      Hint = 'Manuten'#231#227'o do PO'
      Enabled = False
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_gestao_poClick
    end
  end
  object pgctrl_gestao_po: TPageControl
    Left = 0
    Top = 51
    Width = 742
    Height = 432
    ActivePage = ts_po
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_gestao_poChange
    OnChanging = pgctrl_gestao_poChanging
    object ts_po: TTabSheet
      Caption = '  PO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object Bevel4: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 404
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object Shape8: TShape
        Left = 505
        Top = 33
        Width = 194
        Height = 20
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object Shape7: TShape
        Left = 505
        Top = 54
        Width = 194
        Height = 35
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object Label2: TLabel
        Left = 23
        Top = 21
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
        Left = 430
        Top = 33
        Width = 25
        Height = 23
        Enabled = False
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
      object Label3: TLabel
        Left = 24
        Top = 65
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
      object btn_co_produto: TSpeedButton
        Left = 430
        Top = 78
        Width = 25
        Height = 23
        Enabled = False
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
      object Label14: TLabel
        Left = 23
        Top = 150
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
        Left = 429
        Top = 163
        Width = 25
        Height = 23
        Enabled = False
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
      object Label15: TLabel
        Left = 23
        Top = 192
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
      object btn_co_servico: TSpeedButton
        Left = 429
        Top = 205
        Width = 25
        Height = 23
        Enabled = False
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
        OnClick = btn_co_servicoClick
      end
      object Label16: TLabel
        Left = 23
        Top = 235
        Width = 66
        Height = 13
        Caption = 'Modalidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 23
        Top = 278
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
      object btn_co_exportador: TSpeedButton
        Left = 429
        Top = 290
        Width = 25
        Height = 23
        Enabled = False
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
        OnClick = btn_co_exportadorClick
      end
      object Label18: TLabel
        Left = 24
        Top = 108
        Width = 18
        Height = 13
        Caption = 'PO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_referencia: TSpeedButton
        Left = 160
        Top = 121
        Width = 25
        Height = 23
        Enabled = False
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
        OnClick = btn_co_referenciaClick
      end
      object lbl_dt_ent_arm: TLabel
        Left = 205
        Top = 108
        Width = 89
        Height = 13
        Caption = 'Data do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 314
        Top = 108
        Width = 89
        Height = 13
        Caption = 'Hora do Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_area: TSpeedButton
        Left = 677
        Top = 290
        Width = 25
        Height = 23
        Enabled = False
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
        OnClick = btn_co_areaClick
      end
      object Label31: TLabel
        Left = 504
        Top = 278
        Width = 27
        Height = 13
        Caption = #193'rea'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 508
        Top = 37
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object btn_atz_servico: TSpeedButton
        Left = 455
        Top = 205
        Width = 25
        Height = 23
        Hint = 
          'Atualiza FollowUp com esse servi'#231'o. Esta a'#231#227'o ir'#225' limpar as data' +
          's de realiza'#231#227'o existentes hoje.'
        Enabled = False
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF33339993707399933333773337F3777FF3399933000339
          9933377333777F3377F3399333707333993337733337333337FF993333333333
          399377F33333F333377F993333303333399377F33337FF333373993333707333
          333377F333777F333333993333101333333377F333777F3FFFFF993333000399
          999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
          99933773FF777F3F777F339993707399999333773F373F77777F333999999999
          3393333777333777337333333999993333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_atz_servicoClick
      end
      object lbl_atz_servico: TLabel
        Left = 68
        Top = 192
        Width = 349
        Height = 13
        Caption = '(clique o bot'#227'o ao lado da consulta para atualizar o followup)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object edt_nm_unid_neg: TEdit
        Left = 57
        Top = 34
        Width = 371
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 9
      end
      object edt_nm_produto: TEdit
        Left = 57
        Top = 78
        Width = 371
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 10
      end
      object edt_nm_cliente: TEdit
        Left = 84
        Top = 163
        Width = 343
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 11
      end
      object edt_nm_servico: TEdit
        Left = 84
        Top = 206
        Width = 343
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 12
      end
      object edt_nm_modalidade: TEdit
        Left = 23
        Top = 249
        Width = 190
        Height = 22
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkSoft
        BevelOuter = bvNone
        Color = clMenu
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 13
      end
      object edt_nm_exportador: TEdit
        Left = 84
        Top = 291
        Width = 343
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 14
      end
      object msk_nr_referencia: TMaskEdit
        Left = 24
        Top = 121
        Width = 134
        Height = 21
        CharCase = ecUpperCase
        Enabled = False
        TabOrder = 2
        OnClick = msk_nr_referenciaClick
        OnExit = msk_nr_referenciaExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object Panel2: TPanel
        Left = 504
        Top = 90
        Width = 195
        Height = 138
        BevelInner = bvLowered
        Color = clSilver
        TabOrder = 19
        object Label21: TLabel
          Left = 20
          Top = 25
          Width = 98
          Height = 13
          Caption = 'Data de Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 21
          Top = 150
          Width = 98
          Height = 13
          Caption = 'Hora de Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 21
          Top = 69
          Width = 98
          Height = 13
          Caption = 'Hora da Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
      end
      object msk_hr_pedido: TDateTimePicker
        Left = 314
        Top = 121
        Width = 87
        Height = 21
        Date = 37572.000000000000000000
        Time = 37572.000000000000000000
        Enabled = False
        Kind = dtkTime
        TabOrder = 4
        OnChange = msk_hr_pedidoChange
      end
      object dbedt_cd_cliente: TDBEdit
        Left = 23
        Top = 163
        Width = 62
        Height = 21
        DataField = 'CD_CLIENTE'
        DataSource = datm_gestao_po.ds_processo
        Enabled = False
        TabOrder = 5
        OnChange = btn_co_clienteClick
        OnExit = dbedt_cd_clienteExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object dbedt_cd_servico: TDBEdit
        Left = 23
        Top = 206
        Width = 62
        Height = 21
        DataField = 'CD_SERVICO'
        DataSource = datm_gestao_po.ds_processo
        TabOrder = 6
        OnChange = btn_co_servicoClick
        OnExit = dbedt_cd_servicoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object dbedt_cd_exportador: TDBEdit
        Left = 23
        Top = 291
        Width = 62
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_gestao_po.ds_processo
        Enabled = False
        TabOrder = 7
        OnChange = btn_co_exportadorClick
        OnExit = dbedt_cd_exportadorExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_dt_pedido: TDateEdit
        Left = 205
        Top = 121
        Width = 90
        Height = 21
        DefaultToday = True
        DialogTitle = 'Selecione uma Data'
        Enabled = False
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 3
        Text = '01/01/2005'
        OnChange = edt_dt_pedidoChange
      end
      object msk_dt_abertura: TDateEdit
        Left = 525
        Top = 128
        Width = 103
        Height = 21
        Ctl3D = True
        DefaultToday = True
        DialogTitle = 'Selecione uma Data'
        DirectInput = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        NumGlyphs = 2
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        YearDigits = dyFour
        TabOrder = 17
        Text = '01/01/2005'
        OnChange = edt_dt_pedidoChange
      end
      object msk_hr_abertura: TDateTimePicker
        Left = 525
        Top = 172
        Width = 103
        Height = 21
        Date = 37572.000000000000000000
        Time = 37572.000000000000000000
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Kind = dtkTime
        ParentColor = True
        ParentFont = False
        TabOrder = 18
        OnChange = msk_hr_pedidoChange
      end
      object Panel4: TPanel
        Left = 603
        Top = 130
        Width = 23
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 20
      end
      object Panel5: TPanel
        Left = 605
        Top = 174
        Width = 21
        Height = 17
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 21
      end
      object msk_nr_processo: TMaskEdit
        Left = 518
        Top = 66
        Width = 124
        Height = 21
        TabStop = False
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 16
        OnChange = msk_nr_processoChange
      end
      object msk_cd_unid_neg: TMaskEdit
        Left = 24
        Top = 34
        Width = 34
        Height = 21
        Enabled = False
        EditMask = '!99;0; '
        MaxLength = 2
        TabOrder = 0
        OnChange = btn_co_unid_negClick
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object msk_cd_produto: TMaskEdit
        Left = 24
        Top = 78
        Width = 34
        Height = 21
        Enabled = False
        EditMask = '!99;0; '
        MaxLength = 2
        TabOrder = 1
        OnChange = btn_co_produtoClick
        OnExit = msk_cd_produtoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object edt_nm_area: TEdit
        Left = 534
        Top = 291
        Width = 141
        Height = 21
        TabStop = False
        Color = clMenu
        ReadOnly = True
        TabOrder = 15
      end
      object dbedt_cd_area: TDBEdit
        Left = 503
        Top = 291
        Width = 32
        Height = 21
        DataField = 'CD_AREA'
        DataSource = datm_gestao_po.ds_processo
        TabOrder = 8
        OnChange = btn_co_areaClick
        OnExit = dbedt_cd_areaExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
    end
    object ts_gestao: TTabSheet
      Caption = 'Gest'#227'o'
      object pgctrl_gestao: TPageControl
        Left = 0
        Top = 0
        Width = 734
        Height = 404
        ActivePage = ts_po_item
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_gestaoChange
        object ts_basica: TTabSheet
          Caption = 'B'#225'sica'
          object Bevel2: TBevel
            Left = 0
            Top = 0
            Width = 726
            Height = 376
            Align = alClient
            Shape = bsFrame
            Style = bsRaised
          end
          object Shape5: TShape
            Left = 359
            Top = 10
            Width = 358
            Height = 337
            Brush.Color = clBtnFace
            Pen.Color = clGray
          end
          object Label4: TLabel
            Left = 19
            Top = 49
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contato'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_contato: TSpeedButton
            Left = 317
            Top = 61
            Width = 25
            Height = 23
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
            OnClick = btn_co_contatoClick
          end
          object Label5: TLabel
            Left = 20
            Top = 87
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Analista Indai'#225
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_anl_indaia: TSpeedButton
            Left = 317
            Top = 99
            Width = 25
            Height = 23
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
            OnClick = btn_co_anl_indaiaClick
          end
          object Label6: TLabel
            Left = 373
            Top = 18
            Width = 131
            Height = 13
            Alignment = taRightJustify
            Caption = 'Local de Desembarque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_porto: TSpeedButton
            Left = 679
            Top = 30
            Width = 25
            Height = 23
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
            OnClick = btn_co_portoClick
          end
          object Label7: TLabel
            Left = 373
            Top = 56
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Navio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_navio: TSpeedButton
            Left = 679
            Top = 68
            Width = 25
            Height = 23
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
            OnClick = btn_co_navioClick
          end
          object Label8: TLabel
            Left = 373
            Top = 97
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Viagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_nr_viagem: TSpeedButton
            Left = 415
            Top = 109
            Width = 25
            Height = 23
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
            OnClick = btn_nr_viagemClick
          end
          object Label9: TLabel
            Left = 19
            Top = 128
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 373
            Top = 137
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nr V'#244'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 373
            Top = 184
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consolidado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label23: TLabel
            Left = 19
            Top = 248
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nr Ordem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 373
            Top = 200
            Width = 16
            Height = 13
            Alignment = taRightJustify
            Caption = 'BL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label25: TLabel
            Left = 373
            Top = 245
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Urgente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 373
            Top = 271
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seguro/Hermes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label27: TLabel
            Left = 19
            Top = 302
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'INCOTERM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 373
            Top = 296
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cancelado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label32: TLabel
            Left = 19
            Top = 165
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
          object btn_co_importador: TSpeedButton
            Left = 317
            Top = 178
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
            OnClick = btn_co_importadorClick
          end
          object Shape6: TShape
            Left = 359
            Top = 332
            Width = 358
            Height = 35
            Brush.Color = clBtnFace
            Pen.Color = clGray
          end
          object btnRepassaItens: TSpeedButton
            Left = 575
            Top = 337
            Width = 138
            Height = 25
            Caption = 'Repassar para os Itens'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
              333333333333337FF3333333333333903333333333333377FF33333333333399
              03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
              99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
              99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
              03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
              33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
              33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
              3333777777333333333333333333333333333333333333333333}
            NumGlyphs = 2
            OnClick = btnRepassaItensClick
          end
          object lbl_referencia_3: TLabel
            Left = 19
            Top = 8
            Width = 18
            Height = 13
            Caption = 'PO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_processo_3: TLabel
            Left = 147
            Top = 8
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
          object edt_nm_contato: TEdit
            Left = 80
            Top = 62
            Width = 236
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 17
          end
          object edt_nm_anl_indaia: TEdit
            Left = 80
            Top = 100
            Width = 236
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 18
          end
          object edt_nm_porto: TEdit
            Left = 415
            Top = 31
            Width = 263
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 20
          end
          object edt_nm_navio: TEdit
            Left = 415
            Top = 69
            Width = 263
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 21
          end
          object dbedt_nr_viagem: TDBEdit
            Left = 373
            Top = 110
            Width = 42
            Height = 21
            DataField = 'NR_VIAGEM'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 8
            OnExit = dbedt_nr_viagemExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_nr_voo: TDBEdit
            Left = 373
            Top = 150
            Width = 181
            Height = 21
            DataField = 'NR_VOO'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 9
            OnExit = dbedt_nr_vooExit
          end
          object dbedt_nr_ordem: TDBEdit
            Left = 19
            Top = 261
            Width = 181
            Height = 21
            DataField = 'NR_ORDEM'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 4
          end
          object dbedt_nr_bl: TDBEdit
            Left = 373
            Top = 213
            Width = 181
            Height = 21
            DataField = 'NR_CONHECIMENTO'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 11
          end
          object dblckpbox_pedido: TDBLookupComboBox
            Left = 19
            Top = 141
            Width = 182
            Height = 21
            DataField = 'CD_TP_PEDIDO'
            DataSource = datm_gestao_po.ds_processo
            KeyField = 'CD_PEDIDO'
            ListField = 'NM_PEDIDO'
            ListSource = datm_gestao_po.dsTipoPedido
            TabOrder = 2
          end
          object dblckpbox_incoterm: TDBLookupComboBox
            Left = 123
            Top = 299
            Width = 78
            Height = 21
            DataField = 'CD_INCOTERM'
            DataSource = datm_gestao_po.ds_processo
            KeyField = 'CODIGO'
            ListField = 'CODIGO;DESCRICAO'
            ListSource = datm_gestao_po.dsIncoterm
            TabOrder = 5
          end
          object dblckpbox_in_consolidado: TDBLookupComboBox
            Left = 471
            Top = 182
            Width = 84
            Height = 21
            DataField = 'IN_CONSOLIDADO'
            DataSource = datm_gestao_po.ds_processo
            DropDownRows = 2
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListFieldIndex = 2
            ListSource = datm_gestao_po.ds_yesno
            TabOrder = 10
          end
          object dblckpbox_in_urgente: TDBLookupComboBox
            Left = 471
            Top = 242
            Width = 84
            Height = 21
            DataField = 'IN_URGENTE'
            DataSource = datm_gestao_po.ds_processo
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_gestao_po.ds_yesno
            TabOrder = 12
          end
          object dblckpbox_in_seguro: TDBLookupComboBox
            Left = 471
            Top = 268
            Width = 84
            Height = 21
            DataField = 'IN_SEGURO'
            DataSource = datm_gestao_po.ds_processo
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_gestao_po.ds_yesno
            TabOrder = 13
          end
          object dbedt_in_cancelado: TDBEdit
            Left = 471
            Top = 294
            Width = 84
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'calcCancelado'
            DataSource = datm_gestao_po.ds_processo
            ReadOnly = True
            TabOrder = 22
          end
          object edt_nm_importador: TEdit
            Left = 80
            Top = 178
            Width = 236
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 19
          end
          object ckbox_dados_itens: TCheckBox
            Left = 369
            Top = 342
            Width = 190
            Height = 17
            Caption = 'Todos os Itens tem os dados acima'
            TabOrder = 14
            OnClick = ckbox_dados_itensClick
          end
          object dbedt_cd_contato: TDBEdit
            Left = 19
            Top = 62
            Width = 62
            Height = 21
            DataField = 'CD_ANALISTA_CLIENTE'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 0
            OnChange = btn_co_contatoClick
            OnExit = dbedt_cd_contatoExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_cd_anl_indaia: TDBEdit
            Left = 19
            Top = 100
            Width = 62
            Height = 21
            DataField = 'CD_ANALISTA_COMISSARIA'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 1
            OnChange = btn_co_anl_indaiaClick
            OnExit = dbedt_cd_anl_indaiaExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_cd_importador: TDBEdit
            Left = 19
            Top = 178
            Width = 62
            Height = 21
            DataField = 'CD_IMPORTADOR'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 3
            OnChange = btn_co_importadorClick
            OnExit = dbedt_cd_importadorExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_cd_porto: TDBEdit
            Left = 373
            Top = 31
            Width = 41
            Height = 21
            DataField = 'CD_LOCAL_DESEMBARQUE'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 6
            OnChange = btn_co_portoClick
            OnExit = dbedt_cd_portoExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_cd_navio: TDBEdit
            Left = 373
            Top = 69
            Width = 43
            Height = 21
            DataField = 'CD_EMBARCACAO'
            DataSource = datm_gestao_po.ds_processo
            TabOrder = 7
            OnChange = btn_co_navioClick
            OnExit = dbedt_cd_navioExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_nr_referencia_basica: TDBEdit
            Left = 19
            Top = 21
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_REFERENCIA'
            DataSource = datm_gestao_po.ds_processo
            ReadOnly = True
            TabOrder = 15
          end
          object dbetd_nr_processo_basica: TDBEdit
            Left = 147
            Top = 21
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcNrProcesso'
            DataSource = datm_gestao_po.ds_processo
            ReadOnly = True
            TabOrder = 16
          end
        end
        object ts_po_item: TTabSheet
          Caption = 'Itens'
          object Bevel3: TBevel
            Left = 0
            Top = 0
            Width = 726
            Height = 376
            Align = alClient
            Shape = bsFrame
            Style = bsRaised
          end
          object Shape2: TShape
            Left = 13
            Top = 63
            Width = 699
            Height = 123
            Brush.Color = 13092807
            Pen.Color = clGray
          end
          object Shape17: TShape
            Left = 17
            Top = 163
            Width = 88
            Height = 19
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape18: TShape
            Left = 104
            Top = 163
            Width = 604
            Height = 19
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape16: TShape
            Left = 17
            Top = 143
            Width = 88
            Height = 19
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape15: TShape
            Left = 17
            Top = 87
            Width = 88
            Height = 55
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape14: TShape
            Left = 17
            Top = 67
            Width = 88
            Height = 19
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape10: TShape
            Left = 104
            Top = 67
            Width = 604
            Height = 19
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape11: TShape
            Left = 104
            Top = 87
            Width = 604
            Height = 55
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape12: TShape
            Left = 104
            Top = 143
            Width = 604
            Height = 19
            Brush.Style = bsClear
            Pen.Color = clWhite
          end
          object Shape9: TShape
            Left = 13
            Top = 193
            Width = 699
            Height = 171
            Brush.Color = clBtnFace
            Pen.Color = clGray
          end
          object Shape1: TShape
            Left = 13
            Top = 11
            Width = 699
            Height = 45
            Brush.Color = 12500670
            Pen.Color = clGray
          end
          object Shape4: TShape
            Left = 663
            Top = 21
            Width = 39
            Height = 25
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Shape3: TShape
            Left = 615
            Top = 21
            Width = 39
            Height = 25
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label35: TLabel
            Left = 22
            Top = 201
            Width = 131
            Height = 13
            Alignment = taRightJustify
            Caption = 'Local de Desembarque'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_porto_item: TSpeedButton
            Left = 440
            Top = 213
            Width = 25
            Height = 23
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
            OnClick = btn_co_porto_itemClick
          end
          object Label36: TLabel
            Left = 22
            Top = 239
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Navio'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_navio_item: TSpeedButton
            Left = 440
            Top = 251
            Width = 25
            Height = 23
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
            OnClick = btn_co_navio_itemClick
          end
          object Label37: TLabel
            Left = 22
            Top = 280
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Viagem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_nr_viagem_item: TSpeedButton
            Left = 78
            Top = 292
            Width = 25
            Height = 23
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
            OnClick = btn_nr_viagem_itemClick
          end
          object Label40: TLabel
            Left = 22
            Top = 320
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nr V'#244'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label42: TLabel
            Left = 507
            Top = 201
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consolidado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label44: TLabel
            Left = 507
            Top = 238
            Width = 16
            Height = 13
            Alignment = taRightJustify
            Caption = 'BL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label45: TLabel
            Left = 507
            Top = 280
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Urgente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label46: TLabel
            Left = 508
            Top = 320
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Seguro/Hermes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbtxt_nr_item: TDBText
            Left = 620
            Top = 27
            Width = 29
            Height = 15
            Alignment = taCenter
            DataField = 'NR_ITEM'
            DataSource = datm_gestao_po.ds_gestao_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lblTotalItens: TLabel
            Left = 667
            Top = 27
            Width = 31
            Height = 14
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label33: TLabel
            Left = 655
            Top = 28
            Width = 7
            Height = 13
            Caption = '/'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label38: TLabel
            Left = 21
            Top = 71
            Width = 68
            Height = 13
            Caption = 'Mercadoria:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label39: TLabel
            Left = 21
            Top = 91
            Width = 62
            Height = 13
            Caption = 'Descri'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label41: TLabel
            Left = 21
            Top = 147
            Width = 70
            Height = 13
            Caption = 'Quantidade:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object dbtxt_cd_mercadoria: TDBText
            Left = 108
            Top = 71
            Width = 455
            Height = 17
            DataField = 'CD_MERCADORIA'
            DataSource = datm_gestao_po.ds_gestao_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object dbtxt_qt_inicial: TDBText
            Left = 108
            Top = 147
            Width = 455
            Height = 17
            DataField = 'QT_INICIAL'
            DataSource = datm_gestao_po.ds_gestao_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object Label47: TLabel
            Left = 21
            Top = 167
            Width = 31
            Height = 13
            Caption = #193'rea:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object dbtxt_nm_area: TDBText
            Left = 108
            Top = 167
            Width = 455
            Height = 17
            DataField = 'NM_AREA'
            DataSource = datm_gestao_po.ds_gestao_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_referencia_4: TLabel
            Left = 19
            Top = 16
            Width = 18
            Height = 13
            Caption = 'PO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lbl_processo_4: TLabel
            Left = 147
            Top = 16
            Width = 53
            Height = 13
            Caption = 'Processo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object edt_nm_porto_item: TEdit
            Left = 76
            Top = 214
            Width = 363
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 10
          end
          object edt_nm_navio_item: TEdit
            Left = 76
            Top = 252
            Width = 363
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 11
          end
          object dbedt_nr_viagem_item: TDBEdit
            Left = 22
            Top = 293
            Width = 55
            Height = 21
            DataField = 'NR_VIAGEM'
            DataSource = datm_gestao_po.ds_gestao_item
            TabOrder = 2
            OnExit = dbedt_nr_viagem_itemExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_nr_voo_item: TDBEdit
            Left = 22
            Top = 333
            Width = 181
            Height = 21
            DataField = 'NR_VOO'
            DataSource = datm_gestao_po.ds_gestao_item
            TabOrder = 3
            OnExit = dbedt_nr_voo_itemExit
          end
          object dbedt_nr_bl_item: TDBEdit
            Left = 508
            Top = 251
            Width = 181
            Height = 21
            DataField = 'NR_CONHECIMENTO'
            DataSource = datm_gestao_po.ds_gestao_item
            TabOrder = 5
          end
          object dblckpbox_in_consolidado_item: TDBLookupComboBox
            Left = 508
            Top = 214
            Width = 84
            Height = 21
            DataField = 'IN_CONSOLIDADO'
            DataSource = datm_gestao_po.ds_gestao_item
            DropDownRows = 2
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListFieldIndex = 2
            ListSource = datm_gestao_po.ds_yesno
            TabOrder = 4
          end
          object dblckpbox_in_urgente_item: TDBLookupComboBox
            Left = 508
            Top = 293
            Width = 84
            Height = 21
            DataField = 'IN_URGENTE'
            DataSource = datm_gestao_po.ds_gestao_item
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_gestao_po.ds_yesno
            TabOrder = 6
          end
          object dblckpbox_in_seguro_item: TDBLookupComboBox
            Left = 508
            Top = 333
            Width = 84
            Height = 21
            DataField = 'IN_SEGURO'
            DataSource = datm_gestao_po.ds_gestao_item
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_gestao_po.ds_yesno
            TabOrder = 7
          end
          object dbnav_po_item: TDBNavigator
            Left = 505
            Top = 21
            Width = 104
            Height = 25
            DataSource = datm_gestao_po.ds_gestao_item
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 12
          end
          object dbm_tx_mercadoria: TDBMemo
            Left = 108
            Top = 91
            Width = 597
            Height = 48
            TabStop = False
            BorderStyle = bsNone
            Color = 13092807
            DataField = 'TX_MERCADORIA'
            DataSource = datm_gestao_po.ds_gestao_item
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object dbedt_cd_porto_item: TDBEdit
            Left = 22
            Top = 214
            Width = 53
            Height = 21
            DataField = 'CD_LOCAL_DESEMBARQUE'
            DataSource = datm_gestao_po.ds_gestao_item
            TabOrder = 0
            OnChange = btn_co_porto_itemClick
            OnExit = dbedt_cd_porto_itemExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_cd_navio_item: TDBEdit
            Left = 22
            Top = 252
            Width = 55
            Height = 21
            DataField = 'CD_EMBARCACAO'
            DataSource = datm_gestao_po.ds_gestao_item
            TabOrder = 1
            OnChange = btn_co_navio_itemClick
            OnExit = dbedt_cd_navio_itemExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_nr_referencia_item: TDBEdit
            Left = 19
            Top = 29
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_REFERENCIA'
            DataSource = datm_gestao_po.ds_processo
            ReadOnly = True
            TabOrder = 8
          end
          object dbedt_nr_processo_item: TDBEdit
            Left = 147
            Top = 29
            Width = 121
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcNrProcesso'
            DataSource = datm_gestao_po.ds_processo
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
    end
    object ts_analise: TTabSheet
      Caption = 'An'#225'lise'
      DesignSize = (
        734
        404)
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 734
        Height = 404
        Align = alClient
        Shape = bsFrame
        Style = bsRaised
      end
      object lbl_referencia_2: TLabel
        Left = 11
        Top = 8
        Width = 18
        Height = 13
        Caption = 'PO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_processo_2: TLabel
        Left = 139
        Top = 8
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
      object dbgrd_nec_li: TDBGrid
        Left = 10
        Top = 54
        Width = 714
        Height = 250
        Anchors = [akLeft, akTop, akRight]
        DataSource = datm_gestao_po.ds_nec_li
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
            Expanded = False
            FieldName = 'NR_ITEM_CLIENTE'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_MERCADORIA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_AP_MERCADORIA'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_NCM_SH'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calc_NEC_LI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGreen
            Font.Height = -15
            Font.Name = 'Wingdings'
            Font.Style = []
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end>
      end
      object pnl_necessidade_li: TPanel
        Left = 10
        Top = 313
        Width = 714
        Height = 81
        Align = alCustom
        BevelInner = bvLowered
        TabOrder = 0
        object Label30: TLabel
          Left = 21
          Top = 20
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
        object Label29: TLabel
          Left = 81
          Top = 20
          Width = 71
          Height = 13
          Caption = 'Part Number'
          FocusControl = dbedt_item_cliente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_mercadoria: TSpeedButton
          Left = 463
          Top = 34
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
          OnClick = btn_co_mercadoriaClick
        end
        object lbl_embalagem: TLabel
          Left = 492
          Top = 20
          Width = 28
          Height = 13
          Caption = 'NCM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_item_cliente: TDBEdit
          Left = 21
          Top = 34
          Width = 50
          Height = 21
          DataField = 'NR_ITEM_CLIENTE'
          DataSource = datm_gestao_po.ds_nec_li
          TabOrder = 0
          OnExit = dbedt_item_clienteExit
        end
        object dbedt_cd_ncm: TDBEdit
          Left = 492
          Top = 34
          Width = 125
          Height = 21
          DataField = 'CD_NCM_SH'
          DataSource = datm_gestao_po.ds_nec_li
          Enabled = False
          MaxLength = 4
          TabOrder = 2
        end
        object dbchk_incide_li: TDBCheckBox
          Left = 630
          Top = 38
          Width = 70
          Height = 17
          Caption = 'Incide LI'
          DataField = 'IN_NECESSIDADE_LI'
          DataSource = datm_gestao_po.ds_nec_li
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchk_incide_liClick
        end
        object edt_ap_mercadoria: TEdit
          Left = 180
          Top = 34
          Width = 282
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_cd_mercadoria: TDBEdit
          Left = 81
          Top = 34
          Width = 100
          Height = 21
          DataField = 'CD_MERCADORIA'
          DataSource = datm_gestao_po.ds_nec_li
          TabOrder = 1
          OnChange = btn_co_mercadoriaClick
          OnExit = dbedt_cd_mercadoriaExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
      end
      object dbedt_nr_referencia_analise: TDBEdit
        Left = 11
        Top = 24
        Width = 121
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'NR_REFERENCIA'
        DataSource = datm_gestao_po.ds_processo
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_nr_processo_analise: TDBEdit
        Left = 139
        Top = 24
        Width = 121
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calcNrProcesso'
        DataSource = datm_gestao_po.ds_processo
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object pnl_atencao: TPanel
    Left = 0
    Top = 483
    Width = 742
    Height = 21
    Align = alBottom
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 2
    Visible = False
    object Label34: TLabel
      Left = 6
      Top = 4
      Width = 195
      Height = 13
      Caption = 'Aten'#231#227'o - Produto necessita de LI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object menu_manut: TMainMenu
    Left = 652
    Top = 4
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
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
      Enabled = False
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
    object mi_manut_proc: TMenuItem
      Caption = '&Manuten'#231#227'o do Processo'
      Enabled = False
      Visible = False
    end
    object mi_proc_realiza: TMenuItem
      Caption = 'Realiza'#231#227'o por &Processo'
      Enabled = False
      Visible = False
      OnClick = btn_proc_realizaClick
    end
  end
end
