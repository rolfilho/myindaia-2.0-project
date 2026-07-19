// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (27/12/2018 10:08:56 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_CadFornecedores;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  fornecedorIncluirFornecedorIn = class;        { "http://services.senior.com.br"[GblCplx] }
  fornecedorIncluirFornecedorOut = class;       { "http://services.senior.com.br"[Lit][GblCplx] }
  fornecedorIncluirFornecedorInDadosGeraisDefinicoes = class;   { "http://services.senior.com.br"[GblCplx] }
  fornecedorIncluirFornecedorInDadosGerais = class;   { "http://services.senior.com.br"[GblCplx] }
  fornecedorIncluirFornecedorOutRetornos = class;   { "http://services.senior.com.br"[GblCplx] }

  Array_Of_fornecedorIncluirFornecedorInDadosGerais = array of fornecedorIncluirFornecedorInDadosGerais;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_fornecedorIncluirFornecedorOutRetornos = array of fornecedorIncluirFornecedorOutRetornos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes = array of fornecedorIncluirFornecedorInDadosGeraisDefinicoes;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : fornecedorIncluirFornecedorIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  fornecedorIncluirFornecedorIn = class(TRemotable)
  private
    FdadosGerais: Array_Of_fornecedorIncluirFornecedorInDadosGerais;
    FdadosGerais_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetdadosGerais(Index: Integer; const AArray_Of_fornecedorIncluirFornecedorInDadosGerais: Array_Of_fornecedorIncluirFornecedorInDadosGerais);
    function  dadosGerais_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGerais:    Array_Of_fornecedorIncluirFornecedorInDadosGerais  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGerais write SetdadosGerais stored dadosGerais_Specified;
    property flowInstanceID: string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : fornecedorIncluirFornecedorOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  fornecedorIncluirFornecedorOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fretornos: Array_Of_fornecedorIncluirFornecedorOutRetornos;
    Fretornos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setretornos(Index: Integer; const AArray_Of_fornecedorIncluirFornecedorOutRetornos: Array_Of_fornecedorIncluirFornecedorOutRetornos);
    function  retornos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property retornos:     Array_Of_fornecedorIncluirFornecedorOutRetornos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretornos write Setretornos stored retornos_Specified;
  end;



  // ************************************************************************ //
  // XML       : fornecedorIncluirFornecedorInDadosGeraisDefinicoes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  fornecedorIncluirFornecedorInDadosGeraisDefinicoes = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcifFob: string;
    FcifFob_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodCpg: string;
    FcodCpg_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodDep: string;
    FcodDep_Specified: boolean;
    FcodEdc: string;
    FcodEdc_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFav: Integer;
    FcodFav_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTpr: string;
    FcodTpr_Specified: boolean;
    FcodTra: Integer;
    FcodTra_Specified: boolean;
    FcriEdv: string;
    FcriEdv_Specified: boolean;
    FctaAad: Integer;
    FctaAad_Specified: boolean;
    FctaAux: Integer;
    FctaAux_Specified: boolean;
    FctaFcr: Integer;
    FctaFcr_Specified: boolean;
    FctaFdv: Integer;
    FctaFdv_Specified: boolean;
    FctaRcr: Integer;
    FctaRcr_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FforMon: string;
    FforMon_Specified: boolean;
    FindInd: string;
    FindInd_Specified: boolean;
    FnumCcc: string;
    FnumCcc_Specified: boolean;
    FpagDtj: Integer;
    FpagDtj_Specified: boolean;
    FpagDtm: Integer;
    FpagDtm_Specified: boolean;
    FpagJmm: string;
    FpagJmm_Specified: boolean;
    FpagMul: string;
    FpagMul_Specified: boolean;
    FpagTir: string;
    FpagTir_Specified: boolean;
    FperDs1: string;
    FperDs1_Specified: boolean;
    FperDs2: string;
    FperDs2_Specified: boolean;
    FperDs3: string;
    FperDs3_Specified: boolean;
    FperDs4: string;
    FperDs4_Specified: boolean;
    FperDs5: string;
    FperDs5_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperEmb: string;
    FperEmb_Specified: boolean;
    FperEnc: string;
    FperEnc_Specified: boolean;
    FperFre: string;
    FperFre_Specified: boolean;
    FperFun: string;
    FperFun_Specified: boolean;
    FperIne: string;
    FperIne_Specified: boolean;
    FperIns: string;
    FperIns_Specified: boolean;
    FperIrf: string;
    FperIrf_Specified: boolean;
    FperIss: string;
    FperIss_Specified: boolean;
    FperOut: string;
    FperOut_Specified: boolean;
    FperSeg: string;
    FperSeg_Specified: boolean;
    FpgtFre: string;
    FpgtFre_Specified: boolean;
    FpgtMon: string;
    FpgtMon_Specified: boolean;
    FprzEnt: Integer;
    FprzEnt_Specified: boolean;
    FqtdDcv: Integer;
    FqtdDcv_Specified: boolean;
    FrvlCfr: string;
    FrvlCfr_Specified: boolean;
    FrvlDar: string;
    FrvlDar_Specified: boolean;
    FrvlEmb: string;
    FrvlEmb_Specified: boolean;
    FrvlEnc: string;
    FrvlEnc_Specified: boolean;
    FrvlFei: string;
    FrvlFei_Specified: boolean;
    FrvlFre: string;
    FrvlFre_Specified: boolean;
    FrvlOui: string;
    FrvlOui_Specified: boolean;
    FrvlOut: string;
    FrvlOut_Specified: boolean;
    FrvlSeg: string;
    FrvlSeg_Specified: boolean;
    FrvlSei: string;
    FrvlSei_Specified: boolean;
    FseqOrm: Integer;
    FseqOrm_Specified: boolean;
    FtnsPro: string;
    FtnsPro_Specified: boolean;
    FtnsSer: string;
    FtnsSer_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcifFob(Index: Integer; const Astring: string);
    function  cifFob_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodCpg(Index: Integer; const Astring: string);
    function  codCpg_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodDep(Index: Integer; const Astring: string);
    function  codDep_Specified(Index: Integer): boolean;
    procedure SetcodEdc(Index: Integer; const Astring: string);
    function  codEdc_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFav(Index: Integer; const AInteger: Integer);
    function  codFav_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTpr(Index: Integer; const Astring: string);
    function  codTpr_Specified(Index: Integer): boolean;
    procedure SetcodTra(Index: Integer; const AInteger: Integer);
    function  codTra_Specified(Index: Integer): boolean;
    procedure SetcriEdv(Index: Integer; const Astring: string);
    function  criEdv_Specified(Index: Integer): boolean;
    procedure SetctaAad(Index: Integer; const AInteger: Integer);
    function  ctaAad_Specified(Index: Integer): boolean;
    procedure SetctaAux(Index: Integer; const AInteger: Integer);
    function  ctaAux_Specified(Index: Integer): boolean;
    procedure SetctaFcr(Index: Integer; const AInteger: Integer);
    function  ctaFcr_Specified(Index: Integer): boolean;
    procedure SetctaFdv(Index: Integer; const AInteger: Integer);
    function  ctaFdv_Specified(Index: Integer): boolean;
    procedure SetctaRcr(Index: Integer; const AInteger: Integer);
    function  ctaRcr_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetforMon(Index: Integer; const Astring: string);
    function  forMon_Specified(Index: Integer): boolean;
    procedure SetindInd(Index: Integer; const Astring: string);
    function  indInd_Specified(Index: Integer): boolean;
    procedure SetnumCcc(Index: Integer; const Astring: string);
    function  numCcc_Specified(Index: Integer): boolean;
    procedure SetpagDtj(Index: Integer; const AInteger: Integer);
    function  pagDtj_Specified(Index: Integer): boolean;
    procedure SetpagDtm(Index: Integer; const AInteger: Integer);
    function  pagDtm_Specified(Index: Integer): boolean;
    procedure SetpagJmm(Index: Integer; const Astring: string);
    function  pagJmm_Specified(Index: Integer): boolean;
    procedure SetpagMul(Index: Integer; const Astring: string);
    function  pagMul_Specified(Index: Integer): boolean;
    procedure SetpagTir(Index: Integer; const Astring: string);
    function  pagTir_Specified(Index: Integer): boolean;
    procedure SetperDs1(Index: Integer; const Astring: string);
    function  perDs1_Specified(Index: Integer): boolean;
    procedure SetperDs2(Index: Integer; const Astring: string);
    function  perDs2_Specified(Index: Integer): boolean;
    procedure SetperDs3(Index: Integer; const Astring: string);
    function  perDs3_Specified(Index: Integer): boolean;
    procedure SetperDs4(Index: Integer; const Astring: string);
    function  perDs4_Specified(Index: Integer): boolean;
    procedure SetperDs5(Index: Integer; const Astring: string);
    function  perDs5_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperEmb(Index: Integer; const Astring: string);
    function  perEmb_Specified(Index: Integer): boolean;
    procedure SetperEnc(Index: Integer; const Astring: string);
    function  perEnc_Specified(Index: Integer): boolean;
    procedure SetperFre(Index: Integer; const Astring: string);
    function  perFre_Specified(Index: Integer): boolean;
    procedure SetperFun(Index: Integer; const Astring: string);
    function  perFun_Specified(Index: Integer): boolean;
    procedure SetperIne(Index: Integer; const Astring: string);
    function  perIne_Specified(Index: Integer): boolean;
    procedure SetperIns(Index: Integer; const Astring: string);
    function  perIns_Specified(Index: Integer): boolean;
    procedure SetperIrf(Index: Integer; const Astring: string);
    function  perIrf_Specified(Index: Integer): boolean;
    procedure SetperIss(Index: Integer; const Astring: string);
    function  perIss_Specified(Index: Integer): boolean;
    procedure SetperOut(Index: Integer; const Astring: string);
    function  perOut_Specified(Index: Integer): boolean;
    procedure SetperSeg(Index: Integer; const Astring: string);
    function  perSeg_Specified(Index: Integer): boolean;
    procedure SetpgtFre(Index: Integer; const Astring: string);
    function  pgtFre_Specified(Index: Integer): boolean;
    procedure SetpgtMon(Index: Integer; const Astring: string);
    function  pgtMon_Specified(Index: Integer): boolean;
    procedure SetprzEnt(Index: Integer; const AInteger: Integer);
    function  przEnt_Specified(Index: Integer): boolean;
    procedure SetqtdDcv(Index: Integer; const AInteger: Integer);
    function  qtdDcv_Specified(Index: Integer): boolean;
    procedure SetrvlCfr(Index: Integer; const Astring: string);
    function  rvlCfr_Specified(Index: Integer): boolean;
    procedure SetrvlDar(Index: Integer; const Astring: string);
    function  rvlDar_Specified(Index: Integer): boolean;
    procedure SetrvlEmb(Index: Integer; const Astring: string);
    function  rvlEmb_Specified(Index: Integer): boolean;
    procedure SetrvlEnc(Index: Integer; const Astring: string);
    function  rvlEnc_Specified(Index: Integer): boolean;
    procedure SetrvlFei(Index: Integer; const Astring: string);
    function  rvlFei_Specified(Index: Integer): boolean;
    procedure SetrvlFre(Index: Integer; const Astring: string);
    function  rvlFre_Specified(Index: Integer): boolean;
    procedure SetrvlOui(Index: Integer; const Astring: string);
    function  rvlOui_Specified(Index: Integer): boolean;
    procedure SetrvlOut(Index: Integer; const Astring: string);
    function  rvlOut_Specified(Index: Integer): boolean;
    procedure SetrvlSeg(Index: Integer; const Astring: string);
    function  rvlSeg_Specified(Index: Integer): boolean;
    procedure SetrvlSei(Index: Integer; const Astring: string);
    function  rvlSei_Specified(Index: Integer): boolean;
    procedure SetseqOrm(Index: Integer; const AInteger: Integer);
    function  seqOrm_Specified(Index: Integer): boolean;
    procedure SettnsPro(Index: Integer; const Astring: string);
    function  tnsPro_Specified(Index: Integer): boolean;
    procedure SettnsSer(Index: Integer; const Astring: string);
    function  tnsSer_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
  published
    property antDsc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property ccbFor: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cifFob: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcifFob write SetcifFob stored cifFob_Specified;
    property codAge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCpg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCpg write SetcodCpg stored codCpg_Specified;
    property codCrp: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codDep: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodDep write SetcodDep stored codDep_Specified;
    property codEdc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEdc write SetcodEdc stored codEdc_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFav: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFav write SetcodFav stored codFav_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codPor: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTpr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpr write SetcodTpr stored codTpr_Specified;
    property codTra: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTra write SetcodTra stored codTra_Specified;
    property criEdv: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriEdv write SetcriEdv stored criEdv_Specified;
    property ctaAad: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAad write SetctaAad stored ctaAad_Specified;
    property ctaAux: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAux write SetctaAux stored ctaAux_Specified;
    property ctaFcr: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFcr write SetctaFcr stored ctaFcr_Specified;
    property ctaFdv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFdv write SetctaFdv stored ctaFdv_Specified;
    property ctaRcr: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRcr write SetctaRcr stored ctaRcr_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property forMon: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforMon write SetforMon stored forMon_Specified;
    property indInd: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindInd write SetindInd stored indInd_Specified;
    property numCcc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCcc write SetnumCcc stored numCcc_Specified;
    property pagDtj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpagDtj write SetpagDtj stored pagDtj_Specified;
    property pagDtm: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpagDtm write SetpagDtm stored pagDtm_Specified;
    property pagJmm: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpagJmm write SetpagJmm stored pagJmm_Specified;
    property pagMul: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpagMul write SetpagMul stored pagMul_Specified;
    property pagTir: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpagTir write SetpagTir stored pagTir_Specified;
    property perDs1: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs1 write SetperDs1 stored perDs1_Specified;
    property perDs2: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs2 write SetperDs2 stored perDs2_Specified;
    property perDs3: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs3 write SetperDs3 stored perDs3_Specified;
    property perDs4: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs4 write SetperDs4 stored perDs4_Specified;
    property perDs5: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs5 write SetperDs5 stored perDs5_Specified;
    property perDsc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perEmb: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEmb write SetperEmb stored perEmb_Specified;
    property perEnc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEnc write SetperEnc stored perEnc_Specified;
    property perFre: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFre write SetperFre stored perFre_Specified;
    property perFun: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFun write SetperFun stored perFun_Specified;
    property perIne: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIne write SetperIne stored perIne_Specified;
    property perIns: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIns write SetperIns stored perIns_Specified;
    property perIrf: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIrf write SetperIrf stored perIrf_Specified;
    property perIss: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIss write SetperIss stored perIss_Specified;
    property perOut: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOut write SetperOut stored perOut_Specified;
    property perSeg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperSeg write SetperSeg stored perSeg_Specified;
    property pgtFre: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtFre write SetpgtFre stored pgtFre_Specified;
    property pgtMon: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtMon write SetpgtMon stored pgtMon_Specified;
    property przEnt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprzEnt write SetprzEnt stored przEnt_Specified;
    property qtdDcv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDcv write SetqtdDcv stored qtdDcv_Specified;
    property rvlCfr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlCfr write SetrvlCfr stored rvlCfr_Specified;
    property rvlDar: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlDar write SetrvlDar stored rvlDar_Specified;
    property rvlEmb: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlEmb write SetrvlEmb stored rvlEmb_Specified;
    property rvlEnc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlEnc write SetrvlEnc stored rvlEnc_Specified;
    property rvlFei: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlFei write SetrvlFei stored rvlFei_Specified;
    property rvlFre: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlFre write SetrvlFre stored rvlFre_Specified;
    property rvlOui: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlOui write SetrvlOui stored rvlOui_Specified;
    property rvlOut: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlOut write SetrvlOut stored rvlOut_Specified;
    property rvlSeg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlSeg write SetrvlSeg stored rvlSeg_Specified;
    property rvlSei: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrvlSei write SetrvlSei stored rvlSei_Specified;
    property seqOrm: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqOrm write SetseqOrm stored seqOrm_Specified;
    property tnsPro: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsPro write SettnsPro stored tnsPro_Specified;
    property tnsSer: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsSer write SettnsSer stored tnsSer_Specified;
    property tolDsc: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
  end;



  // ************************************************************************ //
  // XML       : fornecedorIncluirFornecedorInDadosGerais, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  fornecedorIncluirFornecedorInDadosGerais = class(TRemotable)
  private
    FabrIac: string;
    FabrIac_Specified: boolean;
    FapeFor: string;
    FapeFor_Specified: boolean;
    FbaiFor: string;
    FbaiFor_Specified: boolean;
    FcepFor: Integer;
    FcepFor_Specified: boolean;
    FcepIni: Integer;
    FcepIni_Specified: boolean;
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcidFor: string;
    FcidFor_Specified: boolean;
    FcliFor: string;
    FcliFor_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodGre: Integer;
    FcodGre_Specified: boolean;
    FcodIac: Integer;
    FcodIac_Specified: boolean;
    FcodMot: Integer;
    FcodMot_Specified: boolean;
    FcodPai: string;
    FcodPai_Specified: boolean;
    FcodRam: string;
    FcodRam_Specified: boolean;
    FcodRoe: string;
    FcodRoe_Specified: boolean;
    FcodRtr: Integer;
    FcodRtr_Specified: boolean;
    FcodSro: string;
    FcodSro_Specified: boolean;
    FcodSuf: string;
    FcodSuf_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcplEnd: string;
    FcplEnd_Specified: boolean;
    FcxaPst: Integer;
    FcxaPst_Specified: boolean;
    Fdefinicoes: Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes;
    Fdefinicoes_Specified: boolean;
    FeenFor: string;
    FeenFor_Specified: boolean;
    FemaNfe: string;
    FemaNfe_Specified: boolean;
    FendFor: string;
    FendFor_Specified: boolean;
    FfaxFor: string;
    FfaxFor_Specified: boolean;
    FfaxVen: string;
    FfaxVen_Specified: boolean;
    FfonFo2: string;
    FfonFo2_Specified: boolean;
    FfonFo3: string;
    FfonFo3_Specified: boolean;
    FfonFor: string;
    FfonFor_Specified: boolean;
    FfonVen: string;
    FfonVen_Specified: boolean;
    FforRep: Integer;
    FforRep_Specified: boolean;
    FforTra: Integer;
    FforTra_Specified: boolean;
    FforWms: string;
    FforWms_Specified: boolean;
    FgerDir: string;
    FgerDir_Specified: boolean;
    FideFor: string;
    FideFor_Specified: boolean;
    FindBsp: string;
    FindBsp_Specified: boolean;
    FindCoo: string;
    FindCoo_Specified: boolean;
    FindFor: string;
    FindFor_Specified: boolean;
    FinsAnp: Integer;
    FinsAnp_Specified: boolean;
    FinsEst: string;
    FinsEst_Specified: boolean;
    FinsMun: string;
    FinsMun_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FlimRet: string;
    FlimRet_Specified: boolean;
    FmarFor: string;
    FmarFor_Specified: boolean;
    FnenFor: string;
    FnenFor_Specified: boolean;
    FnomFor: string;
    FnomFor_Specified: boolean;
    FnomVen: string;
    FnomVen_Specified: boolean;
    FnotAfo: Integer;
    FnotAfo_Specified: boolean;
    FnotFor: Integer;
    FnotFor_Specified: boolean;
    FnotSis: Integer;
    FnotSis_Specified: boolean;
    FnumIdf: string;
    FnumIdf_Specified: boolean;
    FnumRge: string;
    FnumRge_Specified: boolean;
    FobsMot: string;
    FobsMot_Specified: boolean;
    FperCod: string;
    FperCod_Specified: boolean;
    FperIcm: Integer;
    FperIcm_Specified: boolean;
    FperPid: string;
    FperPid_Specified: boolean;
    FperRin: string;
    FperRin_Specified: boolean;
    FperRir: string;
    FperRir_Specified: boolean;
    FqtdDep: Integer;
    FqtdDep_Specified: boolean;
    FrecCof: string;
    FrecCof_Specified: boolean;
    FrecIcm: string;
    FrecIcm_Specified: boolean;
    FrecIpi: string;
    FrecIpi_Specified: boolean;
    FrecPis: string;
    FrecPis_Specified: boolean;
    FregEst: Integer;
    FregEst_Specified: boolean;
    FretCof: string;
    FretCof_Specified: boolean;
    FretCsl: string;
    FretCsl_Specified: boolean;
    FretIrf: string;
    FretIrf_Specified: boolean;
    FretOur: string;
    FretOur_Specified: boolean;
    FretPis: string;
    FretPis_Specified: boolean;
    FretPro: string;
    FretPro_Specified: boolean;
    FrmlVen: Integer;
    FrmlVen_Specified: boolean;
    FseqRoe: Integer;
    FseqRoe_Specified: boolean;
    FsigUfs: string;
    FsigUfs_Specified: boolean;
    FsitFor: string;
    FsitFor_Specified: boolean;
    FtemOrm: string;
    FtemOrm_Specified: boolean;
    FtipFor: string;
    FtipFor_Specified: boolean;
    FtipMer: string;
    FtipMer_Specified: boolean;
    FtipPgt: string;
    FtipPgt_Specified: boolean;
    FtriIcm: string;
    FtriIcm_Specified: boolean;
    FtriIpi: string;
    FtriIpi_Specified: boolean;
    FtriIss: string;
    FtriIss_Specified: boolean;
    FzipCod: string;
    FzipCod_Specified: boolean;
    procedure SetabrIac(Index: Integer; const Astring: string);
    function  abrIac_Specified(Index: Integer): boolean;
    procedure SetapeFor(Index: Integer; const Astring: string);
    function  apeFor_Specified(Index: Integer): boolean;
    procedure SetbaiFor(Index: Integer; const Astring: string);
    function  baiFor_Specified(Index: Integer): boolean;
    procedure SetcepFor(Index: Integer; const AInteger: Integer);
    function  cepFor_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const AInteger: Integer);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcidFor(Index: Integer; const Astring: string);
    function  cidFor_Specified(Index: Integer): boolean;
    procedure SetcliFor(Index: Integer; const Astring: string);
    function  cliFor_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodGre(Index: Integer; const AInteger: Integer);
    function  codGre_Specified(Index: Integer): boolean;
    procedure SetcodIac(Index: Integer; const AInteger: Integer);
    function  codIac_Specified(Index: Integer): boolean;
    procedure SetcodMot(Index: Integer; const AInteger: Integer);
    function  codMot_Specified(Index: Integer): boolean;
    procedure SetcodPai(Index: Integer; const Astring: string);
    function  codPai_Specified(Index: Integer): boolean;
    procedure SetcodRam(Index: Integer; const Astring: string);
    function  codRam_Specified(Index: Integer): boolean;
    procedure SetcodRoe(Index: Integer; const Astring: string);
    function  codRoe_Specified(Index: Integer): boolean;
    procedure SetcodRtr(Index: Integer; const AInteger: Integer);
    function  codRtr_Specified(Index: Integer): boolean;
    procedure SetcodSro(Index: Integer; const Astring: string);
    function  codSro_Specified(Index: Integer): boolean;
    procedure SetcodSuf(Index: Integer; const Astring: string);
    function  codSuf_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcplEnd(Index: Integer; const Astring: string);
    function  cplEnd_Specified(Index: Integer): boolean;
    procedure SetcxaPst(Index: Integer; const AInteger: Integer);
    function  cxaPst_Specified(Index: Integer): boolean;
    procedure Setdefinicoes(Index: Integer; const AArray_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes: Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes);
    function  definicoes_Specified(Index: Integer): boolean;
    procedure SeteenFor(Index: Integer; const Astring: string);
    function  eenFor_Specified(Index: Integer): boolean;
    procedure SetemaNfe(Index: Integer; const Astring: string);
    function  emaNfe_Specified(Index: Integer): boolean;
    procedure SetendFor(Index: Integer; const Astring: string);
    function  endFor_Specified(Index: Integer): boolean;
    procedure SetfaxFor(Index: Integer; const Astring: string);
    function  faxFor_Specified(Index: Integer): boolean;
    procedure SetfaxVen(Index: Integer; const Astring: string);
    function  faxVen_Specified(Index: Integer): boolean;
    procedure SetfonFo2(Index: Integer; const Astring: string);
    function  fonFo2_Specified(Index: Integer): boolean;
    procedure SetfonFo3(Index: Integer; const Astring: string);
    function  fonFo3_Specified(Index: Integer): boolean;
    procedure SetfonFor(Index: Integer; const Astring: string);
    function  fonFor_Specified(Index: Integer): boolean;
    procedure SetfonVen(Index: Integer; const Astring: string);
    function  fonVen_Specified(Index: Integer): boolean;
    procedure SetforRep(Index: Integer; const AInteger: Integer);
    function  forRep_Specified(Index: Integer): boolean;
    procedure SetforTra(Index: Integer; const AInteger: Integer);
    function  forTra_Specified(Index: Integer): boolean;
    procedure SetforWms(Index: Integer; const Astring: string);
    function  forWms_Specified(Index: Integer): boolean;
    procedure SetgerDir(Index: Integer; const Astring: string);
    function  gerDir_Specified(Index: Integer): boolean;
    procedure SetideFor(Index: Integer; const Astring: string);
    function  ideFor_Specified(Index: Integer): boolean;
    procedure SetindBsp(Index: Integer; const Astring: string);
    function  indBsp_Specified(Index: Integer): boolean;
    procedure SetindCoo(Index: Integer; const Astring: string);
    function  indCoo_Specified(Index: Integer): boolean;
    procedure SetindFor(Index: Integer; const Astring: string);
    function  indFor_Specified(Index: Integer): boolean;
    procedure SetinsAnp(Index: Integer; const AInteger: Integer);
    function  insAnp_Specified(Index: Integer): boolean;
    procedure SetinsEst(Index: Integer; const Astring: string);
    function  insEst_Specified(Index: Integer): boolean;
    procedure SetinsMun(Index: Integer; const Astring: string);
    function  insMun_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetlimRet(Index: Integer; const Astring: string);
    function  limRet_Specified(Index: Integer): boolean;
    procedure SetmarFor(Index: Integer; const Astring: string);
    function  marFor_Specified(Index: Integer): boolean;
    procedure SetnenFor(Index: Integer; const Astring: string);
    function  nenFor_Specified(Index: Integer): boolean;
    procedure SetnomFor(Index: Integer; const Astring: string);
    function  nomFor_Specified(Index: Integer): boolean;
    procedure SetnomVen(Index: Integer; const Astring: string);
    function  nomVen_Specified(Index: Integer): boolean;
    procedure SetnotAfo(Index: Integer; const AInteger: Integer);
    function  notAfo_Specified(Index: Integer): boolean;
    procedure SetnotFor(Index: Integer; const AInteger: Integer);
    function  notFor_Specified(Index: Integer): boolean;
    procedure SetnotSis(Index: Integer; const AInteger: Integer);
    function  notSis_Specified(Index: Integer): boolean;
    procedure SetnumIdf(Index: Integer; const Astring: string);
    function  numIdf_Specified(Index: Integer): boolean;
    procedure SetnumRge(Index: Integer; const Astring: string);
    function  numRge_Specified(Index: Integer): boolean;
    procedure SetobsMot(Index: Integer; const Astring: string);
    function  obsMot_Specified(Index: Integer): boolean;
    procedure SetperCod(Index: Integer; const Astring: string);
    function  perCod_Specified(Index: Integer): boolean;
    procedure SetperIcm(Index: Integer; const AInteger: Integer);
    function  perIcm_Specified(Index: Integer): boolean;
    procedure SetperPid(Index: Integer; const Astring: string);
    function  perPid_Specified(Index: Integer): boolean;
    procedure SetperRin(Index: Integer; const Astring: string);
    function  perRin_Specified(Index: Integer): boolean;
    procedure SetperRir(Index: Integer; const Astring: string);
    function  perRir_Specified(Index: Integer): boolean;
    procedure SetqtdDep(Index: Integer; const AInteger: Integer);
    function  qtdDep_Specified(Index: Integer): boolean;
    procedure SetrecCof(Index: Integer; const Astring: string);
    function  recCof_Specified(Index: Integer): boolean;
    procedure SetrecIcm(Index: Integer; const Astring: string);
    function  recIcm_Specified(Index: Integer): boolean;
    procedure SetrecIpi(Index: Integer; const Astring: string);
    function  recIpi_Specified(Index: Integer): boolean;
    procedure SetrecPis(Index: Integer; const Astring: string);
    function  recPis_Specified(Index: Integer): boolean;
    procedure SetregEst(Index: Integer; const AInteger: Integer);
    function  regEst_Specified(Index: Integer): boolean;
    procedure SetretCof(Index: Integer; const Astring: string);
    function  retCof_Specified(Index: Integer): boolean;
    procedure SetretCsl(Index: Integer; const Astring: string);
    function  retCsl_Specified(Index: Integer): boolean;
    procedure SetretIrf(Index: Integer; const Astring: string);
    function  retIrf_Specified(Index: Integer): boolean;
    procedure SetretOur(Index: Integer; const Astring: string);
    function  retOur_Specified(Index: Integer): boolean;
    procedure SetretPis(Index: Integer; const Astring: string);
    function  retPis_Specified(Index: Integer): boolean;
    procedure SetretPro(Index: Integer; const Astring: string);
    function  retPro_Specified(Index: Integer): boolean;
    procedure SetrmlVen(Index: Integer; const AInteger: Integer);
    function  rmlVen_Specified(Index: Integer): boolean;
    procedure SetseqRoe(Index: Integer; const AInteger: Integer);
    function  seqRoe_Specified(Index: Integer): boolean;
    procedure SetsigUfs(Index: Integer; const Astring: string);
    function  sigUfs_Specified(Index: Integer): boolean;
    procedure SetsitFor(Index: Integer; const Astring: string);
    function  sitFor_Specified(Index: Integer): boolean;
    procedure SettemOrm(Index: Integer; const Astring: string);
    function  temOrm_Specified(Index: Integer): boolean;
    procedure SettipFor(Index: Integer; const Astring: string);
    function  tipFor_Specified(Index: Integer): boolean;
    procedure SettipMer(Index: Integer; const Astring: string);
    function  tipMer_Specified(Index: Integer): boolean;
    procedure SettipPgt(Index: Integer; const Astring: string);
    function  tipPgt_Specified(Index: Integer): boolean;
    procedure SettriIcm(Index: Integer; const Astring: string);
    function  triIcm_Specified(Index: Integer): boolean;
    procedure SettriIpi(Index: Integer; const Astring: string);
    function  triIpi_Specified(Index: Integer): boolean;
    procedure SettriIss(Index: Integer; const Astring: string);
    function  triIss_Specified(Index: Integer): boolean;
    procedure SetzipCod(Index: Integer; const Astring: string);
    function  zipCod_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property abrIac:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrIac write SetabrIac stored abrIac_Specified;
    property apeFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FapeFor write SetapeFor stored apeFor_Specified;
    property baiFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiFor write SetbaiFor stored baiFor_Specified;
    property cepFor:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFor write SetcepFor stored cepFor_Specified;
    property cepIni:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cgcCpf:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property cidFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidFor write SetcidFor stored cidFor_Specified;
    property cliFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliFor write SetcliFor stored cliFor_Specified;
    property codCli:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFor:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codGre:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodGre write SetcodGre stored codGre_Specified;
    property codIac:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIac write SetcodIac stored codIac_Specified;
    property codMot:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMot write SetcodMot stored codMot_Specified;
    property codPai:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPai write SetcodPai stored codPai_Specified;
    property codRam:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRam write SetcodRam stored codRam_Specified;
    property codRoe:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRoe write SetcodRoe stored codRoe_Specified;
    property codRtr:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRtr write SetcodRtr stored codRtr_Specified;
    property codSro:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSro write SetcodSro stored codSro_Specified;
    property codSuf:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSuf write SetcodSuf stored codSuf_Specified;
    property codTri:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property cplEnd:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnd write SetcplEnd stored cplEnd_Specified;
    property cxaPst:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcxaPst write SetcxaPst stored cxaPst_Specified;
    property definicoes: Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fdefinicoes write Setdefinicoes stored definicoes_Specified;
    property eenFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenFor write SeteenFor stored eenFor_Specified;
    property emaNfe:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FemaNfe write SetemaNfe stored emaNfe_Specified;
    property endFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendFor write SetendFor stored endFor_Specified;
    property faxFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxFor write SetfaxFor stored faxFor_Specified;
    property faxVen:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxVen write SetfaxVen stored faxVen_Specified;
    property fonFo2:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonFo2 write SetfonFo2 stored fonFo2_Specified;
    property fonFo3:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonFo3 write SetfonFo3 stored fonFo3_Specified;
    property fonFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonFor write SetfonFor stored fonFor_Specified;
    property fonVen:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonVen write SetfonVen stored fonVen_Specified;
    property forRep:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforRep write SetforRep stored forRep_Specified;
    property forTra:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforTra write SetforTra stored forTra_Specified;
    property forWms:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforWms write SetforWms stored forWms_Specified;
    property gerDir:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerDir write SetgerDir stored gerDir_Specified;
    property ideFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideFor write SetideFor stored ideFor_Specified;
    property indBsp:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindBsp write SetindBsp stored indBsp_Specified;
    property indCoo:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCoo write SetindCoo stored indCoo_Specified;
    property indFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindFor write SetindFor stored indFor_Specified;
    property insAnp:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsAnp write SetinsAnp stored insAnp_Specified;
    property insEst:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEst write SetinsEst stored insEst_Specified;
    property insMun:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsMun write SetinsMun stored insMun_Specified;
    property intNet:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property limRet:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimRet write SetlimRet stored limRet_Specified;
    property marFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmarFor write SetmarFor stored marFor_Specified;
    property nenFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenFor write SetnenFor stored nenFor_Specified;
    property nomFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomFor write SetnomFor stored nomFor_Specified;
    property nomVen:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomVen write SetnomVen stored nomVen_Specified;
    property notAfo:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnotAfo write SetnotAfo stored notAfo_Specified;
    property notFor:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnotFor write SetnotFor stored notFor_Specified;
    property notSis:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnotSis write SetnotSis stored notSis_Specified;
    property numIdf:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumIdf write SetnumIdf stored numIdf_Specified;
    property numRge:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRge write SetnumRge stored numRge_Specified;
    property obsMot:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMot write SetobsMot stored obsMot_Specified;
    property perCod:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCod write SetperCod stored perCod_Specified;
    property perIcm:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIcm write SetperIcm stored perIcm_Specified;
    property perPid:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperPid write SetperPid stored perPid_Specified;
    property perRin:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRin write SetperRin stored perRin_Specified;
    property perRir:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRir write SetperRir stored perRir_Specified;
    property qtdDep:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDep write SetqtdDep stored qtdDep_Specified;
    property recCof:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecCof write SetrecCof stored recCof_Specified;
    property recIcm:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecIcm write SetrecIcm stored recIcm_Specified;
    property recIpi:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecIpi write SetrecIpi stored recIpi_Specified;
    property recPis:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecPis write SetrecPis stored recPis_Specified;
    property regEst:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FregEst write SetregEst stored regEst_Specified;
    property retCof:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCof write SetretCof stored retCof_Specified;
    property retCsl:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCsl write SetretCsl stored retCsl_Specified;
    property retIrf:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretIrf write SetretIrf stored retIrf_Specified;
    property retOur:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretOur write SetretOur stored retOur_Specified;
    property retPis:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPis write SetretPis stored retPis_Specified;
    property retPro:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPro write SetretPro stored retPro_Specified;
    property rmlVen:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrmlVen write SetrmlVen stored rmlVen_Specified;
    property seqRoe:     Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRoe write SetseqRoe stored seqRoe_Specified;
    property sigUfs:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigUfs write SetsigUfs stored sigUfs_Specified;
    property sitFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitFor write SetsitFor stored sitFor_Specified;
    property temOrm:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtemOrm write SettemOrm stored temOrm_Specified;
    property tipFor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipFor write SettipFor stored tipFor_Specified;
    property tipMer:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMer write SettipMer stored tipMer_Specified;
    property tipPgt:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipPgt write SettipPgt stored tipPgt_Specified;
    property triIcm:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIcm write SettriIcm stored triIcm_Specified;
    property triIpi:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIpi write SettriIpi stored triIpi_Specified;
    property triIss:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIss write SettriIss stored triIss_Specified;
    property zipCod:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzipCod write SetzipCod stored zipCod_Specified;
  end;



  // ************************************************************************ //
  // XML       : fornecedorIncluirFornecedorOutRetornos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  fornecedorIncluirFornecedorOutRetornos = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FforRet: Integer;
    FforRet_Specified: boolean;
    FnomFor: string;
    FnomFor_Specified: boolean;
    FretExe: string;
    FretExe_Specified: boolean;
    FsitFor: string;
    FsitFor_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetforRet(Index: Integer; const AInteger: Integer);
    function  forRet_Specified(Index: Integer): boolean;
    procedure SetnomFor(Index: Integer; const Astring: string);
    function  nomFor_Specified(Index: Integer): boolean;
    procedure SetretExe(Index: Integer; const Astring: string);
    function  retExe_Specified(Index: Integer): boolean;
    procedure SetsitFor(Index: Integer; const Astring: string);
    function  sitFor_Specified(Index: Integer): boolean;
  published
    property cgcCpf: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property forRet: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforRet write SetforRet stored forRet_Specified;
    property nomFor: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomFor write SetnomFor stored nomFor_Specified;
    property retExe: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretExe write SetretExe stored retExe_Specified;
    property sitFor: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitFor write SetsitFor stored sitFor_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedorPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedorPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor
  // ************************************************************************ //
  sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor = interface(IInvokable)
  ['{30D013DF-A4A6-896B-31D6-A04F61E370E2}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  IncluirFornecedor(const user: string; const password: string; const encryption: Integer; const parameters: fornecedorIncluirFornecedorIn): fornecedorIncluirFornecedorOut; stdcall;
  end;

function Getsapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor;


implementation
  uses System.SysUtils;

function Getsapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedorPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor fornecedorIncluirFornecedorIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGerais)-1 do
    System.SysUtils.FreeAndNil(FdadosGerais[I]);
  System.SetLength(FdadosGerais, 0);
  inherited Destroy;
