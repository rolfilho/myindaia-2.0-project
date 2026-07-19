// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (22/01/2019 18:31:12 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_Numerarios_CRE_Senior;

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
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]

  titulosSubstituirTitulosCRIn = class;         { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCRInTitulosSubstitutos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCRInTitulosBaixar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosCRIn = class;          { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCROut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosGravarTitulosCRInTitulosRateios = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCRInTitulos = class;      { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCRInEntradaTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCRIn = class;        { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCROutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGravarTitulosCRIn = class;             { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCRIn = class;       { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosCROutTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosCROut = class;         { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEstornoBaixaTitulosCROutRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCROut = class;      { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEstornoBaixaTitulosCRInTitulosReceber = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExportarBaixaTitulosReceberVendaInConsulta = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCR2Out = class;     { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEstornoBaixaTitulosCR2InTitulosReceber = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCR2In = class;      { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCRInBaixaTituloReceber = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCRIn = class;             { "http://services.senior.com.br"[GblCplx] }
  titulosEstornoBaixaTitulosCR2OutRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCROutTitulosRateios = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExportarBaixaTitulosReceberVendaOutErros = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExportarBaixaTitulosReceberVendaOut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosAbertosCROutTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTitulosAbertosCROut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTitulosAbertosCRIn = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCRInBaixaTituloReceberRateios = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCROutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCROut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosSubstituirTitulosCRInTitulosSubstitutosRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarVariacaoCambialInTitulosACalcular = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarVariacaoCambialOut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosProcessarVariacaoCambialOutTitulosCalculados = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosCROut = class;        { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosSubstituirTitulosCROutGridResult = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarVariacaoCambialIn = class;    { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMIn = class;                { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMInTitulosACalcular = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMOut = class;               { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosGerarBaixaAproveitamentoCRInGridTitulosCRE = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCROut = class;   { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosGerarBaixaAproveitamentoCROutGridRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosProcessarAVMOutTitulosCalculados = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCR2Out = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosBaixarTitulosCR2OutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExportarBaixaTitulosReceberVendaIn = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCR2In = class;            { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCR2InBaixaTituloReceber = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosBaixarTitulosCR2InBaixaTituloReceberRateios = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCRInGridTitulosBAI = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExcluirTitulosCRIn = class;            { "http://services.senior.com.br"[GblCplx] }
  titulosExcluirTitulosCRInTitulos = class;     { "http://services.senior.com.br"[GblCplx] }
  titulosExcluirTitulosCROut = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEntradaTitulosLoteCRInEntradaTitulosRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosLoteCROut = class;       { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEntradaTitulosLoteCROutGridResult = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosExcluirTitulosCROutResultado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCROut = class;        { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosGerarBaixaPorLoteCROutGridRetorno = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaAproveitamentoCRIn = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCRIn = class;         { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCRInGridTesouraria = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosGerarBaixaPorLoteCRInGridTitulosBaixar = class;   { "http://services.senior.com.br"[GblCplx] }

  Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos = array of titulosSubstituirTitulosCRInTitulosSubstitutos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio = array of titulosSubstituirTitulosCRInTitulosSubstitutosRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCROutGridResult = array of titulosSubstituirTitulosCROutGridResult;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosCRInTitulosBaixar = array of titulosSubstituirTitulosCRInTitulosBaixar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular = array of titulosProcessarVariacaoCambialInTitulosACalcular;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCROutRetorno = array of titulosEstornoBaixaTitulosCROutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGravarTitulosCRInTitulos = array of titulosGravarTitulosCRInTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGravarTitulosCRInTitulosRateios = array of titulosGravarTitulosCRInTitulosRateios;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados = array of titulosProcessarVariacaoCambialOutTitulosCalculados;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosCROutTitulos = array of titulosConsultarTitulosCROutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber = array of titulosEstornoBaixaTitulosCRInTitulosReceber;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta = array of titulosExportarBaixaTitulosReceberVendaInConsulta;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos = array of titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros = array of titulosExportarBaixaTitulosReceberVendaOutErros;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber = array of titulosBaixarTitulosCR2InBaixaTituloReceber;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios = array of titulosBaixarTitulosCR2InBaixaTituloReceberRateios;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCR2OutResultado = array of titulosBaixarTitulosCR2OutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosAbertosCROutTitulos = array of titulosConsultarTitulosAbertosCROutTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber = array of titulosBaixarTitulosCRInBaixaTituloReceber;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios = array of titulosBaixarTitulosCRInBaixaTituloReceberRateios;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosBaixarTitulosCROutResultado = array of titulosBaixarTitulosCROutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios = array of titulosConsultarTitulosAbertosCROutTitulosRateios;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber = array of titulosEstornoBaixaTitulosCR2InTitulosReceber;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno = array of titulosEstornoBaixaTitulosCR2OutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarAVMOutTitulosCalculados = array of titulosProcessarAVMOutTitulosCalculados;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosLoteCROutGridResult = array of titulosEntradaTitulosLoteCROutGridResult;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExcluirTitulosCRInTitulos = array of titulosExcluirTitulosCRInTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosExcluirTitulosCROutResultado = array of titulosExcluirTitulosCROutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGravarTitulosCROutResultado = array of titulosGravarTitulosCROutResultado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos = array of titulosEntradaTitulosLoteCRInEntradaTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio = array of titulosEntradaTitulosLoteCRInEntradaTitulosRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria = array of titulosGerarBaixaPorLoteCRInGridTesouraria;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE = array of titulosGerarBaixaAproveitamentoCRInGridTitulosCRE;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno = array of titulosGerarBaixaAproveitamentoCROutGridRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosProcessarAVMInTitulosACalcular = array of titulosProcessarAVMInTitulosACalcular;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar = array of titulosGerarBaixaPorLoteCRInGridTitulosBaixar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno = array of titulosGerarBaixaPorLoteCROutGridRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI = array of titulosGerarBaixaAproveitamentoCRInGridTitulosBAI;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCRIn = class(TRemotable)
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
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    FtitulosBaixar: Array_Of_titulosSubstituirTitulosCRInTitulosBaixar;
    FtitulosBaixar_Specified: boolean;
    FtitulosSubstitutos: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos;
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
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
    procedure SettitulosBaixar(Index: Integer; const AArray_Of_titulosSubstituirTitulosCRInTitulosBaixar: Array_Of_titulosSubstituirTitulosCRInTitulosBaixar);
    function  titulosBaixar_Specified(Index: Integer): boolean;
    procedure SettitulosSubstitutos(Index: Integer; const AArray_Of_titulosSubstituirTitulosCRInTitulosSubstitutos: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos);
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
    property idtReq:             string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:             string                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
    property titulosBaixar:      Array_Of_titulosSubstituirTitulosCRInTitulosBaixar       Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosBaixar write SettitulosBaixar stored titulosBaixar_Specified;
    property titulosSubstitutos: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosSubstitutos write SettitulosSubstitutos stored titulosSubstitutos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCRInTitulosSubstitutos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCRInTitulosSubstitutos = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FcatExt: string;
    FcatExt_Specified: boolean;
    FcatTef: string;
    FcatTef_Specified: boolean;
    FcheAge: string;
    FcheAge_Specified: boolean;
    FcheBan: string;
    FcheBan_Specified: boolean;
    FcheCta: string;
    FcheCta_Specified: boolean;
    FcheNum: string;
    FcheNum_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodOpe: Integer;
    FcodOpe_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodSac: Double;
    FcodSac_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
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
    FnsuTef: string;
    FnsuTef_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FperDsc: Integer;
    FperDsc_Specified: boolean;
    FperJrs: Integer;
    FperJrs_Specified: boolean;
    FperMul: Integer;
    FperMul_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    Frateio: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio;
    Frateio_Specified: boolean;
    FseqCob: string;
    FseqCob_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
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
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetcatExt(Index: Integer; const Astring: string);
    function  catExt_Specified(Index: Integer): boolean;
    procedure SetcatTef(Index: Integer; const Astring: string);
    function  catTef_Specified(Index: Integer): boolean;
    procedure SetcheAge(Index: Integer; const Astring: string);
    function  cheAge_Specified(Index: Integer): boolean;
    procedure SetcheBan(Index: Integer; const Astring: string);
    function  cheBan_Specified(Index: Integer): boolean;
    procedure SetcheCta(Index: Integer; const Astring: string);
    function  cheCta_Specified(Index: Integer): boolean;
    procedure SetcheNum(Index: Integer; const Astring: string);
    function  cheNum_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodOpe(Index: Integer; const AInteger: Integer);
    function  codOpe_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodSac(Index: Integer; const ADouble: Double);
    function  codSac_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
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
    procedure SetnsuTef(Index: Integer; const Astring: string);
    function  nsuTef_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const AInteger: Integer);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const AInteger: Integer);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const AInteger: Integer);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const Astring: string);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
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
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property antDsc: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property catExt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatExt write SetcatExt stored catExt_Specified;
    property catTef: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatTef write SetcatTef stored catTef_Specified;
    property cheAge: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheAge write SetcheAge stored cheAge_Specified;
    property cheBan: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheBan write SetcheBan stored cheBan_Specified;
    property cheCta: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheCta write SetcheCta stored cheCta_Specified;
    property cheNum: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheNum write SetcheNum stored cheNum_Specified;
    property codBar: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCli: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codCrp: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codFil: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codFrj: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codMoe: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codNtg: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codOpe: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodOpe write SetcodOpe stored codOpe_Specified;
    property codPor: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codSac: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSac write SetcodSac stored codSac_Specified;
    property codTns: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
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
    property nsuTef: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnsuTef write SetnsuTef stored nsuTef_Specified;
    property numInt: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numPrj: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property outNeg: Double                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perDsc: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul: Integer                                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property prdDsc: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property rateio: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property seqCob: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property tipJrs: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property titBan: string                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
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
  // XML       : titulosSubstituirTitulosCRInTitulosBaixar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCRInTitulosBaixar = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FdatLib: string;
    FdatLib_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcr: string;
    FobsMcr_Specified: boolean;
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
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatLib(Index: Integer; const Astring: string);
    function  datLib_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcr(Index: Integer; const Astring: string);
    function  obsMcr_Specified(Index: Integer): boolean;
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
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datLib: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLib write SetdatLib stored datLib_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcr write SetobsMcr stored obsMcr_Specified;
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
  // XML       : titulosConsultarTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosCRIn = class(TRemotable)
  private
    FcodCli: string;
    FcodCli_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FfilNff: string;
    FfilNff_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FnumNff: string;
    FnumNff_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodCli(Index: Integer; const Astring: string);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const Astring: string);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const Astring: string);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codCli:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property dataBuild:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property filNff:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property numNff:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numTit:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosGravarTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosGravarTitulosCROutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosGravarTitulosCROutResultado: Array_Of_titulosGravarTitulosCROutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosGravarTitulosCROutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCRInTitulosRateios, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCRInTitulosRateios = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: string;
    FperCta_Specified: boolean;
    FperRat: string;
    FperRat_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const Astring: string);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const Astring: string);
    function  perRat_Specified(Index: Integer): boolean;
  published
    property codCcu: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property ctaFin: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numPrj: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCRInTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCRInTitulos = class(TRemotable)
  private
    FcatTef: string;
    FcatTef_Specified: boolean;
    FcheAge: string;
    FcheAge_Specified: boolean;
    FcheBan: string;
    FcheBan_Specified: boolean;
    FcheCta: string;
    FcheCta_Specified: boolean;
    FcheNum: string;
    FcheNum_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCli: string;
    FcodCli_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodRep: string;
    FcodRep_Specified: boolean;
    FcodSac: string;
    FcodSac_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcomRec: string;
    FcomRec_Specified: boolean;
    FcpgNeg: string;
    FcpgNeg_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
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
    FdscNeg: string;
    FdscNeg_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnsuTef: string;
    FnsuTef_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperCom: string;
    FperCom_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FproJrs: string;
    FproJrs_Specified: boolean;
    Frateios: Array_Of_titulosGravarTitulosCRInTitulosRateios;
    Frateios_Specified: boolean;
    FseqCob: string;
    FseqCob_Specified: boolean;
    FtaxNeg: string;
    FtaxNeg_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrBco: string;
    FvlrBco_Specified: boolean;
    FvlrCom: string;
    FvlrCom_Specified: boolean;
    FvlrDca: string;
    FvlrDca_Specified: boolean;
    FvlrDcb: string;
    FvlrDcb_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    FvlrOud: string;
    FvlrOud_Specified: boolean;
    procedure SetcatTef(Index: Integer; const Astring: string);
    function  catTef_Specified(Index: Integer): boolean;
    procedure SetcheAge(Index: Integer; const Astring: string);
    function  cheAge_Specified(Index: Integer): boolean;
    procedure SetcheBan(Index: Integer; const Astring: string);
    function  cheBan_Specified(Index: Integer): boolean;
    procedure SetcheCta(Index: Integer; const Astring: string);
    function  cheCta_Specified(Index: Integer): boolean;
    procedure SetcheNum(Index: Integer; const Astring: string);
    function  cheNum_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const Astring: string);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const Astring: string);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodSac(Index: Integer; const Astring: string);
    function  codSac_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcomRec(Index: Integer; const Astring: string);
    function  comRec_Specified(Index: Integer): boolean;
    procedure SetcpgNeg(Index: Integer; const Astring: string);
    function  cpgNeg_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
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
    procedure SetdscNeg(Index: Integer; const Astring: string);
    function  dscNeg_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnsuTef(Index: Integer; const Astring: string);
    function  nsuTef_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const Astring: string);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const Astring: string);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure Setrateios(Index: Integer; const AArray_Of_titulosGravarTitulosCRInTitulosRateios: Array_Of_titulosGravarTitulosCRInTitulosRateios);
    function  rateios_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const Astring: string);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SettaxNeg(Index: Integer; const Astring: string);
    function  taxNeg_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrBco(Index: Integer; const Astring: string);
    function  vlrBco_Specified(Index: Integer): boolean;
    procedure SetvlrCom(Index: Integer; const Astring: string);
    function  vlrCom_Specified(Index: Integer): boolean;
    procedure SetvlrDca(Index: Integer; const Astring: string);
    function  vlrDca_Specified(Index: Integer): boolean;
    procedure SetvlrDcb(Index: Integer; const Astring: string);
    function  vlrDcb_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
    procedure SetvlrOud(Index: Integer; const Astring: string);
    function  vlrOud_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property catTef:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatTef write SetcatTef stored catTef_Specified;
    property cheAge:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheAge write SetcheAge stored cheAge_Specified;
    property cheBan:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheBan write SetcheBan stored cheBan_Specified;
    property cheCta:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheCta write SetcheCta stored cheCta_Specified;
    property cheNum:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheNum write SetcheNum stored cheNum_Specified;
    property cnpjFilial: string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codCcu:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCli:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCrp:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codIn1:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMoe:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codRep:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codSac:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSac write SetcodSac stored codSac_Specified;
    property codTns:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property comRec:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcomRec write SetcomRec stored comRec_Specified;
    property cpgNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpgNeg write SetcpgNeg stored cpgNeg_Specified;
    property ctaFin:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datDsc:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property jrsDia:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property nsuTef:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnsuTef write SetnsuTef stored nsuTef_Specified;
    property numArb:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numPrj:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property outNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perCom:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDsc:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property proJrs:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property rateios:    Array_Of_titulosGravarTitulosCRInTitulosRateios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateios write Setrateios stored rateios_Specified;
    property seqCob:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property taxNeg:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtaxNeg write SettaxNeg stored taxNeg_Specified;
    property tipJrs:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property titBan:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property vctOri:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrBco:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBco write SetvlrBco stored vlrBco_Specified;
    property vlrCom:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCom write SetvlrCom stored vlrCom_Specified;
    property vlrDca:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDca write SetvlrDca stored vlrDca_Specified;
    property vlrDcb:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDcb write SetvlrDcb stored vlrDcb_Specified;
    property vlrDsc:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
    property vlrOud:     string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOud write SetvlrOud stored vlrOud_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCRInEntradaTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCRInEntradaTitulos = class(TRemotable)
  private
    FantDsc: string;
    FantDsc_Specified: boolean;
    FbanCar: string;
    FbanCar_Specified: boolean;
    FcatExt: string;
    FcatExt_Specified: boolean;
    FcatTef: string;
    FcatTef_Specified: boolean;
    FcheAge: string;
    FcheAge_Specified: boolean;
    FcheBan: string;
    FcheBan_Specified: boolean;
    FcheCta: string;
    FcheCta_Specified: boolean;
    FcheNum: string;
    FcheNum_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodOpe: Integer;
    FcodOpe_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodSac: Double;
    FcodSac_Specified: boolean;
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
    FjrsNeg: Double;
    FjrsNeg_Specified: boolean;
    FmulNeg: Double;
    FmulNeg_Specified: boolean;
    FnsuTef: string;
    FnsuTef_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FparCar: Integer;
    FparCar_Specified: boolean;
    FperDsc: Integer;
    FperDsc_Specified: boolean;
    FperJrs: Integer;
    FperJrs_Specified: boolean;
    FperMul: Integer;
    FperMul_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    Frateio: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio;
    Frateio_Specified: boolean;
    FseqCob: string;
    FseqCob_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
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
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetbanCar(Index: Integer; const Astring: string);
    function  banCar_Specified(Index: Integer): boolean;
    procedure SetcatExt(Index: Integer; const Astring: string);
    function  catExt_Specified(Index: Integer): boolean;
    procedure SetcatTef(Index: Integer; const Astring: string);
    function  catTef_Specified(Index: Integer): boolean;
    procedure SetcheAge(Index: Integer; const Astring: string);
    function  cheAge_Specified(Index: Integer): boolean;
    procedure SetcheBan(Index: Integer; const Astring: string);
    function  cheBan_Specified(Index: Integer): boolean;
    procedure SetcheCta(Index: Integer; const Astring: string);
    function  cheCta_Specified(Index: Integer): boolean;
    procedure SetcheNum(Index: Integer; const Astring: string);
    function  cheNum_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodOpe(Index: Integer; const AInteger: Integer);
    function  codOpe_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodSac(Index: Integer; const ADouble: Double);
    function  codSac_Specified(Index: Integer): boolean;
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
    procedure SetjrsNeg(Index: Integer; const ADouble: Double);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const ADouble: Double);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnsuTef(Index: Integer; const Astring: string);
    function  nsuTef_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetparCar(Index: Integer; const AInteger: Integer);
    function  parCar_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const AInteger: Integer);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const AInteger: Integer);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const AInteger: Integer);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const Astring: string);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
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
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property antDsc: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property banCar: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbanCar write SetbanCar stored banCar_Specified;
    property catExt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatExt write SetcatExt stored catExt_Specified;
    property catTef: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatTef write SetcatTef stored catTef_Specified;
    property cheAge: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheAge write SetcheAge stored cheAge_Specified;
    property cheBan: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheBan write SetcheBan stored cheBan_Specified;
    property cheCta: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheCta write SetcheCta stored cheCta_Specified;
    property cheNum: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheNum write SetcheNum stored cheNum_Specified;
    property codBar: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCcu: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCli: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codCrp: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codFil: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codFrj: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codMoe: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codNtg: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codOpe: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodOpe write SetcodOpe stored codOpe_Specified;
    property codPor: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codRep: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codSac: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSac write SetcodSac stored codSac_Specified;
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
    property jrsNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property nsuTef: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnsuTef write SetnsuTef stored nsuTef_Specified;
    property numPrj: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property outNeg: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property parCar: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FparCar write SetparCar stored parCar_Specified;
    property perDsc: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property prdDsc: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property rateio: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property seqCob: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property tipJrs: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property titBan: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul: Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property vctOri: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrDsc: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrJrs: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrOri: Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCRIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FentradaTitulos: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos;
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
    procedure SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCRInEntradaTitulos: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos);
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
    property entradaTitulos: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FentradaTitulos write SetentradaTitulos stored entradaTitulos_Specified;
    property flowInstanceID: string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property forCli:         string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforCli write SetforCli stored forCli_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCROutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCROutResultado = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  published
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGravarTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGravarTitulosCRIn = class(TRemotable)
  private
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Ftitulos: Array_Of_titulosGravarTitulosCRInTitulos;
    Ftitulos_Specified: boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosGravarTitulosCRInTitulos: Array_Of_titulosGravarTitulosCRInTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dataBuild:      string                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID: string                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulos:        Array_Of_titulosGravarTitulosCRInTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCRIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FsistemaIntegracao: string;
    FsistemaIntegracao_Specified: boolean;
    FtitulosReceber: Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber;
    FtitulosReceber_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetsistemaIntegracao(Index: Integer; const Astring: string);
    function  sistemaIntegracao_Specified(Index: Integer): boolean;
    procedure SettitulosReceber(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCRInTitulosReceber: Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber);
    function  titulosReceber_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID:    string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:          string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property sistemaIntegracao: string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsistemaIntegracao write SetsistemaIntegracao stored sistemaIntegracao_Specified;
    property titulosReceber:    Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosReceber write SettitulosReceber stored titulosReceber_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCROutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosCROutTitulos = class(TRemotable)
  private
    FcatTef: string;
    FcatTef_Specified: boolean;
    FcheAge: string;
    FcheAge_Specified: boolean;
    FcheBan: string;
    FcheBan_Specified: boolean;
    FcheCta: string;
    FcheCta_Specified: boolean;
    FcheNum: string;
    FcheNum_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCli: string;
    FcodCli_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: string;
    FcodNtg_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodRep: string;
    FcodRep_Specified: boolean;
    FcodSac: string;
    FcodSac_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcomRec: string;
    FcomRec_Specified: boolean;
    FcpgNeg: string;
    FcpgNeg_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
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
    FdscNeg: string;
    FdscNeg_Specified: boolean;
    FfilNff: string;
    FfilNff_Specified: boolean;
    FjrsDia: string;
    FjrsDia_Specified: boolean;
    FjrsNeg: string;
    FjrsNeg_Specified: boolean;
    FmulNeg: string;
    FmulNeg_Specified: boolean;
    FnsuTef: string;
    FnsuTef_Specified: boolean;
    FnumArb: string;
    FnumArb_Specified: boolean;
    FnumNff: string;
    FnumNff_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    FoutNeg: string;
    FoutNeg_Specified: boolean;
    FperCom: string;
    FperCom_Specified: boolean;
    FperDsc: string;
    FperDsc_Specified: boolean;
    FperJrs: string;
    FperJrs_Specified: boolean;
    FperMul: string;
    FperMul_Specified: boolean;
    FproJrs: string;
    FproJrs_Specified: boolean;
    FtaxNeg: string;
    FtaxNeg_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtolDsc: string;
    FtolDsc_Specified: boolean;
    FtolJrs: string;
    FtolJrs_Specified: boolean;
    FtolMul: string;
    FtolMul_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrBco: string;
    FvlrBco_Specified: boolean;
    FvlrCom: string;
    FvlrCom_Specified: boolean;
    FvlrDca: string;
    FvlrDca_Specified: boolean;
    FvlrDcb: string;
    FvlrDcb_Specified: boolean;
    FvlrDsc: string;
    FvlrDsc_Specified: boolean;
    FvlrOri: string;
    FvlrOri_Specified: boolean;
    FvlrOud: string;
    FvlrOud_Specified: boolean;
    procedure SetcatTef(Index: Integer; const Astring: string);
    function  catTef_Specified(Index: Integer): boolean;
    procedure SetcheAge(Index: Integer; const Astring: string);
    function  cheAge_Specified(Index: Integer): boolean;
    procedure SetcheBan(Index: Integer; const Astring: string);
    function  cheBan_Specified(Index: Integer): boolean;
    procedure SetcheCta(Index: Integer; const Astring: string);
    function  cheCta_Specified(Index: Integer): boolean;
    procedure SetcheNum(Index: Integer; const Astring: string);
    function  cheNum_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const Astring: string);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const Astring: string);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const Astring: string);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodSac(Index: Integer; const Astring: string);
    function  codSac_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcomRec(Index: Integer; const Astring: string);
    function  comRec_Specified(Index: Integer): boolean;
    procedure SetcpgNeg(Index: Integer; const Astring: string);
    function  cpgNeg_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
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
    procedure SetdscNeg(Index: Integer; const Astring: string);
    function  dscNeg_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const Astring: string);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const Astring: string);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const Astring: string);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const Astring: string);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnsuTef(Index: Integer; const Astring: string);
    function  nsuTef_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const Astring: string);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const Astring: string);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const Astring: string);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const Astring: string);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const Astring: string);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const Astring: string);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const Astring: string);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const Astring: string);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure SettaxNeg(Index: Integer; const Astring: string);
    function  taxNeg_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const Astring: string);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SettolJrs(Index: Integer; const Astring: string);
    function  tolJrs_Specified(Index: Integer): boolean;
    procedure SettolMul(Index: Integer; const Astring: string);
    function  tolMul_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrBco(Index: Integer; const Astring: string);
    function  vlrBco_Specified(Index: Integer): boolean;
    procedure SetvlrCom(Index: Integer; const Astring: string);
    function  vlrCom_Specified(Index: Integer): boolean;
    procedure SetvlrDca(Index: Integer; const Astring: string);
    function  vlrDca_Specified(Index: Integer): boolean;
    procedure SetvlrDcb(Index: Integer; const Astring: string);
    function  vlrDcb_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const Astring: string);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const Astring: string);
    function  vlrOri_Specified(Index: Integer): boolean;
    procedure SetvlrOud(Index: Integer; const Astring: string);
    function  vlrOud_Specified(Index: Integer): boolean;
  published
    property catTef:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatTef write SetcatTef stored catTef_Specified;
    property cheAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheAge write SetcheAge stored cheAge_Specified;
    property cheBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheBan write SetcheBan stored cheBan_Specified;
    property cheCta:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheCta write SetcheCta stored cheCta_Specified;
    property cheNum:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheNum write SetcheNum stored cheNum_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codCcu:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCli:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codIn1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMoe:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codPor:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codRep:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codSac:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSac write SetcodSac stored codSac_Specified;
    property codTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property comRec:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcomRec write SetcomRec stored comRec_Specified;
    property cpgNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpgNeg write SetcpgNeg stored cpgNeg_Specified;
    property ctaFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property filNff:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property jrsDia:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property nsuTef:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnsuTef write SetnsuTef stored nsuTef_Specified;
    property numArb:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numNff:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numPrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property outNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perCom:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property proJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property taxNeg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtaxNeg write SettaxNeg stored taxNeg_Specified;
    property tipJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property titBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property tolDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property vctOri:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrBco:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBco write SetvlrBco stored vlrBco_Specified;
    property vlrCom:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCom write SetvlrCom stored vlrCom_Specified;
    property vlrDca:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDca write SetvlrDca stored vlrDca_Specified;
    property vlrDcb:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDcb write SetvlrDcb stored vlrDcb_Specified;
    property vlrDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrOri:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
    property vlrOud:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOud write SetvlrOud stored vlrOud_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarTitulosCROutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosCROutTitulos: Array_Of_titulosConsultarTitulosCROutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarTitulosCROutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCROutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCROutRetorno = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property msgRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgRet write SetmsgRet stored msgRet_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property tipRet: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipRet write SettipRet stored tipRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretorno: Array_Of_titulosEstornoBaixaTitulosCROutRetorno;
    Fretorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCROutRetorno: Array_Of_titulosEstornoBaixaTitulosCROutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retorno:         Array_Of_titulosEstornoBaixaTitulosCROutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property tipoRetorno:     Integer                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCRInTitulosReceber, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCRInTitulosReceber = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExportarBaixaTitulosReceberVendaInConsulta, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExportarBaixaTitulosReceberVendaInConsulta = class(TRemotable)
  private
    FcodSnf: string;
    FcodSnf_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodSnf(Index: Integer; const Astring: string);
    function  codSnf_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codSnf: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSnf write SetcodSnf stored codSnf_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numNfv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCR2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCR2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretorno: Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno;
    Fretorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCR2OutRetorno: Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retorno:         Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property tipoRetorno:     Integer                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCR2InTitulosReceber, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCR2InTitulosReceber = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property empReq: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempReq write SetempReq stored empReq_Specified;
    property filReq: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilReq write SetfilReq stored filReq_Specified;
    property ideExt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCR2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCR2In = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FsistemaIntegracao: string;
    FsistemaIntegracao_Specified: boolean;
    FtitulosReceber: Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber;
    FtitulosReceber_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetsistemaIntegracao(Index: Integer; const Astring: string);
    function  sistemaIntegracao_Specified(Index: Integer): boolean;
    procedure SettitulosReceber(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber: Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber);
    function  titulosReceber_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID:    string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:          string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property sistemaIntegracao: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsistemaIntegracao write SetsistemaIntegracao stored sistemaIntegracao_Specified;
    property titulosReceber:    Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosReceber write SettitulosReceber stored titulosReceber_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCRInBaixaTituloReceber, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCRInBaixaTituloReceber = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcotMcr: string;
    FcotMcr_Specified: boolean;
    FdatCco: string;
    FdatCco_Specified: boolean;
    FdatLib: string;
    FdatLib_Specified: boolean;
    FdatMov: string;
    FdatMov_Specified: boolean;
    FdatPgt: string;
    FdatPgt_Specified: boolean;
    FdiaAtr: string;
    FdiaAtr_Specified: boolean;
    FdiaJrs: string;
    FdiaJrs_Specified: boolean;
    FempCco: string;
    FempCco_Specified: boolean;
    FfilRlc: string;
    FfilRlc_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FnumDoc: string;
    FnumDoc_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumRlc: string;
    FnumRlc_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Frateios: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios;
    Frateios_Specified: boolean;
    FseqCco: string;
    FseqCco_Specified: boolean;
    FseqMov: string;
    FseqMov_Specified: boolean;
    FseqRlc: string;
    FseqRlc_Specified: boolean;
    FtnsBxa: string;
    FtnsBxa_Specified: boolean;
    FtptRlc: string;
    FtptRlc_Specified: boolean;
    FvlrBco: string;
    FvlrBco_Specified: boolean;
    FvlrCom: string;
    FvlrCom_Specified: boolean;
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
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcotMcr(Index: Integer; const Astring: string);
    function  cotMcr_Specified(Index: Integer): boolean;
    procedure SetdatCco(Index: Integer; const Astring: string);
    function  datCco_Specified(Index: Integer): boolean;
    procedure SetdatLib(Index: Integer; const Astring: string);
    function  datLib_Specified(Index: Integer): boolean;
    procedure SetdatMov(Index: Integer; const Astring: string);
    function  datMov_Specified(Index: Integer): boolean;
    procedure SetdatPgt(Index: Integer; const Astring: string);
    function  datPgt_Specified(Index: Integer): boolean;
    procedure SetdiaAtr(Index: Integer; const Astring: string);
    function  diaAtr_Specified(Index: Integer): boolean;
    procedure SetdiaJrs(Index: Integer; const Astring: string);
    function  diaJrs_Specified(Index: Integer): boolean;
    procedure SetempCco(Index: Integer; const Astring: string);
    function  empCco_Specified(Index: Integer): boolean;
    procedure SetfilRlc(Index: Integer; const Astring: string);
    function  filRlc_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SetnumDoc(Index: Integer; const Astring: string);
    function  numDoc_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumRlc(Index: Integer; const Astring: string);
    function  numRlc_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setrateios(Index: Integer; const AArray_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios);
    function  rateios_Specified(Index: Integer): boolean;
    procedure SetseqCco(Index: Integer; const Astring: string);
    function  seqCco_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const Astring: string);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SetseqRlc(Index: Integer; const Astring: string);
    function  seqRlc_Specified(Index: Integer): boolean;
    procedure SettnsBxa(Index: Integer; const Astring: string);
    function  tnsBxa_Specified(Index: Integer): boolean;
    procedure SettptRlc(Index: Integer; const Astring: string);
    function  tptRlc_Specified(Index: Integer): boolean;
    procedure SetvlrBco(Index: Integer; const Astring: string);
    function  vlrBco_Specified(Index: Integer): boolean;
    procedure SetvlrCom(Index: Integer; const Astring: string);
    function  vlrCom_Specified(Index: Integer): boolean;
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
  public
    destructor Destroy; override;
  published
    property cnpjFilial: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTns:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cotMcr:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotMcr write SetcotMcr stored cotMcr_Specified;
    property datCco:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatCco write SetdatCco stored datCco_Specified;
    property datLib:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLib write SetdatLib stored datLib_Specified;
    property datMov:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatMov write SetdatMov stored datMov_Specified;
    property datPgt:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPgt write SetdatPgt stored datPgt_Specified;
    property diaAtr:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaAtr write SetdiaAtr stored diaAtr_Specified;
    property diaJrs:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaJrs write SetdiaJrs stored diaJrs_Specified;
    property empCco:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempCco write SetempCco stored empCco_Specified;
    property filRlc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilRlc write SetfilRlc stored filRlc_Specified;
    property numCco:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property numDoc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumDoc write SetnumDoc stored numDoc_Specified;
    property numPrj:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numRlc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRlc write SetnumRlc stored numRlc_Specified;
    property numTit:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property rateios:    Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateios write Setrateios stored rateios_Specified;
    property seqCco:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCco write SetseqCco stored seqCco_Specified;
    property seqMov:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property seqRlc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRlc write SetseqRlc stored seqRlc_Specified;
    property tnsBxa:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsBxa write SettnsBxa stored tnsBxa_Specified;
    property tptRlc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtptRlc write SettptRlc stored tptRlc_Specified;
    property vlrBco:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBco write SetvlrBco stored vlrBco_Specified;
    property vlrCom:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCom write SetvlrCom stored vlrCom_Specified;
    property vlrCor:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDsc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrLiq:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLiq write SetvlrLiq stored vlrLiq_Specified;
    property vlrMov:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMov write SetvlrMov stored vlrMov_Specified;
    property vlrMul:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde:     string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCRIn = class(TRemotable)
  private
    FbaixaTituloReceber: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber;
    FbaixaTituloReceber_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetbaixaTituloReceber(Index: Integer; const AArray_Of_titulosBaixarTitulosCRInBaixaTituloReceber: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber);
    function  baixaTituloReceber_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property baixaTituloReceber: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FbaixaTituloReceber write SetbaixaTituloReceber stored baixaTituloReceber_Specified;
    property dataBuild:          string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEstornoBaixaTitulosCR2OutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEstornoBaixaTitulosCR2OutRetorno = class(TRemotable)
  private
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
  // XML       : titulosConsultarTitulosAbertosCROutTitulosRateios, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCROutTitulosRateios = class(TRemotable)
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
  // XML       : titulosExportarBaixaTitulosReceberVendaOutErros, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExportarBaixaTitulosReceberVendaOutErros = class(TRemotable)
  private
    FmsgErr: string;
    FmsgErr_Specified: boolean;
    procedure SetmsgErr(Index: Integer; const Astring: string);
    function  msgErr_Specified(Index: Integer): boolean;
  published
    property msgErr: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgErr write SetmsgErr stored msgErr_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos = class(TRemotable)
  private
    FbxaCpt: string;
    FbxaCpt_Specified: boolean;
    FchvLot: string;
    FchvLot_Specified: boolean;
    FcjmAnt: string;
    FcjmAnt_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcotFrj: Double;
    FcotFrj_Specified: boolean;
    FcotMcr: Double;
    FcotMcr_Specified: boolean;
    FcrtAnt: string;
    FcrtAnt_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
    FdatCco: string;
    FdatCco_Specified: boolean;
    FdatGer: string;
    FdatGer_Specified: boolean;
    FdatLib: string;
    FdatLib_Specified: boolean;
    FdatMov: string;
    FdatMov_Specified: boolean;
    FdatPgt: string;
    FdatPgt_Specified: boolean;
    FdiaAtr: Integer;
    FdiaAtr_Specified: boolean;
    FdiaJrs: Integer;
    FdiaJrs_Specified: boolean;
    FempCco: Integer;
    FempCco_Specified: boolean;
    FfilFix: Integer;
    FfilFix_Specified: boolean;
    FfilOri: Integer;
    FfilOri_Specified: boolean;
    FfilRlc: Integer;
    FfilRlc_Specified: boolean;
    FforRlc: Integer;
    FforRlc_Specified: boolean;
    FhorGer: string;
    FhorGer_Specified: boolean;
    FindExp: Integer;
    FindExp_Specified: boolean;
    FindVcr: Integer;
    FindVcr_Specified: boolean;
    FintDif: Integer;
    FintDif_Specified: boolean;
    FintImp: Integer;
    FintImp_Specified: boolean;
    FjrsCal: Double;
    FjrsCal_Specified: boolean;
    FjrsPro: Integer;
    FjrsPro_Specified: boolean;
    FlctFin: Integer;
    FlctFin_Specified: boolean;
    FlotBai: Integer;
    FlotBai_Specified: boolean;
    FlotBfi: Integer;
    FlotBfi_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FnumDoc: string;
    FnumDoc_Specified: boolean;
    FnumFix: Integer;
    FnumFix_Specified: boolean;
    FnumLot: Integer;
    FnumLot_Specified: boolean;
    FnumPdv: Integer;
    FnumPdv_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumRlc: string;
    FnumRlc_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcr: string;
    FobsMcr_Specified: boolean;
    FperJrs: Double;
    FperJrs_Specified: boolean;
    FporAnt: string;
    FporAnt_Specified: boolean;
    FproJrs: Integer;
    FproJrs_Specified: boolean;
    FreaAnb: string;
    FreaAnb_Specified: boolean;
    FrecJoa: Integer;
    FrecJoa_Specified: boolean;
    FrecJod: Integer;
    FrecJod_Specified: boolean;
    FrecMoa: Integer;
    FrecMoa_Specified: boolean;
    FseqCco: Integer;
    FseqCco_Specified: boolean;
    FseqLba: Integer;
    FseqLba_Specified: boolean;
    FseqMcp: Integer;
    FseqMcp_Specified: boolean;
    FseqMov: Integer;
    FseqMov_Specified: boolean;
    FseqRlc: Integer;
    FseqRlc_Specified: boolean;
    FtipBai: string;
    FtipBai_Specified: boolean;
    FtipCof: Integer;
    FtipCof_Specified: boolean;
    FtptRlc: string;
    FtptRlc_Specified: boolean;
    FultPgt: string;
    FultPgt_Specified: boolean;
    FusuGer: Double;
    FusuGer_Specified: boolean;
    FvctPro: string;
    FvctPro_Specified: boolean;
    FvlrAbe: Double;
    FvlrAbe_Specified: boolean;
    FvlrBcl: Double;
    FvlrBcl_Specified: boolean;
    FvlrBco: Double;
    FvlrBco_Specified: boolean;
    FvlrBcr: Double;
    FvlrBcr_Specified: boolean;
    FvlrBct: Double;
    FvlrBct_Specified: boolean;
    FvlrBir: Double;
    FvlrBir_Specified: boolean;
    FvlrBor: Double;
    FvlrBor_Specified: boolean;
    FvlrBpr: Double;
    FvlrBpr_Specified: boolean;
    FvlrBpt: Double;
    FvlrBpt_Specified: boolean;
    FvlrCof: Double;
    FvlrCof_Specified: boolean;
    FvlrCom: Double;
    FvlrCom_Specified: boolean;
    FvlrCor: Double;
    FvlrCor_Specified: boolean;
    FvlrCrt: Double;
    FvlrCrt_Specified: boolean;
    FvlrCsl: Double;
    FvlrCsl_Specified: boolean;
    FvlrDsc: Double;
    FvlrDsc_Specified: boolean;
    FvlrEnc: Double;
    FvlrEnc_Specified: boolean;
    FvlrInt: Double;
    FvlrInt_Specified: boolean;
    FvlrIrf: Double;
    FvlrIrf_Specified: boolean;
    FvlrJrs: Double;
    FvlrJrs_Specified: boolean;
    FvlrLiq: Double;
    FvlrLiq_Specified: boolean;
    FvlrMov: Double;
    FvlrMov_Specified: boolean;
    FvlrMul: Double;
    FvlrMul_Specified: boolean;
    FvlrOac: Double;
    FvlrOac_Specified: boolean;
    FvlrOcl: Double;
    FvlrOcl_Specified: boolean;
    FvlrOct: Double;
    FvlrOct_Specified: boolean;
    FvlrOde: Double;
    FvlrOde_Specified: boolean;
    FvlrOir: Double;
    FvlrOir_Specified: boolean;
    FvlrOor: Double;
    FvlrOor_Specified: boolean;
    FvlrOpt: Double;
    FvlrOpt_Specified: boolean;
    FvlrOur: Double;
    FvlrOur_Specified: boolean;
    FvlrPis: Double;
    FvlrPis_Specified: boolean;
    FvlrPit: Double;
    FvlrPit_Specified: boolean;
    procedure SetbxaCpt(Index: Integer; const Astring: string);
    function  bxaCpt_Specified(Index: Integer): boolean;
    procedure SetchvLot(Index: Integer; const Astring: string);
    function  chvLot_Specified(Index: Integer): boolean;
    procedure SetcjmAnt(Index: Integer; const Astring: string);
    function  cjmAnt_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcotFrj(Index: Integer; const ADouble: Double);
    function  cotFrj_Specified(Index: Integer): boolean;
    procedure SetcotMcr(Index: Integer; const ADouble: Double);
    function  cotMcr_Specified(Index: Integer): boolean;
    procedure SetcrtAnt(Index: Integer; const Astring: string);
    function  crtAnt_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetdatCco(Index: Integer; const Astring: string);
    function  datCco_Specified(Index: Integer): boolean;
    procedure SetdatGer(Index: Integer; const Astring: string);
    function  datGer_Specified(Index: Integer): boolean;
    procedure SetdatLib(Index: Integer; const Astring: string);
    function  datLib_Specified(Index: Integer): boolean;
    procedure SetdatMov(Index: Integer; const Astring: string);
    function  datMov_Specified(Index: Integer): boolean;
    procedure SetdatPgt(Index: Integer; const Astring: string);
    function  datPgt_Specified(Index: Integer): boolean;
    procedure SetdiaAtr(Index: Integer; const AInteger: Integer);
    function  diaAtr_Specified(Index: Integer): boolean;
    procedure SetdiaJrs(Index: Integer; const AInteger: Integer);
    function  diaJrs_Specified(Index: Integer): boolean;
    procedure SetempCco(Index: Integer; const AInteger: Integer);
    function  empCco_Specified(Index: Integer): boolean;
    procedure SetfilFix(Index: Integer; const AInteger: Integer);
    function  filFix_Specified(Index: Integer): boolean;
    procedure SetfilOri(Index: Integer; const AInteger: Integer);
    function  filOri_Specified(Index: Integer): boolean;
    procedure SetfilRlc(Index: Integer; const AInteger: Integer);
    function  filRlc_Specified(Index: Integer): boolean;
    procedure SetforRlc(Index: Integer; const AInteger: Integer);
    function  forRlc_Specified(Index: Integer): boolean;
    procedure SethorGer(Index: Integer; const Astring: string);
    function  horGer_Specified(Index: Integer): boolean;
    procedure SetindExp(Index: Integer; const AInteger: Integer);
    function  indExp_Specified(Index: Integer): boolean;
    procedure SetindVcr(Index: Integer; const AInteger: Integer);
    function  indVcr_Specified(Index: Integer): boolean;
    procedure SetintDif(Index: Integer; const AInteger: Integer);
    function  intDif_Specified(Index: Integer): boolean;
    procedure SetintImp(Index: Integer; const AInteger: Integer);
    function  intImp_Specified(Index: Integer): boolean;
    procedure SetjrsCal(Index: Integer; const ADouble: Double);
    function  jrsCal_Specified(Index: Integer): boolean;
    procedure SetjrsPro(Index: Integer; const AInteger: Integer);
    function  jrsPro_Specified(Index: Integer): boolean;
    procedure SetlctFin(Index: Integer; const AInteger: Integer);
    function  lctFin_Specified(Index: Integer): boolean;
    procedure SetlotBai(Index: Integer; const AInteger: Integer);
    function  lotBai_Specified(Index: Integer): boolean;
    procedure SetlotBfi(Index: Integer; const AInteger: Integer);
    function  lotBfi_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SetnumDoc(Index: Integer; const Astring: string);
    function  numDoc_Specified(Index: Integer): boolean;
    procedure SetnumFix(Index: Integer; const AInteger: Integer);
    function  numFix_Specified(Index: Integer): boolean;
    procedure SetnumLot(Index: Integer; const AInteger: Integer);
    function  numLot_Specified(Index: Integer): boolean;
    procedure SetnumPdv(Index: Integer; const AInteger: Integer);
    function  numPdv_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumRlc(Index: Integer; const Astring: string);
    function  numRlc_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcr(Index: Integer; const Astring: string);
    function  obsMcr_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const ADouble: Double);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetporAnt(Index: Integer; const Astring: string);
    function  porAnt_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const AInteger: Integer);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure SetreaAnb(Index: Integer; const Astring: string);
    function  reaAnb_Specified(Index: Integer): boolean;
    procedure SetrecJoa(Index: Integer; const AInteger: Integer);
    function  recJoa_Specified(Index: Integer): boolean;
    procedure SetrecJod(Index: Integer; const AInteger: Integer);
    function  recJod_Specified(Index: Integer): boolean;
    procedure SetrecMoa(Index: Integer; const AInteger: Integer);
    function  recMoa_Specified(Index: Integer): boolean;
    procedure SetseqCco(Index: Integer; const AInteger: Integer);
    function  seqCco_Specified(Index: Integer): boolean;
    procedure SetseqLba(Index: Integer; const AInteger: Integer);
    function  seqLba_Specified(Index: Integer): boolean;
    procedure SetseqMcp(Index: Integer; const AInteger: Integer);
    function  seqMcp_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const AInteger: Integer);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SetseqRlc(Index: Integer; const AInteger: Integer);
    function  seqRlc_Specified(Index: Integer): boolean;
    procedure SettipBai(Index: Integer; const Astring: string);
    function  tipBai_Specified(Index: Integer): boolean;
    procedure SettipCof(Index: Integer; const AInteger: Integer);
    function  tipCof_Specified(Index: Integer): boolean;
    procedure SettptRlc(Index: Integer; const Astring: string);
    function  tptRlc_Specified(Index: Integer): boolean;
    procedure SetultPgt(Index: Integer; const Astring: string);
    function  ultPgt_Specified(Index: Integer): boolean;
    procedure SetusuGer(Index: Integer; const ADouble: Double);
    function  usuGer_Specified(Index: Integer): boolean;
    procedure SetvctPro(Index: Integer; const Astring: string);
    function  vctPro_Specified(Index: Integer): boolean;
    procedure SetvlrAbe(Index: Integer; const ADouble: Double);
    function  vlrAbe_Specified(Index: Integer): boolean;
    procedure SetvlrBcl(Index: Integer; const ADouble: Double);
    function  vlrBcl_Specified(Index: Integer): boolean;
    procedure SetvlrBco(Index: Integer; const ADouble: Double);
    function  vlrBco_Specified(Index: Integer): boolean;
    procedure SetvlrBcr(Index: Integer; const ADouble: Double);
    function  vlrBcr_Specified(Index: Integer): boolean;
    procedure SetvlrBct(Index: Integer; const ADouble: Double);
    function  vlrBct_Specified(Index: Integer): boolean;
    procedure SetvlrBir(Index: Integer; const ADouble: Double);
    function  vlrBir_Specified(Index: Integer): boolean;
    procedure SetvlrBor(Index: Integer; const ADouble: Double);
    function  vlrBor_Specified(Index: Integer): boolean;
    procedure SetvlrBpr(Index: Integer; const ADouble: Double);
    function  vlrBpr_Specified(Index: Integer): boolean;
    procedure SetvlrBpt(Index: Integer; const ADouble: Double);
    function  vlrBpt_Specified(Index: Integer): boolean;
    procedure SetvlrCof(Index: Integer; const ADouble: Double);
    function  vlrCof_Specified(Index: Integer): boolean;
    procedure SetvlrCom(Index: Integer; const ADouble: Double);
    function  vlrCom_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const ADouble: Double);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrCrt(Index: Integer; const ADouble: Double);
    function  vlrCrt_Specified(Index: Integer): boolean;
    procedure SetvlrCsl(Index: Integer; const ADouble: Double);
    function  vlrCsl_Specified(Index: Integer): boolean;
    procedure SetvlrDsc(Index: Integer; const ADouble: Double);
    function  vlrDsc_Specified(Index: Integer): boolean;
    procedure SetvlrEnc(Index: Integer; const ADouble: Double);
    function  vlrEnc_Specified(Index: Integer): boolean;
    procedure SetvlrInt(Index: Integer; const ADouble: Double);
    function  vlrInt_Specified(Index: Integer): boolean;
    procedure SetvlrIrf(Index: Integer; const ADouble: Double);
    function  vlrIrf_Specified(Index: Integer): boolean;
    procedure SetvlrJrs(Index: Integer; const ADouble: Double);
    function  vlrJrs_Specified(Index: Integer): boolean;
    procedure SetvlrLiq(Index: Integer; const ADouble: Double);
    function  vlrLiq_Specified(Index: Integer): boolean;
    procedure SetvlrMov(Index: Integer; const ADouble: Double);
    function  vlrMov_Specified(Index: Integer): boolean;
    procedure SetvlrMul(Index: Integer; const ADouble: Double);
    function  vlrMul_Specified(Index: Integer): boolean;
    procedure SetvlrOac(Index: Integer; const ADouble: Double);
    function  vlrOac_Specified(Index: Integer): boolean;
    procedure SetvlrOcl(Index: Integer; const ADouble: Double);
    function  vlrOcl_Specified(Index: Integer): boolean;
    procedure SetvlrOct(Index: Integer; const ADouble: Double);
    function  vlrOct_Specified(Index: Integer): boolean;
    procedure SetvlrOde(Index: Integer; const ADouble: Double);
    function  vlrOde_Specified(Index: Integer): boolean;
    procedure SetvlrOir(Index: Integer; const ADouble: Double);
    function  vlrOir_Specified(Index: Integer): boolean;
    procedure SetvlrOor(Index: Integer; const ADouble: Double);
    function  vlrOor_Specified(Index: Integer): boolean;
    procedure SetvlrOpt(Index: Integer; const ADouble: Double);
    function  vlrOpt_Specified(Index: Integer): boolean;
    procedure SetvlrOur(Index: Integer; const ADouble: Double);
    function  vlrOur_Specified(Index: Integer): boolean;
    procedure SetvlrPis(Index: Integer; const ADouble: Double);
    function  vlrPis_Specified(Index: Integer): boolean;
    procedure SetvlrPit(Index: Integer; const ADouble: Double);
    function  vlrPit_Specified(Index: Integer): boolean;
  published
    property bxaCpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbxaCpt write SetbxaCpt stored bxaCpt_Specified;
    property chvLot: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FchvLot write SetchvLot stored chvLot_Specified;
    property cjmAnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcjmAnt write SetcjmAnt stored cjmAnt_Specified;
    property codCcu: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCrt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codFrj: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codPor: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cotFrj: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotFrj write SetcotFrj stored cotFrj_Specified;
    property cotMcr: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotMcr write SetcotMcr stored cotMcr_Specified;
    property crtAnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcrtAnt write SetcrtAnt stored crtAnt_Specified;
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datCco: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatCco write SetdatCco stored datCco_Specified;
    property datGer: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatGer write SetdatGer stored datGer_Specified;
    property datLib: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLib write SetdatLib stored datLib_Specified;
    property datMov: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatMov write SetdatMov stored datMov_Specified;
    property datPgt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPgt write SetdatPgt stored datPgt_Specified;
    property diaAtr: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaAtr write SetdiaAtr stored diaAtr_Specified;
    property diaJrs: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaJrs write SetdiaJrs stored diaJrs_Specified;
    property empCco: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempCco write SetempCco stored empCco_Specified;
    property filFix: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilFix write SetfilFix stored filFix_Specified;
    property filOri: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilOri write SetfilOri stored filOri_Specified;
    property filRlc: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilRlc write SetfilRlc stored filRlc_Specified;
    property forRlc: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforRlc write SetforRlc stored forRlc_Specified;
    property horGer: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhorGer write SethorGer stored horGer_Specified;
    property indExp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindExp write SetindExp stored indExp_Specified;
    property indVcr: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindVcr write SetindVcr stored indVcr_Specified;
    property intDif: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintDif write SetintDif stored intDif_Specified;
    property intImp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintImp write SetintImp stored intImp_Specified;
    property jrsCal: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsCal write SetjrsCal stored jrsCal_Specified;
    property jrsPro: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsPro write SetjrsPro stored jrsPro_Specified;
    property lctFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlctFin write SetlctFin stored lctFin_Specified;
    property lotBai: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlotBai write SetlotBai stored lotBai_Specified;
    property lotBfi: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlotBfi write SetlotBfi stored lotBfi_Specified;
    property numCco: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property numDoc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumDoc write SetnumDoc stored numDoc_Specified;
    property numFix: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumFix write SetnumFix stored numFix_Specified;
    property numLot: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumLot write SetnumLot stored numLot_Specified;
    property numPdv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPdv write SetnumPdv stored numPdv_Specified;
    property numPrj: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numRlc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRlc write SetnumRlc stored numRlc_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcr write SetobsMcr stored obsMcr_Specified;
    property perJrs: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property porAnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporAnt write SetporAnt stored porAnt_Specified;
    property proJrs: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property reaAnb: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FreaAnb write SetreaAnb stored reaAnb_Specified;
    property recJoa: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJoa write SetrecJoa stored recJoa_Specified;
    property recJod: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJod write SetrecJod stored recJod_Specified;
    property recMoa: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecMoa write SetrecMoa stored recMoa_Specified;
    property seqCco: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCco write SetseqCco stored seqCco_Specified;
    property seqLba: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqLba write SetseqLba stored seqLba_Specified;
    property seqMcp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMcp write SetseqMcp stored seqMcp_Specified;
    property seqMov: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property seqRlc: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRlc write SetseqRlc stored seqRlc_Specified;
    property tipBai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipBai write SettipBai stored tipBai_Specified;
    property tipCof: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCof write SettipCof stored tipCof_Specified;
    property tptRlc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtptRlc write SettptRlc stored tptRlc_Specified;
    property ultPgt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FultPgt write SetultPgt stored ultPgt_Specified;
    property usuGer: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FusuGer write SetusuGer stored usuGer_Specified;
    property vctPro: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrAbe: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAbe write SetvlrAbe stored vlrAbe_Specified;
    property vlrBcl: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBcl write SetvlrBcl stored vlrBcl_Specified;
    property vlrBco: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBco write SetvlrBco stored vlrBco_Specified;
    property vlrBcr: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBcr write SetvlrBcr stored vlrBcr_Specified;
    property vlrBct: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBct write SetvlrBct stored vlrBct_Specified;
    property vlrBir: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBir write SetvlrBir stored vlrBir_Specified;
    property vlrBor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBor write SetvlrBor stored vlrBor_Specified;
    property vlrBpr: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBpr write SetvlrBpr stored vlrBpr_Specified;
    property vlrBpt: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBpt write SetvlrBpt stored vlrBpt_Specified;
    property vlrCof: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCof write SetvlrCof stored vlrCof_Specified;
    property vlrCom: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCom write SetvlrCom stored vlrCom_Specified;
    property vlrCor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrCrt: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCrt write SetvlrCrt stored vlrCrt_Specified;
    property vlrCsl: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCsl write SetvlrCsl stored vlrCsl_Specified;
    property vlrDsc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrInt: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrInt write SetvlrInt stored vlrInt_Specified;
    property vlrIrf: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrIrf write SetvlrIrf stored vlrIrf_Specified;
    property vlrJrs: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrLiq: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLiq write SetvlrLiq stored vlrLiq_Specified;
    property vlrMov: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMov write SetvlrMov stored vlrMov_Specified;
    property vlrMul: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOcl: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOcl write SetvlrOcl stored vlrOcl_Specified;
    property vlrOct: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOct write SetvlrOct stored vlrOct_Specified;
    property vlrOde: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
    property vlrOir: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOir write SetvlrOir stored vlrOir_Specified;
    property vlrOor: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOor write SetvlrOor stored vlrOor_Specified;
    property vlrOpt: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOpt write SetvlrOpt stored vlrOpt_Specified;
    property vlrOur: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOur write SetvlrOur stored vlrOur_Specified;
    property vlrPis: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPis write SetvlrPis stored vlrPis_Specified;
    property vlrPit: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPit write SetvlrPit stored vlrPit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExportarBaixaTitulosReceberVendaOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosExportarBaixaTitulosReceberVendaOut = class(TRemotable)
  private
    FbaixaTitulos: Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos;
    FbaixaTitulos_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Ferros: Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros;
    Ferros_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SetbaixaTitulos(Index: Integer; const AArray_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos: Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos);
    function  baixaTitulos_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Seterros(Index: Integer; const AArray_Of_titulosExportarBaixaTitulosReceberVendaOutErros: Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros);
    function  erros_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property baixaTitulos:    Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FbaixaTitulos write SetbaixaTitulos stored baixaTitulos_Specified;
    property erroExecucao:    string                                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property erros:           Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros         Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ferros write Seterros stored erros_Specified;
    property mensagemRetorno: string                                                           Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     Integer                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCROutTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCROutTitulos = class(TRemotable)
  private
    FcatTef: string;
    FcatTef_Specified: boolean;
    FcheAge: string;
    FcheAge_Specified: boolean;
    FcheBan: string;
    FcheBan_Specified: boolean;
    FcheCta: string;
    FcheCta_Specified: boolean;
    FcheNum: string;
    FcheNum_Specified: boolean;
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCrp: string;
    FcodCrp_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFpj: Integer;
    FcodFpj_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodMpt: string;
    FcodMpt_Specified: boolean;
    FcodNtg: Integer;
    FcodNtg_Specified: boolean;
    FcodOcr: string;
    FcodOcr_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodSac: Double;
    FcodSac_Specified: boolean;
    FcodSnf: string;
    FcodSnf_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcomRec: Double;
    FcomRec_Specified: boolean;
    FcotEmi: Double;
    FcotEmi_Specified: boolean;
    FcotFrj: Double;
    FcotFrj_Specified: boolean;
    FcpgNeg: string;
    FcpgNeg_Specified: boolean;
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
    FdupCre: string;
    FdupCre_Specified: boolean;
    FfilCtr: Integer;
    FfilCtr_Specified: boolean;
    FfilNfc: Integer;
    FfilNfc_Specified: boolean;
    FfilNff: Integer;
    FfilNff_Specified: boolean;
    FfilNfv: Integer;
    FfilNfv_Specified: boolean;
    FfilPed: Integer;
    FfilPed_Specified: boolean;
    FforNfc: Integer;
    FforNfc_Specified: boolean;
    FjrsDia: Double;
    FjrsDia_Specified: boolean;
    FjrsNeg: Double;
    FjrsNeg_Specified: boolean;
    FmulNeg: Double;
    FmulNeg_Specified: boolean;
    FnsuTef: string;
    FnsuTef_Specified: boolean;
    FnumArb: Integer;
    FnumArb_Specified: boolean;
    FnumCtr: Integer;
    FnumCtr_Specified: boolean;
    FnumNfc: Integer;
    FnumNfc_Specified: boolean;
    FnumNff: Integer;
    FnumNff_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumPed: Integer;
    FnumPed_Specified: boolean;
    FnumPrj: Integer;
    FnumPrj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    FoutNeg: Double;
    FoutNeg_Specified: boolean;
    FperCom: Double;
    FperCom_Specified: boolean;
    FperDsc: Double;
    FperDsc_Specified: boolean;
    FperJrs: Double;
    FperJrs_Specified: boolean;
    FperMul: Double;
    FperMul_Specified: boolean;
    FproJrs: string;
    FproJrs_Specified: boolean;
    Frateios: Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios;
    Frateios_Specified: boolean;
    FseqImo: Integer;
    FseqImo_Specified: boolean;
    FsitTit: string;
    FsitTit_Specified: boolean;
    FsnfNfc: string;
    FsnfNfc_Specified: boolean;
    FtaxNeg: Double;
    FtaxNeg_Specified: boolean;
    FtipJrs: string;
    FtipJrs_Specified: boolean;
    FtitBan: string;
    FtitBan_Specified: boolean;
    FtitEfe: string;
    FtitEfe_Specified: boolean;
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
    FvlrAbe: Double;
    FvlrAbe_Specified: boolean;
    FvlrBco: Double;
    FvlrBco_Specified: boolean;
    FvlrCom: Double;
    FvlrCom_Specified: boolean;
    FvlrCor: Double;
    FvlrCor_Specified: boolean;
    FvlrDca: Double;
    FvlrDca_Specified: boolean;
    FvlrDcb: Double;
    FvlrDcb_Specified: boolean;
    FvlrDes: Double;
    FvlrDes_Specified: boolean;
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
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    FvlrOud: Double;
    FvlrOud_Specified: boolean;
    procedure SetcatTef(Index: Integer; const Astring: string);
    function  catTef_Specified(Index: Integer): boolean;
    procedure SetcheAge(Index: Integer; const Astring: string);
    function  cheAge_Specified(Index: Integer): boolean;
    procedure SetcheBan(Index: Integer; const Astring: string);
    function  cheBan_Specified(Index: Integer): boolean;
    procedure SetcheCta(Index: Integer; const Astring: string);
    function  cheCta_Specified(Index: Integer): boolean;
    procedure SetcheNum(Index: Integer; const Astring: string);
    function  cheNum_Specified(Index: Integer): boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCrp(Index: Integer; const Astring: string);
    function  codCrp_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const AInteger: Integer);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodMpt(Index: Integer; const Astring: string);
    function  codMpt_Specified(Index: Integer): boolean;
    procedure SetcodNtg(Index: Integer; const AInteger: Integer);
    function  codNtg_Specified(Index: Integer): boolean;
    procedure SetcodOcr(Index: Integer; const Astring: string);
    function  codOcr_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodSac(Index: Integer; const ADouble: Double);
    function  codSac_Specified(Index: Integer): boolean;
    procedure SetcodSnf(Index: Integer; const Astring: string);
    function  codSnf_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcomRec(Index: Integer; const ADouble: Double);
    function  comRec_Specified(Index: Integer): boolean;
    procedure SetcotEmi(Index: Integer; const ADouble: Double);
    function  cotEmi_Specified(Index: Integer): boolean;
    procedure SetcotFrj(Index: Integer; const ADouble: Double);
    function  cotFrj_Specified(Index: Integer): boolean;
    procedure SetcpgNeg(Index: Integer; const Astring: string);
    function  cpgNeg_Specified(Index: Integer): boolean;
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
    procedure SetdupCre(Index: Integer; const Astring: string);
    function  dupCre_Specified(Index: Integer): boolean;
    procedure SetfilCtr(Index: Integer; const AInteger: Integer);
    function  filCtr_Specified(Index: Integer): boolean;
    procedure SetfilNfc(Index: Integer; const AInteger: Integer);
    function  filNfc_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const AInteger: Integer);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetfilNfv(Index: Integer; const AInteger: Integer);
    function  filNfv_Specified(Index: Integer): boolean;
    procedure SetfilPed(Index: Integer; const AInteger: Integer);
    function  filPed_Specified(Index: Integer): boolean;
    procedure SetforNfc(Index: Integer; const AInteger: Integer);
    function  forNfc_Specified(Index: Integer): boolean;
    procedure SetjrsDia(Index: Integer; const ADouble: Double);
    function  jrsDia_Specified(Index: Integer): boolean;
    procedure SetjrsNeg(Index: Integer; const ADouble: Double);
    function  jrsNeg_Specified(Index: Integer): boolean;
    procedure SetmulNeg(Index: Integer; const ADouble: Double);
    function  mulNeg_Specified(Index: Integer): boolean;
    procedure SetnsuTef(Index: Integer; const Astring: string);
    function  nsuTef_Specified(Index: Integer): boolean;
    procedure SetnumArb(Index: Integer; const AInteger: Integer);
    function  numArb_Specified(Index: Integer): boolean;
    procedure SetnumCtr(Index: Integer; const AInteger: Integer);
    function  numCtr_Specified(Index: Integer): boolean;
    procedure SetnumNfc(Index: Integer; const AInteger: Integer);
    function  numNfc_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const AInteger: Integer);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumPed(Index: Integer; const AInteger: Integer);
    function  numPed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const AInteger: Integer);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure SetoutNeg(Index: Integer; const ADouble: Double);
    function  outNeg_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const ADouble: Double);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const ADouble: Double);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const ADouble: Double);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure SetperMul(Index: Integer; const ADouble: Double);
    function  perMul_Specified(Index: Integer): boolean;
    procedure SetproJrs(Index: Integer; const Astring: string);
    function  proJrs_Specified(Index: Integer): boolean;
    procedure Setrateios(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCROutTitulosRateios: Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios);
    function  rateios_Specified(Index: Integer): boolean;
    procedure SetseqImo(Index: Integer; const AInteger: Integer);
    function  seqImo_Specified(Index: Integer): boolean;
    procedure SetsitTit(Index: Integer; const Astring: string);
    function  sitTit_Specified(Index: Integer): boolean;
    procedure SetsnfNfc(Index: Integer; const Astring: string);
    function  snfNfc_Specified(Index: Integer): boolean;
    procedure SettaxNeg(Index: Integer; const ADouble: Double);
    function  taxNeg_Specified(Index: Integer): boolean;
    procedure SettipJrs(Index: Integer; const Astring: string);
    function  tipJrs_Specified(Index: Integer): boolean;
    procedure SettitBan(Index: Integer; const Astring: string);
    function  titBan_Specified(Index: Integer): boolean;
    procedure SettitEfe(Index: Integer; const Astring: string);
    function  titEfe_Specified(Index: Integer): boolean;
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
    procedure SetvlrAbe(Index: Integer; const ADouble: Double);
    function  vlrAbe_Specified(Index: Integer): boolean;
    procedure SetvlrBco(Index: Integer; const ADouble: Double);
    function  vlrBco_Specified(Index: Integer): boolean;
    procedure SetvlrCom(Index: Integer; const ADouble: Double);
    function  vlrCom_Specified(Index: Integer): boolean;
    procedure SetvlrCor(Index: Integer; const ADouble: Double);
    function  vlrCor_Specified(Index: Integer): boolean;
    procedure SetvlrDca(Index: Integer; const ADouble: Double);
    function  vlrDca_Specified(Index: Integer): boolean;
    procedure SetvlrDcb(Index: Integer; const ADouble: Double);
    function  vlrDcb_Specified(Index: Integer): boolean;
    procedure SetvlrDes(Index: Integer; const ADouble: Double);
    function  vlrDes_Specified(Index: Integer): boolean;
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
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
    procedure SetvlrOud(Index: Integer; const ADouble: Double);
    function  vlrOud_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property catTef:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatTef write SetcatTef stored catTef_Specified;
    property cheAge:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheAge write SetcheAge stored cheAge_Specified;
    property cheBan:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheBan write SetcheBan stored cheBan_Specified;
    property cheCta:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheCta write SetcheCta stored cheCta_Specified;
    property cheNum:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcheNum write SetcheNum stored cheNum_Specified;
    property codCcu:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codCli:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCrp:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codFrj:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codIn1:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMoe:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codMpt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMpt write SetcodMpt stored codMpt_Specified;
    property codNtg:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNtg write SetcodNtg stored codNtg_Specified;
    property codOcr:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodOcr write SetcodOcr stored codOcr_Specified;
    property codPor:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codRep:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codSac:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSac write SetcodSac stored codSac_Specified;
    property codSnf:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSnf write SetcodSnf stored codSnf_Specified;
    property codTns:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property comRec:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcomRec write SetcomRec stored comRec_Specified;
    property cotEmi:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotEmi write SetcotEmi stored cotEmi_Specified;
    property cotFrj:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotFrj write SetcotFrj stored cotFrj_Specified;
    property cpgNeg:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpgNeg write SetcpgNeg stored cpgNeg_Specified;
    property ctaFin:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property datDsc:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatDsc write SetdatDsc stored datDsc_Specified;
    property datEmi:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datNeg:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNeg write SetdatNeg stored datNeg_Specified;
    property datPpt:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property dscNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscNeg write SetdscNeg stored dscNeg_Specified;
    property dupCre:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdupCre write SetdupCre stored dupCre_Specified;
    property filCtr:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCtr write SetfilCtr stored filCtr_Specified;
    property filNfc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfc write SetfilNfc stored filNfc_Specified;
    property filNff:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property filNfv:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfv write SetfilNfv stored filNfv_Specified;
    property filPed:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilPed write SetfilPed stored filPed_Specified;
    property forNfc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNfc write SetforNfc stored forNfc_Specified;
    property jrsDia:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsDia write SetjrsDia stored jrsDia_Specified;
    property jrsNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FjrsNeg write SetjrsNeg stored jrsNeg_Specified;
    property mulNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmulNeg write SetmulNeg stored mulNeg_Specified;
    property nsuTef:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnsuTef write SetnsuTef stored nsuTef_Specified;
    property numArb:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumArb write SetnumArb stored numArb_Specified;
    property numCtr:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCtr write SetnumCtr stored numCtr_Specified;
    property numNfc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfc write SetnumNfc stored numNfc_Specified;
    property numNff:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numNfv:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numPed:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPed write SetnumPed stored numPed_Specified;
    property numPrj:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numTit:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property outNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FoutNeg write SetoutNeg stored outNeg_Specified;
    property perCom:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDsc:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perJrs:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property perMul:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperMul write SetperMul stored perMul_Specified;
    property proJrs:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FproJrs write SetproJrs stored proJrs_Specified;
    property rateios: Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateios write Setrateios stored rateios_Specified;
    property seqImo:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqImo write SetseqImo stored seqImo_Specified;
    property sitTit:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitTit write SetsitTit stored sitTit_Specified;
    property snfNfc:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfc write SetsnfNfc stored snfNfc_Specified;
    property taxNeg:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtaxNeg write SettaxNeg stored taxNeg_Specified;
    property tipJrs:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipJrs write SettipJrs stored tipJrs_Specified;
    property titBan:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBan write SettitBan stored titBan_Specified;
    property titEfe:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitEfe write SettitEfe stored titEfe_Specified;
    property tolDsc:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property tolJrs:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolJrs write SettolJrs stored tolJrs_Specified;
    property tolMul:  Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolMul write SettolMul stored tolMul_Specified;
    property vctOri:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro:  string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrAbe:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAbe write SetvlrAbe stored vlrAbe_Specified;
    property vlrBco:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBco write SetvlrBco stored vlrBco_Specified;
    property vlrCom:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCom write SetvlrCom stored vlrCom_Specified;
    property vlrCor:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDca:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDca write SetvlrDca stored vlrDca_Specified;
    property vlrDcb:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDcb write SetvlrDcb stored vlrDcb_Specified;
    property vlrDes:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDes write SetvlrDes stored vlrDes_Specified;
    property vlrDsc:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrMul:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
    property vlrOri:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
    property vlrOud:  Double                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOud write SetvlrOud stored vlrOud_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    Ftitulos: Array_Of_titulosConsultarTitulosAbertosCROutTitulos;
    Ftitulos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCROutTitulos: Array_Of_titulosConsultarTitulosAbertosCROutTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tipoRetorno:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property titulos:         Array_Of_titulosConsultarTitulosAbertosCROutTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTitulosAbertosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTitulosAbertosCRIn = class(TRemotable)
  private
    FcodCli: string;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodSnf: string;
    FcodSnf_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FdatBas: string;
    FdatBas_Specified: boolean;
    FfilCtr: Integer;
    FfilCtr_Specified: boolean;
    FfilNfc: Integer;
    FfilNfc_Specified: boolean;
    FfilNff: Integer;
    FfilNff_Specified: boolean;
    FfilNfv: Integer;
    FfilNfv_Specified: boolean;
    FfilPed: Integer;
    FfilPed_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FforNfc: Integer;
    FforNfc_Specified: boolean;
    FindVrj: string;
    FindVrj_Specified: boolean;
    FnumCtr: Integer;
    FnumCtr_Specified: boolean;
    FnumNfc: Integer;
    FnumNfc_Specified: boolean;
    FnumNff: Integer;
    FnumNff_Specified: boolean;
    FnumNfv: Integer;
    FnumNfv_Specified: boolean;
    FnumPed: Integer;
    FnumPed_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FretRat: string;
    FretRat_Specified: boolean;
    FseqImo: Integer;
    FseqImo_Specified: boolean;
    FsnfNfc: string;
    FsnfNfc_Specified: boolean;
    FtipTit: string;
    FtipTit_Specified: boolean;
    FvctFim: string;
    FvctFim_Specified: boolean;
    FvctIni: string;
    FvctIni_Specified: boolean;
    procedure SetcodCli(Index: Integer; const Astring: string);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodSnf(Index: Integer; const Astring: string);
    function  codSnf_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetdatBas(Index: Integer; const Astring: string);
    function  datBas_Specified(Index: Integer): boolean;
    procedure SetfilCtr(Index: Integer; const AInteger: Integer);
    function  filCtr_Specified(Index: Integer): boolean;
    procedure SetfilNfc(Index: Integer; const AInteger: Integer);
    function  filNfc_Specified(Index: Integer): boolean;
    procedure SetfilNff(Index: Integer; const AInteger: Integer);
    function  filNff_Specified(Index: Integer): boolean;
    procedure SetfilNfv(Index: Integer; const AInteger: Integer);
    function  filNfv_Specified(Index: Integer): boolean;
    procedure SetfilPed(Index: Integer; const AInteger: Integer);
    function  filPed_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetforNfc(Index: Integer; const AInteger: Integer);
    function  forNfc_Specified(Index: Integer): boolean;
    procedure SetindVrj(Index: Integer; const Astring: string);
    function  indVrj_Specified(Index: Integer): boolean;
    procedure SetnumCtr(Index: Integer; const AInteger: Integer);
    function  numCtr_Specified(Index: Integer): boolean;
    procedure SetnumNfc(Index: Integer; const AInteger: Integer);
    function  numNfc_Specified(Index: Integer): boolean;
    procedure SetnumNff(Index: Integer; const AInteger: Integer);
    function  numNff_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const AInteger: Integer);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumPed(Index: Integer; const AInteger: Integer);
    function  numPed_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetretRat(Index: Integer; const Astring: string);
    function  retRat_Specified(Index: Integer): boolean;
    procedure SetseqImo(Index: Integer; const AInteger: Integer);
    function  seqImo_Specified(Index: Integer): boolean;
    procedure SetsnfNfc(Index: Integer; const Astring: string);
    function  snfNfc_Specified(Index: Integer): boolean;
    procedure SettipTit(Index: Integer; const Astring: string);
    function  tipTit_Specified(Index: Integer): boolean;
    procedure SetvctFim(Index: Integer; const Astring: string);
    function  vctFim_Specified(Index: Integer): boolean;
    procedure SetvctIni(Index: Integer; const Astring: string);
    function  vctIni_Specified(Index: Integer): boolean;
  published
    property codCli:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codSnf:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSnf write SetcodSnf stored codSnf_Specified;
    property codTpt:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property datBas:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatBas write SetdatBas stored datBas_Specified;
    property filCtr:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilCtr write SetfilCtr stored filCtr_Specified;
    property filNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfc write SetfilNfc stored filNfc_Specified;
    property filNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNff write SetfilNff stored filNff_Specified;
    property filNfv:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilNfv write SetfilNfv stored filNfv_Specified;
    property filPed:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilPed write SetfilPed stored filPed_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property forNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforNfc write SetforNfc stored forNfc_Specified;
    property indVrj:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindVrj write SetindVrj stored indVrj_Specified;
    property numCtr:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCtr write SetnumCtr stored numCtr_Specified;
    property numNfc:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfc write SetnumNfc stored numNfc_Specified;
    property numNff:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNff write SetnumNff stored numNff_Specified;
    property numNfv:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numPed:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPed write SetnumPed stored numPed_Specified;
    property numTit:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property retRat:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretRat write SetretRat stored retRat_Specified;
    property seqImo:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqImo write SetseqImo stored seqImo_Specified;
    property snfNfc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsnfNfc write SetsnfNfc stored snfNfc_Specified;
    property tipTit:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipTit write SettipTit stored tipTit_Specified;
    property vctFim:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctFim write SetvctFim stored vctFim_Specified;
    property vctIni:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctIni write SetvctIni stored vctIni_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCRInBaixaTituloReceberRateios, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCRInBaixaTituloReceberRateios = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: string;
    FperCta_Specified: boolean;
    FperRat: string;
    FperRat_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const Astring: string);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const Astring: string);
    function  perRat_Specified(Index: Integer): boolean;
  published
    property codCcu: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property ctaFin: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numPrj: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCROutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCROutResultado = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  published
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosBaixarTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosBaixarTitulosCROutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosBaixarTitulosCROutResultado: Array_Of_titulosBaixarTitulosCROutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosBaixarTitulosCROutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCRInTitulosSubstitutosRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCRInTitulosSubstitutosRateio = class(TRemotable)
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
  // XML       : titulosProcessarVariacaoCambialInTitulosACalcular, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarVariacaoCambialInTitulosACalcular = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
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
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property codEmp:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosSubstituirTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridResult: Array_Of_titulosSubstituirTitulosCROutGridResult;
    FgridResult_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    FtipMsg: string;
    FtipMsg_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridResult(Index: Integer; const AArray_Of_titulosSubstituirTitulosCROutGridResult: Array_Of_titulosSubstituirTitulosCROutGridResult);
    function  gridResult_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipMsg(Index: Integer; const Astring: string);
    function  tipMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridResult:   Array_Of_titulosSubstituirTitulosCROutGridResult  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridResult write SetgridResult stored gridResult_Specified;
    property resultado:    string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipMsg:       string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMsg write SettipMsg stored tipMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosCROutGridResult, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosCROutGridResult = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FtxtRet: string;
    FtxtRet_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettxtRet(Index: Integer; const Astring: string);
    function  txtRet_Specified(Index: Integer): boolean;
  published
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property txtRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtxtRet write SettxtRet stored txtRet_Specified;
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
  // XML       : titulosProcessarAVMInTitulosACalcular, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosProcessarAVMInTitulosACalcular = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
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
  // XML       : titulosGerarBaixaAproveitamentoCRInGridTitulosCRE, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCRInGridTitulosCRE = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
  // XML       : titulosGerarBaixaAproveitamentoCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridRetorno: Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno;
    FgridRetorno_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno: Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno);
    function  gridRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridRetorno:  Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridRetorno write SetgridRetorno stored gridRetorno_Specified;
    property resultado:    string                                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCROutGridRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCROutGridRetorno = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
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
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetmsgErr(Index: Integer; const Astring: string);
    function  msgErr_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property msgErr: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgErr write SetmsgErr stored msgErr_Specified;
    property numInt: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
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
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property codEmp:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCR2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosBaixarTitulosCR2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosBaixarTitulosCR2OutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosBaixarTitulosCR2OutResultado: Array_Of_titulosBaixarTitulosCR2OutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosBaixarTitulosCR2OutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCR2OutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCR2OutResultado = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    FseqMov: string;
    FseqMov_Specified: boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const Astring: string);
    function  seqMov_Specified(Index: Integer): boolean;
  published
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property seqMov:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExportarBaixaTitulosReceberVendaIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExportarBaixaTitulosReceberVendaIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    Fconsulta: Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta;
    Fconsulta_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FtipExp: string;
    FtipExp_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure Setconsulta(Index: Integer; const AArray_Of_titulosExportarBaixaTitulosReceberVendaInConsulta: Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta);
    function  consulta_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SettipExp(Index: Integer; const Astring: string);
    function  tipExp_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:         Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer                                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property consulta:       Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fconsulta write Setconsulta stored consulta_Specified;
    property flowInstanceID: string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property tipExp:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipExp write SettipExp stored tipExp_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCR2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCR2In = class(TRemotable)
  private
    FbaixaTituloReceber: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber;
    FbaixaTituloReceber_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetbaixaTituloReceber(Index: Integer; const AArray_Of_titulosBaixarTitulosCR2InBaixaTituloReceber: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber);
    function  baixaTituloReceber_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property baixaTituloReceber: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FbaixaTituloReceber write SetbaixaTituloReceber stored baixaTituloReceber_Specified;
    property dataBuild:          string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCR2InBaixaTituloReceber, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCR2InBaixaTituloReceber = class(TRemotable)
  private
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodFpg: string;
    FcodFpg_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcotMcr: string;
    FcotMcr_Specified: boolean;
    FdatCco: string;
    FdatCco_Specified: boolean;
    FdatLib: string;
    FdatLib_Specified: boolean;
    FdatMov: string;
    FdatMov_Specified: boolean;
    FdatPgt: string;
    FdatPgt_Specified: boolean;
    FdiaAtr: string;
    FdiaAtr_Specified: boolean;
    FdiaJrs: string;
    FdiaJrs_Specified: boolean;
    FempCco: string;
    FempCco_Specified: boolean;
    FfilRlc: string;
    FfilRlc_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FnumDoc: string;
    FnumDoc_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FnumRlc: string;
    FnumRlc_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Frateios: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios;
    Frateios_Specified: boolean;
    FseqCco: string;
    FseqCco_Specified: boolean;
    FseqMov: string;
    FseqMov_Specified: boolean;
    FseqRlc: string;
    FseqRlc_Specified: boolean;
    FtnsBxa: string;
    FtnsBxa_Specified: boolean;
    FtptRlc: string;
    FtptRlc_Specified: boolean;
    FvlrBco: string;
    FvlrBco_Specified: boolean;
    FvlrCom: string;
    FvlrCom_Specified: boolean;
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
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const Astring: string);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcotMcr(Index: Integer; const Astring: string);
    function  cotMcr_Specified(Index: Integer): boolean;
    procedure SetdatCco(Index: Integer; const Astring: string);
    function  datCco_Specified(Index: Integer): boolean;
    procedure SetdatLib(Index: Integer; const Astring: string);
    function  datLib_Specified(Index: Integer): boolean;
    procedure SetdatMov(Index: Integer; const Astring: string);
    function  datMov_Specified(Index: Integer): boolean;
    procedure SetdatPgt(Index: Integer; const Astring: string);
    function  datPgt_Specified(Index: Integer): boolean;
    procedure SetdiaAtr(Index: Integer; const Astring: string);
    function  diaAtr_Specified(Index: Integer): boolean;
    procedure SetdiaJrs(Index: Integer; const Astring: string);
    function  diaJrs_Specified(Index: Integer): boolean;
    procedure SetempCco(Index: Integer; const Astring: string);
    function  empCco_Specified(Index: Integer): boolean;
    procedure SetfilRlc(Index: Integer; const Astring: string);
    function  filRlc_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SetnumDoc(Index: Integer; const Astring: string);
    function  numDoc_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetnumRlc(Index: Integer; const Astring: string);
    function  numRlc_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setrateios(Index: Integer; const AArray_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios);
    function  rateios_Specified(Index: Integer): boolean;
    procedure SetseqCco(Index: Integer; const Astring: string);
    function  seqCco_Specified(Index: Integer): boolean;
    procedure SetseqMov(Index: Integer; const Astring: string);
    function  seqMov_Specified(Index: Integer): boolean;
    procedure SetseqRlc(Index: Integer; const Astring: string);
    function  seqRlc_Specified(Index: Integer): boolean;
    procedure SettnsBxa(Index: Integer; const Astring: string);
    function  tnsBxa_Specified(Index: Integer): boolean;
    procedure SettptRlc(Index: Integer; const Astring: string);
    function  tptRlc_Specified(Index: Integer): boolean;
    procedure SetvlrBco(Index: Integer; const Astring: string);
    function  vlrBco_Specified(Index: Integer): boolean;
    procedure SetvlrCom(Index: Integer; const Astring: string);
    function  vlrCom_Specified(Index: Integer): boolean;
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
  public
    destructor Destroy; override;
  published
    property cnpjFilial: string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codEmp:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFpj:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property codTns:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cotMcr:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcotMcr write SetcotMcr stored cotMcr_Specified;
    property datCco:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatCco write SetdatCco stored datCco_Specified;
    property datLib:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLib write SetdatLib stored datLib_Specified;
    property datMov:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatMov write SetdatMov stored datMov_Specified;
    property datPgt:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPgt write SetdatPgt stored datPgt_Specified;
    property diaAtr:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaAtr write SetdiaAtr stored diaAtr_Specified;
    property diaJrs:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaJrs write SetdiaJrs stored diaJrs_Specified;
    property empCco:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FempCco write SetempCco stored empCco_Specified;
    property filRlc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfilRlc write SetfilRlc stored filRlc_Specified;
    property numCco:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property numDoc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumDoc write SetnumDoc stored numDoc_Specified;
    property numPrj:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property numRlc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRlc write SetnumRlc stored numRlc_Specified;
    property numTit:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property rateios:    Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateios write Setrateios stored rateios_Specified;
    property seqCco:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCco write SetseqCco stored seqCco_Specified;
    property seqMov:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqMov write SetseqMov stored seqMov_Specified;
    property seqRlc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRlc write SetseqRlc stored seqRlc_Specified;
    property tnsBxa:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsBxa write SettnsBxa stored tnsBxa_Specified;
    property tptRlc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtptRlc write SettptRlc stored tptRlc_Specified;
    property vlrBco:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBco write SetvlrBco stored vlrBco_Specified;
    property vlrCom:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCom write SetvlrCom stored vlrCom_Specified;
    property vlrCor:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCor write SetvlrCor stored vlrCor_Specified;
    property vlrDsc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrDsc write SetvlrDsc stored vlrDsc_Specified;
    property vlrEnc:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrEnc write SetvlrEnc stored vlrEnc_Specified;
    property vlrJrs:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrJrs write SetvlrJrs stored vlrJrs_Specified;
    property vlrLiq:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLiq write SetvlrLiq stored vlrLiq_Specified;
    property vlrMov:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMov write SetvlrMov stored vlrMov_Specified;
    property vlrMul:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMul write SetvlrMul stored vlrMul_Specified;
    property vlrOac:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOac write SetvlrOac stored vlrOac_Specified;
    property vlrOde:     string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOde write SetvlrOde stored vlrOde_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosBaixarTitulosCR2InBaixaTituloReceberRateios, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosBaixarTitulosCR2InBaixaTituloReceberRateios = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFpj: string;
    FcodFpj_Specified: boolean;
    FctaFin: string;
    FctaFin_Specified: boolean;
    FctaRed: string;
    FctaRed_Specified: boolean;
    FnumPrj: string;
    FnumPrj_Specified: boolean;
    FobsRat: string;
    FobsRat_Specified: boolean;
    FperCta: string;
    FperCta_Specified: boolean;
    FperRat: string;
    FperRat_Specified: boolean;
    procedure SetcodCcu(Index: Integer; const Astring: string);
    function  codCcu_Specified(Index: Integer): boolean;
    procedure SetcodFpj(Index: Integer; const Astring: string);
    function  codFpj_Specified(Index: Integer): boolean;
    procedure SetctaFin(Index: Integer; const Astring: string);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const Astring: string);
    function  ctaRed_Specified(Index: Integer): boolean;
    procedure SetnumPrj(Index: Integer; const Astring: string);
    function  numPrj_Specified(Index: Integer): boolean;
    procedure SetobsRat(Index: Integer; const Astring: string);
    function  obsRat_Specified(Index: Integer): boolean;
    procedure SetperCta(Index: Integer; const Astring: string);
    function  perCta_Specified(Index: Integer): boolean;
    procedure SetperRat(Index: Integer; const Astring: string);
    function  perRat_Specified(Index: Integer): boolean;
  published
    property codCcu: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCcu write SetcodCcu stored codCcu_Specified;
    property codFpj: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpj write SetcodFpj stored codFpj_Specified;
    property ctaFin: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property numPrj: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrj write SetnumPrj stored numPrj_Specified;
    property obsRat: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCRInGridTitulosBAI, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCRInGridTitulosBAI = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
  // XML       : titulosExcluirTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExcluirTitulosCRIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Ftitulos: Array_Of_titulosExcluirTitulosCRInTitulos;
    Ftitulos_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Settitulos(Index: Integer; const AArray_Of_titulosExcluirTitulosCRInTitulos: Array_Of_titulosExcluirTitulosCRInTitulos);
    function  titulos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID: string                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulos:        Array_Of_titulosExcluirTitulosCRInTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Ftitulos write Settitulos stored titulos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCRInTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExcluirTitulosCRInTitulos = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosExcluirTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fresultado: Array_Of_titulosExcluirTitulosCROutResultado;
    Fresultado_Specified: boolean;
    FtipoRetorno: string;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const AArray_Of_titulosExcluirTitulosCROutResultado: Array_Of_titulosExcluirTitulosCROutResultado);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const Astring: string);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property resultado:       Array_Of_titulosExcluirTitulosCROutResultado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipoRetorno:     string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCRInEntradaTitulosRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCRInEntradaTitulosRateio = class(TRemotable)
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
  // XML       : titulosEntradaTitulosLoteCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEntradaTitulosLoteCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridResult: Array_Of_titulosEntradaTitulosLoteCROutGridResult;
    FgridResult_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridResult(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCROutGridResult: Array_Of_titulosEntradaTitulosLoteCROutGridResult);
    function  gridResult_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridResult:   Array_Of_titulosEntradaTitulosLoteCROutGridResult  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridResult write SetgridResult stored gridResult_Specified;
    property resultado:    string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosLoteCROutGridResult, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosLoteCROutGridResult = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FtxtRet: string;
    FtxtRet_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettxtRet(Index: Integer; const Astring: string);
    function  txtRet_Specified(Index: Integer): boolean;
  published
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property txtRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtxtRet write SettxtRet stored txtRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosExcluirTitulosCROutResultado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosExcluirTitulosCROutResultado = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
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
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  published
    property codEmp:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:    string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property resultado: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridRetorno: Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno;
    FgridRetorno_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    FtipMsg: string;
    FtipMsg_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCROutGridRetorno: Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno);
    function  gridRetorno_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SettipMsg(Index: Integer; const Astring: string);
    function  tipMsg_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridRetorno:  Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridRetorno write SetgridRetorno stored gridRetorno_Specified;
    property resultado:    string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property tipMsg:       string                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMsg write SettipMsg stored tipMsg_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCROutGridRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCROutGridRetorno = class(TRemotable)
  private
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
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
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetmsgErr(Index: Integer; const Astring: string);
    function  msgErr_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property msgErr: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmsgErr write SetmsgErr stored msgErr_Specified;
    property numInt: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaAproveitamentoCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaAproveitamentoCRIn = class(TRemotable)
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
    FgridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI;
    FgridTitulosBAI_Specified: boolean;
    FgridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE;
    FgridTitulosCRE_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
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
    procedure SetgridTitulosBAI(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI);
    function  gridTitulosBAI_Specified(Index: Integer): boolean;
    procedure SetgridTitulosCRE(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE);
    function  gridTitulosCRE_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
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
    property gridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTitulosBAI write SetgridTitulosBAI stored gridTitulosBAI_Specified;
    property gridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTitulosCRE write SetgridTitulosCRE stored gridTitulosCRE_Specified;
    property idtReq:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
    property tnsCre:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsCre write SettnsCre stored tnsCre_Specified;
    property tnsDup:         string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsDup write SettnsDup stored tnsDup_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCRIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodEqu: Integer;
    FcodEqu_Specified: boolean;
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
    FgridTesouraria: Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria;
    FgridTesouraria_Specified: boolean;
    FgridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar;
    FgridTitulosBaixar_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FnumCco: string;
    FnumCco_Specified: boolean;
    FnumDoc: string;
    FnumDoc_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    FtnsBai: string;
    FtnsBai_Specified: boolean;
    FtnsCxb: string;
    FtnsCxb_Specified: boolean;
    FvlrLiq: Double;
    FvlrLiq_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodEqu(Index: Integer; const AInteger: Integer);
    function  codEqu_Specified(Index: Integer): boolean;
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
    procedure SetgridTesouraria(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCRInGridTesouraria: Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria);
    function  gridTesouraria_Specified(Index: Integer): boolean;
    procedure SetgridTitulosBaixar(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar);
    function  gridTitulosBaixar_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetnumCco(Index: Integer; const Astring: string);
    function  numCco_Specified(Index: Integer): boolean;
    procedure SetnumDoc(Index: Integer; const Astring: string);
    function  numDoc_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
    procedure SettnsBai(Index: Integer; const Astring: string);
    function  tnsBai_Specified(Index: Integer): boolean;
    procedure SettnsCxb(Index: Integer; const Astring: string);
    function  tnsCxb_Specified(Index: Integer): boolean;
    procedure SetvlrLiq(Index: Integer; const ADouble: Double);
    function  vlrLiq_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:            Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codEqu:            Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEqu write SetcodEqu stored codEqu_Specified;
    property codFil:            Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property datBai:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatBai write SetdatBai stored datBai_Specified;
    property datCxb:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatCxb write SetdatCxb stored datCxb_Specified;
    property flowInstanceID:    string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:          string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property gridTesouraria:    Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria     Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTesouraria write SetgridTesouraria stored gridTesouraria_Specified;
    property gridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridTitulosBaixar write SetgridTitulosBaixar stored gridTitulosBaixar_Specified;
    property idtReq:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property numCco:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumCco write SetnumCco stored numCco_Specified;
    property numDoc:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumDoc write SetnumDoc stored numDoc_Specified;
    property sigInt:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
    property tnsBai:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsBai write SettnsBai stored tnsBai_Specified;
    property tnsCxb:            string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtnsCxb write SettnsCxb stored tnsCxb_Specified;
    property vlrLiq:            Double                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLiq write SetvlrLiq stored vlrLiq_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCRInGridTesouraria, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCRInGridTesouraria = class(TRemotable)
  private
    FcodTns: string;
    FcodTns_Specified: boolean;
    FdatCtb: string;
    FdatCtb_Specified: boolean;
    FdatLib: string;
    FdatLib_Specified: boolean;
    FvlrMov: Double;
    FvlrMov_Specified: boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetdatCtb(Index: Integer; const Astring: string);
    function  datCtb_Specified(Index: Integer): boolean;
    procedure SetdatLib(Index: Integer; const Astring: string);
    function  datLib_Specified(Index: Integer): boolean;
    procedure SetvlrMov(Index: Integer; const ADouble: Double);
    function  vlrMov_Specified(Index: Integer): boolean;
  published
    property codTns: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property datCtb: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatCtb write SetdatCtb stored datCtb_Specified;
    property datLib: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLib write SetdatLib stored datLib_Specified;
    property vlrMov: Double  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrMov write SetvlrMov stored vlrMov_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosGerarBaixaPorLoteCRInGridTitulosBaixar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosGerarBaixaPorLoteCRInGridTitulosBaixar = class(TRemotable)
  private
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumInt: string;
    FnumInt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcr: string;
    FobsMcr_Specified: boolean;
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
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumInt(Index: Integer; const Astring: string);
    function  numInt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcr(Index: Integer; const Astring: string);
    function  obsMcr_Specified(Index: Integer): boolean;
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
    property codFpg: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numInt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumInt write SetnumInt stored numInt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcr: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcr write SetobsMcr stored obsMcr_Specified;
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
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Synccom_senior_g5_co_mfi_cre_titulosPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Synccom_senior_g5_co_mfi_cre_titulosPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos
  // ************************************************************************ //
  sapiens_Synccom_senior_g5_co_mfi_cre_titulos = interface(IInvokable)
  ['{4C6BE89C-C8CC-6DD0-D3D7-C89E2FE9FA01}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTitulosCRIn): titulosConsultarTitulosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTitulosAbertosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTitulosAbertosCRIn): titulosConsultarTitulosAbertosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosGravarTitulosCRIn): titulosGravarTitulosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EntradaTitulosLoteCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosEntradaTitulosLoteCRIn): titulosEntradaTitulosLoteCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  BaixarTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosBaixarTitulosCRIn): titulosBaixarTitulosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  BaixarTitulosCR_2(const user: string; const password: string; const encryption: Integer; const parameters: titulosBaixarTitulosCR2In): titulosBaixarTitulosCR2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ExcluirTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosExcluirTitulosCRIn): titulosExcluirTitulosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  SubstituirTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosSubstituirTitulosCRIn): titulosSubstituirTitulosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GerarBaixaAproveitamentoCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosGerarBaixaAproveitamentoCRIn): titulosGerarBaixaAproveitamentoCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GerarBaixaPorLoteCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosGerarBaixaPorLoteCRIn): titulosGerarBaixaPorLoteCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EstornoBaixaTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosEstornoBaixaTitulosCRIn): titulosEstornoBaixaTitulosCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EstornoBaixaTitulosCR_2(const user: string; const password: string; const encryption: Integer; const parameters: titulosEstornoBaixaTitulosCR2In): titulosEstornoBaixaTitulosCR2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ExportarBaixaTitulosReceberVenda(const user: string; const password: string; const encryption: Integer; const parameters: titulosExportarBaixaTitulosReceberVendaIn): titulosExportarBaixaTitulosReceberVendaOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ProcessarVariacaoCambial(const user: string; const password: string; const encryption: Integer; const parameters: titulosProcessarVariacaoCambialIn): titulosProcessarVariacaoCambialOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ProcessarAVM(const user: string; const password: string; const encryption: Integer; const parameters: titulosProcessarAVMIn): titulosProcessarAVMOut; stdcall;
  end;

function Getsapiens_Synccom_senior_g5_co_mfi_cre_titulos(producao : boolean; UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Synccom_senior_g5_co_mfi_cre_titulos;


implementation
  uses System.SysUtils;

function Getsapiens_Synccom_senior_g5_co_mfi_cre_titulos(producao : boolean; UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Synccom_senior_g5_co_mfi_cre_titulos;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos';
  defWSDL_hmlg = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos?wsdl';
  defURL_hmlg  = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_mfi_cre_titulos';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Synccom_senior_g5_co_mfi_cre_titulosPort';
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
    Result := (RIO as sapiens_Synccom_senior_g5_co_mfi_cre_titulos);
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


destructor titulosSubstituirTitulosCRIn.Destroy;
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

procedure titulosSubstituirTitulosCRIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosSubstituirTitulosCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosSubstituirTitulosCRIn.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosSubstituirTitulosCRIn.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosSubstituirTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosSubstituirTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetforCli(Index: Integer; const Astring: string);
begin
  FforCli := Astring;
  FforCli_Specified := True;
end;

function titulosSubstituirTitulosCRIn.forCli_Specified(Index: Integer): boolean;
begin
  Result := FforCli_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function titulosSubstituirTitulosCRIn.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function titulosSubstituirTitulosCRIn.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SettitulosBaixar(Index: Integer; const AArray_Of_titulosSubstituirTitulosCRInTitulosBaixar: Array_Of_titulosSubstituirTitulosCRInTitulosBaixar);
begin
  FtitulosBaixar := AArray_Of_titulosSubstituirTitulosCRInTitulosBaixar;
  FtitulosBaixar_Specified := True;
end;

function titulosSubstituirTitulosCRIn.titulosBaixar_Specified(Index: Integer): boolean;
begin
  Result := FtitulosBaixar_Specified;
end;

procedure titulosSubstituirTitulosCRIn.SettitulosSubstitutos(Index: Integer; const AArray_Of_titulosSubstituirTitulosCRInTitulosSubstitutos: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos);
begin
  FtitulosSubstitutos := AArray_Of_titulosSubstituirTitulosCRInTitulosSubstitutos;
  FtitulosSubstitutos_Specified := True;
end;

function titulosSubstituirTitulosCRIn.titulosSubstitutos_Specified(Index: Integer): boolean;
begin
  Result := FtitulosSubstitutos_Specified;
end;

destructor titulosSubstituirTitulosCRInTitulosSubstitutos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcatExt(Index: Integer; const Astring: string);
begin
  FcatExt := Astring;
  FcatExt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.catExt_Specified(Index: Integer): boolean;
begin
  Result := FcatExt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcatTef(Index: Integer; const Astring: string);
begin
  FcatTef := Astring;
  FcatTef_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.catTef_Specified(Index: Integer): boolean;
begin
  Result := FcatTef_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcheAge(Index: Integer; const Astring: string);
begin
  FcheAge := Astring;
  FcheAge_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.cheAge_Specified(Index: Integer): boolean;
begin
  Result := FcheAge_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcheBan(Index: Integer; const Astring: string);
begin
  FcheBan := Astring;
  FcheBan_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.cheBan_Specified(Index: Integer): boolean;
begin
  Result := FcheBan_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcheCta(Index: Integer; const Astring: string);
begin
  FcheCta := Astring;
  FcheCta_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.cheCta_Specified(Index: Integer): boolean;
begin
  Result := FcheCta_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcheNum(Index: Integer; const Astring: string);
begin
  FcheNum := Astring;
  FcheNum_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.cheNum_Specified(Index: Integer): boolean;
begin
  Result := FcheNum_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodOpe(Index: Integer; const AInteger: Integer);
begin
  FcodOpe := AInteger;
  FcodOpe_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codOpe_Specified(Index: Integer): boolean;
begin
  Result := FcodOpe_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodSac(Index: Integer; const ADouble: Double);
begin
  FcodSac := ADouble;
  FcodSac_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codSac_Specified(Index: Integer): boolean;
begin
  Result := FcodSac_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetcotNeg(Index: Integer; const ADouble: Double);
begin
  FcotNeg := ADouble;
  FcotNeg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.cotNeg_Specified(Index: Integer): boolean;
begin
  Result := FcotNeg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetnsuTef(Index: Integer; const Astring: string);
begin
  FnsuTef := Astring;
  FnsuTef_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.nsuTef_Specified(Index: Integer): boolean;
begin
  Result := FnsuTef_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetperDsc(Index: Integer; const AInteger: Integer);
begin
  FperDsc := AInteger;
  FperDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetperJrs(Index: Integer; const AInteger: Integer);
begin
  FperJrs := AInteger;
  FperJrs_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetperMul(Index: Integer; const AInteger: Integer);
begin
  FperMul := AInteger;
  FperMul_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.Setrateio(Index: Integer; const AArray_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio: Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio);
begin
  Frateio := AArray_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio;
  Frateio_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetseqCob(Index: Integer; const Astring: string);
begin
  FseqCob := Astring;
  FseqCob_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetdatLib(Index: Integer; const Astring: string);
begin
  FdatLib := Astring;
  FdatLib_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.datLib_Specified(Index: Integer): boolean;
begin
  Result := FdatLib_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetobsMcr(Index: Integer; const Astring: string);
begin
  FobsMcr := Astring;
  FobsMcr_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.obsMcr_Specified(Index: Integer): boolean;
begin
  Result := FobsMcr_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosBaixar.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosBaixar.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetcodCli(Index: Integer; const Astring: string);
begin
  FcodCli := Astring;
  FcodCli_Specified := True;
end;

function titulosConsultarTitulosCRIn.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosCRIn.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosConsultarTitulosCRIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetfilNff(Index: Integer; const Astring: string);
begin
  FfilNff := Astring;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosCRIn.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetnumNff(Index: Integer; const Astring: string);
begin
  FnumNff := Astring;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosCRIn.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosCRIn.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosCRIn.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosGravarTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosGravarTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosGravarTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosGravarTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosGravarTitulosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosGravarTitulosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosGravarTitulosCROut.Setresultado(Index: Integer; const AArray_Of_titulosGravarTitulosCROutResultado: Array_Of_titulosGravarTitulosCROutResultado);
begin
  Fresultado := AArray_Of_titulosGravarTitulosCROutResultado;
  Fresultado_Specified := True;
end;

function titulosGravarTitulosCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosGravarTitulosCROut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosGravarTitulosCROut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetperCta(Index: Integer; const Astring: string);
begin
  FperCta := Astring;
  FperCta_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosGravarTitulosCRInTitulosRateios.SetperRat(Index: Integer; const Astring: string);
begin
  FperRat := Astring;
  FperRat_Specified := True;
end;

function titulosGravarTitulosCRInTitulosRateios.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

destructor titulosGravarTitulosCRInTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateios)-1 do
    System.SysUtils.FreeAndNil(Frateios[I]);
  System.SetLength(Frateios, 0);
  inherited Destroy;
end;

procedure titulosGravarTitulosCRInTitulos.SetcatTef(Index: Integer; const Astring: string);
begin
  FcatTef := Astring;
  FcatTef_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.catTef_Specified(Index: Integer): boolean;
begin
  Result := FcatTef_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcheAge(Index: Integer; const Astring: string);
begin
  FcheAge := Astring;
  FcheAge_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.cheAge_Specified(Index: Integer): boolean;
begin
  Result := FcheAge_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcheBan(Index: Integer; const Astring: string);
begin
  FcheBan := Astring;
  FcheBan_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.cheBan_Specified(Index: Integer): boolean;
begin
  Result := FcheBan_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcheCta(Index: Integer; const Astring: string);
begin
  FcheCta := Astring;
  FcheCta_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.cheCta_Specified(Index: Integer): boolean;
begin
  Result := FcheCta_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcheNum(Index: Integer; const Astring: string);
begin
  FcheNum := Astring;
  FcheNum_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.cheNum_Specified(Index: Integer): boolean;
begin
  Result := FcheNum_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodCli(Index: Integer; const Astring: string);
begin
  FcodCli := Astring;
  FcodCli_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodRep(Index: Integer; const Astring: string);
begin
  FcodRep := Astring;
  FcodRep_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodSac(Index: Integer; const Astring: string);
begin
  FcodSac := Astring;
  FcodSac_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codSac_Specified(Index: Integer): boolean;
begin
  Result := FcodSac_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcomRec(Index: Integer; const Astring: string);
begin
  FcomRec := Astring;
  FcomRec_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.comRec_Specified(Index: Integer): boolean;
begin
  Result := FcomRec_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetcpgNeg(Index: Integer; const Astring: string);
begin
  FcpgNeg := Astring;
  FcpgNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.cpgNeg_Specified(Index: Integer): boolean;
begin
  Result := FcpgNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetdscNeg(Index: Integer; const Astring: string);
begin
  FdscNeg := Astring;
  FdscNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetnsuTef(Index: Integer; const Astring: string);
begin
  FnsuTef := Astring;
  FnsuTef_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.nsuTef_Specified(Index: Integer): boolean;
begin
  Result := FnsuTef_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetperCom(Index: Integer; const Astring: string);
begin
  FperCom := Astring;
  FperCom_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetproJrs(Index: Integer; const Astring: string);
begin
  FproJrs := Astring;
  FproJrs_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.Setrateios(Index: Integer; const AArray_Of_titulosGravarTitulosCRInTitulosRateios: Array_Of_titulosGravarTitulosCRInTitulosRateios);
begin
  Frateios := AArray_Of_titulosGravarTitulosCRInTitulosRateios;
  Frateios_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.rateios_Specified(Index: Integer): boolean;
begin
  Result := Frateios_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetseqCob(Index: Integer; const Astring: string);
begin
  FseqCob := Astring;
  FseqCob_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SettaxNeg(Index: Integer; const Astring: string);
begin
  FtaxNeg := Astring;
  FtaxNeg_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.taxNeg_Specified(Index: Integer): boolean;
begin
  Result := FtaxNeg_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrBco(Index: Integer; const Astring: string);
begin
  FvlrBco := Astring;
  FvlrBco_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrBco_Specified(Index: Integer): boolean;
begin
  Result := FvlrBco_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrCom(Index: Integer; const Astring: string);
begin
  FvlrCom := Astring;
  FvlrCom_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrCom_Specified(Index: Integer): boolean;
begin
  Result := FvlrCom_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrDca(Index: Integer; const Astring: string);
begin
  FvlrDca := Astring;
  FvlrDca_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrDca_Specified(Index: Integer): boolean;
begin
  Result := FvlrDca_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrDcb(Index: Integer; const Astring: string);
begin
  FvlrDcb := Astring;
  FvlrDcb_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrDcb_Specified(Index: Integer): boolean;
begin
  Result := FvlrDcb_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosGravarTitulosCRInTitulos.SetvlrOud(Index: Integer; const Astring: string);
begin
  FvlrOud := Astring;
  FvlrOud_Specified := True;
end;

function titulosGravarTitulosCRInTitulos.vlrOud_Specified(Index: Integer): boolean;
begin
  Result := FvlrOud_Specified;
end;

destructor titulosEntradaTitulosLoteCRInEntradaTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetbanCar(Index: Integer; const Astring: string);
begin
  FbanCar := Astring;
  FbanCar_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.banCar_Specified(Index: Integer): boolean;
begin
  Result := FbanCar_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcatExt(Index: Integer; const Astring: string);
begin
  FcatExt := Astring;
  FcatExt_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.catExt_Specified(Index: Integer): boolean;
begin
  Result := FcatExt_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcatTef(Index: Integer; const Astring: string);
begin
  FcatTef := Astring;
  FcatTef_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.catTef_Specified(Index: Integer): boolean;
begin
  Result := FcatTef_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcheAge(Index: Integer; const Astring: string);
begin
  FcheAge := Astring;
  FcheAge_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.cheAge_Specified(Index: Integer): boolean;
begin
  Result := FcheAge_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcheBan(Index: Integer; const Astring: string);
begin
  FcheBan := Astring;
  FcheBan_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.cheBan_Specified(Index: Integer): boolean;
begin
  Result := FcheBan_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcheCta(Index: Integer; const Astring: string);
begin
  FcheCta := Astring;
  FcheCta_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.cheCta_Specified(Index: Integer): boolean;
begin
  Result := FcheCta_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcheNum(Index: Integer; const Astring: string);
begin
  FcheNum := Astring;
  FcheNum_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.cheNum_Specified(Index: Integer): boolean;
begin
  Result := FcheNum_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodOpe(Index: Integer; const AInteger: Integer);
begin
  FcodOpe := AInteger;
  FcodOpe_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codOpe_Specified(Index: Integer): boolean;
begin
  Result := FcodOpe_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodSac(Index: Integer; const ADouble: Double);
begin
  FcodSac := ADouble;
  FcodSac_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codSac_Specified(Index: Integer): boolean;
begin
  Result := FcodSac_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcotEmi(Index: Integer; const ADouble: Double);
begin
  FcotEmi := ADouble;
  FcotEmi_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetcotNeg(Index: Integer; const ADouble: Double);
begin
  FcotNeg := ADouble;
  FcotNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.cotNeg_Specified(Index: Integer): boolean;
begin
  Result := FcotNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetnsuTef(Index: Integer; const Astring: string);
begin
  FnsuTef := Astring;
  FnsuTef_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.nsuTef_Specified(Index: Integer): boolean;
begin
  Result := FnsuTef_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetparCar(Index: Integer; const AInteger: Integer);
begin
  FparCar := AInteger;
  FparCar_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.parCar_Specified(Index: Integer): boolean;
begin
  Result := FparCar_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetperDsc(Index: Integer; const AInteger: Integer);
begin
  FperDsc := AInteger;
  FperDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetperJrs(Index: Integer; const AInteger: Integer);
begin
  FperJrs := AInteger;
  FperJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetperMul(Index: Integer; const AInteger: Integer);
begin
  FperMul := AInteger;
  FperMul_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio);
begin
  Frateio := AArray_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio;
  Frateio_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetseqCob(Index: Integer; const Astring: string);
begin
  FseqCob := Astring;
  FseqCob_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

destructor titulosEntradaTitulosLoteCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FentradaTitulos)-1 do
    System.SysUtils.FreeAndNil(FentradaTitulos[I]);
  System.SetLength(FentradaTitulos, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosLoteCRIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosLoteCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosLoteCRIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosLoteCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosLoteCRIn.SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCRInEntradaTitulos: Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos);
