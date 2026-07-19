
{*****************************************************************************}
{                                                                             }
{                              XML Data Binding                               }
{                                                                             }
{         Generated on: 13/09/2018 19:41:29                                   }
{       Generated from: C:\Projetos\Delphi\minibroker\doc\docDue\xsdDue.xsd   }
{   Settings stored in: C:\Projetos\Delphi\minibroker\doc\docDue\xsdDue.xdb   }
{                                                                             }
{*****************************************************************************}

unit xsdDue;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDeclaration = interface;
  IXMLDeclarationNFe = interface;
  IXMLDeclarationIdentificationIDType_ds = interface;
  IXMLDeclarationNFe_DeclarationOffice = interface;
  IXMLDeclarationOfficeIdentificationCodeType_ds = interface;
  IXMLDeclarationNFe_DeclarationOffice_Warehouse = interface;
  IXMLWarehouseIdentificationIDType_ds = interface;
  IXMLWarehouseLatitudeMeasureType_ds = interface;
  IXMLWarehouseLongitudeMeasureType_ds = interface;
  IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address = interface;
  IXMLAddressLineTextType_ds = interface;
  IXMLDeclarationNFe_AdditionalInformation = interface;
  IXMLDeclarationNFe_AdditionalInformationList = interface;
  IXMLAdditionalInformationStatementDescriptionTextType_ds = interface;
  IXMLDeclarationNFe_CurrencyExchange = interface;
  IXMLDeclarationNFe_Declarant = interface;
  IXMLDeclarantIdentificationIDType_ds = interface;
  IXMLDeclarationNFe_Declarant_Contact = interface;
  IXMLContactNameTextType_ds = interface;
  IXMLDeclarationNFe_Declarant_Contact_Communication = interface;
  IXMLDeclarationNFe_Declarant_Contact_CommunicationList = interface;
  IXMLCommunicationIdentificationIDType_ds = interface;
  IXMLDeclarationNFe_ExitOffice = interface;
  IXMLExitOfficeIdentificationCodeType_ds = interface;
  IXMLDeclarationNFe_ExitOffice_Warehouse = interface;
  IXMLDeclarationNFe_GoodsShipment = interface;
  IXMLDeclarationNFe_GoodsShipmentList = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = interface;
  IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds = interface;
  IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = interface;
  IXMLGoodsMeasureTariffQuantityType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = interface;
  IXMLAdditionalDocumentIdentificationIDType_ds = interface;
  IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds = interface;
  IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds = interface;
  IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds = interface;
  IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds = interface;
  IXMLAdditionalDocumentItemIDType_ds = interface;
  IXMLAdditionalDocumentQuantityQuantityType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList = interface;
  IXMLPreviousDocumentAmountAmountType_ds = interface;
  IXMLPreviousDocumentIdentificationIDType_ds = interface;
  IXMLPreviousDocumentQuantityQuantityType_ds = interface;
  IXMLPreviousDocumentItemIDType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = interface;
  IXMLInvoiceIdentificationIDType_ds = interface;
  IXMLInvoiceIssueDateTimeType_ds = interface;
  IXMLInvoiceCustomsValueAmountType_ds = interface;
  IXMLInvoiceQuantityQuantityType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = interface;
  IXMLAdditionalInformationLimitDateTimeType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = interface;
  IXMLCommodityDescriptionTextType_ds = interface;
  IXMLCommodityValueAmountType_ds = interface;
  IXMLCommodityInvoiceBRLvalueAmountType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList = interface;
  IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = interface;
  IXMLProductCharacteristicsTypeCodeType_ds = interface;
  IXMLProductCharacteristicsDescriptionTextType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = interface;
  IXMLProductCriteriaConformanceQuantityQuantityType_ds = interface;
  IXMLProductCriteriaConformanceDescriptionTextType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = interface;
  IXMLGoodsMeasureNetNetWeightMeasureType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = interface;
  IXMLGovernmentProcedureCurrentCodeType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = interface;
  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = interface;
  IXMLDeclarationNFe_GoodsShipment_Invoice = interface;
  IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter = interface;
  IXMLSubmitterIdentificationIDType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = interface;
  IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList = interface;
  IXMLReferencedInvoiceIdentificationIDType_ds = interface;
  IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = interface;
  IXMLDeclarationNFe_GoodsShipment_TradeTerms = interface;
  IXMLDeclarationNFe_UCR = interface;
  IXMLUCRTraderAssignedReferenceIDType_ds = interface;
  IXMLDeclarationNoNF = interface;
  IXMLDeclarationNoNF_DeclarationOffice = interface;
  IXMLDeclarationNoNF_DeclarationOffice_Warehouse = interface;
  IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address = interface;
  IXMLDeclarationNoNF_AdditionalInformation = interface;
  IXMLDeclarationNoNF_AdditionalInformationList = interface;
  IXMLDeclarationNoNF_CurrencyExchange = interface;
  IXMLDeclarationNoNF_Declarant = interface;
  IXMLDeclarationNoNF_Declarant_Contact = interface;
  IXMLDeclarationNoNF_Declarant_Contact_Communication = interface;
  IXMLDeclarationNoNF_Declarant_Contact_CommunicationList = interface;
  IXMLDeclarationNoNF_ExitOffice = interface;
  IXMLDeclarationNoNF_ExitOffice_Warehouse = interface;
  IXMLDeclarationNoNF_GoodsShipment = interface;
  IXMLDeclarationNoNF_GoodsShipmentList = interface;
  IXMLDeclarationNoNF_GoodsShipment_Exporter = interface;
  IXMLExporterNameTextType_ds = interface;
  IXMLExporterIdentificationIDType_ds = interface;
  IXMLDeclarationNoNF_GoodsShipment_Exporter_Address = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = interface;
  IXMLCommodityCommercialDescriptionTextType_ds = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification = interface;
  IXMLClassificationIdentificationIDType_ds = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = interface;
  IXMLGoodsMeasureUnitDescriptionTextType_ds = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product = interface;
  IXMLProductIdentificationIDType_ds = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = interface;
  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = interface;
  IXMLDeclarationNoNF_GoodsShipment_Importer = interface;
  IXMLImporterNameTextType_ds = interface;
  IXMLDeclarationNoNF_GoodsShipment_Importer_Address = interface;
  IXMLDeclarationNoNF_GoodsShipment_Invoice = interface;
  IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation = interface;
  IXMLDeclarationNoNF_GoodsShipment_TradeTerms = interface;
  IXMLDeclarationNoNF_UCR = interface;
  IXMLDeclarationDrawbackIsencao = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface;
  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = interface;

{ IXMLDeclaration }

  IXMLDeclaration = interface(IXMLNode)
    ['{B176CB86-7D4C-4510-89DE-D6CF2B4F4DA8}']
    { Property Accessors }
    function Get_DeclarationNFe: IXMLDeclarationNFe;
    function Get_DeclarationNoNF: IXMLDeclarationNoNF;
    function Get_DeclarationDrawbackIsencao: IXMLDeclarationDrawbackIsencao;
    { Methods & Properties }
    property DeclarationNFe: IXMLDeclarationNFe read Get_DeclarationNFe;
    property DeclarationNoNF: IXMLDeclarationNoNF read Get_DeclarationNoNF;
    property DeclarationDrawbackIsencao: IXMLDeclarationDrawbackIsencao read Get_DeclarationDrawbackIsencao;
  end;

{ IXMLDeclarationNFe }

  IXMLDeclarationNFe = interface(IXMLNode)
    ['{513DD97A-A45A-4CE4-BABD-6BFA6A48731C}']
    { Property Accessors }
    function Get_ID: IXMLDeclarationIdentificationIDType_ds;
    function Get_DeclarationOffice: IXMLDeclarationNFe_DeclarationOffice;
    function Get_AdditionalInformation: IXMLDeclarationNFe_AdditionalInformationList;
    function Get_CurrencyExchange: IXMLDeclarationNFe_CurrencyExchange;
    function Get_Declarant: IXMLDeclarationNFe_Declarant;
    function Get_ExitOffice: IXMLDeclarationNFe_ExitOffice;
    function Get_GoodsShipment: IXMLDeclarationNFe_GoodsShipmentList;
    function Get_UCR: IXMLDeclarationNFe_UCR;
    { Methods & Properties }
    property ID: IXMLDeclarationIdentificationIDType_ds read Get_ID;
    property DeclarationOffice: IXMLDeclarationNFe_DeclarationOffice read Get_DeclarationOffice;
    property AdditionalInformation: IXMLDeclarationNFe_AdditionalInformationList read Get_AdditionalInformation;
    property CurrencyExchange: IXMLDeclarationNFe_CurrencyExchange read Get_CurrencyExchange;
    property Declarant: IXMLDeclarationNFe_Declarant read Get_Declarant;
    property ExitOffice: IXMLDeclarationNFe_ExitOffice read Get_ExitOffice;
    property GoodsShipment: IXMLDeclarationNFe_GoodsShipmentList read Get_GoodsShipment;
    property UCR: IXMLDeclarationNFe_UCR read Get_UCR;
  end;

