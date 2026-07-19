object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Rob'#244' DUe - Consulta Resumida'
  ClientHeight = 421
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 73
    Align = alTop
    TabOrder = 0
    DesignSize = (
      462
      73)
    object lblProgresso: TLabel
      Left = 209
      Top = 46
      Width = 64
      Height = 13
      Caption = 'Consultando:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object btnExecutar: TButton
      Left = 191
      Top = 8
      Width = 90
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Executar'
      TabOrder = 0
      OnClick = btnExecutarClick
    end
    object btnSettings: TButton
      Left = 287
      Top = 7
      Width = 82
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Prefer'#234'ncias'
      TabOrder = 1
      OnClick = btnSettingsClick
    end
    object Button3: TButton
      Left = 375
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object cbxValidar: TCheckBox
      Left = 131
      Top = 45
      Width = 57
      Height = 17
      Anchors = [akRight, akBottom]
      Caption = 'Validar'
      TabOrder = 3
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 4
      Top = 3
      Width = 121
      Height = 64
      Caption = 'Teste Consulta DUE'
      TabOrder = 4
      object Edit1: TEdit
        Left = 3
        Top = 17
        Width = 110
        Height = 21
        TabOrder = 0
        Text = '22BR0013155022'
      end
      object Button1: TButton
        Left = 3
        Top = 36
        Width = 94
        Height = 22
        Caption = 'Consulta (teste)'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 402
    Width = 462
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
      end
      item
        Width = 10
      end>
  end
  object Memo: TMemo
    Left = 0
    Top = 73
    Width = 462
    Height = 329
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object tmrIntegracao: TTimer
    OnTimer = tmrIntegracaoTimer
    Left = 32
    Top = 64
  end
end