end;

procedure fornecedorIncluirFornecedorIn.SetdadosGerais(Index: Integer; const AArray_Of_fornecedorIncluirFornecedorInDadosGerais: Array_Of_fornecedorIncluirFornecedorInDadosGerais);
begin
  FdadosGerais := AArray_Of_fornecedorIncluirFornecedorInDadosGerais;
  FdadosGerais_Specified := True;
end;

function fornecedorIncluirFornecedorIn.dadosGerais_Specified(Index: Integer): boolean;
begin
  Result := FdadosGerais_Specified;
end;

procedure fornecedorIncluirFornecedorIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function fornecedorIncluirFornecedorIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure fornecedorIncluirFornecedorIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function fornecedorIncluirFornecedorIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor fornecedorIncluirFornecedorOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor fornecedorIncluirFornecedorOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretornos)-1 do
    System.SysUtils.FreeAndNil(Fretornos[I]);
  System.SetLength(Fretornos, 0);
  inherited Destroy;
end;

procedure fornecedorIncluirFornecedorOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function fornecedorIncluirFornecedorOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure fornecedorIncluirFornecedorOut.Setretornos(Index: Integer; const AArray_Of_fornecedorIncluirFornecedorOutRetornos: Array_Of_fornecedorIncluirFornecedorOutRetornos);
begin
  Fretornos := AArray_Of_fornecedorIncluirFornecedorOutRetornos;
  Fretornos_Specified := True;
