object frmIntNexus: TfrmIntNexus
  Left = 180
  Top = 78
  BorderStyle = bsDialog
  Caption = 'TRACKING GT NEXUS - INTEGRA'#199#195'O'
  ClientHeight = 35
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 47
    Height = 13
    Caption = 'Arquivo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object fleArquivo: TFilenameEdit
    Left = 62
    Top = 8
    Width = 353
    Height = 21
    NumGlyphs = 1
    TabOrder = 0
  end
  object btnIntegrar: TBitBtn
    Left = 421
    Top = 6
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnIntegrarClick
    Kind = bkOK
  end
end
