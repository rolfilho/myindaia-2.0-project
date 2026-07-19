object FramePeriodo: TFramePeriodo
  Left = 0
  Top = 0
  Width = 143
  Height = 22
  AutoSize = True
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object Label1: TLabel
    Left = 68
    Top = 3
    Width = 6
    Height = 14
    Caption = 'a'
  end
  object medDataInicial: TMaskEdit
    Left = 0
    Top = 0
    Width = 62
    Height = 22
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnExit = medDataInicialExit
  end
  object medDataFinal: TMaskEdit
    Left = 80
    Top = 0
    Width = 63
    Height = 22
    EditMask = '!99/99/9999;1; '
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
    OnExit = medDataFinalExit
  end
end
