object frm_tot_gastos_porto: Tfrm_tot_gastos_porto
  Left = 410
  Top = 118
  Width = 396
  Height = 413
  BorderIcons = [biSystemMenu]
  Caption = 'Total de Gastos por Porto'
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
    Width = 388
    Height = 386
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      388
      386)
    object Shape1: TShape
      Left = 8
      Top = 10
      Width = 369
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape2: TShape
      Left = 8
      Top = 40
      Width = 369
      Height = 294
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 21
      Top = 169
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
      Left = 338
      Top = 181
      Width = 22
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 21
      Top = 129
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
      Left = 337
      Top = 141
      Width = 22
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
      OnClick = btn_cd_unid_negClick
    end
    object Label2: TLabel
      Left = 21
      Top = 209
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
    object Label3: TLabel
      Left = 122
      Top = 227
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
    object Label4: TLabel
      Left = 21
      Top = 49
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 21
      Top = 89
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
    object Label6: TLabel
      Left = 21
      Top = 249
      Width = 85
      Height = 13
      Caption = 'Grupo de Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 21
      Top = 289
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
    object btn_grupo: TSpeedButton
      Left = 335
      Top = 61
      Width = 22
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
      OnClick = btn_grupoClick
    end
    object btn_cd_cliente: TSpeedButton
      Left = 335
      Top = 101
      Width = 22
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
      OnClick = btn_cd_clienteClick
    end
    object SpeedButton1: TSpeedButton
      Left = 239
      Top = 261
      Width = 22
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
      OnClick = SpeedButton1Click
    end
    object btn_cd_moeda: TSpeedButton
      Left = 239
      Top = 301
      Width = 22
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
      OnClick = btn_cd_moedaClick
    end
    object Label8: TLabel
      Left = 16
      Top = 15
      Width = 180
      Height = 16
      Caption = 'Total de Gastos por Porto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object msk_cd_produto: TMaskEdit
      Left = 21
      Top = 182
      Width = 28
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 3
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 53
      Top = 182
      Width = 282
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 21
      Top = 142
      Width = 28
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
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 53
      Top = 142
      Width = 282
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 11
    end
    object btn_iniciar: TButton
      Left = 216
      Top = 352
      Width = 71
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Imprimir'
      Default = True
      TabOrder = 8
      OnClick = btn_iniciarClick
    end
    object btn_fechar: TButton
      Left = 300
      Top = 352
      Width = 71
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 9
    end
    object msk_cd_grupo: TMaskEdit
      Left = 21
      Top = 62
      Width = 33
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      OnChange = msk_cd_grupoChange
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_grupo: TEdit
      Left = 55
      Top = 62
      Width = 276
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 12
    end
    object msk_cd_cliente: TMaskEdit
      Left = 21
      Top = 102
      Width = 43
      Height = 21
      EditMask = '99999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 1
      OnChange = msk_cd_clienteChange
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 66
      Top = 102
      Width = 265
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 13
    end
    object msk_cd_grupo_item: TMaskEdit
      Left = 21
      Top = 262
      Width = 20
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 6
      OnExit = msk_cd_grupo_itemExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_grupo_item: TEdit
      Left = 45
      Top = 262
      Width = 188
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 14
    end
    object msk_cd_moeda: TMaskEdit
      Left = 21
      Top = 302
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
      TabOrder = 7
      OnExit = msk_cd_moedaExit
      OnKeyDown = msk_cd_grupoKeyDown
    end
    object edt_nm_moeda: TEdit
      Left = 61
      Top = 302
      Width = 172
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 15
    end
    object msk_dt_inicio: TDateTimePicker
      Left = 21
      Top = 223
      Width = 91
      Height = 21
      Date = 37434.000000000000000000
      Time = 37434.000000000000000000
      TabOrder = 4
    end
    object msk_dt_fim: TDateTimePicker
      Left = 141
      Top = 223
      Width = 91
      Height = 21
      Date = 37434.000000000000000000
      Time = 37434.000000000000000000
      TabOrder = 5
    end
  end
  object crp_rel: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 152
    Top = 352
  end
end
