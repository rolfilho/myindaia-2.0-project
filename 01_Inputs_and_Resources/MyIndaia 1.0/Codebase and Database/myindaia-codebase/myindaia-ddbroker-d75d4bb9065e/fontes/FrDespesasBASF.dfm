object frmDespesasBASF: TfrmDespesasBASF
  Left = 264
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Despesas BASF'
  ClientHeight = 305
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 10
    Width = 46
    Height = 13
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 36
    Width = 8
    Height = 13
    Caption = 'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 11
    Top = 81
    Width = 37
    Height = 13
    Caption = 'Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object mskDataIni: TMaskEdit
    Left = 9
    Top = 32
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
  end
  object mskDataFin: TMaskEdit
    Left = 109
    Top = 32
    Width = 67
    Height = 21
    CharCase = ecUpperCase
    EditMask = '!99/99/0000;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 1
    Text = '  /  /    '
  end
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 296
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      296
      41)
    object BitBtn1: TBitBtn
      Left = 210
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 130
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object chbBasfSa: TCheckBox
    Left = 12
    Top = 134
    Width = 224
    Height = 17
    Caption = '002 - BASF S.A. '
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object chbBasfPoliuretanos: TCheckBox
    Left = 12
    Top = 155
    Width = 221
    Height = 17
    Caption = '013 - BASF POLIURETANOS  '
    TabOrder = 4
  end
  object chbChemetall: TCheckBox
    Left = 12
    Top = 178
    Width = 221
    Height = 17
    Caption = '559 - CHEMETALL'
    TabOrder = 5
  end
  object edtProduto: TEdit
    Left = 11
    Top = 97
    Width = 27
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 6
    OnExit = edtProdutoExit
    OnKeyDown = edtProdutoKeyDown
  end
  object cbProduto: TDBLookupComboBox
    Left = 41
    Top = 97
    Width = 198
    Height = 21
    DropDownWidth = 200
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyField = 'CD_PRODUTO'
    ListField = 'NM_PRODUTO'
    ListSource = dsProduto
    ParentFont = False
    TabOrder = 7
    TabStop = False
    OnCloseUp = cbProdutoCloseUp
    OnExit = cbProdutoExit
    OnKeyDown = cbProdutoKeyDown
  end
  object chbSuvinil: TCheckBox
    Left = 12
    Top = 201
    Width = 216
    Height = 17
    Caption = 'D28 - SUVINIL'
    TabOrder = 8
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.csv'
    Filter = 'Arquivo CSV (*.csv)|*.csv'
    Title = 'Salvar como'
    Left = 194
    Top = 19
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 237
    Top = 154
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 233
    Top = 151
    object cdsProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsProdutoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Required = True
      FixedChar = True
      Size = 45
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 234
    Top = 155
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_PRODUTO '
      ',CD_PRODUTO + '#39' - '#39' + NM_PRODUTO AS NM_PRODUTO'
      ' FROM TPRODUTO'
      'ORDER BY CD_PRODUTO ')
    SQLConnection = SQLConnection
    Left = 238
    Top = 154
    object qryProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryProdutoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Required = True
      FixedChar = True
      Size = 45
    end
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
    Left = 247
    Top = 62
  end
end
