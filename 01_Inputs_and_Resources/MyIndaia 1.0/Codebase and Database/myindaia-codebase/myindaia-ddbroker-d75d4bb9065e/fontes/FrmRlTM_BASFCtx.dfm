object FormRlTM_BASFCtx: TFormRlTM_BASFCtx
  Left = 408
  Top = 260
  BorderStyle = bsToolWindow
  Caption = 'TM-BASF'
  ClientHeight = 193
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 152
    Width = 489
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      489
      41)
    object BitBtn1: TBitBtn
      Left = 402
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 322
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancela'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object pgFiltros: TPageControl
    Left = 0
    Top = 0
    Width = 489
    Height = 83
    ActivePage = tbImpo
    Align = alTop
    TabOrder = 0
    object tbExpo: TTabSheet
      Caption = 'Exporta'#231#227'o'
      object Label1: TLabel
        Left = 8
        Top = 5
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
        Left = 81
        Top = 25
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
      object mskDataregistroIni: TMaskEdit
        Left = 8
        Top = 21
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
      object mskDataregistroFin: TMaskEdit
        Left = 96
        Top = 21
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
    end
    object tbImpo: TTabSheet
      Caption = 'Importa'#231#227'o'
      ImageIndex = 1
      object Label3: TLabel
        Left = 8
        Top = 5
        Width = 47
        Height = 13
        Caption = 'Qt. Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtQtDias: TEdit
        Left = 9
        Top = 21
        Width = 38
        Height = 21
        MaxLength = 3
        TabOrder = 0
        Text = '10'
        OnKeyPress = edtQtDiasKeyPress
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 83
    Width = 489
    Height = 69
    Align = alClient
    TabOrder = 1
    object lblNrProcesso: TLabel
      Left = 359
      Top = 24
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
      Left = 8
      Top = 25
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
    object Label4: TLabel
      Left = 211
      Top = 25
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
    object Label5: TLabel
      Left = 8
      Top = 4
      Width = 183
      Height = 13
      Caption = 'Os filtros acima ser'#227'o desconsiderados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object edtNrProcesso: TEdit
      Left = 359
      Top = 40
      Width = 84
      Height = 21
      MaxLength = 12
      TabOrder = 4
    end
    object edUnidade: TEdit
      Left = 8
      Top = 41
      Width = 27
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnExit = edUnidadeExit
      OnKeyDown = edUnidadeKeyDown
    end
    object cbUnidade: TDBLookupComboBox
      Left = 38
      Top = 41
      Width = 163
      Height = 21
      DropDownWidth = 300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'CD_UNID_NEG'
      ListField = 'NM_UNID_NEG'
      ListSource = dsUnidadeNeg
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnCloseUp = cbUnidadeCloseUp
      OnExit = cbUnidadeExit
      OnKeyDown = cbUnidadeKeyDown
    end
    object edtProduto: TEdit
      Left = 211
      Top = 41
      Width = 27
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnExit = edtProdutoExit
      OnKeyDown = edtProdutoKeyDown
    end
    object cbProduto: TDBLookupComboBox
      Left = 241
      Top = 41
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
      TabOrder = 3
      TabStop = False
      OnCloseUp = cbProdutoCloseUp
      OnExit = cbProdutoExit
      OnKeyDown = cbProdutoKeyDown
    end
    object btnLimpar: TBitBtn
      Left = 450
      Top = 40
      Width = 25
      Height = 21
      Hint = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnLimparClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        00006FF6FF6666666666666666666666666666660000FFFFFFFF666666666666
        66666666666666660000FFFFFF8111666666666666666888666666660000FFFF
        F89111166666666666668888866666660000FFFFF91911116666666666688888
        886666660000FF6F619991110666666666687888888666660000F66669191910
        8066666666688788888866660000666666919103780666666666887888788666
        00006666666910BB3780666666666888778788660000666666663BF7B3780666
        66666687F778788600006666666663BF7B303066666666687F77888800006666
        6666663BFB0333666666666687F788880000666666666663B37B336666666666
        68787788000066666666666637BBB36666666666668777780000666666666666
        63FBBB66666666666668F7770000666666666666663FBB666666666666668F77
        0000}
      NumGlyphs = 2
    end
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
    Left = 360
    Top = 16
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
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 421
    Top = 13
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 368
    Top = 19
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
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 420
    Top = 18
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
    Left = 195
    Top = 25
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
    Left = 281
    Top = 14
  end
  object cdsUnidadeNeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidadeNeg'
    Left = 188
    Top = 25
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
    Left = 294
    Top = 14
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
    Left = 290
    Top = 62
  end
end
