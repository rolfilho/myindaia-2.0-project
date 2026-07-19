inherited frmWalletPagamentosReplicar: TfrmWalletPagamentosReplicar
  Caption = 'Replicar Pagamentos'
  ClientHeight = 551
  ClientWidth = 871
  Font.Height = -12
  Position = poDesigned
  WindowState = wsNormal
  ExplicitWidth = 887
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter2: TSplitter
    Left = 0
    Top = 178
    Width = 871
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Color = clWhite
    ParentColor = False
    ExplicitLeft = -74
    ExplicitTop = 39
    ExplicitWidth = 945
  end
  object pnlBotoes: TPanel
    Left = 768
    Top = 182
    Width = 103
    Height = 369
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnAdicionar: TBitBtn
      Left = 11
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = btnAdicionarClick
    end
    object btnCriarPagamentos: TBitBtn
      Left = 11
      Top = 94
      Width = 75
      Height = 39
      Caption = 'Criar Pagamentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnCriarPagamentosClick
    end
    object btnRemoverProcesso: TBitBtn
      Left = 11
      Top = 35
      Width = 75
      Height = 25
      Caption = 'Remover'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      WordWrap = True
      OnClick = btnRemoverProcessoClick
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 182
    Width = 768
    Height = 369
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 103
      Width = 768
      Height = 4
      Cursor = crVSplit
      Align = alBottom
      Color = 9408399
      ParentColor = False
      ExplicitTop = 146
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 768
      Height = 103
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        Color = 16758122
        ParentBackground = False
        TabOrder = 0
      end
      object cxGrid: TcxGrid
        Left = 0
        Top = 4
        Width = 768
        Height = 99
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        TabOrder = 1
        object cxGridDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataModeController.GridMode = True
          DataController.DataModeController.SmartRefresh = True
          DataController.DataSource = dsProcessosSelecionados
          DataController.KeyFieldNames = 'NR_PROCESSO'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object cxGridDBTableViewNR_PROCESSO: TcxGridDBColumn
            DataBinding.FieldName = 'NR_PROCESSO'
          end
          object cxGridDBTableViewCLIENTE: TcxGridDBColumn
            DataBinding.FieldName = 'CLIENTE'
          end
        end
        object cxGridLevel: TcxGridLevel
          GridView = cxGridDBTableView
        end
      end
    end
    object pnlGrid: TPanel
      Left = 0
      Top = 107
      Width = 768
      Height = 262
      Align = alBottom
      BevelOuter = bvNone
      Color = 15395562
      ParentBackground = False
      TabOrder = 1
      object SplitterGridDetail: TSplitter
        Left = 0
        Top = 114
        Width = 768
        Height = 6
        Cursor = crVSplit
        Align = alTop
        Color = 16119285
        ParentColor = False
        ExplicitTop = 315
        ExplicitWidth = 827
      end
      object cxGridDetailList: TcxGrid
        Left = 0
        Top = 120
        Width = 768
        Height = 142
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
        LockedStateImageOptions.AssignedValues = [lsiavFont]
        LockedStateImageOptions.Font.Charset = DEFAULT_CHARSET
        LockedStateImageOptions.Font.Color = clWindowText
        LockedStateImageOptions.Font.Height = -11
        LockedStateImageOptions.Font.Name = 'Tahoma'
        LockedStateImageOptions.Font.Style = []
        object cxGridDBTableViewDetailList: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dtsItens
          DataController.Options = []
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Background = cxStyle1
          Styles.Selection = cxStyle2
          object cxGridDBTableViewDetailListId: TcxGridDBColumn
            DataBinding.FieldName = 'Id'
            Styles.Header = cxStyle2
            Width = 55
          end
          object cxGridDBTableViewDetailListCalcDestino: TcxGridDBColumn
            DataBinding.FieldName = 'CalcDestino'
            Width = 202
          end
          object cxGridDBTableViewDetailListPrice: TcxGridDBColumn
            DataBinding.FieldName = 'Price'
            Width = 100
          end
          object cxGridDBTableViewDetailListItemIdId: TcxGridDBColumn
            DataBinding.FieldName = 'ItemId.Id'
            Width = 69
          end
          object cxGridDBTableViewDetailListItemIdName: TcxGridDBColumn
            DataBinding.FieldName = 'ItemId.Name'
            Width = 324
          end
        end
        object cxGridLevelDetailList: TcxGridLevel
          GridView = cxGridDBTableViewDetailList
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 114
        Align = alTop
        TabOrder = 1
        object Label9: TLabel
          Left = 19
          Top = 29
          Width = 37
          Height = 14
          Caption = 'C'#243'digo'
        end
        object Label10: TLabel
          Left = 337
          Top = 30
          Width = 67
          Height = 14
          Caption = 'Data Cria'#231#227'o'
        end
        object Label11: TLabel
          Left = 176
          Top = 29
          Width = 48
          Height = 14
          Caption = 'Processo'
        end
        object Label12: TLabel
          Left = 19
          Top = 72
          Width = 63
          Height = 14
          Caption = 'Valor Total '
        end
        object Label13: TLabel
          Left = 176
          Top = 72
          Width = 58
          Height = 14
          Caption = 'Favorecido'
        end
        object Label14: TLabel
          Left = 19
          Top = 8
          Width = 135
          Height = 14
          Caption = 'Pagamento Selecionado:'
        end
        object dbedtId: TDBEdit
          Left = 19
          Top = 46
          Width = 142
          Height = 22
          Color = 14935011
          DataField = 'Id'
          DataSource = dtsPagamento
          ReadOnly = True
          TabOrder = 0
        end
        object dbedtdtCriacao: TDBEdit
          Left = 337
          Top = 46
          Width = 142
          Height = 22
          Color = 14935011
          DataField = 'Created'
          DataSource = dtsPagamento
          ReadOnly = True
          TabOrder = 1
        end
        object dbedtNrProcesso: TDBEdit
          Left = 176
          Top = 46
          Width = 142
          Height = 22
          Color = 14935011
          DataField = 'CustomclearanceId.Customid'
          DataSource = dtsPagamento
          ReadOnly = True
          TabOrder = 2
        end
        object dbedtValorTotal: TDBEdit
          Left = 19
          Top = 87
          Width = 142
          Height = 22
          Color = 14935011
          DataField = 'Paymenttotal'
          DataSource = dtsPagamento
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 176
          Top = 87
          Width = 390
          Height = 22
          Color = 14935011
          DataField = 'BeneficiaryId.Name'
          DataSource = dtsPagamento
          ReadOnly = True
          TabOrder = 4
        end
      end
    end
  end
  inline framePesquisaProc: TFrameWalletPesquisaProcesso
    Left = 0
    Top = 0
    Width = 871
    Height = 178
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 871
    inherited pnlFiltroProcesso: TPanel
      Width = 764
      ExplicitWidth = 764
      inherited pnlStyle1: TPanel
        Width = 764
        ExplicitWidth = 764
      end
      inherited pnlFiltroProc: TPanel
        Width = 764
        ExplicitWidth = 764
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
        Width = 764
        ExplicitWidth = 764
        inherited pnlStyle2: TPanel
          Width = 764
          ExplicitWidth = 764
        end
      end
    end
    inherited pnlBuscarProcesso: TPanel
      Left = 764
      ExplicitLeft = 764
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
  object cdsProcessosSelecionados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 97
    Top = 215
    object cdsProcessosSelecionadosNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object cdsProcessosSelecionadosCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Size = 60
    end
    object cdsProcessosSelecionadosVL_BALANCE: TFloatField
      FieldName = 'VL_BALANCE'
    end
    object cdsProcessosSelecionadosCD_GRUPO: TIntegerField
      FieldName = 'CD_GRUPO'
    end
  end
  object dsProcessosSelecionados: TDataSource
    DataSet = cdsProcessosSelecionados
    Left = 73
    Top = 215
  end
  object dtsItens: TDataSource
    AutoEdit = False
    DataSet = adsItens
    Left = 64
    Top = 456
  end
  object adsItens: TAureliusDataset
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
        Name = 'Destino'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Price'
        DataType = ftFloat
      end
      item
        Name = 'ItemId'
        DataType = ftVariant
      end
      item
        Name = 'ItemId.Id'
        Attributes = [faReadonly]
        DataType = ftLargeint
      end
      item
        Name = 'ItemId.Akey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Active'
        DataType = ftBoolean
      end
      item
        Name = 'ItemId.Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Productitem'
        DataType = ftInteger
      end
      item
        Name = 'ItemId.Seniorkey'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Taxable'
        DataType = ftBoolean
      end
      item
        Name = 'ItemId.Type_'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ItemId.Contafinanceiraimp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.Contafinanceiraexp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ItemId.ItemcashrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'ItemId.ItempaymentrequestedList'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end
      item
        Name = 'JoinPaymentRequested'
        Attributes = [faReadonly]
        DataType = ftDataSet
      end>
    OnCalcFields = adsItensCalcFields
    SubpropsDepth = 1
    Left = 88
    Top = 456
    DesignClass = 'MyEntitiesV2.TItempaymentrequested'
    object adsItensSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsItensId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsItensDestino: TStringField
      FieldName = 'Destino'
      Size = 1
    end
    object adsItensPrice: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'Price'
      DisplayFormat = '#,##0.00'
    end
    object adsItensItemId: TAureliusEntityField
      FieldName = 'ItemId'
    end
    object adsItensItemIdId: TLargeintField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'ItemId.Id'
      ReadOnly = True
    end
    object adsItensItemIdName: TStringField
      DisplayLabel = 'Item'
      FieldName = 'ItemId.Name'
      Size = 255
    end
    object adsItensJoinPaymentRequested: TDataSetField
      FieldName = 'JoinPaymentRequested'
      ReadOnly = True
    end
    object adsItensCalcDestino: TStringField
      DisplayLabel = 'Destino'
      FieldKind = fkCalculated
      FieldName = 'CalcDestino'
      Size = 30
      Calculated = True
    end
  end
  object dtsPagamento: TDataSource
    AutoEdit = False
    DataSet = adsPagamento
    Left = 160
    Top = 456
  end
  object adsPagamento: TAureliusDataset
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
    AfterOpen = adsPagamentoAfterOpen
    SubpropsDepth = 1
    SyncSubprops = True
    Left = 184
    Top = 456
    DesignClass = 'MyEntitiesV2.TPaymentrequested'
    object adsPagamentoSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
    object adsPagamentoId: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Id'
      ReadOnly = True
      Required = True
    end
    object adsPagamentoCreated: TDateTimeField
      DisplayLabel = 'Cria'#231#227'o'
      FieldName = 'Created'
    end
    object adsPagamentoReceiveddate: TDateTimeField
      DisplayLabel = 'Recebimento'
      FieldName = 'Receiveddate'
      EditMask = '99/99/9999'
    end
    object adsPagamentoDuedate: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'Duedate'
      EditMask = '99/99/9999'
    end
    object adsPagamentoSeniorkey: TStringField
      DisplayLabel = 'C'#243'd. Senior'
      FieldName = 'Seniorkey'
      Size = 255
    end
    object adsPagamentoSeniorsubkey: TStringField
      DisplayLabel = 'C'#243'd. Senior Sub'
      FieldName = 'Seniorsubkey'
      Size = 255
    end
    object adsPagamentoUserId: TAureliusEntityField
      FieldName = 'UserId'
    end
    object adsPagamentoApproveduserId: TAureliusEntityField
      FieldName = 'ApproveduserId'
    end
    object adsPagamentoStatus: TStringField
      FieldName = 'Status'
      Size = 255
    end
    object adsPagamentoType_: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Type_'
      Size = 255
    end
    object adsPagamentoPaymenttotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'Paymenttotal'
      DisplayFormat = '#,##0.00'
    end
    object adsPagamentoBarcode: TStringField
      FieldName = 'Barcode'
      Size = 255
    end
    object adsPagamentoBeneficiaryId: TAureliusEntityField
      FieldName = 'BeneficiaryId'
    end
    object adsPagamentoBillingId: TAureliusEntityField
      FieldName = 'BillingId'
    end
    object adsPagamentoBranchId: TAureliusEntityField
      FieldName = 'BranchId'
    end
    object adsPagamentoCustomclearanceId: TAureliusEntityField
      FieldName = 'CustomclearanceId'
    end
    object adsPagamentoCustomclearanceIdCustomid: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'CustomclearanceId.Customid'
      Size = 255
    end
    object adsPagamentoCustomerId: TAureliusEntityField
      FieldName = 'CustomerId'
    end
    object adsPagamentoBeneficiaryIdName: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'BeneficiaryId.Name'
      Size = 255
    end
    object adsPagamentoProductId: TAureliusEntityField
      FieldName = 'ProductId'
    end
    object adsPagamentoServiceId: TAureliusEntityField
      FieldName = 'ServiceId'
    end
    object adsPagamentoCustomerIdTaxid: TStringField
      FieldName = 'CustomerId.Taxid'
      Size = 255
    end
    object adsPagamentoBeneficiaryIdId: TLargeintField
      FieldName = 'BeneficiaryId.Id'
      ReadOnly = True
    end
  end
  object adsUsuario: TAureliusDataset
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
        Name = 'Gender'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Password'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Status'
        Attributes = [faRequired]
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'BranchId'
        DataType = ftVariant
      end>
    Left = 248
    Top = 208
    DesignClass = 'MyEntitiesV2.TAuthuser'
    object adsUsuarioSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
  end
  object dtsUsuario: TDataSource
    AutoEdit = False
    DataSet = adsUsuario
    Left = 224
    Top = 208
  end
  object adsProcessoLocalizar: TAureliusDataset
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
    SubpropsDepth = 2
    Left = 96
    Top = 264
    DesignClass = 'MyEntitiesV2.TCustomclearance'
    object adsProcessoLocalizarSelf: TAureliusEntityField
      FieldName = 'Self'
      ReadOnly = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 272
    Top = 456
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15395562
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 9145227
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
