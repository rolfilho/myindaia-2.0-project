object frmNumerariosNestle: TfrmNumerariosNestle
  Left = 221
  Top = 143
  Width = 288
  Height = 172
  Caption = 'Numer'#225'rios Nestle'
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
    Left = 13
    Top = 8
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
    Left = 96
    Top = 28
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
  object Label3: TLabel
    Left = 13
    Top = 48
    Width = 45
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object mskDataIni: TMaskEdit
    Left = 14
    Top = 24
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
  object mskDataFin: TMaskEdit
    Left = 121
    Top = 24
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
  object Panel1: TPanel
    Left = 0
    Top = 93
    Width = 272
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      272
      41)
    object BitBtn1: TBitBtn
      Left = 186
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 106
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object cbxProduto: TComboBox
    Left = 13
    Top = 64
    Width = 241
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 3
    Text = '01 - Importa'#231#227'o'
    Items.Strings = (
      '01 - Importa'#231#227'o'
      '02 - Exporta'#231#227'o')
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Arquivo CSV (*.csv)|*.csv'
    Title = 'Salvar como'
    Left = 224
    Top = 12
  end
end
