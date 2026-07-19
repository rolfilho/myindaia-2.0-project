object WebChromium: TWebChromium
  Left = 519
  Top = 114
  Width = 854
  Height = 621
  Caption = 'WebChromium'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object crm: TChromium
    Left = 0
    Top = 33
    Width = 838
    Height = 530
    Align = alClient
    DefaultUrl = 'about:blank'
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 838
    Height = 33
    Align = alTop
    TabOrder = 1
    object edAddress: TEdit
      Left = 6
      Top = 5
      Width = 787
      Height = 21
      TabOrder = 0
    end
    object btnLoad: TButton
      Left = 800
      Top = 3
      Width = 33
      Height = 23
      Caption = '>'
      TabOrder = 1
      OnClick = btnLoadClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 563
    Width = 838
    Height = 19
    Panels = <>
  end
end
