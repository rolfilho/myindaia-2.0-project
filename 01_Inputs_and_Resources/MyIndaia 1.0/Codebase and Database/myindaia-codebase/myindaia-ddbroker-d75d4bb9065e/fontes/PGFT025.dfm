object frm_imp_receitas_operacionais: Tfrm_imp_receitas_operacionais
  Left = 443
  Top = 193
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demonstrativo de Receitas/Despesas Operacionais'
  ClientHeight = 302
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
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
    Width = 377
    Height = 302
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      377
      302)
    object Shape1: TShape
      Left = 8
      Top = 40
      Width = 361
      Height = 217
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label2: TLabel
      Left = 126
      Top = 164
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
      Top = 144
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
    object Label1: TLabel
      Left = 16
      Top = 88
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
      Left = 336
      Top = 104
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 336
      Top = 64
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
    object Shape2: TShape
      Left = 8
      Top = 10
      Width = 359
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label4: TLabel
      Left = 16
      Top = 15
      Width = 236
      Height = 16
      Caption = 'Receitas/Despesas Operacionais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_iniciar: TButton
      Left = 215
      Top = 266
      Width = 71
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = btn_iniciarClick
    end
    object btn_fechar: TButton
      Left = 295
      Top = 266
      Width = 71
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 6
      OnClick = btn_fecharClick
    end
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 192
      Width = 333
      Height = 57
      Caption = '&Ordenado por:'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Receita'
        'Qt. Faturas'
        'M'#233'dia')
      TabOrder = 4
    end
    object mskedt_periodo_final: TMaskEdit
      Left = 144
      Top = 160
      Width = 94
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = mskedt_periodo_finalExit
    end
    object mskedt_periodo_inicial: TMaskEdit
      Left = 16
      Top = 160
      Width = 95
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
      OnExit = mskedt_periodo_inicialExit
    end
    object edt_nm_produto: TEdit
      Left = 48
      Top = 104
      Width = 285
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
    object mskedt_cd_produto: TMaskEdit
      Left = 16
      Top = 104
      Width = 31
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
      OnExit = mskedt_cd_produtoExit
      OnKeyDown = mskedt_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 48
      Top = 64
      Width = 286
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
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
      OnExit = mskedt_cd_unid_negExit
      OnKeyDown = mskedt_cd_unid_negKeyDown
    end
  end
  object Crp_Despesas_nao_faturadas: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 240
    Top = 48
  end
end
