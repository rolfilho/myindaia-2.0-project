object frm_sel_cli_periodo: Tfrm_sel_cli_periodo
  Left = 342
  Top = 172
  Width = 368
  Height = 385
  BorderIcons = [biSystemMenu]
  Caption = 'frm_sel_cli_periodo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 360
    Height = 358
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      360
      358)
    object Shape1: TShape
      Left = 8
      Top = 8
      Width = 345
      Height = 308
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_periodo: TLabel
      Left = 14
      Top = 227
      Width = 120
      Height = 13
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_a: TLabel
      Left = 120
      Top = 245
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_cd_cliente: TLabel
      Left = 14
      Top = 134
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
      Left = 303
      Top = 148
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
    object Label2: TLabel
      Left = 14
      Top = 95
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
      Left = 303
      Top = 109
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
    object btn_co_unid: TSpeedButton
      Left = 303
      Top = 30
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
      OnClick = btn_co_unidClick
    end
    object btn_co_prod: TSpeedButton
      Left = 303
      Top = 72
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
      OnClick = btn_co_prodClick
    end
    object Label3: TLabel
      Left = 14
      Top = 56
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label1: TLabel
      Left = 14
      Top = 13
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_cd_armazem: TLabel
      Left = 14
      Top = 173
      Width = 127
      Height = 13
      Caption = 'Armazem de Descarga'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_armazem: TSpeedButton
      Left = 303
      Top = 187
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
      OnClick = btn_co_armazemClick
    end
    object lbl_canal: TLabel
      Left = 14
      Top = 273
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
    object btn_imprimir: TButton
      Left = 204
      Top = 324
      Width = 66
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = '&Imprimir'
      Default = True
      TabOrder = 11
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 281
      Top = 324
      Width = 66
      Height = 26
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 14
      OnClick = btn_sairClick
    end
    object msk_cd_cliente: TMaskEdit
      Left = 14
      Top = 148
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
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 59
      Top = 148
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
      Visible = False
    end
    object edt_nm_grupo: TEdit
      Left = 51
      Top = 109
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object msk_cd_grupo: TMaskEdit
      Left = 14
      Top = 109
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
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object rg_processos_: TRadioGroup
      Left = 261
      Top = 225
      Width = 84
      Height = 64
      ItemIndex = 0
      Items.Strings = (
        'Aberto'
        'Faturado')
      TabOrder = 10
      Visible = False
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 14
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
      Visible = False
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 14
      Top = 73
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
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 51
      Top = 73
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
      Visible = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 51
      Top = 30
      Width = 249
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
      Visible = False
    end
    object msk_dt_inicio: TDateTimePicker
      Left = 14
      Top = 242
      Width = 94
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 12
    end
    object msk_dt_fim: TDateTimePicker
      Left = 146
      Top = 242
      Width = 94
      Height = 21
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 13
    end
    object msk_cd_armazem: TMaskEdit
      Left = 14
      Top = 187
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
      Visible = False
      OnExit = msk_cd_armazemExit
      OnKeyDown = msk_cd_clienteKeyDown
    end
    object edt_nm_armazem: TEdit
      Left = 59
      Top = 187
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
      Visible = False
    end
    object cbo_canal: TComboBox
      Left = 16
      Top = 288
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 15
      Text = 'cbo_canal'
    end
  end
  object crp_cli_periodo: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 238
    Top = 58
  end
end
