unit MyEntitiesV2;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  TAccount = class;
  TAuthuser = class;
  TBalance = class;
  TBank = class;
  TBeneficiary = class;
  TBilling = class;
  TBillingCashrequested = class;
  TBillingcustomerprofile = class;
  TBillingIteminvoiced = class;
  TBillingPaymentrequested = class;
  TBillingtype = class;
  TBranch = class;
  TCashrequested = class;
  TCashrequestedItemcashrequested = class;
  TCashrequestedstatus = class;
  TCountry = class;
  TCustomclearance = class;
  TCustomer = class;
  TCustomergroup = class;
  TCustomergroupCustomerprofile = class;
  TCustomerprofile = class;
  TDestino = class;
  TItem = class;
  TItemcashrequested = class;
  TIteminvoiced = class;
  TItempaymentrequested = class;
  TOrganization = class;
  TPaymentdefinition = class;
  TPaymentrequested = class;
  TPaymentrequestedItempaymentrequested = class;
  TPaymentstatus = class;
  TPaymenttypes = class;
  TProduct = class;
  TProductService = class;
  TRefund = class;
  TService = class;
  TVwBeneficiaryopenpayments = class;
  TVwCustomer = class;
  TVwEstufagem = class;
  TVwEvent = class;
  TVwLocalembarque = class;
  TVwProcessoResumo = class;
  TVwProduct = class;
  TVwRepresentante = class;
  TVwService = class;
  TVwViatransporte = class;
  TAccountTableDictionary = class;
  TAuthuserTableDictionary = class;
  TBalanceTableDictionary = class;
  TBankTableDictionary = class;
  TBeneficiaryTableDictionary = class;
  TBillingTableDictionary = class;
  TBillingCashrequestedTableDictionary = class;
  TBillingIteminvoicedTableDictionary = class;
  TBillingPaymentrequestedTableDictionary = class;
  TBranchTableDictionary = class;
  TCashrequestedTableDictionary = class;
  TCashrequestedItemcashrequestedTableDictionary = class;
  TCountryTableDictionary = class;
  TCustomclearanceTableDictionary = class;
  TCustomerTableDictionary = class;
  TCustomergroupTableDictionary = class;
  TCustomergroupCustomerprofileTableDictionary = class;
  TCustomerprofileTableDictionary = class;
  TItemTableDictionary = class;
  TItemcashrequestedTableDictionary = class;
  TIteminvoicedTableDictionary = class;
  TItempaymentrequestedTableDictionary = class;
  TOrganizationTableDictionary = class;
  TPaymentdefinitionTableDictionary = class;
  TPaymentrequestedTableDictionary = class;
  TPaymentrequestedItempaymentrequestedTableDictionary = class;
  TProductTableDictionary = class;
  TProductServiceTableDictionary = class;
  TRefundTableDictionary = class;
  TServiceTableDictionary = class;
  TPaymenttypesTableDictionary = class;
  TPaymentstatusTableDictionary = class;
  TCashrequestedstatusTableDictionary = class;
  TVwBeneficiaryopenpaymentsTableDictionary = class;
  TDestinoTableDictionary = class;
  TBillingcustomerprofileTableDictionary = class;
  TBillingtypeTableDictionary = class;
  TVwEstufagemTableDictionary = class;
  TVwLocalembarqueTableDictionary = class;
  TVwViatransporteTableDictionary = class;
  TVwServiceTableDictionary = class;
  TVwProductTableDictionary = class;
  TVwEventTableDictionary = class;
  TVwRepresentanteTableDictionary = class;
  TVwCustomerTableDictionary = class;
  TVwProcessoResumoTableDictionary = class;
  
  [Entity]
  [Table('Account')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TAccount = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('agency', [], 255)]
    FAgency: Nullable<string>;
    
    [Column('number', [], 255)]
    FNumber: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('bank_id', [], 'id')]
    FBankId: Proxy<TBank>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('beneficiary_id', [], 'id')]
    FBeneficiaryId: Proxy<TBeneficiary>;
    function GetBankId: TBank;
    procedure SetBankId(const Value: TBank);
    function GetBeneficiaryId: TBeneficiary;
    procedure SetBeneficiaryId(const Value: TBeneficiary);
  public
    property Id: Int64 read FId write FId;
    property Agency: Nullable<string> read FAgency write FAgency;
    property Number: Nullable<string> read FNumber write FNumber;
    property BankId: TBank read GetBankId write SetBankId;
    property BeneficiaryId: TBeneficiary read GetBeneficiaryId write SetBeneficiaryId;
  end;
  
  [Entity]
  [Table('AuthUser')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TAuthuser = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('gender', [], 255)]
    FGender: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Column('password', [], 255)]
    FPassword: Nullable<string>;
    
    [Column('status', [TColumnProp.Required])]
    FStatus: Boolean;
    
    [Column('username', [], 255)]
    FUsername: Nullable<string>;
    
    [Column('financial_auth', [TColumnProp.Required])]
    FFinancialAuth: Boolean;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('branch_id', [], 'id')]
    FBranchId: Proxy<TBranch>;
    function GetBranchId: TBranch;
    procedure SetBranchId(const Value: TBranch);
  public
    property Id: Int64 read FId write FId;
    property Gender: Nullable<string> read FGender write FGender;
    property Name: Nullable<string> read FName write FName;
    property Password: Nullable<string> read FPassword write FPassword;
    property Status: Boolean read FStatus write FStatus;
    property Username: Nullable<string> read FUsername write FUsername;
    property FinancialAuth: Boolean read FFinancialAuth write FFinancialAuth;
    property BranchId: TBranch read GetBranchId write SetBranchId;
  end;
  
  [Entity]
  [Table('Balance')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TBalance = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('Value', [], 19, 2)]
    FValue: Nullable<Double>;
  public
    property Id: Int64 read FId write FId;
    property Value: Nullable<Double> read FValue write FValue;
  end;
  
  [Entity]
  [Table('Bank')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TBank = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('code', [], 255)]
    FCode: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FBankId')]
    FAccountList: Proxy<TList<TAccount>>;
    function GetAccountList: TList<TAccount>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Code: Nullable<string> read FCode write FCode;
    property Name: Nullable<string> read FName write FName;
    property AccountList: TList<TAccount> read GetAccountList;
  end;
  
  [Entity]
  [Table('Beneficiary')]
  [UniqueKey('taxID')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TBeneficiary = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Column('taxID', [TColumnProp.Required], 255)]
    FTaxid: string;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FBeneficiaryId')]
    FAccountList: Proxy<TList<TAccount>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FBeneficiaryId')]
    FPaymentrequestedList: Proxy<TList<TPaymentrequested>>;
    function GetAccountList: TList<TAccount>;
    function GetPaymentrequestedList: TList<TPaymentrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
    property Taxid: string read FTaxid write FTaxid;
    property AccountList: TList<TAccount> read GetAccountList;
    property PaymentrequestedList: TList<TPaymentrequested> read GetPaymentrequestedList;
  end;
  
  [Entity]
  [Table('Billing')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TBilling = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('akey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('created', [])]
    FCreated: Nullable<TDateTime>;
    
    [Column('dueDate', [])]
    FDuedate: Nullable<TDateTime>;
    
    [Column('invoiceReceiverType', [], 255)]
    FInvoicereceivertype: Nullable<string>;
    
    [Column('obs', [TColumnProp.Lazy])]
    [DBTypeWideMemo]
    FObs: TBlob;
    
    [Column('seniorDateNFE', [])]
    FSeniordatenfe: Nullable<TDateTime>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('status', [], 255)]
    FStatus: Nullable<string>;
    
    [Column('type', [], 255)]
    FType_: Nullable<string>;
    
    [Column('irRetained', [])]
    FIrretained: Nullable<Boolean>;
    
    [Column('ir', [], 19, 2)]
    FIr: Nullable<Double>;
    
    [Column('total', [], 19, 2)]
    FTotal: Nullable<Double>;
    
    [Column('valorTibutavel', [], 19, 2)]
    FValortibutavel: Nullable<Double>;
    
    [Column('cofins', [], 19, 2)]
    FCofins: Nullable<Double>;
    
    [Column('iss', [], 19, 2)]
    FIss: Nullable<Double>;
    
    [Column('nr_nota', [])]
    FNrNota: Nullable<Int64>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('branch_id', [], 'id')]
    FBranchId: Proxy<TBranch>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('user_id', [], 'id')]
    FUserId: Proxy<TAuthuser>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FBillingId')]
    FBillingCashrequestedList: Proxy<TList<TBillingCashrequested>>;
    function GetBranchId: TBranch;
    procedure SetBranchId(const Value: TBranch);
    function GetUserId: TAuthuser;
    procedure SetUserId(const Value: TAuthuser);
    function GetBillingCashrequestedList: TList<TBillingCashrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Created: Nullable<TDateTime> read FCreated write FCreated;
    property Duedate: Nullable<TDateTime> read FDuedate write FDuedate;
    property Invoicereceivertype: Nullable<string> read FInvoicereceivertype write FInvoicereceivertype;
    property Obs: TBlob read FObs write FObs;
    property Seniordatenfe: Nullable<TDateTime> read FSeniordatenfe write FSeniordatenfe;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Status: Nullable<string> read FStatus write FStatus;
    property Type_: Nullable<string> read FType_ write FType_;
    property Irretained: Nullable<Boolean> read FIrretained write FIrretained;
    property Ir: Nullable<Double> read FIr write FIr;
    property Total: Nullable<Double> read FTotal write FTotal;
    property Valortibutavel: Nullable<Double> read FValortibutavel write FValortibutavel;
    property Cofins: Nullable<Double> read FCofins write FCofins;
    property Iss: Nullable<Double> read FIss write FIss;
    property NrNota: Nullable<Int64> read FNrNota write FNrNota;
    property BranchId: TBranch read GetBranchId write SetBranchId;
    property UserId: TAuthuser read GetUserId write SetUserId;
    property BillingCashrequestedList: TList<TBillingCashrequested> read GetBillingCashrequestedList;
  end;
  
  [Entity]
  [Table('Billing_CashRequested')]
  [UniqueKey('cashRequests_id')]
  [Id('FBillingId', TIdGenerator.None)]
  [Id('FCashrequestsId', TIdGenerator.None)]
  TBillingCashrequested = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('cashRequests_id', [TColumnProp.Required], 'id')]
    FCashrequestsId: Proxy<TCashrequested>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Billing_id', [TColumnProp.Required], 'id')]
    FBillingId: Proxy<TBilling>;
    function GetCashrequestsId: TCashrequested;
    procedure SetCashrequestsId(const Value: TCashrequested);
    function GetBillingId: TBilling;
    procedure SetBillingId(const Value: TBilling);
  public
    property CashrequestsId: TCashrequested read GetCashrequestsId write SetCashrequestsId;
    property BillingId: TBilling read GetBillingId write SetBillingId;
  end;
  
  [Entity]
  [Table('BillingCustomerProfile')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TBillingcustomerprofile = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('price', [TColumnProp.Required], 18, 2)]
    FPrice: Double;
    
    [Column('startDate', [TColumnProp.Required])]
    FStartdate: TDateTime;
    
    [Column('endDate', [TColumnProp.Required])]
    FEnddate: TDateTime;
    
    [Column('placeOfShipment_Except', [TColumnProp.Required])]
    FPlaceofshipmentExcept: Boolean;
    
    [Column('placeOfDischarge_Except', [TColumnProp.Required])]
    FPlaceofdischargeExcept: Boolean;
    
    [Column('increaseRate', [TColumnProp.Required])]
    FIncreaserate: Double;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customerGroup_id', [TColumnProp.Required], 'id')]
    FCustomergroupId: Proxy<TCustomergroup>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('item_id', [TColumnProp.Required], 'id')]
    FItemId: Proxy<TItem>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('billingType_id', [TColumnProp.Required], 'id')]
    FBillingtypeId: Proxy<TBillingtype>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('product_id', [TColumnProp.Required], 'id')]
    FProductId: Proxy<TVwProduct>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('service_id', [TColumnProp.Required], 'id')]
    FServiceId: Proxy<TVwService>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('placeOfShipment_id', [TColumnProp.Required], 'id')]
    FPlaceofshipmentId: Proxy<TVwLocalembarque>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('placeOfDischarge_id', [TColumnProp.Required], 'id')]
    FPlaceofdischargeId: Proxy<TVwLocalembarque>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('baseEvent_id', [TColumnProp.Required], 'id')]
    FBaseeventId: Proxy<TVwEvent>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('typeOfTransport_id', [TColumnProp.Required], 'id')]
    FTypeoftransportId: Proxy<TVwViatransporte>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('typeOfStuffing_id', [TColumnProp.Required], 'id')]
    FTypeofstuffingId: Proxy<TVwEstufagem>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customer_id', [], 'id')]
    FCustomerId: Proxy<TVwCustomer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('representante_id', [], 'id')]
    FRepresentanteId: Proxy<TVwRepresentante>;
    function GetCustomergroupId: TCustomergroup;
    procedure SetCustomergroupId(const Value: TCustomergroup);
    function GetItemId: TItem;
    procedure SetItemId(const Value: TItem);
    function GetBillingtypeId: TBillingtype;
    procedure SetBillingtypeId(const Value: TBillingtype);
    function GetProductId: TVwProduct;
    procedure SetProductId(const Value: TVwProduct);
    function GetServiceId: TVwService;
    procedure SetServiceId(const Value: TVwService);
    function GetPlaceofshipmentId: TVwLocalembarque;
    procedure SetPlaceofshipmentId(const Value: TVwLocalembarque);
    function GetPlaceofdischargeId: TVwLocalembarque;
    procedure SetPlaceofdischargeId(const Value: TVwLocalembarque);
    function GetBaseeventId: TVwEvent;
    procedure SetBaseeventId(const Value: TVwEvent);
    function GetTypeoftransportId: TVwViatransporte;
    procedure SetTypeoftransportId(const Value: TVwViatransporte);
    function GetTypeofstuffingId: TVwEstufagem;
    procedure SetTypeofstuffingId(const Value: TVwEstufagem);
    function GetCustomerId: TVwCustomer;
    procedure SetCustomerId(const Value: TVwCustomer);
    function GetRepresentanteId: TVwRepresentante;
    procedure SetRepresentanteId(const Value: TVwRepresentante);
  public
    property Id: Int64 read FId write FId;
    property Price: Double read FPrice write FPrice;
    property Startdate: TDateTime read FStartdate write FStartdate;
    property Enddate: TDateTime read FEnddate write FEnddate;
    property PlaceofshipmentExcept: Boolean read FPlaceofshipmentExcept write FPlaceofshipmentExcept;
    property PlaceofdischargeExcept: Boolean read FPlaceofdischargeExcept write FPlaceofdischargeExcept;
    property Increaserate: Double read FIncreaserate write FIncreaserate;
    property CustomergroupId: TCustomergroup read GetCustomergroupId write SetCustomergroupId;
    property ItemId: TItem read GetItemId write SetItemId;
    property BillingtypeId: TBillingtype read GetBillingtypeId write SetBillingtypeId;
    property ProductId: TVwProduct read GetProductId write SetProductId;
    property ServiceId: TVwService read GetServiceId write SetServiceId;
    property PlaceofshipmentId: TVwLocalembarque read GetPlaceofshipmentId write SetPlaceofshipmentId;
    property PlaceofdischargeId: TVwLocalembarque read GetPlaceofdischargeId write SetPlaceofdischargeId;
    property BaseeventId: TVwEvent read GetBaseeventId write SetBaseeventId;
    property TypeoftransportId: TVwViatransporte read GetTypeoftransportId write SetTypeoftransportId;
    property TypeofstuffingId: TVwEstufagem read GetTypeofstuffingId write SetTypeofstuffingId;
    property CustomerId: TVwCustomer read GetCustomerId write SetCustomerId;
    property RepresentanteId: TVwRepresentante read GetRepresentanteId write SetRepresentanteId;
  end;
  
  [Entity]
  [Table('Billing_ItemInvoiced')]
  [UniqueKey('itensInvoiced_id')]
  [Id('FBillingId', TIdGenerator.None)]
  [Id('FItensinvoicedId', TIdGenerator.None)]
  TBillingIteminvoiced = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('itensInvoiced_id', [TColumnProp.Required], 'id')]
    FItensinvoicedId: Proxy<TIteminvoiced>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Billing_id', [TColumnProp.Required], 'id')]
    FBillingId: Proxy<TBilling>;
    function GetItensinvoicedId: TIteminvoiced;
    procedure SetItensinvoicedId(const Value: TIteminvoiced);
    function GetBillingId: TBilling;
    procedure SetBillingId(const Value: TBilling);
  public
    property ItensinvoicedId: TIteminvoiced read GetItensinvoicedId write SetItensinvoicedId;
    property BillingId: TBilling read GetBillingId write SetBillingId;
  end;
  
  [Entity]
  [Table('Billing_PaymentRequested')]
  [UniqueKey('payments_id')]
  [Id('FBillingId', TIdGenerator.None)]
  [Id('FPaymentsId', TIdGenerator.None)]
  TBillingPaymentrequested = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('payments_id', [TColumnProp.Required], 'id')]
    FPaymentsId: Proxy<TPaymentrequested>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Billing_id', [TColumnProp.Required], 'id')]
    FBillingId: Proxy<TBilling>;
    function GetPaymentsId: TPaymentrequested;
    procedure SetPaymentsId(const Value: TPaymentrequested);
    function GetBillingId: TBilling;
    procedure SetBillingId(const Value: TBilling);
  public
    property PaymentsId: TPaymentrequested read GetPaymentsId write SetPaymentsId;
    property BillingId: TBilling read GetBillingId write SetBillingId;
  end;
  
  [Entity]
  [Table('BillingType')]
  [Id('FId', TIdGenerator.None)]
  TBillingtype = class
  private
    [Column('id', [TColumnProp.Required])]
    FId: Int64;
    
    [Column('name', [TColumnProp.Required], 100)]
    FName: string;
  public
    property Id: Int64 read FId write FId;
    property Name: string read FName write FName;
  end;
  
  [Entity]
  [Table('Branch')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TBranch = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('taxID', [], 255)]
    FTaxid: Nullable<string>;
    
    [Column('iss', [], 19, 2)]
    FIss: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('organization_id', [], 'id')]
    FOrganizationId: Proxy<TOrganization>;
    function GetOrganizationId: TOrganization;
    procedure SetOrganizationId(const Value: TOrganization);
  public
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Taxid: Nullable<string> read FTaxid write FTaxid;
    property Iss: Nullable<Double> read FIss write FIss;
    property OrganizationId: TOrganization read GetOrganizationId write SetOrganizationId;
  end;
  
  [Entity]
  [Table('CashRequested')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TCashrequested = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('created', [])]
    FCreated: Nullable<TDateTime>;
    
    [Column('receivedDate', [])]
    FReceiveddate: Nullable<TDateTime>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('status', [], 255)]
    FStatus: Nullable<string>;
    
    [Column('cashRequestTotal', [], 19, 2)]
    FCashrequesttotal: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('branch_id', [], 'id')]
    FBranchId: Proxy<TBranch>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customer_id', [], 'id')]
    FCustomerId: Proxy<TCustomer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customClearance_id', [], 'id')]
    FCustomclearanceId: Proxy<TCustomclearance>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('product_id', [], 'id')]
    FProductId: Proxy<TProduct>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('service_id', [], 'id')]
    FServiceId: Proxy<TService>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('user_id', [], 'id')]
    FUserId: Proxy<TAuthuser>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCashrequestsId')]
    FBillingCashrequestedList: Proxy<TList<TBillingCashrequested>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCashrequestedId')]
    FJoinItemCashRequested: Proxy<TList<TCashrequestedItemcashrequested>>;
    function GetBranchId: TBranch;
    procedure SetBranchId(const Value: TBranch);
    function GetCustomerId: TCustomer;
    procedure SetCustomerId(const Value: TCustomer);
    function GetCustomclearanceId: TCustomclearance;
    procedure SetCustomclearanceId(const Value: TCustomclearance);
    function GetProductId: TProduct;
    procedure SetProductId(const Value: TProduct);
    function GetServiceId: TService;
    procedure SetServiceId(const Value: TService);
    function GetUserId: TAuthuser;
    procedure SetUserId(const Value: TAuthuser);
    function GetBillingCashrequestedList: TList<TBillingCashrequested>;
    function GetJoinItemCashRequested: TList<TCashrequestedItemcashrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Created: Nullable<TDateTime> read FCreated write FCreated;
    property Receiveddate: Nullable<TDateTime> read FReceiveddate write FReceiveddate;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Status: Nullable<string> read FStatus write FStatus;
    property Cashrequesttotal: Nullable<Double> read FCashrequesttotal write FCashrequesttotal;
    property BranchId: TBranch read GetBranchId write SetBranchId;
    property CustomerId: TCustomer read GetCustomerId write SetCustomerId;
    property CustomclearanceId: TCustomclearance read GetCustomclearanceId write SetCustomclearanceId;
    property ProductId: TProduct read GetProductId write SetProductId;
    property ServiceId: TService read GetServiceId write SetServiceId;
    property UserId: TAuthuser read GetUserId write SetUserId;
    property BillingCashrequestedList: TList<TBillingCashrequested> read GetBillingCashrequestedList;
    property JoinItemCashRequested: TList<TCashrequestedItemcashrequested> read GetJoinItemCashRequested;
  end;
  
  [Entity]
  [Table('CashRequested_ItemCashRequested')]
  [Id('FCashrequestedId', TIdGenerator.None)]
  [Id('FItemsId', TIdGenerator.None)]
  TCashrequestedItemcashrequested = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('items_id', [TColumnProp.Required], 'id')]
    FItemsId: Proxy<TItemcashrequested>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CashRequested_id', [TColumnProp.Required], 'id')]
    FCashrequestedId: Proxy<TCashrequested>;
    function GetItemsId: TItemcashrequested;
    procedure SetItemsId(const Value: TItemcashrequested);
    function GetCashrequestedId: TCashrequested;
    procedure SetCashrequestedId(const Value: TCashrequested);
  public
    property ItemsId: TItemcashrequested read GetItemsId write SetItemsId;
    property CashrequestedId: TCashrequested read GetCashrequestedId write SetCashrequestedId;
  end;
  
  [Entity]
  [Table('CashrequestedStatus')]
  [Id('FId', TIdGenerator.None)]
  TCashrequestedstatus = class
  private
    [Column('id', [TColumnProp.Required], 10)]
    FId: string;
    
    [Column('name', [], 35)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('Country')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TCountry = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
  public
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('CustomClearance')]
  [UniqueKey('customID')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TCustomclearance = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('customID', [TColumnProp.Required], 255)]
    FCustomid: string;
    
    [Association([], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('balance_id', [], 'id')]
    FBalanceId: TBalance;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customer_id', [], 'id')]
    FCustomerId: Proxy<TCustomer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('service_id', [], 'id')]
    FServiceId: Proxy<TService>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCustomclearanceId')]
    FCashrequestedList: Proxy<TList<TCashrequested>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCustomclearanceId')]
    FPaymentrequestedList: Proxy<TList<TPaymentrequested>>;
    function GetCustomerId: TCustomer;
    procedure SetCustomerId(const Value: TCustomer);
    function GetServiceId: TService;
    procedure SetServiceId(const Value: TService);
    function GetCashrequestedList: TList<TCashrequested>;
    function GetPaymentrequestedList: TList<TPaymentrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Customid: string read FCustomid write FCustomid;
    property BalanceId: TBalance read FBalanceId write FBalanceId;
    property CustomerId: TCustomer read GetCustomerId write SetCustomerId;
    property ServiceId: TService read GetServiceId write SetServiceId;
    property CashrequestedList: TList<TCashrequested> read GetCashrequestedList;
    property PaymentrequestedList: TList<TPaymentrequested> read GetPaymentrequestedList;
  end;
  
  [Entity]
  [Table('Customer')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TCustomer = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('active', [])]
    FActive: Nullable<Boolean>;
    
    [Column('city', [], 255)]
    FCity: Nullable<string>;
    
    [Column('neighborhood', [], 255)]
    FNeighborhood: Nullable<string>;
    
    [Column('number', [], 255)]
    FNumber: Nullable<string>;
    
    [Column('state', [], 255)]
    FState: Nullable<string>;
    
    [Column('street', [], 255)]
    FStreet: Nullable<string>;
    
    [Column('zipCode', [], 255)]
    FZipcode: Nullable<string>;
    
    [Column('fax', [], 255)]
    FFax: Nullable<string>;
    
    [Column('fone', [], 255)]
    FFone: Nullable<string>;
    
    [Column('inscEstadual', [], 255)]
    FInscestadual: Nullable<string>;
    
    [Column('inscMunicipal', [], 255)]
    FInscmunicipal: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('taxID', [], 255)]
    FTaxid: Nullable<string>;
    
    [Column('type', [], 255)]
    FType_: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('group_id', [], 'id')]
    FGroupId: Proxy<TCustomergroup>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Country_id', [], 'id')]
    FCountryId: Proxy<TCountry>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCustomerId')]
    FCustomclearanceList: Proxy<TList<TCustomclearance>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCustomerId')]
    FPaymentdefinitionList: Proxy<TList<TPaymentdefinition>>;
    function GetGroupId: TCustomergroup;
    procedure SetGroupId(const Value: TCustomergroup);
    function GetCountryId: TCountry;
    procedure SetCountryId(const Value: TCountry);
    function GetCustomclearanceList: TList<TCustomclearance>;
    function GetPaymentdefinitionList: TList<TPaymentdefinition>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Active: Nullable<Boolean> read FActive write FActive;
    property City: Nullable<string> read FCity write FCity;
    property Neighborhood: Nullable<string> read FNeighborhood write FNeighborhood;
    property Number: Nullable<string> read FNumber write FNumber;
    property State: Nullable<string> read FState write FState;
    property Street: Nullable<string> read FStreet write FStreet;
    property Zipcode: Nullable<string> read FZipcode write FZipcode;
    property Fax: Nullable<string> read FFax write FFax;
    property Fone: Nullable<string> read FFone write FFone;
    property Inscestadual: Nullable<string> read FInscestadual write FInscestadual;
    property Inscmunicipal: Nullable<string> read FInscmunicipal write FInscmunicipal;
    property Name: Nullable<string> read FName write FName;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Taxid: Nullable<string> read FTaxid write FTaxid;
    property Type_: Nullable<string> read FType_ write FType_;
    property GroupId: TCustomergroup read GetGroupId write SetGroupId;
    property CountryId: TCountry read GetCountryId write SetCountryId;
    property CustomclearanceList: TList<TCustomclearance> read GetCustomclearanceList;
    property PaymentdefinitionList: TList<TPaymentdefinition> read GetPaymentdefinitionList;
  end;
  
  [Entity]
  [Table('CustomerGroup')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TCustomergroup = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll)]
    [JoinColumn('definitions_id', [], 'id')]
    FDefinitionsId: Proxy<TPaymentdefinition>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge, TCascadeType.Remove], 'FCustomergroupId')]
    FGrupoJoin: Proxy<TList<TCustomergroupCustomerprofile>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FCustomergroupId')]
    FBillingcustomerprofileList: Proxy<TList<TBillingcustomerprofile>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FGroupId')]
    FVwProcessoResumoList: Proxy<TList<TVwProcessoResumo>>;
    function GetDefinitionsId: TPaymentdefinition;
    procedure SetDefinitionsId(const Value: TPaymentdefinition);
    function GetGrupoJoin: TList<TCustomergroupCustomerprofile>;
    function GetBillingcustomerprofileList: TList<TBillingcustomerprofile>;
    function GetVwProcessoResumoList: TList<TVwProcessoResumo>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Name: Nullable<string> read FName write FName;
    property DefinitionsId: TPaymentdefinition read GetDefinitionsId write SetDefinitionsId;
    property GrupoJoin: TList<TCustomergroupCustomerprofile> read GetGrupoJoin;
    property BillingcustomerprofileList: TList<TBillingcustomerprofile> read GetBillingcustomerprofileList;
    property VwProcessoResumoList: TList<TVwProcessoResumo> read GetVwProcessoResumoList;
  end;
  
  [Entity]
  [Table('CustomerGroup_CustomerProfile')]
  [Id('FCustomergroupId', TIdGenerator.None)]
  [Id('FCpsId', TIdGenerator.None)]
  TCustomergroupCustomerprofile = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CustomerGroup_id', [TColumnProp.Required], 'id')]
    FCustomergroupId: Proxy<TCustomergroup>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('cps_id', [TColumnProp.Required], 'id')]
    FCpsId: Proxy<TCustomerprofile>;
    function GetCustomergroupId: TCustomergroup;
    procedure SetCustomergroupId(const Value: TCustomergroup);
    function GetCpsId: TCustomerprofile;
    procedure SetCpsId(const Value: TCustomerprofile);
  public
    property CustomergroupId: TCustomergroup read GetCustomergroupId write SetCustomergroupId;
    property CpsId: TCustomerprofile read GetCpsId write SetCpsId;
  end;
  
  [Entity]
  [Table('CustomerProfile')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TCustomerprofile = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('consolidatedBilling', [])]
    FConsolidatedbilling: Nullable<Boolean>;
    
    [Column('consolidatedInvoice', [])]
    FConsolidatedinvoice: Nullable<Boolean>;
    
    [Column('costCenter', [], 255)]
    FCostcenter: Nullable<string>;
    
    [Column('descricao', [], 255)]
    FDescricao: Nullable<string>;
    
    [Column('loadDITax', [])]
    FLoadditax: Nullable<Boolean>;
    
    [Column('sendToBank', [])]
    FSendtobank: Nullable<Boolean>;
    
    [Column('withCashRequest', [])]
    FWithcashrequest: Nullable<Boolean>;
    
    [Column('limitValue', [], 19, 2)]
    FLimitvalue: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('product_id', [TColumnProp.Required], 'id')]
    FProductId: Proxy<TProduct>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge, TCascadeType.Remove], 'FCpsId')]
    FPerfisJoin: Proxy<TList<TCustomergroupCustomerprofile>>;
    function GetProductId: TProduct;
    procedure SetProductId(const Value: TProduct);
    function GetPerfisJoin: TList<TCustomergroupCustomerprofile>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Consolidatedbilling: Nullable<Boolean> read FConsolidatedbilling write FConsolidatedbilling;
    property Consolidatedinvoice: Nullable<Boolean> read FConsolidatedinvoice write FConsolidatedinvoice;
    property Costcenter: Nullable<string> read FCostcenter write FCostcenter;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
    property Loadditax: Nullable<Boolean> read FLoadditax write FLoadditax;
    property Sendtobank: Nullable<Boolean> read FSendtobank write FSendtobank;
    property Withcashrequest: Nullable<Boolean> read FWithcashrequest write FWithcashrequest;
    property Limitvalue: Nullable<Double> read FLimitvalue write FLimitvalue;
    property ProductId: TProduct read GetProductId write SetProductId;
    property PerfisJoin: TList<TCustomergroupCustomerprofile> read GetPerfisJoin;
  end;
  
  [Entity]
  [Table('Destino')]
  [Id('FCoddestino', TIdGenerator.None)]
  TDestino = class
  private
    [Column('codDestino', [TColumnProp.Required])]
    FCoddestino: Integer;
    
    [Column('descricao', [], 30)]
    FDescricao: Nullable<string>;
  public
    property Coddestino: Integer read FCoddestino write FCoddestino;
    property Descricao: Nullable<string> read FDescricao write FDescricao;
  end;
  
  [Entity]
  [Table('Item')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TItem = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('active', [])]
    FActive: Nullable<Boolean>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Column('productItem', [])]
    FProductitem: Nullable<Integer>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('taxable', [])]
    FTaxable: Nullable<Boolean>;
    
    [Column('type', [TColumnProp.Required], 1)]
    FType_: string;
    
    [Column('ContaFinanceiraImp', [], 255)]
    FContafinanceiraimp: Nullable<string>;
    
    [Column('ContaFinanceiraExp', [], 255)]
    FContafinanceiraexp: Nullable<string>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FItemId')]
    FItemcashrequestedList: Proxy<TList<TItemcashrequested>>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FItemId')]
    FItempaymentrequestedList: Proxy<TList<TItempaymentrequested>>;
    function GetItemcashrequestedList: TList<TItemcashrequested>;
    function GetItempaymentrequestedList: TList<TItempaymentrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Active: Nullable<Boolean> read FActive write FActive;
    property Name: Nullable<string> read FName write FName;
    property Productitem: Nullable<Integer> read FProductitem write FProductitem;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Taxable: Nullable<Boolean> read FTaxable write FTaxable;
    property Type_: string read FType_ write FType_;
    property Contafinanceiraimp: Nullable<string> read FContafinanceiraimp write FContafinanceiraimp;
    property Contafinanceiraexp: Nullable<string> read FContafinanceiraexp write FContafinanceiraexp;
    property ItemcashrequestedList: TList<TItemcashrequested> read GetItemcashrequestedList;
    property ItempaymentrequestedList: TList<TItempaymentrequested> read GetItempaymentrequestedList;
  end;
  
  [Entity]
  [Table('ItemCashRequested')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TItemcashrequested = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('destino', [], 1)]
    FDestino: Nullable<string>;
    
    [Column('price', [], 19, 2)]
    FPrice: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('item_id', [], 'id')]
    FItemId: Proxy<TItem>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FItemsId')]
    FJoinCashRequested: Proxy<TList<TCashrequestedItemcashrequested>>;
    function GetItemId: TItem;
    procedure SetItemId(const Value: TItem);
    function GetJoinCashRequested: TList<TCashrequestedItemcashrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Destino: Nullable<string> read FDestino write FDestino;
    property Price: Nullable<Double> read FPrice write FPrice;
    property ItemId: TItem read GetItemId write SetItemId;
    property JoinCashRequested: TList<TCashrequestedItemcashrequested> read GetJoinCashRequested;
  end;
  
  [Entity]
  [Table('ItemInvoiced')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TIteminvoiced = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('price', [], 19, 2)]
    FPrice: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customClearance_id', [], 'id')]
    FCustomclearanceId: Proxy<TCustomclearance>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('item_id', [], 'id')]
    FItemId: Proxy<TItem>;
    function GetCustomclearanceId: TCustomclearance;
    procedure SetCustomclearanceId(const Value: TCustomclearance);
    function GetItemId: TItem;
    procedure SetItemId(const Value: TItem);
  public
    property Id: Int64 read FId write FId;
    property Price: Nullable<Double> read FPrice write FPrice;
    property CustomclearanceId: TCustomclearance read GetCustomclearanceId write SetCustomclearanceId;
    property ItemId: TItem read GetItemId write SetItemId;
  end;
  
  [Entity]
  [Table('ItemPaymentRequested')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TItempaymentrequested = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('destino', [], 1)]
    FDestino: Nullable<string>;
    
    [Column('price', [], 19, 2)]
    FPrice: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('item_id', [], 'id')]
    FItemId: Proxy<TItem>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FItemsId')]
    FJoinPaymentRequested: Proxy<TList<TPaymentrequestedItempaymentrequested>>;
    function GetItemId: TItem;
    procedure SetItemId(const Value: TItem);
    function GetJoinPaymentRequested: TList<TPaymentrequestedItempaymentrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Destino: Nullable<string> read FDestino write FDestino;
    property Price: Nullable<Double> read FPrice write FPrice;
    property ItemId: TItem read GetItemId write SetItemId;
    property JoinPaymentRequested: TList<TPaymentrequestedItempaymentrequested> read GetJoinPaymentRequested;
  end;
  
  [Entity]
  [Table('Organization')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TOrganization = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('taxID', [], 255)]
    FTaxid: Nullable<string>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FOrganizationId')]
    FBranchList: Proxy<TList<TBranch>>;
    function GetBranchList: TList<TBranch>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Taxid: Nullable<string> read FTaxid write FTaxid;
    property BranchList: TList<TBranch> read GetBranchList;
  end;
  
  [Entity]
  [Table('PaymentDefinition')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TPaymentdefinition = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('dueInvoiceDay', [])]
    FDueinvoiceday: Nullable<Integer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('branch_id', [], 'id')]
    FBranchId: Proxy<TBranch>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customer_id', [], 'id')]
    FCustomerId: Proxy<TCustomer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('product_id', [], 'id')]
    FProductId: Proxy<TProduct>;
    function GetBranchId: TBranch;
    procedure SetBranchId(const Value: TBranch);
    function GetCustomerId: TCustomer;
    procedure SetCustomerId(const Value: TCustomer);
    function GetProductId: TProduct;
    procedure SetProductId(const Value: TProduct);
  public
    property Id: Int64 read FId write FId;
    property Dueinvoiceday: Nullable<Integer> read FDueinvoiceday write FDueinvoiceday;
    property BranchId: TBranch read GetBranchId write SetBranchId;
    property CustomerId: TCustomer read GetCustomerId write SetCustomerId;
    property ProductId: TProduct read GetProductId write SetProductId;
  end;
  
  [Entity]
  [Table('PaymentRequested')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TPaymentrequested = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('barCode', [], 255)]
    FBarcode: Nullable<string>;
    
    [Column('created', [])]
    FCreated: Nullable<TDateTime>;
    
    [Column('paymentTotal', [], 19, 2)]
    FPaymenttotal: Nullable<Double>;
    
    [Column('receivedDate', [])]
    FReceiveddate: Nullable<TDateTime>;
    
    [Column('seniorKey', [], 255)]
    FSeniorkey: Nullable<string>;
    
    [Column('status', [], 255)]
    FStatus: Nullable<string>;
    
    [Column('type', [], 255)]
    FType_: Nullable<string>;
    
    [Column('dueDate', [])]
    FDuedate: Nullable<TDateTime>;
    
    [Column('seniorSubKey', [], 255)]
    FSeniorsubkey: Nullable<string>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('approvedUser_id', [], 'id')]
    FApproveduserId: Proxy<TAuthuser>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('beneficiary_id', [], 'id')]
    FBeneficiaryId: Proxy<TBeneficiary>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('billing_id', [], 'id')]
    FBillingId: Proxy<TBilling>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('branch_id', [], 'id')]
    FBranchId: Proxy<TBranch>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customClearance_id', [], 'id')]
    FCustomclearanceId: Proxy<TCustomclearance>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('customer_id', [], 'id')]
    FCustomerId: Proxy<TCustomer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('product_id', [], 'id')]
    FProductId: Proxy<TProduct>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('service_id', [], 'id')]
    FServiceId: Proxy<TService>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('user_id', [], 'id')]
    FUserId: Proxy<TAuthuser>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FPaymentrequestedId')]
    FJoinItemPaymentRequested: Proxy<TList<TPaymentrequestedItempaymentrequested>>;
    function GetApproveduserId: TAuthuser;
    procedure SetApproveduserId(const Value: TAuthuser);
    function GetBeneficiaryId: TBeneficiary;
    procedure SetBeneficiaryId(const Value: TBeneficiary);
    function GetBillingId: TBilling;
    procedure SetBillingId(const Value: TBilling);
    function GetBranchId: TBranch;
    procedure SetBranchId(const Value: TBranch);
    function GetCustomclearanceId: TCustomclearance;
    procedure SetCustomclearanceId(const Value: TCustomclearance);
    function GetCustomerId: TCustomer;
    procedure SetCustomerId(const Value: TCustomer);
    function GetProductId: TProduct;
    procedure SetProductId(const Value: TProduct);
    function GetServiceId: TService;
    procedure SetServiceId(const Value: TService);
    function GetUserId: TAuthuser;
    procedure SetUserId(const Value: TAuthuser);
    function GetJoinItemPaymentRequested: TList<TPaymentrequestedItempaymentrequested>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Barcode: Nullable<string> read FBarcode write FBarcode;
    property Created: Nullable<TDateTime> read FCreated write FCreated;
    property Paymenttotal: Nullable<Double> read FPaymenttotal write FPaymenttotal;
    property Receiveddate: Nullable<TDateTime> read FReceiveddate write FReceiveddate;
    property Seniorkey: Nullable<string> read FSeniorkey write FSeniorkey;
    property Status: Nullable<string> read FStatus write FStatus;
    property Type_: Nullable<string> read FType_ write FType_;
    property Duedate: Nullable<TDateTime> read FDuedate write FDuedate;
    property Seniorsubkey: Nullable<string> read FSeniorsubkey write FSeniorsubkey;
    property ApproveduserId: TAuthuser read GetApproveduserId write SetApproveduserId;
    property BeneficiaryId: TBeneficiary read GetBeneficiaryId write SetBeneficiaryId;
    property BillingId: TBilling read GetBillingId write SetBillingId;
    property BranchId: TBranch read GetBranchId write SetBranchId;
    property CustomclearanceId: TCustomclearance read GetCustomclearanceId write SetCustomclearanceId;
    property CustomerId: TCustomer read GetCustomerId write SetCustomerId;
    property ProductId: TProduct read GetProductId write SetProductId;
    property ServiceId: TService read GetServiceId write SetServiceId;
    property UserId: TAuthuser read GetUserId write SetUserId;
    property JoinItemPaymentRequested: TList<TPaymentrequestedItempaymentrequested> read GetJoinItemPaymentRequested;
  end;
  
  [Entity]
  [Table('PaymentRequested_ItemPaymentRequested')]
  [Id('FPaymentrequestedId', TIdGenerator.None)]
  [Id('FItemsId', TIdGenerator.None)]
  TPaymentrequestedItempaymentrequested = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('PaymentRequested_id', [TColumnProp.Required], 'id')]
    FPaymentrequestedId: Proxy<TPaymentrequested>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('items_id', [TColumnProp.Required], 'id')]
    FItemsId: Proxy<TItempaymentrequested>;
    function GetPaymentrequestedId: TPaymentrequested;
    procedure SetPaymentrequestedId(const Value: TPaymentrequested);
    function GetItemsId: TItempaymentrequested;
    procedure SetItemsId(const Value: TItempaymentrequested);
  public
    property PaymentrequestedId: TPaymentrequested read GetPaymentrequestedId write SetPaymentrequestedId;
    property ItemsId: TItempaymentrequested read GetItemsId write SetItemsId;
  end;
  
  [Entity]
  [Table('PaymentStatus')]
  [Id('FId', TIdGenerator.None)]
  TPaymentstatus = class
  private
    [Column('id', [TColumnProp.Required], 10)]
    FId: string;
    
    [Column('name', [], 35)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('PaymentTypes')]
  [Id('FId', TIdGenerator.None)]
  TPaymenttypes = class
  private
    [Column('id', [TColumnProp.Required], 10)]
    FId: string;
    
    [Column('name', [], 10)]
    FName: Nullable<string>;
    
    [Column('seniokey', [])]
    FSeniokey: Nullable<Integer>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
    property Seniokey: Nullable<Integer> read FSeniokey write FSeniokey;
  end;
  
  [Entity]
  [Table('Product')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TProduct = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
    
    [ManyValuedAssociation([TAssociationProp.Lazy, TAssociationProp.Required], [TCascadeType.SaveUpdate, TCascadeType.Merge], 'FProductId')]
    FProductServiceList: Proxy<TList<TProductService>>;
    function GetProductServiceList: TList<TProductService>;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
    property ProductServiceList: TList<TProductService> read GetProductServiceList;
  end;
  
  [Entity]
  [Table('Product_Service')]
  [Id('FProductId', TIdGenerator.None)]
  [Id('FServicesId', TIdGenerator.None)]
  TProductService = class
  private
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Product_id', [TColumnProp.Required], 'id')]
    FProductId: Proxy<TProduct>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('services_id', [TColumnProp.Required], 'id')]
    FServicesId: Proxy<TService>;
    function GetProductId: TProduct;
    procedure SetProductId(const Value: TProduct);
    function GetServicesId: TService;
    procedure SetServicesId(const Value: TService);
  public
    property ProductId: TProduct read GetProductId write SetProductId;
    property ServicesId: TService read GetServicesId write SetServicesId;
  end;
  
  [Entity]
  [Table('Refund')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TRefund = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('days', [])]
    FDays: Nullable<Int64>;
    
    [Column('price', [], 19, 2)]
    FPrice: Nullable<Double>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Billing_id', [TColumnProp.Required], 'id')]
    FBillingId: Proxy<TBilling>;
    
    [Association([TAssociationProp.Lazy, TAssociationProp.Required], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('ItemPaymentRequested_id', [TColumnProp.Required], 'id')]
    FItempaymentrequestedId: Proxy<TItempaymentrequested>;
    function GetBillingId: TBilling;
    procedure SetBillingId(const Value: TBilling);
    function GetItempaymentrequestedId: TItempaymentrequested;
    procedure SetItempaymentrequestedId(const Value: TItempaymentrequested);
  public
    property Id: Int64 read FId write FId;
    property Days: Nullable<Int64> read FDays write FDays;
    property Price: Nullable<Double> read FPrice write FPrice;
    property BillingId: TBilling read GetBillingId write SetBillingId;
    property ItempaymentrequestedId: TItempaymentrequested read GetItempaymentrequestedId write SetItempaymentrequestedId;
  end;
  
  [Entity]
  [Table('Service')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TService = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FId: Int64;
    
    [Column('aKey', [], 255)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 255)]
    FName: Nullable<string>;
  public
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_BeneficiaryOpenPayments')]
  [Id('FId', TIdGenerator.None)]
  TVwBeneficiaryopenpayments = class
  private
    [Column('id', [TColumnProp.Required])]
    FId: Integer;
    
    [Column('aKey', [], 10)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 50)]
    FName: Nullable<string>;
    
    [Column('taxID', [], 50)]
    FTaxid: Nullable<string>;
  public
    property Id: Integer read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
    property Taxid: Nullable<string> read FTaxid write FTaxid;
  end;
  
  [Entity]
  [Table('vw_Customer')]
  [Id('FId', TIdGenerator.None)]
  TVwCustomer = class
  private
    [Column('id', [TColumnProp.Required])]
    FId: Int64;
    
    [Column('name', [], 300)]
    FName: Nullable<string>;
    
    [Column('taxID', [], 20)]
    FTaxid: Nullable<string>;
  public
    property Id: Int64 read FId write FId;
    property Name: Nullable<string> read FName write FName;
    property Taxid: Nullable<string> read FTaxid write FTaxid;
  end;
  
  [Entity]
  [Table('vw_Estufagem')]
  [Id('FId', TIdGenerator.None)]
  TVwEstufagem = class
  private
    [Column('id', [TColumnProp.Required], 2)]
    FId: string;
    
    [Column('name', [], 15)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_Event')]
  [Id('FId', TIdGenerator.None)]
  TVwEvent = class
  private
    [Column('id', [TColumnProp.Required], 3)]
    FId: string;
    
    [Column('Name', [], 50)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_LocalEmbarque')]
  [Id('FId', TIdGenerator.None)]
  TVwLocalembarque = class
  private
    [Column('id', [TColumnProp.Required], 4)]
    FId: string;
    
    [Column('name', [], 50)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_Processo_Resumo')]
  [Id('FCustomclearanceId', TIdGenerator.None)]
  TVwProcessoResumo = class
  private
    [Column('customClearance_id', [TColumnProp.Required])]
    FCustomclearanceId: Int64;
    
    [Column('Nr_Processo', [TColumnProp.Required], 18)]
    FNrProcesso: string;
    
    [Column('Dt_Abertura', [])]
    FDtAbertura: Nullable<TDateTime>;
    
    [Column('Dt_Desembaraco', [])]
    FDtDesembaraco: Nullable<TDateTime>;
    
    [Column('Dt_Saida', [])]
    FDtSaida: Nullable<TDateTime>;
    
    [Column('Dt_Chegada', [])]
    FDtChegada: Nullable<TDateTime>;
    
    [Column('Qt_Lis', [])]
    FQtLis: Nullable<Integer>;
    
    [Column('Qt_Lis_Anvisa', [])]
    FQtLisAnvisa: Nullable<Integer>;
    
    [Column('Qt_Lis_Inmetro', [])]
    FQtLisInmetro: Nullable<Integer>;
    
    [Column('Qt_Lis_Mapa', [])]
    FQtLisMapa: Nullable<Integer>;
    
    [Column('Qt_Containers', [])]
    FQtContainers: Nullable<Integer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Group_Id', [], 'id')]
    FGroupId: Proxy<TCustomergroup>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Customer_Id', [], 'id')]
    FCustomerId: Proxy<TCustomer>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Product_Id', [], 'id')]
    FProductId: Proxy<TProduct>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Service_Id', [], 'id')]
    FServiceId: Proxy<TService>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Cd_Representante', [], 'id')]
    FCdRepresentante: Proxy<TVwRepresentante>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Cd_Via_Transporte', [], 'id')]
    FCdViaTransporte: Proxy<TVwViatransporte>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Tp_Estufagem', [], 'id')]
    FTpEstufagem: Proxy<TVwEstufagem>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Cd_Local_Embarque', [], 'id')]
    FCdLocalEmbarque: Proxy<TVwLocalembarque>;
    
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('Cd_Local_Desembarque', [], 'id')]
    FCdLocalDesembarque: Proxy<TVwLocalembarque>;
    function GetGroupId: TCustomergroup;
    procedure SetGroupId(const Value: TCustomergroup);
    function GetCustomerId: TCustomer;
    procedure SetCustomerId(const Value: TCustomer);
    function GetProductId: TProduct;
    procedure SetProductId(const Value: TProduct);
    function GetServiceId: TService;
    procedure SetServiceId(const Value: TService);
    function GetCdRepresentante: TVwRepresentante;
    procedure SetCdRepresentante(const Value: TVwRepresentante);
    function GetCdViaTransporte: TVwViatransporte;
    procedure SetCdViaTransporte(const Value: TVwViatransporte);
    function GetTpEstufagem: TVwEstufagem;
    procedure SetTpEstufagem(const Value: TVwEstufagem);
    function GetCdLocalEmbarque: TVwLocalembarque;
    procedure SetCdLocalEmbarque(const Value: TVwLocalembarque);
    function GetCdLocalDesembarque: TVwLocalembarque;
    procedure SetCdLocalDesembarque(const Value: TVwLocalembarque);
  public
    property CustomclearanceId: Int64 read FCustomclearanceId write FCustomclearanceId;
    property NrProcesso: string read FNrProcesso write FNrProcesso;
    property DtAbertura: Nullable<TDateTime> read FDtAbertura write FDtAbertura;
    property DtDesembaraco: Nullable<TDateTime> read FDtDesembaraco write FDtDesembaraco;
    property DtSaida: Nullable<TDateTime> read FDtSaida write FDtSaida;
    property DtChegada: Nullable<TDateTime> read FDtChegada write FDtChegada;
    property QtLis: Nullable<Integer> read FQtLis write FQtLis;
    property QtLisAnvisa: Nullable<Integer> read FQtLisAnvisa write FQtLisAnvisa;
    property QtLisInmetro: Nullable<Integer> read FQtLisInmetro write FQtLisInmetro;
    property QtLisMapa: Nullable<Integer> read FQtLisMapa write FQtLisMapa;
    property QtContainers: Nullable<Integer> read FQtContainers write FQtContainers;
    property GroupId: TCustomergroup read GetGroupId write SetGroupId;
    property CustomerId: TCustomer read GetCustomerId write SetCustomerId;
    property ProductId: TProduct read GetProductId write SetProductId;
    property ServiceId: TService read GetServiceId write SetServiceId;
    property CdRepresentante: TVwRepresentante read GetCdRepresentante write SetCdRepresentante;
    property CdViaTransporte: TVwViatransporte read GetCdViaTransporte write SetCdViaTransporte;
    property TpEstufagem: TVwEstufagem read GetTpEstufagem write SetTpEstufagem;
    property CdLocalEmbarque: TVwLocalembarque read GetCdLocalEmbarque write SetCdLocalEmbarque;
    property CdLocalDesembarque: TVwLocalembarque read GetCdLocalDesembarque write SetCdLocalDesembarque;
  end;
  
  [Entity]
  [Table('vw_Product')]
  [Id('FId', TIdGenerator.None)]
  TVwProduct = class
  private
    [Column('id', [TColumnProp.Required])]
    FId: Int64;
    
    [Column('aKey', [], 2)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 40)]
    FName: Nullable<string>;
  public
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_Representante')]
  [Id('FId', TIdGenerator.None)]
  TVwRepresentante = class
  private
    [Column('id', [TColumnProp.Required], 5)]
    FId: string;
    
    [Column('name', [], 50)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_Service')]
  [Id('FId', TIdGenerator.None)]
  TVwService = class
  private
    [Column('id', [TColumnProp.Required])]
    FId: Int64;
    
    [Column('aKey', [], 3)]
    FAkey: Nullable<string>;
    
    [Column('name', [], 50)]
    FName: Nullable<string>;
  public
    property Id: Int64 read FId write FId;
    property Akey: Nullable<string> read FAkey write FAkey;
    property Name: Nullable<string> read FName write FName;
  end;
  
  [Entity]
  [Table('vw_ViaTransporte')]
  [Id('FId', TIdGenerator.None)]
  TVwViatransporte = class
  private
    [Column('id', [TColumnProp.Required], 2)]
    FId: string;
    
    [Column('name', [], 20)]
    FName: Nullable<string>;
  public
    property Id: string read FId write FId;
    property Name: Nullable<string> read FName write FName;
  end;
  
  TDicDictionary = class
  private
    FAccount: TAccountTableDictionary;
    FAuthuser: TAuthuserTableDictionary;
    FBalance: TBalanceTableDictionary;
    FBank: TBankTableDictionary;
    FBeneficiary: TBeneficiaryTableDictionary;
    FBilling: TBillingTableDictionary;
    FBillingCashrequested: TBillingCashrequestedTableDictionary;
    FBillingIteminvoiced: TBillingIteminvoicedTableDictionary;
    FBillingPaymentrequested: TBillingPaymentrequestedTableDictionary;
    FBranch: TBranchTableDictionary;
    FCashrequested: TCashrequestedTableDictionary;
    FCashrequestedItemcashrequested: TCashrequestedItemcashrequestedTableDictionary;
    FCountry: TCountryTableDictionary;
    FCustomclearance: TCustomclearanceTableDictionary;
    FCustomer: TCustomerTableDictionary;
    FCustomergroup: TCustomergroupTableDictionary;
    FCustomergroupCustomerprofile: TCustomergroupCustomerprofileTableDictionary;
    FCustomerprofile: TCustomerprofileTableDictionary;
    FItem: TItemTableDictionary;
    FItemcashrequested: TItemcashrequestedTableDictionary;
    FIteminvoiced: TIteminvoicedTableDictionary;
    FItempaymentrequested: TItempaymentrequestedTableDictionary;
    FOrganization: TOrganizationTableDictionary;
    FPaymentdefinition: TPaymentdefinitionTableDictionary;
    FPaymentrequested: TPaymentrequestedTableDictionary;
    FPaymentrequestedItempaymentrequested: TPaymentrequestedItempaymentrequestedTableDictionary;
    FProduct: TProductTableDictionary;
    FProductService: TProductServiceTableDictionary;
    FRefund: TRefundTableDictionary;
    FService: TServiceTableDictionary;
    FPaymenttypes: TPaymenttypesTableDictionary;
    FPaymentstatus: TPaymentstatusTableDictionary;
    FCashrequestedstatus: TCashrequestedstatusTableDictionary;
    FVwBeneficiaryopenpayments: TVwBeneficiaryopenpaymentsTableDictionary;
    FDestino: TDestinoTableDictionary;
    FBillingcustomerprofile: TBillingcustomerprofileTableDictionary;
    FBillingtype: TBillingtypeTableDictionary;
    FVwEstufagem: TVwEstufagemTableDictionary;
    FVwLocalembarque: TVwLocalembarqueTableDictionary;
    FVwViatransporte: TVwViatransporteTableDictionary;
    FVwService: TVwServiceTableDictionary;
    FVwProduct: TVwProductTableDictionary;
    FVwEvent: TVwEventTableDictionary;
    FVwRepresentante: TVwRepresentanteTableDictionary;
    FVwCustomer: TVwCustomerTableDictionary;
    FVwProcessoResumo: TVwProcessoResumoTableDictionary;
    function GetAccount: TAccountTableDictionary;
    function GetAuthuser: TAuthuserTableDictionary;
    function GetBalance: TBalanceTableDictionary;
    function GetBank: TBankTableDictionary;
    function GetBeneficiary: TBeneficiaryTableDictionary;
    function GetBilling: TBillingTableDictionary;
    function GetBillingCashrequested: TBillingCashrequestedTableDictionary;
    function GetBillingIteminvoiced: TBillingIteminvoicedTableDictionary;
    function GetBillingPaymentrequested: TBillingPaymentrequestedTableDictionary;
    function GetBranch: TBranchTableDictionary;
    function GetCashrequested: TCashrequestedTableDictionary;
    function GetCashrequestedItemcashrequested: TCashrequestedItemcashrequestedTableDictionary;
    function GetCountry: TCountryTableDictionary;
    function GetCustomclearance: TCustomclearanceTableDictionary;
    function GetCustomer: TCustomerTableDictionary;
    function GetCustomergroup: TCustomergroupTableDictionary;
    function GetCustomergroupCustomerprofile: TCustomergroupCustomerprofileTableDictionary;
    function GetCustomerprofile: TCustomerprofileTableDictionary;
    function GetItem: TItemTableDictionary;
    function GetItemcashrequested: TItemcashrequestedTableDictionary;
    function GetIteminvoiced: TIteminvoicedTableDictionary;
    function GetItempaymentrequested: TItempaymentrequestedTableDictionary;
    function GetOrganization: TOrganizationTableDictionary;
    function GetPaymentdefinition: TPaymentdefinitionTableDictionary;
    function GetPaymentrequested: TPaymentrequestedTableDictionary;
    function GetPaymentrequestedItempaymentrequested: TPaymentrequestedItempaymentrequestedTableDictionary;
    function GetProduct: TProductTableDictionary;
    function GetProductService: TProductServiceTableDictionary;
    function GetRefund: TRefundTableDictionary;
    function GetService: TServiceTableDictionary;
    function GetPaymenttypes: TPaymenttypesTableDictionary;
    function GetPaymentstatus: TPaymentstatusTableDictionary;
    function GetCashrequestedstatus: TCashrequestedstatusTableDictionary;
    function GetVwBeneficiaryopenpayments: TVwBeneficiaryopenpaymentsTableDictionary;
    function GetDestino: TDestinoTableDictionary;
    function GetBillingcustomerprofile: TBillingcustomerprofileTableDictionary;
    function GetBillingtype: TBillingtypeTableDictionary;
    function GetVwEstufagem: TVwEstufagemTableDictionary;
    function GetVwLocalembarque: TVwLocalembarqueTableDictionary;
    function GetVwViatransporte: TVwViatransporteTableDictionary;
    function GetVwService: TVwServiceTableDictionary;
    function GetVwProduct: TVwProductTableDictionary;
    function GetVwEvent: TVwEventTableDictionary;
    function GetVwRepresentante: TVwRepresentanteTableDictionary;
    function GetVwCustomer: TVwCustomerTableDictionary;
    function GetVwProcessoResumo: TVwProcessoResumoTableDictionary;
  public
    destructor Destroy; override;
    property Account: TAccountTableDictionary read GetAccount;
    property Authuser: TAuthuserTableDictionary read GetAuthuser;
    property Balance: TBalanceTableDictionary read GetBalance;
    property Bank: TBankTableDictionary read GetBank;
    property Beneficiary: TBeneficiaryTableDictionary read GetBeneficiary;
    property Billing: TBillingTableDictionary read GetBilling;
    property BillingCashrequested: TBillingCashrequestedTableDictionary read GetBillingCashrequested;
    property BillingIteminvoiced: TBillingIteminvoicedTableDictionary read GetBillingIteminvoiced;
    property BillingPaymentrequested: TBillingPaymentrequestedTableDictionary read GetBillingPaymentrequested;
    property Branch: TBranchTableDictionary read GetBranch;
    property Cashrequested: TCashrequestedTableDictionary read GetCashrequested;
    property CashrequestedItemcashrequested: TCashrequestedItemcashrequestedTableDictionary read GetCashrequestedItemcashrequested;
    property Country: TCountryTableDictionary read GetCountry;
    property Customclearance: TCustomclearanceTableDictionary read GetCustomclearance;
    property Customer: TCustomerTableDictionary read GetCustomer;
    property Customergroup: TCustomergroupTableDictionary read GetCustomergroup;
    property CustomergroupCustomerprofile: TCustomergroupCustomerprofileTableDictionary read GetCustomergroupCustomerprofile;
    property Customerprofile: TCustomerprofileTableDictionary read GetCustomerprofile;
    property Item: TItemTableDictionary read GetItem;
    property Itemcashrequested: TItemcashrequestedTableDictionary read GetItemcashrequested;
    property Iteminvoiced: TIteminvoicedTableDictionary read GetIteminvoiced;
    property Itempaymentrequested: TItempaymentrequestedTableDictionary read GetItempaymentrequested;
    property Organization: TOrganizationTableDictionary read GetOrganization;
    property Paymentdefinition: TPaymentdefinitionTableDictionary read GetPaymentdefinition;
    property Paymentrequested: TPaymentrequestedTableDictionary read GetPaymentrequested;
    property PaymentrequestedItempaymentrequested: TPaymentrequestedItempaymentrequestedTableDictionary read GetPaymentrequestedItempaymentrequested;
    property Product: TProductTableDictionary read GetProduct;
    property ProductService: TProductServiceTableDictionary read GetProductService;
    property Refund: TRefundTableDictionary read GetRefund;
    property Service: TServiceTableDictionary read GetService;
    property Paymenttypes: TPaymenttypesTableDictionary read GetPaymenttypes;
    property Paymentstatus: TPaymentstatusTableDictionary read GetPaymentstatus;
    property Cashrequestedstatus: TCashrequestedstatusTableDictionary read GetCashrequestedstatus;
    property VwBeneficiaryopenpayments: TVwBeneficiaryopenpaymentsTableDictionary read GetVwBeneficiaryopenpayments;
    property Destino: TDestinoTableDictionary read GetDestino;
    property Billingcustomerprofile: TBillingcustomerprofileTableDictionary read GetBillingcustomerprofile;
    property Billingtype: TBillingtypeTableDictionary read GetBillingtype;
    property VwEstufagem: TVwEstufagemTableDictionary read GetVwEstufagem;
    property VwLocalembarque: TVwLocalembarqueTableDictionary read GetVwLocalembarque;
    property VwViatransporte: TVwViatransporteTableDictionary read GetVwViatransporte;
    property VwService: TVwServiceTableDictionary read GetVwService;
    property VwProduct: TVwProductTableDictionary read GetVwProduct;
    property VwEvent: TVwEventTableDictionary read GetVwEvent;
    property VwRepresentante: TVwRepresentanteTableDictionary read GetVwRepresentante;
    property VwCustomer: TVwCustomerTableDictionary read GetVwCustomer;
    property VwProcessoResumo: TVwProcessoResumoTableDictionary read GetVwProcessoResumo;
  end;
  
  TAccountTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAgency: TDictionaryAttribute;
    FNumber: TDictionaryAttribute;
    FBankId: TDictionaryAssociation;
    FBeneficiaryId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Agency: TDictionaryAttribute read FAgency;
    property Number: TDictionaryAttribute read FNumber;
    property BankId: TDictionaryAssociation read FBankId;
    property BeneficiaryId: TDictionaryAssociation read FBeneficiaryId;
  end;
  
  TAuthuserTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FGender: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FPassword: TDictionaryAttribute;
    FStatus: TDictionaryAttribute;
    FUsername: TDictionaryAttribute;
    FFinancialAuth: TDictionaryAttribute;
    FBranchId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Gender: TDictionaryAttribute read FGender;
    property Name: TDictionaryAttribute read FName;
    property Password: TDictionaryAttribute read FPassword;
    property Status: TDictionaryAttribute read FStatus;
    property Username: TDictionaryAttribute read FUsername;
    property FinancialAuth: TDictionaryAttribute read FFinancialAuth;
    property BranchId: TDictionaryAssociation read FBranchId;
  end;
  
  TBalanceTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FValue: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Value: TDictionaryAttribute read FValue;
  end;
  
  TBankTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FCode: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Code: TDictionaryAttribute read FCode;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TBeneficiaryTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FTaxid: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
    property Taxid: TDictionaryAttribute read FTaxid;
  end;
  
  TBillingTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FCreated: TDictionaryAttribute;
    FDuedate: TDictionaryAttribute;
    FInvoicereceivertype: TDictionaryAttribute;
    FObs: TDictionaryAttribute;
    FSeniordatenfe: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FStatus: TDictionaryAttribute;
    FType_: TDictionaryAttribute;
    FIrretained: TDictionaryAttribute;
    FIr: TDictionaryAttribute;
    FTotal: TDictionaryAttribute;
    FValortibutavel: TDictionaryAttribute;
    FCofins: TDictionaryAttribute;
    FIss: TDictionaryAttribute;
    FNrNota: TDictionaryAttribute;
    FBranchId: TDictionaryAssociation;
    FUserId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Created: TDictionaryAttribute read FCreated;
    property Duedate: TDictionaryAttribute read FDuedate;
    property Invoicereceivertype: TDictionaryAttribute read FInvoicereceivertype;
    property Obs: TDictionaryAttribute read FObs;
    property Seniordatenfe: TDictionaryAttribute read FSeniordatenfe;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Status: TDictionaryAttribute read FStatus;
    property Type_: TDictionaryAttribute read FType_;
    property Irretained: TDictionaryAttribute read FIrretained;
    property Ir: TDictionaryAttribute read FIr;
    property Total: TDictionaryAttribute read FTotal;
    property Valortibutavel: TDictionaryAttribute read FValortibutavel;
    property Cofins: TDictionaryAttribute read FCofins;
    property Iss: TDictionaryAttribute read FIss;
    property NrNota: TDictionaryAttribute read FNrNota;
    property BranchId: TDictionaryAssociation read FBranchId;
    property UserId: TDictionaryAssociation read FUserId;
  end;
  
  TBillingCashrequestedTableDictionary = class
  private
    FCashrequestsId: TDictionaryAssociation;
    FBillingId: TDictionaryAssociation;
  public
    constructor Create;
    property CashrequestsId: TDictionaryAssociation read FCashrequestsId;
    property BillingId: TDictionaryAssociation read FBillingId;
  end;
  
  TBillingIteminvoicedTableDictionary = class
  private
    FItensinvoicedId: TDictionaryAssociation;
    FBillingId: TDictionaryAssociation;
  public
    constructor Create;
    property ItensinvoicedId: TDictionaryAssociation read FItensinvoicedId;
    property BillingId: TDictionaryAssociation read FBillingId;
  end;
  
  TBillingPaymentrequestedTableDictionary = class
  private
    FPaymentsId: TDictionaryAssociation;
    FBillingId: TDictionaryAssociation;
  public
    constructor Create;
    property PaymentsId: TDictionaryAssociation read FPaymentsId;
    property BillingId: TDictionaryAssociation read FBillingId;
  end;
  
  TBranchTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FTaxid: TDictionaryAttribute;
    FIss: TDictionaryAttribute;
    FOrganizationId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Taxid: TDictionaryAttribute read FTaxid;
    property Iss: TDictionaryAttribute read FIss;
    property OrganizationId: TDictionaryAssociation read FOrganizationId;
  end;
  
  TCashrequestedTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FCreated: TDictionaryAttribute;
    FReceiveddate: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FStatus: TDictionaryAttribute;
    FCashrequesttotal: TDictionaryAttribute;
    FBranchId: TDictionaryAssociation;
    FCustomerId: TDictionaryAssociation;
    FCustomclearanceId: TDictionaryAssociation;
    FProductId: TDictionaryAssociation;
    FServiceId: TDictionaryAssociation;
    FUserId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Created: TDictionaryAttribute read FCreated;
    property Receiveddate: TDictionaryAttribute read FReceiveddate;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Status: TDictionaryAttribute read FStatus;
    property Cashrequesttotal: TDictionaryAttribute read FCashrequesttotal;
    property BranchId: TDictionaryAssociation read FBranchId;
    property CustomerId: TDictionaryAssociation read FCustomerId;
    property CustomclearanceId: TDictionaryAssociation read FCustomclearanceId;
    property ProductId: TDictionaryAssociation read FProductId;
    property ServiceId: TDictionaryAssociation read FServiceId;
    property UserId: TDictionaryAssociation read FUserId;
  end;
  
  TCashrequestedItemcashrequestedTableDictionary = class
  private
    FItemsId: TDictionaryAssociation;
    FCashrequestedId: TDictionaryAssociation;
  public
    constructor Create;
    property ItemsId: TDictionaryAssociation read FItemsId;
    property CashrequestedId: TDictionaryAssociation read FCashrequestedId;
  end;
  
  TCountryTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TCustomclearanceTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FCustomid: TDictionaryAttribute;
    FBalanceId: TDictionaryAssociation;
    FCustomerId: TDictionaryAssociation;
    FServiceId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Customid: TDictionaryAttribute read FCustomid;
    property BalanceId: TDictionaryAssociation read FBalanceId;
    property CustomerId: TDictionaryAssociation read FCustomerId;
    property ServiceId: TDictionaryAssociation read FServiceId;
  end;
  
  TCustomerTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FActive: TDictionaryAttribute;
    FCity: TDictionaryAttribute;
    FNeighborhood: TDictionaryAttribute;
    FNumber: TDictionaryAttribute;
    FState: TDictionaryAttribute;
    FStreet: TDictionaryAttribute;
    FZipcode: TDictionaryAttribute;
    FFax: TDictionaryAttribute;
    FFone: TDictionaryAttribute;
    FInscestadual: TDictionaryAttribute;
    FInscmunicipal: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FTaxid: TDictionaryAttribute;
    FType_: TDictionaryAttribute;
    FGroupId: TDictionaryAssociation;
    FCountryId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Active: TDictionaryAttribute read FActive;
    property City: TDictionaryAttribute read FCity;
    property Neighborhood: TDictionaryAttribute read FNeighborhood;
    property Number: TDictionaryAttribute read FNumber;
    property State: TDictionaryAttribute read FState;
    property Street: TDictionaryAttribute read FStreet;
    property Zipcode: TDictionaryAttribute read FZipcode;
    property Fax: TDictionaryAttribute read FFax;
    property Fone: TDictionaryAttribute read FFone;
    property Inscestadual: TDictionaryAttribute read FInscestadual;
    property Inscmunicipal: TDictionaryAttribute read FInscmunicipal;
    property Name: TDictionaryAttribute read FName;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Taxid: TDictionaryAttribute read FTaxid;
    property Type_: TDictionaryAttribute read FType_;
    property GroupId: TDictionaryAssociation read FGroupId;
    property CountryId: TDictionaryAssociation read FCountryId;
  end;
  
  TCustomergroupTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FDefinitionsId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
    property DefinitionsId: TDictionaryAssociation read FDefinitionsId;
  end;
  
  TCustomergroupCustomerprofileTableDictionary = class
  private
    FCustomergroupId: TDictionaryAssociation;
    FCpsId: TDictionaryAssociation;
  public
    constructor Create;
    property CustomergroupId: TDictionaryAssociation read FCustomergroupId;
    property CpsId: TDictionaryAssociation read FCpsId;
  end;
  
  TCustomerprofileTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FConsolidatedbilling: TDictionaryAttribute;
    FConsolidatedinvoice: TDictionaryAttribute;
    FCostcenter: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
    FLoadditax: TDictionaryAttribute;
    FSendtobank: TDictionaryAttribute;
    FWithcashrequest: TDictionaryAttribute;
    FLimitvalue: TDictionaryAttribute;
    FProductId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Consolidatedbilling: TDictionaryAttribute read FConsolidatedbilling;
    property Consolidatedinvoice: TDictionaryAttribute read FConsolidatedinvoice;
    property Costcenter: TDictionaryAttribute read FCostcenter;
    property Descricao: TDictionaryAttribute read FDescricao;
    property Loadditax: TDictionaryAttribute read FLoadditax;
    property Sendtobank: TDictionaryAttribute read FSendtobank;
    property Withcashrequest: TDictionaryAttribute read FWithcashrequest;
    property Limitvalue: TDictionaryAttribute read FLimitvalue;
    property ProductId: TDictionaryAssociation read FProductId;
  end;
  
  TItemTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FActive: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FProductitem: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FTaxable: TDictionaryAttribute;
    FType_: TDictionaryAttribute;
    FContafinanceiraimp: TDictionaryAttribute;
    FContafinanceiraexp: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Active: TDictionaryAttribute read FActive;
    property Name: TDictionaryAttribute read FName;
    property Productitem: TDictionaryAttribute read FProductitem;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Taxable: TDictionaryAttribute read FTaxable;
    property Type_: TDictionaryAttribute read FType_;
    property Contafinanceiraimp: TDictionaryAttribute read FContafinanceiraimp;
    property Contafinanceiraexp: TDictionaryAttribute read FContafinanceiraexp;
  end;
  
  TItemcashrequestedTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FDestino: TDictionaryAttribute;
    FPrice: TDictionaryAttribute;
    FItemId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Destino: TDictionaryAttribute read FDestino;
    property Price: TDictionaryAttribute read FPrice;
    property ItemId: TDictionaryAssociation read FItemId;
  end;
  
  TIteminvoicedTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FPrice: TDictionaryAttribute;
    FCustomclearanceId: TDictionaryAssociation;
    FItemId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Price: TDictionaryAttribute read FPrice;
    property CustomclearanceId: TDictionaryAssociation read FCustomclearanceId;
    property ItemId: TDictionaryAssociation read FItemId;
  end;
  
  TItempaymentrequestedTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FDestino: TDictionaryAttribute;
    FPrice: TDictionaryAttribute;
    FItemId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Destino: TDictionaryAttribute read FDestino;
    property Price: TDictionaryAttribute read FPrice;
    property ItemId: TDictionaryAssociation read FItemId;
  end;
  
  TOrganizationTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FTaxid: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Taxid: TDictionaryAttribute read FTaxid;
  end;
  
  TPaymentdefinitionTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FDueinvoiceday: TDictionaryAttribute;
    FBranchId: TDictionaryAssociation;
    FCustomerId: TDictionaryAssociation;
    FProductId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Dueinvoiceday: TDictionaryAttribute read FDueinvoiceday;
    property BranchId: TDictionaryAssociation read FBranchId;
    property CustomerId: TDictionaryAssociation read FCustomerId;
    property ProductId: TDictionaryAssociation read FProductId;
  end;
  
  TPaymentrequestedTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FBarcode: TDictionaryAttribute;
    FCreated: TDictionaryAttribute;
    FPaymenttotal: TDictionaryAttribute;
    FReceiveddate: TDictionaryAttribute;
    FSeniorkey: TDictionaryAttribute;
    FStatus: TDictionaryAttribute;
    FType_: TDictionaryAttribute;
    FDuedate: TDictionaryAttribute;
    FSeniorsubkey: TDictionaryAttribute;
    FApproveduserId: TDictionaryAssociation;
    FBeneficiaryId: TDictionaryAssociation;
    FBillingId: TDictionaryAssociation;
    FBranchId: TDictionaryAssociation;
    FCustomclearanceId: TDictionaryAssociation;
    FCustomerId: TDictionaryAssociation;
    FProductId: TDictionaryAssociation;
    FServiceId: TDictionaryAssociation;
    FUserId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Barcode: TDictionaryAttribute read FBarcode;
    property Created: TDictionaryAttribute read FCreated;
    property Paymenttotal: TDictionaryAttribute read FPaymenttotal;
    property Receiveddate: TDictionaryAttribute read FReceiveddate;
    property Seniorkey: TDictionaryAttribute read FSeniorkey;
    property Status: TDictionaryAttribute read FStatus;
    property Type_: TDictionaryAttribute read FType_;
    property Duedate: TDictionaryAttribute read FDuedate;
    property Seniorsubkey: TDictionaryAttribute read FSeniorsubkey;
    property ApproveduserId: TDictionaryAssociation read FApproveduserId;
    property BeneficiaryId: TDictionaryAssociation read FBeneficiaryId;
    property BillingId: TDictionaryAssociation read FBillingId;
    property BranchId: TDictionaryAssociation read FBranchId;
    property CustomclearanceId: TDictionaryAssociation read FCustomclearanceId;
    property CustomerId: TDictionaryAssociation read FCustomerId;
    property ProductId: TDictionaryAssociation read FProductId;
    property ServiceId: TDictionaryAssociation read FServiceId;
    property UserId: TDictionaryAssociation read FUserId;
  end;
  
  TPaymentrequestedItempaymentrequestedTableDictionary = class
  private
    FPaymentrequestedId: TDictionaryAssociation;
    FItemsId: TDictionaryAssociation;
  public
    constructor Create;
    property PaymentrequestedId: TDictionaryAssociation read FPaymentrequestedId;
    property ItemsId: TDictionaryAssociation read FItemsId;
  end;
  
  TProductTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TProductServiceTableDictionary = class
  private
    FProductId: TDictionaryAssociation;
    FServicesId: TDictionaryAssociation;
  public
    constructor Create;
    property ProductId: TDictionaryAssociation read FProductId;
    property ServicesId: TDictionaryAssociation read FServicesId;
  end;
  
  TRefundTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FDays: TDictionaryAttribute;
    FPrice: TDictionaryAttribute;
    FBillingId: TDictionaryAssociation;
    FItempaymentrequestedId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Days: TDictionaryAttribute read FDays;
    property Price: TDictionaryAttribute read FPrice;
    property BillingId: TDictionaryAssociation read FBillingId;
    property ItempaymentrequestedId: TDictionaryAssociation read FItempaymentrequestedId;
  end;
  
  TServiceTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TPaymenttypesTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FSeniokey: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
    property Seniokey: TDictionaryAttribute read FSeniokey;
  end;
  
  TPaymentstatusTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TCashrequestedstatusTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwBeneficiaryopenpaymentsTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FTaxid: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
    property Taxid: TDictionaryAttribute read FTaxid;
  end;
  
  TDestinoTableDictionary = class
  private
    FCoddestino: TDictionaryAttribute;
    FDescricao: TDictionaryAttribute;
  public
    constructor Create;
    property Coddestino: TDictionaryAttribute read FCoddestino;
    property Descricao: TDictionaryAttribute read FDescricao;
  end;
  
  TBillingcustomerprofileTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FPrice: TDictionaryAttribute;
    FStartdate: TDictionaryAttribute;
    FEnddate: TDictionaryAttribute;
    FPlaceofshipmentExcept: TDictionaryAttribute;
    FPlaceofdischargeExcept: TDictionaryAttribute;
    FIncreaserate: TDictionaryAttribute;
    FCustomergroupId: TDictionaryAssociation;
    FItemId: TDictionaryAssociation;
    FBillingtypeId: TDictionaryAssociation;
    FProductId: TDictionaryAssociation;
    FServiceId: TDictionaryAssociation;
    FPlaceofshipmentId: TDictionaryAssociation;
    FPlaceofdischargeId: TDictionaryAssociation;
    FBaseeventId: TDictionaryAssociation;
    FTypeoftransportId: TDictionaryAssociation;
    FTypeofstuffingId: TDictionaryAssociation;
    FCustomerId: TDictionaryAssociation;
    FRepresentanteId: TDictionaryAssociation;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Price: TDictionaryAttribute read FPrice;
    property Startdate: TDictionaryAttribute read FStartdate;
    property Enddate: TDictionaryAttribute read FEnddate;
    property PlaceofshipmentExcept: TDictionaryAttribute read FPlaceofshipmentExcept;
    property PlaceofdischargeExcept: TDictionaryAttribute read FPlaceofdischargeExcept;
    property Increaserate: TDictionaryAttribute read FIncreaserate;
    property CustomergroupId: TDictionaryAssociation read FCustomergroupId;
    property ItemId: TDictionaryAssociation read FItemId;
    property BillingtypeId: TDictionaryAssociation read FBillingtypeId;
    property ProductId: TDictionaryAssociation read FProductId;
    property ServiceId: TDictionaryAssociation read FServiceId;
    property PlaceofshipmentId: TDictionaryAssociation read FPlaceofshipmentId;
    property PlaceofdischargeId: TDictionaryAssociation read FPlaceofdischargeId;
    property BaseeventId: TDictionaryAssociation read FBaseeventId;
    property TypeoftransportId: TDictionaryAssociation read FTypeoftransportId;
    property TypeofstuffingId: TDictionaryAssociation read FTypeofstuffingId;
    property CustomerId: TDictionaryAssociation read FCustomerId;
    property RepresentanteId: TDictionaryAssociation read FRepresentanteId;
  end;
  
  TBillingtypeTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwEstufagemTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwLocalembarqueTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwViatransporteTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwServiceTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwProductTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FAkey: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Akey: TDictionaryAttribute read FAkey;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwEventTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwRepresentanteTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
  end;
  
  TVwCustomerTableDictionary = class
  private
    FId: TDictionaryAttribute;
    FName: TDictionaryAttribute;
    FTaxid: TDictionaryAttribute;
  public
    constructor Create;
    property Id: TDictionaryAttribute read FId;
    property Name: TDictionaryAttribute read FName;
    property Taxid: TDictionaryAttribute read FTaxid;
  end;
  
  TVwProcessoResumoTableDictionary = class
  private
    FCustomclearanceId: TDictionaryAttribute;
    FNrProcesso: TDictionaryAttribute;
    FDtAbertura: TDictionaryAttribute;
    FDtDesembaraco: TDictionaryAttribute;
    FDtSaida: TDictionaryAttribute;
    FDtChegada: TDictionaryAttribute;
    FQtLis: TDictionaryAttribute;
    FQtLisAnvisa: TDictionaryAttribute;
    FQtLisInmetro: TDictionaryAttribute;
    FQtLisMapa: TDictionaryAttribute;
    FQtContainers: TDictionaryAttribute;
    FGroupId: TDictionaryAssociation;
    FCustomerId: TDictionaryAssociation;
    FProductId: TDictionaryAssociation;
    FServiceId: TDictionaryAssociation;
    FCdRepresentante: TDictionaryAssociation;
    FCdViaTransporte: TDictionaryAssociation;
    FTpEstufagem: TDictionaryAssociation;
    FCdLocalEmbarque: TDictionaryAssociation;
    FCdLocalDesembarque: TDictionaryAssociation;
  public
    constructor Create;
    property CustomclearanceId: TDictionaryAttribute read FCustomclearanceId;
    property NrProcesso: TDictionaryAttribute read FNrProcesso;
    property DtAbertura: TDictionaryAttribute read FDtAbertura;
    property DtDesembaraco: TDictionaryAttribute read FDtDesembaraco;
    property DtSaida: TDictionaryAttribute read FDtSaida;
    property DtChegada: TDictionaryAttribute read FDtChegada;
    property QtLis: TDictionaryAttribute read FQtLis;
    property QtLisAnvisa: TDictionaryAttribute read FQtLisAnvisa;
    property QtLisInmetro: TDictionaryAttribute read FQtLisInmetro;
    property QtLisMapa: TDictionaryAttribute read FQtLisMapa;
    property QtContainers: TDictionaryAttribute read FQtContainers;
    property GroupId: TDictionaryAssociation read FGroupId;
    property CustomerId: TDictionaryAssociation read FCustomerId;
    property ProductId: TDictionaryAssociation read FProductId;
    property ServiceId: TDictionaryAssociation read FServiceId;
    property CdRepresentante: TDictionaryAssociation read FCdRepresentante;
    property CdViaTransporte: TDictionaryAssociation read FCdViaTransporte;
    property TpEstufagem: TDictionaryAssociation read FTpEstufagem;
    property CdLocalEmbarque: TDictionaryAssociation read FCdLocalEmbarque;
    property CdLocalDesembarque: TDictionaryAssociation read FCdLocalDesembarque;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TAccount }

function TAccount.GetBankId: TBank;
begin
  result := FBankId.Value;
end;

procedure TAccount.SetBankId(const Value: TBank);
begin
  FBankId.Value := Value;
end;

function TAccount.GetBeneficiaryId: TBeneficiary;
begin
  result := FBeneficiaryId.Value;
end;

procedure TAccount.SetBeneficiaryId(const Value: TBeneficiary);
begin
  FBeneficiaryId.Value := Value;
end;

{ TAuthuser }

function TAuthuser.GetBranchId: TBranch;
begin
  result := FBranchId.Value;
end;

procedure TAuthuser.SetBranchId(const Value: TBranch);
begin
  FBranchId.Value := Value;
end;

{ TBank }

constructor TBank.Create;
begin
  inherited;
  FAccountList.SetInitialValue(TList<TAccount>.Create);
end;

destructor TBank.Destroy;
begin
  FAccountList.DestroyValue;
  inherited;
end;

function TBank.GetAccountList: TList<TAccount>;
begin
  result := FAccountList.Value;
end;

{ TBeneficiary }

constructor TBeneficiary.Create;
begin
  inherited;
  FAccountList.SetInitialValue(TList<TAccount>.Create);
  FPaymentrequestedList.SetInitialValue(TList<TPaymentrequested>.Create);
end;

destructor TBeneficiary.Destroy;
begin
  FPaymentrequestedList.DestroyValue;
  FAccountList.DestroyValue;
  inherited;
end;

function TBeneficiary.GetAccountList: TList<TAccount>;
begin
  result := FAccountList.Value;
end;

function TBeneficiary.GetPaymentrequestedList: TList<TPaymentrequested>;
begin
  result := FPaymentrequestedList.Value;
end;

{ TBilling }

function TBilling.GetBranchId: TBranch;
begin
  result := FBranchId.Value;
end;

procedure TBilling.SetBranchId(const Value: TBranch);
begin
  FBranchId.Value := Value;
end;

function TBilling.GetUserId: TAuthuser;
begin
  result := FUserId.Value;
end;

procedure TBilling.SetUserId(const Value: TAuthuser);
begin
  FUserId.Value := Value;
end;

constructor TBilling.Create;
begin
  inherited;
  FBillingCashrequestedList.SetInitialValue(TList<TBillingCashrequested>.Create);
end;

destructor TBilling.Destroy;
begin
  FBillingCashrequestedList.DestroyValue;
  inherited;
end;

function TBilling.GetBillingCashrequestedList: TList<TBillingCashrequested>;
begin
  result := FBillingCashrequestedList.Value;
end;

{ TBillingCashrequested }

function TBillingCashrequested.GetCashrequestsId: TCashrequested;
begin
  result := FCashrequestsId.Value;
end;

procedure TBillingCashrequested.SetCashrequestsId(const Value: TCashrequested);
begin
  FCashrequestsId.Value := Value;
end;

function TBillingCashrequested.GetBillingId: TBilling;
begin
  result := FBillingId.Value;
end;

procedure TBillingCashrequested.SetBillingId(const Value: TBilling);
begin
  FBillingId.Value := Value;
end;

{ TBillingcustomerprofile }

function TBillingcustomerprofile.GetCustomergroupId: TCustomergroup;
begin
  result := FCustomergroupId.Value;
end;

procedure TBillingcustomerprofile.SetCustomergroupId(const Value: TCustomergroup);
begin
  FCustomergroupId.Value := Value;
end;

function TBillingcustomerprofile.GetItemId: TItem;
begin
  result := FItemId.Value;
end;

procedure TBillingcustomerprofile.SetItemId(const Value: TItem);
begin
  FItemId.Value := Value;
end;

function TBillingcustomerprofile.GetBillingtypeId: TBillingtype;
begin
  result := FBillingtypeId.Value;
end;

procedure TBillingcustomerprofile.SetBillingtypeId(const Value: TBillingtype);
begin
  FBillingtypeId.Value := Value;
end;

function TBillingcustomerprofile.GetProductId: TVwProduct;
begin
  result := FProductId.Value;
end;

procedure TBillingcustomerprofile.SetProductId(const Value: TVwProduct);
begin
  FProductId.Value := Value;
end;

function TBillingcustomerprofile.GetServiceId: TVwService;
begin
  result := FServiceId.Value;
end;

procedure TBillingcustomerprofile.SetServiceId(const Value: TVwService);
begin
  FServiceId.Value := Value;
end;

function TBillingcustomerprofile.GetPlaceofshipmentId: TVwLocalembarque;
begin
  result := FPlaceofshipmentId.Value;
end;

procedure TBillingcustomerprofile.SetPlaceofshipmentId(const Value: TVwLocalembarque);
begin
  FPlaceofshipmentId.Value := Value;
end;

function TBillingcustomerprofile.GetPlaceofdischargeId: TVwLocalembarque;
begin
  result := FPlaceofdischargeId.Value;
end;

procedure TBillingcustomerprofile.SetPlaceofdischargeId(const Value: TVwLocalembarque);
begin
  FPlaceofdischargeId.Value := Value;
end;

function TBillingcustomerprofile.GetBaseeventId: TVwEvent;
begin
  result := FBaseeventId.Value;
end;

procedure TBillingcustomerprofile.SetBaseeventId(const Value: TVwEvent);
begin
  FBaseeventId.Value := Value;
end;

function TBillingcustomerprofile.GetTypeoftransportId: TVwViatransporte;
begin
  result := FTypeoftransportId.Value;
end;

procedure TBillingcustomerprofile.SetTypeoftransportId(const Value: TVwViatransporte);
begin
  FTypeoftransportId.Value := Value;
end;

function TBillingcustomerprofile.GetTypeofstuffingId: TVwEstufagem;
begin
  result := FTypeofstuffingId.Value;
end;

procedure TBillingcustomerprofile.SetTypeofstuffingId(const Value: TVwEstufagem);
begin
  FTypeofstuffingId.Value := Value;
end;

function TBillingcustomerprofile.GetCustomerId: TVwCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TBillingcustomerprofile.SetCustomerId(const Value: TVwCustomer);
begin
  FCustomerId.Value := Value;
end;

function TBillingcustomerprofile.GetRepresentanteId: TVwRepresentante;
begin
  result := FRepresentanteId.Value;
end;

procedure TBillingcustomerprofile.SetRepresentanteId(const Value: TVwRepresentante);
begin
  FRepresentanteId.Value := Value;
end;

{ TBillingIteminvoiced }

function TBillingIteminvoiced.GetItensinvoicedId: TIteminvoiced;
begin
  result := FItensinvoicedId.Value;
end;

procedure TBillingIteminvoiced.SetItensinvoicedId(const Value: TIteminvoiced);
begin
  FItensinvoicedId.Value := Value;
end;

function TBillingIteminvoiced.GetBillingId: TBilling;
begin
  result := FBillingId.Value;
end;

procedure TBillingIteminvoiced.SetBillingId(const Value: TBilling);
begin
  FBillingId.Value := Value;
end;

{ TBillingPaymentrequested }

function TBillingPaymentrequested.GetPaymentsId: TPaymentrequested;
begin
  result := FPaymentsId.Value;
end;

procedure TBillingPaymentrequested.SetPaymentsId(const Value: TPaymentrequested);
begin
  FPaymentsId.Value := Value;
end;

function TBillingPaymentrequested.GetBillingId: TBilling;
begin
  result := FBillingId.Value;
end;

procedure TBillingPaymentrequested.SetBillingId(const Value: TBilling);
begin
  FBillingId.Value := Value;
end;

{ TBranch }

function TBranch.GetOrganizationId: TOrganization;
begin
  result := FOrganizationId.Value;
end;

procedure TBranch.SetOrganizationId(const Value: TOrganization);
begin
  FOrganizationId.Value := Value;
end;

{ TCashrequested }

function TCashrequested.GetBranchId: TBranch;
begin
  result := FBranchId.Value;
end;

procedure TCashrequested.SetBranchId(const Value: TBranch);
begin
  FBranchId.Value := Value;
end;

function TCashrequested.GetCustomerId: TCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TCashrequested.SetCustomerId(const Value: TCustomer);
begin
  FCustomerId.Value := Value;
end;

function TCashrequested.GetCustomclearanceId: TCustomclearance;
begin
  result := FCustomclearanceId.Value;
end;

procedure TCashrequested.SetCustomclearanceId(const Value: TCustomclearance);
begin
  FCustomclearanceId.Value := Value;
end;

function TCashrequested.GetProductId: TProduct;
begin
  result := FProductId.Value;
end;

procedure TCashrequested.SetProductId(const Value: TProduct);
begin
  FProductId.Value := Value;
end;

function TCashrequested.GetServiceId: TService;
begin
  result := FServiceId.Value;
end;

procedure TCashrequested.SetServiceId(const Value: TService);
begin
  FServiceId.Value := Value;
end;

function TCashrequested.GetUserId: TAuthuser;
begin
  result := FUserId.Value;
end;

procedure TCashrequested.SetUserId(const Value: TAuthuser);
begin
  FUserId.Value := Value;
end;

constructor TCashrequested.Create;
begin
  inherited;
  FBillingCashrequestedList.SetInitialValue(TList<TBillingCashrequested>.Create);
  FJoinItemCashRequested.SetInitialValue(TList<TCashrequestedItemcashrequested>.Create);
end;

destructor TCashrequested.Destroy;
begin
  FJoinItemCashRequested.DestroyValue;
  FBillingCashrequestedList.DestroyValue;
  inherited;
end;

function TCashrequested.GetBillingCashrequestedList: TList<TBillingCashrequested>;
begin
  result := FBillingCashrequestedList.Value;
end;

function TCashrequested.GetJoinItemCashRequested: TList<TCashrequestedItemcashrequested>;
begin
  result := FJoinItemCashRequested.Value;
end;

{ TCashrequestedItemcashrequested }

function TCashrequestedItemcashrequested.GetItemsId: TItemcashrequested;
begin
  result := FItemsId.Value;
end;

procedure TCashrequestedItemcashrequested.SetItemsId(const Value: TItemcashrequested);
begin
  FItemsId.Value := Value;
end;

function TCashrequestedItemcashrequested.GetCashrequestedId: TCashrequested;
begin
  result := FCashrequestedId.Value;
end;

procedure TCashrequestedItemcashrequested.SetCashrequestedId(const Value: TCashrequested);
begin
  FCashrequestedId.Value := Value;
end;

{ TCustomclearance }

function TCustomclearance.GetCustomerId: TCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TCustomclearance.SetCustomerId(const Value: TCustomer);
begin
  FCustomerId.Value := Value;
end;

function TCustomclearance.GetServiceId: TService;
begin
  result := FServiceId.Value;
end;

procedure TCustomclearance.SetServiceId(const Value: TService);
begin
  FServiceId.Value := Value;
end;

constructor TCustomclearance.Create;
begin
  inherited;
  FCashrequestedList.SetInitialValue(TList<TCashrequested>.Create);
  FPaymentrequestedList.SetInitialValue(TList<TPaymentrequested>.Create);
end;

destructor TCustomclearance.Destroy;
begin
  FPaymentrequestedList.DestroyValue;
  FCashrequestedList.DestroyValue;
  inherited;
end;

function TCustomclearance.GetCashrequestedList: TList<TCashrequested>;
begin
  result := FCashrequestedList.Value;
end;

function TCustomclearance.GetPaymentrequestedList: TList<TPaymentrequested>;
begin
  result := FPaymentrequestedList.Value;
end;

{ TCustomer }

function TCustomer.GetGroupId: TCustomergroup;
begin
  result := FGroupId.Value;
end;

procedure TCustomer.SetGroupId(const Value: TCustomergroup);
begin
  FGroupId.Value := Value;
end;

function TCustomer.GetCountryId: TCountry;
begin
  result := FCountryId.Value;
end;

procedure TCustomer.SetCountryId(const Value: TCountry);
begin
  FCountryId.Value := Value;
end;

constructor TCustomer.Create;
begin
  inherited;
  FCustomclearanceList.SetInitialValue(TList<TCustomclearance>.Create);
  FPaymentdefinitionList.SetInitialValue(TList<TPaymentdefinition>.Create);
end;

destructor TCustomer.Destroy;
begin
  FPaymentdefinitionList.DestroyValue;
  FCustomclearanceList.DestroyValue;
  inherited;
end;

function TCustomer.GetCustomclearanceList: TList<TCustomclearance>;
begin
  result := FCustomclearanceList.Value;
end;

function TCustomer.GetPaymentdefinitionList: TList<TPaymentdefinition>;
begin
  result := FPaymentdefinitionList.Value;
end;

{ TCustomergroup }

function TCustomergroup.GetDefinitionsId: TPaymentdefinition;
begin
  result := FDefinitionsId.Value;
end;

procedure TCustomergroup.SetDefinitionsId(const Value: TPaymentdefinition);
begin
  FDefinitionsId.Value := Value;
end;

constructor TCustomergroup.Create;
begin
  inherited;
  FGrupoJoin.SetInitialValue(TList<TCustomergroupCustomerprofile>.Create);
  FBillingcustomerprofileList.SetInitialValue(TList<TBillingcustomerprofile>.Create);
  FVwProcessoResumoList.SetInitialValue(TList<TVwProcessoResumo>.Create);
end;

destructor TCustomergroup.Destroy;
begin
  FVwProcessoResumoList.DestroyValue;
  FBillingcustomerprofileList.DestroyValue;
  FGrupoJoin.DestroyValue;
  inherited;
end;

function TCustomergroup.GetGrupoJoin: TList<TCustomergroupCustomerprofile>;
begin
  result := FGrupoJoin.Value;
end;

function TCustomergroup.GetBillingcustomerprofileList: TList<TBillingcustomerprofile>;
begin
  result := FBillingcustomerprofileList.Value;
end;

function TCustomergroup.GetVwProcessoResumoList: TList<TVwProcessoResumo>;
begin
  result := FVwProcessoResumoList.Value;
end;

{ TCustomergroupCustomerprofile }

function TCustomergroupCustomerprofile.GetCustomergroupId: TCustomergroup;
begin
  result := FCustomergroupId.Value;
end;

procedure TCustomergroupCustomerprofile.SetCustomergroupId(const Value: TCustomergroup);
begin
  FCustomergroupId.Value := Value;
end;

function TCustomergroupCustomerprofile.GetCpsId: TCustomerprofile;
begin
  result := FCpsId.Value;
end;

procedure TCustomergroupCustomerprofile.SetCpsId(const Value: TCustomerprofile);
begin
  FCpsId.Value := Value;
end;

{ TCustomerprofile }

function TCustomerprofile.GetProductId: TProduct;
begin
  result := FProductId.Value;
end;

procedure TCustomerprofile.SetProductId(const Value: TProduct);
begin
  FProductId.Value := Value;
end;

constructor TCustomerprofile.Create;
begin
  inherited;
  FPerfisJoin.SetInitialValue(TList<TCustomergroupCustomerprofile>.Create);
end;

destructor TCustomerprofile.Destroy;
begin
  FPerfisJoin.DestroyValue;
  inherited;
end;

function TCustomerprofile.GetPerfisJoin: TList<TCustomergroupCustomerprofile>;
begin
  result := FPerfisJoin.Value;
end;

{ TItem }

constructor TItem.Create;
begin
  inherited;
  FItemcashrequestedList.SetInitialValue(TList<TItemcashrequested>.Create);
  FItempaymentrequestedList.SetInitialValue(TList<TItempaymentrequested>.Create);
end;

destructor TItem.Destroy;
begin
  FItempaymentrequestedList.DestroyValue;
  FItemcashrequestedList.DestroyValue;
  inherited;
end;

function TItem.GetItemcashrequestedList: TList<TItemcashrequested>;
begin
  result := FItemcashrequestedList.Value;
end;

function TItem.GetItempaymentrequestedList: TList<TItempaymentrequested>;
begin
  result := FItempaymentrequestedList.Value;
end;

{ TItemcashrequested }

function TItemcashrequested.GetItemId: TItem;
begin
  result := FItemId.Value;
end;

procedure TItemcashrequested.SetItemId(const Value: TItem);
begin
  FItemId.Value := Value;
end;

constructor TItemcashrequested.Create;
begin
  inherited;
  FJoinCashRequested.SetInitialValue(TList<TCashrequestedItemcashrequested>.Create);
end;

destructor TItemcashrequested.Destroy;
begin
  FJoinCashRequested.DestroyValue;
  inherited;
end;

function TItemcashrequested.GetJoinCashRequested: TList<TCashrequestedItemcashrequested>;
begin
  result := FJoinCashRequested.Value;
end;

{ TIteminvoiced }

function TIteminvoiced.GetCustomclearanceId: TCustomclearance;
begin
  result := FCustomclearanceId.Value;
end;

procedure TIteminvoiced.SetCustomclearanceId(const Value: TCustomclearance);
begin
  FCustomclearanceId.Value := Value;
end;

function TIteminvoiced.GetItemId: TItem;
begin
  result := FItemId.Value;
end;

procedure TIteminvoiced.SetItemId(const Value: TItem);
begin
  FItemId.Value := Value;
end;

{ TItempaymentrequested }

function TItempaymentrequested.GetItemId: TItem;
begin
  result := FItemId.Value;
end;

procedure TItempaymentrequested.SetItemId(const Value: TItem);
begin
  FItemId.Value := Value;
end;

constructor TItempaymentrequested.Create;
begin
  inherited;
  FJoinPaymentRequested.SetInitialValue(TList<TPaymentrequestedItempaymentrequested>.Create);
end;

destructor TItempaymentrequested.Destroy;
begin
  FJoinPaymentRequested.DestroyValue;
  inherited;
end;

function TItempaymentrequested.GetJoinPaymentRequested: TList<TPaymentrequestedItempaymentrequested>;
begin
  result := FJoinPaymentRequested.Value;
end;

{ TOrganization }

constructor TOrganization.Create;
begin
  inherited;
  FBranchList.SetInitialValue(TList<TBranch>.Create);
end;

destructor TOrganization.Destroy;
begin
  FBranchList.DestroyValue;
  inherited;
end;

function TOrganization.GetBranchList: TList<TBranch>;
begin
  result := FBranchList.Value;
end;

{ TPaymentdefinition }

function TPaymentdefinition.GetBranchId: TBranch;
begin
  result := FBranchId.Value;
end;

procedure TPaymentdefinition.SetBranchId(const Value: TBranch);
begin
  FBranchId.Value := Value;
end;

function TPaymentdefinition.GetCustomerId: TCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TPaymentdefinition.SetCustomerId(const Value: TCustomer);
begin
  FCustomerId.Value := Value;
end;

function TPaymentdefinition.GetProductId: TProduct;
begin
  result := FProductId.Value;
end;

procedure TPaymentdefinition.SetProductId(const Value: TProduct);
begin
  FProductId.Value := Value;
end;

{ TPaymentrequested }

function TPaymentrequested.GetApproveduserId: TAuthuser;
begin
  result := FApproveduserId.Value;
end;

procedure TPaymentrequested.SetApproveduserId(const Value: TAuthuser);
begin
  FApproveduserId.Value := Value;
end;

function TPaymentrequested.GetBeneficiaryId: TBeneficiary;
begin
  result := FBeneficiaryId.Value;
end;

procedure TPaymentrequested.SetBeneficiaryId(const Value: TBeneficiary);
begin
  FBeneficiaryId.Value := Value;
end;

function TPaymentrequested.GetBillingId: TBilling;
begin
  result := FBillingId.Value;
end;

procedure TPaymentrequested.SetBillingId(const Value: TBilling);
begin
  FBillingId.Value := Value;
end;

function TPaymentrequested.GetBranchId: TBranch;
begin
  result := FBranchId.Value;
end;

procedure TPaymentrequested.SetBranchId(const Value: TBranch);
begin
  FBranchId.Value := Value;
end;

function TPaymentrequested.GetCustomclearanceId: TCustomclearance;
begin
  result := FCustomclearanceId.Value;
end;

procedure TPaymentrequested.SetCustomclearanceId(const Value: TCustomclearance);
begin
  FCustomclearanceId.Value := Value;
end;

function TPaymentrequested.GetCustomerId: TCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TPaymentrequested.SetCustomerId(const Value: TCustomer);
begin
  FCustomerId.Value := Value;
end;

function TPaymentrequested.GetProductId: TProduct;
begin
  result := FProductId.Value;
end;

procedure TPaymentrequested.SetProductId(const Value: TProduct);
begin
  FProductId.Value := Value;
end;

function TPaymentrequested.GetServiceId: TService;
begin
  result := FServiceId.Value;
end;

procedure TPaymentrequested.SetServiceId(const Value: TService);
begin
  FServiceId.Value := Value;
end;

function TPaymentrequested.GetUserId: TAuthuser;
begin
  result := FUserId.Value;
end;

procedure TPaymentrequested.SetUserId(const Value: TAuthuser);
begin
  FUserId.Value := Value;
end;

constructor TPaymentrequested.Create;
begin
  inherited;
  FJoinItemPaymentRequested.SetInitialValue(TList<TPaymentrequestedItempaymentrequested>.Create);
end;

destructor TPaymentrequested.Destroy;
begin
  FJoinItemPaymentRequested.DestroyValue;
  inherited;
end;

function TPaymentrequested.GetJoinItemPaymentRequested: TList<TPaymentrequestedItempaymentrequested>;
begin
  result := FJoinItemPaymentRequested.Value;
end;

{ TPaymentrequestedItempaymentrequested }

function TPaymentrequestedItempaymentrequested.GetPaymentrequestedId: TPaymentrequested;
begin
  result := FPaymentrequestedId.Value;
end;

procedure TPaymentrequestedItempaymentrequested.SetPaymentrequestedId(const Value: TPaymentrequested);
begin
  FPaymentrequestedId.Value := Value;
end;

function TPaymentrequestedItempaymentrequested.GetItemsId: TItempaymentrequested;
begin
  result := FItemsId.Value;
end;

procedure TPaymentrequestedItempaymentrequested.SetItemsId(const Value: TItempaymentrequested);
begin
  FItemsId.Value := Value;
end;

{ TProduct }

constructor TProduct.Create;
begin
  inherited;
  FProductServiceList.SetInitialValue(TList<TProductService>.Create);
end;

destructor TProduct.Destroy;
begin
  FProductServiceList.DestroyValue;
  inherited;
end;

function TProduct.GetProductServiceList: TList<TProductService>;
begin
  result := FProductServiceList.Value;
end;

{ TProductService }

function TProductService.GetProductId: TProduct;
begin
  result := FProductId.Value;
end;

procedure TProductService.SetProductId(const Value: TProduct);
begin
  FProductId.Value := Value;
end;

function TProductService.GetServicesId: TService;
begin
  result := FServicesId.Value;
end;

procedure TProductService.SetServicesId(const Value: TService);
begin
  FServicesId.Value := Value;
end;

{ TRefund }

function TRefund.GetBillingId: TBilling;
begin
  result := FBillingId.Value;
end;

procedure TRefund.SetBillingId(const Value: TBilling);
begin
  FBillingId.Value := Value;
end;

function TRefund.GetItempaymentrequestedId: TItempaymentrequested;
begin
  result := FItempaymentrequestedId.Value;
end;

procedure TRefund.SetItempaymentrequestedId(const Value: TItempaymentrequested);
begin
  FItempaymentrequestedId.Value := Value;
end;

{ TVwProcessoResumo }

function TVwProcessoResumo.GetGroupId: TCustomergroup;
begin
  result := FGroupId.Value;
end;

procedure TVwProcessoResumo.SetGroupId(const Value: TCustomergroup);
begin
  FGroupId.Value := Value;
end;

function TVwProcessoResumo.GetCustomerId: TCustomer;
begin
  result := FCustomerId.Value;
end;

procedure TVwProcessoResumo.SetCustomerId(const Value: TCustomer);
begin
  FCustomerId.Value := Value;
end;

function TVwProcessoResumo.GetProductId: TProduct;
begin
  result := FProductId.Value;
end;

procedure TVwProcessoResumo.SetProductId(const Value: TProduct);
begin
  FProductId.Value := Value;
end;

function TVwProcessoResumo.GetServiceId: TService;
begin
  result := FServiceId.Value;
end;

procedure TVwProcessoResumo.SetServiceId(const Value: TService);
begin
  FServiceId.Value := Value;
end;

function TVwProcessoResumo.GetCdRepresentante: TVwRepresentante;
begin
  result := FCdRepresentante.Value;
end;

procedure TVwProcessoResumo.SetCdRepresentante(const Value: TVwRepresentante);
begin
  FCdRepresentante.Value := Value;
end;

function TVwProcessoResumo.GetCdViaTransporte: TVwViatransporte;
begin
  result := FCdViaTransporte.Value;
end;

procedure TVwProcessoResumo.SetCdViaTransporte(const Value: TVwViatransporte);
begin
  FCdViaTransporte.Value := Value;
end;

function TVwProcessoResumo.GetTpEstufagem: TVwEstufagem;
begin
  result := FTpEstufagem.Value;
end;

procedure TVwProcessoResumo.SetTpEstufagem(const Value: TVwEstufagem);
begin
  FTpEstufagem.Value := Value;
end;

function TVwProcessoResumo.GetCdLocalEmbarque: TVwLocalembarque;
begin
  result := FCdLocalEmbarque.Value;
end;

procedure TVwProcessoResumo.SetCdLocalEmbarque(const Value: TVwLocalembarque);
begin
  FCdLocalEmbarque.Value := Value;
end;

function TVwProcessoResumo.GetCdLocalDesembarque: TVwLocalembarque;
begin
  result := FCdLocalDesembarque.Value;
end;

procedure TVwProcessoResumo.SetCdLocalDesembarque(const Value: TVwLocalembarque);
begin
  FCdLocalDesembarque.Value := Value;
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if FVwProcessoResumo <> nil then FVwProcessoResumo.Free;
  if FVwCustomer <> nil then FVwCustomer.Free;
  if FVwRepresentante <> nil then FVwRepresentante.Free;
  if FVwEvent <> nil then FVwEvent.Free;
  if FVwProduct <> nil then FVwProduct.Free;
  if FVwService <> nil then FVwService.Free;
  if FVwViatransporte <> nil then FVwViatransporte.Free;
  if FVwLocalembarque <> nil then FVwLocalembarque.Free;
  if FVwEstufagem <> nil then FVwEstufagem.Free;
  if FBillingtype <> nil then FBillingtype.Free;
  if FBillingcustomerprofile <> nil then FBillingcustomerprofile.Free;
  if FDestino <> nil then FDestino.Free;
  if FVwBeneficiaryopenpayments <> nil then FVwBeneficiaryopenpayments.Free;
  if FCashrequestedstatus <> nil then FCashrequestedstatus.Free;
  if FPaymentstatus <> nil then FPaymentstatus.Free;
  if FPaymenttypes <> nil then FPaymenttypes.Free;
  if FService <> nil then FService.Free;
  if FRefund <> nil then FRefund.Free;
  if FProductService <> nil then FProductService.Free;
  if FProduct <> nil then FProduct.Free;
  if FPaymentrequestedItempaymentrequested <> nil then FPaymentrequestedItempaymentrequested.Free;
  if FPaymentrequested <> nil then FPaymentrequested.Free;
  if FPaymentdefinition <> nil then FPaymentdefinition.Free;
  if FOrganization <> nil then FOrganization.Free;
  if FItempaymentrequested <> nil then FItempaymentrequested.Free;
  if FIteminvoiced <> nil then FIteminvoiced.Free;
  if FItemcashrequested <> nil then FItemcashrequested.Free;
  if FItem <> nil then FItem.Free;
  if FCustomerprofile <> nil then FCustomerprofile.Free;
  if FCustomergroupCustomerprofile <> nil then FCustomergroupCustomerprofile.Free;
  if FCustomergroup <> nil then FCustomergroup.Free;
  if FCustomer <> nil then FCustomer.Free;
  if FCustomclearance <> nil then FCustomclearance.Free;
  if FCountry <> nil then FCountry.Free;
  if FCashrequestedItemcashrequested <> nil then FCashrequestedItemcashrequested.Free;
  if FCashrequested <> nil then FCashrequested.Free;
  if FBranch <> nil then FBranch.Free;
  if FBillingPaymentrequested <> nil then FBillingPaymentrequested.Free;
  if FBillingIteminvoiced <> nil then FBillingIteminvoiced.Free;
  if FBillingCashrequested <> nil then FBillingCashrequested.Free;
  if FBilling <> nil then FBilling.Free;
  if FBeneficiary <> nil then FBeneficiary.Free;
  if FBank <> nil then FBank.Free;
  if FBalance <> nil then FBalance.Free;
  if FAuthuser <> nil then FAuthuser.Free;
  if FAccount <> nil then FAccount.Free;
  inherited;
end;

function TDicDictionary.GetAccount: TAccountTableDictionary;
begin
  if FAccount = nil then FAccount := TAccountTableDictionary.Create;
  result := FAccount;
end;

function TDicDictionary.GetAuthuser: TAuthuserTableDictionary;
begin
  if FAuthuser = nil then FAuthuser := TAuthuserTableDictionary.Create;
  result := FAuthuser;
end;

function TDicDictionary.GetBalance: TBalanceTableDictionary;
begin
  if FBalance = nil then FBalance := TBalanceTableDictionary.Create;
  result := FBalance;
end;

function TDicDictionary.GetBank: TBankTableDictionary;
begin
  if FBank = nil then FBank := TBankTableDictionary.Create;
  result := FBank;
end;

function TDicDictionary.GetBeneficiary: TBeneficiaryTableDictionary;
begin
  if FBeneficiary = nil then FBeneficiary := TBeneficiaryTableDictionary.Create;
  result := FBeneficiary;
end;

function TDicDictionary.GetBilling: TBillingTableDictionary;
begin
  if FBilling = nil then FBilling := TBillingTableDictionary.Create;
  result := FBilling;
end;

function TDicDictionary.GetBillingCashrequested: TBillingCashrequestedTableDictionary;
begin
  if FBillingCashrequested = nil then FBillingCashrequested := TBillingCashrequestedTableDictionary.Create;
  result := FBillingCashrequested;
end;

function TDicDictionary.GetBillingIteminvoiced: TBillingIteminvoicedTableDictionary;
begin
  if FBillingIteminvoiced = nil then FBillingIteminvoiced := TBillingIteminvoicedTableDictionary.Create;
  result := FBillingIteminvoiced;
end;

function TDicDictionary.GetBillingPaymentrequested: TBillingPaymentrequestedTableDictionary;
begin
  if FBillingPaymentrequested = nil then FBillingPaymentrequested := TBillingPaymentrequestedTableDictionary.Create;
  result := FBillingPaymentrequested;
end;

function TDicDictionary.GetBranch: TBranchTableDictionary;
begin
  if FBranch = nil then FBranch := TBranchTableDictionary.Create;
  result := FBranch;
end;

function TDicDictionary.GetCashrequested: TCashrequestedTableDictionary;
begin
  if FCashrequested = nil then FCashrequested := TCashrequestedTableDictionary.Create;
  result := FCashrequested;
end;

function TDicDictionary.GetCashrequestedItemcashrequested: TCashrequestedItemcashrequestedTableDictionary;
begin
  if FCashrequestedItemcashrequested = nil then FCashrequestedItemcashrequested := TCashrequestedItemcashrequestedTableDictionary.Create;
  result := FCashrequestedItemcashrequested;
end;

function TDicDictionary.GetCountry: TCountryTableDictionary;
begin
  if FCountry = nil then FCountry := TCountryTableDictionary.Create;
  result := FCountry;
end;

function TDicDictionary.GetCustomclearance: TCustomclearanceTableDictionary;
begin
  if FCustomclearance = nil then FCustomclearance := TCustomclearanceTableDictionary.Create;
  result := FCustomclearance;
end;

function TDicDictionary.GetCustomer: TCustomerTableDictionary;
begin
  if FCustomer = nil then FCustomer := TCustomerTableDictionary.Create;
  result := FCustomer;
end;

function TDicDictionary.GetCustomergroup: TCustomergroupTableDictionary;
begin
  if FCustomergroup = nil then FCustomergroup := TCustomergroupTableDictionary.Create;
  result := FCustomergroup;
end;

function TDicDictionary.GetCustomergroupCustomerprofile: TCustomergroupCustomerprofileTableDictionary;
begin
  if FCustomergroupCustomerprofile = nil then FCustomergroupCustomerprofile := TCustomergroupCustomerprofileTableDictionary.Create;
  result := FCustomergroupCustomerprofile;
end;

function TDicDictionary.GetCustomerprofile: TCustomerprofileTableDictionary;
begin
  if FCustomerprofile = nil then FCustomerprofile := TCustomerprofileTableDictionary.Create;
  result := FCustomerprofile;
end;

function TDicDictionary.GetItem: TItemTableDictionary;
begin
  if FItem = nil then FItem := TItemTableDictionary.Create;
  result := FItem;
end;

function TDicDictionary.GetItemcashrequested: TItemcashrequestedTableDictionary;
begin
  if FItemcashrequested = nil then FItemcashrequested := TItemcashrequestedTableDictionary.Create;
  result := FItemcashrequested;
end;

function TDicDictionary.GetIteminvoiced: TIteminvoicedTableDictionary;
begin
  if FIteminvoiced = nil then FIteminvoiced := TIteminvoicedTableDictionary.Create;
  result := FIteminvoiced;
end;

function TDicDictionary.GetItempaymentrequested: TItempaymentrequestedTableDictionary;
begin
  if FItempaymentrequested = nil then FItempaymentrequested := TItempaymentrequestedTableDictionary.Create;
  result := FItempaymentrequested;
end;

function TDicDictionary.GetOrganization: TOrganizationTableDictionary;
begin
  if FOrganization = nil then FOrganization := TOrganizationTableDictionary.Create;
  result := FOrganization;
end;

function TDicDictionary.GetPaymentdefinition: TPaymentdefinitionTableDictionary;
begin
  if FPaymentdefinition = nil then FPaymentdefinition := TPaymentdefinitionTableDictionary.Create;
  result := FPaymentdefinition;
end;

function TDicDictionary.GetPaymentrequested: TPaymentrequestedTableDictionary;
begin
  if FPaymentrequested = nil then FPaymentrequested := TPaymentrequestedTableDictionary.Create;
  result := FPaymentrequested;
end;

function TDicDictionary.GetPaymentrequestedItempaymentrequested: TPaymentrequestedItempaymentrequestedTableDictionary;
begin
  if FPaymentrequestedItempaymentrequested = nil then FPaymentrequestedItempaymentrequested := TPaymentrequestedItempaymentrequestedTableDictionary.Create;
  result := FPaymentrequestedItempaymentrequested;
end;

function TDicDictionary.GetProduct: TProductTableDictionary;
begin
  if FProduct = nil then FProduct := TProductTableDictionary.Create;
  result := FProduct;
end;

function TDicDictionary.GetProductService: TProductServiceTableDictionary;
begin
  if FProductService = nil then FProductService := TProductServiceTableDictionary.Create;
  result := FProductService;
end;

function TDicDictionary.GetRefund: TRefundTableDictionary;
begin
  if FRefund = nil then FRefund := TRefundTableDictionary.Create;
  result := FRefund;
end;

function TDicDictionary.GetService: TServiceTableDictionary;
begin
  if FService = nil then FService := TServiceTableDictionary.Create;
  result := FService;
end;

function TDicDictionary.GetPaymenttypes: TPaymenttypesTableDictionary;
begin
  if FPaymenttypes = nil then FPaymenttypes := TPaymenttypesTableDictionary.Create;
  result := FPaymenttypes;
end;

function TDicDictionary.GetPaymentstatus: TPaymentstatusTableDictionary;
begin
  if FPaymentstatus = nil then FPaymentstatus := TPaymentstatusTableDictionary.Create;
  result := FPaymentstatus;
end;

function TDicDictionary.GetCashrequestedstatus: TCashrequestedstatusTableDictionary;
begin
  if FCashrequestedstatus = nil then FCashrequestedstatus := TCashrequestedstatusTableDictionary.Create;
  result := FCashrequestedstatus;
end;

function TDicDictionary.GetVwBeneficiaryopenpayments: TVwBeneficiaryopenpaymentsTableDictionary;
begin
  if FVwBeneficiaryopenpayments = nil then FVwBeneficiaryopenpayments := TVwBeneficiaryopenpaymentsTableDictionary.Create;
  result := FVwBeneficiaryopenpayments;
end;

function TDicDictionary.GetDestino: TDestinoTableDictionary;
begin
  if FDestino = nil then FDestino := TDestinoTableDictionary.Create;
  result := FDestino;
end;

function TDicDictionary.GetBillingcustomerprofile: TBillingcustomerprofileTableDictionary;
begin
  if FBillingcustomerprofile = nil then FBillingcustomerprofile := TBillingcustomerprofileTableDictionary.Create;
  result := FBillingcustomerprofile;
end;

function TDicDictionary.GetBillingtype: TBillingtypeTableDictionary;
begin
  if FBillingtype = nil then FBillingtype := TBillingtypeTableDictionary.Create;
  result := FBillingtype;
end;

function TDicDictionary.GetVwEstufagem: TVwEstufagemTableDictionary;
begin
  if FVwEstufagem = nil then FVwEstufagem := TVwEstufagemTableDictionary.Create;
  result := FVwEstufagem;
end;

function TDicDictionary.GetVwLocalembarque: TVwLocalembarqueTableDictionary;
begin
  if FVwLocalembarque = nil then FVwLocalembarque := TVwLocalembarqueTableDictionary.Create;
  result := FVwLocalembarque;
end;

function TDicDictionary.GetVwViatransporte: TVwViatransporteTableDictionary;
begin
  if FVwViatransporte = nil then FVwViatransporte := TVwViatransporteTableDictionary.Create;
  result := FVwViatransporte;
end;

function TDicDictionary.GetVwService: TVwServiceTableDictionary;
begin
  if FVwService = nil then FVwService := TVwServiceTableDictionary.Create;
  result := FVwService;
end;

function TDicDictionary.GetVwProduct: TVwProductTableDictionary;
begin
  if FVwProduct = nil then FVwProduct := TVwProductTableDictionary.Create;
  result := FVwProduct;
end;

function TDicDictionary.GetVwEvent: TVwEventTableDictionary;
begin
  if FVwEvent = nil then FVwEvent := TVwEventTableDictionary.Create;
  result := FVwEvent;
end;

function TDicDictionary.GetVwRepresentante: TVwRepresentanteTableDictionary;
begin
  if FVwRepresentante = nil then FVwRepresentante := TVwRepresentanteTableDictionary.Create;
  result := FVwRepresentante;
end;

function TDicDictionary.GetVwCustomer: TVwCustomerTableDictionary;
begin
  if FVwCustomer = nil then FVwCustomer := TVwCustomerTableDictionary.Create;
  result := FVwCustomer;
end;

function TDicDictionary.GetVwProcessoResumo: TVwProcessoResumoTableDictionary;
begin
  if FVwProcessoResumo = nil then FVwProcessoResumo := TVwProcessoResumoTableDictionary.Create;
  result := FVwProcessoResumo;
end;

{ TAccountTableDictionary }

constructor TAccountTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAgency := TDictionaryAttribute.Create('Agency');
  FNumber := TDictionaryAttribute.Create('Number');
  FBankId := TDictionaryAssociation.Create('BankId');
  FBeneficiaryId := TDictionaryAssociation.Create('BeneficiaryId');
end;

{ TAuthuserTableDictionary }

constructor TAuthuserTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FGender := TDictionaryAttribute.Create('Gender');
  FName := TDictionaryAttribute.Create('Name');
  FPassword := TDictionaryAttribute.Create('Password');
  FStatus := TDictionaryAttribute.Create('Status');
  FUsername := TDictionaryAttribute.Create('Username');
  FFinancialAuth := TDictionaryAttribute.Create('FinancialAuth');
  FBranchId := TDictionaryAssociation.Create('BranchId');
end;

{ TBalanceTableDictionary }

constructor TBalanceTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FValue := TDictionaryAttribute.Create('Value');
end;

{ TBankTableDictionary }

constructor TBankTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FCode := TDictionaryAttribute.Create('Code');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TBeneficiaryTableDictionary }