begin
  FentradaTitulos := AArray_Of_titulosEntradaTitulosLoteCRInEntradaTitulos;
  FentradaTitulos_Specified := True;
end;

function titulosEntradaTitulosLoteCRIn.entradaTitulos_Specified(Index: Integer): boolean;
begin
  Result := FentradaTitulos_Specified;
end;

procedure titulosEntradaTitulosLoteCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEntradaTitulosLoteCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEntradaTitulosLoteCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEntradaTitulosLoteCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEntradaTitulosLoteCRIn.SetforCli(Index: Integer; const Astring: string);
begin
  FforCli := Astring;
  FforCli_Specified := True;
end;

function titulosEntradaTitulosLoteCRIn.forCli_Specified(Index: Integer): boolean;
begin
  Result := FforCli_Specified;
end;

procedure titulosGravarTitulosCROutResultado.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosGravarTitulosCROutResultado.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosGravarTitulosCROutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGravarTitulosCROutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGravarTitulosCROutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGravarTitulosCROutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGravarTitulosCROutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGravarTitulosCROutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGravarTitulosCROutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGravarTitulosCROutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGravarTitulosCROutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosGravarTitulosCROutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

destructor titulosGravarTitulosCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosGravarTitulosCRIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosGravarTitulosCRIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosGravarTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosGravarTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosGravarTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosGravarTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosGravarTitulosCRIn.Settitulos(Index: Integer; const AArray_Of_titulosGravarTitulosCRInTitulos: Array_Of_titulosGravarTitulosCRInTitulos);
begin
  Ftitulos := AArray_Of_titulosGravarTitulosCRInTitulos;
  Ftitulos_Specified := True;
