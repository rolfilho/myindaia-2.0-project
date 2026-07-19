object frm_print_recibo_old: Tfrm_print_recibo_old
  Left = 58
  Top = 88
  Cursor = crHandPoint
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de recibo'
  ClientHeight = 434
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_print: TPanel
    Left = 6
    Top = 7
    Width = 620
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_incluir_ref: TSpeedButton
      Left = 8
      Top = 8
      Width = 25
      Height = 25
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
      OnClick = btn_incluir_refClick
    end
    object btn_salvar_ref: TSpeedButton
      Left = 37
      Top = 8
      Width = 25
      Height = 25
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
      OnClick = btn_salvar_refClick
    end
    object btn_cancelar_ref: TSpeedButton
      Left = 66
      Top = 8
      Width = 25
      Height = 25
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
      OnClick = btn_cancelar_refClick
    end
    object btn_excluir_ref: TSpeedButton
      Left = 95
      Top = 8
      Width = 25
      Height = 25
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      OnClick = btn_excluir_refClick
    end
    object btn_imprimir_recibo: TSpeedButton
      Left = 159
      Top = 8
      Width = 25
      Height = 25
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = btn_imprimir_reciboClick
    end
    object btn_sair: TSpeedButton
      Left = 223
      Top = 7
      Width = 25
      Height = 25
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
  end
  object pnl_dados: TPanel
    Left = 6
    Top = 56
    Width = 620
    Height = 373
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 30
      Top = 45
      Width = 111
      Height = 16
      Caption = 'Recebemos de '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_cliente: TLabel
      Left = 144
      Top = 45
      Width = 444
      Height = 16
      AutoSize = False
      Caption = 'Tintas Supercor S.A  ( lbl_cliente )'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 30
      Top = 71
      Width = 91
      Height = 16
      Caption = 'a quantia de '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_quantia: TLabel
      Left = 143
      Top = 71
      Width = 444
      Height = 68
      AutoSize = False
      Caption = 
        'Trezentos e noventa e tr'#234's milh'#245'es, quatrocentos e sessenta e ci' +
        'nco mil, novecentos e noventa e nove reais e cinquenta e cinco c' +
        'entavos de reais ( lbl_quantia )'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object Label3: TLabel
      Left = 29
      Top = 153
      Width = 76
      Height = 16
      Caption = 'referente a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_memo_ref_: TSpeedButton
      Left = 406
      Top = 243
      Width = 25
      Height = 25
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
      OnClick = btn_memo_ref_Click
    end
    object lbl_valor: TLabel
      Left = 323
      Top = 10
      Width = 265
      Height = 24
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'lbl_valor'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_data: TLabel
      Left = 333
      Top = 284
      Width = 255
      Height = 20
      Alignment = taRightJustify
      AutoSize = False
      Caption = '23 de Novembro de 1999 ( lbl_data )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbmemo_referente: TDBMemo
      Left = 143
      Top = 150
      Width = 443
      Height = 89
      BorderStyle = bsNone
      Color = clBlack
      DataField = 'TX_REFERENCIA'
      DataSource = datm_print_recibo.ds_ref_
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = dbmemo_referenteChange
    end
    object dbnav_ref: TDBNavigator
      Left = 438
      Top = 243
      Width = 148
      Height = 25
      DataSource = datm_print_recibo.ds_ref_
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      TabOrder = 1
    end
    object dbctrlGrid_Ref: TDBCtrlGrid
      Left = 4
      Top = 10
      Width = 611
      Height = 354
      DataSource = datm_print_recibo.ds_ref_
      PanelHeight = 59
      PanelWidth = 595
      TabOrder = 2
      RowCount = 6
      SelectedColor = 8404992
      Visible = False
      object dbmemoref_: TDBMemo
        Left = 3
        Top = 3
        Width = 588
        Height = 52
        DataField = 'TX_REFERENCIA'
        DataSource = datm_print_recibo.ds_ref_
        TabOrder = 0
        OnChange = dbmemo_referenteChange
        OnDblClick = dbmemoref_DblClick
      end
    end
  end
  object menu: TMainMenu
    Left = 510
    Top = 239
    object mi_incluir_ref: TMenuItem
      Caption = '&Incluir'
      Hint = 'Incluir nota de refer'#234'ncia'
      OnClick = btn_incluir_refClick
    end
    object mi_salvar: TMenuItem
      Caption = 'S&alvar'
      Enabled = False
      Hint = 'Salvar nota de refer'#234'ncia'
      OnClick = btn_salvar_refClick
    end
    object mi_cancelar_referencia: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      Hint = 'Cancelar altera'#231#245'es'
      OnClick = btn_cancelar_refClick
    end
    object mi_excluir_referencia: TMenuItem
      Caption = '&Excluir'
      Hint = 'Excluir'
      OnClick = btn_excluir_refClick
    end
    object mi_imprimir_recibo: TMenuItem
      Caption = 'I&mprimir recibo'
      Hint = 'Imprimir'
      OnClick = btn_imprimir_reciboClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = 'Sair'
      OnClick = btn_sairClick
    end
  end
  object crystallRecibo: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 46
    Top = 368
  end
end