constructor TBeneficiaryTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
  FTaxid := TDictionaryAttribute.Create('Taxid');
end;

{ TBillingTableDictionary }

constructor TBillingTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FCreated := TDictionaryAttribute.Create('Created');
  FDuedate := TDictionaryAttribute.Create('Duedate');
  FInvoicereceivertype := TDictionaryAttribute.Create('Invoicereceivertype');
  FObs := TDictionaryAttribute.Create('Obs');
  FSeniordatenfe := TDictionaryAttribute.Create('Seniordatenfe');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FStatus := TDictionaryAttribute.Create('Status');
  FType_ := TDictionaryAttribute.Create('Type_');
  FIrretained := TDictionaryAttribute.Create('Irretained');
  FIr := TDictionaryAttribute.Create('Ir');
  FTotal := TDictionaryAttribute.Create('Total');
  FValortibutavel := TDictionaryAttribute.Create('Valortibutavel');
  FCofins := TDictionaryAttribute.Create('Cofins');
  FIss := TDictionaryAttribute.Create('Iss');
  FNrNota := TDictionaryAttribute.Create('NrNota');
  FBranchId := TDictionaryAssociation.Create('BranchId');
  FUserId := TDictionaryAssociation.Create('UserId');
end;

{ TBillingCashrequestedTableDictionary }

