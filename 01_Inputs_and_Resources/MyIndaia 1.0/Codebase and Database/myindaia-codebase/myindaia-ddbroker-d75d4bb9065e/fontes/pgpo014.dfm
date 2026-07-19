object frm_po_prepara: Tfrm_po_prepara
  Left = 200
  Top = 108
  Width = 648
  Height = 488
  Caption = 'Preparação de LI / DI'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 35
    Top = 56
    Width = 101
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
  object Label1: TLabel
    Left = 37
    Top = 230
    Width = 40
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
    Left = 79
    Top = 230
    Width = 122
    Height = 17
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
    Left = 302
    Top = 230
    Width = 90
    Height = 17
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
    Left = 203
    Top = 230
    Width = 97
    Height = 17
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
    Left = 394
    Top = 230
    Width = 87
    Height = 17
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
    Left = 484
    Top = 230
    Width = 83
    Height = 17
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
  object Label15: TLabel
    Left = 138
    Top = 56
    Width = 57
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
  object lbl_nec_LI: TLabel
    Left = 569
    Top = 230
    Width = 57
    Height = 17
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
  object lbl_nr_processo: TLabel
    Left = 8
    Top = 4
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
    Left = 136
    Top = 20
    Width = 25
    Height = 21
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
  object Label14: TLabel
    Left = 197
    Top = 56
    Width = 213
    Height = 17
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
    Left = 411
    Top = 56
    Width = 87
    Height = 17
    Alignment = taCenter
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
    Left = 500
    Top = 56
    Width = 125
    Height = 17
    Alignment = taCenter
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
    Left = 8
    Top = 56
    Width = 25
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
  object Label19: TLabel
    Left = 9
    Top = 230
    Width = 26
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
  object dbctrlgrd_po: TDBCtrlGrid
    Left = 8
    Top = 74
    Width = 617
    Height = 153
    ColCount = 1
    Enabled = False
    PanelHeight = 17
    PanelWidth = 604
    TabOrder = 3
    RowCount = 9
    SelectedColor = clTeal
    object dbtxt_nr_processo: TDBText
      Left = 27
      Top = 2
      Width = 100
      Height = 17
      DataField = 'NR_PROCESSO'
    end
    object DBText2: TDBText
      Left = 131
      Top = 2
      Width = 54
      Height = 17
      DataField = 'CD_IMPORTADOR'
    end
    object DBText3: TDBText
      Left = 187
      Top = 2
      Width = 214
      Height = 17
      DataField = 'LookNmCliente'
    end
    object DBText4: TDBText
      Left = 403
      Top = 2
      Width = 87
      Height = 17
      Alignment = taCenter
      DataField = 'DT_ABERTURA'
    end
    object DBText5: TDBText
      Left = 494
      Top = 2
      Width = 107
      Height = 17
      DataField = 'LookNmViaTransp'
    end
    object dbchkbx_sel_po: TDBCheckBox
      Left = 6
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
    Left = 8
    Top = 248
    Width = 618
    Height = 160
    ColCount = 1
    Enabled = False
    PanelHeight = 16
    PanelWidth = 605
    TabOrder = 4
    RowCount = 10
    SelectedColor = clTeal
    object DBText6: TDBText
      Left = 29
      Top = 1
      Width = 40
      Height = 17
      DataField = 'NR_ITEM'
      OnDblClick = DBText6DblClick
    end
    object DBText7: TDBText
      Left = 72
      Top = 1
      Width = 121
      Height = 17
      DataField = 'CD_MERCADORIA'
      OnDblClick = DBText6DblClick
    end
    object DBText8: TDBText
      Left = 195
      Top = 1
      Width = 95
      Height = 17
      Alignment = taRightJustify
      DataField = 'QT_INICIAL'
      OnDblClick = DBText6DblClick
    end
    object DBText9: TDBText
      Left = 293
      Top = 1
      Width = 90
      Height = 17
      Alignment = taRightJustify
      DataField = 'CalcQTDisp'
      OnDblClick = DBText6DblClick
    end
    object DBText10: TDBText
      Left = 386
      Top = 1
      Width = 86
      Height = 17
      Alignment = taRightJustify
      DataField = 'CalcQtBaixada'
      OnDblClick = DBText6DblClick
    end
    object DBText11: TDBText
      Left = 477
      Top = 1
      Width = 81
      Height = 17
      DataField = 'CD_NCM_SH'
      OnDblClick = DBText6DblClick
    end
    object dbchkbx_sel_itens: TDBCheckBox
      Left = 8
      Top = 1
      Width = 17
      Height = 16
      DataField = 'IN_SELECIONADO'
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchkbx_sel_itensClick
    end
    object DBCheckBox3: TDBCheckBox
      Left = 570
      Top = 1
      Width = 25
      Height = 16
      DataField = 'IN_NECESSITA_LI'
      ReadOnly = True
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object msk_nr_processo: TMaskEdit
    Left = 8
    Top = 20
    Width = 126
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = msk_nr_processoExit
    OnKeyDown = msk_nr_processoKeyDown
  end
  object pnl_botoes: TPanel
    Left = 464
    Top = 13
    Width = 160
    Height = 31
    BevelOuter = bvLowered
    TabOrder = 2
    TabStop = True
    object btn_sair: TSpeedButton
      Left = 117
      Top = 3
      Width = 25
      Height = 25
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
    object btn_prepara: TSpeedButton
      Left = 79
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Monta a Preparação do Embarque (LI/DI)'
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
      OnClick = btn_preparaClick
    end
    object btn_salvar: TSpeedButton
      Left = 6
      Top = 3
      Width = 25
      Height = 25
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
      Left = 34
      Top = 3
      Width = 25
      Height = 25
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
  end
  object rdgrp_prep_embarque: TRadioGroup
    Left = 192
    Top = 8
    Width = 209
    Height = 35
    Caption = 'Preparação para:'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'LI'
      'DI')
    ParentFont = False
    TabOrder = 1
    TabStop = True
  end
  object Panel1: TPanel
    Left = 10
    Top = 412
    Width = 616
    Height = 45
    BevelOuter = bvLowered
    TabOrder = 5
    object lbl_item: TLabel
      Left = 8
      Top = 3
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
      Left = 55
      Top = 4
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
      Left = 168
      Top = 4
      Width = 93
      Height = 13
      Caption = 'Qtde Disponível'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qt_baixada: TLabel
      Left = 284
      Top = 4
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
      Left = 398
      Top = 4
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
      Left = 514
      Top = 4
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
      Left = 5
      Top = 19
      Width = 38
      Height = 21
      Color = clMenu
      DataField = 'NR_ITEM'
      ReadOnly = True
      TabOrder = 0
    end
    object dbedt_qt_inicial: TDBEdit
      Left = 55
      Top = 19
      Width = 106
      Height = 21
      Color = clMenu
      DataField = 'QT_INICIAL'
      ReadOnly = True
      TabOrder = 1
    end
    object dbedt_qt_disponivel: TDBEdit
      Left = 169
      Top = 19
      Width = 106
      Height = 21
      Color = clMenu
      DataField = 'CalcQTDisp'
      ReadOnly = True
      TabOrder = 2
    end
    object dbedt_qt_baixada: TDBEdit
      Left = 283
      Top = 19
      Width = 109
      Height = 21
      Color = clMenu
      DataField = 'CalcQtBaixada'
      ReadOnly = True
      TabOrder = 3
    end
    object msk_qt_baixar: TMaskEdit
      Left = 399
      Top = 19
      Width = 109
      Height = 21
      ReadOnly = True
      TabOrder = 4
      OnExit = msk_qt_baixarExit
    end
    object msk_dt_baixa: TMaskEdit
      Left = 515
      Top = 19
      Width = 90
      Height = 21
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      ReadOnly = True
      TabOrder = 5
      Text = '  /  /    '
    end
  end
end
