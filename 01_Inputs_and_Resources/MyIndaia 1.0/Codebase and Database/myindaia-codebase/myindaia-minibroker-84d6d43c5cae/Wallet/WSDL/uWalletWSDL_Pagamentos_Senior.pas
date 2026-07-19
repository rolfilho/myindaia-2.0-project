// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (22/01/2019 18:29:47 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_Pagamentos_Senior;

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
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  titulosConsultarCP2In = class;                { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarCP2OutTitulos = class;        { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosCP2OutTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosCP2Out = class;        { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosCP2In = class;         { "http://services.senior.com.br"[GblCplx] }
  titulosaprovarCPOut  = class;                 { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosAbertosCP2Out = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosCPIn = class;          { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCPOut = class;       { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosaprovarCPIn   = class;                 { "http://services.senior.com.br"[GblCplx] }
  titulosbuscarPendentesCPOut = class;          { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosreprovarCPIn  = class;                 { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCPOut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosGerarBaixaPorLoteCPOut = class;        { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEstornoBaixaTitulosCPIn = class;       { "http://services.senior.com.br"[GblCplx] }
  titulosreprovarCPOut = class;                 { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarCP2Out = class;               { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosExcluirTitulosCPIn = class;            { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCPInEntradaTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCPIn = class;        { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCP2In = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosaprovarCPOutRetorno = class;           { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCP2OutTitulosRateios = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCP2OutTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosaprovarCPInTitulo = class;             { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCPOutGridResult = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCPInEntradaTitulosRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosbuscarPendentesCPIn = class;           { "http://services.senior.com.br"[GblCplx] }
  titulosbuscarPendentesCPOutTitulo = class;    { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCPOutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMInTitulosACalcular = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMIn = class;                { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCPOutGridRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMOut = class;               { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosreprovarCPInTitulo = class;            { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMOutTitulosCalculados = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCPInGridTitulosBaixar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCPIn = class;         { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCPOutGridRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCPInGridTitulosCRE = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCPInGridTitulosBAI = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCPIn = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosreprovarCPOutRetorno = class;          { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCPInTitulosPagar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCPOutRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCPOut = class;      { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosExcluirTitulosCPInTitulos = class;     { "http://services.senior.com.br"[GblCplx] }
  titulosExcluirTitulosCPOut = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosExcluirTitulosCPOutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCP2In = class;      { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCP2InTitulosPagar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCP2Out = class;     { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarCPOutTitulos = class;         { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCPOutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarCPIn = class;                 { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarCPOut = class;                { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEstornoBaixaTitulosCP2OutRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCPIn = class;             { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCPInBaixaTituloPagar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCPOut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosAbertosCPOutTitulosRateios = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCPIn = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCPOut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosAbertosCPOutTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarVariacaoCambialOut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosProcessarVariacaoCambialOutTitulosCalculados = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCPIn = class;         { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarVariacaoCambialInTitulosACalcular = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosCPOut = class;         { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosCPOutTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarVariacaoCambialIn = class;    { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCPInTitulosBaixar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCPIn = class;             { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCPInTitulos = class;      { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCPOut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosSubstituirTitulosCPOutGridResult = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCPInTitulosSubstitutos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCPInTitulosSubstitutosRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCPOut = class;        { "http://services.senior.com.br"[Lit][GblCplx] }

  Array_Of_titulosConsultarCP2OutTitulos = array of titulosConsultarCP2OutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosCP2OutTitulos = array of titulosConsultarTitulosCP2OutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosLoteCPOutGridResult = array of titulosEntradaTitulosLoteCPOutGridResult;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosbuscarPendentesCPOutTitulo = array of titulosbuscarPendentesCPOutTitulo;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosaprovarCPInTitulo = array of titulosaprovarCPInTitulo;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio = array of titulosEntradaTitulosLoteCPInEntradaTitulosRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExcluirTitulosCPInTitulos = array of titulosExcluirTitulosCPInTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExcluirTitulosCPOutResultado = array of titulosExcluirTitulosCPOutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos = array of titulosEntradaTitulosLoteCPInEntradaTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar = array of titulosGerarBaixaPorLoteCPInGridTitulosBaixar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno = array of titulosGerarBaixaPorLoteCPOutGridRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI = array of titulosGerarBaixaAproveitamentoCPInGridTitulosBAI;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCPOutResultado = array of titulosBaixarTitulosCPOutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosAbertosCPOutTitulos = array of titulosConsultarTitulosAbertosCPOutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios = array of titulosConsultarTitulosAbertosCPOutTitulosRateios;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar = array of titulosBaixarTitulosCPInBaixaTituloPagar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE = array of titulosGerarBaixaAproveitamentoCPInGridTitulosCRE;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosreprovarCPOutRetorno = array of titulosreprovarCPOutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar = array of titulosEstornoBaixaTitulosCPInTitulosPagar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCPOutRetorno = array of titulosEstornoBaixaTitulosCPOutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosreprovarCPInTitulo = array of titulosreprovarCPInTitulo;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno = array of titulosGerarBaixaAproveitamentoCPOutGridRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarAVMInTitulosACalcular = array of titulosProcessarAVMInTitulosACalcular;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarAVMOutTitulosCalculados = array of titulosProcessarAVMOutTitulosCalculados;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular = array of titulosProcessarVariacaoCambialInTitulosACalcular;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados = array of titulosProcessarVariacaoCambialOutTitulosCalculados;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCPInTitulosBaixar = array of titulosSubstituirTitulosCPInTitulosBaixar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosCPOutTitulos = array of titulosConsultarTitulosCPOutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosaprovarCPOutRetorno = array of titulosaprovarCPOutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos = array of titulosConsultarTitulosAbertosCP2OutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios = array of titulosConsultarTitulosAbertosCP2OutTitulosRateios;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos = array of titulosSubstituirTitulosCPInTitulosSubstitutos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarCPOutTitulos = array of titulosConsultarCPOutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar = array of titulosEstornoBaixaTitulosCP2InTitulosPagar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno = array of titulosEstornoBaixaTitulosCP2OutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGravarTitulosCPOutResultado = array of titulosGravarTitulosCPOutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio = array of titulosSubstituirTitulosCPInTitulosSubstitutosRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCPOutGridResult = array of titulosSubstituirTitulosCPOutGridResult;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGravarTitulosCPInTitulos = array of titulosGravarTitulosCPInTitulos;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : titulosConsultarCP2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarCP2In = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property codEmp:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property dataBuild:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarCP2OutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarCP2OutTitulos = class(TRemotable)
  private
    FabrFpj: string;
    FabrFpj_Specified: boolean;
    FabrPrj: string;
    FabrPrj_Specified: boolean;
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcodUsu: string;
    FcodUsu_Specified: boolean;
    FcorApr: string;
    FcorApr_Specified: boolean;
    FcotApr: string;
    FcotApr_Specified: boolean;
    FcotEmi: string;
    FcotEmi_Specified: boolean;
    FctaApr: string;
    FctaApr_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FdatApr: string;
    FdatApr_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscApr: string;
    FdscApr_Specified: boolean;
    FempApr: string;
    FempApr_Specified: boolean;
    FencApr: string;
    FencApr_Specified: boolean;
    FfpgApr: string;
    FfpgApr_Specified: boolean;
    FhorApr: string;
    FhorApr_Specified: boolean;
    FjrsApr: string;
    FjrsApr_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FlibApr: string;
    FlibApr_Specified: boolean;
    FmulApr: string;
    FmulApr_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FoacApr: string;
    FoacApr_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FodeApr: string;
    FodeApr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FpgtApr: string;
    FpgtApr_Specified: boolean;
    FporAnt: string;
    FporAnt_Specified: boolean;
    FseqApr: string;
    FseqApr_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtipTcc: string;
    FtipTcc_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FusuSit: string;
    FusuSit_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrApr: string;
    FvlrApr_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    procedure SetabrFpj(Index: Integer; const Astring: string);
    function  abrFpj_Specified(Index: Integer): boolean;
    procedure SetabrPrj(Index: Integer; const Astring: string);
    function  abrPrj_Specified(Index: Integer): boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcodUsu(Index: Integer; const Astring: string);
    function  codUsu_Specified(Index: Integer): boolean;
    procedure SetcorApr(Index: Integer; const Astring: string);
    function  corApr_Specified(Index: Integer): boolean;
    procedure SetcotApr(Index: Integer; const Astring: string);
    function  cotApr_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const Astring: string);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetctaApr(Index: Integer; const Astring: string);
    function  ctaApr_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatApr(Index: Integer; const Astring: string);
    function  datApr_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscApr(Index: Integer; const Astring: string);
    function  dscApr_Specified(Index: Integer): boolean;
    procedure SetempApr(Index: Integer; const Astring: string);
    function  empApr_Specified(Index: Integer): boolean;
    procedure SetencApr(Index: Integer; const Astring: string);
    function  encApr_Specified(Index: Integer): boolean;
    procedure SetfpgApr(Index: Integer; const Astring: string);
    function  fpgApr_Specified(Index: Integer): boolean;
    procedure SethorApr(Index: Integer; const Astring: string);
    function  horApr_Specified(Index: Integer): boolean;
    procedure SetjrsApr(Index: Integer; const Astring: string);
    function  jrsApr_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetlibApr(Index: Integer; const Astring: string);
    function  libApr_Specified(Index: Integer): boolean;
    procedure SetmulApr(Index: Integer; const Astring: string);
    function  mulApr_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetoacApr(Index: Integer; const Astring: string);
    function  oacApr_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetodeApr(Index: Integer; const Astring: string);
    function  odeApr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpgtApr(Index: Integer; const Astring: string);
    function  pgtApr_Specified(Index: Integer): boolean;
    procedure SetporAnt(Index: Integer; const Astring: string);
    function  porAnt_Specified(Index: Integer): boolean;
    procedure SetseqApr(Index: Integer; const Astring: string);
    function  seqApr_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const Astring: string);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetusuSit(Index: Integer; const Astring: string);
    function  usuSit_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrApr(Index: Integer; const Astring: string);
    function  vlrApr_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property abrFpj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrFpj write SetabrFpj stored abrFpj_Specified;
    property abrPrj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrPrj write SetabrPrj stored abrPrj_Specified;
    property ccbFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cnpjFilial: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property codTri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property codUsu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodUsu write SetcodUsu stored codUsu_Specified;
    property corApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcorApr write SetcorApr stored corApr_Specified;
    property cotApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotApr write SetcotApr stored cotApr_Specified;
    property cotEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property ctaApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaApr write SetctaApr stored ctaApr_Specified;
    property ctaFin:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatApr write SetdatApr stored datApr_Specified;
    property datDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscApr write SetdscApr stored dscApr_Specified;
    property empApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempApr write SetempApr stored empApr_Specified;
    property encApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FencApr write SetencApr stored encApr_Specified;
    property fpgApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfpgApr write SetfpgApr stored fpgApr_Specified;
    property horApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhorApr write SethorApr stored horApr_Specified;
    property jrsApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsApr write SetjrsApr stored jrsApr_Specified;
    property jrsDia:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property libApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlibApr write SetlibApr stored libApr_Specified;
    property mulApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulApr write SetmulApr stored mulApr_Specified;
    property mulNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numArb:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numPrj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property oacApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoacApr write SetoacApr stored oacApr_Specified;
    property obsTcp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property odeApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FodeApr write SetodeApr stored odeApr_Specified;
    property outNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property pgtApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtApr write SetpgtApr stored pgtApr_Specified;
    property porAnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporAnt write SetporAnt stored porAnt_Specified;
    property seqApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqApr write SetseqApr stored seqApr_Specified;
    property tipJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tipTcc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property titBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property usuSit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FusuSit write SetusuSit stored usuSit_Specified;
    property vctOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrApr write SetvlrApr stored vlrApr_Specified;
    property vlrDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCP2OutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosCP2OutTitulos = class(TRemotable)
  private
    FabrFpj: string;
    FabrFpj_Specified: boolean;
    FabrPrj: string;
    FabrPrj_Specified: boolean;
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcodUsu: string;
    FcodUsu_Specified: boolean;
    FcorApr: string;
    FcorApr_Specified: boolean;
    FcotApr: string;
    FcotApr_Specified: boolean;
    FcotEmi: string;
    FcotEmi_Specified: boolean;
    FctaApr: string;
    FctaApr_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FdatApr: string;
    FdatApr_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscApr: string;
    FdscApr_Specified: boolean;
    FempApr: string;
    FempApr_Specified: boolean;
    FencApr: string;
    FencApr_Specified: boolean;
    FfpgApr: string;
    FfpgApr_Specified: boolean;
    FhorApr: string;
    FhorApr_Specified: boolean;
    FjrsApr: string;
    FjrsApr_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FlibApr: string;
    FlibApr_Specified: boolean;
    FmulApr: string;
    FmulApr_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FoacApr: string;
    FoacApr_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FodeApr: string;
    FodeApr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FpgtApr: string;
    FpgtApr_Specified: boolean;
    FporAnt: string;
    FporAnt_Specified: boolean;
    FseqApr: string;
    FseqApr_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtipTcc: string;
    FtipTcc_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FusuSit: string;
    FusuSit_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrApr: string;
    FvlrApr_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    procedure SetabrFpj(Index: Integer; const Astring: string);
    function  abrFpj_Specified(Index: Integer): boolean;
    procedure SetabrPrj(Index: Integer; const Astring: string);
    function  abrPrj_Specified(Index: Integer): boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcodUsu(Index: Integer; const Astring: string);
    function  codUsu_Specified(Index: Integer): boolean;
    procedure SetcorApr(Index: Integer; const Astring: string);
    function  corApr_Specified(Index: Integer): boolean;
    procedure SetcotApr(Index: Integer; const Astring: string);
    function  cotApr_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const Astring: string);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetctaApr(Index: Integer; const Astring: string);
    function  ctaApr_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatApr(Index: Integer; const Astring: string);
    function  datApr_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscApr(Index: Integer; const Astring: string);
    function  dscApr_Specified(Index: Integer): boolean;
    procedure SetempApr(Index: Integer; const Astring: string);
    function  empApr_Specified(Index: Integer): boolean;
    procedure SetencApr(Index: Integer; const Astring: string);
    function  encApr_Specified(Index: Integer): boolean;
    procedure SetfpgApr(Index: Integer; const Astring: string);
    function  fpgApr_Specified(Index: Integer): boolean;
    procedure SethorApr(Index: Integer; const Astring: string);
    function  horApr_Specified(Index: Integer): boolean;
    procedure SetjrsApr(Index: Integer; const Astring: string);
    function  jrsApr_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetlibApr(Index: Integer; const Astring: string);
    function  libApr_Specified(Index: Integer): boolean;
    procedure SetmulApr(Index: Integer; const Astring: string);
    function  mulApr_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetoacApr(Index: Integer; const Astring: string);
    function  oacApr_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetodeApr(Index: Integer; const Astring: string);
    function  odeApr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpgtApr(Index: Integer; const Astring: string);
    function  pgtApr_Specified(Index: Integer): boolean;
    procedure SetporAnt(Index: Integer; const Astring: string);
    function  porAnt_Specified(Index: Integer): boolean;
    procedure SetseqApr(Index: Integer; const Astring: string);
    function  seqApr_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const Astring: string);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetusuSit(Index: Integer; const Astring: string);
    function  usuSit_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrApr(Index: Integer; const Astring: string);
    function  vlrApr_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property abrFpj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrFpj write SetabrFpj stored abrFpj_Specified;
    property abrPrj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrPrj write SetabrPrj stored abrPrj_Specified;
    property ccbFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cnpjFilial: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property codTri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property codUsu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodUsu write SetcodUsu stored codUsu_Specified;
    property corApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcorApr write SetcorApr stored corApr_Specified;
    property cotApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotApr write SetcotApr stored cotApr_Specified;
    property cotEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property ctaApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaApr write SetctaApr stored ctaApr_Specified;
    property ctaFin:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatApr write SetdatApr stored datApr_Specified;
    property datDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscApr write SetdscApr stored dscApr_Specified;
    property empApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempApr write SetempApr stored empApr_Specified;
    property encApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FencApr write SetencApr stored encApr_Specified;
    property fpgApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfpgApr write SetfpgApr stored fpgApr_Specified;
    property horApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhorApr write SethorApr stored horApr_Specified;
    property jrsApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsApr write SetjrsApr stored jrsApr_Specified;
    property jrsDia:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property libApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlibApr write SetlibApr stored libApr_Specified;
    property mulApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulApr write SetmulApr stored mulApr_Specified;
    property mulNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numArb:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numPrj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property oacApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoacApr write SetoacApr stored oacApr_Specified;
    property obsTcp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property odeApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FodeApr write SetodeApr stored odeApr_Specified;
    property outNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property pgtApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtApr write SetpgtApr stored pgtApr_Specified;
    property porAnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporAnt write SetporAnt stored porAnt_Specified;
    property seqApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqApr write SetseqApr stored seqApr_Specified;
    property tipJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tipTcc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property titBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property usuSit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FusuSit write SetusuSit stored usuSit_Specified;
    property vctOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrApr write SetvlrApr stored vlrApr_Specified;
    property vlrDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCP2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTitulosCP2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarTitulosCP2OutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosCP2OutTitulos: Array_Of_titulosConsultarTitulosCP2OutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarTitulosCP2OutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCP2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosCP2In = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property codEmp:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property dataBuild:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosaprovarCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosaprovarCPOut = class(TRemotable)
  private
    FcodigoResultado: string;
    FcodigoResultado_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    Fretorno: Array_Of_titulosaprovarCPOutRetorno;
    Fretorno_Specified: boolean;
    procedure SetcodigoResultado(Index: Integer; const Astring: string);
    function  codigoResultado_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosaprovarCPOutRetorno: Array_Of_titulosaprovarCPOutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property codigoResultado: string                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoResultado write SetcodigoResultado stored codigoResultado_Specified;
    property erroExecucao:    string                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property resultado:       string                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property retorno:         Array_Of_titulosaprovarCPOutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCP2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCP2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCP2OutTitulos: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosCPIn = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property codEmp:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property dataBuild:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEntradaTitulosLoteCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridResult: Array_Of_titulosEntradaTitulosLoteCPOutGridResult;
    FgridResult_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridResult(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCPOutGridResult: Array_Of_titulosEntradaTitulosLoteCPOutGridResult);
    function  gridResult_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridResult:   Array_Of_titulosEntradaTitulosLoteCPOutGridResult  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridResult write SetgridResult stored gridResult_Specified;
    property resultado:    string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosaprovarCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosaprovarCPIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Ftitulo: Array_Of_titulosaprovarCPInTitulo;
    Ftitulo_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Settitulo(Index: Integer; const AArray_Of_titulosaprovarCPInTitulo: Array_Of_titulosaprovarCPInTitulo);
    function  titulo_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID: string                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulo:         Array_Of_titulosaprovarCPInTitulo  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulo write Settitulo stored titulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosbuscarPendentesCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosbuscarPendentesCPOut = class(TRemotable)
  private
    FcodigoResultado: string;
    FcodigoResultado_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    Ftitulo: Array_Of_titulosbuscarPendentesCPOutTitulo;
    Ftitulo_Specified: boolean;
    procedure SetcodigoResultado(Index: Integer; const Astring: string);
    function  codigoResultado_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure Settitulo(Index: Integer; const AArray_Of_titulosbuscarPendentesCPOutTitulo: Array_Of_titulosbuscarPendentesCPOutTitulo);
    function  titulo_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property codigoResultado: string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoResultado write SetcodigoResultado stored codigoResultado_Specified;
    property erroExecucao:    string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property resultado:       string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property titulo:          Array_Of_titulosbuscarPendentesCPOutTitulo  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulo write Settitulo stored titulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosreprovarCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosreprovarCPIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Ftitulo: Array_Of_titulosreprovarCPInTitulo;
    Ftitulo_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Settitulo(Index: Integer; const AArray_Of_titulosreprovarCPInTitulo: Array_Of_titulosreprovarCPInTitulo);
    function  titulo_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID: string                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulo:         Array_Of_titulosreprovarCPInTitulo  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulo write Settitulo stored titulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridRetorno: Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno;
    FgridRetorno_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno: Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno);
    function  gridRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridRetorno:  Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridRetorno write SetgridRetorno stored gridRetorno_Specified;
    property resultado:    string                                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridRetorno: Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno;
    FgridRetorno_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCPOutGridRetorno: Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno);
    function  gridRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridRetorno:  Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridRetorno write SetgridRetorno stored gridRetorno_Specified;
    property resultado:    string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCPIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FsistemaIntegracao: string;
    FsistemaIntegracao_Specified: boolean;
    FtitulosPagar: Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar;
    FtitulosPagar_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetsistemaIntegracao(Index: Integer; const Astring: string);
    function  sistemaIntegracao_Specified(Index: Integer): boolean;
    procedure SettitulosPagar(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCPInTitulosPagar: Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar);
    function  titulosPagar_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID:    string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:          string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property sistemaIntegracao: string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsistemaIntegracao write SetsistemaIntegracao stored sistemaIntegracao_Specified;
    property titulosPagar:      Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosPagar write SettitulosPagar stored titulosPagar_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosreprovarCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosreprovarCPOut = class(TRemotable)
  private
    FcodigoResultado: string;
    FcodigoResultado_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    Fretorno: Array_Of_titulosreprovarCPOutRetorno;
    Fretorno_Specified: boolean;
    procedure SetcodigoResultado(Index: Integer; const Astring: string);
    function  codigoResultado_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosreprovarCPOutRetorno: Array_Of_titulosreprovarCPOutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property codigoResultado: string                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoResultado write SetcodigoResultado stored codigoResultado_Specified;
    property erroExecucao:    string                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property resultado:       string                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property retorno:         Array_Of_titulosreprovarCPOutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarCP2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarCP2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarCP2OutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarCP2OutTitulos: Array_Of_titulosConsultarCP2OutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarCP2OutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExcluirTitulosCPIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Ftitulos: Array_Of_titulosExcluirTitulosCPInTitulos;
    Ftitulos_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosExcluirTitulosCPInTitulos: Array_Of_titulosExcluirTitulosCPInTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID: string                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulos:        Array_Of_titulosExcluirTitulosCPInTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCPInEntradaTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCPInEntradaTitulos = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodFav: Double;
    FcodFav_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcotEmi: Double;
    FcotEmi_Specified: boolean;
    FcotNeg: Double;
    FcotNeg_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscNeg: Double;
    FdscNeg_Specified: boolean;
    FjrsDia: Double;
    FjrsDia_Specified: boolean;
    FjrsNeg: Double;
    FjrsNeg_Specified: boolean;
    FmulNeg: Double;
    FmulNeg_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FperDsc: Integer;
    FperDsc_Specified: boolean;
    FperJrs: Integer;
    FperJrs_Specified: boolean;
    FperMul: Integer;
    FperMul_Specified: boolean;
    FpriPgt: Integer;
    FpriPgt_Specified: boolean;
    FproJrs: string;
    FproJrs_Specified: boolean;
    Frateio: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio;
    Frateio_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtipTcc: Integer;
    FtipTcc_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FtolJrs: Integer;
    FtolJrs_Specified: boolean;
    FtolMul: Integer;
    FtolMul_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvctPro: string;
    FvctPro_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    FvlrRba: Double;
    FvlrRba_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodFav(Index: Integer; const ADouble: Double);
    function  codFav_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const ADouble: Double);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetcotNeg(Index: Integer; const ADouble: Double);
    function  cotNeg_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscNeg(Index: Integer; const ADouble: Double);
    function  dscNeg_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const ADouble: Double);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const ADouble: Double);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const ADouble: Double);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const AInteger: Integer);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const AInteger: Integer);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const AInteger: Integer);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpriPgt(Index: Integer; const AInteger: Integer);
    function  priPgt_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const Astring: string);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const AInteger: Integer);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const AInteger: Integer);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const AInteger: Integer);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvctPro(Index: Integer; const Astring: string);
    function  vctPro_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
    procedure SetvlrRba(Index: Integer; const ADouble: Double);
    function  vlrRba_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property antDsc: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property ccbFor: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property codAge: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCcu: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codFav: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFav write SetcodFav stored codFav_Specified;
    property codFil: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cotEmi: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property cotNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotNeg write SetcotNeg stored cotNeg_Specified;
    property ctaFin: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datDsc: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property jrsDia: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numPrj: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcp: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property outNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property priPgt: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpriPgt write SetpriPgt stored priPgt_Specified;
    property proJrs: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property rateio: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property tipJrs: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tipTcc: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property titBan: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property vctOri: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrDsc: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
    property vlrRba: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrRba write SetvlrRba stored vlrRba_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCPIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FentradaTitulos: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos;
    FentradaTitulos_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FforCli: string;
    FforCli_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCPInEntradaTitulos: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos);
    function  entradaTitulos_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetforCli(Index: Integer; const Astring: string);
    function  forCli_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:         Integer                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property entradaTitulos: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FentradaTitulos write SetentradaTitulos stored entradaTitulos_Specified;
    property flowInstanceID: string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property forCli:         string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforCli write SetforCli stored forCli_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCP2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCP2In = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FfilCtr: Integer;
    FfilCtr_Specified: boolean;
    FfilNfc: Integer;
    FfilNfc_Specified: boolean;
    FfilNff: Integer;
    FfilNff_Specified: boolean;
    FfilNfv: Integer;
    FfilNfv_Specified: boolean;
    FfilOcp: Integer;
    FfilOcp_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FforNfc: Integer;
    FforNfc_Specified: boolean;
    FforNff: Integer;
    FforNff_Specified: boolean;
    FnumCtr: Integer;
    FnumCtr_Specified: boolean;
    FnumNfc: Integer;
    FnumNfc_Specified: boolean;
    FnumNff: Integer;
    FnumNff_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumOcp: Integer;
    FnumOcp_Specified: boolean;
    FocpFre: Integer;
    FocpFre_Specified: boolean;
    FocpNre: Integer;
    FocpNre_Specified: boolean;
    FretRat: string;
    FretRat_Specified: boolean;
    FseqImo: Integer;
    FseqImo_Specified: boolean;
    FsnfNfc: string;
    FsnfNfc_Specified: boolean;
    FsnfNfv: string;
    FsnfNfv_Specified: boolean;
    FvctFim: string;
    FvctFim_Specified: boolean;
    FvctIni: string;
    FvctIni_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetfilCtr(Index: Integer; const AInteger: Integer);
    function  filCtr_Specified(Index: Integer): boolean;
    procedure SetfilNfc(Index: Integer; const AInteger: Integer);
    function  filNfc_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const AInteger: Integer);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetfilNfv(Index: Integer; const AInteger: Integer);
    function  filNfv_Specified(Index: Integer): boolean;
    procedure SetfilOcp(Index: Integer; const AInteger: Integer);
    function  filOcp_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetforNfc(Index: Integer; const AInteger: Integer);
    function  forNfc_Specified(Index: Integer): boolean;
    procedure SetforNff(Index: Integer; const AInteger: Integer);
    function  forNff_Specified(Index: Integer): boolean;
    procedure SetnumCtr(Index: Integer; const AInteger: Integer);
    function  numCtr_Specified(Index: Integer): boolean;
    procedure SetnumNfc(Index: Integer; const AInteger: Integer);
    function  numNfc_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const AInteger: Integer);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumOcp(Index: Integer; const AInteger: Integer);
    function  numOcp_Specified(Index: Integer): boolean;
    procedure SetocpFre(Index: Integer; const AInteger: Integer);
    function  ocpFre_Specified(Index: Integer): boolean;
    procedure SetocpNre(Index: Integer; const AInteger: Integer);
    function  ocpNre_Specified(Index: Integer): boolean;
    procedure SetretRat(Index: Integer; const Astring: string);
    function  retRat_Specified(Index: Integer): boolean;
    procedure SetseqImo(Index: Integer; const AInteger: Integer);
    function  seqImo_Specified(Index: Integer): boolean;
    procedure SetsnfNfc(Index: Integer; const Astring: string);
    function  snfNfc_Specified(Index: Integer): boolean;
    procedure SetsnfNfv(Index: Integer; const Astring: string);
    function  snfNfv_Specified(Index: Integer): boolean;
    procedure SetvctFim(Index: Integer; const Astring: string);
    function  vctFim_Specified(Index: Integer): boolean;
    procedure SetvctIni(Index: Integer; const Astring: string);
    function  vctIni_Specified(Index: Integer): boolean;
  published
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property filCtr:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCtr write SetfilCtr stored filCtr_Specified;
    property filNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfc write SetfilNfc stored filNfc_Specified;
    property filNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property filNfv:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfv write SetfilNfv stored filNfv_Specified;
    property filOcp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilOcp write SetfilOcp stored filOcp_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property forNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNfc write SetforNfc stored forNfc_Specified;
    property forNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNff write SetforNff stored forNff_Specified;
    property numCtr:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCtr write SetnumCtr stored numCtr_Specified;
    property numNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfc write SetnumNfc stored numNfc_Specified;
    property numNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numNfv:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numOcp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumOcp write SetnumOcp stored numOcp_Specified;
    property ocpFre:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpFre write SetocpFre stored ocpFre_Specified;
    property ocpNre:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpNre write SetocpNre stored ocpNre_Specified;
    property retRat:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretRat write SetretRat stored retRat_Specified;
    property seqImo:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqImo write SetseqImo stored seqImo_Specified;
    property snfNfc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfc write SetsnfNfc stored snfNfc_Specified;
    property snfNfv:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfv write SetsnfNfv stored snfNfv_Specified;
    property vctFim:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctFim write SetvctFim stored vctFim_Specified;
    property vctIni:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctIni write SetvctIni stored vctIni_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosaprovarCPOutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosaprovarCPOutRetorno = class(TRemotable)
  private
    FcodigoEmpresa: Integer;
    FcodigoEmpresa_Specified: boolean;
    FcodigoFilial: Integer;
    FcodigoFilial_Specified: boolean;
    FcodigoFornecedor: Integer;
    FcodigoFornecedor_Specified: boolean;
    FmensagemErro: string;
    FmensagemErro_Specified: boolean;
    Fnumero: string;
    Fnumero_Specified: boolean;
    Fsequencia: Integer;
    Fsequencia_Specified: boolean;
    FtipoTitulo: string;
    FtipoTitulo_Specified: boolean;
    procedure SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
    function  codigoEmpresa_Specified(Index: Integer): boolean;
    procedure SetcodigoFilial(Index: Integer; const AInteger: Integer);
    function  codigoFilial_Specified(Index: Integer): boolean;
    procedure SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
    function  codigoFornecedor_Specified(Index: Integer): boolean;
    procedure SetmensagemErro(Index: Integer; const Astring: string);
    function  mensagemErro_Specified(Index: Integer): boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setsequencia(Index: Integer; const AInteger: Integer);
    function  sequencia_Specified(Index: Integer): boolean;
    procedure SettipoTitulo(Index: Integer; const Astring: string);
    function  tipoTitulo_Specified(Index: Integer): boolean;
  published
    property codigoEmpresa:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoEmpresa write SetcodigoEmpresa stored codigoEmpresa_Specified;
    property codigoFilial:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFilial write SetcodigoFilial stored codigoFilial_Specified;
    property codigoFornecedor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFornecedor write SetcodigoFornecedor stored codigoFornecedor_Specified;
    property mensagemErro:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemErro write SetmensagemErro stored mensagemErro_Specified;
    property numero:           string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property sequencia:        Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fsequencia write Setsequencia stored sequencia_Specified;
    property tipoTitulo:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoTitulo write SettipoTitulo stored tipoTitulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCP2OutTitulosRateios, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCP2OutTitulosRateios = class(TRemotable)
  private
    FabrFpj: string;
    FabrFpj_Specified: boolean;
    FabrPrj: string;
    FabrPrj_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcriRat: Integer;
    FcriRat_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FdatBas: string;
    FdatBas_Specified: boolean;
    FmesAno: string;
    FmesAno_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: Double;
    FperCta_Specified: boolean;
    FperRat: Double;
    FperRat_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    FseqRat: Integer;
    FseqRat_Specified: boolean;
    FsomSub: Integer;
    FsomSub_Specified: boolean;
    FtipOri: string;
    FtipOri_Specified: boolean;
    FvlrCta: Double;
    FvlrCta_Specified: boolean;
    FvlrRat: Double;
    FvlrRat_Specified: boolean;
    procedure SetabrFpj(Index: Integer; const Astring: string);
    function  abrFpj_Specified(Index: Integer): boolean;
    procedure SetabrPrj(Index: Integer; const Astring: string);
    function  abrPrj_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcriRat(Index: Integer; const AInteger: Integer);
    function  criRat_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatBas(Index: Integer; const Astring: string);
    function  datBas_Specified(Index: Integer): boolean;
    procedure SetmesAno(Index: Integer; const Astring: string);
    function  mesAno_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const ADouble: Double);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const ADouble: Double);
    function  perRat_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SetseqRat(Index: Integer; const AInteger: Integer);
    function  seqRat_Specified(Index: Integer): boolean;
    procedure SetsomSub(Index: Integer; const AInteger: Integer);
    function  somSub_Specified(Index: Integer): boolean;
    procedure SettipOri(Index: Integer; const Astring: string);
    function  tipOri_Specified(Index: Integer): boolean;
    procedure SetvlrCta(Index: Integer; const ADouble: Double);
    function  vlrCta_Specified(Index: Integer): boolean;
    procedure SetvlrRat(Index: Integer; const ADouble: Double);
    function  vlrRat_Specified(Index: Integer): boolean;
  published
    property abrFpj: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrFpj write SetabrFpj stored abrFpj_Specified;
    property abrPrj: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FabrPrj write SetabrPrj stored abrPrj_Specified;
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTns: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property criRat: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriRat write SetcriRat stored criRat_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datBas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatBas write SetdatBas stored datBas_Specified;
    property mesAno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmesAno write SetmesAno stored mesAno_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property seqRat: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRat write SetseqRat stored seqRat_Specified;
    property somSub: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsomSub write SetsomSub stored somSub_Specified;
    property tipOri: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipOri write SettipOri stored tipOri_Specified;
    property vlrCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCta write SetvlrCta stored vlrCta_Specified;
    property vlrRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrRat write SetvlrRat stored vlrRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCP2OutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCP2OutTitulos = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFav: Double;
    FcodFav_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcpgSub: string;
    FcpgSub_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FctrFre: Integer;
    FctrFre_Specified: boolean;
    FctrNre: Integer;
    FctrNre_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscNeg: Double;
    FdscNeg_Specified: boolean;
    FfilCcr: Integer;
    FfilCcr_Specified: boolean;
    FfilCtr: Integer;
    FfilCtr_Specified: boolean;
    FfilNfc: Integer;
    FfilNfc_Specified: boolean;
    FfilNff: Integer;
    FfilNff_Specified: boolean;
    FfilNfv: Integer;
    FfilNfv_Specified: boolean;
    FfilOcp: Integer;
    FfilOcp_Specified: boolean;
    FforNfc: Integer;
    FforNfc_Specified: boolean;
    FforNff: Integer;
    FforNff_Specified: boolean;
    FgerTep: string;
    FgerTep_Specified: boolean;
    FjrsDia: Double;
    FjrsDia_Specified: boolean;
    FjrsNeg: Double;
    FjrsNeg_Specified: boolean;
    FmulNeg: Double;
    FmulNeg_Specified: boolean;
    FnumCcr: Integer;
    FnumCcr_Specified: boolean;
    FnumCtr: Integer;
    FnumCtr_Specified: boolean;
    FnumNfc: Integer;
    FnumNfc_Specified: boolean;
    FnumNff: Integer;
    FnumNff_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumOcp: Integer;
    FnumOcp_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FocpFre: Integer;
    FocpFre_Specified: boolean;
    FocpNre: Integer;
    FocpNre_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FperDsc: Integer;
    FperDsc_Specified: boolean;
    FperJrs: Integer;
    FperJrs_Specified: boolean;
    FperMul: Integer;
    FperMul_Specified: boolean;
    FproJrs: string;
    FproJrs_Specified: boolean;
    Frateios: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios;
    Frateios_Specified: boolean;
    FseqCgt: Integer;
    FseqCgt_Specified: boolean;
    FseqImo: Integer;
    FseqImo_Specified: boolean;
    FsitTit: string;
    FsitTit_Specified: boolean;
    FsnfNfc: string;
    FsnfNfc_Specified: boolean;
    FsnfNfv: string;
    FsnfNfv_Specified: boolean;
    FtipEfe: string;
    FtipEfe_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FtolJrs: Integer;
    FtolJrs_Specified: boolean;
    FtolMul: Integer;
    FtolMul_Specified: boolean;
    FultPgt: string;
    FultPgt_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvctPro: string;
    FvctPro_Specified: boolean;
    FvlrAbe: Double;
    FvlrAbe_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFav(Index: Integer; const ADouble: Double);
    function  codFav_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcpgSub(Index: Integer; const Astring: string);
    function  cpgSub_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetctrFre(Index: Integer; const AInteger: Integer);
    function  ctrFre_Specified(Index: Integer): boolean;
    procedure SetctrNre(Index: Integer; const AInteger: Integer);
    function  ctrNre_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscNeg(Index: Integer; const ADouble: Double);
    function  dscNeg_Specified(Index: Integer): boolean;
    procedure SetfilCcr(Index: Integer; const AInteger: Integer);
    function  filCcr_Specified(Index: Integer): boolean;
    procedure SetfilCtr(Index: Integer; const AInteger: Integer);
    function  filCtr_Specified(Index: Integer): boolean;
    procedure SetfilNfc(Index: Integer; const AInteger: Integer);
    function  filNfc_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const AInteger: Integer);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetfilNfv(Index: Integer; const AInteger: Integer);
    function  filNfv_Specified(Index: Integer): boolean;
    procedure SetfilOcp(Index: Integer; const AInteger: Integer);
    function  filOcp_Specified(Index: Integer): boolean;
    procedure SetforNfc(Index: Integer; const AInteger: Integer);
    function  forNfc_Specified(Index: Integer): boolean;
    procedure SetforNff(Index: Integer; const AInteger: Integer);
    function  forNff_Specified(Index: Integer): boolean;
    procedure SetgerTep(Index: Integer; const Astring: string);
    function  gerTep_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const ADouble: Double);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const ADouble: Double);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const ADouble: Double);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumCcr(Index: Integer; const AInteger: Integer);
    function  numCcr_Specified(Index: Integer): boolean;
    procedure SetnumCtr(Index: Integer; const AInteger: Integer);
    function  numCtr_Specified(Index: Integer): boolean;
    procedure SetnumNfc(Index: Integer; const AInteger: Integer);
    function  numNfc_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const AInteger: Integer);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumOcp(Index: Integer; const AInteger: Integer);
    function  numOcp_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetocpFre(Index: Integer; const AInteger: Integer);
    function  ocpFre_Specified(Index: Integer): boolean;
    procedure SetocpNre(Index: Integer; const AInteger: Integer);
    function  ocpNre_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const AInteger: Integer);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const AInteger: Integer);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const AInteger: Integer);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const Astring: string);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure Setrateios(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios);
    function  rateios_Specified(Index: Integer): boolean;
    procedure SetseqCgt(Index: Integer; const AInteger: Integer);
    function  seqCgt_Specified(Index: Integer): boolean;
    procedure SetseqImo(Index: Integer; const AInteger: Integer);
    function  seqImo_Specified(Index: Integer): boolean;
    procedure SetsitTit(Index: Integer; const Astring: string);
    function  sitTit_Specified(Index: Integer): boolean;
    procedure SetsnfNfc(Index: Integer; const Astring: string);
    function  snfNfc_Specified(Index: Integer): boolean;
    procedure SetsnfNfv(Index: Integer; const Astring: string);
    function  snfNfv_Specified(Index: Integer): boolean;
    procedure SettipEfe(Index: Integer; const Astring: string);
    function  tipEfe_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const AInteger: Integer);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const AInteger: Integer);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetultPgt(Index: Integer; const Astring: string);
    function  ultPgt_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvctPro(Index: Integer; const Astring: string);
    function  vctPro_Specified(Index: Integer): boolean;
    procedure SetvlrAbe(Index: Integer; const ADouble: Double);
    function  vlrAbe_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property antDsc:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property codCcu:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrt:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFav:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFav write SetcodFav stored codFav_Specified;
    property codFil:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codFrj:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codMoe:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cpgSub:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpgSub write SetcpgSub stored cpgSub_Specified;
    property ctaFin:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrFre:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrFre write SetctrFre stored ctrFre_Specified;
    property ctrNre:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrNre write SetctrNre stored ctrNre_Specified;
    property datDsc:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property filCcr:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCcr write SetfilCcr stored filCcr_Specified;
    property filCtr:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCtr write SetfilCtr stored filCtr_Specified;
    property filNfc:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfc write SetfilNfc stored filNfc_Specified;
    property filNff:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property filNfv:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfv write SetfilNfv stored filNfv_Specified;
    property filOcp:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilOcp write SetfilOcp stored filOcp_Specified;
    property forNfc:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNfc write SetforNfc stored forNfc_Specified;
    property forNff:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNff write SetforNff stored forNff_Specified;
    property gerTep:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTep write SetgerTep stored gerTep_Specified;
    property jrsDia:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numCcr:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCcr write SetnumCcr stored numCcr_Specified;
    property numCtr:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCtr write SetnumCtr stored numCtr_Specified;
    property numNfc:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfc write SetnumNfc stored numNfc_Specified;
    property numNff:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numNfv:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numOcp:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumOcp write SetnumOcp stored numOcp_Specified;
    property numPrj:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcp:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property ocpFre:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpFre write SetocpFre stored ocpFre_Specified;
    property ocpNre:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpNre write SetocpNre stored ocpNre_Specified;
    property outNeg:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property proJrs:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property rateios: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateios write Setrateios stored rateios_Specified;
    property seqCgt:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCgt write SetseqCgt stored seqCgt_Specified;
    property seqImo:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqImo write SetseqImo stored seqImo_Specified;
    property sitTit:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitTit write SetsitTit stored sitTit_Specified;
    property snfNfc:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfc write SetsnfNfc stored snfNfc_Specified;
    property snfNfv:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfv write SetsnfNfv stored snfNfv_Specified;
    property tipEfe:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEfe write SettipEfe stored tipEfe_Specified;
    property tipJrs:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tolDsc:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:  Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property ultPgt:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FultPgt write SetultPgt stored ultPgt_Specified;
    property vctOri:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro:  string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrAbe:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAbe write SetvlrAbe stored vlrAbe_Specified;
    property vlrDsc:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:  Double                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosaprovarCPInTitulo, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosaprovarCPInTitulo = class(TRemotable)
  private
    FcodigoEmpresa: Integer;
    FcodigoEmpresa_Specified: boolean;
    FcodigoFilial: Integer;
    FcodigoFilial_Specified: boolean;
    FcodigoFornecedor: Integer;
    FcodigoFornecedor_Specified: boolean;
    Fnumero: string;
    Fnumero_Specified: boolean;
    Fsequencia: Integer;
    Fsequencia_Specified: boolean;
    FtipoTitulo: string;
    FtipoTitulo_Specified: boolean;
    procedure SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
    function  codigoEmpresa_Specified(Index: Integer): boolean;
    procedure SetcodigoFilial(Index: Integer; const AInteger: Integer);
    function  codigoFilial_Specified(Index: Integer): boolean;
    procedure SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
    function  codigoFornecedor_Specified(Index: Integer): boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setsequencia(Index: Integer; const AInteger: Integer);
    function  sequencia_Specified(Index: Integer): boolean;
    procedure SettipoTitulo(Index: Integer; const Astring: string);
    function  tipoTitulo_Specified(Index: Integer): boolean;
  published
    property codigoEmpresa:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoEmpresa write SetcodigoEmpresa stored codigoEmpresa_Specified;
    property codigoFilial:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFilial write SetcodigoFilial stored codigoFilial_Specified;
    property codigoFornecedor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFornecedor write SetcodigoFornecedor stored codigoFornecedor_Specified;
    property numero:           string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property sequencia:        Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fsequencia write Setsequencia stored sequencia_Specified;
    property tipoTitulo:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoTitulo write SettipoTitulo stored tipoTitulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCPOutGridResult, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCPOutGridResult = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FtxtRet: string;
    FtxtRet_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettxtRet(Index: Integer; const Astring: string);
    function  txtRet_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property txtRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtxtRet write SettxtRet stored txtRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCPInEntradaTitulosRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCPInEntradaTitulosRateio = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: Double;
    FperCta_Specified: boolean;
    FperRat: Double;
    FperRat_Specified: boolean;
    FvlrCta: Double;
    FvlrCta_Specified: boolean;
    FvlrRat: Double;
    FvlrRat_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const ADouble: Double);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const ADouble: Double);
    function  perRat_Specified(Index: Integer): boolean;
    procedure SetvlrCta(Index: Integer; const ADouble: Double);
    function  vlrCta_Specified(Index: Integer): boolean;
    procedure SetvlrRat(Index: Integer; const ADouble: Double);
    function  vlrRat_Specified(Index: Integer): boolean;
  published
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
    property vlrCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCta write SetvlrCta stored vlrCta_Specified;
    property vlrRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrRat write SetvlrRat stored vlrRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosbuscarPendentesCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosbuscarPendentesCPIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FindicePagina: Integer;
    FindicePagina_Specified: boolean;
    FlimitePagina: Integer;
    FlimitePagina_Specified: boolean;
    Fusuario: Integer;
    Fusuario_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetindicePagina(Index: Integer; const AInteger: Integer);
    function  indicePagina_Specified(Index: Integer): boolean;
    procedure SetlimitePagina(Index: Integer; const AInteger: Integer);
    function  limitePagina_Specified(Index: Integer): boolean;
    procedure Setusuario(Index: Integer; const AInteger: Integer);
    function  usuario_Specified(Index: Integer): boolean;
  published
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property indicePagina:   Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindicePagina write SetindicePagina stored indicePagina_Specified;
    property limitePagina:   Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimitePagina write SetlimitePagina stored limitePagina_Specified;
    property usuario:        Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fusuario write Setusuario stored usuario_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosbuscarPendentesCPOutTitulo, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosbuscarPendentesCPOutTitulo = class(TRemotable)
  private
    FcodigoEmpresa: Integer;
    FcodigoEmpresa_Specified: boolean;
    FcodigoFilial: Integer;
    FcodigoFilial_Specified: boolean;
    FcodigoFornecedor: Integer;
    FcodigoFornecedor_Specified: boolean;
    FcodigoTipoTitulo: string;
    FcodigoTipoTitulo_Specified: boolean;
    FdataEntrada: string;
    FdataEntrada_Specified: boolean;
    FdataPagamento: string;
    FdataPagamento_Specified: boolean;
    FdataVencimento: string;
    FdataVencimento_Specified: boolean;
    FdescricaoMoeda: string;
    FdescricaoMoeda_Specified: boolean;
    FdescricaoTipoTitulo: string;
    FdescricaoTipoTitulo_Specified: boolean;
    FnomeEmpresa: string;
    FnomeEmpresa_Specified: boolean;
    FnomeFilial: string;
    FnomeFilial_Specified: boolean;
    FnomeFornecedor: string;
    FnomeFornecedor_Specified: boolean;
    Fnumero: string;
    Fnumero_Specified: boolean;
    Fobservacao: string;
    Fobservacao_Specified: boolean;
    FsiglaMoeda: string;
    FsiglaMoeda_Specified: boolean;
    FvalorLiquido: Double;
    FvalorLiquido_Specified: boolean;
    FvalorOriginal: Double;
    FvalorOriginal_Specified: boolean;
    procedure SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
    function  codigoEmpresa_Specified(Index: Integer): boolean;
    procedure SetcodigoFilial(Index: Integer; const AInteger: Integer);
    function  codigoFilial_Specified(Index: Integer): boolean;
    procedure SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
    function  codigoFornecedor_Specified(Index: Integer): boolean;
    procedure SetcodigoTipoTitulo(Index: Integer; const Astring: string);
    function  codigoTipoTitulo_Specified(Index: Integer): boolean;
    procedure SetdataEntrada(Index: Integer; const Astring: string);
    function  dataEntrada_Specified(Index: Integer): boolean;
    procedure SetdataPagamento(Index: Integer; const Astring: string);
    function  dataPagamento_Specified(Index: Integer): boolean;
    procedure SetdataVencimento(Index: Integer; const Astring: string);
    function  dataVencimento_Specified(Index: Integer): boolean;
    procedure SetdescricaoMoeda(Index: Integer; const Astring: string);
    function  descricaoMoeda_Specified(Index: Integer): boolean;
    procedure SetdescricaoTipoTitulo(Index: Integer; const Astring: string);
    function  descricaoTipoTitulo_Specified(Index: Integer): boolean;
    procedure SetnomeEmpresa(Index: Integer; const Astring: string);
    function  nomeEmpresa_Specified(Index: Integer): boolean;
    procedure SetnomeFilial(Index: Integer; const Astring: string);
    function  nomeFilial_Specified(Index: Integer): boolean;
    procedure SetnomeFornecedor(Index: Integer; const Astring: string);
    function  nomeFornecedor_Specified(Index: Integer): boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setobservacao(Index: Integer; const Astring: string);
    function  observacao_Specified(Index: Integer): boolean;
    procedure SetsiglaMoeda(Index: Integer; const Astring: string);
    function  siglaMoeda_Specified(Index: Integer): boolean;
    procedure SetvalorLiquido(Index: Integer; const ADouble: Double);
    function  valorLiquido_Specified(Index: Integer): boolean;
    procedure SetvalorOriginal(Index: Integer; const ADouble: Double);
    function  valorOriginal_Specified(Index: Integer): boolean;
  published
    property codigoEmpresa:       Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoEmpresa write SetcodigoEmpresa stored codigoEmpresa_Specified;
    property codigoFilial:        Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFilial write SetcodigoFilial stored codigoFilial_Specified;
    property codigoFornecedor:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFornecedor write SetcodigoFornecedor stored codigoFornecedor_Specified;
    property codigoTipoTitulo:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoTipoTitulo write SetcodigoTipoTitulo stored codigoTipoTitulo_Specified;
    property dataEntrada:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataEntrada write SetdataEntrada stored dataEntrada_Specified;
    property dataPagamento:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataPagamento write SetdataPagamento stored dataPagamento_Specified;
    property dataVencimento:      string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataVencimento write SetdataVencimento stored dataVencimento_Specified;
    property descricaoMoeda:      string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdescricaoMoeda write SetdescricaoMoeda stored descricaoMoeda_Specified;
    property descricaoTipoTitulo: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdescricaoTipoTitulo write SetdescricaoTipoTitulo stored descricaoTipoTitulo_Specified;
    property nomeEmpresa:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomeEmpresa write SetnomeEmpresa stored nomeEmpresa_Specified;
    property nomeFilial:          string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomeFilial write SetnomeFilial stored nomeFilial_Specified;
    property nomeFornecedor:      string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomeFornecedor write SetnomeFornecedor stored nomeFornecedor_Specified;
    property numero:              string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property observacao:          string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fobservacao write Setobservacao stored observacao_Specified;
    property siglaMoeda:          string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsiglaMoeda write SetsiglaMoeda stored siglaMoeda_Specified;
    property valorLiquido:        Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvalorLiquido write SetvalorLiquido stored valorLiquido_Specified;
    property valorOriginal:       Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvalorOriginal write SetvalorOriginal stored valorOriginal_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCPOutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCPOutResultado = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FmsgRet: string;
    FmsgRet_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    FtipRet: Integer;
    FtipRet_Specified: boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetmsgRet(Index: Integer; const Astring: string);
    function  msgRet_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipRet(Index: Integer; const AInteger: Integer);
    function  tipRet_Specified(Index: Integer): boolean;
  published
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ideExt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property msgRet:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgRet write SetmsgRet stored msgRet_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipRet:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipRet write SettipRet stored tipRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarAVMInTitulosACalcular, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarAVMInTitulosACalcular = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarAVMIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarAVMIn = class(TRemotable)
  private
    FdataBaseFinal: string;
    FdataBaseFinal_Specified: boolean;
    FdataBaseInicial: string;
    FdataBaseInicial_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidPacote: Integer;
    FidPacote_Specified: boolean;
    FtitulosACalcular: Array_Of_titulosProcessarAVMInTitulosACalcular;
    FtitulosACalcular_Specified: boolean;
    procedure SetdataBaseFinal(Index: Integer; const Astring: string);
    function  dataBaseFinal_Specified(Index: Integer): boolean;
    procedure SetdataBaseInicial(Index: Integer; const Astring: string);
    function  dataBaseInicial_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidPacote(Index: Integer; const AInteger: Integer);
    function  idPacote_Specified(Index: Integer): boolean;
    procedure SettitulosACalcular(Index: Integer; const AArray_Of_titulosProcessarAVMInTitulosACalcular: Array_Of_titulosProcessarAVMInTitulosACalcular);
    function  titulosACalcular_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dataBaseFinal:    string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBaseFinal write SetdataBaseFinal stored dataBaseFinal_Specified;
    property dataBaseInicial:  string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBaseInicial write SetdataBaseInicial stored dataBaseInicial_Specified;
    property flowInstanceID:   string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:         string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idPacote:         Integer                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidPacote write SetidPacote stored idPacote_Specified;
    property titulosACalcular: Array_Of_titulosProcessarAVMInTitulosACalcular  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosACalcular write SettitulosACalcular stored titulosACalcular_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCPOutGridRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCPOutGridRetorno = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FmsgErr: string;
    FmsgErr_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetmsgErr(Index: Integer; const Astring: string);
    function  msgErr_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property msgErr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgErr write SetmsgErr stored msgErr_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarAVMOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosProcessarAVMOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    FtitulosCalculados: Array_Of_titulosProcessarAVMOutTitulosCalculados;
    FtitulosCalculados_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure SettitulosCalculados(Index: Integer; const AArray_Of_titulosProcessarAVMOutTitulosCalculados: Array_Of_titulosProcessarAVMOutTitulosCalculados);
    function  titulosCalculados_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:      string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:   string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:       Integer                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulosCalculados: Array_Of_titulosProcessarAVMOutTitulosCalculados  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosCalculados write SettitulosCalculados stored titulosCalculados_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosreprovarCPInTitulo, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosreprovarCPInTitulo = class(TRemotable)
  private
    FcodigoEmpresa: Integer;
    FcodigoEmpresa_Specified: boolean;
    FcodigoFilial: Integer;
    FcodigoFilial_Specified: boolean;
    FcodigoFornecedor: Integer;
    FcodigoFornecedor_Specified: boolean;
    Fnumero: string;
    Fnumero_Specified: boolean;
    Fsequencia: Integer;
    Fsequencia_Specified: boolean;
    FtipoTitulo: string;
    FtipoTitulo_Specified: boolean;
    procedure SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
    function  codigoEmpresa_Specified(Index: Integer): boolean;
    procedure SetcodigoFilial(Index: Integer; const AInteger: Integer);
    function  codigoFilial_Specified(Index: Integer): boolean;
    procedure SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
    function  codigoFornecedor_Specified(Index: Integer): boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setsequencia(Index: Integer; const AInteger: Integer);
    function  sequencia_Specified(Index: Integer): boolean;
    procedure SettipoTitulo(Index: Integer; const Astring: string);
    function  tipoTitulo_Specified(Index: Integer): boolean;
  published
    property codigoEmpresa:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoEmpresa write SetcodigoEmpresa stored codigoEmpresa_Specified;
    property codigoFilial:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFilial write SetcodigoFilial stored codigoFilial_Specified;
    property codigoFornecedor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFornecedor write SetcodigoFornecedor stored codigoFornecedor_Specified;
    property numero:           string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property sequencia:        Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fsequencia write Setsequencia stored sequencia_Specified;
    property tipoTitulo:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoTitulo write SettipoTitulo stored tipoTitulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarAVMOutTitulosCalculados, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarAVMOutTitulosCalculados = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property codEmp:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCPInGridTitulosBaixar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCPInGridTitulosBaixar = class(TRemotable)
  private
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcp: string;
    FobsMcp_Specified: boolean;
    FseqChe: string;
    FseqChe_Specified: boolean;
    FvlrBai: string;
    FvlrBai_Specified: boolean;
    FvlrCor: Double;
    FvlrCor_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrEnc: Double;
    FvlrEnc_Specified: boolean;
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrMul: Double;
    FvlrMul_Specified: boolean;
    FvlrOac: Double;
    FvlrOac_Specified: boolean;
    FvlrOde: Double;
    FvlrOde_Specified: boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcp(Index: Integer; const Astring: string);
    function  obsMcp_Specified(Index: Integer): boolean;
    procedure SetseqChe(Index: Integer; const Astring: string);
    function  seqChe_Specified(Index: Integer): boolean;
    procedure SetvlrBai(Index: Integer; const Astring: string);
    function  vlrBai_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const ADouble: Double);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrEnc(Index: Integer; const ADouble: Double);
    function  vlrEnc_Specified(Index: Integer): boolean;
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrMul(Index: Integer; const ADouble: Double);
    function  vlrMul_Specified(Index: Integer): boolean;
    procedure SetvlrOac(Index: Integer; const ADouble: Double);
    function  vlrOac_Specified(Index: Integer): boolean;
    procedure SetvlrOde(Index: Integer; const ADouble: Double);
    function  vlrOde_Specified(Index: Integer): boolean;
  published
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numCco: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcp: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcp write SetobsMcp stored obsMcp_Specified;
    property seqChe: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqChe write SetseqChe stored seqChe_Specified;
    property vlrBai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBai write SetvlrBai stored vlrBai_Specified;
    property vlrCor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDsc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrMul: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCPIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FdatBai: string;
    FdatBai_Specified: boolean;
    FdatCxb: string;
    FdatCxb_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FgridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar;
    FgridTitulosBaixar_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FtnsBai: string;
    FtnsBai_Specified: boolean;
    FtnsCxb: string;
    FtnsCxb_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetdatBai(Index: Integer; const Astring: string);
    function  datBai_Specified(Index: Integer): boolean;
    procedure SetdatCxb(Index: Integer; const Astring: string);
    function  datCxb_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetgridTitulosBaixar(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar);
    function  gridTitulosBaixar_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SettnsBai(Index: Integer; const Astring: string);
    function  tnsBai_Specified(Index: Integer): boolean;
    procedure SettnsCxb(Index: Integer; const Astring: string);
    function  tnsCxb_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:            Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:            Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property datBai:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatBai write SetdatBai stored datBai_Specified;
    property datCxb:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatCxb write SetdatCxb stored datCxb_Specified;
    property flowInstanceID:    string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:          string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property gridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTitulosBaixar write SetgridTitulosBaixar stored gridTitulosBaixar_Specified;
    property numCco:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property tnsBai:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsBai write SettnsBai stored tnsBai_Specified;
    property tnsCxb:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsCxb write SettnsCxb stored tnsCxb_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCPOutGridRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCPOutGridRetorno = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FmsgErr: string;
    FmsgErr_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetmsgErr(Index: Integer; const Astring: string);
    function  msgErr_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property msgErr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgErr write SetmsgErr stored msgErr_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCPInGridTitulosCRE, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCPInGridTitulosCRE = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FvlrBai: Double;
    FvlrBai_Specified: boolean;
    FvlrCor: Double;
    FvlrCor_Specified: boolean;
    FvlrOac: Double;
    FvlrOac_Specified: boolean;
    FvlrOde: Double;
    FvlrOde_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetvlrBai(Index: Integer; const ADouble: Double);
    function  vlrBai_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const ADouble: Double);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrOac(Index: Integer; const ADouble: Double);
    function  vlrOac_Specified(Index: Integer): boolean;
    procedure SetvlrOde(Index: Integer; const ADouble: Double);
    function  vlrOde_Specified(Index: Integer): boolean;
  published
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property vlrBai: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBai write SetvlrBai stored vlrBai_Specified;
    property vlrCor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrOac: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCPInGridTitulosBAI, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCPInGridTitulosBAI = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FvlrBai: Double;
    FvlrBai_Specified: boolean;
    FvlrCor: Double;
    FvlrCor_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrEnc: Double;
    FvlrEnc_Specified: boolean;
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrMul: Double;
    FvlrMul_Specified: boolean;
    FvlrOac: Double;
    FvlrOac_Specified: boolean;
    FvlrOde: Double;
    FvlrOde_Specified: boolean;
    FvlrOud: Double;
    FvlrOud_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetvlrBai(Index: Integer; const ADouble: Double);
    function  vlrBai_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const ADouble: Double);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrEnc(Index: Integer; const ADouble: Double);
    function  vlrEnc_Specified(Index: Integer): boolean;
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrMul(Index: Integer; const ADouble: Double);
    function  vlrMul_Specified(Index: Integer): boolean;
    procedure SetvlrOac(Index: Integer; const ADouble: Double);
    function  vlrOac_Specified(Index: Integer): boolean;
    procedure SetvlrOde(Index: Integer; const ADouble: Double);
    function  vlrOde_Specified(Index: Integer): boolean;
    procedure SetvlrOud(Index: Integer; const ADouble: Double);
    function  vlrOud_Specified(Index: Integer): boolean;
  published
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property vlrBai: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBai write SetvlrBai stored vlrBai_Specified;
    property vlrCor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDsc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrMul: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
    property vlrOud: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOud write SetvlrOud stored vlrOud_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCPIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FdatBai: string;
    FdatBai_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FgridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI;
    FgridTitulosBAI_Specified: boolean;
    FgridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE;
    FgridTitulosCRE_Specified: boolean;
    FtnsCre: string;
    FtnsCre_Specified: boolean;
    FtnsDup: string;
    FtnsDup_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetdatBai(Index: Integer; const Astring: string);
    function  datBai_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetgridTitulosBAI(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI);
    function  gridTitulosBAI_Specified(Index: Integer): boolean;
    procedure SetgridTitulosCRE(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE);
    function  gridTitulosCRE_Specified(Index: Integer): boolean;
    procedure SettnsCre(Index: Integer; const Astring: string);
    function  tnsCre_Specified(Index: Integer): boolean;
    procedure SettnsDup(Index: Integer; const Astring: string);
    function  tnsDup_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:         Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property datBai:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatBai write SetdatBai stored datBai_Specified;
    property flowInstanceID: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property gridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTitulosBAI write SetgridTitulosBAI stored gridTitulosBAI_Specified;
    property gridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTitulosCRE write SetgridTitulosCRE stored gridTitulosCRE_Specified;
    property tnsCre:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsCre write SettnsCre stored tnsCre_Specified;
    property tnsDup:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsDup write SettnsDup stored tnsDup_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosreprovarCPOutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosreprovarCPOutRetorno = class(TRemotable)
  private
    FcodigoEmpresa: Integer;
    FcodigoEmpresa_Specified: boolean;
    FcodigoFilial: Integer;
    FcodigoFilial_Specified: boolean;
    FcodigoFornecedor: Integer;
    FcodigoFornecedor_Specified: boolean;
    FmensagemErro: string;
    FmensagemErro_Specified: boolean;
    Fnumero: string;
    Fnumero_Specified: boolean;
    Fsequencia: Integer;
    Fsequencia_Specified: boolean;
    FtipoTitulo: string;
    FtipoTitulo_Specified: boolean;
    procedure SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
    function  codigoEmpresa_Specified(Index: Integer): boolean;
    procedure SetcodigoFilial(Index: Integer; const AInteger: Integer);
    function  codigoFilial_Specified(Index: Integer): boolean;
    procedure SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
    function  codigoFornecedor_Specified(Index: Integer): boolean;
    procedure SetmensagemErro(Index: Integer; const Astring: string);
    function  mensagemErro_Specified(Index: Integer): boolean;
    procedure Setnumero(Index: Integer; const Astring: string);
    function  numero_Specified(Index: Integer): boolean;
    procedure Setsequencia(Index: Integer; const AInteger: Integer);
    function  sequencia_Specified(Index: Integer): boolean;
    procedure SettipoTitulo(Index: Integer; const Astring: string);
    function  tipoTitulo_Specified(Index: Integer): boolean;
  published
    property codigoEmpresa:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoEmpresa write SetcodigoEmpresa stored codigoEmpresa_Specified;
    property codigoFilial:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFilial write SetcodigoFilial stored codigoFilial_Specified;
    property codigoFornecedor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFornecedor write SetcodigoFornecedor stored codigoFornecedor_Specified;
    property mensagemErro:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemErro write SetmensagemErro stored mensagemErro_Specified;
    property numero:           string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fnumero write Setnumero stored numero_Specified;
    property sequencia:        Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fsequencia write Setsequencia stored sequencia_Specified;
    property tipoTitulo:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoTitulo write SettipoTitulo stored tipoTitulo_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCPInTitulosPagar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCPInTitulosPagar = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    procedure SetchvLot(Index: Integer; const Astring: string);
    function  chvLot_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
  published
    property chvLot: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FchvLot write SetchvLot stored chvLot_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCPOutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCPOutRetorno = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FmsgRet: string;
    FmsgRet_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    FtipRet: Integer;
    FtipRet_Specified: boolean;
    procedure SetchvLot(Index: Integer; const Astring: string);
    function  chvLot_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetmsgRet(Index: Integer; const Astring: string);
    function  msgRet_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SettipRet(Index: Integer; const AInteger: Integer);
    function  tipRet_Specified(Index: Integer): boolean;
  published
    property chvLot: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FchvLot write SetchvLot stored chvLot_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property msgRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgRet write SetmsgRet stored msgRet_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property tipRet: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipRet write SettipRet stored tipRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretorno: Array_Of_titulosEstornoBaixaTitulosCPOutRetorno;
    Fretorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCPOutRetorno: Array_Of_titulosEstornoBaixaTitulosCPOutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retorno:         Array_Of_titulosEstornoBaixaTitulosCPOutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property tipoRetorno:     Integer                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCPInTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExcluirTitulosCPInTitulos = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosExcluirTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosExcluirTitulosCPOutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosExcluirTitulosCPOutResultado: Array_Of_titulosExcluirTitulosCPOutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosExcluirTitulosCPOutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCPOutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExcluirTitulosCPOutResultado = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  published
    property codEmp:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCP2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCP2In = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FsistemaIntegracao: string;
    FsistemaIntegracao_Specified: boolean;
    FtitulosPagar: Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar;
    FtitulosPagar_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetsistemaIntegracao(Index: Integer; const Astring: string);
    function  sistemaIntegracao_Specified(Index: Integer): boolean;
    procedure SettitulosPagar(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar: Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar);
    function  titulosPagar_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID:    string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:          string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property sistemaIntegracao: string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsistemaIntegracao write SetsistemaIntegracao stored sistemaIntegracao_Specified;
    property titulosPagar:      Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosPagar write SettitulosPagar stored titulosPagar_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCP2InTitulosPagar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCP2InTitulosPagar = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FempReq: Integer;
    FempReq_Specified: boolean;
    FfilReq: Integer;
    FfilReq_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    procedure SetchvLot(Index: Integer; const Astring: string);
    function  chvLot_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetempReq(Index: Integer; const AInteger: Integer);
    function  empReq_Specified(Index: Integer): boolean;
    procedure SetfilReq(Index: Integer; const AInteger: Integer);
    function  filReq_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
  published
    property chvLot: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FchvLot write SetchvLot stored chvLot_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property empReq: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempReq write SetempReq stored empReq_Specified;
    property filReq: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilReq write SetfilReq stored filReq_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCP2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCP2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretorno: Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno;
    Fretorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCP2OutRetorno: Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retorno:         Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property tipoRetorno:     Integer                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarCPOutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarCPOutTitulos = class(TRemotable)
  private
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcodUsu: string;
    FcodUsu_Specified: boolean;
    FcorApr: string;
    FcorApr_Specified: boolean;
    FcotApr: string;
    FcotApr_Specified: boolean;
    FcotEmi: string;
    FcotEmi_Specified: boolean;
    FctaApr: string;
    FctaApr_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FdatApr: string;
    FdatApr_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscApr: string;
    FdscApr_Specified: boolean;
    FempApr: string;
    FempApr_Specified: boolean;
    FencApr: string;
    FencApr_Specified: boolean;
    FfpgApr: string;
    FfpgApr_Specified: boolean;
    FhorApr: string;
    FhorApr_Specified: boolean;
    FjrsApr: string;
    FjrsApr_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FlibApr: string;
    FlibApr_Specified: boolean;
    FmulApr: string;
    FmulApr_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FoacApr: string;
    FoacApr_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FodeApr: string;
    FodeApr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FpgtApr: string;
    FpgtApr_Specified: boolean;
    FporAnt: string;
    FporAnt_Specified: boolean;
    FseqApr: string;
    FseqApr_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtipTcc: string;
    FtipTcc_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FusuSit: string;
    FusuSit_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrApr: string;
    FvlrApr_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcodUsu(Index: Integer; const Astring: string);
    function  codUsu_Specified(Index: Integer): boolean;
    procedure SetcorApr(Index: Integer; const Astring: string);
    function  corApr_Specified(Index: Integer): boolean;
    procedure SetcotApr(Index: Integer; const Astring: string);
    function  cotApr_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const Astring: string);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetctaApr(Index: Integer; const Astring: string);
    function  ctaApr_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatApr(Index: Integer; const Astring: string);
    function  datApr_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscApr(Index: Integer; const Astring: string);
    function  dscApr_Specified(Index: Integer): boolean;
    procedure SetempApr(Index: Integer; const Astring: string);
    function  empApr_Specified(Index: Integer): boolean;
    procedure SetencApr(Index: Integer; const Astring: string);
    function  encApr_Specified(Index: Integer): boolean;
    procedure SetfpgApr(Index: Integer; const Astring: string);
    function  fpgApr_Specified(Index: Integer): boolean;
    procedure SethorApr(Index: Integer; const Astring: string);
    function  horApr_Specified(Index: Integer): boolean;
    procedure SetjrsApr(Index: Integer; const Astring: string);
    function  jrsApr_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetlibApr(Index: Integer; const Astring: string);
    function  libApr_Specified(Index: Integer): boolean;
    procedure SetmulApr(Index: Integer; const Astring: string);
    function  mulApr_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetoacApr(Index: Integer; const Astring: string);
    function  oacApr_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetodeApr(Index: Integer; const Astring: string);
    function  odeApr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpgtApr(Index: Integer; const Astring: string);
    function  pgtApr_Specified(Index: Integer): boolean;
    procedure SetporAnt(Index: Integer; const Astring: string);
    function  porAnt_Specified(Index: Integer): boolean;
    procedure SetseqApr(Index: Integer; const Astring: string);
    function  seqApr_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const Astring: string);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetusuSit(Index: Integer; const Astring: string);
    function  usuSit_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrApr(Index: Integer; const Astring: string);
    function  vlrApr_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property ccbFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cnpjFilial: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property codTri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property codUsu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodUsu write SetcodUsu stored codUsu_Specified;
    property corApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcorApr write SetcorApr stored corApr_Specified;
    property cotApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotApr write SetcotApr stored cotApr_Specified;
    property cotEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property ctaApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaApr write SetctaApr stored ctaApr_Specified;
    property ctaFin:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatApr write SetdatApr stored datApr_Specified;
    property datDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscApr write SetdscApr stored dscApr_Specified;
    property empApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempApr write SetempApr stored empApr_Specified;
    property encApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FencApr write SetencApr stored encApr_Specified;
    property fpgApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfpgApr write SetfpgApr stored fpgApr_Specified;
    property horApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhorApr write SethorApr stored horApr_Specified;
    property jrsApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsApr write SetjrsApr stored jrsApr_Specified;
    property jrsDia:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property libApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlibApr write SetlibApr stored libApr_Specified;
    property mulApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulApr write SetmulApr stored mulApr_Specified;
    property mulNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numArb:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numPrj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property oacApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoacApr write SetoacApr stored oacApr_Specified;
    property obsTcp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property odeApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FodeApr write SetodeApr stored odeApr_Specified;
    property outNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property pgtApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtApr write SetpgtApr stored pgtApr_Specified;
    property porAnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporAnt write SetporAnt stored porAnt_Specified;
    property seqApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqApr write SetseqApr stored seqApr_Specified;
    property tipJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tipTcc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property titBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property usuSit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FusuSit write SetusuSit stored usuSit_Specified;
    property vctOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrApr write SetvlrApr stored vlrApr_Specified;
    property vlrDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCPOutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCPOutResultado = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FmsgRet: string;
    FmsgRet_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    FtipRet: Integer;
    FtipRet_Specified: boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetmsgRet(Index: Integer; const Astring: string);
    function  msgRet_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipRet(Index: Integer; const AInteger: Integer);
    function  tipRet_Specified(Index: Integer): boolean;
  published
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ideExt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property msgRet:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgRet write SetmsgRet stored msgRet_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipRet:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipRet write SettipRet stored tipRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarCPIn = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property codEmp:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property dataBuild:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarCPOutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarCPOutTitulos: Array_Of_titulosConsultarCPOutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarCPOutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCP2OutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCP2OutRetorno = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FempReq: Integer;
    FempReq_Specified: boolean;
    FfilReq: Integer;
    FfilReq_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FmsgRet: string;
    FmsgRet_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    FtipRet: Integer;
    FtipRet_Specified: boolean;
    procedure SetchvLot(Index: Integer; const Astring: string);
    function  chvLot_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetempReq(Index: Integer; const AInteger: Integer);
    function  empReq_Specified(Index: Integer): boolean;
    procedure SetfilReq(Index: Integer; const AInteger: Integer);
    function  filReq_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetmsgRet(Index: Integer; const Astring: string);
    function  msgRet_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SettipRet(Index: Integer; const AInteger: Integer);
    function  tipRet_Specified(Index: Integer): boolean;
  published
    property chvLot: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FchvLot write SetchvLot stored chvLot_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property empReq: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempReq write SetempReq stored empReq_Specified;
    property filReq: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilReq write SetfilReq stored filReq_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property msgRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgRet write SetmsgRet stored msgRet_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property tipRet: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipRet write SettipRet stored tipRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCPIn = class(TRemotable)
  private
    FbaixaTituloPagar: Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar;
    FbaixaTituloPagar_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetbaixaTituloPagar(Index: Integer; const AArray_Of_titulosBaixarTitulosCPInBaixaTituloPagar: Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar);
    function  baixaTituloPagar_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property baixaTituloPagar: Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FbaixaTituloPagar write SetbaixaTituloPagar stored baixaTituloPagar_Specified;
    property dataBuild:        string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:   string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:         string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCPInBaixaTituloPagar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCPInBaixaTituloPagar = class(TRemotable)
  private
    FagrPre: string;
    FagrPre_Specified: boolean;
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcotMcp: string;
    FcotMcp_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FdatLib: string;
    FdatLib_Specified: boolean;
    FdatMov: string;
    FdatMov_Specified: boolean;
    FdatPgt: string;
    FdatPgt_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FindAbt: string;
    FindAbt_Specified: boolean;
    FindCan: string;
    FindCan_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FnumDoc: string;
    FnumDoc_Specified: boolean;
    FnumPdv: Integer;
    FnumPdv_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcp: string;
    FobsMcp_Specified: boolean;
    FseqChe: string;
    FseqChe_Specified: boolean;
    FtipPgt: string;
    FtipPgt_Specified: boolean;
    FtipTcc: Integer;
    FtipTcc_Specified: boolean;
    FtnsCxb: string;
    FtnsCxb_Specified: boolean;
    FvlrCor: string;
    FvlrCor_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrEnc: string;
    FvlrEnc_Specified: boolean;
    FvlrJrs: string;
    FvlrJrs_Specified: boolean;
    FvlrLiq: string;
    FvlrLiq_Specified: boolean;
    FvlrMov: string;
    FvlrMov_Specified: boolean;
    FvlrMul: string;
    FvlrMul_Specified: boolean;
    FvlrOac: string;
    FvlrOac_Specified: boolean;
    FvlrOde: string;
    FvlrOde_Specified: boolean;
    procedure SetagrPre(Index: Integer; const Astring: string);
    function  agrPre_Specified(Index: Integer): boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcotMcp(Index: Integer; const Astring: string);
    function  cotMcp_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatLib(Index: Integer; const Astring: string);
    function  datLib_Specified(Index: Integer): boolean;
    procedure SetdatMov(Index: Integer; const Astring: string);
    function  datMov_Specified(Index: Integer): boolean;
    procedure SetdatPgt(Index: Integer; const Astring: string);
    function  datPgt_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetindAbt(Index: Integer; const Astring: string);
    function  indAbt_Specified(Index: Integer): boolean;
    procedure SetindCan(Index: Integer; const Astring: string);
    function  indCan_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SetnumDoc(Index: Integer; const Astring: string);
    function  numDoc_Specified(Index: Integer): boolean;
    procedure SetnumPdv(Index: Integer; const AInteger: Integer);
    function  numPdv_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcp(Index: Integer; const Astring: string);
    function  obsMcp_Specified(Index: Integer): boolean;
    procedure SetseqChe(Index: Integer; const Astring: string);
    function  seqChe_Specified(Index: Integer): boolean;
    procedure SettipPgt(Index: Integer; const Astring: string);
    function  tipPgt_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const AInteger: Integer);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettnsCxb(Index: Integer; const Astring: string);
    function  tnsCxb_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const Astring: string);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrEnc(Index: Integer; const Astring: string);
    function  vlrEnc_Specified(Index: Integer): boolean;
    procedure SetvlrJrs(Index: Integer; const Astring: string);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrLiq(Index: Integer; const Astring: string);
    function  vlrLiq_Specified(Index: Integer): boolean;
    procedure SetvlrMov(Index: Integer; const Astring: string);
    function  vlrMov_Specified(Index: Integer): boolean;
    procedure SetvlrMul(Index: Integer; const Astring: string);
    function  vlrMul_Specified(Index: Integer): boolean;
    procedure SetvlrOac(Index: Integer; const Astring: string);
    function  vlrOac_Specified(Index: Integer): boolean;
    procedure SetvlrOde(Index: Integer; const Astring: string);
    function  vlrOde_Specified(Index: Integer): boolean;
  published
    property agrPre:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FagrPre write SetagrPre stored agrPre_Specified;
    property ccbFor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCcu:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codEmp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cotMcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotMcp write SetcotMcp stored cotMcp_Specified;
    property ctaFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datLib:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLib write SetdatLib stored datLib_Specified;
    property datMov:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatMov write SetdatMov stored datMov_Specified;
    property datPgt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPgt write SetdatPgt stored datPgt_Specified;
    property ideExt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property indAbt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindAbt write SetindAbt stored indAbt_Specified;
    property indCan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCan write SetindCan stored indCan_Specified;
    property numCco:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property numDoc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumDoc write SetnumDoc stored numDoc_Specified;
    property numPdv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPdv write SetnumPdv stored numPdv_Specified;
    property numPrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcp write SetobsMcp stored obsMcp_Specified;
    property seqChe:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqChe write SetseqChe stored seqChe_Specified;
    property tipPgt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipPgt write SettipPgt stored tipPgt_Specified;
    property tipTcc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property tnsCxb:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsCxb write SettnsCxb stored tnsCxb_Specified;
    property vlrCor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrLiq:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLiq write SetvlrLiq stored vlrLiq_Specified;
    property vlrMov:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMov write SetvlrMov stored vlrMov_Specified;
    property vlrMul:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosBaixarTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosBaixarTitulosCPOutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosBaixarTitulosCPOutResultado: Array_Of_titulosBaixarTitulosCPOutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosBaixarTitulosCPOutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCPOutTitulosRateios, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCPOutTitulosRateios = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcriRat: Integer;
    FcriRat_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FdatBas: string;
    FdatBas_Specified: boolean;
    FmesAno: string;
    FmesAno_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: Double;
    FperCta_Specified: boolean;
    FperRat: Double;
    FperRat_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    FseqRat: Integer;
    FseqRat_Specified: boolean;
    FsomSub: Integer;
    FsomSub_Specified: boolean;
    FtipOri: string;
    FtipOri_Specified: boolean;
    FvlrCta: Double;
    FvlrCta_Specified: boolean;
    FvlrRat: Double;
    FvlrRat_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcriRat(Index: Integer; const AInteger: Integer);
    function  criRat_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatBas(Index: Integer; const Astring: string);
    function  datBas_Specified(Index: Integer): boolean;
    procedure SetmesAno(Index: Integer; const Astring: string);
    function  mesAno_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const ADouble: Double);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const ADouble: Double);
    function  perRat_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SetseqRat(Index: Integer; const AInteger: Integer);
    function  seqRat_Specified(Index: Integer): boolean;
    procedure SetsomSub(Index: Integer; const AInteger: Integer);
    function  somSub_Specified(Index: Integer): boolean;
    procedure SettipOri(Index: Integer; const Astring: string);
    function  tipOri_Specified(Index: Integer): boolean;
    procedure SetvlrCta(Index: Integer; const ADouble: Double);
    function  vlrCta_Specified(Index: Integer): boolean;
    procedure SetvlrRat(Index: Integer; const ADouble: Double);
    function  vlrRat_Specified(Index: Integer): boolean;
  published
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTns: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property criRat: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriRat write SetcriRat stored criRat_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datBas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatBas write SetdatBas stored datBas_Specified;
    property mesAno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmesAno write SetmesAno stored mesAno_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property seqRat: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRat write SetseqRat stored seqRat_Specified;
    property somSub: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsomSub write SetsomSub stored somSub_Specified;
    property tipOri: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipOri write SettipOri stored tipOri_Specified;
    property vlrCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCta write SetvlrCta stored vlrCta_Specified;
    property vlrRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrRat write SetvlrRat stored vlrRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCPIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FfilCtr: Integer;
    FfilCtr_Specified: boolean;
    FfilNfc: Integer;
    FfilNfc_Specified: boolean;
    FfilNff: Integer;
    FfilNff_Specified: boolean;
    FfilNfv: Integer;
    FfilNfv_Specified: boolean;
    FfilOcp: Integer;
    FfilOcp_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FforNfc: Integer;
    FforNfc_Specified: boolean;
    FforNff: Integer;
    FforNff_Specified: boolean;
    FnumCtr: Integer;
    FnumCtr_Specified: boolean;
    FnumNfc: Integer;
    FnumNfc_Specified: boolean;
    FnumNff: Integer;
    FnumNff_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumOcp: Integer;
    FnumOcp_Specified: boolean;
    FocpFre: Integer;
    FocpFre_Specified: boolean;
    FocpNre: Integer;
    FocpNre_Specified: boolean;
    FretRat: string;
    FretRat_Specified: boolean;
    FseqImo: Integer;
    FseqImo_Specified: boolean;
    FsnfNfc: string;
    FsnfNfc_Specified: boolean;
    FsnfNfv: string;
    FsnfNfv_Specified: boolean;
    FvctFim: string;
    FvctFim_Specified: boolean;
    FvctIni: string;
    FvctIni_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetfilCtr(Index: Integer; const AInteger: Integer);
    function  filCtr_Specified(Index: Integer): boolean;
    procedure SetfilNfc(Index: Integer; const AInteger: Integer);
    function  filNfc_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const AInteger: Integer);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetfilNfv(Index: Integer; const AInteger: Integer);
    function  filNfv_Specified(Index: Integer): boolean;
    procedure SetfilOcp(Index: Integer; const AInteger: Integer);
    function  filOcp_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetforNfc(Index: Integer; const AInteger: Integer);
    function  forNfc_Specified(Index: Integer): boolean;
    procedure SetforNff(Index: Integer; const AInteger: Integer);
    function  forNff_Specified(Index: Integer): boolean;
    procedure SetnumCtr(Index: Integer; const AInteger: Integer);
    function  numCtr_Specified(Index: Integer): boolean;
    procedure SetnumNfc(Index: Integer; const AInteger: Integer);
    function  numNfc_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const AInteger: Integer);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumOcp(Index: Integer; const AInteger: Integer);
    function  numOcp_Specified(Index: Integer): boolean;
    procedure SetocpFre(Index: Integer; const AInteger: Integer);
    function  ocpFre_Specified(Index: Integer): boolean;
    procedure SetocpNre(Index: Integer; const AInteger: Integer);
    function  ocpNre_Specified(Index: Integer): boolean;
    procedure SetretRat(Index: Integer; const Astring: string);
    function  retRat_Specified(Index: Integer): boolean;
    procedure SetseqImo(Index: Integer; const AInteger: Integer);
    function  seqImo_Specified(Index: Integer): boolean;
    procedure SetsnfNfc(Index: Integer; const Astring: string);
    function  snfNfc_Specified(Index: Integer): boolean;
    procedure SetsnfNfv(Index: Integer; const Astring: string);
    function  snfNfv_Specified(Index: Integer): boolean;
    procedure SetvctFim(Index: Integer; const Astring: string);
    function  vctFim_Specified(Index: Integer): boolean;
    procedure SetvctIni(Index: Integer; const Astring: string);
    function  vctIni_Specified(Index: Integer): boolean;
  published
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property filCtr:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCtr write SetfilCtr stored filCtr_Specified;
    property filNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfc write SetfilNfc stored filNfc_Specified;
    property filNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property filNfv:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfv write SetfilNfv stored filNfv_Specified;
    property filOcp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilOcp write SetfilOcp stored filOcp_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property forNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNfc write SetforNfc stored forNfc_Specified;
    property forNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNff write SetforNff stored forNff_Specified;
    property numCtr:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCtr write SetnumCtr stored numCtr_Specified;
    property numNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfc write SetnumNfc stored numNfc_Specified;
    property numNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numNfv:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numOcp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumOcp write SetnumOcp stored numOcp_Specified;
    property ocpFre:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpFre write SetocpFre stored ocpFre_Specified;
    property ocpNre:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpNre write SetocpNre stored ocpNre_Specified;
    property retRat:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretRat write SetretRat stored retRat_Specified;
    property seqImo:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqImo write SetseqImo stored seqImo_Specified;
    property snfNfc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfc write SetsnfNfc stored snfNfc_Specified;
    property snfNfv:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfv write SetsnfNfv stored snfNfv_Specified;
    property vctFim:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctFim write SetvctFim stored vctFim_Specified;
    property vctIni:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctIni write SetvctIni stored vctIni_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarTitulosAbertosCPOutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCPOutTitulos: Array_Of_titulosConsultarTitulosAbertosCPOutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarTitulosAbertosCPOutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCPOutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCPOutTitulos = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFav: Double;
    FcodFav_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcpgSub: string;
    FcpgSub_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FctrFre: Integer;
    FctrFre_Specified: boolean;
    FctrNre: Integer;
    FctrNre_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscNeg: Double;
    FdscNeg_Specified: boolean;
    FfilCcr: Integer;
    FfilCcr_Specified: boolean;
    FfilCtr: Integer;
    FfilCtr_Specified: boolean;
    FfilNfc: Integer;
    FfilNfc_Specified: boolean;
    FfilNff: Integer;
    FfilNff_Specified: boolean;
    FfilNfv: Integer;
    FfilNfv_Specified: boolean;
    FfilOcp: Integer;
    FfilOcp_Specified: boolean;
    FforNfc: Integer;
    FforNfc_Specified: boolean;
    FforNff: Integer;
    FforNff_Specified: boolean;
    FgerTep: string;
    FgerTep_Specified: boolean;
    FjrsDia: Double;
    FjrsDia_Specified: boolean;
    FjrsNeg: Double;
    FjrsNeg_Specified: boolean;
    FmulNeg: Double;
    FmulNeg_Specified: boolean;
    FnumCcr: Integer;
    FnumCcr_Specified: boolean;
    FnumCtr: Integer;
    FnumCtr_Specified: boolean;
    FnumNfc: Integer;
    FnumNfc_Specified: boolean;
    FnumNff: Integer;
    FnumNff_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumOcp: Integer;
    FnumOcp_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FocpFre: Integer;
    FocpFre_Specified: boolean;
    FocpNre: Integer;
    FocpNre_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FperDsc: Integer;
    FperDsc_Specified: boolean;
    FperJrs: Integer;
    FperJrs_Specified: boolean;
    FperMul: Integer;
    FperMul_Specified: boolean;
    FproJrs: string;
    FproJrs_Specified: boolean;
    Frateios: Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios;
    Frateios_Specified: boolean;
    FseqCgt: Integer;
    FseqCgt_Specified: boolean;
    FseqImo: Integer;
    FseqImo_Specified: boolean;
    FsitTit: string;
    FsitTit_Specified: boolean;
    FsnfNfc: string;
    FsnfNfc_Specified: boolean;
    FsnfNfv: string;
    FsnfNfv_Specified: boolean;
    FtipEfe: string;
    FtipEfe_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FtolJrs: Integer;
    FtolJrs_Specified: boolean;
    FtolMul: Integer;
    FtolMul_Specified: boolean;
    FultPgt: string;
    FultPgt_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvctPro: string;
    FvctPro_Specified: boolean;
    FvlrAbe: Double;
    FvlrAbe_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFav(Index: Integer; const ADouble: Double);
    function  codFav_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcpgSub(Index: Integer; const Astring: string);
    function  cpgSub_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetctrFre(Index: Integer; const AInteger: Integer);
    function  ctrFre_Specified(Index: Integer): boolean;
    procedure SetctrNre(Index: Integer; const AInteger: Integer);
    function  ctrNre_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscNeg(Index: Integer; const ADouble: Double);
    function  dscNeg_Specified(Index: Integer): boolean;
    procedure SetfilCcr(Index: Integer; const AInteger: Integer);
    function  filCcr_Specified(Index: Integer): boolean;
    procedure SetfilCtr(Index: Integer; const AInteger: Integer);
    function  filCtr_Specified(Index: Integer): boolean;
    procedure SetfilNfc(Index: Integer; const AInteger: Integer);
    function  filNfc_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const AInteger: Integer);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetfilNfv(Index: Integer; const AInteger: Integer);
    function  filNfv_Specified(Index: Integer): boolean;
    procedure SetfilOcp(Index: Integer; const AInteger: Integer);
    function  filOcp_Specified(Index: Integer): boolean;
    procedure SetforNfc(Index: Integer; const AInteger: Integer);
    function  forNfc_Specified(Index: Integer): boolean;
    procedure SetforNff(Index: Integer; const AInteger: Integer);
    function  forNff_Specified(Index: Integer): boolean;
    procedure SetgerTep(Index: Integer; const Astring: string);
    function  gerTep_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const ADouble: Double);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const ADouble: Double);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const ADouble: Double);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumCcr(Index: Integer; const AInteger: Integer);
    function  numCcr_Specified(Index: Integer): boolean;
    procedure SetnumCtr(Index: Integer; const AInteger: Integer);
    function  numCtr_Specified(Index: Integer): boolean;
    procedure SetnumNfc(Index: Integer; const AInteger: Integer);
    function  numNfc_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const AInteger: Integer);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumOcp(Index: Integer; const AInteger: Integer);
    function  numOcp_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetocpFre(Index: Integer; const AInteger: Integer);
    function  ocpFre_Specified(Index: Integer): boolean;
    procedure SetocpNre(Index: Integer; const AInteger: Integer);
    function  ocpNre_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const AInteger: Integer);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const AInteger: Integer);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const AInteger: Integer);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const Astring: string);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure Setrateios(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios: Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios);
    function  rateios_Specified(Index: Integer): boolean;
    procedure SetseqCgt(Index: Integer; const AInteger: Integer);
    function  seqCgt_Specified(Index: Integer): boolean;
    procedure SetseqImo(Index: Integer; const AInteger: Integer);
    function  seqImo_Specified(Index: Integer): boolean;
    procedure SetsitTit(Index: Integer; const Astring: string);
    function  sitTit_Specified(Index: Integer): boolean;
    procedure SetsnfNfc(Index: Integer; const Astring: string);
    function  snfNfc_Specified(Index: Integer): boolean;
    procedure SetsnfNfv(Index: Integer; const Astring: string);
    function  snfNfv_Specified(Index: Integer): boolean;
    procedure SettipEfe(Index: Integer; const Astring: string);
    function  tipEfe_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const AInteger: Integer);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const AInteger: Integer);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetultPgt(Index: Integer; const Astring: string);
    function  ultPgt_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvctPro(Index: Integer; const Astring: string);
    function  vctPro_Specified(Index: Integer): boolean;
    procedure SetvlrAbe(Index: Integer; const ADouble: Double);
    function  vlrAbe_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property antDsc:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property codCcu:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFav:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFav write SetcodFav stored codFav_Specified;
    property codFil:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codFrj:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codMoe:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cpgSub:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpgSub write SetcpgSub stored cpgSub_Specified;
    property ctaFin:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrFre:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrFre write SetctrFre stored ctrFre_Specified;
    property ctrNre:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrNre write SetctrNre stored ctrNre_Specified;
    property datDsc:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property filCcr:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCcr write SetfilCcr stored filCcr_Specified;
    property filCtr:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCtr write SetfilCtr stored filCtr_Specified;
    property filNfc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfc write SetfilNfc stored filNfc_Specified;
    property filNff:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property filNfv:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfv write SetfilNfv stored filNfv_Specified;
    property filOcp:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilOcp write SetfilOcp stored filOcp_Specified;
    property forNfc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNfc write SetforNfc stored forNfc_Specified;
    property forNff:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNff write SetforNff stored forNff_Specified;
    property gerTep:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTep write SetgerTep stored gerTep_Specified;
    property jrsDia:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numCcr:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCcr write SetnumCcr stored numCcr_Specified;
    property numCtr:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCtr write SetnumCtr stored numCtr_Specified;
    property numNfc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfc write SetnumNfc stored numNfc_Specified;
    property numNff:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numNfv:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numOcp:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumOcp write SetnumOcp stored numOcp_Specified;
    property numPrj:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcp:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property ocpFre:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpFre write SetocpFre stored ocpFre_Specified;
    property ocpNre:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FocpNre write SetocpNre stored ocpNre_Specified;
    property outNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property proJrs:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property rateios: Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateios write Setrateios stored rateios_Specified;
    property seqCgt:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCgt write SetseqCgt stored seqCgt_Specified;
    property seqImo:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqImo write SetseqImo stored seqImo_Specified;
    property sitTit:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitTit write SetsitTit stored sitTit_Specified;
    property snfNfc:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfc write SetsnfNfc stored snfNfc_Specified;
    property snfNfv:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfv write SetsnfNfv stored snfNfv_Specified;
    property tipEfe:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEfe write SettipEfe stored tipEfe_Specified;
    property tipJrs:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tolDsc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property ultPgt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FultPgt write SetultPgt stored ultPgt_Specified;
    property vctOri:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrAbe:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAbe write SetvlrAbe stored vlrAbe_Specified;
    property vlrDsc:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarVariacaoCambialOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosProcessarVariacaoCambialOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    FtitulosCalculados: Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados;
    FtitulosCalculados_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure SettitulosCalculados(Index: Integer; const AArray_Of_titulosProcessarVariacaoCambialOutTitulosCalculados: Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados);
    function  titulosCalculados_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:      string                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:   string                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:       Integer                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulosCalculados: Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosCalculados write SettitulosCalculados stored titulosCalculados_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarVariacaoCambialOutTitulosCalculados, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarVariacaoCambialOutTitulosCalculados = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property codEmp:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCPIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FdatPgt: string;
    FdatPgt_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FforCli: string;
    FforCli_Specified: boolean;
    FtitulosBaixar: Array_Of_titulosSubstituirTitulosCPInTitulosBaixar;
    FtitulosBaixar_Specified: boolean;
    FtitulosSubstitutos: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos;
    FtitulosSubstitutos_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetdatPgt(Index: Integer; const Astring: string);
    function  datPgt_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetforCli(Index: Integer; const Astring: string);
    function  forCli_Specified(Index: Integer): boolean;
    procedure SettitulosBaixar(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPInTitulosBaixar: Array_Of_titulosSubstituirTitulosCPInTitulosBaixar);
    function  titulosBaixar_Specified(Index: Integer): boolean;
    procedure SettitulosSubstitutos(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPInTitulosSubstitutos: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos);
    function  titulosSubstitutos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:             Integer                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:             Integer                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTns:             string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property datPgt:             string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPgt write SetdatPgt stored datPgt_Specified;
    property flowInstanceID:     string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property forCli:             string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforCli write SetforCli stored forCli_Specified;
    property titulosBaixar:      Array_Of_titulosSubstituirTitulosCPInTitulosBaixar       Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosBaixar write SettitulosBaixar stored titulosBaixar_Specified;
    property titulosSubstitutos: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosSubstitutos write SettitulosSubstitutos stored titulosSubstitutos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarVariacaoCambialInTitulosACalcular, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarVariacaoCambialInTitulosACalcular = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarTitulosCPOutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosCPOutTitulos: Array_Of_titulosConsultarTitulosCPOutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarTitulosCPOutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCPOutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosCPOutTitulos = class(TRemotable)
  private
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcodUsu: string;
    FcodUsu_Specified: boolean;
    FcorApr: string;
    FcorApr_Specified: boolean;
    FcotApr: string;
    FcotApr_Specified: boolean;
    FcotEmi: string;
    FcotEmi_Specified: boolean;
    FctaApr: string;
    FctaApr_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FdatApr: string;
    FdatApr_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscApr: string;
    FdscApr_Specified: boolean;
    FempApr: string;
    FempApr_Specified: boolean;
    FencApr: string;
    FencApr_Specified: boolean;
    FfpgApr: string;
    FfpgApr_Specified: boolean;
    FhorApr: string;
    FhorApr_Specified: boolean;
    FjrsApr: string;
    FjrsApr_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FlibApr: string;
    FlibApr_Specified: boolean;
    FmulApr: string;
    FmulApr_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FoacApr: string;
    FoacApr_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FodeApr: string;
    FodeApr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FpgtApr: string;
    FpgtApr_Specified: boolean;
    FporAnt: string;
    FporAnt_Specified: boolean;
    FseqApr: string;
    FseqApr_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtipTcc: string;
    FtipTcc_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FusuSit: string;
    FusuSit_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrApr: string;
    FvlrApr_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcodUsu(Index: Integer; const Astring: string);
    function  codUsu_Specified(Index: Integer): boolean;
    procedure SetcorApr(Index: Integer; const Astring: string);
    function  corApr_Specified(Index: Integer): boolean;
    procedure SetcotApr(Index: Integer; const Astring: string);
    function  cotApr_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const Astring: string);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetctaApr(Index: Integer; const Astring: string);
    function  ctaApr_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatApr(Index: Integer; const Astring: string);
    function  datApr_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscApr(Index: Integer; const Astring: string);
    function  dscApr_Specified(Index: Integer): boolean;
    procedure SetempApr(Index: Integer; const Astring: string);
    function  empApr_Specified(Index: Integer): boolean;
    procedure SetencApr(Index: Integer; const Astring: string);
    function  encApr_Specified(Index: Integer): boolean;
    procedure SetfpgApr(Index: Integer; const Astring: string);
    function  fpgApr_Specified(Index: Integer): boolean;
    procedure SethorApr(Index: Integer; const Astring: string);
    function  horApr_Specified(Index: Integer): boolean;
    procedure SetjrsApr(Index: Integer; const Astring: string);
    function  jrsApr_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetlibApr(Index: Integer; const Astring: string);
    function  libApr_Specified(Index: Integer): boolean;
    procedure SetmulApr(Index: Integer; const Astring: string);
    function  mulApr_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetoacApr(Index: Integer; const Astring: string);
    function  oacApr_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetodeApr(Index: Integer; const Astring: string);
    function  odeApr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpgtApr(Index: Integer; const Astring: string);
    function  pgtApr_Specified(Index: Integer): boolean;
    procedure SetporAnt(Index: Integer; const Astring: string);
    function  porAnt_Specified(Index: Integer): boolean;
    procedure SetseqApr(Index: Integer; const Astring: string);
    function  seqApr_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const Astring: string);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetusuSit(Index: Integer; const Astring: string);
    function  usuSit_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrApr(Index: Integer; const Astring: string);
    function  vlrApr_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property ccbFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cnpjFilial: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property codTri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property codUsu:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodUsu write SetcodUsu stored codUsu_Specified;
    property corApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcorApr write SetcorApr stored corApr_Specified;
    property cotApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotApr write SetcotApr stored cotApr_Specified;
    property cotEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property ctaApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaApr write SetctaApr stored ctaApr_Specified;
    property ctaFin:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatApr write SetdatApr stored datApr_Specified;
    property datDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscApr write SetdscApr stored dscApr_Specified;
    property empApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempApr write SetempApr stored empApr_Specified;
    property encApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FencApr write SetencApr stored encApr_Specified;
    property fpgApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfpgApr write SetfpgApr stored fpgApr_Specified;
    property horApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhorApr write SethorApr stored horApr_Specified;
    property jrsApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsApr write SetjrsApr stored jrsApr_Specified;
    property jrsDia:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property libApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlibApr write SetlibApr stored libApr_Specified;
    property mulApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulApr write SetmulApr stored mulApr_Specified;
    property mulNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numArb:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numPrj:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property oacApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoacApr write SetoacApr stored oacApr_Specified;
    property obsTcp:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property odeApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FodeApr write SetodeApr stored odeApr_Specified;
    property outNeg:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property pgtApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtApr write SetpgtApr stored pgtApr_Specified;
    property porAnt:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporAnt write SetporAnt stored porAnt_Specified;
    property seqApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqApr write SetseqApr stored seqApr_Specified;
    property tipJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tipTcc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property titBan:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property usuSit:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FusuSit write SetusuSit stored usuSit_Specified;
    property vctOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrApr:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrApr write SetvlrApr stored vlrApr_Specified;
    property vlrDsc:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosProcessarVariacaoCambialIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarVariacaoCambialIn = class(TRemotable)
  private
    FdataBaseFinal: string;
    FdataBaseFinal_Specified: boolean;
    FdataBaseInicial: string;
    FdataBaseInicial_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidPacote: Integer;
    FidPacote_Specified: boolean;
    FtitulosACalcular: Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular;
    FtitulosACalcular_Specified: boolean;
    procedure SetdataBaseFinal(Index: Integer; const Astring: string);
    function  dataBaseFinal_Specified(Index: Integer): boolean;
    procedure SetdataBaseInicial(Index: Integer; const Astring: string);
    function  dataBaseInicial_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidPacote(Index: Integer; const AInteger: Integer);
    function  idPacote_Specified(Index: Integer): boolean;
    procedure SettitulosACalcular(Index: Integer; const AArray_Of_titulosProcessarVariacaoCambialInTitulosACalcular: Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular);
    function  titulosACalcular_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dataBaseFinal:    string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBaseFinal write SetdataBaseFinal stored dataBaseFinal_Specified;
    property dataBaseInicial:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBaseInicial write SetdataBaseInicial stored dataBaseInicial_Specified;
    property flowInstanceID:   string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idPacote:         Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidPacote write SetidPacote stored idPacote_Specified;
    property titulosACalcular: Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosACalcular write SettitulosACalcular stored titulosACalcular_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCPInTitulosBaixar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCPInTitulosBaixar = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcp: string;
    FobsMcp_Specified: boolean;
    FvlrBai: Double;
    FvlrBai_Specified: boolean;
    FvlrCor: Double;
    FvlrCor_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrEnc: Double;
    FvlrEnc_Specified: boolean;
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrMul: Double;
    FvlrMul_Specified: boolean;
    FvlrOac: Double;
    FvlrOac_Specified: boolean;
    FvlrOde: Double;
    FvlrOde_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcp(Index: Integer; const Astring: string);
    function  obsMcp_Specified(Index: Integer): boolean;
    procedure SetvlrBai(Index: Integer; const ADouble: Double);
    function  vlrBai_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const ADouble: Double);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrEnc(Index: Integer; const ADouble: Double);
    function  vlrEnc_Specified(Index: Integer): boolean;
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrMul(Index: Integer; const ADouble: Double);
    function  vlrMul_Specified(Index: Integer): boolean;
    procedure SetvlrOac(Index: Integer; const ADouble: Double);
    function  vlrOac_Specified(Index: Integer): boolean;
    procedure SetvlrOde(Index: Integer; const ADouble: Double);
    function  vlrOde_Specified(Index: Integer): boolean;
  published
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcp: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcp write SetobsMcp stored obsMcp_Specified;
    property vlrBai: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBai write SetvlrBai stored vlrBai_Specified;
    property vlrCor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDsc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrMul: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCPIn = class(TRemotable)
  private
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Ftitulos: Array_Of_titulosGravarTitulosCPInTitulos;
    Ftitulos_Specified: boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosGravarTitulosCPInTitulos: Array_Of_titulosGravarTitulosCPInTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dataBuild:      string                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID: string                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulos:        Array_Of_titulosGravarTitulosCPInTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCPInTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCPInTitulos = class(TRemotable)
  private
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcodUsu: string;
    FcodUsu_Specified: boolean;
    FcorApr: string;
    FcorApr_Specified: boolean;
    FcotApr: string;
    FcotApr_Specified: boolean;
    FcotEmi: string;
    FcotEmi_Specified: boolean;
    FctaApr: string;
    FctaApr_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FdatApr: string;
    FdatApr_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscApr: string;
    FdscApr_Specified: boolean;
    FempApr: string;
    FempApr_Specified: boolean;
    FencApr: string;
    FencApr_Specified: boolean;
    FfpgApr: string;
    FfpgApr_Specified: boolean;
    FhorApr: string;
    FhorApr_Specified: boolean;
    FideExt: Integer;
    FideExt_Specified: boolean;
    FjrsApr: string;
    FjrsApr_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FlibApr: string;
    FlibApr_Specified: boolean;
    FmulApr: string;
    FmulApr_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FoacApr: string;
    FoacApr_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FodeApr: string;
    FodeApr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FpgtApr: string;
    FpgtApr_Specified: boolean;
    FporAnt: string;
    FporAnt_Specified: boolean;
    FseqApr: string;
    FseqApr_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtipTcc: Integer;
    FtipTcc_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FusuSit: string;
    FusuSit_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrApr: string;
    FvlrApr_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcodUsu(Index: Integer; const Astring: string);
    function  codUsu_Specified(Index: Integer): boolean;
    procedure SetcorApr(Index: Integer; const Astring: string);
    function  corApr_Specified(Index: Integer): boolean;
    procedure SetcotApr(Index: Integer; const Astring: string);
    function  cotApr_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const Astring: string);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetctaApr(Index: Integer; const Astring: string);
    function  ctaApr_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatApr(Index: Integer; const Astring: string);
    function  datApr_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscApr(Index: Integer; const Astring: string);
    function  dscApr_Specified(Index: Integer): boolean;
    procedure SetempApr(Index: Integer; const Astring: string);
    function  empApr_Specified(Index: Integer): boolean;
    procedure SetencApr(Index: Integer; const Astring: string);
    function  encApr_Specified(Index: Integer): boolean;
    procedure SetfpgApr(Index: Integer; const Astring: string);
    function  fpgApr_Specified(Index: Integer): boolean;
    procedure SethorApr(Index: Integer; const Astring: string);
    function  horApr_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const AInteger: Integer);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetjrsApr(Index: Integer; const Astring: string);
    function  jrsApr_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetlibApr(Index: Integer; const Astring: string);
    function  libApr_Specified(Index: Integer): boolean;
    procedure SetmulApr(Index: Integer; const Astring: string);
    function  mulApr_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetoacApr(Index: Integer; const Astring: string);
    function  oacApr_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetodeApr(Index: Integer; const Astring: string);
    function  odeApr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpgtApr(Index: Integer; const Astring: string);
    function  pgtApr_Specified(Index: Integer): boolean;
    procedure SetporAnt(Index: Integer; const Astring: string);
    function  porAnt_Specified(Index: Integer): boolean;
    procedure SetseqApr(Index: Integer; const Astring: string);
    function  seqApr_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettipTcc(Index: Integer; const AInteger: Integer);
    function  tipTcc_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetusuSit(Index: Integer; const Astring: string);
    function  usuSit_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrApr(Index: Integer; const Astring: string);
    function  vlrApr_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property ccbFor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property codTri:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property codUsu:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodUsu write SetcodUsu stored codUsu_Specified;
    property corApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcorApr write SetcorApr stored corApr_Specified;
    property cotApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotApr write SetcotApr stored cotApr_Specified;
    property cotEmi:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property ctaApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaApr write SetctaApr stored ctaApr_Specified;
    property ctaFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatApr write SetdatApr stored datApr_Specified;
    property datDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscApr write SetdscApr stored dscApr_Specified;
    property empApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempApr write SetempApr stored empApr_Specified;
    property encApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FencApr write SetencApr stored encApr_Specified;
    property fpgApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfpgApr write SetfpgApr stored fpgApr_Specified;
    property horApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhorApr write SethorApr stored horApr_Specified;
    property ideExt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property jrsApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsApr write SetjrsApr stored jrsApr_Specified;
    property jrsDia:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property libApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlibApr write SetlibApr stored libApr_Specified;
    property mulApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulApr write SetmulApr stored mulApr_Specified;
    property mulNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numArb:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numPrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property oacApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoacApr write SetoacApr stored oacApr_Specified;
    property obsTcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property odeApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FodeApr write SetodeApr stored odeApr_Specified;
    property outNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property pgtApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpgtApr write SetpgtApr stored pgtApr_Specified;
    property porAnt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporAnt write SetporAnt stored porAnt_Specified;
    property seqApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqApr write SetseqApr stored seqApr_Specified;
    property tipJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tipTcc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTcc write SettipTcc stored tipTcc_Specified;
    property titBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property usuSit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FusuSit write SetusuSit stored usuSit_Specified;
    property vctOri:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrApr write SetvlrApr stored vlrApr_Specified;
    property vlrDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosGravarTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosGravarTitulosCPOutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosGravarTitulosCPOutResultado: Array_Of_titulosGravarTitulosCPOutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosGravarTitulosCPOutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCPOutGridResult, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCPOutGridResult = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FtxtRet: string;
    FtxtRet_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettxtRet(Index: Integer; const Astring: string);
    function  txtRet_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property txtRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtxtRet write SettxtRet stored txtRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCPInTitulosSubstitutos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCPInTitulosSubstitutos = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcheAge: string;
    FcheAge_Specified: boolean;
    FcheBan: string;
    FcheBan_Specified: boolean;
    FcheCta: string;
    FcheCta_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodFav: Double;
    FcodFav_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcodTri: string;
    FcodTri_Specified: boolean;
    FcotNeg: Double;
    FcotNeg_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FdatDsc: string;
    FdatDsc_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatNeg: string;
    FdatNeg_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FdscNeg: Double;
    FdscNeg_Specified: boolean;
    FjrsNeg: Double;
    FjrsNeg_Specified: boolean;
    FmulNeg: Double;
    FmulNeg_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FperDsc: Integer;
    FperDsc_Specified: boolean;
    FperJrs: Integer;
    FperJrs_Specified: boolean;
    FperMul: Integer;
    FperMul_Specified: boolean;
    FpriPgt: Integer;
    FpriPgt_Specified: boolean;
    Frateio: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio;
    Frateio_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FtolJrs: Integer;
    FtolJrs_Specified: boolean;
    FtolMul: Integer;
    FtolMul_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvctPro: string;
    FvctPro_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcheAge(Index: Integer; const Astring: string);
    function  cheAge_Specified(Index: Integer): boolean;
    procedure SetcheBan(Index: Integer; const Astring: string);
    function  cheBan_Specified(Index: Integer): boolean;
    procedure SetcheCta(Index: Integer; const Astring: string);
    function  cheCta_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodFav(Index: Integer; const ADouble: Double);
    function  codFav_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcodTri(Index: Integer; const Astring: string);
    function  codTri_Specified(Index: Integer): boolean;
    procedure SetcotNeg(Index: Integer; const ADouble: Double);
    function  cotNeg_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatDsc(Index: Integer; const Astring: string);
    function  datDsc_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatNeg(Index: Integer; const Astring: string);
    function  datNeg_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetdscNeg(Index: Integer; const ADouble: Double);
    function  dscNeg_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const ADouble: Double);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const ADouble: Double);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const AInteger: Integer);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const AInteger: Integer);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const AInteger: Integer);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetpriPgt(Index: Integer; const AInteger: Integer);
    function  priPgt_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const AInteger: Integer);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const AInteger: Integer);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvctPro(Index: Integer; const Astring: string);
    function  vctPro_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property antDsc: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property ccbFor: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property cheAge: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheAge write SetcheAge stored cheAge_Specified;
    property cheBan: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheBan write SetcheBan stored cheBan_Specified;
    property cheCta: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheCta write SetcheCta stored cheCta_Specified;
    property codAge: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrp: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codFav: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFav write SetcodFav stored codFav_Specified;
    property codFil: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codMoe: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codNtg: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property codTri: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTri write SetcodTri stored codTri_Specified;
    property cotNeg: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotNeg write SetcotNeg stored cotNeg_Specified;
    property ctaFin: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datDsc: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property jrsNeg: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property numPrj: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcp: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property outNeg: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property priPgt: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpriPgt write SetpriPgt stored priPgt_Specified;
    property rateio: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property tipJrs: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property tolDsc: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property vctOri: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrDsc: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrJrs: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrOri: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCPInTitulosSubstitutosRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCPInTitulosSubstitutosRateio = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: Double;
    FperCta_Specified: boolean;
    FperRat: Double;
    FperRat_Specified: boolean;
    FvlrCta: Double;
    FvlrCta_Specified: boolean;
    FvlrRat: Double;
    FvlrRat_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const ADouble: Double);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const ADouble: Double);
    function  perRat_Specified(Index: Integer): boolean;
    procedure SetvlrCta(Index: Integer; const ADouble: Double);
    function  vlrCta_Specified(Index: Integer): boolean;
    procedure SetvlrRat(Index: Integer; const ADouble: Double);
    function  vlrRat_Specified(Index: Integer): boolean;
  published
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
    property vlrCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCta write SetvlrCta stored vlrCta_Specified;
    property vlrRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrRat write SetvlrRat stored vlrRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosSubstituirTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridResult: Array_Of_titulosSubstituirTitulosCPOutGridResult;
    FgridResult_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridResult(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPOutGridResult: Array_Of_titulosSubstituirTitulosCPOutGridResult);
    function  gridResult_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridResult:   Array_Of_titulosSubstituirTitulosCPOutGridResult  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridResult write SetgridResult stored gridResult_Specified;
    property resultado:    string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Synccom_senior_g5_co_mfi_cpa_titulosPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Synccom_senior_g5_co_mfi_cpa_titulosPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos
  // ************************************************************************ //
  sapiens_Synccom_senior_g5_co_mfi_cpa_titulos = interface(IInvokable)
  ['{23575952-3FC9-6C8C-EBE9-525F16B91C59}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTitulosAbertosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTitulosAbertosCPIn): titulosConsultarTitulosAbertosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTitulosAbertosCP_2(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTitulosAbertosCP2In): titulosConsultarTitulosAbertosCP2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosGravarTitulosCPIn): titulosGravarTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EntradaTitulosLoteCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosEntradaTitulosLoteCPIn): titulosEntradaTitulosLoteCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  BaixarTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosBaixarTitulosCPIn): titulosBaixarTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ExcluirTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosExcluirTitulosCPIn): titulosExcluirTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  SubstituirTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosSubstituirTitulosCPIn): titulosSubstituirTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GerarBaixaAproveitamentoCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosGerarBaixaAproveitamentoCPIn): titulosGerarBaixaAproveitamentoCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GerarBaixaPorLoteCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosGerarBaixaPorLoteCPIn): titulosGerarBaixaPorLoteCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EstornoBaixaTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosEstornoBaixaTitulosCPIn): titulosEstornoBaixaTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EstornoBaixaTitulosCP_2(const user: string; const password: string; const encryption: Integer; const parameters: titulosEstornoBaixaTitulosCP2In): titulosEstornoBaixaTitulosCP2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  buscarPendentesCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosbuscarPendentesCPIn): titulosbuscarPendentesCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ProcessarVariacaoCambial(const user: string; const password: string; const encryption: Integer; const parameters: titulosProcessarVariacaoCambialIn): titulosProcessarVariacaoCambialOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTitulosCPIn): titulosConsultarTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTitulosCP_2(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTitulosCP2In): titulosConsultarTitulosCP2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarCPIn): titulosConsultarCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  reprovarCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosreprovarCPIn): titulosreprovarCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarCP_2(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarCP2In): titulosConsultarCP2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  aprovarCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosaprovarCPIn): titulosaprovarCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ProcessarAVM(const user: string; const password: string; const encryption: Integer; const parameters: titulosProcessarAVMIn): titulosProcessarAVMOut; stdcall;
  end;

function Getsapiens_Synccom_senior_g5_co_mfi_cpa_titulos(producao : Boolean;UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Synccom_senior_g5_co_mfi_cpa_titulos;


implementation
  uses System.SysUtils;

function Getsapiens_Synccom_senior_g5_co_mfi_cpa_titulos(producao : Boolean; UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Synccom_senior_g5_co_mfi_cpa_titulos;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos';
  defWSDL_hmlg = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos?wsdl';
  defURL_hmlg  = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cpa_titulos';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Synccom_senior_g5_co_mfi_cpa_titulosPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if Producao then
    begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
    end
    else
    begin
    if UseWSDL then
      Addr := defWSDL_hmlg
    else
      Addr := defURL_hmlg;
    end;

  end;

  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;

  try
    Result := (RIO as sapiens_Synccom_senior_g5_co_mfi_cpa_titulos);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end
    else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure titulosConsultarCP2In.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarCP2In.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarCP2In.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarCP2In.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarCP2In.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarCP2In.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarCP2In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosConsultarCP2In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosConsultarCP2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarCP2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarCP2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarCP2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetabrFpj(Index: Integer; const Astring: string);
begin
  FabrFpj := Astring;
  FabrFpj_Specified := True;
end;

function titulosConsultarCP2OutTitulos.abrFpj_Specified(Index: Integer): boolean;
begin
  Result := FabrFpj_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetabrPrj(Index: Integer; const Astring: string);
begin
  FabrPrj := Astring;
  FabrPrj_Specified := True;
end;

function titulosConsultarCP2OutTitulos.abrPrj_Specified(Index: Integer): boolean;
begin
  Result := FabrPrj_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosConsultarCP2OutTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosConsultarCP2OutTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcodUsu(Index: Integer; const Astring: string);
begin
  FcodUsu := Astring;
  FcodUsu_Specified := True;
end;

function titulosConsultarCP2OutTitulos.codUsu_Specified(Index: Integer): boolean;
begin
  Result := FcodUsu_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcorApr(Index: Integer; const Astring: string);
begin
  FcorApr := Astring;
  FcorApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.corApr_Specified(Index: Integer): boolean;
begin
  Result := FcorApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcotApr(Index: Integer; const Astring: string);
begin
  FcotApr := Astring;
  FcotApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.cotApr_Specified(Index: Integer): boolean;
begin
  Result := FcotApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetcotEmi(Index: Integer; const Astring: string);
begin
  FcotEmi := Astring;
  FcotEmi_Specified := True;
end;

function titulosConsultarCP2OutTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetctaApr(Index: Integer; const Astring: string);
begin
  FctaApr := Astring;
  FctaApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.ctaApr_Specified(Index: Integer): boolean;
begin
  Result := FctaApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosConsultarCP2OutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosConsultarCP2OutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdatApr(Index: Integer; const Astring: string);
begin
  FdatApr := Astring;
  FdatApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.datApr_Specified(Index: Integer): boolean;
begin
  Result := FdatApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarCP2OutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarCP2OutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarCP2OutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarCP2OutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarCP2OutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetdscApr(Index: Integer; const Astring: string);
begin
  FdscApr := Astring;
  FdscApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.dscApr_Specified(Index: Integer): boolean;
begin
  Result := FdscApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetempApr(Index: Integer; const Astring: string);
begin
  FempApr := Astring;
  FempApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.empApr_Specified(Index: Integer): boolean;
begin
  Result := FempApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetencApr(Index: Integer; const Astring: string);
begin
  FencApr := Astring;
  FencApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.encApr_Specified(Index: Integer): boolean;
begin
  Result := FencApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetfpgApr(Index: Integer; const Astring: string);
begin
  FfpgApr := Astring;
  FfpgApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.fpgApr_Specified(Index: Integer): boolean;
begin
  Result := FfpgApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SethorApr(Index: Integer; const Astring: string);
begin
  FhorApr := Astring;
  FhorApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.horApr_Specified(Index: Integer): boolean;
begin
  Result := FhorApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetjrsApr(Index: Integer; const Astring: string);
begin
  FjrsApr := Astring;
  FjrsApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.jrsApr_Specified(Index: Integer): boolean;
begin
  Result := FjrsApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosConsultarCP2OutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosConsultarCP2OutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetlibApr(Index: Integer; const Astring: string);
begin
  FlibApr := Astring;
  FlibApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.libApr_Specified(Index: Integer): boolean;
begin
  Result := FlibApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetmulApr(Index: Integer; const Astring: string);
begin
  FmulApr := Astring;
  FmulApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.mulApr_Specified(Index: Integer): boolean;
begin
  Result := FmulApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosConsultarCP2OutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosConsultarCP2OutTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosConsultarCP2OutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarCP2OutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetoacApr(Index: Integer; const Astring: string);
begin
  FoacApr := Astring;
  FoacApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.oacApr_Specified(Index: Integer): boolean;
begin
  Result := FoacApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosConsultarCP2OutTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetodeApr(Index: Integer; const Astring: string);
begin
  FodeApr := Astring;
  FodeApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.odeApr_Specified(Index: Integer): boolean;
begin
  Result := FodeApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosConsultarCP2OutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosConsultarCP2OutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosConsultarCP2OutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosConsultarCP2OutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetpgtApr(Index: Integer; const Astring: string);
begin
  FpgtApr := Astring;
  FpgtApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.pgtApr_Specified(Index: Integer): boolean;
begin
  Result := FpgtApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetporAnt(Index: Integer; const Astring: string);
begin
  FporAnt := Astring;
  FporAnt_Specified := True;
end;

function titulosConsultarCP2OutTitulos.porAnt_Specified(Index: Integer): boolean;
begin
  Result := FporAnt_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetseqApr(Index: Integer; const Astring: string);
begin
  FseqApr := Astring;
  FseqApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.seqApr_Specified(Index: Integer): boolean;
begin
  Result := FseqApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarCP2OutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SettipTcc(Index: Integer; const Astring: string);
begin
  FtipTcc := Astring;
  FtipTcc_Specified := True;
end;

function titulosConsultarCP2OutTitulos.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosConsultarCP2OutTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosConsultarCP2OutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosConsultarCP2OutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosConsultarCP2OutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetusuSit(Index: Integer; const Astring: string);
begin
  FusuSit := Astring;
  FusuSit_Specified := True;
end;

function titulosConsultarCP2OutTitulos.usuSit_Specified(Index: Integer): boolean;
begin
  Result := FusuSit_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarCP2OutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetvlrApr(Index: Integer; const Astring: string);
begin
  FvlrApr := Astring;
  FvlrApr_Specified := True;
end;

function titulosConsultarCP2OutTitulos.vlrApr_Specified(Index: Integer): boolean;
begin
  Result := FvlrApr_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosConsultarCP2OutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarCP2OutTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosConsultarCP2OutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetabrFpj(Index: Integer; const Astring: string);
begin
  FabrFpj := Astring;
  FabrFpj_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.abrFpj_Specified(Index: Integer): boolean;
begin
  Result := FabrFpj_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetabrPrj(Index: Integer; const Astring: string);
begin
  FabrPrj := Astring;
  FabrPrj_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.abrPrj_Specified(Index: Integer): boolean;
begin
  Result := FabrPrj_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcodUsu(Index: Integer; const Astring: string);
begin
  FcodUsu := Astring;
  FcodUsu_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.codUsu_Specified(Index: Integer): boolean;
begin
  Result := FcodUsu_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcorApr(Index: Integer; const Astring: string);
begin
  FcorApr := Astring;
  FcorApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.corApr_Specified(Index: Integer): boolean;
begin
  Result := FcorApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcotApr(Index: Integer; const Astring: string);
begin
  FcotApr := Astring;
  FcotApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.cotApr_Specified(Index: Integer): boolean;
begin
  Result := FcotApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetcotEmi(Index: Integer; const Astring: string);
begin
  FcotEmi := Astring;
  FcotEmi_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetctaApr(Index: Integer; const Astring: string);
begin
  FctaApr := Astring;
  FctaApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.ctaApr_Specified(Index: Integer): boolean;
begin
  Result := FctaApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdatApr(Index: Integer; const Astring: string);
begin
  FdatApr := Astring;
  FdatApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.datApr_Specified(Index: Integer): boolean;
begin
  Result := FdatApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetdscApr(Index: Integer; const Astring: string);
begin
  FdscApr := Astring;
  FdscApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.dscApr_Specified(Index: Integer): boolean;
begin
  Result := FdscApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetempApr(Index: Integer; const Astring: string);
begin
  FempApr := Astring;
  FempApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.empApr_Specified(Index: Integer): boolean;
begin
  Result := FempApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetencApr(Index: Integer; const Astring: string);
begin
  FencApr := Astring;
  FencApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.encApr_Specified(Index: Integer): boolean;
begin
  Result := FencApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetfpgApr(Index: Integer; const Astring: string);
begin
  FfpgApr := Astring;
  FfpgApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.fpgApr_Specified(Index: Integer): boolean;
begin
  Result := FfpgApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SethorApr(Index: Integer; const Astring: string);
begin
  FhorApr := Astring;
  FhorApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.horApr_Specified(Index: Integer): boolean;
begin
  Result := FhorApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetjrsApr(Index: Integer; const Astring: string);
begin
  FjrsApr := Astring;
  FjrsApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.jrsApr_Specified(Index: Integer): boolean;
begin
  Result := FjrsApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetlibApr(Index: Integer; const Astring: string);
begin
  FlibApr := Astring;
  FlibApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.libApr_Specified(Index: Integer): boolean;
begin
  Result := FlibApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetmulApr(Index: Integer; const Astring: string);
begin
  FmulApr := Astring;
  FmulApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.mulApr_Specified(Index: Integer): boolean;
begin
  Result := FmulApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetoacApr(Index: Integer; const Astring: string);
begin
  FoacApr := Astring;
  FoacApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.oacApr_Specified(Index: Integer): boolean;
begin
  Result := FoacApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetodeApr(Index: Integer; const Astring: string);
begin
  FodeApr := Astring;
  FodeApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.odeApr_Specified(Index: Integer): boolean;
begin
  Result := FodeApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetpgtApr(Index: Integer; const Astring: string);
begin
  FpgtApr := Astring;
  FpgtApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.pgtApr_Specified(Index: Integer): boolean;
begin
  Result := FpgtApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetporAnt(Index: Integer; const Astring: string);
begin
  FporAnt := Astring;
  FporAnt_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.porAnt_Specified(Index: Integer): boolean;
begin
  Result := FporAnt_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetseqApr(Index: Integer; const Astring: string);
begin
  FseqApr := Astring;
  FseqApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.seqApr_Specified(Index: Integer): boolean;
begin
  Result := FseqApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SettipTcc(Index: Integer; const Astring: string);
begin
  FtipTcc := Astring;
  FtipTcc_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetusuSit(Index: Integer; const Astring: string);
begin
  FusuSit := Astring;
  FusuSit_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.usuSit_Specified(Index: Integer): boolean;
begin
  Result := FusuSit_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetvlrApr(Index: Integer; const Astring: string);
begin
  FvlrApr := Astring;
  FvlrApr_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.vlrApr_Specified(Index: Integer): boolean;
begin
  Result := FvlrApr_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarTitulosCP2OutTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosConsultarTitulosCP2OutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

constructor titulosConsultarTitulosCP2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTitulosCP2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosCP2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTitulosCP2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTitulosCP2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTitulosCP2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTitulosCP2Out.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarTitulosCP2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosCP2Out.Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosCP2OutTitulos: Array_Of_titulosConsultarTitulosCP2OutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarTitulosCP2OutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarTitulosCP2Out.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosConsultarTitulosCP2In.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosCP2In.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosCP2In.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosCP2In.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosCP2In.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosCP2In.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosCP2In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosConsultarTitulosCP2In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosConsultarTitulosCP2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTitulosCP2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTitulosCP2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTitulosCP2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor titulosaprovarCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosaprovarCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosaprovarCPOut.SetcodigoResultado(Index: Integer; const Astring: string);
begin
  FcodigoResultado := Astring;
  FcodigoResultado_Specified := True;
end;

function titulosaprovarCPOut.codigoResultado_Specified(Index: Integer): boolean;
begin
  Result := FcodigoResultado_Specified;
end;

procedure titulosaprovarCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosaprovarCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosaprovarCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosaprovarCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosaprovarCPOut.Setretorno(Index: Integer; const AArray_Of_titulosaprovarCPOutRetorno: Array_Of_titulosaprovarCPOutRetorno);
begin
  Fretorno := AArray_Of_titulosaprovarCPOutRetorno;
  Fretorno_Specified := True;
end;

function titulosaprovarCPOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

constructor titulosConsultarTitulosAbertosCP2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTitulosAbertosCP2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosAbertosCP2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2Out.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2Out.Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCP2OutTitulos: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarTitulosAbertosCP2OutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2Out.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosConsultarTitulosCPIn.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosCPIn.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosCPIn.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosCPIn.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosCPIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosConsultarTitulosCPIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosConsultarTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor titulosEntradaTitulosLoteCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEntradaTitulosLoteCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridResult)-1 do
    System.SysUtils.FreeAndNil(FgridResult[I]);
  System.SetLength(FgridResult, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosLoteCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEntradaTitulosLoteCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEntradaTitulosLoteCPOut.SetgridResult(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCPOutGridResult: Array_Of_titulosEntradaTitulosLoteCPOutGridResult);
begin
  FgridResult := AArray_Of_titulosEntradaTitulosLoteCPOutGridResult;
  FgridResult_Specified := True;
end;

function titulosEntradaTitulosLoteCPOut.gridResult_Specified(Index: Integer): boolean;
begin
  Result := FgridResult_Specified;
end;

procedure titulosEntradaTitulosLoteCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosEntradaTitulosLoteCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

destructor titulosaprovarCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulo)-1 do
    System.SysUtils.FreeAndNil(Ftitulo[I]);
  System.SetLength(Ftitulo, 0);
  inherited Destroy;
end;

procedure titulosaprovarCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosaprovarCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosaprovarCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosaprovarCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosaprovarCPIn.Settitulo(Index: Integer; const AArray_Of_titulosaprovarCPInTitulo: Array_Of_titulosaprovarCPInTitulo);
begin
  Ftitulo := AArray_Of_titulosaprovarCPInTitulo;
  Ftitulo_Specified := True;
end;

function titulosaprovarCPIn.titulo_Specified(Index: Integer): boolean;
begin
  Result := Ftitulo_Specified;
end;

constructor titulosbuscarPendentesCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosbuscarPendentesCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulo)-1 do
    System.SysUtils.FreeAndNil(Ftitulo[I]);
  System.SetLength(Ftitulo, 0);
  inherited Destroy;
end;

procedure titulosbuscarPendentesCPOut.SetcodigoResultado(Index: Integer; const Astring: string);
begin
  FcodigoResultado := Astring;
  FcodigoResultado_Specified := True;
end;

function titulosbuscarPendentesCPOut.codigoResultado_Specified(Index: Integer): boolean;
begin
  Result := FcodigoResultado_Specified;
end;

procedure titulosbuscarPendentesCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosbuscarPendentesCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosbuscarPendentesCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosbuscarPendentesCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosbuscarPendentesCPOut.Settitulo(Index: Integer; const AArray_Of_titulosbuscarPendentesCPOutTitulo: Array_Of_titulosbuscarPendentesCPOutTitulo);
begin
  Ftitulo := AArray_Of_titulosbuscarPendentesCPOutTitulo;
  Ftitulo_Specified := True;
end;

function titulosbuscarPendentesCPOut.titulo_Specified(Index: Integer): boolean;
begin
  Result := Ftitulo_Specified;
end;

destructor titulosreprovarCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulo)-1 do
    System.SysUtils.FreeAndNil(Ftitulo[I]);
  System.SetLength(Ftitulo, 0);
  inherited Destroy;