constructor TBillingCashrequestedTableDictionary.Create;
begin
  inherited;
  FCashrequestsId := TDictionaryAssociation.Create('CashrequestsId');
  FBillingId := TDictionaryAssociation.Create('BillingId');
end;

{ TBillingIteminvoicedTableDictionary }

constructor TBillingIteminvoicedTableDictionary.Create;
begin
  inherited;
  FItensinvoicedId := TDictionaryAssociation.Create('ItensinvoicedId');
  FBillingId := TDictionaryAssociation.Create('BillingId');
end;

{ TBillingPaymentrequestedTableDictionary }

constructor TBillingPaymentrequestedTableDictionary.Create;
begin
  inherited;
  FPaymentsId := TDictionaryAssociation.Create('PaymentsId');
  FBillingId := TDictionaryAssociation.Create('BillingId');
end;

{ TBranchTableDictionary }

constructor TBranchTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FTaxid := TDictionaryAttribute.Create('Taxid');
  FIss := TDictionaryAttribute.Create('Iss');
  FOrganizationId := TDictionaryAssociation.Create('OrganizationId');
end;

{ TCashrequestedTableDictionary }

constructor TCashrequestedTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FCreated := TDictionaryAttribute.Create('Created');
  FReceiveddate := TDictionaryAttribute.Create('Receiveddate');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FStatus := TDictionaryAttribute.Create('Status');
  FCashrequesttotal := TDictionaryAttribute.Create('Cashrequesttotal');
  FBranchId := TDictionaryAssociation.Create('BranchId');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
  FCustomclearanceId := TDictionaryAssociation.Create('CustomclearanceId');
  FProductId := TDictionaryAssociation.Create('ProductId');
  FServiceId := TDictionaryAssociation.Create('ServiceId');
  FUserId := TDictionaryAssociation.Create('UserId');
