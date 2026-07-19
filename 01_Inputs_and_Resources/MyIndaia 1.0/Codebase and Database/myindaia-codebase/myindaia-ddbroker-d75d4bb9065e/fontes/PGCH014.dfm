object frm_sel_unid_prod: Tfrm_sel_unid_prod
  Left = 554
  Top = 227
  Width = 424
  Height = 498
  BorderIcons = [biSystemMenu]
  Caption = 'frm_sel_unid_prod'
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 471
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      416
      471)
    object Shape1: TShape
      Left = 6
      Top = 7
      Width = 401
      Height = 410
      Anchors = [akLeft, akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object lbl_unid_neg: TLabel
      Left = 15
      Top = 13
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
      Left = 312
      Top = 25
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
      Left = 15
      Top = 53
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
    end
    object btn_co_produto: TSpeedButton
      Left = 312
      Top = 65
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
      OnClick = btn_co_produtoClick
    end
    object lbl_periodo: TLabel
      Left = 14
      Top = 163
      Width = 120
      Height = 12
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 124
      Top = 180
      Width = 8
      Height = 12
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_cd_cliente: TLabel
      Left = 15
      Top = 126
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
      Left = 312
      Top = 140
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
      Left = 15
      Top = 90
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
      Left = 312
      Top = 102
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
    object lbl_prefixo: TLabel
      Left = 254
      Top = 280
      Width = 40
      Height = 12
      Caption = 'Prefixo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_relatorio: TLabel
      Left = 302
      Top = 280
      Width = 52
      Height = 12
      Caption = 'Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_cd_fornecedor: TLabel
      Left = 15
      Top = 163
      Width = 65
      Height = 13
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_fornecedor: TSpeedButton
      Left = 311
      Top = 175
      Width = 26
      Height = 25
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
      OnClick = btn_co_fornecedorClick
    end
    object lbl_cd_area: TLabel
      Left = 11
      Top = 243
      Width = 27
      Height = 13
      Caption = #193'rea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_area: TSpeedButton
      Left = 303
      Top = 256
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
      Visible = False
      OnClick = btn_co_areaClick
    end
    object lbl_cd_grupo_area: TLabel
      Left = 335
      Top = 242
      Width = 65
      Height = 12
      Caption = 'Grupo '#193'rea'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btn_co_modal: TSpeedButton
      Left = 311
      Top = 139
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
      Visible = False
      OnClick = btn_co_modalClick
    end
    object Lbl_modal: TLabel
      Left = 17
      Top = 125
      Width = 35
      Height = 13
      Caption = 'Modal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object msk_sg_grupo_area: TMaskEdit
      Left = 335
      Top = 256
      Width = 35
      Height = 20
      CharCase = ecUpperCase
      MaxLength = 3
      TabOrder = 6
      Visible = False
      OnExit = msk_sg_grupo_areaExit
    end
    object btn_imprimir: TButton
      Left = 261
      Top = 424
      Width = 68
      Height = 24
      Anchors = [akLeft, akBottom]
      Caption = '&Imprimir'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 330
      Top = 423
      Width = 68
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 12
      OnClick = btn_sairClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 15
      Top = 26
      Width = 26
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
      Left = 46
      Top = 26
      Width = 255
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 14
    end
    object msk_cd_produto: TMaskEdit
      Left = 15
      Top = 66
      Width = 26
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
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 46
      Top = 66
      Width = 255
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 15
    end
    object msk_cd_cliente: TMaskEdit
      Left = 15
      Top = 140
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
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 58
      Top = 140
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 16
      Visible = False
    end
    object mem_field: TMemo
      Left = 14
      Top = 339
      Width = 322
      Height = 22
      TabOrder = 18
      Visible = False
    end
    object edt_nm_grupo: TEdit
      Left = 50
      Top = 103
      Width = 251
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 21
      Visible = False
    end
    object msk_cd_grupo: TMaskEdit
      Left = 15
      Top = 103
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
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_nr_cheque: TMaskEdit
      Left = 299
      Top = 316
      Width = 80
      Height = 20
      EditMask = '!999999;1; '
      MaxLength = 6
      TabOrder = 13
      Text = '      '
      Visible = False
      OnExit = msk_nr_chequeExit
    end
    object msk_cd_prefixo: TMaskEdit
      Left = 254
      Top = 294
      Width = 41
      Height = 20
      CharCase = ecUpperCase
      TabOrder = 7
      Visible = False
      OnExit = msk_nr_chequeExit
    end
    object msk_dt_inicio: TDateTimePicker
      Left = 14
      Top = 176
      Width = 89
      Height = 20
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 19
    end
    object msk_dt_fim: TDateTimePicker
      Left = 153
      Top = 176
      Width = 89
      Height = 20
      Date = 37431.000000000000000000
      Time = 37431.000000000000000000
      TabOrder = 20
    end
    object chk_excel: TCheckBox
      Left = 14
      Top = 302
      Width = 90
      Height = 16
      Caption = 'Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      Visible = False
      OnClick = chk_excelClick
    end
    object msk_nr_relatorio: TMaskEdit
      Left = 302
      Top = 294
      Width = 73
      Height = 20
      MaxLength = 6
      TabOrder = 8
      Visible = False
    end
    object msk_cd_fornecedor: TMaskEdit
      Left = 15
      Top = 177
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
      TabOrder = 4
      Visible = False
      OnExit = msk_cd_fornecedorExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_fornecedor: TEdit
      Left = 58
      Top = 176
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 17
      Visible = False
    end
    object chk_arquivo: TCheckBox
      Left = 13
      Top = 282
      Width = 90
      Height = 16
      Caption = 'Em Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      Visible = False
    end
    object msk_cd_area: TMaskEdit
      Left = 11
      Top = 256
      Width = 26
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnExit = msk_cd_areaExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_area: TEdit
      Left = 45
      Top = 256
      Width = 255
      Height = 20
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 22
      Visible = False
    end
    object chkVenc: TCheckBox
      Left = 15
      Top = 177
      Width = 201
      Height = 16
      Caption = 'Somente Faturas Vencidas'
      TabOrder = 23
      Visible = False
    end
    object chkDev: TCheckBox
      Left = 15
      Top = 194
      Width = 200
      Height = 16
      Caption = 'Faturas com saldo Devedor'
      Checked = True
      State = cbChecked
      TabOrder = 24
      Visible = False
    end
    object chkCred: TCheckBox
      Left = 15
      Top = 211
      Width = 202
      Height = 16
      Caption = 'Faturas com saldo Credor'
      Checked = True
      State = cbChecked
      TabOrder = 25
      Visible = False
    end
    object gbReferencias: TGroupBox
      Left = 15
      Top = 255
      Width = 297
      Height = 153
      Anchors = []
      Caption = ' Refer'#234'ncias '
      TabOrder = 26
      Visible = False
      object btn4: TSpeedButton
        Left = 130
        Top = 42
        Width = 33
        Height = 33
        Caption = '>>'
        Flat = True
        OnClick = btn4Click
      end
      object btn5: TSpeedButton
        Left = 130
        Top = 76
        Width = 33
        Height = 33
        Caption = '<<'
        Flat = True
        OnClick = btn5Click
      end
      object Label1: TLabel
        Left = 4
        Top = 18
        Width = 60
        Height = 13
        Caption = 'Disponiveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 164
        Top = 18
        Width = 70
        Height = 13
        Caption = 'Selecionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object lb1: TListBox
        Left = 4
        Top = 33
        Width = 125
        Height = 104
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 0
        OnDblClick = lb1DblClick
      end
      object lb2: TListBox
        Left = 164
        Top = 33
        Width = 125
        Height = 104
        Ctl3D = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
        OnDblClick = lb2DblClick
      end
    end
    object msk_cd_modal: TMaskEdit
      Left = 15
      Top = 140
      Width = 32
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 28
      Visible = False
      OnChange = msk_cd_modalChange
    end
    object edt_nm_modal: TEdit
      Left = 50
      Top = 140
      Width = 251
      Height = 21
      Color = clMenu
      TabOrder = 27
      Visible = False
    end
  end
  object crp_unid_prod: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 358
    Top = 26
  end
end