end;

procedure titulosreprovarCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosreprovarCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosreprovarCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosreprovarCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosreprovarCPIn.Settitulo(Index: Integer; const AArray_Of_titulosreprovarCPInTitulo: Array_Of_titulosreprovarCPInTitulo);
begin
  Ftitulo := AArray_Of_titulosreprovarCPInTitulo;
  Ftitulo_Specified := True;
end;

function titulosreprovarCPIn.titulo_Specified(Index: Integer): boolean;
begin
  Result := Ftitulo_Specified;
end;

constructor titulosGerarBaixaAproveitamentoCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosGerarBaixaAproveitamentoCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridRetorno)-1 do
    System.SysUtils.FreeAndNil(FgridRetorno[I]);
  System.SetLength(FgridRetorno, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaAproveitamentoCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOut.SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno: Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno);
begin
  FgridRetorno := AArray_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno;
  FgridRetorno_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOut.gridRetorno_Specified(Index: Integer): boolean;
begin
  Result := FgridRetorno_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

constructor titulosGerarBaixaPorLoteCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosGerarBaixaPorLoteCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridRetorno)-1 do
    System.SysUtils.FreeAndNil(FgridRetorno[I]);
  System.SetLength(FgridRetorno, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaPorLoteCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOut.SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCPOutGridRetorno: Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno);