end;

{ TCashrequestedItemcashrequestedTableDictionary }

constructor TCashrequestedItemcashrequestedTableDictionary.Create;
begin
  inherited;
  FItemsId := TDictionaryAssociation.Create('ItemsId');
  FCashrequestedId := TDictionaryAssociation.Create('CashrequestedId');
end;

{ TCountryTableDictionary }

constructor TCountryTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TCustomclearanceTableDictionary }

constructor TCustomclearanceTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FCustomid := TDictionaryAttribute.Create('Customid');
  FBalanceId := TDictionaryAssociation.Create('BalanceId');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
  FServiceId := TDictionaryAssociation.Create('ServiceId');
end;

{ TCustomerTableDictionary }

constructor TCustomerTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FActive := TDictionaryAttribute.Create('Active');
  FCity := TDictionaryAttribute.Create('City');
  FNeighborhood := TDictionaryAttribute.Create('Neighborhood');
  FNumber := TDictionaryAttribute.Create('Number');
  FState := TDictionaryAttribute.Create('State');
  FStreet := TDictionaryAttribute.Create('Street');
  FZipcode := TDictionaryAttribute.Create('Zipcode');
  FFax := TDictionaryAttribute.Create('Fax');
  FFone := TDictionaryAttribute.Create('Fone');
  FInscestadual := TDictionaryAttribute.Create('Inscestadual');
  FInscmunicipal := TDictionaryAttribute.Create('Inscmunicipal');
  FName := TDictionaryAttribute.Create('Name');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FTaxid := TDictionaryAttribute.Create('Taxid');
  FType_ := TDictionaryAttribute.Create('Type_');
  FGroupId := TDictionaryAssociation.Create('GroupId');
  FCountryId := TDictionaryAssociation.Create('CountryId');
