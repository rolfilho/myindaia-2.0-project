
{***************************************************************************************************}
{                                                                                                   }
{                                         XML Data Binding                                          }
{                                                                                                   }
{         Generated on: 24/05/2018 23:16:46                                                         }
{       Generated from: C:\Projetos\Delphi\temp_myindaianovo\documentos\xsd\XSDParaClassesDue.xsd   }
{   Settings stored in: C:\Projetos\Delphi\temp_myindaianovo\documentos\xsd\XSDParaClassesDue.xdb   }
{                                                                                                   }
{***************************************************************************************************}

unit ClassesXMLDUE;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclaration = interface;
  IXMLDeclaration_DeclarationNFe = interface;
  IXMLDeclaration_DeclarationNFe_DeclarationOffice = interface;
  IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID = interface;
  IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse = interface;
  IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address = interface;
  IXMLDeclaration_DeclarationNFe_AdditionalInformation = interface;
  IXMLDeclaration_DeclarationNFe_AdditionalInformationList = interface;
  IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription = interface;
  IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList = interface;
  IXMLDeclaration_DeclarationNFe_CurrencyExchange = interface;
  IXMLDeclaration_DeclarationNFe_Declarant = interface;
  IXMLDeclaration_DeclarationNFe_Declarant_ID = interface;
  IXMLDeclaration_DeclarationNFe_ExitOffice = interface;
  IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipmentList = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID = interface;
  IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms = interface;
  IXMLDeclaration_DeclarationNFe_UCR = interface;
  IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID = interface;
  IXMLByteList = interface;
  IXMLShortList = interface;
  IXMLString_List = interface;

{ IXMLDeclaration }

  IXMLDeclaration = interface(IXMLNode)
    ['{AB289732-5D57-4852-961D-8A4D63D3E518}']
    { Property Accessors }
    function Get_DeclarationNFe: IXMLDeclaration_DeclarationNFe;
    { Methods & Properties }
    property DeclarationNFe: IXMLDeclaration_DeclarationNFe read Get_DeclarationNFe;
  end;

