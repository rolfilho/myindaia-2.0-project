
{**************************************************************************************}
{                                                                                      }
{                                   XML Data Binding                                   }
{                                                                                      }
{         Generated on: 13/09/2018 19:42:01                                            }
{       Generated from: C:\Projetos\Delphi\minibroker\doc\docDue\xsdDueDataModel.xsd   }
{   Settings stored in: C:\Projetos\Delphi\minibroker\doc\docDue\xsdDueDataModel.xdb   }
{                                                                                      }
{**************************************************************************************}

unit xsdDueDataModel;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLAdditionalDocumentIdentificationIDType = interface;
  IXMLAdditionalInformationLimitDateTimeType = interface;
  IXMLAdditionalInformationStatementDescriptionTextType = interface;
  IXMLAddressLineTextType = interface;
  IXMLClassificationIdentificationIDType = interface;
  IXMLCommodityCommercialDescriptionTextType = interface;
  IXMLCommodityDescriptionTextType = interface;
  IXMLCommodityValueAmountType = interface;
  IXMLDeclarantIdentificationIDType = interface;
  IXMLDeclarationIdentificationIDType = interface;
  IXMLDeclarationOfficeIdentificationCodeType = interface;
  IXMLExitOfficeIdentificationCodeType = interface;
  IXMLExporterIdentificationIDType = interface;
  IXMLExporterNameTextType = interface;
  IXMLGoodsMeasureNetNetWeightMeasureType = interface;
  IXMLGoodsMeasureTariffQuantityType = interface;
  IXMLGovernmentAgencyGoodsItemCustomsValueAmountType = interface;
  IXMLInvoiceCustomsValueAmountType = interface;
  IXMLGovernmentAgencyGoodsItemFinancedValueAmountType = interface;
  IXMLGovernmentProcedureCurrentCodeType = interface;
  IXMLImporterNameTextType = interface;
  IXMLInvoiceIdentificationIDType = interface;
  IXMLInvoiceIssueDateTimeType = interface;
  IXMLInvoiceLineInvoiceIdentificationIDType = interface;
  IXMLPackagingQuantityQuantityType = interface;
  IXMLPreviousDocumentIdentificationIDType = interface;
  IXMLProductCharacteristicsDescriptionTextType = interface;
  IXMLProductCharacteristicsTypeCodeType = interface;
  IXMLProductIdentificationIDType = interface;
  IXMLReferencedInvoiceIdentificationIDType = interface;
  IXMLReferencedInvoiceIssueDateTimeType = interface;
  IXMLReferencedInvoiceIssueDateTimeType_DateTimeString = interface;
  IXMLReferencedInvoiceLineInvoiceIdentificationIDType = interface;
  IXMLSubmitterIdentificationIDType = interface;
  IXMLTradeTermsDescriptionTextType = interface;
  IXMLUCRTraderAssignedReferenceIDType = interface;
  IXMLWarehouseIdentificationIDType = interface;
  IXMLProductCriteriaConformanceDescriptionTextType = interface;
  IXMLWarehouseLatitudeMeasureType = interface;
  IXMLWarehouseLongitudeMeasureType = interface;
  IXMLGoodsMeasureUnitDescriptionTextType = interface;
  IXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType = interface;
  IXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType = interface;
  IXMLAdditionalDocumentItemIDType = interface;
  IXMLAdditionalDocumentQuantityQuantityType = interface;
  IXMLInvoiceQuantityQuantityType = interface;
  IXMLCommodityInvoiceBRLvalueAmountType = interface;
  IXMLCommunicationIdentificationIDType = interface;
  IXMLContactNameTextType = interface;
  IXMLAdditionalDocumentDrawbackHsClassificationTextType = interface;
  IXMLAdditionalDocumentDrawbackRecipientIdTextType = interface;
  IXMLAdditionalDocumentValueWithExchangeCoverAmountType = interface;
  IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType = interface;
  IXMLPreviousDocumentAmountAmountType = interface;
  IXMLPreviousDocumentItemIDType = interface;
  IXMLPreviousDocumentQuantityQuantityType = interface;
  IXMLProductCriteriaConformanceQuantityQuantityType = interface;