end;

{ TCustomergroupTableDictionary }

constructor TCustomergroupTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
  FDefinitionsId := TDictionaryAssociation.Create('DefinitionsId');
end;

{ TCustomergroupCustomerprofileTableDictionary }

constructor TCustomergroupCustomerprofileTableDictionary.Create;
begin
  inherited;
  FCustomergroupId := TDictionaryAssociation.Create('CustomergroupId');
  FCpsId := TDictionaryAssociation.Create('CpsId');
end;

{ TCustomerprofileTableDictionary }

constructor TCustomerprofileTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FConsolidatedbilling := TDictionaryAttribute.Create('Consolidatedbilling');
  FConsolidatedinvoice := TDictionaryAttribute.Create('Consolidatedinvoice');
  FCostcenter := TDictionaryAttribute.Create('Costcenter');
  FDescricao := TDictionaryAttribute.Create('Descricao');
  FLoadditax := TDictionaryAttribute.Create('Loadditax');
  FSendtobank := TDictionaryAttribute.Create('Sendtobank');
  FWithcashrequest := TDictionaryAttribute.Create('Withcashrequest');
  FLimitvalue := TDictionaryAttribute.Create('Limitvalue');
  FProductId := TDictionaryAssociation.Create('ProductId');
end;

{ TItemTableDictionary }

