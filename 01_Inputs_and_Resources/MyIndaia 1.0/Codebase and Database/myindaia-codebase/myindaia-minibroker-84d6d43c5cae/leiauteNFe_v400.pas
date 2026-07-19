
{*************************************************************************************************************************}
{                                                                                                                         }
{                                                    XML Data Binding                                                     }
{                                                                                                                         }
{         Generated on: 28/06/2018 09:37:13                                                                               }
{       Generated from: D:\INDAIA\Desenvolvimento Projetos\DUE\Leitura NFE\PL_009_V4_2016_002_v160\leiauteNFe_v4.00.xsd   }
{   Settings stored in: D:\INDAIA\Desenvolvimento Projetos\DUE\Leitura NFE\PL_009_V4_2016_002_v160\leiauteNFe_v4.00.xdb   }
{                                                                                                                         }
{*************************************************************************************************************************}

unit leiauteNFe_v400;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLTNFe = interface;
  IXMLTNFeList = interface;
  IXMLTNFe_infNFe = interface;
  IXMLTNFe_infNFe_ide = interface;
  IXMLTNFe_infNFe_ide_NFref = interface;
  IXMLTNFe_infNFe_ide_NFrefList = interface;
  IXMLTNFe_infNFe_ide_NFref_refNF = interface;
  IXMLTNFe_infNFe_ide_NFref_refNFP = interface;
  IXMLTNFe_infNFe_ide_NFref_refECF = interface;
  IXMLTNFe_infNFe_emit = interface;
  IXMLTEnderEmi = interface;
  IXMLTNFe_infNFe_avulsa = interface;
  IXMLTNFe_infNFe_dest = interface;
  IXMLTEndereco = interface;
  IXMLTLocal = interface;
  IXMLTNFe_infNFe_autXML = interface;
  IXMLTNFe_infNFe_autXMLList = interface;
  IXMLTNFe_infNFe_det = interface;
  IXMLTNFe_infNFe_detList = interface;
  IXMLTNFe_infNFe_det_prod = interface;
  IXMLTNFe_infNFe_det_prod_DI = interface;
  IXMLTNFe_infNFe_det_prod_DIList = interface;
  IXMLTNFe_infNFe_det_prod_DI_adi = interface;
  IXMLTNFe_infNFe_det_prod_DI_adiList = interface;
  IXMLTNFe_infNFe_det_prod_detExport = interface;
  IXMLTNFe_infNFe_det_prod_detExportList = interface;
  IXMLTNFe_infNFe_det_prod_detExport_exportInd = interface;
  IXMLTNFe_infNFe_det_prod_rastro = interface;
  IXMLTNFe_infNFe_det_prod_rastroList = interface;
  IXMLTNFe_infNFe_det_prod_veicProd = interface;
  IXMLTNFe_infNFe_det_prod_med = interface;
  IXMLTNFe_infNFe_det_prod_arma = interface;
  IXMLTNFe_infNFe_det_prod_armaList = interface;
  IXMLTNFe_infNFe_det_prod_comb = interface;
  IXMLTNFe_infNFe_det_prod_comb_CIDE = interface;
  IXMLTNFe_infNFe_det_prod_comb_encerrante = interface;
  IXMLTNFe_infNFe_det_imposto = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 = interface;
  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 = interface;
  IXMLTIpi = interface;
  IXMLTIpi_IPITrib = interface;
  IXMLTIpi_IPINT = interface;
  IXMLTNFe_infNFe_det_imposto_II = interface;
  IXMLTNFe_infNFe_det_imposto_ISSQN = interface;
  IXMLTNFe_infNFe_det_imposto_PIS = interface;
  IXMLTNFe_infNFe_det_imposto_PIS_PISAliq = interface;
  IXMLTNFe_infNFe_det_imposto_PIS_PISQtde = interface;
  IXMLTNFe_infNFe_det_imposto_PIS_PISNT = interface;
  IXMLTNFe_infNFe_det_imposto_PIS_PISOutr = interface;
  IXMLTNFe_infNFe_det_imposto_PISST = interface;
  IXMLTNFe_infNFe_det_imposto_COFINS = interface;
  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq = interface;
  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde = interface;
  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT = interface;
  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr = interface;
  IXMLTNFe_infNFe_det_imposto_COFINSST = interface;
  IXMLTNFe_infNFe_det_imposto_ICMSUFDest = interface;
  IXMLTNFe_infNFe_det_impostoDevol = interface;
  IXMLTNFe_infNFe_det_impostoDevol_IPI = interface;
  IXMLTNFe_infNFe_total = interface;
  IXMLTNFe_infNFe_total_ICMSTot = interface;
  IXMLTNFe_infNFe_total_ISSQNtot = interface;
  IXMLTNFe_infNFe_total_retTrib = interface;
  IXMLTNFe_infNFe_transp = interface;
  IXMLTNFe_infNFe_transp_transporta = interface;
  IXMLTNFe_infNFe_transp_retTransp = interface;
  IXMLTVeiculo = interface;
  IXMLTVeiculoList = interface;
  IXMLTNFe_infNFe_transp_vol = interface;
  IXMLTNFe_infNFe_transp_volList = interface;
  IXMLTNFe_infNFe_transp_vol_lacres = interface;
  IXMLTNFe_infNFe_transp_vol_lacresList = interface;
  IXMLTNFe_infNFe_cobr = interface;
  IXMLTNFe_infNFe_cobr_fat = interface;
  IXMLTNFe_infNFe_cobr_dup = interface;
  IXMLTNFe_infNFe_cobr_dupList = interface;
  IXMLTNFe_infNFe_pag = interface;
  IXMLTNFe_infNFe_pag_detPag = interface;
  IXMLTNFe_infNFe_pag_detPagList = interface;
  IXMLTNFe_infNFe_pag_detPag_card = interface;
  IXMLTNFe_infNFe_infAdic = interface;
  IXMLTNFe_infNFe_infAdic_obsCont = interface;
  IXMLTNFe_infNFe_infAdic_obsContList = interface;
  IXMLTNFe_infNFe_infAdic_obsFisco = interface;
  IXMLTNFe_infNFe_infAdic_obsFiscoList = interface;
  IXMLTNFe_infNFe_infAdic_procRef = interface;
  IXMLTNFe_infNFe_infAdic_procRefList = interface;
  IXMLTNFe_infNFe_exporta = interface;
  IXMLTNFe_infNFe_compra = interface;
  IXMLTNFe_infNFe_cana = interface;
  IXMLTNFe_infNFe_cana_forDia = interface;
  IXMLTNFe_infNFe_cana_forDiaList = interface;
  IXMLTNFe_infNFe_cana_deduc = interface;
  IXMLTNFe_infNFe_cana_deducList = interface;
  IXMLTNFe_infNFeSupl = interface;
  IXMLSignatureType_ds = interface;
  IXMLSignedInfoType_ds = interface;
  IXMLCanonicalizationMethod_ds = interface;
  IXMLSignatureMethod_ds = interface;
  IXMLReferenceType_ds = interface;
  IXMLTransformsType_ds = interface;
  IXMLTransformType_ds = interface;
  IXMLDigestMethod_ds = interface;
  IXMLSignatureValueType_ds = interface;
  IXMLKeyInfoType_ds = interface;
  IXMLX509DataType_ds = interface;
  IXMLTProtNFe = interface;
  IXMLTProtNFeList = interface;
  IXMLTProtNFe_infProt = interface;
  IXMLTEnviNFe = interface;
  IXMLTRetEnviNFe = interface;
  IXMLTRetEnviNFe_infRec = interface;
  IXMLTConsReciNFe = interface;
  IXMLTRetConsReciNFe = interface;
  IXMLTNfeProc = interface;
  IXMLTNFe_infNFe_det_prod_NVEList = interface;

{ IXMLTNFe }

  IXMLTNFe = interface(IXMLNode)
    ['{C2CC9A04-3F54-45CE-BDF4-9A8A76066CB9}']
    { Property Accessors }
    function Get_InfNFe: IXMLTNFe_infNFe;
    function Get_InfNFeSupl: IXMLTNFe_infNFeSupl;
    function Get_Signature: IXMLSignatureType_ds;
    { Methods & Properties }
    property InfNFe: IXMLTNFe_infNFe read Get_InfNFe;
    property InfNFeSupl: IXMLTNFe_infNFeSupl read Get_InfNFeSupl;
    property Signature: IXMLSignatureType_ds read Get_Signature;
  end;

{ IXMLTNFeList }

  IXMLTNFeList = interface(IXMLNodeCollection)
    ['{827E4D60-6C61-4D18-A10E-3B0032951C08}']
    { Methods & Properties }
    function Add: IXMLTNFe;
    function Insert(const Index: Integer): IXMLTNFe;

    function Get_Item(Index: Integer): IXMLTNFe;
    property Items[Index: Integer]: IXMLTNFe read Get_Item; default;
  end;

{ IXMLTNFe_infNFe }

  IXMLTNFe_infNFe = interface(IXMLNode)
    ['{2B78F2E4-3FAD-4C99-A116-D8CE267B32EF}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_Id: UnicodeString;
    function Get_Ide: IXMLTNFe_infNFe_ide;
    function Get_Emit: IXMLTNFe_infNFe_emit;
    function Get_Avulsa: IXMLTNFe_infNFe_avulsa;
    function Get_Dest: IXMLTNFe_infNFe_dest;
    function Get_Retirada: IXMLTLocal;
    function Get_Entrega: IXMLTLocal;
    function Get_AutXML: IXMLTNFe_infNFe_autXMLList;
    function Get_Det: IXMLTNFe_infNFe_detList;
    function Get_Total: IXMLTNFe_infNFe_total;
    function Get_Transp: IXMLTNFe_infNFe_transp;
    function Get_Cobr: IXMLTNFe_infNFe_cobr;
    function Get_Pag: IXMLTNFe_infNFe_pag;
    function Get_InfAdic: IXMLTNFe_infNFe_infAdic;
    function Get_Exporta: IXMLTNFe_infNFe_exporta;
    function Get_Compra: IXMLTNFe_infNFe_compra;
    function Get_Cana: IXMLTNFe_infNFe_cana;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property Id: UnicodeString read Get_Id write Set_Id;
    property Ide: IXMLTNFe_infNFe_ide read Get_Ide;
    property Emit: IXMLTNFe_infNFe_emit read Get_Emit;
    property Avulsa: IXMLTNFe_infNFe_avulsa read Get_Avulsa;
    property Dest: IXMLTNFe_infNFe_dest read Get_Dest;
    property Retirada: IXMLTLocal read Get_Retirada;
    property Entrega: IXMLTLocal read Get_Entrega;
    property AutXML: IXMLTNFe_infNFe_autXMLList read Get_AutXML;
    property Det: IXMLTNFe_infNFe_detList read Get_Det;
    property Total: IXMLTNFe_infNFe_total read Get_Total;
    property Transp: IXMLTNFe_infNFe_transp read Get_Transp;
    property Cobr: IXMLTNFe_infNFe_cobr read Get_Cobr;
    property Pag: IXMLTNFe_infNFe_pag read Get_Pag;
    property InfAdic: IXMLTNFe_infNFe_infAdic read Get_InfAdic;
    property Exporta: IXMLTNFe_infNFe_exporta read Get_Exporta;
    property Compra: IXMLTNFe_infNFe_compra read Get_Compra;
    property Cana: IXMLTNFe_infNFe_cana read Get_Cana;
  end;

{ IXMLTNFe_infNFe_ide }

  IXMLTNFe_infNFe_ide = interface(IXMLNode)
    ['{DCC1783E-67BD-4E5C-BF1D-CD591BFDA78F}']
    { Property Accessors }
    function Get_CUF: UnicodeString;
    function Get_CNF: UnicodeString;
    function Get_NatOp: UnicodeString;
    function Get_Mod_: UnicodeString;
    function Get_Serie: UnicodeString;
    function Get_NNF: UnicodeString;
    function Get_DhEmi: UnicodeString;
    function Get_DhSaiEnt: UnicodeString;
    function Get_TpNF: UnicodeString;
    function Get_IdDest: UnicodeString;
    function Get_CMunFG: UnicodeString;
    function Get_TpImp: UnicodeString;
    function Get_TpEmis: UnicodeString;
    function Get_CDV: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_FinNFe: UnicodeString;
    function Get_IndFinal: UnicodeString;
    function Get_IndPres: UnicodeString;
    function Get_ProcEmi: UnicodeString;
    function Get_VerProc: UnicodeString;
    function Get_DhCont: UnicodeString;
    function Get_XJust: UnicodeString;
    function Get_NFref: IXMLTNFe_infNFe_ide_NFrefList;
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_CNF(Value: UnicodeString);
    procedure Set_NatOp(Value: UnicodeString);
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_Serie(Value: UnicodeString);
    procedure Set_NNF(Value: UnicodeString);
    procedure Set_DhEmi(Value: UnicodeString);
    procedure Set_DhSaiEnt(Value: UnicodeString);
    procedure Set_TpNF(Value: UnicodeString);
    procedure Set_IdDest(Value: UnicodeString);
    procedure Set_CMunFG(Value: UnicodeString);
    procedure Set_TpImp(Value: UnicodeString);
    procedure Set_TpEmis(Value: UnicodeString);
    procedure Set_CDV(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_FinNFe(Value: UnicodeString);
    procedure Set_IndFinal(Value: UnicodeString);
    procedure Set_IndPres(Value: UnicodeString);
    procedure Set_ProcEmi(Value: UnicodeString);
    procedure Set_VerProc(Value: UnicodeString);
    procedure Set_DhCont(Value: UnicodeString);
    procedure Set_XJust(Value: UnicodeString);
    { Methods & Properties }
    property CUF: UnicodeString read Get_CUF write Set_CUF;
    property CNF: UnicodeString read Get_CNF write Set_CNF;
    property NatOp: UnicodeString read Get_NatOp write Set_NatOp;
    property Mod_: UnicodeString read Get_Mod_ write Set_Mod_;
    property Serie: UnicodeString read Get_Serie write Set_Serie;
    property NNF: UnicodeString read Get_NNF write Set_NNF;
    property DhEmi: UnicodeString read Get_DhEmi write Set_DhEmi;
    property DhSaiEnt: UnicodeString read Get_DhSaiEnt write Set_DhSaiEnt;
    property TpNF: UnicodeString read Get_TpNF write Set_TpNF;
    property IdDest: UnicodeString read Get_IdDest write Set_IdDest;
    property CMunFG: UnicodeString read Get_CMunFG write Set_CMunFG;
    property TpImp: UnicodeString read Get_TpImp write Set_TpImp;
    property TpEmis: UnicodeString read Get_TpEmis write Set_TpEmis;
    property CDV: UnicodeString read Get_CDV write Set_CDV;
    property TpAmb: UnicodeString read Get_TpAmb write Set_TpAmb;
    property FinNFe: UnicodeString read Get_FinNFe write Set_FinNFe;
    property IndFinal: UnicodeString read Get_IndFinal write Set_IndFinal;
    property IndPres: UnicodeString read Get_IndPres write Set_IndPres;
    property ProcEmi: UnicodeString read Get_ProcEmi write Set_ProcEmi;
    property VerProc: UnicodeString read Get_VerProc write Set_VerProc;
    property DhCont: UnicodeString read Get_DhCont write Set_DhCont;
    property XJust: UnicodeString read Get_XJust write Set_XJust;
    property NFref: IXMLTNFe_infNFe_ide_NFrefList read Get_NFref;
  end;

{ IXMLTNFe_infNFe_ide_NFref }

  IXMLTNFe_infNFe_ide_NFref = interface(IXMLNode)
    ['{6381B153-258A-455F-B105-02187D0EE92D}']
    { Property Accessors }
    function Get_RefNFe: UnicodeString;
    function Get_RefNF: IXMLTNFe_infNFe_ide_NFref_refNF;
    function Get_RefNFP: IXMLTNFe_infNFe_ide_NFref_refNFP;
    function Get_RefCTe: UnicodeString;
    function Get_RefECF: IXMLTNFe_infNFe_ide_NFref_refECF;
    procedure Set_RefNFe(Value: UnicodeString);
    procedure Set_RefCTe(Value: UnicodeString);
    { Methods & Properties }
    property RefNFe: UnicodeString read Get_RefNFe write Set_RefNFe;
    property RefNF: IXMLTNFe_infNFe_ide_NFref_refNF read Get_RefNF;
    property RefNFP: IXMLTNFe_infNFe_ide_NFref_refNFP read Get_RefNFP;
    property RefCTe: UnicodeString read Get_RefCTe write Set_RefCTe;
    property RefECF: IXMLTNFe_infNFe_ide_NFref_refECF read Get_RefECF;
  end;

{ IXMLTNFe_infNFe_ide_NFrefList }

  IXMLTNFe_infNFe_ide_NFrefList = interface(IXMLNodeCollection)
    ['{7E7552C1-A48A-41F1-A9E0-2D3A0A942ADE}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_ide_NFref;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_ide_NFref;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_ide_NFref;
    property Items[Index: Integer]: IXMLTNFe_infNFe_ide_NFref read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_ide_NFref_refNF }

  IXMLTNFe_infNFe_ide_NFref_refNF = interface(IXMLNode)
    ['{BB715C84-15CC-4F95-98FF-7A46CC8FD9D9}']
    { Property Accessors }
    function Get_CUF: UnicodeString;
    function Get_AAMM: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_Mod_: UnicodeString;
    function Get_Serie: UnicodeString;
    function Get_NNF: UnicodeString;
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_AAMM(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_Serie(Value: UnicodeString);
    procedure Set_NNF(Value: UnicodeString);
    { Methods & Properties }
    property CUF: UnicodeString read Get_CUF write Set_CUF;
    property AAMM: UnicodeString read Get_AAMM write Set_AAMM;
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property Mod_: UnicodeString read Get_Mod_ write Set_Mod_;
    property Serie: UnicodeString read Get_Serie write Set_Serie;
    property NNF: UnicodeString read Get_NNF write Set_NNF;
  end;

{ IXMLTNFe_infNFe_ide_NFref_refNFP }

  IXMLTNFe_infNFe_ide_NFref_refNFP = interface(IXMLNode)
    ['{3884D8BE-92C9-4F5C-A6C6-3DFE0DFAC2D8}']
    { Property Accessors }
    function Get_CUF: UnicodeString;
    function Get_AAMM: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_IE: UnicodeString;
    function Get_Mod_: UnicodeString;
    function Get_Serie: UnicodeString;
    function Get_NNF: UnicodeString;
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_AAMM(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_Serie(Value: UnicodeString);
    procedure Set_NNF(Value: UnicodeString);
    { Methods & Properties }
    property CUF: UnicodeString read Get_CUF write Set_CUF;
    property AAMM: UnicodeString read Get_AAMM write Set_AAMM;
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
    property IE: UnicodeString read Get_IE write Set_IE;
    property Mod_: UnicodeString read Get_Mod_ write Set_Mod_;
    property Serie: UnicodeString read Get_Serie write Set_Serie;
    property NNF: UnicodeString read Get_NNF write Set_NNF;
  end;

{ IXMLTNFe_infNFe_ide_NFref_refECF }

  IXMLTNFe_infNFe_ide_NFref_refECF = interface(IXMLNode)
    ['{6E4826B5-B500-4751-98B9-4F2169294344}']
    { Property Accessors }
    function Get_Mod_: UnicodeString;
    function Get_NECF: UnicodeString;
    function Get_NCOO: UnicodeString;
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_NECF(Value: UnicodeString);
    procedure Set_NCOO(Value: UnicodeString);
    { Methods & Properties }
    property Mod_: UnicodeString read Get_Mod_ write Set_Mod_;
    property NECF: UnicodeString read Get_NECF write Set_NECF;
    property NCOO: UnicodeString read Get_NCOO write Set_NCOO;
  end;

{ IXMLTNFe_infNFe_emit }

  IXMLTNFe_infNFe_emit = interface(IXMLNode)
    ['{1D3DD25A-C950-4DFC-BEEF-DE2EA06EB75B}']
    { Property Accessors }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_XNome: UnicodeString;
    function Get_XFant: UnicodeString;
    function Get_EnderEmit: IXMLTEnderEmi;
    function Get_IE: UnicodeString;
    function Get_IEST: UnicodeString;
    function Get_IM: UnicodeString;
    function Get_CNAE: UnicodeString;
    function Get_CRT: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_XNome(Value: UnicodeString);
    procedure Set_XFant(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_IEST(Value: UnicodeString);
    procedure Set_IM(Value: UnicodeString);
    procedure Set_CNAE(Value: UnicodeString);
    procedure Set_CRT(Value: UnicodeString);
    { Methods & Properties }
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
    property XNome: UnicodeString read Get_XNome write Set_XNome;
    property XFant: UnicodeString read Get_XFant write Set_XFant;
    property EnderEmit: IXMLTEnderEmi read Get_EnderEmit;
    property IE: UnicodeString read Get_IE write Set_IE;
    property IEST: UnicodeString read Get_IEST write Set_IEST;
    property IM: UnicodeString read Get_IM write Set_IM;
    property CNAE: UnicodeString read Get_CNAE write Set_CNAE;
    property CRT: UnicodeString read Get_CRT write Set_CRT;
  end;

{ IXMLTEnderEmi }

  IXMLTEnderEmi = interface(IXMLNode)
    ['{D41A5DB2-CB7A-42B4-A78C-49DE02C1ECDB}']
    { Property Accessors }
    function Get_XLgr: UnicodeString;
    function Get_Nro: UnicodeString;
    function Get_XCpl: UnicodeString;
    function Get_XBairro: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_CEP: UnicodeString;
    function Get_CPais: UnicodeString;
    function Get_XPais: UnicodeString;
    function Get_Fone: UnicodeString;
    procedure Set_XLgr(Value: UnicodeString);
    procedure Set_Nro(Value: UnicodeString);
    procedure Set_XCpl(Value: UnicodeString);
    procedure Set_XBairro(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_CEP(Value: UnicodeString);
    procedure Set_CPais(Value: UnicodeString);
    procedure Set_XPais(Value: UnicodeString);
    procedure Set_Fone(Value: UnicodeString);
    { Methods & Properties }
    property XLgr: UnicodeString read Get_XLgr write Set_XLgr;
    property Nro: UnicodeString read Get_Nro write Set_Nro;
    property XCpl: UnicodeString read Get_XCpl write Set_XCpl;
    property XBairro: UnicodeString read Get_XBairro write Set_XBairro;
    property CMun: UnicodeString read Get_CMun write Set_CMun;
    property XMun: UnicodeString read Get_XMun write Set_XMun;
    property UF: UnicodeString read Get_UF write Set_UF;
    property CEP: UnicodeString read Get_CEP write Set_CEP;
    property CPais: UnicodeString read Get_CPais write Set_CPais;
    property XPais: UnicodeString read Get_XPais write Set_XPais;
    property Fone: UnicodeString read Get_Fone write Set_Fone;
  end;

{ IXMLTNFe_infNFe_avulsa }

  IXMLTNFe_infNFe_avulsa = interface(IXMLNode)
    ['{E7E058D9-5409-4034-8CCC-397B072A1405}']
    { Property Accessors }
    function Get_CNPJ: UnicodeString;
    function Get_XOrgao: UnicodeString;
    function Get_Matr: UnicodeString;
    function Get_XAgente: UnicodeString;
    function Get_Fone: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_NDAR: UnicodeString;
    function Get_DEmi: UnicodeString;
    function Get_VDAR: UnicodeString;
    function Get_RepEmi: UnicodeString;
    function Get_DPag: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_XOrgao(Value: UnicodeString);
    procedure Set_Matr(Value: UnicodeString);
    procedure Set_XAgente(Value: UnicodeString);
    procedure Set_Fone(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_NDAR(Value: UnicodeString);
    procedure Set_DEmi(Value: UnicodeString);
    procedure Set_VDAR(Value: UnicodeString);
    procedure Set_RepEmi(Value: UnicodeString);
    procedure Set_DPag(Value: UnicodeString);
    { Methods & Properties }
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property XOrgao: UnicodeString read Get_XOrgao write Set_XOrgao;
    property Matr: UnicodeString read Get_Matr write Set_Matr;
    property XAgente: UnicodeString read Get_XAgente write Set_XAgente;
    property Fone: UnicodeString read Get_Fone write Set_Fone;
    property UF: UnicodeString read Get_UF write Set_UF;
    property NDAR: UnicodeString read Get_NDAR write Set_NDAR;
    property DEmi: UnicodeString read Get_DEmi write Set_DEmi;
    property VDAR: UnicodeString read Get_VDAR write Set_VDAR;
    property RepEmi: UnicodeString read Get_RepEmi write Set_RepEmi;
    property DPag: UnicodeString read Get_DPag write Set_DPag;
  end;

{ IXMLTNFe_infNFe_dest }

  IXMLTNFe_infNFe_dest = interface(IXMLNode)
    ['{0DB9FB26-C689-4814-AE60-1E78D2C1CD0F}']
    { Property Accessors }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_IdEstrangeiro: UnicodeString;
    function Get_XNome: UnicodeString;
    function Get_EnderDest: IXMLTEndereco;
    function Get_IndIEDest: UnicodeString;
    function Get_IE: UnicodeString;
    function Get_ISUF: UnicodeString;
    function Get_IM: UnicodeString;
    function Get_Email: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_IdEstrangeiro(Value: UnicodeString);
    procedure Set_XNome(Value: UnicodeString);
    procedure Set_IndIEDest(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_ISUF(Value: UnicodeString);
    procedure Set_IM(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    { Methods & Properties }
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
    property IdEstrangeiro: UnicodeString read Get_IdEstrangeiro write Set_IdEstrangeiro;
    property XNome: UnicodeString read Get_XNome write Set_XNome;
    property EnderDest: IXMLTEndereco read Get_EnderDest;
    property IndIEDest: UnicodeString read Get_IndIEDest write Set_IndIEDest;
    property IE: UnicodeString read Get_IE write Set_IE;
    property ISUF: UnicodeString read Get_ISUF write Set_ISUF;
    property IM: UnicodeString read Get_IM write Set_IM;
    property Email: UnicodeString read Get_Email write Set_Email;
  end;

{ IXMLTEndereco }

  IXMLTEndereco = interface(IXMLNode)
    ['{7596F25E-B73A-4185-8A97-E4E98FED902A}']
    { Property Accessors }
    function Get_XLgr: UnicodeString;
    function Get_Nro: UnicodeString;
    function Get_XCpl: UnicodeString;
    function Get_XBairro: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_CEP: UnicodeString;
    function Get_CPais: UnicodeString;
    function Get_XPais: UnicodeString;
    function Get_Fone: UnicodeString;
    procedure Set_XLgr(Value: UnicodeString);
    procedure Set_Nro(Value: UnicodeString);
    procedure Set_XCpl(Value: UnicodeString);
    procedure Set_XBairro(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_CEP(Value: UnicodeString);
    procedure Set_CPais(Value: UnicodeString);
    procedure Set_XPais(Value: UnicodeString);
    procedure Set_Fone(Value: UnicodeString);
    { Methods & Properties }
    property XLgr: UnicodeString read Get_XLgr write Set_XLgr;
    property Nro: UnicodeString read Get_Nro write Set_Nro;
    property XCpl: UnicodeString read Get_XCpl write Set_XCpl;
    property XBairro: UnicodeString read Get_XBairro write Set_XBairro;
    property CMun: UnicodeString read Get_CMun write Set_CMun;
    property XMun: UnicodeString read Get_XMun write Set_XMun;
    property UF: UnicodeString read Get_UF write Set_UF;
    property CEP: UnicodeString read Get_CEP write Set_CEP;
    property CPais: UnicodeString read Get_CPais write Set_CPais;
    property XPais: UnicodeString read Get_XPais write Set_XPais;
    property Fone: UnicodeString read Get_Fone write Set_Fone;
  end;

{ IXMLTLocal }

  IXMLTLocal = interface(IXMLNode)
    ['{BCB3DDAC-A387-4506-BBA9-7ED4FDB79927}']
    { Property Accessors }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_XLgr: UnicodeString;
    function Get_Nro: UnicodeString;
    function Get_XCpl: UnicodeString;
    function Get_XBairro: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_XLgr(Value: UnicodeString);
    procedure Set_Nro(Value: UnicodeString);
    procedure Set_XCpl(Value: UnicodeString);
    procedure Set_XBairro(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    { Methods & Properties }
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
    property XLgr: UnicodeString read Get_XLgr write Set_XLgr;
    property Nro: UnicodeString read Get_Nro write Set_Nro;
    property XCpl: UnicodeString read Get_XCpl write Set_XCpl;
    property XBairro: UnicodeString read Get_XBairro write Set_XBairro;
    property CMun: UnicodeString read Get_CMun write Set_CMun;
    property XMun: UnicodeString read Get_XMun write Set_XMun;
    property UF: UnicodeString read Get_UF write Set_UF;
  end;

{ IXMLTNFe_infNFe_autXML }

  IXMLTNFe_infNFe_autXML = interface(IXMLNode)
    ['{7E9D7942-EE4C-4DFA-90A4-9B74A7BA2E6E}']
    { Property Accessors }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    { Methods & Properties }
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
  end;

{ IXMLTNFe_infNFe_autXMLList }

  IXMLTNFe_infNFe_autXMLList = interface(IXMLNodeCollection)
    ['{C466DCFF-9F2E-4786-90BA-31BD134A6B26}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_autXML;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_autXML;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_autXML;
    property Items[Index: Integer]: IXMLTNFe_infNFe_autXML read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det }

  IXMLTNFe_infNFe_det = interface(IXMLNode)
    ['{479FEF7B-8963-4ED5-AFB0-3441764D2AA2}']
    { Property Accessors }
    function Get_NItem: UnicodeString;
    function Get_Prod: IXMLTNFe_infNFe_det_prod;
    function Get_Imposto: IXMLTNFe_infNFe_det_imposto;
    function Get_ImpostoDevol: IXMLTNFe_infNFe_det_impostoDevol;
    function Get_InfAdProd: UnicodeString;
    procedure Set_NItem(Value: UnicodeString);
    procedure Set_InfAdProd(Value: UnicodeString);
    { Methods & Properties }
    property NItem: UnicodeString read Get_NItem write Set_NItem;
    property Prod: IXMLTNFe_infNFe_det_prod read Get_Prod;
    property Imposto: IXMLTNFe_infNFe_det_imposto read Get_Imposto;
    property ImpostoDevol: IXMLTNFe_infNFe_det_impostoDevol read Get_ImpostoDevol;
    property InfAdProd: UnicodeString read Get_InfAdProd write Set_InfAdProd;
  end;

{ IXMLTNFe_infNFe_detList }

  IXMLTNFe_infNFe_detList = interface(IXMLNodeCollection)
    ['{679800A9-990D-4E0B-8320-13C8AFC8920C}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_det;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det;
    property Items[Index: Integer]: IXMLTNFe_infNFe_det read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det_prod }

  IXMLTNFe_infNFe_det_prod = interface(IXMLNode)
    ['{BC30430D-B0E7-4C5E-B34A-5C20DE96530E}']
    { Property Accessors }
    function Get_CProd: UnicodeString;
    function Get_CEAN: UnicodeString;
    function Get_XProd: UnicodeString;
    function Get_NCM: UnicodeString;
    function Get_NVE: IXMLTNFe_infNFe_det_prod_NVEList;
    function Get_CEST: UnicodeString;
    function Get_IndEscala: UnicodeString;
    function Get_CNPJFab: UnicodeString;
    function Get_CBenef: UnicodeString;
    function Get_EXTIPI: UnicodeString;
    function Get_CFOP: UnicodeString;
    function Get_UCom: UnicodeString;
    function Get_QCom: UnicodeString;
    function Get_VUnCom: UnicodeString;
    function Get_VProd: UnicodeString;
    function Get_CEANTrib: UnicodeString;
    function Get_UTrib: UnicodeString;
    function Get_QTrib: UnicodeString;
    function Get_VUnTrib: UnicodeString;
    function Get_VFrete: UnicodeString;
    function Get_VSeg: UnicodeString;
    function Get_VDesc: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_IndTot: UnicodeString;
    function Get_DI: IXMLTNFe_infNFe_det_prod_DIList;
    function Get_DetExport: IXMLTNFe_infNFe_det_prod_detExportList;
    function Get_XPed: UnicodeString;
    function Get_NItemPed: UnicodeString;
    function Get_NFCI: UnicodeString;
    function Get_Rastro: IXMLTNFe_infNFe_det_prod_rastroList;
    function Get_VeicProd: IXMLTNFe_infNFe_det_prod_veicProd;
    function Get_Med: IXMLTNFe_infNFe_det_prod_med;
    function Get_Arma: IXMLTNFe_infNFe_det_prod_armaList;
    function Get_Comb: IXMLTNFe_infNFe_det_prod_comb;
    function Get_NRECOPI: UnicodeString;
    procedure Set_CProd(Value: UnicodeString);
    procedure Set_CEAN(Value: UnicodeString);
    procedure Set_XProd(Value: UnicodeString);
    procedure Set_NCM(Value: UnicodeString);
    procedure Set_CEST(Value: UnicodeString);
    procedure Set_IndEscala(Value: UnicodeString);
    procedure Set_CNPJFab(Value: UnicodeString);
    procedure Set_CBenef(Value: UnicodeString);
    procedure Set_EXTIPI(Value: UnicodeString);
    procedure Set_CFOP(Value: UnicodeString);
    procedure Set_UCom(Value: UnicodeString);
    procedure Set_QCom(Value: UnicodeString);
    procedure Set_VUnCom(Value: UnicodeString);
    procedure Set_VProd(Value: UnicodeString);
    procedure Set_CEANTrib(Value: UnicodeString);
    procedure Set_UTrib(Value: UnicodeString);
    procedure Set_QTrib(Value: UnicodeString);
    procedure Set_VUnTrib(Value: UnicodeString);
    procedure Set_VFrete(Value: UnicodeString);
    procedure Set_VSeg(Value: UnicodeString);
    procedure Set_VDesc(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_IndTot(Value: UnicodeString);
    procedure Set_XPed(Value: UnicodeString);
    procedure Set_NItemPed(Value: UnicodeString);
    procedure Set_NFCI(Value: UnicodeString);
    procedure Set_NRECOPI(Value: UnicodeString);
    { Methods & Properties }
    property CProd: UnicodeString read Get_CProd write Set_CProd;
    property CEAN: UnicodeString read Get_CEAN write Set_CEAN;
    property XProd: UnicodeString read Get_XProd write Set_XProd;
    property NCM: UnicodeString read Get_NCM write Set_NCM;
    property NVE: IXMLTNFe_infNFe_det_prod_NVEList read Get_NVE;
    property CEST: UnicodeString read Get_CEST write Set_CEST;
    property IndEscala: UnicodeString read Get_IndEscala write Set_IndEscala;
    property CNPJFab: UnicodeString read Get_CNPJFab write Set_CNPJFab;
    property CBenef: UnicodeString read Get_CBenef write Set_CBenef;
    property EXTIPI: UnicodeString read Get_EXTIPI write Set_EXTIPI;
    property CFOP: UnicodeString read Get_CFOP write Set_CFOP;
    property UCom: UnicodeString read Get_UCom write Set_UCom;
    property QCom: UnicodeString read Get_QCom write Set_QCom;
    property VUnCom: UnicodeString read Get_VUnCom write Set_VUnCom;
    property VProd: UnicodeString read Get_VProd write Set_VProd;
    property CEANTrib: UnicodeString read Get_CEANTrib write Set_CEANTrib;
    property UTrib: UnicodeString read Get_UTrib write Set_UTrib;
    property QTrib: UnicodeString read Get_QTrib write Set_QTrib;
    property VUnTrib: UnicodeString read Get_VUnTrib write Set_VUnTrib;
    property VFrete: UnicodeString read Get_VFrete write Set_VFrete;
    property VSeg: UnicodeString read Get_VSeg write Set_VSeg;
    property VDesc: UnicodeString read Get_VDesc write Set_VDesc;
    property VOutro: UnicodeString read Get_VOutro write Set_VOutro;
    property IndTot: UnicodeString read Get_IndTot write Set_IndTot;
    property DI: IXMLTNFe_infNFe_det_prod_DIList read Get_DI;
    property DetExport: IXMLTNFe_infNFe_det_prod_detExportList read Get_DetExport;
    property XPed: UnicodeString read Get_XPed write Set_XPed;
    property NItemPed: UnicodeString read Get_NItemPed write Set_NItemPed;
    property NFCI: UnicodeString read Get_NFCI write Set_NFCI;
    property Rastro: IXMLTNFe_infNFe_det_prod_rastroList read Get_Rastro;
    property VeicProd: IXMLTNFe_infNFe_det_prod_veicProd read Get_VeicProd;
    property Med: IXMLTNFe_infNFe_det_prod_med read Get_Med;
    property Arma: IXMLTNFe_infNFe_det_prod_armaList read Get_Arma;
    property Comb: IXMLTNFe_infNFe_det_prod_comb read Get_Comb;
    property NRECOPI: UnicodeString read Get_NRECOPI write Set_NRECOPI;
  end;

{ IXMLTNFe_infNFe_det_prod_DI }

  IXMLTNFe_infNFe_det_prod_DI = interface(IXMLNode)
    ['{AA77AE67-C2C0-49CE-AB6C-03F87FF96358}']
    { Property Accessors }
    function Get_NDI: UnicodeString;
    function Get_DDI: UnicodeString;
    function Get_XLocDesemb: UnicodeString;
    function Get_UFDesemb: UnicodeString;
    function Get_DDesemb: UnicodeString;
    function Get_TpViaTransp: UnicodeString;
    function Get_VAFRMM: UnicodeString;
    function Get_TpIntermedio: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_UFTerceiro: UnicodeString;
    function Get_CExportador: UnicodeString;
    function Get_Adi: IXMLTNFe_infNFe_det_prod_DI_adiList;
    procedure Set_NDI(Value: UnicodeString);
    procedure Set_DDI(Value: UnicodeString);
    procedure Set_XLocDesemb(Value: UnicodeString);
    procedure Set_UFDesemb(Value: UnicodeString);
    procedure Set_DDesemb(Value: UnicodeString);
    procedure Set_TpViaTransp(Value: UnicodeString);
    procedure Set_VAFRMM(Value: UnicodeString);
    procedure Set_TpIntermedio(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_UFTerceiro(Value: UnicodeString);
    procedure Set_CExportador(Value: UnicodeString);
    { Methods & Properties }
    property NDI: UnicodeString read Get_NDI write Set_NDI;
    property DDI: UnicodeString read Get_DDI write Set_DDI;
    property XLocDesemb: UnicodeString read Get_XLocDesemb write Set_XLocDesemb;
    property UFDesemb: UnicodeString read Get_UFDesemb write Set_UFDesemb;
    property DDesemb: UnicodeString read Get_DDesemb write Set_DDesemb;
    property TpViaTransp: UnicodeString read Get_TpViaTransp write Set_TpViaTransp;
    property VAFRMM: UnicodeString read Get_VAFRMM write Set_VAFRMM;
    property TpIntermedio: UnicodeString read Get_TpIntermedio write Set_TpIntermedio;
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property UFTerceiro: UnicodeString read Get_UFTerceiro write Set_UFTerceiro;
    property CExportador: UnicodeString read Get_CExportador write Set_CExportador;
    property Adi: IXMLTNFe_infNFe_det_prod_DI_adiList read Get_Adi;
  end;

{ IXMLTNFe_infNFe_det_prod_DIList }

  IXMLTNFe_infNFe_det_prod_DIList = interface(IXMLNodeCollection)
    ['{93EC2922-5B6F-4F64-A468-88F94308C65C}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_det_prod_DI;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_DI;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_DI;
    property Items[Index: Integer]: IXMLTNFe_infNFe_det_prod_DI read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det_prod_DI_adi }

  IXMLTNFe_infNFe_det_prod_DI_adi = interface(IXMLNode)
    ['{4DEDC8A8-DE7F-469E-A120-506B93840C1A}']
    { Property Accessors }
    function Get_NAdicao: UnicodeString;
    function Get_NSeqAdic: UnicodeString;
    function Get_CFabricante: UnicodeString;
    function Get_VDescDI: UnicodeString;
    function Get_NDraw: UnicodeString;
    procedure Set_NAdicao(Value: UnicodeString);
    procedure Set_NSeqAdic(Value: UnicodeString);
    procedure Set_CFabricante(Value: UnicodeString);
    procedure Set_VDescDI(Value: UnicodeString);
    procedure Set_NDraw(Value: UnicodeString);
    { Methods & Properties }
    property NAdicao: UnicodeString read Get_NAdicao write Set_NAdicao;
    property NSeqAdic: UnicodeString read Get_NSeqAdic write Set_NSeqAdic;
    property CFabricante: UnicodeString read Get_CFabricante write Set_CFabricante;
    property VDescDI: UnicodeString read Get_VDescDI write Set_VDescDI;
    property NDraw: UnicodeString read Get_NDraw write Set_NDraw;
  end;

{ IXMLTNFe_infNFe_det_prod_DI_adiList }

  IXMLTNFe_infNFe_det_prod_DI_adiList = interface(IXMLNodeCollection)
    ['{6423EF95-3D73-44AC-B1C7-E4C4EF303CDE}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_det_prod_DI_adi;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_DI_adi;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_DI_adi;
    property Items[Index: Integer]: IXMLTNFe_infNFe_det_prod_DI_adi read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det_prod_detExport }

  IXMLTNFe_infNFe_det_prod_detExport = interface(IXMLNode)
    ['{6A608685-1846-4281-A4B2-5E092659F000}']
    { Property Accessors }
    function Get_NDraw: UnicodeString;
    function Get_ExportInd: IXMLTNFe_infNFe_det_prod_detExport_exportInd;
    procedure Set_NDraw(Value: UnicodeString);
    { Methods & Properties }
    property NDraw: UnicodeString read Get_NDraw write Set_NDraw;
    property ExportInd: IXMLTNFe_infNFe_det_prod_detExport_exportInd read Get_ExportInd;
  end;

{ IXMLTNFe_infNFe_det_prod_detExportList }

  IXMLTNFe_infNFe_det_prod_detExportList = interface(IXMLNodeCollection)
    ['{BC6ED286-510C-408E-883B-F2115139290D}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_det_prod_detExport;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_detExport;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_detExport;
    property Items[Index: Integer]: IXMLTNFe_infNFe_det_prod_detExport read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det_prod_detExport_exportInd }

  IXMLTNFe_infNFe_det_prod_detExport_exportInd = interface(IXMLNode)
    ['{AD32C0BD-9B6C-4A12-9958-D500738A8960}']
    { Property Accessors }
    function Get_NRE: UnicodeString;
    function Get_ChNFe: UnicodeString;
    function Get_QExport: UnicodeString;
    procedure Set_NRE(Value: UnicodeString);
    procedure Set_ChNFe(Value: UnicodeString);
    procedure Set_QExport(Value: UnicodeString);
    { Methods & Properties }
    property NRE: UnicodeString read Get_NRE write Set_NRE;
    property ChNFe: UnicodeString read Get_ChNFe write Set_ChNFe;
    property QExport: UnicodeString read Get_QExport write Set_QExport;
  end;

{ IXMLTNFe_infNFe_det_prod_rastro }

  IXMLTNFe_infNFe_det_prod_rastro = interface(IXMLNode)
    ['{3AF9E34B-C027-4AE8-A73E-3DEBAA965F08}']
    { Property Accessors }
    function Get_NLote: UnicodeString;
    function Get_QLote: UnicodeString;
    function Get_DFab: UnicodeString;
    function Get_DVal: UnicodeString;
    function Get_CAgreg: UnicodeString;
    procedure Set_NLote(Value: UnicodeString);
    procedure Set_QLote(Value: UnicodeString);
    procedure Set_DFab(Value: UnicodeString);
    procedure Set_DVal(Value: UnicodeString);
    procedure Set_CAgreg(Value: UnicodeString);
    { Methods & Properties }
    property NLote: UnicodeString read Get_NLote write Set_NLote;
    property QLote: UnicodeString read Get_QLote write Set_QLote;
    property DFab: UnicodeString read Get_DFab write Set_DFab;
    property DVal: UnicodeString read Get_DVal write Set_DVal;
    property CAgreg: UnicodeString read Get_CAgreg write Set_CAgreg;
  end;

{ IXMLTNFe_infNFe_det_prod_rastroList }

  IXMLTNFe_infNFe_det_prod_rastroList = interface(IXMLNodeCollection)
    ['{5324991D-53B7-4806-A228-62A1AE6C2FFB}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_det_prod_rastro;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_rastro;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_rastro;
    property Items[Index: Integer]: IXMLTNFe_infNFe_det_prod_rastro read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det_prod_veicProd }

  IXMLTNFe_infNFe_det_prod_veicProd = interface(IXMLNode)
    ['{89410EDB-3CD1-4298-A4E1-8DE465F40505}']
    { Property Accessors }
    function Get_TpOp: UnicodeString;
    function Get_Chassi: UnicodeString;
    function Get_CCor: UnicodeString;
    function Get_XCor: UnicodeString;
    function Get_Pot: UnicodeString;
    function Get_Cilin: UnicodeString;
    function Get_PesoL: UnicodeString;
    function Get_PesoB: UnicodeString;
    function Get_NSerie: UnicodeString;
    function Get_TpComb: UnicodeString;
    function Get_NMotor: UnicodeString;
    function Get_CMT: UnicodeString;
    function Get_Dist: UnicodeString;
    function Get_AnoMod: UnicodeString;
    function Get_AnoFab: UnicodeString;
    function Get_TpPint: UnicodeString;
    function Get_TpVeic: UnicodeString;
    function Get_EspVeic: UnicodeString;
    function Get_VIN: UnicodeString;
    function Get_CondVeic: UnicodeString;
    function Get_CMod: UnicodeString;
    function Get_CCorDENATRAN: UnicodeString;
    function Get_Lota: UnicodeString;
    function Get_TpRest: UnicodeString;
    procedure Set_TpOp(Value: UnicodeString);
    procedure Set_Chassi(Value: UnicodeString);
    procedure Set_CCor(Value: UnicodeString);
    procedure Set_XCor(Value: UnicodeString);
    procedure Set_Pot(Value: UnicodeString);
    procedure Set_Cilin(Value: UnicodeString);
    procedure Set_PesoL(Value: UnicodeString);
    procedure Set_PesoB(Value: UnicodeString);
    procedure Set_NSerie(Value: UnicodeString);
    procedure Set_TpComb(Value: UnicodeString);
    procedure Set_NMotor(Value: UnicodeString);
    procedure Set_CMT(Value: UnicodeString);
    procedure Set_Dist(Value: UnicodeString);
    procedure Set_AnoMod(Value: UnicodeString);
    procedure Set_AnoFab(Value: UnicodeString);
    procedure Set_TpPint(Value: UnicodeString);
    procedure Set_TpVeic(Value: UnicodeString);
    procedure Set_EspVeic(Value: UnicodeString);
    procedure Set_VIN(Value: UnicodeString);
    procedure Set_CondVeic(Value: UnicodeString);
    procedure Set_CMod(Value: UnicodeString);
    procedure Set_CCorDENATRAN(Value: UnicodeString);
    procedure Set_Lota(Value: UnicodeString);
    procedure Set_TpRest(Value: UnicodeString);
    { Methods & Properties }
    property TpOp: UnicodeString read Get_TpOp write Set_TpOp;
    property Chassi: UnicodeString read Get_Chassi write Set_Chassi;
    property CCor: UnicodeString read Get_CCor write Set_CCor;
    property XCor: UnicodeString read Get_XCor write Set_XCor;
    property Pot: UnicodeString read Get_Pot write Set_Pot;
    property Cilin: UnicodeString read Get_Cilin write Set_Cilin;
    property PesoL: UnicodeString read Get_PesoL write Set_PesoL;
    property PesoB: UnicodeString read Get_PesoB write Set_PesoB;
    property NSerie: UnicodeString read Get_NSerie write Set_NSerie;
    property TpComb: UnicodeString read Get_TpComb write Set_TpComb;
    property NMotor: UnicodeString read Get_NMotor write Set_NMotor;
    property CMT: UnicodeString read Get_CMT write Set_CMT;
    property Dist: UnicodeString read Get_Dist write Set_Dist;
    property AnoMod: UnicodeString read Get_AnoMod write Set_AnoMod;
    property AnoFab: UnicodeString read Get_AnoFab write Set_AnoFab;
    property TpPint: UnicodeString read Get_TpPint write Set_TpPint;
    property TpVeic: UnicodeString read Get_TpVeic write Set_TpVeic;
    property EspVeic: UnicodeString read Get_EspVeic write Set_EspVeic;
    property VIN: UnicodeString read Get_VIN write Set_VIN;
    property CondVeic: UnicodeString read Get_CondVeic write Set_CondVeic;
    property CMod: UnicodeString read Get_CMod write Set_CMod;
    property CCorDENATRAN: UnicodeString read Get_CCorDENATRAN write Set_CCorDENATRAN;
    property Lota: UnicodeString read Get_Lota write Set_Lota;
    property TpRest: UnicodeString read Get_TpRest write Set_TpRest;
  end;

{ IXMLTNFe_infNFe_det_prod_med }

  IXMLTNFe_infNFe_det_prod_med = interface(IXMLNode)
    ['{B2F3A36B-DB62-41E0-AEF1-C4B4AFA49DB1}']
    { Property Accessors }
    function Get_CProdANVISA: UnicodeString;
    function Get_VPMC: UnicodeString;
    procedure Set_CProdANVISA(Value: UnicodeString);
    procedure Set_VPMC(Value: UnicodeString);
    { Methods & Properties }
    property CProdANVISA: UnicodeString read Get_CProdANVISA write Set_CProdANVISA;
    property VPMC: UnicodeString read Get_VPMC write Set_VPMC;
  end;

{ IXMLTNFe_infNFe_det_prod_arma }

  IXMLTNFe_infNFe_det_prod_arma = interface(IXMLNode)
    ['{1D9E5950-CAF0-4D22-8271-FC97042B728A}']
    { Property Accessors }
    function Get_TpArma: UnicodeString;
    function Get_NSerie: UnicodeString;
    function Get_NCano: UnicodeString;
    function Get_Descr: UnicodeString;
    procedure Set_TpArma(Value: UnicodeString);
    procedure Set_NSerie(Value: UnicodeString);
    procedure Set_NCano(Value: UnicodeString);
    procedure Set_Descr(Value: UnicodeString);
    { Methods & Properties }
    property TpArma: UnicodeString read Get_TpArma write Set_TpArma;
    property NSerie: UnicodeString read Get_NSerie write Set_NSerie;
    property NCano: UnicodeString read Get_NCano write Set_NCano;
    property Descr: UnicodeString read Get_Descr write Set_Descr;
  end;

{ IXMLTNFe_infNFe_det_prod_armaList }

  IXMLTNFe_infNFe_det_prod_armaList = interface(IXMLNodeCollection)
    ['{73A39C5F-0CC5-4F69-9B27-7420F1CAC900}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_det_prod_arma;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_arma;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_arma;
    property Items[Index: Integer]: IXMLTNFe_infNFe_det_prod_arma read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_det_prod_comb }

  IXMLTNFe_infNFe_det_prod_comb = interface(IXMLNode)
    ['{120E3D53-A72F-43EE-8CFF-123625003182}']
    { Property Accessors }
    function Get_CProdANP: UnicodeString;
    function Get_DescANP: UnicodeString;
    function Get_PGLP: UnicodeString;
    function Get_PGNn: UnicodeString;
    function Get_PGNi: UnicodeString;
    function Get_VPart: UnicodeString;
    function Get_CODIF: UnicodeString;
    function Get_QTemp: UnicodeString;
    function Get_UFCons: UnicodeString;
    function Get_CIDE: IXMLTNFe_infNFe_det_prod_comb_CIDE;
    function Get_Encerrante: IXMLTNFe_infNFe_det_prod_comb_encerrante;
    procedure Set_CProdANP(Value: UnicodeString);
    procedure Set_DescANP(Value: UnicodeString);
    procedure Set_PGLP(Value: UnicodeString);
    procedure Set_PGNn(Value: UnicodeString);
    procedure Set_PGNi(Value: UnicodeString);
    procedure Set_VPart(Value: UnicodeString);
    procedure Set_CODIF(Value: UnicodeString);
    procedure Set_QTemp(Value: UnicodeString);
    procedure Set_UFCons(Value: UnicodeString);
    { Methods & Properties }
    property CProdANP: UnicodeString read Get_CProdANP write Set_CProdANP;
    property DescANP: UnicodeString read Get_DescANP write Set_DescANP;
    property PGLP: UnicodeString read Get_PGLP write Set_PGLP;
    property PGNn: UnicodeString read Get_PGNn write Set_PGNn;
    property PGNi: UnicodeString read Get_PGNi write Set_PGNi;
    property VPart: UnicodeString read Get_VPart write Set_VPart;
    property CODIF: UnicodeString read Get_CODIF write Set_CODIF;
    property QTemp: UnicodeString read Get_QTemp write Set_QTemp;
    property UFCons: UnicodeString read Get_UFCons write Set_UFCons;
    property CIDE: IXMLTNFe_infNFe_det_prod_comb_CIDE read Get_CIDE;
    property Encerrante: IXMLTNFe_infNFe_det_prod_comb_encerrante read Get_Encerrante;
  end;

{ IXMLTNFe_infNFe_det_prod_comb_CIDE }

  IXMLTNFe_infNFe_det_prod_comb_CIDE = interface(IXMLNode)
    ['{C82E38D8-81FA-4A2C-87B5-B83EDD9046FC}']
    { Property Accessors }
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCIDE: UnicodeString;
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCIDE(Value: UnicodeString);
    { Methods & Properties }
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VCIDE: UnicodeString read Get_VCIDE write Set_VCIDE;
  end;

{ IXMLTNFe_infNFe_det_prod_comb_encerrante }

  IXMLTNFe_infNFe_det_prod_comb_encerrante = interface(IXMLNode)
    ['{550FFCE1-8F5C-491C-B28F-42870CFAC13C}']
    { Property Accessors }
    function Get_NBico: UnicodeString;
    function Get_NBomba: UnicodeString;
    function Get_NTanque: UnicodeString;
    function Get_VEncIni: UnicodeString;
    function Get_VEncFin: UnicodeString;
    procedure Set_NBico(Value: UnicodeString);
    procedure Set_NBomba(Value: UnicodeString);
    procedure Set_NTanque(Value: UnicodeString);
    procedure Set_VEncIni(Value: UnicodeString);
    procedure Set_VEncFin(Value: UnicodeString);
    { Methods & Properties }
    property NBico: UnicodeString read Get_NBico write Set_NBico;
    property NBomba: UnicodeString read Get_NBomba write Set_NBomba;
    property NTanque: UnicodeString read Get_NTanque write Set_NTanque;
    property VEncIni: UnicodeString read Get_VEncIni write Set_VEncIni;
    property VEncFin: UnicodeString read Get_VEncFin write Set_VEncFin;
  end;

{ IXMLTNFe_infNFe_det_imposto }

  IXMLTNFe_infNFe_det_imposto = interface(IXMLNode)
    ['{A92030E2-00CC-470D-A480-54AB71A2556B}']
    { Property Accessors }
    function Get_VTotTrib: UnicodeString;
    function Get_ICMS: IXMLTNFe_infNFe_det_imposto_ICMS;
    function Get_IPI: IXMLTIpi;
    function Get_II: IXMLTNFe_infNFe_det_imposto_II;
    function Get_ISSQN: IXMLTNFe_infNFe_det_imposto_ISSQN;
    function Get_PIS: IXMLTNFe_infNFe_det_imposto_PIS;
    function Get_PISST: IXMLTNFe_infNFe_det_imposto_PISST;
    function Get_COFINS: IXMLTNFe_infNFe_det_imposto_COFINS;
    function Get_COFINSST: IXMLTNFe_infNFe_det_imposto_COFINSST;
    function Get_ICMSUFDest: IXMLTNFe_infNFe_det_imposto_ICMSUFDest;
    procedure Set_VTotTrib(Value: UnicodeString);
    { Methods & Properties }
    property VTotTrib: UnicodeString read Get_VTotTrib write Set_VTotTrib;
    property ICMS: IXMLTNFe_infNFe_det_imposto_ICMS read Get_ICMS;
    property IPI: IXMLTIpi read Get_IPI;
    property II: IXMLTNFe_infNFe_det_imposto_II read Get_II;
    property ISSQN: IXMLTNFe_infNFe_det_imposto_ISSQN read Get_ISSQN;
    property PIS: IXMLTNFe_infNFe_det_imposto_PIS read Get_PIS;
    property PISST: IXMLTNFe_infNFe_det_imposto_PISST read Get_PISST;
    property COFINS: IXMLTNFe_infNFe_det_imposto_COFINS read Get_COFINS;
    property COFINSST: IXMLTNFe_infNFe_det_imposto_COFINSST read Get_COFINSST;
    property ICMSUFDest: IXMLTNFe_infNFe_det_imposto_ICMSUFDest read Get_ICMSUFDest;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS }

  IXMLTNFe_infNFe_det_imposto_ICMS = interface(IXMLNode)
    ['{F35F8430-C9ED-4146-A8C5-32614C22F66C}']
    { Property Accessors }
    function Get_ICMS00: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00;
    function Get_ICMS10: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10;
    function Get_ICMS20: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20;
    function Get_ICMS30: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30;
    function Get_ICMS40: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40;
    function Get_ICMS51: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51;
    function Get_ICMS60: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60;
    function Get_ICMS70: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70;
    function Get_ICMS90: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90;
    function Get_ICMSPart: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart;
    function Get_ICMSST: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST;
    function Get_ICMSSN101: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101;
    function Get_ICMSSN102: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102;
    function Get_ICMSSN201: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201;
    function Get_ICMSSN202: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202;
    function Get_ICMSSN500: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500;
    function Get_ICMSSN900: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900;
    { Methods & Properties }
    property ICMS00: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 read Get_ICMS00;
    property ICMS10: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 read Get_ICMS10;
    property ICMS20: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 read Get_ICMS20;
    property ICMS30: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 read Get_ICMS30;
    property ICMS40: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 read Get_ICMS40;
    property ICMS51: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 read Get_ICMS51;
    property ICMS60: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 read Get_ICMS60;
    property ICMS70: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 read Get_ICMS70;
    property ICMS90: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 read Get_ICMS90;
    property ICMSPart: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart read Get_ICMSPart;
    property ICMSST: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST read Get_ICMSST;
    property ICMSSN101: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 read Get_ICMSSN101;
    property ICMSSN102: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 read Get_ICMSSN102;
    property ICMSSN201: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 read Get_ICMSSN201;
    property ICMSSN202: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 read Get_ICMSSN202;
    property ICMSSN500: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 read Get_ICMSSN500;
    property ICMSSN900: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 read Get_ICMSSN900;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 = interface(IXMLNode)
    ['{6897D339-F852-4568-AE5F-EB1EBD4F9ED1}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property PFCP: UnicodeString read Get_PFCP write Set_PFCP;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 = interface(IXMLNode)
    ['{C61377EF-50BA-49C6-B799-BA7C38BD700E}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property VBCFCP: UnicodeString read Get_VBCFCP write Set_VBCFCP;
    property PFCP: UnicodeString read Get_PFCP write Set_PFCP;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 = interface(IXMLNode)
    ['{11E0AC32-D5D9-41DE-8D2A-9300CD7F1EB4}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property PRedBC: UnicodeString read Get_PRedBC write Set_PRedBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property VBCFCP: UnicodeString read Get_VBCFCP write Set_VBCFCP;
    property PFCP: UnicodeString read Get_PFCP write Set_PFCP;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
    property VICMSDeson: UnicodeString read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: UnicodeString read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 = interface(IXMLNode)
    ['{D900F8E9-028E-4714-96D6-1A572782266F}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
    property VICMSDeson: UnicodeString read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: UnicodeString read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 = interface(IXMLNode)
    ['{6D294C80-4AEC-4526-B875-69F7A8D2E7FE}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property VICMSDeson: UnicodeString read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: UnicodeString read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 = interface(IXMLNode)
    ['{941D9BE9-EE0A-4397-81C7-033BC348E825}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMSOp: UnicodeString;
    function Get_PDif: UnicodeString;
    function Get_VICMSDif: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMSOp(Value: UnicodeString);
    procedure Set_PDif(Value: UnicodeString);
    procedure Set_VICMSDif(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property PRedBC: UnicodeString read Get_PRedBC write Set_PRedBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMSOp: UnicodeString read Get_VICMSOp write Set_VICMSOp;
    property PDif: UnicodeString read Get_PDif write Set_PDif;
    property VICMSDif: UnicodeString read Get_VICMSDif write Set_VICMSDif;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property VBCFCP: UnicodeString read Get_VBCFCP write Set_VBCFCP;
    property PFCP: UnicodeString read Get_PFCP write Set_PFCP;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 = interface(IXMLNode)
    ['{BBFB1186-32E0-42FB-88CB-26904DA414B1}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_VBCSTRet: UnicodeString;
    function Get_PST: UnicodeString;
    function Get_VICMSSTRet: UnicodeString;
    function Get_VBCFCPSTRet: UnicodeString;
    function Get_PFCPSTRet: UnicodeString;
    function Get_VFCPSTRet: UnicodeString;
    function Get_PRedBCEfet: UnicodeString;
    function Get_VBCEfet: UnicodeString;
    function Get_PICMSEfet: UnicodeString;
    function Get_VICMSEfet: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBCSTRet(Value: UnicodeString);
    procedure Set_PST(Value: UnicodeString);
    procedure Set_VICMSSTRet(Value: UnicodeString);
    procedure Set_VBCFCPSTRet(Value: UnicodeString);
    procedure Set_PFCPSTRet(Value: UnicodeString);
    procedure Set_VFCPSTRet(Value: UnicodeString);
    procedure Set_PRedBCEfet(Value: UnicodeString);
    procedure Set_VBCEfet(Value: UnicodeString);
    procedure Set_PICMSEfet(Value: UnicodeString);
    procedure Set_VICMSEfet(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBCSTRet: UnicodeString read Get_VBCSTRet write Set_VBCSTRet;
    property PST: UnicodeString read Get_PST write Set_PST;
    property VICMSSTRet: UnicodeString read Get_VICMSSTRet write Set_VICMSSTRet;
    property VBCFCPSTRet: UnicodeString read Get_VBCFCPSTRet write Set_VBCFCPSTRet;
    property PFCPSTRet: UnicodeString read Get_PFCPSTRet write Set_PFCPSTRet;
    property VFCPSTRet: UnicodeString read Get_VFCPSTRet write Set_VFCPSTRet;
    property PRedBCEfet: UnicodeString read Get_PRedBCEfet write Set_PRedBCEfet;
    property VBCEfet: UnicodeString read Get_VBCEfet write Set_VBCEfet;
    property PICMSEfet: UnicodeString read Get_PICMSEfet write Set_PICMSEfet;
    property VICMSEfet: UnicodeString read Get_VICMSEfet write Set_VICMSEfet;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 = interface(IXMLNode)
    ['{DE45EFE0-2441-487D-B41C-D6C99A2C6AC7}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property PRedBC: UnicodeString read Get_PRedBC write Set_PRedBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property VBCFCP: UnicodeString read Get_VBCFCP write Set_VBCFCP;
    property PFCP: UnicodeString read Get_PFCP write Set_PFCP;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
    property VICMSDeson: UnicodeString read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: UnicodeString read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 = interface(IXMLNode)
    ['{A0104C60-A6C4-4C7C-A98B-3246A059E431}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PRedBC: UnicodeString read Get_PRedBC write Set_PRedBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property VBCFCP: UnicodeString read Get_VBCFCP write Set_VBCFCP;
    property PFCP: UnicodeString read Get_PFCP write Set_PFCP;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
    property VICMSDeson: UnicodeString read Get_VICMSDeson write Set_VICMSDeson;
    property MotDesICMS: UnicodeString read Get_MotDesICMS write Set_MotDesICMS;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart = interface(IXMLNode)
    ['{326EDBDE-59BD-41A4-BE23-C2DF465E847F}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_PBCOp: UnicodeString;
    function Get_UFST: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_PBCOp(Value: UnicodeString);
    procedure Set_UFST(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PRedBC: UnicodeString read Get_PRedBC write Set_PRedBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property PBCOp: UnicodeString read Get_PBCOp write Set_PBCOp;
    property UFST: UnicodeString read Get_UFST write Set_UFST;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST = interface(IXMLNode)
    ['{B928D2A3-14E4-4F65-9892-0F1A9EB67352}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_VBCSTRet: UnicodeString;
    function Get_VICMSSTRet: UnicodeString;
    function Get_VBCSTDest: UnicodeString;
    function Get_VICMSSTDest: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBCSTRet(Value: UnicodeString);
    procedure Set_VICMSSTRet(Value: UnicodeString);
    procedure Set_VBCSTDest(Value: UnicodeString);
    procedure Set_VICMSSTDest(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBCSTRet: UnicodeString read Get_VBCSTRet write Set_VBCSTRet;
    property VICMSSTRet: UnicodeString read Get_VICMSSTRet write Set_VICMSSTRet;
    property VBCSTDest: UnicodeString read Get_VBCSTDest write Set_VBCSTDest;
    property VICMSSTDest: UnicodeString read Get_VICMSSTDest write Set_VICMSSTDest;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 = interface(IXMLNode)
    ['{097055F4-F6D7-417F-AF95-2089E6A6826E}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_PCredSN: UnicodeString;
    function Get_VCredICMSSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_PCredSN(Value: UnicodeString);
    procedure Set_VCredICMSSN(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CSOSN: UnicodeString read Get_CSOSN write Set_CSOSN;
    property PCredSN: UnicodeString read Get_PCredSN write Set_PCredSN;
    property VCredICMSSN: UnicodeString read Get_VCredICMSSN write Set_VCredICMSSN;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 = interface(IXMLNode)
    ['{E10086EF-862A-4CDF-AE2A-3AE3528A4FB1}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CSOSN: UnicodeString read Get_CSOSN write Set_CSOSN;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 = interface(IXMLNode)
    ['{1E332543-6970-4622-B8D9-094F2E780E08}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_PCredSN: UnicodeString;
    function Get_VCredICMSSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_PCredSN(Value: UnicodeString);
    procedure Set_VCredICMSSN(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CSOSN: UnicodeString read Get_CSOSN write Set_CSOSN;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
    property PCredSN: UnicodeString read Get_PCredSN write Set_PCredSN;
    property VCredICMSSN: UnicodeString read Get_VCredICMSSN write Set_VCredICMSSN;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 = interface(IXMLNode)
    ['{1F3FE67F-118B-4CCA-BB6E-7D37763CC580}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CSOSN: UnicodeString read Get_CSOSN write Set_CSOSN;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 = interface(IXMLNode)
    ['{CB89D075-E473-4236-884E-988A5787D937}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_VBCSTRet: UnicodeString;
    function Get_PST: UnicodeString;
    function Get_VICMSSTRet: UnicodeString;
    function Get_VBCFCPSTRet: UnicodeString;
    function Get_PFCPSTRet: UnicodeString;
    function Get_VFCPSTRet: UnicodeString;
    function Get_PRedBCEfet: UnicodeString;
    function Get_VBCEfet: UnicodeString;
    function Get_PICMSEfet: UnicodeString;
    function Get_VICMSEfet: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_VBCSTRet(Value: UnicodeString);
    procedure Set_PST(Value: UnicodeString);
    procedure Set_VICMSSTRet(Value: UnicodeString);
    procedure Set_VBCFCPSTRet(Value: UnicodeString);
    procedure Set_PFCPSTRet(Value: UnicodeString);
    procedure Set_VFCPSTRet(Value: UnicodeString);
    procedure Set_PRedBCEfet(Value: UnicodeString);
    procedure Set_VBCEfet(Value: UnicodeString);
    procedure Set_PICMSEfet(Value: UnicodeString);
    procedure Set_VICMSEfet(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CSOSN: UnicodeString read Get_CSOSN write Set_CSOSN;
    property VBCSTRet: UnicodeString read Get_VBCSTRet write Set_VBCSTRet;
    property PST: UnicodeString read Get_PST write Set_PST;
    property VICMSSTRet: UnicodeString read Get_VICMSSTRet write Set_VICMSSTRet;
    property VBCFCPSTRet: UnicodeString read Get_VBCFCPSTRet write Set_VBCFCPSTRet;
    property PFCPSTRet: UnicodeString read Get_PFCPSTRet write Set_PFCPSTRet;
    property VFCPSTRet: UnicodeString read Get_VFCPSTRet write Set_VFCPSTRet;
    property PRedBCEfet: UnicodeString read Get_PRedBCEfet write Set_PRedBCEfet;
    property VBCEfet: UnicodeString read Get_VBCEfet write Set_VBCEfet;
    property PICMSEfet: UnicodeString read Get_PICMSEfet write Set_PICMSEfet;
    property VICMSEfet: UnicodeString read Get_VICMSEfet write Set_VICMSEfet;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 }

  IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 = interface(IXMLNode)
    ['{BAC081EB-B44D-4C06-82D6-5A065D295BBC}']
    { Property Accessors }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_PCredSN: UnicodeString;
    function Get_VCredICMSSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_PCredSN(Value: UnicodeString);
    procedure Set_VCredICMSSN(Value: UnicodeString);
    { Methods & Properties }
    property Orig: UnicodeString read Get_Orig write Set_Orig;
    property CSOSN: UnicodeString read Get_CSOSN write Set_CSOSN;
    property ModBC: UnicodeString read Get_ModBC write Set_ModBC;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PRedBC: UnicodeString read Get_PRedBC write Set_PRedBC;
    property PICMS: UnicodeString read Get_PICMS write Set_PICMS;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property ModBCST: UnicodeString read Get_ModBCST write Set_ModBCST;
    property PMVAST: UnicodeString read Get_PMVAST write Set_PMVAST;
    property PRedBCST: UnicodeString read Get_PRedBCST write Set_PRedBCST;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property PICMSST: UnicodeString read Get_PICMSST write Set_PICMSST;
    property VICMSST: UnicodeString read Get_VICMSST write Set_VICMSST;
    property VBCFCPST: UnicodeString read Get_VBCFCPST write Set_VBCFCPST;
    property PFCPST: UnicodeString read Get_PFCPST write Set_PFCPST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
    property PCredSN: UnicodeString read Get_PCredSN write Set_PCredSN;
    property VCredICMSSN: UnicodeString read Get_VCredICMSSN write Set_VCredICMSSN;
  end;

{ IXMLTIpi }

  IXMLTIpi = interface(IXMLNode)
    ['{BEB5FC5C-EC8B-4BF2-8CAE-B0C6E88B5736}']
    { Property Accessors }
    function Get_CNPJProd: UnicodeString;
    function Get_CSelo: UnicodeString;
    function Get_QSelo: UnicodeString;
    function Get_CEnq: UnicodeString;
    function Get_IPITrib: IXMLTIpi_IPITrib;
    function Get_IPINT: IXMLTIpi_IPINT;
    procedure Set_CNPJProd(Value: UnicodeString);
    procedure Set_CSelo(Value: UnicodeString);
    procedure Set_QSelo(Value: UnicodeString);
    procedure Set_CEnq(Value: UnicodeString);
    { Methods & Properties }
    property CNPJProd: UnicodeString read Get_CNPJProd write Set_CNPJProd;
    property CSelo: UnicodeString read Get_CSelo write Set_CSelo;
    property QSelo: UnicodeString read Get_QSelo write Set_QSelo;
    property CEnq: UnicodeString read Get_CEnq write Set_CEnq;
    property IPITrib: IXMLTIpi_IPITrib read Get_IPITrib;
    property IPINT: IXMLTIpi_IPINT read Get_IPINT;
  end;

{ IXMLTIpi_IPITrib }

  IXMLTIpi_IPITrib = interface(IXMLNode)
    ['{9498D0FB-9041-4498-B06F-1BD56454D7E5}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PIPI: UnicodeString;
    function Get_QUnid: UnicodeString;
    function Get_VUnid: UnicodeString;
    function Get_VIPI: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PIPI(Value: UnicodeString);
    procedure Set_QUnid(Value: UnicodeString);
    procedure Set_VUnid(Value: UnicodeString);
    procedure Set_VIPI(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PIPI: UnicodeString read Get_PIPI write Set_PIPI;
    property QUnid: UnicodeString read Get_QUnid write Set_QUnid;
    property VUnid: UnicodeString read Get_VUnid write Set_VUnid;
    property VIPI: UnicodeString read Get_VIPI write Set_VIPI;
  end;

{ IXMLTIpi_IPINT }

  IXMLTIpi_IPINT = interface(IXMLNode)
    ['{BD8363D0-D578-45AA-9F7D-6D966A7C219D}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
  end;

{ IXMLTNFe_infNFe_det_imposto_II }

  IXMLTNFe_infNFe_det_imposto_II = interface(IXMLNode)
    ['{1539BE8E-9DC6-46DD-9AA1-4F0F1FEE1F06}']
    { Property Accessors }
    function Get_VBC: UnicodeString;
    function Get_VDespAdu: UnicodeString;
    function Get_VII: UnicodeString;
    function Get_VIOF: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VDespAdu(Value: UnicodeString);
    procedure Set_VII(Value: UnicodeString);
    procedure Set_VIOF(Value: UnicodeString);
    { Methods & Properties }
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property VDespAdu: UnicodeString read Get_VDespAdu write Set_VDespAdu;
    property VII: UnicodeString read Get_VII write Set_VII;
    property VIOF: UnicodeString read Get_VIOF write Set_VIOF;
  end;

{ IXMLTNFe_infNFe_det_imposto_ISSQN }

  IXMLTNFe_infNFe_det_imposto_ISSQN = interface(IXMLNode)
    ['{331EBECE-9141-4E8A-B402-15B9303F6AB3}']
    { Property Accessors }
    function Get_VBC: UnicodeString;
    function Get_VAliq: UnicodeString;
    function Get_VISSQN: UnicodeString;
    function Get_CMunFG: UnicodeString;
    function Get_CListServ: UnicodeString;
    function Get_VDeducao: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_VDescIncond: UnicodeString;
    function Get_VDescCond: UnicodeString;
    function Get_VISSRet: UnicodeString;
    function Get_IndISS: UnicodeString;
    function Get_CServico: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_CPais: UnicodeString;
    function Get_NProcesso: UnicodeString;
    function Get_IndIncentivo: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VAliq(Value: UnicodeString);
    procedure Set_VISSQN(Value: UnicodeString);
    procedure Set_CMunFG(Value: UnicodeString);
    procedure Set_CListServ(Value: UnicodeString);
    procedure Set_VDeducao(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_VDescIncond(Value: UnicodeString);
    procedure Set_VDescCond(Value: UnicodeString);
    procedure Set_VISSRet(Value: UnicodeString);
    procedure Set_IndISS(Value: UnicodeString);
    procedure Set_CServico(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_CPais(Value: UnicodeString);
    procedure Set_NProcesso(Value: UnicodeString);
    procedure Set_IndIncentivo(Value: UnicodeString);
    { Methods & Properties }
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property VAliq: UnicodeString read Get_VAliq write Set_VAliq;
    property VISSQN: UnicodeString read Get_VISSQN write Set_VISSQN;
    property CMunFG: UnicodeString read Get_CMunFG write Set_CMunFG;
    property CListServ: UnicodeString read Get_CListServ write Set_CListServ;
    property VDeducao: UnicodeString read Get_VDeducao write Set_VDeducao;
    property VOutro: UnicodeString read Get_VOutro write Set_VOutro;
    property VDescIncond: UnicodeString read Get_VDescIncond write Set_VDescIncond;
    property VDescCond: UnicodeString read Get_VDescCond write Set_VDescCond;
    property VISSRet: UnicodeString read Get_VISSRet write Set_VISSRet;
    property IndISS: UnicodeString read Get_IndISS write Set_IndISS;
    property CServico: UnicodeString read Get_CServico write Set_CServico;
    property CMun: UnicodeString read Get_CMun write Set_CMun;
    property CPais: UnicodeString read Get_CPais write Set_CPais;
    property NProcesso: UnicodeString read Get_NProcesso write Set_NProcesso;
    property IndIncentivo: UnicodeString read Get_IndIncentivo write Set_IndIncentivo;
  end;

{ IXMLTNFe_infNFe_det_imposto_PIS }

  IXMLTNFe_infNFe_det_imposto_PIS = interface(IXMLNode)
    ['{9DD75285-1F3F-4E36-ABB4-56B406622C50}']
    { Property Accessors }
    function Get_PISAliq: IXMLTNFe_infNFe_det_imposto_PIS_PISAliq;
    function Get_PISQtde: IXMLTNFe_infNFe_det_imposto_PIS_PISQtde;
    function Get_PISNT: IXMLTNFe_infNFe_det_imposto_PIS_PISNT;
    function Get_PISOutr: IXMLTNFe_infNFe_det_imposto_PIS_PISOutr;
    { Methods & Properties }
    property PISAliq: IXMLTNFe_infNFe_det_imposto_PIS_PISAliq read Get_PISAliq;
    property PISQtde: IXMLTNFe_infNFe_det_imposto_PIS_PISQtde read Get_PISQtde;
    property PISNT: IXMLTNFe_infNFe_det_imposto_PIS_PISNT read Get_PISNT;
    property PISOutr: IXMLTNFe_infNFe_det_imposto_PIS_PISOutr read Get_PISOutr;
  end;

{ IXMLTNFe_infNFe_det_imposto_PIS_PISAliq }

  IXMLTNFe_infNFe_det_imposto_PIS_PISAliq = interface(IXMLNode)
    ['{D4A42F30-9582-44A5-8415-AFE65CD8D686}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PPIS: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PPIS(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PPIS: UnicodeString read Get_PPIS write Set_PPIS;
    property VPIS: UnicodeString read Get_VPIS write Set_VPIS;
  end;

{ IXMLTNFe_infNFe_det_imposto_PIS_PISQtde }

  IXMLTNFe_infNFe_det_imposto_PIS_PISQtde = interface(IXMLNode)
    ['{20B5BCD5-FE8F-45E4-ACDA-EFFADD53379B}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VPIS: UnicodeString read Get_VPIS write Set_VPIS;
  end;

{ IXMLTNFe_infNFe_det_imposto_PIS_PISNT }

  IXMLTNFe_infNFe_det_imposto_PIS_PISNT = interface(IXMLNode)
    ['{A07F20E1-6CDA-451B-B7BE-8E3682465394}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
  end;

{ IXMLTNFe_infNFe_det_imposto_PIS_PISOutr }

  IXMLTNFe_infNFe_det_imposto_PIS_PISOutr = interface(IXMLNode)
    ['{CC7A3CE1-37AE-4EED-B769-0398A49B010B}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PPIS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PPIS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PPIS: UnicodeString read Get_PPIS write Set_PPIS;
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VPIS: UnicodeString read Get_VPIS write Set_VPIS;
  end;

{ IXMLTNFe_infNFe_det_imposto_PISST }

  IXMLTNFe_infNFe_det_imposto_PISST = interface(IXMLNode)
    ['{B8BB219F-2A9F-4223-A532-D77CB1FBBD44}']
    { Property Accessors }
    function Get_VBC: UnicodeString;
    function Get_PPIS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PPIS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    { Methods & Properties }
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PPIS: UnicodeString read Get_PPIS write Set_PPIS;
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VPIS: UnicodeString read Get_VPIS write Set_VPIS;
  end;

{ IXMLTNFe_infNFe_det_imposto_COFINS }

  IXMLTNFe_infNFe_det_imposto_COFINS = interface(IXMLNode)
    ['{287DA7F5-07BE-4510-A957-EFD77F8BBF52}']
    { Property Accessors }
    function Get_COFINSAliq: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq;
    function Get_COFINSQtde: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde;
    function Get_COFINSNT: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT;
    function Get_COFINSOutr: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr;
    { Methods & Properties }
    property COFINSAliq: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq read Get_COFINSAliq;
    property COFINSQtde: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde read Get_COFINSQtde;
    property COFINSNT: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT read Get_COFINSNT;
    property COFINSOutr: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr read Get_COFINSOutr;
  end;

{ IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq }

  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq = interface(IXMLNode)
    ['{64E9E54B-652E-4AC2-A87A-B99F2597D944}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PCOFINS: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PCOFINS(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PCOFINS: UnicodeString read Get_PCOFINS write Set_PCOFINS;
    property VCOFINS: UnicodeString read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde }

  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde = interface(IXMLNode)
    ['{7499570D-317C-482D-8C57-524143AAC239}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VCOFINS: UnicodeString read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT }

  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT = interface(IXMLNode)
    ['{B62321A6-AFA7-4F64-99D7-A1EBDE7FDF3C}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
  end;

{ IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr }

  IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr = interface(IXMLNode)
    ['{53B0FA41-2048-4524-8A61-2E5BA0D3D7A7}']
    { Property Accessors }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PCOFINS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PCOFINS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    { Methods & Properties }
    property CST: UnicodeString read Get_CST write Set_CST;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PCOFINS: UnicodeString read Get_PCOFINS write Set_PCOFINS;
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VCOFINS: UnicodeString read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLTNFe_infNFe_det_imposto_COFINSST }

  IXMLTNFe_infNFe_det_imposto_COFINSST = interface(IXMLNode)
    ['{A6EF4E71-C14F-4B22-B3E0-CC66FD707701}']
    { Property Accessors }
    function Get_VBC: UnicodeString;
    function Get_PCOFINS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PCOFINS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    { Methods & Properties }
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property PCOFINS: UnicodeString read Get_PCOFINS write Set_PCOFINS;
    property QBCProd: UnicodeString read Get_QBCProd write Set_QBCProd;
    property VAliqProd: UnicodeString read Get_VAliqProd write Set_VAliqProd;
    property VCOFINS: UnicodeString read Get_VCOFINS write Set_VCOFINS;
  end;

{ IXMLTNFe_infNFe_det_imposto_ICMSUFDest }

  IXMLTNFe_infNFe_det_imposto_ICMSUFDest = interface(IXMLNode)
    ['{68CBB7DA-02CD-4D9B-B79F-082C862A9A96}']
    { Property Accessors }
    function Get_VBCUFDest: UnicodeString;
    function Get_VBCFCPUFDest: UnicodeString;
    function Get_PFCPUFDest: UnicodeString;
    function Get_PICMSUFDest: UnicodeString;
    function Get_PICMSInter: UnicodeString;
    function Get_PICMSInterPart: UnicodeString;
    function Get_VFCPUFDest: UnicodeString;
    function Get_VICMSUFDest: UnicodeString;
    function Get_VICMSUFRemet: UnicodeString;
    procedure Set_VBCUFDest(Value: UnicodeString);
    procedure Set_VBCFCPUFDest(Value: UnicodeString);
    procedure Set_PFCPUFDest(Value: UnicodeString);
    procedure Set_PICMSUFDest(Value: UnicodeString);
    procedure Set_PICMSInter(Value: UnicodeString);
    procedure Set_PICMSInterPart(Value: UnicodeString);
    procedure Set_VFCPUFDest(Value: UnicodeString);
    procedure Set_VICMSUFDest(Value: UnicodeString);
    procedure Set_VICMSUFRemet(Value: UnicodeString);
    { Methods & Properties }
    property VBCUFDest: UnicodeString read Get_VBCUFDest write Set_VBCUFDest;
    property VBCFCPUFDest: UnicodeString read Get_VBCFCPUFDest write Set_VBCFCPUFDest;
    property PFCPUFDest: UnicodeString read Get_PFCPUFDest write Set_PFCPUFDest;
    property PICMSUFDest: UnicodeString read Get_PICMSUFDest write Set_PICMSUFDest;
    property PICMSInter: UnicodeString read Get_PICMSInter write Set_PICMSInter;
    property PICMSInterPart: UnicodeString read Get_PICMSInterPart write Set_PICMSInterPart;
    property VFCPUFDest: UnicodeString read Get_VFCPUFDest write Set_VFCPUFDest;
    property VICMSUFDest: UnicodeString read Get_VICMSUFDest write Set_VICMSUFDest;
    property VICMSUFRemet: UnicodeString read Get_VICMSUFRemet write Set_VICMSUFRemet;
  end;

{ IXMLTNFe_infNFe_det_impostoDevol }

  IXMLTNFe_infNFe_det_impostoDevol = interface(IXMLNode)
    ['{F9F660E6-4E94-4657-8D00-A6B223150A23}']
    { Property Accessors }
    function Get_PDevol: UnicodeString;
    function Get_IPI: IXMLTNFe_infNFe_det_impostoDevol_IPI;
    procedure Set_PDevol(Value: UnicodeString);
    { Methods & Properties }
    property PDevol: UnicodeString read Get_PDevol write Set_PDevol;
    property IPI: IXMLTNFe_infNFe_det_impostoDevol_IPI read Get_IPI;
  end;

{ IXMLTNFe_infNFe_det_impostoDevol_IPI }

  IXMLTNFe_infNFe_det_impostoDevol_IPI = interface(IXMLNode)
    ['{5CC32F48-FBAA-4104-8ADF-69DFA438B30B}']
    { Property Accessors }
    function Get_VIPIDevol: UnicodeString;
    procedure Set_VIPIDevol(Value: UnicodeString);
    { Methods & Properties }
    property VIPIDevol: UnicodeString read Get_VIPIDevol write Set_VIPIDevol;
  end;

{ IXMLTNFe_infNFe_total }

  IXMLTNFe_infNFe_total = interface(IXMLNode)
    ['{16933D64-C65E-4392-A356-70816D9A0D42}']
    { Property Accessors }
    function Get_ICMSTot: IXMLTNFe_infNFe_total_ICMSTot;
    function Get_ISSQNtot: IXMLTNFe_infNFe_total_ISSQNtot;
    function Get_RetTrib: IXMLTNFe_infNFe_total_retTrib;
    { Methods & Properties }
    property ICMSTot: IXMLTNFe_infNFe_total_ICMSTot read Get_ICMSTot;
    property ISSQNtot: IXMLTNFe_infNFe_total_ISSQNtot read Get_ISSQNtot;
    property RetTrib: IXMLTNFe_infNFe_total_retTrib read Get_RetTrib;
  end;

{ IXMLTNFe_infNFe_total_ICMSTot }

  IXMLTNFe_infNFe_total_ICMSTot = interface(IXMLNode)
    ['{5F1345AA-94EC-4091-9A75-44B47A7806B4}']
    { Property Accessors }
    function Get_VBC: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_VFCPUFDest: UnicodeString;
    function Get_VICMSUFDest: UnicodeString;
    function Get_VICMSUFRemet: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_VST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VFCPSTRet: UnicodeString;
    function Get_VProd: UnicodeString;
    function Get_VFrete: UnicodeString;
    function Get_VSeg: UnicodeString;
    function Get_VDesc: UnicodeString;
    function Get_VII: UnicodeString;
    function Get_VIPI: UnicodeString;
    function Get_VIPIDevol: UnicodeString;
    function Get_VPIS: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_VNF: UnicodeString;
    function Get_VTotTrib: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_VFCPUFDest(Value: UnicodeString);
    procedure Set_VICMSUFDest(Value: UnicodeString);
    procedure Set_VICMSUFRemet(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_VST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VFCPSTRet(Value: UnicodeString);
    procedure Set_VProd(Value: UnicodeString);
    procedure Set_VFrete(Value: UnicodeString);
    procedure Set_VSeg(Value: UnicodeString);
    procedure Set_VDesc(Value: UnicodeString);
    procedure Set_VII(Value: UnicodeString);
    procedure Set_VIPI(Value: UnicodeString);
    procedure Set_VIPIDevol(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_VNF(Value: UnicodeString);
    procedure Set_VTotTrib(Value: UnicodeString);
    { Methods & Properties }
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property VICMS: UnicodeString read Get_VICMS write Set_VICMS;
    property VICMSDeson: UnicodeString read Get_VICMSDeson write Set_VICMSDeson;
    property VFCPUFDest: UnicodeString read Get_VFCPUFDest write Set_VFCPUFDest;
    property VICMSUFDest: UnicodeString read Get_VICMSUFDest write Set_VICMSUFDest;
    property VICMSUFRemet: UnicodeString read Get_VICMSUFRemet write Set_VICMSUFRemet;
    property VFCP: UnicodeString read Get_VFCP write Set_VFCP;
    property VBCST: UnicodeString read Get_VBCST write Set_VBCST;
    property VST: UnicodeString read Get_VST write Set_VST;
    property VFCPST: UnicodeString read Get_VFCPST write Set_VFCPST;
    property VFCPSTRet: UnicodeString read Get_VFCPSTRet write Set_VFCPSTRet;
    property VProd: UnicodeString read Get_VProd write Set_VProd;
    property VFrete: UnicodeString read Get_VFrete write Set_VFrete;
    property VSeg: UnicodeString read Get_VSeg write Set_VSeg;
    property VDesc: UnicodeString read Get_VDesc write Set_VDesc;
    property VII: UnicodeString read Get_VII write Set_VII;
    property VIPI: UnicodeString read Get_VIPI write Set_VIPI;
    property VIPIDevol: UnicodeString read Get_VIPIDevol write Set_VIPIDevol;
    property VPIS: UnicodeString read Get_VPIS write Set_VPIS;
    property VCOFINS: UnicodeString read Get_VCOFINS write Set_VCOFINS;
    property VOutro: UnicodeString read Get_VOutro write Set_VOutro;
    property VNF: UnicodeString read Get_VNF write Set_VNF;
    property VTotTrib: UnicodeString read Get_VTotTrib write Set_VTotTrib;
  end;

{ IXMLTNFe_infNFe_total_ISSQNtot }

  IXMLTNFe_infNFe_total_ISSQNtot = interface(IXMLNode)
    ['{2875B4FE-8612-4195-995B-5B9AB4B19A18}']
    { Property Accessors }
    function Get_VServ: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_VISS: UnicodeString;
    function Get_VPIS: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    function Get_DCompet: UnicodeString;
    function Get_VDeducao: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_VDescIncond: UnicodeString;
    function Get_VDescCond: UnicodeString;
    function Get_VISSRet: UnicodeString;
    function Get_CRegTrib: UnicodeString;
    procedure Set_VServ(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VISS(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    procedure Set_DCompet(Value: UnicodeString);
    procedure Set_VDeducao(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_VDescIncond(Value: UnicodeString);
    procedure Set_VDescCond(Value: UnicodeString);
    procedure Set_VISSRet(Value: UnicodeString);
    procedure Set_CRegTrib(Value: UnicodeString);
    { Methods & Properties }
    property VServ: UnicodeString read Get_VServ write Set_VServ;
    property VBC: UnicodeString read Get_VBC write Set_VBC;
    property VISS: UnicodeString read Get_VISS write Set_VISS;
    property VPIS: UnicodeString read Get_VPIS write Set_VPIS;
    property VCOFINS: UnicodeString read Get_VCOFINS write Set_VCOFINS;
    property DCompet: UnicodeString read Get_DCompet write Set_DCompet;
    property VDeducao: UnicodeString read Get_VDeducao write Set_VDeducao;
    property VOutro: UnicodeString read Get_VOutro write Set_VOutro;
    property VDescIncond: UnicodeString read Get_VDescIncond write Set_VDescIncond;
    property VDescCond: UnicodeString read Get_VDescCond write Set_VDescCond;
    property VISSRet: UnicodeString read Get_VISSRet write Set_VISSRet;
    property CRegTrib: UnicodeString read Get_CRegTrib write Set_CRegTrib;
  end;

{ IXMLTNFe_infNFe_total_retTrib }

  IXMLTNFe_infNFe_total_retTrib = interface(IXMLNode)
    ['{A7858652-E80A-437F-906F-73B7ED2092CA}']
    { Property Accessors }
    function Get_VRetPIS: UnicodeString;
    function Get_VRetCOFINS: UnicodeString;
    function Get_VRetCSLL: UnicodeString;
    function Get_VBCIRRF: UnicodeString;
    function Get_VIRRF: UnicodeString;
    function Get_VBCRetPrev: UnicodeString;
    function Get_VRetPrev: UnicodeString;
    procedure Set_VRetPIS(Value: UnicodeString);
    procedure Set_VRetCOFINS(Value: UnicodeString);
    procedure Set_VRetCSLL(Value: UnicodeString);
    procedure Set_VBCIRRF(Value: UnicodeString);
    procedure Set_VIRRF(Value: UnicodeString);
    procedure Set_VBCRetPrev(Value: UnicodeString);
    procedure Set_VRetPrev(Value: UnicodeString);
    { Methods & Properties }
    property VRetPIS: UnicodeString read Get_VRetPIS write Set_VRetPIS;
    property VRetCOFINS: UnicodeString read Get_VRetCOFINS write Set_VRetCOFINS;
    property VRetCSLL: UnicodeString read Get_VRetCSLL write Set_VRetCSLL;
    property VBCIRRF: UnicodeString read Get_VBCIRRF write Set_VBCIRRF;
    property VIRRF: UnicodeString read Get_VIRRF write Set_VIRRF;
    property VBCRetPrev: UnicodeString read Get_VBCRetPrev write Set_VBCRetPrev;
    property VRetPrev: UnicodeString read Get_VRetPrev write Set_VRetPrev;
  end;

{ IXMLTNFe_infNFe_transp }

  IXMLTNFe_infNFe_transp = interface(IXMLNode)
    ['{50DAADCF-C862-4281-80CE-BA22288D0E2C}']
    { Property Accessors }
    function Get_ModFrete: UnicodeString;
    function Get_Transporta: IXMLTNFe_infNFe_transp_transporta;
    function Get_RetTransp: IXMLTNFe_infNFe_transp_retTransp;
    function Get_VeicTransp: IXMLTVeiculo;
    function Get_Reboque: IXMLTVeiculoList;
    function Get_Vagao: UnicodeString;
    function Get_Balsa: UnicodeString;
    function Get_Vol: IXMLTNFe_infNFe_transp_volList;
    procedure Set_ModFrete(Value: UnicodeString);
    procedure Set_Vagao(Value: UnicodeString);
    procedure Set_Balsa(Value: UnicodeString);
    { Methods & Properties }
    property ModFrete: UnicodeString read Get_ModFrete write Set_ModFrete;
    property Transporta: IXMLTNFe_infNFe_transp_transporta read Get_Transporta;
    property RetTransp: IXMLTNFe_infNFe_transp_retTransp read Get_RetTransp;
    property VeicTransp: IXMLTVeiculo read Get_VeicTransp;
    property Reboque: IXMLTVeiculoList read Get_Reboque;
    property Vagao: UnicodeString read Get_Vagao write Set_Vagao;
    property Balsa: UnicodeString read Get_Balsa write Set_Balsa;
    property Vol: IXMLTNFe_infNFe_transp_volList read Get_Vol;
  end;

{ IXMLTNFe_infNFe_transp_transporta }

  IXMLTNFe_infNFe_transp_transporta = interface(IXMLNode)
    ['{4BFEDD13-2973-4B60-97C6-1D0E1F5AE1DE}']
    { Property Accessors }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_XNome: UnicodeString;
    function Get_IE: UnicodeString;
    function Get_XEnder: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_XNome(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_XEnder(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    { Methods & Properties }
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property CPF: UnicodeString read Get_CPF write Set_CPF;
    property XNome: UnicodeString read Get_XNome write Set_XNome;
    property IE: UnicodeString read Get_IE write Set_IE;
    property XEnder: UnicodeString read Get_XEnder write Set_XEnder;
    property XMun: UnicodeString read Get_XMun write Set_XMun;
    property UF: UnicodeString read Get_UF write Set_UF;
  end;

{ IXMLTNFe_infNFe_transp_retTransp }

  IXMLTNFe_infNFe_transp_retTransp = interface(IXMLNode)
    ['{E999BEA1-565C-458B-8697-C9AAE96B89DB}']
    { Property Accessors }
    function Get_VServ: UnicodeString;
    function Get_VBCRet: UnicodeString;
    function Get_PICMSRet: UnicodeString;
    function Get_VICMSRet: UnicodeString;
    function Get_CFOP: UnicodeString;
    function Get_CMunFG: UnicodeString;
    procedure Set_VServ(Value: UnicodeString);
    procedure Set_VBCRet(Value: UnicodeString);
    procedure Set_PICMSRet(Value: UnicodeString);
    procedure Set_VICMSRet(Value: UnicodeString);
    procedure Set_CFOP(Value: UnicodeString);
    procedure Set_CMunFG(Value: UnicodeString);
    { Methods & Properties }
    property VServ: UnicodeString read Get_VServ write Set_VServ;
    property VBCRet: UnicodeString read Get_VBCRet write Set_VBCRet;
    property PICMSRet: UnicodeString read Get_PICMSRet write Set_PICMSRet;
    property VICMSRet: UnicodeString read Get_VICMSRet write Set_VICMSRet;
    property CFOP: UnicodeString read Get_CFOP write Set_CFOP;
    property CMunFG: UnicodeString read Get_CMunFG write Set_CMunFG;
  end;

{ IXMLTVeiculo }

  IXMLTVeiculo = interface(IXMLNode)
    ['{D5073A5A-D5A6-4B9E-BE1E-B5B5BE8EC066}']
    { Property Accessors }
    function Get_Placa: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_RNTC: UnicodeString;
    procedure Set_Placa(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_RNTC(Value: UnicodeString);
    { Methods & Properties }
    property Placa: UnicodeString read Get_Placa write Set_Placa;
    property UF: UnicodeString read Get_UF write Set_UF;
    property RNTC: UnicodeString read Get_RNTC write Set_RNTC;
  end;

{ IXMLTVeiculoList }

  IXMLTVeiculoList = interface(IXMLNodeCollection)
    ['{C5DBA2D9-9653-44D8-8D7C-19ABFA85E12A}']
    { Methods & Properties }
    function Add: IXMLTVeiculo;
    function Insert(const Index: Integer): IXMLTVeiculo;

    function Get_Item(Index: Integer): IXMLTVeiculo;
    property Items[Index: Integer]: IXMLTVeiculo read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_transp_vol }

  IXMLTNFe_infNFe_transp_vol = interface(IXMLNode)
    ['{EAC20134-370B-4053-8EA6-96531105A968}']
    { Property Accessors }
    function Get_QVol: UnicodeString;
    function Get_Esp: UnicodeString;
    function Get_Marca: UnicodeString;
    function Get_NVol: UnicodeString;
    function Get_PesoL: UnicodeString;
    function Get_PesoB: UnicodeString;
    function Get_Lacres: IXMLTNFe_infNFe_transp_vol_lacresList;
    procedure Set_QVol(Value: UnicodeString);
    procedure Set_Esp(Value: UnicodeString);
    procedure Set_Marca(Value: UnicodeString);
    procedure Set_NVol(Value: UnicodeString);
    procedure Set_PesoL(Value: UnicodeString);
    procedure Set_PesoB(Value: UnicodeString);
    { Methods & Properties }
    property QVol: UnicodeString read Get_QVol write Set_QVol;
    property Esp: UnicodeString read Get_Esp write Set_Esp;
    property Marca: UnicodeString read Get_Marca write Set_Marca;
    property NVol: UnicodeString read Get_NVol write Set_NVol;
    property PesoL: UnicodeString read Get_PesoL write Set_PesoL;
    property PesoB: UnicodeString read Get_PesoB write Set_PesoB;
    property Lacres: IXMLTNFe_infNFe_transp_vol_lacresList read Get_Lacres;
  end;

{ IXMLTNFe_infNFe_transp_volList }

  IXMLTNFe_infNFe_transp_volList = interface(IXMLNodeCollection)
    ['{4062CCA9-8995-4657-B419-1337BF9C12EE}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_transp_vol;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_transp_vol;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_transp_vol;
    property Items[Index: Integer]: IXMLTNFe_infNFe_transp_vol read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_transp_vol_lacres }

  IXMLTNFe_infNFe_transp_vol_lacres = interface(IXMLNode)
    ['{7D2C7E9C-9024-45B5-BD5E-344B79BC5DB6}']
    { Property Accessors }
    function Get_NLacre: UnicodeString;
    procedure Set_NLacre(Value: UnicodeString);
    { Methods & Properties }
    property NLacre: UnicodeString read Get_NLacre write Set_NLacre;
  end;

{ IXMLTNFe_infNFe_transp_vol_lacresList }

  IXMLTNFe_infNFe_transp_vol_lacresList = interface(IXMLNodeCollection)
    ['{85905B14-1350-41A0-B1DD-3A63F112722A}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_transp_vol_lacres;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_transp_vol_lacres;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_transp_vol_lacres;
    property Items[Index: Integer]: IXMLTNFe_infNFe_transp_vol_lacres read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_cobr }

  IXMLTNFe_infNFe_cobr = interface(IXMLNode)
    ['{44EDF05F-24E3-406A-8EE2-658074605CE5}']
    { Property Accessors }
    function Get_Fat: IXMLTNFe_infNFe_cobr_fat;
    function Get_Dup: IXMLTNFe_infNFe_cobr_dupList;
    { Methods & Properties }
    property Fat: IXMLTNFe_infNFe_cobr_fat read Get_Fat;
    property Dup: IXMLTNFe_infNFe_cobr_dupList read Get_Dup;
  end;

{ IXMLTNFe_infNFe_cobr_fat }

  IXMLTNFe_infNFe_cobr_fat = interface(IXMLNode)
    ['{5D0E8B2A-F7A5-4557-95AE-0568D8AECDB6}']
    { Property Accessors }
    function Get_NFat: UnicodeString;
    function Get_VOrig: UnicodeString;
    function Get_VDesc: UnicodeString;
    function Get_VLiq: UnicodeString;
    procedure Set_NFat(Value: UnicodeString);
    procedure Set_VOrig(Value: UnicodeString);
    procedure Set_VDesc(Value: UnicodeString);
    procedure Set_VLiq(Value: UnicodeString);
    { Methods & Properties }
    property NFat: UnicodeString read Get_NFat write Set_NFat;
    property VOrig: UnicodeString read Get_VOrig write Set_VOrig;
    property VDesc: UnicodeString read Get_VDesc write Set_VDesc;
    property VLiq: UnicodeString read Get_VLiq write Set_VLiq;
  end;

{ IXMLTNFe_infNFe_cobr_dup }

  IXMLTNFe_infNFe_cobr_dup = interface(IXMLNode)
    ['{9A8892FE-705E-4F33-98D2-B79C5EA8F02A}']
    { Property Accessors }
    function Get_NDup: UnicodeString;
    function Get_DVenc: UnicodeString;
    function Get_VDup: UnicodeString;
    procedure Set_NDup(Value: UnicodeString);
    procedure Set_DVenc(Value: UnicodeString);
    procedure Set_VDup(Value: UnicodeString);
    { Methods & Properties }
    property NDup: UnicodeString read Get_NDup write Set_NDup;
    property DVenc: UnicodeString read Get_DVenc write Set_DVenc;
    property VDup: UnicodeString read Get_VDup write Set_VDup;
  end;

{ IXMLTNFe_infNFe_cobr_dupList }

  IXMLTNFe_infNFe_cobr_dupList = interface(IXMLNodeCollection)
    ['{C559FD1A-0C2A-489E-A37F-83E1D0AB5158}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_cobr_dup;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_cobr_dup;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_cobr_dup;
    property Items[Index: Integer]: IXMLTNFe_infNFe_cobr_dup read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_pag }

  IXMLTNFe_infNFe_pag = interface(IXMLNode)
    ['{BFE770E7-31CE-484C-9356-D69C802BA0D5}']
    { Property Accessors }
    function Get_DetPag: IXMLTNFe_infNFe_pag_detPagList;
    function Get_VTroco: UnicodeString;
    procedure Set_VTroco(Value: UnicodeString);
    { Methods & Properties }
    property DetPag: IXMLTNFe_infNFe_pag_detPagList read Get_DetPag;
    property VTroco: UnicodeString read Get_VTroco write Set_VTroco;
  end;

{ IXMLTNFe_infNFe_pag_detPag }

  IXMLTNFe_infNFe_pag_detPag = interface(IXMLNode)
    ['{4E35179A-FBE1-4C4D-B068-1EF467AA3373}']
    { Property Accessors }
    function Get_IndPag: UnicodeString;
    function Get_TPag: UnicodeString;
    function Get_VPag: UnicodeString;
    function Get_Card: IXMLTNFe_infNFe_pag_detPag_card;
    procedure Set_IndPag(Value: UnicodeString);
    procedure Set_TPag(Value: UnicodeString);
    procedure Set_VPag(Value: UnicodeString);
    { Methods & Properties }
    property IndPag: UnicodeString read Get_IndPag write Set_IndPag;
    property TPag: UnicodeString read Get_TPag write Set_TPag;
    property VPag: UnicodeString read Get_VPag write Set_VPag;
    property Card: IXMLTNFe_infNFe_pag_detPag_card read Get_Card;
  end;

{ IXMLTNFe_infNFe_pag_detPagList }

  IXMLTNFe_infNFe_pag_detPagList = interface(IXMLNodeCollection)
    ['{86EA06AE-7916-464C-A001-C9000D57A864}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_pag_detPag;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_pag_detPag;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_pag_detPag;
    property Items[Index: Integer]: IXMLTNFe_infNFe_pag_detPag read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_pag_detPag_card }

  IXMLTNFe_infNFe_pag_detPag_card = interface(IXMLNode)
    ['{D46AA79E-AC45-489C-8A0C-543B2CE8AC4C}']
    { Property Accessors }
    function Get_TpIntegra: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_TBand: UnicodeString;
    function Get_CAut: UnicodeString;
    procedure Set_TpIntegra(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_TBand(Value: UnicodeString);
    procedure Set_CAut(Value: UnicodeString);
    { Methods & Properties }
    property TpIntegra: UnicodeString read Get_TpIntegra write Set_TpIntegra;
    property CNPJ: UnicodeString read Get_CNPJ write Set_CNPJ;
    property TBand: UnicodeString read Get_TBand write Set_TBand;
    property CAut: UnicodeString read Get_CAut write Set_CAut;
  end;

{ IXMLTNFe_infNFe_infAdic }

  IXMLTNFe_infNFe_infAdic = interface(IXMLNode)
    ['{139D9715-D498-40B7-A983-273AF545B48B}']
    { Property Accessors }
    function Get_InfAdFisco: UnicodeString;
    function Get_InfCpl: UnicodeString;
    function Get_ObsCont: IXMLTNFe_infNFe_infAdic_obsContList;
    function Get_ObsFisco: IXMLTNFe_infNFe_infAdic_obsFiscoList;
    function Get_ProcRef: IXMLTNFe_infNFe_infAdic_procRefList;
    procedure Set_InfAdFisco(Value: UnicodeString);
    procedure Set_InfCpl(Value: UnicodeString);
    { Methods & Properties }
    property InfAdFisco: UnicodeString read Get_InfAdFisco write Set_InfAdFisco;
    property InfCpl: UnicodeString read Get_InfCpl write Set_InfCpl;
    property ObsCont: IXMLTNFe_infNFe_infAdic_obsContList read Get_ObsCont;
    property ObsFisco: IXMLTNFe_infNFe_infAdic_obsFiscoList read Get_ObsFisco;
    property ProcRef: IXMLTNFe_infNFe_infAdic_procRefList read Get_ProcRef;
  end;

{ IXMLTNFe_infNFe_infAdic_obsCont }

  IXMLTNFe_infNFe_infAdic_obsCont = interface(IXMLNode)
    ['{52B46809-50DB-448B-B58E-0E5CB4D9689F}']
    { Property Accessors }
    function Get_XCampo: UnicodeString;
    function Get_XTexto: UnicodeString;
    procedure Set_XCampo(Value: UnicodeString);
    procedure Set_XTexto(Value: UnicodeString);
    { Methods & Properties }
    property XCampo: UnicodeString read Get_XCampo write Set_XCampo;
    property XTexto: UnicodeString read Get_XTexto write Set_XTexto;
  end;

{ IXMLTNFe_infNFe_infAdic_obsContList }

  IXMLTNFe_infNFe_infAdic_obsContList = interface(IXMLNodeCollection)
    ['{D9B23DCA-5F6E-4460-BB0E-E778F3EB2C0E}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_infAdic_obsCont;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_obsCont;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_obsCont;
    property Items[Index: Integer]: IXMLTNFe_infNFe_infAdic_obsCont read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_infAdic_obsFisco }

  IXMLTNFe_infNFe_infAdic_obsFisco = interface(IXMLNode)
    ['{17832A7E-55D8-4831-90B0-9CCD338BD729}']
    { Property Accessors }
    function Get_XCampo: UnicodeString;
    function Get_XTexto: UnicodeString;
    procedure Set_XCampo(Value: UnicodeString);
    procedure Set_XTexto(Value: UnicodeString);
    { Methods & Properties }
    property XCampo: UnicodeString read Get_XCampo write Set_XCampo;
    property XTexto: UnicodeString read Get_XTexto write Set_XTexto;
  end;

{ IXMLTNFe_infNFe_infAdic_obsFiscoList }

  IXMLTNFe_infNFe_infAdic_obsFiscoList = interface(IXMLNodeCollection)
    ['{55B4AC7A-B932-416E-8D43-686A54F8599F}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_infAdic_obsFisco;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_obsFisco;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_obsFisco;
    property Items[Index: Integer]: IXMLTNFe_infNFe_infAdic_obsFisco read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_infAdic_procRef }

  IXMLTNFe_infNFe_infAdic_procRef = interface(IXMLNode)
    ['{97F82A47-4FA9-4029-B83B-44FAC170BA70}']
    { Property Accessors }
    function Get_NProc: UnicodeString;
    function Get_IndProc: UnicodeString;
    procedure Set_NProc(Value: UnicodeString);
    procedure Set_IndProc(Value: UnicodeString);
    { Methods & Properties }
    property NProc: UnicodeString read Get_NProc write Set_NProc;
    property IndProc: UnicodeString read Get_IndProc write Set_IndProc;
  end;

{ IXMLTNFe_infNFe_infAdic_procRefList }

  IXMLTNFe_infNFe_infAdic_procRefList = interface(IXMLNodeCollection)
    ['{D41DE090-B62E-4DF0-B792-2DF389B8257A}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_infAdic_procRef;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_procRef;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_procRef;
    property Items[Index: Integer]: IXMLTNFe_infNFe_infAdic_procRef read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_exporta }

  IXMLTNFe_infNFe_exporta = interface(IXMLNode)
    ['{7E872764-8257-45C4-8ADD-C83B277C419E}']
    { Property Accessors }
    function Get_UFSaidaPais: UnicodeString;
    function Get_XLocExporta: UnicodeString;
    function Get_XLocDespacho: UnicodeString;
    procedure Set_UFSaidaPais(Value: UnicodeString);
    procedure Set_XLocExporta(Value: UnicodeString);
    procedure Set_XLocDespacho(Value: UnicodeString);
    { Methods & Properties }
    property UFSaidaPais: UnicodeString read Get_UFSaidaPais write Set_UFSaidaPais;
    property XLocExporta: UnicodeString read Get_XLocExporta write Set_XLocExporta;
    property XLocDespacho: UnicodeString read Get_XLocDespacho write Set_XLocDespacho;
  end;

{ IXMLTNFe_infNFe_compra }

  IXMLTNFe_infNFe_compra = interface(IXMLNode)
    ['{2FDCA8EC-6A9D-44A0-B758-587AB0312AE8}']
    { Property Accessors }
    function Get_XNEmp: UnicodeString;
    function Get_XPed: UnicodeString;
    function Get_XCont: UnicodeString;
    procedure Set_XNEmp(Value: UnicodeString);
    procedure Set_XPed(Value: UnicodeString);
    procedure Set_XCont(Value: UnicodeString);
    { Methods & Properties }
    property XNEmp: UnicodeString read Get_XNEmp write Set_XNEmp;
    property XPed: UnicodeString read Get_XPed write Set_XPed;
    property XCont: UnicodeString read Get_XCont write Set_XCont;
  end;

{ IXMLTNFe_infNFe_cana }

  IXMLTNFe_infNFe_cana = interface(IXMLNode)
    ['{FE503BFF-E89B-4BD9-97E7-F31EA1051BBC}']
    { Property Accessors }
    function Get_Safra: UnicodeString;
    function Get_Ref: UnicodeString;
    function Get_ForDia: IXMLTNFe_infNFe_cana_forDiaList;
    function Get_QTotMes: UnicodeString;
    function Get_QTotAnt: UnicodeString;
    function Get_QTotGer: UnicodeString;
    function Get_Deduc: IXMLTNFe_infNFe_cana_deducList;
    function Get_VFor: UnicodeString;
    function Get_VTotDed: UnicodeString;
    function Get_VLiqFor: UnicodeString;
    procedure Set_Safra(Value: UnicodeString);
    procedure Set_Ref(Value: UnicodeString);
    procedure Set_QTotMes(Value: UnicodeString);
    procedure Set_QTotAnt(Value: UnicodeString);
    procedure Set_QTotGer(Value: UnicodeString);
    procedure Set_VFor(Value: UnicodeString);
    procedure Set_VTotDed(Value: UnicodeString);
    procedure Set_VLiqFor(Value: UnicodeString);
    { Methods & Properties }
    property Safra: UnicodeString read Get_Safra write Set_Safra;
    property Ref: UnicodeString read Get_Ref write Set_Ref;
    property ForDia: IXMLTNFe_infNFe_cana_forDiaList read Get_ForDia;
    property QTotMes: UnicodeString read Get_QTotMes write Set_QTotMes;
    property QTotAnt: UnicodeString read Get_QTotAnt write Set_QTotAnt;
    property QTotGer: UnicodeString read Get_QTotGer write Set_QTotGer;
    property Deduc: IXMLTNFe_infNFe_cana_deducList read Get_Deduc;
    property VFor: UnicodeString read Get_VFor write Set_VFor;
    property VTotDed: UnicodeString read Get_VTotDed write Set_VTotDed;
    property VLiqFor: UnicodeString read Get_VLiqFor write Set_VLiqFor;
  end;

{ IXMLTNFe_infNFe_cana_forDia }

  IXMLTNFe_infNFe_cana_forDia = interface(IXMLNode)
    ['{390A564A-474D-42C6-BD10-E83D432A7F3F}']
    { Property Accessors }
    function Get_Dia: UnicodeString;
    function Get_Qtde: UnicodeString;
    procedure Set_Dia(Value: UnicodeString);
    procedure Set_Qtde(Value: UnicodeString);
    { Methods & Properties }
    property Dia: UnicodeString read Get_Dia write Set_Dia;
    property Qtde: UnicodeString read Get_Qtde write Set_Qtde;
  end;

{ IXMLTNFe_infNFe_cana_forDiaList }

  IXMLTNFe_infNFe_cana_forDiaList = interface(IXMLNodeCollection)
    ['{654CAE0A-9070-410F-A972-8B0EFD399BEA}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_cana_forDia;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_cana_forDia;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_cana_forDia;
    property Items[Index: Integer]: IXMLTNFe_infNFe_cana_forDia read Get_Item; default;
  end;

{ IXMLTNFe_infNFe_cana_deduc }

  IXMLTNFe_infNFe_cana_deduc = interface(IXMLNode)
    ['{07BD42B6-8751-4BA0-9515-C4C52F0E6E83}']
    { Property Accessors }
    function Get_XDed: UnicodeString;
    function Get_VDed: UnicodeString;
    procedure Set_XDed(Value: UnicodeString);
    procedure Set_VDed(Value: UnicodeString);
    { Methods & Properties }
    property XDed: UnicodeString read Get_XDed write Set_XDed;
    property VDed: UnicodeString read Get_VDed write Set_VDed;
  end;

{ IXMLTNFe_infNFe_cana_deducList }

  IXMLTNFe_infNFe_cana_deducList = interface(IXMLNodeCollection)
    ['{110495EC-36D8-4B4B-956D-854775DB0760}']
    { Methods & Properties }
    function Add: IXMLTNFe_infNFe_cana_deduc;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_cana_deduc;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_cana_deduc;
    property Items[Index: Integer]: IXMLTNFe_infNFe_cana_deduc read Get_Item; default;
  end;

{ IXMLTNFe_infNFeSupl }

  IXMLTNFe_infNFeSupl = interface(IXMLNode)
    ['{307CBA8D-AA81-4825-8175-68D9982FCF5F}']
    { Property Accessors }
    function Get_QrCode: UnicodeString;
    function Get_UrlChave: UnicodeString;
    procedure Set_QrCode(Value: UnicodeString);
    procedure Set_UrlChave(Value: UnicodeString);
    { Methods & Properties }
    property QrCode: UnicodeString read Get_QrCode write Set_QrCode;
    property UrlChave: UnicodeString read Get_UrlChave write Set_UrlChave;
  end;

{ IXMLSignatureType_ds }

  IXMLSignatureType_ds = interface(IXMLNode)
    ['{008C5B3A-2030-48C5-8570-BED9089BDF1D}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_SignedInfo: IXMLSignedInfoType_ds;
    function Get_SignatureValue: IXMLSignatureValueType_ds;
    function Get_KeyInfo: IXMLKeyInfoType_ds;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property SignedInfo: IXMLSignedInfoType_ds read Get_SignedInfo;
    property SignatureValue: IXMLSignatureValueType_ds read Get_SignatureValue;
    property KeyInfo: IXMLKeyInfoType_ds read Get_KeyInfo;
  end;

{ IXMLSignedInfoType_ds }

  IXMLSignedInfoType_ds = interface(IXMLNode)
    ['{AF28578D-BC44-4459-B97B-0A3D2C9EE861}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod_ds;
    function Get_SignatureMethod: IXMLSignatureMethod_ds;
    function Get_Reference: IXMLReferenceType_ds;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property CanonicalizationMethod: IXMLCanonicalizationMethod_ds read Get_CanonicalizationMethod;
    property SignatureMethod: IXMLSignatureMethod_ds read Get_SignatureMethod;
    property Reference: IXMLReferenceType_ds read Get_Reference;
  end;

{ IXMLCanonicalizationMethod_ds }

  IXMLCanonicalizationMethod_ds = interface(IXMLNode)
    ['{4E4D75F5-CAFB-4971-A68E-5106E3EC3E00}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureMethod_ds }

  IXMLSignatureMethod_ds = interface(IXMLNode)
    ['{C22A775F-4FBE-46EC-9A10-DE398E59CB0F}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLReferenceType_ds }

  IXMLReferenceType_ds = interface(IXMLNode)
    ['{464CBEDA-1FF7-4484-9024-94C7AAA34693}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_URI: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Transforms: IXMLTransformsType_ds;
    function Get_DigestMethod: IXMLDigestMethod_ds;
    function Get_DigestValue: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_URI(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_DigestValue(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property URI: UnicodeString read Get_URI write Set_URI;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Transforms: IXMLTransformsType_ds read Get_Transforms;
    property DigestMethod: IXMLDigestMethod_ds read Get_DigestMethod;
    property DigestValue: UnicodeString read Get_DigestValue write Set_DigestValue;
  end;

{ IXMLTransformsType_ds }

  IXMLTransformsType_ds = interface(IXMLNodeCollection)
    ['{6E06DB8D-0BB2-43FF-881D-3EF0CB3F3ABC}']
    { Property Accessors }
    function Get_Transform(Index: Integer): IXMLTransformType_ds;
    { Methods & Properties }
    function Add: IXMLTransformType_ds;
    function Insert(const Index: Integer): IXMLTransformType_ds;
    property Transform[Index: Integer]: IXMLTransformType_ds read Get_Transform; default;
  end;

{ IXMLTransformType_ds }

  IXMLTransformType_ds = interface(IXMLNodeCollection)
    ['{D0C0F903-290F-4D1B-A453-DA22E8ADD6B7}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    function Get_XPath(Index: Integer): UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    function Add(const XPath: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const XPath: UnicodeString): IXMLNode;
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
    property XPath[Index: Integer]: UnicodeString read Get_XPath; default;
  end;

{ IXMLDigestMethod_ds }

  IXMLDigestMethod_ds = interface(IXMLNode)
    ['{91632E64-FBF3-4A4A-83E2-689C2F7ABB11}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureValueType_ds }

  IXMLSignatureValueType_ds = interface(IXMLNode)
    ['{E9F4305A-F0BA-40A9-B7E2-5BA1E72493F8}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
  end;

{ IXMLKeyInfoType_ds }

  IXMLKeyInfoType_ds = interface(IXMLNode)
    ['{B883F921-46E4-4713-B1AB-A957E56CA214}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_X509Data: IXMLX509DataType_ds;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property X509Data: IXMLX509DataType_ds read Get_X509Data;
  end;

{ IXMLX509DataType_ds }

  IXMLX509DataType_ds = interface(IXMLNode)
    ['{50133A24-5324-43A8-B459-0220E2C24020}']
    { Property Accessors }
    function Get_X509Certificate: UnicodeString;
    procedure Set_X509Certificate(Value: UnicodeString);
    { Methods & Properties }
    property X509Certificate: UnicodeString read Get_X509Certificate write Set_X509Certificate;
  end;

{ IXMLTProtNFe }

  IXMLTProtNFe = interface(IXMLNode)
    ['{C08A3976-95AE-4972-BE9E-039DA4CE97DD}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_InfProt: IXMLTProtNFe_infProt;
    function Get_Signature: IXMLSignatureType_ds;
    procedure Set_Versao(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property InfProt: IXMLTProtNFe_infProt read Get_InfProt;
    property Signature: IXMLSignatureType_ds read Get_Signature;
  end;

{ IXMLTProtNFeList }

  IXMLTProtNFeList = interface(IXMLNodeCollection)
    ['{76877BF2-FD7A-41C1-A8CD-57433A4986D1}']
    { Methods & Properties }
    function Add: IXMLTProtNFe;
    function Insert(const Index: Integer): IXMLTProtNFe;

    function Get_Item(Index: Integer): IXMLTProtNFe;
    property Items[Index: Integer]: IXMLTProtNFe read Get_Item; default;
  end;

{ IXMLTProtNFe_infProt }

  IXMLTProtNFe_infProt = interface(IXMLNode)
    ['{7C532F98-165A-4FD7-9BA6-7A8E51EB483C}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_VerAplic: UnicodeString;
    function Get_ChNFe: UnicodeString;
    function Get_DhRecbto: UnicodeString;
    function Get_NProt: UnicodeString;
    function Get_DigVal: UnicodeString;
    function Get_CStat: UnicodeString;
    function Get_XMotivo: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_VerAplic(Value: UnicodeString);
    procedure Set_ChNFe(Value: UnicodeString);
    procedure Set_DhRecbto(Value: UnicodeString);
    procedure Set_NProt(Value: UnicodeString);
    procedure Set_DigVal(Value: UnicodeString);
    procedure Set_CStat(Value: UnicodeString);
    procedure Set_XMotivo(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property TpAmb: UnicodeString read Get_TpAmb write Set_TpAmb;
    property VerAplic: UnicodeString read Get_VerAplic write Set_VerAplic;
    property ChNFe: UnicodeString read Get_ChNFe write Set_ChNFe;
    property DhRecbto: UnicodeString read Get_DhRecbto write Set_DhRecbto;
    property NProt: UnicodeString read Get_NProt write Set_NProt;
    property DigVal: UnicodeString read Get_DigVal write Set_DigVal;
    property CStat: UnicodeString read Get_CStat write Set_CStat;
    property XMotivo: UnicodeString read Get_XMotivo write Set_XMotivo;
  end;

{ IXMLTEnviNFe }

  IXMLTEnviNFe = interface(IXMLNode)
    ['{C46BAB26-AE97-48B4-871E-A9975F2C2610}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_IdLote: UnicodeString;
    function Get_IndSinc: UnicodeString;
    function Get_NFe: IXMLTNFeList;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_IdLote(Value: UnicodeString);
    procedure Set_IndSinc(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property IdLote: UnicodeString read Get_IdLote write Set_IdLote;
    property IndSinc: UnicodeString read Get_IndSinc write Set_IndSinc;
    property NFe: IXMLTNFeList read Get_NFe;
  end;

{ IXMLTRetEnviNFe }

  IXMLTRetEnviNFe = interface(IXMLNode)
    ['{09D755C5-840A-4C16-89E1-B28793277B8C}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_VerAplic: UnicodeString;
    function Get_CStat: UnicodeString;
    function Get_XMotivo: UnicodeString;
    function Get_CUF: UnicodeString;
    function Get_DhRecbto: UnicodeString;
    function Get_InfRec: IXMLTRetEnviNFe_infRec;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_VerAplic(Value: UnicodeString);
    procedure Set_CStat(Value: UnicodeString);
    procedure Set_XMotivo(Value: UnicodeString);
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_DhRecbto(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property TpAmb: UnicodeString read Get_TpAmb write Set_TpAmb;
    property VerAplic: UnicodeString read Get_VerAplic write Set_VerAplic;
    property CStat: UnicodeString read Get_CStat write Set_CStat;
    property XMotivo: UnicodeString read Get_XMotivo write Set_XMotivo;
    property CUF: UnicodeString read Get_CUF write Set_CUF;
    property DhRecbto: UnicodeString read Get_DhRecbto write Set_DhRecbto;
    property InfRec: IXMLTRetEnviNFe_infRec read Get_InfRec;
    property ProtNFe: IXMLTProtNFe read Get_ProtNFe;
  end;

{ IXMLTRetEnviNFe_infRec }

  IXMLTRetEnviNFe_infRec = interface(IXMLNode)
    ['{F5CA1397-2194-4B35-B106-38828577FC32}']
    { Property Accessors }
    function Get_NRec: UnicodeString;
    function Get_TMed: UnicodeString;
    procedure Set_NRec(Value: UnicodeString);
    procedure Set_TMed(Value: UnicodeString);
    { Methods & Properties }
    property NRec: UnicodeString read Get_NRec write Set_NRec;
    property TMed: UnicodeString read Get_TMed write Set_TMed;
  end;

{ IXMLTConsReciNFe }

  IXMLTConsReciNFe = interface(IXMLNode)
    ['{CC5D3E8B-BE02-4103-A465-3A9DDB39510D}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_NRec: UnicodeString;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_NRec(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property TpAmb: UnicodeString read Get_TpAmb write Set_TpAmb;
    property NRec: UnicodeString read Get_NRec write Set_NRec;
  end;

{ IXMLTRetConsReciNFe }

  IXMLTRetConsReciNFe = interface(IXMLNode)
    ['{910C2FDD-D307-4610-8D96-5C0721B33073}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_VerAplic: UnicodeString;
    function Get_NRec: UnicodeString;
    function Get_CStat: UnicodeString;
    function Get_XMotivo: UnicodeString;
    function Get_CUF: UnicodeString;
    function Get_DhRecbto: UnicodeString;
    function Get_CMsg: UnicodeString;
    function Get_XMsg: UnicodeString;
    function Get_ProtNFe: IXMLTProtNFeList;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_VerAplic(Value: UnicodeString);
    procedure Set_NRec(Value: UnicodeString);
    procedure Set_CStat(Value: UnicodeString);
    procedure Set_XMotivo(Value: UnicodeString);
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_DhRecbto(Value: UnicodeString);
    procedure Set_CMsg(Value: UnicodeString);
    procedure Set_XMsg(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property TpAmb: UnicodeString read Get_TpAmb write Set_TpAmb;
    property VerAplic: UnicodeString read Get_VerAplic write Set_VerAplic;
    property NRec: UnicodeString read Get_NRec write Set_NRec;
    property CStat: UnicodeString read Get_CStat write Set_CStat;
    property XMotivo: UnicodeString read Get_XMotivo write Set_XMotivo;
    property CUF: UnicodeString read Get_CUF write Set_CUF;
    property DhRecbto: UnicodeString read Get_DhRecbto write Set_DhRecbto;
    property CMsg: UnicodeString read Get_CMsg write Set_CMsg;
    property XMsg: UnicodeString read Get_XMsg write Set_XMsg;
    property ProtNFe: IXMLTProtNFeList read Get_ProtNFe;
  end;

{ IXMLTNfeProc }

  IXMLTNfeProc = interface(IXMLNode)
    ['{478A616B-F91E-4EE5-9223-B2C994A46D04}']
    { Property Accessors }
    function Get_Versao: UnicodeString;
    function Get_NFe: IXMLTNFe;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: UnicodeString);
    { Methods & Properties }
    property Versao: UnicodeString read Get_Versao write Set_Versao;
    property NFe: IXMLTNFe read Get_NFe;
    property ProtNFe: IXMLTProtNFe read Get_ProtNFe;
  end;

{ IXMLTNFe_infNFe_det_prod_NVEList }

  IXMLTNFe_infNFe_det_prod_NVEList = interface(IXMLNodeCollection)
    ['{06069D1C-B979-4567-A54A-7F18DBE6911D}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ Forward Decls }

  TXMLTNFe = class;
  TXMLTNFeList = class;
  TXMLTNFe_infNFe = class;
  TXMLTNFe_infNFe_ide = class;
  TXMLTNFe_infNFe_ide_NFref = class;
  TXMLTNFe_infNFe_ide_NFrefList = class;
  TXMLTNFe_infNFe_ide_NFref_refNF = class;
  TXMLTNFe_infNFe_ide_NFref_refNFP = class;
  TXMLTNFe_infNFe_ide_NFref_refECF = class;
  TXMLTNFe_infNFe_emit = class;
  TXMLTEnderEmi = class;
  TXMLTNFe_infNFe_avulsa = class;
  TXMLTNFe_infNFe_dest = class;
  TXMLTEndereco = class;
  TXMLTLocal = class;
  TXMLTNFe_infNFe_autXML = class;
  TXMLTNFe_infNFe_autXMLList = class;
  TXMLTNFe_infNFe_det = class;
  TXMLTNFe_infNFe_detList = class;
  TXMLTNFe_infNFe_det_prod = class;
  TXMLTNFe_infNFe_det_prod_DI = class;
  TXMLTNFe_infNFe_det_prod_DIList = class;
  TXMLTNFe_infNFe_det_prod_DI_adi = class;
  TXMLTNFe_infNFe_det_prod_DI_adiList = class;
  TXMLTNFe_infNFe_det_prod_detExport = class;
  TXMLTNFe_infNFe_det_prod_detExportList = class;
  TXMLTNFe_infNFe_det_prod_detExport_exportInd = class;
  TXMLTNFe_infNFe_det_prod_rastro = class;
  TXMLTNFe_infNFe_det_prod_rastroList = class;
  TXMLTNFe_infNFe_det_prod_veicProd = class;
  TXMLTNFe_infNFe_det_prod_med = class;
  TXMLTNFe_infNFe_det_prod_arma = class;
  TXMLTNFe_infNFe_det_prod_armaList = class;
  TXMLTNFe_infNFe_det_prod_comb = class;
  TXMLTNFe_infNFe_det_prod_comb_CIDE = class;
  TXMLTNFe_infNFe_det_prod_comb_encerrante = class;
  TXMLTNFe_infNFe_det_imposto = class;
  TXMLTNFe_infNFe_det_imposto_ICMS = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 = class;
  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 = class;
  TXMLTIpi = class;
  TXMLTIpi_IPITrib = class;
  TXMLTIpi_IPINT = class;
  TXMLTNFe_infNFe_det_imposto_II = class;
  TXMLTNFe_infNFe_det_imposto_ISSQN = class;
  TXMLTNFe_infNFe_det_imposto_PIS = class;
  TXMLTNFe_infNFe_det_imposto_PIS_PISAliq = class;
  TXMLTNFe_infNFe_det_imposto_PIS_PISQtde = class;
  TXMLTNFe_infNFe_det_imposto_PIS_PISNT = class;
  TXMLTNFe_infNFe_det_imposto_PIS_PISOutr = class;
  TXMLTNFe_infNFe_det_imposto_PISST = class;
  TXMLTNFe_infNFe_det_imposto_COFINS = class;
  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq = class;
  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde = class;
  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT = class;
  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr = class;
  TXMLTNFe_infNFe_det_imposto_COFINSST = class;
  TXMLTNFe_infNFe_det_imposto_ICMSUFDest = class;
  TXMLTNFe_infNFe_det_impostoDevol = class;
  TXMLTNFe_infNFe_det_impostoDevol_IPI = class;
  TXMLTNFe_infNFe_total = class;
  TXMLTNFe_infNFe_total_ICMSTot = class;
  TXMLTNFe_infNFe_total_ISSQNtot = class;
  TXMLTNFe_infNFe_total_retTrib = class;
  TXMLTNFe_infNFe_transp = class;
  TXMLTNFe_infNFe_transp_transporta = class;
  TXMLTNFe_infNFe_transp_retTransp = class;
  TXMLTVeiculo = class;
  TXMLTVeiculoList = class;
  TXMLTNFe_infNFe_transp_vol = class;
  TXMLTNFe_infNFe_transp_volList = class;
  TXMLTNFe_infNFe_transp_vol_lacres = class;
  TXMLTNFe_infNFe_transp_vol_lacresList = class;
  TXMLTNFe_infNFe_cobr = class;
  TXMLTNFe_infNFe_cobr_fat = class;
  TXMLTNFe_infNFe_cobr_dup = class;
  TXMLTNFe_infNFe_cobr_dupList = class;
  TXMLTNFe_infNFe_pag = class;
  TXMLTNFe_infNFe_pag_detPag = class;
  TXMLTNFe_infNFe_pag_detPagList = class;
  TXMLTNFe_infNFe_pag_detPag_card = class;
  TXMLTNFe_infNFe_infAdic = class;
  TXMLTNFe_infNFe_infAdic_obsCont = class;
  TXMLTNFe_infNFe_infAdic_obsContList = class;
  TXMLTNFe_infNFe_infAdic_obsFisco = class;
  TXMLTNFe_infNFe_infAdic_obsFiscoList = class;
  TXMLTNFe_infNFe_infAdic_procRef = class;
  TXMLTNFe_infNFe_infAdic_procRefList = class;
  TXMLTNFe_infNFe_exporta = class;
  TXMLTNFe_infNFe_compra = class;
  TXMLTNFe_infNFe_cana = class;
  TXMLTNFe_infNFe_cana_forDia = class;
  TXMLTNFe_infNFe_cana_forDiaList = class;
  TXMLTNFe_infNFe_cana_deduc = class;
  TXMLTNFe_infNFe_cana_deducList = class;
  TXMLTNFe_infNFeSupl = class;
  TXMLSignatureType_ds = class;
  TXMLSignedInfoType_ds = class;
  TXMLCanonicalizationMethod_ds = class;
  TXMLSignatureMethod_ds = class;
  TXMLReferenceType_ds = class;
  TXMLTransformsType_ds = class;
  TXMLTransformType_ds = class;
  TXMLDigestMethod_ds = class;
  TXMLSignatureValueType_ds = class;
  TXMLKeyInfoType_ds = class;
  TXMLX509DataType_ds = class;
  TXMLTProtNFe = class;
  TXMLTProtNFeList = class;
  TXMLTProtNFe_infProt = class;
  TXMLTEnviNFe = class;
  TXMLTRetEnviNFe = class;
  TXMLTRetEnviNFe_infRec = class;
  TXMLTConsReciNFe = class;
  TXMLTRetConsReciNFe = class;
  TXMLTNfeProc = class;
  TXMLTNFe_infNFe_det_prod_NVEList = class;

{ TXMLTNFe }

  TXMLTNFe = class(TXMLNode, IXMLTNFe)
  protected
    { IXMLTNFe }
    function Get_InfNFe: IXMLTNFe_infNFe;
    function Get_InfNFeSupl: IXMLTNFe_infNFeSupl;
    function Get_Signature: IXMLSignatureType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFeList }

  TXMLTNFeList = class(TXMLNodeCollection, IXMLTNFeList)
  protected
    { IXMLTNFeList }
    function Add: IXMLTNFe;
    function Insert(const Index: Integer): IXMLTNFe;

    function Get_Item(Index: Integer): IXMLTNFe;
  end;

{ TXMLTNFe_infNFe }

  TXMLTNFe_infNFe = class(TXMLNode, IXMLTNFe_infNFe)
  private
    FAutXML: IXMLTNFe_infNFe_autXMLList;
    FDet: IXMLTNFe_infNFe_detList;
  protected
    { IXMLTNFe_infNFe }
    function Get_Versao: UnicodeString;
    function Get_Id: UnicodeString;
    function Get_Ide: IXMLTNFe_infNFe_ide;
    function Get_Emit: IXMLTNFe_infNFe_emit;
    function Get_Avulsa: IXMLTNFe_infNFe_avulsa;
    function Get_Dest: IXMLTNFe_infNFe_dest;
    function Get_Retirada: IXMLTLocal;
    function Get_Entrega: IXMLTLocal;
    function Get_AutXML: IXMLTNFe_infNFe_autXMLList;
    function Get_Det: IXMLTNFe_infNFe_detList;
    function Get_Total: IXMLTNFe_infNFe_total;
    function Get_Transp: IXMLTNFe_infNFe_transp;
    function Get_Cobr: IXMLTNFe_infNFe_cobr;
    function Get_Pag: IXMLTNFe_infNFe_pag;
    function Get_InfAdic: IXMLTNFe_infNFe_infAdic;
    function Get_Exporta: IXMLTNFe_infNFe_exporta;
    function Get_Compra: IXMLTNFe_infNFe_compra;
    function Get_Cana: IXMLTNFe_infNFe_cana;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_ide }

  TXMLTNFe_infNFe_ide = class(TXMLNode, IXMLTNFe_infNFe_ide)
  private
    FNFref: IXMLTNFe_infNFe_ide_NFrefList;
  protected
    { IXMLTNFe_infNFe_ide }
    function Get_CUF: UnicodeString;
    function Get_CNF: UnicodeString;
    function Get_NatOp: UnicodeString;
    function Get_Mod_: UnicodeString;
    function Get_Serie: UnicodeString;
    function Get_NNF: UnicodeString;
    function Get_DhEmi: UnicodeString;
    function Get_DhSaiEnt: UnicodeString;
    function Get_TpNF: UnicodeString;
    function Get_IdDest: UnicodeString;
    function Get_CMunFG: UnicodeString;
    function Get_TpImp: UnicodeString;
    function Get_TpEmis: UnicodeString;
    function Get_CDV: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_FinNFe: UnicodeString;
    function Get_IndFinal: UnicodeString;
    function Get_IndPres: UnicodeString;
    function Get_ProcEmi: UnicodeString;
    function Get_VerProc: UnicodeString;
    function Get_DhCont: UnicodeString;
    function Get_XJust: UnicodeString;
    function Get_NFref: IXMLTNFe_infNFe_ide_NFrefList;
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_CNF(Value: UnicodeString);
    procedure Set_NatOp(Value: UnicodeString);
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_Serie(Value: UnicodeString);
    procedure Set_NNF(Value: UnicodeString);
    procedure Set_DhEmi(Value: UnicodeString);
    procedure Set_DhSaiEnt(Value: UnicodeString);
    procedure Set_TpNF(Value: UnicodeString);
    procedure Set_IdDest(Value: UnicodeString);
    procedure Set_CMunFG(Value: UnicodeString);
    procedure Set_TpImp(Value: UnicodeString);
    procedure Set_TpEmis(Value: UnicodeString);
    procedure Set_CDV(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_FinNFe(Value: UnicodeString);
    procedure Set_IndFinal(Value: UnicodeString);
    procedure Set_IndPres(Value: UnicodeString);
    procedure Set_ProcEmi(Value: UnicodeString);
    procedure Set_VerProc(Value: UnicodeString);
    procedure Set_DhCont(Value: UnicodeString);
    procedure Set_XJust(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_ide_NFref }

  TXMLTNFe_infNFe_ide_NFref = class(TXMLNode, IXMLTNFe_infNFe_ide_NFref)
  protected
    { IXMLTNFe_infNFe_ide_NFref }
    function Get_RefNFe: UnicodeString;
    function Get_RefNF: IXMLTNFe_infNFe_ide_NFref_refNF;
    function Get_RefNFP: IXMLTNFe_infNFe_ide_NFref_refNFP;
    function Get_RefCTe: UnicodeString;
    function Get_RefECF: IXMLTNFe_infNFe_ide_NFref_refECF;
    procedure Set_RefNFe(Value: UnicodeString);
    procedure Set_RefCTe(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_ide_NFrefList }

  TXMLTNFe_infNFe_ide_NFrefList = class(TXMLNodeCollection, IXMLTNFe_infNFe_ide_NFrefList)
  protected
    { IXMLTNFe_infNFe_ide_NFrefList }
    function Add: IXMLTNFe_infNFe_ide_NFref;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_ide_NFref;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_ide_NFref;
  end;

{ TXMLTNFe_infNFe_ide_NFref_refNF }

  TXMLTNFe_infNFe_ide_NFref_refNF = class(TXMLNode, IXMLTNFe_infNFe_ide_NFref_refNF)
  protected
    { IXMLTNFe_infNFe_ide_NFref_refNF }
    function Get_CUF: UnicodeString;
    function Get_AAMM: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_Mod_: UnicodeString;
    function Get_Serie: UnicodeString;
    function Get_NNF: UnicodeString;
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_AAMM(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_Serie(Value: UnicodeString);
    procedure Set_NNF(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_ide_NFref_refNFP }

  TXMLTNFe_infNFe_ide_NFref_refNFP = class(TXMLNode, IXMLTNFe_infNFe_ide_NFref_refNFP)
  protected
    { IXMLTNFe_infNFe_ide_NFref_refNFP }
    function Get_CUF: UnicodeString;
    function Get_AAMM: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_IE: UnicodeString;
    function Get_Mod_: UnicodeString;
    function Get_Serie: UnicodeString;
    function Get_NNF: UnicodeString;
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_AAMM(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_Serie(Value: UnicodeString);
    procedure Set_NNF(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_ide_NFref_refECF }

  TXMLTNFe_infNFe_ide_NFref_refECF = class(TXMLNode, IXMLTNFe_infNFe_ide_NFref_refECF)
  protected
    { IXMLTNFe_infNFe_ide_NFref_refECF }
    function Get_Mod_: UnicodeString;
    function Get_NECF: UnicodeString;
    function Get_NCOO: UnicodeString;
    procedure Set_Mod_(Value: UnicodeString);
    procedure Set_NECF(Value: UnicodeString);
    procedure Set_NCOO(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_emit }

  TXMLTNFe_infNFe_emit = class(TXMLNode, IXMLTNFe_infNFe_emit)
  protected
    { IXMLTNFe_infNFe_emit }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_XNome: UnicodeString;
    function Get_XFant: UnicodeString;
    function Get_EnderEmit: IXMLTEnderEmi;
    function Get_IE: UnicodeString;
    function Get_IEST: UnicodeString;
    function Get_IM: UnicodeString;
    function Get_CNAE: UnicodeString;
    function Get_CRT: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_XNome(Value: UnicodeString);
    procedure Set_XFant(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_IEST(Value: UnicodeString);
    procedure Set_IM(Value: UnicodeString);
    procedure Set_CNAE(Value: UnicodeString);
    procedure Set_CRT(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTEnderEmi }

  TXMLTEnderEmi = class(TXMLNode, IXMLTEnderEmi)
  protected
    { IXMLTEnderEmi }
    function Get_XLgr: UnicodeString;
    function Get_Nro: UnicodeString;
    function Get_XCpl: UnicodeString;
    function Get_XBairro: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_CEP: UnicodeString;
    function Get_CPais: UnicodeString;
    function Get_XPais: UnicodeString;
    function Get_Fone: UnicodeString;
    procedure Set_XLgr(Value: UnicodeString);
    procedure Set_Nro(Value: UnicodeString);
    procedure Set_XCpl(Value: UnicodeString);
    procedure Set_XBairro(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_CEP(Value: UnicodeString);
    procedure Set_CPais(Value: UnicodeString);
    procedure Set_XPais(Value: UnicodeString);
    procedure Set_Fone(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_avulsa }

  TXMLTNFe_infNFe_avulsa = class(TXMLNode, IXMLTNFe_infNFe_avulsa)
  protected
    { IXMLTNFe_infNFe_avulsa }
    function Get_CNPJ: UnicodeString;
    function Get_XOrgao: UnicodeString;
    function Get_Matr: UnicodeString;
    function Get_XAgente: UnicodeString;
    function Get_Fone: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_NDAR: UnicodeString;
    function Get_DEmi: UnicodeString;
    function Get_VDAR: UnicodeString;
    function Get_RepEmi: UnicodeString;
    function Get_DPag: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_XOrgao(Value: UnicodeString);
    procedure Set_Matr(Value: UnicodeString);
    procedure Set_XAgente(Value: UnicodeString);
    procedure Set_Fone(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_NDAR(Value: UnicodeString);
    procedure Set_DEmi(Value: UnicodeString);
    procedure Set_VDAR(Value: UnicodeString);
    procedure Set_RepEmi(Value: UnicodeString);
    procedure Set_DPag(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_dest }

  TXMLTNFe_infNFe_dest = class(TXMLNode, IXMLTNFe_infNFe_dest)
  protected
    { IXMLTNFe_infNFe_dest }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_IdEstrangeiro: UnicodeString;
    function Get_XNome: UnicodeString;
    function Get_EnderDest: IXMLTEndereco;
    function Get_IndIEDest: UnicodeString;
    function Get_IE: UnicodeString;
    function Get_ISUF: UnicodeString;
    function Get_IM: UnicodeString;
    function Get_Email: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_IdEstrangeiro(Value: UnicodeString);
    procedure Set_XNome(Value: UnicodeString);
    procedure Set_IndIEDest(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_ISUF(Value: UnicodeString);
    procedure Set_IM(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTEndereco }

  TXMLTEndereco = class(TXMLNode, IXMLTEndereco)
  protected
    { IXMLTEndereco }
    function Get_XLgr: UnicodeString;
    function Get_Nro: UnicodeString;
    function Get_XCpl: UnicodeString;
    function Get_XBairro: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_CEP: UnicodeString;
    function Get_CPais: UnicodeString;
    function Get_XPais: UnicodeString;
    function Get_Fone: UnicodeString;
    procedure Set_XLgr(Value: UnicodeString);
    procedure Set_Nro(Value: UnicodeString);
    procedure Set_XCpl(Value: UnicodeString);
    procedure Set_XBairro(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_CEP(Value: UnicodeString);
    procedure Set_CPais(Value: UnicodeString);
    procedure Set_XPais(Value: UnicodeString);
    procedure Set_Fone(Value: UnicodeString);
  end;

{ TXMLTLocal }

  TXMLTLocal = class(TXMLNode, IXMLTLocal)
  protected
    { IXMLTLocal }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_XLgr: UnicodeString;
    function Get_Nro: UnicodeString;
    function Get_XCpl: UnicodeString;
    function Get_XBairro: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_XLgr(Value: UnicodeString);
    procedure Set_Nro(Value: UnicodeString);
    procedure Set_XCpl(Value: UnicodeString);
    procedure Set_XBairro(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_autXML }

  TXMLTNFe_infNFe_autXML = class(TXMLNode, IXMLTNFe_infNFe_autXML)
  protected
    { IXMLTNFe_infNFe_autXML }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_autXMLList }

  TXMLTNFe_infNFe_autXMLList = class(TXMLNodeCollection, IXMLTNFe_infNFe_autXMLList)
  protected
    { IXMLTNFe_infNFe_autXMLList }
    function Add: IXMLTNFe_infNFe_autXML;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_autXML;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_autXML;
  end;

{ TXMLTNFe_infNFe_det }

  TXMLTNFe_infNFe_det = class(TXMLNode, IXMLTNFe_infNFe_det)
  protected
    { IXMLTNFe_infNFe_det }
    function Get_NItem: UnicodeString;
    function Get_Prod: IXMLTNFe_infNFe_det_prod;
    function Get_Imposto: IXMLTNFe_infNFe_det_imposto;
    function Get_ImpostoDevol: IXMLTNFe_infNFe_det_impostoDevol;
    function Get_InfAdProd: UnicodeString;
    procedure Set_NItem(Value: UnicodeString);
    procedure Set_InfAdProd(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_detList }

  TXMLTNFe_infNFe_detList = class(TXMLNodeCollection, IXMLTNFe_infNFe_detList)
  protected
    { IXMLTNFe_infNFe_detList }
    function Add: IXMLTNFe_infNFe_det;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det;
  end;

{ TXMLTNFe_infNFe_det_prod }

  TXMLTNFe_infNFe_det_prod = class(TXMLNode, IXMLTNFe_infNFe_det_prod)
  private
    FNVE: IXMLTNFe_infNFe_det_prod_NVEList;
    FDI: IXMLTNFe_infNFe_det_prod_DIList;
    FDetExport: IXMLTNFe_infNFe_det_prod_detExportList;
    FRastro: IXMLTNFe_infNFe_det_prod_rastroList;
    FArma: IXMLTNFe_infNFe_det_prod_armaList;
  protected
    { IXMLTNFe_infNFe_det_prod }
    function Get_CProd: UnicodeString;
    function Get_CEAN: UnicodeString;
    function Get_XProd: UnicodeString;
    function Get_NCM: UnicodeString;
    function Get_NVE: IXMLTNFe_infNFe_det_prod_NVEList;
    function Get_CEST: UnicodeString;
    function Get_IndEscala: UnicodeString;
    function Get_CNPJFab: UnicodeString;
    function Get_CBenef: UnicodeString;
    function Get_EXTIPI: UnicodeString;
    function Get_CFOP: UnicodeString;
    function Get_UCom: UnicodeString;
    function Get_QCom: UnicodeString;
    function Get_VUnCom: UnicodeString;
    function Get_VProd: UnicodeString;
    function Get_CEANTrib: UnicodeString;
    function Get_UTrib: UnicodeString;
    function Get_QTrib: UnicodeString;
    function Get_VUnTrib: UnicodeString;
    function Get_VFrete: UnicodeString;
    function Get_VSeg: UnicodeString;
    function Get_VDesc: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_IndTot: UnicodeString;
    function Get_DI: IXMLTNFe_infNFe_det_prod_DIList;
    function Get_DetExport: IXMLTNFe_infNFe_det_prod_detExportList;
    function Get_XPed: UnicodeString;
    function Get_NItemPed: UnicodeString;
    function Get_NFCI: UnicodeString;
    function Get_Rastro: IXMLTNFe_infNFe_det_prod_rastroList;
    function Get_VeicProd: IXMLTNFe_infNFe_det_prod_veicProd;
    function Get_Med: IXMLTNFe_infNFe_det_prod_med;
    function Get_Arma: IXMLTNFe_infNFe_det_prod_armaList;
    function Get_Comb: IXMLTNFe_infNFe_det_prod_comb;
    function Get_NRECOPI: UnicodeString;
    procedure Set_CProd(Value: UnicodeString);
    procedure Set_CEAN(Value: UnicodeString);
    procedure Set_XProd(Value: UnicodeString);
    procedure Set_NCM(Value: UnicodeString);
    procedure Set_CEST(Value: UnicodeString);
    procedure Set_IndEscala(Value: UnicodeString);
    procedure Set_CNPJFab(Value: UnicodeString);
    procedure Set_CBenef(Value: UnicodeString);
    procedure Set_EXTIPI(Value: UnicodeString);
    procedure Set_CFOP(Value: UnicodeString);
    procedure Set_UCom(Value: UnicodeString);
    procedure Set_QCom(Value: UnicodeString);
    procedure Set_VUnCom(Value: UnicodeString);
    procedure Set_VProd(Value: UnicodeString);
    procedure Set_CEANTrib(Value: UnicodeString);
    procedure Set_UTrib(Value: UnicodeString);
    procedure Set_QTrib(Value: UnicodeString);
    procedure Set_VUnTrib(Value: UnicodeString);
    procedure Set_VFrete(Value: UnicodeString);
    procedure Set_VSeg(Value: UnicodeString);
    procedure Set_VDesc(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_IndTot(Value: UnicodeString);
    procedure Set_XPed(Value: UnicodeString);
    procedure Set_NItemPed(Value: UnicodeString);
    procedure Set_NFCI(Value: UnicodeString);
    procedure Set_NRECOPI(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_prod_DI }

  TXMLTNFe_infNFe_det_prod_DI = class(TXMLNode, IXMLTNFe_infNFe_det_prod_DI)
  private
    FAdi: IXMLTNFe_infNFe_det_prod_DI_adiList;
  protected
    { IXMLTNFe_infNFe_det_prod_DI }
    function Get_NDI: UnicodeString;
    function Get_DDI: UnicodeString;
    function Get_XLocDesemb: UnicodeString;
    function Get_UFDesemb: UnicodeString;
    function Get_DDesemb: UnicodeString;
    function Get_TpViaTransp: UnicodeString;
    function Get_VAFRMM: UnicodeString;
    function Get_TpIntermedio: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_UFTerceiro: UnicodeString;
    function Get_CExportador: UnicodeString;
    function Get_Adi: IXMLTNFe_infNFe_det_prod_DI_adiList;
    procedure Set_NDI(Value: UnicodeString);
    procedure Set_DDI(Value: UnicodeString);
    procedure Set_XLocDesemb(Value: UnicodeString);
    procedure Set_UFDesemb(Value: UnicodeString);
    procedure Set_DDesemb(Value: UnicodeString);
    procedure Set_TpViaTransp(Value: UnicodeString);
    procedure Set_VAFRMM(Value: UnicodeString);
    procedure Set_TpIntermedio(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_UFTerceiro(Value: UnicodeString);
    procedure Set_CExportador(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_prod_DIList }

  TXMLTNFe_infNFe_det_prod_DIList = class(TXMLNodeCollection, IXMLTNFe_infNFe_det_prod_DIList)
  protected
    { IXMLTNFe_infNFe_det_prod_DIList }
    function Add: IXMLTNFe_infNFe_det_prod_DI;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_DI;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_DI;
  end;

{ TXMLTNFe_infNFe_det_prod_DI_adi }

  TXMLTNFe_infNFe_det_prod_DI_adi = class(TXMLNode, IXMLTNFe_infNFe_det_prod_DI_adi)
  protected
    { IXMLTNFe_infNFe_det_prod_DI_adi }
    function Get_NAdicao: UnicodeString;
    function Get_NSeqAdic: UnicodeString;
    function Get_CFabricante: UnicodeString;
    function Get_VDescDI: UnicodeString;
    function Get_NDraw: UnicodeString;
    procedure Set_NAdicao(Value: UnicodeString);
    procedure Set_NSeqAdic(Value: UnicodeString);
    procedure Set_CFabricante(Value: UnicodeString);
    procedure Set_VDescDI(Value: UnicodeString);
    procedure Set_NDraw(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_DI_adiList }

  TXMLTNFe_infNFe_det_prod_DI_adiList = class(TXMLNodeCollection, IXMLTNFe_infNFe_det_prod_DI_adiList)
  protected
    { IXMLTNFe_infNFe_det_prod_DI_adiList }
    function Add: IXMLTNFe_infNFe_det_prod_DI_adi;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_DI_adi;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_DI_adi;
  end;

{ TXMLTNFe_infNFe_det_prod_detExport }

  TXMLTNFe_infNFe_det_prod_detExport = class(TXMLNode, IXMLTNFe_infNFe_det_prod_detExport)
  protected
    { IXMLTNFe_infNFe_det_prod_detExport }
    function Get_NDraw: UnicodeString;
    function Get_ExportInd: IXMLTNFe_infNFe_det_prod_detExport_exportInd;
    procedure Set_NDraw(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_prod_detExportList }

  TXMLTNFe_infNFe_det_prod_detExportList = class(TXMLNodeCollection, IXMLTNFe_infNFe_det_prod_detExportList)
  protected
    { IXMLTNFe_infNFe_det_prod_detExportList }
    function Add: IXMLTNFe_infNFe_det_prod_detExport;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_detExport;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_detExport;
  end;

{ TXMLTNFe_infNFe_det_prod_detExport_exportInd }

  TXMLTNFe_infNFe_det_prod_detExport_exportInd = class(TXMLNode, IXMLTNFe_infNFe_det_prod_detExport_exportInd)
  protected
    { IXMLTNFe_infNFe_det_prod_detExport_exportInd }
    function Get_NRE: UnicodeString;
    function Get_ChNFe: UnicodeString;
    function Get_QExport: UnicodeString;
    procedure Set_NRE(Value: UnicodeString);
    procedure Set_ChNFe(Value: UnicodeString);
    procedure Set_QExport(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_rastro }

  TXMLTNFe_infNFe_det_prod_rastro = class(TXMLNode, IXMLTNFe_infNFe_det_prod_rastro)
  protected
    { IXMLTNFe_infNFe_det_prod_rastro }
    function Get_NLote: UnicodeString;
    function Get_QLote: UnicodeString;
    function Get_DFab: UnicodeString;
    function Get_DVal: UnicodeString;
    function Get_CAgreg: UnicodeString;
    procedure Set_NLote(Value: UnicodeString);
    procedure Set_QLote(Value: UnicodeString);
    procedure Set_DFab(Value: UnicodeString);
    procedure Set_DVal(Value: UnicodeString);
    procedure Set_CAgreg(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_rastroList }

  TXMLTNFe_infNFe_det_prod_rastroList = class(TXMLNodeCollection, IXMLTNFe_infNFe_det_prod_rastroList)
  protected
    { IXMLTNFe_infNFe_det_prod_rastroList }
    function Add: IXMLTNFe_infNFe_det_prod_rastro;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_rastro;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_rastro;
  end;

{ TXMLTNFe_infNFe_det_prod_veicProd }

  TXMLTNFe_infNFe_det_prod_veicProd = class(TXMLNode, IXMLTNFe_infNFe_det_prod_veicProd)
  protected
    { IXMLTNFe_infNFe_det_prod_veicProd }
    function Get_TpOp: UnicodeString;
    function Get_Chassi: UnicodeString;
    function Get_CCor: UnicodeString;
    function Get_XCor: UnicodeString;
    function Get_Pot: UnicodeString;
    function Get_Cilin: UnicodeString;
    function Get_PesoL: UnicodeString;
    function Get_PesoB: UnicodeString;
    function Get_NSerie: UnicodeString;
    function Get_TpComb: UnicodeString;
    function Get_NMotor: UnicodeString;
    function Get_CMT: UnicodeString;
    function Get_Dist: UnicodeString;
    function Get_AnoMod: UnicodeString;
    function Get_AnoFab: UnicodeString;
    function Get_TpPint: UnicodeString;
    function Get_TpVeic: UnicodeString;
    function Get_EspVeic: UnicodeString;
    function Get_VIN: UnicodeString;
    function Get_CondVeic: UnicodeString;
    function Get_CMod: UnicodeString;
    function Get_CCorDENATRAN: UnicodeString;
    function Get_Lota: UnicodeString;
    function Get_TpRest: UnicodeString;
    procedure Set_TpOp(Value: UnicodeString);
    procedure Set_Chassi(Value: UnicodeString);
    procedure Set_CCor(Value: UnicodeString);
    procedure Set_XCor(Value: UnicodeString);
    procedure Set_Pot(Value: UnicodeString);
    procedure Set_Cilin(Value: UnicodeString);
    procedure Set_PesoL(Value: UnicodeString);
    procedure Set_PesoB(Value: UnicodeString);
    procedure Set_NSerie(Value: UnicodeString);
    procedure Set_TpComb(Value: UnicodeString);
    procedure Set_NMotor(Value: UnicodeString);
    procedure Set_CMT(Value: UnicodeString);
    procedure Set_Dist(Value: UnicodeString);
    procedure Set_AnoMod(Value: UnicodeString);
    procedure Set_AnoFab(Value: UnicodeString);
    procedure Set_TpPint(Value: UnicodeString);
    procedure Set_TpVeic(Value: UnicodeString);
    procedure Set_EspVeic(Value: UnicodeString);
    procedure Set_VIN(Value: UnicodeString);
    procedure Set_CondVeic(Value: UnicodeString);
    procedure Set_CMod(Value: UnicodeString);
    procedure Set_CCorDENATRAN(Value: UnicodeString);
    procedure Set_Lota(Value: UnicodeString);
    procedure Set_TpRest(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_med }

  TXMLTNFe_infNFe_det_prod_med = class(TXMLNode, IXMLTNFe_infNFe_det_prod_med)
  protected
    { IXMLTNFe_infNFe_det_prod_med }
    function Get_CProdANVISA: UnicodeString;
    function Get_VPMC: UnicodeString;
    procedure Set_CProdANVISA(Value: UnicodeString);
    procedure Set_VPMC(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_arma }

  TXMLTNFe_infNFe_det_prod_arma = class(TXMLNode, IXMLTNFe_infNFe_det_prod_arma)
  protected
    { IXMLTNFe_infNFe_det_prod_arma }
    function Get_TpArma: UnicodeString;
    function Get_NSerie: UnicodeString;
    function Get_NCano: UnicodeString;
    function Get_Descr: UnicodeString;
    procedure Set_TpArma(Value: UnicodeString);
    procedure Set_NSerie(Value: UnicodeString);
    procedure Set_NCano(Value: UnicodeString);
    procedure Set_Descr(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_armaList }

  TXMLTNFe_infNFe_det_prod_armaList = class(TXMLNodeCollection, IXMLTNFe_infNFe_det_prod_armaList)
  protected
    { IXMLTNFe_infNFe_det_prod_armaList }
    function Add: IXMLTNFe_infNFe_det_prod_arma;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_arma;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_arma;
  end;

{ TXMLTNFe_infNFe_det_prod_comb }

  TXMLTNFe_infNFe_det_prod_comb = class(TXMLNode, IXMLTNFe_infNFe_det_prod_comb)
  protected
    { IXMLTNFe_infNFe_det_prod_comb }
    function Get_CProdANP: UnicodeString;
    function Get_DescANP: UnicodeString;
    function Get_PGLP: UnicodeString;
    function Get_PGNn: UnicodeString;
    function Get_PGNi: UnicodeString;
    function Get_VPart: UnicodeString;
    function Get_CODIF: UnicodeString;
    function Get_QTemp: UnicodeString;
    function Get_UFCons: UnicodeString;
    function Get_CIDE: IXMLTNFe_infNFe_det_prod_comb_CIDE;
    function Get_Encerrante: IXMLTNFe_infNFe_det_prod_comb_encerrante;
    procedure Set_CProdANP(Value: UnicodeString);
    procedure Set_DescANP(Value: UnicodeString);
    procedure Set_PGLP(Value: UnicodeString);
    procedure Set_PGNn(Value: UnicodeString);
    procedure Set_PGNi(Value: UnicodeString);
    procedure Set_VPart(Value: UnicodeString);
    procedure Set_CODIF(Value: UnicodeString);
    procedure Set_QTemp(Value: UnicodeString);
    procedure Set_UFCons(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_prod_comb_CIDE }

  TXMLTNFe_infNFe_det_prod_comb_CIDE = class(TXMLNode, IXMLTNFe_infNFe_det_prod_comb_CIDE)
  protected
    { IXMLTNFe_infNFe_det_prod_comb_CIDE }
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCIDE: UnicodeString;
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCIDE(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_prod_comb_encerrante }

  TXMLTNFe_infNFe_det_prod_comb_encerrante = class(TXMLNode, IXMLTNFe_infNFe_det_prod_comb_encerrante)
  protected
    { IXMLTNFe_infNFe_det_prod_comb_encerrante }
    function Get_NBico: UnicodeString;
    function Get_NBomba: UnicodeString;
    function Get_NTanque: UnicodeString;
    function Get_VEncIni: UnicodeString;
    function Get_VEncFin: UnicodeString;
    procedure Set_NBico(Value: UnicodeString);
    procedure Set_NBomba(Value: UnicodeString);
    procedure Set_NTanque(Value: UnicodeString);
    procedure Set_VEncIni(Value: UnicodeString);
    procedure Set_VEncFin(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto }

  TXMLTNFe_infNFe_det_imposto = class(TXMLNode, IXMLTNFe_infNFe_det_imposto)
  protected
    { IXMLTNFe_infNFe_det_imposto }
    function Get_VTotTrib: UnicodeString;
    function Get_ICMS: IXMLTNFe_infNFe_det_imposto_ICMS;
    function Get_IPI: IXMLTIpi;
    function Get_II: IXMLTNFe_infNFe_det_imposto_II;
    function Get_ISSQN: IXMLTNFe_infNFe_det_imposto_ISSQN;
    function Get_PIS: IXMLTNFe_infNFe_det_imposto_PIS;
    function Get_PISST: IXMLTNFe_infNFe_det_imposto_PISST;
    function Get_COFINS: IXMLTNFe_infNFe_det_imposto_COFINS;
    function Get_COFINSST: IXMLTNFe_infNFe_det_imposto_COFINSST;
    function Get_ICMSUFDest: IXMLTNFe_infNFe_det_imposto_ICMSUFDest;
    procedure Set_VTotTrib(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS }

  TXMLTNFe_infNFe_det_imposto_ICMS = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS }
    function Get_ICMS00: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00;
    function Get_ICMS10: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10;
    function Get_ICMS20: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20;
    function Get_ICMS30: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30;
    function Get_ICMS40: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40;
    function Get_ICMS51: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51;
    function Get_ICMS60: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60;
    function Get_ICMS70: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70;
    function Get_ICMS90: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90;
    function Get_ICMSPart: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart;
    function Get_ICMSST: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST;
    function Get_ICMSSN101: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101;
    function Get_ICMSSN102: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102;
    function Get_ICMSSN201: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201;
    function Get_ICMSSN202: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202;
    function Get_ICMSSN500: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500;
    function Get_ICMSSN900: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMSOp: UnicodeString;
    function Get_PDif: UnicodeString;
    function Get_VICMSDif: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMSOp(Value: UnicodeString);
    procedure Set_PDif(Value: UnicodeString);
    procedure Set_VICMSDif(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_VBCSTRet: UnicodeString;
    function Get_PST: UnicodeString;
    function Get_VICMSSTRet: UnicodeString;
    function Get_VBCFCPSTRet: UnicodeString;
    function Get_PFCPSTRet: UnicodeString;
    function Get_VFCPSTRet: UnicodeString;
    function Get_PRedBCEfet: UnicodeString;
    function Get_VBCEfet: UnicodeString;
    function Get_PICMSEfet: UnicodeString;
    function Get_VICMSEfet: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBCSTRet(Value: UnicodeString);
    procedure Set_PST(Value: UnicodeString);
    procedure Set_VICMSSTRet(Value: UnicodeString);
    procedure Set_VBCFCPSTRet(Value: UnicodeString);
    procedure Set_PFCPSTRet(Value: UnicodeString);
    procedure Set_VFCPSTRet(Value: UnicodeString);
    procedure Set_PRedBCEfet(Value: UnicodeString);
    procedure Set_VBCEfet(Value: UnicodeString);
    procedure Set_PICMSEfet(Value: UnicodeString);
    procedure Set_VICMSEfet(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VBCFCP: UnicodeString;
    function Get_PFCP: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_MotDesICMS: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VBCFCP(Value: UnicodeString);
    procedure Set_PFCP(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_MotDesICMS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_PBCOp: UnicodeString;
    function Get_UFST: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_PBCOp(Value: UnicodeString);
    procedure Set_UFST(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST }
    function Get_Orig: UnicodeString;
    function Get_CST: UnicodeString;
    function Get_VBCSTRet: UnicodeString;
    function Get_VICMSSTRet: UnicodeString;
    function Get_VBCSTDest: UnicodeString;
    function Get_VICMSSTDest: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBCSTRet(Value: UnicodeString);
    procedure Set_VICMSSTRet(Value: UnicodeString);
    procedure Set_VBCSTDest(Value: UnicodeString);
    procedure Set_VICMSSTDest(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_PCredSN: UnicodeString;
    function Get_VCredICMSSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_PCredSN(Value: UnicodeString);
    procedure Set_VCredICMSSN(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_PCredSN: UnicodeString;
    function Get_VCredICMSSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_PCredSN(Value: UnicodeString);
    procedure Set_VCredICMSSN(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_VBCSTRet: UnicodeString;
    function Get_PST: UnicodeString;
    function Get_VICMSSTRet: UnicodeString;
    function Get_VBCFCPSTRet: UnicodeString;
    function Get_PFCPSTRet: UnicodeString;
    function Get_VFCPSTRet: UnicodeString;
    function Get_PRedBCEfet: UnicodeString;
    function Get_VBCEfet: UnicodeString;
    function Get_PICMSEfet: UnicodeString;
    function Get_VICMSEfet: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_VBCSTRet(Value: UnicodeString);
    procedure Set_PST(Value: UnicodeString);
    procedure Set_VICMSSTRet(Value: UnicodeString);
    procedure Set_VBCFCPSTRet(Value: UnicodeString);
    procedure Set_PFCPSTRet(Value: UnicodeString);
    procedure Set_VFCPSTRet(Value: UnicodeString);
    procedure Set_PRedBCEfet(Value: UnicodeString);
    procedure Set_VBCEfet(Value: UnicodeString);
    procedure Set_PICMSEfet(Value: UnicodeString);
    procedure Set_VICMSEfet(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 }

  TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 }
    function Get_Orig: UnicodeString;
    function Get_CSOSN: UnicodeString;
    function Get_ModBC: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PRedBC: UnicodeString;
    function Get_PICMS: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_ModBCST: UnicodeString;
    function Get_PMVAST: UnicodeString;
    function Get_PRedBCST: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_PICMSST: UnicodeString;
    function Get_VICMSST: UnicodeString;
    function Get_VBCFCPST: UnicodeString;
    function Get_PFCPST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_PCredSN: UnicodeString;
    function Get_VCredICMSSN: UnicodeString;
    procedure Set_Orig(Value: UnicodeString);
    procedure Set_CSOSN(Value: UnicodeString);
    procedure Set_ModBC(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PRedBC(Value: UnicodeString);
    procedure Set_PICMS(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_ModBCST(Value: UnicodeString);
    procedure Set_PMVAST(Value: UnicodeString);
    procedure Set_PRedBCST(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_PICMSST(Value: UnicodeString);
    procedure Set_VICMSST(Value: UnicodeString);
    procedure Set_VBCFCPST(Value: UnicodeString);
    procedure Set_PFCPST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_PCredSN(Value: UnicodeString);
    procedure Set_VCredICMSSN(Value: UnicodeString);
  end;

{ TXMLTIpi }

  TXMLTIpi = class(TXMLNode, IXMLTIpi)
  protected
    { IXMLTIpi }
    function Get_CNPJProd: UnicodeString;
    function Get_CSelo: UnicodeString;
    function Get_QSelo: UnicodeString;
    function Get_CEnq: UnicodeString;
    function Get_IPITrib: IXMLTIpi_IPITrib;
    function Get_IPINT: IXMLTIpi_IPINT;
    procedure Set_CNPJProd(Value: UnicodeString);
    procedure Set_CSelo(Value: UnicodeString);
    procedure Set_QSelo(Value: UnicodeString);
    procedure Set_CEnq(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTIpi_IPITrib }

  TXMLTIpi_IPITrib = class(TXMLNode, IXMLTIpi_IPITrib)
  protected
    { IXMLTIpi_IPITrib }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PIPI: UnicodeString;
    function Get_QUnid: UnicodeString;
    function Get_VUnid: UnicodeString;
    function Get_VIPI: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PIPI(Value: UnicodeString);
    procedure Set_QUnid(Value: UnicodeString);
    procedure Set_VUnid(Value: UnicodeString);
    procedure Set_VIPI(Value: UnicodeString);
  end;

{ TXMLTIpi_IPINT }

  TXMLTIpi_IPINT = class(TXMLNode, IXMLTIpi_IPINT)
  protected
    { IXMLTIpi_IPINT }
    function Get_CST: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_II }

  TXMLTNFe_infNFe_det_imposto_II = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_II)
  protected
    { IXMLTNFe_infNFe_det_imposto_II }
    function Get_VBC: UnicodeString;
    function Get_VDespAdu: UnicodeString;
    function Get_VII: UnicodeString;
    function Get_VIOF: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VDespAdu(Value: UnicodeString);
    procedure Set_VII(Value: UnicodeString);
    procedure Set_VIOF(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ISSQN }

  TXMLTNFe_infNFe_det_imposto_ISSQN = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ISSQN)
  protected
    { IXMLTNFe_infNFe_det_imposto_ISSQN }
    function Get_VBC: UnicodeString;
    function Get_VAliq: UnicodeString;
    function Get_VISSQN: UnicodeString;
    function Get_CMunFG: UnicodeString;
    function Get_CListServ: UnicodeString;
    function Get_VDeducao: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_VDescIncond: UnicodeString;
    function Get_VDescCond: UnicodeString;
    function Get_VISSRet: UnicodeString;
    function Get_IndISS: UnicodeString;
    function Get_CServico: UnicodeString;
    function Get_CMun: UnicodeString;
    function Get_CPais: UnicodeString;
    function Get_NProcesso: UnicodeString;
    function Get_IndIncentivo: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VAliq(Value: UnicodeString);
    procedure Set_VISSQN(Value: UnicodeString);
    procedure Set_CMunFG(Value: UnicodeString);
    procedure Set_CListServ(Value: UnicodeString);
    procedure Set_VDeducao(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_VDescIncond(Value: UnicodeString);
    procedure Set_VDescCond(Value: UnicodeString);
    procedure Set_VISSRet(Value: UnicodeString);
    procedure Set_IndISS(Value: UnicodeString);
    procedure Set_CServico(Value: UnicodeString);
    procedure Set_CMun(Value: UnicodeString);
    procedure Set_CPais(Value: UnicodeString);
    procedure Set_NProcesso(Value: UnicodeString);
    procedure Set_IndIncentivo(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_PIS }

  TXMLTNFe_infNFe_det_imposto_PIS = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_PIS)
  protected
    { IXMLTNFe_infNFe_det_imposto_PIS }
    function Get_PISAliq: IXMLTNFe_infNFe_det_imposto_PIS_PISAliq;
    function Get_PISQtde: IXMLTNFe_infNFe_det_imposto_PIS_PISQtde;
    function Get_PISNT: IXMLTNFe_infNFe_det_imposto_PIS_PISNT;
    function Get_PISOutr: IXMLTNFe_infNFe_det_imposto_PIS_PISOutr;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISAliq }

  TXMLTNFe_infNFe_det_imposto_PIS_PISAliq = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_PIS_PISAliq)
  protected
    { IXMLTNFe_infNFe_det_imposto_PIS_PISAliq }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PPIS: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PPIS(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISQtde }

  TXMLTNFe_infNFe_det_imposto_PIS_PISQtde = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_PIS_PISQtde)
  protected
    { IXMLTNFe_infNFe_det_imposto_PIS_PISQtde }
    function Get_CST: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISNT }

  TXMLTNFe_infNFe_det_imposto_PIS_PISNT = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_PIS_PISNT)
  protected
    { IXMLTNFe_infNFe_det_imposto_PIS_PISNT }
    function Get_CST: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISOutr }

  TXMLTNFe_infNFe_det_imposto_PIS_PISOutr = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_PIS_PISOutr)
  protected
    { IXMLTNFe_infNFe_det_imposto_PIS_PISOutr }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PPIS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PPIS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_PISST }

  TXMLTNFe_infNFe_det_imposto_PISST = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_PISST)
  protected
    { IXMLTNFe_infNFe_det_imposto_PISST }
    function Get_VBC: UnicodeString;
    function Get_PPIS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VPIS: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PPIS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_COFINS }

  TXMLTNFe_infNFe_det_imposto_COFINS = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_COFINS)
  protected
    { IXMLTNFe_infNFe_det_imposto_COFINS }
    function Get_COFINSAliq: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq;
    function Get_COFINSQtde: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde;
    function Get_COFINSNT: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT;
    function Get_COFINSOutr: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq }

  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq)
  protected
    { IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PCOFINS: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PCOFINS(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde }

  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde)
  protected
    { IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde }
    function Get_CST: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT }

  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT)
  protected
    { IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT }
    function Get_CST: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr }

  TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr)
  protected
    { IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr }
    function Get_CST: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_PCOFINS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_CST(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PCOFINS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_COFINSST }

  TXMLTNFe_infNFe_det_imposto_COFINSST = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_COFINSST)
  protected
    { IXMLTNFe_infNFe_det_imposto_COFINSST }
    function Get_VBC: UnicodeString;
    function Get_PCOFINS: UnicodeString;
    function Get_QBCProd: UnicodeString;
    function Get_VAliqProd: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_PCOFINS(Value: UnicodeString);
    procedure Set_QBCProd(Value: UnicodeString);
    procedure Set_VAliqProd(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_imposto_ICMSUFDest }

  TXMLTNFe_infNFe_det_imposto_ICMSUFDest = class(TXMLNode, IXMLTNFe_infNFe_det_imposto_ICMSUFDest)
  protected
    { IXMLTNFe_infNFe_det_imposto_ICMSUFDest }
    function Get_VBCUFDest: UnicodeString;
    function Get_VBCFCPUFDest: UnicodeString;
    function Get_PFCPUFDest: UnicodeString;
    function Get_PICMSUFDest: UnicodeString;
    function Get_PICMSInter: UnicodeString;
    function Get_PICMSInterPart: UnicodeString;
    function Get_VFCPUFDest: UnicodeString;
    function Get_VICMSUFDest: UnicodeString;
    function Get_VICMSUFRemet: UnicodeString;
    procedure Set_VBCUFDest(Value: UnicodeString);
    procedure Set_VBCFCPUFDest(Value: UnicodeString);
    procedure Set_PFCPUFDest(Value: UnicodeString);
    procedure Set_PICMSUFDest(Value: UnicodeString);
    procedure Set_PICMSInter(Value: UnicodeString);
    procedure Set_PICMSInterPart(Value: UnicodeString);
    procedure Set_VFCPUFDest(Value: UnicodeString);
    procedure Set_VICMSUFDest(Value: UnicodeString);
    procedure Set_VICMSUFRemet(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_det_impostoDevol }

  TXMLTNFe_infNFe_det_impostoDevol = class(TXMLNode, IXMLTNFe_infNFe_det_impostoDevol)
  protected
    { IXMLTNFe_infNFe_det_impostoDevol }
    function Get_PDevol: UnicodeString;
    function Get_IPI: IXMLTNFe_infNFe_det_impostoDevol_IPI;
    procedure Set_PDevol(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_impostoDevol_IPI }

  TXMLTNFe_infNFe_det_impostoDevol_IPI = class(TXMLNode, IXMLTNFe_infNFe_det_impostoDevol_IPI)
  protected
    { IXMLTNFe_infNFe_det_impostoDevol_IPI }
    function Get_VIPIDevol: UnicodeString;
    procedure Set_VIPIDevol(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_total }

  TXMLTNFe_infNFe_total = class(TXMLNode, IXMLTNFe_infNFe_total)
  protected
    { IXMLTNFe_infNFe_total }
    function Get_ICMSTot: IXMLTNFe_infNFe_total_ICMSTot;
    function Get_ISSQNtot: IXMLTNFe_infNFe_total_ISSQNtot;
    function Get_RetTrib: IXMLTNFe_infNFe_total_retTrib;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_total_ICMSTot }

  TXMLTNFe_infNFe_total_ICMSTot = class(TXMLNode, IXMLTNFe_infNFe_total_ICMSTot)
  protected
    { IXMLTNFe_infNFe_total_ICMSTot }
    function Get_VBC: UnicodeString;
    function Get_VICMS: UnicodeString;
    function Get_VICMSDeson: UnicodeString;
    function Get_VFCPUFDest: UnicodeString;
    function Get_VICMSUFDest: UnicodeString;
    function Get_VICMSUFRemet: UnicodeString;
    function Get_VFCP: UnicodeString;
    function Get_VBCST: UnicodeString;
    function Get_VST: UnicodeString;
    function Get_VFCPST: UnicodeString;
    function Get_VFCPSTRet: UnicodeString;
    function Get_VProd: UnicodeString;
    function Get_VFrete: UnicodeString;
    function Get_VSeg: UnicodeString;
    function Get_VDesc: UnicodeString;
    function Get_VII: UnicodeString;
    function Get_VIPI: UnicodeString;
    function Get_VIPIDevol: UnicodeString;
    function Get_VPIS: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_VNF: UnicodeString;
    function Get_VTotTrib: UnicodeString;
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VICMS(Value: UnicodeString);
    procedure Set_VICMSDeson(Value: UnicodeString);
    procedure Set_VFCPUFDest(Value: UnicodeString);
    procedure Set_VICMSUFDest(Value: UnicodeString);
    procedure Set_VICMSUFRemet(Value: UnicodeString);
    procedure Set_VFCP(Value: UnicodeString);
    procedure Set_VBCST(Value: UnicodeString);
    procedure Set_VST(Value: UnicodeString);
    procedure Set_VFCPST(Value: UnicodeString);
    procedure Set_VFCPSTRet(Value: UnicodeString);
    procedure Set_VProd(Value: UnicodeString);
    procedure Set_VFrete(Value: UnicodeString);
    procedure Set_VSeg(Value: UnicodeString);
    procedure Set_VDesc(Value: UnicodeString);
    procedure Set_VII(Value: UnicodeString);
    procedure Set_VIPI(Value: UnicodeString);
    procedure Set_VIPIDevol(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_VNF(Value: UnicodeString);
    procedure Set_VTotTrib(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_total_ISSQNtot }

  TXMLTNFe_infNFe_total_ISSQNtot = class(TXMLNode, IXMLTNFe_infNFe_total_ISSQNtot)
  protected
    { IXMLTNFe_infNFe_total_ISSQNtot }
    function Get_VServ: UnicodeString;
    function Get_VBC: UnicodeString;
    function Get_VISS: UnicodeString;
    function Get_VPIS: UnicodeString;
    function Get_VCOFINS: UnicodeString;
    function Get_DCompet: UnicodeString;
    function Get_VDeducao: UnicodeString;
    function Get_VOutro: UnicodeString;
    function Get_VDescIncond: UnicodeString;
    function Get_VDescCond: UnicodeString;
    function Get_VISSRet: UnicodeString;
    function Get_CRegTrib: UnicodeString;
    procedure Set_VServ(Value: UnicodeString);
    procedure Set_VBC(Value: UnicodeString);
    procedure Set_VISS(Value: UnicodeString);
    procedure Set_VPIS(Value: UnicodeString);
    procedure Set_VCOFINS(Value: UnicodeString);
    procedure Set_DCompet(Value: UnicodeString);
    procedure Set_VDeducao(Value: UnicodeString);
    procedure Set_VOutro(Value: UnicodeString);
    procedure Set_VDescIncond(Value: UnicodeString);
    procedure Set_VDescCond(Value: UnicodeString);
    procedure Set_VISSRet(Value: UnicodeString);
    procedure Set_CRegTrib(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_total_retTrib }

  TXMLTNFe_infNFe_total_retTrib = class(TXMLNode, IXMLTNFe_infNFe_total_retTrib)
  protected
    { IXMLTNFe_infNFe_total_retTrib }
    function Get_VRetPIS: UnicodeString;
    function Get_VRetCOFINS: UnicodeString;
    function Get_VRetCSLL: UnicodeString;
    function Get_VBCIRRF: UnicodeString;
    function Get_VIRRF: UnicodeString;
    function Get_VBCRetPrev: UnicodeString;
    function Get_VRetPrev: UnicodeString;
    procedure Set_VRetPIS(Value: UnicodeString);
    procedure Set_VRetCOFINS(Value: UnicodeString);
    procedure Set_VRetCSLL(Value: UnicodeString);
    procedure Set_VBCIRRF(Value: UnicodeString);
    procedure Set_VIRRF(Value: UnicodeString);
    procedure Set_VBCRetPrev(Value: UnicodeString);
    procedure Set_VRetPrev(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_transp }

  TXMLTNFe_infNFe_transp = class(TXMLNode, IXMLTNFe_infNFe_transp)
  private
    FReboque: IXMLTVeiculoList;
    FVol: IXMLTNFe_infNFe_transp_volList;
  protected
    { IXMLTNFe_infNFe_transp }
    function Get_ModFrete: UnicodeString;
    function Get_Transporta: IXMLTNFe_infNFe_transp_transporta;
    function Get_RetTransp: IXMLTNFe_infNFe_transp_retTransp;
    function Get_VeicTransp: IXMLTVeiculo;
    function Get_Reboque: IXMLTVeiculoList;
    function Get_Vagao: UnicodeString;
    function Get_Balsa: UnicodeString;
    function Get_Vol: IXMLTNFe_infNFe_transp_volList;
    procedure Set_ModFrete(Value: UnicodeString);
    procedure Set_Vagao(Value: UnicodeString);
    procedure Set_Balsa(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_transp_transporta }

  TXMLTNFe_infNFe_transp_transporta = class(TXMLNode, IXMLTNFe_infNFe_transp_transporta)
  protected
    { IXMLTNFe_infNFe_transp_transporta }
    function Get_CNPJ: UnicodeString;
    function Get_CPF: UnicodeString;
    function Get_XNome: UnicodeString;
    function Get_IE: UnicodeString;
    function Get_XEnder: UnicodeString;
    function Get_XMun: UnicodeString;
    function Get_UF: UnicodeString;
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_CPF(Value: UnicodeString);
    procedure Set_XNome(Value: UnicodeString);
    procedure Set_IE(Value: UnicodeString);
    procedure Set_XEnder(Value: UnicodeString);
    procedure Set_XMun(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_transp_retTransp }

  TXMLTNFe_infNFe_transp_retTransp = class(TXMLNode, IXMLTNFe_infNFe_transp_retTransp)
  protected
    { IXMLTNFe_infNFe_transp_retTransp }
    function Get_VServ: UnicodeString;
    function Get_VBCRet: UnicodeString;
    function Get_PICMSRet: UnicodeString;
    function Get_VICMSRet: UnicodeString;
    function Get_CFOP: UnicodeString;
    function Get_CMunFG: UnicodeString;
    procedure Set_VServ(Value: UnicodeString);
    procedure Set_VBCRet(Value: UnicodeString);
    procedure Set_PICMSRet(Value: UnicodeString);
    procedure Set_VICMSRet(Value: UnicodeString);
    procedure Set_CFOP(Value: UnicodeString);
    procedure Set_CMunFG(Value: UnicodeString);
  end;

{ TXMLTVeiculo }

  TXMLTVeiculo = class(TXMLNode, IXMLTVeiculo)
  protected
    { IXMLTVeiculo }
    function Get_Placa: UnicodeString;
    function Get_UF: UnicodeString;
    function Get_RNTC: UnicodeString;
    procedure Set_Placa(Value: UnicodeString);
    procedure Set_UF(Value: UnicodeString);
    procedure Set_RNTC(Value: UnicodeString);
  end;

{ TXMLTVeiculoList }

  TXMLTVeiculoList = class(TXMLNodeCollection, IXMLTVeiculoList)
  protected
    { IXMLTVeiculoList }
    function Add: IXMLTVeiculo;
    function Insert(const Index: Integer): IXMLTVeiculo;

    function Get_Item(Index: Integer): IXMLTVeiculo;
  end;

{ TXMLTNFe_infNFe_transp_vol }

  TXMLTNFe_infNFe_transp_vol = class(TXMLNode, IXMLTNFe_infNFe_transp_vol)
  private
    FLacres: IXMLTNFe_infNFe_transp_vol_lacresList;
  protected
    { IXMLTNFe_infNFe_transp_vol }
    function Get_QVol: UnicodeString;
    function Get_Esp: UnicodeString;
    function Get_Marca: UnicodeString;
    function Get_NVol: UnicodeString;
    function Get_PesoL: UnicodeString;
    function Get_PesoB: UnicodeString;
    function Get_Lacres: IXMLTNFe_infNFe_transp_vol_lacresList;
    procedure Set_QVol(Value: UnicodeString);
    procedure Set_Esp(Value: UnicodeString);
    procedure Set_Marca(Value: UnicodeString);
    procedure Set_NVol(Value: UnicodeString);
    procedure Set_PesoL(Value: UnicodeString);
    procedure Set_PesoB(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_transp_volList }

  TXMLTNFe_infNFe_transp_volList = class(TXMLNodeCollection, IXMLTNFe_infNFe_transp_volList)
  protected
    { IXMLTNFe_infNFe_transp_volList }
    function Add: IXMLTNFe_infNFe_transp_vol;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_transp_vol;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_transp_vol;
  end;

{ TXMLTNFe_infNFe_transp_vol_lacres }

  TXMLTNFe_infNFe_transp_vol_lacres = class(TXMLNode, IXMLTNFe_infNFe_transp_vol_lacres)
  protected
    { IXMLTNFe_infNFe_transp_vol_lacres }
    function Get_NLacre: UnicodeString;
    procedure Set_NLacre(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_transp_vol_lacresList }

  TXMLTNFe_infNFe_transp_vol_lacresList = class(TXMLNodeCollection, IXMLTNFe_infNFe_transp_vol_lacresList)
  protected
    { IXMLTNFe_infNFe_transp_vol_lacresList }
    function Add: IXMLTNFe_infNFe_transp_vol_lacres;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_transp_vol_lacres;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_transp_vol_lacres;
  end;

{ TXMLTNFe_infNFe_cobr }

  TXMLTNFe_infNFe_cobr = class(TXMLNode, IXMLTNFe_infNFe_cobr)
  private
    FDup: IXMLTNFe_infNFe_cobr_dupList;
  protected
    { IXMLTNFe_infNFe_cobr }
    function Get_Fat: IXMLTNFe_infNFe_cobr_fat;
    function Get_Dup: IXMLTNFe_infNFe_cobr_dupList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_cobr_fat }

  TXMLTNFe_infNFe_cobr_fat = class(TXMLNode, IXMLTNFe_infNFe_cobr_fat)
  protected
    { IXMLTNFe_infNFe_cobr_fat }
    function Get_NFat: UnicodeString;
    function Get_VOrig: UnicodeString;
    function Get_VDesc: UnicodeString;
    function Get_VLiq: UnicodeString;
    procedure Set_NFat(Value: UnicodeString);
    procedure Set_VOrig(Value: UnicodeString);
    procedure Set_VDesc(Value: UnicodeString);
    procedure Set_VLiq(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_cobr_dup }

  TXMLTNFe_infNFe_cobr_dup = class(TXMLNode, IXMLTNFe_infNFe_cobr_dup)
  protected
    { IXMLTNFe_infNFe_cobr_dup }
    function Get_NDup: UnicodeString;
    function Get_DVenc: UnicodeString;
    function Get_VDup: UnicodeString;
    procedure Set_NDup(Value: UnicodeString);
    procedure Set_DVenc(Value: UnicodeString);
    procedure Set_VDup(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_cobr_dupList }

  TXMLTNFe_infNFe_cobr_dupList = class(TXMLNodeCollection, IXMLTNFe_infNFe_cobr_dupList)
  protected
    { IXMLTNFe_infNFe_cobr_dupList }
    function Add: IXMLTNFe_infNFe_cobr_dup;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_cobr_dup;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_cobr_dup;
  end;

{ TXMLTNFe_infNFe_pag }

  TXMLTNFe_infNFe_pag = class(TXMLNode, IXMLTNFe_infNFe_pag)
  private
    FDetPag: IXMLTNFe_infNFe_pag_detPagList;
  protected
    { IXMLTNFe_infNFe_pag }
    function Get_DetPag: IXMLTNFe_infNFe_pag_detPagList;
    function Get_VTroco: UnicodeString;
    procedure Set_VTroco(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_pag_detPag }

  TXMLTNFe_infNFe_pag_detPag = class(TXMLNode, IXMLTNFe_infNFe_pag_detPag)
  protected
    { IXMLTNFe_infNFe_pag_detPag }
    function Get_IndPag: UnicodeString;
    function Get_TPag: UnicodeString;
    function Get_VPag: UnicodeString;
    function Get_Card: IXMLTNFe_infNFe_pag_detPag_card;
    procedure Set_IndPag(Value: UnicodeString);
    procedure Set_TPag(Value: UnicodeString);
    procedure Set_VPag(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_pag_detPagList }

  TXMLTNFe_infNFe_pag_detPagList = class(TXMLNodeCollection, IXMLTNFe_infNFe_pag_detPagList)
  protected
    { IXMLTNFe_infNFe_pag_detPagList }
    function Add: IXMLTNFe_infNFe_pag_detPag;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_pag_detPag;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_pag_detPag;
  end;

{ TXMLTNFe_infNFe_pag_detPag_card }

  TXMLTNFe_infNFe_pag_detPag_card = class(TXMLNode, IXMLTNFe_infNFe_pag_detPag_card)
  protected
    { IXMLTNFe_infNFe_pag_detPag_card }
    function Get_TpIntegra: UnicodeString;
    function Get_CNPJ: UnicodeString;
    function Get_TBand: UnicodeString;
    function Get_CAut: UnicodeString;
    procedure Set_TpIntegra(Value: UnicodeString);
    procedure Set_CNPJ(Value: UnicodeString);
    procedure Set_TBand(Value: UnicodeString);
    procedure Set_CAut(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_infAdic }

  TXMLTNFe_infNFe_infAdic = class(TXMLNode, IXMLTNFe_infNFe_infAdic)
  private
    FObsCont: IXMLTNFe_infNFe_infAdic_obsContList;
    FObsFisco: IXMLTNFe_infNFe_infAdic_obsFiscoList;
    FProcRef: IXMLTNFe_infNFe_infAdic_procRefList;
  protected
    { IXMLTNFe_infNFe_infAdic }
    function Get_InfAdFisco: UnicodeString;
    function Get_InfCpl: UnicodeString;
    function Get_ObsCont: IXMLTNFe_infNFe_infAdic_obsContList;
    function Get_ObsFisco: IXMLTNFe_infNFe_infAdic_obsFiscoList;
    function Get_ProcRef: IXMLTNFe_infNFe_infAdic_procRefList;
    procedure Set_InfAdFisco(Value: UnicodeString);
    procedure Set_InfCpl(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_infAdic_obsCont }

  TXMLTNFe_infNFe_infAdic_obsCont = class(TXMLNode, IXMLTNFe_infNFe_infAdic_obsCont)
  protected
    { IXMLTNFe_infNFe_infAdic_obsCont }
    function Get_XCampo: UnicodeString;
    function Get_XTexto: UnicodeString;
    procedure Set_XCampo(Value: UnicodeString);
    procedure Set_XTexto(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_infAdic_obsContList }

  TXMLTNFe_infNFe_infAdic_obsContList = class(TXMLNodeCollection, IXMLTNFe_infNFe_infAdic_obsContList)
  protected
    { IXMLTNFe_infNFe_infAdic_obsContList }
    function Add: IXMLTNFe_infNFe_infAdic_obsCont;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_obsCont;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_obsCont;
  end;

{ TXMLTNFe_infNFe_infAdic_obsFisco }

  TXMLTNFe_infNFe_infAdic_obsFisco = class(TXMLNode, IXMLTNFe_infNFe_infAdic_obsFisco)
  protected
    { IXMLTNFe_infNFe_infAdic_obsFisco }
    function Get_XCampo: UnicodeString;
    function Get_XTexto: UnicodeString;
    procedure Set_XCampo(Value: UnicodeString);
    procedure Set_XTexto(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_infAdic_obsFiscoList }

  TXMLTNFe_infNFe_infAdic_obsFiscoList = class(TXMLNodeCollection, IXMLTNFe_infNFe_infAdic_obsFiscoList)
  protected
    { IXMLTNFe_infNFe_infAdic_obsFiscoList }
    function Add: IXMLTNFe_infNFe_infAdic_obsFisco;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_obsFisco;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_obsFisco;
  end;

{ TXMLTNFe_infNFe_infAdic_procRef }

  TXMLTNFe_infNFe_infAdic_procRef = class(TXMLNode, IXMLTNFe_infNFe_infAdic_procRef)
  protected
    { IXMLTNFe_infNFe_infAdic_procRef }
    function Get_NProc: UnicodeString;
    function Get_IndProc: UnicodeString;
    procedure Set_NProc(Value: UnicodeString);
    procedure Set_IndProc(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_infAdic_procRefList }

  TXMLTNFe_infNFe_infAdic_procRefList = class(TXMLNodeCollection, IXMLTNFe_infNFe_infAdic_procRefList)
  protected
    { IXMLTNFe_infNFe_infAdic_procRefList }
    function Add: IXMLTNFe_infNFe_infAdic_procRef;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_procRef;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_procRef;
  end;

{ TXMLTNFe_infNFe_exporta }

  TXMLTNFe_infNFe_exporta = class(TXMLNode, IXMLTNFe_infNFe_exporta)
  protected
    { IXMLTNFe_infNFe_exporta }
    function Get_UFSaidaPais: UnicodeString;
    function Get_XLocExporta: UnicodeString;
    function Get_XLocDespacho: UnicodeString;
    procedure Set_UFSaidaPais(Value: UnicodeString);
    procedure Set_XLocExporta(Value: UnicodeString);
    procedure Set_XLocDespacho(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_compra }

  TXMLTNFe_infNFe_compra = class(TXMLNode, IXMLTNFe_infNFe_compra)
  protected
    { IXMLTNFe_infNFe_compra }
    function Get_XNEmp: UnicodeString;
    function Get_XPed: UnicodeString;
    function Get_XCont: UnicodeString;
    procedure Set_XNEmp(Value: UnicodeString);
    procedure Set_XPed(Value: UnicodeString);
    procedure Set_XCont(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_cana }

  TXMLTNFe_infNFe_cana = class(TXMLNode, IXMLTNFe_infNFe_cana)
  private
    FForDia: IXMLTNFe_infNFe_cana_forDiaList;
    FDeduc: IXMLTNFe_infNFe_cana_deducList;
  protected
    { IXMLTNFe_infNFe_cana }
    function Get_Safra: UnicodeString;
    function Get_Ref: UnicodeString;
    function Get_ForDia: IXMLTNFe_infNFe_cana_forDiaList;
    function Get_QTotMes: UnicodeString;
    function Get_QTotAnt: UnicodeString;
    function Get_QTotGer: UnicodeString;
    function Get_Deduc: IXMLTNFe_infNFe_cana_deducList;
    function Get_VFor: UnicodeString;
    function Get_VTotDed: UnicodeString;
    function Get_VLiqFor: UnicodeString;
    procedure Set_Safra(Value: UnicodeString);
    procedure Set_Ref(Value: UnicodeString);
    procedure Set_QTotMes(Value: UnicodeString);
    procedure Set_QTotAnt(Value: UnicodeString);
    procedure Set_QTotGer(Value: UnicodeString);
    procedure Set_VFor(Value: UnicodeString);
    procedure Set_VTotDed(Value: UnicodeString);
    procedure Set_VLiqFor(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_cana_forDia }

  TXMLTNFe_infNFe_cana_forDia = class(TXMLNode, IXMLTNFe_infNFe_cana_forDia)
  protected
    { IXMLTNFe_infNFe_cana_forDia }
    function Get_Dia: UnicodeString;
    function Get_Qtde: UnicodeString;
    procedure Set_Dia(Value: UnicodeString);
    procedure Set_Qtde(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_cana_forDiaList }

  TXMLTNFe_infNFe_cana_forDiaList = class(TXMLNodeCollection, IXMLTNFe_infNFe_cana_forDiaList)
  protected
    { IXMLTNFe_infNFe_cana_forDiaList }
    function Add: IXMLTNFe_infNFe_cana_forDia;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_cana_forDia;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_cana_forDia;
  end;

{ TXMLTNFe_infNFe_cana_deduc }

  TXMLTNFe_infNFe_cana_deduc = class(TXMLNode, IXMLTNFe_infNFe_cana_deduc)
  protected
    { IXMLTNFe_infNFe_cana_deduc }
    function Get_XDed: UnicodeString;
    function Get_VDed: UnicodeString;
    procedure Set_XDed(Value: UnicodeString);
    procedure Set_VDed(Value: UnicodeString);
  end;

{ TXMLTNFe_infNFe_cana_deducList }

  TXMLTNFe_infNFe_cana_deducList = class(TXMLNodeCollection, IXMLTNFe_infNFe_cana_deducList)
  protected
    { IXMLTNFe_infNFe_cana_deducList }
    function Add: IXMLTNFe_infNFe_cana_deduc;
    function Insert(const Index: Integer): IXMLTNFe_infNFe_cana_deduc;

    function Get_Item(Index: Integer): IXMLTNFe_infNFe_cana_deduc;
  end;

{ TXMLTNFe_infNFeSupl }

  TXMLTNFe_infNFeSupl = class(TXMLNode, IXMLTNFe_infNFeSupl)
  protected
    { IXMLTNFe_infNFeSupl }
    function Get_QrCode: UnicodeString;
    function Get_UrlChave: UnicodeString;
    procedure Set_QrCode(Value: UnicodeString);
    procedure Set_UrlChave(Value: UnicodeString);
  end;

{ TXMLSignatureType_ds }

  TXMLSignatureType_ds = class(TXMLNode, IXMLSignatureType_ds)
  protected
    { IXMLSignatureType_ds }
    function Get_Id: UnicodeString;
    function Get_SignedInfo: IXMLSignedInfoType_ds;
    function Get_SignatureValue: IXMLSignatureValueType_ds;
    function Get_KeyInfo: IXMLKeyInfoType_ds;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSignedInfoType_ds }

  TXMLSignedInfoType_ds = class(TXMLNode, IXMLSignedInfoType_ds)
  protected
    { IXMLSignedInfoType_ds }
    function Get_Id: UnicodeString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethod_ds;
    function Get_SignatureMethod: IXMLSignatureMethod_ds;
    function Get_Reference: IXMLReferenceType_ds;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCanonicalizationMethod_ds }

  TXMLCanonicalizationMethod_ds = class(TXMLNode, IXMLCanonicalizationMethod_ds)
  protected
    { IXMLCanonicalizationMethod_ds }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
  end;

{ TXMLSignatureMethod_ds }

  TXMLSignatureMethod_ds = class(TXMLNode, IXMLSignatureMethod_ds)
  protected
    { IXMLSignatureMethod_ds }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
  end;

{ TXMLReferenceType_ds }

  TXMLReferenceType_ds = class(TXMLNode, IXMLReferenceType_ds)
  protected
    { IXMLReferenceType_ds }
    function Get_Id: UnicodeString;
    function Get_URI: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Transforms: IXMLTransformsType_ds;
    function Get_DigestMethod: IXMLDigestMethod_ds;
    function Get_DigestValue: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_URI(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_DigestValue(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformsType_ds }

  TXMLTransformsType_ds = class(TXMLNodeCollection, IXMLTransformsType_ds)
  protected
    { IXMLTransformsType_ds }
    function Get_Transform(Index: Integer): IXMLTransformType_ds;
    function Add: IXMLTransformType_ds;
    function Insert(const Index: Integer): IXMLTransformType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformType_ds }

  TXMLTransformType_ds = class(TXMLNodeCollection, IXMLTransformType_ds)
  protected
    { IXMLTransformType_ds }
    function Get_Algorithm: UnicodeString;
    function Get_XPath(Index: Integer): UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    function Add(const XPath: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const XPath: UnicodeString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDigestMethod_ds }

  TXMLDigestMethod_ds = class(TXMLNode, IXMLDigestMethod_ds)
  protected
    { IXMLDigestMethod_ds }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
  end;

{ TXMLSignatureValueType_ds }

  TXMLSignatureValueType_ds = class(TXMLNode, IXMLSignatureValueType_ds)
  protected
    { IXMLSignatureValueType_ds }
    function Get_Id: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
  end;

{ TXMLKeyInfoType_ds }

  TXMLKeyInfoType_ds = class(TXMLNode, IXMLKeyInfoType_ds)
  protected
    { IXMLKeyInfoType_ds }
    function Get_Id: UnicodeString;
    function Get_X509Data: IXMLX509DataType_ds;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLX509DataType_ds }

  TXMLX509DataType_ds = class(TXMLNode, IXMLX509DataType_ds)
  protected
    { IXMLX509DataType_ds }
    function Get_X509Certificate: UnicodeString;
    procedure Set_X509Certificate(Value: UnicodeString);
  end;

{ TXMLTProtNFe }

  TXMLTProtNFe = class(TXMLNode, IXMLTProtNFe)
  protected
    { IXMLTProtNFe }
    function Get_Versao: UnicodeString;
    function Get_InfProt: IXMLTProtNFe_infProt;
    function Get_Signature: IXMLSignatureType_ds;
    procedure Set_Versao(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTProtNFeList }

  TXMLTProtNFeList = class(TXMLNodeCollection, IXMLTProtNFeList)
  protected
    { IXMLTProtNFeList }
    function Add: IXMLTProtNFe;
    function Insert(const Index: Integer): IXMLTProtNFe;

    function Get_Item(Index: Integer): IXMLTProtNFe;
  end;

{ TXMLTProtNFe_infProt }

  TXMLTProtNFe_infProt = class(TXMLNode, IXMLTProtNFe_infProt)
  protected
    { IXMLTProtNFe_infProt }
    function Get_Id: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_VerAplic: UnicodeString;
    function Get_ChNFe: UnicodeString;
    function Get_DhRecbto: UnicodeString;
    function Get_NProt: UnicodeString;
    function Get_DigVal: UnicodeString;
    function Get_CStat: UnicodeString;
    function Get_XMotivo: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_VerAplic(Value: UnicodeString);
    procedure Set_ChNFe(Value: UnicodeString);
    procedure Set_DhRecbto(Value: UnicodeString);
    procedure Set_NProt(Value: UnicodeString);
    procedure Set_DigVal(Value: UnicodeString);
    procedure Set_CStat(Value: UnicodeString);
    procedure Set_XMotivo(Value: UnicodeString);
  end;

{ TXMLTEnviNFe }

  TXMLTEnviNFe = class(TXMLNode, IXMLTEnviNFe)
  private
    FNFe: IXMLTNFeList;
  protected
    { IXMLTEnviNFe }
    function Get_Versao: UnicodeString;
    function Get_IdLote: UnicodeString;
    function Get_IndSinc: UnicodeString;
    function Get_NFe: IXMLTNFeList;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_IdLote(Value: UnicodeString);
    procedure Set_IndSinc(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTRetEnviNFe }

  TXMLTRetEnviNFe = class(TXMLNode, IXMLTRetEnviNFe)
  protected
    { IXMLTRetEnviNFe }
    function Get_Versao: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_VerAplic: UnicodeString;
    function Get_CStat: UnicodeString;
    function Get_XMotivo: UnicodeString;
    function Get_CUF: UnicodeString;
    function Get_DhRecbto: UnicodeString;
    function Get_InfRec: IXMLTRetEnviNFe_infRec;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_VerAplic(Value: UnicodeString);
    procedure Set_CStat(Value: UnicodeString);
    procedure Set_XMotivo(Value: UnicodeString);
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_DhRecbto(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTRetEnviNFe_infRec }

  TXMLTRetEnviNFe_infRec = class(TXMLNode, IXMLTRetEnviNFe_infRec)
  protected
    { IXMLTRetEnviNFe_infRec }
    function Get_NRec: UnicodeString;
    function Get_TMed: UnicodeString;
    procedure Set_NRec(Value: UnicodeString);
    procedure Set_TMed(Value: UnicodeString);
  end;

{ TXMLTConsReciNFe }

  TXMLTConsReciNFe = class(TXMLNode, IXMLTConsReciNFe)
  protected
    { IXMLTConsReciNFe }
    function Get_Versao: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_NRec: UnicodeString;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_NRec(Value: UnicodeString);
  end;

{ TXMLTRetConsReciNFe }

  TXMLTRetConsReciNFe = class(TXMLNode, IXMLTRetConsReciNFe)
  private
    FProtNFe: IXMLTProtNFeList;
  protected
    { IXMLTRetConsReciNFe }
    function Get_Versao: UnicodeString;
    function Get_TpAmb: UnicodeString;
    function Get_VerAplic: UnicodeString;
    function Get_NRec: UnicodeString;
    function Get_CStat: UnicodeString;
    function Get_XMotivo: UnicodeString;
    function Get_CUF: UnicodeString;
    function Get_DhRecbto: UnicodeString;
    function Get_CMsg: UnicodeString;
    function Get_XMsg: UnicodeString;
    function Get_ProtNFe: IXMLTProtNFeList;
    procedure Set_Versao(Value: UnicodeString);
    procedure Set_TpAmb(Value: UnicodeString);
    procedure Set_VerAplic(Value: UnicodeString);
    procedure Set_NRec(Value: UnicodeString);
    procedure Set_CStat(Value: UnicodeString);
    procedure Set_XMotivo(Value: UnicodeString);
    procedure Set_CUF(Value: UnicodeString);
    procedure Set_DhRecbto(Value: UnicodeString);
    procedure Set_CMsg(Value: UnicodeString);
    procedure Set_XMsg(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNfeProc }

  TXMLTNfeProc = class(TXMLNode, IXMLTNfeProc)
  protected
    { IXMLTNfeProc }
    function Get_Versao: UnicodeString;
    function Get_NFe: IXMLTNFe;
    function Get_ProtNFe: IXMLTProtNFe;
    procedure Set_Versao(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTNFe_infNFe_det_prod_NVEList }

  TXMLTNFe_infNFe_det_prod_NVEList = class(TXMLNodeCollection, IXMLTNFe_infNFe_det_prod_NVEList)
  protected
    { IXMLTNFe_infNFe_det_prod_NVEList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

implementation

{ TXMLTNFe }

procedure TXMLTNFe.AfterConstruction;
begin
  RegisterChildNode('infNFe', TXMLTNFe_infNFe);
  RegisterChildNode('infNFeSupl', TXMLTNFe_infNFeSupl);
  RegisterChildNode('Signature', TXMLSignatureType_ds);
  inherited;
end;

function TXMLTNFe.Get_InfNFe: IXMLTNFe_infNFe;
begin
  Result := ChildNodes['infNFe'] as IXMLTNFe_infNFe;
end;

function TXMLTNFe.Get_InfNFeSupl: IXMLTNFe_infNFeSupl;
begin
  Result := ChildNodes['infNFeSupl'] as IXMLTNFe_infNFeSupl;
end;

function TXMLTNFe.Get_Signature: IXMLSignatureType_ds;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType_ds;
end;

{ TXMLTNFeList }

function TXMLTNFeList.Add: IXMLTNFe;
begin
  Result := AddItem(-1) as IXMLTNFe;
end;

function TXMLTNFeList.Insert(const Index: Integer): IXMLTNFe;
begin
  Result := AddItem(Index) as IXMLTNFe;
end;

function TXMLTNFeList.Get_Item(Index: Integer): IXMLTNFe;
begin
  Result := List[Index] as IXMLTNFe;
end;

{ TXMLTNFe_infNFe }

procedure TXMLTNFe_infNFe.AfterConstruction;
begin
  RegisterChildNode('ide', TXMLTNFe_infNFe_ide);
  RegisterChildNode('emit', TXMLTNFe_infNFe_emit);
  RegisterChildNode('avulsa', TXMLTNFe_infNFe_avulsa);
  RegisterChildNode('dest', TXMLTNFe_infNFe_dest);
  RegisterChildNode('retirada', TXMLTLocal);
  RegisterChildNode('entrega', TXMLTLocal);
  RegisterChildNode('autXML', TXMLTNFe_infNFe_autXML);
  RegisterChildNode('det', TXMLTNFe_infNFe_det);
  RegisterChildNode('total', TXMLTNFe_infNFe_total);
  RegisterChildNode('transp', TXMLTNFe_infNFe_transp);
  RegisterChildNode('cobr', TXMLTNFe_infNFe_cobr);
  RegisterChildNode('pag', TXMLTNFe_infNFe_pag);
  RegisterChildNode('infAdic', TXMLTNFe_infNFe_infAdic);
  RegisterChildNode('exporta', TXMLTNFe_infNFe_exporta);
  RegisterChildNode('compra', TXMLTNFe_infNFe_compra);
  RegisterChildNode('cana', TXMLTNFe_infNFe_cana);
  FAutXML := CreateCollection(TXMLTNFe_infNFe_autXMLList, IXMLTNFe_infNFe_autXML, 'autXML') as IXMLTNFe_infNFe_autXMLList;
  FDet := CreateCollection(TXMLTNFe_infNFe_detList, IXMLTNFe_infNFe_det, 'det') as IXMLTNFe_infNFe_detList;
  inherited;
end;

function TXMLTNFe_infNFe.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTNFe_infNFe.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTNFe_infNFe.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLTNFe_infNFe.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLTNFe_infNFe.Get_Ide: IXMLTNFe_infNFe_ide;
begin
  Result := ChildNodes['ide'] as IXMLTNFe_infNFe_ide;
end;

function TXMLTNFe_infNFe.Get_Emit: IXMLTNFe_infNFe_emit;
begin
  Result := ChildNodes['emit'] as IXMLTNFe_infNFe_emit;
end;

function TXMLTNFe_infNFe.Get_Avulsa: IXMLTNFe_infNFe_avulsa;
begin
  Result := ChildNodes['avulsa'] as IXMLTNFe_infNFe_avulsa;
end;

function TXMLTNFe_infNFe.Get_Dest: IXMLTNFe_infNFe_dest;
begin
  Result := ChildNodes['dest'] as IXMLTNFe_infNFe_dest;
end;

function TXMLTNFe_infNFe.Get_Retirada: IXMLTLocal;
begin
  Result := ChildNodes['retirada'] as IXMLTLocal;
end;

function TXMLTNFe_infNFe.Get_Entrega: IXMLTLocal;
begin
  Result := ChildNodes['entrega'] as IXMLTLocal;
end;

function TXMLTNFe_infNFe.Get_AutXML: IXMLTNFe_infNFe_autXMLList;
begin
  Result := FAutXML;
end;

function TXMLTNFe_infNFe.Get_Det: IXMLTNFe_infNFe_detList;
begin
  Result := FDet;
end;

function TXMLTNFe_infNFe.Get_Total: IXMLTNFe_infNFe_total;
begin
  Result := ChildNodes['total'] as IXMLTNFe_infNFe_total;
end;

function TXMLTNFe_infNFe.Get_Transp: IXMLTNFe_infNFe_transp;
begin
  Result := ChildNodes['transp'] as IXMLTNFe_infNFe_transp;
end;

function TXMLTNFe_infNFe.Get_Cobr: IXMLTNFe_infNFe_cobr;
begin
  Result := ChildNodes['cobr'] as IXMLTNFe_infNFe_cobr;
end;

function TXMLTNFe_infNFe.Get_Pag: IXMLTNFe_infNFe_pag;
begin
  Result := ChildNodes['pag'] as IXMLTNFe_infNFe_pag;
end;

function TXMLTNFe_infNFe.Get_InfAdic: IXMLTNFe_infNFe_infAdic;
begin
  Result := ChildNodes['infAdic'] as IXMLTNFe_infNFe_infAdic;
end;

function TXMLTNFe_infNFe.Get_Exporta: IXMLTNFe_infNFe_exporta;
begin
  Result := ChildNodes['exporta'] as IXMLTNFe_infNFe_exporta;
end;

function TXMLTNFe_infNFe.Get_Compra: IXMLTNFe_infNFe_compra;
begin
  Result := ChildNodes['compra'] as IXMLTNFe_infNFe_compra;
end;

function TXMLTNFe_infNFe.Get_Cana: IXMLTNFe_infNFe_cana;
begin
  Result := ChildNodes['cana'] as IXMLTNFe_infNFe_cana;
end;

{ TXMLTNFe_infNFe_ide }

procedure TXMLTNFe_infNFe_ide.AfterConstruction;
begin
  RegisterChildNode('NFref', TXMLTNFe_infNFe_ide_NFref);
  FNFref := CreateCollection(TXMLTNFe_infNFe_ide_NFrefList, IXMLTNFe_infNFe_ide_NFref, 'NFref') as IXMLTNFe_infNFe_ide_NFrefList;
  inherited;
end;

function TXMLTNFe_infNFe_ide.Get_CUF: UnicodeString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_CUF(Value: UnicodeString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_CNF: UnicodeString;
begin
  Result := ChildNodes['cNF'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_CNF(Value: UnicodeString);
begin
  ChildNodes['cNF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_NatOp: UnicodeString;
begin
  Result := ChildNodes['natOp'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_NatOp(Value: UnicodeString);
begin
  ChildNodes['natOp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_Mod_: UnicodeString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_Mod_(Value: UnicodeString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_Serie: UnicodeString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_Serie(Value: UnicodeString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_NNF: UnicodeString;
begin
  Result := ChildNodes['nNF'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_NNF(Value: UnicodeString);
begin
  ChildNodes['nNF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_DhEmi: UnicodeString;
begin
  Result := ChildNodes['dhEmi'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_DhEmi(Value: UnicodeString);
begin
  ChildNodes['dhEmi'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_DhSaiEnt: UnicodeString;
begin
  Result := ChildNodes['dhSaiEnt'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_DhSaiEnt(Value: UnicodeString);
begin
  ChildNodes['dhSaiEnt'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_TpNF: UnicodeString;
begin
  Result := ChildNodes['tpNF'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_TpNF(Value: UnicodeString);
begin
  ChildNodes['tpNF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_IdDest: UnicodeString;
begin
  Result := ChildNodes['idDest'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_IdDest(Value: UnicodeString);
begin
  ChildNodes['idDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_CMunFG: UnicodeString;
begin
  Result := ChildNodes['cMunFG'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_CMunFG(Value: UnicodeString);
begin
  ChildNodes['cMunFG'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_TpImp: UnicodeString;
begin
  Result := ChildNodes['tpImp'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_TpImp(Value: UnicodeString);
begin
  ChildNodes['tpImp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_TpEmis: UnicodeString;
begin
  Result := ChildNodes['tpEmis'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_TpEmis(Value: UnicodeString);
begin
  ChildNodes['tpEmis'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_CDV: UnicodeString;
begin
  Result := ChildNodes['cDV'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_CDV(Value: UnicodeString);
begin
  ChildNodes['cDV'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_TpAmb: UnicodeString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_TpAmb(Value: UnicodeString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_FinNFe: UnicodeString;
begin
  Result := ChildNodes['finNFe'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_FinNFe(Value: UnicodeString);
begin
  ChildNodes['finNFe'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_IndFinal: UnicodeString;
begin
  Result := ChildNodes['indFinal'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_IndFinal(Value: UnicodeString);
begin
  ChildNodes['indFinal'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_IndPres: UnicodeString;
begin
  Result := ChildNodes['indPres'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_IndPres(Value: UnicodeString);
begin
  ChildNodes['indPres'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_ProcEmi: UnicodeString;
begin
  Result := ChildNodes['procEmi'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_ProcEmi(Value: UnicodeString);
begin
  ChildNodes['procEmi'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_VerProc: UnicodeString;
begin
  Result := ChildNodes['verProc'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_VerProc(Value: UnicodeString);
begin
  ChildNodes['verProc'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_DhCont: UnicodeString;
begin
  Result := ChildNodes['dhCont'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_DhCont(Value: UnicodeString);
begin
  ChildNodes['dhCont'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_XJust: UnicodeString;
begin
  Result := ChildNodes['xJust'].Text;
end;

procedure TXMLTNFe_infNFe_ide.Set_XJust(Value: UnicodeString);
begin
  ChildNodes['xJust'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide.Get_NFref: IXMLTNFe_infNFe_ide_NFrefList;
begin
  Result := FNFref;
end;

{ TXMLTNFe_infNFe_ide_NFref }

procedure TXMLTNFe_infNFe_ide_NFref.AfterConstruction;
begin
  RegisterChildNode('refNF', TXMLTNFe_infNFe_ide_NFref_refNF);
  RegisterChildNode('refNFP', TXMLTNFe_infNFe_ide_NFref_refNFP);
  RegisterChildNode('refECF', TXMLTNFe_infNFe_ide_NFref_refECF);
  inherited;
end;

function TXMLTNFe_infNFe_ide_NFref.Get_RefNFe: UnicodeString;
begin
  Result := ChildNodes['refNFe'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref.Set_RefNFe(Value: UnicodeString);
begin
  ChildNodes['refNFe'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref.Get_RefNF: IXMLTNFe_infNFe_ide_NFref_refNF;
begin
  Result := ChildNodes['refNF'] as IXMLTNFe_infNFe_ide_NFref_refNF;
end;

function TXMLTNFe_infNFe_ide_NFref.Get_RefNFP: IXMLTNFe_infNFe_ide_NFref_refNFP;
begin
  Result := ChildNodes['refNFP'] as IXMLTNFe_infNFe_ide_NFref_refNFP;
end;

function TXMLTNFe_infNFe_ide_NFref.Get_RefCTe: UnicodeString;
begin
  Result := ChildNodes['refCTe'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref.Set_RefCTe(Value: UnicodeString);
begin
  ChildNodes['refCTe'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref.Get_RefECF: IXMLTNFe_infNFe_ide_NFref_refECF;
begin
  Result := ChildNodes['refECF'] as IXMLTNFe_infNFe_ide_NFref_refECF;
end;

{ TXMLTNFe_infNFe_ide_NFrefList }

function TXMLTNFe_infNFe_ide_NFrefList.Add: IXMLTNFe_infNFe_ide_NFref;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_ide_NFref;
end;

function TXMLTNFe_infNFe_ide_NFrefList.Insert(const Index: Integer): IXMLTNFe_infNFe_ide_NFref;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_ide_NFref;
end;

function TXMLTNFe_infNFe_ide_NFrefList.Get_Item(Index: Integer): IXMLTNFe_infNFe_ide_NFref;
begin
  Result := List[Index] as IXMLTNFe_infNFe_ide_NFref;
end;

{ TXMLTNFe_infNFe_ide_NFref_refNF }

function TXMLTNFe_infNFe_ide_NFref_refNF.Get_CUF: UnicodeString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNF.Set_CUF(Value: UnicodeString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNF.Get_AAMM: UnicodeString;
begin
  Result := ChildNodes['AAMM'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNF.Set_AAMM(Value: UnicodeString);
begin
  ChildNodes['AAMM'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNF.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNF.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNF.Get_Mod_: UnicodeString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNF.Set_Mod_(Value: UnicodeString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNF.Get_Serie: UnicodeString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNF.Set_Serie(Value: UnicodeString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNF.Get_NNF: UnicodeString;
begin
  Result := ChildNodes['nNF'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNF.Set_NNF(Value: UnicodeString);
begin
  ChildNodes['nNF'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_ide_NFref_refNFP }

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_CUF: UnicodeString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_CUF(Value: UnicodeString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_AAMM: UnicodeString;
begin
  Result := ChildNodes['AAMM'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_AAMM(Value: UnicodeString);
begin
  ChildNodes['AAMM'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_IE: UnicodeString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_IE(Value: UnicodeString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_Mod_: UnicodeString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_Mod_(Value: UnicodeString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_Serie: UnicodeString;
begin
  Result := ChildNodes['serie'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_Serie(Value: UnicodeString);
begin
  ChildNodes['serie'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refNFP.Get_NNF: UnicodeString;
begin
  Result := ChildNodes['nNF'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refNFP.Set_NNF(Value: UnicodeString);
begin
  ChildNodes['nNF'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_ide_NFref_refECF }

function TXMLTNFe_infNFe_ide_NFref_refECF.Get_Mod_: UnicodeString;
begin
  Result := ChildNodes['mod'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refECF.Set_Mod_(Value: UnicodeString);
begin
  ChildNodes['mod'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refECF.Get_NECF: UnicodeString;
begin
  Result := ChildNodes['nECF'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refECF.Set_NECF(Value: UnicodeString);
begin
  ChildNodes['nECF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_ide_NFref_refECF.Get_NCOO: UnicodeString;
begin
  Result := ChildNodes['nCOO'].Text;
end;

procedure TXMLTNFe_infNFe_ide_NFref_refECF.Set_NCOO(Value: UnicodeString);
begin
  ChildNodes['nCOO'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_emit }

procedure TXMLTNFe_infNFe_emit.AfterConstruction;
begin
  RegisterChildNode('enderEmit', TXMLTEnderEmi);
  inherited;
end;

function TXMLTNFe_infNFe_emit.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_XNome: UnicodeString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_XNome(Value: UnicodeString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_XFant: UnicodeString;
begin
  Result := ChildNodes['xFant'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_XFant(Value: UnicodeString);
begin
  ChildNodes['xFant'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_EnderEmit: IXMLTEnderEmi;
begin
  Result := ChildNodes['enderEmit'] as IXMLTEnderEmi;
end;

function TXMLTNFe_infNFe_emit.Get_IE: UnicodeString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_IE(Value: UnicodeString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_IEST: UnicodeString;
begin
  Result := ChildNodes['IEST'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_IEST(Value: UnicodeString);
begin
  ChildNodes['IEST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_IM: UnicodeString;
begin
  Result := ChildNodes['IM'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_IM(Value: UnicodeString);
begin
  ChildNodes['IM'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_CNAE: UnicodeString;
begin
  Result := ChildNodes['CNAE'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_CNAE(Value: UnicodeString);
begin
  ChildNodes['CNAE'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_emit.Get_CRT: UnicodeString;
begin
  Result := ChildNodes['CRT'].Text;
end;

procedure TXMLTNFe_infNFe_emit.Set_CRT(Value: UnicodeString);
begin
  ChildNodes['CRT'].NodeValue := Value;
end;

{ TXMLTEnderEmi }

function TXMLTEnderEmi.Get_XLgr: UnicodeString;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTEnderEmi.Set_XLgr(Value: UnicodeString);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_Nro: UnicodeString;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTEnderEmi.Set_Nro(Value: UnicodeString);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XCpl: UnicodeString;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTEnderEmi.Set_XCpl(Value: UnicodeString);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XBairro: UnicodeString;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTEnderEmi.Set_XBairro(Value: UnicodeString);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_CMun: UnicodeString;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTEnderEmi.Set_CMun(Value: UnicodeString);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XMun: UnicodeString;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTEnderEmi.Set_XMun(Value: UnicodeString);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_UF: UnicodeString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTEnderEmi.Set_UF(Value: UnicodeString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_CEP: UnicodeString;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTEnderEmi.Set_CEP(Value: UnicodeString);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_CPais: UnicodeString;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTEnderEmi.Set_CPais(Value: UnicodeString);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_XPais: UnicodeString;
begin
  Result := ChildNodes['xPais'].Text;
end;

procedure TXMLTEnderEmi.Set_XPais(Value: UnicodeString);
begin
  ChildNodes['xPais'].NodeValue := Value;
end;

function TXMLTEnderEmi.Get_Fone: UnicodeString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTEnderEmi.Set_Fone(Value: UnicodeString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_avulsa }

function TXMLTNFe_infNFe_avulsa.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_XOrgao: UnicodeString;
begin
  Result := ChildNodes['xOrgao'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_XOrgao(Value: UnicodeString);
begin
  ChildNodes['xOrgao'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_Matr: UnicodeString;
begin
  Result := ChildNodes['matr'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_Matr(Value: UnicodeString);
begin
  ChildNodes['matr'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_XAgente: UnicodeString;
begin
  Result := ChildNodes['xAgente'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_XAgente(Value: UnicodeString);
begin
  ChildNodes['xAgente'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_Fone: UnicodeString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_Fone(Value: UnicodeString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_UF: UnicodeString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_UF(Value: UnicodeString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_NDAR: UnicodeString;
begin
  Result := ChildNodes['nDAR'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_NDAR(Value: UnicodeString);
begin
  ChildNodes['nDAR'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_DEmi: UnicodeString;
begin
  Result := ChildNodes['dEmi'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_DEmi(Value: UnicodeString);
begin
  ChildNodes['dEmi'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_VDAR: UnicodeString;
begin
  Result := ChildNodes['vDAR'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_VDAR(Value: UnicodeString);
begin
  ChildNodes['vDAR'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_RepEmi: UnicodeString;
begin
  Result := ChildNodes['repEmi'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_RepEmi(Value: UnicodeString);
begin
  ChildNodes['repEmi'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_avulsa.Get_DPag: UnicodeString;
begin
  Result := ChildNodes['dPag'].Text;
end;

procedure TXMLTNFe_infNFe_avulsa.Set_DPag(Value: UnicodeString);
begin
  ChildNodes['dPag'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_dest }

procedure TXMLTNFe_infNFe_dest.AfterConstruction;
begin
  RegisterChildNode('enderDest', TXMLTEndereco);
  inherited;
end;

function TXMLTNFe_infNFe_dest.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_IdEstrangeiro: UnicodeString;
begin
  Result := ChildNodes['idEstrangeiro'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_IdEstrangeiro(Value: UnicodeString);
begin
  ChildNodes['idEstrangeiro'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_XNome: UnicodeString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_XNome(Value: UnicodeString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_EnderDest: IXMLTEndereco;
begin
  Result := ChildNodes['enderDest'] as IXMLTEndereco;
end;

function TXMLTNFe_infNFe_dest.Get_IndIEDest: UnicodeString;
begin
  Result := ChildNodes['indIEDest'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_IndIEDest(Value: UnicodeString);
begin
  ChildNodes['indIEDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_IE: UnicodeString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_IE(Value: UnicodeString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_ISUF: UnicodeString;
begin
  Result := ChildNodes['ISUF'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_ISUF(Value: UnicodeString);
begin
  ChildNodes['ISUF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_IM: UnicodeString;
begin
  Result := ChildNodes['IM'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_IM(Value: UnicodeString);
begin
  ChildNodes['IM'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_dest.Get_Email: UnicodeString;
begin
  Result := ChildNodes['email'].Text;
end;

procedure TXMLTNFe_infNFe_dest.Set_Email(Value: UnicodeString);
begin
  ChildNodes['email'].NodeValue := Value;
end;

{ TXMLTEndereco }

function TXMLTEndereco.Get_XLgr: UnicodeString;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTEndereco.Set_XLgr(Value: UnicodeString);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTEndereco.Get_Nro: UnicodeString;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTEndereco.Set_Nro(Value: UnicodeString);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XCpl: UnicodeString;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTEndereco.Set_XCpl(Value: UnicodeString);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XBairro: UnicodeString;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTEndereco.Set_XBairro(Value: UnicodeString);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CMun: UnicodeString;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTEndereco.Set_CMun(Value: UnicodeString);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XMun: UnicodeString;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTEndereco.Set_XMun(Value: UnicodeString);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTEndereco.Get_UF: UnicodeString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTEndereco.Set_UF(Value: UnicodeString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CEP: UnicodeString;
begin
  Result := ChildNodes['CEP'].Text;
end;

procedure TXMLTEndereco.Set_CEP(Value: UnicodeString);
begin
  ChildNodes['CEP'].NodeValue := Value;
end;

function TXMLTEndereco.Get_CPais: UnicodeString;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTEndereco.Set_CPais(Value: UnicodeString);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTEndereco.Get_XPais: UnicodeString;
begin
  Result := ChildNodes['xPais'].Text;
end;

procedure TXMLTEndereco.Set_XPais(Value: UnicodeString);
begin
  ChildNodes['xPais'].NodeValue := Value;
end;

function TXMLTEndereco.Get_Fone: UnicodeString;
begin
  Result := ChildNodes['fone'].Text;
end;

procedure TXMLTEndereco.Set_Fone(Value: UnicodeString);
begin
  ChildNodes['fone'].NodeValue := Value;
end;

{ TXMLTLocal }

function TXMLTLocal.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTLocal.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTLocal.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTLocal.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTLocal.Get_XLgr: UnicodeString;
begin
  Result := ChildNodes['xLgr'].Text;
end;

procedure TXMLTLocal.Set_XLgr(Value: UnicodeString);
begin
  ChildNodes['xLgr'].NodeValue := Value;
end;

function TXMLTLocal.Get_Nro: UnicodeString;
begin
  Result := ChildNodes['nro'].Text;
end;

procedure TXMLTLocal.Set_Nro(Value: UnicodeString);
begin
  ChildNodes['nro'].NodeValue := Value;
end;

function TXMLTLocal.Get_XCpl: UnicodeString;
begin
  Result := ChildNodes['xCpl'].Text;
end;

procedure TXMLTLocal.Set_XCpl(Value: UnicodeString);
begin
  ChildNodes['xCpl'].NodeValue := Value;
end;

function TXMLTLocal.Get_XBairro: UnicodeString;
begin
  Result := ChildNodes['xBairro'].Text;
end;

procedure TXMLTLocal.Set_XBairro(Value: UnicodeString);
begin
  ChildNodes['xBairro'].NodeValue := Value;
end;

function TXMLTLocal.Get_CMun: UnicodeString;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTLocal.Set_CMun(Value: UnicodeString);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTLocal.Get_XMun: UnicodeString;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTLocal.Set_XMun(Value: UnicodeString);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTLocal.Get_UF: UnicodeString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTLocal.Set_UF(Value: UnicodeString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_autXML }

function TXMLTNFe_infNFe_autXML.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_autXML.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_autXML.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTNFe_infNFe_autXML.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_autXMLList }

function TXMLTNFe_infNFe_autXMLList.Add: IXMLTNFe_infNFe_autXML;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_autXML;
end;

function TXMLTNFe_infNFe_autXMLList.Insert(const Index: Integer): IXMLTNFe_infNFe_autXML;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_autXML;
end;

function TXMLTNFe_infNFe_autXMLList.Get_Item(Index: Integer): IXMLTNFe_infNFe_autXML;
begin
  Result := List[Index] as IXMLTNFe_infNFe_autXML;
end;

{ TXMLTNFe_infNFe_det }

procedure TXMLTNFe_infNFe_det.AfterConstruction;
begin
  RegisterChildNode('prod', TXMLTNFe_infNFe_det_prod);
  RegisterChildNode('imposto', TXMLTNFe_infNFe_det_imposto);
  RegisterChildNode('impostoDevol', TXMLTNFe_infNFe_det_impostoDevol);
  inherited;
end;

function TXMLTNFe_infNFe_det.Get_NItem: UnicodeString;
begin
  Result := AttributeNodes['nItem'].Text;
end;

procedure TXMLTNFe_infNFe_det.Set_NItem(Value: UnicodeString);
begin
  SetAttribute('nItem', Value);
end;

function TXMLTNFe_infNFe_det.Get_Prod: IXMLTNFe_infNFe_det_prod;
begin
  Result := ChildNodes['prod'] as IXMLTNFe_infNFe_det_prod;
end;

function TXMLTNFe_infNFe_det.Get_Imposto: IXMLTNFe_infNFe_det_imposto;
begin
  Result := ChildNodes['imposto'] as IXMLTNFe_infNFe_det_imposto;
end;

function TXMLTNFe_infNFe_det.Get_ImpostoDevol: IXMLTNFe_infNFe_det_impostoDevol;
begin
  Result := ChildNodes['impostoDevol'] as IXMLTNFe_infNFe_det_impostoDevol;
end;

function TXMLTNFe_infNFe_det.Get_InfAdProd: UnicodeString;
begin
  Result := ChildNodes['infAdProd'].Text;
end;

procedure TXMLTNFe_infNFe_det.Set_InfAdProd(Value: UnicodeString);
begin
  ChildNodes['infAdProd'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_detList }

function TXMLTNFe_infNFe_detList.Add: IXMLTNFe_infNFe_det;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_det;
end;

function TXMLTNFe_infNFe_detList.Insert(const Index: Integer): IXMLTNFe_infNFe_det;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_det;
end;

function TXMLTNFe_infNFe_detList.Get_Item(Index: Integer): IXMLTNFe_infNFe_det;
begin
  Result := List[Index] as IXMLTNFe_infNFe_det;
end;

{ TXMLTNFe_infNFe_det_prod }

procedure TXMLTNFe_infNFe_det_prod.AfterConstruction;
begin
  RegisterChildNode('DI', TXMLTNFe_infNFe_det_prod_DI);
  RegisterChildNode('detExport', TXMLTNFe_infNFe_det_prod_detExport);
  RegisterChildNode('rastro', TXMLTNFe_infNFe_det_prod_rastro);
  RegisterChildNode('veicProd', TXMLTNFe_infNFe_det_prod_veicProd);
  RegisterChildNode('med', TXMLTNFe_infNFe_det_prod_med);
  RegisterChildNode('arma', TXMLTNFe_infNFe_det_prod_arma);
  RegisterChildNode('comb', TXMLTNFe_infNFe_det_prod_comb);
  FNVE := CreateCollection(TXMLTNFe_infNFe_det_prod_NVEList, IXMLNode, 'NVE') as IXMLTNFe_infNFe_det_prod_NVEList;
  FDI := CreateCollection(TXMLTNFe_infNFe_det_prod_DIList, IXMLTNFe_infNFe_det_prod_DI, 'DI') as IXMLTNFe_infNFe_det_prod_DIList;
  FDetExport := CreateCollection(TXMLTNFe_infNFe_det_prod_detExportList, IXMLTNFe_infNFe_det_prod_detExport, 'detExport') as IXMLTNFe_infNFe_det_prod_detExportList;
  FRastro := CreateCollection(TXMLTNFe_infNFe_det_prod_rastroList, IXMLTNFe_infNFe_det_prod_rastro, 'rastro') as IXMLTNFe_infNFe_det_prod_rastroList;
  FArma := CreateCollection(TXMLTNFe_infNFe_det_prod_armaList, IXMLTNFe_infNFe_det_prod_arma, 'arma') as IXMLTNFe_infNFe_det_prod_armaList;
  inherited;
end;

function TXMLTNFe_infNFe_det_prod.Get_CProd: UnicodeString;
begin
  Result := ChildNodes['cProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CProd(Value: UnicodeString);
begin
  ChildNodes['cProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_CEAN: UnicodeString;
begin
  Result := ChildNodes['cEAN'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CEAN(Value: UnicodeString);
begin
  ChildNodes['cEAN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_XProd: UnicodeString;
begin
  Result := ChildNodes['xProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_XProd(Value: UnicodeString);
begin
  ChildNodes['xProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_NCM: UnicodeString;
begin
  Result := ChildNodes['NCM'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_NCM(Value: UnicodeString);
begin
  ChildNodes['NCM'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_NVE: IXMLTNFe_infNFe_det_prod_NVEList;
begin
  Result := FNVE;
end;

function TXMLTNFe_infNFe_det_prod.Get_CEST: UnicodeString;
begin
  Result := ChildNodes['CEST'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CEST(Value: UnicodeString);
begin
  ChildNodes['CEST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_IndEscala: UnicodeString;
begin
  Result := ChildNodes['indEscala'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_IndEscala(Value: UnicodeString);
begin
  ChildNodes['indEscala'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_CNPJFab: UnicodeString;
begin
  Result := ChildNodes['CNPJFab'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CNPJFab(Value: UnicodeString);
begin
  ChildNodes['CNPJFab'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_CBenef: UnicodeString;
begin
  Result := ChildNodes['cBenef'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CBenef(Value: UnicodeString);
begin
  ChildNodes['cBenef'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_EXTIPI: UnicodeString;
begin
  Result := ChildNodes['EXTIPI'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_EXTIPI(Value: UnicodeString);
begin
  ChildNodes['EXTIPI'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_CFOP: UnicodeString;
begin
  Result := ChildNodes['CFOP'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CFOP(Value: UnicodeString);
begin
  ChildNodes['CFOP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_UCom: UnicodeString;
begin
  Result := ChildNodes['uCom'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_UCom(Value: UnicodeString);
begin
  ChildNodes['uCom'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_QCom: UnicodeString;
begin
  Result := ChildNodes['qCom'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_QCom(Value: UnicodeString);
begin
  ChildNodes['qCom'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VUnCom: UnicodeString;
begin
  Result := ChildNodes['vUnCom'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VUnCom(Value: UnicodeString);
begin
  ChildNodes['vUnCom'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VProd: UnicodeString;
begin
  Result := ChildNodes['vProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VProd(Value: UnicodeString);
begin
  ChildNodes['vProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_CEANTrib: UnicodeString;
begin
  Result := ChildNodes['cEANTrib'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_CEANTrib(Value: UnicodeString);
begin
  ChildNodes['cEANTrib'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_UTrib: UnicodeString;
begin
  Result := ChildNodes['uTrib'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_UTrib(Value: UnicodeString);
begin
  ChildNodes['uTrib'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_QTrib: UnicodeString;
begin
  Result := ChildNodes['qTrib'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_QTrib(Value: UnicodeString);
begin
  ChildNodes['qTrib'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VUnTrib: UnicodeString;
begin
  Result := ChildNodes['vUnTrib'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VUnTrib(Value: UnicodeString);
begin
  ChildNodes['vUnTrib'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VFrete: UnicodeString;
begin
  Result := ChildNodes['vFrete'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VFrete(Value: UnicodeString);
begin
  ChildNodes['vFrete'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VSeg: UnicodeString;
begin
  Result := ChildNodes['vSeg'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VSeg(Value: UnicodeString);
begin
  ChildNodes['vSeg'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VDesc: UnicodeString;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VDesc(Value: UnicodeString);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_VOutro: UnicodeString;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_VOutro(Value: UnicodeString);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_IndTot: UnicodeString;
begin
  Result := ChildNodes['indTot'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_IndTot(Value: UnicodeString);
begin
  ChildNodes['indTot'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_DI: IXMLTNFe_infNFe_det_prod_DIList;
begin
  Result := FDI;
end;

function TXMLTNFe_infNFe_det_prod.Get_DetExport: IXMLTNFe_infNFe_det_prod_detExportList;
begin
  Result := FDetExport;
end;

function TXMLTNFe_infNFe_det_prod.Get_XPed: UnicodeString;
begin
  Result := ChildNodes['xPed'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_XPed(Value: UnicodeString);
begin
  ChildNodes['xPed'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_NItemPed: UnicodeString;
begin
  Result := ChildNodes['nItemPed'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_NItemPed(Value: UnicodeString);
begin
  ChildNodes['nItemPed'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_NFCI: UnicodeString;
begin
  Result := ChildNodes['nFCI'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_NFCI(Value: UnicodeString);
begin
  ChildNodes['nFCI'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod.Get_Rastro: IXMLTNFe_infNFe_det_prod_rastroList;
begin
  Result := FRastro;
end;

function TXMLTNFe_infNFe_det_prod.Get_VeicProd: IXMLTNFe_infNFe_det_prod_veicProd;
begin
  Result := ChildNodes['veicProd'] as IXMLTNFe_infNFe_det_prod_veicProd;
end;

function TXMLTNFe_infNFe_det_prod.Get_Med: IXMLTNFe_infNFe_det_prod_med;
begin
  Result := ChildNodes['med'] as IXMLTNFe_infNFe_det_prod_med;
end;

function TXMLTNFe_infNFe_det_prod.Get_Arma: IXMLTNFe_infNFe_det_prod_armaList;
begin
  Result := FArma;
end;

function TXMLTNFe_infNFe_det_prod.Get_Comb: IXMLTNFe_infNFe_det_prod_comb;
begin
  Result := ChildNodes['comb'] as IXMLTNFe_infNFe_det_prod_comb;
end;

function TXMLTNFe_infNFe_det_prod.Get_NRECOPI: UnicodeString;
begin
  Result := ChildNodes['nRECOPI'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod.Set_NRECOPI(Value: UnicodeString);
begin
  ChildNodes['nRECOPI'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_DI }

procedure TXMLTNFe_infNFe_det_prod_DI.AfterConstruction;
begin
  RegisterChildNode('adi', TXMLTNFe_infNFe_det_prod_DI_adi);
  FAdi := CreateCollection(TXMLTNFe_infNFe_det_prod_DI_adiList, IXMLTNFe_infNFe_det_prod_DI_adi, 'adi') as IXMLTNFe_infNFe_det_prod_DI_adiList;
  inherited;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_NDI: UnicodeString;
begin
  Result := ChildNodes['nDI'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_NDI(Value: UnicodeString);
begin
  ChildNodes['nDI'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_DDI: UnicodeString;
begin
  Result := ChildNodes['dDI'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_DDI(Value: UnicodeString);
begin
  ChildNodes['dDI'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_XLocDesemb: UnicodeString;
begin
  Result := ChildNodes['xLocDesemb'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_XLocDesemb(Value: UnicodeString);
begin
  ChildNodes['xLocDesemb'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_UFDesemb: UnicodeString;
begin
  Result := ChildNodes['UFDesemb'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_UFDesemb(Value: UnicodeString);
begin
  ChildNodes['UFDesemb'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_DDesemb: UnicodeString;
begin
  Result := ChildNodes['dDesemb'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_DDesemb(Value: UnicodeString);
begin
  ChildNodes['dDesemb'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_TpViaTransp: UnicodeString;
begin
  Result := ChildNodes['tpViaTransp'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_TpViaTransp(Value: UnicodeString);
begin
  ChildNodes['tpViaTransp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_VAFRMM: UnicodeString;
begin
  Result := ChildNodes['vAFRMM'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_VAFRMM(Value: UnicodeString);
begin
  ChildNodes['vAFRMM'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_TpIntermedio: UnicodeString;
begin
  Result := ChildNodes['tpIntermedio'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_TpIntermedio(Value: UnicodeString);
begin
  ChildNodes['tpIntermedio'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_UFTerceiro: UnicodeString;
begin
  Result := ChildNodes['UFTerceiro'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_UFTerceiro(Value: UnicodeString);
begin
  ChildNodes['UFTerceiro'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_CExportador: UnicodeString;
begin
  Result := ChildNodes['cExportador'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI.Set_CExportador(Value: UnicodeString);
begin
  ChildNodes['cExportador'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI.Get_Adi: IXMLTNFe_infNFe_det_prod_DI_adiList;
begin
  Result := FAdi;
end;

{ TXMLTNFe_infNFe_det_prod_DIList }

function TXMLTNFe_infNFe_det_prod_DIList.Add: IXMLTNFe_infNFe_det_prod_DI;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_det_prod_DI;
end;

function TXMLTNFe_infNFe_det_prod_DIList.Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_DI;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_det_prod_DI;
end;

function TXMLTNFe_infNFe_det_prod_DIList.Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_DI;
begin
  Result := List[Index] as IXMLTNFe_infNFe_det_prod_DI;
end;

{ TXMLTNFe_infNFe_det_prod_DI_adi }

function TXMLTNFe_infNFe_det_prod_DI_adi.Get_NAdicao: UnicodeString;
begin
  Result := ChildNodes['nAdicao'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI_adi.Set_NAdicao(Value: UnicodeString);
begin
  ChildNodes['nAdicao'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI_adi.Get_NSeqAdic: UnicodeString;
begin
  Result := ChildNodes['nSeqAdic'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI_adi.Set_NSeqAdic(Value: UnicodeString);
begin
  ChildNodes['nSeqAdic'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI_adi.Get_CFabricante: UnicodeString;
begin
  Result := ChildNodes['cFabricante'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI_adi.Set_CFabricante(Value: UnicodeString);
begin
  ChildNodes['cFabricante'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI_adi.Get_VDescDI: UnicodeString;
begin
  Result := ChildNodes['vDescDI'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI_adi.Set_VDescDI(Value: UnicodeString);
begin
  ChildNodes['vDescDI'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_DI_adi.Get_NDraw: UnicodeString;
begin
  Result := ChildNodes['nDraw'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_DI_adi.Set_NDraw(Value: UnicodeString);
begin
  ChildNodes['nDraw'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_DI_adiList }

function TXMLTNFe_infNFe_det_prod_DI_adiList.Add: IXMLTNFe_infNFe_det_prod_DI_adi;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_det_prod_DI_adi;
end;

function TXMLTNFe_infNFe_det_prod_DI_adiList.Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_DI_adi;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_det_prod_DI_adi;
end;

function TXMLTNFe_infNFe_det_prod_DI_adiList.Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_DI_adi;
begin
  Result := List[Index] as IXMLTNFe_infNFe_det_prod_DI_adi;
end;

{ TXMLTNFe_infNFe_det_prod_detExport }

procedure TXMLTNFe_infNFe_det_prod_detExport.AfterConstruction;
begin
  RegisterChildNode('exportInd', TXMLTNFe_infNFe_det_prod_detExport_exportInd);
  inherited;
end;

function TXMLTNFe_infNFe_det_prod_detExport.Get_NDraw: UnicodeString;
begin
  Result := ChildNodes['nDraw'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_detExport.Set_NDraw(Value: UnicodeString);
begin
  ChildNodes['nDraw'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_detExport.Get_ExportInd: IXMLTNFe_infNFe_det_prod_detExport_exportInd;
begin
  Result := ChildNodes['exportInd'] as IXMLTNFe_infNFe_det_prod_detExport_exportInd;
end;

{ TXMLTNFe_infNFe_det_prod_detExportList }

function TXMLTNFe_infNFe_det_prod_detExportList.Add: IXMLTNFe_infNFe_det_prod_detExport;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_det_prod_detExport;
end;

function TXMLTNFe_infNFe_det_prod_detExportList.Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_detExport;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_det_prod_detExport;
end;

function TXMLTNFe_infNFe_det_prod_detExportList.Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_detExport;
begin
  Result := List[Index] as IXMLTNFe_infNFe_det_prod_detExport;
end;

{ TXMLTNFe_infNFe_det_prod_detExport_exportInd }

function TXMLTNFe_infNFe_det_prod_detExport_exportInd.Get_NRE: UnicodeString;
begin
  Result := ChildNodes['nRE'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_detExport_exportInd.Set_NRE(Value: UnicodeString);
begin
  ChildNodes['nRE'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_detExport_exportInd.Get_ChNFe: UnicodeString;
begin
  Result := ChildNodes['chNFe'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_detExport_exportInd.Set_ChNFe(Value: UnicodeString);
begin
  ChildNodes['chNFe'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_detExport_exportInd.Get_QExport: UnicodeString;
begin
  Result := ChildNodes['qExport'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_detExport_exportInd.Set_QExport(Value: UnicodeString);
begin
  ChildNodes['qExport'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_rastro }

function TXMLTNFe_infNFe_det_prod_rastro.Get_NLote: UnicodeString;
begin
  Result := ChildNodes['nLote'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_rastro.Set_NLote(Value: UnicodeString);
begin
  ChildNodes['nLote'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_rastro.Get_QLote: UnicodeString;
begin
  Result := ChildNodes['qLote'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_rastro.Set_QLote(Value: UnicodeString);
begin
  ChildNodes['qLote'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_rastro.Get_DFab: UnicodeString;
begin
  Result := ChildNodes['dFab'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_rastro.Set_DFab(Value: UnicodeString);
begin
  ChildNodes['dFab'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_rastro.Get_DVal: UnicodeString;
begin
  Result := ChildNodes['dVal'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_rastro.Set_DVal(Value: UnicodeString);
begin
  ChildNodes['dVal'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_rastro.Get_CAgreg: UnicodeString;
begin
  Result := ChildNodes['cAgreg'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_rastro.Set_CAgreg(Value: UnicodeString);
begin
  ChildNodes['cAgreg'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_rastroList }

function TXMLTNFe_infNFe_det_prod_rastroList.Add: IXMLTNFe_infNFe_det_prod_rastro;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_det_prod_rastro;
end;

function TXMLTNFe_infNFe_det_prod_rastroList.Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_rastro;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_det_prod_rastro;
end;

function TXMLTNFe_infNFe_det_prod_rastroList.Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_rastro;
begin
  Result := List[Index] as IXMLTNFe_infNFe_det_prod_rastro;
end;

{ TXMLTNFe_infNFe_det_prod_veicProd }

function TXMLTNFe_infNFe_det_prod_veicProd.Get_TpOp: UnicodeString;
begin
  Result := ChildNodes['tpOp'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_TpOp(Value: UnicodeString);
begin
  ChildNodes['tpOp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_Chassi: UnicodeString;
begin
  Result := ChildNodes['chassi'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_Chassi(Value: UnicodeString);
begin
  ChildNodes['chassi'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_CCor: UnicodeString;
begin
  Result := ChildNodes['cCor'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_CCor(Value: UnicodeString);
begin
  ChildNodes['cCor'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_XCor: UnicodeString;
begin
  Result := ChildNodes['xCor'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_XCor(Value: UnicodeString);
begin
  ChildNodes['xCor'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_Pot: UnicodeString;
begin
  Result := ChildNodes['pot'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_Pot(Value: UnicodeString);
begin
  ChildNodes['pot'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_Cilin: UnicodeString;
begin
  Result := ChildNodes['cilin'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_Cilin(Value: UnicodeString);
begin
  ChildNodes['cilin'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_PesoL: UnicodeString;
begin
  Result := ChildNodes['pesoL'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_PesoL(Value: UnicodeString);
begin
  ChildNodes['pesoL'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_PesoB: UnicodeString;
begin
  Result := ChildNodes['pesoB'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_PesoB(Value: UnicodeString);
begin
  ChildNodes['pesoB'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_NSerie: UnicodeString;
begin
  Result := ChildNodes['nSerie'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_NSerie(Value: UnicodeString);
begin
  ChildNodes['nSerie'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_TpComb: UnicodeString;
begin
  Result := ChildNodes['tpComb'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_TpComb(Value: UnicodeString);
begin
  ChildNodes['tpComb'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_NMotor: UnicodeString;
begin
  Result := ChildNodes['nMotor'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_NMotor(Value: UnicodeString);
begin
  ChildNodes['nMotor'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_CMT: UnicodeString;
begin
  Result := ChildNodes['CMT'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_CMT(Value: UnicodeString);
begin
  ChildNodes['CMT'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_Dist: UnicodeString;
begin
  Result := ChildNodes['dist'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_Dist(Value: UnicodeString);
begin
  ChildNodes['dist'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_AnoMod: UnicodeString;
begin
  Result := ChildNodes['anoMod'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_AnoMod(Value: UnicodeString);
begin
  ChildNodes['anoMod'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_AnoFab: UnicodeString;
begin
  Result := ChildNodes['anoFab'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_AnoFab(Value: UnicodeString);
begin
  ChildNodes['anoFab'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_TpPint: UnicodeString;
begin
  Result := ChildNodes['tpPint'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_TpPint(Value: UnicodeString);
begin
  ChildNodes['tpPint'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_TpVeic: UnicodeString;
begin
  Result := ChildNodes['tpVeic'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_TpVeic(Value: UnicodeString);
begin
  ChildNodes['tpVeic'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_EspVeic: UnicodeString;
begin
  Result := ChildNodes['espVeic'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_EspVeic(Value: UnicodeString);
begin
  ChildNodes['espVeic'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_VIN: UnicodeString;
begin
  Result := ChildNodes['VIN'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_VIN(Value: UnicodeString);
begin
  ChildNodes['VIN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_CondVeic: UnicodeString;
begin
  Result := ChildNodes['condVeic'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_CondVeic(Value: UnicodeString);
begin
  ChildNodes['condVeic'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_CMod: UnicodeString;
begin
  Result := ChildNodes['cMod'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_CMod(Value: UnicodeString);
begin
  ChildNodes['cMod'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_CCorDENATRAN: UnicodeString;
begin
  Result := ChildNodes['cCorDENATRAN'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_CCorDENATRAN(Value: UnicodeString);
begin
  ChildNodes['cCorDENATRAN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_Lota: UnicodeString;
begin
  Result := ChildNodes['lota'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_Lota(Value: UnicodeString);
begin
  ChildNodes['lota'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_veicProd.Get_TpRest: UnicodeString;
begin
  Result := ChildNodes['tpRest'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_veicProd.Set_TpRest(Value: UnicodeString);
begin
  ChildNodes['tpRest'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_med }

function TXMLTNFe_infNFe_det_prod_med.Get_CProdANVISA: UnicodeString;
begin
  Result := ChildNodes['cProdANVISA'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_med.Set_CProdANVISA(Value: UnicodeString);
begin
  ChildNodes['cProdANVISA'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_med.Get_VPMC: UnicodeString;
begin
  Result := ChildNodes['vPMC'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_med.Set_VPMC(Value: UnicodeString);
begin
  ChildNodes['vPMC'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_arma }

function TXMLTNFe_infNFe_det_prod_arma.Get_TpArma: UnicodeString;
begin
  Result := ChildNodes['tpArma'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_arma.Set_TpArma(Value: UnicodeString);
begin
  ChildNodes['tpArma'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_arma.Get_NSerie: UnicodeString;
begin
  Result := ChildNodes['nSerie'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_arma.Set_NSerie(Value: UnicodeString);
begin
  ChildNodes['nSerie'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_arma.Get_NCano: UnicodeString;
begin
  Result := ChildNodes['nCano'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_arma.Set_NCano(Value: UnicodeString);
begin
  ChildNodes['nCano'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_arma.Get_Descr: UnicodeString;
begin
  Result := ChildNodes['descr'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_arma.Set_Descr(Value: UnicodeString);
begin
  ChildNodes['descr'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_armaList }

function TXMLTNFe_infNFe_det_prod_armaList.Add: IXMLTNFe_infNFe_det_prod_arma;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_det_prod_arma;
end;

function TXMLTNFe_infNFe_det_prod_armaList.Insert(const Index: Integer): IXMLTNFe_infNFe_det_prod_arma;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_det_prod_arma;
end;

function TXMLTNFe_infNFe_det_prod_armaList.Get_Item(Index: Integer): IXMLTNFe_infNFe_det_prod_arma;
begin
  Result := List[Index] as IXMLTNFe_infNFe_det_prod_arma;
end;

{ TXMLTNFe_infNFe_det_prod_comb }

procedure TXMLTNFe_infNFe_det_prod_comb.AfterConstruction;
begin
  RegisterChildNode('CIDE', TXMLTNFe_infNFe_det_prod_comb_CIDE);
  RegisterChildNode('encerrante', TXMLTNFe_infNFe_det_prod_comb_encerrante);
  inherited;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_CProdANP: UnicodeString;
begin
  Result := ChildNodes['cProdANP'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_CProdANP(Value: UnicodeString);
begin
  ChildNodes['cProdANP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_DescANP: UnicodeString;
begin
  Result := ChildNodes['descANP'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_DescANP(Value: UnicodeString);
begin
  ChildNodes['descANP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_PGLP: UnicodeString;
begin
  Result := ChildNodes['pGLP'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_PGLP(Value: UnicodeString);
begin
  ChildNodes['pGLP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_PGNn: UnicodeString;
begin
  Result := ChildNodes['pGNn'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_PGNn(Value: UnicodeString);
begin
  ChildNodes['pGNn'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_PGNi: UnicodeString;
begin
  Result := ChildNodes['pGNi'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_PGNi(Value: UnicodeString);
begin
  ChildNodes['pGNi'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_VPart: UnicodeString;
begin
  Result := ChildNodes['vPart'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_VPart(Value: UnicodeString);
begin
  ChildNodes['vPart'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_CODIF: UnicodeString;
begin
  Result := ChildNodes['CODIF'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_CODIF(Value: UnicodeString);
begin
  ChildNodes['CODIF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_QTemp: UnicodeString;
begin
  Result := ChildNodes['qTemp'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_QTemp(Value: UnicodeString);
begin
  ChildNodes['qTemp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_UFCons: UnicodeString;
begin
  Result := ChildNodes['UFCons'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb.Set_UFCons(Value: UnicodeString);
begin
  ChildNodes['UFCons'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_CIDE: IXMLTNFe_infNFe_det_prod_comb_CIDE;
begin
  Result := ChildNodes['CIDE'] as IXMLTNFe_infNFe_det_prod_comb_CIDE;
end;

function TXMLTNFe_infNFe_det_prod_comb.Get_Encerrante: IXMLTNFe_infNFe_det_prod_comb_encerrante;
begin
  Result := ChildNodes['encerrante'] as IXMLTNFe_infNFe_det_prod_comb_encerrante;
end;

{ TXMLTNFe_infNFe_det_prod_comb_CIDE }

function TXMLTNFe_infNFe_det_prod_comb_CIDE.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_CIDE.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb_CIDE.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_CIDE.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb_CIDE.Get_VCIDE: UnicodeString;
begin
  Result := ChildNodes['vCIDE'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_CIDE.Set_VCIDE(Value: UnicodeString);
begin
  ChildNodes['vCIDE'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_prod_comb_encerrante }

function TXMLTNFe_infNFe_det_prod_comb_encerrante.Get_NBico: UnicodeString;
begin
  Result := ChildNodes['nBico'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_encerrante.Set_NBico(Value: UnicodeString);
begin
  ChildNodes['nBico'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb_encerrante.Get_NBomba: UnicodeString;
begin
  Result := ChildNodes['nBomba'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_encerrante.Set_NBomba(Value: UnicodeString);
begin
  ChildNodes['nBomba'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb_encerrante.Get_NTanque: UnicodeString;
begin
  Result := ChildNodes['nTanque'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_encerrante.Set_NTanque(Value: UnicodeString);
begin
  ChildNodes['nTanque'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb_encerrante.Get_VEncIni: UnicodeString;
begin
  Result := ChildNodes['vEncIni'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_encerrante.Set_VEncIni(Value: UnicodeString);
begin
  ChildNodes['vEncIni'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_comb_encerrante.Get_VEncFin: UnicodeString;
begin
  Result := ChildNodes['vEncFin'].Text;
end;

procedure TXMLTNFe_infNFe_det_prod_comb_encerrante.Set_VEncFin(Value: UnicodeString);
begin
  ChildNodes['vEncFin'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto }

procedure TXMLTNFe_infNFe_det_imposto.AfterConstruction;
begin
  RegisterChildNode('ICMS', TXMLTNFe_infNFe_det_imposto_ICMS);
  RegisterChildNode('IPI', TXMLTIpi);
  RegisterChildNode('II', TXMLTNFe_infNFe_det_imposto_II);
  RegisterChildNode('ISSQN', TXMLTNFe_infNFe_det_imposto_ISSQN);
  RegisterChildNode('PIS', TXMLTNFe_infNFe_det_imposto_PIS);
  RegisterChildNode('PISST', TXMLTNFe_infNFe_det_imposto_PISST);
  RegisterChildNode('COFINS', TXMLTNFe_infNFe_det_imposto_COFINS);
  RegisterChildNode('COFINSST', TXMLTNFe_infNFe_det_imposto_COFINSST);
  RegisterChildNode('ICMSUFDest', TXMLTNFe_infNFe_det_imposto_ICMSUFDest);
  inherited;
end;

function TXMLTNFe_infNFe_det_imposto.Get_VTotTrib: UnicodeString;
begin
  Result := ChildNodes['vTotTrib'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto.Set_VTotTrib(Value: UnicodeString);
begin
  ChildNodes['vTotTrib'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto.Get_ICMS: IXMLTNFe_infNFe_det_imposto_ICMS;
begin
  Result := ChildNodes['ICMS'] as IXMLTNFe_infNFe_det_imposto_ICMS;
end;

function TXMLTNFe_infNFe_det_imposto.Get_IPI: IXMLTIpi;
begin
  Result := ChildNodes['IPI'] as IXMLTIpi;
end;

function TXMLTNFe_infNFe_det_imposto.Get_II: IXMLTNFe_infNFe_det_imposto_II;
begin
  Result := ChildNodes['II'] as IXMLTNFe_infNFe_det_imposto_II;
end;

function TXMLTNFe_infNFe_det_imposto.Get_ISSQN: IXMLTNFe_infNFe_det_imposto_ISSQN;
begin
  Result := ChildNodes['ISSQN'] as IXMLTNFe_infNFe_det_imposto_ISSQN;
end;

function TXMLTNFe_infNFe_det_imposto.Get_PIS: IXMLTNFe_infNFe_det_imposto_PIS;
begin
  Result := ChildNodes['PIS'] as IXMLTNFe_infNFe_det_imposto_PIS;
end;

function TXMLTNFe_infNFe_det_imposto.Get_PISST: IXMLTNFe_infNFe_det_imposto_PISST;
begin
  Result := ChildNodes['PISST'] as IXMLTNFe_infNFe_det_imposto_PISST;
end;

function TXMLTNFe_infNFe_det_imposto.Get_COFINS: IXMLTNFe_infNFe_det_imposto_COFINS;
begin
  Result := ChildNodes['COFINS'] as IXMLTNFe_infNFe_det_imposto_COFINS;
end;

function TXMLTNFe_infNFe_det_imposto.Get_COFINSST: IXMLTNFe_infNFe_det_imposto_COFINSST;
begin
  Result := ChildNodes['COFINSST'] as IXMLTNFe_infNFe_det_imposto_COFINSST;
end;

function TXMLTNFe_infNFe_det_imposto.Get_ICMSUFDest: IXMLTNFe_infNFe_det_imposto_ICMSUFDest;
begin
  Result := ChildNodes['ICMSUFDest'] as IXMLTNFe_infNFe_det_imposto_ICMSUFDest;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS }

procedure TXMLTNFe_infNFe_det_imposto_ICMS.AfterConstruction;
begin
  RegisterChildNode('ICMS00', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00);
  RegisterChildNode('ICMS10', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10);
  RegisterChildNode('ICMS20', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20);
  RegisterChildNode('ICMS30', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30);
  RegisterChildNode('ICMS40', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40);
  RegisterChildNode('ICMS51', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51);
  RegisterChildNode('ICMS60', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60);
  RegisterChildNode('ICMS70', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70);
  RegisterChildNode('ICMS90', TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90);
  RegisterChildNode('ICMSPart', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart);
  RegisterChildNode('ICMSST', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST);
  RegisterChildNode('ICMSSN101', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101);
  RegisterChildNode('ICMSSN102', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102);
  RegisterChildNode('ICMSSN201', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201);
  RegisterChildNode('ICMSSN202', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202);
  RegisterChildNode('ICMSSN500', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500);
  RegisterChildNode('ICMSSN900', TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900);
  inherited;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS00: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00;
begin
  Result := ChildNodes['ICMS00'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS00;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS10: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10;
begin
  Result := ChildNodes['ICMS10'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS10;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS20: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20;
begin
  Result := ChildNodes['ICMS20'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS20;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS30: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30;
begin
  Result := ChildNodes['ICMS30'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS30;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS40: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40;
begin
  Result := ChildNodes['ICMS40'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS40;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS51: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51;
begin
  Result := ChildNodes['ICMS51'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS51;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS60: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60;
begin
  Result := ChildNodes['ICMS60'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS60;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS70: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70;
begin
  Result := ChildNodes['ICMS70'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS70;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMS90: IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90;
begin
  Result := ChildNodes['ICMS90'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMS90;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSPart: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart;
begin
  Result := ChildNodes['ICMSPart'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSST: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST;
begin
  Result := ChildNodes['ICMSST'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSST;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSSN101: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101;
begin
  Result := ChildNodes['ICMSSN101'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSSN102: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102;
begin
  Result := ChildNodes['ICMSSN102'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSSN201: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201;
begin
  Result := ChildNodes['ICMSSN201'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSSN202: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202;
begin
  Result := ChildNodes['ICMSSN202'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSSN500: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500;
begin
  Result := ChildNodes['ICMSSN500'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS.Get_ICMSSN900: IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900;
begin
  Result := ChildNodes['ICMSSN900'] as IXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_PFCP: UnicodeString;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_PFCP(Value: UnicodeString);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS00.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VBCFCP: UnicodeString;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VBCFCP(Value: UnicodeString);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_PFCP: UnicodeString;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_PFCP(Value: UnicodeString);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS10.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_PRedBC: UnicodeString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_PRedBC(Value: UnicodeString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_VBCFCP: UnicodeString;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_VBCFCP(Value: UnicodeString);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_PFCP: UnicodeString;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_PFCP(Value: UnicodeString);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_VICMSDeson: UnicodeString;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_VICMSDeson(Value: UnicodeString);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Get_MotDesICMS: UnicodeString;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS20.Set_MotDesICMS(Value: UnicodeString);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_VICMSDeson: UnicodeString;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_VICMSDeson(Value: UnicodeString);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Get_MotDesICMS: UnicodeString;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS30.Set_MotDesICMS(Value: UnicodeString);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Get_VICMSDeson: UnicodeString;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Set_VICMSDeson(Value: UnicodeString);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Get_MotDesICMS: UnicodeString;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS40.Set_MotDesICMS(Value: UnicodeString);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_PRedBC: UnicodeString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_PRedBC(Value: UnicodeString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_VICMSOp: UnicodeString;
begin
  Result := ChildNodes['vICMSOp'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_VICMSOp(Value: UnicodeString);
begin
  ChildNodes['vICMSOp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_PDif: UnicodeString;
begin
  Result := ChildNodes['pDif'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_PDif(Value: UnicodeString);
begin
  ChildNodes['pDif'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_VICMSDif: UnicodeString;
begin
  Result := ChildNodes['vICMSDif'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_VICMSDif(Value: UnicodeString);
begin
  ChildNodes['vICMSDif'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_VBCFCP: UnicodeString;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_VBCFCP(Value: UnicodeString);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_PFCP: UnicodeString;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_PFCP(Value: UnicodeString);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS51.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_VBCSTRet: UnicodeString;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_VBCSTRet(Value: UnicodeString);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_PST: UnicodeString;
begin
  Result := ChildNodes['pST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_PST(Value: UnicodeString);
begin
  ChildNodes['pST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_VICMSSTRet: UnicodeString;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_VICMSSTRet(Value: UnicodeString);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_VBCFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['vBCFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_VBCFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['vBCFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_PFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['pFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_PFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['pFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_VFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_VFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_PRedBCEfet: UnicodeString;
begin
  Result := ChildNodes['pRedBCEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_PRedBCEfet(Value: UnicodeString);
begin
  ChildNodes['pRedBCEfet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_VBCEfet: UnicodeString;
begin
  Result := ChildNodes['vBCEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_VBCEfet(Value: UnicodeString);
begin
  ChildNodes['vBCEfet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_PICMSEfet: UnicodeString;
begin
  Result := ChildNodes['pICMSEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_PICMSEfet(Value: UnicodeString);
begin
  ChildNodes['pICMSEfet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Get_VICMSEfet: UnicodeString;
begin
  Result := ChildNodes['vICMSEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS60.Set_VICMSEfet(Value: UnicodeString);
begin
  ChildNodes['vICMSEfet'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PRedBC: UnicodeString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PRedBC(Value: UnicodeString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VBCFCP: UnicodeString;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VBCFCP(Value: UnicodeString);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PFCP: UnicodeString;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PFCP(Value: UnicodeString);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_VICMSDeson: UnicodeString;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_VICMSDeson(Value: UnicodeString);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Get_MotDesICMS: UnicodeString;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS70.Set_MotDesICMS(Value: UnicodeString);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PRedBC: UnicodeString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PRedBC(Value: UnicodeString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VBCFCP: UnicodeString;
begin
  Result := ChildNodes['vBCFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VBCFCP(Value: UnicodeString);
begin
  ChildNodes['vBCFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PFCP: UnicodeString;
begin
  Result := ChildNodes['pFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PFCP(Value: UnicodeString);
begin
  ChildNodes['pFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_VICMSDeson: UnicodeString;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_VICMSDeson(Value: UnicodeString);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Get_MotDesICMS: UnicodeString;
begin
  Result := ChildNodes['motDesICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMS90.Set_MotDesICMS(Value: UnicodeString);
begin
  ChildNodes['motDesICMS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_PRedBC: UnicodeString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_PRedBC(Value: UnicodeString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_PBCOp: UnicodeString;
begin
  Result := ChildNodes['pBCOp'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_PBCOp(Value: UnicodeString);
begin
  ChildNodes['pBCOp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Get_UFST: UnicodeString;
begin
  Result := ChildNodes['UFST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSPart.Set_UFST(Value: UnicodeString);
begin
  ChildNodes['UFST'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Get_VBCSTRet: UnicodeString;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Set_VBCSTRet(Value: UnicodeString);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Get_VICMSSTRet: UnicodeString;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Set_VICMSSTRet(Value: UnicodeString);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Get_VBCSTDest: UnicodeString;
begin
  Result := ChildNodes['vBCSTDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Set_VBCSTDest(Value: UnicodeString);
begin
  ChildNodes['vBCSTDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Get_VICMSSTDest: UnicodeString;
begin
  Result := ChildNodes['vICMSSTDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSST.Set_VICMSSTDest(Value: UnicodeString);
begin
  ChildNodes['vICMSSTDest'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Get_CSOSN: UnicodeString;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Set_CSOSN(Value: UnicodeString);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Get_PCredSN: UnicodeString;
begin
  Result := ChildNodes['pCredSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Set_PCredSN(Value: UnicodeString);
begin
  ChildNodes['pCredSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Get_VCredICMSSN: UnicodeString;
begin
  Result := ChildNodes['vCredICMSSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN101.Set_VCredICMSSN(Value: UnicodeString);
begin
  ChildNodes['vCredICMSSN'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102.Get_CSOSN: UnicodeString;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN102.Set_CSOSN(Value: UnicodeString);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_CSOSN: UnicodeString;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_CSOSN(Value: UnicodeString);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_PCredSN: UnicodeString;
begin
  Result := ChildNodes['pCredSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_PCredSN(Value: UnicodeString);
begin
  ChildNodes['pCredSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Get_VCredICMSSN: UnicodeString;
begin
  Result := ChildNodes['vCredICMSSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN201.Set_VCredICMSSN(Value: UnicodeString);
begin
  ChildNodes['vCredICMSSN'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_CSOSN: UnicodeString;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_CSOSN(Value: UnicodeString);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN202.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_CSOSN: UnicodeString;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_CSOSN(Value: UnicodeString);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_VBCSTRet: UnicodeString;
begin
  Result := ChildNodes['vBCSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_VBCSTRet(Value: UnicodeString);
begin
  ChildNodes['vBCSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_PST: UnicodeString;
begin
  Result := ChildNodes['pST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_PST(Value: UnicodeString);
begin
  ChildNodes['pST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_VICMSSTRet: UnicodeString;
begin
  Result := ChildNodes['vICMSSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_VICMSSTRet(Value: UnicodeString);
begin
  ChildNodes['vICMSSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_VBCFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['vBCFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_VBCFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['vBCFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_PFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['pFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_PFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['pFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_VFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_VFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_PRedBCEfet: UnicodeString;
begin
  Result := ChildNodes['pRedBCEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_PRedBCEfet(Value: UnicodeString);
begin
  ChildNodes['pRedBCEfet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_VBCEfet: UnicodeString;
begin
  Result := ChildNodes['vBCEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_VBCEfet(Value: UnicodeString);
begin
  ChildNodes['vBCEfet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_PICMSEfet: UnicodeString;
begin
  Result := ChildNodes['pICMSEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_PICMSEfet(Value: UnicodeString);
begin
  ChildNodes['pICMSEfet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Get_VICMSEfet: UnicodeString;
begin
  Result := ChildNodes['vICMSEfet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN500.Set_VICMSEfet(Value: UnicodeString);
begin
  ChildNodes['vICMSEfet'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900 }

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_Orig: UnicodeString;
begin
  Result := ChildNodes['orig'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_Orig(Value: UnicodeString);
begin
  ChildNodes['orig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_CSOSN: UnicodeString;
begin
  Result := ChildNodes['CSOSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_CSOSN(Value: UnicodeString);
begin
  ChildNodes['CSOSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_ModBC: UnicodeString;
begin
  Result := ChildNodes['modBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_ModBC(Value: UnicodeString);
begin
  ChildNodes['modBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PRedBC: UnicodeString;
begin
  Result := ChildNodes['pRedBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PRedBC(Value: UnicodeString);
begin
  ChildNodes['pRedBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PICMS: UnicodeString;
begin
  Result := ChildNodes['pICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PICMS(Value: UnicodeString);
begin
  ChildNodes['pICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_ModBCST: UnicodeString;
begin
  Result := ChildNodes['modBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_ModBCST(Value: UnicodeString);
begin
  ChildNodes['modBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PMVAST: UnicodeString;
begin
  Result := ChildNodes['pMVAST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PMVAST(Value: UnicodeString);
begin
  ChildNodes['pMVAST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PRedBCST: UnicodeString;
begin
  Result := ChildNodes['pRedBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PRedBCST(Value: UnicodeString);
begin
  ChildNodes['pRedBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PICMSST: UnicodeString;
begin
  Result := ChildNodes['pICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PICMSST(Value: UnicodeString);
begin
  ChildNodes['pICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VICMSST: UnicodeString;
begin
  Result := ChildNodes['vICMSST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VICMSST(Value: UnicodeString);
begin
  ChildNodes['vICMSST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VBCFCPST: UnicodeString;
begin
  Result := ChildNodes['vBCFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VBCFCPST(Value: UnicodeString);
begin
  ChildNodes['vBCFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PFCPST: UnicodeString;
begin
  Result := ChildNodes['pFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PFCPST(Value: UnicodeString);
begin
  ChildNodes['pFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_PCredSN: UnicodeString;
begin
  Result := ChildNodes['pCredSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_PCredSN(Value: UnicodeString);
begin
  ChildNodes['pCredSN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Get_VCredICMSSN: UnicodeString;
begin
  Result := ChildNodes['vCredICMSSN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMS_ICMSSN900.Set_VCredICMSSN(Value: UnicodeString);
begin
  ChildNodes['vCredICMSSN'].NodeValue := Value;
end;

{ TXMLTIpi }

procedure TXMLTIpi.AfterConstruction;
begin
  RegisterChildNode('IPITrib', TXMLTIpi_IPITrib);
  RegisterChildNode('IPINT', TXMLTIpi_IPINT);
  inherited;
end;

function TXMLTIpi.Get_CNPJProd: UnicodeString;
begin
  Result := ChildNodes['CNPJProd'].Text;
end;

procedure TXMLTIpi.Set_CNPJProd(Value: UnicodeString);
begin
  ChildNodes['CNPJProd'].NodeValue := Value;
end;

function TXMLTIpi.Get_CSelo: UnicodeString;
begin
  Result := ChildNodes['cSelo'].Text;
end;

procedure TXMLTIpi.Set_CSelo(Value: UnicodeString);
begin
  ChildNodes['cSelo'].NodeValue := Value;
end;

function TXMLTIpi.Get_QSelo: UnicodeString;
begin
  Result := ChildNodes['qSelo'].Text;
end;

procedure TXMLTIpi.Set_QSelo(Value: UnicodeString);
begin
  ChildNodes['qSelo'].NodeValue := Value;
end;

function TXMLTIpi.Get_CEnq: UnicodeString;
begin
  Result := ChildNodes['cEnq'].Text;
end;

procedure TXMLTIpi.Set_CEnq(Value: UnicodeString);
begin
  ChildNodes['cEnq'].NodeValue := Value;
end;

function TXMLTIpi.Get_IPITrib: IXMLTIpi_IPITrib;
begin
  Result := ChildNodes['IPITrib'] as IXMLTIpi_IPITrib;
end;

function TXMLTIpi.Get_IPINT: IXMLTIpi_IPINT;
begin
  Result := ChildNodes['IPINT'] as IXMLTIpi_IPINT;
end;

{ TXMLTIpi_IPITrib }

function TXMLTIpi_IPITrib.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTIpi_IPITrib.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTIpi_IPITrib.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTIpi_IPITrib.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTIpi_IPITrib.Get_PIPI: UnicodeString;
begin
  Result := ChildNodes['pIPI'].Text;
end;

procedure TXMLTIpi_IPITrib.Set_PIPI(Value: UnicodeString);
begin
  ChildNodes['pIPI'].NodeValue := Value;
end;

function TXMLTIpi_IPITrib.Get_QUnid: UnicodeString;
begin
  Result := ChildNodes['qUnid'].Text;
end;

procedure TXMLTIpi_IPITrib.Set_QUnid(Value: UnicodeString);
begin
  ChildNodes['qUnid'].NodeValue := Value;
end;

function TXMLTIpi_IPITrib.Get_VUnid: UnicodeString;
begin
  Result := ChildNodes['vUnid'].Text;
end;

procedure TXMLTIpi_IPITrib.Set_VUnid(Value: UnicodeString);
begin
  ChildNodes['vUnid'].NodeValue := Value;
end;

function TXMLTIpi_IPITrib.Get_VIPI: UnicodeString;
begin
  Result := ChildNodes['vIPI'].Text;
end;

procedure TXMLTIpi_IPITrib.Set_VIPI(Value: UnicodeString);
begin
  ChildNodes['vIPI'].NodeValue := Value;
end;

{ TXMLTIpi_IPINT }

function TXMLTIpi_IPINT.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTIpi_IPINT.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_II }

function TXMLTNFe_infNFe_det_imposto_II.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_II.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_II.Get_VDespAdu: UnicodeString;
begin
  Result := ChildNodes['vDespAdu'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_II.Set_VDespAdu(Value: UnicodeString);
begin
  ChildNodes['vDespAdu'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_II.Get_VII: UnicodeString;
begin
  Result := ChildNodes['vII'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_II.Set_VII(Value: UnicodeString);
begin
  ChildNodes['vII'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_II.Get_VIOF: UnicodeString;
begin
  Result := ChildNodes['vIOF'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_II.Set_VIOF(Value: UnicodeString);
begin
  ChildNodes['vIOF'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ISSQN }

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VAliq: UnicodeString;
begin
  Result := ChildNodes['vAliq'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VAliq(Value: UnicodeString);
begin
  ChildNodes['vAliq'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VISSQN: UnicodeString;
begin
  Result := ChildNodes['vISSQN'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VISSQN(Value: UnicodeString);
begin
  ChildNodes['vISSQN'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_CMunFG: UnicodeString;
begin
  Result := ChildNodes['cMunFG'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_CMunFG(Value: UnicodeString);
begin
  ChildNodes['cMunFG'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_CListServ: UnicodeString;
begin
  Result := ChildNodes['cListServ'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_CListServ(Value: UnicodeString);
begin
  ChildNodes['cListServ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VDeducao: UnicodeString;
begin
  Result := ChildNodes['vDeducao'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VDeducao(Value: UnicodeString);
begin
  ChildNodes['vDeducao'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VOutro: UnicodeString;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VOutro(Value: UnicodeString);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VDescIncond: UnicodeString;
begin
  Result := ChildNodes['vDescIncond'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VDescIncond(Value: UnicodeString);
begin
  ChildNodes['vDescIncond'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VDescCond: UnicodeString;
begin
  Result := ChildNodes['vDescCond'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VDescCond(Value: UnicodeString);
begin
  ChildNodes['vDescCond'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_VISSRet: UnicodeString;
begin
  Result := ChildNodes['vISSRet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_VISSRet(Value: UnicodeString);
begin
  ChildNodes['vISSRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_IndISS: UnicodeString;
begin
  Result := ChildNodes['indISS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_IndISS(Value: UnicodeString);
begin
  ChildNodes['indISS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_CServico: UnicodeString;
begin
  Result := ChildNodes['cServico'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_CServico(Value: UnicodeString);
begin
  ChildNodes['cServico'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_CMun: UnicodeString;
begin
  Result := ChildNodes['cMun'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_CMun(Value: UnicodeString);
begin
  ChildNodes['cMun'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_CPais: UnicodeString;
begin
  Result := ChildNodes['cPais'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_CPais(Value: UnicodeString);
begin
  ChildNodes['cPais'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_NProcesso: UnicodeString;
begin
  Result := ChildNodes['nProcesso'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_NProcesso(Value: UnicodeString);
begin
  ChildNodes['nProcesso'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ISSQN.Get_IndIncentivo: UnicodeString;
begin
  Result := ChildNodes['indIncentivo'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ISSQN.Set_IndIncentivo(Value: UnicodeString);
begin
  ChildNodes['indIncentivo'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_PIS }

procedure TXMLTNFe_infNFe_det_imposto_PIS.AfterConstruction;
begin
  RegisterChildNode('PISAliq', TXMLTNFe_infNFe_det_imposto_PIS_PISAliq);
  RegisterChildNode('PISQtde', TXMLTNFe_infNFe_det_imposto_PIS_PISQtde);
  RegisterChildNode('PISNT', TXMLTNFe_infNFe_det_imposto_PIS_PISNT);
  RegisterChildNode('PISOutr', TXMLTNFe_infNFe_det_imposto_PIS_PISOutr);
  inherited;
end;

function TXMLTNFe_infNFe_det_imposto_PIS.Get_PISAliq: IXMLTNFe_infNFe_det_imposto_PIS_PISAliq;
begin
  Result := ChildNodes['PISAliq'] as IXMLTNFe_infNFe_det_imposto_PIS_PISAliq;
end;

function TXMLTNFe_infNFe_det_imposto_PIS.Get_PISQtde: IXMLTNFe_infNFe_det_imposto_PIS_PISQtde;
begin
  Result := ChildNodes['PISQtde'] as IXMLTNFe_infNFe_det_imposto_PIS_PISQtde;
end;

function TXMLTNFe_infNFe_det_imposto_PIS.Get_PISNT: IXMLTNFe_infNFe_det_imposto_PIS_PISNT;
begin
  Result := ChildNodes['PISNT'] as IXMLTNFe_infNFe_det_imposto_PIS_PISNT;
end;

function TXMLTNFe_infNFe_det_imposto_PIS.Get_PISOutr: IXMLTNFe_infNFe_det_imposto_PIS_PISOutr;
begin
  Result := ChildNodes['PISOutr'] as IXMLTNFe_infNFe_det_imposto_PIS_PISOutr;
end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISAliq }

function TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Get_PPIS: UnicodeString;
begin
  Result := ChildNodes['pPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Set_PPIS(Value: UnicodeString);
begin
  ChildNodes['pPIS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Get_VPIS: UnicodeString;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISAliq.Set_VPIS(Value: UnicodeString);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISQtde }

function TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Get_VPIS: UnicodeString;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISQtde.Set_VPIS(Value: UnicodeString);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISNT }

function TXMLTNFe_infNFe_det_imposto_PIS_PISNT.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISNT.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_PIS_PISOutr }

function TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Get_PPIS: UnicodeString;
begin
  Result := ChildNodes['pPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Set_PPIS(Value: UnicodeString);
begin
  ChildNodes['pPIS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Get_VPIS: UnicodeString;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PIS_PISOutr.Set_VPIS(Value: UnicodeString);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_PISST }

function TXMLTNFe_infNFe_det_imposto_PISST.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PISST.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PISST.Get_PPIS: UnicodeString;
begin
  Result := ChildNodes['pPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PISST.Set_PPIS(Value: UnicodeString);
begin
  ChildNodes['pPIS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PISST.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PISST.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PISST.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PISST.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_PISST.Get_VPIS: UnicodeString;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_PISST.Set_VPIS(Value: UnicodeString);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_COFINS }

procedure TXMLTNFe_infNFe_det_imposto_COFINS.AfterConstruction;
begin
  RegisterChildNode('COFINSAliq', TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq);
  RegisterChildNode('COFINSQtde', TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde);
  RegisterChildNode('COFINSNT', TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT);
  RegisterChildNode('COFINSOutr', TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr);
  inherited;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS.Get_COFINSAliq: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq;
begin
  Result := ChildNodes['COFINSAliq'] as IXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS.Get_COFINSQtde: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde;
begin
  Result := ChildNodes['COFINSQtde'] as IXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS.Get_COFINSNT: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT;
begin
  Result := ChildNodes['COFINSNT'] as IXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS.Get_COFINSOutr: IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr;
begin
  Result := ChildNodes['COFINSOutr'] as IXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr;
end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq }

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Get_PCOFINS: UnicodeString;
begin
  Result := ChildNodes['pCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Set_PCOFINS(Value: UnicodeString);
begin
  ChildNodes['pCOFINS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Get_VCOFINS: UnicodeString;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSAliq.Set_VCOFINS(Value: UnicodeString);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde }

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Get_VCOFINS: UnicodeString;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSQtde.Set_VCOFINS(Value: UnicodeString);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT }

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSNT.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr }

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Get_CST: UnicodeString;
begin
  Result := ChildNodes['CST'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Set_CST(Value: UnicodeString);
begin
  ChildNodes['CST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Get_PCOFINS: UnicodeString;
begin
  Result := ChildNodes['pCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Set_PCOFINS(Value: UnicodeString);
begin
  ChildNodes['pCOFINS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Get_VCOFINS: UnicodeString;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINS_COFINSOutr.Set_VCOFINS(Value: UnicodeString);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_COFINSST }

function TXMLTNFe_infNFe_det_imposto_COFINSST.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINSST.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINSST.Get_PCOFINS: UnicodeString;
begin
  Result := ChildNodes['pCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINSST.Set_PCOFINS(Value: UnicodeString);
begin
  ChildNodes['pCOFINS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINSST.Get_QBCProd: UnicodeString;
begin
  Result := ChildNodes['qBCProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINSST.Set_QBCProd(Value: UnicodeString);
begin
  ChildNodes['qBCProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINSST.Get_VAliqProd: UnicodeString;
begin
  Result := ChildNodes['vAliqProd'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINSST.Set_VAliqProd(Value: UnicodeString);
begin
  ChildNodes['vAliqProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_COFINSST.Get_VCOFINS: UnicodeString;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_COFINSST.Set_VCOFINS(Value: UnicodeString);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_imposto_ICMSUFDest }

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_VBCUFDest: UnicodeString;
begin
  Result := ChildNodes['vBCUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_VBCUFDest(Value: UnicodeString);
begin
  ChildNodes['vBCUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_VBCFCPUFDest: UnicodeString;
begin
  Result := ChildNodes['vBCFCPUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_VBCFCPUFDest(Value: UnicodeString);
begin
  ChildNodes['vBCFCPUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_PFCPUFDest: UnicodeString;
begin
  Result := ChildNodes['pFCPUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_PFCPUFDest(Value: UnicodeString);
begin
  ChildNodes['pFCPUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_PICMSUFDest: UnicodeString;
begin
  Result := ChildNodes['pICMSUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_PICMSUFDest(Value: UnicodeString);
begin
  ChildNodes['pICMSUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_PICMSInter: UnicodeString;
begin
  Result := ChildNodes['pICMSInter'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_PICMSInter(Value: UnicodeString);
begin
  ChildNodes['pICMSInter'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_PICMSInterPart: UnicodeString;
begin
  Result := ChildNodes['pICMSInterPart'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_PICMSInterPart(Value: UnicodeString);
begin
  ChildNodes['pICMSInterPart'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_VFCPUFDest: UnicodeString;
begin
  Result := ChildNodes['vFCPUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_VFCPUFDest(Value: UnicodeString);
begin
  ChildNodes['vFCPUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_VICMSUFDest: UnicodeString;
begin
  Result := ChildNodes['vICMSUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_VICMSUFDest(Value: UnicodeString);
begin
  ChildNodes['vICMSUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Get_VICMSUFRemet: UnicodeString;
begin
  Result := ChildNodes['vICMSUFRemet'].Text;
end;

procedure TXMLTNFe_infNFe_det_imposto_ICMSUFDest.Set_VICMSUFRemet(Value: UnicodeString);
begin
  ChildNodes['vICMSUFRemet'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_det_impostoDevol }

procedure TXMLTNFe_infNFe_det_impostoDevol.AfterConstruction;
begin
  RegisterChildNode('IPI', TXMLTNFe_infNFe_det_impostoDevol_IPI);
  inherited;
end;

function TXMLTNFe_infNFe_det_impostoDevol.Get_PDevol: UnicodeString;
begin
  Result := ChildNodes['pDevol'].Text;
end;

procedure TXMLTNFe_infNFe_det_impostoDevol.Set_PDevol(Value: UnicodeString);
begin
  ChildNodes['pDevol'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_impostoDevol.Get_IPI: IXMLTNFe_infNFe_det_impostoDevol_IPI;
begin
  Result := ChildNodes['IPI'] as IXMLTNFe_infNFe_det_impostoDevol_IPI;
end;

{ TXMLTNFe_infNFe_det_impostoDevol_IPI }

function TXMLTNFe_infNFe_det_impostoDevol_IPI.Get_VIPIDevol: UnicodeString;
begin
  Result := ChildNodes['vIPIDevol'].Text;
end;

procedure TXMLTNFe_infNFe_det_impostoDevol_IPI.Set_VIPIDevol(Value: UnicodeString);
begin
  ChildNodes['vIPIDevol'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_total }

procedure TXMLTNFe_infNFe_total.AfterConstruction;
begin
  RegisterChildNode('ICMSTot', TXMLTNFe_infNFe_total_ICMSTot);
  RegisterChildNode('ISSQNtot', TXMLTNFe_infNFe_total_ISSQNtot);
  RegisterChildNode('retTrib', TXMLTNFe_infNFe_total_retTrib);
  inherited;
end;

function TXMLTNFe_infNFe_total.Get_ICMSTot: IXMLTNFe_infNFe_total_ICMSTot;
begin
  Result := ChildNodes['ICMSTot'] as IXMLTNFe_infNFe_total_ICMSTot;
end;

function TXMLTNFe_infNFe_total.Get_ISSQNtot: IXMLTNFe_infNFe_total_ISSQNtot;
begin
  Result := ChildNodes['ISSQNtot'] as IXMLTNFe_infNFe_total_ISSQNtot;
end;

function TXMLTNFe_infNFe_total.Get_RetTrib: IXMLTNFe_infNFe_total_retTrib;
begin
  Result := ChildNodes['retTrib'] as IXMLTNFe_infNFe_total_retTrib;
end;

{ TXMLTNFe_infNFe_total_ICMSTot }

function TXMLTNFe_infNFe_total_ICMSTot.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VICMS: UnicodeString;
begin
  Result := ChildNodes['vICMS'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VICMS(Value: UnicodeString);
begin
  ChildNodes['vICMS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VICMSDeson: UnicodeString;
begin
  Result := ChildNodes['vICMSDeson'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VICMSDeson(Value: UnicodeString);
begin
  ChildNodes['vICMSDeson'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VFCPUFDest: UnicodeString;
begin
  Result := ChildNodes['vFCPUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VFCPUFDest(Value: UnicodeString);
begin
  ChildNodes['vFCPUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VICMSUFDest: UnicodeString;
begin
  Result := ChildNodes['vICMSUFDest'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VICMSUFDest(Value: UnicodeString);
begin
  ChildNodes['vICMSUFDest'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VICMSUFRemet: UnicodeString;
begin
  Result := ChildNodes['vICMSUFRemet'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VICMSUFRemet(Value: UnicodeString);
begin
  ChildNodes['vICMSUFRemet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VFCP: UnicodeString;
begin
  Result := ChildNodes['vFCP'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VFCP(Value: UnicodeString);
begin
  ChildNodes['vFCP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VBCST: UnicodeString;
begin
  Result := ChildNodes['vBCST'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VBCST(Value: UnicodeString);
begin
  ChildNodes['vBCST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VST: UnicodeString;
begin
  Result := ChildNodes['vST'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VST(Value: UnicodeString);
begin
  ChildNodes['vST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VFCPST: UnicodeString;
begin
  Result := ChildNodes['vFCPST'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VFCPST(Value: UnicodeString);
begin
  ChildNodes['vFCPST'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VFCPSTRet: UnicodeString;
begin
  Result := ChildNodes['vFCPSTRet'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VFCPSTRet(Value: UnicodeString);
begin
  ChildNodes['vFCPSTRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VProd: UnicodeString;
begin
  Result := ChildNodes['vProd'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VProd(Value: UnicodeString);
begin
  ChildNodes['vProd'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VFrete: UnicodeString;
begin
  Result := ChildNodes['vFrete'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VFrete(Value: UnicodeString);
begin
  ChildNodes['vFrete'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VSeg: UnicodeString;
begin
  Result := ChildNodes['vSeg'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VSeg(Value: UnicodeString);
begin
  ChildNodes['vSeg'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VDesc: UnicodeString;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VDesc(Value: UnicodeString);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VII: UnicodeString;
begin
  Result := ChildNodes['vII'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VII(Value: UnicodeString);
begin
  ChildNodes['vII'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VIPI: UnicodeString;
begin
  Result := ChildNodes['vIPI'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VIPI(Value: UnicodeString);
begin
  ChildNodes['vIPI'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VIPIDevol: UnicodeString;
begin
  Result := ChildNodes['vIPIDevol'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VIPIDevol(Value: UnicodeString);
begin
  ChildNodes['vIPIDevol'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VPIS: UnicodeString;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VPIS(Value: UnicodeString);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VCOFINS: UnicodeString;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VCOFINS(Value: UnicodeString);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VOutro: UnicodeString;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VOutro(Value: UnicodeString);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VNF: UnicodeString;
begin
  Result := ChildNodes['vNF'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VNF(Value: UnicodeString);
begin
  ChildNodes['vNF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ICMSTot.Get_VTotTrib: UnicodeString;
begin
  Result := ChildNodes['vTotTrib'].Text;
end;

procedure TXMLTNFe_infNFe_total_ICMSTot.Set_VTotTrib(Value: UnicodeString);
begin
  ChildNodes['vTotTrib'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_total_ISSQNtot }

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VServ: UnicodeString;
begin
  Result := ChildNodes['vServ'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VServ(Value: UnicodeString);
begin
  ChildNodes['vServ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VBC: UnicodeString;
begin
  Result := ChildNodes['vBC'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VBC(Value: UnicodeString);
begin
  ChildNodes['vBC'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VISS: UnicodeString;
begin
  Result := ChildNodes['vISS'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VISS(Value: UnicodeString);
begin
  ChildNodes['vISS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VPIS: UnicodeString;
begin
  Result := ChildNodes['vPIS'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VPIS(Value: UnicodeString);
begin
  ChildNodes['vPIS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VCOFINS: UnicodeString;
begin
  Result := ChildNodes['vCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VCOFINS(Value: UnicodeString);
begin
  ChildNodes['vCOFINS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_DCompet: UnicodeString;
begin
  Result := ChildNodes['dCompet'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_DCompet(Value: UnicodeString);
begin
  ChildNodes['dCompet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VDeducao: UnicodeString;
begin
  Result := ChildNodes['vDeducao'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VDeducao(Value: UnicodeString);
begin
  ChildNodes['vDeducao'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VOutro: UnicodeString;
begin
  Result := ChildNodes['vOutro'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VOutro(Value: UnicodeString);
begin
  ChildNodes['vOutro'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VDescIncond: UnicodeString;
begin
  Result := ChildNodes['vDescIncond'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VDescIncond(Value: UnicodeString);
begin
  ChildNodes['vDescIncond'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VDescCond: UnicodeString;
begin
  Result := ChildNodes['vDescCond'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VDescCond(Value: UnicodeString);
begin
  ChildNodes['vDescCond'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_VISSRet: UnicodeString;
begin
  Result := ChildNodes['vISSRet'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_VISSRet(Value: UnicodeString);
begin
  ChildNodes['vISSRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_ISSQNtot.Get_CRegTrib: UnicodeString;
begin
  Result := ChildNodes['cRegTrib'].Text;
end;

procedure TXMLTNFe_infNFe_total_ISSQNtot.Set_CRegTrib(Value: UnicodeString);
begin
  ChildNodes['cRegTrib'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_total_retTrib }

function TXMLTNFe_infNFe_total_retTrib.Get_VRetPIS: UnicodeString;
begin
  Result := ChildNodes['vRetPIS'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VRetPIS(Value: UnicodeString);
begin
  ChildNodes['vRetPIS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_retTrib.Get_VRetCOFINS: UnicodeString;
begin
  Result := ChildNodes['vRetCOFINS'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VRetCOFINS(Value: UnicodeString);
begin
  ChildNodes['vRetCOFINS'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_retTrib.Get_VRetCSLL: UnicodeString;
begin
  Result := ChildNodes['vRetCSLL'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VRetCSLL(Value: UnicodeString);
begin
  ChildNodes['vRetCSLL'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_retTrib.Get_VBCIRRF: UnicodeString;
begin
  Result := ChildNodes['vBCIRRF'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VBCIRRF(Value: UnicodeString);
begin
  ChildNodes['vBCIRRF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_retTrib.Get_VIRRF: UnicodeString;
begin
  Result := ChildNodes['vIRRF'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VIRRF(Value: UnicodeString);
begin
  ChildNodes['vIRRF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_retTrib.Get_VBCRetPrev: UnicodeString;
begin
  Result := ChildNodes['vBCRetPrev'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VBCRetPrev(Value: UnicodeString);
begin
  ChildNodes['vBCRetPrev'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_total_retTrib.Get_VRetPrev: UnicodeString;
begin
  Result := ChildNodes['vRetPrev'].Text;
end;

procedure TXMLTNFe_infNFe_total_retTrib.Set_VRetPrev(Value: UnicodeString);
begin
  ChildNodes['vRetPrev'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_transp }

procedure TXMLTNFe_infNFe_transp.AfterConstruction;
begin
  RegisterChildNode('transporta', TXMLTNFe_infNFe_transp_transporta);
  RegisterChildNode('retTransp', TXMLTNFe_infNFe_transp_retTransp);
  RegisterChildNode('veicTransp', TXMLTVeiculo);
  RegisterChildNode('reboque', TXMLTVeiculo);
  RegisterChildNode('vol', TXMLTNFe_infNFe_transp_vol);
  FReboque := CreateCollection(TXMLTVeiculoList, IXMLTVeiculo, 'reboque') as IXMLTVeiculoList;
  FVol := CreateCollection(TXMLTNFe_infNFe_transp_volList, IXMLTNFe_infNFe_transp_vol, 'vol') as IXMLTNFe_infNFe_transp_volList;
  inherited;
end;

function TXMLTNFe_infNFe_transp.Get_ModFrete: UnicodeString;
begin
  Result := ChildNodes['modFrete'].Text;
end;

procedure TXMLTNFe_infNFe_transp.Set_ModFrete(Value: UnicodeString);
begin
  ChildNodes['modFrete'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp.Get_Transporta: IXMLTNFe_infNFe_transp_transporta;
begin
  Result := ChildNodes['transporta'] as IXMLTNFe_infNFe_transp_transporta;
end;

function TXMLTNFe_infNFe_transp.Get_RetTransp: IXMLTNFe_infNFe_transp_retTransp;
begin
  Result := ChildNodes['retTransp'] as IXMLTNFe_infNFe_transp_retTransp;
end;

function TXMLTNFe_infNFe_transp.Get_VeicTransp: IXMLTVeiculo;
begin
  Result := ChildNodes['veicTransp'] as IXMLTVeiculo;
end;

function TXMLTNFe_infNFe_transp.Get_Reboque: IXMLTVeiculoList;
begin
  Result := FReboque;
end;

function TXMLTNFe_infNFe_transp.Get_Vagao: UnicodeString;
begin
  Result := ChildNodes['vagao'].Text;
end;

procedure TXMLTNFe_infNFe_transp.Set_Vagao(Value: UnicodeString);
begin
  ChildNodes['vagao'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp.Get_Balsa: UnicodeString;
begin
  Result := ChildNodes['balsa'].Text;
end;

procedure TXMLTNFe_infNFe_transp.Set_Balsa(Value: UnicodeString);
begin
  ChildNodes['balsa'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp.Get_Vol: IXMLTNFe_infNFe_transp_volList;
begin
  Result := FVol;
end;

{ TXMLTNFe_infNFe_transp_transporta }

function TXMLTNFe_infNFe_transp_transporta.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_transporta.Get_CPF: UnicodeString;
begin
  Result := ChildNodes['CPF'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_CPF(Value: UnicodeString);
begin
  ChildNodes['CPF'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_transporta.Get_XNome: UnicodeString;
begin
  Result := ChildNodes['xNome'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_XNome(Value: UnicodeString);
begin
  ChildNodes['xNome'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_transporta.Get_IE: UnicodeString;
begin
  Result := ChildNodes['IE'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_IE(Value: UnicodeString);
begin
  ChildNodes['IE'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_transporta.Get_XEnder: UnicodeString;
begin
  Result := ChildNodes['xEnder'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_XEnder(Value: UnicodeString);
begin
  ChildNodes['xEnder'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_transporta.Get_XMun: UnicodeString;
begin
  Result := ChildNodes['xMun'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_XMun(Value: UnicodeString);
begin
  ChildNodes['xMun'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_transporta.Get_UF: UnicodeString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTNFe_infNFe_transp_transporta.Set_UF(Value: UnicodeString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_transp_retTransp }

function TXMLTNFe_infNFe_transp_retTransp.Get_VServ: UnicodeString;
begin
  Result := ChildNodes['vServ'].Text;
end;

procedure TXMLTNFe_infNFe_transp_retTransp.Set_VServ(Value: UnicodeString);
begin
  ChildNodes['vServ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_retTransp.Get_VBCRet: UnicodeString;
begin
  Result := ChildNodes['vBCRet'].Text;
end;

procedure TXMLTNFe_infNFe_transp_retTransp.Set_VBCRet(Value: UnicodeString);
begin
  ChildNodes['vBCRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_retTransp.Get_PICMSRet: UnicodeString;
begin
  Result := ChildNodes['pICMSRet'].Text;
end;

procedure TXMLTNFe_infNFe_transp_retTransp.Set_PICMSRet(Value: UnicodeString);
begin
  ChildNodes['pICMSRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_retTransp.Get_VICMSRet: UnicodeString;
begin
  Result := ChildNodes['vICMSRet'].Text;
end;

procedure TXMLTNFe_infNFe_transp_retTransp.Set_VICMSRet(Value: UnicodeString);
begin
  ChildNodes['vICMSRet'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_retTransp.Get_CFOP: UnicodeString;
begin
  Result := ChildNodes['CFOP'].Text;
end;

procedure TXMLTNFe_infNFe_transp_retTransp.Set_CFOP(Value: UnicodeString);
begin
  ChildNodes['CFOP'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_retTransp.Get_CMunFG: UnicodeString;
begin
  Result := ChildNodes['cMunFG'].Text;
end;

procedure TXMLTNFe_infNFe_transp_retTransp.Set_CMunFG(Value: UnicodeString);
begin
  ChildNodes['cMunFG'].NodeValue := Value;
end;

{ TXMLTVeiculo }

function TXMLTVeiculo.Get_Placa: UnicodeString;
begin
  Result := ChildNodes['placa'].Text;
end;

procedure TXMLTVeiculo.Set_Placa(Value: UnicodeString);
begin
  ChildNodes['placa'].NodeValue := Value;
end;

function TXMLTVeiculo.Get_UF: UnicodeString;
begin
  Result := ChildNodes['UF'].Text;
end;

procedure TXMLTVeiculo.Set_UF(Value: UnicodeString);
begin
  ChildNodes['UF'].NodeValue := Value;
end;

function TXMLTVeiculo.Get_RNTC: UnicodeString;
begin
  Result := ChildNodes['RNTC'].Text;
end;

procedure TXMLTVeiculo.Set_RNTC(Value: UnicodeString);
begin
  ChildNodes['RNTC'].NodeValue := Value;
end;

{ TXMLTVeiculoList }

function TXMLTVeiculoList.Add: IXMLTVeiculo;
begin
  Result := AddItem(-1) as IXMLTVeiculo;
end;

function TXMLTVeiculoList.Insert(const Index: Integer): IXMLTVeiculo;
begin
  Result := AddItem(Index) as IXMLTVeiculo;
end;

function TXMLTVeiculoList.Get_Item(Index: Integer): IXMLTVeiculo;
begin
  Result := List[Index] as IXMLTVeiculo;
end;

{ TXMLTNFe_infNFe_transp_vol }

procedure TXMLTNFe_infNFe_transp_vol.AfterConstruction;
begin
  RegisterChildNode('lacres', TXMLTNFe_infNFe_transp_vol_lacres);
  FLacres := CreateCollection(TXMLTNFe_infNFe_transp_vol_lacresList, IXMLTNFe_infNFe_transp_vol_lacres, 'lacres') as IXMLTNFe_infNFe_transp_vol_lacresList;
  inherited;
end;

function TXMLTNFe_infNFe_transp_vol.Get_QVol: UnicodeString;
begin
  Result := ChildNodes['qVol'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol.Set_QVol(Value: UnicodeString);
begin
  ChildNodes['qVol'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_vol.Get_Esp: UnicodeString;
begin
  Result := ChildNodes['esp'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol.Set_Esp(Value: UnicodeString);
begin
  ChildNodes['esp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_vol.Get_Marca: UnicodeString;
begin
  Result := ChildNodes['marca'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol.Set_Marca(Value: UnicodeString);
begin
  ChildNodes['marca'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_vol.Get_NVol: UnicodeString;
begin
  Result := ChildNodes['nVol'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol.Set_NVol(Value: UnicodeString);
begin
  ChildNodes['nVol'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_vol.Get_PesoL: UnicodeString;
begin
  Result := ChildNodes['pesoL'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol.Set_PesoL(Value: UnicodeString);
begin
  ChildNodes['pesoL'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_vol.Get_PesoB: UnicodeString;
begin
  Result := ChildNodes['pesoB'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol.Set_PesoB(Value: UnicodeString);
begin
  ChildNodes['pesoB'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_transp_vol.Get_Lacres: IXMLTNFe_infNFe_transp_vol_lacresList;
begin
  Result := FLacres;
end;

{ TXMLTNFe_infNFe_transp_volList }

function TXMLTNFe_infNFe_transp_volList.Add: IXMLTNFe_infNFe_transp_vol;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_transp_vol;
end;

function TXMLTNFe_infNFe_transp_volList.Insert(const Index: Integer): IXMLTNFe_infNFe_transp_vol;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_transp_vol;
end;

function TXMLTNFe_infNFe_transp_volList.Get_Item(Index: Integer): IXMLTNFe_infNFe_transp_vol;
begin
  Result := List[Index] as IXMLTNFe_infNFe_transp_vol;
end;

{ TXMLTNFe_infNFe_transp_vol_lacres }

function TXMLTNFe_infNFe_transp_vol_lacres.Get_NLacre: UnicodeString;
begin
  Result := ChildNodes['nLacre'].Text;
end;

procedure TXMLTNFe_infNFe_transp_vol_lacres.Set_NLacre(Value: UnicodeString);
begin
  ChildNodes['nLacre'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_transp_vol_lacresList }

function TXMLTNFe_infNFe_transp_vol_lacresList.Add: IXMLTNFe_infNFe_transp_vol_lacres;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_transp_vol_lacres;
end;

function TXMLTNFe_infNFe_transp_vol_lacresList.Insert(const Index: Integer): IXMLTNFe_infNFe_transp_vol_lacres;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_transp_vol_lacres;
end;

function TXMLTNFe_infNFe_transp_vol_lacresList.Get_Item(Index: Integer): IXMLTNFe_infNFe_transp_vol_lacres;
begin
  Result := List[Index] as IXMLTNFe_infNFe_transp_vol_lacres;
end;

{ TXMLTNFe_infNFe_cobr }

procedure TXMLTNFe_infNFe_cobr.AfterConstruction;
begin
  RegisterChildNode('fat', TXMLTNFe_infNFe_cobr_fat);
  RegisterChildNode('dup', TXMLTNFe_infNFe_cobr_dup);
  FDup := CreateCollection(TXMLTNFe_infNFe_cobr_dupList, IXMLTNFe_infNFe_cobr_dup, 'dup') as IXMLTNFe_infNFe_cobr_dupList;
  inherited;
end;

function TXMLTNFe_infNFe_cobr.Get_Fat: IXMLTNFe_infNFe_cobr_fat;
begin
  Result := ChildNodes['fat'] as IXMLTNFe_infNFe_cobr_fat;
end;

function TXMLTNFe_infNFe_cobr.Get_Dup: IXMLTNFe_infNFe_cobr_dupList;
begin
  Result := FDup;
end;

{ TXMLTNFe_infNFe_cobr_fat }

function TXMLTNFe_infNFe_cobr_fat.Get_NFat: UnicodeString;
begin
  Result := ChildNodes['nFat'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_fat.Set_NFat(Value: UnicodeString);
begin
  ChildNodes['nFat'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cobr_fat.Get_VOrig: UnicodeString;
begin
  Result := ChildNodes['vOrig'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_fat.Set_VOrig(Value: UnicodeString);
begin
  ChildNodes['vOrig'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cobr_fat.Get_VDesc: UnicodeString;
begin
  Result := ChildNodes['vDesc'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_fat.Set_VDesc(Value: UnicodeString);
begin
  ChildNodes['vDesc'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cobr_fat.Get_VLiq: UnicodeString;
begin
  Result := ChildNodes['vLiq'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_fat.Set_VLiq(Value: UnicodeString);
begin
  ChildNodes['vLiq'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_cobr_dup }

function TXMLTNFe_infNFe_cobr_dup.Get_NDup: UnicodeString;
begin
  Result := ChildNodes['nDup'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_dup.Set_NDup(Value: UnicodeString);
begin
  ChildNodes['nDup'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cobr_dup.Get_DVenc: UnicodeString;
begin
  Result := ChildNodes['dVenc'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_dup.Set_DVenc(Value: UnicodeString);
begin
  ChildNodes['dVenc'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cobr_dup.Get_VDup: UnicodeString;
begin
  Result := ChildNodes['vDup'].Text;
end;

procedure TXMLTNFe_infNFe_cobr_dup.Set_VDup(Value: UnicodeString);
begin
  ChildNodes['vDup'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_cobr_dupList }

function TXMLTNFe_infNFe_cobr_dupList.Add: IXMLTNFe_infNFe_cobr_dup;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_cobr_dup;
end;

function TXMLTNFe_infNFe_cobr_dupList.Insert(const Index: Integer): IXMLTNFe_infNFe_cobr_dup;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_cobr_dup;
end;

function TXMLTNFe_infNFe_cobr_dupList.Get_Item(Index: Integer): IXMLTNFe_infNFe_cobr_dup;
begin
  Result := List[Index] as IXMLTNFe_infNFe_cobr_dup;
end;

{ TXMLTNFe_infNFe_pag }

procedure TXMLTNFe_infNFe_pag.AfterConstruction;
begin
  RegisterChildNode('detPag', TXMLTNFe_infNFe_pag_detPag);
  FDetPag := CreateCollection(TXMLTNFe_infNFe_pag_detPagList, IXMLTNFe_infNFe_pag_detPag, 'detPag') as IXMLTNFe_infNFe_pag_detPagList;
  inherited;
end;

function TXMLTNFe_infNFe_pag.Get_DetPag: IXMLTNFe_infNFe_pag_detPagList;
begin
  Result := FDetPag;
end;

function TXMLTNFe_infNFe_pag.Get_VTroco: UnicodeString;
begin
  Result := ChildNodes['vTroco'].Text;
end;

procedure TXMLTNFe_infNFe_pag.Set_VTroco(Value: UnicodeString);
begin
  ChildNodes['vTroco'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_pag_detPag }

procedure TXMLTNFe_infNFe_pag_detPag.AfterConstruction;
begin
  RegisterChildNode('card', TXMLTNFe_infNFe_pag_detPag_card);
  inherited;
end;

function TXMLTNFe_infNFe_pag_detPag.Get_IndPag: UnicodeString;
begin
  Result := ChildNodes['indPag'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag.Set_IndPag(Value: UnicodeString);
begin
  ChildNodes['indPag'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_pag_detPag.Get_TPag: UnicodeString;
begin
  Result := ChildNodes['tPag'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag.Set_TPag(Value: UnicodeString);
begin
  ChildNodes['tPag'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_pag_detPag.Get_VPag: UnicodeString;
begin
  Result := ChildNodes['vPag'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag.Set_VPag(Value: UnicodeString);
begin
  ChildNodes['vPag'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_pag_detPag.Get_Card: IXMLTNFe_infNFe_pag_detPag_card;
begin
  Result := ChildNodes['card'] as IXMLTNFe_infNFe_pag_detPag_card;
end;

{ TXMLTNFe_infNFe_pag_detPagList }

function TXMLTNFe_infNFe_pag_detPagList.Add: IXMLTNFe_infNFe_pag_detPag;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_pag_detPag;
end;

function TXMLTNFe_infNFe_pag_detPagList.Insert(const Index: Integer): IXMLTNFe_infNFe_pag_detPag;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_pag_detPag;
end;

function TXMLTNFe_infNFe_pag_detPagList.Get_Item(Index: Integer): IXMLTNFe_infNFe_pag_detPag;
begin
  Result := List[Index] as IXMLTNFe_infNFe_pag_detPag;
end;

{ TXMLTNFe_infNFe_pag_detPag_card }

function TXMLTNFe_infNFe_pag_detPag_card.Get_TpIntegra: UnicodeString;
begin
  Result := ChildNodes['tpIntegra'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag_card.Set_TpIntegra(Value: UnicodeString);
begin
  ChildNodes['tpIntegra'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_pag_detPag_card.Get_CNPJ: UnicodeString;
begin
  Result := ChildNodes['CNPJ'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag_card.Set_CNPJ(Value: UnicodeString);
begin
  ChildNodes['CNPJ'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_pag_detPag_card.Get_TBand: UnicodeString;
begin
  Result := ChildNodes['tBand'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag_card.Set_TBand(Value: UnicodeString);
begin
  ChildNodes['tBand'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_pag_detPag_card.Get_CAut: UnicodeString;
begin
  Result := ChildNodes['cAut'].Text;
end;

procedure TXMLTNFe_infNFe_pag_detPag_card.Set_CAut(Value: UnicodeString);
begin
  ChildNodes['cAut'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_infAdic }

procedure TXMLTNFe_infNFe_infAdic.AfterConstruction;
begin
  RegisterChildNode('obsCont', TXMLTNFe_infNFe_infAdic_obsCont);
  RegisterChildNode('obsFisco', TXMLTNFe_infNFe_infAdic_obsFisco);
  RegisterChildNode('procRef', TXMLTNFe_infNFe_infAdic_procRef);
  FObsCont := CreateCollection(TXMLTNFe_infNFe_infAdic_obsContList, IXMLTNFe_infNFe_infAdic_obsCont, 'obsCont') as IXMLTNFe_infNFe_infAdic_obsContList;
  FObsFisco := CreateCollection(TXMLTNFe_infNFe_infAdic_obsFiscoList, IXMLTNFe_infNFe_infAdic_obsFisco, 'obsFisco') as IXMLTNFe_infNFe_infAdic_obsFiscoList;
  FProcRef := CreateCollection(TXMLTNFe_infNFe_infAdic_procRefList, IXMLTNFe_infNFe_infAdic_procRef, 'procRef') as IXMLTNFe_infNFe_infAdic_procRefList;
  inherited;
end;

function TXMLTNFe_infNFe_infAdic.Get_InfAdFisco: UnicodeString;
begin
  Result := ChildNodes['infAdFisco'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic.Set_InfAdFisco(Value: UnicodeString);
begin
  ChildNodes['infAdFisco'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_infAdic.Get_InfCpl: UnicodeString;
begin
  Result := ChildNodes['infCpl'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic.Set_InfCpl(Value: UnicodeString);
begin
  ChildNodes['infCpl'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_infAdic.Get_ObsCont: IXMLTNFe_infNFe_infAdic_obsContList;
begin
  Result := FObsCont;
end;

function TXMLTNFe_infNFe_infAdic.Get_ObsFisco: IXMLTNFe_infNFe_infAdic_obsFiscoList;
begin
  Result := FObsFisco;
end;

function TXMLTNFe_infNFe_infAdic.Get_ProcRef: IXMLTNFe_infNFe_infAdic_procRefList;
begin
  Result := FProcRef;
end;

{ TXMLTNFe_infNFe_infAdic_obsCont }

function TXMLTNFe_infNFe_infAdic_obsCont.Get_XCampo: UnicodeString;
begin
  Result := AttributeNodes['xCampo'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic_obsCont.Set_XCampo(Value: UnicodeString);
begin
  SetAttribute('xCampo', Value);
end;

function TXMLTNFe_infNFe_infAdic_obsCont.Get_XTexto: UnicodeString;
begin
  Result := ChildNodes['xTexto'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic_obsCont.Set_XTexto(Value: UnicodeString);
begin
  ChildNodes['xTexto'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_infAdic_obsContList }

function TXMLTNFe_infNFe_infAdic_obsContList.Add: IXMLTNFe_infNFe_infAdic_obsCont;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_infAdic_obsCont;
end;

function TXMLTNFe_infNFe_infAdic_obsContList.Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_obsCont;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_infAdic_obsCont;
end;

function TXMLTNFe_infNFe_infAdic_obsContList.Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_obsCont;
begin
  Result := List[Index] as IXMLTNFe_infNFe_infAdic_obsCont;
end;

{ TXMLTNFe_infNFe_infAdic_obsFisco }

function TXMLTNFe_infNFe_infAdic_obsFisco.Get_XCampo: UnicodeString;
begin
  Result := AttributeNodes['xCampo'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic_obsFisco.Set_XCampo(Value: UnicodeString);
begin
  SetAttribute('xCampo', Value);
end;

function TXMLTNFe_infNFe_infAdic_obsFisco.Get_XTexto: UnicodeString;
begin
  Result := ChildNodes['xTexto'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic_obsFisco.Set_XTexto(Value: UnicodeString);
begin
  ChildNodes['xTexto'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_infAdic_obsFiscoList }

function TXMLTNFe_infNFe_infAdic_obsFiscoList.Add: IXMLTNFe_infNFe_infAdic_obsFisco;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_infAdic_obsFisco;
end;

function TXMLTNFe_infNFe_infAdic_obsFiscoList.Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_obsFisco;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_infAdic_obsFisco;
end;

function TXMLTNFe_infNFe_infAdic_obsFiscoList.Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_obsFisco;
begin
  Result := List[Index] as IXMLTNFe_infNFe_infAdic_obsFisco;
end;

{ TXMLTNFe_infNFe_infAdic_procRef }

function TXMLTNFe_infNFe_infAdic_procRef.Get_NProc: UnicodeString;
begin
  Result := ChildNodes['nProc'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic_procRef.Set_NProc(Value: UnicodeString);
begin
  ChildNodes['nProc'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_infAdic_procRef.Get_IndProc: UnicodeString;
begin
  Result := ChildNodes['indProc'].Text;
end;

procedure TXMLTNFe_infNFe_infAdic_procRef.Set_IndProc(Value: UnicodeString);
begin
  ChildNodes['indProc'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_infAdic_procRefList }

function TXMLTNFe_infNFe_infAdic_procRefList.Add: IXMLTNFe_infNFe_infAdic_procRef;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_infAdic_procRef;
end;

function TXMLTNFe_infNFe_infAdic_procRefList.Insert(const Index: Integer): IXMLTNFe_infNFe_infAdic_procRef;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_infAdic_procRef;
end;

function TXMLTNFe_infNFe_infAdic_procRefList.Get_Item(Index: Integer): IXMLTNFe_infNFe_infAdic_procRef;
begin
  Result := List[Index] as IXMLTNFe_infNFe_infAdic_procRef;
end;

{ TXMLTNFe_infNFe_exporta }

function TXMLTNFe_infNFe_exporta.Get_UFSaidaPais: UnicodeString;
begin
  Result := ChildNodes['UFSaidaPais'].Text;
end;

procedure TXMLTNFe_infNFe_exporta.Set_UFSaidaPais(Value: UnicodeString);
begin
  ChildNodes['UFSaidaPais'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_exporta.Get_XLocExporta: UnicodeString;
begin
  Result := ChildNodes['xLocExporta'].Text;
end;

procedure TXMLTNFe_infNFe_exporta.Set_XLocExporta(Value: UnicodeString);
begin
  ChildNodes['xLocExporta'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_exporta.Get_XLocDespacho: UnicodeString;
begin
  Result := ChildNodes['xLocDespacho'].Text;
end;

procedure TXMLTNFe_infNFe_exporta.Set_XLocDespacho(Value: UnicodeString);
begin
  ChildNodes['xLocDespacho'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_compra }

function TXMLTNFe_infNFe_compra.Get_XNEmp: UnicodeString;
begin
  Result := ChildNodes['xNEmp'].Text;
end;

procedure TXMLTNFe_infNFe_compra.Set_XNEmp(Value: UnicodeString);
begin
  ChildNodes['xNEmp'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_compra.Get_XPed: UnicodeString;
begin
  Result := ChildNodes['xPed'].Text;
end;

procedure TXMLTNFe_infNFe_compra.Set_XPed(Value: UnicodeString);
begin
  ChildNodes['xPed'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_compra.Get_XCont: UnicodeString;
begin
  Result := ChildNodes['xCont'].Text;
end;

procedure TXMLTNFe_infNFe_compra.Set_XCont(Value: UnicodeString);
begin
  ChildNodes['xCont'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_cana }

procedure TXMLTNFe_infNFe_cana.AfterConstruction;
begin
  RegisterChildNode('forDia', TXMLTNFe_infNFe_cana_forDia);
  RegisterChildNode('deduc', TXMLTNFe_infNFe_cana_deduc);
  FForDia := CreateCollection(TXMLTNFe_infNFe_cana_forDiaList, IXMLTNFe_infNFe_cana_forDia, 'forDia') as IXMLTNFe_infNFe_cana_forDiaList;
  FDeduc := CreateCollection(TXMLTNFe_infNFe_cana_deducList, IXMLTNFe_infNFe_cana_deduc, 'deduc') as IXMLTNFe_infNFe_cana_deducList;
  inherited;
end;

function TXMLTNFe_infNFe_cana.Get_Safra: UnicodeString;
begin
  Result := ChildNodes['safra'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_Safra(Value: UnicodeString);
begin
  ChildNodes['safra'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_Ref: UnicodeString;
begin
  Result := ChildNodes['ref'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_Ref(Value: UnicodeString);
begin
  ChildNodes['ref'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_ForDia: IXMLTNFe_infNFe_cana_forDiaList;
begin
  Result := FForDia;
end;

function TXMLTNFe_infNFe_cana.Get_QTotMes: UnicodeString;
begin
  Result := ChildNodes['qTotMes'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_QTotMes(Value: UnicodeString);
begin
  ChildNodes['qTotMes'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_QTotAnt: UnicodeString;
begin
  Result := ChildNodes['qTotAnt'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_QTotAnt(Value: UnicodeString);
begin
  ChildNodes['qTotAnt'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_QTotGer: UnicodeString;
begin
  Result := ChildNodes['qTotGer'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_QTotGer(Value: UnicodeString);
begin
  ChildNodes['qTotGer'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_Deduc: IXMLTNFe_infNFe_cana_deducList;
begin
  Result := FDeduc;
end;

function TXMLTNFe_infNFe_cana.Get_VFor: UnicodeString;
begin
  Result := ChildNodes['vFor'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_VFor(Value: UnicodeString);
begin
  ChildNodes['vFor'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_VTotDed: UnicodeString;
begin
  Result := ChildNodes['vTotDed'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_VTotDed(Value: UnicodeString);
begin
  ChildNodes['vTotDed'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana.Get_VLiqFor: UnicodeString;
begin
  Result := ChildNodes['vLiqFor'].Text;
end;

procedure TXMLTNFe_infNFe_cana.Set_VLiqFor(Value: UnicodeString);
begin
  ChildNodes['vLiqFor'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_cana_forDia }

function TXMLTNFe_infNFe_cana_forDia.Get_Dia: UnicodeString;
begin
  Result := AttributeNodes['dia'].Text;
end;

procedure TXMLTNFe_infNFe_cana_forDia.Set_Dia(Value: UnicodeString);
begin
  SetAttribute('dia', Value);
end;

function TXMLTNFe_infNFe_cana_forDia.Get_Qtde: UnicodeString;
begin
  Result := ChildNodes['qtde'].Text;
end;

procedure TXMLTNFe_infNFe_cana_forDia.Set_Qtde(Value: UnicodeString);
begin
  ChildNodes['qtde'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_cana_forDiaList }

function TXMLTNFe_infNFe_cana_forDiaList.Add: IXMLTNFe_infNFe_cana_forDia;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_cana_forDia;
end;

function TXMLTNFe_infNFe_cana_forDiaList.Insert(const Index: Integer): IXMLTNFe_infNFe_cana_forDia;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_cana_forDia;
end;

function TXMLTNFe_infNFe_cana_forDiaList.Get_Item(Index: Integer): IXMLTNFe_infNFe_cana_forDia;
begin
  Result := List[Index] as IXMLTNFe_infNFe_cana_forDia;
end;

{ TXMLTNFe_infNFe_cana_deduc }

function TXMLTNFe_infNFe_cana_deduc.Get_XDed: UnicodeString;
begin
  Result := ChildNodes['xDed'].Text;
end;

procedure TXMLTNFe_infNFe_cana_deduc.Set_XDed(Value: UnicodeString);
begin
  ChildNodes['xDed'].NodeValue := Value;
end;

function TXMLTNFe_infNFe_cana_deduc.Get_VDed: UnicodeString;
begin
  Result := ChildNodes['vDed'].Text;
end;

procedure TXMLTNFe_infNFe_cana_deduc.Set_VDed(Value: UnicodeString);
begin
  ChildNodes['vDed'].NodeValue := Value;
end;

{ TXMLTNFe_infNFe_cana_deducList }

function TXMLTNFe_infNFe_cana_deducList.Add: IXMLTNFe_infNFe_cana_deduc;
begin
  Result := AddItem(-1) as IXMLTNFe_infNFe_cana_deduc;
end;

function TXMLTNFe_infNFe_cana_deducList.Insert(const Index: Integer): IXMLTNFe_infNFe_cana_deduc;
begin
  Result := AddItem(Index) as IXMLTNFe_infNFe_cana_deduc;
end;

function TXMLTNFe_infNFe_cana_deducList.Get_Item(Index: Integer): IXMLTNFe_infNFe_cana_deduc;
begin
  Result := List[Index] as IXMLTNFe_infNFe_cana_deduc;
end;

{ TXMLTNFe_infNFeSupl }

function TXMLTNFe_infNFeSupl.Get_QrCode: UnicodeString;
begin
  Result := ChildNodes['qrCode'].Text;
end;

procedure TXMLTNFe_infNFeSupl.Set_QrCode(Value: UnicodeString);
begin
  ChildNodes['qrCode'].NodeValue := Value;
end;

function TXMLTNFe_infNFeSupl.Get_UrlChave: UnicodeString;
begin
  Result := ChildNodes['urlChave'].Text;
end;

procedure TXMLTNFe_infNFeSupl.Set_UrlChave(Value: UnicodeString);
begin
  ChildNodes['urlChave'].NodeValue := Value;
end;

{ TXMLSignatureType_ds }

procedure TXMLSignatureType_ds.AfterConstruction;
begin
  RegisterChildNode('SignedInfo', TXMLSignedInfoType_ds);
  RegisterChildNode('SignatureValue', TXMLSignatureValueType_ds);
  RegisterChildNode('KeyInfo', TXMLKeyInfoType_ds);
  inherited;
end;

function TXMLSignatureType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignatureType_ds.Get_SignedInfo: IXMLSignedInfoType_ds;
begin
  Result := ChildNodes['SignedInfo'] as IXMLSignedInfoType_ds;
end;

function TXMLSignatureType_ds.Get_SignatureValue: IXMLSignatureValueType_ds;
begin
  Result := ChildNodes['SignatureValue'] as IXMLSignatureValueType_ds;
end;

function TXMLSignatureType_ds.Get_KeyInfo: IXMLKeyInfoType_ds;
begin
  Result := ChildNodes['KeyInfo'] as IXMLKeyInfoType_ds;
end;

{ TXMLSignedInfoType_ds }

procedure TXMLSignedInfoType_ds.AfterConstruction;
begin
  RegisterChildNode('CanonicalizationMethod', TXMLCanonicalizationMethod_ds);
  RegisterChildNode('SignatureMethod', TXMLSignatureMethod_ds);
  RegisterChildNode('Reference', TXMLReferenceType_ds);
  inherited;
end;

function TXMLSignedInfoType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignedInfoType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignedInfoType_ds.Get_CanonicalizationMethod: IXMLCanonicalizationMethod_ds;
begin
  Result := ChildNodes['CanonicalizationMethod'] as IXMLCanonicalizationMethod_ds;
end;

function TXMLSignedInfoType_ds.Get_SignatureMethod: IXMLSignatureMethod_ds;
begin
  Result := ChildNodes['SignatureMethod'] as IXMLSignatureMethod_ds;
end;

function TXMLSignedInfoType_ds.Get_Reference: IXMLReferenceType_ds;
begin
  Result := ChildNodes['Reference'] as IXMLReferenceType_ds;
end;

{ TXMLCanonicalizationMethod_ds }

function TXMLCanonicalizationMethod_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLCanonicalizationMethod_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureMethod_ds }

function TXMLSignatureMethod_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLSignatureMethod_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLReferenceType_ds }

procedure TXMLReferenceType_ds.AfterConstruction;
begin
  RegisterChildNode('Transforms', TXMLTransformsType_ds);
  RegisterChildNode('DigestMethod', TXMLDigestMethod_ds);
  inherited;
end;

function TXMLReferenceType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLReferenceType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLReferenceType_ds.Get_URI: UnicodeString;
begin
  Result := AttributeNodes['URI'].Text;
end;

procedure TXMLReferenceType_ds.Set_URI(Value: UnicodeString);
begin
  SetAttribute('URI', Value);
end;

function TXMLReferenceType_ds.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLReferenceType_ds.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLReferenceType_ds.Get_Transforms: IXMLTransformsType_ds;
begin
  Result := ChildNodes['Transforms'] as IXMLTransformsType_ds;
end;

function TXMLReferenceType_ds.Get_DigestMethod: IXMLDigestMethod_ds;
begin
  Result := ChildNodes['DigestMethod'] as IXMLDigestMethod_ds;
end;

function TXMLReferenceType_ds.Get_DigestValue: UnicodeString;
begin
  Result := ChildNodes['DigestValue'].Text;
end;

procedure TXMLReferenceType_ds.Set_DigestValue(Value: UnicodeString);
begin
  ChildNodes['DigestValue'].NodeValue := Value;
end;

{ TXMLTransformsType_ds }

procedure TXMLTransformsType_ds.AfterConstruction;
begin
  RegisterChildNode('Transform', TXMLTransformType_ds);
  ItemTag := 'Transform';
  ItemInterface := IXMLTransformType_ds;
  inherited;
end;

function TXMLTransformsType_ds.Get_Transform(Index: Integer): IXMLTransformType_ds;
begin
  Result := List[Index] as IXMLTransformType_ds;
end;

function TXMLTransformsType_ds.Add: IXMLTransformType_ds;
begin
  Result := AddItem(-1) as IXMLTransformType_ds;
end;

function TXMLTransformsType_ds.Insert(const Index: Integer): IXMLTransformType_ds;
begin
  Result := AddItem(Index) as IXMLTransformType_ds;
end;

{ TXMLTransformType_ds }

procedure TXMLTransformType_ds.AfterConstruction;
begin
  ItemTag := 'XPath';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLTransformType_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLTransformType_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

function TXMLTransformType_ds.Get_XPath(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLTransformType_ds.Add(const XPath: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := XPath;
end;

function TXMLTransformType_ds.Insert(const Index: Integer; const XPath: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := XPath;
end;

{ TXMLDigestMethod_ds }

function TXMLDigestMethod_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLDigestMethod_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureValueType_ds }

function TXMLSignatureValueType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureValueType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

{ TXMLKeyInfoType_ds }

procedure TXMLKeyInfoType_ds.AfterConstruction;
begin
  RegisterChildNode('X509Data', TXMLX509DataType_ds);
  inherited;
end;

function TXMLKeyInfoType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLKeyInfoType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLKeyInfoType_ds.Get_X509Data: IXMLX509DataType_ds;
begin
  Result := ChildNodes['X509Data'] as IXMLX509DataType_ds;
end;

{ TXMLX509DataType_ds }

function TXMLX509DataType_ds.Get_X509Certificate: UnicodeString;
begin
  Result := ChildNodes['X509Certificate'].Text;
end;

procedure TXMLX509DataType_ds.Set_X509Certificate(Value: UnicodeString);
begin
  ChildNodes['X509Certificate'].NodeValue := Value;
end;

{ TXMLTProtNFe }

procedure TXMLTProtNFe.AfterConstruction;
begin
  RegisterChildNode('infProt', TXMLTProtNFe_infProt);
  RegisterChildNode('Signature', TXMLSignatureType_ds);
  inherited;
end;

function TXMLTProtNFe.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTProtNFe.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTProtNFe.Get_InfProt: IXMLTProtNFe_infProt;
begin
  Result := ChildNodes['infProt'] as IXMLTProtNFe_infProt;
end;

function TXMLTProtNFe.Get_Signature: IXMLSignatureType_ds;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType_ds;
end;

{ TXMLTProtNFeList }

function TXMLTProtNFeList.Add: IXMLTProtNFe;
begin
  Result := AddItem(-1) as IXMLTProtNFe;
end;

function TXMLTProtNFeList.Insert(const Index: Integer): IXMLTProtNFe;
begin
  Result := AddItem(Index) as IXMLTProtNFe;
end;

function TXMLTProtNFeList.Get_Item(Index: Integer): IXMLTProtNFe;
begin
  Result := List[Index] as IXMLTProtNFe;
end;

{ TXMLTProtNFe_infProt }

function TXMLTProtNFe_infProt.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLTProtNFe_infProt.Get_TpAmb: UnicodeString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_TpAmb(Value: UnicodeString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_VerAplic: UnicodeString;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_VerAplic(Value: UnicodeString);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_ChNFe: UnicodeString;
begin
  Result := ChildNodes['chNFe'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_ChNFe(Value: UnicodeString);
begin
  ChildNodes['chNFe'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_DhRecbto: UnicodeString;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_DhRecbto(Value: UnicodeString);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_NProt: UnicodeString;
begin
  Result := ChildNodes['nProt'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_NProt(Value: UnicodeString);
begin
  ChildNodes['nProt'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_DigVal: UnicodeString;
begin
  Result := ChildNodes['digVal'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_DigVal(Value: UnicodeString);
begin
  ChildNodes['digVal'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_CStat: UnicodeString;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_CStat(Value: UnicodeString);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLTProtNFe_infProt.Get_XMotivo: UnicodeString;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLTProtNFe_infProt.Set_XMotivo(Value: UnicodeString);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

{ TXMLTEnviNFe }

procedure TXMLTEnviNFe.AfterConstruction;
begin
  RegisterChildNode('NFe', TXMLTNFe);
  FNFe := CreateCollection(TXMLTNFeList, IXMLTNFe, 'NFe') as IXMLTNFeList;
  inherited;
end;

function TXMLTEnviNFe.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTEnviNFe.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTEnviNFe.Get_IdLote: UnicodeString;
begin
  Result := ChildNodes['idLote'].Text;
end;

procedure TXMLTEnviNFe.Set_IdLote(Value: UnicodeString);
begin
  ChildNodes['idLote'].NodeValue := Value;
end;

function TXMLTEnviNFe.Get_IndSinc: UnicodeString;
begin
  Result := ChildNodes['indSinc'].Text;
end;

procedure TXMLTEnviNFe.Set_IndSinc(Value: UnicodeString);
begin
  ChildNodes['indSinc'].NodeValue := Value;
end;

function TXMLTEnviNFe.Get_NFe: IXMLTNFeList;
begin
  Result := FNFe;
end;

{ TXMLTRetEnviNFe }

procedure TXMLTRetEnviNFe.AfterConstruction;
begin
  RegisterChildNode('infRec', TXMLTRetEnviNFe_infRec);
  RegisterChildNode('protNFe', TXMLTProtNFe);
  inherited;
end;

function TXMLTRetEnviNFe.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTRetEnviNFe.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTRetEnviNFe.Get_TpAmb: UnicodeString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTRetEnviNFe.Set_TpAmb(Value: UnicodeString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_VerAplic: UnicodeString;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLTRetEnviNFe.Set_VerAplic(Value: UnicodeString);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_CStat: UnicodeString;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLTRetEnviNFe.Set_CStat(Value: UnicodeString);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_XMotivo: UnicodeString;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLTRetEnviNFe.Set_XMotivo(Value: UnicodeString);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_CUF: UnicodeString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTRetEnviNFe.Set_CUF(Value: UnicodeString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_DhRecbto: UnicodeString;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLTRetEnviNFe.Set_DhRecbto(Value: UnicodeString);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLTRetEnviNFe.Get_InfRec: IXMLTRetEnviNFe_infRec;
begin
  Result := ChildNodes['infRec'] as IXMLTRetEnviNFe_infRec;
end;

function TXMLTRetEnviNFe.Get_ProtNFe: IXMLTProtNFe;
begin
  Result := ChildNodes['protNFe'] as IXMLTProtNFe;
end;

{ TXMLTRetEnviNFe_infRec }

function TXMLTRetEnviNFe_infRec.Get_NRec: UnicodeString;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLTRetEnviNFe_infRec.Set_NRec(Value: UnicodeString);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

function TXMLTRetEnviNFe_infRec.Get_TMed: UnicodeString;
begin
  Result := ChildNodes['tMed'].Text;
end;

procedure TXMLTRetEnviNFe_infRec.Set_TMed(Value: UnicodeString);
begin
  ChildNodes['tMed'].NodeValue := Value;
end;

{ TXMLTConsReciNFe }

function TXMLTConsReciNFe.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTConsReciNFe.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTConsReciNFe.Get_TpAmb: UnicodeString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTConsReciNFe.Set_TpAmb(Value: UnicodeString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTConsReciNFe.Get_NRec: UnicodeString;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLTConsReciNFe.Set_NRec(Value: UnicodeString);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

{ TXMLTRetConsReciNFe }

procedure TXMLTRetConsReciNFe.AfterConstruction;
begin
  RegisterChildNode('protNFe', TXMLTProtNFe);
  FProtNFe := CreateCollection(TXMLTProtNFeList, IXMLTProtNFe, 'protNFe') as IXMLTProtNFeList;
  inherited;
end;

function TXMLTRetConsReciNFe.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTRetConsReciNFe.Get_TpAmb: UnicodeString;
begin
  Result := ChildNodes['tpAmb'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_TpAmb(Value: UnicodeString);
begin
  ChildNodes['tpAmb'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_VerAplic: UnicodeString;
begin
  Result := ChildNodes['verAplic'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_VerAplic(Value: UnicodeString);
begin
  ChildNodes['verAplic'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_NRec: UnicodeString;
begin
  Result := ChildNodes['nRec'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_NRec(Value: UnicodeString);
begin
  ChildNodes['nRec'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_CStat: UnicodeString;
begin
  Result := ChildNodes['cStat'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_CStat(Value: UnicodeString);
begin
  ChildNodes['cStat'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_XMotivo: UnicodeString;
begin
  Result := ChildNodes['xMotivo'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_XMotivo(Value: UnicodeString);
begin
  ChildNodes['xMotivo'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_CUF: UnicodeString;
begin
  Result := ChildNodes['cUF'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_CUF(Value: UnicodeString);
begin
  ChildNodes['cUF'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_DhRecbto: UnicodeString;
begin
  Result := ChildNodes['dhRecbto'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_DhRecbto(Value: UnicodeString);
begin
  ChildNodes['dhRecbto'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_CMsg: UnicodeString;
begin
  Result := ChildNodes['cMsg'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_CMsg(Value: UnicodeString);
begin
  ChildNodes['cMsg'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_XMsg: UnicodeString;
begin
  Result := ChildNodes['xMsg'].Text;
end;

procedure TXMLTRetConsReciNFe.Set_XMsg(Value: UnicodeString);
begin
  ChildNodes['xMsg'].NodeValue := Value;
end;

function TXMLTRetConsReciNFe.Get_ProtNFe: IXMLTProtNFeList;
begin
  Result := FProtNFe;
end;

{ TXMLTNfeProc }

procedure TXMLTNfeProc.AfterConstruction;
begin
  RegisterChildNode('NFe', TXMLTNFe);
  RegisterChildNode('protNFe', TXMLTProtNFe);
  inherited;
end;

function TXMLTNfeProc.Get_Versao: UnicodeString;
begin
  Result := AttributeNodes['versao'].Text;
end;

procedure TXMLTNfeProc.Set_Versao(Value: UnicodeString);
begin
  SetAttribute('versao', Value);
end;

function TXMLTNfeProc.Get_NFe: IXMLTNFe;
begin
  Result := ChildNodes['NFe'] as IXMLTNFe;
end;

function TXMLTNfeProc.Get_ProtNFe: IXMLTProtNFe;
begin
  Result := ChildNodes['protNFe'] as IXMLTProtNFe;
end;

{ TXMLTNFe_infNFe_det_prod_NVEList }

function TXMLTNFe_infNFe_det_prod_NVEList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_NVEList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLTNFe_infNFe_det_prod_NVEList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

end.