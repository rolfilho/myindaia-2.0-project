object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'TM Service'
  ClientHeight = 79
  ClientWidth = 195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 8
    Width = 110
    Height = 19
    Caption = 'Homologa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnIniciar: TButton
    Left = 16
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btnIniciarClick
  end
  object btnParar: TButton
    Left = 108
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Parar'
    Enabled = False
    TabOrder = 1
    OnClick = btnPararClick
  end
end
