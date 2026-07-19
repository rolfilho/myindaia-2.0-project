object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 198
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btn1: TButton
    Left = 32
    Top = 48
    Width = 113
    Height = 25
    Caption = 'Grava NFSE DLL'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtnr_processo: TEdit
    Left = 88
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0101IA-000965-20'
  end
  object btn02: TBitBtn
    Left = 168
    Top = 48
    Width = 105
    Height = 25
    Caption = 'Grava NFSE Unit'
    TabOrder = 2
    OnClick = btn02Click
  end
end
