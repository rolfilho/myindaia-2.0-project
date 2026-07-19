object frm_proc_vinc_realiza: Tfrm_proc_vinc_realiza
  Left = 219
  Top = 148
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Realização por Processo Vinculado'
  ClientHeight = 434
  ClientWidth = 632
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 52
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
  object Label2: TLabel
    Left = 99
    Top = 51
    Width = 113
    Height = 13
    Caption = 'Processo Vinculado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 88
    Width = 626
    Height = 233
    DataSource = datm_proc_vinc_realiza.ds_tfollowup
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        FieldName = 'CD_EVENTO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        FieldName = 'LookEvento'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 415
      end
      item
        FieldName = 'DT_REALIZACAO'
        Title.Color = clBlack
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWhite
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
      end>
  end
  object edt_nr_processo: TEdit
    Left = 8
    Top = 64
    Width = 88
    Height = 21
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
    Text = ' '
  end
  object dbedt_nr_processo_vinc: TDBEdit
    Left = 99
    Top = 64
    Width = 88
    Height = 21
    Color = clMenu
    DataField = 'NR_PROCESSO_VINC'
    DataSource = datm_proc_vinc_realiza.ds_processo
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 169
    Height = 49
    BevelOuter = bvLowered
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 132
      Top = 12
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
      OnClick = SpeedButton1Click
    end
    object dbnvg: TDBNavigator
      Left = 6
      Top = 12
      Width = 104
      Height = 25
      DataSource = datm_proc_vinc_realiza.ds_tfollowup
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeira'
        'Anterior'
        'Próxima'
        'Última')
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 322
    Width = 632
    Height = 112
    Align = alBottom
    TabOrder = 4
  end
  object menu_manut: TMainMenu
    Left = 542
    Top = 4
    object mi_sair: TMenuItem
      Caption = '&Sair'
      OnClick = SpeedButton1Click
    end
  end
end
