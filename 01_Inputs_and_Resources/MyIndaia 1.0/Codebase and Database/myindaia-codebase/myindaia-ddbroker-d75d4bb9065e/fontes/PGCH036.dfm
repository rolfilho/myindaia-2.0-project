object frm_sel_relat: Tfrm_sel_relat
  Left = 353
  Top = 169
  Width = 386
  Height = 447
  Caption = 'frm_sel_relat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 370
    Height = 409
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      370
      409)
    object Shape1: TShape
      Left = 8
      Top = 8
      Width = 362
      Height = 365
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_unid_neg: TLabel
      Left = 22
      Top = 17
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
      Left = 332
      Top = 29
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
    object lbl_produto: TLabel
      Left = 22
      Top = 57
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
      Visible = False
    end
    object btn_co_produto: TSpeedButton
      Left = 332
      Top = 69
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
      OnClick = btn_co_produtoClick
    end
    object lbl_periodo: TLabel
      Left = 22
      Top = 327
      Width = 116
      Height = 13
      Caption = 'Selecione o per'#237'odo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 120
      Top = 349
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
    object lbl_cd_cliente: TLabel
      Left = 22
      Top = 130
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
    object btn_co_cliente: TSpeedButton
      Left = 332
      Top = 144
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
    object lblGrupo: TLabel
      Left = 22
      Top = 94
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
    object btn_co_grupo: TSpeedButton
      Left = 332
      Top = 106
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
    object lbl_cd_analista: TLabel
      Left = 22
      Top = 167
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Analista'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_analista: TSpeedButton
      Left = 332
      Top = 180
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
      OnClick = btn_co_analistaClick
    end
    object lbl_cd_destino: TLabel
      Left = 22
      Top = 204
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Destino'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_destino: TSpeedButton
      Left = 332
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
      Visible = False
      OnClick = btn_co_destinoClick
    end
    object lbl_cd_modal: TLabel
      Left = 22
      Top = 240
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_modal: TSpeedButton
      Left = 332
      Top = 253
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
      OnClick = btn_co_modalClick
    end
    object lbl_in_faturado: TLabel
      Left = 22
      Top = 279
      Width = 51
      Height = 13
      Caption = 'Faturado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblDespachante: TLabel
      Left = 22
      Top = 256
      Width = 76
      Height = 13
      Caption = 'Despachante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_desp: TSpeedButton
      Left = 332
      Top = 268
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
      OnClick = btn_co_despClick
    end
    object lbl_representante: TLabel
      Left = 22
      Top = 102
      Width = 84
      Height = 13
      Caption = 'Representante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_representante: TSpeedButton
      Left = 332
      Top = 114
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
      OnClick = btn_representanteClick
    end
    object btn_imprimir: TButton
      Left = 232
      Top = 382
      Width = 66
      Height = 26
      Caption = '&Imprimir'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 303
      Top = 382
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 5
    end
    object edt_nm_unid_neg: TEdit
      Left = 53
      Top = 30
      Width = 278
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object edt_nm_produto: TEdit
      Left = 53
      Top = 70
      Width = 278
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object edt_nm_cliente: TEdit
      Left = 65
      Top = 144
      Width = 266
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
      Visible = False
    end
    object edt_nm_grupo: TEdit
      Left = 57
      Top = 107
      Width = 274
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 11
      Visible = False
    end
    object msk_dt_inicio: TDateTimePicker
      Left = 22
      Top = 341
      Width = 89
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 9
    end
    object msk_dt_fim: TDateTimePicker
      Left = 137
      Top = 341
      Width = 89
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 10
    end
    object edt_nm_analista: TEdit
      Left = 53
      Top = 180
      Width = 278
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 13
      Visible = False
    end
    object edt_nm_destino: TEdit
      Left = 53
      Top = 217
      Width = 278
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 15
      Visible = False
    end
    object edt_nm_modal: TEdit
      Left = 53
      Top = 253
      Width = 278
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 17
      Visible = False
    end
    object cbo_faturado: TComboBox
      Left = 22
      Top = 294
      Width = 94
      Height = 21
      ItemHeight = 13
      TabOrder = 18
      Text = 'Sim'
      Visible = False
      Items.Strings = (
        'Sim'
        'N'#227'o'
        'Todos')
    end
    object msk_cd_modal: TMaskEdit
      Left = 22
      Top = 253
      Width = 32
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 16
      Visible = False
      OnExit = msk_cd_modalExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_destino: TMaskEdit
      Left = 22
      Top = 217
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
      TabOrder = 14
      Visible = False
      OnExit = msk_cd_destinoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_analista: TMaskEdit
      Left = 22
      Top = 180
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
      TabOrder = 12
      Visible = False
      OnExit = msk_cd_analistaExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_cliente: TMaskEdit
      Left = 22
      Top = 144
      Width = 44
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
    object msk_cd_grupo: TMaskEdit
      Left = 22
      Top = 107
      Width = 36
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
    object msk_cd_produto: TMaskEdit
      Left = 22
      Top = 70
      Width = 32
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
      Visible = False
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 22
      Top = 30
      Width = 32
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
    object msk_cd_desp: TMaskEdit
      Left = 22
      Top = 270
      Width = 36
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 19
      Visible = False
      OnChange = msk_cd_grupoChange
      OnExit = msk_cd_despExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_desp: TEdit
      Left = 57
      Top = 270
      Width = 274
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 20
      Visible = False
    end
    object msk_representante: TMaskEdit
      Left = 22
      Top = 115
      Width = 43
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      Visible = False
      OnExit = msk_representanteExit
    end
    object edt_representante: TEdit
      Left = 64
      Top = 115
      Width = 267
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 22
      Visible = False
    end
  end
  object crp_sel_relat: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 311
    Top = 312
  end
end
