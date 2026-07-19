object frm_followup: Tfrm_followup
  Left = 422
  Top = 250
  Width = 1018
  Height = 673
  Align = alCustom
  BorderIcons = [biMaximize]
  Caption = 'Controle Geral de FollowUp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    1002
    635)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_selecao: TPanel
    Left = 0
    Top = 52
    Width = 1002
    Height = 154
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      1002
      154)
    object shp4: TShape
      Left = 4
      Top = 50
      Width = 994
      Height = 103
      Anchors = [akLeft, akTop, akRight, akBottom]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp32: TShape
      Left = 599
      Top = 54
      Width = 135
      Height = 14
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp31: TShape
      Left = 486
      Top = 54
      Width = 111
      Height = 14
      Brush.Color = clSilver
      Pen.Color = clGray
      Visible = False
    end
    object shp12: TShape
      Left = 637
      Top = 52
      Width = 95
      Height = 14
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object shp18: TShape
      Left = 370
      Top = 54
      Width = 114
      Height = 14
      Brush.Color = clSilver
      Pen.Color = clGray
      Visible = False
    end
    object shp19: TShape
      Left = 487
      Top = 68
      Width = 109
      Height = 32
      Brush.Style = bsClear
      Pen.Color = clWhite
      Visible = False
    end
    object shp20: TShape
      Left = 486
      Top = 67
      Width = 111
      Height = 34
      Brush.Style = bsClear
      Visible = False
    end
    object shp28: TShape
      Left = 490
      Top = 81
      Width = 39
      Height = 16
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object shp2: TShape
      Left = 600
      Top = 68
      Width = 133
      Height = 32
      Brush.Style = bsClear
      Pen.Color = clWhite
    end
    object shp1: TShape
      Left = 599
      Top = 67
      Width = 135
      Height = 34
      Brush.Style = bsClear
    end
    object shp3: TShape
      Left = 4
      Top = 4
      Width = 780
      Height = 43
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_cd_cliente: TLabel
      Left = 16
      Top = 55
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl_nr_processo: TLabel
      Left = 462
      Top = 7
      Width = 44
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_processo: TSpeedButton
      Left = 576
      Top = 19
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
      OnClick = btn_processoClick
    end
    object lbl1: TLabel
      Left = 236
      Top = 7
      Width = 37
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_cd_produto: TSpeedButton
      Left = 425
      Top = 19
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
      OnClick = btn_cd_produtoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 17
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btn_cd_unid_neg: TSpeedButton
      Left = 203
      Top = 19
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
      OnClick = btn_cd_unid_negClick
    end
    object lbl_cd_servico: TLabel
      Left = 308
      Top = 55
      Width = 36
      Height = 13
      Caption = 'Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lbl_canal: TLabel
      Left = 602
      Top = 56
      Width = 26
      Height = 11
      Caption = 'Canal '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      OnClick = lbl_canalClick
    end
    object shp16: TShape
      Left = 371
      Top = 68
      Width = 112
      Height = 32
      Brush.Style = bsClear
      Pen.Color = clWhite
      Visible = False
    end
    object shp17: TShape
      Left = 370
      Top = 67
      Width = 114
      Height = 34
      Brush.Style = bsClear
      Visible = False
    end
    object lbl14: TLabel
      Left = 373
      Top = 69
      Width = 15
      Height = 11
      Caption = 'KPI'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl19: TLabel
      Left = 489
      Top = 69
      Width = 54
      Height = 11
      Caption = 'Faturamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl21: TLabel
      Left = 373
      Top = 83
      Width = 36
      Height = 11
      Caption = 'Previsto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4868682
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl22: TLabel
      Left = 438
      Top = 83
      Width = 41
      Height = 11
      Caption = 'Realizado'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4868682
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl23: TLabel
      Left = 423
      Top = 83
      Width = 6
      Height = 11
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4868682
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object shp25: TShape
      Left = 374
      Top = 81
      Width = 41
      Height = 16
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object shp26: TShape
      Left = 439
      Top = 81
      Width = 41
      Height = 16
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object shp27: TShape
      Left = 416
      Top = 81
      Width = 22
      Height = 16
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object lbl24: TLabel
      Left = 489
      Top = 83
      Width = 36
      Height = 11
      Caption = 'Previsto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4868682
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object shp29: TShape
      Left = 530
      Top = 81
      Width = 22
      Height = 16
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object lbl25: TLabel
      Left = 537
      Top = 83
      Width = 6
      Height = 11
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4868682
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl26: TLabel
      Left = 552
      Top = 83
      Width = 41
      Height = 11
      Caption = 'Realizado'
      Font.Charset = ANSI_CHARSET
      Font.Color = 4868682
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object shp30: TShape
      Left = 553
      Top = 81
      Width = 40
      Height = 16
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object lbl27: TLabel
      Left = 377
      Top = 84
      Width = 35
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl28: TLabel
      Left = 442
      Top = 84
      Width = 35
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl29: TLabel
      Left = 555
      Top = 84
      Width = 35
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl30: TLabel
      Left = 493
      Top = 96
      Width = 2
      Height = 11
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl31: TLabel
      Left = 419
      Top = 84
      Width = 17
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl32: TLabel
      Left = 533
      Top = 84
      Width = 17
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lbl33: TLabel
      Left = 493
      Top = 84
      Width = 33
      Height = 11
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'Small Fonts'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object lblNomeUsuarioCanal: TLabel
      Left = 640
      Top = 52
      Width = 89
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnAbreCanais: TSpeedButton
      Left = 717
      Top = 70
      Width = 15
      Height = 29
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
      OnClick = btnAbreCanaisClick
    end
    object lblConsultaMantraCaption: TLabel
      Left = 18
      Top = 136
      Width = 80
      Height = 13
      Caption = 'Consulta Mantra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object dbtxtConsultaMantra: TDBText
      Left = 102
      Top = 136
      Width = 97
      Height = 13
      Cursor = crHandPoint
      AutoSize = True
      DataField = 'TX_SITUACAO'
      DataSource = dsConsultaMatra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      Transparent = True
      Visible = False
      OnClick = dbtxtConsultaMantraClick
    end
    object btnProcessoFatoresEvento: TSpeedButton
      Left = 748
      Top = 7
      Width = 33
      Height = 37
      Hint = 'Fatores deste Followup'
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9999994D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D999999FF00FFFF00FFFF00FFFF00FF595659
        D0D9D9EAFFFFD6FDFFCCD1D1EDF9F9D6FDFFD6FDFFD0D1D1EEFFFFD6FDFFD6FD
        FFDADCDCEBFFFFD6FDFFD6FDFFE5EBEBE5FFFFEAFFFF4D4D4DFF00FFFF00FFFF
        00FF666633999999F2F0F5D6FDFFD6FDFFC7CCCDF3F7F7D6FDFFD6FDFFCFCCCC
        F3FFFFD6FDFFD6FDFFDDD7D7EBFFFFD6FDFFD6FDFFEEECECE7FFFFE3FFFF4D4D
        4DFF00FFFF00FFFF00FF008D00666633FFFFFFFFFCFFDEE9EBBBC2C2C4C1C1F0
        EDEDD6E5E6B6B7B7D3D0D0EFEFEFCCDCDDB4B1B1F1F0F0F9FDFDBBC3C3AEAFB0
        D5D5D5FFFFFF4D4D4DFF00FFFF00FFFF00FF55AB3630AE1E666633FFFFFFDDDF
        EABCC1C1C6D6D7C6D6D7C7D4D5BEC2C3C8DADBC7D7D9C2CBCCCCCFCFB9BEBC66
        66664D4D4D4D4D4D4D4D4D4D4D4D999999FF00FFFF00FFFF00FF55B13600CC00
        00CF00666633FFFFFFDFD8E4EFF9FAD6FDFFD6FDFFCFCDCDF0FFFFD8FFFFD6FD
        FFBBBDBC666666D0C9C5E2FFFFBABEBFD1DEE1B19A9C4D4D4DFF00FFFF00FFFF
        00FF55AE3600CC0000E90000CB00666633FFFFFFFFFFFFD6FDFFD6FDFFC8C7C8
        F0FAFAEAFFFFC9DEDE6666667E76E6A3C1FDD9FFFFC6F3F7D3FFFFB9D2D3C2AB
        AD4D4D4DFF00FFFF00FF55AE3600CC0000E20000E40000CB00666633FFFFFFE6
        DBE1CDD6D7B6B6B6C8C4C4EFEFEF666666B9A6A6D8F4F87F81F6A0BFF9E0FFFF
        D3FDFECFFEFFDBEBEC897D7E4D4D4DFF00FF55AE3600CC0000E20000DE002DE8
        3630AA29FFFFFFD6FDFFD6FDFFC2C8C8D1EBEDD6FDFF666666B59F9FBFEBEBEA
        FAFF8485FB5B648E869993D4FFFFD1FAFDC8B5B74D4D4DFF00FF55AE3600CC00
        00E4002DE83600CC00BCD1B5FBFFFFD7FEFFD6FDFFCFCDCDEFFFFFD6FDFF6666
        66D1CACACBFFFFD9FFFF9DAAB2A3BDC5C9F4F6D2FFFFADC2C3C5AFB14D4D4DFF
        00FF50AD3000CC002DE83600CC00C5E8C4D1CDD4DDDFDFF2FFFFEDFBFBC3C2C2
        E8F0F0F8FFFF666666B8A4A4D4F8F8D9FFFF829496A4C1C3D5FFFFD0FEFFDDEF
        F1897D7E4D4D4DFF00FF62B2462DE83600CC00B6CDB0D4D2DDB8BCBBBBBCBBD0
        CECECECCCCB8B8B8C1C1C1D6D6D6C9D7D8666666AA9D9DD8FFFF819798A2C3C4
        DBFFFFB7D3D3C2ABAD4D4D4DFF00FFFF00FF55A73100CC00C4E6C9D6FDFFD6FD
        FFC4CACBDCF3F5D6FDFFD6FDFFC6CBCCDEFAFDD6FDFFD6FDFFBBBABA666666C1
        ABAB9D9E9FB7BBBDCCE6E9A7ABAD4D4D4DFF00FFFF00FFFF00FF00CC00999999
        EEEAF1D6FDFFDAFFFFC7CCCDF2F8F9D6FDFFD6FDFFCFCDCDF0FFFFD6FEFFD6FD
        FFDFDBDBCCD6D66666666666666666666666664D4D4D999999FF00FFFF00FFFF
        00FFFF00FF5B585BB1B0AEFAFEFDE9FDFEBEC6C6D3D1D1F8FEFEDDF4F5BCBBBB
        E1E2E2F8FFFFD2E6E8BEBABAF8F5F5F2FAFBBDCDCFC4C5C5E3E3E3FFFFFF4D4D
        4DFF00FFFF00FFFF00FFFF00FF616363B69494D29C9BCB9898C79595C79393CE
        9998CB9897C69493C99594CF9A99CA9897C79392CA9796CD9A9ACF9E9DD09D9B
        D19E9DD4A0A04D4D4DFF00FFFF00FFFF00FFFF00FF5C5E5DCFB9BBE8BDC0DFB6
        B8E0B7B9E0B7B8E0B7B8E1B8B9E1B8B9E1B8B8E0B7B9E0B7B8E1B8B9E0B7B8E1
        B7B8E0B8B9E2B9BBDDB1B2D79D9B4D4D4DFF00FFFF00FFFF00FFFF00FF999999
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666999999FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnProcessoFatoresEventoClick
    end
    object lblStatusSiscarga: TLabel
      Left = 792
      Top = 4
      Width = 74
      Height = 13
      Caption = 'Status Siscarga'
      Visible = False
    end
    object lbl_representante: TLabel
      Left = 217
      Top = 92
      Width = 70
      Height = 13
      Caption = 'Representante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object nbCanais: TNotebook
      Left = 603
      Top = 70
      Width = 113
      Height = 26
      Color = clSilver
      PageIndex = 6
      ParentColor = False
      TabOrder = 6
      object TPage
        Left = 0
        Top = 0
        Caption = 'Vermelho'
        object lbl3: TLabel
          Left = 29
          Top = 7
          Width = 53
          Height = 13
          Caption = 'Vermelho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shp10: TShape
          Left = 4
          Top = 4
          Width = 17
          Height = 19
          Brush.Color = clRed
          Shape = stCircle
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Amarelo'
        object shp9: TShape
          Left = 4
          Top = 4
          Width = 17
          Height = 19
          Brush.Color = clYellow
          Shape = stCircle
        end
        object lbl4: TLabel
          Left = 29
          Top = 7
          Width = 46
          Height = 13
          Caption = 'Amarelo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Verde'
        object lbl5: TLabel
          Left = 29
          Top = 7
          Width = 34
          Height = 13
          Caption = 'Verde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shp6: TShape
          Left = 4
          Top = 4
          Width = 17
          Height = 19
          Brush.Color = clLime
          Shape = stCircle
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Cinza'
        object lbl7: TLabel
          Left = 29
          Top = 7
          Width = 32
          Height = 13
          Caption = 'Cinza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shp8: TShape
          Left = 4
          Top = 4
          Width = 17
          Height = 19
          Brush.Color = clGray
          Shape = stCircle
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'BRANCO'
        object lbl18: TLabel
          Left = 5
          Top = 7
          Width = 103
          Height = 13
          Caption = 'aguardando canal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Verde Bloqueado'
        object lbl6: TLabel
          Left = 29
          Top = 7
          Width = 67
          Height = 13
          Caption = 'Verde Bloq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object shp7: TShape
          Left = 4
          Top = 4
          Width = 17
          Height = 19
          Brush.Color = clLime
          Shape = stCircle
        end
        object imgNaoFume: TImage
          Left = 5
          Top = 6
          Width = 15
          Height = 16
          Picture.Data = {
            07544269746D617076010000424D760100000000000076000000280000002000
            000010000000010004000000000000010000130B0000130B0000100000000000
            0000000000000000800000800000008080008000000080008000808000007F7F
            7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF003333333333333333333333FFFFF3333333333999993333333333F77777FF
            F3333339999999993333333777333777FF3333993333339993333377FF333337
            7FF3399993333339993337777FF3333377F3393999333333993337F777FF3333
            37FF993399933333399377F3777FF333377F993339993333399377F33777FF33
            377F993333999333399377F333777FF3377F993333399933399377F3333777FF
            377F993333339993399377FF3333777FF7733993333339993933373FF3333777
            F7F339993333339999333773FF3333777733339993333339933333773FFFFFF7
            7333333999999999333333377733377733333333399999333333333337777733
            3333}
          Transparent = True
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Todos'
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 52
          Height = 13
          Caption = 'N'#227'o usado'
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Laranja'
        object Shape3: TShape
          Left = 4
          Top = 4
          Width = 17
          Height = 19
          Brush.Color = 44799
          Shape = stCircle
        end
        object Label2: TLabel
          Left = 29
          Top = 7
          Width = 43
          Height = 13
          Caption = 'Laranja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object edt_nm_produto: TEdit
      Left = 264
      Top = 20
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object edt_nm_unid_neg: TEdit
      Left = 42
      Top = 20
      Width = 160
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object dbedt_cd_cliente: TEdit
      Left = 17
      Top = 68
      Width = 39
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 8
      OnChange = dbedt_cd_clienteChange
    end
    object dbedt_cd_servico: TEdit
      Left = 309
      Top = 68
      Width = 39
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 10
      OnChange = dbedt_cd_servicoChange
    end
    object dbedt_nm_cliente: TEdit
      Left = 57
      Top = 68
      Width = 237
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 9
    end
    object dbedt_nm_servico: TEdit
      Left = 349
      Top = 68
      Width = 233
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 11
    end
    object chkProcessos: TCheckBox
      Left = 605
      Top = 22
      Width = 124
      Height = 17
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object btn1: TSpinButton
      Left = 693
      Top = 70
      Width = 15
      Height = 28
      Ctl3D = True
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      Enabled = False
      ParentCtl3D = False
      TabOrder = 7
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      Visible = False
      OnDownClick = btn1DownClick
      OnUpClick = btn1UpClick
    end
    object pnlProcessoUrgente: TPanel
      Left = 18
      Top = 129
      Width = 276
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelInner = bvLowered
      Caption = 'Processo Urgente'
      Color = clRed
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 12
      Visible = False
    end
    object pnlDemurrage: TPanel
      Left = 382
      Top = 129
      Width = 273
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelInner = bvLowered
      Caption = 'Demurrage'
      Color = clRed
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 13
      Visible = False
    end
    object lbledt_cnpj: TLabeledEdit
      Left = 17
      Top = 106
      Width = 153
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'CNPJ'
      EditLabel.Transparent = True
      ParentCtl3D = False
      TabOrder = 14
    end
    object pnlDesembaracoSobreAguas: TPanel
      Left = 712
      Top = 129
      Width = 276
      Height = 21
      Anchors = [akLeft, akBottom]
      BevelInner = bvLowered
      Caption = 'Desembara'#231'o Sobre '#193'guas'
      Color = clRed
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 15
      Visible = False
    end
    object pnlStatusSiscarga: TPanel
      Left = 792
      Top = 21
      Width = 201
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      BorderWidth = 4
      Caption = 'N'#227'o Consultado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      Visible = False
    end
    object dbedt_nm_representante: TEdit
      Left = 257
      Top = 106
      Width = 328
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 17
    end
    object dbedt_cd_representante: TEdit
      Left = 216
      Top = 106
      Width = 39
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BorderStyle = bsNone
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 18
      OnChange = dbedt_cd_representanteChange
    end
    object medt_nr_processo: TcxMaskEdit
      Left = 462
      Top = 20
      AutoSize = False
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      OnClick = medt_nr_processoChange
      OnExit = medt_nr_processoExit
      OnKeyPress = medt_nr_processoKeyPress
      Height = 21
      Width = 113
    end
    object medt_cd_produto: TcxMaskEdit
      Left = 234
      Top = 20
      AutoSize = False
      Properties.MaxLength = 2
      TabOrder = 2
      OnClick = btn_cd_produtoClick
      OnExit = medt_cd_produtoExit
      Height = 21
      Width = 29
    end
    object medt_cd_unid_neg: TcxMaskEdit
      Left = 16
      Top = 20
      AutoSize = False
      Properties.MaxLength = 2
      TabOrder = 0
      OnClick = btn_cd_unid_negClick
      OnExit = medt_cd_unid_negExit
      Height = 21
      Width = 25
    end
  end
  object pnl_manut_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 1002
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      1002
      52)
    object btnAtualizaFollowup: TSpeedButton
      Left = 247
      Top = 6
      Width = 37
      Height = 41
      Hint = 
        'Atualizar o Followup'#13#10'Os eventos ser'#227'o recriados e alterados de ' +
        'acordo com as informa'#231#245'es de Fatores.'
      Enabled = False
      Flat = True
      Glyph.Data = {
        B60D0000424DB60D000000000000360000002800000030000000180000000100
        180000000000800D0000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF908E8E908E8E908E8E908E
        8E908E8E908E8EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F8F
        8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90
        8E8E908E8E9F9C9CA4A4A4A9A9A9ABABABA9A9A99C9C9C9C9C9C9C9C9CFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF8F8F8F8F8F8F9D9D9DA4A4A4A9A9A9ABABABA9A9A99C9C9C9C
        9C9C9C9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF908E8E919090B4ACAAD0C6C5D0C6C5C5BCBDBBBBBCBBBB
        BCC8C7C8D7D6D7D1D1D2B2B1B19190909C9C9CFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F8F909090AFAFAFCACACACACACA
        C0C0C0BBBBBBBBBBBBC7C7C7D6D6D6D1D1D1B1B1B19090909C9C9CFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF908E8EAA9F9FDAC6C5D6
        C3C49F9493867E74958A789D96829D968288867C8A8883B6B6B6E3E4E5DAD9D9
        A3A3A39C9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F8F
        8FA4A4A4CFCFCFCCCCCC9999997D7D7D8686868F8F8F8F8F8F828282868686B6
        B6B6E4E4E4D9D9D9A3A3A39C9C9CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF908E8EB3A5A5EBCFCFB6A3A37D746BB0AA95E6E3D2FCF8EA849AF5C8CF
        F0FCF5E3D9D5BDA29B888D8C87D7D6D7EEEDEDABABAB9C9C9CFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF8F8F8FACACACDDDDDDACACAC747474A2A2A2DCDCDC
        F3F3F3BCBCBCDCDCDCEFEFEFCBCBCB9595958A8A8AD6D6D6EDEDEDABABAB9C9C
        9CFF00FFFF00FFFF00FFFF00FFFF00FF908E8EAA9F9FF0CFCFA99595827D6FE6
        E3D2FFFFFFFFFBF2FAE6CEAC9FBED3BEBCFAE3C6FCF5E3FFFFECCCCAB18D8B84
        D7D7D8EEEDEDA4A3A39C9C9CFF00FFFF00FFFF00FFFF00FF8F8F8FA4A4A4DFDF
        DF9F9F9F787878DCDCDCFFFFFFF8F8F8E4E4E4AEAEAEC7C7C7E0E0E0EFEFEFF5
        F5F5BEBEBE888888DCDCDCEDEDEDA3A3A39C9C9CFF00FFFF00FFFF00FFFF00FF
        949090E7C6C7BCA2A180786AF0F0E5FFFFFFFBF5DFF6D7AAEFBC85F8BF80F4C1
        87F1C591F4D1A2FAE6C7FFFFECD9D5BD477F4747944AD8DDD89C9C9CFF00FFFF
        00FFFF00FFFF00FF929292D6D6D6AEAEAE757575EAEAEAFFFFFFEDEDEDD0D0D0
        BABABABCBCBCBDBDBDC1C1C1CBCBCBE0E0E0F5F5F5D3D3D3777777818181DADA
        DA9C9C9CFF00FFFF00FFFF00FF908E8EBFABABE8C2C3776B61E4DECEFFFFFFFD
        F4D2F8E2B5F3CD9BF0C18EF2C997F6D7AAF8E2B5FAE9BDFCEDC2FDF4D29DC694
        249C3932AD4D68A76AB6B6B69C9C9CFF00FFFF00FF8F8F8FB5B5B5D5D5D56C6C
        6CD9D9D9FFFFFFE7E7E7D6D6D6C7C7C7BFBFBFC4C4C4D0D0D0D6D6D6DBDBDBDF
        DFDFE7E7E7BCBCBC7474748383839B9B9BB6B6B69C9C9CFF00FFFF00FF908E8E
        EAC7C6A58D8CA29B88FFFFFFFAE3C6F7D19DF3CD9BF2C997F4D1A2F9E5B8FBF4
        CBFEFCD5FFFFD8FFFFD8B4D39A1F8E2D54DA805CE58C249C3983B3849C9C9CFF
        00FFFF00FF8F8F8FD8D8D8989898959595FFFFFFE0E0E0CACACAC7C7C7C4C4C4
        CBCBCBD8D8D8E3E3E3E9E9E9EBEBEBEBEBEBB6B6B6686868ABABABB3B3B37474
        749B9B9B9C9C9CFF00FFA59A9BA89C9CEEC8C87D7067DBD8C4FFF6E9F0C18EEF
        BC85F1C591F5D5A5FCEDC2FFFFDAFFFFDDFFFFDAFFFFDAD8E9B9268F2F52DA7E
        5CE58C52DA7E45D06B148A225386559C9C9C9F9F9FA2A2A2DBDBDB727272CFCF
        CFF4F4F4BFBFBFBABABAC1C1C1CDCDCDDFDFDFECECECEEEEEEECECECECECECD1
        D1D16E6E6EAAAAAAB3B3B3AAAAAA9E9E9E6363638080809C9C9CA59A9BB9A7A7
        E5BFBE7D7067FFFEE9FEE2C3EEB77FFBC58EFFDAA7FBF4CBFEFCD5CCCAB1E6E7
        C8FFFFDAD8E9B93693384ED5785DE9904ED57842CE673AC95C2CBB4714881C9C
        9C9C9F9F9FB0B0B0D1D1D1727272F4F4F4E0E0E0B6B6B6C4C4C4D3D3D3E3E3E3
        E9E9E9BEBEBED7D7D7F0F0F0D1D1D1787878A5A5A5B6B6B6A5A5A59C9C9C9595
        958787876262629C9C9CA59A9BC1ACACE0BABA867E72ABB9F2D4BAB4EEB77F9C
        8468958A789D9C8A76766B66666988867CEAECCA398B381C8C262CA7452CA745
        42CE6735C3542BBA451CA52E12981E05730B9F9F9FB6B6B6CDCDCD7C7C7CCECE
        CEC4C4C4B6B6B6828282868686939393707070676767828282DBDBDB75757568
        68687D7D7D7D7D7D9C9C9C909090868686747474696969505050A59A9BC1ACAC
        E0BABA867E74768FEEBFAAB6EFBC85605A4F51514C51514C2727297272758D8B
        84E2EBC2B4D39AB9D7ACB2D1B227882C35C3542CBD471EAB312484294E8E5105
        730B9F9F9FB6B6B6CDCDCD7D7D7DB2B2B2B4B4B4BABABA6B6B6B626262626262
        3C3C3C737373888888D6D6D6B6B6B6C1C1C1C1C1C16B6B6B9090908888887878
        78686868828282505050A59A9BB7A5A5E8C2C381796FFBF5DFF7DDB6F0C08BFA
        DDAEFBF4CB6D6C61414241A9A996E6E7C8FFFFDAFFFFE6FFFFFEFFFFFF409545
        26B33D1FB43412981E74AF77AFAFAF9C9C9C9F9F9FAEAEAED5D5D5787878EDED
        EDD6D6D6BDBDBDDCDCDCE9E9E97B7B7B5555559F9F9FD7D7D7ECECECF2F2F2FE
        FEFEFFFFFF7E7E7E8080807D7D7D696969919191AFAFAF9C9C9CA59A9BA59A9B
        EEC8C88A7D7AD9D5BDFEEED4F7D19DF7DDB66D6C61414241D6D6BBFFFFE2FFFF
        DDFFFEE9FFFFFEFFFFFFF5F9F5288A2E1CAC2F12AA220A8B13B2D1B29C9C9C9C
        9C9C9F9F9F9F9F9FDBDBDB828282CBCBCBE9E9E9D3D3D3DEDEDE7B7B7B555555
        D1D1D1F0F0F0EEEEEEF4F4F4FEFEFEFFFFFFF8F8F86D6D6D7878787272725E5E
        5EC1C1C19C9C9C9C9C9CFF00FFA59A9BE6C4C3B79E9FA4A28FFFFEE9E0CAA954
        4D444A4A47E3E3C5FFFFE2FFFFE2FFFFF4FFFFFFFFFFFFFFFFFFA9CDAB0D8817
        12AA220DA11A27882CD6D9D5979696FF00FFFF00FF9F9F9FD4D4D4AAAAAA9999
        99F4F4F4CECECE6060605C5C5CDCDCDCF4F4F4F0F0F0F9F9F9FFFFFFFFFFFFFF
        FFFFC6C6C65E5E5E7272726B6B6B6B6B6BD7D7D7969696FF00FFFF00FFA59A9B
        B9A7A7EEC8C88C8380E6E4C5C0BDB0565650E6E4C5FFFFEEFFFFF3FFFFFDFFFF
        FFFFFFFFFFFFFFE4EADD288A2E0E9D190FA91D0A8C1383B384B2B1B1979696FF
        00FFFF00FF9F9F9FB0B0B0DBDBDB868686D5D5D5B8B8B8676767DDDDDDF8F8F8
        F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFE8E8E86D6D6D6969697070705F5F5F9B9B
        9BB1B1B1969696FF00FFFF00FFFF00FF908E8EE1C2C2CFB4B496938AEAECCAFE
        FBDCFFFFECFFFFFFFFFFFFFCFDFCF5F9F5CCE1CD7AB27C228A280E9D190FA91D
        0B931647944AD0D6D0979696FF00FFFF00FFFF00FFFF00FF8F8F8FD1D1D1C1C1
        C1909090DBDBDBF2F2F2F7F7F7FFFFFFFFFFFFFCFCFCF8F8F8DDDDDDA5A5A56A
        6A6A696969707070636363818181D3D3D3969696FF00FFFF00FFFF00FFFF00FF
        979696A29A9AEACAC9C5AFB0A09D94E6E7C8FFFFF3FFFFFE4C994F2383341B84
        210D85160E941A0EA31B0DA11A0A8B133D8E41D8DDD89C9C9C979696FF00FFFF
        00FFFF00FFFF00FF9696969E9E9ED9D9D9BABABA9A9A9AD7D7D7F9F9F9FEFEFE
        8686866767676363635D5D5D6565656C6C6C6B6B6B5E5E5E797979DADADA9C9C
        9C969696FF00FFFF00FFFF00FFFF00FFFF00FF979696AA9F9FE5C9C8CFBABBA5
        9F9BC4C3B2E4EADD93BF8D4092532C8B321C8C2614881C1B8421398B387DAE80
        D8DDD8A3A3A3979696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696A4A4
        A4D6D6D6C4C4C4A0A0A0BBBBBBE3E3E3A6A6A67D7D7D6F6F6F68686862626263
        6363757575A5A5A5E0E0E0A3A3A3969696FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF979696A29A9AD3BEBCDBC8C9C1B5B6B4ACAABDB6AECDC1B0C8BD
        AFBDB6AEBCB8B6D1D1D2E3E4E5D1D0D09A9A9A979696FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF9696969E9E9EC7C7C7D1D1D1BBBBBBAFAFAF
        B5B5B5BEBEBEBBBBBBB5B5B5B9B9B9D1D1D1E9E9E9D8D8D89A9A9A969696FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF979696979696A9
        A5A5C5BCBDD0C6C5C8C2C3C2C2C3C5C6C8CCCCCDD3D2D3C8C7C8A9A9A9979696
        979696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF969696969696A7A7A7C0C0C0CACACAC5C5C5C2C2C2C6C6C6CCCCCCD2D2D2C7
        C7C7A9A9A9969696969696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF979696979696979696A19F9FA3A3A3A4A4
        A4A0A0A0979696979696979696FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF969696969696969696
        A0A0A0A3A3A3A4A4A4A0A0A0969696969696969696FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF908E8E908E8E908E8E908E8E908E8E908E8EFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8FFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnAtualizaFollowupClick
    end
    object btn_sair: TSpeedButton
      Left = 344
      Top = 6
      Width = 38
      Height = 41
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
      OnClick = btn_sairClick
    end
    object btn_manut_proc: TSpeedButton
      Left = 5
      Top = 6
      Width = 42
      Height = 41
      Hint = 'Manuten'#231#227'o do Processo - <F2>'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555550FF0559
        1950555FF75F7557F7F757000FF055591903557775F75557F77570FFFF055559
        1933575FF57F5557F7FF0F00FF05555919337F775F7F5557F7F700550F055559
        193577557F7F55F7577F07550F0555999995755575755F7FFF7F5570F0755011
        11155557F755F777777555000755033305555577755F75F77F55555555503335
        0555555FF5F75F757F5555005503335505555577FF75F7557F55505050333555
        05555757F75F75557F5505000333555505557F777FF755557F55000000355557
        07557777777F55557F5555000005555707555577777FF5557F55553000075557
        0755557F7777FFF5755555335000005555555577577777555555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_manut_procClick
    end
    object btn_proc_vinc: TSpeedButton
      Left = 97
      Top = 6
      Width = 42
      Height = 41
      Hint = 'Realiza'#231#227'o do Processo Vinculado'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
        55555575555555775F55509999999901055557F55555557F75F5001111111101
        105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
        01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
        0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
        0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
        0005555555575FF7777555555555000555555555555577755555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
    end
    object shp5: TShape
      Left = 659
      Top = 10
      Width = 344
      Height = 36
      Anchors = [akLeft, akTop, akRight]
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object btn_obs: TSpeedButton
      Left = 142
      Top = 6
      Width = 102
      Height = 41
      Caption = '&Observa'#231#245'es'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
        055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
        88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
        F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
        F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
        0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
        00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
        0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
        05555575FF777777755555500055555555555557775555555555}
      NumGlyphs = 2
      Spacing = 10
      OnClick = btn_obsClick
    end
    object shp11: TShape
      Left = 847
      Top = 6
      Width = 150
      Height = 15
      Anchors = [akTop, akRight]
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object lbl2: TLabel
      Left = 852
      Top = 7
      Width = 139
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'busca r'#225'pida por evento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object shp44: TShape
      Left = 385
      Top = 10
      Width = 271
      Height = 36
      Brush.Color = clSilver
      Pen.Color = clGray
    end
    object shp45: TShape
      Left = 390
      Top = 7
      Width = 74
      Height = 15
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object lblUltimaEtapa: TLabel
      Left = 392
      Top = 8
      Width = 67
      Height = 13
      Caption = 'status atual'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnIncluirEtapa: TSpeedButton
      Left = 593
      Top = 14
      Width = 28
      Height = 28
      Hint = 'Incluir um novo status'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnIncluirEtapaClick
    end
    object btnFollowupEtapa: TSpeedButton
      Left = 624
      Top = 14
      Width = 28
      Height = 28
      Hint = 'Visualizar hist'#243'rico de status'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFollowupEtapaClick
    end
    object btnAtzFUP: TSpeedButton
      Left = 247
      Top = 6
      Width = 37
      Height = 41
      Hint = 'Atualiza Datas Previstas'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnAtzFUPClick
    end
    object btnFollowupPO: TSpeedButton
      Left = 288
      Top = 6
      Width = 44
      Height = 41
      Hint = 'Ir para Followup PO'
      Caption = 'PO'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFollowupPOClick
    end
    object btnCapa: TSpeedButton
      Left = 51
      Top = 6
      Width = 42
      Height = 41
      Hint = 'Capa'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCapaClick
    end
    object medt_evento: TMaskEdit
      Left = 665
      Top = 22
      Width = 332
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = medt_eventoChange
    end
    object edtUltimaEtapa: TEdit
      Left = 390
      Top = 23
      Width = 199
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 206
    Width = 1002
    Height = 413
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 3
    DesignSize = (
      1002
      413)
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 27
      Width = 969
      Height = 383
      VertScrollBar.Position = 164
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 3
      Visible = False
      object imgParametrizacao: TImage
        Left = 4
        Top = -160
        Width = 653
        Height = 540
      end
      object ocParametrizacao: TOleContainer
        Left = 4
        Top = -160
        Width = 653
        Height = 544
        BorderStyle = bsNone
        Caption = 'ocParametrizacao'
        TabOrder = 0
      end
    end
    object dbgrdFup: TDBGrid
      Left = 4
      Top = 29
      Width = 994
      Height = 359
      Align = alClient
      Color = 16776176
      Ctl3D = False
      DataSource = dsFollowUp
      Options = [dgEditing, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentCtl3D = False
      ParentShowHint = False
      PopupMenu = popFollowup
      ShowHint = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawDataCell = dbgrdFupDrawDataCell
      OnDrawColumnCell = dbgrdFupDrawColumnCell
      OnDblClick = dbgrdFupDblClick
      OnKeyDown = dbgrdFupKeyDown
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CD_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Caption = 'C'#243'd. Evento'
          Width = 29
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_EVENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Nome Evento'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AP_USUARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5197647
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Realizado por'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clInfoBk
          Expanded = False
          FieldName = 'IN_APLICAVEL'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -15
          Font.Name = 'Wingdings'
          Font.Style = [fsBold]
          ReadOnly = True
          Title.Caption = 'Aplicavel'
          Width = 46
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 16119285
          Expanded = False
          FieldName = 'DT_PREVISTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Data Prevista'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NR_SEMANA_PREVISTA'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DT_REALIZACAO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Caption = 'Data da Realiza'#231#227'o'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NR_SEMANA_REALIZADA'
          Width = 50
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 16119285
          Expanded = False
          FieldName = 'calcAtraso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Atraso'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'calcHora'
          Title.Caption = 'Hora'
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QT_DIAS_DESVIO'
          Title.Caption = 'Dias Desvio'
          Visible = False
        end
        item
          Alignment = taCenter
          Color = clInfoBk
          Expanded = False
          FieldName = 'IN_ALERTA_ENVIADO'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -8
          Font.Name = 'Webdings'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'Alerta Enviado'
          Width = 22
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clInfoBk
          Expanded = False
          FieldName = 'IN_EDI_ENVIADO'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clTeal
          Font.Height = -8
          Font.Name = 'Webdings'
          Font.Style = []
          ReadOnly = True
          Title.Caption = 'EDI Enviado'
          Width = 22
          Visible = True
        end>
    end
    object pnl2: TPanel
      Left = 4
      Top = 4
      Width = 994
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object shp13: TShape
        Left = 0
        Top = 0
        Width = 994
        Height = 24
        Align = alClient
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object lbl9: TLabel
        Left = 3
        Top = 5
        Width = 41
        Height = 13
        Caption = 'Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl10: TLabel
        Tag = 2
        Left = 240
        Top = 5
        Width = 44
        Height = 13
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl11: TLabel
        Tag = 3
        Left = 303
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Aplicar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl12: TLabel
        Tag = 4
        Left = 363
        Top = 5
        Width = 47
        Height = 13
        Caption = 'Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl13: TLabel
        Tag = 6
        Left = 488
        Top = 5
        Width = 57
        Height = 13
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblDiferencaHoje: TLabel
        Tag = 9
        Left = 648
        Top = 5
        Width = 28
        Height = 13
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblAlerta: TLabel
        Tag = 11
        Left = 691
        Top = 5
        Width = 9
        Height = 13
        Hint = 'Alerta enviado'
        Caption = 'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 100
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object lblEDI: TLabel
        Tag = 12
        Left = 709
        Top = 5
        Width = 9
        Height = 13
        Hint = 'EDI enviado'
        Caption = 'E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 100
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object lblSemanaPrevista: TLabel
        Tag = 5
        Left = 429
        Top = 5
        Width = 46
        Height = 13
        Hint = 'Semana Prevista'
        Caption = 'Week P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object lblSemanaRealizada: TLabel
        Tag = 7
        Left = 561
        Top = 5
        Width = 47
        Height = 13
        Hint = 'Semana Prevista'
        Caption = 'Week R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Transparent = True
      end
      object edtFiltro: TEdit
        Left = 52
        Top = 2
        Width = 36
        Height = 19
        Color = clSilver
        MaxLength = 3
        TabOrder = 0
        OnExit = edtFiltroExit
        OnKeyUp = edtFiltroKeyUp
      end
    end
    object pnl3: TPanel
      Left = 4
      Top = 28
      Width = 994
      Height = 1
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
    end
    object pnlRealizacaoLote: TPanel
      Left = 10
      Top = 29
      Width = 522
      Height = 352
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      Color = 14869218
      TabOrder = 6
      Visible = False
      DesignSize = (
        522
        352)
      object shp22: TShape
        Left = 8
        Top = 36
        Width = 506
        Height = 115
        Anchors = [akLeft, akTop, akRight]
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object shp15: TShape
        Left = 8
        Top = 155
        Width = 506
        Height = 165
        Anchors = [akLeft, akTop, akRight]
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object shp14: TShape
        Left = 8
        Top = 8
        Width = 506
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Brush.Color = clSilver
        Pen.Color = clGray
      end
      object btn2: TSpeedButton
        Left = 425
        Top = 323
        Width = 89
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = 'Sair'
        Flat = True
        OnClick = btn2Click
      end
      object lbl8: TLabel
        Left = 14
        Top = 15
        Width = 270
        Height = 13
        Caption = 'Lote de Processos para Realiza'#231#227'o de Eventos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lbl15: TLabel
        Left = 15
        Top = 40
        Width = 39
        Height = 13
        Caption = 'Eventos'
        Transparent = False
      end
      object lbl16: TLabel
        Left = 359
        Top = 40
        Width = 108
        Height = 13
        Caption = 'Datas para Realiza'#231#227'o'
        Transparent = False
      end
      object lbl17: TLabel
        Left = 15
        Top = 159
        Width = 44
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btn3: TSpeedButton
        Left = 129
        Top = 175
        Width = 25
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
        OnClick = btn3Click
      end
      object btn4: TSpeedButton
        Left = 162
        Top = 175
        Width = 33
        Height = 19
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666FFF666666666
          666666FFF666666600006666666844F66666666666666888F666666600006666
          666844F66666666666666888F666666600006666666844F66666666666666888
          F666666600006666FFF644FFFFF6666666FFF888FFFFF6660000666844444444
          44F66666688888888888F666000066684444444444F66666688888888888F666
          000066688888446888666666688888888888666600006666666844F666666666
          66666888F666666600006666666844F66666666666666888F666666600006666
          666844F66666666666666888F666666600006666666888666666666666666888
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        OnClick = btn4Click
      end
      object btn5: TSpeedButton
        Left = 161
        Top = 204
        Width = 33
        Height = 19
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000666666666666666666666666666666666666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666FFFFFFFFFFF6666666FFFFFFFFFFF6660000666800000000
          00F66666687777777777F666000066680000000000F66666687777777777F666
          0000666888888888886666666888888888886666000066666666666666666666
          6666666666666666000066666666666666666666666666666666666600006666
          6666666666666666666666666666666600006666666666666666666666666666
          6666666600006666666666666666666666666666666666660000666666666666
          6666666666666666666666660000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        OnClick = btn5Click
      end
      object btn6: TSpeedButton
        Left = 334
        Top = 323
        Width = 89
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = 'Executar'
        Flat = True
        OnClick = btn6Click
      end
      object Label1: TLabel
        Left = 210
        Top = 159
        Width = 48
        Height = 13
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object medt1: TMaskEdit
        Left = 15
        Top = 175
        Width = 113
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = medt1Exit
        OnKeyDown = medt1KeyDown
      end
      object lst1: TListBox
        Left = 14
        Top = 226
        Width = 181
        Height = 87
        Columns = 1
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
      end
      object chk1: TCheckBox
        Left = 15
        Top = 201
        Width = 124
        Height = 17
        Caption = #218'ltimos Processos'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object ProgressBar1: TProgressBar
        Left = 9
        Top = 327
        Width = 311
        Height = 16
        Step = 1
        TabOrder = 3
      end
      object lb_eventos: TListBox
        Left = 15
        Top = 56
        Width = 362
        Height = 90
        Style = lbOwnerDrawVariable
        BevelEdges = [beLeft, beTop, beBottom]
        BorderStyle = bsNone
        Color = 14869218
        Ctl3D = False
        ItemHeight = 18
        ParentCtl3D = False
        TabOrder = 4
        OnDrawItem = lb_eventosDrawItem
      end
      object lb_datas: TListBox
        Left = 375
        Top = 56
        Width = 114
        Height = 90
        Style = lbOwnerDrawVariable
        BevelEdges = [beTop, beRight, beBottom]
        BorderStyle = bsNone
        Color = 14869218
        Ctl3D = False
        ItemHeight = 18
        ParentCtl3D = False
        TabOrder = 5
        OnDrawItem = lb_datasDrawItem
      end
      object memoResultadoClickLote: TMemo
        Left = 208
        Top = 172
        Width = 292
        Height = 140
        ScrollBars = ssVertical
        TabOrder = 6
      end
    end
    object pnlAguarde: TPanel
      Left = 533
      Top = 174
      Width = 467
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvLowered
      Caption = '        aguarde processamento...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      Visible = False
      DesignSize = (
        467
        41)
      object shp24: TShape
        Left = 36
        Top = 5
        Width = 426
        Height = 31
        Anchors = [akLeft, akTop, akRight]
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl20: TLabel
        Left = 14
        Top = 10
        Width = 12
        Height = 21
        Caption = '6'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clTeal
        Font.Height = -19
        Font.Name = 'Wingdings'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object shp23: TShape
        Left = 5
        Top = 5
        Width = 30
        Height = 31
        Brush.Style = bsClear
        Pen.Color = clGray
      end
    end
    object pnl4_: TPanel
      Left = 532
      Top = 49
      Width = 166
      Height = 115
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 5
      Visible = False
      object lbl34: TLabel
        Left = 0
        Top = 0
        Width = 166
        Height = 115
        Align = alClient
        Caption = 
          '* d'#234' um duplo click na coluna '#13#10'  "Aplicar" para mudar seu statu' +
          's.'#13#10'* d'#234' um duplo click na coluna '#13#10'  "Realizado"   para colocar' +
          '  a data atual, '#13#10'  ou preencha com a data desejada.'#13#10'* os campo' +
          's   "Previsto"  e "Varia'#231#227'o", '#13#10'  s'#227'o  autom'#225'ticos.'#13#10'* o bot'#227'o d' +
          'e  observa'#231#245'es'#13#10'  s'#243' ser'#225'  habilitado com o  evento  '#13#10'  "Observ' +
          'a'#231#245'es"  posicionado.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'Small Fonts'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        WordWrap = True
      end
    end
    object pnl7: TPanel
      Left = 8
      Top = 28
      Width = 68
      Height = 40
      BevelInner = bvLowered
      TabOrder = 4
      Visible = False
      DesignSize = (
        68
        40)
      object btn_rel_calc: TSpeedButton
        Left = 4
        Top = 4
        Width = 28
        Height = 31
        Hint = 'Imprime Rel.C'#225'lculo/Adi'#231#227'o'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        Layout = blGlyphBottom
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn_rel_calcClick
      end
      object btn7: TSpeedButton
        Left = 35
        Top = 4
        Width = 28
        Height = 31
        Hint = 'Sa'#237'da'
        Anchors = [akTop, akRight]
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
        Layout = blGlyphBottom
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = btn7Click
      end
    end
    object pnlHintEvento: TPanel
      Left = 4
      Top = 388
      Width = 994
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
      object TDBText
        Left = 124
        Top = 3
        Width = 5
        Height = 13
        Cursor = crHandPoint
        AutoSize = True
        DataField = 'CONTADOR_TOTAL'
        DataSource = dsPendencias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 206
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        OnClick = lbl_pendencias1Click
      end
    end
  end
  object pnlSelecionaCanal: TPanel
    Left = 702
    Top = 155
    Width = 33
    Height = 240
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    object shp21: TShape
      Left = 0
      Top = 0
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp33: TShape
      Left = 0
      Top = 34
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp34: TShape
      Left = 0
      Top = 68
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp35: TShape
      Left = 0
      Top = 102
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp36: TShape
      Left = 0
      Top = 136
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp37: TShape
      Left = 0
      Top = 170
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object shp38: TShape
      Left = 7
      Top = 142
      Width = 17
      Height = 19
      Brush.Color = clLime
      Shape = stCircle
    end
    object img1: TImage
      Tag = 5
      Left = 8
      Top = 144
      Width = 15
      Height = 16
      Picture.Data = {
        07544269746D617076010000424D760100000000000076000000280000002000
        000010000000010004000000000000010000130B0000130B0000100000000000
        0000000000000000800000800000008080008000000080008000808000007F7F
        7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF003333333333333333333333FFFFF3333333333999993333333333F77777FF
        F3333339999999993333333777333777FF3333993333339993333377FF333337
        7FF3399993333339993337777FF3333377F3393999333333993337F777FF3333
        37FF993399933333399377F3777FF333377F993339993333399377F33777FF33
        377F993333999333399377F333777FF3377F993333399933399377F3333777FF
        377F993333339993399377FF3333777FF7733993333339993933373FF3333777
        F7F339993333339999333773FF3333777733339993333339933333773FFFFFF7
        7333333999999999333333377733377733333333399999333333333337777733
        3333}
      Transparent = True
      OnMouseDown = shp39MouseDown
    end
    object shp39: TShape
      Left = 7
      Top = 7
      Width = 17
      Height = 19
      Brush.Color = clRed
      Shape = stCircle
      OnMouseDown = shp39MouseDown
    end
    object shp40: TShape
      Tag = 1
      Left = 7
      Top = 41
      Width = 17
      Height = 19
      Brush.Color = clYellow
      Shape = stCircle
      OnMouseDown = shp39MouseDown
    end
    object shp41: TShape
      Tag = 2
      Left = 7
      Top = 75
      Width = 17
      Height = 19
      Brush.Color = clLime
      Shape = stCircle
      OnMouseDown = shp39MouseDown
    end
    object shp42: TShape
      Tag = 3
      Left = 7
      Top = 108
      Width = 17
      Height = 19
      Brush.Color = clGray
      Shape = stCircle
      OnMouseDown = shp39MouseDown
    end
    object shp43: TShape
      Tag = 4
      Left = 7
      Top = 177
      Width = 17
      Height = 19
      Shape = stCircle
      OnMouseDown = shp39MouseDown
    end
    object Shape1: TShape
      Left = 0
      Top = 204
      Width = 33
      Height = 33
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Shape2: TShape
      Tag = 7
      Left = 7
      Top = 211
      Width = 17
      Height = 19
      Brush.Color = 44799
      Shape = stCircle
      OnMouseDown = shp39MouseDown
    end
  end
  object pnlEtapa: TPanel
    Left = 543
    Top = 471
    Width = 436
    Height = 112
    Anchors = [akTop]
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 4
    Visible = False
    DesignSize = (
      436
      112)
    object shp46: TShape
      Left = 7
      Top = 7
      Width = 422
      Height = 21
      Anchors = [akTop, akRight]
      Brush.Color = 15658734
      Pen.Color = clGray
    end
    object lblCodigo: TLabel
      Left = 12
      Top = 30
      Width = 40
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = dbedtCodigo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEtapa: TLabel
      Left = 12
      Top = 66
      Width = 37
      Height = 13
      Caption = 'Status'
      FocusControl = dbedtCodigoEtapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConsultaEtapa: TSpeedButton
      Left = 399
      Top = 78
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
      OnClick = btnConsultaEtapaClick
    end
    object btnSalvarEtapa: TSpeedButton
      Left = 385
      Top = 9
      Width = 21
      Height = 17
      Hint = 'Salvar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSalvarEtapaClick
    end
    object btnCancelarEtapa: TSpeedButton
      Left = 408
      Top = 9
      Width = 19
      Height = 17
      Hint = 'Cancelar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnCancelarEtapaClick
    end
    object lbl35: TLabel
      Left = 13
      Top = 11
      Width = 180
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cadastro de status do processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbedtCodigo: TDBEdit
      Left = 12
      Top = 43
      Width = 50
      Height = 21
      TabStop = False
      Color = clSilver
      DataField = 'CD_FOLLOWUP_ETAPA'
      DataSource = dsFollowUpEtapa
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtCodigoEtapa: TDBEdit
      Left = 12
      Top = 79
      Width = 50
      Height = 21
      DataField = 'CD_ETAPA'
      DataSource = dsFollowUpEtapa
      TabOrder = 1
      OnChange = btnConsultaEtapaClick
      OnExit = dbedtCodigoEtapaExit
      OnKeyDown = FormKeyDown
    end
    object edtNomeEtapa: TEdit
      Left = 62
      Top = 79
      Width = 335
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
  end
  object pnl_info_pendencias: TPanel
    Left = 0
    Top = 619
    Width = 1002
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object lbl_pendencias1: TLabel
      Left = 268
      Top = 0
      Width = 71
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' Pend'#234'ncias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object dbtxt_pendencias_total: TDBText
      Left = 533
      Top = 0
      Width = 133
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_TOTAL'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object lbl_pendencias3: TLabel
      Left = 339
      Top = 0
      Width = 71
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' solicitadas/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object dbtxt_pendencias_solicitadas: TDBText
      Left = 666
      Top = 0
      Width = 168
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_ANDAMENTO'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object lbl_pendencias2: TLabel
      Left = 259
      Top = 0
      Width = 9
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' ('
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object dbtxt_pendencias_finalizadas: TDBText
      Left = 834
      Top = 0
      Width = 168
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_FINALIZADA'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object lbl_pendencias4: TLabel
      Left = 410
      Top = 0
      Width = 73
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      BiDiMode = bdLeftToRight
      Caption = ' finalizadas) '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
    object DBText1: TDBText
      Left = 483
      Top = 0
      Width = 50
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      AutoSize = True
      DataField = 'CONTADOR_TOTAL'
      DataSource = dsPendencias
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 206
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      OnClick = lbl_pendencias1Click
    end
  end
  object qryFollowUp: TQuery
    CachedUpdates = True
    AfterOpen = qryFollowUpAfterOpen
    BeforeClose = qryFollowUpBeforeClose
    AfterClose = qryFollowUpAfterClose
    AfterEdit = qryFollowUpAfterEdit
    BeforePost = qryFollowUpBeforePost
    AfterPost = qryFollowUpAfterPost
    AfterScroll = qryFollowUpAfterScroll
    OnCalcFields = qryFollowUpCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT FU.NR_PROCESSO,'
      '       FU.CD_SERVICO,'
      '       FU.CD_EVENTO,'
      '       FU.CD_RESP_REALIZACAO,'
      '       FU.DT_REALIZACAO,'
      '       CASE FU.IN_APLICAVEL'
      '           WHEN '#39'1'#39' THEN '#39#252#39
      '       ELSE '#39#39
      '       END IN_APLICAVEL,'
      '       FU.CD_RESP_INSPECAO,'
      '       FU.DT_INSPECAO,'
      '       FU.CD_RESULT_INSPECAO,'
      '       FU.CD_RESP_APLICACAO,'
      '       FU.DT_APLICACAO,'
      '       FU.DT_PREVISTA,'
      '       FU.DT_LIMITE,'
      '       FU.TX_OBS,'
      '       CASE FU.IN_BLOQUEADO'
      '           WHEN '#39'1'#39' THEN '#39#252#39
      '       ELSE '#39#39
      '       END IN_BLOQUEADO,'
      '       EV.NM_EVENTO,'
      '       CASE FU.IN_APLICAVEL WHEN '#39'1'#39' THEN'
      '            US.AP_USUARIO'
      '       ELSE '
      '            '#39'Aplic. '#39' + USAP.AP_USUARIO'
      '       END AS AP_USUARIO,'
      '       CASE FU.IN_ALERTA_ENVIADO'
      '           WHEN '#39'1'#39' THEN '#39'n'#39
      '       ELSE '#39#39
      '       END IN_ALERTA_ENVIADO,'
      '       CASE FU.IN_EDI_ENVIADO'
      '           WHEN '#39'1'#39' THEN '#39'n'#39
      '       ELSE '#39#39
      '       END IN_EDI_ENVIADO,'
      '       FU.QT_DIAS_DESVIO,'
      '       ISNULL(EV.IN_ACEITA_DESVIOS, '#39'0'#39') IN_ACEITA_DESVIOS,'
      '       DATEPART(WEEK, DT_PREVISTA) AS NR_SEMANA_PREVISTA,'
      '       DATEPART(WEEK, DT_REALIZACAO) AS NR_SEMANA_REALIZADA,'
      '       FU.CD_EV_BASICO,'
      '       EB.NM_EVENTO AS NM_EV_BASICO,'
      '       FU.PZ_DO_EV_BASICO'
      'FROM TFOLLOWUP FU (NOLOCK)'
      '   INNER JOIN TEVENTO EV (NOLOCK) ON EV.CD_EVENTO = FU.CD_EVENTO'
      
        '   LEFT  JOIN TEVENTO EB (NOLOCK) ON EB.CD_EVENTO = FU.CD_EV_BAS' +
        'ICO'
      
        '   LEFT JOIN TUSUARIO US (NOLOCK) ON US.CD_USUARIO = FU.CD_RESP_' +
        'REALIZACAO'
      
        '   LEFT JOIN TUSUARIO USAP (NOLOCK) ON USAP.CD_USUARIO = FU.CD_R' +
        'ESP_APLICACAO'
      'WHERE FU.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_ORDEM')
    UpdateObject = updFollowUp
    Left = 817
    Top = 335
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0102em-1000-13'
      end>
    object qryFollowUpNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFollowUpCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qryFollowUpCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryFollowUpCD_RESP_REALIZACAO: TStringField
      FieldName = 'CD_RESP_REALIZACAO'
      FixedChar = True
      Size = 4
    end
    object qryFollowUpDT_REALIZACAO: TDateTimeField
      ConstraintErrorMessage = 'ERRO_DE_DATA'
      FieldName = 'DT_REALIZACAO'
      OnChange = qryFollowUpDT_REALIZACAOChange
      OnSetText = qryFollowUpDT_REALIZACAOSetText
      EditMask = '!99/99/0000;1;_'
    end
    object qryFollowUpIN_APLICAVEL: TStringField
      FieldName = 'IN_APLICAVEL'
      FixedChar = True
      Size = 1
    end
    object qryFollowUpCD_RESP_INSPECAO: TStringField
      FieldName = 'CD_RESP_INSPECAO'
      FixedChar = True
      Size = 4
    end
    object qryFollowUpDT_INSPECAO: TDateTimeField
      FieldName = 'DT_INSPECAO'
    end
    object qryFollowUpCD_RESULT_INSPECAO: TStringField
      FieldName = 'CD_RESULT_INSPECAO'
      FixedChar = True
      Size = 1
    end
    object qryFollowUpCD_RESP_APLICACAO: TStringField
      FieldName = 'CD_RESP_APLICACAO'
      FixedChar = True
      Size = 4
    end
    object qryFollowUpDT_APLICACAO: TDateTimeField
      FieldName = 'DT_APLICACAO'
    end
    object qryFollowUpDT_PREVISTA: TDateTimeField
      FieldName = 'DT_PREVISTA'
    end
    object qryFollowUpDT_LIMITE: TDateTimeField
      FieldName = 'DT_LIMITE'
    end
    object qryFollowUpTX_OBS: TMemoField
      FieldName = 'TX_OBS'
      BlobType = ftMemo
    end
    object qryFollowUpIN_BLOQUEADO: TStringField
      FieldName = 'IN_BLOQUEADO'
      FixedChar = True
      Size = 1
    end
    object qryFollowUpNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryFollowUpAP_USUARIO: TStringField
      DisplayWidth = 21
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 21
    end
    object qryFollowUpcalcAtraso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAtraso'
      Size = 10
      Calculated = True
    end
    object qryFollowUpcalcFaltam: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'calcFaltam'
      Size = 10
      Calculated = True
    end
    object qryFollowUpIN_ALERTA_ENVIADO: TStringField
      FieldName = 'IN_ALERTA_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object qryFollowUpcalcHora: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcHora'
      EditMask = '!90:99;'
      Size = 10
      Calculated = True
    end
    object qryFollowUpQT_DIAS_DESVIO: TIntegerField
      FieldName = 'QT_DIAS_DESVIO'
    end
    object qryFollowUpIN_ACEITA_DESVIOS: TStringField
      FieldName = 'IN_ACEITA_DESVIOS'
      FixedChar = True
      Size = 1
    end
    object qryFollowUpCALC_NR_PROCESSO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALC_NR_PROCESSO'
      Size = 14
      Calculated = True
    end
    object qryFollowUpIN_EDI_ENVIADO: TStringField
      FieldName = 'IN_EDI_ENVIADO'
      FixedChar = True
      Size = 1
    end
    object qryFollowUpNR_SEMANA_PREVISTA: TIntegerField
      FieldName = 'NR_SEMANA_PREVISTA'
    end
    object qryFollowUpNR_SEMANA_REALIZADA: TIntegerField
      FieldName = 'NR_SEMANA_REALIZADA'
    end
    object qryFollowUpCD_EV_BASICO: TStringField
      FieldName = 'CD_EV_BASICO'
      FixedChar = True
      Size = 3
    end
    object qryFollowUpNM_EV_BASICO: TStringField
      FieldName = 'NM_EV_BASICO'
      FixedChar = True
      Size = 50
    end
    object qryFollowUpPZ_DO_EV_BASICO: TIntegerField
      FieldName = 'PZ_DO_EV_BASICO'
    end
    object qryFollowUpcalcPrazo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'calcPrazo'
      Calculated = True
    end
  end
  object dsFollowUp: TDataSource
    DataSet = qryFollowUp
    Left = 763
    Top = 335
  end
  object updFollowUp: TUpdateSQL
    ModifySQL.Strings = (
      'update TFOLLOWUP'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_EVENTO = :CD_EVENTO,'
      '  CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO,'
      '  DT_REALIZACAO = :DT_REALIZACAO,'
      '  DT_PREVISTA = :DT_PREVISTA,'
      '  TX_OBS = :TX_OBS,'
      '  QT_DIAS_DESVIO = :QT_DIAS_DESVIO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    InsertSQL.Strings = (
      'insert into TFOLLOWUP'
      
        '  (NR_PROCESSO, CD_SERVICO, CD_EVENTO, IN_APLICAVEL, CD_RESP_APL' +
        'ICACAO, '
      
        '   CD_RESP_REALIZACAO, CD_RESP_INSPECAO, DT_APLICACAO, DT_REALIZ' +
        'ACAO, DT_INSPECAO, '
      
        '   CD_RESULT_INSPECAO, DT_PREVISTA, DT_LIMITE, TX_OBS, IN_BLOQUE' +
        'ADO, QT_DIAS_DESVIO, '
      '   DT_REALIZACAO_EFETIVA, DT_ALERTA_ENVIADO)'
      'values'
      
        '  (:NR_PROCESSO, :CD_SERVICO, :CD_EVENTO, :IN_APLICAVEL, :CD_RES' +
        'P_APLICACAO, '
      
        '   :CD_RESP_REALIZACAO, :CD_RESP_INSPECAO, :DT_APLICACAO, :DT_RE' +
        'ALIZACAO, '
      
        '   :DT_INSPECAO, :CD_RESULT_INSPECAO, :DT_PREVISTA, :DT_LIMITE, ' +
        ':TX_OBS, '
      
        '   :IN_BLOQUEADO, :QT_DIAS_DESVIO, :DT_REALIZACAO_EFETIVA, :DT_A' +
        'LERTA_ENVIADO)')
    DeleteSQL.Strings = (
      'delete from TFOLLOWUP'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_SERVICO = :OLD_CD_SERVICO and'
      '  CD_EVENTO = :OLD_CD_EVENTO')
    Left = 790
    Top = 335
  end
  object popFollowup: TPopupMenu
    OnPopup = popFollowupPopup
    Left = 799
    Top = 238
    object RealizaoemLote1: TMenuItem
      Tag = 2
      Caption = 'Realiza'#231#227'o em Lote'
      OnClick = RealizaoemLote1Click
    end
    object ExportarParaExcel1: TMenuItem
      Caption = 'Exportar Para Excel'
      OnClick = ExportarParaExcel1Click
    end
    object Desaplicareventoemlote1: TMenuItem
      Caption = 'Desaplicar evento em Lote'
      Hint = 'Lote de Processos para Desaplicar Eventos'
      OnClick = Desaplicareventoemlote1Click
    end
    object HabilitareventoemLote1: TMenuItem
      Tag = 1
      Caption = 'Aplicar evento em Lote'
      Hint = 'Lote de Processos para Aplicar Eventos'
      OnClick = Desaplicareventoemlote1Click
    end
  end
  object ppAcompanhamentoDespacho: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\rel_acompanhamento_despacho.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 263
    Top = 133
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 155840
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676597300100FFD8FFE000104A46494600010100000100
          010000FFDB0043000302020302020303030304030304050805050404050A0707
          06080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F17
          1816141812141514FFDB00430103040405040509050509140D0B0D1414141414
          1414141414141414141414141414141414141414141414141414141414141414
          14141414141414141414141414FFC000110801EF027C03012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FACF
          C6BE12F0CF8CFE34F8F5BC59E14D07C670689E14F0F4FA75A78934E8AFE0B492
          E2FF005649DE2490108D22C30862B82DE4C79CEC18C1FF008571F0AFFE888FC3
          0FFC24ED7FF89AEC756FF92C7F163FEC4FF0AFFE9CB5AAC4AF9FE1FF00F915D0
          FF0009AD5F8D993FF0AE3E15FF00D111F861FF00849DAFFF001347FC2B8F857F
          F4447E187FE1276BFF00C4D78AF847F6A0D4F5DF0C780BC51A97842D34FF000E
          F8BF5A5D0ED9ED7586B9BB827779A346789ADA34D9BE139224C8520804FCB53F
          87FF0069DB9D6746F05789A5F0AC56DE11F16EBDFD83A7DC26A664BF8DDA49A3
          8A496DCC223552D0FCC16662A1B8DD8C1FD0E7C3D99D37252A5F0B69FBD1DD73
          5D692D5FBB2D16BA7A1C8AB41F53D8FF00E15C7C2BFF00A223F0C3FF00093B5F
          FE268FF8571F0AFF00E888FC30FF00C24ED7FF0089AF15D4FF006A0D4F4AD03C
          6DE279BC2168DE16F08F88A4D02FA64D618DF49B278A232C501B6D878995B6B4
          ABD08CF427ABF1EFC59F12F84BE27F85FC2163E17D2B52FF008497ED5FD9D797
          1ADCB6F8FB3C0B2CBE720B47D9F7885DA5F38C9DB9C0C9E478F525070576A4FE
          287D88A94B5E6B5D45A6D6F61FB58773BFFF008571F0AFFE888FC30FFC24ED7F
          F89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26BCCBC5DF1E753D2B5FF88961
          A1F866D35483C09A7437FAACFA86AAD66D279904938481120943E238FABB27CC
          718C0DC7B1BFF8956D1FC1EB8F88365672DC59AE82DAF41673B08A474FB3F9EB
          1B11B82B118048DC01F5AE6A995E2E9469CA50F8EC96ABED2528DF5D2E9A6AF6
          D194A7177F2373FE15C7C2BFFA223F0C3FF093B5FF00E268FF008571F0AFFE88
          8FC30FFC24ED7FF89AF39F01FC76B9D7F59F0869DE23F0F45E1F6F18E94355D0
          27B3D40DF477016312CB04B98A368A548D91FA32302407DC3070BC3FFB4EDCEB
          3A3782BC4D2F8562B6F08F8B75EFEC1D3EE1353325FC6ED24D1C524B6E6111AA
          9687E60B33150DC6EC60F4BC8B304DAF67B7F7A3677E6D9DECDFB935657778B5
          BAB13ED61DFF00AFE99EC7FF000AE3E15FFD111F861FF849DAFF00F1347FC2B8
          F857FF004447E187FE1276BFFC4D72BF18BE285CFC2FB1F0C3D968F16B379AF6
          BD6BA0C114F786D638DE70FB646711C876828010173839ED83C378A3F69DB9F0
          67877E25CDAAF85623AEF81A4D385CD959EA664B5B94BCF2FCB649DA1560CBBD
          B7298B1F28C13B8EDCF0D9363B19084E842EA4D25AC6FAC94366EF6E69455DE9
          A8E55231D1B3D8FF00E15C7C2BFF00A223F0C3FF00093B5FFE268FF8571F0AFF
          00E888FC30FF00C24ED7FF0089AF32F177C79D4F4AD7FE2258687E19B4D520F0
          269D0DFEAB3EA1AAB59B49E64124E120448250F88E3EAEC9F31C630371EC6FFE
          255B47F07AE3E20D959CB7166BA0B6BD059CEC2291D3ECFE7AC6C46E0AC46012
          37007D6B2A995E2E9469CA50F8EC96ABED2528DF5D2E9A6AF6D18D4E2EFE46E7
          FC2B8F857FF4447E187FE1276BFF00C4D1FF000AE3E15FFD111F861FF849DAFF
          00F135E73E03F8ED73AFEB3E10D3BC47E1E8BC3EDE31D286ABA04F67A81BE8EE
          02C625960973146D14A91B23F46460480FB860CFF04BE2CF897E31F86346F147
          FC22FA5691E1DD47CEF9FF00B6E59EEE3F2DE48FFD57D9150E5E3FF9E830A73D
          46DAD2B64F8DC3C2752AC128C6D77CD1B6BCD6B3BFBDAC24BDDBD9C5A7AE8255
          22DD97F5FD5CEFFF00E15C7C2BFF00A223F0C3FF00093B5FFE268FF8571F0AFF
          00E888FC30FF00C24ED7FF0089AE73E36FC4DFF8539F0C359F17FF0066FF006B
          FF0067793FE87E7F91E67993C717DFDAD8C7999E8738C77CD61FC40FDA0F45F8
          7DF17FC13E02BC8BCCBAF11EEF32E7738FB26E252DBE51191279B2868FEF0D98
          DCDC1ACB0D95E3317053A14DC93E7DADF622A52FB9497AB76577A0DCE31D1BFE
          99DFFF00C2B8F857FF004447E187FE1276BFFC4D1FF0AE3E15FF00D111F861FF
          00849DAFFF00135E47AFFED4DA67877E237C44F06DD693B351F0BE8CFAC59C8F
          7AAABAA6CB55B892100AE51C2B0C6049954918E36E0CFA47C7CD73C59E2AF0D6
          81A0784F4F9AF357F085B78B5DF52D69EDE3812570861052D642ECA597E6C282
          33C0C73D6F21CC54154953B45C54AEE514B95AE64F57D9FE9BE84FB585ED73D5
          7FE15C7C2BFF00A223F0C3FF00093B5FFE268FF8571F0AFF00E888FC30FF00C2
          4ED7FF0089AF39F167C76B9F0778AB59D02F7C3D14B79A578226F17CEF06A04C
          6CF13946B5526204AE54E25201C7F00A83C23F1E753D575FF87761AE7866D34B
          83C77A74D7FA54FA7EAAD78D1F970473949D1E088266393AA33FCC318C1DC335
          92E39D2F6CA1EED9BF8A3B28B93695EEED14DE9D10FDA46F6B9E9BFF000AE3E1
          5FFD111F861FF849DAFF00F1347FC2B8F857FF004447E187FE1276BFFC4D78E7
          87FF0069DB9D6746F05789A5F0AC56DE11F16EBDFD83A7DC26A664BF8DDA49A3
          8A496DCC223552D0FCC16662A1B8DD8C1F79AE5C6E5F89CBE4A1898D9EAB74F5
          8BB35A37AA7A35B8E338CF6327FE15C7C2BFFA223F0C3FF093B5FF00E268FF00
          8571F0AFFE888FC30FFC24ED7FF89AD6A2BCE2CC9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00C9FF8571F0AFF00E888FC30FF00C24ED7FF0089A3FE15C7C2BFFA223F
          0C3FF093B5FF00E26B5A8A00C9FF008571F0AFFE888FC30FFC24ED7FF89A3FE1
          5C7C2BFF00A223F0C3FF00093B5FFE26B5A8A00C9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00C9FF8571F0AFF00E888FC30FF00C24ED7FF0089A3FE15C7C2BFFA223F
          0C3FF093B5FF00E26B5A8A00C9FF008571F0AFFE888FC30FFC24ED7FF89A3FE1
          5C7C2BFF00A223F0C3FF00093B5FFE26B5A8A00C9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00C9FF8571F0AFF00E888FC30FF00C24ED7FF0089A3FE15C7C2BFFA223F
          0C3FF093B5FF00E26B5A8A00C9FF008571F0AFFE888FC30FFC24ED7FF89A3FE1
          5C7C2BFF00A223F0C3FF00093B5FFE26B5A8A00C9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00C9FF8571F0AFF00E888FC30FF00C24ED7FF0089A3FE15C7C2BFFA223F
          0C3FF093B5FF00E26B5A8A00C9FF008571F0AFFE888FC30FFC24ED7FF89A3FE1
          5C7C2BFF00A223F0C3FF00093B5FFE26B5A8A00C9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00C9FF8571F0AFF00E888FC30FF00C24ED7FF0089A3FE15C7C2BFFA223F
          0C3FF093B5FF00E26B5A8A00C9FF008571F0AFFE888FC30FFC24ED7FF89A3FE1
          5C7C2BFF00A223F0C3FF00093B5FFE26B5A8A00C9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00C9FF8571F0AFF00E888FC30FF00C24ED7FF0089A3FE15C7C2BFFA223F
          0C3FF093B5FF00E26B5A8A00C9FF008571F0AFFE888FC30FFC24ED7FF89A3FE1
          5C7C2BFF00A223F0C3FF00093B5FFE26B5A8A00C9FF8571F0AFF00E888FC30FF
          00C24ED7FF0089A3FE15C7C2BFFA223F0C3FF093B5FF00E26B5A8A00C9FF0085
          71F0AFFE888FC30FFC24ED7FF89A3FE15C7C2BFF00A223F0C3FF00093B5FFE26
          B5A8A00E5BC4FF000FFE195AF86B569ADBE0BFC31B7B88ED2578E64F08D9931B
          0424300C84120F3C823D41AEE3F62699E4FD9C3408DDD992DB52D66D20563911
          4116AB77145128FE1448D1115470AAAA0000015CD78B3FE455D67FEBCA6FFD00
          D745FB11FF00C9BA693FF61AD7FF00F4F37B5F9FF1B7FC8BA1FE35FF00A4C8EA
          C3FC6CBFAB7FC963F8B1FF00627F857FF4E5AD56256DEADFF258FE2C7FD89FE1
          5FFD396B55895F41C3FF00F22BA1FE132ABF1B3C73F677FD9F74CF849E04F0FD
          BEB1A2F87EE7C67A7FDA3CDD72C6D15E66F32594AED9DA3593FD538439C7191D
          2B8DF0CFECE9E2ED2FC25F0E3C137771A20D0BC1BE265D7975A86EE67BABC48E
          6B89638CDA9842C6CDE72A93E7305C123774AFA56BC7FE377ED21A57C0AF1B7C
          3CD1B5BB0DDA678AEEA7B69B5637490A69DB0C2AB23AB8019374E373175D8AAC
          DF374AFD0DE7F8E955AB5A72BCAA4B9B5E92F7D26BB5B9E565AAD76D11C9ECA3
          64BB7F5FA1C1EB5FB29EA77BE0CF893F644F0FC1E3AD6FC572EB9A1F8870CB71
          61035CC32A2FDA045E6C4E024BC26402FD7926BD57C71F0E353F137C62F865E2
          CB59ED23D3BC31FDA7F6C8A6761349F69B758A3F2C0520E181CE4AF1D33D2B3B
          C13FB4169DE28D3FC63717D650E913687E2BBCF09D95A3EA3089357B984298D2
          132F9482594921632DD47DEC648D0D13E3A786A1F0CD95E78CBC43E15F086B32
          4B2DADDE96FE23B79D6D2E622BE6DB198EC0D2C6248FCC503E52E0648C33455C
          F71B59A94E49B4A6969D2A415392F4E55A76777D46A9456DE5F83B9C778C7E0D
          78B9FC4BF16EEF401A26A167F1074AB7B176D4AFA6B4934F78ED65B6242A4128
          9948757FBC87395C7F11EE6FFE1ADCC7F00AE3E1F595E457178BE196D060BC9D
          4C51BBFD97C859180DC5549C1206E207AD6C5B7C53F05DEF866EFC476FE2FD06
          7F0F59CA20B9D5A2D4E16B48242540479436C56CC89C139F9D7D4511FC53F05C
          B0E893278BF417875C95A0D2A45D4E12BA848AE236480EEFDEB0721484C90481
          D4D635337C4D58D38CADEE38BDB7708A8C6FE918A5A5AFBBBBD46A9C55FCCF35
          F87FF05FC4B16BFF000E6FFC572E956907803463A6E99068D732DC35ECF240B0
          4D34EF2451844F2E35DB1AA93B9892F8014F39E19FD9D3C5DA5F84BE1C7826EE
          E3441A17837C4CBAF2EB50DDCCF757891CD712C719B530858D9BCE5527CE60B8
          246EE95EEBA3FC43F0AF8875FBDD0B4AF1368FA96B763BFED5A6D9DFC52DCDBE
          C708FE646AC5976B10A72060900F358FF177E2EE81F077C21A96AFABEA5A6C17
          D158DD5DD86997B7F1DAC9A9490C7BBC98B764B312517E55620BAF07201EB7C4
          18DBBB5ADA595B48B5CFAAD7BD49BD6EAF2DB4569F651FEBE5FE48C9F8EFF0A6
          E7E2D58F832CA21A7CB67A5789ACB57D42DF5204C7716B10904B1050AC19983E
          36B6148CE48AF38F1BFECC5AE6A9E1DF8C3A078725D1347D0BC552691368BA5C
          6CF05AD9BDBF966E99E248F6C6D27963940C5B6AEEC62BD57C29F1BBC2BAE681
          E0CB9D575BD1FC3DADF89F4CB2D46D743BCD4E2172DF69405123562AD27CC4A0
          217E62A7033C557F8DFF0016AEBE12E9FE137B1D121D76FBC45E22B4F0F410DC
          5F1B48E292E049B6477114876828010149C1CF6C1CB079EE37030853A3256834
          D26AFAA9C677F5E68AF95D751CA946576FFAE871DE31F835E2E7F12FC5BBBD00
          689A859FC41D2ADEC5DB52BE9AD24D3DE3B596D890A904A26521D5FEF21CE571
          FC47B9BFF86B731FC02B8F87D657915C5E2F865B4182F2753146EFF65F216460
          37155270481B881EB5E7FE2BFDABBFE10BF879F11B54D53C2DE5F8BFC0975696
          FAAF87A3D437C2E975322DB4F0DD88B0C9246FBC031ABA952AC8BC13F4056353
          37C4D58D38CADEE38BDB7708A8C6FE918A5A5AFBBBBD46A9C55FCCF0DF87FF00
          05FC4B16BFF0E6FF00C572E956907803463A6E99068D732DC35ECF240B04D34E
          F2451844F2E35DB1AA93B9892F8014C1FB377C17D73E0C68DA4E97A8785FC1ED
          790C73C37BE28D36F5CDFCE8F234AAA55ACD4B283E5AE1A5C6101EC16BDE68AD
          EB6798AAF4AA509DB9256D15D5ACE6F4B3BEF524DA774DBDB44254A29A6BFAFE
          AC78A7ED0BF093C6DF172DAE341D2BC41A7DA784755B286D6FACEF22C4969347
          7914FF006B88AA16998C68F1F94CF1A8383B8E4E39CF17FECC1AD78FADFE2D5D
          6A9E21FECFD47C5D72BF66B1D2DD058CB05AC6A34FFB4996DDE5470EB993CA60
          0E78F4AFA3A8AAC367F8DC1D2852A1CB151D57BAAF7BC6577DDDE10D77F753DF
          514A9464DB7FD7F573E5CF16FECA7E21F88373F11F5BD66F744B1F15F882CB4C
          FECCD434D79C0B4B88ACCC17B11385616F3EE78F197CA306652CA055E4FD9C75
          CB5F15783B55BDD03C1FE33B3D1FC1167E199F4ED72E5D2317513EE69E3CDA4A
          0AE32A090AD873D3A1FA568AE9FF0059F317054DB5CA9592D55972A85934D34A
          D15B3DEEF76C5EC61B9E1BE3BF82FE25F1AF8E3C43E22F374AB2FED7F87771E1
          5FB37DA6593CABE96567CEEF286E846EC6FC0638FB82A0F077ECEF73E07F12FC
          24D53468744D1DB40D2AE2C7C50FA6A1824D59DED624424AC63CF5134664FDE9
          07386C6EAF79A2B9167B8D8D1F6116942CE36B747170F9D9376BECECF72BD946
          F73E6AF0CFECE9E2ED2FC25F0E3C137771A20D0BC1BE265D7975A86EE67BABC4
          8E6B89638CDA9842C6CDE72A93E7305C123774AFA568A2B8F1F9957CCA7CF5ED
          7BC9E8BAC9DE4FE6FE4BA245420A1B0514515E51614514500145145001451450
          0145145001451450014514500145145001451450014514500145145001451450
          0145145001451450014514500145150CB2CDF69B5B6B6B592F2E6E5D9238A378
          D3EEC6F2312D232A8016363927B5004D451B268FE59E1FB3CA3EF47E6C72E3FE
          051B329FC18FBF3915F3BFFC358DD5843E2BD7F55F084367E03F0BF8AE7F0B6A
          BACC1AB19AEEDCA3AC6B766D3C85DD1179610CA92348BBC908FB7900FA228AE7
          F58F887E15F0F6BF65A16ABE26D1F4DD6EFB67D974DBCBF8A2B9B8DEE513CB8D
          98336E6054601C9040E6B97F0A7ED05E0BF14C3E3599F54874287C21AC4BA36A
          B26B3710DBAC522388D65CF9871148F95467DA58AB0C645007A45159FA078874
          AF15E9306ABA26A767AC6993EEF26F6C2E127864DAC55B6BA120E1948383C104
          76ACFD1FE21F857C43AFDEE85A5789B47D4B5BB1DFF6AD36CEFE296E6DF63847
          F323562CBB58853903048079A00E828AF3FF00F85AFF00F17F7FE159FF0065FF
          00CCB3FF00091FF6A7DA3FE9EBECFE4F95B7FE05BF77B6DEF58FF0B3F689D03C
          71F05FC3DF113C4771A6F816C7589668122D53538D6359126963082671186661
          0B36300E33D719A00F58A2B9F83E21F856EB56D2B4A87C4DA3CDA9EAB6AB7BA7
          D9477F134D796E55984D0A06CC88551C865046149CF068F0A7C43F0AF8F3ED5F
          F08CF89B47F117D9367DA3FB26FE2BAF277676EFF2D8EDCED6C67AED3E9401D0
          515E4FFB427ED13A07C02F066A5A9DC5C69BA9F886DE2867B6F0DCBA9C76B777
          71C93AC45D148672AA37B64211FBB6E9824771FF000B0FC2BFF0967FC22DFF00
          09368FFF00093FFD017EDF17DB7FD5F99FEA776FFB9F3F4FBBCF4A00E828AF37
          F89DF16AEBC13E33F03F84347D121D67C43E2C96F05A0BEBE367690C76B079B2
          B492AC52BEE20A05511907272CB819D0B1F896BA17865B53F88D069BF0EA65BE
          92C54EA1ACDBBDA5C9058C72413929B95D14B05748E41B5F29800900EE28AE3F
          58F8C9E00F0F7D8BFB57C71E1BD37EDD6A97B6BF6CD5EDE2FB45BBE764D1EE71
          B91B070C320E0E0D6C5CF8CB40B2F135A7872E35CD360F10DE4467B6D265BB8D
          6EE78C0625D22277B2E237E40C7C8DE86803628AF3FF0018FC6EF0AF873C017B
          E26D3F5BD1F5CFF8966A1A8E996B6DA9C5FF00134FB244F24C903296DFB7610C
          5436CEE38AE7FE157ED3BE15F89726A56731FF00847753D2B42D3B5FD422D42E
          625863B7BAB44B92F1C8581748564459246440A597FBC2803D828AC7F0BF8CB4
          0F1C69F25F78735CD37C41631CA607B9D2EEE3B98D64003142C8480C0329C75C
          30F5AD7105F4CF18B5B0FB5891D6253F6DB584B48C42AA05966462492A060104
          9001CF1400B451450064F8B3FE455D67FEBCA6FF00D00D745FB11FFC9BA693FF
          0061AD7FFF004F37B5CEF8B3FE455D67FEBCA6FF00D00D745FB11FFC9BA693FF
          0061AD7FFF004F37B5F9FF001B7FC8BA1FE35FFA4C8EAC3FC6CBFAB7FC963F8B
          1FF627F857FF004E5AD56256DEADFF00258FE2C7FD89FE15FF00D396B55895F4
          1C3FFF0022BA1FE132ABF1B0AF17F8DFFB3FC7F1A7E24FC39D4756B6D3751F09
          E8716AD0EADA7DEB389275BAB648E231055FBCAEA1B76E42A42B29DC063B8F8C
          9AFDFF00853E10F8E35BD2A7FB2EA7A6E857D796B3EC57F2E68EDDDD1B6B020E
          1941C1041EE2B8CF8DBE3BF87DF00BC737FE12F13FC58F8C4756B4B68EE87D97
          46D0CC53ABC3348A2277D3903F31244587C8249D06EF927317D146129BE5845B
          7D926FF2316D455DBB1E55E14FD90FC69E18F8756FA65C788F4DD7FC43A5FC48
          87C716D757934C8BAA471AA214B894A3BC32B80EE48598038196C961CFC7FB1B
          7C49D50DC5F6B1A9F855756BDBEF176A176B63717220126ADA6C76D108F743BB
          6ACAAE5B39213182E722BBEBAFDA77E0D5BFDA3CBF8C3F192E7CAF336795A368
          03CDDBF68DBB77580FBFE445B7763FE3EE0DDB76CDE4975FB4EFC1AB7FB4797F
          187E325CF95E66CF2B46D0079BB7ED1B76EEB01F7FC88B6EEC7FC7DC1BB6ED9B
          C9E8FAA627FE7D4BFF000197F919FB5A7FCEBEF471317EC51E30589E69756D1D
          EE2DAEBC237B6D6F6F7D756FF686D2AC1AD6E636B848C496FBCC8CD1CB18761B
          46421391DC7827F663D77C39F127E1FF008A4C7A0E990E93AC6BFAB6AB6767A8
          5FDE48ED7D6D1C11113DD177B897112B4921F24127E54CE4B36EBF69DF8356FF
          0068F2FE30FC64B9F2BCCD9E568DA00F376FDA36EDDD603EFF009116DDD8FF00
          8FB8376DDB37925D7ED3BF06ADFED1E5FC61F8C973E5799B3CAD1B401E6EDFB4
          6DDBBAC07DFF00222DBBB1FF001F706EDBB66F24FAA627FE7D4BFF000197F907
          B5A7FCEBEF443F07FF0065EF1578135FF8550EABA868EFA27C39FEDCFB2DE59C
          D2C973AAFDB9D827990344AB6FB55C938965C9000E0EE1D07C6EF815E2AF1878
          FF005BF1378665D1EE7FB73C0B79E0BB8B5D5AEA5B4FB2F9B29916E51A3865F3
          7EFB031909F747CC73C62DD7ED3BF06ADFED1E5FC61F8C973E5799B3CAD1B401
          E6EDFB46DDBBAC07DFF222DBBB1FF1F706EDBB66F24BAFDA77E0D5BFDA3CBF8C
          3F192E7CAF336795A36803CDDBF68DBB77580FBFE445B7763FE3EE0DDB76CDE4
          9F54C4FF00CFA97FE032FF0020F6B4FF009D7DE8E47E207EC9BF13FC55F0E9BC
          223C45A6EA3627C3BA1E976714FAE5F58DA695359AA8B9C5AC50B477AB332065
          9260AE990001B16BDC3F686F865AFF00C4AD3FC0CFE1C6D34DF7873C5763E217
          8754B992DE39E3B7126630E91485598BA8CED200C9ED83E7B75FB4EFC1AB7FB4
          797F187E325CF95E66CF2B46D0079BB7ED1B76EEB01F7FC88B6EEC7FC7DC1BB6
          ED9BC92EBF69DF8356FF0068F2FE30FC64B9F2BCCD9E568DA00F376FDA36EDDD
          603EFF009116DDD8FF008FB8376DDB37927D5313FF003EA5FF0080CBFC83DAD3
          FE75F7A21F1EFECBDE2AF1F7C3CF8BD25CEA1A3DAF8EBE215D69CEF6D14D29D3
          2C6DECA68FC88C4A62F3647312317936282EC00450327EA0AF996EBF69DF8356
          FF0068F2FE30FC64B9F2BCCD9E568DA00F376FDA36EDDD603EFF009116DDD8FF
          008FB8376DDB37925D7ED3BF06ADFED1E5FC61F8C973E5799B3CAD1B401E6EDF
          B46DDBBAC07DFF00222DBBB1FF001F706EDBB66F24FAA627FE7D4BFF000197F9
          07B5A7FCEBEF47D35457CCB75FB4EFC1AB7FB4797F187E325CF95E66CF2B46D0
          079BB7ED1B76EEB01F7FC88B6EEC7FC7DC1BB6ED9BC9F7DF04FC39D37E23783A
          C3C57A0FC63F1E49A05F8736D7371FD8399009A6881C45A5C9B73E4336D62AEB
          9DB22A38645C6A52A947F8B071F54D7E68B8CA33F85A7E8CDDA2A1FF00851A3F
          E8B2F8D3F2D27FF94D5E65E1ED4EF6CBE2F2E8D078AFC43AF690A9ADD94D1EBC
          34F6DF3D99D1CA4F11B6B3B765046A132ED62D90AA7E53C0C934F62ECD1EA745
          1453105145140051451400514514005145140051451400514514005145140051
          4514005145140051451400514514005145140051451400514514005145140051
          451400514514005259FF00C8C5A3FF00DBEFFE9BAEA9692CFF00E462D1FF00ED
          F7FF004DD75400B5F2BDC7ECC5E34D7342F881E07D4EE741B5F05F8CFC6B73E2
          4BED52D2F2693518ECDE58E54B78A068163594B411032348EAA19FE472067EA8
          A2803E5FFDA4FF00675F88BF18AE7C6369A7EBD6779A26B16BA7C7A5DB5FEB57
          9610E90D049BE70D6B044F15E79A406124B8642400308A6B41BE0078FF0042D2
          7C75A77877C45676B6FADF8E878B55E1BEB8B19AFED25646BAD3A59A28CC9698
          2836CF0B3B38182B18622BD83E250B983494BD3E2FBCF086996B93713697650D
          C5E5C4ACCA90C51F9D14C0EE662A22489A491DA208C30564F2FF0006FC4DF126
          B3E30369E2BD6EF3C27ADE9D75A6E9F73A3DBE8A66D0E59A6B1B39E68E5BCF2D
          824ED35D4B0C405D28C8B6F9252C44C01D07ECD1F0935BF843A078C2DB5D92CD
          AE35BF135E6B90C7677F3DF7930CC91058E49E7449257051B2EC32DC12724E3C
          FF00E037ECABAC7C2BD7FC1BFDAABA3EA369E13FED3FB2EB2756D4AE2E66FB4B
          B04F26C9992DACB31C87CCC79DB8A8C609DE3B0F8A3E37F190F0B7C56F10F847
          5BB3D334CF0DE98F15ACB79A70BB12DDDB41732DE3C043A83F3496B0EF7322A4
          B69708D0F04B751F186E7C45A469EDA9685E249ACF5158BC9D17C3D6D69038D6
          35121DD209DA4477313045CF946131C6B3C8F2ED1BA200E7FC51FB3EDAF8E3F6
          8D8FC71E23D2F41F10785A3F0A0D1934ED52DC5CC8B782F0CC2511BC650288D9
          9776EDD96231839AF3FF00007ECC5E34F877E19F8253DBDCE83AA7887E1F4BAC
          8B9B096F26B7B4BB8EFCCB864B8103BAB2064F94C386CB7CC368DDED1ACEA5AF
          789FC7F79A1F87B59FEC9D3F4CD30A6A7782D639F65DDC4B0B42B1160409E2B7
          8AE18ABFCABF6CB5768E656DA387F0F7887C57E2BF1369FE1887C61A943A0DDC
          5A96A3A678AEDAD6CBEDFAA5B5B8D3515887B730189A6BDBB0AE902798905BBA
          31562F28071FF057F64EF177C26D574CB887C4FA6C135AF806EBC369A8DBC2D2
          C96DA8CDA84B7826485D764914665C02CC0B94E5143606C7C0DF803E36F04FC5
          EB4F18F8A6F6CEEBCAF07A787AE65FF8486FB57B9BBBB1711CAF739B9897CA47
          DAC7CA462AA4F03E6268F06FC5CF1678BFC2D63E379F56FB1795A9F86F4B9341
          B4B687EC170BA8C1A5BCF2397469C3A9D4A5D9B26551E545B95B0FBFA0F801E2
          3F14DF7F6243E39D43C616FE23D47425BEFECBF115A6950DB4CCBE40B9961169
          189A3F2DE68D765C146C4C3E466562801C3FC70FD98BC69E36D43E2F27872E74
          19AC7E2245A2979B54BC9ADA4D3A4B0232A1120944CAE114EEDC854B11B4E326
          C78D3F675F88BE2DF899A6EAF7BAF59EAFA65878EACFC4D6D7579AD5E45F67D3
          A10B8B18F4D589AD83A7CD89C3077E4B637B57D414500793FC5BF865AFF88FE2
          4FC36F1C7871B4DBABEF08CBA807D2F54B992D63BA8EEEDBCA2C2748A52AC855
          4EDF2C860C7E65C73CFF00897E197C49F12F8CFE1E78F6F1BC2B37887C2B7DAB
          15D0A0B9B9B7B43677707931A9BC3148EF2C611599BC8457DE4054D80BFBC579
          FCFAC7892CFE3A697A44FAA59CBE18D4342D46F20D3E1B131CD1CD04DA7A0696
          6323799FF1F12ED08B1801B0C1C80C003E77F087EC45AFF8674C5B5B8D4341D4
          E687E1BEA3E17B6B895640D6FAA5DDCDCCC644CC676C4A974F1798087605BE40
          188AEA3C31FB3178AB41F1CFC3CD4D8783CE9FA2E99A4DAEACE6DA5964BB96CE
          D5A2DC61752924E8E14DBDE2B412448F22324AB853D87C0BF89B7FE33D2748D5
          EE75BD6357D4358D32DB50B8F0FDFE8AB6096CD2B43E649A7CB247079D6B0F9C
          DBCEEB962A6021F7301363DA78B7E21596A1AE4D752F8A97599EFB5DB5F0CE99
          AA5AE95168BAA4F11BC6B1B71B156F154C10093CC95E356F2C9F308740E01E5F
          0FEC6DF1260D1BC29E183A9F8564F0F785747F12E99637BF68B95BBBC935386E
          5125963F24A46A0CB0028ACE576C8433E554761E18FD98BE21F827C3BE38B3F0
          FF008AB4DD2356F12785343D362D5ADDE51258DF69F6AB6CF1A0F2F98A640D8B
          805648CB64464A835EA1F07BC6D75ADF8BFC4FA03EAFAF6BB63A758E9F7D15EF
          89F453A65E892E24BB478FCBFB35B06880B58CAB08C9DCF202ED80A9EB1401E1
          FF0000BE0CF887E1CFC43F893E24D6FEC70DBF89FF00B37ECB690EB977AC4D0F
          D9A19237F36E6EA3491F25C15CE703E5E028CFB7C3FF00218D03FEC33A77FE96
          434B490FFC86340FFB0CE9DFFA590D002D145140193E2CFF00915759FF00AF29
          BFF4035D17EC47FF0026E9A4FF00D86B5FFF00D3CDED73BE2CFF00915759FF00
          AF29BFF4035D17EC47FF0026E9A4FF00D86B5FFF00D3CDED7E7FC6DFF22E87F8
          D7FE9323AB0FF1B2FEADFF00258FE2C7FD89FE15FF00D396B55895B7AB7FC963
          F8B1FF00627F857FF4E5AD56257D070FFF00C8AE87F84CAAFC6CF3FF00DA17FE
          4817C4BFFB16753FFD2592B13F6A2B9BCF066AFF00B57F8AF4479F40F135B697
          E0F8ECF5DD3D0DA5E471CB73B2611DC241139571122B1124C0F94AA641B0430F
          47F1D74EBAD5FE08FC42B1B1B69AF6FAEBC3BA84105B5BC66492691ADA455445
          192CC490001C926B8CF8C3A07813E22FC66D77E247873E2BFC4DF87DAD6AB631
          5931D0BE1CEB90380903A624961B589E6532259B91212DB6074DD8688C1F5785
          A91A556339ECBF477B7CF6396AC5CA0D44DCF8C3E35B3D07E2C788BE1958E99E
          3EF0B43E25F8A5A5EEF147826EC68D671C979A4D924A8F7423904B317679DE0D
          AA5F21CC80839F9B7FB02F3F666F02FC77F15EBFAB4FAE789BC53A86A9F0E745
          9F50C893558FED07FB535292376DECA046AAB2A492059DD9640DC1AF41D2BE0E
          F847C2FA96BDA8F873F681F8CBA16A1ACCB25C5DDDDAF813C431CB7521376D1B
          DC3A42A6665335B162482C63B8236FDA17C8C3D63F664F85BABE8D67A449F183
          E284DA4E99F69FEC9B0BCF86FAECF05879AD70C7647F670A32CD66CFB02EF304
          C7E5F393C8F7E8E3F0D49285DDB4BE9BDBE7A6ABEE382742AC9DFAEB6F23D93E
          2FDE791E24FDA2B4897C3DFF00099E81E0BD5BE1FCBE1DF053C7E6DAC397855E
          D6CE02AEB0F9C8CD0911A7CC2420AB0241E4BC7FE23F13FC4CF86969E27F0027
          88BC43F1162F8D1776FA25AF8C344B76BFD05A4B0795EC238E796E123860288E
          59BCB546877948CC418737E25F815E05F14786E0F0F5FF00C76F8BDA8681639F
          ECDD2B52F87FE20B9B5B3D897296FB6230051E5A4968BF285C88A703609D7C8D
          2D63E18787757D66CF5793F68BF8D736ADA67DA7FB26FEF3C11E239E7B0F356E
          14EC93C90C32AD66AFB0AEF104C3E5F393C8CA18DC3412D5B6BCBB452EFD6D77
          EBD4A746A3BFF9F9DFF02C782BE24E9DADDD789B46B6D7BFE138F1CFC36F84FE
          27926F898B2B493DCDFC92C4EBF64B97CCCD1DA89268A3B8DCBBC4B2145446CB
          F4BF0DFC41750FED95FB37C8D158DCDEF8ABE1969D7FACEA5776105C5F5DDCAE
          9D7FFBE3752234CB230545675705D51558B2A80392D63E18787757D66CF5793F
          68BF8D736ADA67DA7FB26FEF3C11E239E7B0F356E14EC93C90C32AD66AFB0AEF
          104C3E5F393C8CDBAF815E057F19DC78BEDBE3B7C5E8BC58DE6793AF4BF0FF00
          C40F7C998EE228F74E20576DB1B59A360AEE5867036899040DE370B2525AEA9A
          DBABFBB4BEBE5B242546AAB7935FD7E8667ECA892D87ECBDA249A278B755F87B
          E26D77E2ED968B0EBDA169D1DD4B3B1B25F22DEE95A684496A1E4772AC645C93
          FBB6DC6BD03F673F84DA57837E14FED0FA7DFEADE16D4FE2A6B3A4F892C6EE3D
          36FEC2DA1D26DED4BDB15689842F691CD3BBC990A2011450163110AADC9785FE
          057817E1EFF69FFC217F1DBE2F784FEDD9DFFD97F0FF00C416FE66DFB5791E6F
          9502799B3CDB6CF4CF95718D9E7AF9199A77ECC9F0B7C39FDAFF00F08FFC60F8
          A1A2FF0068DA5C584DF67F86FAEA79D6D279F8866D96EBE6C7CD96F4380FF679
          B85F393C8D6AE6187A8E76934A4D3D974E8F5BDBE7F7131C3D48DB4DBCCF24FD
          9B355B0F853E21D5B5CB4B89FC5F36A1E0ED5229EF3C1BA75DCFAA7831A48631
          FDA0C268A04DD19731978A70A03487CD00A87D2FDBCA3B39BC57F0A354B69E7D
          426D5BE1C68B7D75AB5F4222BCD4A42264173738772666448C312EE46D037305
          06BD2746FD993E16F84759FED7F0C7C60F8A1E1ED5A0F3BEC57F65F0DF5D8A7B
          7DEB72ABFBC8EDD18FCB25AAB6D2BBC45703E5F3D7C83C5BFB327C2DF19EB3A8
          6AFAB7C60F8A1AB6AD75BBFD3F56F86FAEDDCED859D61F3246B7DD26C5364A79
          1916F301B3CE4F23AFFB5B0BF5855AEF6EDFD7F5D3A997D52AFB3E4D0F86EBF6
          1FF66CF375AFD8E3C0B141AA4F6F34BA5A5BA5FDB4C93CB6EC26BD4050C92DCA
          6E8C8C0463B54AED30C207909F255D7EC7DF059FED1F66F897F10A2DDE6793E6
          FC2ED69F667ED1E5EEC5B2EEDBBACF7636EEF267C6DF393C8FA02DFE2BC7F0E7
          C0DE1CF05781AE6F359D1749B6308BFF0012F847C571DD3059A768536AE9F30F
          962955490E149188E28515631E5E739852C7C611A29E97DFE47560F0F3A0E4E7
          D4ABF02FC0BF1EF49F883AF5CFC4FF008950EBBE16B095A0D2ACEC34CB280EA8
          AC808B898A421E1550D8F2C36E322B7CC635066A3E15FF0092E12FFD843C5DFC
          BC3556FF00E17E78B7FE7DF4BFFC253C5BFF00CA9AC9F86D35CEA7F146CAF258
          6EA59A48FC43A85E4E9A26AB6569035D3686B14624BEB4B7DCEDF62B86DAA1B0
          17935F3314D3BB3D36D33DC68A28AD080A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A4B3FF918B47FFB7DFF00D3
          75D52D25B2B0D6B4D983468917DA833CC48452F6771126EDA19B1BE44070A48C
          E71C5002D149FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00
          F81979FF00C87401C878E3E1DBF8CF56D0F5287C4BAC787AEF48F3CC0DA62DA4
          885A55552E52E609943AA8745750AC166957389181CF6F8396736AC97971AF6B
          1736F2DD59EA3A8D849F6610EA57D6CB0886EE62B08911C1B6B66290BC711308
          CC78670DDFFF0067EA3FF3F9E1FF00FC0CBCFF00E43A3FB3F51FF9FCF0FF00FE
          065E7FF21D00720FF0BF4A93E155E7805AE2F1B4CBCD327D32E6F4BA1BC9FCE4
          659AE1DF6E1A7919DE4672BF33B3310726ABF8A3E18CFE20F17C7E23B2F186BD
          E1DBE4B11A7AC7A747632C6B1F986462A2E6DA628CE4A6FD85438861DC0F96B8
          EDFF00B3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E
          80388D63E12E9DABF8335EF0EFF69EA56ABADDF497F7BA844D0BDCCCCF3890C4
          E648D9248846A96DE5C88E0C08B11CA8AAF3FC28BBB8FB15D49E3BF1236BF67E
          7C506BBE569C2E52DA6F24CB6DB3EC9E4142F6F0BEE317980AE0385254F7FF00
          D9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C3FFF0081979FFC87401E71
          63F01B40D226B3834DBCD4B4FF000F5BCB6372FE1E8A58DED279ECD204B595E4
          746B80D1ADADAF0B32AB790BB95B749BF63C35F0DA1F0FEBEBABDC6B9AC6BD71
          6D6B2D8E9EBAB4D1C9F60B691E369224758D649771820CBDC34B27EE81DF9672
          FD7FF67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF
          0021D002D149FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00
          F81979FF00C87400B58F75E17B5BBF17E99E23792617DA7D8DDE9F146AC3CB68
          EE24B791CB0C677036B1E3040C16C83918D7FECFD47FE7F3C3FF00F81979FF00
          C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A00E03C31F072CFC2773632D9EBDA
          C489A5DAAE9DA44337D98A69963E642EF69162105D1D6DA08D9E6324A163CAC8
          AC598D8BCF8516BAA6BA6FB50D7F5EBEB18A59EE6CF4B7BC091D8CF34524524B
          0CF1AADC86D93CEAA0CC56312FC8A9B22D9DBFF67EA3FF003F9E1FFF00C0CBCF
          FE43A3FB3F51FF009FCF0FFF00E065E7FF0021D00731E10F022F85F50D4353BA
          D6B52F11EB37D1436D36A5AA0B7493C884C8D14412DE28A30AAD3CCD9D9B8990
          E5880A17A8A4FECFD47FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1FF00FC
          0CBCFF00E43A005A487FE431A07FD8674EFF00D2C868FECFD47FE7F3C3FF00F8
          1979FF00C8752D8E9B75FDADA4CB75A8E8715B5B6A16B772B43717723EC8A749
          085536AA0921081923AD0047451450064F8B3FE455D67FEBCA6FFD00D745FB11
          FF00C9BA693FF61AD7FF00F4F37B5CEF8B3FE455D67FEBCA6FFD00D745FB11FF
          00C9BA693FF61AD7FF00F4F37B5F9FF1B7FC8BA1FE35FF00A4C8EAC3FC6CBFAB
          7FC963F8B1FF00627F857FF4E5AD56256DEADFF258FE2C7FD89FE15FFD396B55
          895F41C3FF00F22BA1FE132ABF1B21B46BBBBB717434F923B1679116E64B9B71
          BB648D1B111F9BE691BD1867676CF4E6BC97FE1A5341FF008697FF00853BE4FF
          00C4C3FB33ED5F6EDD27FC7DEDF3BECBB3CBC7FC7BFEFBCCDFB7F83EF715EBF6
          5FF22EE91FF6FBFF00A71BAAF943FE192FC65FF0837F687FC24D67FF000B0BFE
          130FF84E7FB27CC1FF0008EFF69FDAB76EDDF66FB5ECFB3FCBB3CCC6EFCEBE80
          C8F50F871F193C55F13F5FF1443A5784747B7D13C3DE26BAF0E5D5E5E6BF2ADC
          BF90EA1E68E05B36539570421947390580F9AB8FF05FED6BAAF887C27F0EBC5B
          AAF82ACF4DF0C78D75D4F0FDABD9EB8F757B6F70F24D123490B5AC69B37C0724
          4A485604027E5AEA3E09FECFB6BF0F7C4DE37F11EBBA5E837FE21D5BC57A8EB3
          A66AD05B892EED6CEE028588CAF18746C19372A92BF39E4E4D79BF80FF0063DD
          57C0DF0F3E135BD8A786F4FF001D7867C4D1EA7ADEBF601E29AF74FF003AE0CB
          6EB702112C9BA2963428F85214A93803201D843FB606829E13F8C7AB5EE9FF00
          63BBF873A9CFA74B63E74927DB712186D5F788B11F9F32B47801FCBC6E63820D
          68783FF6A1B0F127C4CF01F83AF348FECBB8F17F83EDFC51673FDA5A6C4D2067
          369B44407CB1C72BF9A5941D98DA0915E2FE26FF008279378CF5DF1A788B53D4
          B4D5D6752D635ED42CA146B868E78EEA2FF897899C15F25A09CBC8DB1240C1B6
          92C062B43C77FB08EA3F141FC2F06B5ACE9B610E8DE01D3BC3715EDB89A7920D
          46DEE159E648BF76B244D119A305981CC99D9900D007BC7C00F8E967FB41681E
          22D6747D3FC9D3F4ED76E748B393ED1FF1FD1C691BC73FEF163F2B78947C8FF7
          7BB75C7A7FD8F57FFA03FF00E5574EFF00E49AF20FD9A3E084DF01B40F186899
          B35D32FF00C4D79AA695059CD24BE4593A4490C7234801DEAB1E0F2DDBE63CD7
          B050027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          009F63D5FF00E80FFF00955D3BFF009268FB1EAFFF00407FFCAAE9DFFC934B45
          0027D8F57FFA03FF00E5574EFF00E49A3EC7ABFF00D01FFF002ABA77FF0024D2
          D14009F63D5FFE80FF00F955D3BFF9268FB1EAFF00F407FF00CAAE9DFF00C934
          B450027D8F57FF00A03FFE5574EFFE49A3EC7ABFFD01FF00F2ABA77FF24D2D14
          00049912333C3E43BA2C817CD8E5051806460F1B32306521810C78228A483FE4
          0DA07FD81B4EFF00D23869680327C59FF22AEB3FF5E537FE806BA2FD88FF00E4
          DD349FFB0D6BFF00FA79BDAE77C59FF22AEB3FF5E537FE806BA2FD88FF00E4DD
          349FFB0D6BFF00FA79BDAFCFF8DBFE45D0FF001AFF00D2647561FE365FD5BFE4
          B1FC58FF00B13FC2BFFA72D6AB12B6F56FF92C7F163FEC4FF0AFFE9CB5AAC4AF
          A0E1FF00F915D0FF0009955F8D8965FF0022EE91FF006FBFFA71BAAC0F1F78AF
          FE109F09DF6AC96BFDA1769E5C16563E6797F6BBB964586DA0DF8213CC9A48E3
          DEC36AEFDCD8009ADFB2FF00917748FF00B7DFFD38DD56078CBC0DA578F6DAC2
          CF5B87EDDA65B5D7DA66D3665492D6F711C88B1DC46EA4488ACE250A7A49144D
          FC35F406478FF89BE23EBD61E1AF09E917FE20D634CD6ED3C4CFE1CF10EA1A06
          931DF5EDCF97A6DCDCC53476E2DE751F6855B3B8291C6DE52CCC85814722BEA9
          E2DD4ECBC70745B9F1FF00C428B4E8BC3BA76A56F3697E138AEEEE792E2E2FB7
          9BA44D2E4F218243022A1488FCAD905839AF48D33E06F85740F11E9DAAE8969F
          D816F61751DEC3A3E951C56D61F685B7BBB7698C28806F78EF48760416F22019
          C260F516BE17B5B4F17EA7E23492637DA858DA69F2C6CC3CB58EDE4B8910A8C6
          771375267248C05C0183900F17D0FF00683BFD17C59A79F1ABD9DA68177E05D3
          B5CB9BCD39D6E2DAD75168EFEE278E2F2BCC69524B7B49DD5C3B20168002CD2A
          EECFF067C76F160D63E1CB78A2CBEC76FAE5D788ECF59B4F36193FB3268B5882
          CEC577C6999B6493476B94C06F3BCD7242123D43C3FF00043C37A05958DA66F2
          FEDECF4CD174B892EA603E5D2E6927B490940A4BF9926E6FE16DAA36819043F0
          43C373473C3766F2F6D2E2D75CB39EDA5982A4B0EAB7697574A4A05618640A85
          482149C963860019FF00027E255FFC528BC69AA5C2795A645AE88B464CA9DDA7
          35859CF6F2E42A91E72CDE7ED71BD3CED87EE6067D878FB5E9BF67AF873E267B
          EDDADEADFF0008C7DB6EBC98FF007BF6BBBB28EE7E5DBB577ACD20F940C6EF97
          040C7A4687E17B5F0FEA7E21BEB792679B5CBE5D42E5656055245B682D804C01
          85D96C879C9C96E70401C3E81F0263D13C39A4F87A6F1A789357D034AFECFF00
          B169F7AB60A90FD8AE209EDFE78AD5246C1B7443B98E559BF8B0C0038FF87BF1
          1F5ED4FC7F6D6F3788358D47ED7E26D6F4ABAD3B53D263B5D36DED2DE5BE101B
          3B916F1F9F38FB35BA94134CDB5AE18A7EED9A3C7F06FC42F115EFECE5E21F1D
          0F1A78AB51F10DB7829F5368B59D020B3B282F5ACCCC25B66363179EAAE8C061
          E54DAC376EDCA6BD63C3DF072CF41D7E3D41F5ED6353B4B6D4EF759B1D26F3EC
          C2DACAEEE9E769648DA385256E2EAE142C923A8129E09552B9FA3FC098F4DF00
          5EF826E3C69E24D5BC3171A13F87E3B1BC5B05FB35BB44210D1BC56A8E5D5060
          17661C92431C1001CFF85FE267FC23DAFDF49A878A7C49ABF862D342BED5F51B
          9F17E83FD997369F677836B5B44B676CF3A14927321549761480663322892BDF
          7C41F18AF82351D2756B89BC31E345D63432D25BFD9AE24B6B0D53528630A84C
          6F0968775DD9866562E6CFCE2A04AB5E91E37F85FA578FB52B1BCD46E2F23FB3
          5ACB64D6F03A08AE6DE5B9B49E68655653BD24FB1244EBD1A3965520EE0473FA
          B7ECE7E0F9A3DBE1FB6FF84173E4BB8F0BDADADA24B343776F7504D246616491
          E27B6010BA901669863E7C800C7F1178D3C45E0E1ADF854EB336A97D6F2F87C5
          BF882E60816ED61D53526B27DC891AC2D2C5E54AE8FE5843BA3578DF63B4BD47
          81AF357D2FC7FE23F0A6A3AEDE7892DECB4CD3B5486FF5286DD2E435C4B7B1BC
          67ECF14519402D1197E4DD977CB11B42D83F0974EB9D0AFED350D4F52D5756BD
          96DAE25F105D3422F7CDB6944B68CA1235855619155D6211F965B7B3A399652F
          A1E10F022F85F50D4353BAD6B52F11EB37D1436D36A5AA0B7493C884C8D14412
          DE28A30AAD3CCD9D9B8990E5880A1403A8A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A28
          00A28A2800A28A280120FF00903681FF00606D3BFF0048E1A5A483FE40DA07FD
          81B4EFFD23869680327C59FF0022AEB3FF005E537FE806BA2FD88FFE4DD349FF
          00B0D6BFFF00A79BDAE77C59FF0022AEB3FF005E537FE806BA2FD88FFE4DD349
          FF00B0D6BFFF00A79BDAFCFF008DBFE45D0FF1AFFD2647561FE365FD5BFE4B1F
          C58FFB13FC2BFF00A72D6AB12B6F56FF0092C7F163FEC4FF000AFF00E9CB5AAC
          4AFA0E1FFF00915D0FF09955F8D8965FF22EE91FF6FBFF00A71BAA5A4B6B5BA7
          D174E862B8D2E1787ED4244BD9E74705EF2E255C797048A414910FDECF241031
          47F67EA3FF003F9E1FFF00C0CBCFFE43AFA032168A4FECFD47FE7F3C3FFF0081
          979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A005A293FB3F51FF009FCF0F
          FF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF0090E80168A4FECFD4
          7FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A005A29
          3FB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E8016
          8A4FECFD47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43
          A005A293FB3F51FF009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE787FF00F0
          32F3FF0090E80168A4FECFD47FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1
          FF00FC0CBCFF00E43A005A293FB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFC
          FE787FFF00032F3FF90E80168A4FECFD47FE7F3C3FFF0081979FFC8747F67EA3
          FF003F9E1FFF00C0CBCFFE43A005A293FB3F51FF009FCF0FFF00E065E7FF0021
          D1FD9FA8FF00CFE787FF00F032F3FF0090E80168A4FECFD47FE7F3C3FF00F819
          79FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A005A293FB3F51FF9FCF0FF
          00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E80168A4FECFD47FE7F3C
          3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A005A293FB3F51FF
          009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF0090E80168
          A4FECFD47FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E4
          3A005A293FB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3F
          F90E80168A4FECFD47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0
          CBCFFE43A005A293FB3F51FF009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE7
          87FF00F032F3FF0090E80168A4FECFD47FE7F3C3FF00F81979FF00C8747F67EA
          3FF3F9E1FF00FC0CBCFF00E43A005A293FB3F51FF9FCF0FF00FE065E7FF21D1F
          D9FA8FFCFE787FFF00032F3FF90E80168A4FECFD47FE7F3C3FFF0081979FFC87
          47F67EA3FF003F9E1FFF00C0CBCFFE43A005A293FB3F51FF009FCF0FFF00E065
          E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF0090E80168A4FECFD47FE7F3C3
          FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A005A293FB3F51F
          F9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E80168A4FECFD
          47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A005A293
          FB3F51FF009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF00
          90E80168A4FECFD47FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0C
          BCFF00E43A005A293FB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF
          00032F3FF90E80168A4FECFD47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E
          1FFF00C0CBCFFE43A005A293FB3F51FF009FCF0FFF00E065E7FF0021D1FD9FA8
          FF00CFE787FF00F032F3FF0090E80168A4FECFD47FE7F3C3FF00F81979FF00C8
          747F67EA3FF3F9E1FF00FC0CBCFF00E43A005A293FB3F51FF9FCF0FF00FE065E
          7FF21D1FD9FA8FFCFE787FFF00032F3FF90E80168A4FECFD47FE7F3C3FFF0081
          979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A005A293FB3F51FF009FCF0F
          FF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF0090E80168A4FECFD4
          7FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A005A29
          3FB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E8008
          3FE40DA07FD81B4EFF00D238696A59A14B4B7D3AD1278EEBEC9A7DA5A34D0860
          8EF1DBC71B15DC01C6E538C815150064F8B3FE455D67FEBCA6FF00D00D745FB1
          1FFC9BA693FF0061AD7FFF004F37B5CEF8B3FE455D67FEBCA6FF00D00D745FB1
          1FFC9BA693FF0061AD7FFF004F37B5F9FF001B7FC8BA1FE35FFA4C8EAC3FC6CB
          FAB7FC963F8B1FF627F857FF004E5AD56256DEADFF00258FE2C7FD89FE15FF00
          D396B55895F41C3FFF0022BA1FE132ABF1B21B28EF6E6CA3BE93FB3E1B595E65
          8E2FB44AD70CB1CD243BB6F93B065A3638F33A7BF15F32CFFB50F8A9B49D5638
          74FD1E3D4E4F8ACDF0F34FB992195A1B7B7DCB8B89A2128333850E0AABC60920
          F1820FD3F65FF22EE91FF6FBFF00A71BAAF009FF00651DDA4EAB1C3E29F2F539
          3E21B7C43D3EE64D3F7436F71B9716F3442506640A1C16578C9241E3041FA032
          33FE39FC75F1FF00ECE3E16D3B5CF1445E1BD6F4C9FC4D65606EF48B5B88A693
          4F782592E47D9A49888E75688846F3DD5830DCA98E4B6FDAD7FE125F8D7E36F0
          B783ACECFC61A2786FC1F36B71BE98FE74BA96A08D1B082DE689DD59196648F8
          8CB09030E4000F41E3AFD9EF5EF8AF6DA443E36F1A59EB56F61E26B1D7469B17
          87E38AC3ECF6F1BA3DA08DA5790F9C6462EF2CB20E81500CE73FE157EC7DA27C
          18F190D63C2DAF5E595B8F0CCFE1FF009AD606BD69A4BB371F6C69B6F96EEA0A
          C6AAF091B634049031401B1FB3B7C57D7FE2B69F6FA95F6BFE09D7AC67D1ECEF
          6783C3924915EE9379282CD6B7101966057190242F1B6E8DC7967AAFB3FD86F9
          FE64BBD0D50F2166BABA0E07FB416D5803EB8247B9EB5E51E03F831ACE8DF138
          F8FBC59E2C87C4DE214F0EC5E1B89ECB4A1A7C6F0ACC6679A54F365DD2B3EDE5
          3CB4037009C8DBEB14009FD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C
          3FFF0081979FFC874B450027F67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF
          009FCF0FFF00E065E7FF0021D2D14009FD9FA8FF00CFE787FF00F032F3FF0090
          E8FECFD47FE7F3C3FF00F81979FF00C874B450027F67EA3FF3F9E1FF00FC0CBC
          FF00E43A3FB3F51FF9FCF0FF00FE065E7FF21D2D14009FD9FA8FFCFE787FFF00
          032F3FF90E8FECFD47FE7F3C3FFF0081979FFC874B450027F67EA3FF003F9E1F
          FF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D2D14009FD9FA8FF
          00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00F81979FF00C874B45002
          7F67EA3FF3F9E1FF00FC0CBCFF00E43A3FB3F51FF9FCF0FF00FE065E7FF21D2D
          14009FD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C3FFF0081979FFC87
          4B450027F67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065
          E7FF0021D2D14009FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3
          FF00F81979FF00C874B450027F67EA3FF3F9E1FF00FC0CBCFF00E43A3FB3F51F
          F9FCF0FF00FE065E7FF21D2D14009FD9FA8FFCFE787FFF00032F3FF90E8FECFD
          47FE7F3C3FFF0081979FFC874B450027F67EA3FF003F9E1FFF00C0CBCFFE43A3
          FB3F51FF009FCF0FFF00E065E7FF0021D2D14009FD9FA8FF00CFE787FF00F032
          F3FF0090E8FECFD47FE7F3C3FF00F81979FF00C874B450027F67EA3FF3F9E1FF
          00FC0CBCFF00E43A3FB3F51FF9FCF0FF00FE065E7FF21D2D14009FD9FA8FFCFE
          787FFF00032F3FF90E8FECFD47FE7F3C3FFF0081979FFC874B450027F67EA3FF
          003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D2D14009
          FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00F81979FF00C8
          74B450027F67EA3FF3F9E1FF00FC0CBCFF00E43A3FB3F51FF9FCF0FF00FE065E
          7FF21D2D14009FD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C3FFF0081
          979FFC874B450027F67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0F
          FF00E065E7FF0021D2D14009FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD4
          7FE7F3C3FF00F81979FF00C874B450027F67EA3FF3F9E1FF00FC0CBCFF00E43A
          3FB3F51FF9FCF0FF00FE065E7FF21D2D14009FD9FA8FFCFE787FFF00032F3FF9
          0E8FECFD47FE7F3C3FFF0081979FFC874B450027F67EA3FF003F9E1FFF00C0CB
          CFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D2D14009FD9FA8FF00CFE787
          FF00F032F3FF0090E8FECFD47FE7F3C3FF00F81979FF00C874B450027F67EA3F
          F3F9E1FF00FC0CBCFF00E43A3FB3F51FF9FCF0FF00FE065E7FF21D2D14009FD9
          FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C3FFF0081979FFC874B450027
          F67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021
          D2D14009FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00F819
          79FF00C874B450027F67EA3FF3F9E1FF00FC0CBCFF00E43A3FB3F51FF9FCF0FF
          00FE065E7FF21D2D14009FD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C
          3FFF0081979FFC874B450027F67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF
          009FCF0FFF00E065E7FF0021D2D14002C722436EF23DBCBE7C31DC2496AEED1B
          472207420BA2372ACA7054107228A483FE40DA07FD81B4EFFD23869680327C59
          FF0022AEB3FF005E537FE806BA2FD88FFE4DD349FF00B0D6BFFF00A79BDAE77C
          59FF0022AEB3FF005E537FE806BA2FD88FFE4DD349FF00B0D6BFFF00A79BDAFC
          FF008DBFE45D0FF1AFFD2647561FE365FD5BFE4B1FC58FFB13FC2BFF00A72D6A
          B12B6F56FF0092C7F163FEC4FF000AFF00E9CB5AAC4AFA0E1FFF00915D0FF099
          55F8D8965FF22EE91FF6FBFF00A71BAAF38FDA124D657E193C5E1ED6E6F0E6B3
          75AC68F676DAAC08246B669B53B588B142409170E432138704A9E09AF47B2FF9
          17748FFB7DFF00D38DD56078E3FB07FB16DBFE123FF907FF0069E9DE57FACFF8
          FBFB6C3F64FB9CFF00C7C793D7E5FEF7CB9AFA0323E7FF001A7C48D57C4EDE2A
          55FED8B0BF82D7C1B6DA8F86F4BD51E0BAB1BB9F5AB88EEED63943C411E48CA2
          098322CB1989C3796C8D5DC6A1A535A695E00D0A38FC55E1FB1F11F88A68352B
          2D53C437171A8AC69A7DECCA82ED2EA57894C96B03E21980C641FBF229B1AEA7
          C2CF1178A75DB2BBB3BC8F50D72EAC6CF50D62CAD6FED2D67BAB39C9B55FED18
          956159E39C88815943F98AB092595506845A2F806E3E19E917CDA86B177E1CD5
          6EACAF34DD4EE758D4A5BD49AECC705BB4370F29B9837F9CA842B200B2C81805
          793201C7F8FF00C393787FC7FE0FF0F5A2F8F3C55A3CDA66B17834CD27C5125B
          DCC4C92E9AAACF7125DC124C8A6498812CB230370428081426C7C4DD3EEBC2DA
          82EA77F2F8A8F82F48D1E236FA9685AC95934692132B5CDE5E24B3AB5EAF95F6
          660AE97458C12E6326422520F0AFC2ED63C4D6BA25BCFAF45ACDA4B776F16AB0
          6A9ABDB35E4CC23FB4C275259145E4AA2D115A33348E82D0AE1440C17B8D63E1
          2F8675EFB17DBED6F2E7ECD6A964FBB53BA1F6DB74CED86F3127FA627CCFF2DC
          7980F9B2E41F31F70071FE215BFD0BE2649AAF881FC490E9936A7650691AC695
          A92AE9B690CA20816D2EACCCA3CD796E9A65327D9E52AB731912C7E5830F2FE1
          CB6B8F1F78C7C3FA56B1ACEBC6C4CBE359992C35CBCB1676B7D7A086DC33C12A
          332C7148E8AA490A0E001815EC17DF0CFC3BA9789975E9ECE66BE12C770F12DE
          4E9693CD18511CD2DAAB8865953647B6474675F2A2C11E5A6DCFD4FE0BF85354
          7B3736FA958CD692DF4D0CDA5EB57B63206BCB8171740BC132332BCAAAFB4920
          103680062803C9FC57F186FE2F07E85A45DF8B747F0E6B736A7AD08F5CF105E2
          E9F6F74BA45F3C10248E8546F9E6167E722285784DE05119D82BA0D065B6F8D3
          E3F9B59B7D5FC49A469F2F83F42D67498ECF559AD7ECAF752EA0FE6496E92182
          57C470E5654950F9614865C83EB1A4784346F0FEA0F79A669D0D84CD636DA66D
          B705234B6B732982248C7C88A867971B40E1B1D00C72F73F01FC1575A94F7AFA
          75E2BDCF982EA08B56BC8EDAF15EE67B974B8816511CE8D2DD5C12922B2E2565
          C6DF96803C9FC37AEEA3F16BC5FE1EBCD5F4CF155F43AA782BC3BA9CCBE15F10
          CDA5D969B35D497A679648D6F6177521531B44AE161C75C6EF50F8C366DABEAF
          F0E7487BED4ACAC752F114905D8D2F51B8B19268D74BBF9421960747DBE6451B
          603609519AD8F12FC28F0FF8AF5F6D6EF1B58B5D4DED62B3927D275EBED3BCC8
          63791E3575B79A30DB5A69482412379E6B43C65E04D23C796D610EAE979FE817
          5F6CB59AC350B8B19A19BCB922DCB2C12238CA4B22919C10C722803C3FC65AC6
          ABF6BB0F0A83E24D72C34AF1D7F63476FA36B0F67A9DEDA1F0FC97C91C9746E2
          02FE5C928F99E40CC9026F3249B99FD03E22ACDE11FD9AFC632E96FAC6917769
          E19D42EA037FA949757F6937D9A49006B932C8C5D18F0C24603680AD802BA0D4
          FE12F86755D0349D1A4B5BCB7B4D2AE9AF6D24B1D4EEAD6E52E19254798DC452
          2CAEEE279B7B3392E647662C4935A0FE04D226F04DE784EE52F350D12F2D67B3
          B88EFF0050B8B99A58650C24569E491A5390EC01DF903001000C0078FF008C34
          7D574AF847A8BF875BC61F0FF5FD435DD174F82EBC47ADBEB135BEFD4AD63132
          29BCB88F61133AB47B97CC0A55C15C56C783BC40DF163C71E2ED27559352D24C
          3E1DD0C6A3A1DA6AB716F36957E6E35169E212C2D1BAB1090FEF13689A311302
          D1BA93DC587C28F0FD8594D68CDAC6A16F2DD5A5E14D5B5EBEBFDB35B4CB3C0C
          86799CA62445621701B680C180C56C69FE10D1B49F136B1E21B3D3A1B6D67588
          ADE1D42EE2055AE5600E212E3A1651232EEC648DA092154000F9DECA3BC87E09
          7C0B7597C61E21B8F11DD5A5DEA90587896E63BFBE79344BA99C2DC4B7519441
          2469298C4A89F21C292704D4F53D564B4D2746FB3F8C27B44F1D3587FC2376DA
          FBC7ACC36FFD832DCFD9E6BEFB5A893F7C7ED23FD29C0478D37029E4A7D0163E
          01D074DD37C2DA7DB58F9769E18D9FD911F9D21FB36CB692D9792D97C432C8BF
          3EEFBD9EA0119FAFFC25F0CF89249E5BBB5BC86E26D4D7596B9B0D4EEACE6176
          2D05989164864465FF00470232AA42919241249A00E1F5DD299F59F07785C47E
          2A8F496F0EEADACBE8F17886E135492EA29AC44713DEADD077651773A6D6B831
          659727088CBCBF8A7E2EC36DE06F0B69361E24FF008436F6EAEB54963BDF1EEA
          91DBB46DA5DD18C594B73148DE6EEBAFB344DF348D2DAADC9690C84337B05EFC
          28F0FEA1A4E9D61336B07FB3FCC16D7C9AF5F25FAAC8DBA44378B309D9188425
          1A42A7CB8F8FDDA6DB1E0CF863E17F876F707C37A3C3A3ACF1081A2B76611AC6
          2E2E2E022213B5144B7770C0280007DA3E55500039FF00157C61B5B0F81B07C4
          0D39A1B18753B1B39F4F935A22382DE4BC68A3B77BB2AFF2448F3C6D29562551
          5CAE4819F3FF000F78D23F1B683E0FF0A5A78A26D734D83C5737866FB5CD1F56
          72FA9DB43A55CDEDB38BD85C48652AB67E73A3266649D71E59C37B45B780741B
          3FECDF26C767F676A775ACDAFEFA43E5DDDCFDA3CF9396E777DAEE3E53951E67
          006D5C57F117C33F0EF8A750B9BFBFB39BFB4678ADE137D69793DADC44B019CC
          4629627578980BAB852D1952CB33A312A714018FF0A1E6B3D47C77A19BCBCBBD
          3F43D752CEC3EDF7525DCD1C2FA7595C32B4D2B34927EF6E2520BB3101828215
          540F3FF8452DE786BC23F04F558B57D6352B8F19DADB5BEB0BACEAB73A8248ED
          A4CF79E7C62791CC2E24B7C6232A856570C8C56331FB4785FC25A6783B4F92D3
          4C8A65596533CD3DDDD4B757171210177CB3CACD248C15510176242A228C2AA8
          18FE06F84BE19F873E4FF625ADE2F916A2CADBEDFA9DD5F7D92DC6DFDCC1F689
          1FC943B23CAC7B437971E41D8B800F07F06CBA8C1FB29F887C5A61F1B697E21F
          F8405EE9759D67C4D35DC77933D8994DCDB462F26F2583A2B8631C4EA1C0503E
          6036358B3F126816EB3E9B61E30F086817975A7693A8C3E25F111D46E6E9AEB5
          5B1815AD645BCB96B7DB6EF7A8CE8F1366789977322B47EA1A3FC09F08687A05
          EE856F0EB1268979A63E8D269B79E20D42E6D96D1D0218E38E59D963F946D0C8
          159464020135D86BFA058789F499F4DD4A0FB45A4DB4950EC8E8CAC191D1D486
          47465575752195955948201001E3FA868BADE95AE78DBC21E17D4358B9B4834C
          D0F545B6BBD627B9BC7596F6F16FE382EAE256923796DAD0471FEF5151C86568
          896928D1F5DFB3EABE04D334FBAF1269FE578C27B0D4747D7F50FB55CDAE743B
          BB95B79275925F3D0E60B81BA697699146E5F2D638FD02CBE12F866CB49D474F
          36B797A9A8797F68BAD4753BABCBC3E5B6F8765CCD234D1F94E4C91EC71E5BB3
          3A6D6258D8D2BE19F877464D37ECF67349369F7CFA9C37577793DC5C3DCB5BBD
          B19659A476799BC991A31E6336142018089B403CDFC21FD9DF0C2E3E31F892F2
          FBC49A969FE15BA758EDAF35DBDD4365A2695637922471DC4EC85CBBCA431C37
          CE57705E2B876F89F75AD7C32F116891789A1F17EAD67AC787EEA7BEF04EB65B
          CC8F51D4E11716515D79C8D1B0956F628D4BA04B67B505F3BC8FA22E7C03A0DE
          7F6979D63BFF00B4753B5D66EBF7D20F32EEDBECFE449C371B7EC96FF28C29F2
          F9077364F11F80741F16EA5A76A1AAD8FDAAEF4FC7D9A4F3A44F2F1736D72385
          600FEFACED9B9CFF00ABC74660403C3DB58D57426D634EB63E24F0DDBC5A9F84
          A44D235FD61EFEFE3FB46B5E4CF2FDA05C5C0F2278E358BCAF38E3C99B31A093
          74BA1E6DE7FC23BFF09CFF006BEB1FF0907FC275FD8DFF00215B9FB17D93FE12
          2FECEF2FEC5E67D9FF00E3D7E4DDE5EEDDFBCCF99F3D7B06ADE01D075CD4AE35
          0BDB1F3AEEE3EC1E6C9E748BBBEC572D736BC06006C99D9B8FBD9C36E18159FF
          00F0A97C33FDBFFDAFF65BCF37ED5F6DFB0FF69DD7F67FDA37F99E77D8BCCFB3
          EFF33F7BBBCBCF9BFBCCEFF9A8039FF1FE8A9E2BF8BDE0FD12F350D62D74C7D0
          B58BC920D2758BBD3BCC9A3B8D3523676B79632DB5669400490379E2BCDF50F1
          0EB3E2DD7BC1B677F6BE2AF132C3178A6D26B6F0B6B23499EE5AC755B6B386EA
          72B756A8CDE586DC14E37CCC56355E17DC3C5FF0DB43F1C6A1A7DF6A63528AFB
          4F8A682DEE74BD5EEF4F916394C6D2216B79632CAC6188E1B23282ABEBDF097C
          33E21FEC5F32D6F34DFEC6B592CB4FFEC3D4EEB4BFB3DBBF95BA15FB2C91FC9F
          B8870A720796B8028031FE31D9B697F0CAC34CB3BED4AD216D6342D35AE20D46
          E12ECC126A7690C80DC87F3B7346CCACFBF71DC727249AE3FC5BA9EA3E0EB8D7
          FC1BA7EABA9369292F861A29EEAFA69EF628B52D5E4B3BB856E9D8CDB4C70B15
          72C648DA67D8EA16258FD635CF02691E24F09C7E1BD452F2E34C8FECE54FF685
          C2DC8682449217FB4AC826DEAF1A36FDFB891924E4D57B6F867E1DB5F0CDDE82
          2CE69AC6EE5171712DCDE4F3DDCB302A5266BA77331953CB8B649BF7C7E547B0
          AF969800F27F14CB79E08D63C4DE17D2757D6174893FE114FF008FCD56E6EEE6
          3FED0D626B3BCF2EE6691E68F7C11A28D8E3CB20BA6C7258F51ABF871BC01E2D
          F8796BA4EB7AF3E9DA9F889E2B8B2D4756B8BE560BA4EA4E7F793B3CA5599212
          636731830A32AAB1666EA2CBE12F866CB49D474F36B797A9A8797F68BAD4753B
          ABCBC3E5B6F8765CCD234D1F94E4C91EC71E5BB33A6D6258D74F82FE144D3E6B
          66B7D4A79A59639BFB4AE35ABD97518D903AA08EF5A63711A85966015245189E
          618C4B26E00F27F1F78E7C55E1EF17DF5C68D35E6A5F61F8871C6FA5234B2B5C
          69E9E175B9B8B5862561B9DB123C51F0A6728CDDCD63F8B7E22EBFE2AD47E20D
          D4136A47C3D2CBE128B43B5D16FA4B4B9BAB3935B9EDA7923904A88AD7463936
          4A9222BC0D6C4B0E71F40695F0CFC3BA3269BF67B39A49B4FBE7D4E1BABBBC9E
          E2E1EE5ADDED8CB2CD23B3CCDE4C8D18F319B0A100C044DB5F56F847E13D62CA
          E2D25D27ECB6F35AD859ECD3AE66B3F2A1B299A7B3588C2E862F2A4766531ED3
          D012400000797F8E60F127863C35F0F3FE10E87C49A36B175E2696E64D135FD6
          8DFDCDF2C3A6DF4A6C649E5B99E3449C5B2282246588C8B26D0EA4567F8AFC48
          9E39F853F1EF5BD3F5ED615344BAB9BAD267B1D4AEEC65B29A1D0AD1FCA2A8E8
          E9B27694BC0E3024DFBD37038F68D2BE1B687A4269A106A57ADA6DF3EA5692EA
          9ABDDDF490CED6EF6E4879E576DBE54B22EC27682C580DDCD1FF000AC7C2E346
          F15E929A3C3069DE2A9679F58B7819A35BB926856199CED236B3A20DC53049CB
          7DE6248071FAEF85E07F1C783BC0E352D7A3F0F368FAB6A4EB16BD7C97724F15
          C58AC65EED66170EAAB7738D8D215F99723E44DB8F7FE21D561FD96FE235EA6A
          778BA86936BE27B4B2BEFB43FDA624B4B8BD86D8F9B9DECE890C63CC625C95DC
          CC58927D43C57E04D23C69F656D452F22B8B5DE21BBD3750B8B0B9456C6F4135
          BC8926C62A859376D631A120945207F00E8327826F3C24D63BB40BCB59ED2E6D
          8CD2179D260DE717977798CF21776690B6F666662C5893401E3FF16A5BCF857A
          078B746D0357D616D2F7C0BE20D6524BFD56E6F2E6CEEED12D923920B89A4695
          370BA395DE5418A364084C864F48F857A1C7A5E9F7D70347F1568534F2AC6D69
          E2AD7DF5490AA0C878C9BBB948D4976070CA495F986029AB16BF097C336DA06B
          BA33DADE5FDA6B96AD65A8C9A96A77579733DBB23A7926E2691A50804926D557
          014C8ECA01662743C29E07D3BC19F6AFECFB9D62E3ED3B37FF006B6B77BA8E36
          E71B3ED32C9B3EF1CEDC678CE703001F3FE87A9EAB0DDC9ACFD9FC616B767C75
          7161FF000925F6BEF3E8C6DCEBCF6DF67163F6B7237427ECC9FE8A023B23EE40
          BE72F61F04ECE6D6FC4BADEABA85878C1AE2DB5DD7122D62F3C45249A4CCA9A9
          5CC11C31D98BC6036478501ADD541889073B49F50FF840741FEC5FEC9FB0FF00
          C4BFFB4FFB67C9F3A4FF008FBFB6FDB7CCCEECFF00C7C7EF36E76FF0E36FCB59
          FA1FC28F0FF86F5F9358D39B58B7B892EAE2F1ADBFB7AF9AC8CD3BBBCCDF6569
          8C1F33C8ED8D980C7200201A00F27B18F51D2FF6696F8A567E22D7A3F184BE0A
          935CB8967D526BAB49AE5F4F69891693B3C112898AC8A2148F6EC0831196463E
          2EDB5C7C2CD3FC4D67E1DD675E821BBF00F88F5376BDD72F2FA48EE6D45A0B79
          6292E257785945CCDFEACAE4952D9289B7D42C7E0AF83AC2666FECC9AF2D7CA9
          208F4CD42FEE6EF4FB78DD1A36482D2691A0857CB778808D142C6EF18C231524
          1F05FC291E9FABD9DC5BEA5AAC3AAD8CDA65CB6AFAD5EDFC82DA5189A28E49E6
          77855C05DDE595DC5109C945C0067FC61F126A7E1AD5FE1CCDA6596A5AAB4FE2
          29209B4CD2E68A292F23FECBBF6D87CD9638D9559124C3B8198C11960A2B87D0
          3C69AF6B1F1160FB5A6B1A1A49F10DAC9B48BFBA8D9E2B71E15330858432C91E
          C32813055623710C406CE3D4346F851E1FD12F6CEEE36D62FAE2CEE85E5B3EAD
          AF5F6A1E4CC219A0DC82E2670B98EE26520707702412AA4687FC203A0FF6D7F6
          B7D87FE261FDA7FDB3E779D27FC7DFD8BEC5E663763FE3DFF77B71B7F8B1BBE6
          A00F99FC29F187C69AA7C20F859A44ED32F8856FBC3B3EB9AB133059F4B9AEAC
          440E9297DED2DC0BA8E372E36486DB52519F2C67D23E09D9CDADF8975BD5750B
          0F1835C5B6BBAE245AC5E788A49349995352B9823863B3178C06C8F0A035BAA8
          31120E7693E916FF000C7C2F69A169DA443A3C31D8E9F169D05B8566F3163B19
          44B668D2E77BAC522EE01988C96CE77366BE87F0A3C3FE1BD7E4D634E6D62DEE
          24BAB8BC6B6FEDEBE6B2334EEEF337D95A6307CCF23B6366031C800806803C3F
          E0EFC40F1249E1EF815A278975ABCB9D6EFEEA3BC5BC9E52AFAD69D268777701
          9B1C49E44CC90B862CFBA086670A678F3B0F6D71F0F7C31F1FF5CD2359D79F51
          F0DC5750E94DAA6B979A8C76AABA359DDA9115CCB2233099DDB73293862B9DA7
          6D7B05A7C31F0BD8A784043A3C2ADE118BC8D0E5666692CA336E6DCA2B925994
          C47690C4825558E59548D05F0868C13C408FA7433C3AFCA66D521B80658EED8D
          BC76E43A3657698A18D0A81820723249201C3E8FA2A780FE2F687A2697A86B13
          699AAE85A9DE5D41AB6B177A9666B7B8B048591AE6590C785BA981085436E1B8
          36D5DBE5F7DA9EABE30F1B787B566B7F18788340F145AEB1AD69DA2F86B5F7D3
          9E2B48CE936F693973776C0A49187B8F2C90C8D7CCA50B2BBD7B441F05FC291E
          9FABD9DC5BEA5AAC3AAD8CDA65CB6AFAD5EDFC82DA5189A28E49E677855C05DD
          E595DC5109C945C6878BFE1B687E38D434FBED4C6A515F69F14D05BDCE97ABDD
          E9F22C7298DA442D6F2C65958C311C36465050070FE23F10DE7C29D5B50D3F4D
          D4FF00B46CAEED60BB926D6AE2E6EC786D1562B517370F962D6ACB1349867473
          2C770ED2796D3CD69C7F88B4DBCD23C11F16F54FF8497C4975ABFC3EB536DA25
          ECBAD5CA7FC7BE896974925CC31BAC374ED3CB23BB4D1BEFDDB5B28028F78F0D
          F84B4CF09A5E8D362991AF658E7B996E2EA5B8926912DE2B7577791998B79504
          4A493925771CB1627974F80FE0A8ADACED21D3AF2DB4FB7B582CCE9D6FAB5E45
          67750C51AC48B736EB288EE7F74891B1995CBA22A31650050078FF00C4AF881E
          24F07AFED057373AD5E45E1D36B3D9E957425318D17514D16CE5895241F327DA
          5AE5B69CAA24B02804C972A0F61E1EB39BC43F1CFC6A2F6C3C61796FA76BB6E9
          6DA959F88A4B7D26CD574BB29C4325A2DE217CC8EC48103AB1986E246EDBE91A
          EFC31F0BF89B46F13E93AAE8F0DFE9DE25944FAADBCECCCB7120862855C73F23
          2A410ED29B4A940C30DCD5797E14787E4F165CF8911B58B5D4EEAEA2BCB8167A
          F5F5BDB4F3471C71AB496D1CCB0BFC90C6A43210C140606803C3F43D4F5586EE
          4D67ECFE30B5BB3E3AB8B0FF008492FB5F79F4636E75E7B6FB38B1FB5B91BA13
          F664FF0045011D91F7205F397A8F0AFC6BB5D5BE394F62BE22D36EA1D52FAF3C
          390F8722BE0F7F632582CAE2E65B6DFF00BB591E2D4434832593FB37E553E663
          D63FE101D07FB17FB27EC3FF0012FF00ED3FED9F27CE93FE3EFEDBF6DF333BB3
          FF001F1FBCDB9DBFC38DBF2D1178074187C27A478652C76E89A4FD8BEC56BE74
          9FBAFB2491C96DF36EDCDB1A18CFCC4E76FCD904E403CBFE1FCB6DE1EF831A2F
          C5AD5F57F125DDFF00FC2329E20D6A11AACD730DE6EB3F3E654B59A43043973B
          D442B16D2AAA0AC6591B97D0BE29DD6AFE08D6F418FC5FA6F88F528F58D04DDE
          B1E18D4CDCC2906ABA94515D5B25C06DF1B249F6E48B6ED68ADDAD086F30161E
          B09F01FC14B73672BE9D793C5637505E58D95C6AD792D9D84D0C8B242D6D6CD2
          98ADF6140AA2245010B4606C6653D07897C03A0F8C2E62B8D5AC7ED5710DACB6
          90CA2692378924920958A146051C496D6EEB22E1D1A3564653CD0072FE03B36F
          0C7C4EF157862D6FB52B9D1ADB47D2F52862D5351B8BF91279E6BF8E5226B877
          93695B6846CDDB41524005989E1F4396F340F0EC9E368357D62E7579BC7571A3
          4F05F6AB73736525A4BE227B0118B692431C5E5C4C851A25460D12024A1911FD
          83C29E04D23C17F6A6D392F25B8BAD826BBD4B50B8BFB9755CEC4335C48F26C5
          2CE55376D5323900176273F43F84BE19F0EEBF26B3656B786EDAEAE2F523B9D4
          EEAE2DA0B89DDDE69A1B792468A17632CB968D14E259141C3B0201E5FE6DE7FC
          23BFF09CFF006BEB1FF0907FC275FD8DFF00215B9FB17D93FE122FECEF2FEC5E
          67D9FF00E3D7E4DDE5EEDDFBCCF99F3D7D015C7FFC2A5F0CFF006FFF006BFD96
          F3CDFB57DB7EC3FDA775FD9FF68DFE679DF62F33ECFBFCCFDEEEF2F3E6FEF33B
          FE6AEC2800A28A2800A28A280120FF00903681FF00606D3BFF0048E1A5A483FE
          40DA07FD81B4EFFD23869680327C59FF0022AEB3FF005E537FE806BA2FD88FFE
          4DD349FF00B0D6BFFF00A79BDAE77C59FF0022AEB3FF005E537FE806BA2FD88F
          FE4DD349FF00B0D6BFFF00A79BDAFCFF008DBFE45D0FF1AFFD2647561FE365FD
          5BFE4B1FC58FFB13FC2BFF00A72D6AB12B6F56FF0092C7F163FEC4FF000AFF00
          E9CB5AAC4AFA0E1FFF00915D0FF09955F8D8965FF22EE91FF6FBFF00A71BAAE2
          3E31E9D75AA784AC21B3B69AEE65F116853B470465D8471EAD69248E40FE1545
          6663D00524F00D76F6F69BB4AB0B73AAFD8A4B7FB40641A67DA437997534CA43
          7DA23FE195411B7A83C9A3FB37FEA61FFCA0FF00F76D7D0191E51F0E3C46DE10
          177E15BCD135E975A9BC45AADCA88349B836820B9D4AE2E2394DE1516DB44132
          C8C3CDDC30502997119F17F08FC13F1269BF0BFE1969F71A7DE0D1341BAF0D6B
          D65A59B6226B6D467BCB317C1C67CD1F67035099BCC1B31A930C28B5523EBFFE
          CDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA00F20F0F35FE85F132
          3D2BC3E9E24874C9B53BD9F57D1F55D35574DB486513CED776B78221E6BCB74D
          0B08FED12955B99018A3F2C887D8293FB37FEA61FF00CA0FFF0076D1FD9BFF00
          530FFE507FFBB680168A4FECDFFA987FF283FF00DDB47F66FF00D4C3FF00941F
          FEEDA005A293FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB680168
          A4FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA005A293FB37FEA
          61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB680168A4FECDFFA987FF283FF
          00DDB47F66FF00D4C3FF00941FFEEDA005A293FB37FEA61FFCA0FF00F76D1FD9
          BFF530FF00E507FF00BB680168A4FECDFF00A987FF00283FFDDB47F66FFD4C3F
          F941FF00EEDA005A293FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507FFB
          B680168A4FECDFFA987FF283FF00DDB47F66FF00D4C3FF00941FFEEDA005A293
          FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB680168A4FECDFF00A9
          87FF00283FFDDB47F66FFD4C3FF941FF00EEDA005A293FB37FEA61FF00CA0FFF
          0076D1FD9BFF00530FFE507FFBB680168A4FECDFFA987FF283FF00DDB47F66FF
          00D4C3FF00941FFEEDA005A293FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E5
          07FF00BB680168A4FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA
          005A293FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB680168A4FEC
          DFFA987FF283FF00DDB47F66FF00D4C3FF00941FFEEDA005A293FB37FEA61FFC
          A0FF00F76D1FD9BFF530FF00E507FF00BB680168A4FECDFF00A987FF00283FFD
          DB47F66FFD4C3FF941FF00EEDA005A293FB37FEA61FF00CA0FFF0076D1FD9BFF
          00530FFE507FFBB680168A4FECDFFA987FF283FF00DDB47F66FF00D4C3FF0094
          1FFEEDA005A293FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB6801
          68A4FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA005A293FB37F
          EA61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB680168A4FECDFFA987FF283
          FF00DDB47F66FF00D4C3FF00941FFEEDA005A293FB37FEA61FFCA0FF00F76D1F
          D9BFF530FF00E507FF00BB680168A4FECDFF00A987FF00283FFDDB47F66FFD4C
          3FF941FF00EEDA005A293FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507F
          FBB680168A4FECDFFA987FF283FF00DDB47F66FF00D4C3FF00941FFEEDA005A2
          93FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB680168A4FECDFF00
          A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA005A293FB37FEA61FF00CA0F
          FF0076D1FD9BFF00530FFE507FFBB680168A4FECDFFA987FF283FF00DDB47F66
          FF00D4C3FF00941FFEEDA005A293FB37FEA61FFCA0FF00F76D1FD9BFF530FF00
          E507FF00BB680083FE40DA07FD81B4EFFD238696A59960862B2B6B69249A1B4B
          2B6B359658C46CFE54291962A19B19299C64F5EB5150064F8B3FE455D67FEBCA
          6FFD00D745FB11FF00C9BA693FF61AD7FF00F4F37B5CEF8B3FE455D67FEBCA6F
          FD00D745FB11FF00C9BA693FF61AD7FF00F4F37B5F9FF1B7FC8BA1FE35FF00A4
          C8EAC3FC6CBFAB7FC963F8B1FF00627F857FF4E5AD56256DEADFF258FE2C7FD8
          9FE15FFD396B55895F41C3FF00F22BA1FE132ABF1B21B6B69EFEEF51FF00898C
          7A7DB59A5B7FCB81B9791E633FFD368C28020F7FBD59BE32B9D66CBC21AE5C78
          72D21BFF0010C3633C9A6DA5C10239EE446C624725970ACFB41F99783D475AD7
          D37AF887FEE19FFB7F506A3631EA9A7DCD9CCD3243711342ED6F3BC120560412
          92210E8D83C329041E410457D0191F37FC39F8ADA9D978435EBCF15F8FF5E9F5
          9D3FC149ADEADE1CD4FC35169FAB69F3AC6E67B8B232410C7344195A30AF1CAA
          1D23CC9862AD9FE1CFDB2574B4F883A9EB9A66A5A9F82FC2FA3F87B50B5D4A0B
          7B71A8CC350B785B1749E724665669837EE9163511C9939D81BD22D7F665D11B
          FB766D63C49E24F136A7AAF865BC22754D5AE606B9B7D39B7965431C281DCB3E
          E324A24725473CB039EFFB20781A4D035ED11AE3583A66BBA169DA26A307DA53
          F7E6C1152D2EF7797959E35451852226C7CD1373401D06AFFB42F87B47D5BE21
          E9D2DA5E7DA3C11FD9DFDA2F34F69690CBF6C50D179535C4F1C7C03F3798C9CF
          0BB8900F3FA17ED77E0FF15DB6851E81A76B1AE6B7AC6A77DA4DBE89642D4CDE
          75A4625B86F3DA716CC82368983A4CC184ABB724305AF17EC7BE1A3A86B9AADE
          F8A3C55AAF88754D634FD7BFB6AF6EADDEE2D2F6CCC9E4491288045B42CCE9E5
          BA3205DA155768C73FE31FD93F53D07468B54F869AFCCBF1221F115EEBF0788B
          C4773105864BD8562BDCC515A34522C8B1A613CB52A4EE0E00D8C019FF00B467
          C66F12697E19F0AF8A743F19EA5F0DB49BDB1B8B89749BEF0FE9A354324454C8
          B245A8DE40ECCA08554B74724E4EE70F1576175FB5B782FC39A7DC307D7BC49A
          368963A45CEB1E284B58523B58EFC2FD9A59A32D148CCEACB23082060A1F1B41
          054686BBFB2BE81AE436E7FE126F155B6A3FF08ECFE16BED55AFE3BBBBD4EC26
          7F32449DEEA297E62E5D8346108DE5461551573EEBF636F05DCE9F71A60D4F5E
          8746D42C748D3F58D352E21F2F578F4D0AB6C6673099236DA8AADE43C4081D01
          24900F78DBBFE5F33C9CF1E6797E66DF7DBB97763D370CFA8EB49FD9BFF530FF
          00E507FF00BB6968A004FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00
          EEDA5A28013FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB6968A00
          4FECDFFA987FF283FF00DDB47F66FF00D4C3FF00941FFEEDA5A28013FB37FEA6
          1FFCA0FF00F76D1FD9BFF530FF00E507FF00BB6968A004FECDFF00A987FF0028
          3FFDDB47F66FFD4C3FF941FF00EEDA5A28013FB37FEA61FF00CA0FFF0076D1FD
          9BFF00530FFE507FFBB6968A004FECDFFA987FF283FF00DDB47F66FF00D4C3FF
          00941FFEEDA5A28013FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB
          6968A004FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA5A28013F
          B37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB6968A004FECDFFA987F
          F283FF00DDB47F66FF00D4C3FF00941FFEEDA5A28013FB37FEA61FFCA0FF00F7
          6D1FD9BFF530FF00E507FF00BB6968A004FECDFF00A987FF00283FFDDB47F66F
          FD4C3FF941FF00EEDA5A28013FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE
          507FFBB6968A004FECDFFA987FF283FF00DDB47F66FF00D4C3FF00941FFEEDA5
          A28013FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB6968A004FECD
          FF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA5A28013FB37FEA61FF00
          CA0FFF0076D1FD9BFF00530FFE507FFBB6968A004FECDFFA987FF283FF00DDB4
          7F66FF00D4C3FF00941FFEEDA5A28013FB37FEA61FFCA0FF00F76D1FD9BFF530
          FF00E507FF00BB6968A004FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF
          00EEDA5A28013FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB6968A
          004FECDFFA987FF283FF00DDB47F66FF00D4C3FF00941FFEEDA5A28013FB37FE
          A61FFCA0FF00F76D1FD9BFF530FF00E507FF00BB6968A004FECDFF00A987FF00
          283FFDDB47F66FFD4C3FF941FF00EEDA5A28013FB37FEA61FF00CA0FFF0076D1
          FD9BFF00530FFE507FFBB6968A004FECDFFA987FF283FF00DDB47F66FF00D4C3
          FF00941FFEEDA5A28013FB37FEA61FFCA0FF00F76D1FD9BFF530FF00E507FF00
          BB6968A004FECDFF00A987FF00283FFDDB47F66FFD4C3FF941FF00EEDA5A2801
          3FB37FEA61FF00CA0FFF0076D1FD9BFF00530FFE507FFBB6968A004FECDFFA98
          7FF283FF00DDB47F66FF00D4C3FF00941FFEEDA5A28013FB37FEA61FFCA0FF00
          F76D1FD9BFF530FF00E507FF00BB6968A00448F65B59C82E3ED49736B0DDA4BE
          47904A4B1AC8A0A6F7DA40700FCC790696920FF903681FF606D3BFF48E1A5A00
          C9F167FC8ABACFFD794DFF00A01AE8BF623FF9374D27FEC35AFF00FE9E6F6B9D
          F167FC8ABACFFD794DFF00A01AE8BF623FF9374D27FEC35AFF00FE9E6F6BF3FE
          36FF0091743FC6BFF4991D587F8D97F56FF92C7F163FEC4FF0AFFE9CB5AAC4AD
          BD5BFE4B1FC58FFB13FC2BFF00A72D6AB12BE8387FFE45743FC26557E36269BD
          7C43FF0070CFFDBFAE3BE33DFDCE97F07BC757B65712D9DE5B6837F341710394
          92275B772ACAC3956040208E4115D8E9BD7C43FF0070CFFDBFAA5AEE8965E26D
          0F51D1F5287ED3A76A16F25A5CC3BD93CC8A452AEBB948232A48C820FA57D4E1
          AA468D7A7526AE934DFA26632574D23CE354D66DFE0C6B93462E755BFF000E8F
          0EEA9AF5D5BDEDF4DA85C46F64D6B9F264B890B8DE970C0A33ECCC6854213217
          82C7E36EB571E1DD56F6E7C1D2E9F7163241BEE2F4DEDA69A90C9BF32C93DC59
          452AAC7E59F30A40EA824899982798D1771A3FC3CD0746B1D46D12D25D422D46
          3F22F1B58BB9B5192E21C3010BC970EEC621BE4C464ED06472065DB3453E11F8
          656C66B7683509A5924497FB427D5EF25BF8CA060823BB694CF1A8124A02A381
          89A518C48FBBDC58ACBA71FF006884A73D3DEEEAF7774A5BDB4BDDEC99972CFA
          320D33C7BAD6B7AFDCDB58F85FFE25DA75CC165A99B9D4112FADA79608672121
          5568A448D2E62DEDE783F2CBB15F6A799C6F877E36DFEBB3688F0786E28FC41E
          23D2B4BBAB3B5975B94D928B84D46E115DBC9FDDB2C36721674898B3BA21F950
          38F405F85BE188B54B5BD874CFB2FD9BC931D95B5C4B0D89689556177B54610B
          BC612308EC8597CA8B047969B70FC55F04F4AD47C213695E1D93FE11AD523D3A
          D34CD3F57469E49B4F8AD84AB0B44566470EA9713AEE0E0B09487F310943546B
          654EF09C1ABF2ABFBD64FED3769B6D5F5B257B2B2D7506AA6E9FF5F71C37C6AF
          16DDE95FD8FAB6A4DE20D3A4D3ADE5BAD6347F0FEA9707C8B55F35247FF46B49
          15D2751218E4B892D997C8468DADDC4E57D034AF8A173A8788AC6193478A1D0B
          52D56F744B1BD5BC2D74D756BF68F37CD83CB0A911FB1DC6D6595D8FEEF28BB9
          B64FABFC14F086B7A58D3EE2C2EE2B536EF6938B3D4EEAD5AF22767675B978A5
          56B8CB492B1331725A695BAC8E5B56CFE1E683A7F889B5A82D255BCF3249D226
          BB99AD619A4CF993456E5CC514AFBE4DD222066F364C93E63EE75B1996D4C346
          9724B9E2A56EDAFC365CDA59EF7BF9DDBB89466A57B9C3FC47F1DEB97177358E
          8D6715BE99A5789B44D3351D49B51786EB7CB77632B2450AC4C2489A2B98D18B
          4A84EE906D200DFABE0AF8C2BE2DF1C5D787DB4DF2E092DE7BED3353B6172D6F
          7B6D14B1A1903CD6F0A36E13C2CA6079D082C7781B0BEE6B3F0C3C3BAF6B91EA
          D776D762E96E60BC68EDF51B982DE69E16468A59608E458A57531C586756388D
          0670AA01E1EF861E1DF0B6B8BAB69B6D7715D476F259C11CBA8DCCD6F6B03B46
          CD14103C8628533145858D54008A000062B2788CB1E13D93A72E74B47D399A57
          6FDE77D5764ACF6BEA3B4F9AF7D0E57425BDD0FE21C63C44DE208351D4751BC8
          6D3505D4165D26FE22269ADED56D7CD6F25E3B68D4B48208897B67FDEBF987CE
          C2F845F17F53D71B4F8EE2C33A3EADA8D85869BE76A0D3DC5923F87E3D41D246
          68F74D865C798EE5DCCCC4ED08037A759FC3CD074FF1136B505A4AB79E6493A4
          4D77335AC33499F3268ADCB98A295F7C9BA4440CDE6C9927CC7DD462F843E14B
          6D262D36DB4E96CADA28EDA388D9DF5C412C46088C314892A481D25F24F94D2A
          B0778C047665000D7EBD81A919AAD06DCA29276D22D37AA5CDD15ACAFDD2E58B
          B0B964AD638EF13FED0EBE1CD224D4D744FB6C16573A90D4EDED9EE66B8B6B6B
          4BB9ADC4C0436B222F982DE665F3DE04CA30F3085765E8EDFC77A8EBB0EAF726
          CE2D17C291497F627C44BA8C62EAC9ED9E58A5B89609A2F29220F049B5B7CA79
          8CB4614BEC2EFE03781EE746FEC88F47974ED31A39E092D34AD42E6C63961964
          925786410489E645BE698AC6D954123850A188259FC1FD3878D75FD635168B52
          D27508C2DAE832C72359DA3BACA2EE6F25E5688CB3F9CC19D6343B59C1DC6595
          9DCEAE4CE9BF6509292E67AABDD5D72A494AD749EF2BAB2D549B0B54BEA79C7C
          30F88B79A2CD77A04761ADEA1E27BCBD863B1B5F126A97FF00658A1952F6E113
          CEBAB38A70AA2D2EC6F304ACDFB9432B05C43E9DFF000B37FE281FEDFF00ECDF
          F4EFED1FEC5FB0F9FF00BAFB77DBBEC18F376E7C9F3F9F3366EF2FE6F2F77C94
          43F05FC2B0FDADCC5AACD7573E4EEBEB8D76FA6BB8BCAF37CBF2AE1E632C3813
          CE0F96CB9595D4E4310773FE109D17FE118FF847FEC5FF0012BFBDB3CD7F37CC
          DFE679DE6EEF33CEF33F79E76EF33CCF9F76FF009AA71D8BCB3115955A74E5AC
          A2DDF76ADEF2F8BABDBAF5E6D6C9C6334ACD9E63E16F883E2E1E30F15682FA46
          9F79E249B559678ECA7D6E6161696B0E9FA5EF58E7FB317DC5EEE37082155CBC
          A4B640DFADE29D66DFE23695F0A2EAD6E755D3F47F12EA2970F1DADF4D6370F0
          3E95797091BBC122B0C3246480D8CA8EA2B722F82FE15B7B79238A2D5639E4B9
          6BA7BF4D76F85F3BB47146C0DD79DE7142B0420C7BF61F2A33B72A08D5D77E1E
          683E21D2749D367B496CECF499165B04D2AEE6D3DAD4AC4F0A88DADDD1954472
          3A6D07186C629D4C6E5FED21528C2516959B4BFBAE29A5CEF6766B54D59DDB6F
          44A33B599C05DFC51BBF87965AD695F65BBF114F65E224D0749597ED134CE8DA
          7457DFBF78629A67D8AD3207589DC848FCC249925ADCD27E2B6A7AA5C785D1FC
          2777A7A6ADE624BFDA1235AC824491919608E58D0C985469F6CBE448D07CF1C7
          232C91C7D1DC7C3CD06E7C3B6BA29B4961B3B590CF04B6F77343751CC776F996
          E11C4A257DF26F937EE7F324DC5B7B66087E16F862DEE34D9E3D336C9618287E
          D12913B2C8D2ABDC0DD8B97595DE5579B7B2CAEF2021D8B1CA589CB270BCA93E
          7D6EFBE8D2765256BBB49AD7AABB1F2CD3DF438EF0FF00C71BFBBF0EE9BA9EB7
          A1E9FA436B5A09D77488E0D525BA5980FB3AAC1362D95D2567BCB744589262C5
          9800582AB9E1CF8DFAA78C264D2749F0C44BE27492E85CDA6A97573636B1A409
          68ECCAF25A09CB117F6D857B7407F7A73854326AF82BE04F877C29E10B0D16EB
          ED7AD4F6FA74160D7D797B72EC9E588CEFB60F2B1B4CC9147201015DAD14441C
          C6845E8BE0BF856DEDE48E28B558E792E5AE9EFD35DBE17CEED1C51B0375E779
          C50AC10831EFD87CA8CEDCA823A6A56C914E7CB4A4F576DED6D6DA39DFD75BBB
          74BD84955D35395D13E24EB5A678AFC5B25FE8B77FD89FF09169B6523DE5F219
          AC5EEECB4E8E3821890BAB6D9E7DD2FCE88048590CCC594747E04F8A173E2EBE
          D1D2EB478B4FB3D7F4A7D6F47961BC33C8F6AA60CFDA50C68219717501DA8D2A
          E7CC1BFE552FB90FC3AF0E5AD8CF656FA5456D6735EDA6A0D6F03347189AD840
          2DCAAA9011505ADB808B85C47C839393C37F0F341F09DF3DDE99692C5298CC11
          2CD7734F1DA4248261B68E4765B788ED4FDDC411711C631845C7256C4E5D569B
          FDD353B249ABDB48A57F89D9F36AF47A744DDCA519A7BE8749451457CF1A8514
          5140051451400514514005145140051451400514514005145140051451400514
          5140051451400514514005145140051451400514514005145140051451400514
          5140051451400514514005145140051451400514514005145140051451400907
          FC81B40FFB0369DFFA470D2D241FF206D03FEC0DA77FE91C34B40193E2CFF915
          759FFAF29BFF004035D17EC47FF26E9A4FFD86B5FF00FD3CDED73BE2CFF91575
          9FFAF29BFF004035D17EC47FF26E9A4FFD86B5FF00FD3CDED7E7FC6DFF0022E8
          7F8D7FE9323AB0FF001B2FEADFF258FE2C7FD89FE15FFD396B55895B7AB7FC96
          3F8B1FF627F857FF004E5AD56257D070FF00FC8AE87F84CAAFC6C4D37AF887FE
          E19FFB7F5C07ED0BFF00240BE25FFD8B3A9FFE92C95DFE9BD7C43FF70CFF00DB
          FA8351D3AD757D3EE6C6FADA1BDB1BA89A09EDAE231247346C0AB23A9C865209
          041E0835F40647CEFF0019FC3DA5781340F1E685E11D32CF43D12E7E1E6BD7BA
          B69BA4DBA436C9701224B399E34016377537AA180532884825C40BB3A89BE17D
          AE99F0DB58B34F0A7827E1E5F6A17D6292DAE8D38165AAC6973114B3B997ECB0
          9DB705A4B62A63906D9CE164DC633E91A3FC3CF0AF87B40BDD0B4AF0CE8FA6E8
          97DBFED5A6D9D84515B5C6F408FE646AA15B7280A720E4000F155F44F859E0BF
          0D69FAA58E91E10D074AB1D522F22FEDACB4C8618EF23C32EC9555409170EE30
          D91866F53401E0FE26D12C354B4F09F856CFE1FF0086C5C69BE3A7B5BCF0A5CD
          EB3E84663A0DCDC830B1B66089E5CD148545B28F3BCC3B72C6563C4BA3DE785A
          DA2F06B0FF008462DEFAEA5F118B0F0768F73AE5AF87DE18E08F4F856186DD59
          51EF227D40398E24792D6788AC81E473F44695E0DD0341D3F4DB1D3343D374EB
          1D32579EC6DAD2D238A3B49183ABBC4AA00462259412B82448FF00DE39D04D3A
          D62D426BE4B6852FA78A3825B958C09248D0BB2233752AA6490807805DB1D4D0
          0787F84E1D03E3D78E2E2FFC57E19D3755863F0A68D771E8DACC11DF2E93792D
          C6A4979081227C92ABC0914BF2AB136EA1802800E1FC61A86B69F0DBF6848FC2
          D63A3EB9E1092D643FDB179E219DAE5A13E1CB0F9E31F67985C7EEF6B0779817
          24E48FBC7E88D77E16782FC530DBC3AD784341D5E1B79679E18EFF004C86758A
          499FCC99D4329C348FF3311CB1E4E4D6C4FE1ED2AEADB55B79B4CB39ADF55DDF
          DA11496E8C97998D623E7023126634443BB3F2A85E800A00F9FF00E25787B4AD
          5FC3DFB417896FB4CB3BDF11F873CFFEC4D62E2DD24BCD2FCBD0ECEE22FB34C4
          178764F2492AEC230EECC30C49AF50F897FF0023A7C26FFB19A7FF00D336A75D
          06B1F0F3C2BE21D7ECB5DD57C33A3EA5ADD8ECFB2EA5796114B736FB1CBA7972
          32965DAC4B0C1182491CD6C5CE9D6B7B35A4D716D0CF359CA67B69258C334121
          468CBA13F75B648EB91CE1D87426803E4FF835A8DD787745FD9BFC29AB5CCD76
          D792AEB3A2DCCD2195E5B33E1FBA6B889D8FDD6827B908AB80A2092DC2976497
          6EC6B7F0F3C2BE14F87FFB4EDC689E19D1F47B882D6FACA196C2C2281E3B76D0
          2CA56854A28210C8C5CA8E0B12D8C9CD7D210787B4AB5B6D2ADE1D32CE1B7D2B
          6FF67C51DBA2A59E2368879200C4788DDD06DC7CAC57A12289FC3DA55D5B6AB6
          F36996735BEABBBFB42292DD192F331AC47CE04624CC68887767E550BD001401
          E0FE3EF8736BA07C1CBFB64F86FE09F0F5F6A5E22D0609749D1A40D65A8C6355
          B40897327D8E33B49791483148155891BB715AE5FC5DE17FEC9D2BC5FE1CFF00
          8443C37A2F9D75E0F97FE111D2E6DDA24FE6EB8F1F9B23FD9A3C3CDE5F9528FB
          3B6238213BA5CEC8FE88D0BE16782FC2D0DC43A2F84341D221B89609E68EC34C
          860596485FCC85D82A8CB46FF3293CA9E460D6C5DF87B4ABFB992E2E74CB3B8B
          893ECFBE596DD19DBC890CB0649193E5C8CCE9FDD6258609CD007CDF7FA27FC2
          34DE27F0FB681A3F846DEEAEBC22973E1BF0DC9E6E9525BDCEB525BCD231F260
          0CF711ABC334661C18A18817903148CF8A7E1187C3D77E31F0BF82859F82ADE5
          FF00842EE2CC69B6118B6B3BD9B5E9E33762D8058DDF10C1BB23E710A2938518
          FA42F7C3DA56A5FDA1F6CD32CEEBFB42D4595E79F6E8FF0069B71BF10C991F3A
          0F365F94E47EF1F8F98E73F45F879E15F0DE92DA5691E19D1F4BD31AE92F4D95
          958450C26E1191926D8AA06F568E321B19051483F28A00F97FE24F8AF5EF1E7F
          C25BAEEA76BFD8DA78F865E2AD3A1D1FCC8E7F26EE0FB02DFBF9CA016C5C33DA
          E08DA7EC3E6212B30AEA3C49F0BEEBC2D169FABA7853C2BE01B15D6343B4974C
          F094E658F5291F5DD359269FFD16DC06844522A655CE2EA5C14E43FD11AA787B
          4AD737FF0068E9967A86FB59AC9BED56E926EB7976F9D09DC0E51F626E5E8DB1
          720E0558BED3AD7548561BCB686EE159639D639E30EA248DD648DC03FC4AEAAC
          A7A82A08E40A00F9DFC3DE1ED2BC3FE1D8FC4FA2E996763E37BFF8877B64751B
          3B745BDBEB76F114E9750C840DD3A2D9ACEE55B7045804A029855D0FF847B4AF
          F8443FE135FECCB3FF0084CBFE161FD8BFE122FB3A7F687D9FFE128FB2793F68
          C799B3ECDFB8DBBB1E57C98DBC57B868FF000F3C2BE1ED7EF75DD2BC33A3E9BA
          DDF6FF00B56A567611457371BDC3BF9922A866DCC031C9392013CD1FF0AF3C2B
          FF000967FC253FF08CE8FF00F093FF00D06BEC117DB7FD5F97FEBB6EFF00B9F2
          75FBBC74A00E828A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A
          28A0028A28A0028A28A0028A28A0028AAFA8EA36BA469F737D7D730D958DAC4D
          3CF7371208E386350599DD8E02A800924F000AF08B9FDB57C1116AE2DE0D23C4
          B79A617453AC47608900538DCFE4C922DCE13272043B8ED3B15B2B9C6A56A546
          DED24A37EEEC7A383CB71B98B92C1509D571577CB172B2EEEC9D97A9EFF45657
          85BC53A578D7C3F65ADE897B1EA1A5DE26F8678C119C12195948055958156460
          19594AB004115AB5B6E79ED38B69AB34145145020A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A280120FF903681FF606D3BFF48E1A5A483FE40DA07F
          D81B4EFF00D23869680327C59FF22AEB3FF5E537FE806BA2FD88FF00E4DD349F
          FB0D6BFF00FA79BDAE77C59FF22AEB3FF5E537FE806BA2FD88FF00E4DD349FFB
          0D6BFF00FA79BDAFCFF8DBFE45D0FF001AFF00D2647561FE365FD5BFE4B1FC58
          FF00B13FC2BFFA72D6AB12B6F56FF92C7F163FEC4FF0AFFE9CB5AAC4AFA0E1FF
          00F915D0FF0009955F8D89A6F5F10FFDC33FF6FEBCE7F681B3FED0F86A6D7EC3
          69A9F9FAD68D17D86FDB6DBDC6ED52D479729D8F846CE18ED6E09F94F4AF46D3
          7AF887FEE19FFB7F54B5BD0B4CF13697369BAC69D69AAE9D3EDF36CEFA059A19
          30C197723020E1802323A806BEB3075D61B134ABCB68C93FB9DFCBF33092E68B
          4798DC68973E0D3F0D74FD1B49D13C112DFF0089A43A8E9DA1297B299069F7AC
          CA76A41E633243190CC985754387118079BBCF8E7E2D37B0C7656568BA76BFF6
          7B9F0F6AF7DA70485AD65D46C6D43B4497AF24D98AFD1C6F16CC0A0CA7CC447D
          9E9BAFFC34F0C6B375E0AD3F48B6D245BEA56EB7115B787E5874D8EFD9619600
          F70B08B6131DD6C532FB8BB44A3E62A2B0FC49A4FC27D7BC53ABF86DBC2EE75A
          9B52B48F56BBD2BC253CA92CDE75BDE886EAED2D9A22921F21A40EF8DAF962BD
          47BF4330C14AAA78A8732EED5DDB99CAFAC9BEA959B95D46CFE2D327095BDD64
          DA87C4CF16A3DFF86B4F8ED354F19E9FA8BC0E6C74B0F0DD5AA5B5ACF24CB0CD
          7D088B635FDB4641B876272C170C7CBDC6F88FA9EBFE0BF87BA868F05A697A8F
          8CFC8F29EF91AEE1B1DF632DE36E45688CBF2C0631864E5C37F0ED34AE350F85
          778B6BE099FC3F613E8D6B7C60B7864F0DC8DA2C3765D90A25C183ECAB2F9AEF
          1603EEF359A3FF00584AD75DA5597853C79F0FB4A8ED74DD3F54F076A1636F35
          9D94D64BF657B62AAF062075015400842951B7038045724F1782928254B54F57
          65D9ABDAF67ADA5C8F45671BF2BD29465DCF17F09FC41F12F85FC23E2EFB3C9A
          54BFF08A7F6BEBFAA79B652FFC4CF76ADAAEE8A0C4DFE8BFF1E6F866F3F1E72F
          0761DFE81E3BF09E87E31F8C3E0FB2D7F46D3F5CB38F41D6264B7D4AD52E2357
          171A680C15C101B0CC33D704FAD437BA87C2BD27C23E05D70787EC27D1EE2449
          BC30BA7786E4BA96379A36BB0D6F0430349131489A5242A91B3270455FF106A3
          F0E3C79E10BEF13788F4AB0D5B49F0F457135D7F6F68AC6E34E548D65943DBCF
          179D1318C23ED280B298D8021949E8AB99E1E58BFAC524E17F697692BFBE9A5B
          357D5B96EAD7E55A244A83E5B3F238BB6F88BE31B4D0BC37A4F86ECA5D76F350
          9359B9B6BE9A28EF59B4DB5BE10DAB0F36EEDBCD59219EDD84E6666600311279
          85D67D77E387882C7C3DA8EB9143E1F8208FC3B26A1059FDA8DE0378BA79BC31
          7DA627D8EEA0A7EE36AF990B79F1CCC15E34EF3E27DFF8316C6C6C3C61A4C7E2
          18E691A7B6D2C68B2EAF292836B4CB6F14523854F3029936ED532AA920BA8347
          C411F81BE206911B4C625B9F1859DD78620D4A1B4D97FB0C33C935A9668CB42C
          8219CB47281B248CAB2EFF00969D3CC3013945D6A0B5726FBEB2BEF7D6CACB65
          6B69F13B0E125B331F58F889E29F0EDF6A7E18B89B4FD5BC56D1D94DA54DA6E9
          2C91DC99CDDB3426DE5BC51B922B0B8937B5CA021800BB942C943C33F16FC53E
          2DB6BD744D13C392E8164D75ABAEB68DE5CE52F2FAD5D7CC8E62B66A3FB3E466
          726E4289863788F326BEADA87C2BF075A6A3E10B8F0FD85BE8A6449B53B5B3F0
          DC936956EE42386BC92281ADE16541148C66652A9E5BB614AB56C789742F87DE
          09D2B439B50F0D6951C1A65C91A35AD9E8A2E6786763E6B7D9208636937FEEDA
          56F2972046CE7842447D7B01C8E3ECBDEBAD79576B3D2F6B4BF96CF95B724EF6
          43E59DF73CD34FF895AE7C2EF096A7AC4F67A7DFE84DAF78A23B7B18D9D2E9DE
          09B53BD32BCC72AAA7ECAF0F942362372C9E675887AAF8435ED70F8AB5AF0DEB
          F71A7EA179636567A8A5F69B68F691B25C3DCC623313CB29DCA6D58EFDF82240
          368DB96CB1F12BC056FA7D8DCC36D3BCC97B71343A6DAF87EEE4D46DAE482D3C
          CD64901B88495BA05A468D722ED09389D77E8780F51F03699169FA5784AD34FD
          263D5A2BAD461B1D3B4FFB206F21E186E4C88117CB96379228DD240B2060548C
          A305C3178EC3626336A95A72BEBA7F35D3F2B2D1DBE2BDDFC28718CA36D4EDA8
          ACFD335FB0D62F756B4B39FCEB8D2AE96CEF13632F95318629C2E4801BF773C4
          D9191F36339040E3F42F8EDE10F11595ADED9CDAC269F77F65FB35F5E787F50B
          5B69FED33450C1E5CB2C0A8FBDE7880C13C316FBAAC47806A7A05159F3EBF616
          FAFD968924FB753BCB59EF2083631DF0C2F0A4ADBB18186B884609C9DDC03838
          CFB1F1F683A969BE16D42DAFBCCB4F13ECFEC893C9907DA77DB4972BC15CA661
          8A46F9F6FDDC7520100E828AE5FC4DF133C3BE107D49353BC9926D3E2B29AE21
          B7B39EE240B7770F6F6C112246691A4963740A809047200209D0F0BF8AACBC5F
          A7C9796306A504292984AEA9A5DCE9F216001C88EE238DCAE187CC0609C8CE41
          C006C515C7F81BE2D7867E23793FD897578DE7DA8BDB6FB7E997563F6BB73B7F
          7D07DA234F3906F8F2D1EE0BE6479237AE4D03E2D7867C4DAB41A7D85D5E17BA
          DDF63BAB8D32EADECEFB0A5FFD1AE648D61B8CA2B48BE53B6E45675CAA96001D
          8515E7EFF1E3C1515B5E5DCDA8DE5B69F6F6B3DE0D46E349BC8ACEEA18A3695D
          ADAE1A211DCFEE91E4510B397446750CA09AE83C51E3ED07C19E77F6CDF7D8FC
          9D32F3597FDCC8F8B4B5F2FED127CAA7EEF9D1FCBF78EEF941C1C007414567EA
          7AFD868F7BA4DA5E4FE4DC6AB74D67669B19BCD98432CE572010BFBB8256C9C0
          F9719C900F1FA3FC76F086B9A05EEBB6F36B11E8967A63EB326A579E1FD42DAD
          9AD1103992392581564F94EE0A859986480403401E814573F3F8FB418BEC5E5D
          F7DBBEDDA64FACDA7F674325DFDAAD21F277C91794ADE67FC7C43B5572CFBC6D
          0DCD57F02FC49D0FE23C3793686752786D25682592FF0048BBB15F315DE37453
          71126F6478DD582E4A1186C122803A8A2B9FB1F1F683A969BE16D42DAFBCCB4F
          13ECFEC893C9907DA77DB4972BC15CA6618A46F9F6FDDC75201E82800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2803CFF00E2B585B6B5AAF80748D42DE2BFD2751D7A486F6C2E
          504905D22E9B7D2AAC91B655D449146E03020346ADD541ACAF10EA117806DE2F
          0CFC35B2B41AC49732DC49A2D8DA47730DB4491C3E76D85EF2D62B7E6E2D5CAA
          B82C672E2362EEE3D1F5BD0B4CF13697369BAC69D69AAE9D3EDF36CEFA059A19
          30C197723020E1802323A806B26E3E1AF846F3C3B6BA04FE15D127D0AD64335B
          E97269D0B5AC2E7712C9115DAADF3BF2067E66F535EE61F1B4A10A70A97B46F7
          8EF17AB6A4D5D5DEA95B4BA5F12D8C9C5BBD8F31F0AFC6EF12F8A34F5F127F67
          E9567E1D1A8E8B65F62CCB2DDC9FDA36FA7B63CDCAA2792F7DBB76C6F3546DDB
          115DED87E23F8A5AD789EEB4BB0BBB0DDE1DD6751D2B58D0F53FB2A5B79B6B1E
          B7A6AA702EA67937A5D44DB9D2DD976FFAB25888FDE2D3C27A1D858FD8ADB46D
          3EDECFCC826FB3C56A8B1EF8446216DA063746218429EAA224C6368C51B7F86B
          E11B3D5AEB5483C2BA241A9DD4826B8BD8F4E856699C4AB306770B966F35124C
          939DCAADD4035E852CCB2FA753DA4685ACD5BD15BADEF7E64DDF5BA7CAD5AD69
          709B56B9E49FB6ADCDFC5F0B74882DC4874CB9D7AD53532B1EE410AA4B243BDB
          1F20FB5476A01C8CB154C9DFB4FC915FA43E29F0B695E35F0FDEE89ADD947A86
          97789B268242467041565604156560195D4865650CA4100D7CDD73FB10CFFDAE
          05AF8FE65D0F7A663BAD26392FF671BC09D6448837DEDADE410BF2E55F0777E4
          F9CE575F1D563528B5A2B59FE67F45786DC799570B606BE0F31849394B9D4A29
          3BE8972BD53D2D75D357AAEA7EC43737FF006AF1FDA8127F61ACB63711B797FB
          BFB6BC72ACE03E396F262B2CA67E5051B037E5BAEF0E69D7536A1E1DF85D25B4
          C2C7C2DAC497D721A322DCE916C7CDD1E3497EF965924B150CD8F31B4CBE52F2
          796DE67A8FC3AF875A2FC2FF000C43A26890B2C2AC659EE6621A7BB98801A695
          801B9CED038002855550AAAAA37D34EB58B509AF92DA14BE9E28E096E5630249
          2342EC88CDD4AA9924201E0176C7535F4384A2F0F4214A4EEE2923F1CE20CCA9
          E719B62730A30E48D59CA497937D6DD5EEFCEE7CDFA47ED01F11B57F0FE99A9C
          BA0E9BA243E258B4DB9D1A7D462859608EEB50B1B723CA8B5079AF1563BE0C65
          296A14A26E40660A9A1AA7C72F1A6936BAE6A6E7419EC6CA2F12EAB15AAE9F32
          486CF46BEFB33DB349F6820CB3878D84E102C451B314BBC6CF68B2F879E15D36
          E751B8B4F0CE8F6B71A95D477B7D2C361123DD5C47279B1CD290B97759097566
          C90DF3039E6AC4DE0DD02E219619743D3658668AEA09237B48CABC772E24BA42
          31CACCE03480F0E402D935D67CF9F37FC56F8B7E31F10F81FE24DBDC787A1B6F
          075D58F89344B6BA95ADA26125A5BDEA1912537865B8676B47FDC8B48CA8766F
          319612D26869BF1535FF00847E0CD5B5BB8B1D3751F0F3788BC5B1DB69F13C89
          76F25BCFAB5F999E7394456368F0F942362372CBE6F5887BC4FF000F3C2B75AB
          6ABAACDE19D1E6D4F55B56B2D42F64B089A6BCB72AAA6199CAE6442A880AB123
          0A063815A11787B4A87ECDE5E99671FD9AEA5BD836DBA0F2AE25F33CD9978F95
          DFCE9B730E4F9AF92771C8072FE0AF116BE7C5FAEF85BC4773A6EA57DA7D8D96
          A69A86976525946D1DCC9751888C2F34C7729B466DFBF0C25036AECCB77158FE
          17F06E81E07D3E4B1F0E687A6F87EC6494CEF6DA5DA476D1B484052E55000588
          5519EB851E95B140051451400514514005145140051451400907FC81B40FFB03
          69DFFA470D2D241FF206D03FEC0DA77FE91C34B40193E2CFF915759FFAF29BFF
          004035D17EC47FF26E9A4FFD86B5FF00FD3CDED73BE2CFF915759FFAF29BFF00
          4035D17EC47FF26E9A4FFD86B5FF00FD3CDED7E7FC6DFF0022E87F8D7FE9323A
          B0FF001B2FEADFF258FE2C7FD89FE15FFD396B55895B7AB7FC963F8B1FF627F8
          57FF004E5AD56257D070FF00FC8AE87F84CAAFC6C4D37AF887FEE19FFB7F4B49
          A6F5F10FFDC33FF6FE96BE80C8F9FF00C5315E6A8BF1BFC116FA46B0DAC78BAE
          9EDF4CB83A55C8B029368B656C677BCF2FC8548DD252C37EFF00DD32AA3B9546
          D0F0F5E4DE1EF8E7E3537B7FE30B3B7D475DB77B6D36CFC3B25C69378ADA5D94
          02692ED6CDCA624460489D154C23700376EF70A2803C9FE1C788DBC202EFC2B7
          9A26BD2EB53788B55B9510693706D04173A95C5C4729BC2A2DB68826591879BB
          860A0532E233E7FA16B57DE23FD9EFC15F0D34DF0EEBC3C4375A3E9DA46A76FA
          D685A869D609047021BE867BC7B6DB1AC914535BAC91EF60F34657FBEBF4C514
          01F37BF847C6573E27D1341BAB6BCF0B797E3097C4106A1E1A2350B6D3EDEEF4
          CD4BCE5173736A159DAF04EEE24888417D02A9E502D89FC37E2E1E20D43C3D65
          A5CDE2065F15C7AE5D6ABE2066B0835886D74FD3DA1325C416EC892ADD3DBF96
          218511D34D955F2C25327D1145007CEFE0C5D5FE1D6B3E167F11683A941A7785
          EC758F0E2B68B6175AA431C734DA75CE9F141E543E74D1476B1981AE1A203CCB
          69039DCCA5CF1A691E34F8C3ACEB3AA681E1986C61B3B18F4FD0EE7C5B733699
          3D95E09A3BE17F14096F379F133C7A636C98A32BD9C91BC684CAA7E88A2803E6
          FF00116A579ABF823E2DE97FF08D7892D757F8836A6E744B29745B97FF008F8D
          12D2D523B99A34686D5D678A44759A44D9B773610863EA1F15D26B3D47C09AE0
          B3BCBBD3F43D75EF2FFEC16B25DCD1C2FA75EDBAB2C312B4927EF6E220422B10
          18B1015588F40A2803C7F54F18A4BE3FF0CF8D5F42F1245E1CB6D3355D27CEFE
          C2BB92E5E69A5D3A48DBEC691B5CA21FB35C2EF9224198BFBB244D279FB7C3FF
          00125CEB1E0FF10E9BA2DE7F6C68DFF096F88B4A49E230F98D73AC5BCF0DAC86
          4C2C0F75672CF16261BA2F35D8A078485FA828A00F27FD9FFC0775F0F0F8FF00
          4FBB335C4D71E225BE935296DCC0BA94F2E9B62D7574899202C973F683B50954
          3B9170170387F82DAB4DA2FC14D33C3BA858F8C3C5BA99D0B4ED365F0D7893C3
          325958DAB32C56B241E71B18C340AD30F30B34EC2289DC07DADBBE90A2803E77
          F16F843C4BA1E9F2F81A2D3A6F17DFF8C6286DA6F114C2E16DC595B84FB5D85F
          5C379EF6D149099E3B7914BB96B972D99849733E3F88BE1CF8ABC4DA8E97E17D
          4B4AFEC378BC60FE27D3AFF4AF3752B0D25E6D3B5192394CCF1C26578F528DAE
          1E375083ED504792AE107D4145007C9FAEF813C4964DE37D7B51D3B58B2D6FC4
          1FF0886B1A8CFA4D91BD9AD668B5A9DE486154491277B2B44B68C948D8388564
          6426439FA23E1C6AF1EAFE19429A86BDAAB5BCAF0C97BE23D21F4DBB99B3BB26
          26B7B7054070A192300EDC64B0635D451401F3FF00C228AF3C4BE11F827A545A
          46B1A6DC7832D6DAE3586D674AB9D3D2375D267B3F22333C68667325C6731864
          0B1396752D1890F87915E5CE8FF047C2FF00D91AC5B6AFE0CF27FB6FED9A55CD
          BDB41E568F7566FE5DCC91AC33FEFE68D4792EFB812EB940587D0145007CEF63
          26A3AA7ECD2DF0B6CFC3BAF49E308BC1526877114FA5CD6B690DCA69ED0902EE
          754825533058D4C2F26EDE1C6630CEA7C5DB9B8F8A7A7F89AF3C3BA36BD3C369
          E01F11E98EB7BA1DE58C925CDD0B436F1451DC448F3330B69BFD586C10A1B05D
          377D1145007CEF63F09359D07E26FC39B8B8866BBD1BC27AC5C691A098A2056D
          34A934CBE7323B2B121416B1B2CCD9626C164DD9B96079FF0006C5A8CFFB29F8
          87C2466F1B6A9E21FF008405ED5746D67C3335A47673258988DB5B482CE1F398
          BBAA05324AEC101527E627EA8A2803C5FC33E10D67C25F1DF46D362D3A697C17
          A7F877577D3754006CB66B9BEB17FECE20708B0884F958083C9291AA9303BB67
          DE683AFDDFC1CBFF000ADA68D34B7DE21F15EB36B3417AB25BDBB5849AADEDC4
          E279551DE18AE2D51E2499518EEB984AE37061EF145007CDEEDE21F05F89F441
          E20F0DDE43A7D878C25F102AF86AD6EF59B6B5B7BDD335249144896EB2C8FF00
          6D334AE3CBC462F6000EDC05FA0340D72DBC49A4C1A8DA47790DBCDBB6A5FD94
          D6730C3153BA1991245E41C6E519182320835A14500145145001451450014514
          5001451450014514500145145001451450014514500145145001451450014514
          5001451450014514500145145001451450014514500145145001451450014514
          500145145001451450014514500241FF00206D03FEC0DA77FE91C34B4907FC81
          B40FFB0369DFFA470D2D0064F8B3FE455D67FEBCA6FF00D00D745FB11FFC9BA6
          93FF0061AD7FFF004F37B5CEF8B3FE455D67FEBCA6FF00D00D745FB11FFC9BA6
          93FF0061AD7FFF004F37B5F9FF001B7FC8BA1FE35FFA4C8EAC3FC6CBFAB7FC96
          3F8B1FF627F857FF004E5AD56256DEADFF00258FE2C7FD89FE15FF00D396B558
          95F41C3FFF0022BA1FE132ABF1B134DEBE21FF00B867FEDFD2D269BD7C43FF00
          70CFFDBFA5AFA0320A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280
          0A28A2800A28A2800A28A2800A28A2800A28A2800A28A280120FF903681FF606
          D3BFF48E1A5A483FE40DA07FD81B4EFF00D23869680327C59FF22AEB3FF5E537
          FE806BA2FD88FF00E4DD349FFB0D6BFF00FA79BDAE77C59FF22AEB3FF5E537FE
          806BA2FD88FF00E4DD349FFB0D6BFF00FA79BDAFCFF8DBFE45D0FF001AFF00D2
          647561FE365FD5BFE4B1FC58FF00B13FC2BFFA72D6AB12B6F56FF92C7F163FEC
          4FF0AFFE9CB5AAC4AFA0E1FF00F915D0FF0009955F8D89A6F5F10FFDC33FF6FE
          96934DEBE21FFB867FEDFD2D7D01905145140051451400514514005145140051
          4514005145140051451400514514005145140051451400514514005145140051
          4514005145140051451400514514005145140051451400514514005145140051
          4514005145140051451400514514005145140051451400514514005145140051
          4514005145140051451400514514005145140051451400514514005145140090
          7FC81B40FF00B0369DFF00A470D2D241FF00206D03FEC0DA77FE91C34B40193E
          2CFF00915759FF00AF29BFF4035D17EC47FF0026E9A4FF00D86B5FFF00D3CDED
          73BE2CFF00915759FF00AF29BFF4035D17EC47FF0026E9A4FF00D86B5FFF00D3
          CDED7E7FC6DFF22E87F8D7FE9323AB0FF1B2FEADFF00258FE2C7FD89FE15FF00
          D396B55895B7AB7FC963F8B1FF00627F857FF4E5AD56257D070FFF00C8AE87F8
          4CAAFC6C4D37AF887FEE19FF00B7F4B49A6F5F10FF00DC33FF006FE96BE80C82
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A002
          8A28A0028A28A0028A28A0028A28A00483FE40DA07FD81B4EFFD238696920FF9
          03681FF606D3BFF48E1A5A00C9F167FC8ABACFFD794DFF00A01AE8BF623FF937
          4D27FEC35AFF00FE9E6F6B9DF167FC8ABACFFD794DFF00A01AE8BF623FF9374D
          27FEC35AFF00FE9E6F6BF3FE36FF0091743FC6BFF4991D587F8D97F56FF92C7F
          163FEC4FF0AFFE9CB5AAC4ADBD5BFE4B1FC58FFB13FC2BFF00A72D6AB12BE838
          7FFE45743FC26557E36269BD7C43FF0070CFFDBFA5A4B483FE42AAD79F62FB57
          D8CA482D3ED3FEABED3B815F363C67CF4C1DC7EE9E3A1A3FB37FEA61FF00CA0F
          FF0076D7D0190B4527F66FFD4C3FF941FF00EEDA3FB37FEA61FF00CA0FFF0076
          D002D149FD9BFF00530FFE507FFBB68FECDFFA987FF283FF00DDB400B4527F66
          FF00D4C3FF00941FFEEDA3FB37FEA61FFCA0FF00F76D002D149FD9BFF530FF00
          E507FF00BB68FECDFF00A987FF00283FFDDB400B4527F66FFD4C3FF941FF00EE
          DA3FB37FEA61FF00CA0FFF0076D002D149FD9BFF00530FFE507FFBB68FECDFFA
          987FF283FF00DDB400B4527F66FF00D4C3FF00941FFEEDA3FB37FEA61FFCA0FF
          00F76D002D149FD9BFF530FF00E507FF00BB68FECDFF00A987FF00283FFDDB40
          0B4527F66FFD4C3FF941FF00EEDA3FB37FEA61FF00CA0FFF0076D002D149FD9B
          FF00530FFE507FFBB68FECDFFA987FF283FF00DDB400B4527F66FF00D4C3FF00
          941FFEEDA3FB37FEA61FFCA0FF00F76D002D149FD9BFF530FF00E507FF00BB68
          FECDFF00A987FF00283FFDDB400B4527F66FFD4C3FF941FF00EEDA3FB37FEA61
          FF00CA0FFF0076D002D149FD9BFF00530FFE507FFBB68FECDFFA987FF283FF00
          DDB400B4527F66FF00D4C3FF00941FFEEDA3FB37FEA61FFCA0FF00F76D002D14
          9FD9BFF530FF00E507FF00BB68FECDFF00A987FF00283FFDDB400B4527F66FFD
          4C3FF941FF00EEDA3FB37FEA61FF00CA0FFF0076D002D149FD9BFF00530FFE50
          7FFBB68FECDFFA987FF283FF00DDB400B4527F66FF00D4C3FF00941FFEEDA3FB
          37FEA61FFCA0FF00F76D002D149FD9BFF530FF00E507FF00BB68FECDFF00A987
          FF00283FFDDB400B4527F66FFD4C3FF941FF00EEDA3FB37FEA61FF00CA0FFF00
          76D002D149FD9BFF00530FFE507FFBB68FECDFFA987FF283FF00DDB400B4527F
          66FF00D4C3FF00941FFEEDA3FB37FEA61FFCA0FF00F76D002D149FD9BFF530FF
          00E507FF00BB68FECDFF00A987FF00283FFDDB400B4527F66FFD4C3FF941FF00
          EEDA3FB37FEA61FF00CA0FFF0076D002D149FD9BFF00530FFE507FFBB68FECDF
          FA987FF283FF00DDB400B4527F66FF00D4C3FF00941FFEEDA3FB37FEA61FFCA0
          FF00F76D002D149FD9BFF530FF00E507FF00BB68FECDFF00A987FF00283FFDDB
          400B4527F66FFD4C3FF941FF00EEDA3FB37FEA61FF00CA0FFF0076D002D149FD
          9BFF00530FFE507FFBB68FECDFFA987FF283FF00DDB400B4527F66FF00D4C3FF
          00941FFEEDA3FB37FEA61FFCA0FF00F76D002D149FD9BFF530FF00E507FF00BB
          68FECDFF00A987FF00283FFDDB400B4527F66FFD4C3FF941FF00EEDA3FB37FEA
          61FF00CA0FFF0076D002D149FD9BFF00530FFE507FFBB68FECDFFA987FF283FF
          00DDB400B4527F66FF00D4C3FF00941FFEEDA3FB37FEA61FFCA0FF00F76D002D
          149FD9BFF530FF00E507FF00BB68FECDFF00A987FF00283FFDDB40041FF206D0
          3FEC0DA77FE91C34B52CCB0431595B5B4924D0DA595B59ACB2C62367F2A148CB
          150CD8C94CE327AF5A8A80327C59FF0022AEB3FF005E537FE806BA2FD88FFE4D
          D349FF00B0D6BFFF00A79BDAE77C59FF0022AEB3FF005E537FE806BA2FD88FFE
          4DD349FF00B0D6BFFF00A79BDAFCFF008DBFE45D0FF1AFFD2647561FE365FD5B
          FE4B1FC58FFB13FC2BFF00A72D6AB12B6F56FF0092C7F163FEC4FF000AFF00E9
          CB5AAC4AFA0E1FFF00915D0FF09955F8D9C37C68D7EF7C33E0196F6C2FAEF4D9
          CEA3A6DB35D585AADCDC4714D7D0432F95118E40EFE5C8E146C63923009C51E0
          9F12450DC697A44DAB78835DBAD5ADEF352B7BAD7B4E8ECA68A2B792DE178DA2
          1040CBF34EACBBA3C9058EEC6DCF47E25F0DDB78AB4E86CAEDE58E28AF6D2F94
          C2406DF6F711DC460E41F94BC4A0F7C13820F228F8A7C0F6DE29BEB0BD37FA86
          97796B1CB6DF68D36611492DB4A63334058A928AE6188EF8F64AA506C913273F
          7142B619E1A342AAB3E6936ECB6E55CBD39BE257D1DAD7D35399A95EE8E57C37
          FB40687E285B69ED749D6E2D3E492C219B509ED9160B67BD82DE5B55622425D9
          CDD4519118728DCBEC42AED3FF00C2DCB4D5748B2BF5D33C41A5E977D73A7B69
          BAA2C16EF16A10DC5DC1146CA77BF968FE7C5B96658A5F2DDCA2EF46D93F87FE
          0A687E1CF0A8D02DAEB507B317BA5DF6F9644326FB04B348464201B48B187771
          9259F057236965F06EC2D34EB4D35B5DD6EE749D3E4B36D374F9268961B08EDA
          E219E2890246A645CDBC49BE6324815582BA9772DDF29651CF7826926B7BB7CB
          A5DF6BDEEACF4E55FCDAB9FDE7528CBFB406876BA75BEA175A4EB76F617D1C17
          3A5CCB6C93B6A76D2DC5BC0278628A4790286BBB662922A4A44A36C6CC19441E
          36F8CD6DA6781EF6F0ADDF873518B514D26EA1BC9F4E8AE2C6568967386B8BA4
          B6773032B21592500C8A591F64882F5AFC0CD1E04D3E19754D56EED74AFB347A
          45BCCF085D36DE0B9B7B95B78CAC4ACE85ACED94B4C647DB1F0E0B3335ED43E1
          3DA5C6BF7FAEE9FADEABA1EB77972F3BDF58FD9DD911E0B5864855268644D8C2
          CAD9892A5C321C30562A6A13CA61522D2D9B7ADEDA5B9575766AFCFA3F7BE15C
          BA35FBCB1872FC7EF0D5C88F5259B55B5D02DAE573AAA5BC46DAED1B48975239
          4399C225BEC738447DE6351B87982BB1F0B78D17C477D7FA7DCE91A8681AB594
          715C4BA7EA460693C994C8B14A1A09648CAB34332E376E06339500A96E56C3F6
          79F0B59F872DF42964D42FB4C8A45778679D41980D27FB28A3322A90A6DF93B4
          83BCE4103E5AEABC2DE0B5F0E5F5FEA173ABEA1AFEAD7B1C56F2EA1A908164F2
          62323451058228E30AAD34CD9DBB8990E5880A179F18F2C74DAC2DEE92DEFBDF
          EEDAFCD7EBCBCBA5CA8F3DFDE3C8FE0F7C43D6B5C8BE1EDC5C7893C41ACDD6BB
          6F1B6A96DAEE8A961651EEB292766B3985AC026712A20555925CC4D23ED214C8
          9D2685FB4FF82FC470EAD2D84B2DC2D95936A318867B599AE6DD5D10C8447331
          B650658B3F6BF236872CFB56394C7D8E99F0E34CD2B47F04E9B0CF76D07847CB
          FB0B3BA9693659CB683CDC2E0FEEE663F285F9803D320D1D23E14C5A269674EB
          6F12F8812C6DEDD2D34B812EA38D74A89190C6B1048D7CDDBE5C43373E712A85
          5B72C92893B2BE272AC4549CDD3B2D2C95A3F6A57F86367A72F45657D5C92254
          6A256B94751F8DB69A5DC5D25C7867C411C1A769C9AA6AF72F15BA2E9703493A
          31955A60F26D36B39CC0B286550D1970CB935CF8E7A3F87EDF53BDBBD2F55FEC
          7B3FB74716A8890986F2E2CE39A4B8B7893CDF343A8B5B91BA44442613872190
          B6527C045FED6BCB5FEDED42DFC2971A0D9E8B3E9D0341BAFD125BC69A39B740
          7CA88A5C8545B6688202CA823548C0D5D73E0668FE20B7D4ECAEF54D57FB1EF3
          EDD245A5A3C221B3B8BC8E68EE2E227F2BCD2EC2EAE4ED91DD0198E100540B2E
          393C6693775E5CDB597FE4DCDFF6EF2DEFEF583F784F3FC64B0821B957D0B5B4
          D4124B55834D9A18A19AE63B97912DA50649163856468A55093BC526E508503B
          C6AF47C4DF18B4BD1BC7BE10D26E6FE5D36DB548E39962945B4535C3DC318ADA
          37825945DA2EF27704B7C86285A4458E653B9E2AF85F61E2ABED5AF1F51D42C6
          E752B2B7B098DB344D1F9311B9F95A296378E5575BC995965575C6C21559430A
          37DF06EC2EAFA392DF5DD6EC6C0DED8EA375A724D14F1DEDC5A183C99259678E
          49CB62D6DD5B6CABB84793F333B36146595DD3926AE9DF776BA49DB47B6AE3A6
          EB5B2B34DF3905FF00C79F0D699A05BEAD72B770C0FA70BFB88E4112358B99E3
          B74B6BA25C2C1334EEF10123040D6F71B9D444C451F04FC65B4F893E38D162D0
          EEB1A5B69DAA7DBAD3CCB79F65D432E9C63FDF42F246D88EED8FEEE465FDE61B
          E752ABD1DC7C29D0E687C40A825B69757BD875033C0115ED6685D2588C3F2E36
          ADC2B5C6C70EAD2CD33306123033E89F0FA2D2B5CB2D66E759D575AD56DADEEA
          D8DCEA12C67CC59DAD99B291A2226D16910023545E5D9833BB314AA6571A72E5
          8BE6F7AD77DE3A696B6926D5EF7D22D750B4EE6578E6F357D53C7FE1CF0A69DA
          EDE786EDEF74CD47549AFF004D86DDEE4B5BCB651A463ED114B18422EDD9BE4D
          D944C301B8363C76BE2BD73C717DE1397C75A9698BA268F657DFDA3A4D8D924F
          7CD73717B18FB409E099372C76917312C40BBCADB429448FB0F17F8117C51A86
          9FA9DAEB5A9787359B18A6B68752D2C5BBC9E44C636962297114B195668216CE
          CDC0C630C0160D8F37C2378EE62BDD33C65E24D1F576B54B5BED4E17B4B89B50
          54925950CA2E6DE544DAF7170556158D4097685D891AA7CE1B1E7F0FC4DF126B
          BA0783BC45AAEB779E0DD3352F0CE9DABC57DA5E8A6F74D92F654792E96FD8C7
          21B7B5897ECC43196DF2B2CDFBE3B0B45D86BF07883FE17A7876C2DFC69AC59E
          897DA65EEA9369315BD898775ACD611AC61DED9A50920B994BFEF37648DAC806
          2B4358F82FA56A3A059787AD355D6347F0C43A6268B71A259DC23DB5ED8A2141
          049E7248E9F233A192168E560C373929194EA2EBC2F6B77E2FD33C46F24C2FB4
          FB1BBD3E28D58796D1DC496F239618CEE06D63C608182D90723001C3E87F12AF
          EFFE264914C98F086A57571A0E933E57E6D46C83BDC1DA17CC1E615BD8FE7C22
          FF00656E05BED295EA15E6FA67ECFBE0BD1A1D2A6B3D2E1B7F10D84B6D3B78A6
          2B785757BB92274691E7BA1187769C2B2CC78322CB2838DC6BD22800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800
          A28A2800A28A280327C59FF22AEB3FF5E537FE806BA2FD88FF00E4DD349FFB0D
          6BFF00FA79BDAE77C59FF22AEB3FF5E537FE806BA2FD88FF00E4DD349FFB0D6B
          FF00FA79BDAFCFF8DBFE45D0FF001AFF00D2647561FE365FD5BFE4B1FC58FF00
          B13FC2BFFA72D6AB12B6F56FF92C7F163FEC4FF0AFFE9CB5AAC4AFA0E1FF00F9
          15D0FF0009955F8D95EF751B5D32212DE5CC369116DA1E7902027AE327BF07F2
          A75ADDC17D02CF6D347710B676C91386538383823DC558D3A57B7F146892C4ED
          1C88D78CAE870548D3EEB041EC69F75773DF4ED3DCCD25C4CD8DD24AC598E060
          649F615F4064735E10F1F683E3CFEDBFEC2BEFB77F62EA73E8D7FF00B9923F26
          EE1DBE647F3A8DD8DCBF32E54E7826B42F7C43A569BAB69DA55DEA7676BA9EA5
          E67D86CA6B8449AEBCB5DD279484E5F6A905B68381C9AF8BEEBC0DE3FF00EC0F
          10695A543E30F0D7F6E7C73B892EAF7435B8B4B9FEC79936BDD2BAAFFA8E8448
          418F2AA4E71563C3BE10F1D5EFC68F01DFF8934EF155DF867C2BE3EF12E9D657
          D702EE4B882C668613A7B3CA333CB6CD22C8A6672D1EDF9247D871401F6C515F
          07F84ACBE34FF606A771AAEB3E3CFF0084CBFB0BC4BFDABA743A45EFD9BED1B2
          516BB2E65BAFB3EFF33C9683FB361CE32A7E5CB5761E19D0FE2A43AFE87F6193
          C606EEDFE0FF00DAEDBFB4EF6E9AD8F89A477E2E3ED0FE53CE0CADFBB9B21005
          F95446BB403EC0A2BF3FF5FF00F85C1FF0AE75AFF844FF00E1647FC88BA37F68
          7DB7FB4FEDBFF090FF006845F68FB37DA3F7DFEA3CFDFF0066FDD6DC6EFE1A35
          67F8B5E05D47C63730DE78F2DF444BAF1C5AB5D6A3757F710C1A741A724BA64A
          924CCC23FDF07F2E7521DC861BD8645007DE1AFEB96DE1BD267D46EE3BC9ADE1
          DBB92C2CA6BC98E5828DB0C28F23724676A9C0C938009ACFF17F8FB41F01FF00
          627F6EDF7D87FB6B538346B0FDCC9279D7736EF2E3F914EDCED6F99B0A31C915
          F0BDF6A3F15757F853A8DF7816E7E215ED8DD7807439EE6E64935292E26D75AF
          E1699ECDA7CCACA6DCCC58DAFEE4A919FE1AEA3C69E1EF1B7887E2669BFDBFA6
          78C352D6EC7E3059DED9EDB7BE9749B7F0F205F2665F2C1B35DB91B9B89412FB
          CE77D007DC155EF751B5D32212DE5CC369116DA1E7902027AE327BF07F2AF91F
          E047FC2D4FF84FFE1BFF006DFF00C261FDAFFF0013FF00F84FFF00B63ED5FD9B
          FEB4FD87C8F37FD17EF6CDBF62FE1CFF0006EAFB22CB50BAD36532DA5CCD6B21
          5DA5E090A123D323B703F2A00C1FF84B343FFA0CE9FF00F8149FE347FC259A1F
          FD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF000966B7FF0041
          9D43FF00029FFC680394FF0084B343FF00A0CE9FFF008149FE347FC259A1FF00
          D0674FFF00C0A4FF001AEAFF00E12CD6FF00E833A87FE053FF008D1FF0966B7F
          F419D43FF029FF00C680394FF84B343FFA0CE9FF00F8149FE347FC259A1FFD06
          74FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF000966B7FF00419D43
          FF00029FFC680394FF0084B343FF00A0CE9FFF008149FE347FC259A1FF00D067
          4FFF00C0A4FF001AEAFF00E12CD6FF00E833A87FE053FF008D1FF0966B7FF419
          D43FF029FF00C680394FF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF
          00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF000966B7FF00419D43FF00
          029FFC680394FF0084B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF
          00C0A4FF001AEAFF00E12CD6FF00E833A87FE053FF008D1FF0966B7FF419D43F
          F029FF00C680394FF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC
          0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF000966B7FF00419D43FF00029F
          FC680394FF0084B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0
          A4FF001AEAFF00E12CD6FF00E833A87FE053FF008D1FF0966B7FF419D43FF029
          FF00C680394FF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A4F
          F1AEAFFE12CD6FFE833A87FE053FF8D1FF000966B7FF00419D43FF00029FFC68
          0394FF0084B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF
          001AEAFF00E12CD6FF00E833A87FE053FF008D1FF0966B7FF419D43FF029FF00
          C680394FF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AE
          AFFE12CD6FFE833A87FE053FF8D1FF000966B7FF00419D43FF00029FFC680394
          FF0084B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF001A
          EAFF00E12CD6FF00E833A87FE053FF008D1FF0966B7FF419D43FF029FF00C680
          394FF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE
          12CD6FFE833A87FE053FF8D1FF000966B7FF00419D43FF00029FFC680394FF00
          84B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF
          00E12CD6FF00E833A87FE053FF008D1FF0966B7FF419D43FF029FF00C680394F
          F84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD
          6FFE833A87FE053FF8D1FF000966B7FF00419D43FF00029FFC680394FF0084B3
          43FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF00E1
          2CD6FF00E833A87FE053FF008D1FF0966B7FF419D43FF029FF00C680394FF84B
          343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE
          833A87FE053FF8D1FF000966B7FF00419D43FF00029FFC680394FF0084B343FF
          00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6
          FF00E833A87FE053FF008D1FF0966B7FF419D43FF029FF00C680394FF84B343F
          FA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A
          87FE053FF8D1FF000966B7FF00419D43FF00029FFC680394FF0084B343FF00A0
          CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6FF00
          E833A87FE053FF008D1FF0966B7FF419D43FF029FF00C680394FF84B343FFA0C
          E9FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE
          053FF8D1FF000966B7FF00419D43FF00029FFC680394FF0084B343FF00A0CE9F
          FF008149FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6FF00E833
          A87FE053FF008D1FF0966B7FF419D43FF029FF00C680394FF84B343FFA0CE9FF
          00F8149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053F
          F8D1FF000966B7FF00419D43FF00029FFC680394FF0084B343FF00A0CE9FFF00
          8149FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6FF00E833A87F
          E053FF008D1FF0966B7FF419D43FF029FF00C680394FF84B343FFA0CE9FF00F8
          149FE347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1
          FF000966B7FF00419D43FF00029FFC680394FF0084B343FF00A0CE9FFF008149
          FE347FC259A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6FF00E833A87FE053
          FF008D1FF0966B7FF419D43FF029FF00C680394FF84B343FFA0CE9FF00F8149F
          E347FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF00
          0966B7FF00419D43FF00029FFC680394FF0084B343FF00A0CE9FFF008149FE34
          7FC259A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6FF00E833A87FE053FF00
          8D1FF0966B7FF419D43FF029FF00C680394FF84B343FFA0CE9FF00F8149FE347
          FC259A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF000966
          B7FF00419D43FF00029FFC680394FF0084B343FF00A0CE9FFF008149FE347FC2
          59A1FF00D0674FFF00C0A4FF001AEAFF00E12CD6FF00E833A87FE053FF008D1F
          F0966B7FF419D43FF029FF00C680394FF84B343FFA0CE9FF00F8149FE347FC25
          9A1FFD0674FF00FC0A4FF1AEAFFE12CD6FFE833A87FE053FF8D1FF000966B7FF
          00419D43FF00029FFC68039CB2D734ED4E53159EA16B77285DC520995C81D338
          07A723F3ABD57575BD47558B5C8AF6FEEAF2284E9CD1A5C4CCE10B7DB431009E
          09DAB9C75DA3D2A950064F8B3FE455D67FEBCA6FFD00D745FB11FF00C9BA693F
          F61AD7FF00F4F37B5CEF8B3FE455D67FEBCA6FFD00D745FB11FF00C9BA693FF6
          1AD7FF00F4F37B5F9FF1B7FC8BA1FE35FF00A4C8EAC3FC6CBFAB7FC963F8B1FF
          00627F857FF4E5AD56256DEADFF258FE2C7FD89FE15FFD396B55895F41C3FF00
          F22BA1FE132ABF1B12CFFE462D1FFEDF7FF4DD754B4967FF0023168FFF006FBF
          FA6EBAA5AFA0320A28A2800A28A2800AAFA8E9D6BABE9F73637D6D0DED8DD44D
          04F6D71189239A3605591D4E432904820F041AB1450057D3B4EB5D234FB6B1B1
          B686CAC6D625820B6B78C471C31A80AA88A30154000003800558A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A004D37AF
          887FEE19FF00B7F4B49A6F5F10FF00DC33FF006FE9680327C59FF22AEB3FF5E5
          37FE806BA2FD88FF00E4DD349FFB0D6BFF00FA79BDAE77C59FF22AEB3FF5E537
          FE806BA2FD88FF00E4DD349FFB0D6BFF00FA79BDAFCFF8DBFE45D0FF001AFF00
          D2647561FE365FD5BFE4B1FC58FF00B13FC2BFFA72D6AB12B6F56FF92C7F163F
          EC4FF0AFFE9CB5AAC4AFA0E1FF00F915D0FF0009955F8D8967FF0023168FFF00
          6FBFFA6EBAA5A4B3FF00918B47FF00B7DFFD375D52D7D0190573FE34F883E19F
          875A6C77FE28D7B4FD06CE47F2E39750B858848FFDD5C9F98E39C0CF009E82BA
          0AF99BE3C6ABE39F0CEAFF001675FF0003DACD75E3AD3BC35A337879E0B34BBB
          AB4D3DAF6E06AB7369195621D5BEC6B248AA59124463B4046500F79F05FC41F0
          CFC45D364BFF000BEBDA7EBD671BF9724BA7DC2CA237FEEB60FCA71CE0E3820F
          435D05781FEC4BACFC43F887E037F147C5AB0BC7F11B6A1796565AD6ABA68B5B
          EBDD363B3772B2C8115A5862BC6816377CE1E79230C72557A7F889F107C4BE1A
          D73C592E9B2694347F0BF8760D7EE6D2EACA592E2F7735E178926599561F96D0
          00C639305C92081B4F66170B3C5CDC20D2F5F3692FBDB4BF3D0994947567AAD1
          5E0DF107E3B788FC2973AD6A1A6E9916A1E1B58F53B5B0BD9ECD628D6F6CECEE
          669159C5D9965512D94D195FB3C208E5642154C9BBE23F89FE23F0FF008AB4FB
          5B7B58B5BD26CEF74ED1B5CB982C1608E2BDBA78532B23DE7988A16EADE408B0
          4C30DB0CA09668FD2FEC5C4DA1AAF7936B5ED64D3ED2E66A3676F7B423DA44F5
          CA2BC53C4FE0DB6F17FC7DD492F7C1BE1AF15D9C3A0E9027975F6064B346BAD4
          7734086DE50EC4024A968C128A33CE575B5DF8C52F867C7DA8E91A90B4B6D134
          FF003350B9D5FCA91E18ECE3B132BDAEE5249BF12033F9214FFA2FCE3E6A8795
          CE6D4683E697273B5A6D64ECACDB6F5EA95FA5C7CE96E7AAD15E0D63F153E21D
          C7896C7C257B63A7E87AEDD5EDB017DA96980C7F6796D751978B78350972C1F4
          E23799C64487F7636867823F8F3E2DBED3F4582C347B4BED63C456FA6EA5A7AD
          AC01BEC905E5BDF5C085E396E6259DE35D3DD4C9E7421BCD0C1014D92743C871
          29BB4A2D249DF9B4E57B4AFB5B46FBE9AADAF3ED627D014578E78C351B8F1DFC
          16D34F88F4BB449EE3C45A558DFD81686E217D9ADC103ABAA492A0DC10EE8B7C
          9B0B346598A9249B55FF00856BAC78AB4CF0B59DA5A6890FF61D9DA59C517FA0
          D86A37B792413111A10176C7259CED02326EDE1BE469CC8D8432B94E0D297BEA
          4E36D2DA3846FCD7EF35D2D657B8F9F5F23D8E8AF23B2F1F78BB56F16CFE0982
          EB44B6D76C64BA371AD49A6CD25ACE90C3A7CA152D45C2B46C7FB4D177199C7E
          E18E3F780467FC2E8B91A4DEDD492688253E26D1744B116F726786E52EE2D3E5
          97CA932BE7304BAB86465550563562980D99FEC9C436946CEE935E8DDA2F6D9F
          DE92D521FB447AE515E0DE12F8CBE2EBCD3B40BFD54E897115D59681A8DCC367
          63340CC9AB5C1B68E34669DF6B40E8D23390C250C142C454BB51D2FE3BF8FAF3
          42D3B5697C33A7DBC5AEC7A7DDE9315FCB15BAECB8BEB380C798EEA79665D978
          099FC88421542D1319022F57F6062F99C138DD351F8ADABD6CAF6E9EF76B79E8
          4FB589F43D15E1ABF12358D3BE27987C41AB5A5BE9DE17D3B597D6A7B4B4996D
          EF228E0D26E565483CD731BC6B77B724CA48493681E6E128E9FE37F13EBBF12B
          C1DA178B349FECED474FD6A2BD8E5FB3C56FE6C53E97AC201E5C777743E56B66
          F9BCD04EEC6C5DA19E56495BD9BAAE6ACA0E7EAB5B5AF6BED16FAA52575BA0F6
          8AF63E80A28A2BE74D828A28A0028A28A002B81F117C7CF86FE12D7A4D135AF1
          CE83A66AB1B2ACB6B737F1A3C44F40F93F21E87E6C7041E86BB3D5BED5FD957B
          F61FF8FDF25FC8E9FEB369DBD78EB8EBC577DFB15683A0D9FECB1F0F4E9B6F6F
          24B7DA342FACC8501967D44A917C2E0E32D2ADC79E8E1F243060790680389866
          4B8892589D6489D432BA1C86079041EE29F572FBC39A27855F51D37C3F690D86
          916BAADC41656B6D188A186158A0DD1C4800511A4E6E506D181B0A8FB981E03A
          07C62F12C1E18F0EDFEBF36957375E28F0E8D5B4D5D334C963FB35D3BD9C50DB
          323DCB09FCC97508543178146C3B9806DD1FA185C0D5C627ECAD74D2B75774DE
          9A74516FF2BBD089494773DCA8AF0DF0E7C6DF100D7E6B2F155B5A6836BA1DBE
          AB77AE4B3591333C56D069F323471C37332C5F2EA19203CE5845C6C2FB53ABF8
          59E37F13EBBAE6BBA178B349FECED474FB7B4BD8E5FB3C56FE6C53B4E807971D
          DDD0F95AD9BE6F3413BB1B176867EAAF94E230F4E5566D5924F47BA6ED75DFA3
          76D9495FC92A89BB1E8F457CC7F04BC39FF08FE95F06750FF8457C3FE19FED2B
          7862FED6D0A5DF7BAAEED2A797CBBC5FB3C5B51B679CC7CC97F7B146369CF989
          3C9F177C7DE2DF0BE95732D845E198B5E9348D4749BB7F295A249353B0431948
          EF5E5BB88A5D00EFB2D8606D65066013D1A9904D623D8D2AA9A4D2BBB2DE528E
          89395EDCADBB3BDB4DF42155D2ED1F4AD15F3558789EE6E7C71AE6A4FA6E88F6
          7657BA7E9B1D84962592379BC59796CF7311DF88E5616F1CAE4292F3470B923C
          B0A7B9D27E286B8DE0AB1F11EA57BA22AF88B4A8AFF46D32DAD9FED96F34ED02
          5BC0C8D385BA5F32EE18DA5DD6CAADB376D597747CD5F25AD49DA324DDD47E6D
          276EBD1DFB696577A0D544CF5CA2BC53C2DF13FC6DE2BD64F851ED74FF000EF8
          92D64BC37579A95879D1B2431D848145B4378C11986A51FCC2E6400424919936
          C7CE789352B2D47E25F87FC616DE1FB4F10430DCE99A6EA5A85ACCD716D05C5D
          BDA98D23B96BA8FCD863F3ACEE2355B391379DEAD1C8EEF1BA792D4753D9D49A
          5A5D5ACEFD23AB695A6F44EFEAB540EA2B5D1F47515E63F0E3E226B9E24BEF0C
          BEAA34F6B3F14E8327882C62B3B778A4D3D10DAFEE257691C4EC45E20F315621
          9889D9F3809E9D5E3E270D3C24F92A7E1E4DA7F734D7CB4BAB3348C9495D0514
          515C850514514005145140051451400514579C7C5ED0B4CF136B5F0DF4DD634E
          B4D574E9FC45279B677D02CD0C98D2B5065DC8C08386008C8EA01AEAC3518D7A
          9C9276566EF6BEC9BDAEBB77264EC8F47A2BC72D7C4D7BE14D1FC4DA5F8757CD
          C788BFB23C2D6696AB750954B3866B88220D3C0852278EFD70D322C661312FFA
          B58AB0BC29F163C41A96ABE25D5EFDFF00B39EDF46B4D397487B733E7563AAEA
          56313220B811A7992C28AC9E611F3460DC0588C8DEB2C9AB4A12AB192B2E5B5F
          77CD6B69AF769DAE94935723DA2BD8FA028AE1BE13F8C75AF1669FADC1E22D37
          FB3758D1F51FB04EBE5A45E666DE0B857F2D279D53E5B855C09A4CEDDD952DB1
          7B9AF1F1142586A8E94DA6D754EE9A7AA69F66B5344EEAE1457CEFF1E34EB5D4
          F50F8B57D796D0DDDF786BC036FAA687733C61E4D2AF09D558DC5AB1E61949B7
          B73E6261B30C7CFC8B8CFD05ED743F1E693E2BBE874DD32C67F15EBF6D3F8BA4
          9826A37D1C2BA996B4BDCA811D9C02DCEC733CA31656A7CA8F3FB9E719F4C515
          F3BF893C24DA878234FF001A6AB16A5A6EB3AD78D743D67FB34DD5C5B25BC72E
          A5A6DBC115C5B060AD2ADB5BDBEF59448127F38C640C63B8BED0EDAC3F694F0F
          6A314978D717FE19D63CE49AF669615D973A4AAF950BB98E1C83F3796ABB8F2D
          93CD007A8515E1F3C1E1BF19FF006E78CBC4BA57F6FE99AE5D5BE93A0E82AA25
          5D620B4FB4F90C6066F2E7F3659EF274766308816DA76F2FCA7917CFFC5BE06F
          EC0F0E7C4E835886CEF353F0B7817FB6742645F353C3D7135C6B3322D83B2830
          F92B15AC49246B192B69090A9B155403EB0A2BE47F1D785ED75AF03CB7D1C9A6
          E93E21F11F88BC61A16A1E23BE610B4966B6FAE2431DDDCE0B9B6885BDB1DAD9
          5416F1E07EED71EC1F07BC3D6BE04F17F89FC2C9A178574FBE86C74FD4E5D43C
          2BA18D263B88E692EE348A487CC94B3466DA460E5F044D80ABB49700F58A28A2
          800A28A2800A28A2800A28A2800A28A2800A28A280134DEBE21FFB867FEDFD2D
          269BD7C43FF70CFF00DBFA5A00C9F167FC8ABACFFD794DFF00A01AE8BF623FF9
          374D27FEC35AFF00FE9E6F6B9DF167FC8ABACFFD794DFF00A01AE8BF623FF937
          4D27FEC35AFF00FE9E6F6BF3FE36FF0091743FC6BFF4991D587F8D97F56FF92C
          7F163FEC4FF0AFFE9CB5AAC4ADBD5BFE4B1FC58FFB13FC2BFF00A72D6AB12BE8
          387FFE45743FC26557E36259FF00C8C5A3FF00DBEFFE9BAEA9692CFF00E462D1
          FF00EDF7FF004DD754B5F406414C16D6CD796D7535B2CD35B31689C492452467
          D5648D95D0F03EEB0CE307238A7D637C2FF87DF127E2E7862E7C4963E36F0AE8
          562DAC6ABA7C16171E14B9BB9238ED350B8B452F28D4A20ECC200C708A32D8C7
          1401D1CD7E5FED1E5C7E535CEDF3E579A5B89A5DBF7434D33BC8547184DDB411
          9033935C55FF00C2FF000D6AFE381E2CD4B49B4D53588EDEDADEDA5BDB68A6FB
          1F912CD2A4909652D1B9698E483FC098C1193DFF00FC3397C54FFA29BE0FFF00
          C21EEBFF0096D47FC3397C54FF00A29BE0FF00FC21EEBFF96D5B52AD528DDD39
          3575676EC2693DCE1EFF00E1AF84754D66E357BDF0AE8979AB5CC6D0CF7F3E9D
          0BCF2A347E532B485773298C94209C153B7A7153EABE04F0D6BBAE59EB5A9787
          B4AD4358B3D9F66D42EACA296E20D8C5D3648CA5976B12C30782491CD763FF00
          0CE5F153FE8A6F83FF00F087BAFF00E5B51FF0CE5F153FE8A6F83FFF00087BAF
          FE5B55FD66BE9FBC7A2B2D5E8BB2F2F20E55D8F1DF1FFC03D23E23F889F57D57
          5195E5F2D618A29347D26E96145FE147B8B2964DA58B360B91976C60715DC587
          866C2CD6DDE5822BEBF8A45B87D427B7884F35C083C8370C5114094C5F216503
          E53B400BC5755FF0CE5F153FE8A6F83FFF00087BAFFE5B51FF000CE5F153FE8A
          6F83FF00F087BAFF00E5B56B531B88AB4E34A52F762ACB44B4F92BBBF5BEE251
          49DCE1F41F86BE11F0ACC25D17C2BA268F2891660F61A743036F08E81B28A3E6
          092CAA0F5C48E3A31CCF75E04F0D5EE97269B71E1ED2A7D3A4B782CDECE5B289
          A1682162D0C450AE0A46CCC5571852490066BB1FF8672F8A9FF4537C1FFF0084
          3DD7FF002DA8FF008672F8A9FF004537C1FF00F843DD7FF2DAB29626BCA5CF2A
          8DBD35BBBE9B7DDD07CAB6B1CADE784F43D47C3ABA05DE8DA7DD684B1C70AE97
          35AA3DA844C18D44446DDABB5703181B463A5167E13D0F4EF0EB68169A369F6B
          A1347242DA5C36A896A51F26453101B76B6E6C8C60EE39EB5D57FC3397C54FFA
          29BE0FFF00C21EEBFF0096D47FC3397C54FF00A29BE0FF00FC21EEBFF96D51ED
          AAF2F2F33B5EFBF5EFEBE616470F71F0D7C2379E1DB5D027F0AE893E856B219A
          DF4B934E85AD6173B896488AED56F9DF9033F337A9ABD79E13D0F51D59754BBD
          1B4FBAD4D638E15BD9AD51E6089289A350E4676ACAAB2019C0650C3919AEABFE
          19CBE2A7FD14DF07FF00E10F75FF00CB6A3FE19CBE2A7FD14DF07FFE10F75FFC
          B6AA788ACF5737D7ABEBBFDFD7B859763958BC27A1C10C5145A369F1C51476D0
          C6896A81512DDCBDBA818E16272590744272B83505A7813C35A7DC5FDC5AF87B
          4AB69F50B98EF2F2586CA246B99E393CD8E59085CBBAC84B863921B9073CD763
          FF000CE5F153FE8A6F83FF00F087BAFF00E5B51FF0CE5F153FE8A6F83FFF0008
          7BAFFE5B52F6F575F7DEBE6FFAE8BEE0B239DFEC2D33ED9F6BFECEB4FB57DA7E
          D9E7F90BBFCFF27C9F377633BFCAFDDEEEBB3E5CE38AC9D07E1AF847C2B30974
          5F0AE89A3CA245983D869D0C0DBC23A06CA28F9824B2A83D71238E8C73DC7FC3
          397C54FF00A29BE0FF00FC21EEBFF96D47FC3397C54FFA29BE0FFF00C21EEBFF
          0096D42AF5545C14DD9E8D5DEA96C82C8CBA2B53FE19CBE2A7FD14DF07FF00E1
          0F75FF00CB6A3FE19CBE2A7FD14DF07FFE10F75FFCB6AC0665D15A9FF0CE5F15
          3FE8A6F83FFF00087BAFFE5B51FF000CE5F153FE8A6F83FF00F087BAFF00E5B5
          0065D15A9FF0CE5F153FE8A6F83FFF00087BAFFE5B51FF000CE5F153FE8A6F83
          FF00F087BAFF00E5B50065D3B4F4B4D362BB48ACD905DB16B8FB3DF5DDA89B3D
          77AC1322B1E4F2C0939EB8C5697FC3397C54FF00A29BE0FF00FC21EEBFF96D47
          FC3397C54FFA29BE0FFF00C21EEBFF0096D40142E2E5EE3CB0C238E389047145
          0C6B1471A0E8AA8A02A8EA7000E493DEB88F057C20F08F807C2A740D2B41D3D6
          CE6B28EC6F9DECE1126A2888533725500959833E770C12EDC726BD1BFE19CBE2
          A7FD14DF07FF00E10F75FF00CB6A3FE19CBE2A7FD14DF07FFE10F75FFCB6ADE1
          5EAD384A9C24D45D9B4BADB6FBAFA09A4DDD9C7787BC09E1AF096DFEC3F0F695
          A2EDF336FF0067D945063CCF2FCCC6C51F7BC98B3EBE5A67EE8C41A3FC3CF0F7
          856C75183C31A469FE1396FA3D925D689610412640608F8D8559937315DEAC32
          4E410483DC7FC3397C54FF00A29BE0FF00FC21EEBFF96D47FC3397C54FFA29BE
          0FFF00C21EEBFF0096D54F135DDF9A6DDF7BBBDEDAABF7D7B872AEC795E95F09
          EE34B9B45FF8AD35BB9B3D1E447B3B192C34948620A863D89B2C95A3531B3C7F
          BB2A42BB00466BA3B6F02786ACBFB6BECFE1ED2A0FEDBDDFDA9E55944BF6FDDB
          B779F85FDEE77BE77673BDBD4D763FF0CE5F153FE8A6F83FFF00087BAFFE5B51
          FF000CE5F153FE8A6F83FF00F087BAFF00E5B56953195EABBB95BD128F5BEB64
          AFAEBAF5128A472A9E13D0E36999346D3D5A69126908B5405DD276B8466E3965
          9A492504F21DD987CC49A82DBC09E1AB2FEDAFB3F87B4A83FB6F77F6A7956512
          FDBF76EDDE7E17F7B9DEF9DD9CEF6F535D8FFC3397C54FFA29BE0FFF00C21EEB
          FF0096D47FC3397C54FF00A29BE0FF00FC21EEBFF96D58FB7ABAFBEF5F37FD74
          5F70EC8F2BF10FC09F05EBFE1DB1D05343D3F49D16DB5583577D3F4ED3ED521B
          89A3C7122344C36B00158AED66505776D2C0F47AAF813C35AEEB967AD6A5E1ED
          2B50D62CF67D9B50BAB28A5B88363174D9232965DAC4B0C1E0924735D8FF00C3
          397C54FF00A29BE0FF00FC21EEBFF96D47FC3397C54FFA29BE0FFF00C21EEBFF
          0096D5B4B1B899249D47A5FABEBBFDF657F4172C7B1CAE8FE13D0FC3D7DA8DEE
          95A369FA65E6A5279D7D71676A914974F963BA56500BB65DCE5B272C7D4D6B56
          A7FC3397C54FFA29BE0FFF00C21EEBFF0096D47FC3397C54FF00A29BE0FF00FC
          21EEBFF96D5CB39CAA3E69BBBF32AD632E8AD4FF008672F8A9FF004537C1FF00
          F843DD7FF2DA8FF8672F8A9FF4537C1FFF00843DD7FF002DAA00CBA2B53FE19C
          BE2A7FD14DF07FFE10F75FFCB6A3FE19CBE2A7FD14DF07FF00E10F75FF00CB6A
          00CBA2B53FE19CBE2A7FD14DF07FFE10F75FFCB6A3FE19CBE2A7FD14DF07FF00
          E10F75FF00CB6A00CBA2B53FE19CBE2A7FD14DF07FFE10F75FFCB6A3FE19CBE2
          A7FD14DF07FF00E10F75FF00CB6A00CBAC9F12784F43F18D8A596BFA369FAE59
          C720992DF52B54B88D5C02030570406C330CF5C13EB5D57FC3397C54FF00A29B
          E0FF00FC21EEBFF96D47FC3397C54FFA29BE0FFF00C21EEBFF0096D5709CA9C9
          4E0ECD75416BEE72B79E13D0F51F0EAE8177A369F75A12C71C2BA5CD6A8F6A11
          306351111B76AED5C0C606D18E9505AF813C3565A5C7A6DBF87B4A834E8EDE7B
          34B38ACA25856099834D1040B809232A965C618804838AEC7FE19CBE2A7FD14D
          F07FFE10F75FFCB6A3FE19CBE2A7FD14DF07FF00E10F75FF00CB6AD157AA972A
          9BB5EFBBDFBFAF98AC8E57C37E13D0FC1D62F65A068DA7E8767248667B7D36D5
          2DE3672002C550005B0AA33D7007A56B56A7FC3397C54FFA29BE0FFF00C21EEB
          FF0096D47FC3397C54FF00A29BE0FF00FC21EEBFF96D59CE72A92739BBB7D58E
          D6D8E4F5BF06E81E25D434BBED5F43D3755BED2E5F3EC2E6F6D239A4B3932ADB
          E26604C6D944395C1CAAFA0AAF3FC3CF0ADD6ADAAEAB37867479B53D56D5ACB5
          0BD92C2269AF2DCAAA986672B9910AA202AC48C2818E05769FF0CE5F153FE8A6
          F83FFF00087BAFFE5B51FF000CE5F153FE8A6F83FF00F087BAFF00E5B5401877
          DA75AEA90AC3796D0DDC2B2C73AC73C61D4491BAC91B807F895D5594F505411C
          8143E9D6B2EA10DF3DB42F7D04524115CB460C91C6E519D15BA85631C6481C12
          8B9E82B73FE19CBE2A7FD14DF07FFE10F75FFCB6A3FE19CBE2A7FD14DF07FF00
          E10F75FF00CB6A00E2F58F879E15F10E8165A16ABE19D1F52D12C767D974DBCB
          08A5B6B7D88513CB8D94AAED5254600C0240E2ABC7F0B3C17143A2429E10D052
          1D0E569F4A8D74C842E9F2338919E01B7F74C5C0625304900F515DE7FC3397C5
          4FFA29BE0FFF00C21EEBFF0096D47FC3397C54FF00A29BE0FF00FC21EEBFF96D
          401C9DB783740B2F135DF88EDF43D360F10DE4420B9D5A2B48D6EE78C05011E5
          037B2E234E09C7C8BE828F0BF83740F03E9F258F87343D37C3F6324A677B6D2E
          D23B68DA4202972A8002C42A8CF5C28F4AEB3FE19CBE2A7FD14DF07FFE10F75F
          FCB6A3FE19CBE2A7FD14DF07FF00E10F75FF00CB6A00CBA2B53FE19CBE2A7FD1
          4DF07FFE10F75FFCB6A3FE19CBE2A7FD14DF07FF00E10F75FF00CB6A00CBA2B5
          3FE19CBE2A7FD14DF07FFE10F75FFCB6A3FE19CBE2A7FD14DF07FF00E10F75FF
          00CB6A00CBA2B53FE19CBE2A7FD14DF07FFE10F75FFCB6A3FE19CBE2A7FD14DF
          07FF00E10F75FF00CB6A00CBA2B53FE19CBE2A7FD14DF07FFE10F75FFCB6A3FE
          19CBE2A7FD14DF07FF00E10F75FF00CB6A00CBA2A96BFF000FBC7BF0F3C69F0E
          ACB5DF17F8735FD2BC51AF3689345A7786AE2C2783FE25F7974B2AC8F7F329C3
          5AAA9529C873C8C576FF00F08F689FF3FF00A87FE02A7FF1CA9724B71A57395A
          2B3FE206B36FE17F14F82F48D34C9749ADDD5CC5712DD4610C4915B3CA360563
          92582F27A00460E723429A77D436134DEBE21FFB867FEDFD2D269BD7C43FF70C
          FF00DBFA5A62327C59FF0022AEB3FF005E537FE806BA2FD88FFE4DD349FF00B0
          D6BFFF00A79BDAE77C59FF0022AEB3FF005E537FE806BA2FD88FFE4DD349FF00
          B0D6BFFF00A79BDAFCFF008DBFE45D0FF1AFFD2647561FE365FD5BFE4B1FC58F
          FB13FC2BFF00A72D6AB12B6F56FF0092C7F163FEC4FF000AFF00E9CB5AAC4AFA
          0E1FFF00915D0FF09955F8D8967FF23168FF00F6FBFF00A6EBAA5A4B3FF918B4
          7FFB7DFF00D375D52D7D019057847C46F18B783BF675F879369BE24B7D23C437
          1E3AF1B476FA75F78E2EBC31697F12DC6B726279609E1DCAB731D8E0B328DEF1
          C7E6C22766AF77AEA3F65DF16687E14F823A67F6DEB3A7E8DFDA5E33F1169B63
          FDA174907DAAEA4D7B50F2E08B791BE56DA76A2E58E0E071401F25FC74F1135C
          5B7C42BCF875FB446B165A4691F07F43D495B54F165D2DF5C4AD234F15F244D2
          218EEE78ECF4CB67409096FED9F34E5DC4571FA3DE137D2E5F0AE8CFA25FFF00
          6AE8AD6509B1BFFB735F7DA60D83CB97ED0ECED36E5C3798CCC5F3B8B1273595
          AFFC58F03F853C55A6F8635BF19787F46F126A5E5FD8747D4354820BCBAF31CC
          71F950BB877DCEA51768396040E451FF000B63C0FF00F09DFF00C213FF000997
          87FF00E133FF00A173FB520FED1FF55E77FC7BEFF33FD57EF3EEFDDF9BA73401
          F357C31D025D43E32D8FC3B1E25F185CDFF80FC4DAD6BBAEDE1F16EA97514B6B
          28B69748D3E70F719689EDEFED597CEF95A4D22F91525596795AAFC2EF1DFC3E
          80FED0D77E18F8D77125C6870DD3E93A94DE2FBBF14AE95A5AE8FA7CD25FC763
          35D4CB70B0DE3CE77ED2C58343B803B2BE95D33E37FC3AD6BC64FE11D3FC7DE1
          7BFF001624D35B36836DACDB497CB2C418CB19815CB86408E597195DAD9C60D5
          A8BE2C781E7FED6F2FC65E1F93FB23ED9FDA3B75480FD8BEC9E5FDB3CEF9FF00
          77E479D0F99BB1E5F9A9BB1B86403E75F83EDA378FFC33F1123D47E216B16DE1
          8B3874BB89B58F0D7C4A9F59D1B4EB5B79E7B99A1875978A1B88E76DB21BB123
          B3A5BCF6A1654431A45C5687E36D2F4AFD8ABE1E595B7C47F10788BC67F153FB
          1C59AB78D1BFB59EF0A5947AA45A6DE4D731F932C7E4DCBAC72CDE50BA9042CA
          44CB6EDF4FC7FB4DFC1E9B4AB8D4E3F8AFE077D36DA68ADA7BC5F11D99862964
          591A38D9FCCC2B3AC32955272446E46769C5BD4BF685F859A37F6AFDBFE25F83
          EC7FB26F574DD43ED3AF5AC7F63BA3E66209B320F2E53E44D846C37EEA4E3E53
          800A9FB3AFC62B1F8E3F08F42F12C1AA68FA96AE214B4D75343B859ADAD3548D
          145DC08C1DC155909D8C1995E368DD59D1D5DBC2BE2978CECF4BFDA3BE24DA78
          6BC71A84DF126C7C33A35D7863C1B1789AE2582EF5976D40496CFA5998C26292
          18EC3CF263510C321B9DF0313703E95B5F8B1E07BDD0B44D6EDFC65E1FB8D175
          CBD5D374AD462D5206B7D42E99991608240FB6594B46EA1109625186320D1FF0
          B63C0FFF0009DFFC213FF099787FFE133FFA173FB520FED1FF0055E77FC7BEFF
          0033FD57EF3EEFDDF9BA73401F25FC5FF1DE9DA77EDD5A4682DE3FB8D334D926
          F0CFDBEC2DFC777904F6D7B24BA808E08349594C532DCBC5A4C570A633E5C371
          E67963CE7B88BEDFAC9FF84B343FF84ABFE118FED9D3FF00E124FB17F697F63F
          DA93ED9F65DFE5F9FE4E77F95BFE4DF8DBBB8CE6B5A803E55FD97FC6171AE78A
          BC169078A350D7F5ABEF064F7DF112C2E7589AFF00FB27C401F4EF2E19ADE491
          D74B9774BAAA8B58D6053E548BE5916EA23F4AFDB035987C39FB2E7C52D524D7
          2E3C397165E1FBB9ECB53B4D4E4D3A68AF56326D424D1BA30669C4481037EF0B
          042183953D5F86FE37FC3AF18E95AD6A7A078FBC2FAE69BA243F69D52F34DD66
          DAE21B08B6BB7993BA39112ED8E43B98818463D8D54D3BF685F859ABE85ABEB7
          61F12FC1F7BA2E8FE4FF00696A36FAF5AC96F63E6B148BCE9048563DEC0AAEE2
          37118193401E15F167F68BF0178ABE11CFE0AF01F8C2E350D4AF3C4161E0DD1A
          E746F15247A86AACA9637375269DA8B5DAF993C76D705449713057B90B14A25F
          3424B95A1FC6CF097C4BD57E1878FF00C57F10ADF42D0AEBC25AC687E28B8D2B
          C6373A6E836DE2146B04FB2878EE843E784B8D4DA170CCEF1A2CD1BBAC514ABF
          556A7F10BC2BA2F8353C5DA8789747B0F09BC30DCAEBD737F14762D14A544520
          9D9821572E815B386DCB8CE456AE93AB58EBFA559EA7A65E5BEA3A6DEC29736B
          79692ACB0CF13A864911D490CACA410C09041045007C01F0E7C4177E15B93A6C
          5E3BF145CFC6AB4F873E19D4B4CF07EB5E2FD42F67BBF135C477CF796B73A75C
          5C30DB22AD9F9EAE8A2DA193CE0D6D8132FB078E3C61716BF1975E81BC51A85A
          78FADFC67A058F863C369AC4D17DB3C3F28D2FFB4664D2C4822BB8944DAC16BA
          686468FC9908913ECCBE5FBAF8D7E37FC3AF86BAAC5A678BBC7DE17F0AEA52C2
          2E63B3D6F59B6B399E22CCA240923A92A591C6EC632A476355352FDA17E1668D
          FDABF6FF00897E0FB1FEC9BD5D3750FB4EBD6B1FD8EE8F998826CC83CB94F913
          611B0DFBA938F94E003D02BE3FFD9FBF6A7F851E05F05EBD67A8FC49FED98ECE
          F7C51AEDE6AB7DE25935BFB0E9B69AC8B3B35779679665F3609ECC40880F9D87
          65DCEF993E95D03E2C781FC57E2AD4BC31A278CBC3FACF8934DF33EDDA3E9FAA
          413DE5AF96E2393CD851CBA6D7608DB80C3100F268B1F8B1E07D4FFE127FB1F8
          CBC3F77FF08BEFFEDEF235481FFB2366FDFF006BC3FEE36F952E7CCDB8F2DF3F
          74E003E0B3FB404307ECE87C21E2FF001D5BF873E20E99E20F0E6A5616571F12
          64B7B9BBD3B50B8B392E3CCD52D6F2E1DED3171A92A12F2C915925A4D2216F2E
          57F55D0FC6ED71F0E7476D67C5F7161F0CE5F1CBD96A7AF58F8B6EAEB4FB5D2C
          68D24C820F1233C7733C075310A1B86689967924B21BA38C093E95B2F8DFF0EB
          51F06DFF008BAD3C7DE17BAF09D84C2DAF35E8759B67B1B694940239270FB118
          99631B4907F78BFDE192CBE37FC3AD47C1B7FE2EB4F1F785EEBC276130B6BCD7
          A1D66D9EC6DA525008E49C3EC462658C6D241FDE2FF786403E55F1DF8E615F06
          FC0D1ABEBBE28D4DF56F1CEB9A4E99A6E87E329348BED7F4407534D39D276BDB
          6176A563D1D92E24959E4F32321DDAE4896A78CBF6A4FEC7BCF84F76DE39D3F5
          ED6BC0DA341A8FC47B9B2D5FEC30DA34B35959DDB5EE9EF2DBB4B856D4596D96
          D9AEA1BB4B05314426314DF5FEBFF163C0FE14F1569BE18D6FC65E1FD1BC49A9
          797F61D1F50D52082F2EBCC731C7E542EE1DF73A945DA0E581039156FC49F10B
          C2BE0ED5745D335FF12E8FA1EA5ADCDF66D2ECF52BF8ADE6BF97722F97023B03
          2B6E9231B54139751DC5007CEBE25B3F0C788FF6B8F01C765F16FC403FE128D1
          AE7C576BA5699E34952CE7FB2CBA47D8D2DECD24F264B69E18752661B1FCD592
          EDB77EED4C4781FC617175F19741817C51A85DF8FAE3C67AFD8F89FC36FAC4D2
          FD8FC3F10D53FB3A67D2CC862B489843A395BA5863693CE8C991FED2DE67BFFF
          00C2D8F03FFC277FF084FF00C265E1FF00F84CFF00E85CFED483FB47FD579DFF
          001EFBFCCFF55FBCFBBF77E6E9CD741AB6AD63A069579A9EA7796FA769B650BD
          CDD5E5DCAB1430448A59E4776202AAA824B12000093401F15FECD9F10F46D4B5
          0F10FDA7C73AC0F87D34DE2ED2AEF5ED6BC6B3DF5B6A06DF503258B595E9BB95
          EC9ADB4C170EC4BDB4B2C6C97082E16169A23C1DF1BFE1F782BF663F8A9ADE9D
          F14ADF5EF10CFA9EB7A2D82EB7E3FBBBD1E6B6A1A8C1A242257BCDF68B2C291B
          79F1BC24C5199DA502232AFD55A1FC6FF875E27D5747D3346F1F785F56D4B598
          5EE74CB3B1D66DA69AFA246915E48115C99155A09816504031480FDD38DFF0B7
          8B343F1CE856BADF86F59D3FC41A2DD6EF2351D2EE92E6DE6DAC51B64884AB61
          9594E0F0548EA2803E36D7BE36787754FD9BECB43F137C42B8F0DF89FC1DE39D
          1FC33AC6FF00189B3D561B7FED64840BFBBB4BADB2CF2697E74970C92B46258E
          E986C7B76117D69F0C7E25E87F177C211F89FC373FDAF459AF6F6CA0BA57474B
          8FB35DCD6AD2C6C8CCAD13B40CE8C0FCC8CA7009C03C75F163C0FF000BFEC3FF
          0009978CBC3FE12FB76FFB27F6EEA90597DA366DDFE5F9AEBBB6EF4CE338DCB9
          EA2BABA00F92BF69DFDA22C7C0BF1A3C2C9A57886DC2781A1FED8F18DBC7AEAD
          BC7A7D8DCDCD9DB86BCB43711FDA97ECD2DE491C71C534E97234FDAAAB71B27A
          9A8F8B7FE137FDB12F34EF87BE2CD4359BB6D1BC33AF092C7C61E768D636AD77
          707516934F376564FB4E9FF6448CC56D22ABDC4131309944C7E8BF1AFC6FF875
          F0D7558B4CF1778FBC2FE15D4A5845CC767ADEB36D6733C459944812475254B2
          38DD8C6548EC6BB5A00F8D7C05E3F853F6ADF1BDB695E29D627D234EF1CAE9BA
          9DE5EF89E4D474886DEE7468F669896AD732FD9276D5F76C91A1863DD1496A93
          EF22D9FCFF00F67EF8A7A74BAE7C629E1F8C171696FA4787FC4B73A26AC9E2EB
          CF16886CA1D5AE90EA375613CB2AA35A411E986DD540FB445712BEF9CBBAC1FA
          155C5782BE37FC3AF895AACBA67847C7DE17F156A51426E64B3D1359B6BC9922
          0CAA64291BB10A19D06EC632C0771401F255FF008DECE3FD9C7F683D661F1EEA
          0B0E99E198DB4AD5742F89171AEE8F6174AB74F6D05A6ACD1DBDC1BE6BA64334
          32BCAC527B18C3189D214E2A6F1F35DF84BE1CDC785FE275C4BE363F14EFD574
          0B1F89375A969FA9C56D62F71068F05EDCDC62E60BB58748432CBBC453EA720D
          91176B51F75597C6FF00875A8F836FFC5D69E3EF0BDD784EC2616D79AF43ACDB
          3D8DB4A4A011C9387D88C4CB18DA483FBC5FEF0CDAFF0085B1E07FF8413FE136
          FF0084CBC3FF00F0867FD0C7FDA907F677FADF27FE3E37F97FEB7F77F7BEF7CB
          D78A00F8AC6AFE14D47F662F09FC477F8B3E30D3341BEF8813D8E9F7B7BE3BD4
          EC92FB4DB8F14C56F992496E1663E56976720552E3CB46B99597CCDD22F6BF1C
          7E3458FC19F1F7C3DD074AF19DC6B09F0CF4C86EFC6373A9789145C43632CB65
          6827D4E037117DB99EDA4BC995638A59C5D7D80AAAADCEC9FE9FF11FC58F03F8
          3F5D5D135EF19787F44D69ACA4D4974ED475482DEE0DAC6B23C9388DDC3794AB
          0CACCF8DA044E49C29C6AF85BC59A1F8E742B5D6FC37ACE9FE20D16EB7791A8E
          97749736F36D628DB244255B0CACA70782A4751401F2078E7E2B696DFB53EAD7
          3E17F1B6A177696FA3785BC41717F65E2C6B9D0B49B27BE986A53DC580B965F2
          A7D3CDA012A5B491C2668AE647B70FF68AFB56B9FB2F885E15D47C657FE11B4F
          12E8F75E2CB0845CDE6830DFC4F7D6D11084492401B7A2912C6771007EF17FBC
          324BF10BC2B05CF892DE5F12E8F1DC786A14B9D7227BF883695134665492E86E
          CC2A635670CF805549E833401F3AFC03D53C19E20F0ADAEB7AFF00C4AF104BE3
          3FF843246F881A749E2DBDFB1E8F752A5BBDEC9751F9BE5E8F7314A93AC6919B
          668D7ED2113109F2B8AF037ED69E0AD2BF632FB147E3AB7D5BC6167E06D2CCFA
          96B1E277905C6BDAA417423B296F7ED4278671716F2B499922FB3C455C3C4919
          68FE9F87F685F85973F63F2BE25F83E5FB6594FA95B6CD7AD4F9F6B0F9BE74E9
          893E68A3FB3CFB9C7CABE4C992363635740F8B1E07F15F85752F13E89E32F0FE
          B3E1BD37CCFB76B1A7EA904F676BE5A0924F36647289B5183B6E230A413C1A00
          F955BE3B6977DF03B4DF0D6B7F11B4FD03C49E17F133F8675BD37C43E2E6D36E
          AE9228EF1ACA0D475AB1698DA5CBDBC10DCCB710B1492E2D67B5254BC91A1E24
          F887FD93F0CFE1A4977F157FB22FF50FEDCBF865F1AF8CFF00B11753B94BD4DB
          A8DBEAB0D9182EADA232936B6925B0B7B9B5BB8646876C023AFA83C49F1BFE1D
          783B4AD1753D7FC7DE17D0F4DD6E1FB4E9779A96B36D6F0DFC5B51BCC81DDC09
          576C919DCA48C3A9EE2B57C6BF10BC2BF0D74A8B53F17789747F0AE9B2CC2DA3
          BCD6EFE2B385E52ACC230F23282C551CEDCE70A4F63401F2AFC51F127C3ED14F
          ECF36BE27F895E28F075C5F436B0EAD63E26F1E5DE87AAB696347D4248E6D4A1
          86EA2559CDE4702C93ED0CD2AF97BC8F96AD78B63D43C61FB79AF86FC3FE29D4
          1AC34EB2D0F5AD7ACAC7C757904BA67967517709A589BC89229CC3A4453AB21D
          B1DD2308F75C99E3FA83C4FF0010BC2BE09B9B4B7F11789747D02E2EE1B9B9B7
          8B54BF8AD9A68ADE3F36E2440EC0B2C51FCEEC3845E5B039AE82803E5FF02789
          3E1F5CFED9BE30D22C7E255C6A3A95BE99673597875BC79777508D51E7D5D752
          856C1AE9A32D1C515B9683CB2B00546548FAD657C15F89FF000FBC23E0DB2F88
          9E30F8A1AC2F8B34CF090B9F1EE9B7DE20BBBDB1D335094DA9B85B9B266922B0
          BB5B8592286D635858EFB88E385FCB2B1FD6B45007C2BF0B3E3AEA937C09D63C
          19AE7893FB3FC5FA65EE83A9DFC49E255D4EFE0F0D6A1756126A3786FE3BAB86
          5B68D6E75111CFE709ADECD6CE5919199267FA2BF66FD661D5F4FF001BA68FAE
          5C7897C1369E20107867579B5393545B9B23A7D949318EFA4791EE956F64BD4D
          ED23EC64688102208BEC145007CBFF00B40F89BC25A5FED25E0BD3B5DF88FAC7
          846E27F096AB751E9FA3F892E609A5BD8EF2C174E78B4E8DD92EE76325FAC70B
          4137DA0A3218E611845E7FE33F8C340B6D5BE029F8ADE3BFF8573E33D57C91E2
          ED0F4EF1F5DE8B6F040748D465726282F554443508E28D6E324B1448FCC61C1F
          B028A00F8FFC5DA04B77F1DBC41F0BC7897C609AAF897C4DA4F8AE19F4EF16EA
          8BFD95A00B5B86B8458D2E15A38A4BBB0BDB6709B628FF00B56C58333C70C298
          1F0F7C77A75E7EDE9E21D017C7F7171A6C3E20D462B0D3A1F1DDE5F4B35EAE8F
          65249632694D2BC51DA23C9AB4BE684F92E2D561DD0794914FF6FD1401F007C2
          EF8A5AE47E10F88F7DF0FBC4DE20D6244B2F1BD8689797FAFBF89535BD56D6ED
          E5D163D38493DD6D961B2590985C42F729224AB1DD246D2C5D078F3C7BE0AD3B
          E11FED0971E04F16F8E2E742D3BC24B35B78D9BE203EA3A2C5AA4692BDAC3637
          A75092E63BB79A6892483E55611401936CD1F9FF006FD1401F9C1378F9AEFC25
          F0E6E3C2FF0013AE25F1B1F8A77EABA058FC49BAD4B4FD4E2B6B17B8834782F6
          E6E317305DAC3A421965DE229F53906C88BB5A8E806AFE14D47F662F09FC477F
          8B3E30D3341BEF8813D8E9F7B7BE3BD4EC92FB4DB8F14C56F992496E1663E569
          76720552E3CB46B99597CCDD22FDFF0045007C15FB62EB7A77C28F16FC33F0CC
          DF14758D32DEDBC252DBEB77D7BF10AF34BD496CA1BED3611AA2430488B79A80
          81F5374564FDFB4721D93981206FBD68A2803E35FD9CBE24E8D6F241A87863E2
          25C78AF4D83C41E251E2F9756F15CFACD9693A0DB5D6A3FD9D7AF3DC4F20B56D
          B159247875FB4432CF2B24DE4F9D06AFECA7FB4458F8ABE25F89345BFF0010DB
          BD8F8D66BAF13F8323BBD756FA5D46D45DDD432FD9236B8965B6816DE0B293EC
          D32C2E970DA9048D6381A387EB5A2800A28A2800A28A2800A28A2803C6BF680F
          F91E3E02FF00D8F87FF4C9AB57CC9F1D3C2BFB43789BE20E837BF0D7C41E12F0
          EF86345956E7ECBA9DCDCB4BAAC850ABADD2A5B90210199446AF9CFEF370711F
          95F437ED55A24FE23D5BE0AE976DAB5EE853DDF8DDA25D474E282E20CE89AB7C
          C85D5803DB38C8CF041C11C07FC291B6FF00A2ADF113FEFBB4FF00E22B29EE5C
          7639CF88D25DCBE3BF844FA8410DB5FB5C5E9B882DA633451C9F609372A48C88
          5D41C80C55491CED1D2BB4AF37F18781A0F077C4BF86CC9E2CF13789E4B8BDBD
          006BB2405210B6536760440727239DC07CBD0E411E91550D852DC4D37AF887FE
          E19FFB7F4B49A6F5F10FFDC33FF6FE96AC9327C59FF22AEB3FF5E537FE806BA2
          FD88FF00E4DD349FFB0D6BFF00FA79BDAE77C59FF22AEB3FF5E537FE806BA2FD
          88FF00E4DD349FFB0D6BFF00FA79BDAFCFF8DBFE45D0FF001AFF00D2647561FE
          365FD5BFE4B1FC58FF00B13FC2BFFA72D6AB12B6F56FF92C7F163FEC4FF0AFFE
          9CB5AAC4AFA0E1FF00F915D0FF0009955F8D8967FF0023168FFF006FBFFA6EBA
          A5A4B3FF00918B47FF00B7DFFD375D52D7D01905799D97853E20FC50F81BA3F8
          43C23A66B1A769B1F883C63AB5CF8AAC4DA4F1A5D26A9ABC76B6A96D25FDAC86
          712BA5CC53EE0905CDBD9BF3F3BC1E99567E097C58D27E107ECF9A3EA5AD4171
          2D8DFF008EBC41A6BCD6F2DBA0B457D7352792EA5F3658C98218E392595A3DED
          1C51C9295F2E3919402A7C45F077C46F8FDE2AF0241A9782350F0068BAC78335
          DF0FF8C26BA974FD4BFB3D2FDED0496D03C57C8DE695B172972219917CE80BC2
          499561B5F13FC05F107C51FB40F88B53B1F0BDC4BE09834CF0CDC3B192D126D6
          6EB49D527D4561B498DDE6DD835C20C5C5BEC98C524665B5052E0FA07C40FDA4
          2D3E1DEABF10AD2F3C11E28D42DFC13E1F83C4D7F7D6274F30CF652348018049
          768E5945B5E12AE89C5AC98C97844B52F3F6997D3FE23E97E0CB9F855F1022BF
          BFF24FDAC5A58BDBC48C6C1679495BB2F2456EFA9DB24D2448E8A5662ACEB0C8
          CA01C0783FC0DE3E83F6C2D7BC537FE0EF107FC2197DAD5E496C750BBD24E996
          7FF128B0B48F558963B87BAFB4BB584D6CA8D1F105F16CC27CF8E5B5FB3F781F
          C51E0CD5575DBAF86FAC68D6FA578486936FA4EBB2E8577A95A2C4D1BDAE93A4
          DFDA32BCB68A167566D4245666168E082676AF55D1BE3BE93AD78CADB454D1B5
          8B7D36FB53BCD0F4DF11CCB6FF0061D4351B413FDA6D634598DC2347F63BC1BE
          58638DBECCDB5DB7C5E6741F157E215BFC26F871E23F19DE697A86B361A0D949
          A85DDA697E49B83046374AE82692343B1033905C1210850CC42900F883C2BF00
          7E221FD9A354F879E31F85BE28F153DF4DE0EB6BB179AAE8B1DCBE9D62D6C6F7
          4E81E1BD402D215B29DA162F1C8D26A6D940C26B87F4A9FE127C46D63F67BF8F
          FA778AFC23FF0009378FB5ABDBDB5D0674934F5975273A0DA68C9AB266448AD3
          CF09712B45B95E38E592301F80FED7ADFED09A7F86FE1C78C3C51A9F85FC4167
          A8F846CBFB4B59F0A482CFFB52DED70CE275FF0048FB3CB118E395C3C7332B79
          32C6099A27897A0F855F1397E29E95ABDE2F87358F0D3E99A9CDA54B6FAC1B57
          324B12A798D1496B3CD148AAECD131590959619A360AD1B0001E29FB46782BC7
          3F123C3DE1EF09F823C21AC782F4D9A1BDF125FEAD66BA749F65D464B7B968ED
          1AD9751B7DD77F699CDD2DCAC8D1C5790DAC9B9F2F2C395A9E89F133E2F7887C
          669A9FC29D63C0771E30F0968BA226B17FAB697730787F50B4B8D46792F636B7
          BA79A4681EF2192D99224679A14DC6D87EF53DD7E2FF00C5B7F845A76997EDE0
          EF1078AAD2FAF6DF4F32684F623ECF3DC5C436D6C920B9BA84FEF659D1414DC1
          70C5CA0C13E7FE32FDB1B47F00F8ABC4BE1BD67C07E30B7D6B40F067FC277756
          C834D7DFA6ABC71CFB185EED32C2CD28652467ECF279664063F300395F1CD8FC
          5ABAFDA093E21E99E06F105C68BE1BBDB5D1ED3C3F15E69A1F59B068EF16EAF6
          2B86D4516DE266B88A47B59212D3BE9FA612D190FF0066FAAABC5353FDA762D1
          BE23E9FE0BBDF875E308353BBFEC9DD287D2E4487FB40CC23CA25F1964F28DAD
          E19BCA493625A4D2F312891B5B40FDA134FD67E266A5E0CBBF0BF883429AD75A
          93C3D0EABA80B36B3BCBF5B21A82C317937124A37D99370AD2468BB41462B2E2
          3201E7FF00B3F7C3EF19E873EBDE36F17787F50B0BFD32F7C51FF08F785238EC
          96F25B5D4F541A93F9B7097D34134AE62B78D32D6EB1B0995FCC5292D7957C2D
          F83DF14BC3BFB267C57F04EB1E05F106A1E2BD53C1965A069736A97FA3FDA247
          3A59B0361034373E5AD8DACAAF708F2B46EC2F66FDDBCA1DE7FA7F48FDA07C2B
          7FA57C45D4AF9AE345B3F024D743567BA314C5AD6DD5CBDEC2B6F24A5E02D0DC
          46380E25B5B889916489D01A6FC67B97D2BC5F7DAFFC3FF1478313C37A62EAB2
          1D7E5D36386F222B392B0DCC77925B864FB3B6F12CB1841246CC555C3500715A
          CDCFC46F1A5D685E2EBFF875A869F1F847C66DA869FE1AFB5E9FFDAD7DA6BE87
          35997DC2F1ED7CD1777D3361A78FF730E705F0AFE81F02FC2DAA784BE1FB5BEB
          16BF61BFBFD6B59D69ACDA4577B64BED4EEAF63864642C86544B8447D8CC9BD5
          B6BBAE18D47F8EFA4CBE01F0AF8934FD1B58D52FBC4D30B2D3BC356EB6F1EA46
          F5629A5B8B3944B32430CF6E96D75E6A492AED6B7923C9936A3757E03F1AD8FC
          41F0CC1AD5845716C8D35C5A4F6976AA26B5BAB79DEDEE607DACC85A39A29632
          C8CC8C50946752AC403CD3E3A5CF8AFF00E1607C30B8D07E1D7883C5B61E1DD6
          A4D6AF6F34BBBD3224D8FA66A3642145BABC85CCA1EEA273F284D84E1CB0DB5E
          17F117E00EBBAFFC50F1DF8F53E16F8A2FF5DFF858DE1AD734B16FAAE9490DF5
          969A9671FDAB6BDEA9568E3835548D1CA6E1AA445D199035AFD3FF00123E30DB
          FC34BCB74BAF0CF88356B0FDC1BDD534E821FB3D909A6F26107CD9637B995DF2
          AB6F68B3CE4EC5F2F74D0AC96F53F89CB178C93C39A3787358F155C413430EAF
          79A49B55B6D14CA1593ED2F3CF1166F2D84A62804B2AC65199009A1F3003CABC
          05F0C7C5BAE7ED07E37F11F88F4EB8F0F784EC3C5ABE22F0FC32C36CF36A571F
          D871E8ED319E2BB94AC1E5ACEC207822933240FE67FAC856A7C19F0378CFC1DF
          F0AF7FB53C1DA841FF000AD3E1FDDF8524DB7764FF00F0905D37F666C7D3F171
          C44DFD9927377F666FDFC3951FBCF2FD823F8BDE1DB8F8B8BF0E2DA4B8BAF10A
          E9971AA5C3C30936D6AB0BDAAB4324BD04E56F6DE4F28659637577082488C878
          A3E2F7877C1DAAF886D35492E20B7F0E787DBC4DAD5F2C25E1B0B2DD288CB01F
          3BB482DAECAAC48F816CFBB616884801E15FB327C2CF19F813C09A5C9F113C15
          FDB1AADBF83346D322D3AD4590FB3C9A2CB33DA5AB46F752C6F72D2DC79D15DA
          CCB1B6D5DF1D93C43CEA961F0E3C7367FB2E7C2DF86FA77C3CB8D175DD4E1D23
          4FF17DF49FD9D716F64B631DAC32BDF4297B19BF82E63B48EDDA38E42C6D5DC3
          6191607F6093F684D3F4AF0AF8EF56F10F85FC41E17BFF0006E8C7C43A8E85A8
          0B39AF1EC365C347344D6F712C0DE61B4BA45532AB0688EE0AAC8CDDAF82BC4D
          A8F8AB4A96EF53F09EB1E0EB8498C4B63ADCB6724D2285522406D2E274DA4B11
          82E1B2A72A060900F97FC2D61F14AF2F3E1FDB78A3E0D7883C43FD8DE0CD5FC1
          DA95DF89758D1E5B7D59EE66D3562BABC22F6790452C56324970A239DD0CC551
          6E71B9B5BC75F05BC77A6F857C53E15B6B7D43C7F77E2FF867A77805BC50D730
          45F67BDB74D46392FF00501713897CA90EA31C9983ED327EEE6CA9213CCFAAA8
          A00F97FE27F80BE20F8A3F681F116A763E17B897C130699E19B876325A24DACD
          D693AA4FA8AC36931BBCDBB06B8418B8B7D9318A48CCB6A0A5C1FA5756BD9B4E
          D2AF2EEDEC2E354B88217963B1B468D66B965524468647440CC46017755C9196
          032479AEBBFB4269FE1AF8A777E0BD4BC2FE20B686D7FB2FCEF11E2CDB4E5FED
          19DEDAC7E55B83707CCBA8DEDF883E561B9F6C44494681FB4269FACFC4CD4BC1
          977E17F1068535AEB52787A1D5750166D67797EB643505862F26E24946FB326E
          15A48D176828C565C46403E6AFD9EBE177C5AF803A7783FECFF0BB50D5AC3C31
          F0FEFE1B2D1BFB634D8651ACDE5C697F69B0F30DC38F29EE2C2EEFFED2CCC047
          7DE52C61A1589BD83F64BF0A7C41F85F1EAFE10F17699AC6A3A6C90DA6AD6DE2
          ABE369046F74F6B6F1DD5ABDB477F75209CCA8F732CFB8A4F737178FC7C8F3F5
          5A27ED41E15D474AB9D6752D3F58F0DF878F87EE7C59A6EB1A9431490EADA3DB
          AC4F35EC096F2CB2A2AA5C5B37973C714A44EA0464AC810D5FF687B9F0CF837C
          71E23F107C2DF1C6836FE12D323D62E6DEED74D76BCB5266F35ADA48AF5E1768
          520779236915C294C2B19103001F1E13C4A9E2BF851A9F87FC13AC78C6DF42F1
          05CEABA82E9173610B4311D2AFACD57177730066692F5080A48DB1C84907607D
          5F875A1EB3F093E1DF877439747B8D7EE25D4E647B5D0E683ECDA1DADC5CCD34
          7121B89212D69671BC76E9E5A6F31C51EC8147C8995A67ED2169A97879EF4782
          3C5106B1278826F0CD8F87DCE9ED73A8DEC36ED71388274BB6B42B1A45721D9A
          E176C96B3C47F7AA2336DFF687D2CE9DA15C43E14F184B77AB7F685CC7A4BE8C
          D6FA8C3A7D95C2C1717EF6B3324A62065B7758515AE645B88F640C77AA8064FC
          74B9F15FFC2C0F86171A0FC3AF1078B6C3C3BAD49AD5EDE69777A6449B1F4CD4
          6C8428B75790B9943DD44E7E509B09C3961B6BD57FB66F3FE12AFEC9FEC2D43E
          C1F62FB57F6EF996FF0063F337EDFB36DF37CFF371F3E7CAF2F6FF001EEF96BC
          D75BFDA5F49D074AB6D42E7C29E285B787C3F6DE28F102496D6F04DE19D3A759
          5965BE8A59D1CB28B6BADD15B2CF229B670532D187F60A002BE3FF0002FECE9E
          33F147C33F8E5FDBB0EA1A1EBDE32B2F11691E1FD13C4ED65245A2C77F7BA8DD
          19219ACA49B6C571F6DB3F395B749E6597592348027D2BA2FC42B7D67E23F8A3
          C1874BD42CAFF41B2B0D41AEEE3C936F7905D9B858DE129233FCAF693A309110
          E53203290C78AD13F697D275ED2AE750B6F0A78A1ADE6F0FDCF8A3C3E91DB5BC
          F3789B4E81626696C628A7770CC2E6D76C572B048C6E5004CAC81003CFFE2678
          4FC73F117C1BF1DF5AB4F006B1A76A5E2CF035B783F4AF0E5FDEE9C2FA5B843A
          9EEB8678EE9EDD20FF00899C67266127EE66FDDFFABF332B5FF057C54D4BC3DA
          AF86E5F085C5CEA5E3FF0010699ADEBFE25856C4695616E96F6514B6B73A63EA
          225914A58476D716D1DC4F1C914D34A93BEF16ABED5E13F8CF73E27D57C57A34
          FF000FFC51A0F88740D32D7553A3EA52E9AD35F4570D7490AC0F05E4916E67B2
          99712C91807692403906A7F1DF49B0FD9E53E30C1A36B1A8F879BC3F0F898E9F
          6CB6E2F96C9E159D89592658F747131765121CEC60BBCED0403E6B9BE1278C3E
          2CDCFC2EB2F895F0ABC71776FE0DF096B9A25E6B126B7A435CEAD2CD1DA421D8
          8D41DB75F59DB5DC328624C525F0DB36505D27D29FB34687ACF857F679F86FA0
          788B47B8D035DD17C3F65A55ED85CCD04AD1CB6F0AC2CC1E1924465631EF521B
          3B5977056CA8F4BAF34F88FF001DF49F86DAAEA16973A36B1AB5BE8DA626B9E2
          0BED356DFC9D134E76982DD4E259A379548B5BA3B2D9269316ED94CB461C038A
          F115CFC46D0BF689F10EA9E1BF875A86A7A56AF65E17D146BD3DDE9E2CA382DF
          50BC975198C66F12E3E4B6BF611E2224CB11F90A60BF2BE06B1F8B56BFB413FC
          43D4FC0DE20B7D17C497B75A3DDF87E5BCD34BE8D60B1D9ADADECB70BA8BADC4
          4AD6F2C896B1C21A07D435321A4253ED3EBFACFC77D2745F195CE8AFA36B171A
          6D8EA767A1EA5E23856DFEC3A7EA37620FB35AC88D30B87693ED96637C50C91A
          FDA5773AEC97CBB7A37C5B7F107C4CD77C2361E0EF105C5A6877ABA7EA1E25DF
          62BA7413B5943781369BA172DFBBB98572B011B9F19C02C003CD7E057C3AF16F
          81249EEF5FF0EDC4B63E03F0FCBE0FF0758C5736CD7B7D6515D4A4DC02251116
          BBB5B5D10133BC7B66B79F11DBC6D993CABC0DF0F3E347C3EF80DFD9B2F82F58
          BCF1B6B7E06D2FC151DD786AFB4FB19BC391597DAA1134824BFC4B3A2DE4B711
          4D05C013954478AC4A177F7FF097ED2169AD6AB6769E24F0478A3E1B5BDDF87E
          EFC4D15F78C4E9F6D0AD95B35B0B83288AEE57B76417909659923DA37E70548A
          E834EF8C36EDA16AFAF6BBE19F10783F41B3F24DA5F6B70421F5412B14885BDA
          C32C9742576312ADBCD0C73B3CD1C62332128A01F3FE87A47C52F064BE00D0AE
          3E15F883C4761E05F19EA5A943AB68F73A3DA5ADE69B358EA50C31DA5A4DA997
          B68A17BF486281DCEDB7B7439463E4A76DA37C3AF16FC21D43C01AEC1E1DB8F1
          92691A678834C9B42F0D5CDB2B69CBA8EA167796D6F6E6F25B68DAD2D22B4368
          A4146DAB06D8154B2C5ED5E0AF136A3E2AD2A5BBD4FC27AC783AE126312D8EB7
          2D9C9348A1548901B4B89D3692C460B86CA9CA818278A1FB4269FA9685E13BFF
          000EF85FC41E2BBBF14D94FABE93A5E9C2CE1B8B8D3226897EDE4DCDC431244C
          2E6D1951A41362E5331295944601E15AE7C05F1868FE0DF08782ADBC1771AF5F
          59F81B41D02FF548E5D22FBC33AADDD899BCAB7D52D3505FB48B48263E779B66
          82674BA9300490C58FB2ABCAB56FDA134FFF008A23FE114F0BF883E207FC261A
          34DE21D33FB0859DBFFA047F64CCD27DBAE2DB6EEFB75BE1796E5B2060D7AAD0
          014579FC3F186DFF00E13BB3F0EDEF867C41A45A6A37B3E99A5EBDA8410C767A
          8DE4314B2C90C51F9A6E57F776D72CB2CB0A44EB016491849099357C0FF10ADF
          C73A8F8BEC23D2F50D2AEFC31AD368B771EA1E4FEF9FECF05CA4D118A4706278
          AEA165DDB5C648645208A00EAE8A28A0028A28A0028A28A0028A28A0028A28A0
          028A28A0028A28A0028A28A0028A28A0028A28A00F1AFDA03FE478F80BFF0063
          E1FF00D326AD58D537ED51A2CBE21D4FE0DE9F0EAB7DA249378C66C6A1A6322D
          C418D07576DC8CE8CA0F1D4818193B93EF2F2CDFB3811BBFE2E778F9719EBA85
          AF1F7BD6D874C77C7DC39DBF3F9594D5D9A45D8E37E2C7FC94CF859FF5FBA87F
          E91495D5D41A8FECF965A05E58F88AE7C61E29D76EF4891A4B5B7D5EEADE4895
          A45785B20408DF75DBA10729CAF0EB1CF551D15897B89A6F5F10FF00DC33FF00
          6FE96934DEBE21FF00B867FEDFD2D59264F8B3FE455D67FEBCA6FF00D00D745F
          B11FFC9BA693FF0061AD7FFF004F37B5CEF8B3FE455D67FEBCA6FF00D00D745F
          B11FFC9BA693FF0061AD7FFF004F37B5F9FF001B7FC8BA1FE35FFA4C8EAC3FC6
          CBFAB7FC963F8B1FF627F857FF004E5AD56256DEADFF00258FE2C7FD89FE15FF
          00D396B55895F41C3FFF0022BA1FE132ABF1B12CFF00E462D1FF00EDF7FF004D
          D754B4967FF23168FF00F6FBFF00A6EBAA5AFA0320AE4BE1E7ECF9A87C7CF845
          A65A6A5E20D3E2F0659EB5E3207419AC2F04B35FCDAB6AB6EB72D776B7D6F279
          4B14CF1B5B8F9648E6B85724BC6D0F5B5DF7EC7BFF0024447FD8CDE26FFD3F5F
          D0064EB5FB3978BFC53A15F59EB9F10F4FD46FFC4DE198BC23E30D4BFE11C313
          EA565135DEC96CD12E8259DC94BFB90EEE278CBF96CB0A2A98DBD035AF879AE6
          A5F1C7C2FE38835ED3EDF45D1F46BFD225D1A4D2DE4B8B8FB5C96F2BC8B742E1
          5530D656B8530B70250492EA63F40A2803C7F40F80F7DA3F8CB4AB997C476F73
          E13D13C41A9F8A74AD2D34D68EF9350BF17BE789EECCC525801D4AF36469046C
          3F71991BCB7F37ABF8D7E01BEF8ABF08FC5FE0BD3F56B7D0AE3C43A64FA536A3
          7364D78B0453A18E56112CB1166F2D9C29DE0062A48600A9ED68A00F14F16FC0
          3D73C6BF0E3E22E9DA978B34F6F1C78E3461E1EBEF1045A2BAD95AD828991218
          2CBED5B86D5BABA70CF3BB19676624C6B1C09D07C02F84D7DF063C1B7BE1EB9D
          4B47BBB16D4EE2FAC2C740D19B4AB1D362988924B786169E76DA676B89B99085
          F3F62048D1147A5D1401E69F1CBE1C78ABE27E8BA4E99E1DF13E8FE1BB7B5D4E
          CB55B86D5343975269A5B3BCB7BCB75429776E117CCB7C3821CB2BE14A1193E5
          5F19FF00645F157C6CB9F155D6A7F10B47D32FB59F0FD868D6F7561E1897758C
          B0C7790DC4EA1EF995D678356D561F2D9731ADC42CAFE641BE4FA828A00F1F93
          F67D8754FDA5DBE2D6B571A3EA6F65A65BE9FA1DB2E932457DA6346B74AEE2F3
          ED0448B2AEA1761E3308538B73F7A1DCFCFC1FB367892CBE2678CBC7F6DE37D3
          FF00E122D535A8F56D222B9D1EE67D3B4F02C96C1926B46BFF002E594DB47181
          7307D9A70DE602ED048D6F5F4051401F2FF863F636D5B49B6D7AC351F1E5BDE6
          9BE31F0FDFE8BE3536BA4DC4773AC4D7325DC9F6CB769AF668AC191EF2793C98
          61F25A4B8B9631FCF12C1DAF8EFE11FC4BF889F0E35EF0D6ADF11BC3FE76B7E5
          D95E083C252258369B871716E21FB799C4B701CC724DF69F963502248A5CCC7D
          AE8A00F9FF0042FD9B3C49E16B316DA5F8DF4F58745F134FE25F09437DA3DCDE
          0D35EE21BB86EA2BD925BF33DFF982FAE25F30CB1389E466C98B6C0BEABF0C7C
          0BFF000AEBC211E90F7DFDA5772DEDEEA97974B1792925D5E5DCD7770638F731
          8E2F3679362167654DA19DC82C795FDA5BC7FE24F861F0CE3F10F862E74FB7BB
          8F5AD2EC6E3FB4345B9D5B741777B0DA318ADEDA68A57954DC2C8AAA58BF9650
          2E5C32EAFC01F18EB9F113E0D784FC57E217D3E4BFD76C86A913E996AF6D135A
          CC4C9685A1796531CBF67687CC412C8AB26F0AEEA03100CAF885F0D3C71E22F8
          8FA5F89FC3FE2FF0FD85A69965E559697E21F0E4FA9A5A5D319566BC88C57D6C
          04B24522C3975764459046C827983F3FACFECB763A87C6DB9F8816975A3D95C5
          F6A767ABDE5FFF0061AB6BF1CB6F0C108B7B5D4C4AA60B4963B58D2580C32174
          9AED77A898797D07C59F18F8E340F15681A6F849FC3F3CD7D868746BDB59EE6F
          353DAE3ED0C6449634D3EDA043117BB65B9CB5C2A2C265F262B9E7F59F8F7777
          9F1B6E7C19A75FDBF86B4DD0F53B3D3352BED67C31A85EC1A8DC5C4305C2DBC3
          7D13C56966C52E608E3334924924D385100DB19B80034FFD96EDBC39FB4368BF
          11FC3FAEDC69BA45A43AB1BBF0ECD75A95CADC5D6A1379F733465AFBC8854CAA
          8FE4ADB142DB9882E21687A0D37E0A7F6E7C2CF1E7877C5D759D57E20FDBE4F1
          0DD69327FAAFB5402D522819D029FB3DA25BDBACA624F33ECE2578C3C8E2B274
          6F89DE2CBBFDA1F5DF0A6AD7DA7E83E1BB6BD5B7D22CEF7C2B7E92EB719D361B
          866B7D59A75B4695667B9CC0913C9E5DA4A7002B3ADBF1DFC6FBEF0AC7F16359
          B1D32DF52F0F7C38F0FCD797C8CED1CD7DAA2DAFDB7EC8AE7FD52C76DF67667F
          2E45737E814A9B7911C008FE0AF88B56B6F1A5FF00893C53A3EA5E27F1269967
          A33CB67E1C11E95F62B592E658E09EC6E2E2E0CCB2B5E5CC737EF937C4EAA9E4
          BAF9A7A0F829F0AFFE151F856EB4AFB4E9EFF6ABD7BDFB1687A6FF0066693639
          48D3CAB2B3F325FB3C47CBF35D7CC6DD34D3C991E66D5E2B51F899F117C2BA57
          C59D12E21D1FC63E36F0BF84A2F12E8F2689A3DCDAC37D2CEBA8241666CCDCCF
          23B0974EFBC9282E270A150A6E7ED7E0A78BB50F19F856EAEF55F1069FAF5FC3
          7AF0482CBC3979A04B67848D8437165793CB3C72E18480BECDD1CB1305DACAEE
          01ABE3AF84FE07F8A1F61FF84CBC1BE1FF0016FD877FD93FB774B82F7ECFBF6E
          FF002FCD46DBBB626718CED5CF415D0693A4D8E81A559E99A659DBE9DA6D9429
          6D6B676912C50C11228548D11400AAAA000A0000000573FE3AF897A47C3BFB0F
          F6AD9F882EFED9BFCBFEC2F0E6A3ABEDD9B73E67D8E097CBFBC31BF6EEC3633B
          5B1D0693A9C3AD69567A85BA5C476F770A4F1A5DDB496D32AB28601E29155E36
          C1E51D4329C8201045007955D7C016D73F686BEF88FAF6B16FAA69074CB0B1B0
          F0EA5BDD42B0CB6934B3C3713917660BA6596E6674F32DB3132C0D19478D9A4C
          AD0BF670D5B4CF8C3E26F88775E2FB7BBD4352F1041AC5958AE9D702D2D215B4
          4B19626824BB92269DAD63455BC8520995F7EE3240ED6C72BC71F1E3C55E0EFD
          A49BC12BA9F85EFB4D9A1D06E74FF0C8B19535CBF8AFAF2E2D2EE48A5FB510EB
          66B6CD79232DB11E5655BCBDBE751E13F8F1E2AB9FDA43C41F0FB50D4FC2FAD5
          BD9F881F4B5D1B49B196DF55D3F4F6D263D462D4EE59AEA50D009244B127C98D
          5A591183A92212016B49FD94BCDF0A9F0A788FC53FDA3E1BD3FC197DE01D1134
          BD3FEC7796FA55D25BC72B5CCCF2CC9717212CADB6C8914281BCD26221D563E8
          3C63F09FC7BF10FE11F8F7C25E20F1F68EFA9789F4C93468EEAC3C34F058D85B
          C88F1CCEB6ED78F2C93BA4AE3735C796364244436C9E6F9FE9BFB5078AB45F00
          C1E36D7F4FD1F56D375CF873A97C47D2F4AD36196CA6D3E2B48ACE6FB04F70F2
          CC2E59D6FE35F3D628429819BCA3E6058FABF887E24F8C3F0AFE11FC51F14EA7
          AE781F59B8D03C3EDACE8D35A787EF2D55A5B749E5BA82E6DDAFA42CAD1C70AC
          7224CA559DCB230401C032B4CFD983C45A4FC237F01C1E21F03BE8EFE209B553
          A15CF80C4FA07D8A44676B016325EB38517AE6F15C4FF23858D556255416BC45
          FB32EA9AA7813C23E148B58F07EAFA2E8FF6C9AE747F19782D759D31E79A5124
          2D696E6EA26B38AD55A7B78221238482558C9631AB565786BE36FC48D6FE0D4D
          E2A48F4FBFF3FC4D77A545ABD9783B53F374FB0B6325BC97171A1ADC3DDC92B5
          EDB49008A39432473C5348A9E54D10B77FF1CBE2141F0EFC29E228B49D1EE9F5
          09B5196FE6D0F4AD5F59821686E4ADB694D0C100BCB79DE3F3126BB92D8ADB4D
          692A3DB169238C006AF8B7F668BED6B4ABCD234FF1ADC7F66EBBE12B4F057896
          E75FB46D4752D434FB75B9559A1B9134422BB75BEBA2F3491CEACC636F286D61
          27BAD7CD5E28F8F9E38D1FC2BAA6AF6775E0FBEFF843BE1FD878E75E92C209EF
          6CF5FF003D2F59E0D3A713A7D9A23FD9D2EC9E45B8DCB731931FEEC893E95A00
          F2AF0FFC34F1C697F1C75CF1C5E78BFC3F77A2EAD656DA5C9A341E1C9E1B84B5
          B692F65B502E8DF3AF9A1AF9BCC730ED70802A46493553E137C07BEF875AAF86
          A4D43C476FAC69BE10F0FC9E16F0D5BDB69AD6B345A7BB5A6E37B219A41733ED
          B0B50248D205CF9C7CB3BD447D07873C63AE5DFC71F1C784AFDF4F9745D3746D
          1B57D35ADED5E2B88FED525FC32C733995965C3588756548F024DA4315DC7CD7
          C03F19BE22F8DB4AF0FC902F85E4D4BC7DE06BCF18785EDE4B3B9B787489635B
          1F26D2FA413486ED4B6A50869A24B7205BB9119F3408C03D2B49F879AE785B42
          F16BE87AF69EBE2FF10EB536AF36B3AA696F716FF33245046F6B1DC45BBCAB28
          2DAD832489B8C22560599C379FFF00C33D78E3FE1963FE14D7FC279E1FFF0090
          37FC231FDB7FF08B4FFF0020AFB0FD976F93FDA1FF001F3FC7E76FD9DBC9EF5D
          07C3AF127C45D6FC4DF123C3DAAEB9E17D51F4186CED2CB5BD37C3F73670DBEA
          92C124F2C13DB497D2BCCB1C32E9D36E492356172C81B7236CCAD4FE3378AA5F
          D8993E2DE9EBA3DAF8B0781A1F1634173672CD6265164B772C2235991C2B00E8
          A7CC25772B1DFB4AB007A55AE9BE384D0B448AE3C43E1F975A86F564D56F22D0
          674B7BBB5DCC5A282137A5A094A94025792650558F9643055E2BE2CFC07BEF88
          BAAF8964D3FC476FA3E9BE2FF0FC7E16F12DBDCE9AD7534BA7A35DED365209A3
          16D3EDBFBA06491275CF927CB1B1849EC15E15F1ABE3378ABC13AAF8E64D0174
          78F4DF00F84A1F186A96FA959CB7136AF148D7FF00E8904893462D182E9B20F3
          992E01370A7CB1E5112006AEBFF01EFB58F196AB731788EDEDBC27ADF8834CF1
          4EABA5BE9AD25F3EA1602CBC8105D898245013A6D9EF8DE0918FEFF122F989E5
          1A67C049AD3E36BF8FA7D5347DEB34D38B9D3FC3F1D9EB57AAF0B44B697FA847
          262EED225706384C08C0DB59B348ED0B34995E25F8CDE2AD33C65E20B9B45D1C
          784FC39E2DD1BC1F79A5CD672BDF5ECBA80D371771DD898242B19D5A3FDC9824
          2FF666FDE279A3CAB5A37C4EF165DFED0FAEF85356BED3F41F0DDB5EADBE9167
          7BE15BF4975B8CE9B0DC335BEACD3ADA34AB33DCE60489E4F2ED25380159D403
          A0F107C10B1F18C7F1522D7753B8B84F1DE98BA03CB688B0CD61A5ADABC4B6E8
          4EE47659AE6FE712B26ECDD0421962415C0587EC8162DF0EFC57E19D426F0BDB
          5BEB7369D72BA4786FC2CBA6F87925B1B91751493698D712899A691523B96F35
          0CD0430C63CB318725B7C5EF88BF0CF55D7A4F8957FE17F10E9BE1AF035C78B3
          C456FE0ED12E6D26D3A50DFE8F0C525CDEB8BA5996DB530A764441B542FE5F98
          A0EAF81FE20FC42F88FE19F111D1B5DF0BDA78B126B07B7D2359F09EAFA71D1E
          DE49FF007ED347752C33DF298966586758AD63965B77076FCEB100165FB3ADF6
          99F08EFF00E1F417FA3C7A4788B53075DB5D274F6D334CB4D2D9116EECB4EB10
          F29816E6384C6F89832C97B7572AE1C2C47B5F887F0F35CD77C55A0F8AFC29AF
          69FA1789349B2BDD2D5F58D2DF52B392D6E9EDA4981863B8B771287B2B7DAFE6
          ED0BE6028C595939FF0086FF0015756B5F00FC41F147C42D5747B8D0BC2FA9EA
          1126BFA269571670CF656312ADE486D5E7B8943457515FC380C778B70C8A55D4
          B54B8F1CFC4BD46F3C05E1644F0FF847C67E20D1B51F10EA0DA8D849AA5BE9A9
          6F359A7F6788E2BB87CD957FB46356B91284636CECB10132888032BC5BFB275B
          EB3E15F03F85F4DD674F8F45F0B68D06876579ADE830DFEB1A6A448B18BDD2EF
          91E16B1BE2A884CC56540F05BBA44851C49E97A9FC10F875AD78C93C5DA87807
          C2F7FE2C49A1B95D7AE746B692F96588288A413B2170C81102B672BB5718C0AF
          1FF127ED0FE2CD4FC2BF087C4FA3FF0067F82BC37E30F0CC9AFEABAC6ADE1ABF
          F1059E9123258C90C33CD6B35BA5B45B2E6E9DAE672B185B624EC19C7B06A7F1
          7B42D27C649E189EC3C50FA93CD0C027B6F09EAB3D8EE9029526F63B66B70A37
          8DCE64DA986DC576B60039F87E0D6A937C65B3F1BEA5E20D3EEA3D3BCF5B292D
          B445B5D62482412E2C2EEFD25DB71631B5C3C8900810EF86D9DDDDE37694F849
          F0D3C71E06F17F8C757F1278BFC3FE20B4F135EAEA93DAE97E1C9F4E786E96D2
          D2D14A48F7D38F2BCAB35CA15DC5DC9DE00DB5CA784FE3CF8935AF8CB0E83731
          69FF00D8B79AD6A5A325926977317D945A8B92B709ABB486CEFE57FB27CD636E
          82783CF90487365719D5F837F13BC59E2FF885E29D27C537DA7E95F62BDD522B
          0F0E49E15BFD36F25B582FDA082F22BDB89CC37D118442EE6DE2DA8D750EE64D
          CA1C03DAE8A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A00
          28A28A0028A28A0028A28A00F1AFDA0BFE46FF008207FBBE339DB3E98F0FEB07
          39ED8EB9CAE3AEE5FBC3A6FB9FECEDFF0080E31FF7CE31B3FD9C6CFE0D9FE8FC
          BFED091A4DE34F80F1C8A1D1BC76559586410744D5B208AF19F89BFB697C33F8
          37E2993C39E32F1045A1EAEB124E2097C373BAC91B8F95D244B66475C8232A48
          0CACA79520652DCB5B1EE9E33F93C37783EEFDC5C74FE3518C71FDDC631FC18D
          BF26D83CC2B97F89FE2493C41E35F8453C61E1B3BABABCB9585ECCD9BF361215
          F322288CAE0311B5D432E58100E45751551D84F7134DEBE21FFB867FEDFD2D26
          9BD7C43FF70CFF00DBFA5AB24C9F167FC8ABACFF00D794DFFA01AE8BF623FF00
          9374D27FEC35AFFF00E9E6F6B9DF167FC8ABACFF00D794DFFA01AE8BF623FF00
          9374D27FEC35AFFF00E9E6F6BF3FE36FF91743FC6BFF004991D587F8D97F56FF
          0092C7F163FEC4FF000AFF00E9CB5AAC4ADBD5BFE4B1FC58FF00B13FC2BFFA72
          D6AB12BE8387FF00E45743FC26557E36259FFC8C5A3FFDBEFF00E9BAEA9692D9
          586B5A6CC1A3448BED419E6242297B3B889376D0CD8DF220385246738E28FECF
          D47FE7F3C3FF00F81979FF00C875F40642D37F666FDA17E16781BE175C689E24
          F897E0FF000FEB56BE26F1279FA76A9AF5ADB5C43BB5BBE75DF1BC81972ACAC3
          2390C0F434BFD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C3FFF008197
          9FFC87401EA9FF000D63F043FE8B27C3FF00FC2A2C7FF8ED1FF0D63F043FE8B2
          7C3FFF00C2A2C7FF008ED795FF0067EA3FF3F9E1FF00FC0CBCFF00E43A3FB3F5
          1FF9FCF0FF00FE065E7FF21D007AA7FC358FC10FFA2C9F0FFF00F0A8B1FF00E3
          B47FC358FC10FF00A2C9F0FF00FF000A8B1FFE3B5E57FD9FA8FF00CFE787FF00
          F032F3FF0090E8FECFD47FE7F3C3FF00F81979FF00C87401EA9FF0D63F043FE8
          B27C3FFF00C2A2C7FF008ED1FF000D63F043FE8B27C3FF00FC2A2C7FF8ED795F
          F67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021
          D007AA7FC358FC10FF00A2C9F0FF00FF000A8B1FFE3B47FC358FC10FFA2C9F0F
          FF00F0A8B1FF00E3B5E57FD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C
          3FFF0081979FFC87401EA9FF000D63F043FE8B27C3FF00FC2A2C7FF8ED1FF0D6
          3F043FE8B27C3FFF00C2A2C7FF008ED795FF0067EA3FF3F9E1FF00FC0CBCFF00
          E43A3FB3F51FF9FCF0FF00FE065E7FF21D007AA7FC358FC10FFA2C9F0FFF00F0
          A8B1FF00E3B47FC358FC10FF00A2C9F0FF00FF000A8B1FFE3B5E57FD9FA8FF00
          CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00F81979FF00C87401D4FC48
          F8C7FB38FC59D0ADF47F127C60F07CB616F7B06A11AE9DE3E4D39C4F0B6F85CC
          96D751B9D8E15D41380E88D8DC8A45BF01FC75FD9DFE1AF8660D0340F8BBE078
          34D8A6B8B902EFC6B05E4CF2CF3BCF348F34F70F248CF2CB239666272C6B8BFE
          CFD47FE7F3C3FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A00
          D4F18F8F7F665F1CF8A9FC497FF19BC3F65AD49650E9F2DCE85F13E5D27CE822
          796489245B4BD895F6B5C4C416048F31B9C55BD4FE267ECC7ABF8C93C4F75F15
          3C0EFA909A1BA9204F1CC51D8DCDC441443713D92DC8B79E78FCB8764D2C6D22
          79106D61E4C7B703FB3F51FF009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE7
          87FF00F032F3FF0090E8037F4CF899FB31E91E327F13DAFC54F03A6A4669AEA3
          81FC73149636D71286135C4164D726DE09E4F326DF3451AC8FE7CFB98F9D26EB
          5E1AF8CBFB3A7873C093784A4F8BBF0FF5BD2AEFED6DA8AEADE25D3A6FED192E
          E5926BC9274DE233E74B34CEC8A8B18F30AAA2A00A396FECFD47FE7F3C3FFF00
          81979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A00D4D3BC75FB2EE9DA16A
          FA51F8AFE0FD463D57C9FB55EEAFF1046A17E7C962F6FB2F27BB7B88BC990B4B
          179722F95233491EC762C7A0F057C75FD9DFE1F6952D868BF177C0EA93CC6E6E
          2E6FBC6B05EDDDD4A5557CC9EE67B8796660891A0691D8AA471A0C2A281C5FF6
          7EA3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D0
          07AA7FC358FC10FF00A2C9F0FF00FF000A8B1FFE3B47FC358FC10FFA2C9F0FFF
          00F0A8B1FF00E3B5E57FD9FA8FFCFE787FFF00032F3FF90E8FECFD47FE7F3C3F
          FF0081979FFC87401D4E9DF18FF671D2BE23EAFE3BB7F8C1E0F1E24D5ACA1D3E
          EE593C7C925BBC11126245B56BA3026D2CE4148C106594E732C9BB2B4EF1D7EC
          BBA5EBBABEB50FC57F07BEA7AA6B50F8867B8B8F88227297F1298D66843DD910
          6623E432C4115E0FDCB86886CACBFECFD47FE7F3C3FF00F81979FF00C8747F67
          EA3FF3F9E1FF00FC0CBCFF00E43A00D4D03C6DFB2AF86FFB492DBE23FC3FBAB4
          BEB2934C6B0D53C690DFD9DBD9498F32CEDADEE2E5E2B5B670B1AB4102A46CB1
          44A5488D02D497C4FF00B2BDD7837C49E18BBF8B5E17D434DF11C296BAACF7FF
          0012A4B9BEBAB7524ADBB5EC97AD70201BE4FDC89047FBE9BE5FDEC9BAB7F67E
          A3FF003F9E1FFF00C0CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D002
          7F6A7ECA5FD8FF00D9DFF0B77C3FFF0021AFF8487FB43FE169DC7F68FDBFEC7F
          62F3BEDBF6FF00B47FC7B7EE76F99B76F18AB5AAF89FF657D5ADB408BFE16D78
          5F4D7D0A1BA82CAEB46F895269D73B6EA48E5BA334F6F7B1C93B4D2C31CB23CA
          CECF202EC4B33135BFB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF
          00032F3FF90E803535FF001B7ECABE24FECD4B9F88FF000FED6D2C6CA3D316C3
          4BF1A43616771651E7CBB3B9B7B7B948AEAD90348AB04EAF1AACB2A8502470DE
          81FF000D63F043FE8B27C3FF00FC2A2C7FF8ED795FF67EA3FF003F9E1FFF00C0
          CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D006A691E3DFD99743F88F
          77E3BB4F8CDE1FFF008492EF227967F89F2CD6F2A6662B11B57BD680C486E263
          1C7E5EC8CC84A2A9AB7E0AF899FB31FC3DD565D4343F8A9E0782E0C26D6DD2E7
          C7315D43A7DB965636F6514D72E96701291661B758E3221846DC45185C0FECFD
          47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A00EA5FE
          31FECE3FF0885FF866DFE30783F4CD2AFAF6E7509BFB2FC7C96571E7DC5DBDDC
          CE9710DD24C9BE691D8847030C531B3E5AE57FB53F652FF8559FF0AE3FE16EF8
          7FFE10CFB9FD99FF000B4EE3FD4F91E47D9BCDFB7F99F66F2BE5FB36EF27BECC
          F34BFD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3C3FF00F81979FF
          00C87401D4DAFC66FD9E6D342D13484F8E1E1F6B4D1EF56FEDA497E25BC97124
          8ACCC1679DAF0CB73165CE61999E320282A42A8157C6BF133F663F885AAC5A86
          B9F153C0F3DC0845ADC25B78E62B58750B70CCC2DEF6286E512F2005E5C4370B
          24604D30DB89640D81FD9FA8FF00CFE787FF00F032F3FF0090E8FECFD47FE7F3
          C3FF00F81979FF00C87401BFA9FC4CFD98F57F192789EEBE2A781DF521343752
          409E398A3B1B9B8882886E27B25B916F3CF1F970EC9A58DA44F220DAC3C98F69
          A67C4CFD98F48F193F89ED7E2A781D352334D751C0FE398A4B1B6B894309AE20
          B26B936F04F279936F9A28D647F3E7DCC7CE937607F67EA3FF003F9E1FFF00C0
          CBCFFE43A3FB3F51FF009FCF0FFF00E065E7FF0021D007689F1CBF66E11F8AA2
          93E277C37BAB7F14CC67D6ADEEFC4F653C37CC6D61B421E3798AED305BC51940
          0290A72096626A7817E31FECE3F0EBEDCFA47C60F07CD777BB05C5FEB1E3E4D5
          2F2444DDE5C46E2EAEA597CA42F232C7BB62B4B230506472796FECFD47FE7F3C
          3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43A00DF9BE29FECDC7
          C1BE11F08DB7C60F03D8F863C33369F2D9E990F8BAC995D6C4A359C7248F2B48
          563962B79721C33340A1D991A447B5E3AF8C7FB38FC45FB0BEAFF183C1F0DDD9
          6F16F7FA3F8F934BBC8D1F6F9910B8B5BA8A5F29CA46CD1EED8CD146C5498D08
          E5BFB3F51FF9FCF0FF00FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E80
          3535FF001B7ECABE24FECD4B9F88FF000FED6D2C6CA3D316C34BF1A436167716
          51E7CBB3B9B7B7B948AEAD90348AB04EAF1AACB2A8502470DE81FF000D63F043
          FE8B27C3FF00FC2A2C7FF8ED795FF67EA3FF003F9E1FFF00C0CBCFFE43A3FB3F
          51FF009FCF0FFF00E065E7FF0021D006FE99F133F663D23C64FE27B5F8A9E074
          D48CD35D4703F8E6292C6DAE250C26B882C9AE4DBC13C9E64DBE68A3591FCF9F
          731F3A4DC782BE267ECC7F0F7559750D0FE2A781E0B8309B5B74B9F1CC5750E9
          F6E5958DBD94535CBA59C04A45986DD638C88611B711461703FB3F51FF009FCF
          0FFF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF0090E803D53FE1AC
          7E087FD164F87FFF0085458FFF001DA3FE1AC7E087FD164F87FF00F85458FF00
          F1DAF2BFECFD47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCF
          FE43A00F54FF0086B1F821FF004593E1FF00FE15163FFC768FF86B1F821FF459
          3E1FFF00E15163FF00C76BCAFF00B3F51FF9FCF0FF00FE065E7FF21D1FD9FA8F
          FCFE787FFF00032F3FF90E803D53FE1AC7E087FD164F87FF00F85458FF00F1DA
          3FE1AC7E087FD164F87FFF0085458FFF001DAF2BFECFD47FE7F3C3FF00F81979
          FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A00F54FF86B1F821FF4593E1F
          FF00E15163FF00C768FF0086B1F821FF004593E1FF00FE15163FFC76BCAFFB3F
          51FF009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032F3FF0090E8
          03D53FE1AC7E087FD164F87FFF0085458FFF001DA3FE1AC7E087FD164F87FF00
          F85458FF00F1DAF2BFECFD47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1F
          FF00C0CBCFFE43A00F54FF0086B1F821FF004593E1FF00FE15163FFC768FF86B
          1F821FF4593E1FFF00E15163FF00C76BCAFF00B3F51FF9FCF0FF00FE065E7FF2
          1D1FD9FA8FFCFE787FFF00032F3FF90E803D53FE1AC7E087FD164F87FF00F854
          58FF00F1DA3FE1AC7E087FD164F87FFF0085458FFF001DAF2BFECFD47FE7F3C3
          FF00F81979FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A00F54FF86B1F82
          1FF4593E1FFF00E15163FF00C768FF0086B1F821FF004593E1FF00FE15163FFC
          76BCAFFB3F51FF009FCF0FFF00E065E7FF0021D1FD9FA8FF00CFE787FF00F032
          F3FF0090E803D53FE1AC7E087FD164F87FFF0085458FFF001DA3FE1AC7E087FD
          164F87FF00F85458FF00F1DAF2BFECFD47FE7F3C3FFF0081979FFC8747F67EA3
          FF003F9E1FFF00C0CBCFFE43A00F54FF0086B1F821FF004593E1FF00FE15163F
          FC768FF86B1F821FF4593E1FFF00E15163FF00C76BCAFF00B3F51FF9FCF0FF00
          FE065E7FF21D1FD9FA8FFCFE787FFF00032F3FF90E8023F8E3FB4AFC24D5FC5D
          F062E34CF89BE11D5D34CF193DF5E2E99ADDB5D3C102E8DAA2991923766DBB9D
          17A72CEA072C01E07C4FF13BE05F8D358F0F6ABAEEABA16ABA8F87AE8DEE9573
          731333DA4C5769643B7FDD6C1C8DC91BE372215F42FECFD47FE7F3C3FF00F819
          79FF00C8747F67EA3FF3F9E1FF00FC0CBCFF00E43A87152293B1E5BE26F89FE1
          5F883F14BE1B45E1DD72D75596D6EEF9A64809CA06B2940382071C1AF53A4FEC
          FD47FE7F3C3FFF0081979FFC8747F67EA3FF003F9E1FFF00C0CBCFFE43AA4ACA
          C26EE1A6F5F10FFDC33FF6FE96A5B4B37B1B5D564B9BCD3E69AEDECD6386C5E6
          930B10B9DCCC64863C733280067A1A8A988C9F167FC8ABACFF00D794DFFA01AE
          8BF623FF009374D27FEC35AFFF00E9E6F6B9DF167FC8ABACFF00D794DFFA01AE
          8BF623FF009374D27FEC35AFFF00E9E6F6BF3FE36FF91743FC6BFF004991D587
          F8D97F56FF0092C7F163FEC4FF000AFF00E9CB5AAC4ADBD5BFE4B1FC58FF00B1
          3FC2BFFA72D6AB12BE8387FF00E45743FC26557E361451457D01905145140051
          4514005145140051451400514514005145140051451400514514005145140051
          451400514514005145140051451400560EB715E6B5E2FF0001F856D355BAD0A3
          F136B12E9F71A9E9E90B5D5BC71E9D79780C3E747244199ED110EF8DC6C77C00
          DB5977AB262FF92DDF04FF00EC66BBFF00D30EAB4007FC2B4D2FFE8ACFC50FFC
          04F0FF00FF002BE8FF008569A5FF00D159F8A1FF00809E1FFF00E57D6B514019
          3FF0AD34BFFA2B3F143FF013C3FF00FCAFA3FE15A697FF004567E287FE02787F
          FF0095F5E5BF19BE3C5D784F54B4F0BF832C23F1178D2EA558E2B2EA81B1B846
          D82304804924808819D880335ED15CF46BC6BF33A7AA4ED7E8DADEDDEDD7A74E
          8EDC386C6D2C5CEA468EAA0ECDF46FAA4FADBA993FF0AD34BFFA2B3F143FF013
          C3FF00FCAFA3FE15A697FF004567E287FE02787FFF0095F536BFE21D2BC29A4C
          FAAEB7A9D9E8FA641B7CEBDBFB848218F73055DCEE4019660064F2481DE8D03C
          43A578AF498355D1353B3D634C9F77937B617093C326D62ADB5D09070CA41C1E
          0823B5741DC43FF0AD34BFFA2B3F143FF013C3FF00FCAFA3FE15A697FF004567
          E287FE02787FFF0095F535EF8874AD3756D3B4ABBD4ECED753D4BCCFB0D94D70
          8935D796BBA4F2909CBED520B6D0703935A140193FF0AD34BFFA2B3F143FF013
          C3FF00FCAFAE0B49D7EFB42F8FD2F82E0F116B5E25D0A6D127BF13F88A3B2175
          1CF0C9683F77F64B7814230BB6055C39CC48432E594FA9D78A41FF0027731FFD
          8B3A8FFE8DD2A803DAE8A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A
          0028A28A0028A28A0028A28A0028A28A00C9F167FC8ABACFFD794DFF00A01AE8
          BF623FF9374D27FEC35AFF00FE9E6F6B9DF167FC8ABACFFD794DFF00A01AE8BF
          623FF9374D27FEC35AFF00FE9E6F6BF3FE36FF0091743FC6BFF4991D587F8D97
          F56FF92C7F163FEC4FF0AFFE9CB5AAC4ADBD5BFE4B1FC58FFB13FC2BFF00A72D
          6AB12BE8387FFE45743FC26557E361451457D019051451400514514005145140
          0514514005145140051451400514514005145140051451400514514005145140
          05145140051451400564C5FF0025BBE09FFD8CD77FFA61D56B5AB262FF0092DD
          F04FFEC66BBFFD30EAB401AD5F25F887F687F1F782AD359F086BFA688BC646E5
          56DAE6D50C81A2999821B750333066C2C440C9395650E8C95F5A550BCD034CD4
          354D3F53BAD3AD2E752D3BCCFB15E4D02BCD6DE62ED93CB72329B9400769191C
          1AE2C4E1218B494A728DBAC5D9D9EEBB6ABADAF1766B669F8F98E5EF1F18A8D5
          941ABEB17BA7BA6BCD6CFA3D51E5FF00B3CFC1B6F87DA1B6B5AFDB87F1BEA81D
          AF679251335B44CFB960561C03808D2105B7480FCCCA91EDF5FA28AEC8C6308A
          8415A2B4496C97647A342853C3528D1A4AD18AB23C7FF69CD1B41D47C27E18D4
          35DF11FF00C227FD87E26D3B55B0D5A7B192EECA1BB490AC62ED50AEC81B7B29
          7692255664CB8E8DE5FA7FC73B9D33E08788B5DB4D1ACF44B8BCF1D4BA22F8A7
          C31143A7E997DBAE510EB32CB345731C503806379585C65D701816053E90F15F
          81F4EF19FD97FB42E758B7FB36FD9FD93ADDEE9D9DD8CEFF00B34B1EFF00BA31
          BB38E718C9CD7F0BFC38D27C21A849796377AF4F33C4612BAA788750D4230A48
          3911DC4F2206CA8F980C81919C13966E7C4F17ED5DF12A7B08228BC4F673FD92
          EBC6D66750B28ADAE92F96C34B4BAB297CD10A249B1E4E1E38E2591554B27273
          F647C0DD5753F107C1AF04EAFAD6A536AFAB6A7A3DAEA175793C7146CF24D12C
          AC02C4888154BED5C2E70A3249C93DC51400578A41FF0027731FFD8B3A8FFE8D
          D2ABDAEBC520FF0093B98FFEC59D47FF0046E95401ED74514500145145001451
          4500145145001451450014514500145145001451450014514500145145001451
          45001451450014514500145145001451450014514500145145001451450064F8
          B3FE455D67FEBCA6FF00D00D745FB11FFC9BA693FF0061AD7FFF004F37B5CEF8
          B3FE455D67FEBCA6FF00D00D745FB11FFC9BA693FF0061AD7FFF004F37B5F9FF
          001B7FC8BA1FE35FFA4C8EAC3FC6C93C4FAB58E91F183E29BDF5E5BD924BE12F
          0AC71B5C4AB1877FED0D6DB68C919385638F407D2B99FF0084B343FF00A0CE9F
          FF008149FE35EA3F12FF00678F017C5DD62DB55F13693753EA76F00B55BBD3F5
          6BCD3E47883332A48D6D2C664556772A1F3B4BBEDC6E6CF21FF0C47F08BFE813
          E20FFC2C759FFE4BAF2F2BE2CC0E0B054B0F52136E2ACEC95BFF004A45CE84A5
          26D1CEFF00C259A1FF00D0674FFF00C0A4FF001A3FE12CD0FF00E833A7FF00E0
          527F8D745FF0C47F08BFE813E20FFC2C759FFE4BA3FE188FE117FD027C41FF00
          858EB3FF00C975EA7FAED977F24FEE8FFF002447D5E7DCE77FE12CD0FF00E833
          A7FF00E0527F8D1FF096687FF419D3FF00F0293FC6BA2FF8623F845FF409F107
          FE163ACFFF0025D1FF000C47F08BFE813E20FF00C2C759FF00E4BA3FD76CBBF9
          27F747FF00920FABCFB9CEFF00C259A1FF00D0674FFF00C0A4FF001A3FE12CD0
          FF00E833A7FF00E0527F8D745FF0C47F08BFE813E20FFC2C759FFE4BA3FE188F
          E117FD027C41FF00858EB3FF00C9747FAED977F24FEE8FFF00241F579F739DFF
          0084B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4FF001AE8
          BFE188FE117FD027C41FF858EB3FFC9747FC311FC22FFA04F883FF000B1D67FF
          0092E8FF005DB2EFE49FDD1FFE483EAF3EE73BFF00096687FF00419D3FFF0002
          93FC68FF0084B343FF00A0CE9FFF008149FE35D17FC311FC22FF00A04F883FF0
          B1D67FF92E8FF8623F845FF409F107FE163ACFFF0025D1FEBB65DFC93FBA3FFC
          907D5E7DCE77FE12CD0FFE833A7FFE0527F8D1FF00096687FF00419D3FFF0002
          93FC6BA2FF008623F845FF00409F107FE163ACFF00F25D1FF0C47F08BFE813E2
          0FFC2C759FFE4BA3FD76CBBF927F747FF920FABCFB9CEFFC259A1FFD0674FF00
          FC0A4FF1A3FE12CD0FFE833A7FFE0527F8D745FF000C47F08BFE813E20FF00C2
          C759FF00E4BA3FE188FE117FD027C41FF858EB3FFC9747FAED977F24FEE8FF00
          F241F579F739DFF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674FF00FC0A
          4FF1AE8BFE188FE117FD027C41FF00858EB3FF00C9747FC311FC22FF00A04F88
          3FF0B1D67FF92E8FF5DB2EFE49FDD1FF00E483EAF3EE73BFF096687FF419D3FF
          00F0293FC68FF84B343FFA0CE9FF00F8149FE35D17FC311FC22FFA04F883FF00
          0B1D67FF0092E8FF008623F845FF00409F107FE163ACFF00F25D1FEBB65DFC93
          FBA3FF00C907D5E7DCE77FE12CD0FF00E833A7FF00E0527F8D1FF096687FF419
          D3FF00F0293FC6BA2FF8623F845FF409F107FE163ACFFF0025D1FF000C47F08B
          FE813E20FF00C2C759FF00E4BA3FD76CBBF927F747FF00920FABCFB9CEFF00C2
          59A1FF00D0674FFF00C0A4FF001A3FE12CD0FF00E833A7FF00E0527F8D745FF0
          C47F08BFE813E20FFC2C759FFE4BA3FE188FE117FD027C41FF00858EB3FF00C9
          747FAED977F24FEE8FFF00241F579F739DFF0084B343FF00A0CE9FFF008149FE
          347FC259A1FF00D0674FFF00C0A4FF001AE8BFE188FE117FD027C41FF858EB3F
          FC9747FC311FC22FFA04F883FF000B1D67FF0092E8FF005DB2EFE49FDD1FFE48
          3EAF3EE73BFF00096687FF00419D3FFF000293FC68FF0084B343FF00A0CE9FFF
          008149FE35D17FC311FC22FF00A04F883FF0B1D67FF92E8FF8623F845FF409F1
          07FE163ACFFF0025D1FEBB65DFC93FBA3FFC907D5E7DCE77FE12CD0FFE833A7F
          FE0527F8D1FF00096687FF00419D3FFF000293FC6BA2FF008623F845FF00409F
          107FE163ACFF00F25D1FF0C47F08BFE813E20FFC2C759FFE4BA3FD76CBBF927F
          747FF920FABCFB9CEFFC259A1FFD0674FF00FC0A4FF1AE6BC7B61E1AF1F6976D
          6D2F8ABFB1EEED2637169A8E977F0A5C5BBB4524126DDE1D183C334D132BA302
          B23700E08F47FF008623F845FF00409F107FE163ACFF00F25D1FF0C47F08BFE8
          13E20FFC2C759FFE4BA3FD76CBBF927F747FF920FABCFB9F39FF00C28EF0F7FD
          15FF00107FDFFD1FFF0090A8FF00851DE1EFFA2BFE20FF00BFFA3FFF002157D1
          9FF0C47F08BFE813E20FFC2C759FFE4BA3FE188FE117FD027C41FF00858EB3FF
          00C9747FAED977F24FEE8FFF00241F579F73E73FF851DE1EFF00A2BFE20FFBFF
          00A3FF00F2151FF0A3BC3DFF00457FC41FF7FF0047FF00E42AFA33FE188FE117
          FD027C41FF00858EB3FF00C9747FC311FC22FF00A04F883FF0B1D67FF92E8FF5
          DB2EFE49FDD1FF00E483EAF3EE7CE7FF000A3BC3DFF457FC41FF007FF47FFE42
          A3FE147787BFE8AFF883FEFF00E8FF00FC855F467FC311FC22FF00A04F883FF0
          B1D67FF92E8FF8623F845FF409F107FE163ACFFF0025D1FEBB65DFC93FBA3FFC
          907D5E7DCF9CFF00E147787BFE8AFF00883FEFFE8FFF00C8547FC28EF0F7FD15
          FF00107FDFFD1FFF0090ABE8CFF8623F845FF409F107FE163ACFFF0025D1FF00
          0C47F08BFE813E20FF00C2C759FF00E4BA3FD76CBBF927F747FF00920FABCFB9
          F39FFC28EF0F7FD15FF107FDFF00D1FF00F90ABA5F87BF0FBC25E00D7E4D6DBC
          6B71E22D4FECAF6704FAB5DD9AFD9E177479551608A2077B451125C311E58DA5
          72DBBD9FFE188FE117FD027C41FF00858EB3FF00C9747FC311FC22FF00A04F88
          3FF0B1D67FF92E8FF5DB2EFE49FDD1FF00E483EAF3EE73BFF096687FF419D3FF
          00F0293FC68FF84B343FFA0CE9FF00F8149FE35D17FC311FC22FFA04F883FF00
          0B1D67FF0092E8FF008623F845FF00409F107FE163ACFF00F25D1FEBB65DFC93
          FBA3FF00C907D5E7DCE77FE12CD0FF00E833A7FF00E0527F8D1FF096687FF419
          D3FF00F0293FC6BA2FF8623F845FF409F107FE163ACFFF0025D1FF000C47F08B
          FE813E20FF00C2C759FF00E4BA3FD76CBBF927F747FF00920FABCFB9CEFF00C2
          59A1FF00D0674FFF00C0A4FF001A3FE12CD0FF00E833A7FF00E0527F8D745FF0
          C47F08BFE813E20FFC2C759FFE4BA3FE188FE117FD027C41FF00858EB3FF00C9
          747FAED977F24FEE8FFF00241F579F739DFF0084B343FF00A0CE9FFF008149FE
          347FC259A1FF00D0674FFF00C0A4FF001AE8BFE188FE117FD027C41FF858EB3F
          FC9747FC311FC22FFA04F883FF000B1D67FF0092E8FF005DB2EFE49FDD1FFE48
          3EAF3EE73BFF00096687FF00419D3FFF000293FC68FF0084B343FF00A0CE9FFF
          008149FE35D17FC311FC22FF00A04F883FF0B1D67FF92E8FF8623F845FF409F1
          07FE163ACFFF0025D1FEBB65DFC93FBA3FFC907D5E7DCE77FE12CD0FFE833A7F
          FE0527F8D1FF00096687FF00419D3FFF000293FC6BA2FF008623F845FF00409F
          107FE163ACFF00F25D1FF0C47F08BFE813E20FFC2C759FFE4BA3FD76CBBF927F
          747FF920FABCFB9CEFFC259A1FFD0674FF00FC0A4FF1A3FE12CD0FFE833A7FFE
          0527F8D745FF000C47F08BFE813E20FF00C2C759FF00E4BA3FE188FE117FD027
          C41FF858EB3FFC9747FAED977F24FEE8FF00F241F579F739DFF84B343FFA0CE9
          FF00F8149FE347FC259A1FFD0674FF00FC0A4FF1AE8BFE188FE117FD027C41FF
          00858EB3FF00C9747FC311FC22FF00A04F883FF0B1D67FF92E8FF5DB2EFE49FD
          D1FF00E483EAF3EE73BFF096687FF419D3FF00F0293FC68FF84B343FFA0CE9FF
          00F8149FE35D17FC311FC22FFA04F883FF000B1D67FF0092E8FF008623F845FF
          00409F107FE163ACFF00F25D1FEBB65DFC93FBA3FF00C907D5E7DCE77FE12CD0
          FF00E833A7FF00E0527F8D1FF096687FF419D3FF00F0293FC6BA2FF8623F845F
          F409F107FE163ACFFF0025D1FF000C47F08BFE813E20FF00C2C759FF00E4BA3F
          D76CBBF927F747FF00920FABCFB9CEFF00C259A1FF00D0674FFF00C0A4FF001A
          3FE12CD0FF00E833A7FF00E0527F8D745FF0C47F08BFE813E20FFC2C759FFE4B
          A3FE188FE117FD027C41FF00858EB3FF00C9747FAED977F24FEE8FFF00241F57
          9F739DFF0084B343FF00A0CE9FFF008149FE347FC259A1FF00D0674FFF00C0A4
          FF001AE8BFE188FE117FD027C41FF858EB3FFC9747FC311FC22FFA04F883FF00
          0B1D67FF0092E8FF005DB2EFE49FDD1FFE483EAF3EE73BFF00096687FF00419D
          3FFF000293FC68FF0084B343FF00A0CE9FFF008149FE35D17FC311FC22FF00A0
          4F883FF0B1D67FF92E8FF8623F845FF409F107FE163ACFFF0025D1FEBB65DFC9
          3FBA3FFC907D5E7DCE77FE12CD0FFE833A7FFE0527F8D1FF00096687FF00419D
          3FFF000293FC6BA2FF008623F845FF00409F107FE163ACFF00F25D1FF0C47F08
          BFE813E20FFC2C759FFE4BA3FD76CBBF927F747FF920FABCFB9CEFFC259A1FFD
          0674FF00FC0A4FF1A3FE12CD0FFE833A7FFE0527F8D745FF000C47F08BFE813E
          20FF00C2C759FF00E4BA3FE188FE117FD027C41FF858EB3FFC9747FAED977F24
          FEE8FF00F241F579F739DFF84B343FFA0CE9FF00F8149FE347FC259A1FFD0674
          FF00FC0A4FF1AE8BFE188FE117FD027C41FF00858EB3FF00C9747FC311FC22FF
          00A04F883FF0B1D67FF92E8FF5DB2EFE49FDD1FF00E483EAF3EE73BFF096687F
          F419D3FF00F0293FC68FF84B343FFA0CE9FF00F8149FE35D17FC311FC22FFA04
          F883FF000B1D67FF0092E8FF008623F845FF00409F107FE163ACFF00F25D1FEB
          B65DFC93FBA3FF00C907D5E7DCE77FE12CD0FF00E833A7FF00E0527F8D1FF096
          687FF419D3FF00F0293FC6BA2FF8623F845FF409F107FE163ACFFF0025D1FF00
          0C47F08BFE813E20FF00C2C759FF00E4BA3FD76CBBF927F747FF00920FABCFB9
          C5F89FC4FA3DC786B568A2D5AC6495ED255544B9425894200033C9AED3F623FF
          009374D27FEC35AFFF00E9E6F68FF8623F845FF409F107FE163ACFFF0025D7AE
          782FC17A2FC3CF0C58F87BC3D62BA769164AC21815DA439662EEECEE4B3BB3B3
          333B12CCCCCCC4924D7CBF10F10E1736C2C68508C93524F54AD6B35D1BEE6D4A
          94A9CAECFFD9}
        mmHeight = 134144
        mmLeft = 794
        mmTop = 21696
        mmWidth = 195792
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 6350
        mmLeft = 15081
        mmTop = 3969
        mmWidth = 166952
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Acompanhamento de Despacho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3937
        mmLeft = 16404
        mmTop = 5292
        mmWidth = 53711
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Color = clGray
        mmHeight = 9260
        mmLeft = 16933
        mmTop = 11906
        mmWidth = 163513
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Processo Indai'#225':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3937
        mmLeft = 19579
        mmTop = 14552
        mmWidth = 28109
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 48683
        mmTop = 14552
        mmWidth = 30956
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object dsFollowUpEtapa: TDataSource
    DataSet = qryFollowUpEtapa
    Left = 802
    Top = 431
  end
  object qryFollowUpEtapa: TQuery
    CachedUpdates = True
    AfterPost = qryFollowUpEtapaAfterPost
    AfterDelete = qryFollowUpEtapaAfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT F.CD_UNID_NEG, F.CD_PRODUTO, F.NR_PROCESSO, F.CD_FOLLOWUP' +
        '_ETAPA,'
      
        '  F.CD_ETAPA, F.CD_USUARIO, F.DT_ALTERACAO, E.NM_ETAPA, U.AP_USU' +
        'ARIO'
      
        'FROM TFOLLOWUP_ETAPA F (NOLOCK), TETAPA E (NOLOCK), TUSUARIO U (' +
        'NOLOCK)'
      'WHERE F.NR_PROCESSO = :nr_processo'
      '  AND F.CD_ETAPA *= E.CD_ETAPA'
      '  AND F.CD_USUARIO *= U.CD_USUARIO'
      'ORDER BY F.CD_FOLLOWUP_ETAPA'
      '')
    UpdateObject = updFollowUpEtapa
    Left = 834
    Top = 431
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end>
    object qryFollowUpEtapaCD_UNID_NEG: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qryFollowUpEtapaCD_PRODUTO: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qryFollowUpEtapaNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryFollowUpEtapaCD_FOLLOWUP_ETAPA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_FOLLOWUP_ETAPA'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_FOLLOWUP_ETAPA'
    end
    object qryFollowUpEtapaCD_ETAPA: TIntegerField
      DisplayLabel = 'Etapa'
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_ETAPA'
    end
    object qryFollowUpEtapaCD_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qryFollowUpEtapaDT_ALTERACAO: TDateTimeField
      DisplayLabel = 'Dt. Altera'#231#227'o'
      FieldName = 'DT_ALTERACAO'
      Origin = 'DBBROKER.TFOLLOWUP_ETAPA.DT_ALTERACAO'
      EditMask = '!99/99/0000 90:00;1;_'
    end
    object qryFollowUpEtapaNM_ETAPA: TStringField
      DisplayLabel = 'Etapa'
      FieldName = 'NM_ETAPA'
      FixedChar = True
      Size = 50
    end
    object qryFollowUpEtapaAP_USUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'AP_USUARIO'
      FixedChar = True
      Size = 15
    end
  end
  object updFollowUpEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TFOLLOWUP_ETAPA'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_FOLLOWUP_ETAPA = :CD_FOLLOWUP_ETAPA,'
      '  CD_ETAPA = :CD_ETAPA,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_ALTERACAO = :DT_ALTERACAO'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_FOLLOWUP_ETAPA = :OLD_CD_FOLLOWUP_ETAPA')
    InsertSQL.Strings = (
      'insert into TFOLLOWUP_ETAPA'
      '  (CD_UNID_NEG, CD_PRODUTO, NR_PROCESSO, CD_FOLLOWUP_ETAPA, '
      '   CD_ETAPA, CD_USUARIO, DT_ALTERACAO)'
      'values'
      '  (:CD_UNID_NEG, :CD_PRODUTO, :NR_PROCESSO, :CD_FOLLOWUP_ETAPA, '
      '   :CD_ETAPA, :CD_USUARIO, :DT_ALTERACAO)')
    DeleteSQL.Strings = (
      'delete from TFOLLOWUP_ETAPA'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_FOLLOWUP_ETAPA = :OLD_CD_FOLLOWUP_ETAPA')
    Left = 866
    Top = 431
  end
  object qryUltimoCodigoEtapa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_FOLLOWUP_ETAPA) AS ULTIMO'
      'FROM TFOLLOWUP_ETAPA (NOLOCK)'
      '')
    Left = 871
    Top = 262
    object qryUltimoCodigoEtapaULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TETAPA.CD_ETAPA'
    end
  end
  object SqlAuxHora: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select '
      
        '  VD.HR_DEADLINE_BL, VD.HR_DEADLINE_CARGA, VD.HR_DEADLINE_IMO, V' +
        'D.HR_ABERTURA_GATE, VD.HR_DEADLINE_CARTA_TEMP'
      'from '
      '  TPROCESSO P (NOLOCK), TVIAGEM_DEADLINE VD (NOLOCK)'
      'where'
      '  P.NR_PROCESSO  =:NR_PROCESSO and '
      '  VD.CD_UNID_NEG = P.CD_UNID_NEG and '
      '  VD.CD_PRODUTO = P.CD_PRODUTO  and '
      '  VD.CD_EMBARCACAO = P.CD_EMBARCACAO and'
      '  VD.NR_VIAGEM = P.NR_VIAGEM and '
      '  VD.CD_AGENTE = P.CD_AGENTE and'
      '  VD.TP_ESTUFAGEM = P.TP_ESTUFAGEM')
    Left = 957
    Top = 263
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryConsultaMatra: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TOP 1 PM.DT_CONSULTA, PM.TX_SITUACAO'
      'FROM TPROCESSO_MANTRA   PM (NOLOCK)'
      
        '   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = PM.NR_PROC' +
        'ESSO'
      
        '   INNER JOIN TSERVICO  S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVIC' +
        'O'
      'WHERE PM.NR_PROCESSO = :NR_PROCESSO'
      '  AND S.CD_VIA_TRANSPORTE = '#39'04'#39
      'ORDER BY PM.DT_CONSULTA DESC')
    Left = 908
    Top = 49
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = ''
      end>
    object qryConsultaMatraDT_CONSULTA: TDateTimeField
      FieldName = 'DT_CONSULTA'
    end
    object qryConsultaMatraTX_SITUACAO: TStringField
      FieldName = 'TX_SITUACAO'
      FixedChar = True
      Size = 50
    end
  end
  object dsConsultaMatra: TDataSource
    DataSet = qryConsultaMatra
    Left = 882
    Top = 50
  end
  object qryPendencias: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT (*) CONTADOR_TOTAL, '
      
        '(SELECT COUNT(*) FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS (NOLOCK)' +
        ' WHERE NR_PROCESSO = :NR_PROCESSO AND CD_STATUS <> '#39'4'#39'  AND IN_A' +
        'TIVO = '#39'1'#39') AS CONTADOR_ANDAMENTO,'
      
        '(SELECT COUNT(*) FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS (NOLOCK)' +
        ' WHERE NR_PROCESSO = :NR_PROCESSO AND CD_STATUS = '#39'4'#39'  AND IN_AT' +
        'IVO = '#39'1'#39') AS CONTADOR_FINALIZADA'
      'FROM MYINDAIA.DBO.TPROCESSO_PENDENCIAS (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      ' AND IN_ATIVO = '#39'1'#39)
    Left = 954
    Top = 334
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryPendenciasCONTADOR_TOTAL: TIntegerField
      FieldName = 'CONTADOR_TOTAL'
    end
    object qryPendenciasCONTADOR_ANDAMENTO: TIntegerField
      FieldName = 'CONTADOR_ANDAMENTO'
    end
    object qryPendenciasCONTADOR_FINALIZADA: TIntegerField
      FieldName = 'CONTADOR_FINALIZADA'
    end
  end
  object dsPendencias: TDataSource
    DataSet = qryPendencias
    Left = 928
    Top = 334
  end
  object qryHintEvento: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT ISNULL(CS.IN_HORA_EVENTOS, 0) AS IN_HORA_EVENTOS,'
      '       SE.PZ_DO_EV_BASICO,'
      '       ISNULL(SE.IN_PRAZO_UTIL, '#39'0'#39') AS IN_PRAZO_UTIL,'
      '       ISNULL(SE.IN_PRAZO_FERIADO, '#39'0'#39') AS IN_PRAZO_FERIADO,'
      '       E.CD_EVENTO,'
      '       E.NM_EVENTO,'
      '       EP.CD_EVENTO AS CD_EVENTO_BASE,'
      '       EP.NM_EVENTO AS NM_EVENTO_BASE'
      'FROM TSERVICO_EVENTO           SE  (NOLOCK)'
      
        '   INNER JOIN TCLIENTE_SERVICO CS   (NOLOCK) ON CS.CD_SERVICO = ' +
        'SE.CD_SERVICO'
      
        '   INNER JOIN TEVENTO          E   (NOLOCK) ON E.CD_EVENTO = SE.' +
        'CD_EVENTO'
      
        '   LEFT  JOIN TSERVICO_EVENTO  SEP (NOLOCK) ON SEP.CD_SERVICO = ' +
        'SE.CD_SERVICO'
      
        '                                           AND SEP.CD_EVENTO  = ' +
        'SE.CD_EV_BASICO'
      
        '   LEFT  JOIN TEVENTO          EP  (NOLOCK) ON EP.CD_EVENTO = SE' +
        'P.CD_EVENTO'
      'WHERE SE.CD_SERVICO = :CD_SERVICO'
      '  AND SE.CD_EVENTO  = :CD_EVENTO'
      '  AND CS.CD_CLIENTE = :CD_CLIENTE')
    Left = 919
    Top = 101
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_SERVICO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_EVENTO'
        ParamType = ptInput
        Value = ''
      end
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
        Value = ''
      end>
    object qryHintEventoIN_HORA_EVENTOS: TBooleanField
      FieldName = 'IN_HORA_EVENTOS'
    end
    object qryHintEventoPZ_DO_EV_BASICO: TFloatField
      FieldName = 'PZ_DO_EV_BASICO'
    end
    object qryHintEventoIN_PRAZO_UTIL: TStringField
      FieldName = 'IN_PRAZO_UTIL'
      FixedChar = True
      Size = 1
    end
    object qryHintEventoIN_PRAZO_FERIADO: TStringField
      FieldName = 'IN_PRAZO_FERIADO'
      FixedChar = True
      Size = 1
    end
    object qryHintEventoCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryHintEventoNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryHintEventoCD_EVENTO_BASE: TStringField
      FieldName = 'CD_EVENTO_BASE'
      FixedChar = True
      Size = 3
    end
    object qryHintEventoNM_EVENTO_BASE: TStringField
      FieldName = 'NM_EVENTO_BASE'
      FixedChar = True
      Size = 50
    end
  end
  object qryFeriado: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFERIADO (NOLOCK)')
    Left = 868
    Top = 323
    object qryFeriadoDT_FERIADO: TDateTimeField
      FieldName = 'DT_FERIADO'
      Origin = 'DBBROKER.TFERIADO.DT_FERIADO'
    end
    object qryFeriadoNM_FERIADO: TStringField
      FieldName = 'NM_FERIADO'
      Origin = 'DBBROKER.TFERIADO.NM_FERIADO'
      FixedChar = True
      Size = 50
    end
  end
  object qryHintEventoNovo: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DECLARE @TB_SERVICO_EVENTO AS TABLE ('
      '    CD_EVENTO      CHAR(3),'
      '    CD_EVENTO_BASE CHAR(3),'
      '    PZ_EVENTO_BASE INT,'
      '    IN_PRAZO_UTIL    CHAR(1),'
      '    IN_PRAZO_FERIADO CHAR(1),'
      '    NR_ORDEM       INT'
      ')'
      'DECLARE @IN_HORA_EVENTOS  BIT'
      ''
      'INSERT INTO @TB_SERVICO_EVENTO'
      'EXEC SP_LISTA_EVENTOS_PROCESSO :NR_PROCESSO'
      ''
      'SELECT @IN_HORA_EVENTOS  = CS.IN_HORA_EVENTOS'
      'FROM TPROCESSO P (NOLOCK)'
      
        '   INNER JOIN TCLIENTE_SERVICO CS (NOLOCK) ON CS.CD_UNID_NEG = P' +
        '.CD_UNID_NEG'
      
        '                                 AND CS.CD_PRODUTO  = P.CD_PRODU' +
        'TO'
      
        '                                 AND CS.CD_CLIENTE  = P.CD_CLIEN' +
        'TE'
      
        '                                 AND CS.CD_SERVICO  = P.CD_SERVI' +
        'CO'
      ''
      'SELECT @IN_HORA_EVENTOS AS IN_HORA_EVENTOS,'
      '       SE.PZ_EVENTO_BASE AS PZ_DO_EV_BASICO,'
      '       CONVERT(BIT, SE.IN_PRAZO_UTIL) AS IN_PRAZO_UTIL,'
      '       CONVERT(BIT, SE.IN_PRAZO_FERIADO) AS IN_PRAZO_FERIADO,'
      '       E.CD_EVENTO,'
      '       E.NM_EVENTO,'
      '       EP.CD_EVENTO AS CD_EVENTO_BASE,'
      '       EP.NM_EVENTO AS NM_EVENTO_BASE'
      'FROM @TB_SERVICO_EVENTO SE'
      
        '   INNER JOIN TEVENTO   E (NOLOCK)  ON E.CD_EVENTO = SE.CD_EVENT' +
        'O'
      
        '   LEFT  JOIN TEVENTO   EP (NOLOCK) ON EP.CD_EVENTO = SE.CD_EVEN' +
        'TO_BASE')
    Left = 893
    Top = 101
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryHintEventoNovoIN_HORA_EVENTOS: TBooleanField
      FieldName = 'IN_HORA_EVENTOS'
    end
    object qryHintEventoNovoPZ_DO_EV_BASICO: TIntegerField
      FieldName = 'PZ_DO_EV_BASICO'
    end
    object qryHintEventoNovoIN_PRAZO_UTIL: TBooleanField
      FieldName = 'IN_PRAZO_UTIL'
    end
    object qryHintEventoNovoIN_PRAZO_FERIADO: TBooleanField
      FieldName = 'IN_PRAZO_FERIADO'
    end
    object qryHintEventoNovoCD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qryHintEventoNovoNM_EVENTO: TStringField
      FieldName = 'NM_EVENTO'
      FixedChar = True
      Size = 50
    end
    object qryHintEventoNovoCD_EVENTO_BASE: TStringField
      FieldName = 'CD_EVENTO_BASE'
      FixedChar = True
      Size = 3
    end
    object qryHintEventoNovoNM_EVENTO_BASE: TStringField
      FieldName = 'NM_EVENTO_BASE'
      FixedChar = True
      Size = 50
    end
  end
end