end;

function titulosGravarTitulosCRIn.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

destructor titulosEstornoBaixaTitulosCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosReceber)-1 do
    System.SysUtils.FreeAndNil(FtitulosReceber[I]);
  System.SetLength(FtitulosReceber, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEstornoBaixaTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEstornoBaixaTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEstornoBaixaTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEstornoBaixaTitulosCRIn.SetsistemaIntegracao(Index: Integer; const Astring: string);
begin
  FsistemaIntegracao := Astring;
  FsistemaIntegracao_Specified := True;
end;

function titulosEstornoBaixaTitulosCRIn.sistemaIntegracao_Specified(Index: Integer): boolean;
begin
  Result := FsistemaIntegracao_Specified;
end;

procedure titulosEstornoBaixaTitulosCRIn.SettitulosReceber(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCRInTitulosReceber: Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber);
begin
  FtitulosReceber := AArray_Of_titulosEstornoBaixaTitulosCRInTitulosReceber;
  FtitulosReceber_Specified := True;
end;

function titulosEstornoBaixaTitulosCRIn.titulosReceber_Specified(Index: Integer): boolean;
begin
  Result := FtitulosReceber_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcatTef(Index: Integer; const Astring: string);
begin
  FcatTef := Astring;
  FcatTef_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.catTef_Specified(Index: Integer): boolean;
begin
  Result := FcatTef_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcheAge(Index: Integer; const Astring: string);
begin
  FcheAge := Astring;
  FcheAge_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.cheAge_Specified(Index: Integer): boolean;
begin
  Result := FcheAge_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcheBan(Index: Integer; const Astring: string);
begin
  FcheBan := Astring;
  FcheBan_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.cheBan_Specified(Index: Integer): boolean;
begin
  Result := FcheBan_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcheCta(Index: Integer; const Astring: string);
begin
  FcheCta := Astring;
  FcheCta_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.cheCta_Specified(Index: Integer): boolean;
begin
  Result := FcheCta_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcheNum(Index: Integer; const Astring: string);
begin
  FcheNum := Astring;
  FcheNum_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.cheNum_Specified(Index: Integer): boolean;
begin
  Result := FcheNum_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodCli(Index: Integer; const Astring: string);
begin
  FcodCli := Astring;
  FcodCli_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodNtg(Index: Integer; const Astring: string);
begin
  FcodNtg := Astring;
  FcodNtg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodRep(Index: Integer; const Astring: string);
begin
  FcodRep := Astring;
  FcodRep_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodSac(Index: Integer; const Astring: string);
begin
  FcodSac := Astring;
  FcodSac_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codSac_Specified(Index: Integer): boolean;
begin
  Result := FcodSac_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcomRec(Index: Integer; const Astring: string);
begin
  FcomRec := Astring;
  FcomRec_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.comRec_Specified(Index: Integer): boolean;
begin
  Result := FcomRec_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetcpgNeg(Index: Integer; const Astring: string);
begin
  FcpgNeg := Astring;
  FcpgNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.cpgNeg_Specified(Index: Integer): boolean;
begin
  Result := FcpgNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetdscNeg(Index: Integer; const Astring: string);
begin
  FdscNeg := Astring;
  FdscNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetfilNff(Index: Integer; const Astring: string);
begin
  FfilNff := Astring;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetjrsDia(Index: Integer; const Astring: string);
begin
  FjrsDia := Astring;
  FjrsDia_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetjrsNeg(Index: Integer; const Astring: string);
begin
  FjrsNeg := Astring;
  FjrsNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetmulNeg(Index: Integer; const Astring: string);
begin
  FmulNeg := Astring;
  FmulNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetnsuTef(Index: Integer; const Astring: string);
begin
  FnsuTef := Astring;
  FnsuTef_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.nsuTef_Specified(Index: Integer): boolean;
begin
  Result := FnsuTef_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetnumArb(Index: Integer; const Astring: string);
begin
  FnumArb := Astring;
  FnumArb_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetnumNff(Index: Integer; const Astring: string);
begin
  FnumNff := Astring;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetoutNeg(Index: Integer; const Astring: string);
begin
  FoutNeg := Astring;
  FoutNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetperCom(Index: Integer; const Astring: string);
begin
  FperCom := Astring;
  FperCom_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetperDsc(Index: Integer; const Astring: string);
begin
  FperDsc := Astring;
  FperDsc_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetperJrs(Index: Integer; const Astring: string);
begin
  FperJrs := Astring;
  FperJrs_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetperMul(Index: Integer; const Astring: string);
begin
  FperMul := Astring;
  FperMul_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetproJrs(Index: Integer; const Astring: string);
begin
  FproJrs := Astring;
  FproJrs_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SettaxNeg(Index: Integer; const Astring: string);
begin
  FtaxNeg := Astring;
  FtaxNeg_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.taxNeg_Specified(Index: Integer): boolean;
begin
  Result := FtaxNeg_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SettolDsc(Index: Integer; const Astring: string);
begin
  FtolDsc := Astring;
  FtolDsc_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SettolJrs(Index: Integer; const Astring: string);
begin
  FtolJrs := Astring;
  FtolJrs_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SettolMul(Index: Integer; const Astring: string);
begin
  FtolMul := Astring;
  FtolMul_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrBco(Index: Integer; const Astring: string);
begin
  FvlrBco := Astring;
  FvlrBco_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrBco_Specified(Index: Integer): boolean;
begin
  Result := FvlrBco_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrCom(Index: Integer; const Astring: string);
begin
  FvlrCom := Astring;
  FvlrCom_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrCom_Specified(Index: Integer): boolean;
begin
  Result := FvlrCom_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrDca(Index: Integer; const Astring: string);
begin
  FvlrDca := Astring;
  FvlrDca_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrDca_Specified(Index: Integer): boolean;
begin
  Result := FvlrDca_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrDcb(Index: Integer; const Astring: string);
begin
  FvlrDcb := Astring;
  FvlrDcb_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrDcb_Specified(Index: Integer): boolean;
begin
  Result := FvlrDcb_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrOri(Index: Integer; const Astring: string);
begin
  FvlrOri := Astring;
  FvlrOri_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosConsultarTitulosCROutTitulos.SetvlrOud(Index: Integer; const Astring: string);
begin
  FvlrOud := Astring;
  FvlrOud_Specified := True;
end;

function titulosConsultarTitulosCROutTitulos.vlrOud_Specified(Index: Integer): boolean;
begin
  Result := FvlrOud_Specified;
end;

constructor titulosConsultarTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTitulosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTitulosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTitulosCROut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarTitulosCROut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosCROut.Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosCROutTitulos: Array_Of_titulosConsultarTitulosCROutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarTitulosCROutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarTitulosCROut.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetmsgRet(Index: Integer; const Astring: string);
begin
  FmsgRet := Astring;
  FmsgRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.msgRet_Specified(Index: Integer): boolean;
begin
  Result := FmsgRet_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosEstornoBaixaTitulosCROutRetorno.SettipRet(Index: Integer; const AInteger: Integer);
begin
  FtipRet := AInteger;
  FtipRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCROutRetorno.tipRet_Specified(Index: Integer): boolean;
begin
  Result := FtipRet_Specified;
end;

constructor titulosEstornoBaixaTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEstornoBaixaTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEstornoBaixaTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEstornoBaixaTitulosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCROut.Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCROutRetorno: Array_Of_titulosEstornoBaixaTitulosCROutRetorno);
begin
  Fretorno := AArray_Of_titulosEstornoBaixaTitulosCROutRetorno;
  Fretorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCROut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCROut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCROut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCRInTitulosReceber.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCRInTitulosReceber.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaInConsulta.SetcodSnf(Index: Integer; const Astring: string);
