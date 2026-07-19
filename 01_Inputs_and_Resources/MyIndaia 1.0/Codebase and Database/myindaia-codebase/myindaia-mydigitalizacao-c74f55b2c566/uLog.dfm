object frmMyDigLog: TfrmMyDigLog
  Left = 192
  Top = 103
  Width = 928
  Height = 480
  Caption = 'Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object reLog: TRichEdit
    Left = 0
    Top = 0
    Width = 920
    Height = 453
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
end