end;

function fornecedorIncluirFornecedorOut.retornos_Specified(Index: Integer): boolean;
begin
  Result := Fretornos_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcifFob(Index: Integer; const Astring: string);
begin
  FcifFob := Astring;
  FcifFob_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.cifFob_Specified(Index: Integer): boolean;
begin
  Result := FcifFob_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodCpg(Index: Integer; const Astring: string);
begin
  FcodCpg := Astring;
  FcodCpg_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codCpg_Specified(Index: Integer): boolean;
begin
  Result := FcodCpg_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodDep(Index: Integer; const Astring: string);
begin
  FcodDep := Astring;
  FcodDep_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codDep_Specified(Index: Integer): boolean;
begin
  Result := FcodDep_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodEdc(Index: Integer; const Astring: string);
begin
  FcodEdc := Astring;
  FcodEdc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codEdc_Specified(Index: Integer): boolean;
begin
  Result := FcodEdc_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodFav(Index: Integer; const AInteger: Integer);
begin
  FcodFav := AInteger;
  FcodFav_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codFav_Specified(Index: Integer): boolean;
begin
  Result := FcodFav_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodTpr(Index: Integer; const Astring: string);
begin
  FcodTpr := Astring;
  FcodTpr_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codTpr_Specified(Index: Integer): boolean;