begin
  FcodSnf := Astring;
  FcodSnf_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaInConsulta.codSnf_Specified(Index: Integer): boolean;
begin
  Result := FcodSnf_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaInConsulta.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaInConsulta.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaInConsulta.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaInConsulta.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaInConsulta.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaInConsulta.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosEstornoBaixaTitulosCR2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEstornoBaixaTitulosCR2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCR2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2Out.Setretorno(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCR2OutRetorno: Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno);
begin
  Fretorno := AArray_Of_titulosEstornoBaixaTitulosCR2OutRetorno;
  Fretorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2Out.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2Out.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetempReq(Index: Integer; const AInteger: Integer);
begin
  FempReq := AInteger;
  FempReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.empReq_Specified(Index: Integer): boolean;
begin
  Result := FempReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetfilReq(Index: Integer; const AInteger: Integer);
begin
  FfilReq := AInteger;
  FfilReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.filReq_Specified(Index: Integer): boolean;
begin
  Result := FfilReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2InTitulosReceber.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2InTitulosReceber.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

destructor titulosEstornoBaixaTitulosCR2In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtitulosReceber)-1 do
    System.SysUtils.FreeAndNil(FtitulosReceber[I]);
  System.SetLength(FtitulosReceber, 0);
  inherited Destroy;