{ IXMLDeclarationIdentificationIDType_ds }

  IXMLDeclarationIdentificationIDType_ds = interface(IXMLNode)
    ['{0559C39C-C78D-4AE2-8A0A-918F07D3ECC0}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_DeclarationOffice }

  IXMLDeclarationNFe_DeclarationOffice = interface(IXMLNode)
    ['{0D6BF70D-3A0A-4A70-8E44-883B4497D9A0}']
    { Property Accessors }
    function Get_ID: IXMLDeclarationOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNFe_DeclarationOffice_Warehouse;
    { Methods & Properties }
    property ID: IXMLDeclarationOfficeIdentificationCodeType_ds read Get_ID;
    property Warehouse: IXMLDeclarationNFe_DeclarationOffice_Warehouse read Get_Warehouse;
  end;

{ IXMLDeclarationOfficeIdentificationCodeType_ds }

  IXMLDeclarationOfficeIdentificationCodeType_ds = interface(IXMLNode)
    ['{02279617-D905-4C20-8C67-8D4C2E6595B8}']
    { Property Accessors }
    function Get_ListID: UnicodeString;
    procedure Set_ListID(Value: UnicodeString);
    { Methods & Properties }
    property ListID: UnicodeString read Get_ListID write Set_ListID;
  end;

{ IXMLDeclarationNFe_DeclarationOffice_Warehouse }

  IXMLDeclarationNFe_DeclarationOffice_Warehouse = interface(IXMLNode)
    ['{3C96E550-242F-4833-B82A-07BC317C6BC4}']
    { Property Accessors }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds;
    function Get_LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds;
    function Get_Address: IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLWarehouseIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds read Get_LatitudeMeasure;
    property LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds read Get_LongitudeMeasure;
    property Address: IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address read Get_Address;
  end;

{ IXMLWarehouseIdentificationIDType_ds }

  IXMLWarehouseIdentificationIDType_ds = interface(IXMLNode)
    ['{4492BE37-4606-4A95-BE64-5F3EE5059FAF}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLWarehouseLatitudeMeasureType_ds }

  IXMLWarehouseLatitudeMeasureType_ds = interface(IXMLNode)
    ['{BEEE06E4-2027-44FC-8B08-01BDDC8C0F7E}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLWarehouseLongitudeMeasureType_ds }

  IXMLWarehouseLongitudeMeasureType_ds = interface(IXMLNode)
    ['{F33BE6E4-366F-4270-B057-13587DBBB7CB}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address }

  IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address = interface(IXMLNode)
    ['{F23D4C51-5F81-4EAA-8A05-8DB04D4F8DAE}']
    { Property Accessors }
    function Get_Line: IXMLAddressLineTextType_ds;
    { Methods & Properties }
    property Line: IXMLAddressLineTextType_ds read Get_Line;
  end;

{ IXMLAddressLineTextType_ds }

  IXMLAddressLineTextType_ds = interface(IXMLNode)
    ['{1309586C-66D8-42A9-9DE1-176D1F7D8692}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNFe_AdditionalInformation }

  IXMLDeclarationNFe_AdditionalInformation = interface(IXMLNode)
    ['{D0505448-9A1D-45DB-BB71-921EB304A2DB}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds read Get_StatementDescription;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNFe_AdditionalInformationList }

  IXMLDeclarationNFe_AdditionalInformationList = interface(IXMLNodeCollection)
    ['{5AB0D1A6-A483-4128-8CA1-04A0298E80AD}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNFe_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_AdditionalInformation;
    property Items[Index: Integer]: IXMLDeclarationNFe_AdditionalInformation read Get_Item; default;
  end;

{ IXMLAdditionalInformationStatementDescriptionTextType_ds }

  IXMLAdditionalInformationStatementDescriptionTextType_ds = interface(IXMLNode)
    ['{D8867DDC-54CE-4632-A16A-E459213701BD}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNFe_CurrencyExchange }

  IXMLDeclarationNFe_CurrencyExchange = interface(IXMLNode)
    ['{70BFFE53-BFCC-460C-AEF3-260785BB86A7}']
    { Property Accessors }
    function Get_CurrencyTypeCode: UnicodeString;
    procedure Set_CurrencyTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property CurrencyTypeCode: UnicodeString read Get_CurrencyTypeCode write Set_CurrencyTypeCode;
  end;

{ IXMLDeclarationNFe_Declarant }

  IXMLDeclarationNFe_Declarant = interface(IXMLNode)
    ['{9541653B-A8A4-4DEA-8FB4-2B60D825C769}']
    { Property Accessors }
    function Get_ID: IXMLDeclarantIdentificationIDType_ds;
    function Get_Contact: IXMLDeclarationNFe_Declarant_Contact;
    { Methods & Properties }
    property ID: IXMLDeclarantIdentificationIDType_ds read Get_ID;
    property Contact: IXMLDeclarationNFe_Declarant_Contact read Get_Contact;
  end;

{ IXMLDeclarantIdentificationIDType_ds }

  IXMLDeclarantIdentificationIDType_ds = interface(IXMLNode)
    ['{0BD6DE99-74A8-481E-91D7-0AF5AC171891}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_Declarant_Contact }

  IXMLDeclarationNFe_Declarant_Contact = interface(IXMLNode)
    ['{76775074-2363-4179-AC1B-FE3D8F7C5FD1}']
    { Property Accessors }
    function Get_Name: IXMLContactNameTextType_ds;
    function Get_Communication: IXMLDeclarationNFe_Declarant_Contact_CommunicationList;
    { Methods & Properties }
    property Name: IXMLContactNameTextType_ds read Get_Name;
    property Communication: IXMLDeclarationNFe_Declarant_Contact_CommunicationList read Get_Communication;
  end;

{ IXMLContactNameTextType_ds }

  IXMLContactNameTextType_ds = interface(IXMLNode)
    ['{A944ED8C-0AB5-411A-A32E-E60DA9A03F4F}']
  end;

{ IXMLDeclarationNFe_Declarant_Contact_Communication }

  IXMLDeclarationNFe_Declarant_Contact_Communication = interface(IXMLNode)
    ['{8C73525E-6F85-4C41-ADB5-D60185EB1B72}']
    { Property Accessors }
    function Get_ID: IXMLCommunicationIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLCommunicationIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclarationNFe_Declarant_Contact_CommunicationList }

  IXMLDeclarationNFe_Declarant_Contact_CommunicationList = interface(IXMLNodeCollection)
    ['{5C89E1D1-AD36-4609-9C0E-D4CB52F79006}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_Declarant_Contact_Communication;
    function Insert(const Index: Integer): IXMLDeclarationNFe_Declarant_Contact_Communication;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_Declarant_Contact_Communication;
    property Items[Index: Integer]: IXMLDeclarationNFe_Declarant_Contact_Communication read Get_Item; default;
  end;

{ IXMLCommunicationIdentificationIDType_ds }

  IXMLCommunicationIdentificationIDType_ds = interface(IXMLNode)
    ['{2631A74F-3761-486E-88EB-89C608C52EA3}']
  end;

{ IXMLDeclarationNFe_ExitOffice }

  IXMLDeclarationNFe_ExitOffice = interface(IXMLNode)
    ['{6A6D664A-50B5-475E-992C-87028DABCB60}']
    { Property Accessors }
    function Get_ID: IXMLExitOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNFe_ExitOffice_Warehouse;
    { Methods & Properties }
    property ID: IXMLExitOfficeIdentificationCodeType_ds read Get_ID;
    property Warehouse: IXMLDeclarationNFe_ExitOffice_Warehouse read Get_Warehouse;
  end;

{ IXMLExitOfficeIdentificationCodeType_ds }

  IXMLExitOfficeIdentificationCodeType_ds = interface(IXMLNode)
    ['{B08D0042-BBBC-400C-8C19-1E52ED1FCE3B}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_ExitOffice_Warehouse }

  IXMLDeclarationNFe_ExitOffice_Warehouse = interface(IXMLNode)
    ['{6E9A5412-93AE-4006-B536-0D7560127F93}']
    { Property Accessors }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLWarehouseIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment }

  IXMLDeclarationNFe_GoodsShipment = interface(IXMLNode)
    ['{81128781-DD09-411F-B7E5-6827C3A6C766}']
    { Property Accessors }
    function Get_GovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
    function Get_Invoice: IXMLDeclarationNFe_GoodsShipment_Invoice;
    function Get_TradeTerms: IXMLDeclarationNFe_GoodsShipment_TradeTerms;
    { Methods & Properties }
    property GovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList read Get_GovernmentAgencyGoodsItem;
    property Invoice: IXMLDeclarationNFe_GoodsShipment_Invoice read Get_Invoice;
    property TradeTerms: IXMLDeclarationNFe_GoodsShipment_TradeTerms read Get_TradeTerms;
  end;

{ IXMLDeclarationNFe_GoodsShipmentList }

  IXMLDeclarationNFe_GoodsShipmentList = interface(IXMLNodeCollection)
    ['{29E0620D-2E3F-4EBB-A5F4-EB766E21D647}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment read Get_Item; default;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = interface(IXMLNode)
    ['{77172430-8C04-46C4-8F49-EC0118FC810F}']
    { Property Accessors }
    function Get_CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
    function Get_FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
    function Get_SequenceNumeric: UnicodeString;
    function Get_Destination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
    function Get_AdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    function Get_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
    function Get_Commodity: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
    function Get_GovernmentProcedure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    function Get_PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
    function Get_ValuationAdjustment: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
    procedure Set_SequenceNumeric(Value: UnicodeString);
    { Methods & Properties }
    property CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds read Get_CustomsValueAmount;
    property FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds read Get_FinancedValueAmount;
    property SequenceNumeric: UnicodeString read Get_SequenceNumeric write Set_SequenceNumeric;
    property Destination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList read Get_Destination;
    property AdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList read Get_AdditionalDocument;
    property AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList read Get_AdditionalInformation;
    property Commodity: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity read Get_Commodity;
    property GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure read Get_GoodsMeasure;
    property GovernmentProcedure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList read Get_GovernmentProcedure;
    property PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList read Get_PreviousDocument;
    property ValuationAdjustment: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment read Get_ValuationAdjustment;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = interface(IXMLNodeCollection)
    ['{8B6A7393-2140-4B8E-9397-614867529913}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem read Get_Item; default;
  end;

{ IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds }

  IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds = interface(IXMLNode)
    ['{949E32B1-3808-40E3-A5BF-130DB5A1D990}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds }

  IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds = interface(IXMLNode)
    ['{78B90E2C-0F2C-40A4-BB02-72393C4E7E0B}']
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = interface(IXMLNode)
    ['{6A9D73D5-315D-4867-A83C-AC51628D24B5}']
    { Property Accessors }
    function Get_CountryCode: UnicodeString;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
    procedure Set_CountryCode(Value: UnicodeString);
    { Methods & Properties }
    property CountryCode: UnicodeString read Get_CountryCode write Set_CountryCode;
    property GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure read Get_GoodsMeasure;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = interface(IXMLNodeCollection)
    ['{AC377DAC-B9F6-4105-B829-D902EA2C43F5}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination read Get_Item; default;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = interface(IXMLNode)
    ['{42615BA3-80AB-4614-89D9-5E9B176661F3}']
    { Property Accessors }
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    { Methods & Properties }
    property TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds read Get_TariffQuantity;
  end;

{ IXMLGoodsMeasureTariffQuantityType_ds }

  IXMLGoodsMeasureTariffQuantityType_ds = interface(IXMLNode)
    ['{2946BA55-5009-45F0-8D06-F4BACB3AEFFF}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface(IXMLNode)
    ['{1E11B7C8-04FE-4E9B-9453-09466B03595A}']
    { Property Accessors }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
    function Get_DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
    function Get_DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
    function Get_ValueWithoutExchangeCoverAmount: IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds;
    function Get_ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
    function Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
    function Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
    function Get_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
    function Get_PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList;
    function Get_Invoice: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
    procedure Set_CategoryCode(Value: UnicodeString);
    { Methods & Properties }
    property CategoryCode: UnicodeString read Get_CategoryCode write Set_CategoryCode;
    property ID: IXMLAdditionalDocumentIdentificationIDType_ds read Get_ID;
    property DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds read Get_DrawbackHsClassification;
    property DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds read Get_DrawbackRecipientId;
    property ValueWithoutExchangeCoverAmount: IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds read Get_ValueWithoutExchangeCoverAmount;
    property ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds read Get_ValueWithExchangeCoverAmount;
    property ItemID: IXMLAdditionalDocumentItemIDType_ds read Get_ItemID;
    property QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds read Get_QuantityQuantity;
    property AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation read Get_AdditionalInformation;
    property PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList read Get_PreviousDocument;
    property Invoice: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList read Get_Invoice;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = interface(IXMLNodeCollection)
    ['{F7E4EDD6-26DF-424C-ADC1-FAE5C9CA84C3}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument read Get_Item; default;
  end;

{ IXMLAdditionalDocumentIdentificationIDType_ds }

  IXMLAdditionalDocumentIdentificationIDType_ds = interface(IXMLNode)
    ['{BBC99AEE-BBEC-4370-AFE3-58FC972CDF28}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds }

  IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds = interface(IXMLNode)
    ['{A6B3BE8E-5237-43EB-A80A-502D903DB45E}']
  end;

{ IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds }

  IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds = interface(IXMLNode)
    ['{76B6F4B3-F00F-43D5-913B-B46F7C19E923}']
  end;

{ IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds }

  IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds = interface(IXMLNode)
    ['{FE02FA76-A7CC-4990-BE0C-EBC35718BE3A}']
  end;

{ IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds }

  IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds = interface(IXMLNode)
    ['{C37DE982-7DC5-4B96-AC4F-10D95043AD62}']
  end;

{ IXMLAdditionalDocumentItemIDType_ds }

  IXMLAdditionalDocumentItemIDType_ds = interface(IXMLNode)
    ['{21D44B04-DFE5-4D8F-A62A-C82450E93DC6}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLAdditionalDocumentQuantityQuantityType_ds }

  IXMLAdditionalDocumentQuantityQuantityType_ds = interface(IXMLNode)
    ['{C290BE26-82D0-4249-B035-BEDA77C3B880}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = interface(IXMLNode)
    ['{509913C4-3DE6-430B-86B3-0FAB7C974A7F}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds read Get_StatementDescription;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument = interface(IXMLNode)
    ['{3CB5C4FD-E53B-45E4-BE92-45DF60A77E4A}']
    { Property Accessors }
    function Get_AmountAmount: IXMLPreviousDocumentAmountAmountType_ds;
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
    function Get_QuantityQuantity: IXMLPreviousDocumentQuantityQuantityType_ds;
    function Get_ItemID: IXMLPreviousDocumentItemIDType_ds;
    procedure Set_CategoryCode(Value: UnicodeString);
    { Methods & Properties }
    property AmountAmount: IXMLPreviousDocumentAmountAmountType_ds read Get_AmountAmount;
    property CategoryCode: UnicodeString read Get_CategoryCode write Set_CategoryCode;
    property ID: IXMLPreviousDocumentIdentificationIDType_ds read Get_ID;
    property QuantityQuantity: IXMLPreviousDocumentQuantityQuantityType_ds read Get_QuantityQuantity;
    property ItemID: IXMLPreviousDocumentItemIDType_ds read Get_ItemID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList = interface(IXMLNodeCollection)
    ['{1EDFA65F-6A4A-4902-8F68-D2F4A3E3B7FB}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument read Get_Item; default;
  end;

{ IXMLPreviousDocumentAmountAmountType_ds }

  IXMLPreviousDocumentAmountAmountType_ds = interface(IXMLNode)
    ['{A53181F1-7805-41EA-B079-2BCEEE515D1E}']
  end;

{ IXMLPreviousDocumentIdentificationIDType_ds }

  IXMLPreviousDocumentIdentificationIDType_ds = interface(IXMLNode)
    ['{940F4D3B-9A08-4AAE-A89B-779AA3788C53}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLPreviousDocumentQuantityQuantityType_ds }

  IXMLPreviousDocumentQuantityQuantityType_ds = interface(IXMLNode)
    ['{0EC735D1-BBFF-4282-A102-634D36E5ACC8}']
  end;

{ IXMLPreviousDocumentItemIDType_ds }

  IXMLPreviousDocumentItemIDType_ds = interface(IXMLNode)
    ['{45523552-D65F-491D-AE1A-11797509E4A2}']
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = interface(IXMLNode)
    ['{23580E34-BCAA-4CF8-8280-EC5BEEDEFDE4}']
    { Property Accessors }
    function Get_ID: IXMLInvoiceIdentificationIDType_ds;
    function Get_IssueDateTime: IXMLInvoiceIssueDateTimeType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds;
    function Get_QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLInvoiceIdentificationIDType_ds read Get_ID;
    property IssueDateTime: IXMLInvoiceIssueDateTimeType_ds read Get_IssueDateTime;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds read Get_CustomsValueAmount;
    property QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds read Get_QuantityQuantity;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = interface(IXMLNodeCollection)
    ['{793982DD-EB7A-4101-BC60-10412DEE2F93}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice read Get_Item; default;
  end;

{ IXMLInvoiceIdentificationIDType_ds }

  IXMLInvoiceIdentificationIDType_ds = interface(IXMLNode)
    ['{F3B8A9BE-DB52-4717-B402-F189FC4D0CA4}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLInvoiceIssueDateTimeType_ds }

  IXMLInvoiceIssueDateTimeType_ds = interface(IXMLNode)
    ['{827D3BC4-9C7D-4AC6-89FD-C32763654CCB}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLInvoiceCustomsValueAmountType_ds }

  IXMLInvoiceCustomsValueAmountType_ds = interface(IXMLNode)
    ['{978A6360-A59E-4891-B48D-830220B5BDC1}']
  end;

{ IXMLInvoiceQuantityQuantityType_ds }

  IXMLInvoiceQuantityQuantityType_ds = interface(IXMLNode)
    ['{39B10FB8-5686-4DCD-AFE6-A1BE11383630}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = interface(IXMLNode)
    ['{5B5EB90D-43B5-473E-BA8F-4E4B91F5C741}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds read Get_StatementDescription;
    property LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds read Get_LimitDateTime;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = interface(IXMLNodeCollection)
    ['{273C897A-FE75-4C26-A2AC-C81BDE62E034}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation read Get_Item; default;
  end;

{ IXMLAdditionalInformationLimitDateTimeType_ds }

  IXMLAdditionalInformationLimitDateTimeType_ds = interface(IXMLNode)
    ['{431C4928-5ED6-44AB-9536-41457686FAE9}']
    { Property Accessors }
    function Get_Lang: UnicodeString;
    procedure Set_Lang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read Get_Lang write Set_Lang;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = interface(IXMLNode)
    ['{4B47BB08-3343-474E-AB2B-54779D2B5D85}']
    { Property Accessors }
    function Get_Description: IXMLCommodityDescriptionTextType_ds;
    function Get_ValueAmount: IXMLCommodityValueAmountType_ds;
    function Get_InvoiceBRLvalueAmount: IXMLCommodityInvoiceBRLvalueAmountType_ds;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
    function Get_InvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
    function Get_ProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
    function Get_ProductCriteriaConformance: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
    { Methods & Properties }
    property Description: IXMLCommodityDescriptionTextType_ds read Get_Description;
    property ValueAmount: IXMLCommodityValueAmountType_ds read Get_ValueAmount;
    property InvoiceBRLvalueAmount: IXMLCommodityInvoiceBRLvalueAmountType_ds read Get_InvoiceBRLvalueAmount;
    property GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList read Get_GoodsMeasure;
    property InvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine read Get_InvoiceLine;
    property ProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList read Get_ProductCharacteristics;
    property ProductCriteriaConformance: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList read Get_ProductCriteriaConformance;
  end;

{ IXMLCommodityDescriptionTextType_ds }

  IXMLCommodityDescriptionTextType_ds = interface(IXMLNode)
    ['{A21F158C-7162-4D78-AFEE-1356C03F3764}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLCommodityValueAmountType_ds }

  IXMLCommodityValueAmountType_ds = interface(IXMLNode)
    ['{45BC80A6-A891-46C8-A005-B44EE9DE014B}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLCommodityInvoiceBRLvalueAmountType_ds }

  IXMLCommodityInvoiceBRLvalueAmountType_ds = interface(IXMLNode)
    ['{0E73CE65-73AC-4580-9F0D-D0E71AA28D29}']
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = interface(IXMLNode)
    ['{98260350-775B-44DD-8C83-49840E652750}']
    { Property Accessors }
    function Get_TypeCode: UnicodeString;
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds read Get_TariffQuantity;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = interface(IXMLNodeCollection)
    ['{F37661B0-D40D-4E58-9F60-161768B6DE70}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure read Get_Item; default;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = interface(IXMLNode)
    ['{622A2DD0-C732-469E-B1D7-C9ACACC1A514}']
    { Property Accessors }
    function Get_SequenceNumeric: UnicodeString;
    function Get_ReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList;
    procedure Set_SequenceNumeric(Value: UnicodeString);
    { Methods & Properties }
    property SequenceNumeric: UnicodeString read Get_SequenceNumeric write Set_SequenceNumeric;
    property ReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList read Get_ReferencedInvoiceLine;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = interface(IXMLNode)
    ['{610E8737-466B-42CB-9CB8-7753C94BD68B}']
    { Property Accessors }
    function Get_SequenceNumeric: UnicodeString;
    function Get_InvoiceIdentificationID: IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
    procedure Set_SequenceNumeric(Value: UnicodeString);
    { Methods & Properties }
    property SequenceNumeric: UnicodeString read Get_SequenceNumeric write Set_SequenceNumeric;
    property InvoiceIdentificationID: IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds read Get_InvoiceIdentificationID;
    property GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure read Get_GoodsMeasure;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList = interface(IXMLNodeCollection)
    ['{5A7FD2AF-8A49-4F45-BF5D-CA9A22C474D1}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine read Get_Item; default;
  end;

{ IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds }

  IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds = interface(IXMLNode)
    ['{8CF4435E-C95A-4C13-89ED-D2DA7ADC5D6A}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = interface(IXMLNode)
    ['{03F1C727-1519-4F79-88F7-4FCABB6CCFEE}']
    { Property Accessors }
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    { Methods & Properties }
    property TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds read Get_TariffQuantity;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = interface(IXMLNode)
    ['{1F1566E6-3D55-46D2-9469-BF4E3EAE1B3A}']
    { Property Accessors }
    function Get_TypeCode: IXMLProductCharacteristicsTypeCodeType_ds;
    function Get_Description: IXMLProductCharacteristicsDescriptionTextType_ds;
    { Methods & Properties }
    property TypeCode: IXMLProductCharacteristicsTypeCodeType_ds read Get_TypeCode;
    property Description: IXMLProductCharacteristicsDescriptionTextType_ds read Get_Description;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = interface(IXMLNodeCollection)
    ['{1E9EC6A1-9955-4E41-B6D7-0E7C6A067342}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics read Get_Item; default;
  end;

{ IXMLProductCharacteristicsTypeCodeType_ds }

  IXMLProductCharacteristicsTypeCodeType_ds = interface(IXMLNode)
    ['{9C3750A7-B840-4014-9DE1-1781B550880E}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLProductCharacteristicsDescriptionTextType_ds }

  IXMLProductCharacteristicsDescriptionTextType_ds = interface(IXMLNode)
    ['{C9995DD9-90C5-4048-BD04-C8E836FC650D}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = interface(IXMLNode)
    ['{D7ABFF6D-17CA-4235-9346-AB2FED27CAF9}']
    { Property Accessors }
    function Get_QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Description: IXMLProductCriteriaConformanceDescriptionTextType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds read Get_QuantityQuantity;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property Description: IXMLProductCriteriaConformanceDescriptionTextType_ds read Get_Description;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = interface(IXMLNodeCollection)
    ['{51E30DE6-87E7-4BD2-BC5D-E7DCBD7C0C16}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance read Get_Item; default;
  end;

{ IXMLProductCriteriaConformanceQuantityQuantityType_ds }

  IXMLProductCriteriaConformanceQuantityQuantityType_ds = interface(IXMLNode)
    ['{568FE0BA-AF82-4232-A62A-6D38708AE9A5}']
  end;

{ IXMLProductCriteriaConformanceDescriptionTextType_ds }

  IXMLProductCriteriaConformanceDescriptionTextType_ds = interface(IXMLNode)
    ['{DB5C33A9-43B1-4831-BFB1-5343E754152E}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = interface(IXMLNode)
    ['{B8EA0913-CCEF-4E7B-A03A-733EE96CC625}']
    { Property Accessors }
    function Get_NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds;
    { Methods & Properties }
    property NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds read Get_NetNetWeightMeasure;
  end;

{ IXMLGoodsMeasureNetNetWeightMeasureType_ds }

  IXMLGoodsMeasureNetNetWeightMeasureType_ds = interface(IXMLNode)
    ['{5EFA577D-25EC-4C28-AC2F-BA8F2D607DF3}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface(IXMLNode)
    ['{E4B700F9-A677-43C1-A887-BEE4CAD63E2B}']
    { Property Accessors }
    function Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
    { Methods & Properties }
    property CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds read Get_CurrentCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = interface(IXMLNodeCollection)
    ['{BDC4ADFD-CE63-46D8-A598-B70F6C232C61}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure read Get_Item; default;
  end;

{ IXMLGovernmentProcedureCurrentCodeType_ds }

  IXMLGovernmentProcedureCurrentCodeType_ds = interface(IXMLNode)
    ['{66ED7DF3-38D7-46CC-AC15-F68D32F18293}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = interface(IXMLNode)
    ['{5267B526-30CA-4A2F-9917-324707BAEBD1}']
    { Property Accessors }
    function Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLPreviousDocumentIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = interface(IXMLNodeCollection)
    ['{3636AFE3-D437-46AE-8DC0-1F37CD0D6F24}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument read Get_Item; default;
  end;

{ IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

  IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = interface(IXMLNode)
    ['{6E5C4D66-C348-439F-975F-CAF1CD288BDC}']
    { Property Accessors }
    function Get_AdditionCode: UnicodeString;
    function Get_PercentageNumeric: UnicodeString;
    procedure Set_AdditionCode(Value: UnicodeString);
    procedure Set_PercentageNumeric(Value: UnicodeString);
    { Methods & Properties }
    property AdditionCode: UnicodeString read Get_AdditionCode write Set_AdditionCode;
    property PercentageNumeric: UnicodeString read Get_PercentageNumeric write Set_PercentageNumeric;
  end;

{ IXMLDeclarationNFe_GoodsShipment_Invoice }

  IXMLDeclarationNFe_GoodsShipment_Invoice = interface(IXMLNode)
    ['{373BA0CB-CD66-4E21-9DE1-32A4159162C1}']
    { Property Accessors }
    function Get_ID: IXMLInvoiceIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter;
    function Get_ReferencedInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLInvoiceIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter read Get_Submitter;
    property ReferencedInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList read Get_ReferencedInvoice;
  end;

{ IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter }

  IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter = interface(IXMLNode)
    ['{89B54B4D-5C32-44A5-8C36-C35020DAA78F}']
    { Property Accessors }
    function Get_ID: IXMLSubmitterIdentificationIDType_ds;
    { Methods & Properties }
    property ID: IXMLSubmitterIdentificationIDType_ds read Get_ID;
  end;

{ IXMLSubmitterIdentificationIDType_ds }

  IXMLSubmitterIdentificationIDType_ds = interface(IXMLNode)
    ['{E9D109DA-1E67-4026-9C30-82D64CC63629}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }

  IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = interface(IXMLNode)
    ['{16479EEC-482F-44A4-BF58-A54F28647053}']
    { Property Accessors }
    function Get_ID: IXMLReferencedInvoiceIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLReferencedInvoiceIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter read Get_Submitter;
  end;

{ IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList }

  IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList = interface(IXMLNodeCollection)
    ['{F7FA4CC1-D52F-4CE9-9631-318A2188FDBE}']
    { Methods & Properties }
    function Add: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
    property Items[Index: Integer]: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice read Get_Item; default;
  end;

{ IXMLReferencedInvoiceIdentificationIDType_ds }

  IXMLReferencedInvoiceIdentificationIDType_ds = interface(IXMLNode)
    ['{7B3F6913-D875-426E-9D40-AB7F1657A3DB}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }

  IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = interface(IXMLNode)
    ['{FAED599A-E0BD-4B31-8DFD-3404D09F64B6}']
    { Property Accessors }
    function Get_ID: IXMLSubmitterIdentificationIDType_ds;
    { Methods & Properties }
    property ID: IXMLSubmitterIdentificationIDType_ds read Get_ID;
  end;

{ IXMLDeclarationNFe_GoodsShipment_TradeTerms }

  IXMLDeclarationNFe_GoodsShipment_TradeTerms = interface(IXMLNode)
    ['{5F68F3F2-ABD2-4A20-BBED-E7FDCDE80CE2}']
    { Property Accessors }
    function Get_ConditionCode: UnicodeString;
    procedure Set_ConditionCode(Value: UnicodeString);
    { Methods & Properties }
    property ConditionCode: UnicodeString read Get_ConditionCode write Set_ConditionCode;
  end;

{ IXMLDeclarationNFe_UCR }

  IXMLDeclarationNFe_UCR = interface(IXMLNode)
    ['{C6766F54-1BD9-4893-B67E-A863FEA05EF8}']
    { Property Accessors }
    function Get_TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds;
    { Methods & Properties }
    property TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds read Get_TraderAssignedReferenceID;
  end;

{ IXMLUCRTraderAssignedReferenceIDType_ds }

  IXMLUCRTraderAssignedReferenceIDType_ds = interface(IXMLNode)
    ['{142C5E36-B4FE-4910-9A4D-D3D7B7EA2BB7}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNoNF }

  IXMLDeclarationNoNF = interface(IXMLNode)
    ['{965D4885-40AE-464A-8AE2-1D02EB95DCF2}']
    { Property Accessors }
    function Get_ID: IXMLDeclarationIdentificationIDType_ds;
    function Get_DeclarationOffice: IXMLDeclarationNoNF_DeclarationOffice;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_AdditionalInformationList;
    function Get_CurrencyExchange: IXMLDeclarationNoNF_CurrencyExchange;
    function Get_Declarant: IXMLDeclarationNoNF_Declarant;
    function Get_ExitOffice: IXMLDeclarationNoNF_ExitOffice;
    function Get_GoodsShipment: IXMLDeclarationNoNF_GoodsShipmentList;
    function Get_UCR: IXMLDeclarationNoNF_UCR;
    { Methods & Properties }
    property ID: IXMLDeclarationIdentificationIDType_ds read Get_ID;
    property DeclarationOffice: IXMLDeclarationNoNF_DeclarationOffice read Get_DeclarationOffice;
    property AdditionalInformation: IXMLDeclarationNoNF_AdditionalInformationList read Get_AdditionalInformation;
    property CurrencyExchange: IXMLDeclarationNoNF_CurrencyExchange read Get_CurrencyExchange;
    property Declarant: IXMLDeclarationNoNF_Declarant read Get_Declarant;
    property ExitOffice: IXMLDeclarationNoNF_ExitOffice read Get_ExitOffice;
    property GoodsShipment: IXMLDeclarationNoNF_GoodsShipmentList read Get_GoodsShipment;
    property UCR: IXMLDeclarationNoNF_UCR read Get_UCR;
  end;

{ IXMLDeclarationNoNF_DeclarationOffice }

  IXMLDeclarationNoNF_DeclarationOffice = interface(IXMLNode)
    ['{57E5ADA0-0C65-4D1D-91D5-26E0D2A14356}']
    { Property Accessors }
    function Get_ID: IXMLDeclarationOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNoNF_DeclarationOffice_Warehouse;
    { Methods & Properties }
    property ID: IXMLDeclarationOfficeIdentificationCodeType_ds read Get_ID;
    property Warehouse: IXMLDeclarationNoNF_DeclarationOffice_Warehouse read Get_Warehouse;
  end;

{ IXMLDeclarationNoNF_DeclarationOffice_Warehouse }

  IXMLDeclarationNoNF_DeclarationOffice_Warehouse = interface(IXMLNode)
    ['{36C594F1-7115-4088-9D16-01158AA37B16}']
    { Property Accessors }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds;
    function Get_LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds;
    function Get_Address: IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLWarehouseIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds read Get_LatitudeMeasure;
    property LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds read Get_LongitudeMeasure;
    property Address: IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address read Get_Address;
  end;

{ IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address }

  IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address = interface(IXMLNode)
    ['{83C5AC8C-6739-42DA-AACA-9A509359A2B1}']
    { Property Accessors }
    function Get_Line: IXMLAddressLineTextType_ds;
    { Methods & Properties }
    property Line: IXMLAddressLineTextType_ds read Get_Line;
  end;

{ IXMLDeclarationNoNF_AdditionalInformation }

  IXMLDeclarationNoNF_AdditionalInformation = interface(IXMLNode)
    ['{B3B14D4E-7C08-4D6F-965E-DB15025579F2}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds read Get_StatementDescription;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNoNF_AdditionalInformationList }

  IXMLDeclarationNoNF_AdditionalInformationList = interface(IXMLNodeCollection)
    ['{35F473C1-768C-4E90-B457-28823F509CDE}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_AdditionalInformation;
    property Items[Index: Integer]: IXMLDeclarationNoNF_AdditionalInformation read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_CurrencyExchange }

  IXMLDeclarationNoNF_CurrencyExchange = interface(IXMLNode)
    ['{FD8D5A28-75DE-41AA-AB83-C9F300499F07}']
    { Property Accessors }
    function Get_CurrencyTypeCode: UnicodeString;
    procedure Set_CurrencyTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property CurrencyTypeCode: UnicodeString read Get_CurrencyTypeCode write Set_CurrencyTypeCode;
  end;

{ IXMLDeclarationNoNF_Declarant }

  IXMLDeclarationNoNF_Declarant = interface(IXMLNode)
    ['{9896F0CD-91A5-462A-AFEE-95A7BFF1C719}']
    { Property Accessors }
    function Get_ID: IXMLDeclarantIdentificationIDType_ds;
    function Get_Contact: IXMLDeclarationNoNF_Declarant_Contact;
    { Methods & Properties }
    property ID: IXMLDeclarantIdentificationIDType_ds read Get_ID;
    property Contact: IXMLDeclarationNoNF_Declarant_Contact read Get_Contact;
  end;

{ IXMLDeclarationNoNF_Declarant_Contact }

  IXMLDeclarationNoNF_Declarant_Contact = interface(IXMLNode)
    ['{913F46F4-9ABB-4667-A13A-07497311AC4E}']
    { Property Accessors }
    function Get_Name: IXMLContactNameTextType_ds;
    function Get_Communication: IXMLDeclarationNoNF_Declarant_Contact_CommunicationList;
    { Methods & Properties }
    property Name: IXMLContactNameTextType_ds read Get_Name;
    property Communication: IXMLDeclarationNoNF_Declarant_Contact_CommunicationList read Get_Communication;
  end;

{ IXMLDeclarationNoNF_Declarant_Contact_Communication }

  IXMLDeclarationNoNF_Declarant_Contact_Communication = interface(IXMLNode)
    ['{4CC518ED-9187-4DBB-B90E-18B43A305ECC}']
    { Property Accessors }
    function Get_ID: IXMLCommunicationIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLCommunicationIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclarationNoNF_Declarant_Contact_CommunicationList }

  IXMLDeclarationNoNF_Declarant_Contact_CommunicationList = interface(IXMLNodeCollection)
    ['{F8A13E61-96BB-4B1F-8CF7-A7C6DF990041}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_Declarant_Contact_Communication;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_Declarant_Contact_Communication;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_Declarant_Contact_Communication;
    property Items[Index: Integer]: IXMLDeclarationNoNF_Declarant_Contact_Communication read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_ExitOffice }

  IXMLDeclarationNoNF_ExitOffice = interface(IXMLNode)
    ['{85ED9743-9008-42EA-A6A7-E44AF008DCBC}']
    { Property Accessors }
    function Get_ID: IXMLExitOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNoNF_ExitOffice_Warehouse;
    { Methods & Properties }
    property ID: IXMLExitOfficeIdentificationCodeType_ds read Get_ID;
    property Warehouse: IXMLDeclarationNoNF_ExitOffice_Warehouse read Get_Warehouse;
  end;

{ IXMLDeclarationNoNF_ExitOffice_Warehouse }

  IXMLDeclarationNoNF_ExitOffice_Warehouse = interface(IXMLNode)
    ['{61366CA4-4373-4444-A599-7ABFE835FD56}']
    { Property Accessors }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLWarehouseIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclarationNoNF_GoodsShipment }

  IXMLDeclarationNoNF_GoodsShipment = interface(IXMLNode)
    ['{A99D42CA-13F1-4227-AC69-5AEC6E74F106}']
    { Property Accessors }
    function Get_Exporter: IXMLDeclarationNoNF_GoodsShipment_Exporter;
    function Get_GovernmentAgencyGoodsItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList;
    function Get_Importer: IXMLDeclarationNoNF_GoodsShipment_Importer;
    function Get_Invoice: IXMLDeclarationNoNF_GoodsShipment_Invoice;
    function Get_TradeTerms: IXMLDeclarationNoNF_GoodsShipment_TradeTerms;
    { Methods & Properties }
    property Exporter: IXMLDeclarationNoNF_GoodsShipment_Exporter read Get_Exporter;
    property GovernmentAgencyGoodsItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList read Get_GovernmentAgencyGoodsItem;
    property Importer: IXMLDeclarationNoNF_GoodsShipment_Importer read Get_Importer;
    property Invoice: IXMLDeclarationNoNF_GoodsShipment_Invoice read Get_Invoice;
    property TradeTerms: IXMLDeclarationNoNF_GoodsShipment_TradeTerms read Get_TradeTerms;
  end;

{ IXMLDeclarationNoNF_GoodsShipmentList }

  IXMLDeclarationNoNF_GoodsShipmentList = interface(IXMLNodeCollection)
    ['{9C0FE55F-F84C-4F36-A0D4-28280A76ABD5}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_Exporter }

  IXMLDeclarationNoNF_GoodsShipment_Exporter = interface(IXMLNode)
    ['{71117431-BFF8-47E9-8902-5A107CDC5183}']
    { Property Accessors }
    function Get_Name: IXMLExporterNameTextType_ds;
    function Get_ID: IXMLExporterIdentificationIDType_ds;
    function Get_Address: IXMLDeclarationNoNF_GoodsShipment_Exporter_Address;
    { Methods & Properties }
    property Name: IXMLExporterNameTextType_ds read Get_Name;
    property ID: IXMLExporterIdentificationIDType_ds read Get_ID;
    property Address: IXMLDeclarationNoNF_GoodsShipment_Exporter_Address read Get_Address;
  end;

{ IXMLExporterNameTextType_ds }

  IXMLExporterNameTextType_ds = interface(IXMLNode)
    ['{09B5570E-F5D9-4306-BBCF-8E0260C625E3}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLExporterIdentificationIDType_ds }

  IXMLExporterIdentificationIDType_ds = interface(IXMLNode)
    ['{7E8C2A84-6A39-4530-9869-BA3E07FD8ACD}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_Exporter_Address }

  IXMLDeclarationNoNF_GoodsShipment_Exporter_Address = interface(IXMLNode)
    ['{C9B5BB82-7815-48E3-BCFB-AD7A3FF0E4E3}']
    { Property Accessors }
    function Get_CountryCode: UnicodeString;
    function Get_CountrySubDivisionCode: UnicodeString;
    function Get_Line: IXMLAddressLineTextType_ds;
    procedure Set_CountryCode(Value: UnicodeString);
    procedure Set_CountrySubDivisionCode(Value: UnicodeString);
    { Methods & Properties }
    property CountryCode: UnicodeString read Get_CountryCode write Set_CountryCode;
    property CountrySubDivisionCode: UnicodeString read Get_CountrySubDivisionCode write Set_CountrySubDivisionCode;
    property Line: IXMLAddressLineTextType_ds read Get_Line;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem = interface(IXMLNode)
    ['{8F86BF8E-A9C2-469D-AC03-1F8CB626BF99}']
    { Property Accessors }
    function Get_CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
    function Get_FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
    function Get_SequenceNumeric: UnicodeString;
    function Get_Destination: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
    function Get_AdditionalDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
    function Get_Commodity: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
    function Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
    function Get_GovernmentProcedure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    function Get_PreviousDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
    function Get_ValuationAdjustment: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
    procedure Set_SequenceNumeric(Value: UnicodeString);
    { Methods & Properties }
    property CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds read Get_CustomsValueAmount;
    property FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds read Get_FinancedValueAmount;
    property SequenceNumeric: UnicodeString read Get_SequenceNumeric write Set_SequenceNumeric;
    property Destination: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList read Get_Destination;
    property AdditionalDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList read Get_AdditionalDocument;
    property AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList read Get_AdditionalInformation;
    property Commodity: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity read Get_Commodity;
    property GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure read Get_GoodsMeasure;
    property GovernmentProcedure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList read Get_GovernmentProcedure;
    property PreviousDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList read Get_PreviousDocument;
    property ValuationAdjustment: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment read Get_ValuationAdjustment;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList = interface(IXMLNodeCollection)
    ['{FF6695A7-DBFB-413F-9336-0816B9027330}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination = interface(IXMLNode)
    ['{DDB516C7-8AAD-4A64-B8C0-0CEF3DB750C1}']
    { Property Accessors }
    function Get_CountryCode: UnicodeString;
    function Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
    procedure Set_CountryCode(Value: UnicodeString);
    { Methods & Properties }
    property CountryCode: UnicodeString read Get_CountryCode write Set_CountryCode;
    property GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure read Get_GoodsMeasure;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = interface(IXMLNodeCollection)
    ['{5B71AE1E-8569-4F28-978D-907EF9C0D792}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = interface(IXMLNode)
    ['{2559EE7E-96C3-47E3-9F41-26459FEADB6C}']
    { Property Accessors }
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    { Methods & Properties }
    property TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds read Get_TariffQuantity;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface(IXMLNode)
    ['{4D9000EC-D9E0-46F1-9332-02460BB03CF6}']
    { Property Accessors }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
    function Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
    function Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
    procedure Set_CategoryCode(Value: UnicodeString);
    { Methods & Properties }
    property CategoryCode: UnicodeString read Get_CategoryCode write Set_CategoryCode;
    property ID: IXMLAdditionalDocumentIdentificationIDType_ds read Get_ID;
    property ItemID: IXMLAdditionalDocumentItemIDType_ds read Get_ItemID;
    property QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds read Get_QuantityQuantity;
    property AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation read Get_AdditionalInformation;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = interface(IXMLNodeCollection)
    ['{A44560CB-6948-4A67-A9F1-B26F2AE4B45A}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = interface(IXMLNode)
    ['{86389785-EA9F-4670-9A5B-BF50697D947A}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds read Get_StatementDescription;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = interface(IXMLNode)
    ['{60F546CD-055F-4825-A95A-5B15A8B53551}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds read Get_StatementDescription;
    property LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds read Get_LimitDateTime;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = interface(IXMLNodeCollection)
    ['{D2AC07FE-8E4E-4375-87DA-D2A364D72243}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = interface(IXMLNode)
    ['{773A9DCD-8BDF-4CBB-9AA4-641D69A85FA1}']
    { Property Accessors }
    function Get_Description: IXMLCommodityDescriptionTextType_ds;
    function Get_ValueAmount: IXMLCommodityValueAmountType_ds;
    function Get_CommercialDescription: IXMLCommodityCommercialDescriptionTextType_ds;
    function Get_Classification: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification;
    function Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
    function Get_Product: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product;
    function Get_ProductCharacteristics: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
    function Get_ProductCriteriaConformance: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
    { Methods & Properties }
    property Description: IXMLCommodityDescriptionTextType_ds read Get_Description;
    property ValueAmount: IXMLCommodityValueAmountType_ds read Get_ValueAmount;
    property CommercialDescription: IXMLCommodityCommercialDescriptionTextType_ds read Get_CommercialDescription;
    property Classification: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification read Get_Classification;
    property GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList read Get_GoodsMeasure;
    property Product: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product read Get_Product;
    property ProductCharacteristics: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList read Get_ProductCharacteristics;
    property ProductCriteriaConformance: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList read Get_ProductCriteriaConformance;
  end;

{ IXMLCommodityCommercialDescriptionTextType_ds }

  IXMLCommodityCommercialDescriptionTextType_ds = interface(IXMLNode)
    ['{FB607871-46C9-4545-8733-0FAC7CB7D4D2}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification = interface(IXMLNode)
    ['{9E41A5F9-ECCE-4000-B3B1-CD12018F7B32}']
    { Property Accessors }
    function Get_ID: IXMLClassificationIdentificationIDType_ds;
    function Get_IdentificationTypeCode: UnicodeString;
    procedure Set_IdentificationTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLClassificationIdentificationIDType_ds read Get_ID;
    property IdentificationTypeCode: UnicodeString read Get_IdentificationTypeCode write Set_IdentificationTypeCode;
  end;

{ IXMLClassificationIdentificationIDType_ds }

  IXMLClassificationIdentificationIDType_ds = interface(IXMLNode)
    ['{AA85A31D-4986-4628-9221-10D112EA4E44}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = interface(IXMLNode)
    ['{9907A57F-7B70-445F-8400-5FA866F52B18}']
    { Property Accessors }
    function Get_UnitDescription: IXMLGoodsMeasureUnitDescriptionTextType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitDescription: IXMLGoodsMeasureUnitDescriptionTextType_ds read Get_UnitDescription;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds read Get_TariffQuantity;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = interface(IXMLNodeCollection)
    ['{73206E90-B75D-4A51-B891-B4736E1F35D7}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure read Get_Item; default;
  end;

{ IXMLGoodsMeasureUnitDescriptionTextType_ds }

  IXMLGoodsMeasureUnitDescriptionTextType_ds = interface(IXMLNode)
    ['{9C026FD7-5A9F-44F6-8A85-8FDCE56B0A66}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product = interface(IXMLNode)
    ['{39D286F6-44A9-4936-BC55-94BED70282CD}']
    { Property Accessors }
    function Get_ID: IXMLProductIdentificationIDType_ds;
    function Get_IdentifierTypeCode: UnicodeString;
    procedure Set_IdentifierTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLProductIdentificationIDType_ds read Get_ID;
    property IdentifierTypeCode: UnicodeString read Get_IdentifierTypeCode write Set_IdentifierTypeCode;
  end;

{ IXMLProductIdentificationIDType_ds }

  IXMLProductIdentificationIDType_ds = interface(IXMLNode)
    ['{B5184E88-5C6D-4CB5-B216-DF468C14DDB8}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = interface(IXMLNode)
    ['{B4F620F1-B461-45A2-B2BB-4207E23A14AC}']
    { Property Accessors }
    function Get_TypeCode: IXMLProductCharacteristicsTypeCodeType_ds;
    function Get_Description: IXMLProductCharacteristicsDescriptionTextType_ds;
    { Methods & Properties }
    property TypeCode: IXMLProductCharacteristicsTypeCodeType_ds read Get_TypeCode;
    property Description: IXMLProductCharacteristicsDescriptionTextType_ds read Get_Description;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = interface(IXMLNodeCollection)
    ['{1AA763E5-04E0-4B49-ACE0-007C1A2FDA43}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = interface(IXMLNode)
    ['{A9DD6AD1-020E-410E-972D-B4B6C9086EFD}']
    { Property Accessors }
    function Get_QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Description: IXMLProductCriteriaConformanceDescriptionTextType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds read Get_QuantityQuantity;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property Description: IXMLProductCriteriaConformanceDescriptionTextType_ds read Get_Description;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = interface(IXMLNodeCollection)
    ['{9C787D7E-DCD0-41A7-A56C-0F33CD05F089}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = interface(IXMLNode)
    ['{EDA883EC-081A-4E9A-B363-0E9C9589225A}']
    { Property Accessors }
    function Get_NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds;
    { Methods & Properties }
    property NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds read Get_NetNetWeightMeasure;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface(IXMLNode)
    ['{7EA10562-E27C-4350-9A42-2A86956CF578}']
    { Property Accessors }
    function Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
    { Methods & Properties }
    property CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds read Get_CurrentCode;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = interface(IXMLNodeCollection)
    ['{F6223A3F-EB33-472B-922A-42A1578DA9B0}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = interface(IXMLNode)
    ['{941EEC88-4AD1-43F6-AAD0-99B8A53EB29E}']
    { Property Accessors }
    function Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLPreviousDocumentIdentificationIDType_ds read Get_ID;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = interface(IXMLNodeCollection)
    ['{8401538C-9972-423E-8223-9795C584EDBC}']
    { Methods & Properties }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    property Items[Index: Integer]: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument read Get_Item; default;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

  IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = interface(IXMLNode)
    ['{FBE7DFF9-FFA9-48AC-9D6F-273FB4B7CB91}']
    { Property Accessors }
    function Get_AdditionCode: UnicodeString;
    function Get_PercentageNumeric: UnicodeString;
    procedure Set_AdditionCode(Value: UnicodeString);
    procedure Set_PercentageNumeric(Value: UnicodeString);
    { Methods & Properties }
    property AdditionCode: UnicodeString read Get_AdditionCode write Set_AdditionCode;
    property PercentageNumeric: UnicodeString read Get_PercentageNumeric write Set_PercentageNumeric;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_Importer }

  IXMLDeclarationNoNF_GoodsShipment_Importer = interface(IXMLNode)
    ['{9D7F28D1-0952-4813-A259-F67C55E5703A}']
    { Property Accessors }
    function Get_Name: IXMLImporterNameTextType_ds;
    function Get_Address: IXMLDeclarationNoNF_GoodsShipment_Importer_Address;
    { Methods & Properties }
    property Name: IXMLImporterNameTextType_ds read Get_Name;
    property Address: IXMLDeclarationNoNF_GoodsShipment_Importer_Address read Get_Address;
  end;

{ IXMLImporterNameTextType_ds }

  IXMLImporterNameTextType_ds = interface(IXMLNode)
    ['{C8427076-E539-4009-A419-D455F0BF8F5E}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_Importer_Address }

  IXMLDeclarationNoNF_GoodsShipment_Importer_Address = interface(IXMLNode)
    ['{0E53597C-DD17-4959-87A8-E46DF46EFA4F}']
    { Property Accessors }
    function Get_CountryCode: UnicodeString;
    function Get_Line: IXMLAddressLineTextType_ds;
    procedure Set_CountryCode(Value: UnicodeString);
    { Methods & Properties }
    property CountryCode: UnicodeString read Get_CountryCode write Set_CountryCode;
    property Line: IXMLAddressLineTextType_ds read Get_Line;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_Invoice }

  IXMLDeclarationNoNF_GoodsShipment_Invoice = interface(IXMLNode)
    ['{E70C3E98-CCA6-4E07-B57F-E70EDD0D94FF}']
    { Property Accessors }
    function Get_TypeCode: UnicodeString;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation read Get_AdditionalInformation;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation }

  IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation = interface(IXMLNode)
    ['{A0D87716-7A55-4FEE-B288-1ABE549C3B59}']
    { Property Accessors }
    function Get_StatementCode: UnicodeString;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
    { Methods & Properties }
    property StatementCode: UnicodeString read Get_StatementCode write Set_StatementCode;
    property StatementTypeCode: UnicodeString read Get_StatementTypeCode write Set_StatementTypeCode;
  end;

{ IXMLDeclarationNoNF_GoodsShipment_TradeTerms }

  IXMLDeclarationNoNF_GoodsShipment_TradeTerms = interface(IXMLNode)
    ['{BEA35091-AA5E-4F7E-88DE-5D4E3DB8F399}']
    { Property Accessors }
    function Get_ConditionCode: UnicodeString;
    procedure Set_ConditionCode(Value: UnicodeString);
    { Methods & Properties }
    property ConditionCode: UnicodeString read Get_ConditionCode write Set_ConditionCode;
  end;

{ IXMLDeclarationNoNF_UCR }

  IXMLDeclarationNoNF_UCR = interface(IXMLNode)
    ['{E95E0628-DFE0-4708-B690-FEECB90E65D1}']
    { Property Accessors }
    function Get_TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds;
    { Methods & Properties }
    property TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds read Get_TraderAssignedReferenceID;
  end;

{ IXMLDeclarationDrawbackIsencao }

  IXMLDeclarationDrawbackIsencao = interface(IXMLNodeCollection)
    ['{4183F76E-C06F-4D6E-8FB0-0DBA4DF10343}']
    { Property Accessors }
    function Get_GoodsShipment(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment;
    { Methods & Properties }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment;
    property GoodsShipment[Index: Integer]: IXMLDeclarationDrawbackIsencao_GoodsShipment read Get_GoodsShipment; default;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment }

  IXMLDeclarationDrawbackIsencao_GoodsShipment = interface(IXMLNodeCollection)
    ['{09D37665-D7D2-4322-94EC-564932398A05}']
    { Property Accessors }
    function Get_GovernmentAgencyGoodsItem(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
    { Methods & Properties }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
    property GovernmentAgencyGoodsItem[Index: Integer]: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem read Get_GovernmentAgencyGoodsItem; default;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem = interface(IXMLNode)
    ['{769EDF23-14BC-4DA4-8E00-3519E696BD0C}']
    { Property Accessors }
    function Get_SequenceNumeric: UnicodeString;
    function Get_AdditionalDocument: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    function Get_GovernmentProcedure: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    procedure Set_SequenceNumeric(Value: UnicodeString);
    { Methods & Properties }
    property SequenceNumeric: UnicodeString read Get_SequenceNumeric write Set_SequenceNumeric;
    property AdditionalDocument: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList read Get_AdditionalDocument;
    property GovernmentProcedure: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList read Get_GovernmentProcedure;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = interface(IXMLNode)
    ['{3994437E-BB17-45C2-B679-54004671E4B3}']
    { Property Accessors }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
    function Get_DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
    function Get_DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
    function Get_ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
    function Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
    function Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
    function Get_Invoice: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
    procedure Set_CategoryCode(Value: UnicodeString);
    { Methods & Properties }
    property CategoryCode: UnicodeString read Get_CategoryCode write Set_CategoryCode;
    property ID: IXMLAdditionalDocumentIdentificationIDType_ds read Get_ID;
    property DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds read Get_DrawbackHsClassification;
    property DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds read Get_DrawbackRecipientId;
    property ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds read Get_ValueWithExchangeCoverAmount;
    property ItemID: IXMLAdditionalDocumentItemIDType_ds read Get_ItemID;
    property QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds read Get_QuantityQuantity;
    property Invoice: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList read Get_Invoice;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = interface(IXMLNodeCollection)
    ['{433CBCC2-8668-4483-87D0-DAA962D99172}']
    { Methods & Properties }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;

    function Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    property Items[Index: Integer]: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument read Get_Item; default;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = interface(IXMLNode)
    ['{A58F613A-44AC-4BD1-AA52-3CBAAA9BDC0A}']
    { Property Accessors }
    function Get_ID: IXMLInvoiceIdentificationIDType_ds;
    function Get_IssueDateTime: IXMLInvoiceIssueDateTimeType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds;
    function Get_QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
    { Methods & Properties }
    property ID: IXMLInvoiceIdentificationIDType_ds read Get_ID;
    property IssueDateTime: IXMLInvoiceIssueDateTimeType_ds read Get_IssueDateTime;
    property TypeCode: UnicodeString read Get_TypeCode write Set_TypeCode;
    property CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds read Get_CustomsValueAmount;
    property QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds read Get_QuantityQuantity;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = interface(IXMLNodeCollection)
    ['{B3873E15-6E3E-47DC-BB21-B4FD3B303BBF}']
    { Methods & Properties }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;

    function Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
    property Items[Index: Integer]: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice read Get_Item; default;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = interface(IXMLNode)
    ['{08B567C1-664E-4D79-8557-DD6AB25750E6}']
    { Property Accessors }
    function Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
    { Methods & Properties }
    property CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds read Get_CurrentCode;
  end;

{ IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

  IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = interface(IXMLNodeCollection)
    ['{B5BA52EB-E5DE-48A5-A923-977C1F8297B9}']
    { Methods & Properties }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;

    function Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    property Items[Index: Integer]: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDeclaration = class;
  TXMLDeclarationNFe = class;
  TXMLDeclarationIdentificationIDType_ds = class;
  TXMLDeclarationNFe_DeclarationOffice = class;
  TXMLDeclarationOfficeIdentificationCodeType_ds = class;
  TXMLDeclarationNFe_DeclarationOffice_Warehouse = class;
  TXMLWarehouseIdentificationIDType_ds = class;
  TXMLWarehouseLatitudeMeasureType_ds = class;
  TXMLWarehouseLongitudeMeasureType_ds = class;
  TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address = class;
  TXMLAddressLineTextType_ds = class;
  TXMLDeclarationNFe_AdditionalInformation = class;
  TXMLDeclarationNFe_AdditionalInformationList = class;
  TXMLAdditionalInformationStatementDescriptionTextType_ds = class;
  TXMLDeclarationNFe_CurrencyExchange = class;
  TXMLDeclarationNFe_Declarant = class;
  TXMLDeclarantIdentificationIDType_ds = class;
  TXMLDeclarationNFe_Declarant_Contact = class;
  TXMLContactNameTextType_ds = class;
  TXMLDeclarationNFe_Declarant_Contact_Communication = class;
  TXMLDeclarationNFe_Declarant_Contact_CommunicationList = class;
  TXMLCommunicationIdentificationIDType_ds = class;
  TXMLDeclarationNFe_ExitOffice = class;
  TXMLExitOfficeIdentificationCodeType_ds = class;
  TXMLDeclarationNFe_ExitOffice_Warehouse = class;
  TXMLDeclarationNFe_GoodsShipment = class;
  TXMLDeclarationNFe_GoodsShipmentList = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = class;
  TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds = class;
  TXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = class;
  TXMLGoodsMeasureTariffQuantityType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = class;
  TXMLAdditionalDocumentIdentificationIDType_ds = class;
  TXMLAdditionalDocumentDrawbackHsClassificationTextType_ds = class;
  TXMLAdditionalDocumentDrawbackRecipientIdTextType_ds = class;
  TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds = class;
  TXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds = class;
  TXMLAdditionalDocumentItemIDType_ds = class;
  TXMLAdditionalDocumentQuantityQuantityType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList = class;
  TXMLPreviousDocumentAmountAmountType_ds = class;
  TXMLPreviousDocumentIdentificationIDType_ds = class;
  TXMLPreviousDocumentQuantityQuantityType_ds = class;
  TXMLPreviousDocumentItemIDType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = class;
  TXMLInvoiceIdentificationIDType_ds = class;
  TXMLInvoiceIssueDateTimeType_ds = class;
  TXMLInvoiceCustomsValueAmountType_ds = class;
  TXMLInvoiceQuantityQuantityType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = class;
  TXMLAdditionalInformationLimitDateTimeType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = class;
  TXMLCommodityDescriptionTextType_ds = class;
  TXMLCommodityValueAmountType_ds = class;
  TXMLCommodityInvoiceBRLvalueAmountType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList = class;
  TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = class;
  TXMLProductCharacteristicsTypeCodeType_ds = class;
  TXMLProductCharacteristicsDescriptionTextType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = class;
  TXMLProductCriteriaConformanceQuantityQuantityType_ds = class;
  TXMLProductCriteriaConformanceDescriptionTextType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = class;
  TXMLGoodsMeasureNetNetWeightMeasureType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = class;
  TXMLGovernmentProcedureCurrentCodeType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = class;
  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = class;
  TXMLDeclarationNFe_GoodsShipment_Invoice = class;
  TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter = class;
  TXMLSubmitterIdentificationIDType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = class;
  TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList = class;
  TXMLReferencedInvoiceIdentificationIDType_ds = class;
  TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = class;
  TXMLDeclarationNFe_GoodsShipment_TradeTerms = class;
  TXMLDeclarationNFe_UCR = class;
  TXMLUCRTraderAssignedReferenceIDType_ds = class;
  TXMLDeclarationNoNF = class;
  TXMLDeclarationNoNF_DeclarationOffice = class;
  TXMLDeclarationNoNF_DeclarationOffice_Warehouse = class;
  TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address = class;
  TXMLDeclarationNoNF_AdditionalInformation = class;
  TXMLDeclarationNoNF_AdditionalInformationList = class;
  TXMLDeclarationNoNF_CurrencyExchange = class;
  TXMLDeclarationNoNF_Declarant = class;
  TXMLDeclarationNoNF_Declarant_Contact = class;
  TXMLDeclarationNoNF_Declarant_Contact_Communication = class;
  TXMLDeclarationNoNF_Declarant_Contact_CommunicationList = class;
  TXMLDeclarationNoNF_ExitOffice = class;
  TXMLDeclarationNoNF_ExitOffice_Warehouse = class;
  TXMLDeclarationNoNF_GoodsShipment = class;
  TXMLDeclarationNoNF_GoodsShipmentList = class;
  TXMLDeclarationNoNF_GoodsShipment_Exporter = class;
  TXMLExporterNameTextType_ds = class;
  TXMLExporterIdentificationIDType_ds = class;
  TXMLDeclarationNoNF_GoodsShipment_Exporter_Address = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = class;
  TXMLCommodityCommercialDescriptionTextType_ds = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification = class;
  TXMLClassificationIdentificationIDType_ds = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = class;
  TXMLGoodsMeasureUnitDescriptionTextType_ds = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product = class;
  TXMLProductIdentificationIDType_ds = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = class;
  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = class;
  TXMLDeclarationNoNF_GoodsShipment_Importer = class;
  TXMLImporterNameTextType_ds = class;
  TXMLDeclarationNoNF_GoodsShipment_Importer_Address = class;
  TXMLDeclarationNoNF_GoodsShipment_Invoice = class;
  TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation = class;
  TXMLDeclarationNoNF_GoodsShipment_TradeTerms = class;
  TXMLDeclarationNoNF_UCR = class;
  TXMLDeclarationDrawbackIsencao = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class;
  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = class;

{ TXMLDeclaration }

  TXMLDeclaration = class(TXMLNode, IXMLDeclaration)
  protected
    { IXMLDeclaration }
    function Get_DeclarationNFe: IXMLDeclarationNFe;
    function Get_DeclarationNoNF: IXMLDeclarationNoNF;
    function Get_DeclarationDrawbackIsencao: IXMLDeclarationDrawbackIsencao;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe }

  TXMLDeclarationNFe = class(TXMLNode, IXMLDeclarationNFe)
  private
    FAdditionalInformation: IXMLDeclarationNFe_AdditionalInformationList;
    FGoodsShipment: IXMLDeclarationNFe_GoodsShipmentList;
  protected
    { IXMLDeclarationNFe }
    function Get_ID: IXMLDeclarationIdentificationIDType_ds;
    function Get_DeclarationOffice: IXMLDeclarationNFe_DeclarationOffice;
    function Get_AdditionalInformation: IXMLDeclarationNFe_AdditionalInformationList;
    function Get_CurrencyExchange: IXMLDeclarationNFe_CurrencyExchange;
    function Get_Declarant: IXMLDeclarationNFe_Declarant;
    function Get_ExitOffice: IXMLDeclarationNFe_ExitOffice;
    function Get_GoodsShipment: IXMLDeclarationNFe_GoodsShipmentList;
    function Get_UCR: IXMLDeclarationNFe_UCR;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationIdentificationIDType_ds }

  TXMLDeclarationIdentificationIDType_ds = class(TXMLNode, IXMLDeclarationIdentificationIDType_ds)
  protected
    { IXMLDeclarationIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_DeclarationOffice }

  TXMLDeclarationNFe_DeclarationOffice = class(TXMLNode, IXMLDeclarationNFe_DeclarationOffice)
  protected
    { IXMLDeclarationNFe_DeclarationOffice }
    function Get_ID: IXMLDeclarationOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNFe_DeclarationOffice_Warehouse;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationOfficeIdentificationCodeType_ds }

  TXMLDeclarationOfficeIdentificationCodeType_ds = class(TXMLNode, IXMLDeclarationOfficeIdentificationCodeType_ds)
  protected
    { IXMLDeclarationOfficeIdentificationCodeType_ds }
    function Get_ListID: UnicodeString;
    procedure Set_ListID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_DeclarationOffice_Warehouse }

  TXMLDeclarationNFe_DeclarationOffice_Warehouse = class(TXMLNode, IXMLDeclarationNFe_DeclarationOffice_Warehouse)
  protected
    { IXMLDeclarationNFe_DeclarationOffice_Warehouse }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds;
    function Get_LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds;
    function Get_Address: IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWarehouseIdentificationIDType_ds }

  TXMLWarehouseIdentificationIDType_ds = class(TXMLNode, IXMLWarehouseIdentificationIDType_ds)
  protected
    { IXMLWarehouseIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLWarehouseLatitudeMeasureType_ds }

  TXMLWarehouseLatitudeMeasureType_ds = class(TXMLNode, IXMLWarehouseLatitudeMeasureType_ds)
  protected
    { IXMLWarehouseLatitudeMeasureType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLWarehouseLongitudeMeasureType_ds }

  TXMLWarehouseLongitudeMeasureType_ds = class(TXMLNode, IXMLWarehouseLongitudeMeasureType_ds)
  protected
    { IXMLWarehouseLongitudeMeasureType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address }

  TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address = class(TXMLNode, IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address)
  protected
    { IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address }
    function Get_Line: IXMLAddressLineTextType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAddressLineTextType_ds }

  TXMLAddressLineTextType_ds = class(TXMLNode, IXMLAddressLineTextType_ds)
  protected
    { IXMLAddressLineTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_AdditionalInformation }

  TXMLDeclarationNFe_AdditionalInformation = class(TXMLNode, IXMLDeclarationNFe_AdditionalInformation)
  protected
    { IXMLDeclarationNFe_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_AdditionalInformationList }

  TXMLDeclarationNFe_AdditionalInformationList = class(TXMLNodeCollection, IXMLDeclarationNFe_AdditionalInformationList)
  protected
    { IXMLDeclarationNFe_AdditionalInformationList }
    function Add: IXMLDeclarationNFe_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNFe_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_AdditionalInformation;
  end;

{ TXMLAdditionalInformationStatementDescriptionTextType_ds }

  TXMLAdditionalInformationStatementDescriptionTextType_ds = class(TXMLNode, IXMLAdditionalInformationStatementDescriptionTextType_ds)
  protected
    { IXMLAdditionalInformationStatementDescriptionTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_CurrencyExchange }

  TXMLDeclarationNFe_CurrencyExchange = class(TXMLNode, IXMLDeclarationNFe_CurrencyExchange)
  protected
    { IXMLDeclarationNFe_CurrencyExchange }
    function Get_CurrencyTypeCode: UnicodeString;
    procedure Set_CurrencyTypeCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_Declarant }

  TXMLDeclarationNFe_Declarant = class(TXMLNode, IXMLDeclarationNFe_Declarant)
  protected
    { IXMLDeclarationNFe_Declarant }
    function Get_ID: IXMLDeclarantIdentificationIDType_ds;
    function Get_Contact: IXMLDeclarationNFe_Declarant_Contact;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarantIdentificationIDType_ds }

  TXMLDeclarantIdentificationIDType_ds = class(TXMLNode, IXMLDeclarantIdentificationIDType_ds)
  protected
    { IXMLDeclarantIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_Declarant_Contact }

  TXMLDeclarationNFe_Declarant_Contact = class(TXMLNode, IXMLDeclarationNFe_Declarant_Contact)
  private
    FCommunication: IXMLDeclarationNFe_Declarant_Contact_CommunicationList;
  protected
    { IXMLDeclarationNFe_Declarant_Contact }
    function Get_Name: IXMLContactNameTextType_ds;
    function Get_Communication: IXMLDeclarationNFe_Declarant_Contact_CommunicationList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLContactNameTextType_ds }

  TXMLContactNameTextType_ds = class(TXMLNode, IXMLContactNameTextType_ds)
  protected
    { IXMLContactNameTextType_ds }
  end;

{ TXMLDeclarationNFe_Declarant_Contact_Communication }

  TXMLDeclarationNFe_Declarant_Contact_Communication = class(TXMLNode, IXMLDeclarationNFe_Declarant_Contact_Communication)
  protected
    { IXMLDeclarationNFe_Declarant_Contact_Communication }
    function Get_ID: IXMLCommunicationIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_Declarant_Contact_CommunicationList }

  TXMLDeclarationNFe_Declarant_Contact_CommunicationList = class(TXMLNodeCollection, IXMLDeclarationNFe_Declarant_Contact_CommunicationList)
  protected
    { IXMLDeclarationNFe_Declarant_Contact_CommunicationList }
    function Add: IXMLDeclarationNFe_Declarant_Contact_Communication;
    function Insert(const Index: Integer): IXMLDeclarationNFe_Declarant_Contact_Communication;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_Declarant_Contact_Communication;
  end;

{ TXMLCommunicationIdentificationIDType_ds }

  TXMLCommunicationIdentificationIDType_ds = class(TXMLNode, IXMLCommunicationIdentificationIDType_ds)
  protected
    { IXMLCommunicationIdentificationIDType_ds }
  end;

{ TXMLDeclarationNFe_ExitOffice }

  TXMLDeclarationNFe_ExitOffice = class(TXMLNode, IXMLDeclarationNFe_ExitOffice)
  protected
    { IXMLDeclarationNFe_ExitOffice }
    function Get_ID: IXMLExitOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNFe_ExitOffice_Warehouse;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLExitOfficeIdentificationCodeType_ds }

  TXMLExitOfficeIdentificationCodeType_ds = class(TXMLNode, IXMLExitOfficeIdentificationCodeType_ds)
  protected
    { IXMLExitOfficeIdentificationCodeType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_ExitOffice_Warehouse }

  TXMLDeclarationNFe_ExitOffice_Warehouse = class(TXMLNode, IXMLDeclarationNFe_ExitOffice_Warehouse)
  protected
    { IXMLDeclarationNFe_ExitOffice_Warehouse }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment }

  TXMLDeclarationNFe_GoodsShipment = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment)
  private
    FGovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
  protected
    { IXMLDeclarationNFe_GoodsShipment }
    function Get_GovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
    function Get_Invoice: IXMLDeclarationNFe_GoodsShipment_Invoice;
    function Get_TradeTerms: IXMLDeclarationNFe_GoodsShipment_TradeTerms;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipmentList }

  TXMLDeclarationNFe_GoodsShipmentList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipmentList)
  protected
    { IXMLDeclarationNFe_GoodsShipmentList }
    function Add: IXMLDeclarationNFe_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem)
  private
    FDestination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
    FAdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    FAdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
    FGovernmentProcedure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    FPreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }
    function Get_CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
    function Get_FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
    function Get_SequenceNumeric: UnicodeString;
    function Get_Destination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
    function Get_AdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    function Get_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
    function Get_Commodity: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
    function Get_GovernmentProcedure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    function Get_PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
    function Get_ValuationAdjustment: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
    procedure Set_SequenceNumeric(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
  end;

{ TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds }

  TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds = class(TXMLNode, IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds)
  protected
    { IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds }

  TXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds = class(TXMLNode, IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds)
  protected
    { IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds }
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }
    function Get_CountryCode: UnicodeString;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
    procedure Set_CountryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGoodsMeasureTariffQuantityType_ds }

  TXMLGoodsMeasureTariffQuantityType_ds = class(TXMLNode, IXMLGoodsMeasureTariffQuantityType_ds)
  protected
    { IXMLGoodsMeasureTariffQuantityType_ds }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument)
  private
    FPreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList;
    FInvoice: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
    function Get_DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
    function Get_DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
    function Get_ValueWithoutExchangeCoverAmount: IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds;
    function Get_ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
    function Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
    function Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
    function Get_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
    function Get_PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList;
    function Get_Invoice: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
    procedure Set_CategoryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
  end;

{ TXMLAdditionalDocumentIdentificationIDType_ds }

  TXMLAdditionalDocumentIdentificationIDType_ds = class(TXMLNode, IXMLAdditionalDocumentIdentificationIDType_ds)
  protected
    { IXMLAdditionalDocumentIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLAdditionalDocumentDrawbackHsClassificationTextType_ds }

  TXMLAdditionalDocumentDrawbackHsClassificationTextType_ds = class(TXMLNode, IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds)
  protected
    { IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds }
  end;

{ TXMLAdditionalDocumentDrawbackRecipientIdTextType_ds }

  TXMLAdditionalDocumentDrawbackRecipientIdTextType_ds = class(TXMLNode, IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds)
  protected
    { IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds }
  end;

{ TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds }

  TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds = class(TXMLNode, IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds)
  protected
    { IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds }
  end;

{ TXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds }

  TXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds = class(TXMLNode, IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds)
  protected
    { IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds }
  end;

{ TXMLAdditionalDocumentItemIDType_ds }

  TXMLAdditionalDocumentItemIDType_ds = class(TXMLNode, IXMLAdditionalDocumentItemIDType_ds)
  protected
    { IXMLAdditionalDocumentItemIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLAdditionalDocumentQuantityQuantityType_ds }

  TXMLAdditionalDocumentQuantityQuantityType_ds = class(TXMLNode, IXMLAdditionalDocumentQuantityQuantityType_ds)
  protected
    { IXMLAdditionalDocumentQuantityQuantityType_ds }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument }
    function Get_AmountAmount: IXMLPreviousDocumentAmountAmountType_ds;
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
    function Get_QuantityQuantity: IXMLPreviousDocumentQuantityQuantityType_ds;
    function Get_ItemID: IXMLPreviousDocumentItemIDType_ds;
    procedure Set_CategoryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
  end;

{ TXMLPreviousDocumentAmountAmountType_ds }

  TXMLPreviousDocumentAmountAmountType_ds = class(TXMLNode, IXMLPreviousDocumentAmountAmountType_ds)
  protected
    { IXMLPreviousDocumentAmountAmountType_ds }
  end;

{ TXMLPreviousDocumentIdentificationIDType_ds }

  TXMLPreviousDocumentIdentificationIDType_ds = class(TXMLNode, IXMLPreviousDocumentIdentificationIDType_ds)
  protected
    { IXMLPreviousDocumentIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLPreviousDocumentQuantityQuantityType_ds }

  TXMLPreviousDocumentQuantityQuantityType_ds = class(TXMLNode, IXMLPreviousDocumentQuantityQuantityType_ds)
  protected
    { IXMLPreviousDocumentQuantityQuantityType_ds }
  end;

{ TXMLPreviousDocumentItemIDType_ds }

  TXMLPreviousDocumentItemIDType_ds = class(TXMLNode, IXMLPreviousDocumentItemIDType_ds)
  protected
    { IXMLPreviousDocumentItemIDType_ds }
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }
    function Get_ID: IXMLInvoiceIdentificationIDType_ds;
    function Get_IssueDateTime: IXMLInvoiceIssueDateTimeType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds;
    function Get_QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
  end;

{ TXMLInvoiceIdentificationIDType_ds }

  TXMLInvoiceIdentificationIDType_ds = class(TXMLNode, IXMLInvoiceIdentificationIDType_ds)
  protected
    { IXMLInvoiceIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLInvoiceIssueDateTimeType_ds }

  TXMLInvoiceIssueDateTimeType_ds = class(TXMLNode, IXMLInvoiceIssueDateTimeType_ds)
  protected
    { IXMLInvoiceIssueDateTimeType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLInvoiceCustomsValueAmountType_ds }

  TXMLInvoiceCustomsValueAmountType_ds = class(TXMLNode, IXMLInvoiceCustomsValueAmountType_ds)
  protected
    { IXMLInvoiceCustomsValueAmountType_ds }
  end;

{ TXMLInvoiceQuantityQuantityType_ds }

  TXMLInvoiceQuantityQuantityType_ds = class(TXMLNode, IXMLInvoiceQuantityQuantityType_ds)
  protected
    { IXMLInvoiceQuantityQuantityType_ds }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
  end;

{ TXMLAdditionalInformationLimitDateTimeType_ds }

  TXMLAdditionalInformationLimitDateTimeType_ds = class(TXMLNode, IXMLAdditionalInformationLimitDateTimeType_ds)
  protected
    { IXMLAdditionalInformationLimitDateTimeType_ds }
    function Get_Lang: UnicodeString;
    procedure Set_Lang(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity)
  private
    FGoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
    FProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
    FProductCriteriaConformance: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }
    function Get_Description: IXMLCommodityDescriptionTextType_ds;
    function Get_ValueAmount: IXMLCommodityValueAmountType_ds;
    function Get_InvoiceBRLvalueAmount: IXMLCommodityInvoiceBRLvalueAmountType_ds;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
    function Get_InvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
    function Get_ProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
    function Get_ProductCriteriaConformance: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCommodityDescriptionTextType_ds }

  TXMLCommodityDescriptionTextType_ds = class(TXMLNode, IXMLCommodityDescriptionTextType_ds)
  protected
    { IXMLCommodityDescriptionTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLCommodityValueAmountType_ds }

  TXMLCommodityValueAmountType_ds = class(TXMLNode, IXMLCommodityValueAmountType_ds)
  protected
    { IXMLCommodityValueAmountType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLCommodityInvoiceBRLvalueAmountType_ds }

  TXMLCommodityInvoiceBRLvalueAmountType_ds = class(TXMLNode, IXMLCommodityInvoiceBRLvalueAmountType_ds)
  protected
    { IXMLCommodityInvoiceBRLvalueAmountType_ds }
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }
    function Get_TypeCode: UnicodeString;
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine)
  private
    FReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList;
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }
    function Get_SequenceNumeric: UnicodeString;
    function Get_ReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList;
    procedure Set_SequenceNumeric(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }
    function Get_SequenceNumeric: UnicodeString;
    function Get_InvoiceIdentificationID: IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds;
    function Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
    procedure Set_SequenceNumeric(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
  end;

{ TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds }

  TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds = class(TXMLNode, IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds)
  protected
    { IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }
    function Get_TypeCode: IXMLProductCharacteristicsTypeCodeType_ds;
    function Get_Description: IXMLProductCharacteristicsDescriptionTextType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
  end;

{ TXMLProductCharacteristicsTypeCodeType_ds }

  TXMLProductCharacteristicsTypeCodeType_ds = class(TXMLNode, IXMLProductCharacteristicsTypeCodeType_ds)
  protected
    { IXMLProductCharacteristicsTypeCodeType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLProductCharacteristicsDescriptionTextType_ds }

  TXMLProductCharacteristicsDescriptionTextType_ds = class(TXMLNode, IXMLProductCharacteristicsDescriptionTextType_ds)
  protected
    { IXMLProductCharacteristicsDescriptionTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }
    function Get_QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Description: IXMLProductCriteriaConformanceDescriptionTextType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
  end;

{ TXMLProductCriteriaConformanceQuantityQuantityType_ds }

  TXMLProductCriteriaConformanceQuantityQuantityType_ds = class(TXMLNode, IXMLProductCriteriaConformanceQuantityQuantityType_ds)
  protected
    { IXMLProductCriteriaConformanceQuantityQuantityType_ds }
  end;

{ TXMLProductCriteriaConformanceDescriptionTextType_ds }

  TXMLProductCriteriaConformanceDescriptionTextType_ds = class(TXMLNode, IXMLProductCriteriaConformanceDescriptionTextType_ds)
  protected
    { IXMLProductCriteriaConformanceDescriptionTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }
    function Get_NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLGoodsMeasureNetNetWeightMeasureType_ds }

  TXMLGoodsMeasureNetNetWeightMeasureType_ds = class(TXMLNode, IXMLGoodsMeasureNetNetWeightMeasureType_ds)
  protected
    { IXMLGoodsMeasureNetNetWeightMeasureType_ds }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }
    function Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
  end;

{ TXMLGovernmentProcedureCurrentCodeType_ds }

  TXMLGovernmentProcedureCurrentCodeType_ds = class(TXMLNode, IXMLGovernmentProcedureCurrentCodeType_ds)
  protected
    { IXMLGovernmentProcedureCurrentCodeType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }
    function Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }
    function Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
  end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

  TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment)
  protected
    { IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }
    function Get_AdditionCode: UnicodeString;
    function Get_PercentageNumeric: UnicodeString;
    procedure Set_AdditionCode(Value: UnicodeString);
    procedure Set_PercentageNumeric(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice }

  TXMLDeclarationNFe_GoodsShipment_Invoice = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_Invoice)
  private
    FReferencedInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList;
  protected
    { IXMLDeclarationNFe_GoodsShipment_Invoice }
    function Get_ID: IXMLInvoiceIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter;
    function Get_ReferencedInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter }

  TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter)
  protected
    { IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter }
    function Get_ID: IXMLSubmitterIdentificationIDType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSubmitterIdentificationIDType_ds }

  TXMLSubmitterIdentificationIDType_ds = class(TXMLNode, IXMLSubmitterIdentificationIDType_ds)
  protected
    { IXMLSubmitterIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }

  TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice)
  protected
    { IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }
    function Get_ID: IXMLReferencedInvoiceIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList }

  TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList = class(TXMLNodeCollection, IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList)
  protected
    { IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList }
    function Add: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
    function Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;

    function Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
  end;

{ TXMLReferencedInvoiceIdentificationIDType_ds }

  TXMLReferencedInvoiceIdentificationIDType_ds = class(TXMLNode, IXMLReferencedInvoiceIdentificationIDType_ds)
  protected
    { IXMLReferencedInvoiceIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }

  TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter)
  protected
    { IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }
    function Get_ID: IXMLSubmitterIdentificationIDType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNFe_GoodsShipment_TradeTerms }

  TXMLDeclarationNFe_GoodsShipment_TradeTerms = class(TXMLNode, IXMLDeclarationNFe_GoodsShipment_TradeTerms)
  protected
    { IXMLDeclarationNFe_GoodsShipment_TradeTerms }
    function Get_ConditionCode: UnicodeString;
    procedure Set_ConditionCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNFe_UCR }

  TXMLDeclarationNFe_UCR = class(TXMLNode, IXMLDeclarationNFe_UCR)
  protected
    { IXMLDeclarationNFe_UCR }
    function Get_TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLUCRTraderAssignedReferenceIDType_ds }

  TXMLUCRTraderAssignedReferenceIDType_ds = class(TXMLNode, IXMLUCRTraderAssignedReferenceIDType_ds)
  protected
    { IXMLUCRTraderAssignedReferenceIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF }

  TXMLDeclarationNoNF = class(TXMLNode, IXMLDeclarationNoNF)
  private
    FAdditionalInformation: IXMLDeclarationNoNF_AdditionalInformationList;
    FGoodsShipment: IXMLDeclarationNoNF_GoodsShipmentList;
  protected
    { IXMLDeclarationNoNF }
    function Get_ID: IXMLDeclarationIdentificationIDType_ds;
    function Get_DeclarationOffice: IXMLDeclarationNoNF_DeclarationOffice;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_AdditionalInformationList;
    function Get_CurrencyExchange: IXMLDeclarationNoNF_CurrencyExchange;
    function Get_Declarant: IXMLDeclarationNoNF_Declarant;
    function Get_ExitOffice: IXMLDeclarationNoNF_ExitOffice;
    function Get_GoodsShipment: IXMLDeclarationNoNF_GoodsShipmentList;
    function Get_UCR: IXMLDeclarationNoNF_UCR;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_DeclarationOffice }

  TXMLDeclarationNoNF_DeclarationOffice = class(TXMLNode, IXMLDeclarationNoNF_DeclarationOffice)
  protected
    { IXMLDeclarationNoNF_DeclarationOffice }
    function Get_ID: IXMLDeclarationOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNoNF_DeclarationOffice_Warehouse;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_DeclarationOffice_Warehouse }

  TXMLDeclarationNoNF_DeclarationOffice_Warehouse = class(TXMLNode, IXMLDeclarationNoNF_DeclarationOffice_Warehouse)
  protected
    { IXMLDeclarationNoNF_DeclarationOffice_Warehouse }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds;
    function Get_LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds;
    function Get_Address: IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address }

  TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address = class(TXMLNode, IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address)
  protected
    { IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address }
    function Get_Line: IXMLAddressLineTextType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_AdditionalInformation }

  TXMLDeclarationNoNF_AdditionalInformation = class(TXMLNode, IXMLDeclarationNoNF_AdditionalInformation)
  protected
    { IXMLDeclarationNoNF_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_AdditionalInformationList }

  TXMLDeclarationNoNF_AdditionalInformationList = class(TXMLNodeCollection, IXMLDeclarationNoNF_AdditionalInformationList)
  protected
    { IXMLDeclarationNoNF_AdditionalInformationList }
    function Add: IXMLDeclarationNoNF_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_AdditionalInformation;
  end;

{ TXMLDeclarationNoNF_CurrencyExchange }

  TXMLDeclarationNoNF_CurrencyExchange = class(TXMLNode, IXMLDeclarationNoNF_CurrencyExchange)
  protected
    { IXMLDeclarationNoNF_CurrencyExchange }
    function Get_CurrencyTypeCode: UnicodeString;
    procedure Set_CurrencyTypeCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_Declarant }

  TXMLDeclarationNoNF_Declarant = class(TXMLNode, IXMLDeclarationNoNF_Declarant)
  protected
    { IXMLDeclarationNoNF_Declarant }
    function Get_ID: IXMLDeclarantIdentificationIDType_ds;
    function Get_Contact: IXMLDeclarationNoNF_Declarant_Contact;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_Declarant_Contact }

  TXMLDeclarationNoNF_Declarant_Contact = class(TXMLNode, IXMLDeclarationNoNF_Declarant_Contact)
  private
    FCommunication: IXMLDeclarationNoNF_Declarant_Contact_CommunicationList;
  protected
    { IXMLDeclarationNoNF_Declarant_Contact }
    function Get_Name: IXMLContactNameTextType_ds;
    function Get_Communication: IXMLDeclarationNoNF_Declarant_Contact_CommunicationList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_Declarant_Contact_Communication }

  TXMLDeclarationNoNF_Declarant_Contact_Communication = class(TXMLNode, IXMLDeclarationNoNF_Declarant_Contact_Communication)
  protected
    { IXMLDeclarationNoNF_Declarant_Contact_Communication }
    function Get_ID: IXMLCommunicationIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_Declarant_Contact_CommunicationList }

  TXMLDeclarationNoNF_Declarant_Contact_CommunicationList = class(TXMLNodeCollection, IXMLDeclarationNoNF_Declarant_Contact_CommunicationList)
  protected
    { IXMLDeclarationNoNF_Declarant_Contact_CommunicationList }
    function Add: IXMLDeclarationNoNF_Declarant_Contact_Communication;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_Declarant_Contact_Communication;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_Declarant_Contact_Communication;
  end;

{ TXMLDeclarationNoNF_ExitOffice }

  TXMLDeclarationNoNF_ExitOffice = class(TXMLNode, IXMLDeclarationNoNF_ExitOffice)
  protected
    { IXMLDeclarationNoNF_ExitOffice }
    function Get_ID: IXMLExitOfficeIdentificationCodeType_ds;
    function Get_Warehouse: IXMLDeclarationNoNF_ExitOffice_Warehouse;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_ExitOffice_Warehouse }

  TXMLDeclarationNoNF_ExitOffice_Warehouse = class(TXMLNode, IXMLDeclarationNoNF_ExitOffice_Warehouse)
  protected
    { IXMLDeclarationNoNF_ExitOffice_Warehouse }
    function Get_ID: IXMLWarehouseIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment }

  TXMLDeclarationNoNF_GoodsShipment = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment)
  private
    FGovernmentAgencyGoodsItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList;
  protected
    { IXMLDeclarationNoNF_GoodsShipment }
    function Get_Exporter: IXMLDeclarationNoNF_GoodsShipment_Exporter;
    function Get_GovernmentAgencyGoodsItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList;
    function Get_Importer: IXMLDeclarationNoNF_GoodsShipment_Importer;
    function Get_Invoice: IXMLDeclarationNoNF_GoodsShipment_Invoice;
    function Get_TradeTerms: IXMLDeclarationNoNF_GoodsShipment_TradeTerms;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipmentList }

  TXMLDeclarationNoNF_GoodsShipmentList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipmentList)
  protected
    { IXMLDeclarationNoNF_GoodsShipmentList }
    function Add: IXMLDeclarationNoNF_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_Exporter }

  TXMLDeclarationNoNF_GoodsShipment_Exporter = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_Exporter)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_Exporter }
    function Get_Name: IXMLExporterNameTextType_ds;
    function Get_ID: IXMLExporterIdentificationIDType_ds;
    function Get_Address: IXMLDeclarationNoNF_GoodsShipment_Exporter_Address;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLExporterNameTextType_ds }

  TXMLExporterNameTextType_ds = class(TXMLNode, IXMLExporterNameTextType_ds)
  protected
    { IXMLExporterNameTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLExporterIdentificationIDType_ds }

  TXMLExporterIdentificationIDType_ds = class(TXMLNode, IXMLExporterIdentificationIDType_ds)
  protected
    { IXMLExporterIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_Exporter_Address }

  TXMLDeclarationNoNF_GoodsShipment_Exporter_Address = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_Exporter_Address)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_Exporter_Address }
    function Get_CountryCode: UnicodeString;
    function Get_CountrySubDivisionCode: UnicodeString;
    function Get_Line: IXMLAddressLineTextType_ds;
    procedure Set_CountryCode(Value: UnicodeString);
    procedure Set_CountrySubDivisionCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem)
  private
    FDestination: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
    FAdditionalDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    FAdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
    FGovernmentProcedure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    FPreviousDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem }
    function Get_CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
    function Get_FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
    function Get_SequenceNumeric: UnicodeString;
    function Get_Destination: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
    function Get_AdditionalDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
    function Get_Commodity: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
    function Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
    function Get_GovernmentProcedure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    function Get_PreviousDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
    function Get_ValuationAdjustment: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
    procedure Set_SequenceNumeric(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination }
    function Get_CountryCode: UnicodeString;
    function Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
    procedure Set_CountryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
    function Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
    function Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
    procedure Set_CategoryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
    function Get_LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity)
  private
    FGoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
    FProductCharacteristics: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
    FProductCriteriaConformance: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }
    function Get_Description: IXMLCommodityDescriptionTextType_ds;
    function Get_ValueAmount: IXMLCommodityValueAmountType_ds;
    function Get_CommercialDescription: IXMLCommodityCommercialDescriptionTextType_ds;
    function Get_Classification: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification;
    function Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
    function Get_Product: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product;
    function Get_ProductCharacteristics: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
    function Get_ProductCriteriaConformance: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCommodityCommercialDescriptionTextType_ds }

  TXMLCommodityCommercialDescriptionTextType_ds = class(TXMLNode, IXMLCommodityCommercialDescriptionTextType_ds)
  protected
    { IXMLCommodityCommercialDescriptionTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification }
    function Get_ID: IXMLClassificationIdentificationIDType_ds;
    function Get_IdentificationTypeCode: UnicodeString;
    procedure Set_IdentificationTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLClassificationIdentificationIDType_ds }

  TXMLClassificationIdentificationIDType_ds = class(TXMLNode, IXMLClassificationIdentificationIDType_ds)
  protected
    { IXMLClassificationIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }
    function Get_UnitDescription: IXMLGoodsMeasureUnitDescriptionTextType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
  end;