begin
  FgridRetorno := AArray_Of_titulosGerarBaixaPorLoteCPOutGridRetorno;
  FgridRetorno_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOut.gridRetorno_Specified(Index: Integer): boolean;
begin
  Result := FgridRetorno_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

destructor titulosEstornoBaixaTitulosCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosPagar)-1 do
    System.SysUtils.FreeAndNil(FtitulosPagar[I]);
  System.SetLength(FtitulosPagar, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEstornoBaixaTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEstornoBaixaTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEstornoBaixaTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEstornoBaixaTitulosCPIn.SetsistemaIntegracao(Index: Integer; const Astring: string);
begin
  FsistemaIntegracao := Astring;
  FsistemaIntegracao_Specified := True;
end;

function titulosEstornoBaixaTitulosCPIn.sistemaIntegracao_Specified(Index: Integer): boolean;
begin
  Result := FsistemaIntegracao_Specified;
end;

procedure titulosEstornoBaixaTitulosCPIn.SettitulosPagar(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCPInTitulosPagar: Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar);
begin
  FtitulosPagar := AArray_Of_titulosEstornoBaixaTitulosCPInTitulosPagar;
  FtitulosPagar_Specified := True;
end;

function titulosEstornoBaixaTitulosCPIn.titulosPagar_Specified(Index: Integer): boolean;
begin
  Result := FtitulosPagar_Specified;
end;

constructor titulosreprovarCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosreprovarCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosreprovarCPOut.SetcodigoResultado(Index: Integer; const Astring: string);
begin
  FcodigoResultado := Astring;
  FcodigoResultado_Specified := True;
end;

function titulosreprovarCPOut.codigoResultado_Specified(Index: Integer): boolean;
begin
  Result := FcodigoResultado_Specified;
end;

procedure titulosreprovarCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosreprovarCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosreprovarCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosreprovarCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosreprovarCPOut.Setretorno(Index: Integer; const AArray_Of_titulosreprovarCPOutRetorno: Array_Of_titulosreprovarCPOutRetorno);
begin
  Fretorno := AArray_Of_titulosreprovarCPOutRetorno;
  Fretorno_Specified := True;
end;

function titulosreprovarCPOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

constructor titulosConsultarCP2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarCP2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarCP2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarCP2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarCP2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarCP2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarCP2Out.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarCP2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarCP2Out.Settitulos(Index: Integer; const AArray_Of_titulosConsultarCP2OutTitulos: Array_Of_titulosConsultarCP2OutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarCP2OutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarCP2Out.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

destructor titulosExcluirTitulosCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosExcluirTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosExcluirTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosExcluirTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosExcluirTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosExcluirTitulosCPIn.Settitulos(Index: Integer; const AArray_Of_titulosExcluirTitulosCPInTitulos: Array_Of_titulosExcluirTitulosCPInTitulos);
begin
  Ftitulos := AArray_Of_titulosExcluirTitulosCPInTitulos;
  Ftitulos_Specified := True;
end;

function titulosExcluirTitulosCPIn.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

destructor titulosEntradaTitulosLoteCPInEntradaTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodFav(Index: Integer; const ADouble: Double);
begin
  FcodFav := ADouble;
  FcodFav_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codFav_Specified(Index: Integer): boolean;
begin
  Result := FcodFav_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcotEmi(Index: Integer; const ADouble: Double);
begin
  FcotEmi := ADouble;
  FcotEmi_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetcotNeg(Index: Integer; const ADouble: Double);
begin
  FcotNeg := ADouble;
  FcotNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.cotNeg_Specified(Index: Integer): boolean;
begin
  Result := FcotNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetjrsDia(Index: Integer; const ADouble: Double);
begin
  FjrsDia := ADouble;
  FjrsDia_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetperDsc(Index: Integer; const AInteger: Integer);
begin
  FperDsc := AInteger;
  FperDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetperJrs(Index: Integer; const AInteger: Integer);
begin
  FperJrs := AInteger;
  FperJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetperMul(Index: Integer; const AInteger: Integer);
begin
  FperMul := AInteger;
  FperMul_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetpriPgt(Index: Integer; const AInteger: Integer);
begin
  FpriPgt := AInteger;
  FpriPgt_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.priPgt_Specified(Index: Integer): boolean;
begin
  Result := FpriPgt_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetproJrs(Index: Integer; const Astring: string);
begin
  FproJrs := Astring;
  FproJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio);
begin
  Frateio := AArray_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio;
  Frateio_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SettipTcc(Index: Integer; const AInteger: Integer);
begin
  FtipTcc := AInteger;
  FtipTcc_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulos.SetvlrRba(Index: Integer; const ADouble: Double);
begin
  FvlrRba := ADouble;
  FvlrRba_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulos.vlrRba_Specified(Index: Integer): boolean;
begin
  Result := FvlrRba_Specified;
end;

destructor titulosEntradaTitulosLoteCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FentradaTitulos)-1 do
    System.SysUtils.FreeAndNil(FentradaTitulos[I]);
  System.SetLength(FentradaTitulos, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosLoteCPIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosLoteCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosLoteCPIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosLoteCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosLoteCPIn.SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCPInEntradaTitulos: Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos);
