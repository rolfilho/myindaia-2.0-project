inherited formAjuda: TformAjuda
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeable
  Caption = 'Ajuda'
  ClientHeight = 622
  ClientWidth = 1243
  ExplicitWidth = 1259
  ExplicitHeight = 661
  PixelsPerInch = 96
  TextHeight = 16
  inherited Panel1: TPanel
    Top = 581
    Width = 1243
    ExplicitTop = 581
    ExplicitWidth = 1243
    inherited btnCancela: TSpeedButton
      Left = 1067
      Visible = False
      ExplicitLeft = 579
    end
    inherited btnOk: TButton
      Left = 1155
      ExplicitLeft = 1155
    end
  end
  object pnlTxt: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 581
    Align = alLeft
    TabOrder = 1
    object txtDescricaoAjuda: TMemo
      Left = 1
      Top = 1
      Width = 367
      Height = 579
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 304
    end
  end
  object pnlImg: TPanel
    Left = 369
    Top = 0
    Width = 874
    Height = 581
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 0
    ExplicitWidth = 633
    object imgAjuda: TImage
      Left = 1
      Top = 1
      Width = 872
      Height = 579
      Align = alClient
      AutoSize = True
      ExplicitLeft = -319
      ExplicitTop = -4
      ExplicitWidth = 576
    end
  end
end