{ TXMLGoodsMeasureUnitDescriptionTextType_ds }

  TXMLGoodsMeasureUnitDescriptionTextType_ds = class(TXMLNode, IXMLGoodsMeasureUnitDescriptionTextType_ds)
  protected
    { IXMLGoodsMeasureUnitDescriptionTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product }
    function Get_ID: IXMLProductIdentificationIDType_ds;
    function Get_IdentifierTypeCode: UnicodeString;
    procedure Set_IdentifierTypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProductIdentificationIDType_ds }

  TXMLProductIdentificationIDType_ds = class(TXMLNode, IXMLProductIdentificationIDType_ds)
  protected
    { IXMLProductIdentificationIDType_ds }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }
    function Get_TypeCode: IXMLProductCharacteristicsTypeCodeType_ds;
    function Get_Description: IXMLProductCharacteristicsDescriptionTextType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }
    function Get_QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_Description: IXMLProductCriteriaConformanceDescriptionTextType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }
    function Get_NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }
    function Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }
    function Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
    function Get_TypeCode: UnicodeString;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList = class(TXMLNodeCollection, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }
    function Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
    function Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;

    function Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

  TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }
    function Get_AdditionCode: UnicodeString;
    function Get_PercentageNumeric: UnicodeString;
    procedure Set_AdditionCode(Value: UnicodeString);
    procedure Set_PercentageNumeric(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_Importer }

  TXMLDeclarationNoNF_GoodsShipment_Importer = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_Importer)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_Importer }
    function Get_Name: IXMLImporterNameTextType_ds;
    function Get_Address: IXMLDeclarationNoNF_GoodsShipment_Importer_Address;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLImporterNameTextType_ds }

  TXMLImporterNameTextType_ds = class(TXMLNode, IXMLImporterNameTextType_ds)
  protected
    { IXMLImporterNameTextType_ds }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_Importer_Address }

  TXMLDeclarationNoNF_GoodsShipment_Importer_Address = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_Importer_Address)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_Importer_Address }
    function Get_CountryCode: UnicodeString;
    function Get_Line: IXMLAddressLineTextType_ds;
    procedure Set_CountryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_Invoice }

  TXMLDeclarationNoNF_GoodsShipment_Invoice = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_Invoice)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_Invoice }
    function Get_TypeCode: UnicodeString;
    function Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation }

  TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation }
    function Get_StatementCode: UnicodeString;
    function Get_StatementTypeCode: UnicodeString;
    procedure Set_StatementCode(Value: UnicodeString);
    procedure Set_StatementTypeCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_GoodsShipment_TradeTerms }

  TXMLDeclarationNoNF_GoodsShipment_TradeTerms = class(TXMLNode, IXMLDeclarationNoNF_GoodsShipment_TradeTerms)
  protected
    { IXMLDeclarationNoNF_GoodsShipment_TradeTerms }
    function Get_ConditionCode: UnicodeString;
    procedure Set_ConditionCode(Value: UnicodeString);
  end;