{ IXMLAdditionalDocumentIdentificationIDType }

  IXMLAdditionalDocumentIdentificationIDType = interface(IXMLNode)
    ['{B1B71DC2-3DA6-40EC-BF9A-CE0689533720}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLAdditionalInformationLimitDateTimeType }

  IXMLAdditionalInformationLimitDateTimeType = interface(IXMLNode)
    ['{52602A80-279B-4FF7-96C3-2B44842C6C97}']
    { Property Accessors }
    function Get_Lang: UnicodeString;
    procedure Set_Lang(Value: UnicodeString);
    { Methods & Properties }
    property Lang: UnicodeString read Get_Lang write Set_Lang;
  end;

{ IXMLAdditionalInformationStatementDescriptionTextType }

  IXMLAdditionalInformationStatementDescriptionTextType = interface(IXMLNode)
    ['{0DBE4140-CB54-4CAF-B75A-A8F5A1DD0D49}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLAddressLineTextType }

  IXMLAddressLineTextType = interface(IXMLNode)
    ['{A4033D44-F852-4F04-9ACF-0FEA6CB27579}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLClassificationIdentificationIDType }

  IXMLClassificationIdentificationIDType = interface(IXMLNode)
    ['{7D335DA0-E252-41B3-AA3D-F405A25DA8F8}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLCommodityCommercialDescriptionTextType }

  IXMLCommodityCommercialDescriptionTextType = interface(IXMLNode)
    ['{EEED675E-8D91-4EEC-9453-82ACD8C0065E}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLCommodityDescriptionTextType }

  IXMLCommodityDescriptionTextType = interface(IXMLNode)
    ['{2EF3C560-4BA2-4DA4-8A0E-BE04F779D3FC}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLCommodityValueAmountType }

  IXMLCommodityValueAmountType = interface(IXMLNode)
    ['{F3ED9C5E-AD8E-42EE-9261-F37E43228D89}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarantIdentificationIDType }

  IXMLDeclarantIdentificationIDType = interface(IXMLNode)
    ['{536C92CA-895D-4011-A019-B06A5F1EEE68}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationIdentificationIDType }

  IXMLDeclarationIdentificationIDType = interface(IXMLNode)
    ['{AC0B5CCB-44C8-4462-849A-0A658A44ED91}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLDeclarationOfficeIdentificationCodeType }

  IXMLDeclarationOfficeIdentificationCodeType = interface(IXMLNode)
    ['{A82950E6-ECCA-4D41-904E-C9251217B11A}']
    { Property Accessors }
    function Get_ListID: UnicodeString;
    procedure Set_ListID(Value: UnicodeString);
    { Methods & Properties }
    property ListID: UnicodeString read Get_ListID write Set_ListID;
  end;

{ IXMLExitOfficeIdentificationCodeType }

  IXMLExitOfficeIdentificationCodeType = interface(IXMLNode)
    ['{5371D77B-01B4-457C-8FEE-71046AD323F9}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLExporterIdentificationIDType }

  IXMLExporterIdentificationIDType = interface(IXMLNode)
    ['{A90C7739-D637-41EA-B280-3C28232B523D}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLExporterNameTextType }

  IXMLExporterNameTextType = interface(IXMLNode)
    ['{52E9E0AE-1762-4A39-A809-69FA33BECA51}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLGoodsMeasureNetNetWeightMeasureType }

  IXMLGoodsMeasureNetNetWeightMeasureType = interface(IXMLNode)
    ['{090EC304-7831-4B52-BF89-355560F06049}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLGoodsMeasureTariffQuantityType }

  IXMLGoodsMeasureTariffQuantityType = interface(IXMLNode)
    ['{A0D1FDF0-32F9-4A7C-BD9D-BBBB4C18C2A5}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLGovernmentAgencyGoodsItemCustomsValueAmountType }

  IXMLGovernmentAgencyGoodsItemCustomsValueAmountType = interface(IXMLNode)
    ['{0EDC1ED9-7E07-427B-B2E3-305A57CA6F9A}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLInvoiceCustomsValueAmountType }

  IXMLInvoiceCustomsValueAmountType = interface(IXMLNode)
    ['{884D5D7F-8E81-46EF-A1A1-5610A6F0138E}']
  end;

{ IXMLGovernmentAgencyGoodsItemFinancedValueAmountType }

  IXMLGovernmentAgencyGoodsItemFinancedValueAmountType = interface(IXMLNode)
    ['{04BBB2E3-377F-4F9B-9AD4-0F71927697EB}']
  end;

{ IXMLGovernmentProcedureCurrentCodeType }

  IXMLGovernmentProcedureCurrentCodeType = interface(IXMLNode)
    ['{8978F15E-A61C-4A97-8514-A4BDF9F9356C}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLImporterNameTextType }

  IXMLImporterNameTextType = interface(IXMLNode)
    ['{39EFE63C-486F-4D2C-90F4-5ED2A2D1CE21}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLInvoiceIdentificationIDType }

  IXMLInvoiceIdentificationIDType = interface(IXMLNode)
    ['{05FDB951-1B5B-455E-8738-365C9A5BA660}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLInvoiceIssueDateTimeType }

  IXMLInvoiceIssueDateTimeType = interface(IXMLNode)
    ['{57E78B14-D289-4FAF-94BC-4C9F8A67D088}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLInvoiceLineInvoiceIdentificationIDType }

  IXMLInvoiceLineInvoiceIdentificationIDType = interface(IXMLNode)
    ['{28C291B1-49DB-43B5-B11F-7052F2002FE3}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLPackagingQuantityQuantityType }

  IXMLPackagingQuantityQuantityType = interface(IXMLNode)
    ['{9E51A69D-B0B6-4890-B309-107AB59A727F}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLPreviousDocumentIdentificationIDType }

  IXMLPreviousDocumentIdentificationIDType = interface(IXMLNode)
    ['{EBF3A13E-19F9-4D3B-9BF7-0939B4E2E136}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLProductCharacteristicsDescriptionTextType }

  IXMLProductCharacteristicsDescriptionTextType = interface(IXMLNode)
    ['{F9DE3372-B9FF-47C0-9FFC-DFB98C0E7C47}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLProductCharacteristicsTypeCodeType }

  IXMLProductCharacteristicsTypeCodeType = interface(IXMLNode)
    ['{AF0D2CEF-A8B3-47EB-B917-F97BB5C2C0E5}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLProductIdentificationIDType }

  IXMLProductIdentificationIDType = interface(IXMLNode)
    ['{78B3C7F0-2209-4F7B-8627-BB4FF1DC96A7}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLReferencedInvoiceIdentificationIDType }

  IXMLReferencedInvoiceIdentificationIDType = interface(IXMLNode)
    ['{4B099880-15C1-4FE9-AB4E-57D345F2F78E}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLReferencedInvoiceIssueDateTimeType }

  IXMLReferencedInvoiceIssueDateTimeType = interface(IXMLNode)
    ['{413F3FF6-805E-4157-88C7-4E5FE2191AD6}']
    { Property Accessors }
    function Get_DateTimeString: IXMLReferencedInvoiceIssueDateTimeType_DateTimeString;
    function Get_DateTime: UnicodeString;
    procedure Set_DateTime(Value: UnicodeString);
    { Methods & Properties }
    property DateTimeString: IXMLReferencedInvoiceIssueDateTimeType_DateTimeString read Get_DateTimeString;
    property DateTime: UnicodeString read Get_DateTime write Set_DateTime;
  end;

{ IXMLReferencedInvoiceIssueDateTimeType_DateTimeString }

  IXMLReferencedInvoiceIssueDateTimeType_DateTimeString = interface(IXMLNode)
    ['{9CA84603-323B-4F58-A775-2849AC0171BF}']
    { Property Accessors }
    function Get_FormatCode: UnicodeString;
    procedure Set_FormatCode(Value: UnicodeString);
    { Methods & Properties }
    property FormatCode: UnicodeString read Get_FormatCode write Set_FormatCode;
  end;

{ IXMLReferencedInvoiceLineInvoiceIdentificationIDType }

  IXMLReferencedInvoiceLineInvoiceIdentificationIDType = interface(IXMLNode)
    ['{F83D8BE1-0B02-46CC-8283-AA36C5519FB7}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLSubmitterIdentificationIDType }

  IXMLSubmitterIdentificationIDType = interface(IXMLNode)
    ['{F3B6C19A-7532-4FAE-9D33-67618897859D}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLTradeTermsDescriptionTextType }

  IXMLTradeTermsDescriptionTextType = interface(IXMLNode)
    ['{B4EE3BDE-7121-4A37-951A-D074E9249172}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLUCRTraderAssignedReferenceIDType }

  IXMLUCRTraderAssignedReferenceIDType = interface(IXMLNode)
    ['{4069F008-192A-4AF1-A537-AE65FB9F7E85}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLWarehouseIdentificationIDType }

  IXMLWarehouseIdentificationIDType = interface(IXMLNode)
    ['{CF16E0C7-53CF-4D41-8595-DAF30BC49067}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLProductCriteriaConformanceDescriptionTextType }

  IXMLProductCriteriaConformanceDescriptionTextType = interface(IXMLNode)
    ['{00867C07-E812-4F9C-ADEA-06F8CB5EA7EA}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLWarehouseLatitudeMeasureType }

  IXMLWarehouseLatitudeMeasureType = interface(IXMLNode)
    ['{F41CC79B-2AB9-4CAB-BED0-F2EB98930B58}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLWarehouseLongitudeMeasureType }

  IXMLWarehouseLongitudeMeasureType = interface(IXMLNode)
    ['{4E7C4071-8785-44C6-975C-9F1D4C21F911}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLGoodsMeasureUnitDescriptionTextType }

  IXMLGoodsMeasureUnitDescriptionTextType = interface(IXMLNode)
    ['{F1B2C5C6-1FF4-435D-84DA-2EC37AE48ACD}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType }

  IXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType = interface(IXMLNode)
    ['{0D02FA1F-B9CF-41B3-AB52-6F918BDB0AE7}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType }

  IXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType = interface(IXMLNode)
    ['{994902C3-60A8-4832-A30E-F3168371B5D4}']
    { Property Accessors }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
    { Methods & Properties }
    property LanguageID: UnicodeString read Get_LanguageID write Set_LanguageID;
  end;

{ IXMLAdditionalDocumentItemIDType }

  IXMLAdditionalDocumentItemIDType = interface(IXMLNode)
    ['{25E20BBF-AD5D-4901-B56B-FE366BF425C3}']
    { Property Accessors }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
    { Methods & Properties }
    property SchemeID: UnicodeString read Get_SchemeID write Set_SchemeID;
  end;

{ IXMLAdditionalDocumentQuantityQuantityType }

  IXMLAdditionalDocumentQuantityQuantityType = interface(IXMLNode)
    ['{F4B0B130-4755-4467-B7BB-B59D362C0520}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLInvoiceQuantityQuantityType }

  IXMLInvoiceQuantityQuantityType = interface(IXMLNode)
    ['{081E60CE-E2D5-4D55-85C3-0CBED3AEE84A}']
    { Property Accessors }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
    { Methods & Properties }
    property UnitCode: UnicodeString read Get_UnitCode write Set_UnitCode;
  end;

{ IXMLCommodityInvoiceBRLvalueAmountType }

  IXMLCommodityInvoiceBRLvalueAmountType = interface(IXMLNode)
    ['{12D73F91-A202-4660-AC53-B7BFB3F31637}']
  end;

{ IXMLCommunicationIdentificationIDType }

  IXMLCommunicationIdentificationIDType = interface(IXMLNode)
    ['{640B820C-FC18-44D2-BBDC-CF52F6812DCC}']
  end;

{ IXMLContactNameTextType }

  IXMLContactNameTextType = interface(IXMLNode)
    ['{9AF54B7B-A1F2-4221-B0AB-E46F46AADAED}']
  end;

{ IXMLAdditionalDocumentDrawbackHsClassificationTextType }

  IXMLAdditionalDocumentDrawbackHsClassificationTextType = interface(IXMLNode)
    ['{208D8B45-29D6-4C81-86C0-035E29B3D98E}']
  end;

{ IXMLAdditionalDocumentDrawbackRecipientIdTextType }

  IXMLAdditionalDocumentDrawbackRecipientIdTextType = interface(IXMLNode)
    ['{EDEA2966-F0D8-4C3D-B232-388996D1C103}']
  end;

{ IXMLAdditionalDocumentValueWithExchangeCoverAmountType }

  IXMLAdditionalDocumentValueWithExchangeCoverAmountType = interface(IXMLNode)
    ['{02106477-5DDD-44B6-9F4C-04066EEF4F2D}']
  end;

{ IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType }

  IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType = interface(IXMLNode)
    ['{B6E75581-0C27-40A3-9802-28E20646CEE2}']
  end;

{ IXMLPreviousDocumentAmountAmountType }

  IXMLPreviousDocumentAmountAmountType = interface(IXMLNode)
    ['{7AD38AAC-B7AD-4CCE-BC4B-211C3AFD286A}']
  end;

{ IXMLPreviousDocumentItemIDType }

  IXMLPreviousDocumentItemIDType = interface(IXMLNode)
    ['{46C01F0A-C2F0-42ED-BFD3-9381663DFBBF}']
  end;

{ IXMLPreviousDocumentQuantityQuantityType }

  IXMLPreviousDocumentQuantityQuantityType = interface(IXMLNode)
    ['{3359894B-F4DF-429D-834B-8859A1DCB420}']
  end;

{ IXMLProductCriteriaConformanceQuantityQuantityType }

  IXMLProductCriteriaConformanceQuantityQuantityType = interface(IXMLNode)
    ['{97CF07E3-FE7F-4D3D-901D-93C93F5201E5}']
  end;

{ Forward Decls }

  TXMLAdditionalDocumentIdentificationIDType = class;
  TXMLAdditionalInformationLimitDateTimeType = class;
  TXMLAdditionalInformationStatementDescriptionTextType = class;
  TXMLAddressLineTextType = class;
  TXMLClassificationIdentificationIDType = class;
  TXMLCommodityCommercialDescriptionTextType = class;
  TXMLCommodityDescriptionTextType = class;
  TXMLCommodityValueAmountType = class;
  TXMLDeclarantIdentificationIDType = class;
  TXMLDeclarationIdentificationIDType = class;
  TXMLDeclarationOfficeIdentificationCodeType = class;
  TXMLExitOfficeIdentificationCodeType = class;
  TXMLExporterIdentificationIDType = class;
  TXMLExporterNameTextType = class;
  TXMLGoodsMeasureNetNetWeightMeasureType = class;
  TXMLGoodsMeasureTariffQuantityType = class;
  TXMLGovernmentAgencyGoodsItemCustomsValueAmountType = class;
  TXMLInvoiceCustomsValueAmountType = class;
  TXMLGovernmentAgencyGoodsItemFinancedValueAmountType = class;
  TXMLGovernmentProcedureCurrentCodeType = class;
  TXMLImporterNameTextType = class;
  TXMLInvoiceIdentificationIDType = class;
  TXMLInvoiceIssueDateTimeType = class;
  TXMLInvoiceLineInvoiceIdentificationIDType = class;
  TXMLPackagingQuantityQuantityType = class;
  TXMLPreviousDocumentIdentificationIDType = class;
  TXMLProductCharacteristicsDescriptionTextType = class;
  TXMLProductCharacteristicsTypeCodeType = class;
  TXMLProductIdentificationIDType = class;
  TXMLReferencedInvoiceIdentificationIDType = class;
  TXMLReferencedInvoiceIssueDateTimeType = class;
  TXMLReferencedInvoiceIssueDateTimeType_DateTimeString = class;
  TXMLReferencedInvoiceLineInvoiceIdentificationIDType = class;
  TXMLSubmitterIdentificationIDType = class;
  TXMLTradeTermsDescriptionTextType = class;
  TXMLUCRTraderAssignedReferenceIDType = class;
  TXMLWarehouseIdentificationIDType = class;
  TXMLProductCriteriaConformanceDescriptionTextType = class;
  TXMLWarehouseLatitudeMeasureType = class;
  TXMLWarehouseLongitudeMeasureType = class;
  TXMLGoodsMeasureUnitDescriptionTextType = class;
  TXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType = class;
  TXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType = class;
  TXMLAdditionalDocumentItemIDType = class;
  TXMLAdditionalDocumentQuantityQuantityType = class;
  TXMLInvoiceQuantityQuantityType = class;
  TXMLCommodityInvoiceBRLvalueAmountType = class;
  TXMLCommunicationIdentificationIDType = class;
  TXMLContactNameTextType = class;
  TXMLAdditionalDocumentDrawbackHsClassificationTextType = class;
  TXMLAdditionalDocumentDrawbackRecipientIdTextType = class;
  TXMLAdditionalDocumentValueWithExchangeCoverAmountType = class;
  TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType = class;
  TXMLPreviousDocumentAmountAmountType = class;
  TXMLPreviousDocumentItemIDType = class;
  TXMLPreviousDocumentQuantityQuantityType = class;
  TXMLProductCriteriaConformanceQuantityQuantityType = class;

{ TXMLAdditionalDocumentIdentificationIDType }

  TXMLAdditionalDocumentIdentificationIDType = class(TXMLNode, IXMLAdditionalDocumentIdentificationIDType)
  protected
    { IXMLAdditionalDocumentIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLAdditionalInformationLimitDateTimeType }

  TXMLAdditionalInformationLimitDateTimeType = class(TXMLNode, IXMLAdditionalInformationLimitDateTimeType)
  protected
    { IXMLAdditionalInformationLimitDateTimeType }
    function Get_Lang: UnicodeString;
    procedure Set_Lang(Value: UnicodeString);
  end;

{ TXMLAdditionalInformationStatementDescriptionTextType }

  TXMLAdditionalInformationStatementDescriptionTextType = class(TXMLNode, IXMLAdditionalInformationStatementDescriptionTextType)
  protected
    { IXMLAdditionalInformationStatementDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLAddressLineTextType }

  TXMLAddressLineTextType = class(TXMLNode, IXMLAddressLineTextType)
  protected
    { IXMLAddressLineTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLClassificationIdentificationIDType }

  TXMLClassificationIdentificationIDType = class(TXMLNode, IXMLClassificationIdentificationIDType)
  protected
    { IXMLClassificationIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLCommodityCommercialDescriptionTextType }

  TXMLCommodityCommercialDescriptionTextType = class(TXMLNode, IXMLCommodityCommercialDescriptionTextType)
  protected
    { IXMLCommodityCommercialDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLCommodityDescriptionTextType }

  TXMLCommodityDescriptionTextType = class(TXMLNode, IXMLCommodityDescriptionTextType)
  protected
    { IXMLCommodityDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLCommodityValueAmountType }

  TXMLCommodityValueAmountType = class(TXMLNode, IXMLCommodityValueAmountType)
  protected
    { IXMLCommodityValueAmountType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarantIdentificationIDType }

  TXMLDeclarantIdentificationIDType = class(TXMLNode, IXMLDeclarantIdentificationIDType)
  protected
    { IXMLDeclarantIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationIdentificationIDType }

  TXMLDeclarationIdentificationIDType = class(TXMLNode, IXMLDeclarationIdentificationIDType)
  protected
    { IXMLDeclarationIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLDeclarationOfficeIdentificationCodeType }

  TXMLDeclarationOfficeIdentificationCodeType = class(TXMLNode, IXMLDeclarationOfficeIdentificationCodeType)
  protected
    { IXMLDeclarationOfficeIdentificationCodeType }
    function Get_ListID: UnicodeString;
    procedure Set_ListID(Value: UnicodeString);
  end;

{ TXMLExitOfficeIdentificationCodeType }

  TXMLExitOfficeIdentificationCodeType = class(TXMLNode, IXMLExitOfficeIdentificationCodeType)
  protected
    { IXMLExitOfficeIdentificationCodeType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLExporterIdentificationIDType }

  TXMLExporterIdentificationIDType = class(TXMLNode, IXMLExporterIdentificationIDType)
  protected
    { IXMLExporterIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLExporterNameTextType }

  TXMLExporterNameTextType = class(TXMLNode, IXMLExporterNameTextType)
  protected
    { IXMLExporterNameTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLGoodsMeasureNetNetWeightMeasureType }

  TXMLGoodsMeasureNetNetWeightMeasureType = class(TXMLNode, IXMLGoodsMeasureNetNetWeightMeasureType)
  protected
    { IXMLGoodsMeasureNetNetWeightMeasureType }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLGoodsMeasureTariffQuantityType }

  TXMLGoodsMeasureTariffQuantityType = class(TXMLNode, IXMLGoodsMeasureTariffQuantityType)
  protected
    { IXMLGoodsMeasureTariffQuantityType }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLGovernmentAgencyGoodsItemCustomsValueAmountType }

  TXMLGovernmentAgencyGoodsItemCustomsValueAmountType = class(TXMLNode, IXMLGovernmentAgencyGoodsItemCustomsValueAmountType)
  protected
    { IXMLGovernmentAgencyGoodsItemCustomsValueAmountType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLInvoiceCustomsValueAmountType }

  TXMLInvoiceCustomsValueAmountType = class(TXMLNode, IXMLInvoiceCustomsValueAmountType)
  protected
    { IXMLInvoiceCustomsValueAmountType }
  end;

{ TXMLGovernmentAgencyGoodsItemFinancedValueAmountType }

  TXMLGovernmentAgencyGoodsItemFinancedValueAmountType = class(TXMLNode, IXMLGovernmentAgencyGoodsItemFinancedValueAmountType)
  protected
    { IXMLGovernmentAgencyGoodsItemFinancedValueAmountType }
  end;

{ TXMLGovernmentProcedureCurrentCodeType }

  TXMLGovernmentProcedureCurrentCodeType = class(TXMLNode, IXMLGovernmentProcedureCurrentCodeType)
  protected
    { IXMLGovernmentProcedureCurrentCodeType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLImporterNameTextType }

  TXMLImporterNameTextType = class(TXMLNode, IXMLImporterNameTextType)
  protected
    { IXMLImporterNameTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLInvoiceIdentificationIDType }

  TXMLInvoiceIdentificationIDType = class(TXMLNode, IXMLInvoiceIdentificationIDType)
  protected
    { IXMLInvoiceIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLInvoiceIssueDateTimeType }

  TXMLInvoiceIssueDateTimeType = class(TXMLNode, IXMLInvoiceIssueDateTimeType)
  protected
    { IXMLInvoiceIssueDateTimeType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLInvoiceLineInvoiceIdentificationIDType }

  TXMLInvoiceLineInvoiceIdentificationIDType = class(TXMLNode, IXMLInvoiceLineInvoiceIdentificationIDType)
  protected
    { IXMLInvoiceLineInvoiceIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLPackagingQuantityQuantityType }

  TXMLPackagingQuantityQuantityType = class(TXMLNode, IXMLPackagingQuantityQuantityType)
  protected
    { IXMLPackagingQuantityQuantityType }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLPreviousDocumentIdentificationIDType }

  TXMLPreviousDocumentIdentificationIDType = class(TXMLNode, IXMLPreviousDocumentIdentificationIDType)
  protected
    { IXMLPreviousDocumentIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLProductCharacteristicsDescriptionTextType }

  TXMLProductCharacteristicsDescriptionTextType = class(TXMLNode, IXMLProductCharacteristicsDescriptionTextType)
  protected
    { IXMLProductCharacteristicsDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLProductCharacteristicsTypeCodeType }

  TXMLProductCharacteristicsTypeCodeType = class(TXMLNode, IXMLProductCharacteristicsTypeCodeType)
  protected
    { IXMLProductCharacteristicsTypeCodeType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLProductIdentificationIDType }

  TXMLProductIdentificationIDType = class(TXMLNode, IXMLProductIdentificationIDType)
  protected
    { IXMLProductIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLReferencedInvoiceIdentificationIDType }

  TXMLReferencedInvoiceIdentificationIDType = class(TXMLNode, IXMLReferencedInvoiceIdentificationIDType)
  protected
    { IXMLReferencedInvoiceIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLReferencedInvoiceIssueDateTimeType }

  TXMLReferencedInvoiceIssueDateTimeType = class(TXMLNode, IXMLReferencedInvoiceIssueDateTimeType)
  protected
    { IXMLReferencedInvoiceIssueDateTimeType }
    function Get_DateTimeString: IXMLReferencedInvoiceIssueDateTimeType_DateTimeString;
    function Get_DateTime: UnicodeString;
    procedure Set_DateTime(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLReferencedInvoiceIssueDateTimeType_DateTimeString }

  TXMLReferencedInvoiceIssueDateTimeType_DateTimeString = class(TXMLNode, IXMLReferencedInvoiceIssueDateTimeType_DateTimeString)
  protected
    { IXMLReferencedInvoiceIssueDateTimeType_DateTimeString }
    function Get_FormatCode: UnicodeString;
    procedure Set_FormatCode(Value: UnicodeString);
  end;

{ TXMLReferencedInvoiceLineInvoiceIdentificationIDType }

  TXMLReferencedInvoiceLineInvoiceIdentificationIDType = class(TXMLNode, IXMLReferencedInvoiceLineInvoiceIdentificationIDType)
  protected
    { IXMLReferencedInvoiceLineInvoiceIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLSubmitterIdentificationIDType }

  TXMLSubmitterIdentificationIDType = class(TXMLNode, IXMLSubmitterIdentificationIDType)
  protected
    { IXMLSubmitterIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLTradeTermsDescriptionTextType }

  TXMLTradeTermsDescriptionTextType = class(TXMLNode, IXMLTradeTermsDescriptionTextType)
  protected
    { IXMLTradeTermsDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLUCRTraderAssignedReferenceIDType }

  TXMLUCRTraderAssignedReferenceIDType = class(TXMLNode, IXMLUCRTraderAssignedReferenceIDType)
  protected
    { IXMLUCRTraderAssignedReferenceIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLWarehouseIdentificationIDType }

  TXMLWarehouseIdentificationIDType = class(TXMLNode, IXMLWarehouseIdentificationIDType)
  protected
    { IXMLWarehouseIdentificationIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLProductCriteriaConformanceDescriptionTextType }

  TXMLProductCriteriaConformanceDescriptionTextType = class(TXMLNode, IXMLProductCriteriaConformanceDescriptionTextType)
  protected
    { IXMLProductCriteriaConformanceDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLWarehouseLatitudeMeasureType }

  TXMLWarehouseLatitudeMeasureType = class(TXMLNode, IXMLWarehouseLatitudeMeasureType)
  protected
    { IXMLWarehouseLatitudeMeasureType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLWarehouseLongitudeMeasureType }

  TXMLWarehouseLongitudeMeasureType = class(TXMLNode, IXMLWarehouseLongitudeMeasureType)
  protected
    { IXMLWarehouseLongitudeMeasureType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLGoodsMeasureUnitDescriptionTextType }

  TXMLGoodsMeasureUnitDescriptionTextType = class(TXMLNode, IXMLGoodsMeasureUnitDescriptionTextType)
  protected
    { IXMLGoodsMeasureUnitDescriptionTextType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType }

  TXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType = class(TXMLNode, IXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType)
  protected
    { IXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType }

  TXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType = class(TXMLNode, IXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType)
  protected
    { IXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType }
    function Get_LanguageID: UnicodeString;
    procedure Set_LanguageID(Value: UnicodeString);
  end;

{ TXMLAdditionalDocumentItemIDType }

  TXMLAdditionalDocumentItemIDType = class(TXMLNode, IXMLAdditionalDocumentItemIDType)
  protected
    { IXMLAdditionalDocumentItemIDType }
    function Get_SchemeID: UnicodeString;
    procedure Set_SchemeID(Value: UnicodeString);
  end;

{ TXMLAdditionalDocumentQuantityQuantityType }

  TXMLAdditionalDocumentQuantityQuantityType = class(TXMLNode, IXMLAdditionalDocumentQuantityQuantityType)
  protected
    { IXMLAdditionalDocumentQuantityQuantityType }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLInvoiceQuantityQuantityType }

  TXMLInvoiceQuantityQuantityType = class(TXMLNode, IXMLInvoiceQuantityQuantityType)
  protected
    { IXMLInvoiceQuantityQuantityType }
    function Get_UnitCode: UnicodeString;
    procedure Set_UnitCode(Value: UnicodeString);
  end;

{ TXMLCommodityInvoiceBRLvalueAmountType }

  TXMLCommodityInvoiceBRLvalueAmountType = class(TXMLNode, IXMLCommodityInvoiceBRLvalueAmountType)
  protected
    { IXMLCommodityInvoiceBRLvalueAmountType }
  end;

{ TXMLCommunicationIdentificationIDType }

  TXMLCommunicationIdentificationIDType = class(TXMLNode, IXMLCommunicationIdentificationIDType)
  protected
    { IXMLCommunicationIdentificationIDType }
  end;

{ TXMLContactNameTextType }

  TXMLContactNameTextType = class(TXMLNode, IXMLContactNameTextType)
  protected
    { IXMLContactNameTextType }
  end;

{ TXMLAdditionalDocumentDrawbackHsClassificationTextType }

  TXMLAdditionalDocumentDrawbackHsClassificationTextType = class(TXMLNode, IXMLAdditionalDocumentDrawbackHsClassificationTextType)
  protected
    { IXMLAdditionalDocumentDrawbackHsClassificationTextType }
  end;

{ TXMLAdditionalDocumentDrawbackRecipientIdTextType }

  TXMLAdditionalDocumentDrawbackRecipientIdTextType = class(TXMLNode, IXMLAdditionalDocumentDrawbackRecipientIdTextType)
  protected
    { IXMLAdditionalDocumentDrawbackRecipientIdTextType }
  end;

{ TXMLAdditionalDocumentValueWithExchangeCoverAmountType }

  TXMLAdditionalDocumentValueWithExchangeCoverAmountType = class(TXMLNode, IXMLAdditionalDocumentValueWithExchangeCoverAmountType)
  protected
    { IXMLAdditionalDocumentValueWithExchangeCoverAmountType }
  end;

{ TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType }

  TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType = class(TXMLNode, IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType)
  protected
    { IXMLAdditionalDocumentValueWithoutExchangeCoverAmountType }
  end;

{ TXMLPreviousDocumentAmountAmountType }

  TXMLPreviousDocumentAmountAmountType = class(TXMLNode, IXMLPreviousDocumentAmountAmountType)
  protected
    { IXMLPreviousDocumentAmountAmountType }
  end;

{ TXMLPreviousDocumentItemIDType }

  TXMLPreviousDocumentItemIDType = class(TXMLNode, IXMLPreviousDocumentItemIDType)
  protected
    { IXMLPreviousDocumentItemIDType }
  end;

{ TXMLPreviousDocumentQuantityQuantityType }

  TXMLPreviousDocumentQuantityQuantityType = class(TXMLNode, IXMLPreviousDocumentQuantityQuantityType)
  protected
    { IXMLPreviousDocumentQuantityQuantityType }
  end;

{ TXMLProductCriteriaConformanceQuantityQuantityType }

  TXMLProductCriteriaConformanceQuantityQuantityType = class(TXMLNode, IXMLProductCriteriaConformanceQuantityQuantityType)
  protected
    { IXMLProductCriteriaConformanceQuantityQuantityType }
  end;

implementation

{ TXMLAdditionalDocumentIdentificationIDType }

function TXMLAdditionalDocumentIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLAdditionalDocumentIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLAdditionalInformationLimitDateTimeType }

function TXMLAdditionalInformationLimitDateTimeType.Get_Lang: UnicodeString;
begin
  Result := AttributeNodes['lang'].Text;
end;

procedure TXMLAdditionalInformationLimitDateTimeType.Set_Lang(Value: UnicodeString);
begin
  SetAttribute('lang', Value);
end;

{ TXMLAdditionalInformationStatementDescriptionTextType }

function TXMLAdditionalInformationStatementDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLAdditionalInformationStatementDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLAddressLineTextType }

function TXMLAddressLineTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLAddressLineTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLClassificationIdentificationIDType }

function TXMLClassificationIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLClassificationIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLCommodityCommercialDescriptionTextType }

function TXMLCommodityCommercialDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLCommodityCommercialDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLCommodityDescriptionTextType }

function TXMLCommodityDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLCommodityDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLCommodityValueAmountType }

function TXMLCommodityValueAmountType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLCommodityValueAmountType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarantIdentificationIDType }

function TXMLDeclarantIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclarantIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationIdentificationIDType }

function TXMLDeclarationIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLDeclarationIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLDeclarationOfficeIdentificationCodeType }

function TXMLDeclarationOfficeIdentificationCodeType.Get_ListID: UnicodeString;
begin
  Result := AttributeNodes['listID'].Text;
end;

procedure TXMLDeclarationOfficeIdentificationCodeType.Set_ListID(Value: UnicodeString);
begin
  SetAttribute('listID', Value);
end;

{ TXMLExitOfficeIdentificationCodeType }

function TXMLExitOfficeIdentificationCodeType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLExitOfficeIdentificationCodeType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLExporterIdentificationIDType }

function TXMLExporterIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLExporterIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLExporterNameTextType }

function TXMLExporterNameTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLExporterNameTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLGoodsMeasureNetNetWeightMeasureType }

function TXMLGoodsMeasureNetNetWeightMeasureType.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLGoodsMeasureNetNetWeightMeasureType.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLGoodsMeasureTariffQuantityType }

function TXMLGoodsMeasureTariffQuantityType.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLGoodsMeasureTariffQuantityType.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLGovernmentAgencyGoodsItemCustomsValueAmountType }

function TXMLGovernmentAgencyGoodsItemCustomsValueAmountType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLGovernmentAgencyGoodsItemCustomsValueAmountType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLInvoiceCustomsValueAmountType }

{ TXMLGovernmentAgencyGoodsItemFinancedValueAmountType }

{ TXMLGovernmentProcedureCurrentCodeType }

function TXMLGovernmentProcedureCurrentCodeType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLGovernmentProcedureCurrentCodeType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLImporterNameTextType }

function TXMLImporterNameTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLImporterNameTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLInvoiceIdentificationIDType }

function TXMLInvoiceIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLInvoiceIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLInvoiceIssueDateTimeType }

function TXMLInvoiceIssueDateTimeType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLInvoiceIssueDateTimeType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLInvoiceLineInvoiceIdentificationIDType }

function TXMLInvoiceLineInvoiceIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLInvoiceLineInvoiceIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLPackagingQuantityQuantityType }

function TXMLPackagingQuantityQuantityType.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLPackagingQuantityQuantityType.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLPreviousDocumentIdentificationIDType }

function TXMLPreviousDocumentIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLPreviousDocumentIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLProductCharacteristicsDescriptionTextType }

function TXMLProductCharacteristicsDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLProductCharacteristicsDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLProductCharacteristicsTypeCodeType }

function TXMLProductCharacteristicsTypeCodeType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLProductCharacteristicsTypeCodeType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLProductIdentificationIDType }

function TXMLProductIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLProductIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLReferencedInvoiceIdentificationIDType }

function TXMLReferencedInvoiceIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLReferencedInvoiceIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLReferencedInvoiceIssueDateTimeType }

procedure TXMLReferencedInvoiceIssueDateTimeType.AfterConstruction;
begin
  RegisterChildNode('DateTimeString', TXMLReferencedInvoiceIssueDateTimeType_DateTimeString);
  inherited;
end;

function TXMLReferencedInvoiceIssueDateTimeType.Get_DateTimeString: IXMLReferencedInvoiceIssueDateTimeType_DateTimeString;
begin
  Result := ChildNodes['DateTimeString'] as IXMLReferencedInvoiceIssueDateTimeType_DateTimeString;
end;

function TXMLReferencedInvoiceIssueDateTimeType.Get_DateTime: UnicodeString;
begin
  Result := ChildNodes['DateTime'].Text;
end;

procedure TXMLReferencedInvoiceIssueDateTimeType.Set_DateTime(Value: UnicodeString);
begin
  ChildNodes['DateTime'].NodeValue := Value;
end;

{ TXMLReferencedInvoiceIssueDateTimeType_DateTimeString }

function TXMLReferencedInvoiceIssueDateTimeType_DateTimeString.Get_FormatCode: UnicodeString;
begin
  Result := AttributeNodes['formatCode'].Text;
end;

procedure TXMLReferencedInvoiceIssueDateTimeType_DateTimeString.Set_FormatCode(Value: UnicodeString);
begin
  SetAttribute('formatCode', Value);
end;

{ TXMLReferencedInvoiceLineInvoiceIdentificationIDType }

function TXMLReferencedInvoiceLineInvoiceIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLReferencedInvoiceLineInvoiceIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLSubmitterIdentificationIDType }

function TXMLSubmitterIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLSubmitterIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLTradeTermsDescriptionTextType }

function TXMLTradeTermsDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLTradeTermsDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLUCRTraderAssignedReferenceIDType }

function TXMLUCRTraderAssignedReferenceIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLUCRTraderAssignedReferenceIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLWarehouseIdentificationIDType }

function TXMLWarehouseIdentificationIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLWarehouseIdentificationIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLProductCriteriaConformanceDescriptionTextType }

function TXMLProductCriteriaConformanceDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLProductCriteriaConformanceDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLWarehouseLatitudeMeasureType }

function TXMLWarehouseLatitudeMeasureType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLWarehouseLatitudeMeasureType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLWarehouseLongitudeMeasureType }

function TXMLWarehouseLongitudeMeasureType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLWarehouseLongitudeMeasureType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLGoodsMeasureUnitDescriptionTextType }

function TXMLGoodsMeasureUnitDescriptionTextType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLGoodsMeasureUnitDescriptionTextType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType }

function TXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLGovernmentAgencyGoodsItemValueWithExchangeCoverAmountType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType }

function TXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType.Get_LanguageID: UnicodeString;
begin
  Result := AttributeNodes['languageID'].Text;
end;

procedure TXMLGovernmentAgencyGoodsItemValueWithoutExchangeCoverAmountType.Set_LanguageID(Value: UnicodeString);
begin
  SetAttribute('languageID', Value);
end;

{ TXMLAdditionalDocumentItemIDType }

function TXMLAdditionalDocumentItemIDType.Get_SchemeID: UnicodeString;
begin
  Result := AttributeNodes['schemeID'].Text;
end;

procedure TXMLAdditionalDocumentItemIDType.Set_SchemeID(Value: UnicodeString);
begin
  SetAttribute('schemeID', Value);
end;

{ TXMLAdditionalDocumentQuantityQuantityType }

function TXMLAdditionalDocumentQuantityQuantityType.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLAdditionalDocumentQuantityQuantityType.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLInvoiceQuantityQuantityType }

function TXMLInvoiceQuantityQuantityType.Get_UnitCode: UnicodeString;
begin
  Result := AttributeNodes['unitCode'].Text;
end;

procedure TXMLInvoiceQuantityQuantityType.Set_UnitCode(Value: UnicodeString);
begin
  SetAttribute('unitCode', Value);
end;

{ TXMLCommodityInvoiceBRLvalueAmountType }

{ TXMLCommunicationIdentificationIDType }

{ TXMLContactNameTextType }

{ TXMLAdditionalDocumentDrawbackHsClassificationTextType }

{ TXMLAdditionalDocumentDrawbackRecipientIdTextType }

{ TXMLAdditionalDocumentValueWithExchangeCoverAmountType }

{ TXMLAdditionalDocumentValueWithoutExchangeCoverAmountType }

{ TXMLPreviousDocumentAmountAmountType }

{ TXMLPreviousDocumentItemIDType }

{ TXMLPreviousDocumentQuantityQuantityType }

{ TXMLProductCriteriaConformanceQuantityQuantityType }

end.