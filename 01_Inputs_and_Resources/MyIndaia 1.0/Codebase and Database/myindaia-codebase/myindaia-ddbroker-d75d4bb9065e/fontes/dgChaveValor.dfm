object frmChaveValor: TfrmChaveValor
  Left = 369
  Top = 218
  BorderStyle = bsDialog
  Caption = 'ChaveValor'
  ClientHeight = 134
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblChave: TLabel
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Chave'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValor: TLabel
    Left = 8
    Top = 48
    Width = 30
    Height = 13
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edChave: TEdit
    Left = 8
    Top = 24
    Width = 325
    Height = 21
    TabOrder = 0
  end
  object edValor: TEdit
    Left = 8
    Top = 64
    Width = 325
    Height = 21
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 93
    Width = 342
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      342
      41)
    object Button1: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 177
      Top = 8
      Width = 75
      Height = 25
      Anchors = []
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