{ TXMLDeclarationNoNF_UCR }

  TXMLDeclarationNoNF_UCR = class(TXMLNode, IXMLDeclarationNoNF_UCR)
  protected
    { IXMLDeclarationNoNF_UCR }
    function Get_TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao }

  TXMLDeclarationDrawbackIsencao = class(TXMLNodeCollection, IXMLDeclarationDrawbackIsencao)
  protected
    { IXMLDeclarationDrawbackIsencao }
    function Get_GoodsShipment(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment;
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment }

  TXMLDeclarationDrawbackIsencao_GoodsShipment = class(TXMLNodeCollection, IXMLDeclarationDrawbackIsencao_GoodsShipment)
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment }
    function Get_GovernmentAgencyGoodsItem(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem = class(TXMLNode, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem)
  private
    FAdditionalDocument: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    FGovernmentProcedure: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem }
    function Get_SequenceNumeric: UnicodeString;
    function Get_AdditionalDocument: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
    function Get_GovernmentProcedure: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
    procedure Set_SequenceNumeric(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument = class(TXMLNode, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument)
  private
    FInvoice: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }
    function Get_CategoryCode: UnicodeString;
    function Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
    function Get_DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
    function Get_DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
    function Get_ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
    function Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
    function Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
    function Get_Invoice: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
    procedure Set_CategoryCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList = class(TXMLNodeCollection, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList)
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;

    function Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice = class(TXMLNode, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice)
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }
    function Get_ID: IXMLInvoiceIdentificationIDType_ds;
    function Get_IssueDateTime: IXMLInvoiceIssueDateTimeType_ds;
    function Get_TypeCode: UnicodeString;
    function Get_CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds;
    function Get_QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds;
    procedure Set_TypeCode(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList = class(TXMLNodeCollection, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList)
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;

    function Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure = class(TXMLNode, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure)
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }
    function Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

  TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList = class(TXMLNodeCollection, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList)
  protected
    { IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }
    function Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
    function Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;

    function Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
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
  RegisterChildNode('DeclarationNFe', TXMLDeclarationNFe);
  RegisterChildNode('DeclarationNoNF', TXMLDeclarationNoNF);
  RegisterChildNode('DeclarationDrawbackIsencao', TXMLDeclarationDrawbackIsencao);
  inherited;
