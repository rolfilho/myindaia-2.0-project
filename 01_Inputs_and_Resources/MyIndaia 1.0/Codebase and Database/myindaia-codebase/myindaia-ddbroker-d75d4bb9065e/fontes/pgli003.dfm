object frm_LI_Itens: Tfrm_LI_Itens
  Left = 897
  Top = 216
  Width = 750
  Height = 590
  BorderIcons = [biSystemMenu]
  Caption = 'Licen'#231'a de Importa'#231#227'o'
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
  object pgctrl_Item: TPageControl
    Left = 0
    Top = 49
    Width = 734
    Height = 483
    ActivePage = ts_item1
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_ItemChange
    OnChanging = pgctrl_ItemChanging
    object ts_item1: TTabSheet
      Caption = '&Mercadoria'
      object bvl_mercadoria: TBevel
        Left = 0
        Top = 0
        Width = 726
        Height = 455
        Align = alClient
        Shape = bsFrame
      end
      object shp_info_drawback: TShape
        Left = 272
        Top = 456
        Width = 448
        Height = 46
        Brush.Style = bsClear
        Pen.Color = clGray
        Visible = False
      end
      object shp_sistema_drawback: TShape
        Left = 6
        Top = 456
        Width = 267
        Height = 46
        Brush.Style = bsClear
        Pen.Color = clGray
        Visible = False
      end
      object lbl_pais_origem: TLabel
        Left = 442
        Top = 332
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_pais_aquisicao: TSpeedButton
        Left = 698
        Top = 309
        Width = 25
        Height = 21
        Flat = True
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
      object lbl_pais_aquisicao: TLabel
        Left = 442
        Top = 295
        Width = 104
        Height = 13
        Caption = 'Pa'#237's de Aquisi'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais_origem: TSpeedButton
        Left = 698
        Top = 346
        Width = 25
        Height = 21
        Flat = True
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
      object lbl_exportador: TLabel
        Left = 10
        Top = 295
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
      object lbl_fabricante: TLabel
        Left = 10
        Top = 332
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
        Left = 378
        Top = 309
        Width = 25
        Height = 21
        Flat = True
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
        Left = 378
        Top = 346
        Width = 25
        Height = 21
        Flat = True
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
      object lbl_unid_medida: TLabel
        Left = 10
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
      object lbl_qt_mercadoria: TLabel
        Left = 10
        Top = 54
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
      object lbl_vl_unitario: TLabel
        Left = 10
        Top = 102
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
      object lbl_vl_item: TLabel
        Left = 10
        Top = 125
        Width = 58
        Height = 13
        Caption = 'Valor Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_ncm: TLabel
        Left = 408
        Top = 54
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
      object lbl_unid_med_estat: TLabel
        Left = 408
        Top = 101
        Width = 128
        Height = 13
        Caption = 'Unid. Med. Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_qt_unid_estat: TLabel
        Left = 408
        Top = 126
        Width = 156
        Height = 13
        Caption = 'Quant. na Unid. Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_cd_naladi_sh: TLabel
        Left = 408
        Top = 78
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
        Left = 371
        Top = 73
        Width = 25
        Height = 21
        Flat = True
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
        Left = 691
        Top = 74
        Width = 25
        Height = 21
        Flat = True
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
        Left = 691
        Top = 50
        Width = 25
        Height = 21
        Flat = True
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
      object lbl_peso_liquido: TLabel
        Left = 408
        Top = 150
        Width = 76
        Height = 13
        Caption = 'Peso L'#237'quido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_vl_unitario_mcv: TLabel
        Left = 11
        Top = 212
        Width = 91
        Height = 13
        Caption = 'Valor Unit. MCV'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbl_destaque: TLabel
        Left = 408
        Top = 174
        Width = 104
        Height = 13
        Caption = 'Destaque da NCM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_numero: TLabel
        Left = 385
        Top = 383
        Width = 117
        Height = 13
        Caption = 'N'#186' do Ato Drawback'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object lbl_regime: TLabel
        Left = 7
        Top = 512
        Width = 126
        Height = 13
        Caption = 'Regime de Tributa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbl_fund_legal: TLabel
        Left = 223
        Top = 512
        Width = 68
        Height = 13
        Caption = 'Fund. Legal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object btn_co_regime_tributacao: TSpeedButton
        Left = 188
        Top = 526
        Width = 25
        Height = 21
        Flat = True
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
        Visible = False
        OnClick = btn_co_regime_tributacaoClick
      end
      object btn_co_fund_legal: TSpeedButton
        Left = 404
        Top = 526
        Width = 25
        Height = 21
        Flat = True
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
        Visible = False
        OnClick = btn_co_fund_legalClick
      end
      object lbl_nr_item_drawback: TLabel
        Left = 517
        Top = 383
        Width = 25
        Height = 13
        Caption = 'Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_qt_produto: TLabel
        Left = 358
        Top = 479
        Width = 80
        Height = 13
        Caption = 'Qtde. Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbl_vl_produto_drawback: TLabel
        Left = 494
        Top = 479
        Width = 119
        Height = 13
        Caption = 'Valor Loc. Embarque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object lbl_nr_referencia: TLabel
        Left = 408
        Top = 212
        Width = 36
        Height = 13
        Caption = 'N'#186' PO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_info_drawback: TLabel
        Left = 273
        Top = 457
        Width = 446
        Height = 14
        AutoSize = False
        Caption = ' Informa'#231#245'es de Drawback'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Visible = False
      end
      object shp_mercadoria: TShape
        Left = 8
        Top = 8
        Width = 717
        Height = 35
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl_mercadoria: TLabel
        Left = 10
        Top = 19
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_produto: TSpeedButton
        Left = 691
        Top = 15
        Width = 25
        Height = 21
        Flat = True
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
      object lbl_sistema_drawback: TLabel
        Left = 7
        Top = 457
        Width = 265
        Height = 14
        AutoSize = False
        Caption = ' Sistema de Drawback?'
        Color = clSilver
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = False
      end
      object Label1: TLabel
        Left = 10
        Top = 149
        Width = 122
        Height = 13
        Caption = 'Valor Item (sem frete)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 166
        Width = 180
        Height = 13
        Caption = 'Apenas se frete for embutido nos itens'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 188
        Width = 112
        Height = 13
        Caption = 'Valor Frete (Rateio)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbrgrp_fabr_expo: TDBRadioGroup
        Left = 408
        Top = 228
        Width = 315
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
          '&Fabr./Prod. '#233' o exportador'
          'Fabr./Prod. n'#227'o '#233' o &exportador'
          'Fabr./Prod. '#233' &desconhecido')
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 17
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrgrp_fabr_expoChange
      end
      object dbm_descricao_mercadoria: TDBMemo
        Left = 10
        Top = 233
        Width = 389
        Height = 60
        DataField = 'TX_DESC_DET_MERC'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 16
        OnExit = dbm_descricao_mercadoriaExit
      end
      object dbedt_qt_mercadoria: TDBEdit
        Left = 138
        Top = 50
        Width = 176
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
        TabOrder = 1
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_qt_mercadoriaExit
      end
      object dbedt_vl_unitario: TDBEdit
        Left = 138
        Top = 98
        Width = 120
        Height = 21
        DataField = 'VL_UNIT_MLE'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnExit = dbedt_qt_mercadoriaExit
      end
      object dbedt_vl_item: TDBEdit
        Left = 138
        Top = 122
        Width = 120
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
        Left = 569
        Top = 50
        Width = 120
        Height = 21
        DataField = 'CD_NCM_SH'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_qt_unid_estat: TDBEdit
        Left = 569
        Top = 122
        Width = 120
        Height = 21
        DataField = 'QT_MERC_UN_ESTAT'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
      end
      object dbedt_cd_naladi_sh: TDBEdit
        Left = 569
        Top = 74
        Width = 120
        Height = 21
        DataField = 'CD_NALADI_SH'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnExit = dbedt_cd_naladi_shExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_peso_liq: TDBEdit
        Left = 569
        Top = 146
        Width = 120
        Height = 21
        DataField = 'PL_MERCADORIA'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnEnter = dbedt_peso_liqEnter
      end
      object dbedt_vl_unitario_mcv: TDBEdit
        Left = 138
        Top = 208
        Width = 120
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
        TabOrder = 7
        Visible = False
      end
      object dbedt_destaque: TDBEdit
        Left = 569
        Top = 170
        Width = 42
        Height = 21
        DataField = 'NR_DESTAQUE_NCM'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
      end
      object dbedt_nm_unidade: TEdit
        Left = 173
        Top = 74
        Width = 196
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
        TabOrder = 4
      end
      object dbedt_nm_exportador: TEdit
        Left = 58
        Top = 309
        Width = 318
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
        TabOrder = 19
      end
      object dbedt_nm_fabricante: TEdit
        Left = 59
        Top = 346
        Width = 318
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
      object dbedt_nm_pais_aquisicao: TEdit
        Left = 482
        Top = 309
        Width = 214
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
        TabOrder = 21
      end
      object dbedt_nm_pais_origem: TEdit
        Left = 482
        Top = 346
        Width = 214
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
        TabOrder = 25
      end
      object edt_unid_med_estat: TEdit
        Left = 569
        Top = 98
        Width = 120
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
        TabOrder = 12
      end
      object dbedt_cd_numero_ato: TDBEdit
        Left = 385
        Top = 397
        Width = 120
        Height = 21
        DataField = 'NR_ATO_DRAWBACK'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 27
      end
      object dbedt_nm_regime_tributacao: TEdit
        Left = 41
        Top = 526
        Width = 145
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
        TabOrder = 30
        Visible = False
      end
      object dbedt_nm_fund_legal: TEdit
        Left = 257
        Top = 526
        Width = 145
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
        TabOrder = 32
        Visible = False
      end
      object rbtn_sistema_drawback1: TRadioButton
        Left = 10
        Top = 478
        Width = 74
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'Gen'#233'rico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 33
        Visible = False
        OnClick = rbtn_sistema_drawbackClick
      end
      object rbtn_sistema_drawback2: TRadioButton
        Left = 88
        Top = 478
        Width = 98
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'N'#227'o Gen'#233'rico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 34
        Visible = False
        OnClick = rbtn_sistema_drawbackClick
      end
      object rbtn_sistema_drawback3: TRadioButton
        Left = 191
        Top = 478
        Width = 74
        Height = 17
        BiDiMode = bdLeftToRight
        Caption = 'N'#227'o tem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 35
        Visible = False
        OnClick = rbtn_sistema_drawbackClick
      end
      object dbedt_nr_item_drawback: TDBEdit
        Left = 516
        Top = 397
        Width = 45
        Height = 21
        DataField = 'NR_ITEM_DRAWBACK'
        DataSource = datm_LI_Itens.ds_li_itens
        TabOrder = 28
      end
      object dbedt_qt_produto_drawback: TDBEdit
        Left = 441
        Top = 476
        Width = 45
        Height = 21
        DataField = 'QT_PRODUTO_DRAWBACK'
        DataSource = datm_LI_Itens.ds_li_itens
        TabOrder = 36
        Visible = False
      end
      object dbedt_vl_produto_drawback: TDBEdit
        Left = 617
        Top = 476
        Width = 76
        Height = 21
        DataField = 'VL_PRODUTO_DRAWBACK'
        DataSource = datm_LI_Itens.ds_li_itens
        TabOrder = 37
        Visible = False
      end
      object dbedt_cd_regime_tributacao: TDBEdit
        Left = 7
        Top = 526
        Width = 35
        Height = 21
        DataField = 'CD_REGIME_TRIBUTACAO'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        TabOrder = 29
        Visible = False
        OnChange = btn_co_regime_tributacaoClick
        OnExit = dbedt_cd_regime_tributacaoExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_fund_legal: TDBEdit
        Left = 223
        Top = 526
        Width = 35
        Height = 21
        DataField = 'CD_FUND_LEGAL'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        TabOrder = 31
        Visible = False
        OnChange = btn_co_fund_legalClick
        OnExit = dbedt_cd_fund_legalExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_fabricante: TDBEdit
        Left = 10
        Top = 346
        Width = 50
        Height = 21
        DataField = 'CD_FABRICANTE'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
        OnChange = btn_co_fabricanteClick
        OnExit = dbedt_cd_fabricanteExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_pais_origem: TDBEdit
        Left = 442
        Top = 346
        Width = 41
        Height = 21
        DataField = 'CD_PAIS_ORIGEM'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
        OnChange = btn_co_pais_origemClick
        OnExit = dbedt_cd_pais_origemExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_pais_aquisicao: TDBEdit
        Left = 442
        Top = 309
        Width = 41
        Height = 21
        DataField = 'CD_PAIS_AQUISICAO'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 20
        OnChange = btn_co_pais_aquisicaoClick
        OnExit = dbedt_cd_pais_aquisicaoExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_cd_exportador: TDBEdit
        Left = 10
        Top = 309
        Width = 49
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnChange = btn_co_exportadorClick
        OnExit = dbedt_cd_exportadorExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_nr_po: TDBEdit
        Left = 569
        Top = 208
        Width = 106
        Height = 21
        DataField = 'NR_PROC_PO'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnKeyPress = dbedt_nr_poKeyPress
      end
      object dbedt_nr_item_po: TDBEdit
        Left = 676
        Top = 208
        Width = 40
        Height = 21
        DataField = 'NR_ITEM_PO'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnExit = dbedt_nr_item_poExit
      end
      object dbedt_cd_mercadoria: TDBEdit
        Left = 108
        Top = 15
        Width = 173
        Height = 21
        DataField = 'CD_MERCADORIA'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = btn_co_produtoClick
        OnExit = dbedt_cd_mercadoriaExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object dbedt_nm_mercadoria: TEdit
        Left = 282
        Top = 15
        Width = 408
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
        TabOrder = 2
      end
      object dbedt_cd_unid_comercial: TDBEdit
        Left = 138
        Top = 74
        Width = 35
        Height = 21
        DataField = 'CD_UN_MED_COMERC'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnChange = btn_co_unid_medClick
        OnExit = dbedt_cd_unid_comercialExit
        OnKeyDown = dbedt_cd_mercadoriaKeyDown
      end
      object btnFabricante: TBitBtn
        Left = 407
        Top = 345
        Width = 26
        Height = 22
        Hint = 'Atualizar o campo Fabricante em todos os itens'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 38
        OnClick = btnFabricanteClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
      object btnExportador: TBitBtn
        Left = 407
        Top = 309
        Width = 25
        Height = 22
        Hint = 'Atualizar o campo Exportador em todos os itens'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 39
        OnClick = btnExportadorClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
      object btnFabriExpo: TBitBtn
        Left = 692
        Top = 266
        Width = 25
        Height = 22
        Hint = 'Atualizar esta informa'#231#227'o em todos os itens'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 40
        OnClick = btnFabriExpoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
      object btnQtdUnidEstatIgual: TBitBtn
        Left = 691
        Top = 122
        Width = 25
        Height = 22
        Hint = 'Atualizar o campo Quant. na Unid. Estat'#237'stica em todos os itens'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 41
        OnClick = btnQtdUnidEstatIgualClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
      object rgpDrawback: TDBRadioGroup
        Left = 14
        Top = 377
        Width = 355
        Height = 72
        Caption = 'Sistema de Drawback'
        Columns = 2
        DataField = 'SISTEMA_DRAWBACK'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'N'#227'o Tem'
          'Suspens'#227'o Gen'#233'rico'
          'Suspens'#227'o n'#227'o-Gen'#233'rico'
          'Isen'#231#227'o Web'
          'Isen'#231#227'o Papel')
        ParentFont = False
        TabOrder = 26
        Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        OnChange = rgpDrawbackChange
        OnClick = rgpDrawbackClick
      end
      object DBEdit1: TDBEdit
        Left = 617
        Top = 170
        Width = 42
        Height = 21
        DataField = 'NR_QUEBRA_EXTRA'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 42
      end
      object dbedtvl_total_mle_sem_frete: TDBEdit
        Left = 138
        Top = 145
        Width = 120
        Height = 21
        Color = clMenu
        DataField = 'VL_TOTAL_MLE_SEM_FRETE'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 43
        OnEnter = dbedt_vl_itemEnter
      end
      object dbedtvl_rat_frete: TDBEdit
        Left = 138
        Top = 184
        Width = 120
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'VL_RAT_FRETE_MOEDA_MERC'
        DataSource = datm_LI_Itens.ds_li_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 44
      end
    end
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    DesignSize = (
      734
      49)
    object btn_sair: TSpeedButton
      Left = 699
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
      Left = 43
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
      Left = 81
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
    object btn_novo: TSpeedButton
      Left = 5
      Top = 4
      Width = 38
      Height = 41
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
      OnClick = btn_novoClick
    end
    object btn_capa_li: TSpeedButton
      Left = 332
      Top = 4
      Width = 38
      Height = 41
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
      Left = 165
      Top = 4
      Width = 38
      Height = 41
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
      OnClick = btn_duplicaClick
    end
    object btn_excluir: TSpeedButton
      Left = 119
      Top = 4
      Width = 38
      Height = 41
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
    object btn_monta_li: TSpeedButton
      Left = 249
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Monta LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFF00FF
        FFFFFFFFFFFF88FFFFFFFFFFFF04774FFFFFFFFFFF88778FFFFFFFFF04778874
        FFFFFFFF88778878FFFFFFF4778FFF874FFFFFF8778FFF878FFFFFF08FF8FF88
        74FFFFF88FF8FF8878FFFFF08FFF88FF874FFFF88FFF88FF878F000008F8FF78
        F874888888F8FF78F8784400077770788884448887777F78888844FFFF877088
        F77444FFFF877F88F77840FFFF703778800048FFFF7F377888880008FF338370
        000F8888FF338378888FFFF0733800000FFFFFF8733888888FFFFFFF0000FFFF
        FFFFFFFF8888FFFFFFFFFFF00FFFFFFFFFFFFFF88FFFFFFFFFFFFF00FFFFFFFF
        FFFFFF88FFFFFFFFFFFFFF0FFFFFFFFFFFFFFF8FFFFFFFFFFFFF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_monta_liClick
    end
    object btn_calculo: TSpeedButton
      Left = 211
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Calcula LI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_calculoClick
    end
    object btn_trans_LI: TSpeedButton
      Left = 287
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Transmitir LI'
      Enabled = False
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_trans_LIClick
    end
    object btnRatearPeso: TSpeedButton
      Left = 380
      Top = 4
      Width = 33
      Height = 41
      Hint = 'Ratear Peso por Item'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnRatearPesoClick
    end
    object Label4: TLabel
      Left = 650
      Top = 15
      Width = 6
      Height = 16
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvgr_li_itens: TDBNavigator
      Left = 517
      Top = 14
      Width = 92
      Height = 23
      DataSource = datm_LI_Itens.ds_li_itens
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 0
    end
    object dbedt_item_atual: TDBEdit
      Left = 612
      Top = 15
      Width = 37
      Height = 20
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      DataField = 'NR_ITEM'
      DataSource = datm_LI_Itens.ds_li_itens
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnChange = dbedt_item_atualChange
    end
    object dbedt_item_total: TDBEdit
      Left = 657
      Top = 14
      Width = 37
      Height = 22
      TabStop = False
      Anchors = [akTop, akRight]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      Color = clMenu
      Ctl3D = False
      DataField = 'QT_TOTAL_ITEM'
      DataSource = datm_LI_Itens.ds_li
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object editItem: TEdit
      Left = 612
      Top = 15
      Width = 38
      Height = 22
      AutoSize = False
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      OnKeyDown = editItemKeyDown
      OnKeyPress = editItemKeyPress
      OnKeyUp = editItemKeyUp
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 480
    Top = 12
    object mi_novo: TMenuItem
      Caption = '&Novo'
      Enabled = False
      OnClick = btn_novoClick
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
    object mi_duplica: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      OnClick = btn_duplicaClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Calcu&lar'
      Enabled = False
      OnClick = btn_calculoClick
    end
    object mi_monta_li: TMenuItem
      Caption = '&Monta LI'
      Enabled = False
      OnClick = btn_monta_liClick
    end
    object mi_capa_li: TMenuItem
      Caption = '&Capa'
      OnClick = btn_capa_liClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
