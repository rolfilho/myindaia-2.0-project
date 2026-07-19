object FrameMoeda: TFrameMoeda
  Left = 0
  Top = 0
  Width = 268
  Height = 37
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
    Left = 0
    Top = 0
    Width = 36
    Height = 14
    Caption = 'Moeda'
  end
  object edtCodigo: TEdit
    Left = 0
    Top = 15
    Width = 40
    Height = 22
    TabOrder = 0
    OnChange = edtCodigoChange
    OnExit = edtCodigoExit
  end
  object DBLookupComboBox: TDBLookupComboBox
    Left = 40
    Top = 15
    Width = 228
    Height = 22
    KeyField = 'Self'
    ListField = 'CdMoeda; NmMoeda'
    ListFieldIndex = 1
    NullValueKey = 16452
    TabOrder = 1
  end
end