end;

procedure titulosEstornoBaixaTitulosCR2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2In.SetsistemaIntegracao(Index: Integer; const Astring: string);
begin
  FsistemaIntegracao := Astring;
  FsistemaIntegracao_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2In.sistemaIntegracao_Specified(Index: Integer): boolean;
begin
  Result := FsistemaIntegracao_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2In.SettitulosReceber(Index: Integer; const AArray_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber: Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber);
begin
  FtitulosReceber := AArray_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber;
  FtitulosReceber_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2In.titulosReceber_Specified(Index: Integer): boolean;
begin
  Result := FtitulosReceber_Specified;
end;

destructor titulosBaixarTitulosCRInBaixaTituloReceber.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateios)-1 do
    System.SysUtils.FreeAndNil(Frateios[I]);
  System.SetLength(Frateios, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetcotMcr(Index: Integer; const Astring: string);
begin
  FcotMcr := Astring;
  FcotMcr_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.cotMcr_Specified(Index: Integer): boolean;
begin
  Result := FcotMcr_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetdatCco(Index: Integer; const Astring: string);
begin
  FdatCco := Astring;
  FdatCco_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.datCco_Specified(Index: Integer): boolean;
begin
  Result := FdatCco_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetdatLib(Index: Integer; const Astring: string);
begin
  FdatLib := Astring;
  FdatLib_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.datLib_Specified(Index: Integer): boolean;
begin
  Result := FdatLib_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetdatMov(Index: Integer; const Astring: string);
begin
  FdatMov := Astring;
  FdatMov_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.datMov_Specified(Index: Integer): boolean;
begin
  Result := FdatMov_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetdiaAtr(Index: Integer; const Astring: string);
begin
  FdiaAtr := Astring;
  FdiaAtr_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.diaAtr_Specified(Index: Integer): boolean;
begin
  Result := FdiaAtr_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetdiaJrs(Index: Integer; const Astring: string);
begin
  FdiaJrs := Astring;
  FdiaJrs_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.diaJrs_Specified(Index: Integer): boolean;
begin
  Result := FdiaJrs_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetempCco(Index: Integer; const Astring: string);
begin
  FempCco := Astring;
  FempCco_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.empCco_Specified(Index: Integer): boolean;
begin
  Result := FempCco_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetfilRlc(Index: Integer; const Astring: string);
begin
  FfilRlc := Astring;
  FfilRlc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.filRlc_Specified(Index: Integer): boolean;
begin
  Result := FfilRlc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetnumDoc(Index: Integer; const Astring: string);
begin
  FnumDoc := Astring;
  FnumDoc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.numDoc_Specified(Index: Integer): boolean;
begin
  Result := FnumDoc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetnumRlc(Index: Integer; const Astring: string);
begin
  FnumRlc := Astring;
  FnumRlc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.numRlc_Specified(Index: Integer): boolean;
begin
  Result := FnumRlc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.Setrateios(Index: Integer; const AArray_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios);
begin
  Frateios := AArray_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios;
  Frateios_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.rateios_Specified(Index: Integer): boolean;
begin
  Result := Frateios_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetseqCco(Index: Integer; const Astring: string);
begin
  FseqCco := Astring;
  FseqCco_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.seqCco_Specified(Index: Integer): boolean;
begin
  Result := FseqCco_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetseqMov(Index: Integer; const Astring: string);
begin
  FseqMov := Astring;
  FseqMov_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetseqRlc(Index: Integer; const Astring: string);
begin
  FseqRlc := Astring;
  FseqRlc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.seqRlc_Specified(Index: Integer): boolean;
begin
  Result := FseqRlc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SettnsBxa(Index: Integer; const Astring: string);
begin
  FtnsBxa := Astring;
  FtnsBxa_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.tnsBxa_Specified(Index: Integer): boolean;
begin
  Result := FtnsBxa_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SettptRlc(Index: Integer; const Astring: string);
begin
  FtptRlc := Astring;
  FtptRlc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.tptRlc_Specified(Index: Integer): boolean;
begin
  Result := FtptRlc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrBco(Index: Integer; const Astring: string);
begin
  FvlrBco := Astring;
  FvlrBco_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrBco_Specified(Index: Integer): boolean;
begin
  Result := FvlrBco_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrCom(Index: Integer; const Astring: string);
begin
  FvlrCom := Astring;
  FvlrCom_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrCom_Specified(Index: Integer): boolean;
begin
  Result := FvlrCom_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrCor(Index: Integer; const Astring: string);
begin
  FvlrCor := Astring;
  FvlrCor_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrEnc(Index: Integer; const Astring: string);
begin
  FvlrEnc := Astring;
  FvlrEnc_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrJrs(Index: Integer; const Astring: string);
begin
  FvlrJrs := Astring;
  FvlrJrs_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrLiq(Index: Integer; const Astring: string);
begin
  FvlrLiq := Astring;
  FvlrLiq_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrLiq_Specified(Index: Integer): boolean;
begin
  Result := FvlrLiq_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrMov(Index: Integer; const Astring: string);
begin
  FvlrMov := Astring;
  FvlrMov_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrMov_Specified(Index: Integer): boolean;
begin
  Result := FvlrMov_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrMul(Index: Integer; const Astring: string);
begin
  FvlrMul := Astring;
  FvlrMul_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrOac(Index: Integer; const Astring: string);
begin
  FvlrOac := Astring;
  FvlrOac_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceber.SetvlrOde(Index: Integer; const Astring: string);
begin
  FvlrOde := Astring;
  FvlrOde_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceber.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

destructor titulosBaixarTitulosCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FbaixaTituloReceber)-1 do
    System.SysUtils.FreeAndNil(FbaixaTituloReceber[I]);
  System.SetLength(FbaixaTituloReceber, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCRIn.SetbaixaTituloReceber(Index: Integer; const AArray_Of_titulosBaixarTitulosCRInBaixaTituloReceber: Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber);
begin
  FbaixaTituloReceber := AArray_Of_titulosBaixarTitulosCRInBaixaTituloReceber;
  FbaixaTituloReceber_Specified := True;
end;

function titulosBaixarTitulosCRIn.baixaTituloReceber_Specified(Index: Integer): boolean;
begin
  Result := FbaixaTituloReceber_Specified;
end;

procedure titulosBaixarTitulosCRIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosBaixarTitulosCRIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosBaixarTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosBaixarTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosBaixarTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosBaixarTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetempReq(Index: Integer; const AInteger: Integer);
begin
  FempReq := AInteger;
  FempReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.empReq_Specified(Index: Integer): boolean;
begin
  Result := FempReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetfilReq(Index: Integer; const AInteger: Integer);
begin
  FfilReq := AInteger;
  FfilReq_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.filReq_Specified(Index: Integer): boolean;
begin
  Result := FfilReq_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetideExt(Index: Integer; const AInteger: Integer);
begin
  FideExt := AInteger;
  FideExt_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetmsgRet(Index: Integer; const Astring: string);
begin
  FmsgRet := Astring;
  FmsgRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.msgRet_Specified(Index: Integer): boolean;
begin
  Result := FmsgRet_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosEstornoBaixaTitulosCR2OutRetorno.SettipRet(Index: Integer; const AInteger: Integer);
begin
  FtipRet := AInteger;
  FtipRet_Specified := True;
end;

function titulosEstornoBaixaTitulosCR2OutRetorno.tipRet_Specified(Index: Integer): boolean;
begin
  Result := FtipRet_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetcriRat(Index: Integer; const AInteger: Integer);
begin
  FcriRat := AInteger;
  FcriRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.criRat_Specified(Index: Integer): boolean;
begin
  Result := FcriRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetdatBas(Index: Integer; const Astring: string);
begin
  FdatBas := Astring;
  FdatBas_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.datBas_Specified(Index: Integer): boolean;
begin
  Result := FdatBas_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetmesAno(Index: Integer; const Astring: string);
begin
  FmesAno := Astring;
  FmesAno_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.mesAno_Specified(Index: Integer): boolean;
begin
  Result := FmesAno_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetseqRat(Index: Integer; const AInteger: Integer);
begin
  FseqRat := AInteger;
  FseqRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.seqRat_Specified(Index: Integer): boolean;
begin
  Result := FseqRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetsomSub(Index: Integer; const AInteger: Integer);
begin
  FsomSub := AInteger;
  FsomSub_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.somSub_Specified(Index: Integer): boolean;
begin
  Result := FsomSub_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SettipOri(Index: Integer; const Astring: string);
begin
  FtipOri := Astring;
  FtipOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.tipOri_Specified(Index: Integer): boolean;
begin
  Result := FtipOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulosRateios.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulosRateios.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutErros.SetmsgErr(Index: Integer; const Astring: string);
begin
  FmsgErr := Astring;
  FmsgErr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutErros.msgErr_Specified(Index: Integer): boolean;
begin
  Result := FmsgErr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetbxaCpt(Index: Integer; const Astring: string);
begin
  FbxaCpt := Astring;
  FbxaCpt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.bxaCpt_Specified(Index: Integer): boolean;
begin
  Result := FbxaCpt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetchvLot(Index: Integer; const Astring: string);
begin
  FchvLot := Astring;
  FchvLot_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.chvLot_Specified(Index: Integer): boolean;
begin
  Result := FchvLot_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcjmAnt(Index: Integer; const Astring: string);
begin
  FcjmAnt := Astring;
  FcjmAnt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.cjmAnt_Specified(Index: Integer): boolean;
begin
  Result := FcjmAnt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcotFrj(Index: Integer; const ADouble: Double);
begin
  FcotFrj := ADouble;
  FcotFrj_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.cotFrj_Specified(Index: Integer): boolean;
begin
  Result := FcotFrj_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcotMcr(Index: Integer; const ADouble: Double);
begin
  FcotMcr := ADouble;
  FcotMcr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.cotMcr_Specified(Index: Integer): boolean;
begin
  Result := FcotMcr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetcrtAnt(Index: Integer; const Astring: string);
begin
  FcrtAnt := Astring;
  FcrtAnt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.crtAnt_Specified(Index: Integer): boolean;
begin
  Result := FcrtAnt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdatCco(Index: Integer; const Astring: string);
begin
  FdatCco := Astring;
  FdatCco_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.datCco_Specified(Index: Integer): boolean;
begin
  Result := FdatCco_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdatGer(Index: Integer; const Astring: string);
begin
  FdatGer := Astring;
  FdatGer_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.datGer_Specified(Index: Integer): boolean;
begin
  Result := FdatGer_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdatLib(Index: Integer; const Astring: string);
begin
  FdatLib := Astring;
  FdatLib_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.datLib_Specified(Index: Integer): boolean;
begin
  Result := FdatLib_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdatMov(Index: Integer; const Astring: string);
begin
  FdatMov := Astring;
  FdatMov_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.datMov_Specified(Index: Integer): boolean;
begin
  Result := FdatMov_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdiaAtr(Index: Integer; const AInteger: Integer);
begin
  FdiaAtr := AInteger;
  FdiaAtr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.diaAtr_Specified(Index: Integer): boolean;
begin
  Result := FdiaAtr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetdiaJrs(Index: Integer; const AInteger: Integer);
begin
  FdiaJrs := AInteger;
  FdiaJrs_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.diaJrs_Specified(Index: Integer): boolean;
begin
  Result := FdiaJrs_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetempCco(Index: Integer; const AInteger: Integer);
begin
  FempCco := AInteger;
  FempCco_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.empCco_Specified(Index: Integer): boolean;
begin
  Result := FempCco_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetfilFix(Index: Integer; const AInteger: Integer);
begin
  FfilFix := AInteger;
  FfilFix_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.filFix_Specified(Index: Integer): boolean;
begin
  Result := FfilFix_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetfilOri(Index: Integer; const AInteger: Integer);
begin
  FfilOri := AInteger;
  FfilOri_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.filOri_Specified(Index: Integer): boolean;
begin
  Result := FfilOri_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetfilRlc(Index: Integer; const AInteger: Integer);
begin
  FfilRlc := AInteger;
  FfilRlc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.filRlc_Specified(Index: Integer): boolean;
begin
  Result := FfilRlc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetforRlc(Index: Integer; const AInteger: Integer);
begin
  FforRlc := AInteger;
  FforRlc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.forRlc_Specified(Index: Integer): boolean;
begin
  Result := FforRlc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SethorGer(Index: Integer; const Astring: string);
begin
  FhorGer := Astring;
  FhorGer_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.horGer_Specified(Index: Integer): boolean;
begin
  Result := FhorGer_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetindExp(Index: Integer; const AInteger: Integer);
begin
  FindExp := AInteger;
  FindExp_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.indExp_Specified(Index: Integer): boolean;
begin
  Result := FindExp_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetindVcr(Index: Integer; const AInteger: Integer);
begin
  FindVcr := AInteger;
  FindVcr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.indVcr_Specified(Index: Integer): boolean;
begin
  Result := FindVcr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetintDif(Index: Integer; const AInteger: Integer);
begin
  FintDif := AInteger;
  FintDif_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.intDif_Specified(Index: Integer): boolean;
begin
  Result := FintDif_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetintImp(Index: Integer; const AInteger: Integer);
begin
  FintImp := AInteger;
  FintImp_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.intImp_Specified(Index: Integer): boolean;
begin
  Result := FintImp_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetjrsCal(Index: Integer; const ADouble: Double);
begin
  FjrsCal := ADouble;
  FjrsCal_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.jrsCal_Specified(Index: Integer): boolean;
begin
  Result := FjrsCal_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetjrsPro(Index: Integer; const AInteger: Integer);
begin
  FjrsPro := AInteger;
  FjrsPro_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.jrsPro_Specified(Index: Integer): boolean;
begin
  Result := FjrsPro_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetlctFin(Index: Integer; const AInteger: Integer);
begin
  FlctFin := AInteger;
  FlctFin_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.lctFin_Specified(Index: Integer): boolean;
begin
  Result := FlctFin_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetlotBai(Index: Integer; const AInteger: Integer);
begin
  FlotBai := AInteger;
  FlotBai_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.lotBai_Specified(Index: Integer): boolean;
begin
  Result := FlotBai_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetlotBfi(Index: Integer; const AInteger: Integer);
begin
  FlotBfi := AInteger;
  FlotBfi_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.lotBfi_Specified(Index: Integer): boolean;
begin
  Result := FlotBfi_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumDoc(Index: Integer; const Astring: string);
begin
  FnumDoc := Astring;
  FnumDoc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numDoc_Specified(Index: Integer): boolean;
begin
  Result := FnumDoc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumFix(Index: Integer; const AInteger: Integer);
begin
  FnumFix := AInteger;
  FnumFix_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numFix_Specified(Index: Integer): boolean;
begin
  Result := FnumFix_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumLot(Index: Integer; const AInteger: Integer);
begin
  FnumLot := AInteger;
  FnumLot_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numLot_Specified(Index: Integer): boolean;
begin
  Result := FnumLot_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumPdv(Index: Integer; const AInteger: Integer);
begin
  FnumPdv := AInteger;
  FnumPdv_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numPdv_Specified(Index: Integer): boolean;
begin
  Result := FnumPdv_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumRlc(Index: Integer; const Astring: string);
begin
  FnumRlc := Astring;
  FnumRlc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numRlc_Specified(Index: Integer): boolean;
begin
  Result := FnumRlc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetobsMcr(Index: Integer; const Astring: string);
begin
  FobsMcr := Astring;
  FobsMcr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.obsMcr_Specified(Index: Integer): boolean;
begin
  Result := FobsMcr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetperJrs(Index: Integer; const ADouble: Double);
begin
  FperJrs := ADouble;
  FperJrs_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetporAnt(Index: Integer; const Astring: string);
begin
  FporAnt := Astring;
  FporAnt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.porAnt_Specified(Index: Integer): boolean;
begin
  Result := FporAnt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetproJrs(Index: Integer; const AInteger: Integer);
begin
  FproJrs := AInteger;
  FproJrs_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetreaAnb(Index: Integer; const Astring: string);
begin
  FreaAnb := Astring;
  FreaAnb_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.reaAnb_Specified(Index: Integer): boolean;
begin
  Result := FreaAnb_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetrecJoa(Index: Integer; const AInteger: Integer);
begin
  FrecJoa := AInteger;
  FrecJoa_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.recJoa_Specified(Index: Integer): boolean;
begin
  Result := FrecJoa_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetrecJod(Index: Integer; const AInteger: Integer);
begin
  FrecJod := AInteger;
  FrecJod_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.recJod_Specified(Index: Integer): boolean;
begin
  Result := FrecJod_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetrecMoa(Index: Integer; const AInteger: Integer);
begin
  FrecMoa := AInteger;
  FrecMoa_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.recMoa_Specified(Index: Integer): boolean;
begin
  Result := FrecMoa_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetseqCco(Index: Integer; const AInteger: Integer);
begin
  FseqCco := AInteger;
  FseqCco_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.seqCco_Specified(Index: Integer): boolean;
begin
  Result := FseqCco_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetseqLba(Index: Integer; const AInteger: Integer);
begin
  FseqLba := AInteger;
  FseqLba_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.seqLba_Specified(Index: Integer): boolean;
begin
  Result := FseqLba_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetseqMcp(Index: Integer; const AInteger: Integer);
begin
  FseqMcp := AInteger;
  FseqMcp_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.seqMcp_Specified(Index: Integer): boolean;
begin
  Result := FseqMcp_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetseqMov(Index: Integer; const AInteger: Integer);
begin
  FseqMov := AInteger;
  FseqMov_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetseqRlc(Index: Integer; const AInteger: Integer);
begin
  FseqRlc := AInteger;
  FseqRlc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.seqRlc_Specified(Index: Integer): boolean;
begin
  Result := FseqRlc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SettipBai(Index: Integer; const Astring: string);
begin
  FtipBai := Astring;
  FtipBai_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.tipBai_Specified(Index: Integer): boolean;
begin
  Result := FtipBai_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SettipCof(Index: Integer; const AInteger: Integer);
begin
  FtipCof := AInteger;
  FtipCof_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.tipCof_Specified(Index: Integer): boolean;
begin
  Result := FtipCof_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SettptRlc(Index: Integer; const Astring: string);
begin
  FtptRlc := Astring;
  FtptRlc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.tptRlc_Specified(Index: Integer): boolean;
begin
  Result := FtptRlc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetultPgt(Index: Integer; const Astring: string);
begin
  FultPgt := Astring;
  FultPgt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.ultPgt_Specified(Index: Integer): boolean;
begin
  Result := FultPgt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetusuGer(Index: Integer; const ADouble: Double);
begin
  FusuGer := ADouble;
  FusuGer_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.usuGer_Specified(Index: Integer): boolean;
begin
  Result := FusuGer_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrAbe(Index: Integer; const ADouble: Double);
begin
  FvlrAbe := ADouble;
  FvlrAbe_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrAbe_Specified(Index: Integer): boolean;
begin
  Result := FvlrAbe_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBcl(Index: Integer; const ADouble: Double);
begin
  FvlrBcl := ADouble;
  FvlrBcl_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBcl_Specified(Index: Integer): boolean;
begin
  Result := FvlrBcl_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBco(Index: Integer; const ADouble: Double);
begin
  FvlrBco := ADouble;
  FvlrBco_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBco_Specified(Index: Integer): boolean;
begin
  Result := FvlrBco_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBcr(Index: Integer; const ADouble: Double);
begin
  FvlrBcr := ADouble;
  FvlrBcr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBcr_Specified(Index: Integer): boolean;
begin
  Result := FvlrBcr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBct(Index: Integer; const ADouble: Double);
begin
  FvlrBct := ADouble;
  FvlrBct_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBct_Specified(Index: Integer): boolean;
begin
  Result := FvlrBct_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBir(Index: Integer; const ADouble: Double);
begin
  FvlrBir := ADouble;
  FvlrBir_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBir_Specified(Index: Integer): boolean;
begin
  Result := FvlrBir_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBor(Index: Integer; const ADouble: Double);
begin
  FvlrBor := ADouble;
  FvlrBor_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBor_Specified(Index: Integer): boolean;
begin
  Result := FvlrBor_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBpr(Index: Integer; const ADouble: Double);
begin
  FvlrBpr := ADouble;
  FvlrBpr_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBpr_Specified(Index: Integer): boolean;
begin
  Result := FvlrBpr_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrBpt(Index: Integer; const ADouble: Double);
begin
  FvlrBpt := ADouble;
  FvlrBpt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrBpt_Specified(Index: Integer): boolean;
begin
  Result := FvlrBpt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrCof(Index: Integer; const ADouble: Double);
begin
  FvlrCof := ADouble;
  FvlrCof_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrCof_Specified(Index: Integer): boolean;
begin
  Result := FvlrCof_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrCom(Index: Integer; const ADouble: Double);
begin
  FvlrCom := ADouble;
  FvlrCom_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrCom_Specified(Index: Integer): boolean;
begin
  Result := FvlrCom_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrCrt(Index: Integer; const ADouble: Double);
begin
  FvlrCrt := ADouble;
  FvlrCrt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrCrt_Specified(Index: Integer): boolean;
begin
  Result := FvlrCrt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrCsl(Index: Integer; const ADouble: Double);
begin
  FvlrCsl := ADouble;
  FvlrCsl_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrCsl_Specified(Index: Integer): boolean;
begin
  Result := FvlrCsl_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrInt(Index: Integer; const ADouble: Double);
begin
  FvlrInt := ADouble;
  FvlrInt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrInt_Specified(Index: Integer): boolean;
begin
  Result := FvlrInt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrIrf(Index: Integer; const ADouble: Double);
begin
  FvlrIrf := ADouble;
  FvlrIrf_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrIrf_Specified(Index: Integer): boolean;
begin
  Result := FvlrIrf_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrLiq(Index: Integer; const ADouble: Double);
begin
  FvlrLiq := ADouble;
  FvlrLiq_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrLiq_Specified(Index: Integer): boolean;
begin
  Result := FvlrLiq_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrMov(Index: Integer; const ADouble: Double);
begin
  FvlrMov := ADouble;
  FvlrMov_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrMov_Specified(Index: Integer): boolean;
begin
  Result := FvlrMov_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOcl(Index: Integer; const ADouble: Double);
begin
  FvlrOcl := ADouble;
  FvlrOcl_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOcl_Specified(Index: Integer): boolean;
begin
  Result := FvlrOcl_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOct(Index: Integer; const ADouble: Double);
begin
  FvlrOct := ADouble;
  FvlrOct_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOct_Specified(Index: Integer): boolean;
begin
  Result := FvlrOct_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOir(Index: Integer; const ADouble: Double);
begin
  FvlrOir := ADouble;
  FvlrOir_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOir_Specified(Index: Integer): boolean;
begin
  Result := FvlrOir_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOor(Index: Integer; const ADouble: Double);
begin
  FvlrOor := ADouble;
  FvlrOor_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOor_Specified(Index: Integer): boolean;
begin
  Result := FvlrOor_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOpt(Index: Integer; const ADouble: Double);
begin
  FvlrOpt := ADouble;
  FvlrOpt_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOpt_Specified(Index: Integer): boolean;
begin
  Result := FvlrOpt_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrOur(Index: Integer; const ADouble: Double);
begin
  FvlrOur := ADouble;
  FvlrOur_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrOur_Specified(Index: Integer): boolean;
begin
  Result := FvlrOur_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrPis(Index: Integer; const ADouble: Double);
begin
  FvlrPis := ADouble;
  FvlrPis_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrPis_Specified(Index: Integer): boolean;
begin
  Result := FvlrPis_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.SetvlrPit(Index: Integer; const ADouble: Double);
begin
  FvlrPit := ADouble;
  FvlrPit_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos.vlrPit_Specified(Index: Integer): boolean;
begin
  Result := FvlrPit_Specified;
end;

constructor titulosExportarBaixaTitulosReceberVendaOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosExportarBaixaTitulosReceberVendaOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FbaixaTitulos)-1 do
    System.SysUtils.FreeAndNil(FbaixaTitulos[I]);
  System.SetLength(FbaixaTitulos, 0);
  for I := 0 to System.Length(Ferros)-1 do
    System.SysUtils.FreeAndNil(Ferros[I]);
  System.SetLength(Ferros, 0);
  inherited Destroy;
