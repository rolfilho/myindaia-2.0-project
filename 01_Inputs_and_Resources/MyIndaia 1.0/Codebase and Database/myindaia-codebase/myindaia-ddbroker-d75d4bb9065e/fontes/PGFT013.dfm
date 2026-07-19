object frm_imp_lanc_fat_cc: Tfrm_imp_lanc_fat_cc
  Left = 211
  Top = 207
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Rela'#231#227'o dos Lan'#231'amentos do Faturamento'
  ClientHeight = 292
  ClientWidth = 387
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
    Width = 387
    Height = 292
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Shape1: TShape
      Left = 8
      Top = 8
      Width = 369
      Height = 233
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 22
      Top = 60
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
      Left = 343
      Top = 73
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
      OnClick = btn_co_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 22
      Top = 17
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
    object btn_co_unid_neg: TSpeedButton
      Left = 343
      Top = 29
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
      OnClick = btn_co_unid_negClick
    end
    object Label2: TLabel
      Left = 22
      Top = 191
      Width = 119
      Height = 13
      Caption = 'Data do Lan'#231'amento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_grupo: TLabel
      Left = 22
      Top = 101
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
      Left = 344
      Top = 114
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
      Visible = False
      OnClick = btn_co_grupoClick
    end
    object lbl_cliente: TLabel
      Left = 22
      Top = 142
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
      Left = 344
      Top = 156
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
      Visible = False
      OnClick = btn_co_clienteClick
    end
    object msk_cd_produto: TMaskEdit
      Left = 22
      Top = 74
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
      TabOrder = 0
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 53
      Top = 74
      Width = 283
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 22
      Top = 30
      Width = 29
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
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 53
      Top = 30
      Width = 284
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_dt_lancamento: TMaskEdit
      Left = 22
      Top = 205
      Width = 81
      Height = 21
      EditMask = '!99/99/9999;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 4
      Text = '  /  /    '
      OnExit = msk_dt_lancamentoExit
    end
    object btn_iniciar: TButton
      Left = 214
      Top = 258
      Width = 73
      Height = 25
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = btn_iniciarClick
    end
    object btn_fechar: TButton
      Left = 298
      Top = 258
      Width = 73
      Height = 25
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 6
      OnClick = btn_fecharClick
    end
    object chk_cliente_ativo: TCheckBox
      Left = 176
      Top = 191
      Width = 95
      Height = 17
      Caption = 'Clientes Ativos'
      Checked = True
      State = cbChecked
      TabOrder = 7
      Visible = False
    end
    object chk_clientes: TCheckBox
      Left = 176
      Top = 215
      Width = 95
      Height = 17
      Caption = 'Apenas Clientes'
      Checked = True
      State = cbChecked
      TabOrder = 8
      Visible = False
    end
    object msk_cd_grupo: TMaskEdit
      Left = 22
      Top = 115
      Width = 30
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 9
      Visible = False
      OnChange = msk_cd_grupoChange
      OnExit = msk_cd_grupoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_grupo: TEdit
      Left = 56
      Top = 115
      Width = 284
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
      Visible = False
    end
    object msk_cd_cliente: TMaskEdit
      Left = 22
      Top = 156
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
      TabOrder = 11
      Visible = False
      OnChange = msk_cd_clienteChange
      OnExit = msk_cd_clienteExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 64
      Top = 156
      Width = 276
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 12
      Visible = False
    end
  end
  object Crp_Lancamento_Faturamento: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 272
    Top = 48
  end
end
