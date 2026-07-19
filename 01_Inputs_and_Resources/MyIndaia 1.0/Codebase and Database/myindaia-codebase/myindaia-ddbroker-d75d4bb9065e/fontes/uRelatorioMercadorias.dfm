object frmRelatorioMercadorias: TfrmRelatorioMercadorias
  Left = 239
  Top = 129
  Width = 354
  Height = 156
  Caption = 'Relat'#243'rio Mercadorias'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 59
    Top = 12
    Width = 29
    Height = 13
    Caption = 'Grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 251
    Top = 14
    Width = 73
    Height = 13
    Caption = '*Ctrl para limpar'
  end
  object Panel1: TPanel
    Left = 0
    Top = 77
    Width = 338
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      338
      41)
    object BitBtn1: TBitBtn
      Left = 251
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 171
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object cbGrupo: TDBLookupComboBox
    Left = 59
    Top = 28
    Width = 268
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'CD_GRUPO'
    ListField = 'NM_GRUPO'
    ListSource = dsGrupo
    ParentFont = False
    TabOrder = 1
    OnCloseUp = cbGrupoCloseUp
    OnExit = cbGrupoExit
    OnKeyDown = cbGrupoKeyDown
  end
  object edtGrupo: TEdit
    Left = 11
    Top = 28
    Width = 41
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = edtGrupoExit
    OnKeyDown = edtGrupoKeyDown
  end
  object qryGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 120
    Top = 26
    object strngfldqry1CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object strngfldqry1NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    Left = 150
    Top = 27
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 179
    Top = 28
    object strngfldGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object strngfldGrupoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 207
    Top = 29
  end
  object SQLConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'DataBase=BROKER'
      'User_Name=SA'
      'Password=123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Connected = True
    Left = 236
    Top = 29
  end
end
