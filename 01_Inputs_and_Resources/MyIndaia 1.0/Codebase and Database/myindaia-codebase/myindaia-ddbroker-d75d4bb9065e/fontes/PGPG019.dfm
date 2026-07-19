object frm_imp_adm: Tfrm_imp_adm
  Left = 152
  Top = 144
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Emiss'#227'o de Cheques/Notas Administrativos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_pagto_recebto: TLabel
    Left = 3
    Top = 132
    Width = 156
    Height = 13
    Caption = 'Pagamentos/Recebimentos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_processos: TLabel
    Left = 3
    Top = 433
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = 'Itens'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_dt_base: TLabel
    Left = 482
    Top = 52
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Base'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_nr_cheque_ini: TLabel
    Left = 481
    Top = 93
    Width = 76
    Height = 13
    Caption = 'Ch. Inicial N'#186
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_banco: TLabel
    Left = 6
    Top = 93
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
    Left = 281
    Top = 105
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
  object Label1: TLabel
    Left = 6
    Top = 52
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
    Left = 281
    Top = 66
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
    OnClick = btn_co_unid_negClick
  end
  object lbl_dt_pagto: TLabel
    Left = 579
    Top = 93
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Pagto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_nr_nota: TLabel
    Left = 579
    Top = 52
    Width = 46
    Height = 13
    Caption = 'N'#186' Nota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 49
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 8
    object btn_sair: TSpeedButton
      Left = 336
      Top = 4
      Width = 38
      Height = 41
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
    object btn_marca_todas: TSpeedButton
      Left = 119
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Marcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_marca_todasClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 81
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Desmarcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object btn_imprimir: TSpeedButton
      Left = 4
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Imprimir'
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
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
    object btn_canc_lanc: TSpeedButton
      Left = 42
      Top = 4
      Width = 38
      Height = 41
      Hint = 'Cancelar Conta cont'#225'bil da Solicita'#231#227'o de Pagto'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_canc_lancClick
    end
    object dbnvg: TDBNavigator
      Left = 213
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_imp_adm.ds_lib_adm
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object dbgrdAdm: TDBGrid
    Left = 3
    Top = 147
    Width = 1014
    Height = 286
    DataSource = datm_imp_adm.ds_lib_adm
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_REF'
        Title.Color = clBlack
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_BANCO'
        Title.Color = clBlack
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_FAVORECIDO'
        Title.Color = clBlack
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_LANCTO'
        Title.Color = clBlack
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_DOCTO'
        Title.Color = clBlack
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LookStatusCheque'
        Title.Color = clBlack
        Width = 120
        Visible = True
      end>
  end
  object dbgrdItensPendentes: TDBGrid
    Left = 3
    Top = 448
    Width = 1014
    Height = 228
    DataSource = datm_imp_adm.ds_lib_adm_item
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_REF'
        Title.Color = clBlack
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CD_CT_CONTABIL'
        Title.Color = clBlack
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_CT_CONTABIL'
        Title.Color = clBlack
        Width = 240
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VL_LANCTO'
        Title.Color = clBlack
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NM_STATUS'
        Title.Color = clBlack
        Width = 148
        Visible = True
      end>
  end
  object msk_dt_base: TMaskEdit
    Left = 481
    Top = 66
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 2
    Text = '  /  /    '
    OnEnter = msk_dt_baseEnter
    OnExit = msk_dt_baseExit
  end
  object msk_nr_cheque: TMaskEdit
    Left = 481
    Top = 106
    Width = 58
    Height = 21
    EditMask = '999999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 5
    OnExit = msk_nr_chequeExit
  end
  object msk_cd_banco: TMaskEdit
    Left = 6
    Top = 106
    Width = 33
    Height = 21
    EditMask = '999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 3
    OnExit = msk_cd_bancoExit
    OnKeyDown = msk_cd_bancoKeyDown
  end
  object edt_nm_banco: TEdit
    Left = 43
    Top = 106
    Width = 232
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 10
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 679
    Width = 1017
    Height = 19
    Align = alNone
    Panels = <>
    SimplePanel = True
  end
  object msk_cd_unid_neg: TMaskEdit
    Left = 6
    Top = 66
    Width = 33
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
    OnKeyDown = msk_cd_bancoKeyDown
  end
  object edt_nm_unid_neg: TEdit
    Left = 43
    Top = 66
    Width = 232
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 12
  end
  object rdgrp_tp_natureza: TRadioGroup
    Left = 317
    Top = 52
    Width = 150
    Height = 35
    Caption = 'Natureza'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Cr'#233'dito'
      'D'#233'bito')
    ParentFont = False
    TabOrder = 1
    OnClick = rdgrp_tp_naturezaClick
  end
  object rdgrp_tp_lancamento: TRadioGroup
    Left = 317
    Top = 92
    Width = 150
    Height = 35
    Caption = 'Lan'#231'amento'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Cheque'
      'Nota')
    ParentFont = False
    TabOrder = 4
    TabStop = True
    OnClick = rdgrp_tp_lancamentoClick
  end
  object msk_dt_pagto: TMaskEdit
    Left = 579
    Top = 106
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 6
    Text = '  /  /    '
    OnExit = msk_dt_pagtoExit
  end
  object msk_nr_nota: TMaskEdit
    Left = 579
    Top = 66
    Width = 70
    Height = 21
    TabStop = False
    Color = clMenu
    EditMask = '999999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
    Visible = False
  end
  object menu_cadastro: TMainMenu
    Left = 573
    Top = 4
    object mi_imprimir: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimirClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
  object crp_nota: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 400
    Top = 174
  end
end