{ IXMLDeclaration_DeclarationNFe }

  IXMLDeclaration_DeclarationNFe = interface(IXMLNode)
    ['{56E1E45C-E62A-4A99-880C-E5BA8E5B2651}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_DeclarationOffice: IXMLDeclaration_DeclarationNFe_DeclarationOffice;
    function Get_AdditionalInformation: IXMLDeclaration_DeclarationNFe_AdditionalInformationList;
    function Get_CurrencyExchange: IXMLDeclaration_DeclarationNFe_CurrencyExchange;
    function Get_Declarant: IXMLDeclaration_DeclarationNFe_Declarant;
    function Get_ExitOffice: IXMLDeclaration_DeclarationNFe_ExitOffice;
    function Get_GoodsShipment: IXMLDeclaration_DeclarationNFe_GoodsShipmentList;
    function Get_UCR: IXMLDeclaration_DeclarationNFe_UCR;
    procedure Set_ID(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property DeclarationOffice: IXMLDeclaration_DeclarationNFe_DeclarationOffice read Get_DeclarationOffice;
    property AdditionalInformation: IXMLDeclaration_DeclarationNFe_AdditionalInformationList read Get_AdditionalInformation;
    property CurrencyExchange: IXMLDeclaration_DeclarationNFe_CurrencyExchange read Get_CurrencyExchange;
    property Declarant: IXMLDeclaration_DeclarationNFe_Declarant read Get_Declarant;
    property ExitOffice: IXMLDeclaration_DeclarationNFe_ExitOffice read Get_ExitOffice;
    property GoodsShipment: IXMLDeclaration_DeclarationNFe_GoodsShipmentList read Get_GoodsShipment;
    property UCR: IXMLDeclaration_DeclarationNFe_UCR read Get_UCR;
  end;

{ IXMLDeclaration_DeclarationNFe_DeclarationOffice }

  IXMLDeclaration_DeclarationNFe_DeclarationOffice = interface(IXMLNode)
    ['{4035904D-E709-4024-A254-158C44297E0A}']
    { Property Accessors }
    function Get_ID: IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID;
    function Get_Warehouse: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse;
    { Methods & Properties }
    property ID: IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID read Get_ID;
    property Warehouse: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse read Get_Warehouse;
  end;

{ IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID }

  IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID = interface(IXMLNode)
    ['{F8C147C0-40D4-4341-AC9B-056EBDD5F046}']
    { Property Accessors }
    function Get_ListID: UnicodeString;
    procedure Set_ListID(Value: UnicodeString);
    { Methods & Properties }
    property ListID: UnicodeString read Get_ListID write Set_ListID;
  end;

{ IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse }

  IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse = interface(IXMLNode)
    ['{6D5953A0-BDA7-453F-A86A-6BC0DC4B7572}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_TypeCode: Integer;
    function Get_LatitudeMeasure: Double;
    function Get_LongitudeMeasure: Double;
    function Get_Address: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_TypeCode(Value: Integer);
    procedure Set_LatitudeMeasure(Value: Double);
    procedure Set_LongitudeMeasure(Value: Double);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property TypeCode: Integer read Get_TypeCode write Set_TypeCode;
    property LatitudeMeasure: Double read Get_LatitudeMeasure write Set_LatitudeMeasure;
    property LongitudeMeasure: Double read Get_LongitudeMeasure write Set_LongitudeMeasure;
    property Address: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address read Get_Address;
  end;

{ IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address }

  IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address = interface(IXMLNode)
    ['{26E13FAA-EE80-4332-A2A6-B40E2D421B98}']
    { Property Accessors }
    function Get_Line: UnicodeString;
    procedure Set_Line(Value: UnicodeString);
    { Methods & Properties }
    property Line: UnicodeString read Get_Line write Set_Line;
  end;

{ IXMLDeclaration_DeclarationNFe_AdditionalInformation }

  IXMLDeclaration_DeclarationNFe_AdditionalInformation = interface(IXMLNode)
    ['{8B5FBC22-DC2F-465B-A019-0B9D8CACDA6E}']
    { Property Accessors }
    function Get_StatementCode: IXMLShortList;
    function Get_StatementTypeCode: IXMLString_List;
    function Get_StatementDescription: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList;
    function Get_LimitDateTime: IXMLByteList;
    { Methods & Properties }
    property StatementCode: IXMLShortList read Get_StatementCode;
    property StatementTypeCode: IXMLString_List read Get_StatementTypeCode;
    property StatementDescription: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList read Get_StatementDescription;
    property LimitDateTime: IXMLByteList read Get_LimitDateTime;
  end;

{ IXMLDeclaration_DeclarationNFe_AdditionalInformationList }

  IXMLDeclaration_DeclarationNFe_AdditionalInformationList = interface(IXMLNodeCollection)
    ['{B552E145-FDEB-4FBB-AA17-9C795B566F25}']
    { Methods & Properties }
    function Add: IXMLDeclaration_DeclarationNFe_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation;
    property Items[Index: Integer]: IXMLDeclaration_DeclarationNFe_AdditionalInformation read Get_Item; default;
  end;

{ IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription }

  IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription = interface(IXMLNode)
    ['{5A3AA9E9-698F-426D-9DED-12682CE819D6}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList }

  IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList = interface(IXMLNodeCollection)
    ['{0CD156AC-D181-4B8C-AD21-01090894B052}']
    { Methods & Properties }
    function Add: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
    property Items[Index: Integer]: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription read Get_Item; default;
  end;

{ IXMLDeclaration_DeclarationNFe_CurrencyExchange }

  IXMLDeclaration_DeclarationNFe_CurrencyExchange = interface(IXMLNode)
    ['{E0710BE4-6B59-48BF-A547-FFDDC4B3CBCA}']
    { Property Accessors }
    function Get_CurrencyTypeCode: UnicodeString;
    procedure Set_CurrencyTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property CurrencyTypeCode: UnicodeString read Get_CurrencyTypeCode write Set_CurrencyTypeCode;
  end;

{ IXMLDeclaration_DeclarationNFe_Declarant }

  IXMLDeclaration_DeclarationNFe_Declarant = interface(IXMLNode)
    ['{7B87D506-C383-4E89-BCDD-49FE7F65D191}']
    { Property Accessors }
    function Get_ID: IXMLDeclaration_DeclarationNFe_Declarant_ID;
    { Methods & Properties }
    property ID: IXMLDeclaration_DeclarationNFe_Declarant_ID read Get_ID;
  end;

{ IXMLDeclaration_DeclarationNFe_Declarant_ID }

  IXMLDeclaration_DeclarationNFe_Declarant_ID = interface(IXMLNode)
    ['{E181ACA7-E039-4F1E-9AC2-BA02D37A73EF}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_ExitOffice }

  IXMLDeclaration_DeclarationNFe_ExitOffice = interface(IXMLNode)
    ['{8528E537-3F3E-4C13-A480-5E6AD914CA60}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_Warehouse: IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse;
    procedure Set_ID(Value: UnicodeString);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property Warehouse: IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse read Get_Warehouse;
  end;

{ IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse }

  IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse = interface(IXMLNode)
    ['{5C1827AF-7D08-4403-BF6B-6F5A2477E217}']
    { Property Accessors }
    function Get_ID: UnicodeString;
    function Get_TypeCode: SmallInt;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_TypeCode(Value: SmallInt);
    { Methods & Properties }
    property ID: UnicodeString read Get_ID write Set_ID;
    property TypeCode: SmallInt read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment }

  IXMLDeclaration_DeclarationNFe_GoodsShipment = interface(IXMLNode)
    ['{A006E521-BBF0-4431-838C-3F5DC084A3B3}']
    { Property Accessors }
    function Get_GovernmentAgencyGoodsItem: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
    function Get_Invoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice;
    function Get_TradeTerms: IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms;
    { Methods & Properties }
    property GovernmentAgencyGoodsItem: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList read Get_GovernmentAgencyGoodsItem;
    property Invoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice read Get_Invoice;
    property TradeTerms: IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms read Get_TradeTerms;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipmentList }

  IXMLDeclaration_DeclarationNFe_GoodsShipmentList = interface(IXMLNodeCollection)
    ['{B4E76420-6E35-46B0-A3BE-94011CD44B13}']
    { Methods & Properties }
    function Add: IXMLDeclaration_DeclarationNFe_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment;
    property Items[Index: Integer]: IXMLDeclaration_DeclarationNFe_GoodsShipment read Get_Item; default;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = interface(IXMLNode)
    ['{2498FE8B-4505-460D-AAFF-CDBE56952CF6}']
    { Property Accessors }
    function Get_CustomsValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount;
    function Get_SequenceNumeric: Integer;
    function Get_Destination: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    function Get_AdditionalInformation: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    function Get_Commodity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
    function Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
    function Get_GovernmentProcedure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Get_PreviousDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    function Get_ValuationAdjustment: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
    function Get_AdditionalDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    procedure Set_SequenceNumeric(Value: Integer);
    { Methods & Properties }
    property CustomsValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount read Get_CustomsValueAmount;
    property SequenceNumeric: Integer read Get_SequenceNumeric write Set_SequenceNumeric;
    property Destination: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination read Get_Destination;
    property AdditionalInformation: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation read Get_AdditionalInformation;
    property Commodity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity read Get_Commodity;
    property GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure read Get_GoodsMeasure;
    property GovernmentProcedure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure read Get_GovernmentProcedure;
    property PreviousDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument read Get_PreviousDocument;
    property ValuationAdjustment: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment read Get_ValuationAdjustment;
    property AdditionalDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument read Get_AdditionalDocument;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = interface(IXMLNodeCollection)
    ['{9B572474-D72A-42D5-9991-3B8DAF26ABB8}']
    { Methods & Properties }
    function Add: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
    property Items[Index: Integer]: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem read Get_Item; default;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount = interface(IXMLNode)
    ['{BD821076-38A1-4F31-9796-D1C668D9978D}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = interface(IXMLNode)
    ['{08FD42E3-1B92-49A7-B2FD-6173B8D64901}']
    { Property Accessors }
    function Get_CountryCode: UnicodeString;
    function Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
    procedure Set_CountryCode(Value: UnicodeString);
    { Methods & Properties }
    property CountryCode: UnicodeString read Get_CountryCode write Set_CountryCode;
    property GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure read Get_GoodsMeasure;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = interface(IXMLNode)
    ['{14F978D2-31F1-4873-92AA-96B6726E43FF}']
    { Property Accessors }
    function Get_TariffQuantity: Double;
    procedure Set_TariffQuantity(Value: Double);
    { Methods & Properties }
    property TariffQuantity: Double read Get_TariffQuantity write Set_TariffQuantity;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = interface(IXMLNode)
    ['{39E6362B-5656-460C-BFDB-A4A4AFC23A10}']
    { Property Accessors }
    function Get_StatementCode: SmallInt;
    function Get_StatementDescription: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription;
    function Get_LimitDateTime: Integer;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: SmallInt);
    procedure Set_LimitDateTime(Value: Integer);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: SmallInt read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription read Get_StatementDescription;
    property LimitDateTime: Integer read Get_LimitDateTime write Set_LimitDateTime;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription = interface(IXMLNode)
    ['{44EFF23E-4486-4ABE-AE6C-9DC9FEFB2CB1}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = interface(IXMLNode)
    ['{9E2FF33A-D506-416B-8DBC-CF26C3146751}']
    { Property Accessors }
    function Get_Description: UnicodeString;
    function Get_ValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount;
    function Get_InvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
    function Get_ProductCharacteristics: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    procedure Set_Description(Value: UnicodeString);
    { Methods & Properties }
    property Description: UnicodeString read Get_Description write Set_Description;
    property ValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount read Get_ValueAmount;
    property InvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine read Get_InvoiceLine;
    property ProductCharacteristics: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics read Get_ProductCharacteristics;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount = interface(IXMLNode)
    ['{CC76F175-34EC-4D02-BB7B-9BC188E541EC}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = interface(IXMLNode)
    ['{882024B0-5548-476A-92D8-76BF2C907090}']
    { Property Accessors }
    function Get_SequenceNumeric: Integer;
    function Get_ReferencedInvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
    procedure Set_SequenceNumeric(Value: Integer);
    { Methods & Properties }
    property SequenceNumeric: Integer read Get_SequenceNumeric write Set_SequenceNumeric;
    property ReferencedInvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine read Get_ReferencedInvoiceLine;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = interface(IXMLNode)
    ['{B7C657C0-9FA6-42C3-B24A-CEC22A8772BD}']
    { Property Accessors }
    function Get_SequenceNumeric: Integer;
    function Get_InvoiceIdentificationID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID;
    function Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
    procedure Set_SequenceNumeric(Value: Integer);
    { Methods & Properties }
    property SequenceNumeric: Integer read Get_SequenceNumeric write Set_SequenceNumeric;
    property InvoiceIdentificationID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID read Get_InvoiceIdentificationID;
    property GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure read Get_GoodsMeasure;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID = interface(IXMLNode)
    ['{23849BA4-B476-4A13-BE38-DD046F46B94E}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = interface(IXMLNode)
    ['{66A946C5-B2B5-4FC2-A0D0-621525442924}']
    { Property Accessors }
    function Get_TariffQuantity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity;
    { Methods & Properties }
    property TariffQuantity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity read Get_TariffQuantity;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity = interface(IXMLNode)
    ['{06A27370-0FD2-4844-A324-51A3A9E99CF2}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = interface(IXMLNode)
    ['{434D16B9-D7F0-4513-94DF-71FEF973C88A}']
    { Property Accessors }
    function Get_TypeCode: UnicodeString;
    function Get_Description: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    { Methods & Properties }
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property Description: UnicodeString read Get_Description write Set_Description;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = interface(IXMLNode)
    ['{B5BFF4ED-4856-46C1-BAC6-FCFA9AF25479}']
    { Property Accessors }
    function Get_NetNetWeightMeasure: Double;
    procedure Set_NetNetWeightMeasure(Value: Double);
    { Methods & Properties }
    property NetNetWeightMeasure: Double read Get_NetNetWeightMeasure write Set_NetNetWeightMeasure;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface(IXMLNode)
    ['{76E14D27-EB39-40EF-815A-D82D3A966000}']
    { Property Accessors }
    function Get_CurrentCode: Integer;
    procedure Set_CurrentCode(Value: Integer);
    { Methods & Properties }
    property CurrentCode: Integer read Get_CurrentCode write Set_CurrentCode;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = interface(IXMLNode)
    ['{E0843883-1CC9-41D1-B1AF-E4E0BEA54B83}']
    { Property Accessors }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID;
    function Get_TypeCode: SmallInt;
    procedure Set_TypeCode(Value: SmallInt);
    { Methods & Properties }
    property ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID read Get_ID;
    property TypeCode: SmallInt read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID = interface(IXMLNode)
    ['{580ABE71-E3A6-4DCF-AE3B-9E0799F43615}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = interface(IXMLNode)
    ['{0BC2190F-4783-4E3B-A415-C63CF88741A5}']
    { Property Accessors }
    function Get_AdditionCode: SmallInt;
    function Get_PercentageNumeric: Double;
    procedure Set_AdditionCode(Value: SmallInt);
    procedure Set_PercentageNumeric(Value: Double);
    { Methods & Properties }
    property AdditionCode: SmallInt read Get_AdditionCode write Set_AdditionCode;
    property PercentageNumeric: Double read Get_PercentageNumeric write Set_PercentageNumeric;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface(IXMLNode)
    ['{5015C440-516A-4FF9-8119-FBDDBD3147BC}']
    { Property Accessors }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: UnicodeString;
    procedure Set_CategoryCode(Value: UnicodeString);
    procedure Set_ID(Value: UnicodeString);
    { Methods & Properties }
    property CategoryCode: UnicodeString read Get_CategoryCode write Set_CategoryCode;
    property ID: UnicodeString read Get_ID write Set_ID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice = interface(IXMLNode)
    ['{9E430AD7-9E2E-4E83-84B1-74AE5E2B84C3}']
    { Property Accessors }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID;
    function Get_TypeCode: SmallInt;
    function Get_ReferencedInvoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
    procedure Set_TypeCode(Value: SmallInt);
    { Methods & Properties }
    property ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID read Get_ID;
    property TypeCode: SmallInt read Get_TypeCode write Set_TypeCode;
    property ReferencedInvoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice read Get_ReferencedInvoice;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID = interface(IXMLNode)
    ['{A8AE00E3-357A-43F4-9DDE-E7B2DDF7CF0A}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = interface(IXMLNode)
    ['{84658672-F970-47C7-A088-43BEDB93BC66}']
    { Property Accessors }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID;
    function Get_TypeCode: UnicodeString;
    function Get_Submitter: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property Submitter: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter read Get_Submitter;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID = interface(IXMLNode)
    ['{92E662AF-5654-49F5-A6E9-474B8CFD26B6}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = interface(IXMLNode)
    ['{ABCCA847-1D6E-4566-8891-C8CC45835569}']
    { Property Accessors }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID;
    { Methods & Properties }
    property ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID read Get_ID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID = interface(IXMLNode)
    ['{E5FD25E6-9471-4D5B-A902-5A4BEF7ECFD8}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms }

  IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms = interface(IXMLNode)
    ['{2A335BDB-32D4-4A31-AEDC-A16789AEE59B}']
    { Property Accessors }
    function Get_ConditionCode: UnicodeString;
    procedure Set_ConditionCode(Value: UnicodeString);
    { Methods & Properties }
    property ConditionCode: UnicodeString read Get_ConditionCode write Set_ConditionCode;
  end;

{ IXMLDeclaration_DeclarationNFe_UCR }

  IXMLDeclaration_DeclarationNFe_UCR = interface(IXMLNode)
    ['{F442197E-0E39-4D53-96F0-6EBD33FB2AAE}']
    { Property Accessors }
    function Get_TraderAssignedReferenceID: IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID;
    { Methods & Properties }
    property TraderAssignedReferenceID: IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID read Get_TraderAssignedReferenceID;
  end;

{ IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID }

  IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID = interface(IXMLNode)
    ['{F4803978-DC78-4F92-A1E4-31BE7ECC56AA}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLByteList }

  IXMLByteList = interface(IXMLNodeCollection)
    ['{25E0E6E3-5420-4AFF-9955-FB472F2861B6}']
    { Methods & Properties }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;

    function Get_Item(Index: Integer): Integer;
    property Items[Index: Integer]: Integer read Get_Item; default;
  end;

{ IXMLShortList }

  IXMLShortList = interface(IXMLNodeCollection)
    ['{477454A8-353A-4B5A-8620-A40E4CDD8781}']
    { Methods & Properties }
    function Add(const Value: SmallInt): IXMLNode;
    function Insert(const Index: Integer; const Value: SmallInt): IXMLNode;

    function Get_Item(Index: Integer): SmallInt;
    property Items[Index: Integer]: SmallInt read Get_Item; default;
  end;

{ IXMLString_List }

  IXMLString_List = interface(IXMLNodeCollection)
    ['{B3F76457-E596-4599-9C78-222EC1C003C9}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclaration = class;
  TXMLDeclaration_DeclarationNFe = class;
  TXMLDeclaration_DeclarationNFe_DeclarationOffice = class;
  TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID = class;
  TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse = class;
  TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address = class;
  TXMLDeclaration_DeclarationNFe_AdditionalInformation = class;
  TXMLDeclaration_DeclarationNFe_AdditionalInformationList = class;
  TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription = class;
  TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList = class;
  TXMLDeclaration_DeclarationNFe_CurrencyExchange = class;
  TXMLDeclaration_DeclarationNFe_Declarant = class;
  TXMLDeclaration_DeclarationNFe_Declarant_ID = class;
  TXMLDeclaration_DeclarationNFe_ExitOffice = class;
  TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipmentList = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID = class;
  TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms = class;
  TXMLDeclaration_DeclarationNFe_UCR = class;
  TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID = class;
  TXMLByteList = class;
  TXMLShortList = class;
  TXMLString_List = class;

{ TXMLDeclaration }

  TXMLDeclaration = class(TXMLNode, IXMLDeclaration)
  protected
    { IXMLDeclaration }
    function Get_DeclarationNFe: IXMLDeclaration_DeclarationNFe;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe }

  TXMLDeclaration_DeclarationNFe = class(TXMLNode, IXMLDeclaration_DeclarationNFe)
  private
    FAdditionalInformation: IXMLDeclaration_DeclarationNFe_AdditionalInformationList;
    FGoodsShipment: IXMLDeclaration_DeclarationNFe_GoodsShipmentList;
  protected
    { IXMLDeclaration_DeclarationNFe }
    function Get_ID: UnicodeString;
    function Get_DeclarationOffice: IXMLDeclaration_DeclarationNFe_DeclarationOffice;
    function Get_AdditionalInformation: IXMLDeclaration_DeclarationNFe_AdditionalInformationList;
    function Get_CurrencyExchange: IXMLDeclaration_DeclarationNFe_CurrencyExchange;
    function Get_Declarant: IXMLDeclaration_DeclarationNFe_Declarant;
    function Get_ExitOffice: IXMLDeclaration_DeclarationNFe_ExitOffice;
    function Get_GoodsShipment: IXMLDeclaration_DeclarationNFe_GoodsShipmentList;
    function Get_UCR: IXMLDeclaration_DeclarationNFe_UCR;
    procedure Set_ID(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice }

  TXMLDeclaration_DeclarationNFe_DeclarationOffice = class(TXMLNode, IXMLDeclaration_DeclarationNFe_DeclarationOffice)
  protected
    { IXMLDeclaration_DeclarationNFe_DeclarationOffice }
    function Get_ID: IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID;
    function Get_Warehouse: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID }

  TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID)
  protected
    { IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID }
    function Get_ListID: UnicodeString;
    procedure Set_ListID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse }

  TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse = class(TXMLNode, IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse)
  protected
    { IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse }
    function Get_ID: UnicodeString;
    function Get_TypeCode: Integer;
    function Get_LatitudeMeasure: Double;
    function Get_LongitudeMeasure: Double;
    function Get_Address: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_TypeCode(Value: Integer);
    procedure Set_LatitudeMeasure(Value: Double);
    procedure Set_LongitudeMeasure(Value: Double);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address }

  TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address = class(TXMLNode, IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address)
  protected
    { IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address }
    function Get_Line: UnicodeString;
    procedure Set_Line(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformation }

  TXMLDeclaration_DeclarationNFe_AdditionalInformation = class(TXMLNode, IXMLDeclaration_DeclarationNFe_AdditionalInformation)
  private
    FStatementCode: IXMLShortList;
    FStatementTypeCode: IXMLString_List;
    FStatementDescription: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList;
    FLimitDateTime: IXMLByteList;
  protected
    { IXMLDeclaration_DeclarationNFe_AdditionalInformation }
    function Get_StatementCode: IXMLShortList;
    function Get_StatementTypeCode: IXMLString_List;
    function Get_StatementDescription: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList;
    function Get_LimitDateTime: IXMLByteList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformationList }

  TXMLDeclaration_DeclarationNFe_AdditionalInformationList = class(TXMLNodeCollection, IXMLDeclaration_DeclarationNFe_AdditionalInformationList)
  protected
    { IXMLDeclaration_DeclarationNFe_AdditionalInformationList }
    function Add: IXMLDeclaration_DeclarationNFe_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation;
  end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription }

  TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription = class(TXMLNode, IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription)
  protected
    { IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList }

  TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList = class(TXMLNodeCollection, IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList)
  protected
    { IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList }
    function Add: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
  end;

{ TXMLDeclaration_DeclarationNFe_CurrencyExchange }

  TXMLDeclaration_DeclarationNFe_CurrencyExchange = class(TXMLNode, IXMLDeclaration_DeclarationNFe_CurrencyExchange)
  protected
    { IXMLDeclaration_DeclarationNFe_CurrencyExchange }
    function Get_CurrencyTypeCode: UnicodeString;
    procedure Set_CurrencyTypeCode(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_Declarant }

  TXMLDeclaration_DeclarationNFe_Declarant = class(TXMLNode, IXMLDeclaration_DeclarationNFe_Declarant)
  protected
    { IXMLDeclaration_DeclarationNFe_Declarant }
    function Get_ID: IXMLDeclaration_DeclarationNFe_Declarant_ID;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_Declarant_ID }

  TXMLDeclaration_DeclarationNFe_Declarant_ID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_Declarant_ID)
  protected
    { IXMLDeclaration_DeclarationNFe_Declarant_ID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_ExitOffice }

  TXMLDeclaration_DeclarationNFe_ExitOffice = class(TXMLNode, IXMLDeclaration_DeclarationNFe_ExitOffice)
  protected
    { IXMLDeclaration_DeclarationNFe_ExitOffice }
    function Get_ID: UnicodeString;
    function Get_Warehouse: IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse;
    procedure Set_ID(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse }

  TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse = class(TXMLNode, IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse)
  protected
    { IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse }
    function Get_ID: UnicodeString;
    function Get_TypeCode: SmallInt;
    procedure Set_ID(Value: UnicodeString);
    procedure Set_TypeCode(Value: SmallInt);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment }

  TXMLDeclaration_DeclarationNFe_GoodsShipment = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment)
  private
    FGovernmentAgencyGoodsItem: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment }
    function Get_GovernmentAgencyGoodsItem: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
    function Get_Invoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice;
    function Get_TradeTerms: IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipmentList }

  TXMLDeclaration_DeclarationNFe_GoodsShipmentList = class(TXMLNodeCollection, IXMLDeclaration_DeclarationNFe_GoodsShipmentList)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipmentList }
    function Add: IXMLDeclaration_DeclarationNFe_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }
    function Get_CustomsValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount;
    function Get_SequenceNumeric: Integer;
    function Get_Destination: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    function Get_AdditionalInformation: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    function Get_Commodity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
    function Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
    function Get_GovernmentProcedure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Get_PreviousDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    function Get_ValuationAdjustment: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
    function Get_AdditionalDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    procedure Set_SequenceNumeric(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = class(TXMLNodeCollection, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }
    function Add: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;

    function Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }
    function Get_CountryCode: UnicodeString;
    function Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
    procedure Set_CountryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }
    function Get_TariffQuantity: Double;
    procedure Set_TariffQuantity(Value: Double);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }
    function Get_StatementCode: SmallInt;
    function Get_StatementDescription: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription;
    function Get_LimitDateTime: Integer;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: SmallInt);
    procedure Set_LimitDateTime(Value: Integer);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }
    function Get_Description: UnicodeString;
    function Get_ValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount;
    function Get_InvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
    function Get_ProductCharacteristics: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    procedure Set_Description(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }
    function Get_SequenceNumeric: Integer;
    function Get_ReferencedInvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
    procedure Set_SequenceNumeric(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }
    function Get_SequenceNumeric: Integer;
    function Get_InvoiceIdentificationID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID;
    function Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
    procedure Set_SequenceNumeric(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }
    function Get_TariffQuantity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }
    function Get_TypeCode: UnicodeString;
    function Get_Description: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }
    function Get_NetNetWeightMeasure: Double;
    procedure Set_NetNetWeightMeasure(Value: Double);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }
    function Get_CurrentCode: Integer;
    procedure Set_CurrentCode(Value: Integer);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID;
    function Get_TypeCode: SmallInt;
    procedure Set_TypeCode(Value: SmallInt);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }
    function Get_AdditionCode: SmallInt;
    function Get_PercentageNumeric: Double;
    procedure Set_AdditionCode(Value: SmallInt);
    procedure Set_PercentageNumeric(Value: Double);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: UnicodeString;
    procedure Set_CategoryCode(Value: UnicodeString);
    procedure Set_ID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID;
    function Get_TypeCode: SmallInt;
    function Get_ReferencedInvoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
    procedure Set_TypeCode(Value: SmallInt);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID;
    function Get_TypeCode: UnicodeString;
    function Get_Submitter: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }
    function Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms }

  TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms = class(TXMLNode, IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms)
  protected
    { IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms }
    function Get_ConditionCode: UnicodeString;
    procedure Set_ConditionCode(Value: UnicodeString);
  end;