begin
  Result := FcodTpr_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcodTra(Index: Integer; const AInteger: Integer);
begin
  FcodTra := AInteger;
  FcodTra_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.codTra_Specified(Index: Integer): boolean;
begin
  Result := FcodTra_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetcriEdv(Index: Integer; const Astring: string);
begin
  FcriEdv := Astring;
  FcriEdv_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.criEdv_Specified(Index: Integer): boolean;
begin
  Result := FcriEdv_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetctaAad(Index: Integer; const AInteger: Integer);
begin
  FctaAad := AInteger;
  FctaAad_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ctaAad_Specified(Index: Integer): boolean;
begin
  Result := FctaAad_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetctaAux(Index: Integer; const AInteger: Integer);
begin
  FctaAux := AInteger;
  FctaAux_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ctaAux_Specified(Index: Integer): boolean;
begin
  Result := FctaAux_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetctaFcr(Index: Integer; const AInteger: Integer);
begin
  FctaFcr := AInteger;
  FctaFcr_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ctaFcr_Specified(Index: Integer): boolean;
begin
  Result := FctaFcr_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetctaFdv(Index: Integer; const AInteger: Integer);
begin
  FctaFdv := AInteger;
  FctaFdv_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ctaFdv_Specified(Index: Integer): boolean;
begin
  Result := FctaFdv_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetctaRcr(Index: Integer; const AInteger: Integer);
