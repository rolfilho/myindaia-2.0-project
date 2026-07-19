inherited formSQLMonitor: TformSQLMonitor
  Caption = 'SQL Monitor'
  ClientHeight = 442
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 786
    Height = 407
    Align = alClient
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitWidth = 592
    ExplicitHeight = 283
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 407
    Width = 786
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 285
    ExplicitWidth = 592
    DesignSize = (
      786
      35)
    object btClear: TButton
      Left = 689
      Top = 5
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Limpar'
      TabOrder = 0
      OnClick = btClearClick
      ExplicitLeft = 495
    end
    object cbEnable: TCheckBox
      Left = 8
      Top = 9
      Width = 177
      Height = 17
      Caption = 'Habilitar SQL Logging'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbEnableClick
    end
  end
end