{ TXMLDeclaration_DeclarationNFe_UCR }

  TXMLDeclaration_DeclarationNFe_UCR = class(TXMLNode, IXMLDeclaration_DeclarationNFe_UCR)
  protected
    { IXMLDeclaration_DeclarationNFe_UCR }
    function Get_TraderAssignedReferenceID: IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID }

  TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID = class(TXMLNode, IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID)
  protected
    { IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLByteList }

  TXMLByteList = class(TXMLNodeCollection, IXMLByteList)
  protected
    { IXMLByteList }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;

    function Get_Item(Index: Integer): Integer;
  end;

{ TXMLShortList }

  TXMLShortList = class(TXMLNodeCollection, IXMLShortList)
  protected
    { IXMLShortList }
    function Add(const Value: SmallInt): IXMLNode;
    function Insert(const Index: Integer; const Value: SmallInt): IXMLNode;

    function Get_Item(Index: Integer): SmallInt;
  end;

{ TXMLString_List }

  TXMLString_List = class(TXMLNodeCollection, IXMLString_List)
  protected
    { IXMLString_List }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ Global Functions }

function GetDeclaration(Doc: IXMLDocument): IXMLDeclaration;
function LoadDeclaration(const FileName: string): IXMLDeclaration;
function NewDeclaration: IXMLDeclaration;