constructor TItemTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FActive := TDictionaryAttribute.Create('Active');
  FName := TDictionaryAttribute.Create('Name');
  FProductitem := TDictionaryAttribute.Create('Productitem');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FTaxable := TDictionaryAttribute.Create('Taxable');
  FType_ := TDictionaryAttribute.Create('Type_');
  FContafinanceiraimp := TDictionaryAttribute.Create('Contafinanceiraimp');
  FContafinanceiraexp := TDictionaryAttribute.Create('Contafinanceiraexp');
end;

{ TItemcashrequestedTableDictionary }

constructor TItemcashrequestedTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FDestino := TDictionaryAttribute.Create('Destino');
  FPrice := TDictionaryAttribute.Create('Price');
  FItemId := TDictionaryAssociation.Create('ItemId');
end;

{ TIteminvoicedTableDictionary }

constructor TIteminvoicedTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FPrice := TDictionaryAttribute.Create('Price');
  FCustomclearanceId := TDictionaryAssociation.Create('CustomclearanceId');
  FItemId := TDictionaryAssociation.Create('ItemId');
end;

{ TItempaymentrequestedTableDictionary }

constructor TItempaymentrequestedTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FDestino := TDictionaryAttribute.Create('Destino');
  FPrice := TDictionaryAttribute.Create('Price');
  FItemId := TDictionaryAssociation.Create('ItemId');
