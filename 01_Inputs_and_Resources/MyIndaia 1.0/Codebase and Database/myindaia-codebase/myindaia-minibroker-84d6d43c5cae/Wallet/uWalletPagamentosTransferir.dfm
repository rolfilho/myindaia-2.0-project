inherited frmWalletPagamentosTransferir: TfrmWalletPagamentosTransferir
  Caption = 'Transfer'#234'ncias'
  ClientHeight = 604
  ClientWidth = 854
  Font.Height = -12
  Position = poDesigned
  ExplicitWidth = 870
  ExplicitHeight = 642
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 406
    Width = 854
    Height = 198
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object pnlProcessoDestino: TPanel
      Left = 0
      Top = 0
      Width = 854
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblProcessoDestino: TLabel
        Left = 6
        Top = 4
        Width = 105
        Height = 14
        Caption = 'Processo Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inline frameProcDestino: TFrameWalletPesquisaProcesso
      Left = 0
      Top = 23
      Width = 854
      Height = 178
      Align = alTop
      TabOrder = 1
      ExplicitTop = 23
      ExplicitWidth = 854
      inherited pnlFiltroProcesso: TPanel
        Width = 747
        ExplicitWidth = 747
        inherited pnlStyle1: TPanel
          Width = 747
          Color = 6198015
          ExplicitWidth = 747
        end
        inherited pnlFiltroProc: TPanel
          Width = 747
          ExplicitWidth = 747
          inherited edtProcesso: TcxMaskEdit
            Style.IsFontAssigned = True
            ExplicitHeight = 22
          end
          inherited edtProduto: TcxMaskEdit
            Style.IsFontAssigned = True
            ExplicitHeight = 22
          end
          inherited edtUnidadeNeg: TcxMaskEdit
            Style.IsFontAssigned = True
            ExplicitHeight = 22
          end
        end
        inherited pnlResumoProc: TPanel
          Width = 747
          ExplicitWidth = 747
          inherited pnlStyle2: TPanel
            Width = 747
            Color = 6198015
            ExplicitWidth = 747
          end
        end
      end
      inherited pnlBuscarProcesso: TPanel
        Left = 747
        ExplicitLeft = 747
        inherited btnPesquisar: TBitBtn
          Default = False
          OnClick = frameProcDestinobtnPesquisarClick
        end
      end
      inherited adsProcesso: TAureliusDataset
        DesignClass = 'MyEntitiesV2.TCustomclearance'
      end
      inherited adsProduto: TAureliusDataset
        DesignClass = 'MyEntitiesV2.TProduct'
      end
      inherited adsUnidade: TAureliusDataset
        DesignClass = 'MyEntitiesV2.TBranch'
      end
    end
  end
  object pnlOrigem: TPanel
    Left = 0
    Top = 0
    Width = 854
    Height = 406
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlPesquisaOrigem: TPanel
      Left = 0
      Top = 0
      Width = 854
      Height = 198
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      inline FrameProcOrigem: TFrameWalletPesquisaProcesso
        Left = 0
        Top = 23
        Width = 854
        Height = 178
        Align = alTop
        TabOrder = 0
        ExplicitTop = 23
        ExplicitWidth = 854
        inherited pnlFiltroProcesso: TPanel
          Width = 747
          ExplicitWidth = 747
          inherited pnlStyle1: TPanel
            Width = 747
            ExplicitWidth = 747
          end
          inherited pnlFiltroProc: TPanel
            Width = 747
            ExplicitWidth = 747
            inherited edtProcesso: TcxMaskEdit
              Style.IsFontAssigned = True
              ExplicitHeight = 22
            end
            inherited edtProduto: TcxMaskEdit
              Style.IsFontAssigned = True
              ExplicitHeight = 22
            end
            inherited edtUnidadeNeg: TcxMaskEdit
              Style.IsFontAssigned = True
              ExplicitHeight = 22
            end
          end
          inherited pnlResumoProc: TPanel
            Width = 747
            ExplicitWidth = 747
            inherited pnlStyle2: TPanel
              Width = 747
              ExplicitWidth = 747
            end
          end
        end
        inherited pnlBuscarProcesso: TPanel
          Left = 747
          ExplicitLeft = 747
          inherited btnPesquisar: TBitBtn
            Default = False
            OnClick = FrameProcOrigembtnPesquisarClick
          end
        end
        inherited adsProcesso: TAureliusDataset
          AfterOpen = FrameProcOrigemadsProcessoAfterOpen
          AfterClose = FrameProcOrigemadsProcessoAfterClose
          DesignClass = 'MyEntitiesV2.TCustomclearance'
        end
        inherited adsProduto: TAureliusDataset
          DesignClass = 'MyEntitiesV2.TProduct'
        end
        inherited adsUnidade: TAureliusDataset
          DesignClass = 'MyEntitiesV2.TBranch'
        end
      end
      object pnlProcessoOrigem: TPanel
        Left = 0
        Top = 0
        Width = 854
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object lblProcessoOrigem: TLabel
          Left = 6
          Top = 4
          Width = 101
          Height = 14
          Caption = 'Processo Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object pnlPgmtos: TPanel
      Left = 0
      Top = 198
      Width = 854
      Height = 208
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlPgmtos'
      TabOrder = 1
      object pnlBotao: TPanel
        Left = 751
        Top = 0
        Width = 103
        Height = 208
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnTransferir: TBitBtn
          Left = 11
          Top = 34
          Width = 75
          Height = 34
          Caption = 'Transferir'
          TabOrder = 0
          WordWrap = True
          OnClick = btnTransferirClick
        end
      end
      object pnlPagamentos: TPanel
        Left = 0
        Top = 0
        Width = 751
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object cxGrid: TcxGrid
          Left = 0
          Top = 34
          Width = 751
          Height = 174
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = cxcbsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridDBTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FilterBox.CustomizeDialog = False
            DataController.DataModeController.SmartRefresh = True
            DataController.DataSource = dsPagamentos
            DataController.KeyFieldNames = 'Id'
            DataController.Options = []
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            Filtering.ColumnAddValueItems = False
            Filtering.ColumnMRUItemsList = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            Preview.AutoHeight = False
            object colSelecionar: TcxGridDBColumn
              Caption = 'Selecionar'
              DataBinding.ValueType = 'Boolean'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.NullStyle = nssUnchecked
              VisibleForEditForm = bTrue
            end
            object colIdPagamento: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 51
            end
            object cxGridDBTableViewCashrequesttotal: TcxGridDBColumn
              DataBinding.FieldName = 'Paymenttotal'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 83
            end
            object cxGridDBTableViewCreated: TcxGridDBColumn
              DataBinding.FieldName = 'Created'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 124
            end
            object cxGridDBTableViewSeniorkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorkey'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 72
            end
            object cxGridDBTableViewSeniorsubkey: TcxGridDBColumn
              DataBinding.FieldName = 'Seniorsubkey'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 95
            end
            object cxGridDBTableViewUserIdName: TcxGridDBColumn
              DataBinding.FieldName = 'UserId.Name'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 142
            end
            object cxGridDBTableViewBeneficiaryIdName: TcxGridDBColumn
              DataBinding.FieldName = 'BeneficiaryId.Name'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ReadOnly = True
              Options.Editing = False
              Width = 180
            end
            object cxGridDBTableViewlookStatus: TcxGridDBColumn
              DataBinding.FieldName = 'lookStatus'
              Options.Editing = False
              Width = 200
            end
          end
          object cxGridLevel: TcxGridLevel
            GridView = cxGridDBTableView
          end
        end
        object pnlPagamentosDisponiveis: TPanel
          Left = 0
          Top = 4
          Width = 751
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblPgmtosDisponiveis: TLabel
            Left = 11
            Top = 6
            Width = 148
            Height = 14
            Caption = 'Pagamentos Dispon'#237'veis'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object pnlStyle1: TPanel
          Left = 0
          Top = 0
          Width = 751
          Height = 4
          Align = alTop
          BevelOuter = bvNone
          Color = 16758122
          ParentBackground = False
          TabOrder = 2
        end
      end
    end
  end
  object adsTipoStatus: TAureliusDataset
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
        Size = 35
      end>
    Left = 248
    Top = 307
    DesignClass = 'MyEntitiesV2.TPaymentstatus'
    object adsTipoStatusSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsTipoStatusId: TStringField
      FieldName = 'Id'
      Required = True
      Size = 10
    end
    object adsTipoStatusName: TStringField
      FieldName = 'Name'
      Size = 35
    end
  end
  object dtsTipoStatus: TDataSource
    AutoEdit = False
    DataSet = adsTipoStatus
    Left = 248
    Top = 259
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
        Name = 'ApproveduserId.FinancialAuth'
        DataType = ftBoolean
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
        Name = 'UserId.FinancialAuth'
        DataType = ftBoolean
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
    Left = 168
    Top = 314
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
    object adsPagamentosCustomerId: TAureliusEntityField
      FieldName = 'CustomerId'
    end
    object adsPagamentosProductId: TAureliusEntityField
      FieldName = 'ProductId'
    end
    object adsPagamentosServiceId: TAureliusEntityField
      FieldName = 'ServiceId'
    end
    object adsPagamentosCustomerIdTaxid: TStringField
      FieldName = 'CustomerId.Taxid'
      Size = 255
    end
    object adsPagamentosBeneficiaryIdId: TLargeintField
      FieldName = 'BeneficiaryId.Id'
      ReadOnly = True
    end
    object adsPagamentosUserIdName: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'UserId.Name'
      Size = 255
    end
    object adsPagamentosBeneficiaryIdName: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'BeneficiaryId.Name'
      Size = 255
    end
    object adsPagamentoslookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'lookStatus'
      LookupDataSet = adsTipoStatus
      LookupKeyFields = 'Id'
      LookupResultField = 'Name'
      KeyFields = 'Status'
      Size = 30
      Lookup = True
    end
  end
  object dsPagamentos: TDataSource
    DataSet = adsPagamentos
    Left = 168
    Top = 267
  end
end
