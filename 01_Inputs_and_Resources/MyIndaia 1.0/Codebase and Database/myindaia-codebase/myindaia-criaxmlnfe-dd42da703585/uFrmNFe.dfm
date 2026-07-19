object frmNfe: TfrmNfe
  Left = 0
  Top = 0
  Caption = 'Cria XML Nfe'
  ClientHeight = 277
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Processo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNrProcesso: TEdit
    Left = 16
    Top = 32
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object btnGerar: TButton
    Left = 160
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Criar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnGerarClick
  end
  object memoLog: TMemo
    Left = 16
    Top = 71
    Width = 377
    Height = 186
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
