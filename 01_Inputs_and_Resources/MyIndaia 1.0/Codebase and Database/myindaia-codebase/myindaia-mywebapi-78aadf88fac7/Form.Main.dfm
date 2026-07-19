object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Web API'
  ClientHeight = 66
  ClientWidth = 192
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
  object lblStatus: TLabel
    Left = 52
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Parado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Status: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnIniciar: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btnIniciarClick
  end
  object btnParar: TButton
    Left = 109
    Top = 33
    Width = 75
    Height = 25
    Caption = 'Parar'
    Enabled = False
    TabOrder = 1
    OnClick = btnPararClick
  end
end