begin
  FentradaTitulos := AArray_Of_titulosEntradaTitulosLoteCPInEntradaTitulos;
  FentradaTitulos_Specified := True;
end;

function titulosEntradaTitulosLoteCPIn.entradaTitulos_Specified(Index: Integer): boolean;
begin
  Result := FentradaTitulos_Specified;
end;

procedure titulosEntradaTitulosLoteCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEntradaTitulosLoteCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEntradaTitulosLoteCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEntradaTitulosLoteCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEntradaTitulosLoteCPIn.SetforCli(Index: Integer; const Astring: string);
begin
  FforCli := Astring;
  FforCli_Specified := True;
end;

function titulosEntradaTitulosLoteCPIn.forCli_Specified(Index: Integer): boolean;
begin
  Result := FforCli_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetfilCtr(Index: Integer; const AInteger: Integer);
begin
  FfilCtr := AInteger;
  FfilCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.filCtr_Specified(Index: Integer): boolean;
begin
  Result := FfilCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetfilNfc(Index: Integer; const AInteger: Integer);
begin
  FfilNfc := AInteger;
  FfilNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.filNfc_Specified(Index: Integer): boolean;
begin
  Result := FfilNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetfilNff(Index: Integer; const AInteger: Integer);
begin
  FfilNff := AInteger;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetfilNfv(Index: Integer; const AInteger: Integer);