begin
  FctaRcr := AInteger;
  FctaRcr_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ctaRcr_Specified(Index: Integer): boolean;
begin
  Result := FctaRcr_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetforMon(Index: Integer; const Astring: string);
begin
  FforMon := Astring;
  FforMon_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.forMon_Specified(Index: Integer): boolean;
begin
  Result := FforMon_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetindInd(Index: Integer; const Astring: string);
begin
  FindInd := Astring;
  FindInd_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.indInd_Specified(Index: Integer): boolean;
begin
  Result := FindInd_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetnumCcc(Index: Integer; const Astring: string);
begin
  FnumCcc := Astring;
  FnumCcc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.numCcc_Specified(Index: Integer): boolean;
begin
  Result := FnumCcc_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpagDtj(Index: Integer; const AInteger: Integer);
begin
  FpagDtj := AInteger;
  FpagDtj_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pagDtj_Specified(Index: Integer): boolean;
begin
  Result := FpagDtj_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpagDtm(Index: Integer; const AInteger: Integer);
begin
  FpagDtm := AInteger;
  FpagDtm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pagDtm_Specified(Index: Integer): boolean;
begin
  Result := FpagDtm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpagJmm(Index: Integer; const Astring: string);
begin
  FpagJmm := Astring;
  FpagJmm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pagJmm_Specified(Index: Integer): boolean;