const
  TargetNamespace = 'urn:wco:datamodel:WCO:GoodsDeclaration:1';

implementation

{ Global Functions }

function GetDeclaration(Doc: IXMLDocument): IXMLDeclaration;
begin
  Result := Doc.GetDocBinding('Declaration', TXMLDeclaration, TargetNamespace) as IXMLDeclaration;
end;

function LoadDeclaration(const FileName: string): IXMLDeclaration;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Declaration', TXMLDeclaration, TargetNamespace) as IXMLDeclaration;
end;

function NewDeclaration: IXMLDeclaration;
begin
  Result := NewXMLDocument.GetDocBinding('Declaration', TXMLDeclaration, TargetNamespace) as IXMLDeclaration;
end;

{ TXMLDeclaration }

procedure TXMLDeclaration.AfterConstruction;
begin
  RegisterChildNode('DeclarationNFe', TXMLDeclaration_DeclarationNFe);
  inherited;
end;

function TXMLDeclaration.Get_DeclarationNFe: IXMLDeclaration_DeclarationNFe;
begin
  Result := ChildNodes['DeclarationNFe'] as IXMLDeclaration_DeclarationNFe;
end;

{ TXMLDeclaration_DeclarationNFe }

procedure TXMLDeclaration_DeclarationNFe.AfterConstruction;
begin
  RegisterChildNode('DeclarationOffice', TXMLDeclaration_DeclarationNFe_DeclarationOffice);
  RegisterChildNode('AdditionalInformation', TXMLDeclaration_DeclarationNFe_AdditionalInformation);
  RegisterChildNode('CurrencyExchange', TXMLDeclaration_DeclarationNFe_CurrencyExchange);
  RegisterChildNode('Declarant', TXMLDeclaration_DeclarationNFe_Declarant);
  RegisterChildNode('ExitOffice', TXMLDeclaration_DeclarationNFe_ExitOffice);
  RegisterChildNode('GoodsShipment', TXMLDeclaration_DeclarationNFe_GoodsShipment);
  RegisterChildNode('UCR', TXMLDeclaration_DeclarationNFe_UCR);
  FAdditionalInformation := CreateCollection(TXMLDeclaration_DeclarationNFe_AdditionalInformationList, IXMLDeclaration_DeclarationNFe_AdditionalInformation, 'AdditionalInformation') as IXMLDeclaration_DeclarationNFe_AdditionalInformationList;
  FGoodsShipment := CreateCollection(TXMLDeclaration_DeclarationNFe_GoodsShipmentList, IXMLDeclaration_DeclarationNFe_GoodsShipment, 'GoodsShipment') as IXMLDeclaration_DeclarationNFe_GoodsShipmentList;
  inherited;