begin
  FfilNfv := AInteger;
  FfilNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.filNfv_Specified(Index: Integer): boolean;
begin
  Result := FfilNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetfilOcp(Index: Integer; const AInteger: Integer);
begin
  FfilOcp := AInteger;
  FfilOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.filOcp_Specified(Index: Integer): boolean;
begin
  Result := FfilOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetforNfc(Index: Integer; const AInteger: Integer);
begin
  FforNfc := AInteger;
  FforNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.forNfc_Specified(Index: Integer): boolean;
begin
  Result := FforNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetforNff(Index: Integer; const AInteger: Integer);
begin
  FforNff := AInteger;
  FforNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.forNff_Specified(Index: Integer): boolean;
begin
  Result := FforNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetnumCtr(Index: Integer; const AInteger: Integer);
begin
  FnumCtr := AInteger;
  FnumCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.numCtr_Specified(Index: Integer): boolean;
begin
  Result := FnumCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetnumNfc(Index: Integer; const AInteger: Integer);
begin
  FnumNfc := AInteger;
  FnumNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.numNfc_Specified(Index: Integer): boolean;
begin
  Result := FnumNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetnumNff(Index: Integer; const AInteger: Integer);
begin
  FnumNff := AInteger;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetnumOcp(Index: Integer; const AInteger: Integer);
begin
  FnumOcp := AInteger;
  FnumOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.numOcp_Specified(Index: Integer): boolean;
begin
  Result := FnumOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetocpFre(Index: Integer; const AInteger: Integer);
begin
  FocpFre := AInteger;
  FocpFre_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.ocpFre_Specified(Index: Integer): boolean;
begin
  Result := FocpFre_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetocpNre(Index: Integer; const AInteger: Integer);
begin
  FocpNre := AInteger;
  FocpNre_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.ocpNre_Specified(Index: Integer): boolean;
begin
  Result := FocpNre_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetretRat(Index: Integer; const Astring: string);
begin
  FretRat := Astring;
  FretRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.retRat_Specified(Index: Integer): boolean;
begin
  Result := FretRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetseqImo(Index: Integer; const AInteger: Integer);
begin
  FseqImo := AInteger;
  FseqImo_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.seqImo_Specified(Index: Integer): boolean;
begin
  Result := FseqImo_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetsnfNfc(Index: Integer; const Astring: string);
begin
  FsnfNfc := Astring;
  FsnfNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.snfNfc_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetsnfNfv(Index: Integer; const Astring: string);
begin
  FsnfNfv := Astring;
  FsnfNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.snfNfv_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetvctFim(Index: Integer; const Astring: string);
begin
  FvctFim := Astring;
  FvctFim_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.vctFim_Specified(Index: Integer): boolean;
begin
  Result := FvctFim_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2In.SetvctIni(Index: Integer; const Astring: string);
begin
  FvctIni := Astring;
  FvctIni_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2In.vctIni_Specified(Index: Integer): boolean;
begin
  Result := FvctIni_Specified;
