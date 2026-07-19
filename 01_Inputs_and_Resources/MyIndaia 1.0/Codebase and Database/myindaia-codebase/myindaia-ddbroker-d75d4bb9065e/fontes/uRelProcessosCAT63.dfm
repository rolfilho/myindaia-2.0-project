object frmRelProcessosCAT63: TfrmRelProcessosCAT63
  Left = 327
  Top = 258
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 185
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 185
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    Visible = False
    DesignSize = (
      382
      185)
    object Shape2: TShape
      Left = 8
      Top = 10
      Width = 361
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape1: TShape
      Left = 8
      Top = 40
      Width = 361
      Height = 100
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label2: TLabel
      Left = 126
      Top = 156
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
    object Label3: TLabel
      Left = 16
      Top = 136
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
    object btn_cd_empresa: TSpeedButton
      Left = 336
      Top = 112
      Width = 23
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
    end
    object lbl_cd_cliente: TLabel
      Left = 16
      Top = 96
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
    object lbl_cd_unid_neg: TLabel
      Left = 16
      Top = 48
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
      Left = 336
      Top = 64
      Width = 23
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
    end
    object Label4: TLabel
      Left = 16
      Top = 15
      Width = 231
      Height = 16
      Caption = 'Relat'#243'rio Integrado de DrawBack'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_geraplanilha: TButton
      Left = 225
      Top = 149
      Width = 70
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Gerar'
      TabOrder = 4
    end
    object btn_fechar: TButton
      Left = 295
      Top = 149
      Width = 70
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 5
    end
    object mskedt_periodo_final: TMaskEdit
      Left = 144
      Top = 152
      Width = 93
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object mskedt_periodo_inicial: TMaskEdit
      Left = 16
      Top = 152
      Width = 94
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object mskedt_cd_cliente: TMaskEdit
      Left = 16
      Top = 112
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
    end
    object edt_nm_cliente: TEdit
      Left = 62
      Top = 112
      Width = 272
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object mskedt_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 64
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
    end
    object edt_nm_unid_neg: TEdit
      Left = 48
      Top = 64
      Width = 287
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 185
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      382
      185)
    object Shape3: TShape
      Left = 8
      Top = 10
      Width = 361
      Height = 29
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape4: TShape
      Left = 8
      Top = 40
      Width = 361
      Height = 107
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 121
      Top = 114
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
    object Label5: TLabel
      Left = 19
      Top = 96
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
    object Label7: TLabel
      Left = 18
      Top = 51
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
    object SpeedButton3: TSpeedButton
      Left = 334
      Top = 65
      Width = 23
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
      OnClick = SpeedButton3Click
    end
    object Label8: TLabel
      Left = 15
      Top = 18
      Width = 214
      Height = 16
      Caption = 'Relat'#243'rio de processos CAT63'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Button2: TButton
      Left = 299
      Top = 153
      Width = 70
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 6
    end
    object MaskEdit1: TMaskEdit
      Left = 137
      Top = 110
      Width = 93
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object MaskEdit2: TMaskEdit
      Left = 19
      Top = 110
      Width = 94
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object Edit2: TEdit
      Left = 51
      Top = 65
      Width = 282
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object Button1: TButton
      Left = 222
      Top = 153
      Width = 75
      Height = 25
      Caption = '&Gerar'
      TabOrder = 5
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 19
      Top = 65
      Width = 33
      Height = 21
      TabOrder = 0
      OnExit = SpeedButton3Click
      OnKeyDown = Edit1KeyDown
    end
    object chkICMSEmitido: TCheckBox
      Left = 240
      Top = 112
      Width = 98
      Height = 17
      Hint = 'Exibe apenas os processos que estejam com a guia de ICMS emitida'
      Caption = 'Apenas Emitidos'
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 4
    end
  end
end