end;

function TXMLDeclaration.Get_DeclarationNFe: IXMLDeclarationNFe;
begin
  Result := ChildNodes['DeclarationNFe'] as IXMLDeclarationNFe;
end;

function TXMLDeclaration.Get_DeclarationNoNF: IXMLDeclarationNoNF;
begin
  Result := ChildNodes['DeclarationNoNF'] as IXMLDeclarationNoNF;
end;

function TXMLDeclaration.Get_DeclarationDrawbackIsencao: IXMLDeclarationDrawbackIsencao;
begin
  Result := ChildNodes['DeclarationDrawbackIsencao'] as IXMLDeclarationDrawbackIsencao;
end;

{ TXMLDeclarationNFe }

procedure TXMLDeclarationNFe.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclarationIdentificationIDType_ds);
  RegisterChildNode('DeclarationOffice', TXMLDeclarationNFe_DeclarationOffice);
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNFe_AdditionalInformation);
  RegisterChildNode('CurrencyExchange', TXMLDeclarationNFe_CurrencyExchange);
  RegisterChildNode('Declarant', TXMLDeclarationNFe_Declarant);
  RegisterChildNode('ExitOffice', TXMLDeclarationNFe_ExitOffice);
  RegisterChildNode('GoodsShipment', TXMLDeclarationNFe_GoodsShipment);
  RegisterChildNode('UCR', TXMLDeclarationNFe_UCR);
  FAdditionalInformation := CreateCollection(TXMLDeclarationNFe_AdditionalInformationList, IXMLDeclarationNFe_AdditionalInformation, 'AdditionalInformation') as IXMLDeclarationNFe_AdditionalInformationList;
  FGoodsShipment := CreateCollection(TXMLDeclarationNFe_GoodsShipmentList, IXMLDeclarationNFe_GoodsShipment, 'GoodsShipment') as IXMLDeclarationNFe_GoodsShipmentList;
  inherited;