end;

procedure titulosaprovarCPOutRetorno.SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
begin
  FcodigoEmpresa := AInteger;
  FcodigoEmpresa_Specified := True;
end;

function titulosaprovarCPOutRetorno.codigoEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FcodigoEmpresa_Specified;
end;

procedure titulosaprovarCPOutRetorno.SetcodigoFilial(Index: Integer; const AInteger: Integer);
begin
  FcodigoFilial := AInteger;
  FcodigoFilial_Specified := True;
end;

function titulosaprovarCPOutRetorno.codigoFilial_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFilial_Specified;
end;

procedure titulosaprovarCPOutRetorno.SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
begin
  FcodigoFornecedor := AInteger;
  FcodigoFornecedor_Specified := True;
end;

function titulosaprovarCPOutRetorno.codigoFornecedor_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFornecedor_Specified;
end;

procedure titulosaprovarCPOutRetorno.SetmensagemErro(Index: Integer; const Astring: string);
begin
  FmensagemErro := Astring;
  FmensagemErro_Specified := True;
end;

function titulosaprovarCPOutRetorno.mensagemErro_Specified(Index: Integer): boolean;
begin
  Result := FmensagemErro_Specified;
end;

procedure titulosaprovarCPOutRetorno.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function titulosaprovarCPOutRetorno.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure titulosaprovarCPOutRetorno.Setsequencia(Index: Integer; const AInteger: Integer);
begin
  Fsequencia := AInteger;
  Fsequencia_Specified := True;
end;

function titulosaprovarCPOutRetorno.sequencia_Specified(Index: Integer): boolean;
begin
  Result := Fsequencia_Specified;
end;

procedure titulosaprovarCPOutRetorno.SettipoTitulo(Index: Integer; const Astring: string);
begin
  FtipoTitulo := Astring;
  FtipoTitulo_Specified := True;
end;

function titulosaprovarCPOutRetorno.tipoTitulo_Specified(Index: Integer): boolean;
begin
  Result := FtipoTitulo_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetabrFpj(Index: Integer; const Astring: string);
begin
  FabrFpj := Astring;
  FabrFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.abrFpj_Specified(Index: Integer): boolean;
begin
  Result := FabrFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetabrPrj(Index: Integer; const Astring: string);
begin
  FabrPrj := Astring;
  FabrPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.abrPrj_Specified(Index: Integer): boolean;
begin
  Result := FabrPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetcriRat(Index: Integer; const AInteger: Integer);
begin
  FcriRat := AInteger;
  FcriRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.criRat_Specified(Index: Integer): boolean;
begin
  Result := FcriRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetdatBas(Index: Integer; const Astring: string);
begin
  FdatBas := Astring;
  FdatBas_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.datBas_Specified(Index: Integer): boolean;
begin
  Result := FdatBas_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetmesAno(Index: Integer; const Astring: string);
begin
  FmesAno := Astring;
  FmesAno_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.mesAno_Specified(Index: Integer): boolean;
begin
  Result := FmesAno_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetseqRat(Index: Integer; const AInteger: Integer);
begin
  FseqRat := AInteger;
  FseqRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.seqRat_Specified(Index: Integer): boolean;
begin
  Result := FseqRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetsomSub(Index: Integer; const AInteger: Integer);
begin
  FsomSub := AInteger;
  FsomSub_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.somSub_Specified(Index: Integer): boolean;
begin
  Result := FsomSub_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SettipOri(Index: Integer; const Astring: string);
begin
  FtipOri := Astring;
  FtipOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.tipOri_Specified(Index: Integer): boolean;
begin
  Result := FtipOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulosRateios.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulosRateios.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

destructor titulosConsultarTitulosAbertosCP2OutTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateios)-1 do
    System.SysUtils.FreeAndNil(Frateios[I]);
  System.SetLength(Frateios, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodFav(Index: Integer; const ADouble: Double);
begin
  FcodFav := ADouble;
  FcodFav_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codFav_Specified(Index: Integer): boolean;
begin
  Result := FcodFav_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetcpgSub(Index: Integer; const Astring: string);
begin
  FcpgSub := Astring;
  FcpgSub_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.cpgSub_Specified(Index: Integer): boolean;
begin
  Result := FcpgSub_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetctrFre(Index: Integer; const AInteger: Integer);
begin
  FctrFre := AInteger;
  FctrFre_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ctrFre_Specified(Index: Integer): boolean;
begin
  Result := FctrFre_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetctrNre(Index: Integer; const AInteger: Integer);
begin
  FctrNre := AInteger;
  FctrNre_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ctrNre_Specified(Index: Integer): boolean;
begin
  Result := FctrNre_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetfilCcr(Index: Integer; const AInteger: Integer);
begin
  FfilCcr := AInteger;
  FfilCcr_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.filCcr_Specified(Index: Integer): boolean;
begin
  Result := FfilCcr_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetfilCtr(Index: Integer; const AInteger: Integer);
begin
  FfilCtr := AInteger;
  FfilCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.filCtr_Specified(Index: Integer): boolean;
begin
  Result := FfilCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetfilNfc(Index: Integer; const AInteger: Integer);
begin
  FfilNfc := AInteger;
  FfilNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.filNfc_Specified(Index: Integer): boolean;
begin
  Result := FfilNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetfilNff(Index: Integer; const AInteger: Integer);
begin
  FfilNff := AInteger;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetfilNfv(Index: Integer; const AInteger: Integer);
begin
  FfilNfv := AInteger;
  FfilNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.filNfv_Specified(Index: Integer): boolean;
begin
  Result := FfilNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetfilOcp(Index: Integer; const AInteger: Integer);
begin
  FfilOcp := AInteger;
  FfilOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.filOcp_Specified(Index: Integer): boolean;
begin
  Result := FfilOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetforNfc(Index: Integer; const AInteger: Integer);
begin
  FforNfc := AInteger;
  FforNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.forNfc_Specified(Index: Integer): boolean;
begin
  Result := FforNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetforNff(Index: Integer; const AInteger: Integer);
begin
  FforNff := AInteger;
  FforNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.forNff_Specified(Index: Integer): boolean;
begin
  Result := FforNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetgerTep(Index: Integer; const Astring: string);
begin
  FgerTep := Astring;
  FgerTep_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.gerTep_Specified(Index: Integer): boolean;
begin
  Result := FgerTep_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetjrsDia(Index: Integer; const ADouble: Double);
begin
  FjrsDia := ADouble;
  FjrsDia_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumCcr(Index: Integer; const AInteger: Integer);
begin
  FnumCcr := AInteger;
  FnumCcr_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numCcr_Specified(Index: Integer): boolean;
begin
  Result := FnumCcr_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumCtr(Index: Integer; const AInteger: Integer);
begin
  FnumCtr := AInteger;
  FnumCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numCtr_Specified(Index: Integer): boolean;
begin
  Result := FnumCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumNfc(Index: Integer; const AInteger: Integer);
begin
  FnumNfc := AInteger;
  FnumNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numNfc_Specified(Index: Integer): boolean;
begin
  Result := FnumNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumNff(Index: Integer; const AInteger: Integer);
begin
  FnumNff := AInteger;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumOcp(Index: Integer; const AInteger: Integer);
begin
  FnumOcp := AInteger;
  FnumOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numOcp_Specified(Index: Integer): boolean;
begin
  Result := FnumOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetocpFre(Index: Integer; const AInteger: Integer);
begin
  FocpFre := AInteger;
  FocpFre_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ocpFre_Specified(Index: Integer): boolean;
begin
  Result := FocpFre_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetocpNre(Index: Integer; const AInteger: Integer);
begin
  FocpNre := AInteger;
  FocpNre_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ocpNre_Specified(Index: Integer): boolean;
begin
  Result := FocpNre_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetperDsc(Index: Integer; const AInteger: Integer);
begin
  FperDsc := AInteger;
  FperDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetperJrs(Index: Integer; const AInteger: Integer);
begin
  FperJrs := AInteger;
  FperJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetperMul(Index: Integer; const AInteger: Integer);
begin
  FperMul := AInteger;
  FperMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetproJrs(Index: Integer; const Astring: string);
begin
  FproJrs := Astring;
  FproJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.Setrateios(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios: Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios);
begin
  Frateios := AArray_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios;
  Frateios_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.rateios_Specified(Index: Integer): boolean;
begin
  Result := Frateios_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetseqCgt(Index: Integer; const AInteger: Integer);
begin
  FseqCgt := AInteger;
  FseqCgt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.seqCgt_Specified(Index: Integer): boolean;
begin
  Result := FseqCgt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetseqImo(Index: Integer; const AInteger: Integer);
begin
  FseqImo := AInteger;
  FseqImo_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.seqImo_Specified(Index: Integer): boolean;
begin
  Result := FseqImo_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetsitTit(Index: Integer; const Astring: string);
begin
  FsitTit := Astring;
  FsitTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.sitTit_Specified(Index: Integer): boolean;
begin
  Result := FsitTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetsnfNfc(Index: Integer; const Astring: string);
begin
  FsnfNfc := Astring;
  FsnfNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.snfNfc_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetsnfNfv(Index: Integer; const Astring: string);
begin
  FsnfNfv := Astring;
  FsnfNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.snfNfv_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SettipEfe(Index: Integer; const Astring: string);
begin
  FtipEfe := Astring;
  FtipEfe_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.tipEfe_Specified(Index: Integer): boolean;
begin
  Result := FtipEfe_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetultPgt(Index: Integer; const Astring: string);
begin
  FultPgt := Astring;
  FultPgt_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.ultPgt_Specified(Index: Integer): boolean;
begin
  Result := FultPgt_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetvlrAbe(Index: Integer; const ADouble: Double);
begin
  FvlrAbe := ADouble;
  FvlrAbe_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.vlrAbe_Specified(Index: Integer): boolean;
begin
  Result := FvlrAbe_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCP2OutTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCP2OutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosaprovarCPInTitulo.SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
begin
  FcodigoEmpresa := AInteger;
  FcodigoEmpresa_Specified := True;
end;

function titulosaprovarCPInTitulo.codigoEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FcodigoEmpresa_Specified;
end;

procedure titulosaprovarCPInTitulo.SetcodigoFilial(Index: Integer; const AInteger: Integer);
begin
  FcodigoFilial := AInteger;
  FcodigoFilial_Specified := True;
end;

function titulosaprovarCPInTitulo.codigoFilial_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFilial_Specified;
end;

procedure titulosaprovarCPInTitulo.SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
begin
  FcodigoFornecedor := AInteger;
  FcodigoFornecedor_Specified := True;
end;

function titulosaprovarCPInTitulo.codigoFornecedor_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFornecedor_Specified;
end;

procedure titulosaprovarCPInTitulo.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function titulosaprovarCPInTitulo.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure titulosaprovarCPInTitulo.Setsequencia(Index: Integer; const AInteger: Integer);
begin
  Fsequencia := AInteger;
  Fsequencia_Specified := True;
end;

function titulosaprovarCPInTitulo.sequencia_Specified(Index: Integer): boolean;
begin
  Result := Fsequencia_Specified;
end;

procedure titulosaprovarCPInTitulo.SettipoTitulo(Index: Integer; const Astring: string);
begin
  FtipoTitulo := Astring;
  FtipoTitulo_Specified := True;
end;

function titulosaprovarCPInTitulo.tipoTitulo_Specified(Index: Integer): boolean;
begin
  Result := FtipoTitulo_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosLoteCPOutGridResult.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosEntradaTitulosLoteCPOutGridResult.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosEntradaTitulosLoteCPInEntradaTitulosRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosEntradaTitulosLoteCPInEntradaTitulosRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

procedure titulosbuscarPendentesCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosbuscarPendentesCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosbuscarPendentesCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosbuscarPendentesCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosbuscarPendentesCPIn.SetindicePagina(Index: Integer; const AInteger: Integer);
begin
  FindicePagina := AInteger;
  FindicePagina_Specified := True;
end;

function titulosbuscarPendentesCPIn.indicePagina_Specified(Index: Integer): boolean;
begin
  Result := FindicePagina_Specified;
end;

procedure titulosbuscarPendentesCPIn.SetlimitePagina(Index: Integer; const AInteger: Integer);
begin
  FlimitePagina := AInteger;
  FlimitePagina_Specified := True;
end;

function titulosbuscarPendentesCPIn.limitePagina_Specified(Index: Integer): boolean;
begin
  Result := FlimitePagina_Specified;
end;

procedure titulosbuscarPendentesCPIn.Setusuario(Index: Integer; const AInteger: Integer);
begin
  Fusuario := AInteger;
  Fusuario_Specified := True;
end;

function titulosbuscarPendentesCPIn.usuario_Specified(Index: Integer): boolean;
begin
  Result := Fusuario_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
begin
  FcodigoEmpresa := AInteger;
  FcodigoEmpresa_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.codigoEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FcodigoEmpresa_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetcodigoFilial(Index: Integer; const AInteger: Integer);
begin
  FcodigoFilial := AInteger;
  FcodigoFilial_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.codigoFilial_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFilial_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
begin
  FcodigoFornecedor := AInteger;
  FcodigoFornecedor_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.codigoFornecedor_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFornecedor_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetcodigoTipoTitulo(Index: Integer; const Astring: string);
begin
  FcodigoTipoTitulo := Astring;
  FcodigoTipoTitulo_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.codigoTipoTitulo_Specified(Index: Integer): boolean;
begin
  Result := FcodigoTipoTitulo_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetdataEntrada(Index: Integer; const Astring: string);
begin
  FdataEntrada := Astring;
  FdataEntrada_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.dataEntrada_Specified(Index: Integer): boolean;
begin
  Result := FdataEntrada_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetdataPagamento(Index: Integer; const Astring: string);
begin
  FdataPagamento := Astring;
  FdataPagamento_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.dataPagamento_Specified(Index: Integer): boolean;
begin
  Result := FdataPagamento_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetdataVencimento(Index: Integer; const Astring: string);
begin
  FdataVencimento := Astring;
  FdataVencimento_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.dataVencimento_Specified(Index: Integer): boolean;
begin
  Result := FdataVencimento_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetdescricaoMoeda(Index: Integer; const Astring: string);
begin
  FdescricaoMoeda := Astring;
  FdescricaoMoeda_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.descricaoMoeda_Specified(Index: Integer): boolean;
begin
  Result := FdescricaoMoeda_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetdescricaoTipoTitulo(Index: Integer; const Astring: string);
begin
  FdescricaoTipoTitulo := Astring;
  FdescricaoTipoTitulo_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.descricaoTipoTitulo_Specified(Index: Integer): boolean;
begin
  Result := FdescricaoTipoTitulo_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetnomeEmpresa(Index: Integer; const Astring: string);
begin
  FnomeEmpresa := Astring;
  FnomeEmpresa_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.nomeEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FnomeEmpresa_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetnomeFilial(Index: Integer; const Astring: string);
begin
  FnomeFilial := Astring;
  FnomeFilial_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.nomeFilial_Specified(Index: Integer): boolean;
begin
  Result := FnomeFilial_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetnomeFornecedor(Index: Integer; const Astring: string);
begin
  FnomeFornecedor := Astring;
  FnomeFornecedor_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.nomeFornecedor_Specified(Index: Integer): boolean;
begin
  Result := FnomeFornecedor_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.Setobservacao(Index: Integer; const Astring: string);
begin
  Fobservacao := Astring;
  Fobservacao_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.observacao_Specified(Index: Integer): boolean;
begin
  Result := Fobservacao_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetsiglaMoeda(Index: Integer; const Astring: string);
begin
  FsiglaMoeda := Astring;
  FsiglaMoeda_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.siglaMoeda_Specified(Index: Integer): boolean;
begin
  Result := FsiglaMoeda_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetvalorLiquido(Index: Integer; const ADouble: Double);
begin
  FvalorLiquido := ADouble;
  FvalorLiquido_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.valorLiquido_Specified(Index: Integer): boolean;
begin
  Result := FvalorLiquido_Specified;
end;

procedure titulosbuscarPendentesCPOutTitulo.SetvalorOriginal(Index: Integer; const ADouble: Double);
begin
  FvalorOriginal := ADouble;
  FvalorOriginal_Specified := True;
end;

function titulosbuscarPendentesCPOutTitulo.valorOriginal_Specified(Index: Integer): boolean;
begin
  Result := FvalorOriginal_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetmsgRet(Index: Integer; const Astring: string);
begin
  FmsgRet := Astring;
  FmsgRet_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.msgRet_Specified(Index: Integer): boolean;
begin
  Result := FmsgRet_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosBaixarTitulosCPOutResultado.SettipRet(Index: Integer; const AInteger: Integer);
begin
  FtipRet := AInteger;
  FtipRet_Specified := True;
end;

function titulosBaixarTitulosCPOutResultado.tipRet_Specified(Index: Integer): boolean;
begin
  Result := FtipRet_Specified;
end;

procedure titulosProcessarAVMInTitulosACalcular.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosProcessarAVMInTitulosACalcular.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosProcessarAVMInTitulosACalcular.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosProcessarAVMInTitulosACalcular.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosProcessarAVMInTitulosACalcular.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosProcessarAVMInTitulosACalcular.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosProcessarAVMInTitulosACalcular.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosProcessarAVMInTitulosACalcular.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosProcessarAVMInTitulosACalcular.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosProcessarAVMInTitulosACalcular.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

destructor titulosProcessarAVMIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosACalcular)-1 do
    System.SysUtils.FreeAndNil(FtitulosACalcular[I]);
  System.SetLength(FtitulosACalcular, 0);
  inherited Destroy;
end;

procedure titulosProcessarAVMIn.SetdataBaseFinal(Index: Integer; const Astring: string);
begin
  FdataBaseFinal := Astring;
  FdataBaseFinal_Specified := True;
end;

function titulosProcessarAVMIn.dataBaseFinal_Specified(Index: Integer): boolean;
begin
  Result := FdataBaseFinal_Specified;
end;

procedure titulosProcessarAVMIn.SetdataBaseInicial(Index: Integer; const Astring: string);
begin
  FdataBaseInicial := Astring;
  FdataBaseInicial_Specified := True;
end;

function titulosProcessarAVMIn.dataBaseInicial_Specified(Index: Integer): boolean;
begin
  Result := FdataBaseInicial_Specified;
end;

procedure titulosProcessarAVMIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosProcessarAVMIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosProcessarAVMIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosProcessarAVMIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosProcessarAVMIn.SetidPacote(Index: Integer; const AInteger: Integer);
begin
  FidPacote := AInteger;
  FidPacote_Specified := True;
end;

function titulosProcessarAVMIn.idPacote_Specified(Index: Integer): boolean;
begin
  Result := FidPacote_Specified;
end;

procedure titulosProcessarAVMIn.SettitulosACalcular(Index: Integer; const AArray_Of_titulosProcessarAVMInTitulosACalcular: Array_Of_titulosProcessarAVMInTitulosACalcular);
begin
  FtitulosACalcular := AArray_Of_titulosProcessarAVMInTitulosACalcular;
  FtitulosACalcular_Specified := True;
end;

function titulosProcessarAVMIn.titulosACalcular_Specified(Index: Integer): boolean;
begin
  Result := FtitulosACalcular_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetmsgErr(Index: Integer; const Astring: string);
begin
  FmsgErr := Astring;
  FmsgErr_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.msgErr_Specified(Index: Integer): boolean;
begin
  Result := FmsgErr_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPOutGridRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPOutGridRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosProcessarAVMOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosProcessarAVMOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosCalculados)-1 do
    System.SysUtils.FreeAndNil(FtitulosCalculados[I]);
  System.SetLength(FtitulosCalculados, 0);
  inherited Destroy;
end;

procedure titulosProcessarAVMOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosProcessarAVMOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosProcessarAVMOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosProcessarAVMOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosProcessarAVMOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosProcessarAVMOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosProcessarAVMOut.SettitulosCalculados(Index: Integer; const AArray_Of_titulosProcessarAVMOutTitulosCalculados: Array_Of_titulosProcessarAVMOutTitulosCalculados);
begin
  FtitulosCalculados := AArray_Of_titulosProcessarAVMOutTitulosCalculados;
  FtitulosCalculados_Specified := True;
end;

function titulosProcessarAVMOut.titulosCalculados_Specified(Index: Integer): boolean;
begin
  Result := FtitulosCalculados_Specified;
end;

procedure titulosreprovarCPInTitulo.SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
begin
  FcodigoEmpresa := AInteger;
  FcodigoEmpresa_Specified := True;
end;

function titulosreprovarCPInTitulo.codigoEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FcodigoEmpresa_Specified;
end;

procedure titulosreprovarCPInTitulo.SetcodigoFilial(Index: Integer; const AInteger: Integer);
begin
  FcodigoFilial := AInteger;
  FcodigoFilial_Specified := True;
end;

function titulosreprovarCPInTitulo.codigoFilial_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFilial_Specified;
end;

procedure titulosreprovarCPInTitulo.SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
begin
  FcodigoFornecedor := AInteger;
  FcodigoFornecedor_Specified := True;
end;

function titulosreprovarCPInTitulo.codigoFornecedor_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFornecedor_Specified;
end;

procedure titulosreprovarCPInTitulo.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function titulosreprovarCPInTitulo.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure titulosreprovarCPInTitulo.Setsequencia(Index: Integer; const AInteger: Integer);
begin
  Fsequencia := AInteger;
  Fsequencia_Specified := True;
end;

function titulosreprovarCPInTitulo.sequencia_Specified(Index: Integer): boolean;
begin
  Result := Fsequencia_Specified;
end;

procedure titulosreprovarCPInTitulo.SettipoTitulo(Index: Integer; const Astring: string);
begin
  FtipoTitulo := Astring;
  FtipoTitulo_Specified := True;
end;

function titulosreprovarCPInTitulo.tipoTitulo_Specified(Index: Integer): boolean;
begin
  Result := FtipoTitulo_Specified;
end;

procedure titulosProcessarAVMOutTitulosCalculados.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosProcessarAVMOutTitulosCalculados.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosProcessarAVMOutTitulosCalculados.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosProcessarAVMOutTitulosCalculados.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosProcessarAVMOutTitulosCalculados.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosProcessarAVMOutTitulosCalculados.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosProcessarAVMOutTitulosCalculados.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosProcessarAVMOutTitulosCalculados.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosProcessarAVMOutTitulosCalculados.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosProcessarAVMOutTitulosCalculados.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosProcessarAVMOutTitulosCalculados.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function titulosProcessarAVMOutTitulosCalculados.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetobsMcp(Index: Integer; const Astring: string);
begin
  FobsMcp := Astring;
  FobsMcp_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.obsMcp_Specified(Index: Integer): boolean;
begin
  Result := FobsMcp_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetseqChe(Index: Integer; const Astring: string);
begin
  FseqChe := Astring;
  FseqChe_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.seqChe_Specified(Index: Integer): boolean;
begin
  Result := FseqChe_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrBai(Index: Integer; const Astring: string);
begin
  FvlrBai := Astring;
  FvlrBai_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosGerarBaixaPorLoteCPInGridTitulosBaixar.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosGerarBaixaPorLoteCPInGridTitulosBaixar.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

destructor titulosGerarBaixaPorLoteCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridTitulosBaixar)-1 do
    System.SysUtils.FreeAndNil(FgridTitulosBaixar[I]);
  System.SetLength(FgridTitulosBaixar, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetdatBai(Index: Integer; const Astring: string);
begin
  FdatBai := Astring;
  FdatBai_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.datBai_Specified(Index: Integer): boolean;
begin
  Result := FdatBai_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetdatCxb(Index: Integer; const Astring: string);
begin
  FdatCxb := Astring;
  FdatCxb_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.datCxb_Specified(Index: Integer): boolean;
begin
  Result := FdatCxb_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetgridTitulosBaixar(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar);
begin
  FgridTitulosBaixar := AArray_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar;
  FgridTitulosBaixar_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.gridTitulosBaixar_Specified(Index: Integer): boolean;
begin
  Result := FgridTitulosBaixar_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SettnsBai(Index: Integer; const Astring: string);
begin
  FtnsBai := Astring;
  FtnsBai_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.tnsBai_Specified(Index: Integer): boolean;
begin
  Result := FtnsBai_Specified;
end;

procedure titulosGerarBaixaPorLoteCPIn.SettnsCxb(Index: Integer; const Astring: string);
begin
  FtnsCxb := Astring;
  FtnsCxb_Specified := True;
end;

function titulosGerarBaixaPorLoteCPIn.tnsCxb_Specified(Index: Integer): boolean;
begin
  Result := FtnsCxb_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetmsgErr(Index: Integer; const Astring: string);
begin
  FmsgErr := Astring;
  FmsgErr_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.msgErr_Specified(Index: Integer): boolean;
begin
  Result := FmsgErr_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaPorLoteCPOutGridRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaPorLoteCPOutGridRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosCRE.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.SetvlrOud(Index: Integer; const ADouble: Double);
begin
  FvlrOud := ADouble;
  FvlrOud_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPInGridTitulosBAI.vlrOud_Specified(Index: Integer): boolean;
begin
  Result := FvlrOud_Specified;
end;

destructor titulosGerarBaixaAproveitamentoCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridTitulosBAI)-1 do
    System.SysUtils.FreeAndNil(FgridTitulosBAI[I]);
  System.SetLength(FgridTitulosBAI, 0);
  for I := 0 to System.Length(FgridTitulosCRE)-1 do
    System.SysUtils.FreeAndNil(FgridTitulosCRE[I]);
  System.SetLength(FgridTitulosCRE, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetdatBai(Index: Integer; const Astring: string);
begin
  FdatBai := Astring;
  FdatBai_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.datBai_Specified(Index: Integer): boolean;
begin
  Result := FdatBai_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetgridTitulosBAI(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI);
begin
  FgridTitulosBAI := AArray_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI;
  FgridTitulosBAI_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.gridTitulosBAI_Specified(Index: Integer): boolean;
begin
  Result := FgridTitulosBAI_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SetgridTitulosCRE(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE);
begin
  FgridTitulosCRE := AArray_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE;
  FgridTitulosCRE_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.gridTitulosCRE_Specified(Index: Integer): boolean;
begin
  Result := FgridTitulosCRE_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SettnsCre(Index: Integer; const Astring: string);
begin
  FtnsCre := Astring;
  FtnsCre_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.tnsCre_Specified(Index: Integer): boolean;
begin
  Result := FtnsCre_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCPIn.SettnsDup(Index: Integer; const Astring: string);
begin
  FtnsDup := Astring;
  FtnsDup_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCPIn.tnsDup_Specified(Index: Integer): boolean;
begin
  Result := FtnsDup_Specified;
end;

procedure titulosreprovarCPOutRetorno.SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
begin
  FcodigoEmpresa := AInteger;
  FcodigoEmpresa_Specified := True;
end;

function titulosreprovarCPOutRetorno.codigoEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FcodigoEmpresa_Specified;
end;

procedure titulosreprovarCPOutRetorno.SetcodigoFilial(Index: Integer; const AInteger: Integer);
begin
  FcodigoFilial := AInteger;
  FcodigoFilial_Specified := True;
end;

function titulosreprovarCPOutRetorno.codigoFilial_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFilial_Specified;
end;

procedure titulosreprovarCPOutRetorno.SetcodigoFornecedor(Index: Integer; const AInteger: Integer);
begin
  FcodigoFornecedor := AInteger;
  FcodigoFornecedor_Specified := True;
end;

function titulosreprovarCPOutRetorno.codigoFornecedor_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFornecedor_Specified;
end;

procedure titulosreprovarCPOutRetorno.SetmensagemErro(Index: Integer; const Astring: string);
begin
  FmensagemErro := Astring;
  FmensagemErro_Specified := True;
end;

function titulosreprovarCPOutRetorno.mensagemErro_Specified(Index: Integer): boolean;
begin
  Result := FmensagemErro_Specified;
end;

procedure titulosreprovarCPOutRetorno.Setnumero(Index: Integer; const Astring: string);
begin
  Fnumero := Astring;
  Fnumero_Specified := True;
end;

function titulosreprovarCPOutRetorno.numero_Specified(Index: Integer): boolean;
begin
  Result := Fnumero_Specified;
end;

procedure titulosreprovarCPOutRetorno.Setsequencia(Index: Integer; const AInteger: Integer);
begin
  Fsequencia := AInteger;
  Fsequencia_Specified := True;
end;

function titulosreprovarCPOutRetorno.sequencia_Specified(Index: Integer): boolean;
begin
  Result := Fsequencia_Specified;
end;

procedure titulosreprovarCPOutRetorno.SettipoTitulo(Index: Integer; const Astring: string);
begin
  FtipoTitulo := Astring;
  FtipoTitulo_Specified := True;
end;

function titulosreprovarCPOutRetorno.tipoTitulo_Specified(Index: Integer): boolean;
begin
  Result := FtipoTitulo_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCPInTitulosPagar.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCPInTitulosPagar.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetmsgRet(Index: Integer; const Astring: string);
begin
  FmsgRet := Astring;
  FmsgRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.msgRet_Specified(Index: Integer): boolean;
begin
  Result := FmsgRet_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOutRetorno.SettipRet(Index: Integer; const AInteger: Integer);
begin
  FtipRet := AInteger;
  FtipRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOutRetorno.tipRet_Specified(Index: Integer): boolean;
begin
  Result := FtipRet_Specified;
end;

constructor titulosEstornoBaixaTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEstornoBaixaTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOut.Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCPOutRetorno: Array_Of_titulosEstornoBaixaTitulosCPOutRetorno);
begin
  Fretorno := AArray_Of_titulosEstornoBaixaTitulosCPOutRetorno;
  Fretorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCPOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosExcluirTitulosCPInTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosExcluirTitulosCPInTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosExcluirTitulosCPInTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosExcluirTitulosCPInTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosExcluirTitulosCPInTitulos.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosExcluirTitulosCPInTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosExcluirTitulosCPInTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosExcluirTitulosCPInTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosExcluirTitulosCPInTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosExcluirTitulosCPInTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosExcluirTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosExcluirTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosExcluirTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosExcluirTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosExcluirTitulosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosExcluirTitulosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosExcluirTitulosCPOut.Setresultado(Index: Integer; const AArray_Of_titulosExcluirTitulosCPOutResultado: Array_Of_titulosExcluirTitulosCPOutResultado);