end;

procedure titulosExportarBaixaTitulosReceberVendaOut.SetbaixaTitulos(Index: Integer; const AArray_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos: Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos);
begin
  FbaixaTitulos := AArray_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos;
  FbaixaTitulos_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOut.baixaTitulos_Specified(Index: Integer): boolean;
begin
  Result := FbaixaTitulos_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOut.Seterros(Index: Integer; const AArray_Of_titulosExportarBaixaTitulosReceberVendaOutErros: Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros);
begin
  Ferros := AArray_Of_titulosExportarBaixaTitulosReceberVendaOutErros;
  Ferros_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOut.erros_Specified(Index: Integer): boolean;
begin
  Result := Ferros_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

destructor titulosConsultarTitulosAbertosCROutTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateios)-1 do
    System.SysUtils.FreeAndNil(Frateios[I]);
  System.SetLength(Frateios, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcatTef(Index: Integer; const Astring: string);
begin
  FcatTef := Astring;
  FcatTef_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.catTef_Specified(Index: Integer): boolean;
begin
  Result := FcatTef_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcheAge(Index: Integer; const Astring: string);
begin
  FcheAge := Astring;
  FcheAge_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cheAge_Specified(Index: Integer): boolean;
begin
  Result := FcheAge_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcheBan(Index: Integer; const Astring: string);
begin
  FcheBan := Astring;
  FcheBan_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cheBan_Specified(Index: Integer): boolean;
begin
  Result := FcheBan_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcheCta(Index: Integer; const Astring: string);
begin
  FcheCta := Astring;
  FcheCta_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cheCta_Specified(Index: Integer): boolean;
begin
  Result := FcheCta_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcheNum(Index: Integer; const Astring: string);
begin
  FcheNum := Astring;
  FcheNum_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cheNum_Specified(Index: Integer): boolean;
begin
  Result := FcheNum_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodMpt(Index: Integer; const Astring: string);
begin
  FcodMpt := Astring;
  FcodMpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codMpt_Specified(Index: Integer): boolean;
begin
  Result := FcodMpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodNtg(Index: Integer; const AInteger: Integer);
begin
  FcodNtg := AInteger;
  FcodNtg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codNtg_Specified(Index: Integer): boolean;
begin
  Result := FcodNtg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodOcr(Index: Integer; const Astring: string);
begin
  FcodOcr := Astring;
  FcodOcr_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codOcr_Specified(Index: Integer): boolean;
begin
  Result := FcodOcr_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodSac(Index: Integer; const ADouble: Double);
begin
  FcodSac := ADouble;
  FcodSac_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codSac_Specified(Index: Integer): boolean;
begin
  Result := FcodSac_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodSnf(Index: Integer; const Astring: string);
begin
  FcodSnf := Astring;
  FcodSnf_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codSnf_Specified(Index: Integer): boolean;
begin
  Result := FcodSnf_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcomRec(Index: Integer; const ADouble: Double);
begin
  FcomRec := ADouble;
  FcomRec_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.comRec_Specified(Index: Integer): boolean;
begin
  Result := FcomRec_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcotEmi(Index: Integer; const ADouble: Double);
begin
  FcotEmi := ADouble;
  FcotEmi_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cotEmi_Specified(Index: Integer): boolean;
begin
  Result := FcotEmi_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcotFrj(Index: Integer; const ADouble: Double);
begin
  FcotFrj := ADouble;
  FcotFrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cotFrj_Specified(Index: Integer): boolean;
begin
  Result := FcotFrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetcpgNeg(Index: Integer; const Astring: string);
begin
  FcpgNeg := Astring;
  FcpgNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.cpgNeg_Specified(Index: Integer): boolean;
begin
  Result := FcpgNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdatDsc(Index: Integer; const Astring: string);
begin
  FdatDsc := Astring;
  FdatDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.datDsc_Specified(Index: Integer): boolean;
begin
  Result := FdatDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdatNeg(Index: Integer; const Astring: string);
begin
  FdatNeg := Astring;
  FdatNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.datNeg_Specified(Index: Integer): boolean;
begin
  Result := FdatNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdscNeg(Index: Integer; const ADouble: Double);
begin
  FdscNeg := ADouble;
  FdscNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.dscNeg_Specified(Index: Integer): boolean;
begin
  Result := FdscNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetdupCre(Index: Integer; const Astring: string);
begin
  FdupCre := Astring;
  FdupCre_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.dupCre_Specified(Index: Integer): boolean;
begin
  Result := FdupCre_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetfilCtr(Index: Integer; const AInteger: Integer);
begin
  FfilCtr := AInteger;
  FfilCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.filCtr_Specified(Index: Integer): boolean;
begin
  Result := FfilCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetfilNfc(Index: Integer; const AInteger: Integer);
begin
  FfilNfc := AInteger;
  FfilNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.filNfc_Specified(Index: Integer): boolean;
begin
  Result := FfilNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetfilNff(Index: Integer; const AInteger: Integer);
begin
  FfilNff := AInteger;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetfilNfv(Index: Integer; const AInteger: Integer);
begin
  FfilNfv := AInteger;
  FfilNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.filNfv_Specified(Index: Integer): boolean;
begin
  Result := FfilNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetfilPed(Index: Integer; const AInteger: Integer);
begin
  FfilPed := AInteger;
  FfilPed_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.filPed_Specified(Index: Integer): boolean;
begin
  Result := FfilPed_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetforNfc(Index: Integer; const AInteger: Integer);
begin
  FforNfc := AInteger;
  FforNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.forNfc_Specified(Index: Integer): boolean;
begin
  Result := FforNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetjrsDia(Index: Integer; const ADouble: Double);
begin
  FjrsDia := ADouble;
  FjrsDia_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.jrsDia_Specified(Index: Integer): boolean;
begin
  Result := FjrsDia_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetjrsNeg(Index: Integer; const ADouble: Double);
begin
  FjrsNeg := ADouble;
  FjrsNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.jrsNeg_Specified(Index: Integer): boolean;
begin
  Result := FjrsNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetmulNeg(Index: Integer; const ADouble: Double);
begin
  FmulNeg := ADouble;
  FmulNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.mulNeg_Specified(Index: Integer): boolean;
begin
  Result := FmulNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnsuTef(Index: Integer; const Astring: string);
begin
  FnsuTef := Astring;
  FnsuTef_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.nsuTef_Specified(Index: Integer): boolean;
begin
  Result := FnsuTef_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumArb(Index: Integer; const AInteger: Integer);
begin
  FnumArb := AInteger;
  FnumArb_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numArb_Specified(Index: Integer): boolean;
begin
  Result := FnumArb_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumCtr(Index: Integer; const AInteger: Integer);
begin
  FnumCtr := AInteger;
  FnumCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numCtr_Specified(Index: Integer): boolean;
begin
  Result := FnumCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumNfc(Index: Integer; const AInteger: Integer);
begin
  FnumNfc := AInteger;
  FnumNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numNfc_Specified(Index: Integer): boolean;
begin
  Result := FnumNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumNff(Index: Integer; const AInteger: Integer);
begin
  FnumNff := AInteger;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumPed(Index: Integer; const AInteger: Integer);
begin
  FnumPed := AInteger;
  FnumPed_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numPed_Specified(Index: Integer): boolean;
begin
  Result := FnumPed_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetoutNeg(Index: Integer; const ADouble: Double);
begin
  FoutNeg := ADouble;
  FoutNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.outNeg_Specified(Index: Integer): boolean;
begin
  Result := FoutNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetperCom(Index: Integer; const ADouble: Double);
begin
  FperCom := ADouble;
  FperCom_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetperDsc(Index: Integer; const ADouble: Double);
begin
  FperDsc := ADouble;
  FperDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetperJrs(Index: Integer; const ADouble: Double);
begin
  FperJrs := ADouble;
  FperJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetperMul(Index: Integer; const ADouble: Double);
begin
  FperMul := ADouble;
  FperMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.perMul_Specified(Index: Integer): boolean;
begin
  Result := FperMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetproJrs(Index: Integer; const Astring: string);
begin
  FproJrs := Astring;
  FproJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.proJrs_Specified(Index: Integer): boolean;
begin
  Result := FproJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.Setrateios(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCROutTitulosRateios: Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios);
begin
  Frateios := AArray_Of_titulosConsultarTitulosAbertosCROutTitulosRateios;
  Frateios_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.rateios_Specified(Index: Integer): boolean;
begin
  Result := Frateios_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetseqImo(Index: Integer; const AInteger: Integer);
begin
  FseqImo := AInteger;
  FseqImo_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.seqImo_Specified(Index: Integer): boolean;
begin
  Result := FseqImo_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetsitTit(Index: Integer; const Astring: string);
begin
  FsitTit := Astring;
  FsitTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.sitTit_Specified(Index: Integer): boolean;
begin
  Result := FsitTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetsnfNfc(Index: Integer; const Astring: string);
begin
  FsnfNfc := Astring;
  FsnfNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.snfNfc_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettaxNeg(Index: Integer; const ADouble: Double);
begin
  FtaxNeg := ADouble;
  FtaxNeg_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.taxNeg_Specified(Index: Integer): boolean;
begin
  Result := FtaxNeg_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettipJrs(Index: Integer; const Astring: string);
begin
  FtipJrs := Astring;
  FtipJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.tipJrs_Specified(Index: Integer): boolean;
begin
  Result := FtipJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettitBan(Index: Integer; const Astring: string);
begin
  FtitBan := Astring;
  FtitBan_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.titBan_Specified(Index: Integer): boolean;
begin
  Result := FtitBan_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettitEfe(Index: Integer; const Astring: string);
begin
  FtitEfe := Astring;
  FtitEfe_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.titEfe_Specified(Index: Integer): boolean;
begin
  Result := FtitEfe_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettolJrs(Index: Integer; const AInteger: Integer);
begin
  FtolJrs := AInteger;
  FtolJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.tolJrs_Specified(Index: Integer): boolean;
begin
  Result := FtolJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SettolMul(Index: Integer; const AInteger: Integer);
begin
  FtolMul := AInteger;
  FtolMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.tolMul_Specified(Index: Integer): boolean;
begin
  Result := FtolMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrAbe(Index: Integer; const ADouble: Double);
begin
  FvlrAbe := ADouble;
  FvlrAbe_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrAbe_Specified(Index: Integer): boolean;
begin
  Result := FvlrAbe_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrBco(Index: Integer; const ADouble: Double);
begin
  FvlrBco := ADouble;
  FvlrBco_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrBco_Specified(Index: Integer): boolean;
begin
  Result := FvlrBco_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrCom(Index: Integer; const ADouble: Double);
begin
  FvlrCom := ADouble;
  FvlrCom_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrCom_Specified(Index: Integer): boolean;
begin
  Result := FvlrCom_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrDca(Index: Integer; const ADouble: Double);
begin
  FvlrDca := ADouble;
  FvlrDca_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrDca_Specified(Index: Integer): boolean;
begin
  Result := FvlrDca_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrDcb(Index: Integer; const ADouble: Double);
begin
  FvlrDcb := ADouble;
  FvlrDcb_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrDcb_Specified(Index: Integer): boolean;
begin
  Result := FvlrDcb_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrDes(Index: Integer; const ADouble: Double);
begin
  FvlrDes := ADouble;
  FvlrDes_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrDes_Specified(Index: Integer): boolean;
begin
  Result := FvlrDes_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosConsultarTitulosAbertosCROutTitulos.SetvlrOud(Index: Integer; const ADouble: Double);
begin
  FvlrOud := ADouble;
  FvlrOud_Specified := True;
end;

function titulosConsultarTitulosAbertosCROutTitulos.vlrOud_Specified(Index: Integer): boolean;
begin
  Result := FvlrOud_Specified;
end;

constructor titulosConsultarTitulosAbertosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTitulosAbertosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTitulosAbertosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTitulosAbertosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTitulosAbertosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTitulosAbertosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCROut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosConsultarTitulosAbertosCROut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosConsultarTitulosAbertosCROut.Settitulos(Index: Integer; const AArray_Of_titulosConsultarTitulosAbertosCROutTitulos: Array_Of_titulosConsultarTitulosAbertosCROutTitulos);
begin
  Ftitulos := AArray_Of_titulosConsultarTitulosAbertosCROutTitulos;
  Ftitulos_Specified := True;
end;

function titulosConsultarTitulosAbertosCROut.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetcodCli(Index: Integer; const Astring: string);
begin
  FcodCli := Astring;
  FcodCli_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetcodSnf(Index: Integer; const Astring: string);
begin
  FcodSnf := Astring;
  FcodSnf_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.codSnf_Specified(Index: Integer): boolean;
begin
  Result := FcodSnf_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetdatBas(Index: Integer; const Astring: string);
begin
  FdatBas := Astring;
  FdatBas_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.datBas_Specified(Index: Integer): boolean;
begin
  Result := FdatBas_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetfilCtr(Index: Integer; const AInteger: Integer);
begin
  FfilCtr := AInteger;
  FfilCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.filCtr_Specified(Index: Integer): boolean;
begin
  Result := FfilCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetfilNfc(Index: Integer; const AInteger: Integer);
begin
  FfilNfc := AInteger;
  FfilNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.filNfc_Specified(Index: Integer): boolean;
begin
  Result := FfilNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetfilNff(Index: Integer; const AInteger: Integer);
begin
  FfilNff := AInteger;
  FfilNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.filNff_Specified(Index: Integer): boolean;
begin
  Result := FfilNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetfilNfv(Index: Integer; const AInteger: Integer);
begin
  FfilNfv := AInteger;
  FfilNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.filNfv_Specified(Index: Integer): boolean;
begin
  Result := FfilNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetfilPed(Index: Integer; const AInteger: Integer);
begin
  FfilPed := AInteger;
  FfilPed_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.filPed_Specified(Index: Integer): boolean;
begin
  Result := FfilPed_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetforNfc(Index: Integer; const AInteger: Integer);
begin
  FforNfc := AInteger;
  FforNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.forNfc_Specified(Index: Integer): boolean;
begin
  Result := FforNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetindVrj(Index: Integer; const Astring: string);
begin
  FindVrj := Astring;
  FindVrj_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.indVrj_Specified(Index: Integer): boolean;
begin
  Result := FindVrj_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetnumCtr(Index: Integer; const AInteger: Integer);
begin
  FnumCtr := AInteger;
  FnumCtr_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.numCtr_Specified(Index: Integer): boolean;
begin
  Result := FnumCtr_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetnumNfc(Index: Integer; const AInteger: Integer);
begin
  FnumNfc := AInteger;
  FnumNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.numNfc_Specified(Index: Integer): boolean;
begin
  Result := FnumNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetnumNff(Index: Integer; const AInteger: Integer);
begin
  FnumNff := AInteger;
  FnumNff_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.numNff_Specified(Index: Integer): boolean;
begin
  Result := FnumNff_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetnumNfv(Index: Integer; const AInteger: Integer);
begin
  FnumNfv := AInteger;
  FnumNfv_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetnumPed(Index: Integer; const AInteger: Integer);
begin
  FnumPed := AInteger;
  FnumPed_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.numPed_Specified(Index: Integer): boolean;
begin
  Result := FnumPed_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetretRat(Index: Integer; const Astring: string);
begin
  FretRat := Astring;
  FretRat_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.retRat_Specified(Index: Integer): boolean;
begin
  Result := FretRat_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetseqImo(Index: Integer; const AInteger: Integer);
begin
  FseqImo := AInteger;
  FseqImo_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.seqImo_Specified(Index: Integer): boolean;
begin
  Result := FseqImo_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetsnfNfc(Index: Integer; const Astring: string);
begin
  FsnfNfc := Astring;
  FsnfNfc_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.snfNfc_Specified(Index: Integer): boolean;
begin
  Result := FsnfNfc_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SettipTit(Index: Integer; const Astring: string);
begin
  FtipTit := Astring;
  FtipTit_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.tipTit_Specified(Index: Integer): boolean;
begin
  Result := FtipTit_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetvctFim(Index: Integer; const Astring: string);
begin
  FvctFim := Astring;
  FvctFim_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.vctFim_Specified(Index: Integer): boolean;
begin
  Result := FvctFim_Specified;
end;

procedure titulosConsultarTitulosAbertosCRIn.SetvctIni(Index: Integer; const Astring: string);
begin
  FvctIni := Astring;
  FvctIni_Specified := True;
end;

function titulosConsultarTitulosAbertosCRIn.vctIni_Specified(Index: Integer): boolean;
begin
  Result := FvctIni_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetperCta(Index: Integer; const Astring: string);
begin
  FperCta := Astring;
  FperCta_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosBaixarTitulosCRInBaixaTituloReceberRateios.SetperRat(Index: Integer; const Astring: string);
begin
  FperRat := Astring;
  FperRat_Specified := True;
end;

function titulosBaixarTitulosCRInBaixaTituloReceberRateios.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosBaixarTitulosCROutResultado.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosBaixarTitulosCROutResultado.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosBaixarTitulosCROutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosBaixarTitulosCROutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosBaixarTitulosCROutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosBaixarTitulosCROutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosBaixarTitulosCROutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosBaixarTitulosCROutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosBaixarTitulosCROutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosBaixarTitulosCROutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosBaixarTitulosCROutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosBaixarTitulosCROutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

constructor titulosBaixarTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosBaixarTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosBaixarTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosBaixarTitulosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosBaixarTitulosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosBaixarTitulosCROut.Setresultado(Index: Integer; const AArray_Of_titulosBaixarTitulosCROutResultado: Array_Of_titulosBaixarTitulosCROutResultado);
begin
  Fresultado := AArray_Of_titulosBaixarTitulosCROutResultado;
  Fresultado_Specified := True;
end;

function titulosBaixarTitulosCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosBaixarTitulosCROut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosBaixarTitulosCROut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosSubstituirTitulosCRInTitulosSubstitutosRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosSubstituirTitulosCRInTitulosSubstitutosRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
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

constructor titulosSubstituirTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosSubstituirTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridResult)-1 do
    System.SysUtils.FreeAndNil(FgridResult[I]);
  System.SetLength(FgridResult, 0);
  inherited Destroy;