end;

{ TOrganizationTableDictionary }

constructor TOrganizationTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FTaxid := TDictionaryAttribute.Create('Taxid');
end;

{ TPaymentdefinitionTableDictionary }

constructor TPaymentdefinitionTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FDueinvoiceday := TDictionaryAttribute.Create('Dueinvoiceday');
  FBranchId := TDictionaryAssociation.Create('BranchId');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
  FProductId := TDictionaryAssociation.Create('ProductId');
end;

{ TPaymentrequestedTableDictionary }

constructor TPaymentrequestedTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FBarcode := TDictionaryAttribute.Create('Barcode');
  FCreated := TDictionaryAttribute.Create('Created');
  FPaymenttotal := TDictionaryAttribute.Create('Paymenttotal');
  FReceiveddate := TDictionaryAttribute.Create('Receiveddate');
  FSeniorkey := TDictionaryAttribute.Create('Seniorkey');
  FStatus := TDictionaryAttribute.Create('Status');
  FType_ := TDictionaryAttribute.Create('Type_');
  FDuedate := TDictionaryAttribute.Create('Duedate');
  FSeniorsubkey := TDictionaryAttribute.Create('Seniorsubkey');
  FApproveduserId := TDictionaryAssociation.Create('ApproveduserId');
  FBeneficiaryId := TDictionaryAssociation.Create('BeneficiaryId');
  FBillingId := TDictionaryAssociation.Create('BillingId');
  FBranchId := TDictionaryAssociation.Create('BranchId');
  FCustomclearanceId := TDictionaryAssociation.Create('CustomclearanceId');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
  FProductId := TDictionaryAssociation.Create('ProductId');
  FServiceId := TDictionaryAssociation.Create('ServiceId');
  FUserId := TDictionaryAssociation.Create('UserId');
