object frm_sel_mes_ano_produto: Tfrm_sel_mes_ano_produto
  Left = 391
  Top = 190
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 202
  ClientWidth = 380
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
    Width = 380
    Height = 202
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      380
      202)
    object Shape1: TShape
      Left = 8
      Top = 8
      Width = 361
      Height = 145
      Anchors = [akLeft, akTop, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_data: TLabel
      Left = 16
      Top = 103
      Width = 145
      Height = 13
      Caption = 'Selecione o m'#234's e o ano:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 57
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
      Left = 336
      Top = 72
      Width = 24
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
      OnClick = btn_co_produtoClick
    end
    object Label1: TLabel
      Left = 16
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
      Left = 336
      Top = 32
      Width = 24
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
      OnClick = btn_co_unid_negClick
    end
    object msk_mes_ano: TMaskEdit
      Left = 16
      Top = 118
      Width = 61
      Height = 21
      EditMask = '!99/9999;1;_'
      MaxLength = 7
      TabOrder = 4
      Text = '  /    '
    end
    object btn_imprimir: TButton
      Left = 222
      Top = 166
      Width = 66
      Height = 26
      Anchors = [akLeft, akBottom]
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 299
      Top = 166
      Width = 66
      Height = 26
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 6
      OnClick = btn_sairClick
    end
    object msk_cd_produto: TMaskEdit
      Left = 16
      Top = 73
      Width = 30
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
      OnExit = msk_cd_produtoExit
    end
    object edt_nm_produto: TEdit
      Left = 48
      Top = 73
      Width = 287
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 33
      Width = 30
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
      Left = 48
      Top = 33
      Width = 287
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
  end
  object crp_Relacao: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 217
    Top = 7
  end
end
