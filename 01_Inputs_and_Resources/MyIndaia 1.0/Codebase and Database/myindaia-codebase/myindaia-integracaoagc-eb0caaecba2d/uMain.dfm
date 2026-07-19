object FormMain: TFormMain
  Left = 977
  Top = 0
  Caption = 'Integra'#231#227'o AGC'
  ClientHeight = 350
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      491
      41)
    object btnColetar: TButton
      Left = 11
      Top = 10
      Width = 76
      Height = 25
      Caption = 'Coletar'
      TabOrder = 0
      TabStop = False
      OnClick = btnColetarClick
    end
    object btnSettings: TButton
      Left = 359
      Top = 9
      Width = 68
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Prefer'#234'ncias'
      TabOrder = 1
      TabStop = False
      OnClick = btnSettingsClick
    end
    object Button3: TButton
      Left = 431
      Top = 9
      Width = 53
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      TabOrder = 2
      TabStop = False
      OnClick = Button3Click
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 331
    Width = 491
    Height = 19
    Panels = <
      item
        Text = 'Pr'#243'xima itera'#231#227'o'
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 50
      end>
  end
  object Memo: TMemo
    Left = 0
    Top = 41
    Width = 491
    Height = 290
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 48
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    Left = 424
    Top = 224
  end
end