end;

{ TPaymentrequestedItempaymentrequestedTableDictionary }

constructor TPaymentrequestedItempaymentrequestedTableDictionary.Create;
begin
  inherited;
  FPaymentrequestedId := TDictionaryAssociation.Create('PaymentrequestedId');
  FItemsId := TDictionaryAssociation.Create('ItemsId');
end;

{ TProductTableDictionary }

constructor TProductTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TProductServiceTableDictionary }

constructor TProductServiceTableDictionary.Create;
begin
  inherited;
  FProductId := TDictionaryAssociation.Create('ProductId');
  FServicesId := TDictionaryAssociation.Create('ServicesId');
end;

{ TRefundTableDictionary }

constructor TRefundTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FDays := TDictionaryAttribute.Create('Days');
  FPrice := TDictionaryAttribute.Create('Price');
  FBillingId := TDictionaryAssociation.Create('BillingId');
  FItempaymentrequestedId := TDictionaryAssociation.Create('ItempaymentrequestedId');
end;

{ TServiceTableDictionary }

constructor TServiceTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TPaymenttypesTableDictionary }

constructor TPaymenttypesTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
  FSeniokey := TDictionaryAttribute.Create('Seniokey');
end;

{ TPaymentstatusTableDictionary }

constructor TPaymentstatusTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TCashrequestedstatusTableDictionary }

constructor TCashrequestedstatusTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwBeneficiaryopenpaymentsTableDictionary }

constructor TVwBeneficiaryopenpaymentsTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
  FTaxid := TDictionaryAttribute.Create('Taxid');
end;

{ TDestinoTableDictionary }

constructor TDestinoTableDictionary.Create;
begin
  inherited;
  FCoddestino := TDictionaryAttribute.Create('Coddestino');
  FDescricao := TDictionaryAttribute.Create('Descricao');
end;

{ TBillingcustomerprofileTableDictionary }

constructor TBillingcustomerprofileTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FPrice := TDictionaryAttribute.Create('Price');
  FStartdate := TDictionaryAttribute.Create('Startdate');
  FEnddate := TDictionaryAttribute.Create('Enddate');
  FPlaceofshipmentExcept := TDictionaryAttribute.Create('PlaceofshipmentExcept');
  FPlaceofdischargeExcept := TDictionaryAttribute.Create('PlaceofdischargeExcept');
  FIncreaserate := TDictionaryAttribute.Create('Increaserate');
  FCustomergroupId := TDictionaryAssociation.Create('CustomergroupId');
  FItemId := TDictionaryAssociation.Create('ItemId');
  FBillingtypeId := TDictionaryAssociation.Create('BillingtypeId');
  FProductId := TDictionaryAssociation.Create('ProductId');
  FServiceId := TDictionaryAssociation.Create('ServiceId');
  FPlaceofshipmentId := TDictionaryAssociation.Create('PlaceofshipmentId');
  FPlaceofdischargeId := TDictionaryAssociation.Create('PlaceofdischargeId');
  FBaseeventId := TDictionaryAssociation.Create('BaseeventId');
  FTypeoftransportId := TDictionaryAssociation.Create('TypeoftransportId');
  FTypeofstuffingId := TDictionaryAssociation.Create('TypeofstuffingId');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
  FRepresentanteId := TDictionaryAssociation.Create('RepresentanteId');
end;

{ TBillingtypeTableDictionary }

constructor TBillingtypeTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwEstufagemTableDictionary }

constructor TVwEstufagemTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwLocalembarqueTableDictionary }

constructor TVwLocalembarqueTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwViatransporteTableDictionary }

constructor TVwViatransporteTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwServiceTableDictionary }

constructor TVwServiceTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwProductTableDictionary }

constructor TVwProductTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FAkey := TDictionaryAttribute.Create('Akey');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwEventTableDictionary }

constructor TVwEventTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwRepresentanteTableDictionary }

constructor TVwRepresentanteTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
end;

{ TVwCustomerTableDictionary }

constructor TVwCustomerTableDictionary.Create;
begin
  inherited;
  FId := TDictionaryAttribute.Create('Id');
  FName := TDictionaryAttribute.Create('Name');
  FTaxid := TDictionaryAttribute.Create('Taxid');
end;

{ TVwProcessoResumoTableDictionary }

constructor TVwProcessoResumoTableDictionary.Create;
begin
  inherited;
  FCustomclearanceId := TDictionaryAttribute.Create('CustomclearanceId');
  FNrProcesso := TDictionaryAttribute.Create('NrProcesso');
  FDtAbertura := TDictionaryAttribute.Create('DtAbertura');
  FDtDesembaraco := TDictionaryAttribute.Create('DtDesembaraco');
  FDtSaida := TDictionaryAttribute.Create('DtSaida');
  FDtChegada := TDictionaryAttribute.Create('DtChegada');
  FQtLis := TDictionaryAttribute.Create('QtLis');
  FQtLisAnvisa := TDictionaryAttribute.Create('QtLisAnvisa');
  FQtLisInmetro := TDictionaryAttribute.Create('QtLisInmetro');
  FQtLisMapa := TDictionaryAttribute.Create('QtLisMapa');
  FQtContainers := TDictionaryAttribute.Create('QtContainers');
  FGroupId := TDictionaryAssociation.Create('GroupId');
  FCustomerId := TDictionaryAssociation.Create('CustomerId');
  FProductId := TDictionaryAssociation.Create('ProductId');
  FServiceId := TDictionaryAssociation.Create('ServiceId');
  FCdRepresentante := TDictionaryAssociation.Create('CdRepresentante');
  FCdViaTransporte := TDictionaryAssociation.Create('CdViaTransporte');
  FTpEstufagem := TDictionaryAssociation.Create('TpEstufagem');
  FCdLocalEmbarque := TDictionaryAssociation.Create('CdLocalEmbarque');
  FCdLocalDesembarque := TDictionaryAssociation.Create('CdLocalDesembarque');
end;

initialization
  RegisterEntity(TAccount);
  RegisterEntity(TAuthuser);
  RegisterEntity(TBalance);
  RegisterEntity(TBank);
  RegisterEntity(TBeneficiary);
  RegisterEntity(TBilling);
  RegisterEntity(TBillingCashrequested);
  RegisterEntity(TBillingIteminvoiced);
  RegisterEntity(TBillingPaymentrequested);
  RegisterEntity(TBranch);
  RegisterEntity(TCashrequested);
  RegisterEntity(TCashrequestedItemcashrequested);
  RegisterEntity(TCountry);
  RegisterEntity(TCustomclearance);
  RegisterEntity(TCustomer);
  RegisterEntity(TCustomergroup);
  RegisterEntity(TCustomergroupCustomerprofile);
  RegisterEntity(TCustomerprofile);
  RegisterEntity(TItem);
  RegisterEntity(TItemcashrequested);
  RegisterEntity(TIteminvoiced);
  RegisterEntity(TItempaymentrequested);
  RegisterEntity(TOrganization);
  RegisterEntity(TPaymentdefinition);
  RegisterEntity(TPaymentrequested);
  RegisterEntity(TPaymentrequestedItempaymentrequested);
  RegisterEntity(TProduct);
  RegisterEntity(TProductService);
  RegisterEntity(TRefund);
  RegisterEntity(TService);
  RegisterEntity(TPaymenttypes);
  RegisterEntity(TPaymentstatus);
  RegisterEntity(TCashrequestedstatus);
  RegisterEntity(TVwBeneficiaryopenpayments);
  RegisterEntity(TDestino);
  RegisterEntity(TBillingcustomerprofile);
  RegisterEntity(TBillingtype);
  RegisterEntity(TVwEstufagem);
  RegisterEntity(TVwLocalembarque);
  RegisterEntity(TVwViatransporte);
  RegisterEntity(TVwService);
  RegisterEntity(TVwProduct);
  RegisterEntity(TVwEvent);
  RegisterEntity(TVwRepresentante);
  RegisterEntity(TVwCustomer);
  RegisterEntity(TVwProcessoResumo);

finalization
  if __Dic <> nil then __Dic.Free

end.