begin
  Fresultado := AArray_Of_titulosExcluirTitulosCPOutResultado;
  Fresultado_Specified := True;
end;

function titulosExcluirTitulosCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosExcluirTitulosCPOut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosExcluirTitulosCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosExcluirTitulosCPOutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosExcluirTitulosCPOutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosExcluirTitulosCPOutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosExcluirTitulosCPOutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosExcluirTitulosCPOutResultado.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosExcluirTitulosCPOutResultado.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosExcluirTitulosCPOutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosExcluirTitulosCPOutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosExcluirTitulosCPOutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosExcluirTitulosCPOutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosExcluirTitulosCPOutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosExcluirTitulosCPOutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

destructor titulosEstornoBaixaTitulosCP2In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosPagar)-1 do
    System.SysUtils.FreeAndNil(FtitulosPagar[I]);
  System.SetLength(FtitulosPagar, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCP2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2In.SetsistemaIntegracao(Index: Integer; const Astring: string);
begin
  FsistemaIntegracao := Astring;
  FsistemaIntegracao_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2In.sistemaIntegracao_Specified(Index: Integer): boolean;
begin
  Result := FsistemaIntegracao_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2In.SettitulosPagar(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar: Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar);
begin
  FtitulosPagar := AArray_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar;
  FtitulosPagar_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2In.titulosPagar_Specified(Index: Integer): boolean;
begin
  Result := FtitulosPagar_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetempReq(Index: Integer; const AInteger: Integer);
begin
  FempReq := AInteger;
  FempReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.empReq_Specified(Index: Integer): boolean;
begin
  Result := FempReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetfilReq(Index: Integer; const AInteger: Integer);
begin
  FfilReq := AInteger;
  FfilReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.filReq_Specified(Index: Integer): boolean;
begin
  Result := FfilReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2InTitulosPagar.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2InTitulosPagar.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

constructor titulosEstornoBaixaTitulosCP2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEstornoBaixaTitulosCP2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCP2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2Out.Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCP2OutRetorno: Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno);
begin
  Fretorno := AArray_Of_titulosEstornoBaixaTitulosCP2OutRetorno;
  Fretorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2Out.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2Out.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosConsultarCPOutTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosConsultarCPOutTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosConsultarCPOutTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosConsultarCPOutTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosConsultarCPOutTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarCPOutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosConsultarCPOutTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarCPOutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarCPOutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarCPOutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarCPOutTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosConsultarCPOutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosConsultarCPOutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarCPOutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarCPOutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosConsultarCPOutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarCPOutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarCPOutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarCPOutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function titulosConsultarCPOutTitulos.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcodUsu(Index: Integer; const Astring: string);
begin
  FcodUsu := Astring;
  FcodUsu_Specified := True;
end;

function titulosConsultarCPOutTitulos.codUsu_Specified(Index: Integer): boolean;
begin
  Result := FcodUsu_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcorApr(Index: Integer; const Astring: string);
begin
  FcorApr := Astring;
  FcorApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.corApr_Specified(Index: Integer): boolean;
begin
  Result := FcorApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcotApr(Index: Integer; const Astring: string);
begin
  FcotApr := Astring;
  FcotApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.cotApr_Specified(Index: Integer): boolean;
begin
  Result := FcotApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetcotEmi(Index: Integer; const Astring: string);
begin
  FcotEmi := Astring;
  FcotEmi_Specified := True;
end;

function titulosConsultarCPOutTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetctaApr(Index: Integer; const Astring: string);
begin
  FctaApr := Astring;
  FctaApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.ctaApr_Specified(Index: Integer): boolean;
begin
  Result := FctaApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosConsultarCPOutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosConsultarCPOutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdatApr(Index: Integer; const Astring: string);
begin
  FdatApr := Astring;
  FdatApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.datApr_Specified(Index: Integer): boolean;
begin
  Result := FdatApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarCPOutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarCPOutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarCPOutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarCPOutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarCPOutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetdscApr(Index: Integer; const Astring: string);
begin
  FdscApr := Astring;
  FdscApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.dscApr_Specified(Index: Integer): boolean;
begin
  Result := FdscApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetempApr(Index: Integer; const Astring: string);
begin
  FempApr := Astring;
  FempApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.empApr_Specified(Index: Integer): boolean;
begin
  Result := FempApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetencApr(Index: Integer; const Astring: string);
begin
  FencApr := Astring;
  FencApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.encApr_Specified(Index: Integer): boolean;
begin
  Result := FencApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetfpgApr(Index: Integer; const Astring: string);
begin
  FfpgApr := Astring;
  FfpgApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.fpgApr_Specified(Index: Integer): boolean;
begin
  Result := FfpgApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SethorApr(Index: Integer; const Astring: string);
begin
  FhorApr := Astring;
  FhorApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.horApr_Specified(Index: Integer): boolean;
begin
  Result := FhorApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetjrsApr(Index: Integer; const Astring: string);
begin
  FjrsApr := Astring;
  FjrsApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.jrsApr_Specified(Index: Integer): boolean;
begin
  Result := FjrsApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosConsultarCPOutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosConsultarCPOutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetlibApr(Index: Integer; const Astring: string);
begin
  FlibApr := Astring;
  FlibApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.libApr_Specified(Index: Integer): boolean;
begin
  Result := FlibApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetmulApr(Index: Integer; const Astring: string);
begin
  FmulApr := Astring;
  FmulApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.mulApr_Specified(Index: Integer): boolean;
begin
  Result := FmulApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosConsultarCPOutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosConsultarCPOutTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosConsultarCPOutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarCPOutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetoacApr(Index: Integer; const Astring: string);
begin
  FoacApr := Astring;
  FoacApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.oacApr_Specified(Index: Integer): boolean;
begin
  Result := FoacApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosConsultarCPOutTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetodeApr(Index: Integer; const Astring: string);
begin
  FodeApr := Astring;
  FodeApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.odeApr_Specified(Index: Integer): boolean;
begin
  Result := FodeApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosConsultarCPOutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosConsultarCPOutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosConsultarCPOutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosConsultarCPOutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetpgtApr(Index: Integer; const Astring: string);
begin
  FpgtApr := Astring;
  FpgtApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.pgtApr_Specified(Index: Integer): boolean;
begin
  Result := FpgtApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetporAnt(Index: Integer; const Astring: string);
begin
  FporAnt := Astring;
  FporAnt_Specified := True;
end;

function titulosConsultarCPOutTitulos.porAnt_Specified(Index: Integer): boolean;
begin
  Result := FporAnt_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetseqApr(Index: Integer; const Astring: string);
begin
  FseqApr := Astring;
  FseqApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.seqApr_Specified(Index: Integer): boolean;
begin
  Result := FseqApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarCPOutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarCPOutTitulos.SettipTcc(Index: Integer; const Astring: string);
begin
  FtipTcc := Astring;
  FtipTcc_Specified := True;
end;

function titulosConsultarCPOutTitulos.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosConsultarCPOutTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosConsultarCPOutTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosConsultarCPOutTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosConsultarCPOutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarCPOutTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosConsultarCPOutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarCPOutTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosConsultarCPOutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetusuSit(Index: Integer; const Astring: string);
begin
  FusuSit := Astring;
  FusuSit_Specified := True;
end;

function titulosConsultarCPOutTitulos.usuSit_Specified(Index: Integer): boolean;
begin
  Result := FusuSit_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarCPOutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetvlrApr(Index: Integer; const Astring: string);
begin
  FvlrApr := Astring;
  FvlrApr_Specified := True;
end;

function titulosConsultarCPOutTitulos.vlrApr_Specified(Index: Integer): boolean;
begin
  Result := FvlrApr_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosConsultarCPOutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarCPOutTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosConsultarCPOutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetmsgRet(Index: Integer; const Astring: string);
begin
  FmsgRet := Astring;
  FmsgRet_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.msgRet_Specified(Index: Integer): boolean;
begin
  Result := FmsgRet_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosGravarTitulosCPOutResultado.SettipRet(Index: Integer; const AInteger: Integer);
begin
  FtipRet := AInteger;
  FtipRet_Specified := True;
end;

function titulosGravarTitulosCPOutResultado.tipRet_Specified(Index: Integer): boolean;
begin
  Result := FtipRet_Specified;
end;

procedure titulosConsultarCPIn.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarCPIn.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarCPIn.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarCPIn.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarCPIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosConsultarCPIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosConsultarCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor titulosConsultarCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarCPOut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarCPOut.Settitulos(Index: Integer; const AArray_Of_titulosConsultarCPOutTitulos: Array_Of_titulosConsultarCPOutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarCPOutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarCPOut.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetempReq(Index: Integer; const AInteger: Integer);
begin
  FempReq := AInteger;
  FempReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.empReq_Specified(Index: Integer): boolean;
begin
  Result := FempReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetfilReq(Index: Integer; const AInteger: Integer);
begin
  FfilReq := AInteger;
  FfilReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.filReq_Specified(Index: Integer): boolean;
begin
  Result := FfilReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetmsgRet(Index: Integer; const Astring: string);
begin
  FmsgRet := Astring;
  FmsgRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.msgRet_Specified(Index: Integer): boolean;
begin
  Result := FmsgRet_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosEstornoBaixaTitulosCP2OutRetorno.SettipRet(Index: Integer; const AInteger: Integer);
begin
  FtipRet := AInteger;
  FtipRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCP2OutRetorno.tipRet_Specified(Index: Integer): boolean;
begin
  Result := FtipRet_Specified;
end;

destructor titulosBaixarTitulosCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FbaixaTituloPagar)-1 do
    System.SysUtils.FreeAndNil(FbaixaTituloPagar[I]);
  System.SetLength(FbaixaTituloPagar, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCPIn.SetbaixaTituloPagar(Index: Integer; const AArray_Of_titulosBaixarTitulosCPInBaixaTituloPagar: Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar);
begin
  FbaixaTituloPagar := AArray_Of_titulosBaixarTitulosCPInBaixaTituloPagar;
  FbaixaTituloPagar_Specified := True;
end;

function titulosBaixarTitulosCPIn.baixaTituloPagar_Specified(Index: Integer): boolean;
begin
  Result := FbaixaTituloPagar_Specified;
end;

procedure titulosBaixarTitulosCPIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosBaixarTitulosCPIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosBaixarTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosBaixarTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosBaixarTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosBaixarTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetagrPre(Index: Integer; const Astring: string);
begin
  FagrPre := Astring;
  FagrPre_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.agrPre_Specified(Index: Integer): boolean;
begin
  Result := FagrPre_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetcotMcp(Index: Integer; const Astring: string);
begin
  FcotMcp := Astring;
  FcotMcp_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.cotMcp_Specified(Index: Integer): boolean;
begin
  Result := FcotMcp_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetdatLib(Index: Integer; const Astring: string);
begin
  FdatLib := Astring;
  FdatLib_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.datLib_Specified(Index: Integer): boolean;
begin
  Result := FdatLib_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetdatMov(Index: Integer; const Astring: string);
begin
  FdatMov := Astring;
  FdatMov_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.datMov_Specified(Index: Integer): boolean;
begin
  Result := FdatMov_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetindAbt(Index: Integer; const Astring: string);
begin
  FindAbt := Astring;
  FindAbt_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.indAbt_Specified(Index: Integer): boolean;
begin
  Result := FindAbt_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetindCan(Index: Integer; const Astring: string);
begin
  FindCan := Astring;
  FindCan_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.indCan_Specified(Index: Integer): boolean;
begin
  Result := FindCan_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetnumDoc(Index: Integer; const Astring: string);
begin
  FnumDoc := Astring;
  FnumDoc_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.numDoc_Specified(Index: Integer): boolean;
begin
  Result := FnumDoc_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetnumPdv(Index: Integer; const AInteger: Integer);
begin
  FnumPdv := AInteger;
  FnumPdv_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.numPdv_Specified(Index: Integer): boolean;
begin
  Result := FnumPdv_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetobsMcp(Index: Integer; const Astring: string);
begin
  FobsMcp := Astring;
  FobsMcp_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.obsMcp_Specified(Index: Integer): boolean;
begin
  Result := FobsMcp_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetseqChe(Index: Integer; const Astring: string);
begin
  FseqChe := Astring;
  FseqChe_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.seqChe_Specified(Index: Integer): boolean;
begin
  Result := FseqChe_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SettipPgt(Index: Integer; const Astring: string);
begin
  FtipPgt := Astring;
  FtipPgt_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.tipPgt_Specified(Index: Integer): boolean;
begin
  Result := FtipPgt_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SettipTcc(Index: Integer; const AInteger: Integer);
begin
  FtipTcc := AInteger;
  FtipTcc_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SettnsCxb(Index: Integer; const Astring: string);
begin
  FtnsCxb := Astring;
  FtnsCxb_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.tnsCxb_Specified(Index: Integer): boolean;
begin
  Result := FtnsCxb_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrCor(Index: Integer; const Astring: string);
begin
  FvlrCor := Astring;
  FvlrCor_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrEnc(Index: Integer; const Astring: string);
begin
  FvlrEnc := Astring;
  FvlrEnc_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrJrs(Index: Integer; const Astring: string);
begin
  FvlrJrs := Astring;
  FvlrJrs_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrLiq(Index: Integer; const Astring: string);
begin
  FvlrLiq := Astring;
  FvlrLiq_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrLiq_Specified(Index: Integer): boolean;
begin
  Result := FvlrLiq_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrMov(Index: Integer; const Astring: string);
begin
  FvlrMov := Astring;
  FvlrMov_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrMov_Specified(Index: Integer): boolean;
begin
  Result := FvlrMov_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrMul(Index: Integer; const Astring: string);
begin
  FvlrMul := Astring;
  FvlrMul_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrOac(Index: Integer; const Astring: string);
begin
  FvlrOac := Astring;
  FvlrOac_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosBaixarTitulosCPInBaixaTituloPagar.SetvlrOde(Index: Integer; const Astring: string);
begin
  FvlrOde := Astring;
  FvlrOde_Specified := True;
end;

function titulosBaixarTitulosCPInBaixaTituloPagar.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

constructor titulosBaixarTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosBaixarTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosBaixarTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosBaixarTitulosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosBaixarTitulosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosBaixarTitulosCPOut.Setresultado(Index: Integer; const AArray_Of_titulosBaixarTitulosCPOutResultado: Array_Of_titulosBaixarTitulosCPOutResultado);
begin
  Fresultado := AArray_Of_titulosBaixarTitulosCPOutResultado;
  Fresultado_Specified := True;
end;

function titulosBaixarTitulosCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosBaixarTitulosCPOut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosBaixarTitulosCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetcriRat(Index: Integer; const AInteger: Integer);
begin
  FcriRat := AInteger;
  FcriRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.criRat_Specified(Index: Integer): boolean;
begin
  Result := FcriRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetdatBas(Index: Integer; const Astring: string);
begin
  FdatBas := Astring;
  FdatBas_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.datBas_Specified(Index: Integer): boolean;
begin
  Result := FdatBas_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetmesAno(Index: Integer; const Astring: string);
begin
  FmesAno := Astring;
  FmesAno_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.mesAno_Specified(Index: Integer): boolean;
begin
  Result := FmesAno_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetseqRat(Index: Integer; const AInteger: Integer);
begin
  FseqRat := AInteger;
  FseqRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.seqRat_Specified(Index: Integer): boolean;
begin
  Result := FseqRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetsomSub(Index: Integer; const AInteger: Integer);
begin
  FsomSub := AInteger;
  FsomSub_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.somSub_Specified(Index: Integer): boolean;
begin
  Result := FsomSub_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SettipOri(Index: Integer; const Astring: string);
begin
  FtipOri := Astring;
  FtipOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.tipOri_Specified(Index: Integer): boolean;
begin
  Result := FtipOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulosRateios.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulosRateios.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetfilCtr(Index: Integer; const AInteger: Integer);
begin
  FfilCtr := AInteger;
  FfilCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.filCtr_Specified(Index: Integer): boolean;
begin
  Result := FfilCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetfilNfc(Index: Integer; const AInteger: Integer);
begin
  FfilNfc := AInteger;
  FfilNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.filNfc_Specified(Index: Integer): boolean;
begin
  Result := FfilNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetfilNff(Index: Integer; const AInteger: Integer);
begin
  FfilNff := AInteger;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetfilNfv(Index: Integer; const AInteger: Integer);
begin
  FfilNfv := AInteger;
  FfilNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.filNfv_Specified(Index: Integer): boolean;
begin
  Result := FfilNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetfilOcp(Index: Integer; const AInteger: Integer);
begin
  FfilOcp := AInteger;
  FfilOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.filOcp_Specified(Index: Integer): boolean;
begin
  Result := FfilOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetforNfc(Index: Integer; const AInteger: Integer);
begin
  FforNfc := AInteger;
  FforNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.forNfc_Specified(Index: Integer): boolean;
begin
  Result := FforNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetforNff(Index: Integer; const AInteger: Integer);
begin
  FforNff := AInteger;
  FforNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.forNff_Specified(Index: Integer): boolean;
begin
  Result := FforNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetnumCtr(Index: Integer; const AInteger: Integer);
begin
  FnumCtr := AInteger;
  FnumCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.numCtr_Specified(Index: Integer): boolean;
begin
  Result := FnumCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetnumNfc(Index: Integer; const AInteger: Integer);
begin
  FnumNfc := AInteger;
  FnumNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.numNfc_Specified(Index: Integer): boolean;
begin
  Result := FnumNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetnumNff(Index: Integer; const AInteger: Integer);
begin
  FnumNff := AInteger;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetnumOcp(Index: Integer; const AInteger: Integer);
begin
  FnumOcp := AInteger;
  FnumOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.numOcp_Specified(Index: Integer): boolean;
begin
  Result := FnumOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetocpFre(Index: Integer; const AInteger: Integer);
begin
  FocpFre := AInteger;
  FocpFre_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.ocpFre_Specified(Index: Integer): boolean;
begin
  Result := FocpFre_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetocpNre(Index: Integer; const AInteger: Integer);
begin
  FocpNre := AInteger;
  FocpNre_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.ocpNre_Specified(Index: Integer): boolean;
begin
  Result := FocpNre_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetretRat(Index: Integer; const Astring: string);
begin
  FretRat := Astring;
  FretRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.retRat_Specified(Index: Integer): boolean;
begin
  Result := FretRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetseqImo(Index: Integer; const AInteger: Integer);
begin
  FseqImo := AInteger;
  FseqImo_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.seqImo_Specified(Index: Integer): boolean;
begin
  Result := FseqImo_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetsnfNfc(Index: Integer; const Astring: string);
begin
  FsnfNfc := Astring;
  FsnfNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.snfNfc_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetsnfNfv(Index: Integer; const Astring: string);
begin
  FsnfNfv := Astring;
  FsnfNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.snfNfv_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetvctFim(Index: Integer; const Astring: string);
begin
  FvctFim := Astring;
  FvctFim_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.vctFim_Specified(Index: Integer): boolean;
begin
  Result := FvctFim_Specified;
end;

procedure titulosConsultarTitulosAbertosCPIn.SetvctIni(Index: Integer; const Astring: string);
begin
  FvctIni := Astring;
  FvctIni_Specified := True;
end;

function titulosConsultarTitulosAbertosCPIn.vctIni_Specified(Index: Integer): boolean;
begin
  Result := FvctIni_Specified;
end;

constructor titulosConsultarTitulosAbertosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTitulosAbertosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosAbertosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOut.Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCPOutTitulos: Array_Of_titulosConsultarTitulosAbertosCPOutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarTitulosAbertosCPOutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOut.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

destructor titulosConsultarTitulosAbertosCPOutTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateios)-1 do
    System.SysUtils.FreeAndNil(Frateios[I]);
  System.SetLength(Frateios, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodFav(Index: Integer; const ADouble: Double);
begin
  FcodFav := ADouble;
  FcodFav_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codFav_Specified(Index: Integer): boolean;
begin
  Result := FcodFav_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetcpgSub(Index: Integer; const Astring: string);
begin
  FcpgSub := Astring;
  FcpgSub_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.cpgSub_Specified(Index: Integer): boolean;
begin
  Result := FcpgSub_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetctrFre(Index: Integer; const AInteger: Integer);
begin
  FctrFre := AInteger;
  FctrFre_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ctrFre_Specified(Index: Integer): boolean;
begin
  Result := FctrFre_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetctrNre(Index: Integer; const AInteger: Integer);
begin
  FctrNre := AInteger;
  FctrNre_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ctrNre_Specified(Index: Integer): boolean;
begin
  Result := FctrNre_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetfilCcr(Index: Integer; const AInteger: Integer);
begin
  FfilCcr := AInteger;
  FfilCcr_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.filCcr_Specified(Index: Integer): boolean;
begin
  Result := FfilCcr_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetfilCtr(Index: Integer; const AInteger: Integer);
begin
  FfilCtr := AInteger;
  FfilCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.filCtr_Specified(Index: Integer): boolean;
begin
  Result := FfilCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetfilNfc(Index: Integer; const AInteger: Integer);
begin
  FfilNfc := AInteger;
  FfilNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.filNfc_Specified(Index: Integer): boolean;
begin
  Result := FfilNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetfilNff(Index: Integer; const AInteger: Integer);
begin
  FfilNff := AInteger;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetfilNfv(Index: Integer; const AInteger: Integer);
begin
  FfilNfv := AInteger;
  FfilNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.filNfv_Specified(Index: Integer): boolean;
begin
  Result := FfilNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetfilOcp(Index: Integer; const AInteger: Integer);
begin
  FfilOcp := AInteger;
  FfilOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.filOcp_Specified(Index: Integer): boolean;
begin
  Result := FfilOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetforNfc(Index: Integer; const AInteger: Integer);
begin
  FforNfc := AInteger;
  FforNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.forNfc_Specified(Index: Integer): boolean;
begin
  Result := FforNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetforNff(Index: Integer; const AInteger: Integer);
begin
  FforNff := AInteger;
  FforNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.forNff_Specified(Index: Integer): boolean;
begin
  Result := FforNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetgerTep(Index: Integer; const Astring: string);
begin
  FgerTep := Astring;
  FgerTep_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.gerTep_Specified(Index: Integer): boolean;
begin
  Result := FgerTep_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetjrsDia(Index: Integer; const ADouble: Double);
begin
  FjrsDia := ADouble;
  FjrsDia_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumCcr(Index: Integer; const AInteger: Integer);
begin
  FnumCcr := AInteger;
  FnumCcr_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numCcr_Specified(Index: Integer): boolean;
begin
  Result := FnumCcr_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumCtr(Index: Integer; const AInteger: Integer);
begin
  FnumCtr := AInteger;
  FnumCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numCtr_Specified(Index: Integer): boolean;
begin
  Result := FnumCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumNfc(Index: Integer; const AInteger: Integer);
begin
  FnumNfc := AInteger;
  FnumNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numNfc_Specified(Index: Integer): boolean;
begin
  Result := FnumNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumNff(Index: Integer; const AInteger: Integer);
begin
  FnumNff := AInteger;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumOcp(Index: Integer; const AInteger: Integer);
begin
  FnumOcp := AInteger;
  FnumOcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numOcp_Specified(Index: Integer): boolean;
begin
  Result := FnumOcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetocpFre(Index: Integer; const AInteger: Integer);
begin
  FocpFre := AInteger;
  FocpFre_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ocpFre_Specified(Index: Integer): boolean;
begin
  Result := FocpFre_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetocpNre(Index: Integer; const AInteger: Integer);
begin
  FocpNre := AInteger;
  FocpNre_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ocpNre_Specified(Index: Integer): boolean;
begin
  Result := FocpNre_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetperDsc(Index: Integer; const AInteger: Integer);
begin
  FperDsc := AInteger;
  FperDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetperJrs(Index: Integer; const AInteger: Integer);
begin
  FperJrs := AInteger;
  FperJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetperMul(Index: Integer; const AInteger: Integer);
begin
  FperMul := AInteger;
  FperMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetproJrs(Index: Integer; const Astring: string);
begin
  FproJrs := Astring;
  FproJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.Setrateios(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios: Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios);
begin
  Frateios := AArray_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios;
  Frateios_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.rateios_Specified(Index: Integer): boolean;
begin
  Result := Frateios_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetseqCgt(Index: Integer; const AInteger: Integer);
begin
  FseqCgt := AInteger;
  FseqCgt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.seqCgt_Specified(Index: Integer): boolean;
begin
  Result := FseqCgt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetseqImo(Index: Integer; const AInteger: Integer);
begin
  FseqImo := AInteger;
  FseqImo_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.seqImo_Specified(Index: Integer): boolean;
begin
  Result := FseqImo_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetsitTit(Index: Integer; const Astring: string);
begin
  FsitTit := Astring;
  FsitTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.sitTit_Specified(Index: Integer): boolean;
begin
  Result := FsitTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetsnfNfc(Index: Integer; const Astring: string);
begin
  FsnfNfc := Astring;
  FsnfNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.snfNfc_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetsnfNfv(Index: Integer; const Astring: string);
begin
  FsnfNfv := Astring;
  FsnfNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.snfNfv_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SettipEfe(Index: Integer; const Astring: string);
begin
  FtipEfe := Astring;
  FtipEfe_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.tipEfe_Specified(Index: Integer): boolean;
begin
  Result := FtipEfe_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetultPgt(Index: Integer; const Astring: string);
begin
  FultPgt := Astring;
  FultPgt_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.ultPgt_Specified(Index: Integer): boolean;
begin
  Result := FultPgt_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetvlrAbe(Index: Integer; const ADouble: Double);
begin
  FvlrAbe := ADouble;
  FvlrAbe_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.vlrAbe_Specified(Index: Integer): boolean;
begin
  Result := FvlrAbe_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCPOutTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCPOutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

constructor titulosProcessarVariacaoCambialOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosProcessarVariacaoCambialOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosCalculados)-1 do
    System.SysUtils.FreeAndNil(FtitulosCalculados[I]);
  System.SetLength(FtitulosCalculados, 0);
  inherited Destroy;
end;

procedure titulosProcessarVariacaoCambialOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosProcessarVariacaoCambialOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosProcessarVariacaoCambialOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosProcessarVariacaoCambialOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosProcessarVariacaoCambialOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosProcessarVariacaoCambialOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosProcessarVariacaoCambialOut.SettitulosCalculados(Index: Integer; const AArray_Of_titulosProcessarVariacaoCambialOutTitulosCalculados: Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados);
begin
  FtitulosCalculados := AArray_Of_titulosProcessarVariacaoCambialOutTitulosCalculados;
  FtitulosCalculados_Specified := True;
end;

function titulosProcessarVariacaoCambialOut.titulosCalculados_Specified(Index: Integer): boolean;
begin
  Result := FtitulosCalculados_Specified;
end;

procedure titulosProcessarVariacaoCambialOutTitulosCalculados.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosProcessarVariacaoCambialOutTitulosCalculados.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosProcessarVariacaoCambialOutTitulosCalculados.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosProcessarVariacaoCambialOutTitulosCalculados.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosProcessarVariacaoCambialOutTitulosCalculados.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosProcessarVariacaoCambialOutTitulosCalculados.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosProcessarVariacaoCambialOutTitulosCalculados.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosProcessarVariacaoCambialOutTitulosCalculados.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosProcessarVariacaoCambialOutTitulosCalculados.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosProcessarVariacaoCambialOutTitulosCalculados.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosProcessarVariacaoCambialOutTitulosCalculados.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function titulosProcessarVariacaoCambialOutTitulosCalculados.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

destructor titulosSubstituirTitulosCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosBaixar)-1 do
    System.SysUtils.FreeAndNil(FtitulosBaixar[I]);
  System.SetLength(FtitulosBaixar, 0);
  for I := 0 to System.Length(FtitulosSubstitutos)-1 do
    System.SysUtils.FreeAndNil(FtitulosSubstitutos[I]);
  System.SetLength(FtitulosSubstitutos, 0);
  inherited Destroy;
end;

procedure titulosSubstituirTitulosCPIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosSubstituirTitulosCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosSubstituirTitulosCPIn.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosSubstituirTitulosCPIn.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosSubstituirTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosSubstituirTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SetforCli(Index: Integer; const Astring: string);
begin
  FforCli := Astring;
  FforCli_Specified := True;
end;

function titulosSubstituirTitulosCPIn.forCli_Specified(Index: Integer): boolean;
begin
  Result := FforCli_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SettitulosBaixar(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPInTitulosBaixar: Array_Of_titulosSubstituirTitulosCPInTitulosBaixar);
begin
  FtitulosBaixar := AArray_Of_titulosSubstituirTitulosCPInTitulosBaixar;
  FtitulosBaixar_Specified := True;
end;

function titulosSubstituirTitulosCPIn.titulosBaixar_Specified(Index: Integer): boolean;
begin
  Result := FtitulosBaixar_Specified;
end;

procedure titulosSubstituirTitulosCPIn.SettitulosSubstitutos(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPInTitulosSubstitutos: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos);
begin
  FtitulosSubstitutos := AArray_Of_titulosSubstituirTitulosCPInTitulosSubstitutos;
  FtitulosSubstitutos_Specified := True;
end;

function titulosSubstituirTitulosCPIn.titulosSubstitutos_Specified(Index: Integer): boolean;
begin
  Result := FtitulosSubstitutos_Specified;
end;

procedure titulosProcessarVariacaoCambialInTitulosACalcular.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosProcessarVariacaoCambialInTitulosACalcular.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosProcessarVariacaoCambialInTitulosACalcular.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosProcessarVariacaoCambialInTitulosACalcular.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosProcessarVariacaoCambialInTitulosACalcular.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosProcessarVariacaoCambialInTitulosACalcular.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosProcessarVariacaoCambialInTitulosACalcular.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosProcessarVariacaoCambialInTitulosACalcular.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosProcessarVariacaoCambialInTitulosACalcular.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosProcessarVariacaoCambialInTitulosACalcular.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosConsultarTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTitulosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTitulosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTitulosCPOut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarTitulosCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosCPOut.Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosCPOutTitulos: Array_Of_titulosConsultarTitulosCPOutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarTitulosCPOutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarTitulosCPOut.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcodUsu(Index: Integer; const Astring: string);
begin
  FcodUsu := Astring;
  FcodUsu_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.codUsu_Specified(Index: Integer): boolean;
begin
  Result := FcodUsu_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcorApr(Index: Integer; const Astring: string);
begin
  FcorApr := Astring;
  FcorApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.corApr_Specified(Index: Integer): boolean;
begin
  Result := FcorApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcotApr(Index: Integer; const Astring: string);
begin
  FcotApr := Astring;
  FcotApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.cotApr_Specified(Index: Integer): boolean;
begin
  Result := FcotApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetcotEmi(Index: Integer; const Astring: string);
begin
  FcotEmi := Astring;
  FcotEmi_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetctaApr(Index: Integer; const Astring: string);
begin
  FctaApr := Astring;
  FctaApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.ctaApr_Specified(Index: Integer): boolean;
begin
  Result := FctaApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdatApr(Index: Integer; const Astring: string);
begin
  FdatApr := Astring;
  FdatApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.datApr_Specified(Index: Integer): boolean;
begin
  Result := FdatApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetdscApr(Index: Integer; const Astring: string);
begin
  FdscApr := Astring;
  FdscApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.dscApr_Specified(Index: Integer): boolean;
begin
  Result := FdscApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetempApr(Index: Integer; const Astring: string);
begin
  FempApr := Astring;
  FempApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.empApr_Specified(Index: Integer): boolean;
begin
  Result := FempApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetencApr(Index: Integer; const Astring: string);
begin
  FencApr := Astring;
  FencApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.encApr_Specified(Index: Integer): boolean;
begin
  Result := FencApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetfpgApr(Index: Integer; const Astring: string);
begin
  FfpgApr := Astring;
  FfpgApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.fpgApr_Specified(Index: Integer): boolean;
begin
  Result := FfpgApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SethorApr(Index: Integer; const Astring: string);
begin
  FhorApr := Astring;
  FhorApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.horApr_Specified(Index: Integer): boolean;
begin
  Result := FhorApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetjrsApr(Index: Integer; const Astring: string);
begin
  FjrsApr := Astring;
  FjrsApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.jrsApr_Specified(Index: Integer): boolean;
begin
  Result := FjrsApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetlibApr(Index: Integer; const Astring: string);
begin
  FlibApr := Astring;
  FlibApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.libApr_Specified(Index: Integer): boolean;
begin
  Result := FlibApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetmulApr(Index: Integer; const Astring: string);
begin
  FmulApr := Astring;
  FmulApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.mulApr_Specified(Index: Integer): boolean;
begin
  Result := FmulApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetoacApr(Index: Integer; const Astring: string);
begin
  FoacApr := Astring;
  FoacApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.oacApr_Specified(Index: Integer): boolean;
begin
  Result := FoacApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetodeApr(Index: Integer; const Astring: string);
begin
  FodeApr := Astring;
  FodeApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.odeApr_Specified(Index: Integer): boolean;
begin
  Result := FodeApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetpgtApr(Index: Integer; const Astring: string);
begin
  FpgtApr := Astring;
  FpgtApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.pgtApr_Specified(Index: Integer): boolean;
begin
  Result := FpgtApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetporAnt(Index: Integer; const Astring: string);
begin
  FporAnt := Astring;
  FporAnt_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.porAnt_Specified(Index: Integer): boolean;
begin
  Result := FporAnt_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetseqApr(Index: Integer; const Astring: string);
begin
  FseqApr := Astring;
  FseqApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.seqApr_Specified(Index: Integer): boolean;
begin
  Result := FseqApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SettipTcc(Index: Integer; const Astring: string);
begin
  FtipTcc := Astring;
  FtipTcc_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetusuSit(Index: Integer; const Astring: string);
begin
  FusuSit := Astring;
  FusuSit_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.usuSit_Specified(Index: Integer): boolean;
begin
  Result := FusuSit_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetvlrApr(Index: Integer; const Astring: string);
begin
  FvlrApr := Astring;
  FvlrApr_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.vlrApr_Specified(Index: Integer): boolean;
begin
  Result := FvlrApr_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarTitulosCPOutTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosConsultarTitulosCPOutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

destructor titulosProcessarVariacaoCambialIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosACalcular)-1 do
    System.SysUtils.FreeAndNil(FtitulosACalcular[I]);
  System.SetLength(FtitulosACalcular, 0);
  inherited Destroy;
end;

procedure titulosProcessarVariacaoCambialIn.SetdataBaseFinal(Index: Integer; const Astring: string);
begin
  FdataBaseFinal := Astring;
  FdataBaseFinal_Specified := True;
end;

function titulosProcessarVariacaoCambialIn.dataBaseFinal_Specified(Index: Integer): boolean;
begin
  Result := FdataBaseFinal_Specified;
end;

procedure titulosProcessarVariacaoCambialIn.SetdataBaseInicial(Index: Integer; const Astring: string);
begin
  FdataBaseInicial := Astring;
  FdataBaseInicial_Specified := True;
end;

function titulosProcessarVariacaoCambialIn.dataBaseInicial_Specified(Index: Integer): boolean;
begin
  Result := FdataBaseInicial_Specified;
end;

procedure titulosProcessarVariacaoCambialIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosProcessarVariacaoCambialIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosProcessarVariacaoCambialIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosProcessarVariacaoCambialIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosProcessarVariacaoCambialIn.SetidPacote(Index: Integer; const AInteger: Integer);
begin
  FidPacote := AInteger;
  FidPacote_Specified := True;
end;

function titulosProcessarVariacaoCambialIn.idPacote_Specified(Index: Integer): boolean;
begin
  Result := FidPacote_Specified;
end;

procedure titulosProcessarVariacaoCambialIn.SettitulosACalcular(Index: Integer; const AArray_Of_titulosProcessarVariacaoCambialInTitulosACalcular: Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular);
begin
  FtitulosACalcular := AArray_Of_titulosProcessarVariacaoCambialInTitulosACalcular;
  FtitulosACalcular_Specified := True;
end;

function titulosProcessarVariacaoCambialIn.titulosACalcular_Specified(Index: Integer): boolean;
begin
  Result := FtitulosACalcular_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetobsMcp(Index: Integer; const Astring: string);
begin
  FobsMcp := Astring;
  FobsMcp_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.obsMcp_Specified(Index: Integer): boolean;
begin
  Result := FobsMcp_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosBaixar.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosBaixar.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

destructor titulosGravarTitulosCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosGravarTitulosCPIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosGravarTitulosCPIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosGravarTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosGravarTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosGravarTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosGravarTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosGravarTitulosCPIn.Settitulos(Index: Integer; const AArray_Of_titulosGravarTitulosCPInTitulos: Array_Of_titulosGravarTitulosCPInTitulos);
begin
  Ftitulos := AArray_Of_titulosGravarTitulosCPInTitulos;
  Ftitulos_Specified := True;
end;

function titulosGravarTitulosCPIn.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcodUsu(Index: Integer; const Astring: string);
begin
  FcodUsu := Astring;
  FcodUsu_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.codUsu_Specified(Index: Integer): boolean;
begin
  Result := FcodUsu_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcorApr(Index: Integer; const Astring: string);
begin
  FcorApr := Astring;
  FcorApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.corApr_Specified(Index: Integer): boolean;
begin
  Result := FcorApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcotApr(Index: Integer; const Astring: string);
begin
  FcotApr := Astring;
  FcotApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.cotApr_Specified(Index: Integer): boolean;
begin
  Result := FcotApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetcotEmi(Index: Integer; const Astring: string);
begin
  FcotEmi := Astring;
  FcotEmi_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetctaApr(Index: Integer; const Astring: string);
begin
  FctaApr := Astring;
  FctaApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.ctaApr_Specified(Index: Integer): boolean;
begin
  Result := FctaApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdatApr(Index: Integer; const Astring: string);
begin
  FdatApr := Astring;
  FdatApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.datApr_Specified(Index: Integer): boolean;
begin
  Result := FdatApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetdscApr(Index: Integer; const Astring: string);
begin
  FdscApr := Astring;
  FdscApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.dscApr_Specified(Index: Integer): boolean;
begin
  Result := FdscApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetempApr(Index: Integer; const Astring: string);
begin
  FempApr := Astring;
  FempApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.empApr_Specified(Index: Integer): boolean;
begin
  Result := FempApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetencApr(Index: Integer; const Astring: string);
begin
  FencApr := Astring;
  FencApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.encApr_Specified(Index: Integer): boolean;
begin
  Result := FencApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetfpgApr(Index: Integer; const Astring: string);
begin
  FfpgApr := Astring;
  FfpgApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.fpgApr_Specified(Index: Integer): boolean;
begin
  Result := FfpgApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SethorApr(Index: Integer; const Astring: string);
begin
  FhorApr := Astring;
  FhorApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.horApr_Specified(Index: Integer): boolean;
begin
  Result := FhorApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetjrsApr(Index: Integer; const Astring: string);
begin
  FjrsApr := Astring;
  FjrsApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.jrsApr_Specified(Index: Integer): boolean;
begin
  Result := FjrsApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetlibApr(Index: Integer; const Astring: string);
begin
  FlibApr := Astring;
  FlibApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.libApr_Specified(Index: Integer): boolean;
begin
  Result := FlibApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetmulApr(Index: Integer; const Astring: string);
begin
  FmulApr := Astring;
  FmulApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.mulApr_Specified(Index: Integer): boolean;
begin
  Result := FmulApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetoacApr(Index: Integer; const Astring: string);
begin
  FoacApr := Astring;
  FoacApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.oacApr_Specified(Index: Integer): boolean;
begin
  Result := FoacApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetodeApr(Index: Integer; const Astring: string);
begin
  FodeApr := Astring;
  FodeApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.odeApr_Specified(Index: Integer): boolean;
begin
  Result := FodeApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetpgtApr(Index: Integer; const Astring: string);
begin
  FpgtApr := Astring;
  FpgtApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.pgtApr_Specified(Index: Integer): boolean;
begin
  Result := FpgtApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetporAnt(Index: Integer; const Astring: string);
begin
  FporAnt := Astring;
  FporAnt_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.porAnt_Specified(Index: Integer): boolean;
begin
  Result := FporAnt_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetseqApr(Index: Integer; const Astring: string);
begin
  FseqApr := Astring;
  FseqApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.seqApr_Specified(Index: Integer): boolean;
begin
  Result := FseqApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SettipTcc(Index: Integer; const AInteger: Integer);
begin
  FtipTcc := AInteger;
  FtipTcc_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.tipTcc_Specified(Index: Integer): boolean;
begin
  Result := FtipTcc_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetusuSit(Index: Integer; const Astring: string);
begin
  FusuSit := Astring;
  FusuSit_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.usuSit_Specified(Index: Integer): boolean;
begin
  Result := FusuSit_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetvlrApr(Index: Integer; const Astring: string);
begin
  FvlrApr := Astring;
  FvlrApr_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.vlrApr_Specified(Index: Integer): boolean;
begin
  Result := FvlrApr_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosGravarTitulosCPInTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosGravarTitulosCPInTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

constructor titulosGravarTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosGravarTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosGravarTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosGravarTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosGravarTitulosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosGravarTitulosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosGravarTitulosCPOut.Setresultado(Index: Integer; const AArray_Of_titulosGravarTitulosCPOutResultado: Array_Of_titulosGravarTitulosCPOutResultado);
begin
  Fresultado := AArray_Of_titulosGravarTitulosCPOutResultado;
  Fresultado_Specified := True;
end;

function titulosGravarTitulosCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosGravarTitulosCPOut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosGravarTitulosCPOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosSubstituirTitulosCPOutGridResult.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosSubstituirTitulosCPOutGridResult.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosSubstituirTitulosCPOutGridResult.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCPOutGridResult.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCPOutGridResult.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosSubstituirTitulosCPOutGridResult.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosSubstituirTitulosCPOutGridResult.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosCPOutGridResult.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosCPOutGridResult.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosCPOutGridResult.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosCPOutGridResult.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosSubstituirTitulosCPOutGridResult.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
end;

destructor titulosSubstituirTitulosCPInTitulosSubstitutos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcheAge(Index: Integer; const Astring: string);
begin
  FcheAge := Astring;
  FcheAge_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.cheAge_Specified(Index: Integer): boolean;
begin
  Result := FcheAge_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcheBan(Index: Integer; const Astring: string);
begin
  FcheBan := Astring;
  FcheBan_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.cheBan_Specified(Index: Integer): boolean;
begin
  Result := FcheBan_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcheCta(Index: Integer; const Astring: string);
begin
  FcheCta := Astring;
  FcheCta_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.cheCta_Specified(Index: Integer): boolean;
begin
  Result := FcheCta_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodFav(Index: Integer; const ADouble: Double);
begin
  FcodFav := ADouble;
  FcodFav_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codFav_Specified(Index: Integer): boolean;
begin
  Result := FcodFav_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcodTri(Index: Integer; const Astring: string);
begin
  FcodTri := Astring;
  FcodTri_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.codTri_Specified(Index: Integer): boolean;
begin
  Result := FcodTri_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetcotNeg(Index: Integer; const ADouble: Double);
begin
  FcotNeg := ADouble;
  FcotNeg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.cotNeg_Specified(Index: Integer): boolean;
begin
  Result := FcotNeg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetperDsc(Index: Integer; const AInteger: Integer);
begin
  FperDsc := AInteger;
  FperDsc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetperJrs(Index: Integer; const AInteger: Integer);
begin
  FperJrs := AInteger;
  FperJrs_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetperMul(Index: Integer; const AInteger: Integer);
begin
  FperMul := AInteger;
  FperMul_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetpriPgt(Index: Integer; const AInteger: Integer);
begin
  FpriPgt := AInteger;
  FpriPgt_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.priPgt_Specified(Index: Integer): boolean;
begin
  Result := FpriPgt_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.Setrateio(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio: Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio);
begin
  Frateio := AArray_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio;
  Frateio_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosSubstituirTitulosCPInTitulosSubstitutosRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosSubstituirTitulosCPInTitulosSubstitutosRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

constructor titulosSubstituirTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosSubstituirTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridResult)-1 do
    System.SysUtils.FreeAndNil(FgridResult[I]);
  System.SetLength(FgridResult, 0);
  inherited Destroy;
end;

procedure titulosSubstituirTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosSubstituirTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosSubstituirTitulosCPOut.SetgridResult(Index: Integer; const AArray_Of_titulosSubstituirTitulosCPOutGridResult: Array_Of_titulosSubstituirTitulosCPOutGridResult);
begin
  FgridResult := AArray_Of_titulosSubstituirTitulosCPOutGridResult;
  FgridResult_Specified := True;
end;

function titulosSubstituirTitulosCPOut.gridResult_Specified(Index: Integer): boolean;
begin
  Result := FgridResult_Specified;
end;

procedure titulosSubstituirTitulosCPOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosSubstituirTitulosCPOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

initialization
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), ioLiteral);
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ConsultarTitulosAbertosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosAbertosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosAbertosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ConsultarTitulosAbertosCP_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosAbertosCP_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosAbertosCP_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.GravarTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'GravarTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'GravarTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.EntradaTitulosLoteCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'EntradaTitulosLoteCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'EntradaTitulosLoteCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.BaixarTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'BaixarTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'BaixarTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ExcluirTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ExcluirTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ExcluirTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.SubstituirTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'SubstituirTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'SubstituirTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.GerarBaixaAproveitamentoCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'GerarBaixaAproveitamentoCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'GerarBaixaAproveitamentoCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.GerarBaixaPorLoteCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'GerarBaixaPorLoteCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'GerarBaixaPorLoteCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.EstornoBaixaTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'EstornoBaixaTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'EstornoBaixaTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.EstornoBaixaTitulosCP_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'EstornoBaixaTitulosCP_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'EstornoBaixaTitulosCP_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.buscarPendentesCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'buscarPendentesCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'buscarPendentesCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ProcessarVariacaoCambial }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ProcessarVariacaoCambial', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ProcessarVariacaoCambial', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ConsultarTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ConsultarTitulosCP_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosCP_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarTitulosCP_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ConsultarCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.reprovarCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'reprovarCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'reprovarCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ConsultarCP_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarCP_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ConsultarCP_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.aprovarCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'aprovarCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'aprovarCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cpa_titulos.ProcessarAVM }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ProcessarAVM', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cpa_titulos), 'ProcessarAVM', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarCP2OutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarCP2OutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosCP2OutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosCP2OutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosLoteCPOutGridResult), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosLoteCPOutGridResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosbuscarPendentesCPOutTitulo), 'http://services.senior.com.br', 'Array_Of_titulosbuscarPendentesCPOutTitulo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosaprovarCPInTitulo), 'http://services.senior.com.br', 'Array_Of_titulosaprovarCPInTitulo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExcluirTitulosCPInTitulos), 'http://services.senior.com.br', 'Array_Of_titulosExcluirTitulosCPInTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExcluirTitulosCPOutResultado), 'http://services.senior.com.br', 'Array_Of_titulosExcluirTitulosCPOutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosLoteCPInEntradaTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaPorLoteCPInGridTitulosBaixar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaPorLoteCPOutGridRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosBAI');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCPOutResultado), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCPOutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosAbertosCPOutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosAbertosCPOutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosAbertosCPOutTitulosRateios');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCPInBaixaTituloPagar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaAproveitamentoCPInGridTitulosCRE');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosreprovarCPOutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosreprovarCPOutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCPInTitulosPagar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCPOutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCPOutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosreprovarCPInTitulo), 'http://services.senior.com.br', 'Array_Of_titulosreprovarCPInTitulo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaAproveitamentoCPOutGridRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarAVMInTitulosACalcular), 'http://services.senior.com.br', 'Array_Of_titulosProcessarAVMInTitulosACalcular');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarAVMOutTitulosCalculados), 'http://services.senior.com.br', 'Array_Of_titulosProcessarAVMOutTitulosCalculados');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular), 'http://services.senior.com.br', 'Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados), 'http://services.senior.com.br', 'Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCPInTitulosBaixar), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCPInTitulosBaixar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosCPOutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosCPOutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosaprovarCPOutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosaprovarCPOutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosAbertosCP2OutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosAbertosCP2OutTitulosRateios');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarCPOutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarCPOutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCP2InTitulosPagar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCP2OutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGravarTitulosCPOutResultado), 'http://services.senior.com.br', 'Array_Of_titulosGravarTitulosCPOutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCPInTitulosSubstitutosRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCPOutGridResult), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCPOutGridResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGravarTitulosCPInTitulos), 'http://services.senior.com.br', 'Array_Of_titulosGravarTitulosCPInTitulos');
  RemClassRegistry.RegisterXSClass(titulosConsultarCP2In, 'http://services.senior.com.br', 'titulosConsultarCP2In');
  RemClassRegistry.RegisterXSClass(titulosConsultarCP2OutTitulos, 'http://services.senior.com.br', 'titulosConsultarCP2OutTitulos');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCP2OutTitulos, 'http://services.senior.com.br', 'titulosConsultarTitulosCP2OutTitulos');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCP2Out, 'http://services.senior.com.br', 'titulosConsultarTitulosCP2Out');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTitulosCP2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCP2In, 'http://services.senior.com.br', 'titulosConsultarTitulosCP2In');
  RemClassRegistry.RegisterXSClass(titulosaprovarCPOut, 'http://services.senior.com.br', 'titulosaprovarCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosaprovarCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCP2Out, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCP2Out');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTitulosAbertosCP2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCPIn, 'http://services.senior.com.br', 'titulosConsultarTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCPOut, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosEntradaTitulosLoteCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosaprovarCPIn, 'http://services.senior.com.br', 'titulosaprovarCPIn');
  RemClassRegistry.RegisterXSClass(titulosbuscarPendentesCPOut, 'http://services.senior.com.br', 'titulosbuscarPendentesCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosbuscarPendentesCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosreprovarCPIn, 'http://services.senior.com.br', 'titulosreprovarCPIn');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCPOut, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosGerarBaixaAproveitamentoCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCPOut, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosGerarBaixaPorLoteCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCPIn, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosreprovarCPOut, 'http://services.senior.com.br', 'titulosreprovarCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosreprovarCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarCP2Out, 'http://services.senior.com.br', 'titulosConsultarCP2Out');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarCP2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCPIn, 'http://services.senior.com.br', 'titulosExcluirTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCPInEntradaTitulos, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCPInEntradaTitulos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCPIn, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCPIn');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCP2In, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCP2In');
  RemClassRegistry.RegisterXSClass(titulosaprovarCPOutRetorno, 'http://services.senior.com.br', 'titulosaprovarCPOutRetorno');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCP2OutTitulosRateios, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCP2OutTitulosRateios');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCP2OutTitulos, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCP2OutTitulos');
  RemClassRegistry.RegisterXSClass(titulosaprovarCPInTitulo, 'http://services.senior.com.br', 'titulosaprovarCPInTitulo');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCPOutGridResult, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCPOutGridResult');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCPInEntradaTitulosRateio, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCPInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSClass(titulosbuscarPendentesCPIn, 'http://services.senior.com.br', 'titulosbuscarPendentesCPIn');
  RemClassRegistry.RegisterXSClass(titulosbuscarPendentesCPOutTitulo, 'http://services.senior.com.br', 'titulosbuscarPendentesCPOutTitulo');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCPOutResultado, 'http://services.senior.com.br', 'titulosBaixarTitulosCPOutResultado');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMInTitulosACalcular, 'http://services.senior.com.br', 'titulosProcessarAVMInTitulosACalcular');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMIn, 'http://services.senior.com.br', 'titulosProcessarAVMIn');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCPOutGridRetorno, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCPOutGridRetorno');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMOut, 'http://services.senior.com.br', 'titulosProcessarAVMOut');
  RemClassRegistry.RegisterSerializeOptions(titulosProcessarAVMOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosreprovarCPInTitulo, 'http://services.senior.com.br', 'titulosreprovarCPInTitulo');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMOutTitulosCalculados, 'http://services.senior.com.br', 'titulosProcessarAVMOutTitulosCalculados');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCPInGridTitulosBaixar, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCPInGridTitulosBaixar');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCPIn, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCPIn');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCPOutGridRetorno, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCPOutGridRetorno');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCPInGridTitulosCRE, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCPInGridTitulosCRE');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCPInGridTitulosBAI, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCPInGridTitulosBAI');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCPIn, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCPIn');
  RemClassRegistry.RegisterXSClass(titulosreprovarCPOutRetorno, 'http://services.senior.com.br', 'titulosreprovarCPOutRetorno');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCPInTitulosPagar, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCPInTitulosPagar');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCPOutRetorno, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCPOutRetorno');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCPOut, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosEstornoBaixaTitulosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCPInTitulos, 'http://services.senior.com.br', 'titulosExcluirTitulosCPInTitulos');
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCPOut, 'http://services.senior.com.br', 'titulosExcluirTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosExcluirTitulosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCPOutResultado, 'http://services.senior.com.br', 'titulosExcluirTitulosCPOutResultado');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCP2In, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCP2In');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCP2InTitulosPagar, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCP2InTitulosPagar');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCP2Out, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCP2Out');
  RemClassRegistry.RegisterSerializeOptions(titulosEstornoBaixaTitulosCP2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarCPOutTitulos, 'http://services.senior.com.br', 'titulosConsultarCPOutTitulos');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCPOutResultado, 'http://services.senior.com.br', 'titulosGravarTitulosCPOutResultado');
  RemClassRegistry.RegisterXSClass(titulosConsultarCPIn, 'http://services.senior.com.br', 'titulosConsultarCPIn');
  RemClassRegistry.RegisterXSClass(titulosConsultarCPOut, 'http://services.senior.com.br', 'titulosConsultarCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCP2OutRetorno, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCP2OutRetorno');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCPIn, 'http://services.senior.com.br', 'titulosBaixarTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCPInBaixaTituloPagar, 'http://services.senior.com.br', 'titulosBaixarTitulosCPInBaixaTituloPagar');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCPOut, 'http://services.senior.com.br', 'titulosBaixarTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosBaixarTitulosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCPOutTitulosRateios, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCPOutTitulosRateios');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCPIn, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCPIn');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCPOut, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTitulosAbertosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCPOutTitulos, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCPOutTitulos');
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialOut, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialOut');
  RemClassRegistry.RegisterSerializeOptions(titulosProcessarVariacaoCambialOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialOutTitulosCalculados, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialOutTitulosCalculados');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCPIn, 'http://services.senior.com.br', 'titulosSubstituirTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialInTitulosACalcular, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialInTitulosACalcular');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCPOut, 'http://services.senior.com.br', 'titulosConsultarTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTitulosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCPOutTitulos, 'http://services.senior.com.br', 'titulosConsultarTitulosCPOutTitulos');
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialIn, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialIn');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCPInTitulosBaixar, 'http://services.senior.com.br', 'titulosSubstituirTitulosCPInTitulosBaixar');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCPIn, 'http://services.senior.com.br', 'titulosGravarTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCPInTitulos, 'http://services.senior.com.br', 'titulosGravarTitulosCPInTitulos');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCPOut, 'http://services.senior.com.br', 'titulosGravarTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosGravarTitulosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCPOutGridResult, 'http://services.senior.com.br', 'titulosSubstituirTitulosCPOutGridResult');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCPInTitulosSubstitutos, 'http://services.senior.com.br', 'titulosSubstituirTitulosCPInTitulosSubstitutos');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCPInTitulosSubstitutosRateio, 'http://services.senior.com.br', 'titulosSubstituirTitulosCPInTitulosSubstitutosRateio');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCPOut, 'http://services.senior.com.br', 'titulosSubstituirTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosSubstituirTitulosCPOut, [xoLiteralParam]);

end.