object frm_sel_unid_prod_emb: Tfrm_sel_unid_prod_emb
  Left = 374
  Top = 80
  Width = 413
  Height = 774
  BorderIcons = [biSystemMenu]
  Caption = 'frm_sel_unid_prod_emb'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 736
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      397
      736)
    object Shape1: TShape
      Left = 8
      Top = 8
      Width = 385
      Height = 694
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 327
      Top = 25
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
      OnClick = btn_co_unid_negClick
    end
    object btn_co_produto: TSpeedButton
      Left = 327
      Top = 65
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
      OnClick = btn_co_produtoClick
    end
    object btn_co_grupo: TSpeedButton
      Left = 327
      Top = 102
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
      Visible = False
      OnClick = btn_co_grupoClick
    end
    object btn_co_cliente: TSpeedButton
      Left = 327
      Top = 140
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
      Visible = False
      OnClick = btn_co_clienteClick
    end
    object btn_co_embarcacao: TSpeedButton
      Left = 327
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
      OnClick = btn_co_embarcacaoClick
    end
    object btn_co_area: TSpeedButton
      Left = 327
      Top = 217
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
      OnClick = btn_co_areaClick
    end
    object btn_co_analista_comissaria: TSpeedButton
      Left = 327
      Top = 256
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
      OnClick = btn_co_analista_comissariaClick
    end
    object btn_co_celula: TSpeedButton
      Left = 327
      Top = 297
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
      Visible = False
      OnClick = btn_co_celulaClick
    end
    object btn_co_servico: TSpeedButton
      Left = 327
      Top = 337
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
      Visible = False
      OnClick = btn_co_servicoClick
    end
    object btn_co_agente: TSpeedButton
      Left = 327
      Top = 380
      Width = 25
      Height = 25
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
      Visible = False
      OnClick = btn_co_agenteClick
    end
    object btn_co_armazem: TSpeedButton
      Left = 327
      Top = 424
      Width = 25
      Height = 25
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
      Visible = False
      OnClick = btn_co_armazemClick
    end
    object btn_co_pais: TSpeedButton
      Left = 327
      Top = 464
      Width = 25
      Height = 25
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
      Visible = False
      OnClick = btn_co_paisClick
    end
    object btn_co_transp: TSpeedButton
      Left = 327
      Top = 504
      Width = 25
      Height = 25
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
      Visible = False
      OnClick = btn_co_transpClick
    end
    object lbl_transp: TLabel
      Left = 19
      Top = 488
      Width = 87
      Height = 13
      Caption = 'Transportadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_demurrage: TLabel
      Left = 19
      Top = 528
      Width = 62
      Height = 13
      Caption = 'Demurrage'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_a: TLabel
      Left = 116
      Top = 588
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_periodo: TLabel
      Left = 19
      Top = 568
      Width = 120
      Height = 13
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_lead_time: TLabel
      Left = 19
      Top = 613
      Width = 60
      Height = 13
      Caption = 'Lead Time'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_canal: TLabel
      Left = 128
      Top = 613
      Width = 33
      Height = 13
      Caption = 'Canal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_unid_neg: TLabel
      Left = 19
      Top = 13
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
    object lbl_produto: TLabel
      Left = 19
      Top = 53
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
    object lbl_cliente: TLabel
      Left = 19
      Top = 126
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_grupo: TLabel
      Left = 19
      Top = 90
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_emb: TLabel
      Left = 19
      Top = 164
      Width = 71
      Height = 13
      Caption = 'Embarca'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_area: TLabel
      Left = 19
      Top = 203
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
    object lbl_analista_comissaria: TLabel
      Left = 19
      Top = 243
      Width = 110
      Height = 13
      Caption = 'Analista Comiss'#225'ria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_celula: TLabel
      Left = 19
      Top = 283
      Width = 36
      Height = 13
      Caption = 'C'#233'lula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_servico: TLabel
      Left = 19
      Top = 323
      Width = 44
      Height = 13
      Caption = 'Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_agente: TLabel
      Left = 19
      Top = 364
      Width = 41
      Height = 13
      Caption = 'Agente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_arm_desc: TLabel
      Left = 19
      Top = 408
      Width = 51
      Height = 13
      Caption = 'Armaz'#233'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_pais: TLabel
      Left = 19
      Top = 448
      Width = 27
      Height = 13
      Caption = 'Pa'#237's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 19
      Top = 26
      Width = 26
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
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 50
      Top = 26
      Width = 273
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 23
    end
    object edt_nm_transp: TEdit
      Left = 63
      Top = 504
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 37
      Visible = False
    end
    object msk_cd_transp: TMaskEdit
      Left = 19
      Top = 504
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 12
      Visible = False
      OnExit = msk_cd_transpExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object cbo_demurrage: TComboBox
      Left = 19
      Top = 544
      Width = 86
      Height = 21
      DragMode = dmAutomatic
      ItemHeight = 13
      TabOrder = 13
      Visible = False
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Ambos')
    end
    object msk_dt_fim: TDateTimePicker
      Left = 135
      Top = 584
      Width = 90
      Height = 21
      Date = 37572.000000000000000000
      Time = 37572.000000000000000000
      TabOrder = 31
      OnExit = msk_dt_fimExit
    end
    object msk_dt_inicio: TDateTimePicker
      Left = 19
      Top = 584
      Width = 90
      Height = 21
      Date = 37572.000000000000000000
      Time = 37572.000000000000000000
      TabOrder = 30
      OnExit = msk_dt_inicioExit
    end
    object cbo_lead_time: TComboBox
      Left = 19
      Top = 630
      Width = 94
      Height = 21
      ItemHeight = 13
      TabOrder = 14
      Visible = False
    end
    object cbo_tp_canal: TComboBox
      Left = 128
      Top = 630
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 15
      Visible = False
    end
    object chk_obs: TCheckBox
      Left = 250
      Top = 568
      Width = 97
      Height = 17
      Caption = '&Observa'#231#227'o'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 16
      Visible = False
    end
    object chk_arquivo: TCheckBox
      Left = 250
      Top = 588
      Width = 90
      Height = 17
      Caption = 'Em &Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 17
      Visible = False
    end
    object chk_excel: TCheckBox
      Left = 250
      Top = 608
      Width = 90
      Height = 17
      Caption = 'E&xcel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 18
      Visible = False
    end
    object chk_dias_uteis: TCheckBox
      Left = 250
      Top = 628
      Width = 135
      Height = 17
      Caption = 'Somente Dias &'#218'teis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
      Visible = False
    end
    object chk_area: TCheckBox
      Left = 250
      Top = 648
      Width = 127
      Height = 17
      Caption = '&Quebra por '#225'rea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 20
      Visible = False
    end
    object btn_imprimir: TButton
      Left = 243
      Top = 715
      Width = 66
      Height = 26
      Caption = '&Imprimir'
      Default = True
      TabOrder = 21
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 315
      Top = 715
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 3
      TabOrder = 22
      OnClick = btn_sairClick
    end
    object msk_cd_produto: TMaskEdit
      Left = 19
      Top = 66
      Width = 26
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
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 50
      Top = 66
      Width = 273
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 24
    end
    object msk_cd_cliente: TMaskEdit
      Left = 19
      Top = 140
      Width = 39
      Height = 21
      EditMask = '99999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnChange = msk_cd_clienteChange
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 63
      Top = 140
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 26
      Visible = False
    end
    object edt_nm_grupo: TEdit
      Left = 55
      Top = 103
      Width = 268
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 25
      Visible = False
    end
    object msk_cd_grupo: TMaskEdit
      Left = 19
      Top = 103
      Width = 32
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnChange = msk_cd_grupoChange
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_embarcacao: TMaskEdit
      Left = 19
      Top = 179
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 4
      OnExit = msk_cd_embarcacaoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_embarcacao: TEdit
      Left = 63
      Top = 179
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 27
    end
    object msk_cd_area: TMaskEdit
      Left = 19
      Top = 218
      Width = 39
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 5
      OnExit = msk_cd_areaExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_area: TEdit
      Left = 63
      Top = 218
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 28
    end
    object msk_cd_analista_comissaria: TMaskEdit
      Left = 19
      Top = 257
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 6
      OnExit = msk_cd_analista_comissariaExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_analista_comissaria: TEdit
      Left = 63
      Top = 257
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 32
    end
    object edt_nm_celula: TEdit
      Left = 50
      Top = 298
      Width = 273
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 29
      Visible = False
    end
    object msk_cd_celula: TMaskEdit
      Left = 19
      Top = 298
      Width = 26
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 7
      Visible = False
      OnExit = msk_cd_celulaExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_servico: TEdit
      Left = 56
      Top = 338
      Width = 267
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 33
      Visible = False
    end
    object msk_cd_servico: TMaskEdit
      Left = 19
      Top = 338
      Width = 32
      Height = 21
      MaxLength = 3
      TabOrder = 8
      Visible = False
      OnExit = msk_cd_servicoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_agente: TMaskEdit
      Left = 19
      Top = 380
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 9
      Visible = False
      OnExit = msk_cd_agenteExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_armazem: TMaskEdit
      Left = 19
      Top = 424
      Width = 39
      Height = 21
      EditMask = '9999;0; '
      MaxLength = 4
      TabOrder = 10
      Visible = False
      OnExit = msk_cd_armazemExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_pais: TMaskEdit
      Left = 19
      Top = 464
      Width = 39
      Height = 21
      EditMask = '999;0; '
      MaxLength = 3
      TabOrder = 11
      Visible = False
      OnExit = msk_cd_paisExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_agente: TEdit
      Left = 63
      Top = 380
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 34
      Visible = False
    end
    object edt_nm_armazem: TEdit
      Left = 63
      Top = 424
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 35
      Visible = False
    end
    object edt_nm_pais: TEdit
      Left = 63
      Top = 464
      Width = 260
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 36
      Visible = False
    end
  end
  object crp_unid_prod: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 252
    Top = 100
  end
end