end;

function TXMLDeclarationNFe.Get_ID: IXMLDeclarationIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLDeclarationIdentificationIDType_ds;
end;

function TXMLDeclarationNFe.Get_DeclarationOffice: IXMLDeclarationNFe_DeclarationOffice;
begin
  Result := ChildNodes['DeclarationOffice'] as IXMLDeclarationNFe_DeclarationOffice;
end;

function TXMLDeclarationNFe.Get_AdditionalInformation: IXMLDeclarationNFe_AdditionalInformationList;
begin
  Result := FAdditionalInformation;
end;

function TXMLDeclarationNFe.Get_CurrencyExchange: IXMLDeclarationNFe_CurrencyExchange;
begin
  Result := ChildNodes['CurrencyExchange'] as IXMLDeclarationNFe_CurrencyExchange;
end;

function TXMLDeclarationNFe.Get_Declarant: IXMLDeclarationNFe_Declarant;
begin
  Result := ChildNodes['Declarant'] as IXMLDeclarationNFe_Declarant;
end;

function TXMLDeclarationNFe.Get_ExitOffice: IXMLDeclarationNFe_ExitOffice;
begin
  Result := ChildNodes['ExitOffice'] as IXMLDeclarationNFe_ExitOffice;
end;

function TXMLDeclarationNFe.Get_GoodsShipment: IXMLDeclarationNFe_GoodsShipmentList;
begin
  Result := FGoodsShipment;
end;

function TXMLDeclarationNFe.Get_UCR: IXMLDeclarationNFe_UCR;
begin
  Result := ChildNodes['UCR'] as IXMLDeclarationNFe_UCR;
end;

{ TXMLDeclarationIdentificationIDType_ds }

function TXMLDeclarationIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclarationIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_DeclarationOffice }

procedure TXMLDeclarationNFe_DeclarationOffice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclarationOfficeIdentificationCodeType_ds);
  RegisterChildNode('Warehouse', TXMLDeclarationNFe_DeclarationOffice_Warehouse);
  inherited;
end;

function TXMLDeclarationNFe_DeclarationOffice.Get_ID: IXMLDeclarationOfficeIdentificationCodeType_ds;
begin
  Result := ChildNodes['ID'] as IXMLDeclarationOfficeIdentificationCodeType_ds;
end;

function TXMLDeclarationNFe_DeclarationOffice.Get_Warehouse: IXMLDeclarationNFe_DeclarationOffice_Warehouse;
begin
  Result := ChildNodes['Warehouse'] as IXMLDeclarationNFe_DeclarationOffice_Warehouse;
end;

{ TXMLDeclarationOfficeIdentificationCodeType_ds }

function TXMLDeclarationOfficeIdentificationCodeType_ds.Get_ListID: UnicodeString;
begin
  Result := AttributeNodes['listID'].Text;
end;

procedure TXMLDeclarationOfficeIdentificationCodeType_ds.Set_ListID(Value: UnicodeString);
begin
  SetAttribute('listID', Value);
end;

{ TXMLDeclarationNFe_DeclarationOffice_Warehouse }

procedure TXMLDeclarationNFe_DeclarationOffice_Warehouse.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLWarehouseIdentificationIDType_ds);
  RegisterChildNode('LatitudeMeasure', TXMLWarehouseLatitudeMeasureType_ds);
  RegisterChildNode('LongitudeMeasure', TXMLWarehouseLongitudeMeasureType_ds);
  RegisterChildNode('Address', TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address);
  inherited;
end;

function TXMLDeclarationNFe_DeclarationOffice_Warehouse.Get_ID: IXMLWarehouseIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLWarehouseIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_DeclarationOffice_Warehouse.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_DeclarationOffice_Warehouse.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_DeclarationOffice_Warehouse.Get_LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds;
begin
  Result := ChildNodes['LatitudeMeasure'] as IXMLWarehouseLatitudeMeasureType_ds;
end;

function TXMLDeclarationNFe_DeclarationOffice_Warehouse.Get_LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds;
begin
  Result := ChildNodes['LongitudeMeasure'] as IXMLWarehouseLongitudeMeasureType_ds;
end;

function TXMLDeclarationNFe_DeclarationOffice_Warehouse.Get_Address: IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address;
begin
  Result := ChildNodes['Address'] as IXMLDeclarationNFe_DeclarationOffice_Warehouse_Address;
end;

{ TXMLWarehouseIdentificationIDType_ds }

function TXMLWarehouseIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLWarehouseIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLWarehouseLatitudeMeasureType_ds }

function TXMLWarehouseLatitudeMeasureType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLWarehouseLatitudeMeasureType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLWarehouseLongitudeMeasureType_ds }

function TXMLWarehouseLongitudeMeasureType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLWarehouseLongitudeMeasureType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address }

procedure TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address.AfterConstruction;
begin
  RegisterChildNode('Line', TXMLAddressLineTextType_ds);
  inherited;
end;

function TXMLDeclarationNFe_DeclarationOffice_Warehouse_Address.Get_Line: IXMLAddressLineTextType_ds;
begin
  Result := ChildNodes['Line'] as IXMLAddressLineTextType_ds;
end;

{ TXMLAddressLineTextType_ds }

function TXMLAddressLineTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLAddressLineTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNFe_AdditionalInformation }

procedure TXMLDeclarationNFe_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLAdditionalInformationStatementDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNFe_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNFe_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_AdditionalInformation.Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
begin
  Result := ChildNodes['StatementDescription'] as IXMLAdditionalInformationStatementDescriptionTextType_ds;
end;

function TXMLDeclarationNFe_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNFe_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_AdditionalInformationList }

function TXMLDeclarationNFe_AdditionalInformationList.Add: IXMLDeclarationNFe_AdditionalInformation;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_AdditionalInformation;
end;

function TXMLDeclarationNFe_AdditionalInformationList.Insert(const Index: Integer): IXMLDeclarationNFe_AdditionalInformation;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_AdditionalInformation;
end;

function TXMLDeclarationNFe_AdditionalInformationList.Get_Item(Index: Integer): IXMLDeclarationNFe_AdditionalInformation;
begin
  Result := List[Index] as IXMLDeclarationNFe_AdditionalInformation;
end;

{ TXMLAdditionalInformationStatementDescriptionTextType_ds }

function TXMLAdditionalInformationStatementDescriptionTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLAdditionalInformationStatementDescriptionTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNFe_CurrencyExchange }

function TXMLDeclarationNFe_CurrencyExchange.Get_CurrencyTypeCode: UnicodeString;
begin
  Result := ChildNodes['CurrencyTypeCode'].Text;
end;

procedure TXMLDeclarationNFe_CurrencyExchange.Set_CurrencyTypeCode(Value: UnicodeString);
begin
  ChildNodes['CurrencyTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_Declarant }

procedure TXMLDeclarationNFe_Declarant.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclarantIdentificationIDType_ds);
  RegisterChildNode('Contact', TXMLDeclarationNFe_Declarant_Contact);
  inherited;
end;

function TXMLDeclarationNFe_Declarant.Get_ID: IXMLDeclarantIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLDeclarantIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_Declarant.Get_Contact: IXMLDeclarationNFe_Declarant_Contact;
begin
  Result := ChildNodes['Contact'] as IXMLDeclarationNFe_Declarant_Contact;
end;

{ TXMLDeclarantIdentificationIDType_ds }

function TXMLDeclarantIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclarantIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_Declarant_Contact }

procedure TXMLDeclarationNFe_Declarant_Contact.AfterConstruction;
begin
  RegisterChildNode('Name', TXMLContactNameTextType_ds);
  RegisterChildNode('Communication', TXMLDeclarationNFe_Declarant_Contact_Communication);
  FCommunication := CreateCollection(TXMLDeclarationNFe_Declarant_Contact_CommunicationList, IXMLDeclarationNFe_Declarant_Contact_Communication, 'Communication') as IXMLDeclarationNFe_Declarant_Contact_CommunicationList;
  inherited;
end;

function TXMLDeclarationNFe_Declarant_Contact.Get_Name: IXMLContactNameTextType_ds;
begin
  Result := ChildNodes['Name'] as IXMLContactNameTextType_ds;
end;

function TXMLDeclarationNFe_Declarant_Contact.Get_Communication: IXMLDeclarationNFe_Declarant_Contact_CommunicationList;
begin
  Result := FCommunication;
end;

{ TXMLContactNameTextType_ds }

{ TXMLDeclarationNFe_Declarant_Contact_Communication }

procedure TXMLDeclarationNFe_Declarant_Contact_Communication.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLCommunicationIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_Declarant_Contact_Communication.Get_ID: IXMLCommunicationIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLCommunicationIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_Declarant_Contact_Communication.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_Declarant_Contact_Communication.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_Declarant_Contact_CommunicationList }

function TXMLDeclarationNFe_Declarant_Contact_CommunicationList.Add: IXMLDeclarationNFe_Declarant_Contact_Communication;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_Declarant_Contact_Communication;
end;

function TXMLDeclarationNFe_Declarant_Contact_CommunicationList.Insert(const Index: Integer): IXMLDeclarationNFe_Declarant_Contact_Communication;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_Declarant_Contact_Communication;
end;

function TXMLDeclarationNFe_Declarant_Contact_CommunicationList.Get_Item(Index: Integer): IXMLDeclarationNFe_Declarant_Contact_Communication;
begin
  Result := List[Index] as IXMLDeclarationNFe_Declarant_Contact_Communication;
end;

{ TXMLCommunicationIdentificationIDType_ds }

{ TXMLDeclarationNFe_ExitOffice }

procedure TXMLDeclarationNFe_ExitOffice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLExitOfficeIdentificationCodeType_ds);
  RegisterChildNode('Warehouse', TXMLDeclarationNFe_ExitOffice_Warehouse);
  inherited;
end;

function TXMLDeclarationNFe_ExitOffice.Get_ID: IXMLExitOfficeIdentificationCodeType_ds;
begin
  Result := ChildNodes['ID'] as IXMLExitOfficeIdentificationCodeType_ds;
end;

function TXMLDeclarationNFe_ExitOffice.Get_Warehouse: IXMLDeclarationNFe_ExitOffice_Warehouse;
begin
  Result := ChildNodes['Warehouse'] as IXMLDeclarationNFe_ExitOffice_Warehouse;
end;

{ TXMLExitOfficeIdentificationCodeType_ds }

function TXMLExitOfficeIdentificationCodeType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLExitOfficeIdentificationCodeType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_ExitOffice_Warehouse }

procedure TXMLDeclarationNFe_ExitOffice_Warehouse.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLWarehouseIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_ExitOffice_Warehouse.Get_ID: IXMLWarehouseIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLWarehouseIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_ExitOffice_Warehouse.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_ExitOffice_Warehouse.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_GoodsShipment }

procedure TXMLDeclarationNFe_GoodsShipment.AfterConstruction;
begin
  RegisterChildNode('GovernmentAgencyGoodsItem', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem);
  RegisterChildNode('Invoice', TXMLDeclarationNFe_GoodsShipment_Invoice);
  RegisterChildNode('TradeTerms', TXMLDeclarationNFe_GoodsShipment_TradeTerms);
  FGovernmentAgencyGoodsItem := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem, 'GovernmentAgencyGoodsItem') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment.Get_GovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList;
begin
  Result := FGovernmentAgencyGoodsItem;
end;

function TXMLDeclarationNFe_GoodsShipment.Get_Invoice: IXMLDeclarationNFe_GoodsShipment_Invoice;
begin
  Result := ChildNodes['Invoice'] as IXMLDeclarationNFe_GoodsShipment_Invoice;
end;

function TXMLDeclarationNFe_GoodsShipment.Get_TradeTerms: IXMLDeclarationNFe_GoodsShipment_TradeTerms;
begin
  Result := ChildNodes['TradeTerms'] as IXMLDeclarationNFe_GoodsShipment_TradeTerms;
end;

{ TXMLDeclarationNFe_GoodsShipmentList }

function TXMLDeclarationNFe_GoodsShipmentList.Add: IXMLDeclarationNFe_GoodsShipment;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment;
end;

function TXMLDeclarationNFe_GoodsShipmentList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment;
end;

function TXMLDeclarationNFe_GoodsShipmentList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.AfterConstruction;
begin
  RegisterChildNode('CustomsValueAmount', TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds);
  RegisterChildNode('FinancedValueAmount', TXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds);
  RegisterChildNode('Destination', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination);
  RegisterChildNode('AdditionalDocument', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument);
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation);
  RegisterChildNode('Commodity', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity);
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure);
  RegisterChildNode('GovernmentProcedure', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure);
  RegisterChildNode('PreviousDocument', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument);
  RegisterChildNode('ValuationAdjustment', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment);
  FDestination := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination, 'Destination') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
  FAdditionalDocument := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument, 'AdditionalDocument') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
  FAdditionalInformation := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation, 'AdditionalInformation') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
  FGovernmentProcedure := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure, 'GovernmentProcedure') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
  FPreviousDocument := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument, 'PreviousDocument') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
begin
  Result := ChildNodes['CustomsValueAmount'] as IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
begin
  Result := ChildNodes['FinancedValueAmount'] as IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_SequenceNumeric: UnicodeString;
begin
  Result := ChildNodes['SequenceNumeric'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Set_SequenceNumeric(Value: UnicodeString);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_Destination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
begin
  Result := FDestination;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
begin
  Result := FAdditionalDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
begin
  Result := FAdditionalInformation;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_Commodity: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
begin
  Result := ChildNodes['Commodity'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_GovernmentProcedure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
begin
  Result := FGovernmentProcedure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
begin
  Result := FPreviousDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem.Get_ValuationAdjustment: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
begin
  Result := ChildNodes['ValuationAdjustment'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItemList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
end;

{ TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds }

function TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds }

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.AfterConstruction;
begin
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Get_CountryCode: UnicodeString;
begin
  Result := ChildNodes['CountryCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Set_CountryCode(Value: UnicodeString);
begin
  ChildNodes['CountryCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('TariffQuantity', TXMLGoodsMeasureTariffQuantityType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure.Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
begin
  Result := ChildNodes['TariffQuantity'] as IXMLGoodsMeasureTariffQuantityType_ds;
end;

{ TXMLGoodsMeasureTariffQuantityType_ds }

function TXMLGoodsMeasureTariffQuantityType_ds.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLGoodsMeasureTariffQuantityType_ds.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLAdditionalDocumentIdentificationIDType_ds);
  RegisterChildNode('DrawbackHsClassification', TXMLAdditionalDocumentDrawbackHsClassificationTextType_ds);
  RegisterChildNode('DrawbackRecipientId', TXMLAdditionalDocumentDrawbackRecipientIdTextType_ds);
  RegisterChildNode('ValueWithoutExchangeCoverAmount', TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds);
  RegisterChildNode('ValueWithExchangeCoverAmount', TXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds);
  RegisterChildNode('ItemID', TXMLAdditionalDocumentItemIDType_ds);
  RegisterChildNode('QuantityQuantity', TXMLAdditionalDocumentQuantityQuantityType_ds);
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation);
  RegisterChildNode('PreviousDocument', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument);
  RegisterChildNode('Invoice', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice);
  FPreviousDocument := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument, 'PreviousDocument') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList;
  FInvoice := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice, 'Invoice') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_CategoryCode: UnicodeString;
begin
  Result := ChildNodes['CategoryCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Set_CategoryCode(Value: UnicodeString);
begin
  ChildNodes['CategoryCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLAdditionalDocumentIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
begin
  Result := ChildNodes['DrawbackHsClassification'] as IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
begin
  Result := ChildNodes['DrawbackRecipientId'] as IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ValueWithoutExchangeCoverAmount: IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds;
begin
  Result := ChildNodes['ValueWithoutExchangeCoverAmount'] as IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
begin
  Result := ChildNodes['ValueWithExchangeCoverAmount'] as IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
begin
  Result := ChildNodes['ItemID'] as IXMLAdditionalDocumentItemIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLAdditionalDocumentQuantityQuantityType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
begin
  Result := ChildNodes['AdditionalInformation'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList;
begin
  Result := FPreviousDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_Invoice: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
begin
  Result := FInvoice;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

{ TXMLAdditionalDocumentIdentificationIDType_ds }

function TXMLAdditionalDocumentIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLAdditionalDocumentIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLAdditionalDocumentDrawbackHsClassificationTextType_ds }

{ TXMLAdditionalDocumentDrawbackRecipientIdTextType_ds }

{ TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType_ds }

{ TXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds }

{ TXMLAdditionalDocumentItemIDType_ds }

function TXMLAdditionalDocumentItemIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLAdditionalDocumentItemIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLAdditionalDocumentQuantityQuantityType_ds }

function TXMLAdditionalDocumentQuantityQuantityType_ds.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLAdditionalDocumentQuantityQuantityType_ds.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLAdditionalInformationStatementDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
begin
  Result := ChildNodes['StatementDescription'] as IXMLAdditionalInformationStatementDescriptionTextType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.AfterConstruction;
begin
  RegisterChildNode('AmountAmount', TXMLPreviousDocumentAmountAmountType_ds);
  RegisterChildNode('ID', TXMLPreviousDocumentIdentificationIDType_ds);
  RegisterChildNode('QuantityQuantity', TXMLPreviousDocumentQuantityQuantityType_ds);
  RegisterChildNode('ItemID', TXMLPreviousDocumentItemIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.Get_AmountAmount: IXMLPreviousDocumentAmountAmountType_ds;
begin
  Result := ChildNodes['AmountAmount'] as IXMLPreviousDocumentAmountAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.Get_CategoryCode: UnicodeString;
begin
  Result := ChildNodes['CategoryCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.Set_CategoryCode(Value: UnicodeString);
begin
  ChildNodes['CategoryCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLPreviousDocumentIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.Get_QuantityQuantity: IXMLPreviousDocumentQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLPreviousDocumentQuantityQuantityType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument.Get_ItemID: IXMLPreviousDocumentItemIDType_ds;
begin
  Result := ChildNodes['ItemID'] as IXMLPreviousDocumentItemIDType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocumentList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_PreviousDocument;
end;

{ TXMLPreviousDocumentAmountAmountType_ds }

{ TXMLPreviousDocumentIdentificationIDType_ds }

function TXMLPreviousDocumentIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLPreviousDocumentIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLPreviousDocumentQuantityQuantityType_ds }

{ TXMLPreviousDocumentItemIDType_ds }

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLInvoiceIdentificationIDType_ds);
  RegisterChildNode('IssueDateTime', TXMLInvoiceIssueDateTimeType_ds);
  RegisterChildNode('CustomsValueAmount', TXMLInvoiceCustomsValueAmountType_ds);
  RegisterChildNode('QuantityQuantity', TXMLInvoiceQuantityQuantityType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_ID: IXMLInvoiceIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLInvoiceIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_IssueDateTime: IXMLInvoiceIssueDateTimeType_ds;
begin
  Result := ChildNodes['IssueDateTime'] as IXMLInvoiceIssueDateTimeType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds;
begin
  Result := ChildNodes['CustomsValueAmount'] as IXMLInvoiceCustomsValueAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLInvoiceQuantityQuantityType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
end;

{ TXMLInvoiceIdentificationIDType_ds }

function TXMLInvoiceIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLInvoiceIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLInvoiceIssueDateTimeType_ds }

function TXMLInvoiceIssueDateTimeType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLInvoiceIssueDateTimeType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLInvoiceCustomsValueAmountType_ds }

{ TXMLInvoiceQuantityQuantityType_ds }

function TXMLInvoiceQuantityQuantityType_ds.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLInvoiceQuantityQuantityType_ds.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLAdditionalInformationStatementDescriptionTextType_ds);
  RegisterChildNode('LimitDateTime', TXMLAdditionalInformationLimitDateTimeType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
begin
  Result := ChildNodes['StatementDescription'] as IXMLAdditionalInformationStatementDescriptionTextType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds;
begin
  Result := ChildNodes['LimitDateTime'] as IXMLAdditionalInformationLimitDateTimeType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

{ TXMLAdditionalInformationLimitDateTimeType_ds }

function TXMLAdditionalInformationLimitDateTimeType_ds.Get_Lang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLAdditionalInformationLimitDateTimeType_ds.Set_Lang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.AfterConstruction;
begin
  RegisterChildNode('Description', TXMLCommodityDescriptionTextType_ds);
  RegisterChildNode('ValueAmount', TXMLCommodityValueAmountType_ds);
  RegisterChildNode('InvoiceBRLvalueAmount', TXMLCommodityInvoiceBRLvalueAmountType_ds);
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure);
  RegisterChildNode('InvoiceLine', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine);
  RegisterChildNode('ProductCharacteristics', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics);
  RegisterChildNode('ProductCriteriaConformance', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance);
  FGoodsMeasure := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure, 'GoodsMeasure') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
  FProductCharacteristics := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics, 'ProductCharacteristics') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
  FProductCriteriaConformance := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance, 'ProductCriteriaConformance') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_Description: IXMLCommodityDescriptionTextType_ds;
