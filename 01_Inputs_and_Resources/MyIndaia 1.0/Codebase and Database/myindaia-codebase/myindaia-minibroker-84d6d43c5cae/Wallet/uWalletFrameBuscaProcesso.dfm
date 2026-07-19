object FrameWalletPesquisaProcesso: TFrameWalletPesquisaProcesso
  Left = 0
  Top = 0
  Width = 1013
  Height = 240
  Align = alTop
  TabOrder = 0
  object pnlFiltroProcesso: TPanel
    Left = 0
    Top = 0
    Width = 906
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 344
    ExplicitHeight = 178
    object pnlStyle1: TPanel
      Left = 0
      Top = 0
      Width = 906
      Height = 4
      Align = alTop
      BevelOuter = bvNone
      Color = 16758122
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 344
    end
    object pnlFiltroProc: TPanel
      Left = 0
      Top = 4
      Width = 906
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 344
      object lblUnidNeg: TLabel
        Left = 10
        Top = 13
        Width = 110
        Height = 14
        Caption = 'Unidade de Neg'#243'cio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblProduto: TLabel
        Left = 297
        Top = 13
        Width = 44
        Height = 14
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFiltroProcesso: TLabel
        Left = 583
        Top = 10
        Width = 48
        Height = 14
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbcbUnidNegocioNome: TDBLookupComboBox
        Left = 50
        Top = 30
        Width = 230
        Height = 22
        Color = clWhite
        DropDownWidth = 272
        KeyField = 'Id'
        ListField = 'Name'
        ListSource = dtsUnidade
        NullValueKey = 16401
        TabOrder = 0
        TabStop = False
        OnCloseUp = dbcbUnidNegocioNomeCloseUp
        OnExit = dbcbUnidNegocioNomeExit
        OnKeyDown = dbcbUnidNegocioNomeKeyDown
      end
      object dbcbProdutoNome: TDBLookupComboBox
        Left = 336
        Top = 30
        Width = 230
        Height = 22
        Color = clWhite
        DropDownWidth = 272
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'Id'
        ListField = 'Name'
        ListSource = dtsProduto
        NullValueKey = 16401
        ParentFont = False
        TabOrder = 1
        TabStop = False
        OnCloseUp = dbcbProdutoNomeCloseUp
        OnExit = dbcbProdutoNomeExit
        OnKeyDown = dbcbProdutoNomeKeyDown
      end
      object edtProcesso: TcxMaskEdit
        Left = 583
        Top = 30
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.EditMask = 'll-999999-99;1;_'
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Text = '  -      -  '
        OnEnter = edtProcessoEnter
        OnKeyDown = edtProcessoKeyDown
        OnKeyPress = edtProcessoKeyPress
        Width = 100
      end
      object edtProduto: TcxMaskEdit
        Left = 297
        Top = 30
        ParentFont = False
        Properties.EditMask = '99;1; '
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 3
        Text = '  '
        OnEnter = edtProdutoEnter
        OnExit = edtProdutoExit
        OnKeyDown = edtProdutoKeyDown
        OnKeyPress = edtProdutoKeyPress
        Width = 35
      end
      object edtUnidadeNeg: TcxMaskEdit
        Left = 10
        Top = 30
        ParentFont = False
        Properties.EditMask = '99;1; '
        Properties.MaxLength = 0
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Text = '  '
        OnExit = edtUnidadeNegExit
        OnKeyDown = edtUnidadeNegKeyDown
        OnKeyPress = edtUnidadeNegKeyPress
        Width = 35
      end
    end
    object pnlResumoProc: TPanel
      Left = 0
      Top = 69
      Width = 906
      Height = 108
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      ExplicitWidth = 344
      object lblCliente: TLabel
        Left = 11
        Top = 60
        Width = 37
        Height = 14
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCnpj: TLabel
        Left = 374
        Top = 60
        Width = 52
        Height = 14
        Caption = 'CNPJ/CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblServico: TLabel
        Left = 500
        Top = 60
        Width = 39
        Height = 14
        Caption = 'Servi'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSaldo: TLabel
        Left = 158
        Top = 8
        Width = 29
        Height = 14
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblProcesso: TLabel
        Left = 11
        Top = 8
        Width = 48
        Height = 14
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 271
        Top = 8
        Width = 32
        Height = 14
        Caption = 'Limite'
      end
      object pnlStyle2: TPanel
        Left = 0
        Top = 0
        Width = 906
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        Color = 16758122
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 344
      end
      object dbedtCliente: TDBEdit
        Left = 11
        Top = 77
        Width = 357
        Height = 22
        Color = 14935011
        DataField = 'CustomerId.Name'
        DataSource = dtsProcesso
        TabOrder = 1
      end
      object dbedtCNPJ: TDBEdit
        Left = 374
        Top = 77
        Width = 121
        Height = 22
        Color = 14935011
        DataField = 'calcCNPJ'
        DataSource = dtsProcesso
        TabOrder = 2
      end
      object dbedtServico: TDBEdit
        Left = 500
        Top = 77
        Width = 304
        Height = 22
        Color = 14935011
        DataField = 'ServiceId.Name'
        DataSource = dtsProcesso
        TabOrder = 3
      end
      object dbedtSaldo: TDBEdit
        Left = 158
        Top = 25
        Width = 108
        Height = 22
        Color = 14935011
        DataField = 'BalanceId.Value'
        DataSource = dtsProcesso
        TabOrder = 4
        OnChange = dbedtSaldoChange
      end
      object dbedtProcesso: TDBEdit
        Left = 11
        Top = 25
        Width = 142
        Height = 22
        Color = 14935011
        DataField = 'Customid'
        DataSource = dtsProcesso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object edtLimite: TEdit
        Left = 271
        Top = 25
        Width = 121
        Height = 22
        Color = 14935011
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object pnlBuscarProcesso: TPanel
    Left = 906
    Top = 0
    Width = 107
    Height = 240
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 344
    ExplicitHeight = 178
    object btnPesquisar: TBitBtn
      Left = 15
      Top = 20
      Width = 75
      Height = 34
      Caption = 'Buscar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnPesquisarClick
    end
  end
  object adsProcesso: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Customid'
        Attributes = [faRequired]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BalanceId'
        DataType = ftVariant
      end
      item
        Name = 'BalanceId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BalanceId.Value'
        DataType = ftFloat
      end
      item
        Name = 'CustomerId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomerId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Active'
        DataType = ftBoolean
      end
      item
        Name = 'CustomerId.City'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Neighborhood'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Number'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.State'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Street'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Zipcode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Fax'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Fone'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Inscestadual'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Inscmunicipal'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.GroupId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.GroupId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomerId.GroupId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.GroupId.DefinitionsId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.GroupId.GrupoJoin'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomerId.CountryId'
        DataType = ftVariant
      end
      item
        Name = 'CustomerId.CountryId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomerId.CountryId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.CountryId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomerId.CustomclearanceList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomerId.PaymentdefinitionList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ServiceId'
        DataType = ftVariant
      end
      item
        Name = 'ServiceId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ServiceId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ServiceId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'PaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    OnCalcFields = adsProcessoCalcFields
    SubpropsDepth = 2
    SyncSubprops = True
    Left = 744
    Top = 87
    DesignClass = 'MyEntitiesV2.TCustomclearance'
    object adsProcessoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProcessoId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsProcessoAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsProcessoCustomid: TStringField
      FieldName = 'Customid'
      Required = True
      Size = 255
    end
    object adsProcessoBalanceId: TAureliusEntityField
      FieldName = 'BalanceId'
    end
    object adsProcessoBalanceIdId: TLargeintField
      FieldName = 'BalanceId.Id'
      ReadOnly = True
    end
    object adsProcessoBalanceIdValue: TFloatField
      FieldName = 'BalanceId.Value'
      DisplayFormat = '#,##0.00'
    end
    object adsProcessoCustomerId: TAureliusEntityField
      FieldName = 'CustomerId'
    end
    object adsProcessoCustomerIdName: TStringField
      FieldName = 'CustomerId.Name'
      Size = 255
    end
    object adsProcessoCustomerIdTaxid: TStringField
      FieldName = 'CustomerId.Taxid'
      Size = 255
    end
    object adsProcessoServiceId: TAureliusEntityField
      FieldName = 'ServiceId'
    end
    object adsProcessoServiceIdId: TLargeintField
      FieldName = 'ServiceId.Id'
      ReadOnly = True
    end
    object adsProcessoServiceIdAkey: TStringField
      FieldName = 'ServiceId.Akey'
      Size = 255
    end
    object adsProcessoServiceIdName: TStringField
      FieldName = 'ServiceId.Name'
      Size = 255
    end
    object adsProcessoCustomerIdAkey: TStringField
      FieldName = 'CustomerId.Akey'
      Size = 255
    end
    object adsProcessocalcCnpj: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcCnpj'
      Calculated = True
    end
    object adsProcessoCustomerIdGroupIdId: TLargeintField
      FieldName = 'CustomerId.GroupId.Id'
      ReadOnly = True
    end
  end
  object dtsProcesso: TDataSource
    AutoEdit = False
    DataSet = adsProcesso
    Left = 736
    Top = 87
  end
  object adsProduto: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end>
    Left = 640
    Top = 87
    DesignClass = 'MyEntitiesV2.TProduct'
    object adsProdutoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsProdutoId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsProdutoAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsProdutoName: TStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object dtsProduto: TDataSource
    AutoEdit = False
    DataSet = adsProduto
    Left = 640
    Top = 87
  end
  object adsUnidade: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faReadonly, faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Iss'
        DataType = ftFloat
      end
      item
        Name = 'OrganizationId'
        DataType = ftVariant
      end>
    Left = 552
    Top = 87
    DesignClass = 'MyEntitiesV2.TBranch'
    object adsUnidadeSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsUnidadeId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsUnidadeAkey: TStringField
      FieldName = 'Akey'
      Size = 255
    end
    object adsUnidadeName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object adsUnidadeSeniorkey: TStringField
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsUnidadeTaxid: TStringField
      FieldName = 'Taxid'
      Size = 255
    end
    object adsUnidadeIss: TFloatField
      FieldName = 'Iss'
    end
    object adsUnidadeOrganizationId: TAureliusEntityField
      FieldName = 'OrganizationId'
    end
  end
  object dtsUnidade: TDataSource
    AutoEdit = False
    DataSet = adsUnidade
    Left = 552
    Top = 87
  end
end