end;

function TXMLDeclaration_DeclarationNFe.Get_ID: UnicodeString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe.Set_ID(Value: UnicodeString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe.Get_DeclarationOffice: IXMLDeclaration_DeclarationNFe_DeclarationOffice;
begin
  Result := ChildNodes['DeclarationOffice'] as IXMLDeclaration_DeclarationNFe_DeclarationOffice;
end;

function TXMLDeclaration_DeclarationNFe.Get_AdditionalInformation: IXMLDeclaration_DeclarationNFe_AdditionalInformationList;
begin
  Result := FAdditionalInformation;
end;

function TXMLDeclaration_DeclarationNFe.Get_CurrencyExchange: IXMLDeclaration_DeclarationNFe_CurrencyExchange;
begin
  Result := ChildNodes['CurrencyExchange'] as IXMLDeclaration_DeclarationNFe_CurrencyExchange;
end;

function TXMLDeclaration_DeclarationNFe.Get_Declarant: IXMLDeclaration_DeclarationNFe_Declarant;
begin
  Result := ChildNodes['Declarant'] as IXMLDeclaration_DeclarationNFe_Declarant;
end;

function TXMLDeclaration_DeclarationNFe.Get_ExitOffice: IXMLDeclaration_DeclarationNFe_ExitOffice;
begin
  Result := ChildNodes['ExitOffice'] as IXMLDeclaration_DeclarationNFe_ExitOffice;
end;

function TXMLDeclaration_DeclarationNFe.Get_GoodsShipment: IXMLDeclaration_DeclarationNFe_GoodsShipmentList;
begin
  Result := FGoodsShipment;
end;

function TXMLDeclaration_DeclarationNFe.Get_UCR: IXMLDeclaration_DeclarationNFe_UCR;
begin
  Result := ChildNodes['UCR'] as IXMLDeclaration_DeclarationNFe_UCR;
end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice }

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID);
  RegisterChildNode('Warehouse', TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice.Get_ID: IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID;
begin
  Result := ChildNodes['ID'] as IXMLDeclaration_DeclarationNFe_DeclarationOffice_ID;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice.Get_Warehouse: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse;
begin
  Result := ChildNodes['Warehouse'] as IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse;
end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID }

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID.Get_ListID: UnicodeString;
begin
  Result := AttributeNodes['listID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_ID.Set_ListID(Value: UnicodeString);
begin
  SetAttribute('listID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse }

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.AfterConstruction;
begin
  RegisterChildNode('Address', TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Get_ID: UnicodeString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Set_ID(Value: UnicodeString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Get_TypeCode: Integer;
begin
  Result := ChildNodes['TypeCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Set_TypeCode(Value: Integer);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Get_LatitudeMeasure: Double;
begin
  Result := ChildNodes['LatitudeMeasure'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Set_LatitudeMeasure(Value: Double);
begin
  ChildNodes['LatitudeMeasure'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Get_LongitudeMeasure: Double;
begin
  Result := ChildNodes['LongitudeMeasure'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Set_LongitudeMeasure(Value: Double);
begin
  ChildNodes['LongitudeMeasure'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse.Get_Address: IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address;
begin
  Result := ChildNodes['Address'] as IXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address;
end;

{ TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address }

function TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address.Get_Line: UnicodeString;
begin
  Result := ChildNodes['Line'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_DeclarationOffice_Warehouse_Address.Set_Line(Value: UnicodeString);
begin
  ChildNodes['Line'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformation }

procedure TXMLDeclaration_DeclarationNFe_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription);
  FStatementCode := CreateCollection(TXMLShortList, IXMLNode, 'StatementCode') as IXMLShortList;
  FStatementTypeCode := CreateCollection(TXMLString_List, IXMLNode, 'StatementTypeCode') as IXMLString_List;
  FStatementDescription := CreateCollection(TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList, IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription, 'StatementDescription') as IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList;
  FLimitDateTime := CreateCollection(TXMLByteList, IXMLNode, 'LimitDateTime') as IXMLByteList;
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformation.Get_StatementCode: IXMLShortList;
begin
  Result := FStatementCode;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformation.Get_StatementTypeCode: IXMLString_List;
begin
  Result := FStatementTypeCode;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformation.Get_StatementDescription: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList;
begin
  Result := FStatementDescription;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformation.Get_LimitDateTime: IXMLByteList;
begin
  Result := FLimitDateTime;
end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformationList }

function TXMLDeclaration_DeclarationNFe_AdditionalInformationList.Add: IXMLDeclaration_DeclarationNFe_AdditionalInformation;
begin
  Result := AddItem(-1) as IXMLDeclaration_DeclarationNFe_AdditionalInformation;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformationList.Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation;
begin
  Result := AddItem(Index) as IXMLDeclaration_DeclarationNFe_AdditionalInformation;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformationList.Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation;
begin
  Result := List[Index] as IXMLDeclaration_DeclarationNFe_AdditionalInformation;
end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription }

function TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList }

function TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList.Add: IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
begin
  Result := AddItem(-1) as IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList.Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
begin
  Result := AddItem(Index) as IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
end;

function TXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescriptionList.Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
begin
  Result := List[Index] as IXMLDeclaration_DeclarationNFe_AdditionalInformation_StatementDescription;
end;

{ TXMLDeclaration_DeclarationNFe_CurrencyExchange }

function TXMLDeclaration_DeclarationNFe_CurrencyExchange.Get_CurrencyTypeCode: UnicodeString;
begin
  Result := ChildNodes['CurrencyTypeCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_CurrencyExchange.Set_CurrencyTypeCode(Value: UnicodeString);
begin
  ChildNodes['CurrencyTypeCode'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_Declarant }

procedure TXMLDeclaration_DeclarationNFe_Declarant.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclaration_DeclarationNFe_Declarant_ID);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_Declarant.Get_ID: IXMLDeclaration_DeclarationNFe_Declarant_ID;
begin
  Result := ChildNodes['ID'] as IXMLDeclaration_DeclarationNFe_Declarant_ID;
end;

{ TXMLDeclaration_DeclarationNFe_Declarant_ID }

function TXMLDeclaration_DeclarationNFe_Declarant_ID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_Declarant_ID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_ExitOffice }

procedure TXMLDeclaration_DeclarationNFe_ExitOffice.AfterConstruction;
begin
  RegisterChildNode('Warehouse', TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_ExitOffice.Get_ID: UnicodeString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_ExitOffice.Set_ID(Value: UnicodeString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_ExitOffice.Get_Warehouse: IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse;
begin
  Result := ChildNodes['Warehouse'] as IXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse;
end;

{ TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse }

function TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse.Get_ID: UnicodeString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse.Set_ID(Value: UnicodeString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse.Get_TypeCode: SmallInt;
begin
  Result := ChildNodes['TypeCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_ExitOffice_Warehouse.Set_TypeCode(Value: SmallInt);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment.AfterConstruction;
begin
  RegisterChildNode('GovernmentAgencyGoodsItem', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem);
  RegisterChildNode('Invoice', TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice);
  RegisterChildNode('TradeTerms', TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms);
  FGovernmentAgencyGoodsItem := CreateCollection(TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList, IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem, 'GovernmentAgencyGoodsItem') as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment.Get_GovernmentAgencyGoodsItem: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
begin
  Result := FGovernmentAgencyGoodsItem;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment.Get_Invoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice;
begin
  Result := ChildNodes['Invoice'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment.Get_TradeTerms: IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms;
begin
  Result := ChildNodes['TradeTerms'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipmentList }

function TXMLDeclaration_DeclarationNFe_GoodsShipmentList.Add: IXMLDeclaration_DeclarationNFe_GoodsShipment;
begin
  Result := AddItem(-1) as IXMLDeclaration_DeclarationNFe_GoodsShipment;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipmentList.Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment;
begin
  Result := AddItem(Index) as IXMLDeclaration_DeclarationNFe_GoodsShipment;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipmentList.Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment;
begin
  Result := List[Index] as IXMLDeclaration_DeclarationNFe_GoodsShipment;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.AfterConstruction;
begin
  RegisterChildNode('CustomsValueAmount', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount);
  RegisterChildNode('Destination', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination);
  RegisterChildNode('AdditionalInformation', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation);
  RegisterChildNode('Commodity', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity);
  RegisterChildNode('GoodsMeasure', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure);
  RegisterChildNode('GovernmentProcedure', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure);
  RegisterChildNode('PreviousDocument', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument);
  RegisterChildNode('ValuationAdjustment', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment);
  RegisterChildNode('AdditionalDocument', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_CustomsValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount;
begin
  Result := ChildNodes['CustomsValueAmount'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_SequenceNumeric: Integer;
begin
  Result := ChildNodes['SequenceNumeric'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Set_SequenceNumeric(Value: Integer);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_Destination: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := ChildNodes['Destination'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalInformation: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := ChildNodes['AdditionalInformation'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_Commodity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
begin
  Result := ChildNodes['Commodity'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_GovernmentProcedure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := ChildNodes['GovernmentProcedure'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_PreviousDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := ChildNodes['PreviousDocument'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_ValuationAdjustment: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
begin
  Result := ChildNodes['ValuationAdjustment'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalDocument: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := ChildNodes['AdditionalDocument'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList.Add: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(-1) as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList.Insert(const Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(Index) as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList.Get_Item(Index: Integer): IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := List[Index] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_CustomsValueAmount.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.AfterConstruction;
begin
  RegisterChildNode('GoodsMeasure', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Get_CountryCode: UnicodeString;
begin
  Result := ChildNodes['CountryCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Set_CountryCode(Value: UnicodeString);
begin
  ChildNodes['CountryCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure.Get_TariffQuantity: Double;
begin
  Result := ChildNodes['TariffQuantity'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure.Set_TariffQuantity(Value: Double);
begin
  ChildNodes['TariffQuantity'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementCode: SmallInt;
begin
  Result := ChildNodes['StatementCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_StatementCode(Value: SmallInt);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementDescription: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription;
begin
  Result := ChildNodes['StatementDescription'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_LimitDateTime: Integer;
begin
  Result := ChildNodes['LimitDateTime'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_LimitDateTime(Value: Integer);
begin
  ChildNodes['LimitDateTime'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation_StatementDescription.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.AfterConstruction;
begin
  RegisterChildNode('ValueAmount', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount);
  RegisterChildNode('InvoiceLine', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine);
  RegisterChildNode('ProductCharacteristics', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_Description: UnicodeString;
begin
  Result := ChildNodes['Description'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Set_Description(Value: UnicodeString);
begin
  ChildNodes['Description'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ValueAmount: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount;
begin
  Result := ChildNodes['ValueAmount'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_InvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
begin
  Result := ChildNodes['InvoiceLine'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ProductCharacteristics: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := ChildNodes['ProductCharacteristics'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ValueAmount.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.AfterConstruction;
begin
  RegisterChildNode('ReferencedInvoiceLine', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.Get_SequenceNumeric: Integer;
begin
  Result := ChildNodes['SequenceNumeric'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.Set_SequenceNumeric(Value: Integer);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.Get_ReferencedInvoiceLine: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
begin
  Result := ChildNodes['ReferencedInvoiceLine'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.AfterConstruction;
begin
  RegisterChildNode('InvoiceIdentificationID', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID);
  RegisterChildNode('GoodsMeasure', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Get_SequenceNumeric: Integer;
begin
  Result := ChildNodes['SequenceNumeric'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Set_SequenceNumeric(Value: Integer);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Get_InvoiceIdentificationID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID;
begin
  Result := ChildNodes['InvoiceIdentificationID'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Get_GoodsMeasure: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_InvoiceIdentificationID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('TariffQuantity', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure.Get_TariffQuantity: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity;
begin
  Result := ChildNodes['TariffQuantity'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure_TariffQuantity.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Get_Description: UnicodeString;
begin
  Result := ChildNodes['Description'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Set_Description(Value: UnicodeString);
begin
  ChildNodes['Description'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure.Get_NetNetWeightMeasure: Double;
begin
  Result := ChildNodes['NetNetWeightMeasure'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure.Set_NetNetWeightMeasure(Value: Double);
begin
  ChildNodes['NetNetWeightMeasure'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.Get_CurrentCode: Integer;
begin
  Result := ChildNodes['CurrentCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.Set_CurrentCode(Value: Integer);
begin
  ChildNodes['CurrentCode'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID;
begin
  Result := ChildNodes['ID'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Get_TypeCode: SmallInt;
begin
  Result := ChildNodes['TypeCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Set_TypeCode(Value: SmallInt);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument_ID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Get_AdditionCode: SmallInt;
begin
  Result := ChildNodes['AdditionCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Set_AdditionCode(Value: SmallInt);
begin
  ChildNodes['AdditionCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Get_PercentageNumeric: Double;
begin
  Result := ChildNodes['PercentageNumeric'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Set_PercentageNumeric(Value: Double);
begin
  ChildNodes['PercentageNumeric'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_CategoryCode: UnicodeString;
begin
  Result := ChildNodes['CategoryCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Set_CategoryCode(Value: UnicodeString);
begin
  ChildNodes['CategoryCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ID: UnicodeString;
begin
  Result := ChildNodes['ID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Set_ID(Value: UnicodeString);
begin
  ChildNodes['ID'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID);
  RegisterChildNode('ReferencedInvoice', TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice.Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID;
begin
  Result := ChildNodes['ID'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice.Get_TypeCode: SmallInt;
begin
  Result := ChildNodes['TypeCode'].NodeValue;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice.Set_TypeCode(Value: SmallInt);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice.Get_ReferencedInvoice: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
begin
  Result := ChildNodes['ReferencedInvoice'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID);
  RegisterChildNode('Submitter', TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID;
begin
  Result := ChildNodes['ID'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Get_Submitter: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
begin
  Result := ChildNodes['Submitter'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_ID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter.Get_ID: IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID;
begin
  Result := ChildNodes['ID'] as IXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID;
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter_ID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms }

function TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms.Get_ConditionCode: UnicodeString;
begin
  Result := ChildNodes['ConditionCode'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_GoodsShipment_TradeTerms.Set_ConditionCode(Value: UnicodeString);
begin
  ChildNodes['ConditionCode'].NodeValue := Value;
end;

{ TXMLDeclaration_DeclarationNFe_UCR }

procedure TXMLDeclaration_DeclarationNFe_UCR.AfterConstruction;
begin
  RegisterChildNode('TraderAssignedReferenceID', TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID);
  inherited;
end;

function TXMLDeclaration_DeclarationNFe_UCR.Get_TraderAssignedReferenceID: IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID;
begin
  Result := ChildNodes['TraderAssignedReferenceID'] as IXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID;
end;

{ TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID }

function TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclaration_DeclarationNFe_UCR_TraderAssignedReferenceID.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLByteList }

function TXMLByteList.Add(const Value: Integer): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLByteList.Insert(const Index: Integer; const Value: Integer): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLByteList.Get_Item(Index: Integer): Integer;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLShortList }

function TXMLShortList.Add(const Value: SmallInt): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLShortList.Insert(const Index: Integer; const Value: SmallInt): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLShortList.Get_Item(Index: Integer): SmallInt;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLString_List }

function TXMLString_List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLString_List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLString_List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

end.