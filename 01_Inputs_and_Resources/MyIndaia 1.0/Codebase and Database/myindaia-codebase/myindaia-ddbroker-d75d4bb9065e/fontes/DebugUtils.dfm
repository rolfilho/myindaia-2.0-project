object FormDebugUtils: TFormDebugUtils
  Left = 196
  Top = 117
  Width = 928
  Height = 480
  Caption = 'Debug Utils'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 912
    Height = 41
    Align = alBottom
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 400
    Align = alClient
    BorderWidth = 8
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 9
      Top = 9
      Width = 894
      Height = 382
      Align = alClient
      DataSource = DataSource
      PopupMenu = PopupMenu1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object DataSource: TDataSource
    Left = 224
    Top = 100
  end
  object PopupMenu1: TPopupMenu
    Left = 440
    Top = 108
    object ExportarparaCSV1: TMenuItem
      Caption = 'Exportar para CSV'
      OnClick = ExportarparaCSV1Click
    end
  end
end
