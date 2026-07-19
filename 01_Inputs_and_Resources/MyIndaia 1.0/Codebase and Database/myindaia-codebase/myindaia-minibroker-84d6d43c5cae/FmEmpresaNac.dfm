object FrameEmpresaNac: TFrameEmpresaNac
  Left = 0
  Top = 0
  Width = 570
  Height = 36
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
    Top = -1
    Width = 60
    Height = 14
    Caption = 'Exportador'
  end
  object Panel1: TPanel
    Left = 0
    Top = 13
    Width = 570
    Height = 23
    Align = alBottom
    Alignment = taRightJustify
    TabOrder = 0
    object DBLookupComboBox: TDBLookupComboBox
      Left = 41
      Top = 1
      Width = 528
      Height = 22
      Align = alClient
      KeyField = 'Self'
      ListField = 'codigo;descricao'
      ListFieldIndex = 1
      NullValueKey = 16452
      TabOrder = 0
      ExplicitLeft = 42
    end
    object edtCodigo: TEdit
      Left = 1
      Top = 1
      Width = 40
      Height = 21
      Align = alLeft
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edtCodigoChange
      OnExit = edtCodigoExit
      ExplicitHeight = 22
    end
  end
end