begin
  Result := FpagJmm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpagMul(Index: Integer; const Astring: string);
begin
  FpagMul := Astring;
  FpagMul_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pagMul_Specified(Index: Integer): boolean;
begin
  Result := FpagMul_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpagTir(Index: Integer; const Astring: string);
begin
  FpagTir := Astring;
  FpagTir_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pagTir_Specified(Index: Integer): boolean;
begin
  Result := FpagTir_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperDs1(Index: Integer; const Astring: string);
begin
  FperDs1 := Astring;
  FperDs1_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perDs1_Specified(Index: Integer): boolean;
begin
  Result := FperDs1_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperDs2(Index: Integer; const Astring: string);
begin
  FperDs2 := Astring;
  FperDs2_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perDs2_Specified(Index: Integer): boolean;
begin
  Result := FperDs2_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperDs3(Index: Integer; const Astring: string);
begin
  FperDs3 := Astring;
  FperDs3_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perDs3_Specified(Index: Integer): boolean;
begin
  Result := FperDs3_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperDs4(Index: Integer; const Astring: string);
begin
  FperDs4 := Astring;
  FperDs4_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perDs4_Specified(Index: Integer): boolean;
begin
  Result := FperDs4_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperDs5(Index: Integer; const Astring: string);
begin
  FperDs5 := Astring;
  FperDs5_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perDs5_Specified(Index: Integer): boolean;
begin
  Result := FperDs5_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperEmb(Index: Integer; const Astring: string);
begin
  FperEmb := Astring;
  FperEmb_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perEmb_Specified(Index: Integer): boolean;
begin
  Result := FperEmb_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperEnc(Index: Integer; const Astring: string);
begin
  FperEnc := Astring;
  FperEnc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perEnc_Specified(Index: Integer): boolean;
begin
  Result := FperEnc_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperFre(Index: Integer; const Astring: string);
begin
  FperFre := Astring;
  FperFre_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perFre_Specified(Index: Integer): boolean;
begin
  Result := FperFre_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperFun(Index: Integer; const Astring: string);
begin
  FperFun := Astring;
  FperFun_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perFun_Specified(Index: Integer): boolean;
begin
  Result := FperFun_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperIne(Index: Integer; const Astring: string);
begin
  FperIne := Astring;
  FperIne_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perIne_Specified(Index: Integer): boolean;
begin
  Result := FperIne_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperIns(Index: Integer; const Astring: string);
begin
  FperIns := Astring;
  FperIns_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perIns_Specified(Index: Integer): boolean;
begin
  Result := FperIns_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperIrf(Index: Integer; const Astring: string);
begin
  FperIrf := Astring;
  FperIrf_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perIrf_Specified(Index: Integer): boolean;
begin
  Result := FperIrf_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperIss(Index: Integer; const Astring: string);
begin
  FperIss := Astring;
  FperIss_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perIss_Specified(Index: Integer): boolean;
begin
  Result := FperIss_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperOut(Index: Integer; const Astring: string);
begin
  FperOut := Astring;
  FperOut_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perOut_Specified(Index: Integer): boolean;
begin
  Result := FperOut_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetperSeg(Index: Integer; const Astring: string);
begin
  FperSeg := Astring;
  FperSeg_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.perSeg_Specified(Index: Integer): boolean;
begin
  Result := FperSeg_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpgtFre(Index: Integer; const Astring: string);
begin
  FpgtFre := Astring;
  FpgtFre_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pgtFre_Specified(Index: Integer): boolean;
begin
  Result := FpgtFre_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetpgtMon(Index: Integer; const Astring: string);
begin
  FpgtMon := Astring;
  FpgtMon_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.pgtMon_Specified(Index: Integer): boolean;
begin
  Result := FpgtMon_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetprzEnt(Index: Integer; const AInteger: Integer);
begin
  FprzEnt := AInteger;
  FprzEnt_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.przEnt_Specified(Index: Integer): boolean;
begin
  Result := FprzEnt_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetqtdDcv(Index: Integer; const AInteger: Integer);
begin
  FqtdDcv := AInteger;
  FqtdDcv_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.qtdDcv_Specified(Index: Integer): boolean;
begin
  Result := FqtdDcv_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlCfr(Index: Integer; const Astring: string);
begin
  FrvlCfr := Astring;
  FrvlCfr_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlCfr_Specified(Index: Integer): boolean;
begin
  Result := FrvlCfr_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlDar(Index: Integer; const Astring: string);
begin
  FrvlDar := Astring;
  FrvlDar_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlDar_Specified(Index: Integer): boolean;
begin
  Result := FrvlDar_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlEmb(Index: Integer; const Astring: string);
begin
  FrvlEmb := Astring;
  FrvlEmb_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlEmb_Specified(Index: Integer): boolean;
begin
  Result := FrvlEmb_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlEnc(Index: Integer; const Astring: string);
begin
  FrvlEnc := Astring;
  FrvlEnc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlEnc_Specified(Index: Integer): boolean;
begin
  Result := FrvlEnc_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlFei(Index: Integer; const Astring: string);
begin
  FrvlFei := Astring;
  FrvlFei_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlFei_Specified(Index: Integer): boolean;
begin
  Result := FrvlFei_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlFre(Index: Integer; const Astring: string);
begin
  FrvlFre := Astring;
  FrvlFre_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlFre_Specified(Index: Integer): boolean;
begin
  Result := FrvlFre_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlOui(Index: Integer; const Astring: string);
begin
  FrvlOui := Astring;
  FrvlOui_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlOui_Specified(Index: Integer): boolean;
begin
  Result := FrvlOui_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlOut(Index: Integer; const Astring: string);
begin
  FrvlOut := Astring;
  FrvlOut_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlOut_Specified(Index: Integer): boolean;
begin
  Result := FrvlOut_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlSeg(Index: Integer; const Astring: string);
begin
  FrvlSeg := Astring;
  FrvlSeg_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlSeg_Specified(Index: Integer): boolean;
begin
  Result := FrvlSeg_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetrvlSei(Index: Integer; const Astring: string);
begin
  FrvlSei := Astring;
  FrvlSei_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.rvlSei_Specified(Index: Integer): boolean;
begin
  Result := FrvlSei_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SetseqOrm(Index: Integer; const AInteger: Integer);
begin
  FseqOrm := AInteger;
  FseqOrm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.seqOrm_Specified(Index: Integer): boolean;
begin
  Result := FseqOrm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SettnsPro(Index: Integer; const Astring: string);
begin
  FtnsPro := Astring;
  FtnsPro_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.tnsPro_Specified(Index: Integer): boolean;
begin
  Result := FtnsPro_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SettnsSer(Index: Integer; const Astring: string);
begin
  FtnsSer := Astring;
  FtnsSer_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.tnsSer_Specified(Index: Integer): boolean;
begin
  Result := FtnsSer_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGeraisDefinicoes.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGeraisDefinicoes.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

destructor fornecedorIncluirFornecedorInDadosGerais.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fdefinicoes)-1 do
    System.SysUtils.FreeAndNil(Fdefinicoes[I]);
  System.SetLength(Fdefinicoes, 0);
  inherited Destroy;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetabrIac(Index: Integer; const Astring: string);
begin
  FabrIac := Astring;
  FabrIac_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.abrIac_Specified(Index: Integer): boolean;
begin
  Result := FabrIac_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetapeFor(Index: Integer; const Astring: string);
begin
  FapeFor := Astring;
  FapeFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.apeFor_Specified(Index: Integer): boolean;
begin
  Result := FapeFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetbaiFor(Index: Integer; const Astring: string);
begin
  FbaiFor := Astring;
  FbaiFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.baiFor_Specified(Index: Integer): boolean;
begin
  Result := FbaiFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcepFor(Index: Integer; const AInteger: Integer);
begin
  FcepFor := AInteger;
  FcepFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cepFor_Specified(Index: Integer): boolean;
begin
  Result := FcepFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcepIni(Index: Integer; const AInteger: Integer);
begin
  FcepIni := AInteger;
  FcepIni_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcidFor(Index: Integer; const Astring: string);
begin
  FcidFor := Astring;
  FcidFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cidFor_Specified(Index: Integer): boolean;
begin
  Result := FcidFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcliFor(Index: Integer; const Astring: string);
begin
  FcliFor := Astring;
  FcliFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cliFor_Specified(Index: Integer): boolean;
begin
  Result := FcliFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodGre(Index: Integer; const AInteger: Integer);
