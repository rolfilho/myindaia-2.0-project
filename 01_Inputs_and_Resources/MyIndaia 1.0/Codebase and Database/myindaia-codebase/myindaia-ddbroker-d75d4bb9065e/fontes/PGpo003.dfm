object frm_po_prepara: Tfrm_po_prepara
  Left = 151
  Top = 140
  Width = 750
  Height = 550
  Caption = 'Prepara'#231#227'o de LI / DI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbctrlgrd_po: TDBCtrlGrid
    Left = 0
    Top = 122
    Width = 742
    Height = 19
    Align = alTop
    AllowDelete = False
    AllowInsert = False
    Color = clWhite
    PanelBorder = gbNone
    PanelHeight = 19
    PanelWidth = 726
    ParentColor = False
    TabOrder = 0
    RowCount = 1
    SelectedColor = clTeal
    object dbtxt_nr_processo: TDBText
      Left = 33
      Top = 2
      Width = 96
      Height = 17
      DataField = 'NR_PROCESSO'
    end
    object DBText2: TDBText
      Left = 135
      Top = 2
      Width = 54
      Height = 17
      DataField = 'CD_IMPORTADOR'
    end
    object DBText3: TDBText
      Left = 194
      Top = 2
      Width = 327
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      DataField = 'LookNmCliente'
    end
    object DBText4: TDBText
      Left = 528
      Top = 2
      Width = 82
      Height = 17
      Alignment = taCenter
      Anchors = [akTop, akRight]
      DataField = 'DT_ABERTURA'
    end
    object DBText5: TDBText
      Left = 616
      Top = 2
      Width = 107
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'LookNmViaTransp'
    end
    object dbchkbx_sel_po: TDBCheckBox
      Left = 8
      Top = 1
      Width = 17
      Height = 17
      DataField = 'IN_SELECIONADO'
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchkbx_sel_poClick
    end
  end
  object dbctrlgrd_po_itens: TDBCtrlGrid
    Left = 0
    Top = 163
    Width = 742
    Height = 285
    Align = alClient
    AllowDelete = False
    AllowInsert = False
    Color = clWhite
    PanelHeight = 17
    PanelWidth = 726
    ParentColor = False
    TabOrder = 1
    RowCount = 16
    SelectedColor = clTeal
    object DBText6: TDBText
      Left = 32
      Top = 2
      Width = 35
      Height = 17
      DataField = 'NR_ITEM'
      Transparent = True
      OnDblClick = DBText6DblClick
    end
    object DBText7: TDBText
      Left = 72
      Top = 2
      Width = 244
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CD_MERCADORIA'
      Transparent = True
      OnDblClick = DBText6DblClick
    end
    object DBText8: TDBText
      Left = 321
      Top = 2
      Width = 92
      Height = 17
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      DataField = 'QT_INICIAL'
      Transparent = True
      OnDblClick = DBText6DblClick
    end
    object DBText9: TDBText
      Left = 419
      Top = 2
      Width = 86
      Height = 17
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      DataField = 'CalcQTDisp'
      Transparent = True
      OnDblClick = DBText6DblClick
    end
    object DBText10: TDBText
      Left = 512
      Top = 2
      Width = 82
      Height = 17
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      DataField = 'CalcQtBaixada'
      Transparent = True
      OnDblClick = DBText6DblClick
    end
    object DBText11: TDBText
      Left = 602
      Top = 2
      Width = 78
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'CD_NCM_SH'
      Transparent = True
      OnDblClick = DBText6DblClick
    end
    object dbchkbx_sel_itens: TDBCheckBox
      Left = 8
      Top = 2
      Width = 17
      Height = 14
      DataField = 'IN_SELECIONADO'
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchkbx_sel_itensClick
    end
    object DBCheckBox3: TDBCheckBox
      Left = 698
      Top = 2
      Width = 25
      Height = 14
      Anchors = [akTop, akRight]
      DataField = 'IN_NECESSITA_LI'
      ReadOnly = True
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object pnl_botoes: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 52
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    TabStop = True
    object btn_sair: TSpeedButton
      Left = 702
      Top = 4
      Width = 35
      Height = 39
      Hint = 'Sair'
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
    object btn_preparar: TSpeedButton
      Left = 77
      Top = 6
      Width = 35
      Height = 39
      Hint = 'Monta a Prepara'#231#227'o do Embarque (LI/DI)'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
        00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
        0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
        00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
        03FF3777773337777333333333333333333F3333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_prepararClick
    end
    object btn_salvar: TSpeedButton
      Left = 7
      Top = 6
      Width = 35
      Height = 39
      Hint = 'Salvar'
      Enabled = False
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
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 42
      Top = 6
      Width = 35
      Height = 39
      Hint = 'Cancelar'
      Enabled = False
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
      OnClick = btn_cancelarClick
    end
    object rdgrp_prep_embarque: TRadioGroup
      Left = 122
      Top = 4
      Width = 189
      Height = 39
      Caption = 'Prepara'#231#227'o para:'
      Columns = 2
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'LI'
        'DI')
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      TabStop = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 448
    Width = 742
    Height = 56
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    object lbl_item: TLabel
      Left = 11
      Top = 10
      Width = 25
      Height = 13
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qt_inicial: TLabel
      Left = 66
      Top = 10
      Width = 66
      Height = 13
      Caption = 'Qtde Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qt_disp: TLabel
      Left = 187
      Top = 10
      Width = 93
      Height = 13
      Caption = 'Qtde Dispon'#237'vel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qt_baixada: TLabel
      Left = 310
      Top = 10
      Width = 77
      Height = 13
      Caption = 'Qtde Baixada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qt_baixar: TLabel
      Left = 433
      Top = 10
      Width = 67
      Height = 13
      Caption = 'Qtde Baixar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_dt_baixa: TLabel
      Left = 557
      Top = 10
      Width = 53
      Height = 13
      Caption = 'Dt. Baixa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedt_nr_item: TDBEdit
      Left = 11
      Top = 24
      Width = 38
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'NR_ITEM'
      ReadOnly = True
      TabOrder = 0
    end
    object dbedt_qt_inicial: TDBEdit
      Left = 66
      Top = 24
      Width = 106
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'QT_INICIAL'
      ReadOnly = True
      TabOrder = 1
    end
    object dbedt_qt_disponivel: TDBEdit
      Left = 188
      Top = 24
      Width = 106
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CalcQTDisp'
      ReadOnly = True
      TabOrder = 2
    end
    object dbedt_qt_baixada: TDBEdit
      Left = 310
      Top = 24
      Width = 109
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'CalcQtBaixada'
      ReadOnly = True
      TabOrder = 3
    end
    object msk_qt_baixar: TMaskEdit
      Left = 434
      Top = 24
      Width = 109
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnExit = msk_qt_baixarExit
    end
    object msk_dt_baixa: TMaskEdit
      Left = 558
      Top = 24
      Width = 90
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 5
      Text = '  /  /    '
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 52
    Width = 742
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object lbl_nr_processo: TLabel
      Left = 381
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
    end
    object btn_nr_processo: TSpeedButton
      Left = 469
      Top = 21
      Width = 24
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
      OnClick = btn_nr_processoClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 10
      Top = 8
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
      Left = 162
      Top = 21
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
    object lbl_localizar_: TLabel
      Left = 614
      Top = 8
      Width = 26
      Height = 13
      Caption = 'P.O.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_po: TSpeedButton
      Left = 711
      Top = 21
      Width = 24
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
      OnClick = btn_co_poClick
    end
    object Label2: TLabel
      Left = 195
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
    end
    object btn_co_produto: TSpeedButton
      Left = 347
      Top = 20
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
    object msk_nr_processo: TMaskEdit
      Left = 381
      Top = 21
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = msk_nr_processoKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 33
      Top = 21
      Width = 128
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object edt_pesquisa: TEdit
      Left = 614
      Top = 21
      Width = 96
      Height = 21
      MaxLength = 18
      TabOrder = 4
      OnChange = edt_pesquisaChange
      OnExit = edt_pesquisaExit
    end
    object edt_nm_produto: TEdit
      Left = 218
      Top = 21
      Width = 128
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object msk_cd_produto: TMaskEdit
      Left = 195
      Top = 21
      Width = 24
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
      OnKeyDown = msk_nr_processoKeyDown
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 10
      Top = 21
      Width = 24
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
      OnKeyDown = msk_nr_processoKeyDown
    end
    object chkProcessos: TCheckBox
      Left = 497
      Top = 23
      Width = 115
      Height = 17
      Caption = #218'ltimos Processos'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 102
    Width = 742
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      742
      20)
    object lbl_proc_po_da: TLabel
      Left = 30
      Top = 2
      Width = 102
      Height = 17
      AutoSize = False
      Caption = 'Processo PO'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label15: TLabel
      Left = 133
      Top = 2
      Width = 58
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Cod.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label14: TLabel
      Left = 192
      Top = 2
      Width = 331
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Nome do Cliente'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label16: TLabel
      Left = 524
      Top = 2
      Width = 88
      Height = 17
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Dt.Abertura'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label17: TLabel
      Left = 613
      Top = 2
      Width = 129
      Height = 17
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Via de Transporte'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label18: TLabel
      Left = 0
      Top = 2
      Width = 29
      Height = 17
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 141
    Width = 742
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      742
      22)
    object Label1: TLabel
      Left = 29
      Top = 5
      Width = 41
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Seq.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 71
      Top = 5
      Width = 246
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Mercadoria'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 417
      Top = 5
      Width = 91
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Qtde Disp.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 318
      Top = 5
      Width = 98
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Qtde Inicial'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label13: TLabel
      Left = 509
      Top = 5
      Width = 89
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Qtde Baixada'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_ncm: TLabel
      Left = 599
      Top = 5
      Width = 84
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'N.C.M.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_nec_LI: TLabel
      Left = 684
      Top = 5
      Width = 57
      Height = 17
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Neces. LI'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label19: TLabel
      Left = 0
      Top = 5
      Width = 28
      Height = 17
      AutoSize = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
  end
  object MainMenu1: TMainMenu
    Left = 559
    Top = 8
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_preparar: TMenuItem
      Caption = '&Preparar LI/DI'
      Enabled = False
      OnClick = btn_prepararClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
