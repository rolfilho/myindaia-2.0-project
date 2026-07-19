object frmOiValorPorAdicao: TfrmOiValorPorAdicao
  Left = 803
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DI - Valor por Adi'#231#227'o'
  ClientHeight = 280
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 571
    Height = 239
    Align = alClient
    TabOrder = 0
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 8
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
      Transparent = True
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 185
      Top = 20
      Width = 23
      Height = 21
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
    object lbl_cd_produto: TLabel
      Left = 217
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_produto: TSpeedButton
      Left = 394
      Top = 20
      Width = 23
      Height = 21
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
    object btn_co_processo: TSpeedButton
      Left = 533
      Top = 20
      Width = 23
      Height = 21
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
      OnClick = btn_co_processoClick
    end
    object lbl_nr_processo: TLabel
      Left = 430
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 8
      Top = 109
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnGrupo: TSpeedButton
      Left = 185
      Top = 121
      Width = 23
      Height = 21
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
      OnClick = btnGrupoClick
    end
    object Label2: TLabel
      Left = 217
      Top = 109
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnEmpresa: TSpeedButton
      Left = 394
      Top = 121
      Width = 23
      Height = 21
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
      OnClick = btnEmpresaClick
    end
    object Label3: TLabel
      Left = 9
      Top = 58
      Width = 227
      Height = 13
      Caption = 'Per'#237'odo de Registro de DI - Evento 021'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 84
      Top = 78
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
      Left = 267
      Top = 58
      Width = 145
      Height = 13
      Caption = 'Per'#237'odo de C'#225'lculo de DI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 348
      Top = 78
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
    object Label7: TLabel
      Left = 11
      Top = 149
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = #193'rea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnArea: TSpeedButton
      Left = 185
      Top = 161
      Width = 23
      Height = 21
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
      OnClick = btnAreaClick
    end
    object Label8: TLabel
      Left = 217
      Top = 149
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Mercadoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnMercadoria: TSpeedButton
      Left = 394
      Top = 161
      Width = 23
      Height = 21
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
      OnClick = btnMercadoriaClick
    end
    object Label9: TLabel
      Left = 11
      Top = 191
      Width = 28
      Height = 13
      Caption = 'NCM'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 20
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 38
      Top = 20
      Width = 149
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_produto: TMaskEdit
      Left = 217
      Top = 20
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 2
      OnChange = btn_co_produtoClick
    end
    object edt_nm_produto: TEdit
      Left = 247
      Top = 20
      Width = 149
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object msk_nr_processo: TMaskEdit
      Left = 429
      Top = 20
      Width = 100
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      OnKeyDown = msk_nr_processoKeyDown
    end
    object mskGrupo: TMaskEdit
      Left = 8
      Top = 121
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      MaxLength = 3
      ParentCtl3D = False
      TabOrder = 9
      OnChange = btnGrupoClick
    end
    object edtGrupo: TEdit
      Left = 38
      Top = 121
      Width = 147
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
    end
    object mskEmpresa: TMaskEdit
      Left = 217
      Top = 121
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 11
      OnChange = btnEmpresaClick
    end
    object edtEmpresa: TEdit
      Left = 247
      Top = 121
      Width = 149
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 12
    end
    object mskDataIni: TMaskEdit
      Left = 10
      Top = 74
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
      Text = '  /  /    '
    end
    object mskDataFin: TMaskEdit
      Left = 98
      Top = 74
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 6
      Text = '  /  /    '
    end
    object mskDataFinCalc: TMaskEdit
      Left = 368
      Top = 74
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 8
      Text = '  /  /    '
    end
    object mskDataIniCalc: TMaskEdit
      Left = 267
      Top = 74
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!00/00/0000;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 7
      Text = '  /  /    '
    end
    object mskArea: TMaskEdit
      Left = 8
      Top = 161
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 13
      OnChange = btnAreaClick
    end
    object edtArea: TEdit
      Left = 38
      Top = 161
      Width = 147
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 14
    end
    object mskMercadoria: TMaskEdit
      Left = 217
      Top = 161
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      MaxLength = 3
      ParentCtl3D = False
      TabOrder = 15
      OnChange = btnMercadoriaClick
    end
    object edtMercadoria: TEdit
      Left = 249
      Top = 161
      Width = 147
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 16
    end
    object mskNcm: TMaskEdit
      Left = 11
      Top = 207
      Width = 102
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      MaxLength = 8
      ParentCtl3D = False
      TabOrder = 17
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 239
    Width = 571
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      571
      41)
    object btn_sair: TSpeedButton
      Left = 479
      Top = 5
      Width = 83
      Height = 30
      Hint = 'Sair'
      Anchors = [akRight, akBottom]
      Caption = '&Sair'
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
    object SpeedButton2: TSpeedButton
      Left = 391
      Top = 5
      Width = 83
      Height = 30
      Hint = 'Sair'
      Anchors = [akRight, akBottom]
      Caption = 'Visualizar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Arquivo CSV|*.csv'
    Left = 497
    Top = 49
  end
end
