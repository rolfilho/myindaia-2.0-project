inherited formMyDgOk: TformMyDgOk
  BorderStyle = bsDialog
  Caption = 'formMyDgOk'
  ClientHeight = 191
  ClientWidth = 506
  WindowState = wsNormal
  ExplicitWidth = 512
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 506
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      506
      41)
    object btnCancela: TSpeedButton
      Left = 330
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancela'
      OnClick = btnCancelaClick
    end
    object btnOk: TButton
      Left = 418
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
end