begin
  Result := ChildNodes['Description'] as IXMLCommodityDescriptionTextType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ValueAmount: IXMLCommodityValueAmountType_ds;
begin
  Result := ChildNodes['ValueAmount'] as IXMLCommodityValueAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_InvoiceBRLvalueAmount: IXMLCommodityInvoiceBRLvalueAmountType_ds;
begin
  Result := ChildNodes['InvoiceBRLvalueAmount'] as IXMLCommodityInvoiceBRLvalueAmountType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
begin
  Result := FGoodsMeasure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_InvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
begin
  Result := ChildNodes['InvoiceLine'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
begin
  Result := FProductCharacteristics;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ProductCriteriaConformance: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
begin
  Result := FProductCriteriaConformance;
end;

{ TXMLCommodityDescriptionTextType_ds }

function TXMLCommodityDescriptionTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLCommodityDescriptionTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLCommodityValueAmountType_ds }

function TXMLCommodityValueAmountType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLCommodityValueAmountType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLCommodityInvoiceBRLvalueAmountType_ds }

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('TariffQuantity', TXMLGoodsMeasureTariffQuantityType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
begin
  Result := ChildNodes['TariffQuantity'] as IXMLGoodsMeasureTariffQuantityType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.AfterConstruction;
begin
  RegisterChildNode('ReferencedInvoiceLine', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine);
  FReferencedInvoiceLine := CreateCollection(TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList, IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine, 'ReferencedInvoiceLine') as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList;
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.Get_SequenceNumeric: UnicodeString;
begin
  Result := ChildNodes['SequenceNumeric'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.Set_SequenceNumeric(Value: UnicodeString);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine.Get_ReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList;
begin
  Result := FReferencedInvoiceLine;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.AfterConstruction;
begin
  RegisterChildNode('InvoiceIdentificationID', TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds);
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Get_SequenceNumeric: UnicodeString;
begin
  Result := ChildNodes['SequenceNumeric'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Set_SequenceNumeric(Value: UnicodeString);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Get_InvoiceIdentificationID: IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds;
begin
  Result := ChildNodes['InvoiceIdentificationID'] as IXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine.Get_GoodsMeasure: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLineList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
end;

{ TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds }

function TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLReferencedInvoiceLineInvoiceIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('TariffQuantity', TXMLGoodsMeasureTariffQuantityType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine_GoodsMeasure.Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
begin
  Result := ChildNodes['TariffQuantity'] as IXMLGoodsMeasureTariffQuantityType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TypeCode', TXMLProductCharacteristicsTypeCodeType_ds);
  RegisterChildNode('Description', TXMLProductCharacteristicsDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Get_TypeCode: IXMLProductCharacteristicsTypeCodeType_ds;
begin
  Result := ChildNodes['TypeCode'] as IXMLProductCharacteristicsTypeCodeType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Get_Description: IXMLProductCharacteristicsDescriptionTextType_ds;
begin
  Result := ChildNodes['Description'] as IXMLProductCharacteristicsDescriptionTextType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

{ TXMLProductCharacteristicsTypeCodeType_ds }

function TXMLProductCharacteristicsTypeCodeType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLProductCharacteristicsTypeCodeType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLProductCharacteristicsDescriptionTextType_ds }

function TXMLProductCharacteristicsDescriptionTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLProductCharacteristicsDescriptionTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.AfterConstruction;
begin
  RegisterChildNode('QuantityQuantity', TXMLProductCriteriaConformanceQuantityQuantityType_ds);
  RegisterChildNode('Description', TXMLProductCriteriaConformanceDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Get_QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLProductCriteriaConformanceQuantityQuantityType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Get_Description: IXMLProductCriteriaConformanceDescriptionTextType_ds;
begin
  Result := ChildNodes['Description'] as IXMLProductCriteriaConformanceDescriptionTextType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
end;

{ TXMLProductCriteriaConformanceQuantityQuantityType_ds }

{ TXMLProductCriteriaConformanceDescriptionTextType_ds }

function TXMLProductCriteriaConformanceDescriptionTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLProductCriteriaConformanceDescriptionTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('NetNetWeightMeasure', TXMLGoodsMeasureNetNetWeightMeasureType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure.Get_NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds;
begin
  Result := ChildNodes['NetNetWeightMeasure'] as IXMLGoodsMeasureNetNetWeightMeasureType_ds;
end;

{ TXMLGoodsMeasureNetNetWeightMeasureType_ds }

function TXMLGoodsMeasureNetNetWeightMeasureType_ds.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLGoodsMeasureNetNetWeightMeasureType_ds.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.AfterConstruction;
begin
  RegisterChildNode('CurrentCode', TXMLGovernmentProcedureCurrentCodeType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
begin
  Result := ChildNodes['CurrentCode'] as IXMLGovernmentProcedureCurrentCodeType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

{ TXMLGovernmentProcedureCurrentCodeType_ds }

function TXMLGovernmentProcedureCurrentCodeType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLGovernmentProcedureCurrentCodeType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLPreviousDocumentIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLPreviousDocumentIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList.Add: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

{ TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Get_AdditionCode: UnicodeString;
begin
  Result := ChildNodes['AdditionCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Set_AdditionCode(Value: UnicodeString);
begin
  ChildNodes['AdditionCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Get_PercentageNumeric: UnicodeString;
begin
  Result := ChildNodes['PercentageNumeric'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Set_PercentageNumeric(Value: UnicodeString);
begin
  ChildNodes['PercentageNumeric'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice }

procedure TXMLDeclarationNFe_GoodsShipment_Invoice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLInvoiceIdentificationIDType_ds);
  RegisterChildNode('Submitter', TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter);
  RegisterChildNode('ReferencedInvoice', TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice);
  FReferencedInvoice := CreateCollection(TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList, IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice, 'ReferencedInvoice') as IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList;
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice.Get_ID: IXMLInvoiceIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLInvoiceIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_Invoice.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice.Get_Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter;
begin
  Result := ChildNodes['Submitter'] as IXMLDeclarationNFe_GoodsShipment_Invoice_Submitter;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice.Get_ReferencedInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList;
begin
  Result := FReferencedInvoice;
end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter }

procedure TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLSubmitterIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_Submitter.Get_ID: IXMLSubmitterIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLSubmitterIdentificationIDType_ds;
end;

{ TXMLSubmitterIdentificationIDType_ds }

function TXMLSubmitterIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLSubmitterIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice }

procedure TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLReferencedInvoiceIdentificationIDType_ds);
  RegisterChildNode('Submitter', TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Get_ID: IXMLReferencedInvoiceIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLReferencedInvoiceIdentificationIDType_ds;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice.Get_Submitter: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
begin
  Result := ChildNodes['Submitter'] as IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter;
end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList }

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList.Add: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
begin
  Result := AddItem(-1) as IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList.Insert(const Index: Integer): IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
begin
  Result := AddItem(Index) as IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoiceList.Get_Item(Index: Integer): IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
begin
  Result := List[Index] as IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
end;

{ TXMLReferencedInvoiceIdentificationIDType_ds }

function TXMLReferencedInvoiceIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLReferencedInvoiceIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter }

procedure TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLSubmitterIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice_Submitter.Get_ID: IXMLSubmitterIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLSubmitterIdentificationIDType_ds;
end;

{ TXMLDeclarationNFe_GoodsShipment_TradeTerms }

function TXMLDeclarationNFe_GoodsShipment_TradeTerms.Get_ConditionCode: UnicodeString;
begin
  Result := ChildNodes['ConditionCode'].Text;
end;

procedure TXMLDeclarationNFe_GoodsShipment_TradeTerms.Set_ConditionCode(Value: UnicodeString);
begin
  ChildNodes['ConditionCode'].NodeValue := Value;
end;

{ TXMLDeclarationNFe_UCR }

procedure TXMLDeclarationNFe_UCR.AfterConstruction;
begin
  RegisterChildNode('TraderAssignedReferenceID', TXMLUCRTraderAssignedReferenceIDType_ds);
  inherited;
end;

function TXMLDeclarationNFe_UCR.Get_TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds;
begin
  Result := ChildNodes['TraderAssignedReferenceID'] as IXMLUCRTraderAssignedReferenceIDType_ds;
end;

{ TXMLUCRTraderAssignedReferenceIDType_ds }

function TXMLUCRTraderAssignedReferenceIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLUCRTraderAssignedReferenceIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNoNF }

procedure TXMLDeclarationNoNF.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclarationIdentificationIDType_ds);
  RegisterChildNode('DeclarationOffice', TXMLDeclarationNoNF_DeclarationOffice);
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNoNF_AdditionalInformation);
  RegisterChildNode('CurrencyExchange', TXMLDeclarationNoNF_CurrencyExchange);
  RegisterChildNode('Declarant', TXMLDeclarationNoNF_Declarant);
  RegisterChildNode('ExitOffice', TXMLDeclarationNoNF_ExitOffice);
  RegisterChildNode('GoodsShipment', TXMLDeclarationNoNF_GoodsShipment);
  RegisterChildNode('UCR', TXMLDeclarationNoNF_UCR);
  FAdditionalInformation := CreateCollection(TXMLDeclarationNoNF_AdditionalInformationList, IXMLDeclarationNoNF_AdditionalInformation, 'AdditionalInformation') as IXMLDeclarationNoNF_AdditionalInformationList;
  FGoodsShipment := CreateCollection(TXMLDeclarationNoNF_GoodsShipmentList, IXMLDeclarationNoNF_GoodsShipment, 'GoodsShipment') as IXMLDeclarationNoNF_GoodsShipmentList;
  inherited;
end;

function TXMLDeclarationNoNF.Get_ID: IXMLDeclarationIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLDeclarationIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF.Get_DeclarationOffice: IXMLDeclarationNoNF_DeclarationOffice;
begin
  Result := ChildNodes['DeclarationOffice'] as IXMLDeclarationNoNF_DeclarationOffice;
end;

function TXMLDeclarationNoNF.Get_AdditionalInformation: IXMLDeclarationNoNF_AdditionalInformationList;
begin
  Result := FAdditionalInformation;
end;

function TXMLDeclarationNoNF.Get_CurrencyExchange: IXMLDeclarationNoNF_CurrencyExchange;
begin
  Result := ChildNodes['CurrencyExchange'] as IXMLDeclarationNoNF_CurrencyExchange;
end;

function TXMLDeclarationNoNF.Get_Declarant: IXMLDeclarationNoNF_Declarant;
begin
  Result := ChildNodes['Declarant'] as IXMLDeclarationNoNF_Declarant;
end;

function TXMLDeclarationNoNF.Get_ExitOffice: IXMLDeclarationNoNF_ExitOffice;
begin
  Result := ChildNodes['ExitOffice'] as IXMLDeclarationNoNF_ExitOffice;
end;

function TXMLDeclarationNoNF.Get_GoodsShipment: IXMLDeclarationNoNF_GoodsShipmentList;
begin
  Result := FGoodsShipment;
end;

function TXMLDeclarationNoNF.Get_UCR: IXMLDeclarationNoNF_UCR;
begin
  Result := ChildNodes['UCR'] as IXMLDeclarationNoNF_UCR;
end;

{ TXMLDeclarationNoNF_DeclarationOffice }

procedure TXMLDeclarationNoNF_DeclarationOffice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclarationOfficeIdentificationCodeType_ds);
  RegisterChildNode('Warehouse', TXMLDeclarationNoNF_DeclarationOffice_Warehouse);
  inherited;
end;

function TXMLDeclarationNoNF_DeclarationOffice.Get_ID: IXMLDeclarationOfficeIdentificationCodeType_ds;
begin
  Result := ChildNodes['ID'] as IXMLDeclarationOfficeIdentificationCodeType_ds;
end;

function TXMLDeclarationNoNF_DeclarationOffice.Get_Warehouse: IXMLDeclarationNoNF_DeclarationOffice_Warehouse;
begin
  Result := ChildNodes['Warehouse'] as IXMLDeclarationNoNF_DeclarationOffice_Warehouse;
end;

{ TXMLDeclarationNoNF_DeclarationOffice_Warehouse }

procedure TXMLDeclarationNoNF_DeclarationOffice_Warehouse.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLWarehouseIdentificationIDType_ds);
  RegisterChildNode('LatitudeMeasure', TXMLWarehouseLatitudeMeasureType_ds);
  RegisterChildNode('LongitudeMeasure', TXMLWarehouseLongitudeMeasureType_ds);
  RegisterChildNode('Address', TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address);
  inherited;
end;

function TXMLDeclarationNoNF_DeclarationOffice_Warehouse.Get_ID: IXMLWarehouseIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLWarehouseIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_DeclarationOffice_Warehouse.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_DeclarationOffice_Warehouse.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_DeclarationOffice_Warehouse.Get_LatitudeMeasure: IXMLWarehouseLatitudeMeasureType_ds;
begin
  Result := ChildNodes['LatitudeMeasure'] as IXMLWarehouseLatitudeMeasureType_ds;
end;

function TXMLDeclarationNoNF_DeclarationOffice_Warehouse.Get_LongitudeMeasure: IXMLWarehouseLongitudeMeasureType_ds;
begin
  Result := ChildNodes['LongitudeMeasure'] as IXMLWarehouseLongitudeMeasureType_ds;
end;

function TXMLDeclarationNoNF_DeclarationOffice_Warehouse.Get_Address: IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address;
begin
  Result := ChildNodes['Address'] as IXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address;
end;

{ TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address }

procedure TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address.AfterConstruction;
begin
  RegisterChildNode('Line', TXMLAddressLineTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_DeclarationOffice_Warehouse_Address.Get_Line: IXMLAddressLineTextType_ds;
begin
  Result := ChildNodes['Line'] as IXMLAddressLineTextType_ds;
end;

{ TXMLDeclarationNoNF_AdditionalInformation }

procedure TXMLDeclarationNoNF_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLAdditionalInformationStatementDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNoNF_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_AdditionalInformation.Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
begin
  Result := ChildNodes['StatementDescription'] as IXMLAdditionalInformationStatementDescriptionTextType_ds;
end;

function TXMLDeclarationNoNF_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_AdditionalInformationList }

function TXMLDeclarationNoNF_AdditionalInformationList.Add: IXMLDeclarationNoNF_AdditionalInformation;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_AdditionalInformation;
end;

function TXMLDeclarationNoNF_AdditionalInformationList.Insert(const Index: Integer): IXMLDeclarationNoNF_AdditionalInformation;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_AdditionalInformation;
end;

function TXMLDeclarationNoNF_AdditionalInformationList.Get_Item(Index: Integer): IXMLDeclarationNoNF_AdditionalInformation;
begin
  Result := List[Index] as IXMLDeclarationNoNF_AdditionalInformation;
end;

{ TXMLDeclarationNoNF_CurrencyExchange }

function TXMLDeclarationNoNF_CurrencyExchange.Get_CurrencyTypeCode: UnicodeString;
begin
  Result := ChildNodes['CurrencyTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_CurrencyExchange.Set_CurrencyTypeCode(Value: UnicodeString);
begin
  ChildNodes['CurrencyTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_Declarant }

procedure TXMLDeclarationNoNF_Declarant.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLDeclarantIdentificationIDType_ds);
  RegisterChildNode('Contact', TXMLDeclarationNoNF_Declarant_Contact);
  inherited;
end;

function TXMLDeclarationNoNF_Declarant.Get_ID: IXMLDeclarantIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLDeclarantIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_Declarant.Get_Contact: IXMLDeclarationNoNF_Declarant_Contact;
begin
  Result := ChildNodes['Contact'] as IXMLDeclarationNoNF_Declarant_Contact;
end;

{ TXMLDeclarationNoNF_Declarant_Contact }

procedure TXMLDeclarationNoNF_Declarant_Contact.AfterConstruction;
begin
  RegisterChildNode('Name', TXMLContactNameTextType_ds);
  RegisterChildNode('Communication', TXMLDeclarationNoNF_Declarant_Contact_Communication);
  FCommunication := CreateCollection(TXMLDeclarationNoNF_Declarant_Contact_CommunicationList, IXMLDeclarationNoNF_Declarant_Contact_Communication, 'Communication') as IXMLDeclarationNoNF_Declarant_Contact_CommunicationList;
  inherited;
end;

function TXMLDeclarationNoNF_Declarant_Contact.Get_Name: IXMLContactNameTextType_ds;
begin
  Result := ChildNodes['Name'] as IXMLContactNameTextType_ds;
end;

function TXMLDeclarationNoNF_Declarant_Contact.Get_Communication: IXMLDeclarationNoNF_Declarant_Contact_CommunicationList;
begin
  Result := FCommunication;
end;

{ TXMLDeclarationNoNF_Declarant_Contact_Communication }

procedure TXMLDeclarationNoNF_Declarant_Contact_Communication.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLCommunicationIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_Declarant_Contact_Communication.Get_ID: IXMLCommunicationIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLCommunicationIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_Declarant_Contact_Communication.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_Declarant_Contact_Communication.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_Declarant_Contact_CommunicationList }

function TXMLDeclarationNoNF_Declarant_Contact_CommunicationList.Add: IXMLDeclarationNoNF_Declarant_Contact_Communication;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_Declarant_Contact_Communication;
end;

function TXMLDeclarationNoNF_Declarant_Contact_CommunicationList.Insert(const Index: Integer): IXMLDeclarationNoNF_Declarant_Contact_Communication;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_Declarant_Contact_Communication;
end;

function TXMLDeclarationNoNF_Declarant_Contact_CommunicationList.Get_Item(Index: Integer): IXMLDeclarationNoNF_Declarant_Contact_Communication;
begin
  Result := List[Index] as IXMLDeclarationNoNF_Declarant_Contact_Communication;
end;

{ TXMLDeclarationNoNF_ExitOffice }

procedure TXMLDeclarationNoNF_ExitOffice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLExitOfficeIdentificationCodeType_ds);
  RegisterChildNode('Warehouse', TXMLDeclarationNoNF_ExitOffice_Warehouse);
  inherited;
end;

function TXMLDeclarationNoNF_ExitOffice.Get_ID: IXMLExitOfficeIdentificationCodeType_ds;
begin
  Result := ChildNodes['ID'] as IXMLExitOfficeIdentificationCodeType_ds;
end;

function TXMLDeclarationNoNF_ExitOffice.Get_Warehouse: IXMLDeclarationNoNF_ExitOffice_Warehouse;
begin
  Result := ChildNodes['Warehouse'] as IXMLDeclarationNoNF_ExitOffice_Warehouse;
end;

{ TXMLDeclarationNoNF_ExitOffice_Warehouse }

procedure TXMLDeclarationNoNF_ExitOffice_Warehouse.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLWarehouseIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_ExitOffice_Warehouse.Get_ID: IXMLWarehouseIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLWarehouseIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_ExitOffice_Warehouse.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_ExitOffice_Warehouse.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_GoodsShipment }

procedure TXMLDeclarationNoNF_GoodsShipment.AfterConstruction;
begin
  RegisterChildNode('Exporter', TXMLDeclarationNoNF_GoodsShipment_Exporter);
  RegisterChildNode('GovernmentAgencyGoodsItem', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem);
  RegisterChildNode('Importer', TXMLDeclarationNoNF_GoodsShipment_Importer);
  RegisterChildNode('Invoice', TXMLDeclarationNoNF_GoodsShipment_Invoice);
  RegisterChildNode('TradeTerms', TXMLDeclarationNoNF_GoodsShipment_TradeTerms);
  FGovernmentAgencyGoodsItem := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem, 'GovernmentAgencyGoodsItem') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList;
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment.Get_Exporter: IXMLDeclarationNoNF_GoodsShipment_Exporter;
begin
  Result := ChildNodes['Exporter'] as IXMLDeclarationNoNF_GoodsShipment_Exporter;
end;

function TXMLDeclarationNoNF_GoodsShipment.Get_GovernmentAgencyGoodsItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList;
begin
  Result := FGovernmentAgencyGoodsItem;
end;

function TXMLDeclarationNoNF_GoodsShipment.Get_Importer: IXMLDeclarationNoNF_GoodsShipment_Importer;
begin
  Result := ChildNodes['Importer'] as IXMLDeclarationNoNF_GoodsShipment_Importer;
end;

function TXMLDeclarationNoNF_GoodsShipment.Get_Invoice: IXMLDeclarationNoNF_GoodsShipment_Invoice;
begin
  Result := ChildNodes['Invoice'] as IXMLDeclarationNoNF_GoodsShipment_Invoice;
end;

function TXMLDeclarationNoNF_GoodsShipment.Get_TradeTerms: IXMLDeclarationNoNF_GoodsShipment_TradeTerms;
begin
  Result := ChildNodes['TradeTerms'] as IXMLDeclarationNoNF_GoodsShipment_TradeTerms;
end;

{ TXMLDeclarationNoNF_GoodsShipmentList }

function TXMLDeclarationNoNF_GoodsShipmentList.Add: IXMLDeclarationNoNF_GoodsShipment;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment;
end;

function TXMLDeclarationNoNF_GoodsShipmentList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment;
end;

function TXMLDeclarationNoNF_GoodsShipmentList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment;
end;

{ TXMLDeclarationNoNF_GoodsShipment_Exporter }

procedure TXMLDeclarationNoNF_GoodsShipment_Exporter.AfterConstruction;
begin
  RegisterChildNode('Name', TXMLExporterNameTextType_ds);
  RegisterChildNode('ID', TXMLExporterIdentificationIDType_ds);
  RegisterChildNode('Address', TXMLDeclarationNoNF_GoodsShipment_Exporter_Address);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_Exporter.Get_Name: IXMLExporterNameTextType_ds;