end;

procedure titulosSubstituirTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosSubstituirTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosSubstituirTitulosCROut.SetgridResult(Index: Integer; const AArray_Of_titulosSubstituirTitulosCROutGridResult: Array_Of_titulosSubstituirTitulosCROutGridResult);
begin
  FgridResult := AArray_Of_titulosSubstituirTitulosCROutGridResult;
  FgridResult_Specified := True;
end;

function titulosSubstituirTitulosCROut.gridResult_Specified(Index: Integer): boolean;
begin
  Result := FgridResult_Specified;
end;

procedure titulosSubstituirTitulosCROut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosSubstituirTitulosCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosSubstituirTitulosCROut.SettipMsg(Index: Integer; const Astring: string);
begin
  FtipMsg := Astring;
  FtipMsg_Specified := True;
end;

function titulosSubstituirTitulosCROut.tipMsg_Specified(Index: Integer): boolean;
begin
  Result := FtipMsg_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosCROutGridResult.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosSubstituirTitulosCROutGridResult.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
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

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosCRE.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

constructor titulosGerarBaixaAproveitamentoCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosGerarBaixaAproveitamentoCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridRetorno)-1 do
    System.SysUtils.FreeAndNil(FgridRetorno[I]);
  System.SetLength(FgridRetorno, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaAproveitamentoCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROut.SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno: Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno);
begin
  FgridRetorno := AArray_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno;
  FgridRetorno_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROut.gridRetorno_Specified(Index: Integer): boolean;
begin
  Result := FgridRetorno_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROutGridRetorno.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROutGridRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROutGridRetorno.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROutGridRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROutGridRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROutGridRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROutGridRetorno.SetmsgErr(Index: Integer; const Astring: string);
begin
  FmsgErr := Astring;
  FmsgErr_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROutGridRetorno.msgErr_Specified(Index: Integer): boolean;
begin
  Result := FmsgErr_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROutGridRetorno.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROutGridRetorno.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCROutGridRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCROutGridRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
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

constructor titulosBaixarTitulosCR2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosBaixarTitulosCR2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCR2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosBaixarTitulosCR2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosBaixarTitulosCR2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosBaixarTitulosCR2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosBaixarTitulosCR2Out.Setresultado(Index: Integer; const AArray_Of_titulosBaixarTitulosCR2OutResultado: Array_Of_titulosBaixarTitulosCR2OutResultado);
begin
  Fresultado := AArray_Of_titulosBaixarTitulosCR2OutResultado;
  Fresultado_Specified := True;
end;

function titulosBaixarTitulosCR2Out.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosBaixarTitulosCR2Out.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosBaixarTitulosCR2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosBaixarTitulosCR2OutResultado.SetseqMov(Index: Integer; const Astring: string);
begin
  FseqMov := Astring;
  FseqMov_Specified := True;
end;

function titulosBaixarTitulosCR2OutResultado.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

destructor titulosExportarBaixaTitulosReceberVendaIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fconsulta)-1 do
    System.SysUtils.FreeAndNil(Fconsulta[I]);
  System.SetLength(Fconsulta, 0);
  inherited Destroy;
end;

procedure titulosExportarBaixaTitulosReceberVendaIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaIn.Setconsulta(Index: Integer; const AArray_Of_titulosExportarBaixaTitulosReceberVendaInConsulta: Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta);
begin
  Fconsulta := AArray_Of_titulosExportarBaixaTitulosReceberVendaInConsulta;
  Fconsulta_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaIn.consulta_Specified(Index: Integer): boolean;
begin
  Result := Fconsulta_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosExportarBaixaTitulosReceberVendaIn.SettipExp(Index: Integer; const Astring: string);
begin
  FtipExp := Astring;
  FtipExp_Specified := True;
end;

function titulosExportarBaixaTitulosReceberVendaIn.tipExp_Specified(Index: Integer): boolean;
begin
  Result := FtipExp_Specified;
end;

destructor titulosBaixarTitulosCR2In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FbaixaTituloReceber)-1 do
    System.SysUtils.FreeAndNil(FbaixaTituloReceber[I]);
  System.SetLength(FbaixaTituloReceber, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCR2In.SetbaixaTituloReceber(Index: Integer; const AArray_Of_titulosBaixarTitulosCR2InBaixaTituloReceber: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber);
begin
  FbaixaTituloReceber := AArray_Of_titulosBaixarTitulosCR2InBaixaTituloReceber;
  FbaixaTituloReceber_Specified := True;
end;

function titulosBaixarTitulosCR2In.baixaTituloReceber_Specified(Index: Integer): boolean;
begin
  Result := FbaixaTituloReceber_Specified;
end;

procedure titulosBaixarTitulosCR2In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function titulosBaixarTitulosCR2In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure titulosBaixarTitulosCR2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosBaixarTitulosCR2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosBaixarTitulosCR2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosBaixarTitulosCR2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

destructor titulosBaixarTitulosCR2InBaixaTituloReceber.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateios)-1 do
    System.SysUtils.FreeAndNil(Frateios[I]);
  System.SetLength(Frateios, 0);
  inherited Destroy;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcodFpg(Index: Integer; const Astring: string);
begin
  FcodFpg := Astring;
  FcodFpg_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetcotMcr(Index: Integer; const Astring: string);
begin
  FcotMcr := Astring;
  FcotMcr_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.cotMcr_Specified(Index: Integer): boolean;
begin
  Result := FcotMcr_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetdatCco(Index: Integer; const Astring: string);
begin
  FdatCco := Astring;
  FdatCco_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.datCco_Specified(Index: Integer): boolean;
begin
  Result := FdatCco_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetdatLib(Index: Integer; const Astring: string);
begin
  FdatLib := Astring;
  FdatLib_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.datLib_Specified(Index: Integer): boolean;
begin
  Result := FdatLib_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetdatMov(Index: Integer; const Astring: string);
begin
  FdatMov := Astring;
  FdatMov_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.datMov_Specified(Index: Integer): boolean;
begin
  Result := FdatMov_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetdiaAtr(Index: Integer; const Astring: string);
begin
  FdiaAtr := Astring;
  FdiaAtr_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.diaAtr_Specified(Index: Integer): boolean;
begin
  Result := FdiaAtr_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetdiaJrs(Index: Integer; const Astring: string);
begin
  FdiaJrs := Astring;
  FdiaJrs_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.diaJrs_Specified(Index: Integer): boolean;
begin
  Result := FdiaJrs_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetempCco(Index: Integer; const Astring: string);
begin
  FempCco := Astring;
  FempCco_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.empCco_Specified(Index: Integer): boolean;
begin
  Result := FempCco_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetfilRlc(Index: Integer; const Astring: string);
begin
  FfilRlc := Astring;
  FfilRlc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.filRlc_Specified(Index: Integer): boolean;
begin
  Result := FfilRlc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetnumDoc(Index: Integer; const Astring: string);
begin
  FnumDoc := Astring;
  FnumDoc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.numDoc_Specified(Index: Integer): boolean;
begin
  Result := FnumDoc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetnumRlc(Index: Integer; const Astring: string);
begin
  FnumRlc := Astring;
  FnumRlc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.numRlc_Specified(Index: Integer): boolean;
begin
  Result := FnumRlc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.Setrateios(Index: Integer; const AArray_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios: Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios);
begin
  Frateios := AArray_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios;
  Frateios_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.rateios_Specified(Index: Integer): boolean;
begin
  Result := Frateios_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetseqCco(Index: Integer; const Astring: string);
begin
  FseqCco := Astring;
  FseqCco_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.seqCco_Specified(Index: Integer): boolean;
begin
  Result := FseqCco_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetseqMov(Index: Integer; const Astring: string);
begin
  FseqMov := Astring;
  FseqMov_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.seqMov_Specified(Index: Integer): boolean;
begin
  Result := FseqMov_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetseqRlc(Index: Integer; const Astring: string);
begin
  FseqRlc := Astring;
  FseqRlc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.seqRlc_Specified(Index: Integer): boolean;
begin
  Result := FseqRlc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SettnsBxa(Index: Integer; const Astring: string);
begin
  FtnsBxa := Astring;
  FtnsBxa_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.tnsBxa_Specified(Index: Integer): boolean;
begin
  Result := FtnsBxa_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SettptRlc(Index: Integer; const Astring: string);
begin
  FtptRlc := Astring;
  FtptRlc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.tptRlc_Specified(Index: Integer): boolean;
begin
  Result := FtptRlc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrBco(Index: Integer; const Astring: string);
begin
  FvlrBco := Astring;
  FvlrBco_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrBco_Specified(Index: Integer): boolean;
begin
  Result := FvlrBco_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrCom(Index: Integer; const Astring: string);
begin
  FvlrCom := Astring;
  FvlrCom_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrCom_Specified(Index: Integer): boolean;
begin
  Result := FvlrCom_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrCor(Index: Integer; const Astring: string);
begin
  FvlrCor := Astring;
  FvlrCor_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrDsc(Index: Integer; const Astring: string);
begin
  FvlrDsc := Astring;
  FvlrDsc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrEnc(Index: Integer; const Astring: string);
begin
  FvlrEnc := Astring;
  FvlrEnc_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrJrs(Index: Integer; const Astring: string);
begin
  FvlrJrs := Astring;
  FvlrJrs_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrLiq(Index: Integer; const Astring: string);
begin
  FvlrLiq := Astring;
  FvlrLiq_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrLiq_Specified(Index: Integer): boolean;
begin
  Result := FvlrLiq_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrMov(Index: Integer; const Astring: string);
begin
  FvlrMov := Astring;
  FvlrMov_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrMov_Specified(Index: Integer): boolean;
begin
  Result := FvlrMov_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrMul(Index: Integer; const Astring: string);
begin
  FvlrMul := Astring;
  FvlrMul_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrOac(Index: Integer; const Astring: string);
begin
  FvlrOac := Astring;
  FvlrOac_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceber.SetvlrOde(Index: Integer; const Astring: string);
begin
  FvlrOde := Astring;
  FvlrOde_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceber.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetcodFpj(Index: Integer; const Astring: string);
begin
  FcodFpj := Astring;
  FcodFpj_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetctaFin(Index: Integer; const Astring: string);
