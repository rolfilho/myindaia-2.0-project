object formAjuda: TformAjuda
  Left = 462
  Top = 218
  Width = 781
  Height = 561
  Caption = 'Ajuda'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 482
    Width = 765
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnOk: TButton
      Left = 672
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 765
    Height = 482
    Align = alClient
    TabOrder = 1
    object imgAjuda: TImage
      Left = 352
      Top = 1
      Width = 412
      Height = 480
      Align = alClient
    end
    object txtDescricaoAjuda: TMemo
      Left = 1
      Top = 1
      Width = 351
      Height = 480
      Align = alLeft
      Lines.Strings = (
        'txtDescricaoAjuda')
      TabOrder = 0
    end
  end
end
