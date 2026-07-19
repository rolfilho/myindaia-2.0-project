object frm_di_rec_diag: Tfrm_di_rec_diag
  Left = 172
  Top = 179
  Width = 648
  Height = 488
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Diagn'#243'stico de Declara'#231#227'o de Importa'#231#227'o '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mi_menu
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbox_monitor: TGroupBox
    Left = 7
    Top = 380
    Width = 273
    Height = 56
    Caption = '[ Monitor ]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lbl_Capas: TLabel
      Left = 8
      Top = 17
      Width = 63
      Height = 13
      Caption = 'Processos '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 34
      Width = 65
      Height = 13
      Caption = 'Mensagem '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_processos: TLabel
      Left = 89
      Top = 17
      Width = 51
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_mensagem: TLabel
      Left = 89
      Top = 34
      Width = 172
      Height = 13
      AutoSize = False
      Caption = 'Aguardando instru'#231#227'o ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGSiscomexDI: TDBGrid
    Left = 4
    Top = 56
    Width = 629
    Height = 320
    DataSource = datm_di_rec_diag.ds_grd_di
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NR_DECL_IMP_MICRO'
        Title.Caption = 'N'#186' Siscomex'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'calcNR_IDENT_USUARIO'
        Title.Caption = 'Processo DI'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_DECLARACAO_IMP'
        Title.Caption = 'Registro DI'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_REGISTRO_DI'
        Title.Caption = 'Data Registro'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_DECL_IMP_PROT'
        Title.Caption = 'Transmiss'#227'o'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_TRANSMISSAO'
        Title.Caption = 'Data Transmiss'#227'o'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 109
        Visible = True
      end>
  end
  object pnl_cadastro: TPanel
    Left = 4
    Top = 3
    Width = 317
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 2
    object btn_sair: TSpeedButton
      Left = 83
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
    object btn_diag_DI: TSpeedButton
      Left = 13
      Top = 11
      Width = 25
      Height = 25
      Hint = 'Recuperar DI'#180's'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_diag_DIClick
    end
    object btn_cancelar: TSpeedButton
      Left = 47
      Top = 11
      Width = 25
      Height = 25
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
      OnClick = btn_cancelarClick
    end
  end
  object pnl_pesquisa: TPanel
    Left = 324
    Top = 3
    Width = 309
    Height = 44
    BevelOuter = bvLowered
    TabOrder = 3
    object lbl_pesquisa: TLabel
      Left = 6
      Top = 5
      Width = 56
      Height = 13
      Caption = 'Pesquisar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_ordem_pesquisa: TLabel
      Left = 148
      Top = 5
      Width = 37
      Height = 13
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_chave: TEdit
      Left = 6
      Top = 19
      Width = 139
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edt_chaveChange
    end
    object cb_ordem: TComboBox
      Left = 148
      Top = 19
      Width = 155
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cb_ordemChange
    end
  end
  object mi_menu: TMainMenu
    Left = 600
    Top = 344
    object mi_diag_di: TMenuItem
      Caption = 'Recu&pera'
      Hint = 'Recuperar D.I.'
      OnClick = btn_diag_DIClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
