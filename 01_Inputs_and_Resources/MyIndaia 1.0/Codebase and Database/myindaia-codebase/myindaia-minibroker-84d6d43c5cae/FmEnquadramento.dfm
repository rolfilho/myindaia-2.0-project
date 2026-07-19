object FrameEnquadramento: TFrameEnquadramento
  Left = 0
  Top = 0
  Width = 267
  Height = 36
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 76
    Height = 13
    Caption = 'Enquadramento'
  end
  object edtCodigo: TEdit
    Left = 0
    Top = 15
    Width = 40
    Height = 21
    TabOrder = 0
    OnChange = edtCodigoChange
    OnExit = edtCodigoExit
  end
  object DBLookupComboBox: TDBLookupComboBox
    Left = 39
    Top = 15
    Width = 228
    Height = 21
    KeyField = 'Self'
    ListField = 'NmEnquadOp'
    ListFieldIndex = 1
    NullValueKey = 16452
    TabOrder = 1
  end
end
