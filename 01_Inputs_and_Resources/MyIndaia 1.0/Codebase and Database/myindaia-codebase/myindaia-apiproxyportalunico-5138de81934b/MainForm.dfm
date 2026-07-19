object fmServer: TfmServer
  Left = 0
  Top = 0
  Caption = 'API Proxy Portal '#218'nico'
  ClientHeight = 291
  ClientWidth = 384
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
    Width = 384
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 138
      Height = 21
      Caption = 'Server Not Running'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 384
    Height = 250
    Align = alClient
    TabOrder = 1
    object MemoLog: TMemo
      Left = 1
      Top = 1
      Width = 382
      Height = 248
      Align = alClient
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
