// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_processos?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_processos?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_processos?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (27/12/2018 10:05:38 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_CadProcessos;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]

  processosConsultarOut = class;                { "http://services.senior.com.br"[Lit][GblCplx] }
  processosConsultarIn = class;                 { "http://services.senior.com.br"[GblCplx] }
  processosIncluirOut  = class;                 { "http://services.senior.com.br"[Lit][GblCplx] }
  processosConsultarOutRetornos = class;        { "http://services.senior.com.br"[GblCplx] }
  processosIncluirIn   = class;                 { "http://services.senior.com.br"[GblCplx] }

  Array_Of_processosConsultarOutRetornos = array of processosConsultarOutRetornos;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : processosConsultarOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  processosConsultarOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fretornos: Array_Of_processosConsultarOutRetornos;
    Fretornos_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setretornos(Index: Integer; const AArray_Of_processosConsultarOutRetornos: Array_Of_processosConsultarOutRetornos);
    function  retornos_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao: string                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property retornos:     Array_Of_processosConsultarOutRetornos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read Fretornos write Setretornos stored retornos_Specified;
  end;



  // ************************************************************************ //
  // XML       : processosConsultarIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  processosConsultarIn = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FnumPrc: string;
    FnumPrc_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetnumPrc(Index: Integer; const Astring: string);
    function  numPrc_Specified(Index: Integer): boolean;
  published
    property codCli:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property numPrc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
  end;



  // ************************************************************************ //
  // XML       : processosIncluirOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  processosIncluirOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property retorno:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : processosConsultarOutRetornos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  processosConsultarOutRetornos = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FnumPrc: string;
    FnumPrc_Specified: boolean;
    FtipPro: string;
    FtipPro_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetnumPrc(Index: Integer; const Astring: string);
    function  numPrc_Specified(Index: Integer): boolean;
    procedure SettipPro(Index: Integer; const Astring: string);
    function  tipPro_Specified(Index: Integer): boolean;
  published
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property numPrc: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property tipPro: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipPro write SettipPro stored tipPro_Specified;
  end;



  // ************************************************************************ //
  // XML       : processosIncluirIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  processosIncluirIn = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FnumPrc: string;
    FnumPrc_Specified: boolean;
    FtipExe: Integer;
    FtipExe_Specified: boolean;
    FtipPro: string;
    FtipPro_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetnumPrc(Index: Integer; const Astring: string);
    function  numPrc_Specified(Index: Integer): boolean;
    procedure SettipExe(Index: Integer; const AInteger: Integer);
    function  tipExe_Specified(Index: Integer): boolean;
    procedure SettipPro(Index: Integer; const Astring: string);
    function  tipPro_Specified(Index: Integer): boolean;
  published
    property codCli:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codEmp:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property numPrc:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumPrc write SetnumPrc stored numPrc_Specified;
    property tipExe:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipExe write SettipExe stored tipExe_Specified;
    property tipPro:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipPro write SettipPro stored tipPro_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Syncmyindaia_com_br_custom_ger_cad_processosPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Syncmyindaia_com_br_custom_ger_cad_processosPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_processos
  // ************************************************************************ //
  sapiens_Syncmyindaia_com_br_custom_ger_cad_processos = interface(IInvokable)
  ['{A1B275FD-9D21-E14F-2AD3-B85EE98D2410}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  Incluir(const user: string; const password: string; const encryption: Integer; const parameters: processosIncluirIn): processosIncluirOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  Consultar(const user: string; const password: string; const encryption: Integer; const parameters: processosConsultarIn): processosConsultarOut; stdcall;
  end;

function Getsapiens_Syncmyindaia_com_br_custom_ger_cad_processos(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Syncmyindaia_com_br_custom_ger_cad_processos;


implementation
  uses System.SysUtils;

function Getsapiens_Syncmyindaia_com_br_custom_ger_cad_processos(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Syncmyindaia_com_br_custom_ger_cad_processos;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_processos?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Syncmyindaia_com_br_custom_ger_cad_processos';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Syncmyindaia_com_br_custom_ger_cad_processosPort';
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
    Result := (RIO as sapiens_Syncmyindaia_com_br_custom_ger_cad_processos);
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


constructor processosConsultarOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor processosConsultarOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(Fretornos)-1 do
    System.SysUtils.FreeAndNil(Fretornos[I]);
  System.SetLength(Fretornos, 0);
  inherited Destroy;
end;

procedure processosConsultarOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function processosConsultarOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure processosConsultarOut.Setretornos(Index: Integer; const AArray_Of_processosConsultarOutRetornos: Array_Of_processosConsultarOutRetornos);
begin
  Fretornos := AArray_Of_processosConsultarOutRetornos;
  Fretornos_Specified := True;
end;

function processosConsultarOut.retornos_Specified(Index: Integer): boolean;
begin
  Result := Fretornos_Specified;
end;

procedure processosConsultarIn.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function processosConsultarIn.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure processosConsultarIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function processosConsultarIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure processosConsultarIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function processosConsultarIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure processosConsultarIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function processosConsultarIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure processosConsultarIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function processosConsultarIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure processosConsultarIn.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function processosConsultarIn.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

constructor processosIncluirOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure processosIncluirOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function processosIncluirOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure processosIncluirOut.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function processosIncluirOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure processosConsultarOutRetornos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function processosConsultarOutRetornos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure processosConsultarOutRetornos.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function processosConsultarOutRetornos.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure processosConsultarOutRetornos.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function processosConsultarOutRetornos.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure processosConsultarOutRetornos.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function processosConsultarOutRetornos.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure processosConsultarOutRetornos.SettipPro(Index: Integer; const Astring: string);
begin
  FtipPro := Astring;
  FtipPro_Specified := True;
end;

function processosConsultarOutRetornos.tipPro_Specified(Index: Integer): boolean;
begin
  Result := FtipPro_Specified;
end;

procedure processosIncluirIn.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function processosIncluirIn.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure processosIncluirIn.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function processosIncluirIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure processosIncluirIn.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function processosIncluirIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure processosIncluirIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function processosIncluirIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure processosIncluirIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function processosIncluirIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure processosIncluirIn.SetnumPrc(Index: Integer; const Astring: string);
begin
  FnumPrc := Astring;
  FnumPrc_Specified := True;
end;

function processosIncluirIn.numPrc_Specified(Index: Integer): boolean;
begin
  Result := FnumPrc_Specified;
end;

procedure processosIncluirIn.SettipExe(Index: Integer; const AInteger: Integer);
begin
  FtipExe := AInteger;
  FtipExe_Specified := True;
end;

function processosIncluirIn.tipExe_Specified(Index: Integer): boolean;
begin
  Result := FtipExe_Specified;
end;

procedure processosIncluirIn.SettipPro(Index: Integer; const Astring: string);
begin
  FtipPro := Astring;
  FtipPro_Specified := True;
end;

function processosIncluirIn.tipPro_Specified(Index: Integer): boolean;
begin
  Result := FtipPro_Specified;
end;

initialization
  { sapiens_Syncmyindaia_com_br_custom_ger_cad_processos }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), ioLiteral);
  { sapiens_Syncmyindaia_com_br_custom_ger_cad_processos.Incluir }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), 'Incluir', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), 'Incluir', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Syncmyindaia_com_br_custom_ger_cad_processos.Consultar }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), 'Consultar', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Syncmyindaia_com_br_custom_ger_cad_processos), 'Consultar', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_processosConsultarOutRetornos), 'http://services.senior.com.br', 'Array_Of_processosConsultarOutRetornos');
  RemClassRegistry.RegisterXSClass(processosConsultarOut, 'http://services.senior.com.br', 'processosConsultarOut');
  RemClassRegistry.RegisterSerializeOptions(processosConsultarOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(processosConsultarIn, 'http://services.senior.com.br', 'processosConsultarIn');
  RemClassRegistry.RegisterXSClass(processosIncluirOut, 'http://services.senior.com.br', 'processosIncluirOut');
  RemClassRegistry.RegisterSerializeOptions(processosIncluirOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(processosConsultarOutRetornos, 'http://services.senior.com.br', 'processosConsultarOutRetornos');
  RemClassRegistry.RegisterXSClass(processosIncluirIn, 'http://services.senior.com.br', 'processosIncluirIn');

end.