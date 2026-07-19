object FrameData: TFrameData
  Left = 0
  Top = 0
  Width = 64
  Height = 22
  AutoSize = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object medData: TMaskEdit
    Left = 0
    Top = 0
    Width = 64
    Height = 22
    EditMask = '!##/##/####;1; '
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
    OnExit = medDataExit
  end
end
