object frm_sel_banco_data: Tfrm_sel_banco_data
  Left = 367
  Top = 222
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Rela'#231#227'o de Cheques / Despesas'
  ClientHeight = 220
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  PrintScale = poNone
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 220
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lbl_data: TLabel
      Left = 14
      Top = 94
      Width = 28
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_banco: TLabel
      Left = 13
      Top = 134
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_banco: TSpeedButton
      Left = 382
      Top = 146
      Width = 25
      Height = 22
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
      OnClick = btn_co_bancoClick
    end
    object lblColigada: TLabel
      Left = 134
      Top = 94
      Width = 50
      Height = 13
      Caption = 'Coligada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_coligada: TSpeedButton
      Left = 382
      Top = 107
      Width = 25
      Height = 22
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
      OnClick = btn_co_coligadaClick
    end
    object lbl_unid_neg: TLabel
      Left = 13
      Top = 14
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
    object btn_co_unid_neg: TSpeedButton
      Left = 382
      Top = 27
      Width = 25
      Height = 22
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
      OnClick = btn_co_unid_negClick
    end
    object lbl_produto: TLabel
      Left = 13
      Top = 54
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
    object btn_co_produto: TSpeedButton
      Left = 382
      Top = 67
      Width = 25
      Height = 22
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
    object btn_imprimir: TButton
      Left = 103
      Top = 181
      Width = 83
      Height = 26
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 235
      Top = 181
      Width = 83
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 6
      OnClick = btn_sairClick
    end
    object msk_cd_banco: TMaskEdit
      Left = 13
      Top = 147
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
      TabOrder = 4
      OnChange = btn_co_bancoClick
      OnExit = msk_cd_bancoExit
      OnKeyDown = msk_cd_bancoKeyDown
    end
    object edt_nm_banco: TEdit
      Left = 53
      Top = 147
      Width = 324
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object msk_cd_coligada: TMaskEdit
      Left = 134
      Top = 108
      Width = 27
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
      OnChange = btn_co_coligadaClick
      OnExit = msk_cd_coligadaExit
      OnKeyDown = msk_cd_bancoKeyDown
    end
    object edt_nm_coligada: TEdit
      Left = 163
      Top = 108
      Width = 214
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 13
      Top = 28
      Width = 36
      Height = 21
      EditMask = '!99;1; '
      MaxLength = 2
      TabOrder = 0
      Text = '  '
      Visible = False
      OnChange = btn_co_unid_negClick
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_bancoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 53
      Top = 28
      Width = 324
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
    object msk_cd_produto: TMaskEdit
      Left = 14
      Top = 68
      Width = 36
      Height = 21
      EditMask = '!99;1; '
      MaxLength = 2
      TabOrder = 1
      Text = '  '
      Visible = False
      OnChange = btn_co_produtoClick
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_bancoKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 53
      Top = 68
      Width = 324
      Height = 21
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
      Visible = False
    end
    object msk_data: TDateEdit
      Left = 14
      Top = 108
      Width = 116
      Height = 21
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object crp_relacao: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 376
    Top = 175
  end
end
