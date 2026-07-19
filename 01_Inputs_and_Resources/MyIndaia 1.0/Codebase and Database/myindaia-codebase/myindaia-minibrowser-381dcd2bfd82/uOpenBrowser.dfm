object frmOpenBrowser: TfrmOpenBrowser
  Left = 500
  Top = 500
  Caption = 'Inicia consulta'
  ClientHeight = 61
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 194
    Height = 25
    Caption = 'Iniciando Browser ...'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Top = 16
  end
end
