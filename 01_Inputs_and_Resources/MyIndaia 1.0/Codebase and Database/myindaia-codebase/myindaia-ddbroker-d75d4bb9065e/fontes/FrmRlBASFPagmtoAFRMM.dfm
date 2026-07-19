object FormRlBASFPagmtoAFRMM: TFormRlBASFPagmtoAFRMM
  Left = 208
  Top = 166
  BorderStyle = bsDialog
  Caption = 'BASF Armazenagem - Expo'
  ClientHeight = 168
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
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
    Left = 81
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
  object Panel1: TPanel
    Left = 0
    Top = 127
    Width = 316
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      316
      41)
    object BitBtn1: TBitBtn
      Left = 229
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 149
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object mskDataregistroIni: TMaskEdit
    Left = 8
    Top = 21
    Width = 67
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
    Left = 96
    Top = 21
    Width = 67
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
  object chbBasfSa: TCheckBox
    Left = 12
    Top = 54
    Width = 224
    Height = 17
    Caption = '002 - BASF S.A. '
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object chbBasfPoliuretanos: TCheckBox
    Left = 12
    Top = 75
    Width = 221
    Height = 17
    Caption = '013 - BASF POLIURETANOS  '
    TabOrder = 4
  end
  object chbChemetall: TCheckBox
    Left = 12
    Top = 98
    Width = 221
    Height = 17
    Caption = '559 - CHEMETALL'
    TabOrder = 5
  end
end
