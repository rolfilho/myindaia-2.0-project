object frmRelatorioLIs: TfrmRelatorioLIs
  Left = 258
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de LIs'
  ClientHeight = 243
  ClientWidth = 454
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
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 243
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 102
      Width = 35
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNrProcesso: TLabel
      Left = 358
      Top = 152
      Width = 74
      Height = 13
      Caption = 'Nr. Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblUnidadeNeg: TLabel
      Left = 7
      Top = 153
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 210
      Top = 153
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 112
      Top = 71
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
      Left = 7
      Top = 51
      Width = 168
      Height = 13
      Caption = 'Per'#237'odo (Mudan'#231'a de Status)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtGrupo: TEdit
      Left = 7
      Top = 118
      Width = 41
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = edtGrupoExit
      OnKeyDown = edtGrupoKeyDown
    end
    object cbGrupo: TDBLookupComboBox
      Left = 52
      Top = 118
      Width = 390
      Height = 21
      DropDownWidth = 200
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
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 452
      Height = 39
      Align = alTop
      Alignment = taLeftJustify
      Caption = '    Relat'#243'rio de LIs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      DesignSize = (
        452
        39)
      object btn_sair: TSpeedButton
        Left = 417
        Top = 3
        Width = 28
        Height = 30
        Hint = 'Sair'
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
    end
    object edtNrProcesso: TEdit
      Left = 358
      Top = 168
      Width = 84
      Height = 21
      MaxLength = 12
      TabOrder = 3
    end
    object edUnidade: TEdit
      Left = 7
      Top = 169
      Width = 27
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 4
      OnExit = edUnidadeExit
      OnKeyDown = edUnidadeKeyDown
    end
    object cbUnidade: TDBLookupComboBox
      Left = 37
      Top = 169
      Width = 163
      Height = 21
      DropDownWidth = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CD_UNID_NEG'
      ListField = 'NM_UNID_NEG'
      ListSource = dsUnidadeNeg
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnCloseUp = cbUnidadeCloseUp
      OnExit = cbUnidadeExit
      OnKeyDown = cbUnidadeKeyDown
    end
    object edtProduto: TEdit
      Left = 210
      Top = 169
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
      Left = 240
      Top = 169
      Width = 106
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
    object Panel2: TPanel
      Left = 1
      Top = 203
      Width = 452
      Height = 39
      Align = alBottom
      TabOrder = 8
      DesignSize = (
        452
        39)
      object btnGerar: TBitBtn
        Left = 361
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Gerar'
        TabOrder = 0
        OnClick = btnGerarClick
      end
    end
    object mskDataregistroIni: TMaskEdit
      Left = 7
      Top = 67
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999 99:99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 16
      ParentFont = False
      TabOrder = 9
      Text = '  /  /       :  '
    end
    object mskDataregistroFin: TMaskEdit
      Left = 127
      Top = 67
      Width = 100
      Height = 21
      CharCase = ecUpperCase
      EditMask = '!99/99/9999 99:99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 16
      ParentFont = False
      TabOrder = 10
      Text = '  /  /       :  '
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
    Left = 359
    Top = 5
  end
  object qryUnidadeNeg: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_UNID_NEG '
      ',CD_UNID_NEG + '#39' - '#39' +  NM_UNID_NEG AS NM_UNID_NEG'
      'FROM TUNID_NEG'
      'ORDER BY CD_UNID_NEG ')
    SQLConnection = SQLConnection
    Left = 420
    Top = 54
    object qryUnidadeNegCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryUnidadeNegNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 55
    end
  end
  object dspUnidadeNeg: TDataSetProvider
    DataSet = qryUnidadeNeg
    Left = 408
    Top = 56
  end
  object cdsUnidadeNeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidadeNeg'
    Left = 410
    Top = 54
    object cdsUnidadeNegCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsUnidadeNegNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 55
    end
  end
  object dsUnidadeNeg: TDataSource
    DataSet = cdsUnidadeNeg
    Left = 400
    Top = 54
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 277
    Top = 58
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 261
    Top = 61
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
    Left = 264
    Top = 58
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
    Left = 260
    Top = 55
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
  object qryGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO      '
      '  FROM TGRUPO                  '
      ' WHERE ISNULL(IN_ATIVO,1) = 1  '
      ' ORDER BY NM_GRUPO             ')
    SQLConnection = SQLConnection
    Left = 344
    Top = 57
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
    Left = 338
    Top = 57
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 334
    Top = 60
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
    Left = 337
    Top = 57
  end
end