begin
  Result := ChildNodes['Name'] as IXMLExporterNameTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_Exporter.Get_ID: IXMLExporterIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLExporterIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_Exporter.Get_Address: IXMLDeclarationNoNF_GoodsShipment_Exporter_Address;
begin
  Result := ChildNodes['Address'] as IXMLDeclarationNoNF_GoodsShipment_Exporter_Address;
end;

{ TXMLExporterNameTextType_ds }

function TXMLExporterNameTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLExporterNameTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLExporterIdentificationIDType_ds }

function TXMLExporterIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLExporterIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNoNF_GoodsShipment_Exporter_Address }

procedure TXMLDeclarationNoNF_GoodsShipment_Exporter_Address.AfterConstruction;
begin
  RegisterChildNode('Line', TXMLAddressLineTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_Exporter_Address.Get_CountryCode: UnicodeString;
begin
  Result := ChildNodes['CountryCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_Exporter_Address.Set_CountryCode(Value: UnicodeString);
begin
  ChildNodes['CountryCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_Exporter_Address.Get_CountrySubDivisionCode: UnicodeString;
begin
  Result := ChildNodes['CountrySubDivisionCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_Exporter_Address.Set_CountrySubDivisionCode(Value: UnicodeString);
begin
  ChildNodes['CountrySubDivisionCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_Exporter_Address.Get_Line: IXMLAddressLineTextType_ds;
begin
  Result := ChildNodes['Line'] as IXMLAddressLineTextType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.AfterConstruction;
begin
  RegisterChildNode('CustomsValueAmount', TXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds);
  RegisterChildNode('FinancedValueAmount', TXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds);
  RegisterChildNode('Destination', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination);
  RegisterChildNode('AdditionalDocument', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument);
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation);
  RegisterChildNode('Commodity', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity);
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure);
  RegisterChildNode('GovernmentProcedure', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure);
  RegisterChildNode('PreviousDocument', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument);
  RegisterChildNode('ValuationAdjustment', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment);
  FDestination := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination, 'Destination') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
  FAdditionalDocument := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument, 'AdditionalDocument') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
  FAdditionalInformation := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation, 'AdditionalInformation') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
  FGovernmentProcedure := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure, 'GovernmentProcedure') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
  FPreviousDocument := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument, 'PreviousDocument') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_CustomsValueAmount: IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
begin
  Result := ChildNodes['CustomsValueAmount'] as IXMLGovernmentAgencyGoodsItemCustomsValueAmountType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_FinancedValueAmount: IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
begin
  Result := ChildNodes['FinancedValueAmount'] as IXMLGovernmentAgencyGoodsItemFinancedValueAmountType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_SequenceNumeric: UnicodeString;
begin
  Result := ChildNodes['SequenceNumeric'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Set_SequenceNumeric(Value: UnicodeString);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_Destination: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList;
begin
  Result := FDestination;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
begin
  Result := FAdditionalDocument;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList;
begin
  Result := FAdditionalInformation;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_Commodity: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
begin
  Result := ChildNodes['Commodity'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_GovernmentProcedure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
begin
  Result := FGovernmentProcedure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_PreviousDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList;
begin
  Result := FPreviousDocument;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem.Get_ValuationAdjustment: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
begin
  Result := ChildNodes['ValuationAdjustment'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItemList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination.AfterConstruction;
begin
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Get_CountryCode: UnicodeString;
begin
  Result := ChildNodes['CountryCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Set_CountryCode(Value: UnicodeString);
begin
  ChildNodes['CountryCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination.Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
begin
  Result := ChildNodes['GoodsMeasure'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_DestinationList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('TariffQuantity', TXMLGoodsMeasureTariffQuantityType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination_GoodsMeasure.Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
begin
  Result := ChildNodes['TariffQuantity'] as IXMLGoodsMeasureTariffQuantityType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLAdditionalDocumentIdentificationIDType_ds);
  RegisterChildNode('ItemID', TXMLAdditionalDocumentItemIDType_ds);
  RegisterChildNode('QuantityQuantity', TXMLAdditionalDocumentQuantityQuantityType_ds);
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_CategoryCode: UnicodeString;
begin
  Result := ChildNodes['CategoryCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Set_CategoryCode(Value: UnicodeString);
begin
  ChildNodes['CategoryCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLAdditionalDocumentIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
begin
  Result := ChildNodes['ItemID'] as IXMLAdditionalDocumentItemIDType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLAdditionalDocumentQuantityQuantityType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
begin
  Result := ChildNodes['AdditionalInformation'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLAdditionalInformationStatementDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
begin
  Result := ChildNodes['StatementDescription'] as IXMLAdditionalInformationStatementDescriptionTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.AfterConstruction;
begin
  RegisterChildNode('StatementDescription', TXMLAdditionalInformationStatementDescriptionTextType_ds);
  RegisterChildNode('LimitDateTime', TXMLAdditionalInformationLimitDateTimeType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementDescription: IXMLAdditionalInformationStatementDescriptionTextType_ds;
begin
  Result := ChildNodes['StatementDescription'] as IXMLAdditionalInformationStatementDescriptionTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_LimitDateTime: IXMLAdditionalInformationLimitDateTimeType_ds;
begin
  Result := ChildNodes['LimitDateTime'] as IXMLAdditionalInformationLimitDateTimeType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformationList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.AfterConstruction;
begin
  RegisterChildNode('Description', TXMLCommodityDescriptionTextType_ds);
  RegisterChildNode('ValueAmount', TXMLCommodityValueAmountType_ds);
  RegisterChildNode('CommercialDescription', TXMLCommodityCommercialDescriptionTextType_ds);
  RegisterChildNode('Classification', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification);
  RegisterChildNode('GoodsMeasure', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure);
  RegisterChildNode('Product', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product);
  RegisterChildNode('ProductCharacteristics', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics);
  RegisterChildNode('ProductCriteriaConformance', TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance);
  FGoodsMeasure := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure, 'GoodsMeasure') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
  FProductCharacteristics := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics, 'ProductCharacteristics') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
  FProductCriteriaConformance := CreateCollection(TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList, IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance, 'ProductCriteriaConformance') as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_Description: IXMLCommodityDescriptionTextType_ds;
begin
  Result := ChildNodes['Description'] as IXMLCommodityDescriptionTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ValueAmount: IXMLCommodityValueAmountType_ds;
begin
  Result := ChildNodes['ValueAmount'] as IXMLCommodityValueAmountType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_CommercialDescription: IXMLCommodityCommercialDescriptionTextType_ds;
begin
  Result := ChildNodes['CommercialDescription'] as IXMLCommodityCommercialDescriptionTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_Classification: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification;
begin
  Result := ChildNodes['Classification'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_GoodsMeasure: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList;
begin
  Result := FGoodsMeasure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_Product: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product;
begin
  Result := ChildNodes['Product'] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ProductCharacteristics: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList;
begin
  Result := FProductCharacteristics;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity.Get_ProductCriteriaConformance: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList;
begin
  Result := FProductCriteriaConformance;
end;

{ TXMLCommodityCommercialDescriptionTextType_ds }

function TXMLCommodityCommercialDescriptionTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLCommodityCommercialDescriptionTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLClassificationIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification.Get_ID: IXMLClassificationIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLClassificationIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification.Get_IdentificationTypeCode: UnicodeString;
begin
  Result := ChildNodes['IdentificationTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Classification.Set_IdentificationTypeCode(Value: UnicodeString);
begin
  ChildNodes['IdentificationTypeCode'].NodeValue := Value;
end;

{ TXMLClassificationIdentificationIDType_ds }

function TXMLClassificationIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLClassificationIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('UnitDescription', TXMLGoodsMeasureUnitDescriptionTextType_ds);
  RegisterChildNode('TariffQuantity', TXMLGoodsMeasureTariffQuantityType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Get_UnitDescription: IXMLGoodsMeasureUnitDescriptionTextType_ds;
begin
  Result := ChildNodes['UnitDescription'] as IXMLGoodsMeasureUnitDescriptionTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure.Get_TariffQuantity: IXMLGoodsMeasureTariffQuantityType_ds;
begin
  Result := ChildNodes['TariffQuantity'] as IXMLGoodsMeasureTariffQuantityType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasureList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
end;

{ TXMLGoodsMeasureUnitDescriptionTextType_ds }

function TXMLGoodsMeasureUnitDescriptionTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLGoodsMeasureUnitDescriptionTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLProductIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product.Get_ID: IXMLProductIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLProductIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product.Get_IdentifierTypeCode: UnicodeString;
begin
  Result := ChildNodes['IdentifierTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_Product.Set_IdentifierTypeCode(Value: UnicodeString);
begin
  ChildNodes['IdentifierTypeCode'].NodeValue := Value;
end;

{ TXMLProductIdentificationIDType_ds }

function TXMLProductIdentificationIDType_ds.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLProductIdentificationIDType_ds.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TypeCode', TXMLProductCharacteristicsTypeCodeType_ds);
  RegisterChildNode('Description', TXMLProductCharacteristicsDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Get_TypeCode: IXMLProductCharacteristicsTypeCodeType_ds;
begin
  Result := ChildNodes['TypeCode'] as IXMLProductCharacteristicsTypeCodeType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics.Get_Description: IXMLProductCharacteristicsDescriptionTextType_ds;
begin
  Result := ChildNodes['Description'] as IXMLProductCharacteristicsDescriptionTextType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristicsList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.AfterConstruction;
begin
  RegisterChildNode('QuantityQuantity', TXMLProductCriteriaConformanceQuantityQuantityType_ds);
  RegisterChildNode('Description', TXMLProductCriteriaConformanceDescriptionTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Get_QuantityQuantity: IXMLProductCriteriaConformanceQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLProductCriteriaConformanceQuantityQuantityType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance.Get_Description: IXMLProductCriteriaConformanceDescriptionTextType_ds;
begin
  Result := ChildNodes['Description'] as IXMLProductCriteriaConformanceDescriptionTextType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformanceList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCriteriaConformance;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure.AfterConstruction;
begin
  RegisterChildNode('NetNetWeightMeasure', TXMLGoodsMeasureNetNetWeightMeasureType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GoodsMeasure.Get_NetNetWeightMeasure: IXMLGoodsMeasureNetNetWeightMeasureType_ds;
begin
  Result := ChildNodes['NetNetWeightMeasure'] as IXMLGoodsMeasureNetNetWeightMeasureType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.AfterConstruction;
begin
  RegisterChildNode('CurrentCode', TXMLGovernmentProcedureCurrentCodeType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
begin
  Result := ChildNodes['CurrentCode'] as IXMLGovernmentProcedureCurrentCodeType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument }

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLPreviousDocumentIdentificationIDType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Get_ID: IXMLPreviousDocumentIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLPreviousDocumentIdentificationIDType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList.Add: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := AddItem(-1) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList.Insert(const Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := AddItem(Index) as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocumentList.Get_Item(Index: Integer): IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
begin
  Result := List[Index] as IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
end;

{ TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment }

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Get_AdditionCode: UnicodeString;
begin
  Result := ChildNodes['AdditionCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Set_AdditionCode(Value: UnicodeString);
begin
  ChildNodes['AdditionCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Get_PercentageNumeric: UnicodeString;
begin
  Result := ChildNodes['PercentageNumeric'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_ValuationAdjustment.Set_PercentageNumeric(Value: UnicodeString);
begin
  ChildNodes['PercentageNumeric'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_GoodsShipment_Importer }

procedure TXMLDeclarationNoNF_GoodsShipment_Importer.AfterConstruction;
begin
  RegisterChildNode('Name', TXMLImporterNameTextType_ds);
  RegisterChildNode('Address', TXMLDeclarationNoNF_GoodsShipment_Importer_Address);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_Importer.Get_Name: IXMLImporterNameTextType_ds;
begin
  Result := ChildNodes['Name'] as IXMLImporterNameTextType_ds;
end;

function TXMLDeclarationNoNF_GoodsShipment_Importer.Get_Address: IXMLDeclarationNoNF_GoodsShipment_Importer_Address;
begin
  Result := ChildNodes['Address'] as IXMLDeclarationNoNF_GoodsShipment_Importer_Address;
end;

{ TXMLImporterNameTextType_ds }

function TXMLImporterNameTextType_ds.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLImporterNameTextType_ds.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLDeclarationNoNF_GoodsShipment_Importer_Address }

procedure TXMLDeclarationNoNF_GoodsShipment_Importer_Address.AfterConstruction;
begin
  RegisterChildNode('Line', TXMLAddressLineTextType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_Importer_Address.Get_CountryCode: UnicodeString;
begin
  Result := ChildNodes['CountryCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_Importer_Address.Set_CountryCode(Value: UnicodeString);
begin
  ChildNodes['CountryCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_Importer_Address.Get_Line: IXMLAddressLineTextType_ds;
begin
  Result := ChildNodes['Line'] as IXMLAddressLineTextType_ds;
end;

{ TXMLDeclarationNoNF_GoodsShipment_Invoice }

procedure TXMLDeclarationNoNF_GoodsShipment_Invoice.AfterConstruction;
begin
  RegisterChildNode('AdditionalInformation', TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation);
  inherited;
end;

function TXMLDeclarationNoNF_GoodsShipment_Invoice.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_Invoice.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_Invoice.Get_AdditionalInformation: IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation;
begin
  Result := ChildNodes['AdditionalInformation'] as IXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation;
end;

{ TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation }

function TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation.Get_StatementCode: UnicodeString;
begin
  Result := ChildNodes['StatementCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation.Set_StatementCode(Value: UnicodeString);
begin
  ChildNodes['StatementCode'].NodeValue := Value;
end;

function TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation.Get_StatementTypeCode: UnicodeString;
begin
  Result := ChildNodes['StatementTypeCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_Invoice_AdditionalInformation.Set_StatementTypeCode(Value: UnicodeString);
begin
  ChildNodes['StatementTypeCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_GoodsShipment_TradeTerms }

function TXMLDeclarationNoNF_GoodsShipment_TradeTerms.Get_ConditionCode: UnicodeString;
begin
  Result := ChildNodes['ConditionCode'].Text;
end;

procedure TXMLDeclarationNoNF_GoodsShipment_TradeTerms.Set_ConditionCode(Value: UnicodeString);
begin
  ChildNodes['ConditionCode'].NodeValue := Value;
end;

{ TXMLDeclarationNoNF_UCR }

procedure TXMLDeclarationNoNF_UCR.AfterConstruction;
begin
  RegisterChildNode('TraderAssignedReferenceID', TXMLUCRTraderAssignedReferenceIDType_ds);
  inherited;
end;

function TXMLDeclarationNoNF_UCR.Get_TraderAssignedReferenceID: IXMLUCRTraderAssignedReferenceIDType_ds;
begin
  Result := ChildNodes['TraderAssignedReferenceID'] as IXMLUCRTraderAssignedReferenceIDType_ds;
end;

{ TXMLDeclarationDrawbackIsencao }

procedure TXMLDeclarationDrawbackIsencao.AfterConstruction;
begin
  RegisterChildNode('GoodsShipment', TXMLDeclarationDrawbackIsencao_GoodsShipment);
  ItemTag := 'GoodsShipment';
  ItemInterface := IXMLDeclarationDrawbackIsencao_GoodsShipment;
  inherited;
end;

function TXMLDeclarationDrawbackIsencao.Get_GoodsShipment(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment;
begin
  Result := List[Index] as IXMLDeclarationDrawbackIsencao_GoodsShipment;
end;

function TXMLDeclarationDrawbackIsencao.Add: IXMLDeclarationDrawbackIsencao_GoodsShipment;
begin
  Result := AddItem(-1) as IXMLDeclarationDrawbackIsencao_GoodsShipment;
end;

function TXMLDeclarationDrawbackIsencao.Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment;
begin
  Result := AddItem(Index) as IXMLDeclarationDrawbackIsencao_GoodsShipment;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment }

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment.AfterConstruction;
begin
  RegisterChildNode('GovernmentAgencyGoodsItem', TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem);
  ItemTag := 'GovernmentAgencyGoodsItem';
  ItemInterface := IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
  inherited;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment.Get_GovernmentAgencyGoodsItem(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := List[Index] as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment.Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(-1) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment.Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
begin
  Result := AddItem(Index) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem }

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem.AfterConstruction;
begin
  RegisterChildNode('AdditionalDocument', TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument);
  RegisterChildNode('GovernmentProcedure', TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure);
  FAdditionalDocument := CreateCollection(TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument, 'AdditionalDocument') as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
  FGovernmentProcedure := CreateCollection(TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure, 'GovernmentProcedure') as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
  inherited;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem.Get_SequenceNumeric: UnicodeString;
begin
  Result := ChildNodes['SequenceNumeric'].Text;
end;

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem.Set_SequenceNumeric(Value: UnicodeString);
begin
  ChildNodes['SequenceNumeric'].NodeValue := Value;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem.Get_AdditionalDocument: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList;
begin
  Result := FAdditionalDocument;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem.Get_GovernmentProcedure: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList;
begin
  Result := FGovernmentProcedure;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument }

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLAdditionalDocumentIdentificationIDType_ds);
  RegisterChildNode('DrawbackHsClassification', TXMLAdditionalDocumentDrawbackHsClassificationTextType_ds);
  RegisterChildNode('DrawbackRecipientId', TXMLAdditionalDocumentDrawbackRecipientIdTextType_ds);
  RegisterChildNode('ValueWithExchangeCoverAmount', TXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds);
  RegisterChildNode('ItemID', TXMLAdditionalDocumentItemIDType_ds);
  RegisterChildNode('QuantityQuantity', TXMLAdditionalDocumentQuantityQuantityType_ds);
  RegisterChildNode('Invoice', TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice);
  FInvoice := CreateCollection(TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList, IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice, 'Invoice') as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
  inherited;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_CategoryCode: UnicodeString;
begin
  Result := ChildNodes['CategoryCode'].Text;
end;

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Set_CategoryCode(Value: UnicodeString);
begin
  ChildNodes['CategoryCode'].NodeValue := Value;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ID: IXMLAdditionalDocumentIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLAdditionalDocumentIdentificationIDType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_DrawbackHsClassification: IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
begin
  Result := ChildNodes['DrawbackHsClassification'] as IXMLAdditionalDocumentDrawbackHsClassificationTextType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_DrawbackRecipientId: IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
begin
  Result := ChildNodes['DrawbackRecipientId'] as IXMLAdditionalDocumentDrawbackRecipientIdTextType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ValueWithExchangeCoverAmount: IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
begin
  Result := ChildNodes['ValueWithExchangeCoverAmount'] as IXMLAdditionalDocumentValueWithExchangeCoverAmountType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_ItemID: IXMLAdditionalDocumentItemIDType_ds;
begin
  Result := ChildNodes['ItemID'] as IXMLAdditionalDocumentItemIDType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_QuantityQuantity: IXMLAdditionalDocumentQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLAdditionalDocumentQuantityQuantityType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument.Get_Invoice: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList;
begin
  Result := FInvoice;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList }

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := AddItem(-1) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := AddItem(Index) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocumentList.Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
begin
  Result := List[Index] as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice }

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.AfterConstruction;
begin
  RegisterChildNode('ID', TXMLInvoiceIdentificationIDType_ds);
  RegisterChildNode('IssueDateTime', TXMLInvoiceIssueDateTimeType_ds);
  RegisterChildNode('CustomsValueAmount', TXMLInvoiceCustomsValueAmountType_ds);
  RegisterChildNode('QuantityQuantity', TXMLInvoiceQuantityQuantityType_ds);
  inherited;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_ID: IXMLInvoiceIdentificationIDType_ds;
begin
  Result := ChildNodes['ID'] as IXMLInvoiceIdentificationIDType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_IssueDateTime: IXMLInvoiceIssueDateTimeType_ds;
begin
  Result := ChildNodes['IssueDateTime'] as IXMLInvoiceIssueDateTimeType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_TypeCode: UnicodeString;
begin
  Result := ChildNodes['TypeCode'].Text;
end;

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Set_TypeCode(Value: UnicodeString);
begin
  ChildNodes['TypeCode'].NodeValue := Value;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_CustomsValueAmount: IXMLInvoiceCustomsValueAmountType_ds;
begin
  Result := ChildNodes['CustomsValueAmount'] as IXMLInvoiceCustomsValueAmountType_ds;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice.Get_QuantityQuantity: IXMLInvoiceQuantityQuantityType_ds;
begin
  Result := ChildNodes['QuantityQuantity'] as IXMLInvoiceQuantityQuantityType_ds;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList }

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList.Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
begin
  Result := AddItem(-1) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList.Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
begin
  Result := AddItem(Index) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_InvoiceList.Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
begin
  Result := List[Index] as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure }

procedure TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.AfterConstruction;
begin
  RegisterChildNode('CurrentCode', TXMLGovernmentProcedureCurrentCodeType_ds);
  inherited;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure.Get_CurrentCode: IXMLGovernmentProcedureCurrentCodeType_ds;
begin
  Result := ChildNodes['CurrentCode'] as IXMLGovernmentProcedureCurrentCodeType_ds;
end;

{ TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList }

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Add: IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := AddItem(-1) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Insert(const Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := AddItem(Index) as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

function TXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedureList.Get_Item(Index: Integer): IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
begin
  Result := List[Index] as IXMLDeclarationDrawbackIsencao_GoodsShipment_GovernmentAgencyGoodsItem_GovernmentProcedure;
end;

end.