begin
  FctaFin := Astring;
  FctaFin_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetctaRed(Index: Integer; const Astring: string);
begin
  FctaRed := Astring;
  FctaRed_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetnumPrj(Index: Integer; const Astring: string);
begin
  FnumPrj := Astring;
  FnumPrj_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetperCta(Index: Integer; const Astring: string);
begin
  FperCta := Astring;
  FperCta_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosBaixarTitulosCR2InBaixaTituloReceberRateios.SetperRat(Index: Integer; const Astring: string);
begin
  FperRat := Astring;
  FperRat_Specified := True;
end;

function titulosBaixarTitulosCR2InBaixaTituloReceberRateios.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.SetvlrOud(Index: Integer; const ADouble: Double);
begin
  FvlrOud := ADouble;
  FvlrOud_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRInGridTitulosBAI.vlrOud_Specified(Index: Integer): boolean;
begin
  Result := FvlrOud_Specified;
end;

destructor titulosExcluirTitulosCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Ftitulos)-1 do
    System.SysUtils.FreeAndNil(Ftitulos[I]);
  System.SetLength(Ftitulos, 0);
  inherited Destroy;
end;

procedure titulosExcluirTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosExcluirTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosExcluirTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosExcluirTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosExcluirTitulosCRIn.Settitulos(Index: Integer; const AArray_Of_titulosExcluirTitulosCRInTitulos: Array_Of_titulosExcluirTitulosCRInTitulos);
begin
  Ftitulos := AArray_Of_titulosExcluirTitulosCRInTitulos;
  Ftitulos_Specified := True;
end;

function titulosExcluirTitulosCRIn.titulos_Specified(Index: Integer): boolean;
begin
  Result := Ftitulos_Specified;
end;

procedure titulosExcluirTitulosCRInTitulos.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosExcluirTitulosCRInTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosExcluirTitulosCRInTitulos.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosExcluirTitulosCRInTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosExcluirTitulosCRInTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosExcluirTitulosCRInTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosExcluirTitulosCRInTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosExcluirTitulosCRInTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosExcluirTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosExcluirTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fresultado)-1 do
    System.SysUtils.FreeAndNil(Fresultado[I]);
  System.SetLength(Fresultado, 0);
  inherited Destroy;
end;

procedure titulosExcluirTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosExcluirTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosExcluirTitulosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosExcluirTitulosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosExcluirTitulosCROut.Setresultado(Index: Integer; const AArray_Of_titulosExcluirTitulosCROutResultado: Array_Of_titulosExcluirTitulosCROutResultado);
begin
  Fresultado := AArray_Of_titulosExcluirTitulosCROutResultado;
  Fresultado_Specified := True;
end;

function titulosExcluirTitulosCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosExcluirTitulosCROut.SettipoRetorno(Index: Integer; const Astring: string);
begin
  FtipoRetorno := Astring;
  FtipoRetorno_Specified := True;
end;

function titulosExcluirTitulosCROut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetcodFpj(Index: Integer; const AInteger: Integer);
begin
  FcodFpj := AInteger;
  FcodFpj_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.codFpj_Specified(Index: Integer): boolean;
begin
  Result := FcodFpj_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetnumPrj(Index: Integer; const AInteger: Integer);
begin
  FnumPrj := AInteger;
  FnumPrj_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.numPrj_Specified(Index: Integer): boolean;
begin
  Result := FnumPrj_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosEntradaTitulosLoteCRInEntradaTitulosRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosEntradaTitulosLoteCRInEntradaTitulosRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

constructor titulosEntradaTitulosLoteCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEntradaTitulosLoteCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridResult)-1 do
    System.SysUtils.FreeAndNil(FgridResult[I]);
  System.SetLength(FgridResult, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosLoteCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEntradaTitulosLoteCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEntradaTitulosLoteCROut.SetgridResult(Index: Integer; const AArray_Of_titulosEntradaTitulosLoteCROutGridResult: Array_Of_titulosEntradaTitulosLoteCROutGridResult);
begin
  FgridResult := AArray_Of_titulosEntradaTitulosLoteCROutGridResult;
  FgridResult_Specified := True;
end;

function titulosEntradaTitulosLoteCROut.gridResult_Specified(Index: Integer): boolean;
begin
  Result := FgridResult_Specified;
end;

procedure titulosEntradaTitulosLoteCROut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosEntradaTitulosLoteCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosLoteCROutGridResult.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosEntradaTitulosLoteCROutGridResult.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
end;

procedure titulosExcluirTitulosCROutResultado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosExcluirTitulosCROutResultado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosExcluirTitulosCROutResultado.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosExcluirTitulosCROutResultado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosExcluirTitulosCROutResultado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosExcluirTitulosCROutResultado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosExcluirTitulosCROutResultado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosExcluirTitulosCROutResultado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosExcluirTitulosCROutResultado.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosExcluirTitulosCROutResultado.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

constructor titulosGerarBaixaPorLoteCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosGerarBaixaPorLoteCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridRetorno)-1 do
    System.SysUtils.FreeAndNil(FgridRetorno[I]);
  System.SetLength(FgridRetorno, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaPorLoteCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosGerarBaixaPorLoteCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosGerarBaixaPorLoteCROut.SetgridRetorno(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCROutGridRetorno: Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno);
begin
  FgridRetorno := AArray_Of_titulosGerarBaixaPorLoteCROutGridRetorno;
  FgridRetorno_Specified := True;
end;

function titulosGerarBaixaPorLoteCROut.gridRetorno_Specified(Index: Integer): boolean;
begin
  Result := FgridRetorno_Specified;
end;

procedure titulosGerarBaixaPorLoteCROut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosGerarBaixaPorLoteCROut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosGerarBaixaPorLoteCROut.SettipMsg(Index: Integer; const Astring: string);
begin
  FtipMsg := Astring;
  FtipMsg_Specified := True;
end;

function titulosGerarBaixaPorLoteCROut.tipMsg_Specified(Index: Integer): boolean;
begin
  Result := FtipMsg_Specified;
end;

procedure titulosGerarBaixaPorLoteCROutGridRetorno.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaPorLoteCROutGridRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaPorLoteCROutGridRetorno.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaPorLoteCROutGridRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaPorLoteCROutGridRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaPorLoteCROutGridRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaPorLoteCROutGridRetorno.SetmsgErr(Index: Integer; const Astring: string);
begin
  FmsgErr := Astring;
  FmsgErr_Specified := True;
end;

function titulosGerarBaixaPorLoteCROutGridRetorno.msgErr_Specified(Index: Integer): boolean;
begin
  Result := FmsgErr_Specified;
end;

procedure titulosGerarBaixaPorLoteCROutGridRetorno.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaPorLoteCROutGridRetorno.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaPorLoteCROutGridRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaPorLoteCROutGridRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

destructor titulosGerarBaixaAproveitamentoCRIn.Destroy;
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

procedure titulosGerarBaixaAproveitamentoCRIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetdatBai(Index: Integer; const Astring: string);
begin
  FdatBai := Astring;
  FdatBai_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.datBai_Specified(Index: Integer): boolean;
begin
  Result := FdatBai_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetgridTitulosBAI(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI);
begin
  FgridTitulosBAI := AArray_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI;
  FgridTitulosBAI_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.gridTitulosBAI_Specified(Index: Integer): boolean;
begin
  Result := FgridTitulosBAI_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetgridTitulosCRE(Index: Integer; const AArray_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE: Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE);
begin
  FgridTitulosCRE := AArray_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE;
  FgridTitulosCRE_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.gridTitulosCRE_Specified(Index: Integer): boolean;
begin
  Result := FgridTitulosCRE_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SettnsCre(Index: Integer; const Astring: string);
begin
  FtnsCre := Astring;
  FtnsCre_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.tnsCre_Specified(Index: Integer): boolean;
begin
  Result := FtnsCre_Specified;
end;

procedure titulosGerarBaixaAproveitamentoCRIn.SettnsDup(Index: Integer; const Astring: string);
begin
  FtnsDup := Astring;
  FtnsDup_Specified := True;
end;

function titulosGerarBaixaAproveitamentoCRIn.tnsDup_Specified(Index: Integer): boolean;
begin
  Result := FtnsDup_Specified;
end;

destructor titulosGerarBaixaPorLoteCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridTesouraria)-1 do
    System.SysUtils.FreeAndNil(FgridTesouraria[I]);
  System.SetLength(FgridTesouraria, 0);
  for I := 0 to System.Length(FgridTitulosBaixar)-1 do
    System.SysUtils.FreeAndNil(FgridTitulosBaixar[I]);
  System.SetLength(FgridTitulosBaixar, 0);
  inherited Destroy;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetcodEqu(Index: Integer; const AInteger: Integer);
begin
  FcodEqu := AInteger;
  FcodEqu_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.codEqu_Specified(Index: Integer): boolean;
begin
  Result := FcodEqu_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetdatBai(Index: Integer; const Astring: string);
begin
  FdatBai := Astring;
  FdatBai_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.datBai_Specified(Index: Integer): boolean;
begin
  Result := FdatBai_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetdatCxb(Index: Integer; const Astring: string);
begin
  FdatCxb := Astring;
  FdatCxb_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.datCxb_Specified(Index: Integer): boolean;
begin
  Result := FdatCxb_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetgridTesouraria(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCRInGridTesouraria: Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria);
begin
  FgridTesouraria := AArray_Of_titulosGerarBaixaPorLoteCRInGridTesouraria;
  FgridTesouraria_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.gridTesouraria_Specified(Index: Integer): boolean;
begin
  Result := FgridTesouraria_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetgridTitulosBaixar(Index: Integer; const AArray_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar: Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar);
begin
  FgridTitulosBaixar := AArray_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar;
  FgridTitulosBaixar_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.gridTitulosBaixar_Specified(Index: Integer): boolean;
begin
  Result := FgridTitulosBaixar_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetnumCco(Index: Integer; const Astring: string);
begin
  FnumCco := Astring;
  FnumCco_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.numCco_Specified(Index: Integer): boolean;
begin
  Result := FnumCco_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetnumDoc(Index: Integer; const Astring: string);
begin
  FnumDoc := Astring;
  FnumDoc_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.numDoc_Specified(Index: Integer): boolean;
begin
  Result := FnumDoc_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SettnsBai(Index: Integer; const Astring: string);
begin
  FtnsBai := Astring;
  FtnsBai_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.tnsBai_Specified(Index: Integer): boolean;
begin
  Result := FtnsBai_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SettnsCxb(Index: Integer; const Astring: string);
begin
  FtnsCxb := Astring;
  FtnsCxb_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.tnsCxb_Specified(Index: Integer): boolean;
begin
  Result := FtnsCxb_Specified;
end;

procedure titulosGerarBaixaPorLoteCRIn.SetvlrLiq(Index: Integer; const ADouble: Double);
begin
  FvlrLiq := ADouble;
  FvlrLiq_Specified := True;
end;

function titulosGerarBaixaPorLoteCRIn.vlrLiq_Specified(Index: Integer): boolean;
begin
  Result := FvlrLiq_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTesouraria.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTesouraria.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTesouraria.SetdatCtb(Index: Integer; const Astring: string);
begin
  FdatCtb := Astring;
  FdatCtb_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTesouraria.datCtb_Specified(Index: Integer): boolean;
begin
  Result := FdatCtb_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTesouraria.SetdatLib(Index: Integer; const Astring: string);
begin
  FdatLib := Astring;
  FdatLib_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTesouraria.datLib_Specified(Index: Integer): boolean;
begin
  Result := FdatLib_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTesouraria.SetvlrMov(Index: Integer; const ADouble: Double);
begin
  FvlrMov := ADouble;
  FvlrMov_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTesouraria.vlrMov_Specified(Index: Integer): boolean;
begin
  Result := FvlrMov_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetnumInt(Index: Integer; const Astring: string);
begin
  FnumInt := Astring;
  FnumInt_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.numInt_Specified(Index: Integer): boolean;
begin
  Result := FnumInt_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetobsMcr(Index: Integer; const Astring: string);
begin
  FobsMcr := Astring;
  FobsMcr_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.obsMcr_Specified(Index: Integer): boolean;
begin
  Result := FobsMcr_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrBai(Index: Integer; const Astring: string);
begin
  FvlrBai := Astring;
  FvlrBai_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrCor(Index: Integer; const ADouble: Double);
begin
  FvlrCor := ADouble;
  FvlrCor_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrCor_Specified(Index: Integer): boolean;
begin
  Result := FvlrCor_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrDsc(Index: Integer; const ADouble: Double);
begin
  FvlrDsc := ADouble;
  FvlrDsc_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrDsc_Specified(Index: Integer): boolean;
begin
  Result := FvlrDsc_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrEnc(Index: Integer; const ADouble: Double);
begin
  FvlrEnc := ADouble;
  FvlrEnc_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrEnc_Specified(Index: Integer): boolean;
begin
  Result := FvlrEnc_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrJrs(Index: Integer; const ADouble: Double);
begin
  FvlrJrs := ADouble;
  FvlrJrs_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrJrs_Specified(Index: Integer): boolean;
begin
  Result := FvlrJrs_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrMul(Index: Integer; const ADouble: Double);
begin
  FvlrMul := ADouble;
  FvlrMul_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrMul_Specified(Index: Integer): boolean;
begin
  Result := FvlrMul_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrOac(Index: Integer; const ADouble: Double);
begin
  FvlrOac := ADouble;
  FvlrOac_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrOac_Specified(Index: Integer): boolean;
begin
  Result := FvlrOac_Specified;
end;

procedure titulosGerarBaixaPorLoteCRInGridTitulosBaixar.SetvlrOde(Index: Integer; const ADouble: Double);
begin
  FvlrOde := ADouble;
  FvlrOde_Specified := True;
end;

function titulosGerarBaixaPorLoteCRInGridTitulosBaixar.vlrOde_Specified(Index: Integer): boolean;
begin
  Result := FvlrOde_Specified;
end;

initialization
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), ioLiteral);
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.ConsultarTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ConsultarTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ConsultarTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.ConsultarTitulosAbertosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ConsultarTitulosAbertosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ConsultarTitulosAbertosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.GravarTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'GravarTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'GravarTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.EntradaTitulosLoteCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'EntradaTitulosLoteCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'EntradaTitulosLoteCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.BaixarTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'BaixarTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'BaixarTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.BaixarTitulosCR_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'BaixarTitulosCR_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'BaixarTitulosCR_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.ExcluirTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ExcluirTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ExcluirTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.SubstituirTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'SubstituirTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'SubstituirTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.GerarBaixaAproveitamentoCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'GerarBaixaAproveitamentoCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'GerarBaixaAproveitamentoCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.GerarBaixaPorLoteCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'GerarBaixaPorLoteCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'GerarBaixaPorLoteCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.EstornoBaixaTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'EstornoBaixaTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'EstornoBaixaTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.EstornoBaixaTitulosCR_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'EstornoBaixaTitulosCR_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'EstornoBaixaTitulosCR_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.ExportarBaixaTitulosReceberVenda }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ExportarBaixaTitulosReceberVenda', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ExportarBaixaTitulosReceberVenda', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.ProcessarVariacaoCambial }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ProcessarVariacaoCambial', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ProcessarVariacaoCambial', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_mfi_cre_titulos.ProcessarAVM }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ProcessarAVM', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_mfi_cre_titulos), 'ProcessarAVM', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCRInTitulosSubstitutosRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCROutGridResult), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCROutGridResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosCRInTitulosBaixar), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosCRInTitulosBaixar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular), 'http://services.senior.com.br', 'Array_Of_titulosProcessarVariacaoCambialInTitulosACalcular');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCROutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCROutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGravarTitulosCRInTitulos), 'http://services.senior.com.br', 'Array_Of_titulosGravarTitulosCRInTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGravarTitulosCRInTitulosRateios), 'http://services.senior.com.br', 'Array_Of_titulosGravarTitulosCRInTitulosRateios');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados), 'http://services.senior.com.br', 'Array_Of_titulosProcessarVariacaoCambialOutTitulosCalculados');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosCROutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosCROutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCRInTitulosReceber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta), 'http://services.senior.com.br', 'Array_Of_titulosExportarBaixaTitulosReceberVendaInConsulta');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos), 'http://services.senior.com.br', 'Array_Of_titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros), 'http://services.senior.com.br', 'Array_Of_titulosExportarBaixaTitulosReceberVendaOutErros');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCR2InBaixaTituloReceberRateios');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCR2OutResultado), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCR2OutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosAbertosCROutTitulos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosAbertosCROutTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCRInBaixaTituloReceber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCRInBaixaTituloReceberRateios');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosBaixarTitulosCROutResultado), 'http://services.senior.com.br', 'Array_Of_titulosBaixarTitulosCROutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTitulosAbertosCROutTitulosRateios');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCR2InTitulosReceber');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosEstornoBaixaTitulosCR2OutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarAVMOutTitulosCalculados), 'http://services.senior.com.br', 'Array_Of_titulosProcessarAVMOutTitulosCalculados');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosLoteCROutGridResult), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosLoteCROutGridResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExcluirTitulosCRInTitulos), 'http://services.senior.com.br', 'Array_Of_titulosExcluirTitulosCRInTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosExcluirTitulosCROutResultado), 'http://services.senior.com.br', 'Array_Of_titulosExcluirTitulosCROutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGravarTitulosCROutResultado), 'http://services.senior.com.br', 'Array_Of_titulosGravarTitulosCROutResultado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosLoteCRInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaPorLoteCRInGridTesouraria');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosCRE');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaAproveitamentoCROutGridRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosProcessarAVMInTitulosACalcular), 'http://services.senior.com.br', 'Array_Of_titulosProcessarAVMInTitulosACalcular');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaPorLoteCRInGridTitulosBaixar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaPorLoteCROutGridRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI), 'http://services.senior.com.br', 'Array_Of_titulosGerarBaixaAproveitamentoCRInGridTitulosBAI');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCRIn, 'http://services.senior.com.br', 'titulosSubstituirTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCRInTitulosSubstitutos, 'http://services.senior.com.br', 'titulosSubstituirTitulosCRInTitulosSubstitutos');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCRInTitulosBaixar, 'http://services.senior.com.br', 'titulosSubstituirTitulosCRInTitulosBaixar');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCRIn, 'http://services.senior.com.br', 'titulosConsultarTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCROut, 'http://services.senior.com.br', 'titulosGravarTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosGravarTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCRInTitulosRateios, 'http://services.senior.com.br', 'titulosGravarTitulosCRInTitulosRateios');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCRInTitulos, 'http://services.senior.com.br', 'titulosGravarTitulosCRInTitulos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCRInEntradaTitulos, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCRInEntradaTitulos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCRIn, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCRIn');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCROutResultado, 'http://services.senior.com.br', 'titulosGravarTitulosCROutResultado');
  RemClassRegistry.RegisterXSClass(titulosGravarTitulosCRIn, 'http://services.senior.com.br', 'titulosGravarTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCRIn, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCROutTitulos, 'http://services.senior.com.br', 'titulosConsultarTitulosCROutTitulos');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosCROut, 'http://services.senior.com.br', 'titulosConsultarTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCROutRetorno, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCROutRetorno');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCROut, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosEstornoBaixaTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCRInTitulosReceber, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCRInTitulosReceber');
  RemClassRegistry.RegisterXSClass(titulosExportarBaixaTitulosReceberVendaInConsulta, 'http://services.senior.com.br', 'titulosExportarBaixaTitulosReceberVendaInConsulta');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCR2Out, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCR2Out');
  RemClassRegistry.RegisterSerializeOptions(titulosEstornoBaixaTitulosCR2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCR2InTitulosReceber, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCR2InTitulosReceber');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCR2In, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCR2In');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCRInBaixaTituloReceber, 'http://services.senior.com.br', 'titulosBaixarTitulosCRInBaixaTituloReceber');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCRIn, 'http://services.senior.com.br', 'titulosBaixarTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosEstornoBaixaTitulosCR2OutRetorno, 'http://services.senior.com.br', 'titulosEstornoBaixaTitulosCR2OutRetorno');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCROutTitulosRateios, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCROutTitulosRateios');
  RemClassRegistry.RegisterXSClass(titulosExportarBaixaTitulosReceberVendaOutErros, 'http://services.senior.com.br', 'titulosExportarBaixaTitulosReceberVendaOutErros');
  RemClassRegistry.RegisterXSClass(titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos, 'http://services.senior.com.br', 'titulosExportarBaixaTitulosReceberVendaOutBaixaTitulos');
  RemClassRegistry.RegisterXSClass(titulosExportarBaixaTitulosReceberVendaOut, 'http://services.senior.com.br', 'titulosExportarBaixaTitulosReceberVendaOut');
  RemClassRegistry.RegisterSerializeOptions(titulosExportarBaixaTitulosReceberVendaOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCROutTitulos, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCROutTitulos');
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCROut, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTitulosAbertosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTitulosAbertosCRIn, 'http://services.senior.com.br', 'titulosConsultarTitulosAbertosCRIn');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCRInBaixaTituloReceberRateios, 'http://services.senior.com.br', 'titulosBaixarTitulosCRInBaixaTituloReceberRateios');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCROutResultado, 'http://services.senior.com.br', 'titulosBaixarTitulosCROutResultado');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCROut, 'http://services.senior.com.br', 'titulosBaixarTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosBaixarTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCRInTitulosSubstitutosRateio, 'http://services.senior.com.br', 'titulosSubstituirTitulosCRInTitulosSubstitutosRateio');
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialInTitulosACalcular, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialInTitulosACalcular');
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialOut, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialOut');
  RemClassRegistry.RegisterSerializeOptions(titulosProcessarVariacaoCambialOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialOutTitulosCalculados, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialOutTitulosCalculados');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCROut, 'http://services.senior.com.br', 'titulosSubstituirTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosSubstituirTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosCROutGridResult, 'http://services.senior.com.br', 'titulosSubstituirTitulosCROutGridResult');
  RemClassRegistry.RegisterXSClass(titulosProcessarVariacaoCambialIn, 'http://services.senior.com.br', 'titulosProcessarVariacaoCambialIn');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMIn, 'http://services.senior.com.br', 'titulosProcessarAVMIn');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMInTitulosACalcular, 'http://services.senior.com.br', 'titulosProcessarAVMInTitulosACalcular');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMOut, 'http://services.senior.com.br', 'titulosProcessarAVMOut');
  RemClassRegistry.RegisterSerializeOptions(titulosProcessarAVMOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCRInGridTitulosCRE, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCRInGridTitulosCRE');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCROut, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosGerarBaixaAproveitamentoCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCROutGridRetorno, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCROutGridRetorno');
  RemClassRegistry.RegisterXSClass(titulosProcessarAVMOutTitulosCalculados, 'http://services.senior.com.br', 'titulosProcessarAVMOutTitulosCalculados');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCR2Out, 'http://services.senior.com.br', 'titulosBaixarTitulosCR2Out');
  RemClassRegistry.RegisterSerializeOptions(titulosBaixarTitulosCR2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCR2OutResultado, 'http://services.senior.com.br', 'titulosBaixarTitulosCR2OutResultado');
  RemClassRegistry.RegisterXSClass(titulosExportarBaixaTitulosReceberVendaIn, 'http://services.senior.com.br', 'titulosExportarBaixaTitulosReceberVendaIn');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCR2In, 'http://services.senior.com.br', 'titulosBaixarTitulosCR2In');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCR2InBaixaTituloReceber, 'http://services.senior.com.br', 'titulosBaixarTitulosCR2InBaixaTituloReceber');
  RemClassRegistry.RegisterXSClass(titulosBaixarTitulosCR2InBaixaTituloReceberRateios, 'http://services.senior.com.br', 'titulosBaixarTitulosCR2InBaixaTituloReceberRateios');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCRInGridTitulosBAI, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCRInGridTitulosBAI');
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCRIn, 'http://services.senior.com.br', 'titulosExcluirTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCRInTitulos, 'http://services.senior.com.br', 'titulosExcluirTitulosCRInTitulos');
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCROut, 'http://services.senior.com.br', 'titulosExcluirTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosExcluirTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCRInEntradaTitulosRateio, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCRInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCROut, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosEntradaTitulosLoteCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosLoteCROutGridResult, 'http://services.senior.com.br', 'titulosEntradaTitulosLoteCROutGridResult');
  RemClassRegistry.RegisterXSClass(titulosExcluirTitulosCROutResultado, 'http://services.senior.com.br', 'titulosExcluirTitulosCROutResultado');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCROut, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosGerarBaixaPorLoteCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCROutGridRetorno, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCROutGridRetorno');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaAproveitamentoCRIn, 'http://services.senior.com.br', 'titulosGerarBaixaAproveitamentoCRIn');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCRIn, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCRIn');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCRInGridTesouraria, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCRInGridTesouraria');
  RemClassRegistry.RegisterXSClass(titulosGerarBaixaPorLoteCRInGridTitulosBaixar, 'http://services.senior.com.br', 'titulosGerarBaixaPorLoteCRInGridTitulosBaixar');

end.