begin
  FcodGre := AInteger;
  FcodGre_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codGre_Specified(Index: Integer): boolean;
begin
  Result := FcodGre_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodIac(Index: Integer; const AInteger: Integer);
begin
  FcodIac := AInteger;
  FcodIac_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codIac_Specified(Index: Integer): boolean;
begin
  Result := FcodIac_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodMot(Index: Integer; const AInteger: Integer);
begin
  FcodMot := AInteger;
  FcodMot_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codMot_Specified(Index: Integer): boolean;
begin
  Result := FcodMot_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodPai(Index: Integer; const Astring: string);
begin
  FcodPai := Astring;
  FcodPai_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codPai_Specified(Index: Integer): boolean;
begin
  Result := FcodPai_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodRam(Index: Integer; const Astring: string);
begin
  FcodRam := Astring;
  FcodRam_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codRam_Specified(Index: Integer): boolean;
begin
  Result := FcodRam_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodRoe(Index: Integer; const Astring: string);
begin
  FcodRoe := Astring;
  FcodRoe_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codRoe_Specified(Index: Integer): boolean;
begin
  Result := FcodRoe_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodRtr(Index: Integer; const AInteger: Integer);
begin
  FcodRtr := AInteger;
  FcodRtr_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codRtr_Specified(Index: Integer): boolean;
begin
  Result := FcodRtr_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodSro(Index: Integer; const Astring: string);
begin
  FcodSro := Astring;
  FcodSro_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codSro_Specified(Index: Integer): boolean;
begin
  Result := FcodSro_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodSuf(Index: Integer; const Astring: string);
begin
  FcodSuf := Astring;
  FcodSuf_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codSuf_Specified(Index: Integer): boolean;
begin
  Result := FcodSuf_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcplEnd(Index: Integer; const Astring: string);
begin
  FcplEnd := Astring;
  FcplEnd_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cplEnd_Specified(Index: Integer): boolean;
begin
  Result := FcplEnd_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetcxaPst(Index: Integer; const AInteger: Integer);
begin
  FcxaPst := AInteger;
  FcxaPst_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.cxaPst_Specified(Index: Integer): boolean;
begin
  Result := FcxaPst_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.Setdefinicoes(Index: Integer; const AArray_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes: Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes);
begin
  Fdefinicoes := AArray_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes;
  Fdefinicoes_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.definicoes_Specified(Index: Integer): boolean;
begin
  Result := Fdefinicoes_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SeteenFor(Index: Integer; const Astring: string);
begin
  FeenFor := Astring;
  FeenFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.eenFor_Specified(Index: Integer): boolean;
begin
  Result := FeenFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetemaNfe(Index: Integer; const Astring: string);
begin
  FemaNfe := Astring;
  FemaNfe_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.emaNfe_Specified(Index: Integer): boolean;
begin
  Result := FemaNfe_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetendFor(Index: Integer; const Astring: string);
begin
  FendFor := Astring;
  FendFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.endFor_Specified(Index: Integer): boolean;
begin
  Result := FendFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetfaxFor(Index: Integer; const Astring: string);
begin
  FfaxFor := Astring;
  FfaxFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.faxFor_Specified(Index: Integer): boolean;
begin
  Result := FfaxFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetfaxVen(Index: Integer; const Astring: string);
begin
  FfaxVen := Astring;
  FfaxVen_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.faxVen_Specified(Index: Integer): boolean;
begin
  Result := FfaxVen_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetfonFo2(Index: Integer; const Astring: string);
begin
  FfonFo2 := Astring;
  FfonFo2_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.fonFo2_Specified(Index: Integer): boolean;
begin
  Result := FfonFo2_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetfonFo3(Index: Integer; const Astring: string);
begin
  FfonFo3 := Astring;
  FfonFo3_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.fonFo3_Specified(Index: Integer): boolean;
begin
  Result := FfonFo3_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetfonFor(Index: Integer; const Astring: string);
begin
  FfonFor := Astring;
  FfonFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.fonFor_Specified(Index: Integer): boolean;
begin
  Result := FfonFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetfonVen(Index: Integer; const Astring: string);
begin
  FfonVen := Astring;
  FfonVen_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.fonVen_Specified(Index: Integer): boolean;
begin
  Result := FfonVen_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetforRep(Index: Integer; const AInteger: Integer);
begin
  FforRep := AInteger;
  FforRep_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.forRep_Specified(Index: Integer): boolean;
begin
  Result := FforRep_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetforTra(Index: Integer; const AInteger: Integer);
begin
  FforTra := AInteger;
  FforTra_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.forTra_Specified(Index: Integer): boolean;
begin
  Result := FforTra_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetforWms(Index: Integer; const Astring: string);
begin
  FforWms := Astring;
  FforWms_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.forWms_Specified(Index: Integer): boolean;
begin
  Result := FforWms_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetgerDir(Index: Integer; const Astring: string);
begin
  FgerDir := Astring;
  FgerDir_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.gerDir_Specified(Index: Integer): boolean;
begin
  Result := FgerDir_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetideFor(Index: Integer; const Astring: string);
begin
  FideFor := Astring;
  FideFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.ideFor_Specified(Index: Integer): boolean;
begin
  Result := FideFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetindBsp(Index: Integer; const Astring: string);
begin
  FindBsp := Astring;
  FindBsp_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.indBsp_Specified(Index: Integer): boolean;
begin
  Result := FindBsp_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetindCoo(Index: Integer; const Astring: string);
begin
  FindCoo := Astring;
  FindCoo_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.indCoo_Specified(Index: Integer): boolean;
begin
  Result := FindCoo_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetindFor(Index: Integer; const Astring: string);
begin
  FindFor := Astring;
  FindFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.indFor_Specified(Index: Integer): boolean;
begin
  Result := FindFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetinsAnp(Index: Integer; const AInteger: Integer);
begin
  FinsAnp := AInteger;
  FinsAnp_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.insAnp_Specified(Index: Integer): boolean;
begin
  Result := FinsAnp_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetinsEst(Index: Integer; const Astring: string);
begin
  FinsEst := Astring;
  FinsEst_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.insEst_Specified(Index: Integer): boolean;
begin
  Result := FinsEst_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetinsMun(Index: Integer; const Astring: string);
begin
  FinsMun := Astring;
  FinsMun_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.insMun_Specified(Index: Integer): boolean;
begin
  Result := FinsMun_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetlimRet(Index: Integer; const Astring: string);
begin
  FlimRet := Astring;
  FlimRet_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.limRet_Specified(Index: Integer): boolean;
begin
  Result := FlimRet_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetmarFor(Index: Integer; const Astring: string);
begin
  FmarFor := Astring;
  FmarFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.marFor_Specified(Index: Integer): boolean;
begin
  Result := FmarFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnenFor(Index: Integer; const Astring: string);
begin
  FnenFor := Astring;
  FnenFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.nenFor_Specified(Index: Integer): boolean;
begin
  Result := FnenFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnomFor(Index: Integer; const Astring: string);
begin
  FnomFor := Astring;
  FnomFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.nomFor_Specified(Index: Integer): boolean;
begin
  Result := FnomFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnomVen(Index: Integer; const Astring: string);
begin
  FnomVen := Astring;
  FnomVen_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.nomVen_Specified(Index: Integer): boolean;
begin
  Result := FnomVen_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnotAfo(Index: Integer; const AInteger: Integer);
begin
  FnotAfo := AInteger;
  FnotAfo_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.notAfo_Specified(Index: Integer): boolean;
begin
  Result := FnotAfo_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnotFor(Index: Integer; const AInteger: Integer);
begin
  FnotFor := AInteger;
  FnotFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.notFor_Specified(Index: Integer): boolean;
begin
  Result := FnotFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnotSis(Index: Integer; const AInteger: Integer);
begin
  FnotSis := AInteger;
  FnotSis_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.notSis_Specified(Index: Integer): boolean;
begin
  Result := FnotSis_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnumIdf(Index: Integer; const Astring: string);
begin
  FnumIdf := Astring;
  FnumIdf_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.numIdf_Specified(Index: Integer): boolean;
begin
  Result := FnumIdf_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetnumRge(Index: Integer; const Astring: string);
begin
  FnumRge := Astring;
  FnumRge_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.numRge_Specified(Index: Integer): boolean;
begin
  Result := FnumRge_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetobsMot(Index: Integer; const Astring: string);
begin
  FobsMot := Astring;
  FobsMot_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.obsMot_Specified(Index: Integer): boolean;
begin
  Result := FobsMot_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetperCod(Index: Integer; const Astring: string);
begin
  FperCod := Astring;
  FperCod_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.perCod_Specified(Index: Integer): boolean;
begin
  Result := FperCod_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetperIcm(Index: Integer; const AInteger: Integer);
