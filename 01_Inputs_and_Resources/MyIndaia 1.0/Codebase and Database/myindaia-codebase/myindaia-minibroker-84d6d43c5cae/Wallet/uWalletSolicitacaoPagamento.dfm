inherited frmWalletSolicitacaoPagamento: TfrmWalletSolicitacaoPagamento
  Caption = 'Solicitar Pagamento'
  ClientHeight = 554
  ClientWidth = 963
  Position = poDesigned
  ExplicitWidth = 979
  ExplicitHeight = 592
  PixelsPerInch = 96
  TextHeight = 16
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 554
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 849
      Height = 78
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
      TabOrder = 0
      object Label2: TLabel
        Left = 19
        Top = 13
        Width = 24
        Height = 14
        Caption = 'Tipo'
      end
      object Label1: TLabel
        Left = 251
        Top = 13
        Width = 58
        Height = 14
        Caption = 'Favorecido'
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 849
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        Color = 16758122
        ParentBackground = False
        TabOrder = 0
      end
      object rgNome: TRadioButton
        Left = 562
        Top = 11
        Width = 53
        Height = 17
        Caption = 'Nome'
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = rgNomeClick
      end
      object rgCnpj: TRadioButton
        Left = 627
        Top = 11
        Width = 51
        Height = 17
        Caption = 'CNPJ'
        TabOrder = 2
        OnClick = rgNomeClick
      end
      object dbcbFavorecido: TcxLookupComboBox
        Left = 251
        Top = 34
        Properties.DropDownWidth = 500
        Properties.GridMode = True
        Properties.ImmediateDropDownWhenActivated = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end
          item
            FieldName = 'CNPJ'
          end>
        Properties.ListSource = dtsFavorecido
        TabOrder = 3
        Width = 427
      end
      object cbTipoPgmto: TcxLookupComboBox
        Left = 19
        Top = 34
        Properties.GridMode = True
        Properties.ImmediateDropDownWhenActivated = True
        Properties.KeyFieldNames = 'Id'
        Properties.ListColumns = <
          item
            FieldName = 'Name'
          end>
        Properties.ListSource = dtsTipoPagmto
        TabOrder = 4
        Width = 182
      end
    end
    object pnlDadosAdicionais: TPanel
      Left = 0
      Top = 78
      Width = 849
      Height = 85
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
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 849
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        Color = 16758122
        ParentBackground = False
        TabOrder = 0
      end
      object pgDadosAdicionais: TPageControl
        Left = 0
        Top = 4
        Width = 849
        Height = 81
        ActivePage = tbsBoleto
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 1
        object tbsBoleto: TTabSheet
          Caption = 'Boleto'
          object Label3: TLabel
            Left = 15
            Top = 3
            Width = 66
            Height = 14
            Caption = 'Vencimento'
          end
          object Label4: TLabel
            Left = 120
            Top = 3
            Width = 91
            Height = 14
            Caption = 'C'#243'digo de Barras'
          end
          object edtCodBarras: TEdit
            Left = 120
            Top = 23
            Width = 353
            Height = 22
            TabOrder = 0
          end
          object mskVencimento: TMaskEdit
            Left = 15
            Top = 23
            Width = 82
            Height = 22
            EditMask = '99/99/9999;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
        end
        object tbsTedDoc: TTabSheet
          Caption = 'TED/DOC'
          ImageIndex = 1
          object Label5: TLabel
            Left = 15
            Top = 3
            Width = 134
            Height = 14
            Caption = 'Banco / Ag'#234'ncia / Conta'
          end
          object cbContaBancaria: TcxLookupComboBox
            Left = 15
            Top = 22
            Properties.DropDownWidth = 500
            Properties.GridMode = True
            Properties.ImmediateDropDownWhenActivated = True
            Properties.KeyFieldNames = 'Id'
            Properties.ListColumns = <
              item
                FieldName = 'Conta Banc'#225'ria'
              end>
            Properties.ListSource = dtsContas
            TabOrder = 0
            Width = 458
          end
        end
      end
    end
    object pnlPagamentos: TPanel
      Left = 0
      Top = 163
      Width = 849
      Height = 391
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 849
        Height = 391
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object cxGrid: TcxGrid
          Left = 0
          Top = 4
          Width = 849
          Height = 387
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridDBTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataModeController.SmartRefresh = True
            DataController.DataSource = dtsPagamentos
            DataController.KeyFieldNames = 'Id'
            DataController.Options = []
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object colSelecionar: TcxGridDBColumn
              Caption = 'Selecionar'
              DataBinding.ValueType = 'Boolean'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              Properties.OnEditValueChanged = colUnboundPropertiesEditValueChanged
              Width = 62
            end
            object colCodPagamento: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 67
            end
            object cxGridDBTableViewColumn5: TcxGridDBColumn
              DataBinding.FieldName = 'CustomclearanceId.Customid'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 119
            end
            object cxGridDBTableViewCustomerIdName: TcxGridDBColumn
              DataBinding.FieldName = 'CustomerId.Name'
              Width = 200
            end
            object cxGridDBTableViewColumn2: TcxGridDBColumn
              DataBinding.FieldName = 'Created'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
            end
            object cxGridDBTableViewColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'Paymenttotal'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 75
            end
            object cxGridDBTableViewColumn4: TcxGridDBColumn
              DataBinding.FieldName = 'UserId.Name'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Width = 190
            end
          end
          object cxGridLevel: TcxGridLevel
            GridView = cxGridDBTableView
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 849
          Height = 4
          Align = alTop
          BevelOuter = bvNone
          Color = 16758122
          ParentBackground = False
          TabOrder = 1
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 849
    Top = 0
    Width = 114
    Height = 554
    Align = alRight
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
    object Label6: TLabel
      Left = 7
      Top = 183
      Width = 97
      Height = 14
      Caption = 'Total Selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnSolicitarPagamento: TBitBtn
      Left = 15
      Top = 238
      Width = 83
      Height = 48
      Caption = 'Solicitar Pagamentos'
      TabOrder = 0
      WordWrap = True
      OnClick = btnSolicitarPagamentoClick
    end
    object edtTotal: TEdit
      Left = 7
      Top = 203
      Width = 101
      Height = 22
      Enabled = False
      TabOrder = 1
    end
    object btnPesquisar: TBitBtn
      Left = 15
      Top = 24
      Width = 83
      Height = 34
      Caption = 'Buscar'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
  end
  object dtsFavorecido: TDataSource
    AutoEdit = False
    DataSet = adsFavorecido
    Left = 128
    Top = 360
  end
  object adsFavorecido: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Akey'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Taxid'
        DataType = ftString
        Size = 50
      end>
    AfterScroll = adsFavorecidoAfterScroll
    OnCalcFields = adsFavorecidoCalcFields
    Left = 182
    Top = 360
    DesignClass = 'MyEntitiesV2.TVwBeneficiaryopenpayments'
    object adsFavorecidoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsFavorecidoId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object adsFavorecidoAkey: TStringField
      FieldName = 'Akey'
      Size = 10
    end
    object adsFavorecidoName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object adsFavorecidoTaxid: TStringField
      FieldName = 'Taxid'
      Size = 50
    end
    object adsFavorecidocalcCnpj: TStringField
      FieldKind = fkCalculated
      FieldName = 'CNPJ'
      Calculated = True
    end
  end
  object dtsTipoPagmto: TDataSource
    AutoEdit = False
    DataSet = adsTipoPagmto
    Left = 128
    Top = 416
  end
  object adsTipoPagmto: TAureliusDataset
    FieldDefs = <
      item
        Name = 'Self'
        Attributes = [faReadonly]
        DataType = ftVariant
      end
      item
        Name = 'Id'
        Attributes = [faRequired]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 10
      end>
    AfterScroll = adsTipoPagmtoAfterScroll
    Left = 182
    Top = 416
    DesignClass = 'MyEntitiesV2.TPaymenttypes'
    object adsTipoPagmtoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsTipoPagmtoId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 10
    end
    object adsTipoPagmtoName: TStringField
      FieldName = 'Name'
      Size = 10
    end
  end
  object dtsContas: TDataSource
    AutoEdit = False
    DataSet = adsContas
    Left = 128
    Top = 304
  end
  object adsContas: TAureliusDataset
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
        Name = 'Agency'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Number'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BankId'
        DataType = ftVariant
      end
      item
        Name = 'BankId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BankId.Code'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BankId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BankId.AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BeneficiaryId'
        DataType = ftVariant
      end
      item
        Name = 'BeneficiaryId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BeneficiaryId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    OnCalcFields = adsContasCalcFields
    SubpropsDepth = 1
    Left = 182
    Top = 304
    DesignClass = 'MyEntitiesV2.TAccount'
    object adsContasSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsContasId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsContasAgency: TStringField
      FieldName = 'Agency'
      Size = 255
    end
    object adsContasNumber: TStringField
      FieldName = 'Number'
      Size = 255
    end
    object adsContasBankId: TAureliusEntityField
      FieldName = 'BankId'
    end
    object adsContasBeneficiaryId: TAureliusEntityField
      FieldName = 'BeneficiaryId'
    end
    object adsContascalcConta: TStringField
      FieldKind = fkCalculated
      FieldName = 'Conta Banc'#225'ria'
      Size = 100
      Calculated = True
    end
    object adsContasBankIdId: TLargeintField
      FieldName = 'BankId.Id'
      ReadOnly = True
    end
    object adsContasBankIdCode: TStringField
      FieldName = 'BankId.Code'
      Size = 255
    end
    object adsContasBankIdName: TStringField
      FieldName = 'BankId.Name'
      Size = 255
    end
    object adsContasBankIdAccountList: TDataSetField
      FieldName = 'BankId.AccountList'
      ReadOnly = True
    end
    object adsContasBeneficiaryIdId: TLargeintField
      FieldName = 'BeneficiaryId.Id'
      ReadOnly = True
    end
    object adsContasBeneficiaryIdAkey: TStringField
      FieldName = 'BeneficiaryId.Akey'
      Size = 255
    end
    object adsContasBeneficiaryIdName: TStringField
      FieldName = 'BeneficiaryId.Name'
      Size = 255
    end
    object adsContasBeneficiaryIdTaxid: TStringField
      FieldName = 'BeneficiaryId.Taxid'
      Size = 255
    end
    object adsContasBeneficiaryIdAccountList: TDataSetField
      FieldName = 'BeneficiaryId.AccountList'
      ReadOnly = True
    end
  end
  object adsPagamentos: TAureliusDataset
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
        Name = 'Barcode'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Created'
        DataType = ftDateTime
      end
      item
        Name = 'Paymenttotal'
        DataType = ftFloat
      end
      item
        Name = 'Receiveddate'
        DataType = ftDateTime
      end
      item
        Name = 'Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Duedate'
        DataType = ftDateTime
      end
      item
        Name = 'Seniorsubkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId'
        DataType = ftVariant
      end
      item
        Name = 'ApproveduserId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ApproveduserId.Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.Status'
        DataType = ftBoolean
      end
      item
        Name = 'ApproveduserId.Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ApproveduserId.BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BeneficiaryId'
        DataType = ftVariant
      end
      item
        Name = 'BeneficiaryId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BeneficiaryId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BeneficiaryId.AccountList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BeneficiaryId.PaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'BillingId'
        DataType = ftVariant
      end
      item
        Name = 'BillingId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BillingId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Created'
        DataType = ftDateTime
      end
      item
        Name = 'BillingId.Duedate'
        DataType = ftDateTime
      end
      item
        Name = 'BillingId.Invoicereceivertype'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Obs'
        DataType = ftBlob
      end
      item
        Name = 'BillingId.Seniordatenfe'
        DataType = ftDateTime
      end
      item
        Name = 'BillingId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Status'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Type_'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BillingId.Irretained'
        DataType = ftBoolean
      end
      item
        Name = 'BillingId.Ir'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Total'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Valortibutavel'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Cofins'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.Iss'
        DataType = ftFloat
      end
      item
        Name = 'BillingId.NrNota'
        DataType = ftLargeint
      end
      item
        Name = 'BillingId.BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BillingId.UserId'
        DataType = ftVariant
      end
      item
        Name = 'BranchId'
        DataType = ftVariant
      end
      item
        Name = 'BranchId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'BranchId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Taxid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId.Iss'
        DataType = ftFloat
      end
      item
        Name = 'BranchId.OrganizationId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'CustomclearanceId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomclearanceId.Customid'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CustomclearanceId.BalanceId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.CustomerId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.ServiceId'
        DataType = ftVariant
      end
      item
        Name = 'CustomclearanceId.CashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'CustomclearanceId.PaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
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
        Name = 'CustomerId.CountryId'
        DataType = ftVariant
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
        Name = 'ProductId'
        DataType = ftVariant
      end
      item
        Name = 'ProductId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ProductId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ProductId.ProductServiceList'
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
        Name = 'UserId'
        DataType = ftVariant
      end
      item
        Name = 'UserId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'UserId.Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.Status'
        DataType = ftBoolean
      end
      item
        Name = 'UserId.Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UserId.BranchId'
        DataType = ftVariant
      end
      item
        Name = 'JoinItemPaymentRequested'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    SubpropsDepth = 1
    SyncSubprops = True
    Left = 184
    Top = 224
    DesignClass = 'MyEntitiesV2.TPaymentrequested'
    object adsPagamentosSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsPagamentosId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsPagamentosCreated: TDateTimeField
      DisplayLabel = 'Cria'#231#227'o'
      FieldName = 'Created'
    end
    object adsPagamentosReceiveddate: TDateTimeField
      DisplayLabel = 'Recebimento'
      FieldName = 'Receiveddate'
      EditMask = '99/99/9999'
    end
    object adsPagamentosDuedate: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'Duedate'
      EditMask = '99/99/9999'
    end
    object adsPagamentosSeniorkey: TStringField
      DisplayLabel = 'C'#243'd. Senior'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsPagamentosSeniorsubkey: TStringField
      DisplayLabel = 'C'#243'd. Senior Sub'
      FieldName = 'Seniorsubkey'
      Size = 255
    end
    object adsPagamentosUserId: TAureliusEntityField
      FieldName = 'UserId'
    end
    object adsPagamentosApproveduserId: TAureliusEntityField
      FieldName = 'ApproveduserId'
    end
    object adsPagamentosStatus: TStringField
      FieldName = 'Status'
      Size = 255
    end
    object adsPagamentosType_: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Type_'
      Size = 255
    end
    object adsPagamentosPaymenttotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'Paymenttotal'
      DisplayFormat = '#,##0.00'
    end
    object adsPagamentosBarcode: TStringField
      FieldName = 'Barcode'
      Size = 255
    end
    object adsPagamentosBeneficiaryId: TAureliusEntityField
      FieldName = 'BeneficiaryId'
    end
    object adsPagamentosBillingId: TAureliusEntityField
      FieldName = 'BillingId'
    end
    object adsPagamentosBranchId: TAureliusEntityField
      FieldName = 'BranchId'
    end
    object adsPagamentosCustomclearanceId: TAureliusEntityField
      FieldName = 'CustomclearanceId'
    end
    object adsPagamentosCustomclearanceIdCustomid: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'CustomclearanceId.Customid'
      Size = 255
    end
    object adsPagamentosUserIdName: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'UserId.Name'
      Size = 255
    end
    object adsPagamentosCustomerIdName: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CustomerId.Name'
      Size = 255
    end
  end
  object dtsPagamentos: TDataSource
    DataSet = adsPagamentos
    Left = 128
    Top = 224
  end
end
