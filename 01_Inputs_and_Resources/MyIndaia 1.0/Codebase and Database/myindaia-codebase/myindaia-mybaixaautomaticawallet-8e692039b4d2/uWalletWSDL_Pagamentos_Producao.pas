// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (27/12/2018 10:14:15 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_Pagamentos_Producao;

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
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  titulosEntradaTitulosCPIn = class;            { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCPOut = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosSubstituirTitulosIn = class;           { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCPOutRetorno = class;    { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosInTitulosSubstitutos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosInTitulosBaixar = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCPInEntradaTitulosRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCPInEntradaTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTituloCPOut = class;          { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTituloCPOutRetornos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTituloCPIn = class;           { "http://services.senior.com.br"[GblCplx] }
  titulosSubstituirTitulosOut = class;          { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosSubstituirTitulosOutGridResult = class;   { "http://services.senior.com.br"[GblCplx] }

  Array_Of_titulosSubstituirTitulosInTitulosBaixar = array of titulosSubstituirTitulosInTitulosBaixar;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosInTitulosSubstitutos = array of titulosSubstituirTitulosInTitulosSubstitutos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio = array of titulosEntradaTitulosCPInEntradaTitulosRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosCPOutRetorno = array of titulosEntradaTitulosCPOutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosCPInEntradaTitulos = array of titulosEntradaTitulosCPInEntradaTitulos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosSubstituirTitulosOutGridResult = array of titulosSubstituirTitulosOutGridResult;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTituloCPOutRetornos = array of titulosConsultarTituloCPOutRetornos;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCPIn = class(TRemotable)
  private
    FentradaTitulos: Array_Of_titulosEntradaTitulosCPInEntradaTitulos;
    FentradaTitulos_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosCPInEntradaTitulos: Array_Of_titulosEntradaTitulosCPInEntradaTitulos);
    function  entradaTitulos_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property entradaTitulos: Array_Of_titulosEntradaTitulosCPInEntradaTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FentradaTitulos write SetentradaTitulos stored entradaTitulos_Specified;
    property flowInstanceID: string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEntradaTitulosCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretorno: Array_Of_titulosEntradaTitulosCPOutRetorno;
    Fretorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosEntradaTitulosCPOutRetorno: Array_Of_titulosEntradaTitulosCPOutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retorno:         Array_Of_titulosEntradaTitulosCPOutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosIn = class(TRemotable)
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
    FtitulosBaixar: Array_Of_titulosSubstituirTitulosInTitulosBaixar;
    FtitulosBaixar_Specified: boolean;
    FtitulosSubstitutos: Array_Of_titulosSubstituirTitulosInTitulosSubstitutos;
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
    procedure SettitulosBaixar(Index: Integer; const AArray_Of_titulosSubstituirTitulosInTitulosBaixar: Array_Of_titulosSubstituirTitulosInTitulosBaixar);
    function  titulosBaixar_Specified(Index: Integer): boolean;
    procedure SettitulosSubstitutos(Index: Integer; const AArray_Of_titulosSubstituirTitulosInTitulosSubstitutos: Array_Of_titulosSubstituirTitulosInTitulosSubstitutos);
    function  titulosSubstitutos_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:             Integer                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:             Integer                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTns:             string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property datPgt:             string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPgt write SetdatPgt stored datPgt_Specified;
    property flowInstanceID:     string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property titulosBaixar:      Array_Of_titulosSubstituirTitulosInTitulosBaixar       Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosBaixar write SettitulosBaixar stored titulosBaixar_Specified;
    property titulosSubstitutos: Array_Of_titulosSubstituirTitulosInTitulosSubstitutos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtitulosSubstitutos write SettitulosSubstitutos stored titulosSubstitutos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCPOutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCPOutRetorno = class(TRemotable)
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
  // XML       : titulosSubstituirTitulosInTitulosSubstitutos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosInTitulosSubstitutos = class(TRemotable)
  private
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodMoe: string;
    FcodMoe_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcpfCnpj: string;
    FcpfCnpj_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvctPro: string;
    FvctPro_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodMoe(Index: Integer; const Astring: string);
    function  codMoe_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcpfCnpj(Index: Integer; const Astring: string);
    function  cpfCnpj_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvctPro(Index: Integer; const Astring: string);
    function  vctPro_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property codBar:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codCrt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codMoe:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMoe write SetcodMoe stored codMoe_Specified;
    property codPor:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codTns:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cpfCnpj: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpfCnpj write SetcpfCnpj stored cpfCnpj_Specified;
    property datEmi:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datPpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcp:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property vctOri:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vctPro:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctPro write SetvctPro stored vctPro_Specified;
    property vlrOri:  Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosInTitulosBaixar, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosInTitulosBaixar = class(TRemotable)
  private
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcpfCnpj: string;
    FcpfCnpj_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsMcp: string;
    FobsMcp_Specified: boolean;
    FvlrBai: Double;
    FvlrBai_Specified: boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetcpfCnpj(Index: Integer; const Astring: string);
    function  cpfCnpj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsMcp(Index: Integer; const Astring: string);
    function  obsMcp_Specified(Index: Integer): boolean;
    procedure SetvlrBai(Index: Integer; const ADouble: Double);
    function  vlrBai_Specified(Index: Integer): boolean;
  published
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cpfCnpj: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpfCnpj write SetcpfCnpj stored cpfCnpj_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsMcp:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMcp write SetobsMcp stored obsMcp_Specified;
    property vlrBai:  Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBai write SetvlrBai stored vlrBai_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCPInEntradaTitulosRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCPInEntradaTitulosRateio = class(TRemotable)
  private
    FcodCcu: string;
    FcodCcu_Specified: boolean;
    FctaFin: Integer;
    FctaFin_Specified: boolean;
    FctaRed: Integer;
    FctaRed_Specified: boolean;
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
    procedure SetctaFin(Index: Integer; const AInteger: Integer);
    function  ctaFin_Specified(Index: Integer): boolean;
    procedure SetctaRed(Index: Integer; const AInteger: Integer);
    function  ctaRed_Specified(Index: Integer): boolean;
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
    property ctaFin: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFin write SetctaFin stored ctaFin_Specified;
    property ctaRed: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property obsRat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsRat write SetobsRat stored obsRat_Specified;
    property perCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCta write SetperCta stored perCta_Specified;
    property perRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperRat write SetperRat stored perRat_Specified;
    property vlrCta: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrCta write SetvlrCta stored vlrCta_Specified;
    property vlrRat: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrRat write SetvlrRat stored vlrRat_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCPInEntradaTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCPInEntradaTitulos = class(TRemotable)
  private
    FccbFor: string;
    FccbFor_Specified: boolean;
    FcodAge: string;
    FcodAge_Specified: boolean;
    FcodBan: string;
    FcodBan_Specified: boolean;
    FcodBar: string;
    FcodBar_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFav: string;
    FcodFav_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodTns: string;
    FcodTns_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FnumPrc: string;
    FnumPrc_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTcp: string;
    FobsTcp_Specified: boolean;
    FperJrs: Double;
    FperJrs_Specified: boolean;
    Frateio: Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio;
    Frateio_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetccbFor(Index: Integer; const Astring: string);
    function  ccbFor_Specified(Index: Integer): boolean;
    procedure SetcodAge(Index: Integer; const Astring: string);
    function  codAge_Specified(Index: Integer): boolean;
    procedure SetcodBan(Index: Integer; const Astring: string);
    function  codBan_Specified(Index: Integer): boolean;
    procedure SetcodBar(Index: Integer; const Astring: string);
    function  codBar_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFav(Index: Integer; const Astring: string);
    function  codFav_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodTns(Index: Integer; const Astring: string);
    function  codTns_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetnumPrc(Index: Integer; const Astring: string);
    function  numPrc_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTcp(Index: Integer; const Astring: string);
    function  obsTcp_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const ADouble: Double);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosCPInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property ccbFor: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbFor write SetccbFor stored ccbFor_Specified;
    property codAge: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codBar: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBar write SetcodBar stored codBar_Specified;
    property codEmp: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFav: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFav write SetcodFav stored codFav_Specified;
    property codFil: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codFpg: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codTns: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property datEmi: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datPpt: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property numPrc: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numTit: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcp: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcp write SetobsTcp stored obsTcp_Specified;
    property perJrs: Double                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property rateio: Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property vctOri: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrOri: Double                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTituloCPOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTituloCPOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretornos: Array_Of_titulosConsultarTituloCPOutRetornos;
    Fretornos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretornos(Index: Integer; const AArray_Of_titulosConsultarTituloCPOutRetornos: Array_Of_titulosConsultarTituloCPOutRetornos);
    function  retornos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornos:        Array_Of_titulosConsultarTituloCPOutRetornos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretornos write Setretornos stored retornos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTituloCPOutRetornos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTituloCPOutRetornos = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FdatEmi: string;
    FdatEmi_Specified: boolean;
    FdatEnt: string;
    FdatEnt_Specified: boolean;
    FdatPpt: string;
    FdatPpt_Specified: boolean;
    FforRlc: Integer;
    FforRlc_Specified: boolean;
    FnumPrc: string;
    FnumPrc_Specified: boolean;
    FnumRlc: string;
    FnumRlc_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FobsTit: string;
    FobsTit_Specified: boolean;
    FsitTit: string;
    FsitTit_Specified: boolean;
    FtptRlc: string;
    FtptRlc_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrAbe: Double;
    FvlrAbe_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetdatEmi(Index: Integer; const Astring: string);
    function  datEmi_Specified(Index: Integer): boolean;
    procedure SetdatEnt(Index: Integer; const Astring: string);
    function  datEnt_Specified(Index: Integer): boolean;
    procedure SetdatPpt(Index: Integer; const Astring: string);
    function  datPpt_Specified(Index: Integer): boolean;
    procedure SetforRlc(Index: Integer; const AInteger: Integer);
    function  forRlc_Specified(Index: Integer): boolean;
    procedure SetnumPrc(Index: Integer; const Astring: string);
    function  numPrc_Specified(Index: Integer): boolean;
    procedure SetnumRlc(Index: Integer; const Astring: string);
    function  numRlc_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SetobsTit(Index: Integer; const Astring: string);
    function  obsTit_Specified(Index: Integer): boolean;
    procedure SetsitTit(Index: Integer; const Astring: string);
    function  sitTit_Specified(Index: Integer): boolean;
    procedure SettptRlc(Index: Integer; const Astring: string);
    function  tptRlc_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrAbe(Index: Integer; const ADouble: Double);
    function  vlrAbe_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property datEmi: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datPpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property forRlc: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FforRlc write SetforRlc stored forRlc_Specified;
    property numPrc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numRlc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRlc write SetnumRlc stored numRlc_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTit write SetobsTit stored obsTit_Specified;
    property sitTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitTit write SetsitTit stored sitTit_Specified;
    property tptRlc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtptRlc write SettptRlc stored tptRlc_Specified;
    property vctOri: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrAbe: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAbe write SetvlrAbe stored vlrAbe_Specified;
    property vlrOri: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTituloCPIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTituloCPIn = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FnumPrc: string;
    FnumPrc_Specified: boolean;
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
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetnumPrc(Index: Integer; const Astring: string);
    function  numPrc_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
  published
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property numPrc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numTit:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosSubstituirTitulosOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FgridResult: Array_Of_titulosSubstituirTitulosOutGridResult;
    FgridResult_Specified: boolean;
    Fresultado: string;
    Fresultado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetgridResult(Index: Integer; const AArray_Of_titulosSubstituirTitulosOutGridResult: Array_Of_titulosSubstituirTitulosOutGridResult);
    function  gridResult_Specified(Index: Integer): boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property gridResult:   Array_Of_titulosSubstituirTitulosOutGridResult  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FgridResult write SetgridResult stored gridResult_Specified;
    property resultado:    string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosSubstituirTitulosOutGridResult, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosSubstituirTitulosOutGridResult = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FcpfCnpj: string;
    FcpfCnpj_Specified: boolean;
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
    procedure SetcpfCnpj(Index: Integer; const Astring: string);
    function  cpfCnpj_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettxtRet(Index: Integer; const Astring: string);
    function  txtRet_Specified(Index: Integer): boolean;
  published
    property codEmp:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFor:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codTpt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property cpfCnpj: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcpfCnpj write SetcpfCnpj stored cpfCnpj_Specified;
    property numTit:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property txtRet:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtxtRet write SettxtRet stored txtRet_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulosPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulosPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos
  // ************************************************************************ //
  sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos = interface(IInvokable)
  ['{61B70087-B3D9-58E0-691E-133F9278CD1B}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EntradaTitulosCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosEntradaTitulosCPIn): titulosEntradaTitulosCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTituloCP(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTituloCPIn): titulosConsultarTituloCPOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  SubstituirTitulos(const user: string; const password: string; const encryption: Integer; const parameters: titulosSubstituirTitulosIn): titulosSubstituirTitulosOut; stdcall;
  end;

function Getsapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos(Producao : Boolean; UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos;


implementation
  uses System.SysUtils;

function Getsapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos(Producao : Boolean; UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos';
  defWSDL_hmlg = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos?wsdl';
  defURL_hmlg  = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulosPort';
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
    Result := (RIO as sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos);
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


destructor titulosEntradaTitulosCPIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FentradaTitulos)-1 do
    System.SysUtils.FreeAndNil(FentradaTitulos[I]);
  System.SetLength(FentradaTitulos, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosCPIn.SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosCPInEntradaTitulos: Array_Of_titulosEntradaTitulosCPInEntradaTitulos);
begin
  FentradaTitulos := AArray_Of_titulosEntradaTitulosCPInEntradaTitulos;
  FentradaTitulos_Specified := True;
end;

function titulosEntradaTitulosCPIn.entradaTitulos_Specified(Index: Integer): boolean;
begin
  Result := FentradaTitulos_Specified;
end;

procedure titulosEntradaTitulosCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEntradaTitulosCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEntradaTitulosCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEntradaTitulosCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor titulosEntradaTitulosCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEntradaTitulosCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEntradaTitulosCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEntradaTitulosCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEntradaTitulosCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEntradaTitulosCPOut.Setretorno(Index: Integer; const AArray_Of_titulosEntradaTitulosCPOutRetorno: Array_Of_titulosEntradaTitulosCPOutRetorno);
begin
  Fretorno := AArray_Of_titulosEntradaTitulosCPOutRetorno;
  Fretorno_Specified := True;
end;

function titulosEntradaTitulosCPOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

destructor titulosSubstituirTitulosIn.Destroy;
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

procedure titulosSubstituirTitulosIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosSubstituirTitulosIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosSubstituirTitulosIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosIn.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosSubstituirTitulosIn.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosSubstituirTitulosIn.SetdatPgt(Index: Integer; const Astring: string);
begin
  FdatPgt := Astring;
  FdatPgt_Specified := True;
end;

function titulosSubstituirTitulosIn.datPgt_Specified(Index: Integer): boolean;
begin
  Result := FdatPgt_Specified;
end;

procedure titulosSubstituirTitulosIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosSubstituirTitulosIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosSubstituirTitulosIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosSubstituirTitulosIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosSubstituirTitulosIn.SettitulosBaixar(Index: Integer; const AArray_Of_titulosSubstituirTitulosInTitulosBaixar: Array_Of_titulosSubstituirTitulosInTitulosBaixar);
begin
  FtitulosBaixar := AArray_Of_titulosSubstituirTitulosInTitulosBaixar;
  FtitulosBaixar_Specified := True;
end;

function titulosSubstituirTitulosIn.titulosBaixar_Specified(Index: Integer): boolean;
begin
  Result := FtitulosBaixar_Specified;
end;

procedure titulosSubstituirTitulosIn.SettitulosSubstitutos(Index: Integer; const AArray_Of_titulosSubstituirTitulosInTitulosSubstitutos: Array_Of_titulosSubstituirTitulosInTitulosSubstitutos);
begin
  FtitulosSubstitutos := AArray_Of_titulosSubstituirTitulosInTitulosSubstitutos;
  FtitulosSubstitutos_Specified := True;
end;

function titulosSubstituirTitulosIn.titulosSubstitutos_Specified(Index: Integer): boolean;
begin
  Result := FtitulosSubstitutos_Specified;
end;

procedure titulosEntradaTitulosCPOutRetorno.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosCPOutRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosCPOutRetorno.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosCPOutRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosCPOutRetorno.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEntradaTitulosCPOutRetorno.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEntradaTitulosCPOutRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosCPOutRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosCPOutRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosCPOutRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosCPOutRetorno.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosEntradaTitulosCPOutRetorno.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodMoe(Index: Integer; const Astring: string);
begin
  FcodMoe := Astring;
  FcodMoe_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codMoe_Specified(Index: Integer): boolean;
begin
  Result := FcodMoe_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetcpfCnpj(Index: Integer; const Astring: string);
begin
  FcpfCnpj := Astring;
  FcpfCnpj_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.cpfCnpj_Specified(Index: Integer): boolean;
begin
  Result := FcpfCnpj_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetvctPro(Index: Integer; const Astring: string);
begin
  FvctPro := Astring;
  FvctPro_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.vctPro_Specified(Index: Integer): boolean;
begin
  Result := FvctPro_Specified;
end;

procedure titulosSubstituirTitulosInTitulosSubstitutos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosSubstituirTitulosInTitulosSubstitutos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetcpfCnpj(Index: Integer; const Astring: string);
begin
  FcpfCnpj := Astring;
  FcpfCnpj_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.cpfCnpj_Specified(Index: Integer): boolean;
begin
  Result := FcpfCnpj_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetobsMcp(Index: Integer; const Astring: string);
begin
  FobsMcp := Astring;
  FobsMcp_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.obsMcp_Specified(Index: Integer): boolean;
begin
  Result := FobsMcp_Specified;
end;

procedure titulosSubstituirTitulosInTitulosBaixar.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosSubstituirTitulosInTitulosBaixar.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulosRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulosRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

destructor titulosEntradaTitulosCPInEntradaTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetccbFor(Index: Integer; const Astring: string);
begin
  FccbFor := Astring;
  FccbFor_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.ccbFor_Specified(Index: Integer): boolean;
begin
  Result := FccbFor_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodBar(Index: Integer; const Astring: string);
begin
  FcodBar := Astring;
  FcodBar_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codBar_Specified(Index: Integer): boolean;
begin
  Result := FcodBar_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodFav(Index: Integer; const Astring: string);
begin
  FcodFav := Astring;
  FcodFav_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codFav_Specified(Index: Integer): boolean;
begin
  Result := FcodFav_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetobsTcp(Index: Integer; const Astring: string);
begin
  FobsTcp := Astring;
  FobsTcp_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.obsTcp_Specified(Index: Integer): boolean;
begin
  Result := FobsTcp_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetperJrs(Index: Integer; const ADouble: Double);
begin
  FperJrs := ADouble;
  FperJrs_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosCPInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio);
begin
  Frateio := AArray_Of_titulosEntradaTitulosCPInEntradaTitulosRateio;
  Frateio_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosEntradaTitulosCPInEntradaTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosEntradaTitulosCPInEntradaTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

constructor titulosConsultarTituloCPOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTituloCPOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretornos)-1 do
    System.SysUtils.FreeAndNil(Fretornos[I]);
  System.SetLength(Fretornos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTituloCPOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTituloCPOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTituloCPOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTituloCPOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTituloCPOut.Setretornos(Index: Integer; const AArray_Of_titulosConsultarTituloCPOutRetornos: Array_Of_titulosConsultarTituloCPOutRetornos);
begin
  Fretornos := AArray_Of_titulosConsultarTituloCPOutRetornos;
  Fretornos_Specified := True;
end;

function titulosConsultarTituloCPOut.retornos_Specified(Index: Integer): boolean;
begin
  Result := Fretornos_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetforRlc(Index: Integer; const AInteger: Integer);
begin
  FforRlc := AInteger;
  FforRlc_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.forRlc_Specified(Index: Integer): boolean;
begin
  Result := FforRlc_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetnumRlc(Index: Integer; const Astring: string);
begin
  FnumRlc := Astring;
  FnumRlc_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.numRlc_Specified(Index: Integer): boolean;
begin
  Result := FnumRlc_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetobsTit(Index: Integer; const Astring: string);
begin
  FobsTit := Astring;
  FobsTit_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.obsTit_Specified(Index: Integer): boolean;
begin
  Result := FobsTit_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetsitTit(Index: Integer; const Astring: string);
begin
  FsitTit := Astring;
  FsitTit_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.sitTit_Specified(Index: Integer): boolean;
begin
  Result := FsitTit_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SettptRlc(Index: Integer; const Astring: string);
begin
  FtptRlc := Astring;
  FtptRlc_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.tptRlc_Specified(Index: Integer): boolean;
begin
  Result := FtptRlc_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetvlrAbe(Index: Integer; const ADouble: Double);
begin
  FvlrAbe := ADouble;
  FvlrAbe_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.vlrAbe_Specified(Index: Integer): boolean;
begin
  Result := FvlrAbe_Specified;
end;

procedure titulosConsultarTituloCPOutRetornos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosConsultarTituloCPOutRetornos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosConsultarTituloCPIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTituloCPIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTituloCPIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTituloCPIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTituloCPIn.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosConsultarTituloCPIn.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosConsultarTituloCPIn.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTituloCPIn.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTituloCPIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTituloCPIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTituloCPIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTituloCPIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarTituloCPIn.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosConsultarTituloCPIn.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosConsultarTituloCPIn.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTituloCPIn.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

constructor titulosSubstituirTitulosOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosSubstituirTitulosOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FgridResult)-1 do
    System.SysUtils.FreeAndNil(FgridResult[I]);
  System.SetLength(FgridResult, 0);
  inherited Destroy;
end;

procedure titulosSubstituirTitulosOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosSubstituirTitulosOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosSubstituirTitulosOut.SetgridResult(Index: Integer; const AArray_Of_titulosSubstituirTitulosOutGridResult: Array_Of_titulosSubstituirTitulosOutGridResult);
begin
  FgridResult := AArray_Of_titulosSubstituirTitulosOutGridResult;
  FgridResult_Specified := True;
end;

function titulosSubstituirTitulosOut.gridResult_Specified(Index: Integer): boolean;
begin
  Result := FgridResult_Specified;
end;

procedure titulosSubstituirTitulosOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function titulosSubstituirTitulosOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SetcpfCnpj(Index: Integer; const Astring: string);
begin
  FcpfCnpj := Astring;
  FcpfCnpj_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.cpfCnpj_Specified(Index: Integer): boolean;
begin
  Result := FcpfCnpj_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosSubstituirTitulosOutGridResult.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosSubstituirTitulosOutGridResult.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
end;

initialization
  { sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), ioLiteral);
  { sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos.EntradaTitulosCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'EntradaTitulosCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'EntradaTitulosCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos.ConsultarTituloCP }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'ConsultarTituloCP', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'ConsultarTituloCP', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos.SubstituirTitulos }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'SubstituirTitulos', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos), 'SubstituirTitulos', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosInTitulosBaixar), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosInTitulosBaixar');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosInTitulosSubstitutos), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosInTitulosSubstitutos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosCPOutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosCPOutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosCPInEntradaTitulos), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosCPInEntradaTitulos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosSubstituirTitulosOutGridResult), 'http://services.senior.com.br', 'Array_Of_titulosSubstituirTitulosOutGridResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTituloCPOutRetornos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTituloCPOutRetornos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCPIn, 'http://services.senior.com.br', 'titulosEntradaTitulosCPIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCPOut, 'http://services.senior.com.br', 'titulosEntradaTitulosCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosEntradaTitulosCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosIn, 'http://services.senior.com.br', 'titulosSubstituirTitulosIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCPOutRetorno, 'http://services.senior.com.br', 'titulosEntradaTitulosCPOutRetorno');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosInTitulosSubstitutos, 'http://services.senior.com.br', 'titulosSubstituirTitulosInTitulosSubstitutos');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosInTitulosBaixar, 'http://services.senior.com.br', 'titulosSubstituirTitulosInTitulosBaixar');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCPInEntradaTitulosRateio, 'http://services.senior.com.br', 'titulosEntradaTitulosCPInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCPInEntradaTitulos, 'http://services.senior.com.br', 'titulosEntradaTitulosCPInEntradaTitulos');
  RemClassRegistry.RegisterXSClass(titulosConsultarTituloCPOut, 'http://services.senior.com.br', 'titulosConsultarTituloCPOut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTituloCPOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTituloCPOutRetornos, 'http://services.senior.com.br', 'titulosConsultarTituloCPOutRetornos');
  RemClassRegistry.RegisterXSClass(titulosConsultarTituloCPIn, 'http://services.senior.com.br', 'titulosConsultarTituloCPIn');
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosOut, 'http://services.senior.com.br', 'titulosSubstituirTitulosOut');
  RemClassRegistry.RegisterSerializeOptions(titulosSubstituirTitulosOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosSubstituirTitulosOutGridResult, 'http://services.senior.com.br', 'titulosSubstituirTitulosOutGridResult');

end.