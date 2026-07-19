object FormRlCargilFaturadosExportacao: TFormRlCargilFaturadosExportacao
  Left = 378
  Top = 236
  BorderStyle = bsDialog
  Caption = 'Faturados Exporta'#231#227'o'
  ClientHeight = 90
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 46
    Height = 13
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 80
    Top = 25
    Width = 8
    Height = 13
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mskDataregistroIni: TMaskEdit
    Left = 9
    Top = 21
    Width = 68
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
  end
  object mskDataregistroFin: TMaskEdit
    Left = 97
    Top = 21
    Width = 68
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 255
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      255
      41)
    object BitBtn1: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
end
