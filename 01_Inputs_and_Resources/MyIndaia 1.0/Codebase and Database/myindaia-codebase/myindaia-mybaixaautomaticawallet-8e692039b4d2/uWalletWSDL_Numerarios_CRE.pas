// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (27/12/2018 10:14:59 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_Numerarios_CRE;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]

  titulosEntradaTitulosBapAdtCRInEntradaTitulosAp = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosBapAdtCRIn = class;      { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCROut = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTituloCROut = class;          { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosConsultarTituloCRIn = class;           { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCROutRetorno = class;    { "http://services.senior.com.br"[GblCplx] }
  titulosConsultarTituloCROutRetornos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCRIn = class;            { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCRInEntradaTitulos = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosCRInEntradaTitulosRateio = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosBapAdtCROut = class;     { "http://services.senior.com.br"[Lit][GblCplx] }
  titulosEntradaTitulosBapAdtCROutTituloAproveitado = class;   { "http://services.senior.com.br"[GblCplx] }
  titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado = class;   { "http://services.senior.com.br"[GblCplx] }

  Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp = array of titulosEntradaTitulosBapAdtCRInEntradaTitulosAp;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio = array of titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio = array of titulosEntradaTitulosCRInEntradaTitulosRateio;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosCROutRetorno = array of titulosEntradaTitulosCROutRetorno;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosConsultarTituloCROutRetornos = array of titulosConsultarTituloCROutRetornos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado = array of titulosEntradaTitulosBapAdtCROutTituloAproveitado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado = array of titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_titulosEntradaTitulosCRInEntradaTitulos = array of titulosEntradaTitulosCRInEntradaTitulos;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : titulosEntradaTitulosBapAdtCRInEntradaTitulosAp, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosBapAdtCRInEntradaTitulosAp = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    Frateio: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio;
    Frateio_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
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
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codCli: Integer                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer                                                         Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTns: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property datEmi: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datPpt: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property numPrc: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numTit: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property rateio: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property vctOri: string                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrOri: Double                                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosBapAdtCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosBapAdtCRIn = class(TRemotable)
  private
    FentradaTitulosAp: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp;
    FentradaTitulosAp_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetentradaTitulosAp(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp);
    function  entradaTitulosAp_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property entradaTitulosAp: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FentradaTitulosAp write SetentradaTitulosAp stored entradaTitulosAp_Specified;
    property flowInstanceID:   string                                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:         string                                                    Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio = class(TRemotable)
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
  // XML       : titulosEntradaTitulosCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEntradaTitulosCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretorno: Array_Of_titulosEntradaTitulosCROutRetorno;
    Fretorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const AArray_Of_titulosEntradaTitulosCROutRetorno: Array_Of_titulosEntradaTitulosCROutRetorno);
    function  retorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retorno:         Array_Of_titulosEntradaTitulosCROutRetorno  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTituloCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosConsultarTituloCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    Fretornos: Array_Of_titulosConsultarTituloCROutRetornos;
    Fretornos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure Setretornos(Index: Integer; const AArray_Of_titulosConsultarTituloCROutRetornos: Array_Of_titulosConsultarTituloCROutRetornos);
    function  retornos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:    string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno: string                                        Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornos:        Array_Of_titulosConsultarTituloCROutRetornos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretornos write Setretornos stored retornos_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTituloCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTituloCRIn = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
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
    property codCli:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property numPrc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numTit:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCROutRetorno, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCROutRetorno = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
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
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettxtRet(Index: Integer; const Astring: string);
    function  txtRet_Specified(Index: Integer): boolean;
  published
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property txtRet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtxtRet write SettxtRet stored txtRet_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosConsultarTituloCROutRetornos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosConsultarTituloCROutRetornos = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    FobsTit: string;
    FobsTit_Specified: boolean;
    FsitTit: string;
    FsitTit_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrAbe: Double;
    FvlrAbe_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
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
    procedure SetobsTit(Index: Integer; const Astring: string);
    function  obsTit_Specified(Index: Integer): boolean;
    procedure SetsitTit(Index: Integer; const Astring: string);
    function  sitTit_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrAbe(Index: Integer; const ADouble: Double);
    function  vlrAbe_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  published
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTns: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property datEmi: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datPpt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property numPrc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTit write SetobsTit stored obsTit_Specified;
    property sitTit: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitTit write SetsitTit stored sitTit_Specified;
    property vctOri: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrAbe: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAbe write SetvlrAbe stored vlrAbe_Specified;
    property vlrOri: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCRIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCRIn = class(TRemotable)
  private
    FentradaTitulos: Array_Of_titulosEntradaTitulosCRInEntradaTitulos;
    FentradaTitulos_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosCRInEntradaTitulos: Array_Of_titulosEntradaTitulosCRInEntradaTitulos);
    function  entradaTitulos_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property entradaTitulos: Array_Of_titulosEntradaTitulosCRInEntradaTitulos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FentradaTitulos write SetentradaTitulos stored entradaTitulos_Specified;
    property flowInstanceID: string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                            Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCRInEntradaTitulos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCRInEntradaTitulos = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
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
    FobsTcr: string;
    FobsTcr_Specified: boolean;
    FperJrs: Double;
    FperJrs_Specified: boolean;
    Frateio: Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio;
    Frateio_Specified: boolean;
    FvctOri: string;
    FvctOri_Specified: boolean;
    FvlrOri: Double;
    FvlrOri_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
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
    procedure SetobsTcr(Index: Integer; const Astring: string);
    function  obsTcr_Specified(Index: Integer): boolean;
    procedure SetperJrs(Index: Integer; const ADouble: Double);
    function  perJrs_Specified(Index: Integer): boolean;
    procedure Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosCRInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio);
    function  rateio_Specified(Index: Integer): boolean;
    procedure SetvctOri(Index: Integer; const Astring: string);
    function  vctOri_Specified(Index: Integer): boolean;
    procedure SetvlrOri(Index: Integer; const ADouble: Double);
    function  vlrOri_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codCli: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTns: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTns write SetcodTns stored codTns_Specified;
    property codTpt: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property datEmi: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEmi write SetdatEmi stored datEmi_Specified;
    property datEnt: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatEnt write SetdatEnt stored datEnt_Specified;
    property datPpt: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPpt write SetdatPpt stored datPpt_Specified;
    property numPrc: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property numTit: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property obsTcr: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsTcr write SetobsTcr stored obsTcr_Specified;
    property perJrs: Double                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperJrs write SetperJrs stored perJrs_Specified;
    property rateio: Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Frateio write Setrateio stored rateio_Specified;
    property vctOri: string                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvctOri write SetvctOri stored vctOri_Specified;
    property vlrOri: Double                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrOri write SetvlrOri stored vlrOri_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosCRInEntradaTitulosRateio, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosCRInEntradaTitulosRateio = class(TRemotable)
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
  // XML       : titulosEntradaTitulosBapAdtCROut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  titulosEntradaTitulosBapAdtCROut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FtituloAproveitado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado;
    FtituloAproveitado_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SettituloAproveitado(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado);
    function  tituloAproveitado_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:      string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:   string                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property tituloAproveitado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtituloAproveitado write SettituloAproveitado stored tituloAproveitado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosBapAdtCROutTituloAproveitado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosBapAdtCROutTituloAproveitado = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    FtituloBaixado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado;
    FtituloBaixado_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure SettituloBaixado(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado);
    function  tituloBaixado_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property codEmp:        Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:        Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codTpt:        string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property numTit:        string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property tituloBaixado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FtituloBaixado write SettituloBaixado stored tituloBaixado_Specified;
  end;



  // ************************************************************************ //
  // XML       : titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado = class(TRemotable)
  private
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FtitBai: string;
    FtitBai_Specified: boolean;
    FtptBai: string;
    FtptBai_Specified: boolean;
    FvlrBai: Double;
    FvlrBai_Specified: boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SettitBai(Index: Integer; const Astring: string);
    function  titBai_Specified(Index: Integer): boolean;
    procedure SettptBai(Index: Integer; const Astring: string);
    function  tptBai_Specified(Index: Integer): boolean;
    procedure SetvlrBai(Index: Integer; const ADouble: Double);
    function  vlrBai_Specified(Index: Integer): boolean;
  published
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property titBai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtitBai write SettitBai stored titBai_Specified;
    property tptBai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtptBai write SettptBai stored tptBai_Specified;
    property vlrBai: Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrBai write SetvlrBai stored vlrBai_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulosPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulosPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos
  // ************************************************************************ //
  sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos = interface(IInvokable)
  ['{5730BA0A-DF03-3F1B-16A0-55B9FD9BF5B8}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ConsultarTituloCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosConsultarTituloCRIn): titulosConsultarTituloCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EntradaTitulosBapAdtCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosEntradaTitulosBapAdtCRIn): titulosEntradaTitulosBapAdtCROut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  EntradaTitulosCR(const user: string; const password: string; const encryption: Integer; const parameters: titulosEntradaTitulosCRIn): titulosEntradaTitulosCROut; stdcall;
  end;

function Getsapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos(producao : boolean ;UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos;


implementation
  uses System.SysUtils;

function Getsapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos(Producao : Boolean; UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos';
  defWSDL_hmlg = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos?wsdl';
  defURL_hmlg  = 'http://senior-hmlg:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulosPort';
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
    Result := (RIO as sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos);
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


destructor titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio);
begin
  Frateio := AArray_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio;
  Frateio_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

destructor titulosEntradaTitulosBapAdtCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FentradaTitulosAp)-1 do
    System.SysUtils.FreeAndNil(FentradaTitulosAp[I]);
  System.SetLength(FentradaTitulosAp, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosBapAdtCRIn.SetentradaTitulosAp(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp);
begin
  FentradaTitulosAp := AArray_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp;
  FentradaTitulosAp_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRIn.entradaTitulosAp_Specified(Index: Integer): boolean;
begin
  Result := FentradaTitulosAp_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

constructor titulosEntradaTitulosCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEntradaTitulosCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretorno)-1 do
    System.SysUtils.FreeAndNil(Fretorno[I]);
  System.SetLength(Fretorno, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEntradaTitulosCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEntradaTitulosCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEntradaTitulosCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEntradaTitulosCROut.Setretorno(Index: Integer; const AArray_Of_titulosEntradaTitulosCROutRetorno: Array_Of_titulosEntradaTitulosCROutRetorno);
begin
  Fretorno := AArray_Of_titulosEntradaTitulosCROutRetorno;
  Fretorno_Specified := True;
end;

function titulosEntradaTitulosCROut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

constructor titulosConsultarTituloCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosConsultarTituloCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretornos)-1 do
    System.SysUtils.FreeAndNil(Fretornos[I]);
  System.SetLength(Fretornos, 0);
  inherited Destroy;
end;

procedure titulosConsultarTituloCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosConsultarTituloCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosConsultarTituloCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosConsultarTituloCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosConsultarTituloCROut.Setretornos(Index: Integer; const AArray_Of_titulosConsultarTituloCROutRetornos: Array_Of_titulosConsultarTituloCROutRetornos);
begin
  Fretornos := AArray_Of_titulosConsultarTituloCROutRetornos;
  Fretornos_Specified := True;
end;

function titulosConsultarTituloCROut.retornos_Specified(Index: Integer): boolean;
begin
  Result := Fretornos_Specified;
end;

procedure titulosConsultarTituloCRIn.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosConsultarTituloCRIn.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosConsultarTituloCRIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTituloCRIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTituloCRIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTituloCRIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTituloCRIn.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTituloCRIn.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTituloCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosConsultarTituloCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosConsultarTituloCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosConsultarTituloCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure titulosConsultarTituloCRIn.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosConsultarTituloCRIn.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosConsultarTituloCRIn.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTituloCRIn.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosCROutRetorno.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosEntradaTitulosCROutRetorno.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosEntradaTitulosCROutRetorno.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosCROutRetorno.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosCROutRetorno.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosCROutRetorno.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosCROutRetorno.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosCROutRetorno.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosCROutRetorno.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosCROutRetorno.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosCROutRetorno.SettxtRet(Index: Integer; const Astring: string);
begin
  FtxtRet := Astring;
  FtxtRet_Specified := True;
end;

function titulosEntradaTitulosCROutRetorno.txtRet_Specified(Index: Integer): boolean;
begin
  Result := FtxtRet_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetobsTit(Index: Integer; const Astring: string);
begin
  FobsTit := Astring;
  FobsTit_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.obsTit_Specified(Index: Integer): boolean;
begin
  Result := FobsTit_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetsitTit(Index: Integer; const Astring: string);
begin
  FsitTit := Astring;
  FsitTit_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.sitTit_Specified(Index: Integer): boolean;
begin
  Result := FsitTit_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetvlrAbe(Index: Integer; const ADouble: Double);
begin
  FvlrAbe := ADouble;
  FvlrAbe_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.vlrAbe_Specified(Index: Integer): boolean;
begin
  Result := FvlrAbe_Specified;
end;

procedure titulosConsultarTituloCROutRetornos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosConsultarTituloCROutRetornos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

destructor titulosEntradaTitulosCRIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FentradaTitulos)-1 do
    System.SysUtils.FreeAndNil(FentradaTitulos[I]);
  System.SetLength(FentradaTitulos, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosCRIn.SetentradaTitulos(Index: Integer; const AArray_Of_titulosEntradaTitulosCRInEntradaTitulos: Array_Of_titulosEntradaTitulosCRInEntradaTitulos);
begin
  FentradaTitulos := AArray_Of_titulosEntradaTitulosCRInEntradaTitulos;
  FentradaTitulos_Specified := True;
end;

function titulosEntradaTitulosCRIn.entradaTitulos_Specified(Index: Integer): boolean;
begin
  Result := FentradaTitulos_Specified;
end;

procedure titulosEntradaTitulosCRIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function titulosEntradaTitulosCRIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure titulosEntradaTitulosCRIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function titulosEntradaTitulosCRIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

destructor titulosEntradaTitulosCRInEntradaTitulos.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Frateio)-1 do
    System.SysUtils.FreeAndNil(Frateio[I]);
  System.SetLength(Frateio, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetcodTns(Index: Integer; const Astring: string);
begin
  FcodTns := Astring;
  FcodTns_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.codTns_Specified(Index: Integer): boolean;
begin
  Result := FcodTns_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetdatEmi(Index: Integer; const Astring: string);
begin
  FdatEmi := Astring;
  FdatEmi_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.datEmi_Specified(Index: Integer): boolean;
begin
  Result := FdatEmi_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetdatEnt(Index: Integer; const Astring: string);
begin
  FdatEnt := Astring;
  FdatEnt_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.datEnt_Specified(Index: Integer): boolean;
begin
  Result := FdatEnt_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetdatPpt(Index: Integer; const Astring: string);
begin
  FdatPpt := Astring;
  FdatPpt_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.datPpt_Specified(Index: Integer): boolean;
begin
  Result := FdatPpt_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetobsTcr(Index: Integer; const Astring: string);
begin
  FobsTcr := Astring;
  FobsTcr_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.obsTcr_Specified(Index: Integer): boolean;
begin
  Result := FobsTcr_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetperJrs(Index: Integer; const ADouble: Double);
begin
  FperJrs := ADouble;
  FperJrs_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.perJrs_Specified(Index: Integer): boolean;
begin
  Result := FperJrs_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.Setrateio(Index: Integer; const AArray_Of_titulosEntradaTitulosCRInEntradaTitulosRateio: Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio);
begin
  Frateio := AArray_Of_titulosEntradaTitulosCRInEntradaTitulosRateio;
  Frateio_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.rateio_Specified(Index: Integer): boolean;
begin
  Result := Frateio_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetvctOri(Index: Integer; const Astring: string);
begin
  FvctOri := Astring;
  FvctOri_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.vctOri_Specified(Index: Integer): boolean;
begin
  Result := FvctOri_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulos.SetvlrOri(Index: Integer; const ADouble: Double);
begin
  FvlrOri := ADouble;
  FvlrOri_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulos.vlrOri_Specified(Index: Integer): boolean;
begin
  Result := FvlrOri_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetcodCcu(Index: Integer; const Astring: string);
begin
  FcodCcu := Astring;
  FcodCcu_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.codCcu_Specified(Index: Integer): boolean;
begin
  Result := FcodCcu_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetctaFin(Index: Integer; const AInteger: Integer);
begin
  FctaFin := AInteger;
  FctaFin_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.ctaFin_Specified(Index: Integer): boolean;
begin
  Result := FctaFin_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetobsRat(Index: Integer; const Astring: string);
begin
  FobsRat := Astring;
  FobsRat_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.obsRat_Specified(Index: Integer): boolean;
begin
  Result := FobsRat_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetperCta(Index: Integer; const ADouble: Double);
begin
  FperCta := ADouble;
  FperCta_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.perCta_Specified(Index: Integer): boolean;
begin
  Result := FperCta_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetperRat(Index: Integer; const ADouble: Double);
begin
  FperRat := ADouble;
  FperRat_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.perRat_Specified(Index: Integer): boolean;
begin
  Result := FperRat_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetvlrCta(Index: Integer; const ADouble: Double);
begin
  FvlrCta := ADouble;
  FvlrCta_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.vlrCta_Specified(Index: Integer): boolean;
begin
  Result := FvlrCta_Specified;
end;

procedure titulosEntradaTitulosCRInEntradaTitulosRateio.SetvlrRat(Index: Integer; const ADouble: Double);
begin
  FvlrRat := ADouble;
  FvlrRat_Specified := True;
end;

function titulosEntradaTitulosCRInEntradaTitulosRateio.vlrRat_Specified(Index: Integer): boolean;
begin
  Result := FvlrRat_Specified;
end;

constructor titulosEntradaTitulosBapAdtCROut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor titulosEntradaTitulosBapAdtCROut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtituloAproveitado)-1 do
    System.SysUtils.FreeAndNil(FtituloAproveitado[I]);
  System.SetLength(FtituloAproveitado, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosBapAdtCROut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROut.SettituloAproveitado(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado);
begin
  FtituloAproveitado := AArray_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado;
  FtituloAproveitado_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROut.tituloAproveitado_Specified(Index: Integer): boolean;
begin
  Result := FtituloAproveitado_Specified;
end;

destructor titulosEntradaTitulosBapAdtCROutTituloAproveitado.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FtituloBaixado)-1 do
    System.SysUtils.FreeAndNil(FtituloBaixado[I]);
  System.SetLength(FtituloBaixado, 0);
  inherited Destroy;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitado.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitado.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitado.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitado.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitado.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitado.SettituloBaixado(Index: Integer; const AArray_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado: Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado);
begin
  FtituloBaixado := AArray_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado;
  FtituloBaixado_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitado.tituloBaixado_Specified(Index: Integer): boolean;
begin
  Result := FtituloBaixado_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.SettitBai(Index: Integer; const Astring: string);
begin
  FtitBai := Astring;
  FtitBai_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.titBai_Specified(Index: Integer): boolean;
begin
  Result := FtitBai_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.SettptBai(Index: Integer; const Astring: string);
begin
  FtptBai := Astring;
  FtptBai_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.tptBai_Specified(Index: Integer): boolean;
begin
  Result := FtptBai_Specified;
end;

procedure titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.SetvlrBai(Index: Integer; const ADouble: Double);
begin
  FvlrBai := ADouble;
  FvlrBai_Specified := True;
end;

function titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado.vlrBai_Specified(Index: Integer): boolean;
begin
  Result := FvlrBai_Specified;
end;

initialization
  { sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), ioLiteral);
  { sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos.ConsultarTituloCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'ConsultarTituloCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'ConsultarTituloCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos.EntradaTitulosBapAdtCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'EntradaTitulosBapAdtCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'EntradaTitulosBapAdtCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos.EntradaTitulosCR }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'EntradaTitulosCR', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos), 'EntradaTitulosCR', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');

  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosCROutRetorno), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosCROutRetorno');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosConsultarTituloCROutRetornos), 'http://services.senior.com.br', 'Array_Of_titulosConsultarTituloCROutRetornos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_titulosEntradaTitulosCRInEntradaTitulos), 'http://services.senior.com.br', 'Array_Of_titulosEntradaTitulosCRInEntradaTitulos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosBapAdtCRInEntradaTitulosAp, 'http://services.senior.com.br', 'titulosEntradaTitulosBapAdtCRInEntradaTitulosAp');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosBapAdtCRIn, 'http://services.senior.com.br', 'titulosEntradaTitulosBapAdtCRIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio, 'http://services.senior.com.br', 'titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCROut, 'http://services.senior.com.br', 'titulosEntradaTitulosCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosEntradaTitulosCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTituloCROut, 'http://services.senior.com.br', 'titulosConsultarTituloCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosConsultarTituloCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosConsultarTituloCRIn, 'http://services.senior.com.br', 'titulosConsultarTituloCRIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCROutRetorno, 'http://services.senior.com.br', 'titulosEntradaTitulosCROutRetorno');
  RemClassRegistry.RegisterXSClass(titulosConsultarTituloCROutRetornos, 'http://services.senior.com.br', 'titulosConsultarTituloCROutRetornos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCRIn, 'http://services.senior.com.br', 'titulosEntradaTitulosCRIn');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCRInEntradaTitulos, 'http://services.senior.com.br', 'titulosEntradaTitulosCRInEntradaTitulos');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosCRInEntradaTitulosRateio, 'http://services.senior.com.br', 'titulosEntradaTitulosCRInEntradaTitulosRateio');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosBapAdtCROut, 'http://services.senior.com.br', 'titulosEntradaTitulosBapAdtCROut');
  RemClassRegistry.RegisterSerializeOptions(titulosEntradaTitulosBapAdtCROut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosBapAdtCROutTituloAproveitado, 'http://services.senior.com.br', 'titulosEntradaTitulosBapAdtCROutTituloAproveitado');
  RemClassRegistry.RegisterXSClass(titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado, 'http://services.senior.com.br', 'titulosEntradaTitulosBapAdtCROutTituloAproveitadoTituloBaixado');

end.