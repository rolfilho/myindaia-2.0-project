object frm_pe_prepara: Tfrm_pe_prepara
  Left = 202
  Top = 92
  Width = 648
  Height = 488
  Caption = 'Prepara'#231#227'o p/ Processo de Exporta'#231#227'o'
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
  object Label3: TLabel
    Left = 36
    Top = 45
    Width = 101
    Height = 17
    AutoSize = False
    Caption = 'Processo PE'
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
    Left = 39
    Top = 212
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
    Left = 81
    Top = 212
    Width = 145
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
    Left = 330
    Top = 212
    Width = 93
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
    Left = 228
    Top = 212
    Width = 100
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
    Left = 425
    Top = 212
    Width = 90
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
    Left = 517
    Top = 212
    Width = 109
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
    Left = 139
    Top = 45
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
  object lbl_nr_processo: TLabel
    Left = 181
    Top = 2
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
    Left = 282
    Top = 15
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
    Left = 198
    Top = 45
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
    Left = 412
    Top = 45
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
    Left = 501
    Top = 45
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
    Left = 9
    Top = 45
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
    Top = 212
    Width = 27
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
  object lbl_cd_unid_neg: TLabel
    Left = 9
    Top = 2
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
    Left = 157
    Top = 15
    Width = 23
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
    OnClick = btn_cd_unid_negClick
  end
  object Label2: TLabel
    Left = 314
    Top = 2
    Width = 73
    Height = 13
    Caption = 'Processo PE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbctrlgrd_pe: TDBCtrlGrid
    Left = 9
    Top = 64
    Width = 620
    Height = 144
    AllowInsert = False
    Enabled = False
    PanelHeight = 16
    PanelWidth = 604
    TabOrder = 3
    RowCount = 9
    SelectedColor = clTeal
    object dbtxt_nr_processo: TDBText
      Left = 27
      Top = 1
      Width = 100
      Height = 15
      DataField = 'NR_PROCESSO'
    end
    object DBText2: TDBText
      Left = 131
      Top = 1
      Width = 54
      Height = 15
      DataField = 'CD_EXPORTADOR'
    end
    object DBText3: TDBText
      Left = 187
      Top = 1
      Width = 214
      Height = 15
      DataField = 'LookNmCliente'
    end
    object DBText4: TDBText
      Left = 403
      Top = 1
      Width = 87
      Height = 15
      Alignment = taCenter
      DataField = 'DT_REGISTRO_PEDIDO'
    end
    object DBText5: TDBText
      Left = 494
      Top = 1
      Width = 107
      Height = 15
      DataField = 'LookViaTransporte'
    end
    object dbchkbx_sel_pe: TDBCheckBox
      Left = 6
      Top = 1
      Width = 17
      Height = 15
      Caption = 'dbchkbx_sel_pe'
      DataField = 'IN_SELECIONADO'
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchkbx_sel_peClick
    end
  end
  object dbctrlgrd_pe_itens: TDBCtrlGrid
    Left = 9
    Top = 230
    Width = 621
    Height = 160
    Enabled = False
    PanelHeight = 16
    PanelWidth = 605
    TabOrder = 5
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
      Left = 73
      Top = 1
      Width = 144
      Height = 16
      DataField = 'CD_MERCADORIA'
      OnDblClick = DBText6DblClick
    end
    object DBText8: TDBText
      Left = 223
      Top = 1
      Width = 95
      Height = 16
      Alignment = taRightJustify
      DataField = 'QT_MERCADORIA'
      OnDblClick = DBText6DblClick
    end
    object DBText9: TDBText
      Left = 324
      Top = 1
      Width = 90
      Height = 16
      Alignment = taRightJustify
      DataField = 'CalcQTDisp'
      OnDblClick = DBText6DblClick
    end
    object DBText10: TDBText
      Left = 418
      Top = 1
      Width = 85
      Height = 16
      Alignment = taRightJustify
      DataField = 'CalcQtBaixada'
      OnDblClick = DBText6DblClick
    end
    object DBText11: TDBText
      Left = 509
      Top = 1
      Width = 92
      Height = 16
      DataField = 'CD_NCM'
      OnDblClick = DBText6DblClick
    end
    object dbchkbx_sel_itens: TDBCheckBox
      Left = 8
      Top = 1
      Width = 17
      Height = 16
      Caption = 'dbchkbx_sel_itens'
      DataField = 'IN_SELECIONADO'
      TabOrder = 0
      ValueChecked = '1'
      ValueUnchecked = '0'
      OnClick = dbchkbx_sel_itensClick
    end
  end
  object msk_nr_processo: TMaskEdit
    Left = 181
    Top = 15
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = msk_nr_processoExit
    OnKeyDown = msk_nr_processoKeyDown
  end
  object pnl_botoes: TPanel
    Left = 463
    Top = 8
    Width = 161
    Height = 34
    BevelOuter = bvLowered
    TabOrder = 4
    TabStop = True
    object btn_sair: TSpeedButton
      Left = 120
      Top = 4
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
    object btn_preparar: TSpeedButton
      Left = 79
      Top = 4
      Width = 25
      Height = 25
      Hint = 'Monta o Processo de Exporta'#231#227'o'
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
      Left = 6
      Top = 4
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
      Top = 4
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
  object Panel1: TPanel
    Left = 9
    Top = 394
    Width = 620
    Height = 45
    BevelOuter = bvLowered
    TabOrder = 6
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
      Caption = 'Qtde Dispon'#237'vel'
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
      TabStop = False
      Color = clMenu
      DataField = 'NR_ITEM'
      DataSource = datm_pe_prepara.ds_pe_itens
      ReadOnly = True
      TabOrder = 0
    end
    object dbedt_qt_inicial: TDBEdit
      Left = 55
      Top = 19
      Width = 106
      Height = 21
      TabStop = False
      Color = clMenu
      DataField = 'QT_MERCADORIA'
      DataSource = datm_pe_prepara.ds_pe_itens
      ReadOnly = True
      TabOrder = 1
    end
    object dbedt_qt_disponivel: TDBEdit
      Left = 169
      Top = 19
      Width = 106
      Height = 21
      TabStop = False
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
      TabStop = False
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
  object msk_cd_unid_neg: TMaskEdit
    Left = 9
    Top = 15
    Width = 21
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
  object edt_nm_unid_neg: TEdit
    Left = 33
    Top = 15
    Width = 122
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
    Text = 'edt_nm_unid_neg'
  end
  object msk_nr_pe: TMaskEdit
    Left = 314
    Top = 15
    Width = 98
    Height = 21
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = msk_nr_peChange
  end
  object MainMenu1: TMainMenu
    Left = 583
    Top = 290
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
      Caption = '&Preparar Processo'
      Enabled = False
      OnClick = btn_prepararClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
