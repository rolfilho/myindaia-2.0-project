object frm_Impressao_Cheque: Tfrm_Impressao_Cheque
  Left = 112
  Top = 52
  Width = 640
  Height = 480
  Caption = 'Emissão de Cheques'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 215
    Top = 12
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
  end
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 631
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 0
    object btn_imprime: TSpeedButton
      Left = 17
      Top = 11
      Width = 25
      Height = 25
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
      OnClick = btn_imprimeClick
    end
    object btn_sair: TSpeedButton
      Left = 207
      Top = 11
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
    object dbnvg: TDBNavigator
      Left = 77
      Top = 11
      Width = 104
      Height = 25
      DataSource = datm_impressao_cheque.ds_solic_ch
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Próximo'
        'Último')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object pnl_emissao: TPanel
    Left = 0
    Top = 56
    Width = 631
    Height = 358
    BevelOuter = bvLowered
    TabOrder = 1
    object lblBancos: TLabel
      Left = 214
      Top = 6
      Width = 43
      Height = 13
      Caption = 'Bancos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_nr_cheque_ini: TLabel
      Left = 511
      Top = 6
      Width = 100
      Height = 13
      Caption = 'Cheque Inicial Nº'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblCheques: TLabel
      Left = 7
      Top = 128
      Width = 187
      Height = 13
      Caption = 'Selecione os cheques a imprimir:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_nr_solic: TLabel
      Left = 47
      Top = 145
      Width = 50
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Nº Sol.'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_favorecido: TLabel
      Left = 99
      Top = 145
      Width = 241
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Favorecido'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_vl_solic: TLabel
      Left = 342
      Top = 145
      Width = 94
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Valor'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_status: TLabel
      Left = 438
      Top = 145
      Width = 95
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Status'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl_emitir: TLabel
      Left = 7
      Top = 145
      Width = 38
      Height = 17
      Alignment = taCenter
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
    object Label1: TLabel
      Left = 3
      Top = 6
      Width = 61
      Height = 13
      Caption = 'Solicitante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 535
      Top = 145
      Width = 64
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Nr.Cheque'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 601
      Top = 145
      Width = 16
      Height = 17
      Alignment = taCenter
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
    object dbgrdSolicCheque: TDBGrid
      Left = 214
      Top = 24
      Width = 290
      Height = 95
      DataSource = datm_impressao_cheque.ds_solic_banco
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          FieldName = 'CD_BANCO'
          Title.Caption = 'Cod.'
          Title.Color = clBlack
        end
        item
          FieldName = 'LookBanco'
          Title.Color = clBlack
          Width = 225
        end>
    end
    object msk_nr_cheque: TMaskEdit
      Left = 511
      Top = 24
      Width = 90
      Height = 21
      EditMask = '999999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 6
      Top = 162
      Width = 611
      Height = 190
      ColCount = 1
      DataSource = datm_impressao_cheque.ds_solic_ch
      PanelHeight = 19
      PanelWidth = 595
      TabOrder = 2
      RowCount = 10
      SelectedColor = clTeal
      object dbtxt_nr_solic_ch: TDBText
        Left = 47
        Top = 2
        Width = 39
        Height = 15
        DataField = 'NR_SOLIC_CH'
        DataSource = datm_impressao_cheque.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxt_favorecido: TDBText
        Left = 94
        Top = 2
        Width = 239
        Height = 15
        DataField = 'LookFavorecido'
        DataSource = datm_impressao_cheque.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxt_vl_solic_: TDBText
        Left = 337
        Top = 2
        Width = 92
        Height = 16
        Alignment = taRightJustify
        DataField = 'VL_SOLIC_CH'
        DataSource = datm_impressao_cheque.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxt_status: TDBText
        Left = 434
        Top = 2
        Width = 92
        Height = 15
        DataField = 'LookStatus'
        DataSource = datm_impressao_cheque.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxt_nr_cheque: TDBText
        Left = 530
        Top = 4
        Width = 63
        Height = 15
        Alignment = taRightJustify
        DataField = 'NR_CHEQUE'
        DataSource = datm_impressao_cheque.ds_solic_ch
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbchkbox_emitir: TDBCheckBox
        Left = 11
        Top = 1
        Width = 14
        Height = 17
        Caption = 'dbchkbox_emitir'
        DataField = 'IN_EMITIR'
        DataSource = datm_impressao_cheque.ds_solic_ch
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 24
      Width = 206
      Height = 95
      DataSource = datm_impressao_cheque.ds_solic_usuarios
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          FieldName = 'lookUsuario'
          Title.Caption = 'Usuario'
          Title.Color = clBlack
          Width = 173
        end>
    end
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 415
    Width = 441
    Height = 19
    Align = alNone
    Panels = <>
    SimplePanel = True
  end
  object Cidade: TStatusBar
    Left = 449
    Top = 415
    Width = 176
    Height = 19
    Align = alNone
    Panels = <>
    SimplePanel = True
  end
  object menu_cadastro: TMainMenu
    Left = 569
    Top = 4
    object mi_imprime: TMenuItem
      Caption = '&Imprimir'
      OnClick = btn_imprimeClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