begin
  FperIcm := AInteger;
  FperIcm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.perIcm_Specified(Index: Integer): boolean;
begin
  Result := FperIcm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetperPid(Index: Integer; const Astring: string);
begin
  FperPid := Astring;
  FperPid_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.perPid_Specified(Index: Integer): boolean;
begin
  Result := FperPid_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetperRin(Index: Integer; const Astring: string);
begin
  FperRin := Astring;
  FperRin_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.perRin_Specified(Index: Integer): boolean;
begin
  Result := FperRin_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetperRir(Index: Integer; const Astring: string);
begin
  FperRir := Astring;
  FperRir_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.perRir_Specified(Index: Integer): boolean;
begin
  Result := FperRir_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetqtdDep(Index: Integer; const AInteger: Integer);
begin
  FqtdDep := AInteger;
  FqtdDep_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.qtdDep_Specified(Index: Integer): boolean;
begin
  Result := FqtdDep_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetrecCof(Index: Integer; const Astring: string);
begin
  FrecCof := Astring;
  FrecCof_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.recCof_Specified(Index: Integer): boolean;
begin
  Result := FrecCof_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetrecIcm(Index: Integer; const Astring: string);
begin
  FrecIcm := Astring;
  FrecIcm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.recIcm_Specified(Index: Integer): boolean;
begin
  Result := FrecIcm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetrecIpi(Index: Integer; const Astring: string);
begin
  FrecIpi := Astring;
  FrecIpi_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.recIpi_Specified(Index: Integer): boolean;
begin
  Result := FrecIpi_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetrecPis(Index: Integer; const Astring: string);
begin
  FrecPis := Astring;
  FrecPis_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.recPis_Specified(Index: Integer): boolean;
begin
  Result := FrecPis_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetregEst(Index: Integer; const AInteger: Integer);
begin
  FregEst := AInteger;
  FregEst_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.regEst_Specified(Index: Integer): boolean;
begin
  Result := FregEst_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetretCof(Index: Integer; const Astring: string);
begin
  FretCof := Astring;
  FretCof_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.retCof_Specified(Index: Integer): boolean;
begin
  Result := FretCof_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetretCsl(Index: Integer; const Astring: string);
begin
  FretCsl := Astring;
  FretCsl_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.retCsl_Specified(Index: Integer): boolean;
begin
  Result := FretCsl_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetretIrf(Index: Integer; const Astring: string);
begin
  FretIrf := Astring;
  FretIrf_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.retIrf_Specified(Index: Integer): boolean;
begin
  Result := FretIrf_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetretOur(Index: Integer; const Astring: string);
begin
  FretOur := Astring;
  FretOur_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.retOur_Specified(Index: Integer): boolean;
begin
  Result := FretOur_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetretPis(Index: Integer; const Astring: string);
begin
  FretPis := Astring;
  FretPis_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.retPis_Specified(Index: Integer): boolean;
begin
  Result := FretPis_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetretPro(Index: Integer; const Astring: string);
begin
  FretPro := Astring;
  FretPro_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.retPro_Specified(Index: Integer): boolean;
begin
  Result := FretPro_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetrmlVen(Index: Integer; const AInteger: Integer);
begin
  FrmlVen := AInteger;
  FrmlVen_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.rmlVen_Specified(Index: Integer): boolean;
begin
  Result := FrmlVen_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetseqRoe(Index: Integer; const AInteger: Integer);
begin
  FseqRoe := AInteger;
  FseqRoe_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.seqRoe_Specified(Index: Integer): boolean;
begin
  Result := FseqRoe_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetsigUfs(Index: Integer; const Astring: string);
begin
  FsigUfs := Astring;
  FsigUfs_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.sigUfs_Specified(Index: Integer): boolean;
begin
  Result := FsigUfs_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetsitFor(Index: Integer; const Astring: string);
begin
  FsitFor := Astring;
  FsitFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.sitFor_Specified(Index: Integer): boolean;
begin
  Result := FsitFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettemOrm(Index: Integer; const Astring: string);
begin
  FtemOrm := Astring;
  FtemOrm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.temOrm_Specified(Index: Integer): boolean;
begin
  Result := FtemOrm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettipFor(Index: Integer; const Astring: string);
begin
  FtipFor := Astring;
  FtipFor_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.tipFor_Specified(Index: Integer): boolean;
begin
  Result := FtipFor_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettipMer(Index: Integer; const Astring: string);
begin
  FtipMer := Astring;
  FtipMer_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.tipMer_Specified(Index: Integer): boolean;
begin
  Result := FtipMer_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettipPgt(Index: Integer; const Astring: string);
begin
  FtipPgt := Astring;
  FtipPgt_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.tipPgt_Specified(Index: Integer): boolean;
begin
  Result := FtipPgt_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettriIcm(Index: Integer; const Astring: string);
begin
  FtriIcm := Astring;
  FtriIcm_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.triIcm_Specified(Index: Integer): boolean;
begin
  Result := FtriIcm_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettriIpi(Index: Integer; const Astring: string);
begin
  FtriIpi := Astring;
  FtriIpi_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.triIpi_Specified(Index: Integer): boolean;
begin
  Result := FtriIpi_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SettriIss(Index: Integer; const Astring: string);
begin
  FtriIss := Astring;
  FtriIss_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.triIss_Specified(Index: Integer): boolean;
begin
  Result := FtriIss_Specified;
end;

procedure fornecedorIncluirFornecedorInDadosGerais.SetzipCod(Index: Integer; const Astring: string);
begin
  FzipCod := Astring;
  FzipCod_Specified := True;
end;

function fornecedorIncluirFornecedorInDadosGerais.zipCod_Specified(Index: Integer): boolean;
begin
  Result := FzipCod_Specified;
end;

procedure fornecedorIncluirFornecedorOutRetornos.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function fornecedorIncluirFornecedorOutRetornos.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure fornecedorIncluirFornecedorOutRetornos.SetforRet(Index: Integer; const AInteger: Integer);
begin
  FforRet := AInteger;
  FforRet_Specified := True;
end;

function fornecedorIncluirFornecedorOutRetornos.forRet_Specified(Index: Integer): boolean;
begin
  Result := FforRet_Specified;
end;

procedure fornecedorIncluirFornecedorOutRetornos.SetnomFor(Index: Integer; const Astring: string);
begin
  FnomFor := Astring;
  FnomFor_Specified := True;
end;

function fornecedorIncluirFornecedorOutRetornos.nomFor_Specified(Index: Integer): boolean;
begin
  Result := FnomFor_Specified;
end;

procedure fornecedorIncluirFornecedorOutRetornos.SetretExe(Index: Integer; const Astring: string);
begin
  FretExe := Astring;
  FretExe_Specified := True;
end;

function fornecedorIncluirFornecedorOutRetornos.retExe_Specified(Index: Integer): boolean;
begin
  Result := FretExe_Specified;
end;

procedure fornecedorIncluirFornecedorOutRetornos.SetsitFor(Index: Integer; const Astring: string);
begin
  FsitFor := Astring;
  FsitFor_Specified := True;
end;

function fornecedorIncluirFornecedorOutRetornos.sitFor_Specified(Index: Integer): boolean;
begin
  Result := FsitFor_Specified;
end;

initialization
  { sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor), ioLiteral);
  { sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor.IncluirFornecedor }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor), 'IncluirFornecedor', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_fornecedor), 'IncluirFornecedor', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_fornecedorIncluirFornecedorInDadosGerais), 'http://services.senior.com.br', 'Array_Of_fornecedorIncluirFornecedorInDadosGerais');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_fornecedorIncluirFornecedorOutRetornos), 'http://services.senior.com.br', 'Array_Of_fornecedorIncluirFornecedorOutRetornos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes), 'http://services.senior.com.br', 'Array_Of_fornecedorIncluirFornecedorInDadosGeraisDefinicoes');
  RemClassRegistry.RegisterXSClass(fornecedorIncluirFornecedorIn, 'http://services.senior.com.br', 'fornecedorIncluirFornecedorIn');
  RemClassRegistry.RegisterXSClass(fornecedorIncluirFornecedorOut, 'http://services.senior.com.br', 'fornecedorIncluirFornecedorOut');
  RemClassRegistry.RegisterSerializeOptions(fornecedorIncluirFornecedorOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(fornecedorIncluirFornecedorInDadosGeraisDefinicoes, 'http://services.senior.com.br', 'fornecedorIncluirFornecedorInDadosGeraisDefinicoes');
  RemClassRegistry.RegisterXSClass(fornecedorIncluirFornecedorInDadosGerais, 'http://services.senior.com.br', 'fornecedorIncluirFornecedorInDadosGerais');
  RemClassRegistry.RegisterXSClass(fornecedorIncluirFornecedorOutRetornos, 'http://services.senior.com.br', 'fornecedorIncluirFornecedorOutRetornos');

end.