// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_cad_clientes?wsdl
//  >Import : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_cad_clientes?wsdl>0
//  >Import : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_cad_clientes?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (27/12/2018 10:08:22 - - $Rev: 86412 $)
// ************************************************************************ //

unit uWalletWSDL_CadClientes;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]

  clientesGravarClientes3In = class;            { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4OutRetornosEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4In = class;            { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientesIn = class;             { "http://services.senior.com.br"[GblCplx] }
  clientesobterClienteIn = class;               { "http://services.senior.com.br"[GblCplx] }
  clientesobterClienteOut = class;              { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientes2Out = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientes4Out = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4OutRetornosClientes = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2OutRetornosClientes = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4InDadosGeraisCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes4InDadosGeraisClienteCadastroCEP = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesExcluirClientesInDadosGeraisCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientesInDadosGeraisClienteEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientesInDadosGeraisClienteDefinicoesCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientesOut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientesOutRetornosClientes = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientesInDadosGeraisClienteClientePessoaFisica = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesExcluirClientesOutRetornosClientes = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesExcluirClientesOut = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientesInDadosGeraisClienteCadastroCEP = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientesInDadosGeraisCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2In = class;            { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2InDadosGeraisCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes2InDadosGeraisClienteCadastroCEP = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes3InDadosGeraisCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5InDadosGeraisClienteCadastroCEP = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5InDadosGeraisCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesConsultarOutRetornosConsultas = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5In = class;            { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5OutRetornosEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesExcluirClientesIn = class;            { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5OutRetornosClientes = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes5Out = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesConsultarOut = class;                 { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes3Out = class;           { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes3InDadosGeraisClienteCadastroCEP = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarClientes3OutRetornosClientes = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesGravarContatosOutRetornosContatos = class;   { "http://services.senior.com.br"[GblCplx] }
  clientesConsultarIn  = class;                 { "http://services.senior.com.br"[GblCplx] }
  clientesGravarContatosOut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  clientesGravarContatosIn = class;             { "http://services.senior.com.br"[GblCplx] }
  clientesGravarContatosInDadosContatos = class;   { "http://services.senior.com.br"[GblCplx] }

  Array_Of_clientesGravarClientes2OutRetornosClientes = array of clientesGravarClientes2OutRetornosClientes;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4InDadosGeraisCliente = array of clientesGravarClientes4InDadosGeraisCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega = array of clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica = array of clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente = array of clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP = array of clientesGravarClientes4InDadosGeraisClienteCadastroCEP;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4OutRetornosClientes = array of clientesGravarClientes4OutRetornosClientes;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega = array of clientesGravarClientes4OutRetornosEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega = array of clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica = array of clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente = array of clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP = array of clientesGravarClientes2InDadosGeraisClienteCadastroCEP;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes2InDadosGeraisCliente = array of clientesGravarClientes2InDadosGeraisCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes3InDadosGeraisCliente = array of clientesGravarClientes3InDadosGeraisCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesExcluirClientesInDadosGeraisCliente = array of clientesExcluirClientesInDadosGeraisCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesExcluirClientesOutRetornosClientes = array of clientesExcluirClientesOutRetornosClientes;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega = array of clientesGravarClientes5OutRetornosEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega = array of clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5OutRetornosClientes = array of clientesGravarClientes5OutRetornosClientes;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientesInDadosGeraisCliente = array of clientesGravarClientesInDadosGeraisCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega = array of clientesGravarClientesInDadosGeraisClienteEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientesOutRetornosClientes = array of clientesGravarClientesOutRetornosClientes;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente = array of clientesGravarClientesInDadosGeraisClienteDefinicoesCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP = array of clientesGravarClientesInDadosGeraisClienteCadastroCEP;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica = array of clientesGravarClientesInDadosGeraisClienteClientePessoaFisica;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente = array of clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega = array of clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes3OutRetornosClientes = array of clientesGravarClientes3OutRetornosClientes;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente = array of clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP = array of clientesGravarClientes3InDadosGeraisClienteCadastroCEP;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica = array of clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarContatosInDadosContatos = array of clientesGravarContatosInDadosContatos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP = array of clientesGravarClientes5InDadosGeraisClienteCadastroCEP;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica = array of clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarClientes5InDadosGeraisCliente = array of clientesGravarClientes5InDadosGeraisCliente;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesGravarContatosOutRetornosContatos = array of clientesGravarContatosOutRetornosContatos;   { "http://services.senior.com.br"[GblUbnd] }
  Array_Of_clientesConsultarOutRetornosConsultas = array of clientesConsultarOutRetornosConsultas;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : clientesGravarClientes3In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3In = class(TRemotable)
  private
    FdadosGeraisCliente: Array_Of_clientesGravarClientes3InDadosGeraisCliente;
    FdadosGeraisCliente_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    procedure SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisCliente: Array_Of_clientesGravarClientes3InDadosGeraisCliente);
    function  dadosGeraisCliente_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGeraisCliente: Array_Of_clientesGravarClientes3InDadosGeraisCliente  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGeraisCliente write SetdadosGeraisCliente stored dadosGeraisCliente_Specified;
    property dataBuild:          string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idtReq:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4OutRetornosEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4OutRetornosEnderecosEntrega = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: string;
    FcodCli_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    FseqEnt: string;
    FseqEnt_Specified: boolean;
    FseqEnv: string;
    FseqEnv_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const Astring: string);
    function  codCli_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const Astring: string);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnv(Index: Integer; const Astring: string);
    function  seqEnv_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property retorno: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property seqEnt:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property seqEnv:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnv write SetseqEnv stored seqEnv_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4In = class(TRemotable)
  private
    FdadosGeraisCliente: Array_Of_clientesGravarClientes4InDadosGeraisCliente;
    FdadosGeraisCliente_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    procedure SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisCliente: Array_Of_clientesGravarClientes4InDadosGeraisCliente);
    function  dadosGeraisCliente_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGeraisCliente: Array_Of_clientesGravarClientes4InDadosGeraisCliente  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGeraisCliente write SetdadosGeraisCliente stored dadosGeraisCliente_Specified;
    property dataBuild:          string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idtReq:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesIn = class(TRemotable)
  private
    FdadosGeraisCliente: Array_Of_clientesGravarClientesInDadosGeraisCliente;
    FdadosGeraisCliente_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    procedure SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisCliente: Array_Of_clientesGravarClientesInDadosGeraisCliente);
    function  dadosGeraisCliente_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGeraisCliente: Array_Of_clientesGravarClientesInDadosGeraisCliente  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGeraisCliente write SetdadosGeraisCliente stored dadosGeraisCliente_Specified;
    property dataBuild:          string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idtReq:             string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:             string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesobterClienteIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesobterClienteIn = class(TRemotable)
  private
    FcodigoCliente: Integer;
    FcodigoCliente_Specified: boolean;
    FcodigoEmpresa: Integer;
    FcodigoEmpresa_Specified: boolean;
    FcodigoFilial: Integer;
    FcodigoFilial_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetcodigoCliente(Index: Integer; const AInteger: Integer);
    function  codigoCliente_Specified(Index: Integer): boolean;
    procedure SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
    function  codigoEmpresa_Specified(Index: Integer): boolean;
    procedure SetcodigoFilial(Index: Integer; const AInteger: Integer);
    function  codigoFilial_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property codigoCliente:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoCliente write SetcodigoCliente stored codigoCliente_Specified;
    property codigoEmpresa:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoEmpresa write SetcodigoEmpresa stored codigoEmpresa_Specified;
    property codigoFilial:   Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodigoFilial write SetcodigoFilial stored codigoFilial_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesobterClienteOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesobterClienteOut = class(TRemotable)
  private
    FbloqueiaCredito: string;
    FbloqueiaCredito_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FmotivoSituacoCliente: string;
    FmotivoSituacoCliente_Specified: boolean;
    FnomeCliente: string;
    FnomeCliente_Specified: boolean;
    FobservacaoMotivo: string;
    FobservacaoMotivo_Specified: boolean;
    FsaldoCreditos: Double;
    FsaldoCreditos_Specified: boolean;
    FsaldoDuplicatas: Double;
    FsaldoDuplicatas_Specified: boolean;
    FsaldoOutros: Double;
    FsaldoOutros_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    FvalorLimiteCredito: Double;
    FvalorLimiteCredito_Specified: boolean;
    procedure SetbloqueiaCredito(Index: Integer; const Astring: string);
    function  bloqueiaCredito_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetmotivoSituacoCliente(Index: Integer; const Astring: string);
    function  motivoSituacoCliente_Specified(Index: Integer): boolean;
    procedure SetnomeCliente(Index: Integer; const Astring: string);
    function  nomeCliente_Specified(Index: Integer): boolean;
    procedure SetobservacaoMotivo(Index: Integer; const Astring: string);
    function  observacaoMotivo_Specified(Index: Integer): boolean;
    procedure SetsaldoCreditos(Index: Integer; const ADouble: Double);
    function  saldoCreditos_Specified(Index: Integer): boolean;
    procedure SetsaldoDuplicatas(Index: Integer; const ADouble: Double);
    function  saldoDuplicatas_Specified(Index: Integer): boolean;
    procedure SetsaldoOutros(Index: Integer; const ADouble: Double);
    function  saldoOutros_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
    procedure SetvalorLimiteCredito(Index: Integer; const ADouble: Double);
    function  valorLimiteCredito_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property bloqueiaCredito:      string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbloqueiaCredito write SetbloqueiaCredito stored bloqueiaCredito_Specified;
    property erroExecucao:         string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:      string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property motivoSituacoCliente: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmotivoSituacoCliente write SetmotivoSituacoCliente stored motivoSituacoCliente_Specified;
    property nomeCliente:          string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomeCliente write SetnomeCliente stored nomeCliente_Specified;
    property observacaoMotivo:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobservacaoMotivo write SetobservacaoMotivo stored observacaoMotivo_Specified;
    property saldoCreditos:        Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsaldoCreditos write SetsaldoCreditos stored saldoCreditos_Specified;
    property saldoDuplicatas:      Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsaldoDuplicatas write SetsaldoDuplicatas stored saldoDuplicatas_Specified;
    property saldoOutros:          Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsaldoOutros write SetsaldoOutros stored saldoOutros_Specified;
    property tipoRetorno:          Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
    property valorLimiteCredito:   Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvalorLimiteCredito write SetvalorLimiteCredito stored valorLimiteCredito_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesGravarClientes2Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosClientes: Array_Of_clientesGravarClientes2OutRetornosClientes;
    FretornosClientes_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes2OutRetornosClientes: Array_Of_clientesGravarClientes2OutRetornosClientes);
    function  retornosClientes_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:  string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosClientes: Array_Of_clientesGravarClientes2OutRetornosClientes  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosClientes write SetretornosClientes stored retornosClientes_Specified;
    property tipoRetorno:      Integer                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesGravarClientes4Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosClientes: Array_Of_clientesGravarClientes4OutRetornosClientes;
    FretornosClientes_Specified: boolean;
    FretornosEnderecosEntrega: Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega;
    FretornosEnderecosEntrega_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes4OutRetornosClientes: Array_Of_clientesGravarClientes4OutRetornosClientes);
    function  retornosClientes_Specified(Index: Integer): boolean;
    procedure SetretornosEnderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes4OutRetornosEnderecosEntrega: Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega);
    function  retornosEnderecosEntrega_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:             string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:          string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosClientes:         Array_Of_clientesGravarClientes4OutRetornosClientes          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosClientes write SetretornosClientes stored retornosClientes_Specified;
    property retornosEnderecosEntrega: Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosEnderecosEntrega write SetretornosEnderecosEntrega stored retornosEnderecosEntrega_Specified;
    property tipoRetorno:              Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega = class(TRemotable)
  private
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcepEnt: string;
    FcepEnt_Specified: boolean;
    FcgcEnt: string;
    FcgcEnt_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FiniEnt: string;
    FiniEnt_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FprxEnt: string;
    FprxEnt_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FseqEnv: string;
    FseqEnv_Specified: boolean;
    FsitReg: string;
    FsitReg_Specified: boolean;
    FtipEnt: string;
    FtipEnt_Specified: boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const Astring: string);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const Astring: string);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetiniEnt(Index: Integer; const Astring: string);
    function  iniEnt_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetprxEnt(Index: Integer; const Astring: string);
    function  prxEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnv(Index: Integer; const Astring: string);
    function  seqEnv_Specified(Index: Integer): boolean;
    procedure SetsitReg(Index: Integer; const Astring: string);
    function  sitReg_Specified(Index: Integer): boolean;
    procedure SettipEnt(Index: Integer; const Astring: string);
    function  tipEnt_Specified(Index: Integer): boolean;
  published
    property baiEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cepEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cgcEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cplEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property endEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property estEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property iniEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FiniEnt write SetiniEnt stored iniEnt_Specified;
    property insEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property nenEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property prxEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprxEnt write SetprxEnt stored prxEnt_Specified;
    property seqEnt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property seqEnv: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnv write SetseqEnv stored seqEnv_Specified;
    property sitReg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitReg write SetsitReg stored sitReg_Specified;
    property tipEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEnt write SettipEnt stored tipEnt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4OutRetornosClientes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4OutRetornosClientes = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFor:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property ideExt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente = class(TRemotable)
  private
    FacePar: string;
    FacePar_Specified: boolean;
    FacrDia: Integer;
    FacrDia_Specified: boolean;
    FantDsc: string;
    FantDsc_Specified: boolean;
    FavaAti: string;
    FavaAti_Specified: boolean;
    FavaMot: Integer;
    FavaMot_Specified: boolean;
    FavaObs: string;
    FavaObs_Specified: boolean;
    FavaVlr: Double;
    FavaVlr_Specified: boolean;
    FavaVls: Double;
    FavaVls_Specified: boolean;
    FavaVlu: Double;
    FavaVlu_Specified: boolean;
    FcatCli: Integer;
    FcatCli_Specified: boolean;
    FccbCli: string;
    FccbCli_Specified: boolean;
    FcifFob: string;
    FcifFob_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
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
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFcr: string;
    FcodFcr_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMar: string;
    FcodMar_Specified: boolean;
    FcodRed: Integer;
    FcodRed_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodRve: string;
    FcodRve_Specified: boolean;
    FcodTab: string;
    FcodTab_Specified: boolean;
    FcodTic: string;
    FcodTic_Specified: boolean;
    FcodTpr: string;
    FcodTpr_Specified: boolean;
    FcodTra: Integer;
    FcodTra_Specified: boolean;
    FcodTrd: string;
    FcodTrd_Specified: boolean;
    FcodVen: Integer;
    FcodVen_Specified: boolean;
    FconFin: string;
    FconFin_Specified: boolean;
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
    FctrPad: Integer;
    FctrPad_Specified: boolean;
    FdatLim: string;
    FdatLim_Specified: boolean;
    FdatPmr: string;
    FdatPmr_Specified: boolean;
    FdiaEsp: string;
    FdiaEsp_Specified: boolean;
    FdiaMe1: Integer;
    FdiaMe1_Specified: boolean;
    FdiaMe2: Integer;
    FdiaMe2_Specified: boolean;
    FdiaMe3: Integer;
    FdiaMe3_Specified: boolean;
    FdscPrd: string;
    FdscPrd_Specified: boolean;
    FecpCnp: string;
    FecpCnp_Specified: boolean;
    FexiAge: string;
    FexiAge_Specified: boolean;
    FexiLcp: string;
    FexiLcp_Specified: boolean;
    FfveCpg: string;
    FfveCpg_Specified: boolean;
    FfveFpg: string;
    FfveFpg_Specified: boolean;
    FfveTns: string;
    FfveTns_Specified: boolean;
    FgerTcc: string;
    FgerTcc_Specified: boolean;
    FindOrf: string;
    FindOrf_Specified: boolean;
    FlimApr: string;
    FlimApr_Specified: boolean;
    FperAqa: Integer;
    FperAqa_Specified: boolean;
    FperCcr: string;
    FperCcr_Specified: boolean;
    FperCom: Integer;
    FperCom_Specified: boolean;
    FperDs1: Double;
    FperDs1_Specified: boolean;
    FperDs2: Double;
    FperDs2_Specified: boolean;
    FperDs3: Double;
    FperDs3_Specified: boolean;
    FperDs4: Double;
    FperDs4_Specified: boolean;
    FperDs5: Double;
    FperDs5_Specified: boolean;
    FperDsc: Double;
    FperDsc_Specified: boolean;
    FperEmb: Double;
    FperEmb_Specified: boolean;
    FperEnc: Double;
    FperEnc_Specified: boolean;
    FperFre: Double;
    FperFre_Specified: boolean;
    FperIss: Double;
    FperIss_Specified: boolean;
    FperOf1: Integer;
    FperOf1_Specified: boolean;
    FperOf2: Integer;
    FperOf2_Specified: boolean;
    FperOut: Double;
    FperOut_Specified: boolean;
    FperSeg: Double;
    FperSeg_Specified: boolean;
    FporNa1: string;
    FporNa1_Specified: boolean;
    FporNa2: string;
    FporNa2_Specified: boolean;
    FporSi1: string;
    FporSi1_Specified: boolean;
    FporSi2: string;
    FporSi2_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    FqtdChs: Integer;
    FqtdChs_Specified: boolean;
    FqtdDcv: Integer;
    FqtdDcv_Specified: boolean;
    FqtdPrt: Integer;
    FqtdPrt_Specified: boolean;
    FrecDtj: Integer;
    FrecDtj_Specified: boolean;
    FrecDtm: Integer;
    FrecDtm_Specified: boolean;
    FrecJmm: Double;
    FrecJmm_Specified: boolean;
    FrecMul: Double;
    FrecMul_Specified: boolean;
    FrecTjr: string;
    FrecTjr_Specified: boolean;
    FseqCob: Integer;
    FseqCob_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FvlrAcr: Double;
    FvlrAcr_Specified: boolean;
    FvlrLim: Double;
    FvlrLim_Specified: boolean;
    FvlrPrt: Double;
    FvlrPrt_Specified: boolean;
    procedure SetacePar(Index: Integer; const Astring: string);
    function  acePar_Specified(Index: Integer): boolean;
    procedure SetacrDia(Index: Integer; const AInteger: Integer);
    function  acrDia_Specified(Index: Integer): boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetavaAti(Index: Integer; const Astring: string);
    function  avaAti_Specified(Index: Integer): boolean;
    procedure SetavaMot(Index: Integer; const AInteger: Integer);
    function  avaMot_Specified(Index: Integer): boolean;
    procedure SetavaObs(Index: Integer; const Astring: string);
    function  avaObs_Specified(Index: Integer): boolean;
    procedure SetavaVlr(Index: Integer; const ADouble: Double);
    function  avaVlr_Specified(Index: Integer): boolean;
    procedure SetavaVls(Index: Integer; const ADouble: Double);
    function  avaVls_Specified(Index: Integer): boolean;
    procedure SetavaVlu(Index: Integer; const ADouble: Double);
    function  avaVlu_Specified(Index: Integer): boolean;
    procedure SetcatCli(Index: Integer; const AInteger: Integer);
    function  catCli_Specified(Index: Integer): boolean;
    procedure SetccbCli(Index: Integer; const Astring: string);
    function  ccbCli_Specified(Index: Integer): boolean;
    procedure SetcifFob(Index: Integer; const Astring: string);
    function  cifFob_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
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
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFcr(Index: Integer; const Astring: string);
    function  codFcr_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMar(Index: Integer; const Astring: string);
    function  codMar_Specified(Index: Integer): boolean;
    procedure SetcodRed(Index: Integer; const AInteger: Integer);
    function  codRed_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodRve(Index: Integer; const Astring: string);
    function  codRve_Specified(Index: Integer): boolean;
    procedure SetcodTab(Index: Integer; const Astring: string);
    function  codTab_Specified(Index: Integer): boolean;
    procedure SetcodTic(Index: Integer; const Astring: string);
    function  codTic_Specified(Index: Integer): boolean;
    procedure SetcodTpr(Index: Integer; const Astring: string);
    function  codTpr_Specified(Index: Integer): boolean;
    procedure SetcodTra(Index: Integer; const AInteger: Integer);
    function  codTra_Specified(Index: Integer): boolean;
    procedure SetcodTrd(Index: Integer; const Astring: string);
    function  codTrd_Specified(Index: Integer): boolean;
    procedure SetcodVen(Index: Integer; const AInteger: Integer);
    function  codVen_Specified(Index: Integer): boolean;
    procedure SetconFin(Index: Integer; const Astring: string);
    function  conFin_Specified(Index: Integer): boolean;
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
    procedure SetctrPad(Index: Integer; const AInteger: Integer);
    function  ctrPad_Specified(Index: Integer): boolean;
    procedure SetdatLim(Index: Integer; const Astring: string);
    function  datLim_Specified(Index: Integer): boolean;
    procedure SetdatPmr(Index: Integer; const Astring: string);
    function  datPmr_Specified(Index: Integer): boolean;
    procedure SetdiaEsp(Index: Integer; const Astring: string);
    function  diaEsp_Specified(Index: Integer): boolean;
    procedure SetdiaMe1(Index: Integer; const AInteger: Integer);
    function  diaMe1_Specified(Index: Integer): boolean;
    procedure SetdiaMe2(Index: Integer; const AInteger: Integer);
    function  diaMe2_Specified(Index: Integer): boolean;
    procedure SetdiaMe3(Index: Integer; const AInteger: Integer);
    function  diaMe3_Specified(Index: Integer): boolean;
    procedure SetdscPrd(Index: Integer; const Astring: string);
    function  dscPrd_Specified(Index: Integer): boolean;
    procedure SetecpCnp(Index: Integer; const Astring: string);
    function  ecpCnp_Specified(Index: Integer): boolean;
    procedure SetexiAge(Index: Integer; const Astring: string);
    function  exiAge_Specified(Index: Integer): boolean;
    procedure SetexiLcp(Index: Integer; const Astring: string);
    function  exiLcp_Specified(Index: Integer): boolean;
    procedure SetfveCpg(Index: Integer; const Astring: string);
    function  fveCpg_Specified(Index: Integer): boolean;
    procedure SetfveFpg(Index: Integer; const Astring: string);
    function  fveFpg_Specified(Index: Integer): boolean;
    procedure SetfveTns(Index: Integer; const Astring: string);
    function  fveTns_Specified(Index: Integer): boolean;
    procedure SetgerTcc(Index: Integer; const Astring: string);
    function  gerTcc_Specified(Index: Integer): boolean;
    procedure SetindOrf(Index: Integer; const Astring: string);
    function  indOrf_Specified(Index: Integer): boolean;
    procedure SetlimApr(Index: Integer; const Astring: string);
    function  limApr_Specified(Index: Integer): boolean;
    procedure SetperAqa(Index: Integer; const AInteger: Integer);
    function  perAqa_Specified(Index: Integer): boolean;
    procedure SetperCcr(Index: Integer; const Astring: string);
    function  perCcr_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const AInteger: Integer);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDs1(Index: Integer; const ADouble: Double);
    function  perDs1_Specified(Index: Integer): boolean;
    procedure SetperDs2(Index: Integer; const ADouble: Double);
    function  perDs2_Specified(Index: Integer): boolean;
    procedure SetperDs3(Index: Integer; const ADouble: Double);
    function  perDs3_Specified(Index: Integer): boolean;
    procedure SetperDs4(Index: Integer; const ADouble: Double);
    function  perDs4_Specified(Index: Integer): boolean;
    procedure SetperDs5(Index: Integer; const ADouble: Double);
    function  perDs5_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const ADouble: Double);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperEmb(Index: Integer; const ADouble: Double);
    function  perEmb_Specified(Index: Integer): boolean;
    procedure SetperEnc(Index: Integer; const ADouble: Double);
    function  perEnc_Specified(Index: Integer): boolean;
    procedure SetperFre(Index: Integer; const ADouble: Double);
    function  perFre_Specified(Index: Integer): boolean;
    procedure SetperIss(Index: Integer; const ADouble: Double);
    function  perIss_Specified(Index: Integer): boolean;
    procedure SetperOf1(Index: Integer; const AInteger: Integer);
    function  perOf1_Specified(Index: Integer): boolean;
    procedure SetperOf2(Index: Integer; const AInteger: Integer);
    function  perOf2_Specified(Index: Integer): boolean;
    procedure SetperOut(Index: Integer; const ADouble: Double);
    function  perOut_Specified(Index: Integer): boolean;
    procedure SetperSeg(Index: Integer; const ADouble: Double);
    function  perSeg_Specified(Index: Integer): boolean;
    procedure SetporNa1(Index: Integer; const Astring: string);
    function  porNa1_Specified(Index: Integer): boolean;
    procedure SetporNa2(Index: Integer; const Astring: string);
    function  porNa2_Specified(Index: Integer): boolean;
    procedure SetporSi1(Index: Integer; const Astring: string);
    function  porSi1_Specified(Index: Integer): boolean;
    procedure SetporSi2(Index: Integer; const Astring: string);
    function  porSi2_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure SetqtdChs(Index: Integer; const AInteger: Integer);
    function  qtdChs_Specified(Index: Integer): boolean;
    procedure SetqtdDcv(Index: Integer; const AInteger: Integer);
    function  qtdDcv_Specified(Index: Integer): boolean;
    procedure SetqtdPrt(Index: Integer; const AInteger: Integer);
    function  qtdPrt_Specified(Index: Integer): boolean;
    procedure SetrecDtj(Index: Integer; const AInteger: Integer);
    function  recDtj_Specified(Index: Integer): boolean;
    procedure SetrecDtm(Index: Integer; const AInteger: Integer);
    function  recDtm_Specified(Index: Integer): boolean;
    procedure SetrecJmm(Index: Integer; const ADouble: Double);
    function  recJmm_Specified(Index: Integer): boolean;
    procedure SetrecMul(Index: Integer; const ADouble: Double);
    function  recMul_Specified(Index: Integer): boolean;
    procedure SetrecTjr(Index: Integer; const Astring: string);
    function  recTjr_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const AInteger: Integer);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SetvlrAcr(Index: Integer; const ADouble: Double);
    function  vlrAcr_Specified(Index: Integer): boolean;
    procedure SetvlrLim(Index: Integer; const ADouble: Double);
    function  vlrLim_Specified(Index: Integer): boolean;
    procedure SetvlrPrt(Index: Integer; const ADouble: Double);
    function  vlrPrt_Specified(Index: Integer): boolean;
  published
    property acePar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacePar write SetacePar stored acePar_Specified;
    property acrDia:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacrDia write SetacrDia stored acrDia_Specified;
    property antDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property avaAti:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaAti write SetavaAti stored avaAti_Specified;
    property avaMot:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaMot write SetavaMot stored avaMot_Specified;
    property avaObs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaObs write SetavaObs stored avaObs_Specified;
    property avaVlr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlr write SetavaVlr stored avaVlr_Specified;
    property avaVls:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVls write SetavaVls stored avaVls_Specified;
    property avaVlu:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlu write SetavaVlu stored avaVlu_Specified;
    property catCli:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatCli write SetcatCli stored catCli_Specified;
    property ccbCli:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbCli write SetccbCli stored ccbCli_Specified;
    property cifFob:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcifFob write SetcifFob stored cifFob_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCpg write SetcodCpg stored codCpg_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFcr write SetcodFcr stored codFcr_Specified;
    property codFil:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codIn1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMar write SetcodMar stored codMar_Specified;
    property codRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRed write SetcodRed stored codRed_Specified;
    property codRep:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codRve:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRve write SetcodRve stored codRve_Specified;
    property codTab:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTab write SetcodTab stored codTab_Specified;
    property codTic:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTic write SetcodTic stored codTic_Specified;
    property codTpr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpr write SetcodTpr stored codTpr_Specified;
    property codTra:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTra write SetcodTra stored codTra_Specified;
    property codTrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTrd write SetcodTrd stored codTrd_Specified;
    property codVen:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodVen write SetcodVen stored codVen_Specified;
    property conFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FconFin write SetconFin stored conFin_Specified;
    property criEdv:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriEdv write SetcriEdv stored criEdv_Specified;
    property ctaAad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAad write SetctaAad stored ctaAad_Specified;
    property ctaAux:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAux write SetctaAux stored ctaAux_Specified;
    property ctaFcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFcr write SetctaFcr stored ctaFcr_Specified;
    property ctaFdv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFdv write SetctaFdv stored ctaFdv_Specified;
    property ctaRcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRcr write SetctaRcr stored ctaRcr_Specified;
    property ctaRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrPad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrPad write SetctrPad stored ctrPad_Specified;
    property datLim:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLim write SetdatLim stored datLim_Specified;
    property datPmr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPmr write SetdatPmr stored datPmr_Specified;
    property diaEsp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaEsp write SetdiaEsp stored diaEsp_Specified;
    property diaMe1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe1 write SetdiaMe1 stored diaMe1_Specified;
    property diaMe2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe2 write SetdiaMe2 stored diaMe2_Specified;
    property diaMe3:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe3 write SetdiaMe3 stored diaMe3_Specified;
    property dscPrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscPrd write SetdscPrd stored dscPrd_Specified;
    property ecpCnp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FecpCnp write SetecpCnp stored ecpCnp_Specified;
    property exiAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiAge write SetexiAge stored exiAge_Specified;
    property exiLcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiLcp write SetexiLcp stored exiLcp_Specified;
    property fveCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveCpg write SetfveCpg stored fveCpg_Specified;
    property fveFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveFpg write SetfveFpg stored fveFpg_Specified;
    property fveTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveTns write SetfveTns stored fveTns_Specified;
    property gerTcc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTcc write SetgerTcc stored gerTcc_Specified;
    property indOrf:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindOrf write SetindOrf stored indOrf_Specified;
    property limApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimApr write SetlimApr stored limApr_Specified;
    property perAqa:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAqa write SetperAqa stored perAqa_Specified;
    property perCcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCcr write SetperCcr stored perCcr_Specified;
    property perCom:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDs1:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs1 write SetperDs1 stored perDs1_Specified;
    property perDs2:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs2 write SetperDs2 stored perDs2_Specified;
    property perDs3:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs3 write SetperDs3 stored perDs3_Specified;
    property perDs4:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs4 write SetperDs4 stored perDs4_Specified;
    property perDs5:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs5 write SetperDs5 stored perDs5_Specified;
    property perDsc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perEmb:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEmb write SetperEmb stored perEmb_Specified;
    property perEnc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEnc write SetperEnc stored perEnc_Specified;
    property perFre:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFre write SetperFre stored perFre_Specified;
    property perIss:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIss write SetperIss stored perIss_Specified;
    property perOf1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf1 write SetperOf1 stored perOf1_Specified;
    property perOf2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf2 write SetperOf2 stored perOf2_Specified;
    property perOut:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOut write SetperOut stored perOut_Specified;
    property perSeg:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperSeg write SetperSeg stored perSeg_Specified;
    property porNa1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa1 write SetporNa1 stored porNa1_Specified;
    property porNa2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa2 write SetporNa2 stored porNa2_Specified;
    property porSi1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi1 write SetporSi1 stored porSi1_Specified;
    property porSi2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi2 write SetporSi2 stored porSi2_Specified;
    property prdDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property qtdChs:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdChs write SetqtdChs stored qtdChs_Specified;
    property qtdDcv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDcv write SetqtdDcv stored qtdDcv_Specified;
    property qtdPrt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdPrt write SetqtdPrt stored qtdPrt_Specified;
    property recDtj:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtj write SetrecDtj stored recDtj_Specified;
    property recDtm:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtm write SetrecDtm stored recDtm_Specified;
    property recJmm:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJmm write SetrecJmm stored recJmm_Specified;
    property recMul:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecMul write SetrecMul stored recMul_Specified;
    property recTjr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecTjr write SetrecTjr stored recTjr_Specified;
    property seqCob:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property seqEnt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property tolDsc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property vlrAcr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAcr write SetvlrAcr stored vlrAcr_Specified;
    property vlrLim:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLim write SetvlrLim stored vlrLim_Specified;
    property vlrPrt:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPrt write SetvlrPrt stored vlrPrt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2OutRetornosClientes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2OutRetornosClientes = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFor:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property ideExt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4InDadosGeraisCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4InDadosGeraisCliente = class(TRemotable)
  private
    FapeCli: string;
    FapeCli_Specified: boolean;
    FbaiCli: string;
    FbaiCli_Specified: boolean;
    FbaiCob: string;
    FbaiCob_Specified: boolean;
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcadastroCEP: Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP;
    FcadastroCEP_Specified: boolean;
    FcalFun: string;
    FcalFun_Specified: boolean;
    FcepCli: string;
    FcepCli_Specified: boolean;
    FcepCob: Integer;
    FcepCob_Specified: boolean;
    FcepEnt: Integer;
    FcepEnt_Specified: boolean;
    FcepFre: Integer;
    FcepFre_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcgcCob: Double;
    FcgcCob_Specified: boolean;
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcgcEnt: Double;
    FcgcEnt_Specified: boolean;
    FcidCli: string;
    FcidCli_Specified: boolean;
    FcidCob: string;
    FcidCob_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcliCon: string;
    FcliCon_Specified: boolean;
    FcliFor: string;
    FcliFor_Specified: boolean;
    FcliPrx: string;
    FcliPrx_Specified: boolean;
    FcliRep: Integer;
    FcliRep_Specified: boolean;
    FcliTra: Integer;
    FcliTra_Specified: boolean;
    FclientePessoaFisica: Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica;
    FclientePessoaFisica_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodGre: string;
    FcodGre_Specified: boolean;
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
    FcplCob: string;
    FcplCob_Specified: boolean;
    FcplEnd: string;
    FcplEnd_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FcxaPst: Integer;
    FcxaPst_Specified: boolean;
    FdatSuf: string;
    FdatSuf_Specified: boolean;
    FdefinicoesCliente: Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente;
    FdefinicoesCliente_Specified: boolean;
    FeenCli: string;
    FeenCli_Specified: boolean;
    FeenCob: string;
    FeenCob_Specified: boolean;
    FeenEnt: string;
    FeenEnt_Specified: boolean;
    FemaNfe: string;
    FemaNfe_Specified: boolean;
    FendCli: string;
    FendCli_Specified: boolean;
    FendCob: string;
    FendCob_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FenderecosEntrega: Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega;
    FenderecosEntrega_Specified: boolean;
    FentCor: string;
    FentCor_Specified: boolean;
    FestCob: string;
    FestCob_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FfaxCli: string;
    FfaxCli_Specified: boolean;
    FfonCl2: string;
    FfonCl2_Specified: boolean;
    FfonCl3: string;
    FfonCl3_Specified: boolean;
    FfonCl4: string;
    FfonCl4_Specified: boolean;
    FfonCl5: string;
    FfonCl5_Specified: boolean;
    FfonCli: string;
    FfonCli_Specified: boolean;
    FideCli: string;
    FideCli_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    FindCoo: string;
    FindCoo_Specified: boolean;
    FinsAnp: Integer;
    FinsAnp_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FinsEst: string;
    FinsEst_Specified: boolean;
    FinsMun: string;
    FinsMun_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FlimRet: string;
    FlimRet_Specified: boolean;
    FmarCli: string;
    FmarCli_Specified: boolean;
    FnatCof: Integer;
    FnatCof_Specified: boolean;
    FnatPis: Integer;
    FnatPis_Specified: boolean;
    FnatRet: Integer;
    FnatRet_Specified: boolean;
    FnenCli: string;
    FnenCli_Specified: boolean;
    FnenCob: string;
    FnenCob_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FnumIdf: string;
    FnumIdf_Specified: boolean;
    FobsMot: string;
    FobsMot_Specified: boolean;
    FperAin: Integer;
    FperAin_Specified: boolean;
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
    FseqRoe: Integer;
    FseqRoe_Specified: boolean;
    FsigUfs: string;
    FsigUfs_Specified: boolean;
    FsitCli: string;
    FsitCli_Specified: boolean;
    FtipAce: Integer;
    FtipAce_Specified: boolean;
    FtipCli: string;
    FtipCli_Specified: boolean;
    FtipEmc: Integer;
    FtipEmc_Specified: boolean;
    FtipEmp: Integer;
    FtipEmp_Specified: boolean;
    FtipMer: string;
    FtipMer_Specified: boolean;
    FtriCof: string;
    FtriCof_Specified: boolean;
    FtriIcm: string;
    FtriIcm_Specified: boolean;
    FtriIpi: string;
    FtriIpi_Specified: boolean;
    FtriPis: string;
    FtriPis_Specified: boolean;
    FzipCod: string;
    FzipCod_Specified: boolean;
    FzonFra: Integer;
    FzonFra_Specified: boolean;
    procedure SetapeCli(Index: Integer; const Astring: string);
    function  apeCli_Specified(Index: Integer): boolean;
    procedure SetbaiCli(Index: Integer; const Astring: string);
    function  baiCli_Specified(Index: Integer): boolean;
    procedure SetbaiCob(Index: Integer; const Astring: string);
    function  baiCob_Specified(Index: Integer): boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP);
    function  cadastroCEP_Specified(Index: Integer): boolean;
    procedure SetcalFun(Index: Integer; const Astring: string);
    function  calFun_Specified(Index: Integer): boolean;
    procedure SetcepCli(Index: Integer; const Astring: string);
    function  cepCli_Specified(Index: Integer): boolean;
    procedure SetcepCob(Index: Integer; const AInteger: Integer);
    function  cepCob_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const AInteger: Integer);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcepFre(Index: Integer; const AInteger: Integer);
    function  cepFre_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcgcCob(Index: Integer; const ADouble: Double);
    function  cgcCob_Specified(Index: Integer): boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const ADouble: Double);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidCli(Index: Integer; const Astring: string);
    function  cidCli_Specified(Index: Integer): boolean;
    procedure SetcidCob(Index: Integer; const Astring: string);
    function  cidCob_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcliCon(Index: Integer; const Astring: string);
    function  cliCon_Specified(Index: Integer): boolean;
    procedure SetcliFor(Index: Integer; const Astring: string);
    function  cliFor_Specified(Index: Integer): boolean;
    procedure SetcliPrx(Index: Integer; const Astring: string);
    function  cliPrx_Specified(Index: Integer): boolean;
    procedure SetcliRep(Index: Integer; const AInteger: Integer);
    function  cliRep_Specified(Index: Integer): boolean;
    procedure SetcliTra(Index: Integer; const AInteger: Integer);
    function  cliTra_Specified(Index: Integer): boolean;
    procedure SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica);
    function  clientePessoaFisica_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodGre(Index: Integer; const Astring: string);
    function  codGre_Specified(Index: Integer): boolean;
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
    procedure SetcplCob(Index: Integer; const Astring: string);
    function  cplCob_Specified(Index: Integer): boolean;
    procedure SetcplEnd(Index: Integer; const Astring: string);
    function  cplEnd_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetcxaPst(Index: Integer; const AInteger: Integer);
    function  cxaPst_Specified(Index: Integer): boolean;
    procedure SetdatSuf(Index: Integer; const Astring: string);
    function  datSuf_Specified(Index: Integer): boolean;
    procedure SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente);
    function  definicoesCliente_Specified(Index: Integer): boolean;
    procedure SeteenCli(Index: Integer; const Astring: string);
    function  eenCli_Specified(Index: Integer): boolean;
    procedure SeteenCob(Index: Integer; const Astring: string);
    function  eenCob_Specified(Index: Integer): boolean;
    procedure SeteenEnt(Index: Integer; const Astring: string);
    function  eenEnt_Specified(Index: Integer): boolean;
    procedure SetemaNfe(Index: Integer; const Astring: string);
    function  emaNfe_Specified(Index: Integer): boolean;
    procedure SetendCli(Index: Integer; const Astring: string);
    function  endCli_Specified(Index: Integer): boolean;
    procedure SetendCob(Index: Integer; const Astring: string);
    function  endCob_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega);
    function  enderecosEntrega_Specified(Index: Integer): boolean;
    procedure SetentCor(Index: Integer; const Astring: string);
    function  entCor_Specified(Index: Integer): boolean;
    procedure SetestCob(Index: Integer; const Astring: string);
    function  estCob_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetfaxCli(Index: Integer; const Astring: string);
    function  faxCli_Specified(Index: Integer): boolean;
    procedure SetfonCl2(Index: Integer; const Astring: string);
    function  fonCl2_Specified(Index: Integer): boolean;
    procedure SetfonCl3(Index: Integer; const Astring: string);
    function  fonCl3_Specified(Index: Integer): boolean;
    procedure SetfonCl4(Index: Integer; const Astring: string);
    function  fonCl4_Specified(Index: Integer): boolean;
    procedure SetfonCl5(Index: Integer; const Astring: string);
    function  fonCl5_Specified(Index: Integer): boolean;
    procedure SetfonCli(Index: Integer; const Astring: string);
    function  fonCli_Specified(Index: Integer): boolean;
    procedure SetideCli(Index: Integer; const Astring: string);
    function  ideCli_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetindCoo(Index: Integer; const Astring: string);
    function  indCoo_Specified(Index: Integer): boolean;
    procedure SetinsAnp(Index: Integer; const AInteger: Integer);
    function  insAnp_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetinsEst(Index: Integer; const Astring: string);
    function  insEst_Specified(Index: Integer): boolean;
    procedure SetinsMun(Index: Integer; const Astring: string);
    function  insMun_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetlimRet(Index: Integer; const Astring: string);
    function  limRet_Specified(Index: Integer): boolean;
    procedure SetmarCli(Index: Integer; const Astring: string);
    function  marCli_Specified(Index: Integer): boolean;
    procedure SetnatCof(Index: Integer; const AInteger: Integer);
    function  natCof_Specified(Index: Integer): boolean;
    procedure SetnatPis(Index: Integer; const AInteger: Integer);
    function  natPis_Specified(Index: Integer): boolean;
    procedure SetnatRet(Index: Integer; const AInteger: Integer);
    function  natRet_Specified(Index: Integer): boolean;
    procedure SetnenCli(Index: Integer; const Astring: string);
    function  nenCli_Specified(Index: Integer): boolean;
    procedure SetnenCob(Index: Integer; const Astring: string);
    function  nenCob_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetnumIdf(Index: Integer; const Astring: string);
    function  numIdf_Specified(Index: Integer): boolean;
    procedure SetobsMot(Index: Integer; const Astring: string);
    function  obsMot_Specified(Index: Integer): boolean;
    procedure SetperAin(Index: Integer; const AInteger: Integer);
    function  perAin_Specified(Index: Integer): boolean;
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
    procedure SetseqRoe(Index: Integer; const AInteger: Integer);
    function  seqRoe_Specified(Index: Integer): boolean;
    procedure SetsigUfs(Index: Integer; const Astring: string);
    function  sigUfs_Specified(Index: Integer): boolean;
    procedure SetsitCli(Index: Integer; const Astring: string);
    function  sitCli_Specified(Index: Integer): boolean;
    procedure SettipAce(Index: Integer; const AInteger: Integer);
    function  tipAce_Specified(Index: Integer): boolean;
    procedure SettipCli(Index: Integer; const Astring: string);
    function  tipCli_Specified(Index: Integer): boolean;
    procedure SettipEmc(Index: Integer; const AInteger: Integer);
    function  tipEmc_Specified(Index: Integer): boolean;
    procedure SettipEmp(Index: Integer; const AInteger: Integer);
    function  tipEmp_Specified(Index: Integer): boolean;
    procedure SettipMer(Index: Integer; const Astring: string);
    function  tipMer_Specified(Index: Integer): boolean;
    procedure SettriCof(Index: Integer; const Astring: string);
    function  triCof_Specified(Index: Integer): boolean;
    procedure SettriIcm(Index: Integer; const Astring: string);
    function  triIcm_Specified(Index: Integer): boolean;
    procedure SettriIpi(Index: Integer; const Astring: string);
    function  triIpi_Specified(Index: Integer): boolean;
    procedure SettriPis(Index: Integer; const Astring: string);
    function  triPis_Specified(Index: Integer): boolean;
    procedure SetzipCod(Index: Integer; const Astring: string);
    function  zipCod_Specified(Index: Integer): boolean;
    procedure SetzonFra(Index: Integer; const AInteger: Integer);
    function  zonFra_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property apeCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FapeCli write SetapeCli stored apeCli_Specified;
    property baiCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCli write SetbaiCli stored baiCli_Specified;
    property baiCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCob write SetbaiCob stored baiCob_Specified;
    property baiEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cadastroCEP:         Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FcadastroCEP write SetcadastroCEP stored cadastroCEP_Specified;
    property calFun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcalFun write SetcalFun stored calFun_Specified;
    property cepCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCli write SetcepCli stored cepCli_Specified;
    property cepCob:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCob write SetcepCob stored cepCob_Specified;
    property cepEnt:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cepFre:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFre write SetcepFre stored cepFre_Specified;
    property cepIni:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cgcCob:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCob write SetcgcCob stored cgcCob_Specified;
    property cgcCpf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property cgcEnt:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCli write SetcidCli stored cidCli_Specified;
    property cidCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCob write SetcidCob stored cidCob_Specified;
    property cidEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cliCon:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliCon write SetcliCon stored cliCon_Specified;
    property cliFor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliFor write SetcliFor stored cliFor_Specified;
    property cliPrx:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliPrx write SetcliPrx stored cliPrx_Specified;
    property cliRep:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliRep write SetcliRep stored cliRep_Specified;
    property cliTra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliTra write SetcliTra stored cliTra_Specified;
    property clientePessoaFisica: Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FclientePessoaFisica write SetclientePessoaFisica stored clientePessoaFisica_Specified;
    property codCli:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codFor:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codGre:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodGre write SetcodGre stored codGre_Specified;
    property codMot:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMot write SetcodMot stored codMot_Specified;
    property codPai:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPai write SetcodPai stored codPai_Specified;
    property codRam:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRam write SetcodRam stored codRam_Specified;
    property codRoe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRoe write SetcodRoe stored codRoe_Specified;
    property codRtr:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRtr write SetcodRtr stored codRtr_Specified;
    property codSro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSro write SetcodSro stored codSro_Specified;
    property codSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSuf write SetcodSuf stored codSuf_Specified;
    property cplCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplCob write SetcplCob stored cplCob_Specified;
    property cplEnd:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnd write SetcplEnd stored cplEnd_Specified;
    property cplEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property cxaPst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcxaPst write SetcxaPst stored cxaPst_Specified;
    property datSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatSuf write SetdatSuf stored datSuf_Specified;
    property definicoesCliente:   Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente    Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdefinicoesCliente write SetdefinicoesCliente stored definicoesCliente_Specified;
    property eenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCli write SeteenCli stored eenCli_Specified;
    property eenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCob write SeteenCob stored eenCob_Specified;
    property eenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenEnt write SeteenEnt stored eenEnt_Specified;
    property emaNfe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FemaNfe write SetemaNfe stored emaNfe_Specified;
    property endCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCli write SetendCli stored endCli_Specified;
    property endCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCob write SetendCob stored endCob_Specified;
    property endEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property enderecosEntrega:    Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega     Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FenderecosEntrega write SetenderecosEntrega stored enderecosEntrega_Specified;
    property entCor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FentCor write SetentCor stored entCor_Specified;
    property estCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCob write SetestCob stored estCob_Specified;
    property estEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property faxCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxCli write SetfaxCli stored faxCli_Specified;
    property fonCl2:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl2 write SetfonCl2 stored fonCl2_Specified;
    property fonCl3:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl3 write SetfonCl3 stored fonCl3_Specified;
    property fonCl4:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl4 write SetfonCl4 stored fonCl4_Specified;
    property fonCl5:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl5 write SetfonCl5 stored fonCl5_Specified;
    property fonCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCli write SetfonCli stored fonCli_Specified;
    property ideCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideCli write SetideCli stored ideCli_Specified;
    property ideExt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property indCoo:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCoo write SetindCoo stored indCoo_Specified;
    property insAnp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsAnp write SetinsAnp stored insAnp_Specified;
    property insEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property insEst:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEst write SetinsEst stored insEst_Specified;
    property insMun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsMun write SetinsMun stored insMun_Specified;
    property intNet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property limRet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimRet write SetlimRet stored limRet_Specified;
    property marCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmarCli write SetmarCli stored marCli_Specified;
    property natCof:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatCof write SetnatCof stored natCof_Specified;
    property natPis:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatPis write SetnatPis stored natPis_Specified;
    property natRet:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatRet write SetnatRet stored natRet_Specified;
    property nenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCli write SetnenCli stored nenCli_Specified;
    property nenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCob write SetnenCob stored nenCob_Specified;
    property nenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property numIdf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumIdf write SetnumIdf stored numIdf_Specified;
    property obsMot:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMot write SetobsMot stored obsMot_Specified;
    property perAin:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAin write SetperAin stored perAin_Specified;
    property regEst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FregEst write SetregEst stored regEst_Specified;
    property retCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCof write SetretCof stored retCof_Specified;
    property retCsl:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCsl write SetretCsl stored retCsl_Specified;
    property retIrf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretIrf write SetretIrf stored retIrf_Specified;
    property retOur:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretOur write SetretOur stored retOur_Specified;
    property retPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPis write SetretPis stored retPis_Specified;
    property retPro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPro write SetretPro stored retPro_Specified;
    property seqRoe:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRoe write SetseqRoe stored seqRoe_Specified;
    property sigUfs:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigUfs write SetsigUfs stored sigUfs_Specified;
    property sitCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCli write SetsitCli stored sitCli_Specified;
    property tipAce:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipAce write SettipAce stored tipAce_Specified;
    property tipCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCli write SettipCli stored tipCli_Specified;
    property tipEmc:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmc write SettipEmc stored tipEmc_Specified;
    property tipEmp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmp write SettipEmp stored tipEmp_Specified;
    property tipMer:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMer write SettipMer stored tipMer_Specified;
    property triCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriCof write SettriCof stored triCof_Specified;
    property triIcm:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIcm write SettriIcm stored triIcm_Specified;
    property triIpi:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIpi write SettriIpi stored triIpi_Specified;
    property triPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriPis write SettriPis stored triPis_Specified;
    property zipCod:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzipCod write SetzipCod stored zipCod_Specified;
    property zonFra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzonFra write SetzonFra stored zonFra_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica = class(TRemotable)
  private
    FcidNat: string;
    FcidNat_Specified: boolean;
    FcodSex: string;
    FcodSex_Specified: boolean;
    FdatNas: string;
    FdatNas_Specified: boolean;
    FdatRge: string;
    FdatRge_Specified: boolean;
    FestCiv: Integer;
    FestCiv_Specified: boolean;
    FnomMae: string;
    FnomMae_Specified: boolean;
    FnomPai: string;
    FnomPai_Specified: boolean;
    FnumRge: string;
    FnumRge_Specified: boolean;
    ForgRge: string;
    ForgRge_Specified: boolean;
    FrefCm1: string;
    FrefCm1_Specified: boolean;
    procedure SetcidNat(Index: Integer; const Astring: string);
    function  cidNat_Specified(Index: Integer): boolean;
    procedure SetcodSex(Index: Integer; const Astring: string);
    function  codSex_Specified(Index: Integer): boolean;
    procedure SetdatNas(Index: Integer; const Astring: string);
    function  datNas_Specified(Index: Integer): boolean;
    procedure SetdatRge(Index: Integer; const Astring: string);
    function  datRge_Specified(Index: Integer): boolean;
    procedure SetestCiv(Index: Integer; const AInteger: Integer);
    function  estCiv_Specified(Index: Integer): boolean;
    procedure SetnomMae(Index: Integer; const Astring: string);
    function  nomMae_Specified(Index: Integer): boolean;
    procedure SetnomPai(Index: Integer; const Astring: string);
    function  nomPai_Specified(Index: Integer): boolean;
    procedure SetnumRge(Index: Integer; const Astring: string);
    function  numRge_Specified(Index: Integer): boolean;
    procedure SetorgRge(Index: Integer; const Astring: string);
    function  orgRge_Specified(Index: Integer): boolean;
    procedure SetrefCm1(Index: Integer; const Astring: string);
    function  refCm1_Specified(Index: Integer): boolean;
  published
    property cidNat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidNat write SetcidNat stored cidNat_Specified;
    property codSex: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSex write SetcodSex stored codSex_Specified;
    property datNas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNas write SetdatNas stored datNas_Specified;
    property datRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatRge write SetdatRge stored datRge_Specified;
    property estCiv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCiv write SetestCiv stored estCiv_Specified;
    property nomMae: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomMae write SetnomMae stored nomMae_Specified;
    property nomPai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomPai write SetnomPai stored nomPai_Specified;
    property numRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRge write SetnumRge stored numRge_Specified;
    property orgRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read ForgRge write SetorgRge stored orgRge_Specified;
    property refCm1: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrefCm1 write SetrefCm1 stored refCm1_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes4InDadosGeraisClienteCadastroCEP, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes4InDadosGeraisClienteCadastroCEP = class(TRemotable)
  private
    FbaiCid: string;
    FbaiCid_Specified: boolean;
    FcepFim: string;
    FcepFim_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcepPol: string;
    FcepPol_Specified: boolean;
    FcodRai: Integer;
    FcodRai_Specified: boolean;
    FendCid: string;
    FendCid_Specified: boolean;
    FnomCid: string;
    FnomCid_Specified: boolean;
    procedure SetbaiCid(Index: Integer; const Astring: string);
    function  baiCid_Specified(Index: Integer): boolean;
    procedure SetcepFim(Index: Integer; const Astring: string);
    function  cepFim_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcepPol(Index: Integer; const Astring: string);
    function  cepPol_Specified(Index: Integer): boolean;
    procedure SetcodRai(Index: Integer; const AInteger: Integer);
    function  codRai_Specified(Index: Integer): boolean;
    procedure SetendCid(Index: Integer; const Astring: string);
    function  endCid_Specified(Index: Integer): boolean;
    procedure SetnomCid(Index: Integer; const Astring: string);
    function  nomCid_Specified(Index: Integer): boolean;
  published
    property baiCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCid write SetbaiCid stored baiCid_Specified;
    property cepFim: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFim write SetcepFim stored cepFim_Specified;
    property cepIni: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cepPol: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepPol write SetcepPol stored cepPol_Specified;
    property codRai: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRai write SetcodRai stored codRai_Specified;
    property endCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCid write SetendCid stored endCid_Specified;
    property nomCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCid write SetnomCid stored nomCid_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesExcluirClientesInDadosGeraisCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesExcluirClientesInDadosGeraisCliente = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
  published
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesInDadosGeraisClienteEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesInDadosGeraisClienteEnderecosEntrega = class(TRemotable)
  private
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcepEnt: string;
    FcepEnt_Specified: boolean;
    FcgcEnt: string;
    FcgcEnt_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FiniEnt: string;
    FiniEnt_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FprxEnt: string;
    FprxEnt_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FsitReg: string;
    FsitReg_Specified: boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const Astring: string);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const Astring: string);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetiniEnt(Index: Integer; const Astring: string);
    function  iniEnt_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetprxEnt(Index: Integer; const Astring: string);
    function  prxEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetsitReg(Index: Integer; const Astring: string);
    function  sitReg_Specified(Index: Integer): boolean;
  published
    property baiEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cepEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cgcEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cplEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property endEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property estEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property iniEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FiniEnt write SetiniEnt stored iniEnt_Specified;
    property insEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property nenEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property prxEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprxEnt write SetprxEnt stored prxEnt_Specified;
    property seqEnt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property sitReg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitReg write SetsitReg stored sitReg_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesInDadosGeraisClienteDefinicoesCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesInDadosGeraisClienteDefinicoesCliente = class(TRemotable)
  private
    FacePar: string;
    FacePar_Specified: boolean;
    FacrDia: Integer;
    FacrDia_Specified: boolean;
    FantDsc: string;
    FantDsc_Specified: boolean;
    FavaAti: string;
    FavaAti_Specified: boolean;
    FavaMot: Integer;
    FavaMot_Specified: boolean;
    FavaObs: string;
    FavaObs_Specified: boolean;
    FavaVlr: Double;
    FavaVlr_Specified: boolean;
    FavaVls: Double;
    FavaVls_Specified: boolean;
    FavaVlu: Double;
    FavaVlu_Specified: boolean;
    FcatCli: Integer;
    FcatCli_Specified: boolean;
    FccbCli: string;
    FccbCli_Specified: boolean;
    FcifFob: string;
    FcifFob_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
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
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFcr: string;
    FcodFcr_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMar: string;
    FcodMar_Specified: boolean;
    FcodRed: Integer;
    FcodRed_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodRve: string;
    FcodRve_Specified: boolean;
    FcodTab: string;
    FcodTab_Specified: boolean;
    FcodTic: string;
    FcodTic_Specified: boolean;
    FcodTpr: string;
    FcodTpr_Specified: boolean;
    FcodTra: Integer;
    FcodTra_Specified: boolean;
    FcodTrd: string;
    FcodTrd_Specified: boolean;
    FcodVen: Integer;
    FcodVen_Specified: boolean;
    FconFin: string;
    FconFin_Specified: boolean;
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
    FctrPad: Integer;
    FctrPad_Specified: boolean;
    FdatLim: string;
    FdatLim_Specified: boolean;
    FdatPmr: string;
    FdatPmr_Specified: boolean;
    FdiaEsp: string;
    FdiaEsp_Specified: boolean;
    FdiaMe1: Integer;
    FdiaMe1_Specified: boolean;
    FdiaMe2: Integer;
    FdiaMe2_Specified: boolean;
    FdiaMe3: Integer;
    FdiaMe3_Specified: boolean;
    FdscPrd: string;
    FdscPrd_Specified: boolean;
    FecpCnp: string;
    FecpCnp_Specified: boolean;
    FexiAge: string;
    FexiAge_Specified: boolean;
    FexiLcp: string;
    FexiLcp_Specified: boolean;
    FfveCpg: string;
    FfveCpg_Specified: boolean;
    FfveFpg: string;
    FfveFpg_Specified: boolean;
    FfveTns: string;
    FfveTns_Specified: boolean;
    FgerTcc: string;
    FgerTcc_Specified: boolean;
    FindOrf: string;
    FindOrf_Specified: boolean;
    FlimApr: string;
    FlimApr_Specified: boolean;
    FperAqa: Integer;
    FperAqa_Specified: boolean;
    FperCcr: string;
    FperCcr_Specified: boolean;
    FperCom: Integer;
    FperCom_Specified: boolean;
    FperDs1: Double;
    FperDs1_Specified: boolean;
    FperDs2: Double;
    FperDs2_Specified: boolean;
    FperDs3: Double;
    FperDs3_Specified: boolean;
    FperDs4: Double;
    FperDs4_Specified: boolean;
    FperDs5: Double;
    FperDs5_Specified: boolean;
    FperDsc: Double;
    FperDsc_Specified: boolean;
    FperEmb: Double;
    FperEmb_Specified: boolean;
    FperEnc: Double;
    FperEnc_Specified: boolean;
    FperFre: Double;
    FperFre_Specified: boolean;
    FperIss: Double;
    FperIss_Specified: boolean;
    FperOf1: Integer;
    FperOf1_Specified: boolean;
    FperOf2: Integer;
    FperOf2_Specified: boolean;
    FperOut: Double;
    FperOut_Specified: boolean;
    FperSeg: Double;
    FperSeg_Specified: boolean;
    FporNa1: string;
    FporNa1_Specified: boolean;
    FporNa2: string;
    FporNa2_Specified: boolean;
    FporSi1: string;
    FporSi1_Specified: boolean;
    FporSi2: string;
    FporSi2_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    FqtdChs: Integer;
    FqtdChs_Specified: boolean;
    FqtdDcv: Integer;
    FqtdDcv_Specified: boolean;
    FqtdPrt: Integer;
    FqtdPrt_Specified: boolean;
    FrecDtj: Integer;
    FrecDtj_Specified: boolean;
    FrecDtm: Integer;
    FrecDtm_Specified: boolean;
    FrecJmm: Double;
    FrecJmm_Specified: boolean;
    FrecMul: Double;
    FrecMul_Specified: boolean;
    FrecTjr: string;
    FrecTjr_Specified: boolean;
    FseqCob: Integer;
    FseqCob_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FvlrAcr: Double;
    FvlrAcr_Specified: boolean;
    FvlrLim: Double;
    FvlrLim_Specified: boolean;
    FvlrPrt: Double;
    FvlrPrt_Specified: boolean;
    procedure SetacePar(Index: Integer; const Astring: string);
    function  acePar_Specified(Index: Integer): boolean;
    procedure SetacrDia(Index: Integer; const AInteger: Integer);
    function  acrDia_Specified(Index: Integer): boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetavaAti(Index: Integer; const Astring: string);
    function  avaAti_Specified(Index: Integer): boolean;
    procedure SetavaMot(Index: Integer; const AInteger: Integer);
    function  avaMot_Specified(Index: Integer): boolean;
    procedure SetavaObs(Index: Integer; const Astring: string);
    function  avaObs_Specified(Index: Integer): boolean;
    procedure SetavaVlr(Index: Integer; const ADouble: Double);
    function  avaVlr_Specified(Index: Integer): boolean;
    procedure SetavaVls(Index: Integer; const ADouble: Double);
    function  avaVls_Specified(Index: Integer): boolean;
    procedure SetavaVlu(Index: Integer; const ADouble: Double);
    function  avaVlu_Specified(Index: Integer): boolean;
    procedure SetcatCli(Index: Integer; const AInteger: Integer);
    function  catCli_Specified(Index: Integer): boolean;
    procedure SetccbCli(Index: Integer; const Astring: string);
    function  ccbCli_Specified(Index: Integer): boolean;
    procedure SetcifFob(Index: Integer; const Astring: string);
    function  cifFob_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
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
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFcr(Index: Integer; const Astring: string);
    function  codFcr_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMar(Index: Integer; const Astring: string);
    function  codMar_Specified(Index: Integer): boolean;
    procedure SetcodRed(Index: Integer; const AInteger: Integer);
    function  codRed_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodRve(Index: Integer; const Astring: string);
    function  codRve_Specified(Index: Integer): boolean;
    procedure SetcodTab(Index: Integer; const Astring: string);
    function  codTab_Specified(Index: Integer): boolean;
    procedure SetcodTic(Index: Integer; const Astring: string);
    function  codTic_Specified(Index: Integer): boolean;
    procedure SetcodTpr(Index: Integer; const Astring: string);
    function  codTpr_Specified(Index: Integer): boolean;
    procedure SetcodTra(Index: Integer; const AInteger: Integer);
    function  codTra_Specified(Index: Integer): boolean;
    procedure SetcodTrd(Index: Integer; const Astring: string);
    function  codTrd_Specified(Index: Integer): boolean;
    procedure SetcodVen(Index: Integer; const AInteger: Integer);
    function  codVen_Specified(Index: Integer): boolean;
    procedure SetconFin(Index: Integer; const Astring: string);
    function  conFin_Specified(Index: Integer): boolean;
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
    procedure SetctrPad(Index: Integer; const AInteger: Integer);
    function  ctrPad_Specified(Index: Integer): boolean;
    procedure SetdatLim(Index: Integer; const Astring: string);
    function  datLim_Specified(Index: Integer): boolean;
    procedure SetdatPmr(Index: Integer; const Astring: string);
    function  datPmr_Specified(Index: Integer): boolean;
    procedure SetdiaEsp(Index: Integer; const Astring: string);
    function  diaEsp_Specified(Index: Integer): boolean;
    procedure SetdiaMe1(Index: Integer; const AInteger: Integer);
    function  diaMe1_Specified(Index: Integer): boolean;
    procedure SetdiaMe2(Index: Integer; const AInteger: Integer);
    function  diaMe2_Specified(Index: Integer): boolean;
    procedure SetdiaMe3(Index: Integer; const AInteger: Integer);
    function  diaMe3_Specified(Index: Integer): boolean;
    procedure SetdscPrd(Index: Integer; const Astring: string);
    function  dscPrd_Specified(Index: Integer): boolean;
    procedure SetecpCnp(Index: Integer; const Astring: string);
    function  ecpCnp_Specified(Index: Integer): boolean;
    procedure SetexiAge(Index: Integer; const Astring: string);
    function  exiAge_Specified(Index: Integer): boolean;
    procedure SetexiLcp(Index: Integer; const Astring: string);
    function  exiLcp_Specified(Index: Integer): boolean;
    procedure SetfveCpg(Index: Integer; const Astring: string);
    function  fveCpg_Specified(Index: Integer): boolean;
    procedure SetfveFpg(Index: Integer; const Astring: string);
    function  fveFpg_Specified(Index: Integer): boolean;
    procedure SetfveTns(Index: Integer; const Astring: string);
    function  fveTns_Specified(Index: Integer): boolean;
    procedure SetgerTcc(Index: Integer; const Astring: string);
    function  gerTcc_Specified(Index: Integer): boolean;
    procedure SetindOrf(Index: Integer; const Astring: string);
    function  indOrf_Specified(Index: Integer): boolean;
    procedure SetlimApr(Index: Integer; const Astring: string);
    function  limApr_Specified(Index: Integer): boolean;
    procedure SetperAqa(Index: Integer; const AInteger: Integer);
    function  perAqa_Specified(Index: Integer): boolean;
    procedure SetperCcr(Index: Integer; const Astring: string);
    function  perCcr_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const AInteger: Integer);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDs1(Index: Integer; const ADouble: Double);
    function  perDs1_Specified(Index: Integer): boolean;
    procedure SetperDs2(Index: Integer; const ADouble: Double);
    function  perDs2_Specified(Index: Integer): boolean;
    procedure SetperDs3(Index: Integer; const ADouble: Double);
    function  perDs3_Specified(Index: Integer): boolean;
    procedure SetperDs4(Index: Integer; const ADouble: Double);
    function  perDs4_Specified(Index: Integer): boolean;
    procedure SetperDs5(Index: Integer; const ADouble: Double);
    function  perDs5_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const ADouble: Double);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperEmb(Index: Integer; const ADouble: Double);
    function  perEmb_Specified(Index: Integer): boolean;
    procedure SetperEnc(Index: Integer; const ADouble: Double);
    function  perEnc_Specified(Index: Integer): boolean;
    procedure SetperFre(Index: Integer; const ADouble: Double);
    function  perFre_Specified(Index: Integer): boolean;
    procedure SetperIss(Index: Integer; const ADouble: Double);
    function  perIss_Specified(Index: Integer): boolean;
    procedure SetperOf1(Index: Integer; const AInteger: Integer);
    function  perOf1_Specified(Index: Integer): boolean;
    procedure SetperOf2(Index: Integer; const AInteger: Integer);
    function  perOf2_Specified(Index: Integer): boolean;
    procedure SetperOut(Index: Integer; const ADouble: Double);
    function  perOut_Specified(Index: Integer): boolean;
    procedure SetperSeg(Index: Integer; const ADouble: Double);
    function  perSeg_Specified(Index: Integer): boolean;
    procedure SetporNa1(Index: Integer; const Astring: string);
    function  porNa1_Specified(Index: Integer): boolean;
    procedure SetporNa2(Index: Integer; const Astring: string);
    function  porNa2_Specified(Index: Integer): boolean;
    procedure SetporSi1(Index: Integer; const Astring: string);
    function  porSi1_Specified(Index: Integer): boolean;
    procedure SetporSi2(Index: Integer; const Astring: string);
    function  porSi2_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure SetqtdChs(Index: Integer; const AInteger: Integer);
    function  qtdChs_Specified(Index: Integer): boolean;
    procedure SetqtdDcv(Index: Integer; const AInteger: Integer);
    function  qtdDcv_Specified(Index: Integer): boolean;
    procedure SetqtdPrt(Index: Integer; const AInteger: Integer);
    function  qtdPrt_Specified(Index: Integer): boolean;
    procedure SetrecDtj(Index: Integer; const AInteger: Integer);
    function  recDtj_Specified(Index: Integer): boolean;
    procedure SetrecDtm(Index: Integer; const AInteger: Integer);
    function  recDtm_Specified(Index: Integer): boolean;
    procedure SetrecJmm(Index: Integer; const ADouble: Double);
    function  recJmm_Specified(Index: Integer): boolean;
    procedure SetrecMul(Index: Integer; const ADouble: Double);
    function  recMul_Specified(Index: Integer): boolean;
    procedure SetrecTjr(Index: Integer; const Astring: string);
    function  recTjr_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const AInteger: Integer);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SetvlrAcr(Index: Integer; const ADouble: Double);
    function  vlrAcr_Specified(Index: Integer): boolean;
    procedure SetvlrLim(Index: Integer; const ADouble: Double);
    function  vlrLim_Specified(Index: Integer): boolean;
    procedure SetvlrPrt(Index: Integer; const ADouble: Double);
    function  vlrPrt_Specified(Index: Integer): boolean;
  published
    property acePar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacePar write SetacePar stored acePar_Specified;
    property acrDia:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacrDia write SetacrDia stored acrDia_Specified;
    property antDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property avaAti:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaAti write SetavaAti stored avaAti_Specified;
    property avaMot:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaMot write SetavaMot stored avaMot_Specified;
    property avaObs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaObs write SetavaObs stored avaObs_Specified;
    property avaVlr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlr write SetavaVlr stored avaVlr_Specified;
    property avaVls:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVls write SetavaVls stored avaVls_Specified;
    property avaVlu:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlu write SetavaVlu stored avaVlu_Specified;
    property catCli:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatCli write SetcatCli stored catCli_Specified;
    property ccbCli:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbCli write SetccbCli stored ccbCli_Specified;
    property cifFob:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcifFob write SetcifFob stored cifFob_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCpg write SetcodCpg stored codCpg_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFcr write SetcodFcr stored codFcr_Specified;
    property codFil:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codIn1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMar write SetcodMar stored codMar_Specified;
    property codRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRed write SetcodRed stored codRed_Specified;
    property codRep:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codRve:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRve write SetcodRve stored codRve_Specified;
    property codTab:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTab write SetcodTab stored codTab_Specified;
    property codTic:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTic write SetcodTic stored codTic_Specified;
    property codTpr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpr write SetcodTpr stored codTpr_Specified;
    property codTra:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTra write SetcodTra stored codTra_Specified;
    property codTrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTrd write SetcodTrd stored codTrd_Specified;
    property codVen:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodVen write SetcodVen stored codVen_Specified;
    property conFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FconFin write SetconFin stored conFin_Specified;
    property criEdv:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriEdv write SetcriEdv stored criEdv_Specified;
    property ctaAad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAad write SetctaAad stored ctaAad_Specified;
    property ctaAux:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAux write SetctaAux stored ctaAux_Specified;
    property ctaFcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFcr write SetctaFcr stored ctaFcr_Specified;
    property ctaFdv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFdv write SetctaFdv stored ctaFdv_Specified;
    property ctaRcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRcr write SetctaRcr stored ctaRcr_Specified;
    property ctaRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrPad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrPad write SetctrPad stored ctrPad_Specified;
    property datLim:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLim write SetdatLim stored datLim_Specified;
    property datPmr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPmr write SetdatPmr stored datPmr_Specified;
    property diaEsp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaEsp write SetdiaEsp stored diaEsp_Specified;
    property diaMe1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe1 write SetdiaMe1 stored diaMe1_Specified;
    property diaMe2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe2 write SetdiaMe2 stored diaMe2_Specified;
    property diaMe3:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe3 write SetdiaMe3 stored diaMe3_Specified;
    property dscPrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscPrd write SetdscPrd stored dscPrd_Specified;
    property ecpCnp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FecpCnp write SetecpCnp stored ecpCnp_Specified;
    property exiAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiAge write SetexiAge stored exiAge_Specified;
    property exiLcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiLcp write SetexiLcp stored exiLcp_Specified;
    property fveCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveCpg write SetfveCpg stored fveCpg_Specified;
    property fveFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveFpg write SetfveFpg stored fveFpg_Specified;
    property fveTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveTns write SetfveTns stored fveTns_Specified;
    property gerTcc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTcc write SetgerTcc stored gerTcc_Specified;
    property indOrf:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindOrf write SetindOrf stored indOrf_Specified;
    property limApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimApr write SetlimApr stored limApr_Specified;
    property perAqa:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAqa write SetperAqa stored perAqa_Specified;
    property perCcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCcr write SetperCcr stored perCcr_Specified;
    property perCom:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDs1:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs1 write SetperDs1 stored perDs1_Specified;
    property perDs2:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs2 write SetperDs2 stored perDs2_Specified;
    property perDs3:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs3 write SetperDs3 stored perDs3_Specified;
    property perDs4:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs4 write SetperDs4 stored perDs4_Specified;
    property perDs5:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs5 write SetperDs5 stored perDs5_Specified;
    property perDsc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perEmb:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEmb write SetperEmb stored perEmb_Specified;
    property perEnc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEnc write SetperEnc stored perEnc_Specified;
    property perFre:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFre write SetperFre stored perFre_Specified;
    property perIss:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIss write SetperIss stored perIss_Specified;
    property perOf1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf1 write SetperOf1 stored perOf1_Specified;
    property perOf2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf2 write SetperOf2 stored perOf2_Specified;
    property perOut:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOut write SetperOut stored perOut_Specified;
    property perSeg:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperSeg write SetperSeg stored perSeg_Specified;
    property porNa1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa1 write SetporNa1 stored porNa1_Specified;
    property porNa2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa2 write SetporNa2 stored porNa2_Specified;
    property porSi1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi1 write SetporSi1 stored porSi1_Specified;
    property porSi2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi2 write SetporSi2 stored porSi2_Specified;
    property prdDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property qtdChs:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdChs write SetqtdChs stored qtdChs_Specified;
    property qtdDcv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDcv write SetqtdDcv stored qtdDcv_Specified;
    property qtdPrt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdPrt write SetqtdPrt stored qtdPrt_Specified;
    property recDtj:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtj write SetrecDtj stored recDtj_Specified;
    property recDtm:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtm write SetrecDtm stored recDtm_Specified;
    property recJmm:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJmm write SetrecJmm stored recJmm_Specified;
    property recMul:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecMul write SetrecMul stored recMul_Specified;
    property recTjr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecTjr write SetrecTjr stored recTjr_Specified;
    property seqCob:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property seqEnt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property tolDsc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property vlrAcr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAcr write SetvlrAcr stored vlrAcr_Specified;
    property vlrLim:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLim write SetvlrLim stored vlrLim_Specified;
    property vlrPrt:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPrt write SetvlrPrt stored vlrPrt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesGravarClientesOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosClientes: Array_Of_clientesGravarClientesOutRetornosClientes;
    FretornosClientes_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientesOutRetornosClientes: Array_Of_clientesGravarClientesOutRetornosClientes);
    function  retornosClientes_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:     string                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:  string                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosClientes: Array_Of_clientesGravarClientesOutRetornosClientes  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosClientes write SetretornosClientes stored retornosClientes_Specified;
    property tipoRetorno:      Integer                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesOutRetornosClientes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesOutRetornosClientes = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFor:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property ideExt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesInDadosGeraisClienteClientePessoaFisica, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesInDadosGeraisClienteClientePessoaFisica = class(TRemotable)
  private
    FcidNat: string;
    FcidNat_Specified: boolean;
    FcodSex: string;
    FcodSex_Specified: boolean;
    FdatNas: string;
    FdatNas_Specified: boolean;
    FdatRge: string;
    FdatRge_Specified: boolean;
    FestCiv: Integer;
    FestCiv_Specified: boolean;
    FnomMae: string;
    FnomMae_Specified: boolean;
    FnomPai: string;
    FnomPai_Specified: boolean;
    FnumRge: string;
    FnumRge_Specified: boolean;
    ForgRge: string;
    ForgRge_Specified: boolean;
    FrefCm1: string;
    FrefCm1_Specified: boolean;
    procedure SetcidNat(Index: Integer; const Astring: string);
    function  cidNat_Specified(Index: Integer): boolean;
    procedure SetcodSex(Index: Integer; const Astring: string);
    function  codSex_Specified(Index: Integer): boolean;
    procedure SetdatNas(Index: Integer; const Astring: string);
    function  datNas_Specified(Index: Integer): boolean;
    procedure SetdatRge(Index: Integer; const Astring: string);
    function  datRge_Specified(Index: Integer): boolean;
    procedure SetestCiv(Index: Integer; const AInteger: Integer);
    function  estCiv_Specified(Index: Integer): boolean;
    procedure SetnomMae(Index: Integer; const Astring: string);
    function  nomMae_Specified(Index: Integer): boolean;
    procedure SetnomPai(Index: Integer; const Astring: string);
    function  nomPai_Specified(Index: Integer): boolean;
    procedure SetnumRge(Index: Integer; const Astring: string);
    function  numRge_Specified(Index: Integer): boolean;
    procedure SetorgRge(Index: Integer; const Astring: string);
    function  orgRge_Specified(Index: Integer): boolean;
    procedure SetrefCm1(Index: Integer; const Astring: string);
    function  refCm1_Specified(Index: Integer): boolean;
  published
    property cidNat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidNat write SetcidNat stored cidNat_Specified;
    property codSex: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSex write SetcodSex stored codSex_Specified;
    property datNas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNas write SetdatNas stored datNas_Specified;
    property datRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatRge write SetdatRge stored datRge_Specified;
    property estCiv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCiv write SetestCiv stored estCiv_Specified;
    property nomMae: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomMae write SetnomMae stored nomMae_Specified;
    property nomPai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomPai write SetnomPai stored nomPai_Specified;
    property numRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRge write SetnumRge stored numRge_Specified;
    property orgRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read ForgRge write SetorgRge stored orgRge_Specified;
    property refCm1: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrefCm1 write SetrefCm1 stored refCm1_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesExcluirClientesOutRetornosClientes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesExcluirClientesOutRetornosClientes = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  published
    property codCli:      Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property retorno:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property tipoRetorno: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesExcluirClientesOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesExcluirClientesOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosClientes: Array_Of_clientesExcluirClientesOutRetornosClientes;
    FretornosClientes_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosClientes(Index: Integer; const AArray_Of_clientesExcluirClientesOutRetornosClientes: Array_Of_clientesExcluirClientesOutRetornosClientes);
    function  retornosClientes_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:  string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosClientes: Array_Of_clientesExcluirClientesOutRetornosClientes  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosClientes write SetretornosClientes stored retornosClientes_Specified;
    property tipoRetorno:      Integer                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesInDadosGeraisClienteCadastroCEP, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesInDadosGeraisClienteCadastroCEP = class(TRemotable)
  private
    FbaiCid: string;
    FbaiCid_Specified: boolean;
    FcepFim: string;
    FcepFim_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcepPol: string;
    FcepPol_Specified: boolean;
    FcodRai: Integer;
    FcodRai_Specified: boolean;
    FendCid: string;
    FendCid_Specified: boolean;
    FnomCid: string;
    FnomCid_Specified: boolean;
    procedure SetbaiCid(Index: Integer; const Astring: string);
    function  baiCid_Specified(Index: Integer): boolean;
    procedure SetcepFim(Index: Integer; const Astring: string);
    function  cepFim_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcepPol(Index: Integer; const Astring: string);
    function  cepPol_Specified(Index: Integer): boolean;
    procedure SetcodRai(Index: Integer; const AInteger: Integer);
    function  codRai_Specified(Index: Integer): boolean;
    procedure SetendCid(Index: Integer; const Astring: string);
    function  endCid_Specified(Index: Integer): boolean;
    procedure SetnomCid(Index: Integer; const Astring: string);
    function  nomCid_Specified(Index: Integer): boolean;
  published
    property baiCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCid write SetbaiCid stored baiCid_Specified;
    property cepFim: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFim write SetcepFim stored cepFim_Specified;
    property cepIni: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cepPol: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepPol write SetcepPol stored cepPol_Specified;
    property codRai: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRai write SetcodRai stored codRai_Specified;
    property endCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCid write SetendCid stored endCid_Specified;
    property nomCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCid write SetnomCid stored nomCid_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientesInDadosGeraisCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientesInDadosGeraisCliente = class(TRemotable)
  private
    FapeCli: string;
    FapeCli_Specified: boolean;
    FbaiCli: string;
    FbaiCli_Specified: boolean;
    FbaiCob: string;
    FbaiCob_Specified: boolean;
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcadastroCEP: Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP;
    FcadastroCEP_Specified: boolean;
    FcalFun: string;
    FcalFun_Specified: boolean;
    FcepCli: string;
    FcepCli_Specified: boolean;
    FcepCob: Integer;
    FcepCob_Specified: boolean;
    FcepEnt: Integer;
    FcepEnt_Specified: boolean;
    FcepFre: Integer;
    FcepFre_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcgcCob: Double;
    FcgcCob_Specified: boolean;
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcgcEnt: Double;
    FcgcEnt_Specified: boolean;
    FcidCli: string;
    FcidCli_Specified: boolean;
    FcidCob: string;
    FcidCob_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcliCon: string;
    FcliCon_Specified: boolean;
    FcliFor: string;
    FcliFor_Specified: boolean;
    FcliPrx: string;
    FcliPrx_Specified: boolean;
    FcliRep: Integer;
    FcliRep_Specified: boolean;
    FcliTra: Integer;
    FcliTra_Specified: boolean;
    FclientePessoaFisica: Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica;
    FclientePessoaFisica_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodGre: string;
    FcodGre_Specified: boolean;
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
    FcplCob: string;
    FcplCob_Specified: boolean;
    FcplEnd: string;
    FcplEnd_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FcxaPst: Integer;
    FcxaPst_Specified: boolean;
    FdatSuf: string;
    FdatSuf_Specified: boolean;
    FdefinicoesCliente: Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente;
    FdefinicoesCliente_Specified: boolean;
    FeenCli: string;
    FeenCli_Specified: boolean;
    FeenCob: string;
    FeenCob_Specified: boolean;
    FeenEnt: string;
    FeenEnt_Specified: boolean;
    FemaNfe: string;
    FemaNfe_Specified: boolean;
    FendCli: string;
    FendCli_Specified: boolean;
    FendCob: string;
    FendCob_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FenderecosEntrega: Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega;
    FenderecosEntrega_Specified: boolean;
    FentCor: string;
    FentCor_Specified: boolean;
    FestCob: string;
    FestCob_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FfaxCli: string;
    FfaxCli_Specified: boolean;
    FfonCl2: string;
    FfonCl2_Specified: boolean;
    FfonCl3: string;
    FfonCl3_Specified: boolean;
    FfonCl4: string;
    FfonCl4_Specified: boolean;
    FfonCl5: string;
    FfonCl5_Specified: boolean;
    FfonCli: string;
    FfonCli_Specified: boolean;
    FideCli: string;
    FideCli_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    FindCoo: string;
    FindCoo_Specified: boolean;
    FinsAnp: Integer;
    FinsAnp_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FinsEst: string;
    FinsEst_Specified: boolean;
    FinsMun: string;
    FinsMun_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FlimRet: string;
    FlimRet_Specified: boolean;
    FmarCli: string;
    FmarCli_Specified: boolean;
    FnatCof: Integer;
    FnatCof_Specified: boolean;
    FnatPis: Integer;
    FnatPis_Specified: boolean;
    FnatRet: Integer;
    FnatRet_Specified: boolean;
    FnenCli: string;
    FnenCli_Specified: boolean;
    FnenCob: string;
    FnenCob_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FnumIdf: string;
    FnumIdf_Specified: boolean;
    FobsMot: string;
    FobsMot_Specified: boolean;
    FperAin: Integer;
    FperAin_Specified: boolean;
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
    FseqRoe: Integer;
    FseqRoe_Specified: boolean;
    FsigUfs: string;
    FsigUfs_Specified: boolean;
    FsitCli: string;
    FsitCli_Specified: boolean;
    FtipAce: Integer;
    FtipAce_Specified: boolean;
    FtipCli: string;
    FtipCli_Specified: boolean;
    FtipEmc: Integer;
    FtipEmc_Specified: boolean;
    FtipEmp: Integer;
    FtipEmp_Specified: boolean;
    FtipMer: string;
    FtipMer_Specified: boolean;
    FtriCof: string;
    FtriCof_Specified: boolean;
    FtriIcm: string;
    FtriIcm_Specified: boolean;
    FtriIpi: string;
    FtriIpi_Specified: boolean;
    FtriPis: string;
    FtriPis_Specified: boolean;
    FzipCod: string;
    FzipCod_Specified: boolean;
    FzonFra: Integer;
    FzonFra_Specified: boolean;
    procedure SetapeCli(Index: Integer; const Astring: string);
    function  apeCli_Specified(Index: Integer): boolean;
    procedure SetbaiCli(Index: Integer; const Astring: string);
    function  baiCli_Specified(Index: Integer): boolean;
    procedure SetbaiCob(Index: Integer; const Astring: string);
    function  baiCob_Specified(Index: Integer): boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP);
    function  cadastroCEP_Specified(Index: Integer): boolean;
    procedure SetcalFun(Index: Integer; const Astring: string);
    function  calFun_Specified(Index: Integer): boolean;
    procedure SetcepCli(Index: Integer; const Astring: string);
    function  cepCli_Specified(Index: Integer): boolean;
    procedure SetcepCob(Index: Integer; const AInteger: Integer);
    function  cepCob_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const AInteger: Integer);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcepFre(Index: Integer; const AInteger: Integer);
    function  cepFre_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcgcCob(Index: Integer; const ADouble: Double);
    function  cgcCob_Specified(Index: Integer): boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const ADouble: Double);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidCli(Index: Integer; const Astring: string);
    function  cidCli_Specified(Index: Integer): boolean;
    procedure SetcidCob(Index: Integer; const Astring: string);
    function  cidCob_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcliCon(Index: Integer; const Astring: string);
    function  cliCon_Specified(Index: Integer): boolean;
    procedure SetcliFor(Index: Integer; const Astring: string);
    function  cliFor_Specified(Index: Integer): boolean;
    procedure SetcliPrx(Index: Integer; const Astring: string);
    function  cliPrx_Specified(Index: Integer): boolean;
    procedure SetcliRep(Index: Integer; const AInteger: Integer);
    function  cliRep_Specified(Index: Integer): boolean;
    procedure SetcliTra(Index: Integer; const AInteger: Integer);
    function  cliTra_Specified(Index: Integer): boolean;
    procedure SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica);
    function  clientePessoaFisica_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodGre(Index: Integer; const Astring: string);
    function  codGre_Specified(Index: Integer): boolean;
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
    procedure SetcplCob(Index: Integer; const Astring: string);
    function  cplCob_Specified(Index: Integer): boolean;
    procedure SetcplEnd(Index: Integer; const Astring: string);
    function  cplEnd_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetcxaPst(Index: Integer; const AInteger: Integer);
    function  cxaPst_Specified(Index: Integer): boolean;
    procedure SetdatSuf(Index: Integer; const Astring: string);
    function  datSuf_Specified(Index: Integer): boolean;
    procedure SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente);
    function  definicoesCliente_Specified(Index: Integer): boolean;
    procedure SeteenCli(Index: Integer; const Astring: string);
    function  eenCli_Specified(Index: Integer): boolean;
    procedure SeteenCob(Index: Integer; const Astring: string);
    function  eenCob_Specified(Index: Integer): boolean;
    procedure SeteenEnt(Index: Integer; const Astring: string);
    function  eenEnt_Specified(Index: Integer): boolean;
    procedure SetemaNfe(Index: Integer; const Astring: string);
    function  emaNfe_Specified(Index: Integer): boolean;
    procedure SetendCli(Index: Integer; const Astring: string);
    function  endCli_Specified(Index: Integer): boolean;
    procedure SetendCob(Index: Integer; const Astring: string);
    function  endCob_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega);
    function  enderecosEntrega_Specified(Index: Integer): boolean;
    procedure SetentCor(Index: Integer; const Astring: string);
    function  entCor_Specified(Index: Integer): boolean;
    procedure SetestCob(Index: Integer; const Astring: string);
    function  estCob_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetfaxCli(Index: Integer; const Astring: string);
    function  faxCli_Specified(Index: Integer): boolean;
    procedure SetfonCl2(Index: Integer; const Astring: string);
    function  fonCl2_Specified(Index: Integer): boolean;
    procedure SetfonCl3(Index: Integer; const Astring: string);
    function  fonCl3_Specified(Index: Integer): boolean;
    procedure SetfonCl4(Index: Integer; const Astring: string);
    function  fonCl4_Specified(Index: Integer): boolean;
    procedure SetfonCl5(Index: Integer; const Astring: string);
    function  fonCl5_Specified(Index: Integer): boolean;
    procedure SetfonCli(Index: Integer; const Astring: string);
    function  fonCli_Specified(Index: Integer): boolean;
    procedure SetideCli(Index: Integer; const Astring: string);
    function  ideCli_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetindCoo(Index: Integer; const Astring: string);
    function  indCoo_Specified(Index: Integer): boolean;
    procedure SetinsAnp(Index: Integer; const AInteger: Integer);
    function  insAnp_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetinsEst(Index: Integer; const Astring: string);
    function  insEst_Specified(Index: Integer): boolean;
    procedure SetinsMun(Index: Integer; const Astring: string);
    function  insMun_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetlimRet(Index: Integer; const Astring: string);
    function  limRet_Specified(Index: Integer): boolean;
    procedure SetmarCli(Index: Integer; const Astring: string);
    function  marCli_Specified(Index: Integer): boolean;
    procedure SetnatCof(Index: Integer; const AInteger: Integer);
    function  natCof_Specified(Index: Integer): boolean;
    procedure SetnatPis(Index: Integer; const AInteger: Integer);
    function  natPis_Specified(Index: Integer): boolean;
    procedure SetnatRet(Index: Integer; const AInteger: Integer);
    function  natRet_Specified(Index: Integer): boolean;
    procedure SetnenCli(Index: Integer; const Astring: string);
    function  nenCli_Specified(Index: Integer): boolean;
    procedure SetnenCob(Index: Integer; const Astring: string);
    function  nenCob_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetnumIdf(Index: Integer; const Astring: string);
    function  numIdf_Specified(Index: Integer): boolean;
    procedure SetobsMot(Index: Integer; const Astring: string);
    function  obsMot_Specified(Index: Integer): boolean;
    procedure SetperAin(Index: Integer; const AInteger: Integer);
    function  perAin_Specified(Index: Integer): boolean;
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
    procedure SetseqRoe(Index: Integer; const AInteger: Integer);
    function  seqRoe_Specified(Index: Integer): boolean;
    procedure SetsigUfs(Index: Integer; const Astring: string);
    function  sigUfs_Specified(Index: Integer): boolean;
    procedure SetsitCli(Index: Integer; const Astring: string);
    function  sitCli_Specified(Index: Integer): boolean;
    procedure SettipAce(Index: Integer; const AInteger: Integer);
    function  tipAce_Specified(Index: Integer): boolean;
    procedure SettipCli(Index: Integer; const Astring: string);
    function  tipCli_Specified(Index: Integer): boolean;
    procedure SettipEmc(Index: Integer; const AInteger: Integer);
    function  tipEmc_Specified(Index: Integer): boolean;
    procedure SettipEmp(Index: Integer; const AInteger: Integer);
    function  tipEmp_Specified(Index: Integer): boolean;
    procedure SettipMer(Index: Integer; const Astring: string);
    function  tipMer_Specified(Index: Integer): boolean;
    procedure SettriCof(Index: Integer; const Astring: string);
    function  triCof_Specified(Index: Integer): boolean;
    procedure SettriIcm(Index: Integer; const Astring: string);
    function  triIcm_Specified(Index: Integer): boolean;
    procedure SettriIpi(Index: Integer; const Astring: string);
    function  triIpi_Specified(Index: Integer): boolean;
    procedure SettriPis(Index: Integer; const Astring: string);
    function  triPis_Specified(Index: Integer): boolean;
    procedure SetzipCod(Index: Integer; const Astring: string);
    function  zipCod_Specified(Index: Integer): boolean;
    procedure SetzonFra(Index: Integer; const AInteger: Integer);
    function  zonFra_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property apeCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FapeCli write SetapeCli stored apeCli_Specified;
    property baiCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCli write SetbaiCli stored baiCli_Specified;
    property baiCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCob write SetbaiCob stored baiCob_Specified;
    property baiEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cadastroCEP:         Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FcadastroCEP write SetcadastroCEP stored cadastroCEP_Specified;
    property calFun:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcalFun write SetcalFun stored calFun_Specified;
    property cepCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCli write SetcepCli stored cepCli_Specified;
    property cepCob:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCob write SetcepCob stored cepCob_Specified;
    property cepEnt:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cepFre:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFre write SetcepFre stored cepFre_Specified;
    property cepIni:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cgcCob:              Double                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCob write SetcgcCob stored cgcCob_Specified;
    property cgcCpf:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property cgcEnt:              Double                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCli write SetcidCli stored cidCli_Specified;
    property cidCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCob write SetcidCob stored cidCob_Specified;
    property cidEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cliCon:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliCon write SetcliCon stored cliCon_Specified;
    property cliFor:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliFor write SetcliFor stored cliFor_Specified;
    property cliPrx:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliPrx write SetcliPrx stored cliPrx_Specified;
    property cliRep:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliRep write SetcliRep stored cliRep_Specified;
    property cliTra:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliTra write SetcliTra stored cliTra_Specified;
    property clientePessoaFisica: Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FclientePessoaFisica write SetclientePessoaFisica stored clientePessoaFisica_Specified;
    property codCli:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codFor:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codGre:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodGre write SetcodGre stored codGre_Specified;
    property codMot:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMot write SetcodMot stored codMot_Specified;
    property codPai:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPai write SetcodPai stored codPai_Specified;
    property codRam:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRam write SetcodRam stored codRam_Specified;
    property codRoe:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRoe write SetcodRoe stored codRoe_Specified;
    property codRtr:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRtr write SetcodRtr stored codRtr_Specified;
    property codSro:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSro write SetcodSro stored codSro_Specified;
    property codSuf:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSuf write SetcodSuf stored codSuf_Specified;
    property cplCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplCob write SetcplCob stored cplCob_Specified;
    property cplEnd:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnd write SetcplEnd stored cplEnd_Specified;
    property cplEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property cxaPst:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcxaPst write SetcxaPst stored cxaPst_Specified;
    property datSuf:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatSuf write SetdatSuf stored datSuf_Specified;
    property definicoesCliente:   Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente    Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdefinicoesCliente write SetdefinicoesCliente stored definicoesCliente_Specified;
    property eenCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCli write SeteenCli stored eenCli_Specified;
    property eenCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCob write SeteenCob stored eenCob_Specified;
    property eenEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenEnt write SeteenEnt stored eenEnt_Specified;
    property emaNfe:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FemaNfe write SetemaNfe stored emaNfe_Specified;
    property endCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCli write SetendCli stored endCli_Specified;
    property endCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCob write SetendCob stored endCob_Specified;
    property endEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property enderecosEntrega:    Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega     Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FenderecosEntrega write SetenderecosEntrega stored enderecosEntrega_Specified;
    property entCor:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FentCor write SetentCor stored entCor_Specified;
    property estCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCob write SetestCob stored estCob_Specified;
    property estEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property faxCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxCli write SetfaxCli stored faxCli_Specified;
    property fonCl2:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl2 write SetfonCl2 stored fonCl2_Specified;
    property fonCl3:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl3 write SetfonCl3 stored fonCl3_Specified;
    property fonCl4:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl4 write SetfonCl4 stored fonCl4_Specified;
    property fonCl5:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl5 write SetfonCl5 stored fonCl5_Specified;
    property fonCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCli write SetfonCli stored fonCli_Specified;
    property ideCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideCli write SetideCli stored ideCli_Specified;
    property ideExt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property indCoo:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCoo write SetindCoo stored indCoo_Specified;
    property insAnp:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsAnp write SetinsAnp stored insAnp_Specified;
    property insEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property insEst:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEst write SetinsEst stored insEst_Specified;
    property insMun:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsMun write SetinsMun stored insMun_Specified;
    property intNet:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property limRet:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimRet write SetlimRet stored limRet_Specified;
    property marCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmarCli write SetmarCli stored marCli_Specified;
    property natCof:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatCof write SetnatCof stored natCof_Specified;
    property natPis:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatPis write SetnatPis stored natPis_Specified;
    property natRet:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatRet write SetnatRet stored natRet_Specified;
    property nenCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCli write SetnenCli stored nenCli_Specified;
    property nenCob:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCob write SetnenCob stored nenCob_Specified;
    property nenEnt:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property numIdf:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumIdf write SetnumIdf stored numIdf_Specified;
    property obsMot:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMot write SetobsMot stored obsMot_Specified;
    property perAin:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAin write SetperAin stored perAin_Specified;
    property regEst:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FregEst write SetregEst stored regEst_Specified;
    property retCof:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCof write SetretCof stored retCof_Specified;
    property retCsl:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCsl write SetretCsl stored retCsl_Specified;
    property retIrf:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretIrf write SetretIrf stored retIrf_Specified;
    property retOur:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretOur write SetretOur stored retOur_Specified;
    property retPis:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPis write SetretPis stored retPis_Specified;
    property retPro:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPro write SetretPro stored retPro_Specified;
    property seqRoe:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRoe write SetseqRoe stored seqRoe_Specified;
    property sigUfs:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigUfs write SetsigUfs stored sigUfs_Specified;
    property sitCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCli write SetsitCli stored sitCli_Specified;
    property tipAce:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipAce write SettipAce stored tipAce_Specified;
    property tipCli:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCli write SettipCli stored tipCli_Specified;
    property tipEmc:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmc write SettipEmc stored tipEmc_Specified;
    property tipEmp:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmp write SettipEmp stored tipEmp_Specified;
    property tipMer:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMer write SettipMer stored tipMer_Specified;
    property triCof:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriCof write SettriCof stored triCof_Specified;
    property triIcm:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIcm write SettriIcm stored triIcm_Specified;
    property triIpi:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIpi write SettriIpi stored triIpi_Specified;
    property triPis:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriPis write SettriPis stored triPis_Specified;
    property zipCod:              string                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzipCod write SetzipCod stored zipCod_Specified;
    property zonFra:              Integer                                                                 Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzonFra write SetzonFra stored zonFra_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2In = class(TRemotable)
  private
    FdadosGeraisCliente: Array_Of_clientesGravarClientes2InDadosGeraisCliente;
    FdadosGeraisCliente_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    procedure SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisCliente: Array_Of_clientesGravarClientes2InDadosGeraisCliente);
    function  dadosGeraisCliente_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGeraisCliente: Array_Of_clientesGravarClientes2InDadosGeraisCliente  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGeraisCliente write SetdadosGeraisCliente stored dadosGeraisCliente_Specified;
    property dataBuild:          string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idtReq:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente = class(TRemotable)
  private
    FacePar: string;
    FacePar_Specified: boolean;
    FacrDia: Integer;
    FacrDia_Specified: boolean;
    FantDsc: string;
    FantDsc_Specified: boolean;
    FavaAti: string;
    FavaAti_Specified: boolean;
    FavaMot: Integer;
    FavaMot_Specified: boolean;
    FavaObs: string;
    FavaObs_Specified: boolean;
    FavaVlr: Double;
    FavaVlr_Specified: boolean;
    FavaVls: Double;
    FavaVls_Specified: boolean;
    FavaVlu: Double;
    FavaVlu_Specified: boolean;
    FcatCli: Integer;
    FcatCli_Specified: boolean;
    FccbCli: string;
    FccbCli_Specified: boolean;
    FcifFob: string;
    FcifFob_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
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
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFcr: string;
    FcodFcr_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMar: string;
    FcodMar_Specified: boolean;
    FcodRed: Integer;
    FcodRed_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodRve: string;
    FcodRve_Specified: boolean;
    FcodTab: string;
    FcodTab_Specified: boolean;
    FcodTic: string;
    FcodTic_Specified: boolean;
    FcodTpr: string;
    FcodTpr_Specified: boolean;
    FcodTra: Integer;
    FcodTra_Specified: boolean;
    FcodTrd: string;
    FcodTrd_Specified: boolean;
    FcodVen: Integer;
    FcodVen_Specified: boolean;
    FconFin: string;
    FconFin_Specified: boolean;
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
    FctrPad: Integer;
    FctrPad_Specified: boolean;
    FdatLim: string;
    FdatLim_Specified: boolean;
    FdatPmr: string;
    FdatPmr_Specified: boolean;
    FdiaEsp: string;
    FdiaEsp_Specified: boolean;
    FdiaMe1: Integer;
    FdiaMe1_Specified: boolean;
    FdiaMe2: Integer;
    FdiaMe2_Specified: boolean;
    FdiaMe3: Integer;
    FdiaMe3_Specified: boolean;
    FdscPrd: string;
    FdscPrd_Specified: boolean;
    FecpCnp: string;
    FecpCnp_Specified: boolean;
    FexiAge: string;
    FexiAge_Specified: boolean;
    FexiLcp: string;
    FexiLcp_Specified: boolean;
    FfveCpg: string;
    FfveCpg_Specified: boolean;
    FfveFpg: string;
    FfveFpg_Specified: boolean;
    FfveTns: string;
    FfveTns_Specified: boolean;
    FgerTcc: string;
    FgerTcc_Specified: boolean;
    FindOrf: string;
    FindOrf_Specified: boolean;
    FlimApr: string;
    FlimApr_Specified: boolean;
    FperAqa: Integer;
    FperAqa_Specified: boolean;
    FperCcr: string;
    FperCcr_Specified: boolean;
    FperCom: Integer;
    FperCom_Specified: boolean;
    FperDs1: Double;
    FperDs1_Specified: boolean;
    FperDs2: Double;
    FperDs2_Specified: boolean;
    FperDs3: Double;
    FperDs3_Specified: boolean;
    FperDs4: Double;
    FperDs4_Specified: boolean;
    FperDs5: Double;
    FperDs5_Specified: boolean;
    FperDsc: Double;
    FperDsc_Specified: boolean;
    FperEmb: Double;
    FperEmb_Specified: boolean;
    FperEnc: Double;
    FperEnc_Specified: boolean;
    FperFre: Double;
    FperFre_Specified: boolean;
    FperIss: Double;
    FperIss_Specified: boolean;
    FperOf1: Integer;
    FperOf1_Specified: boolean;
    FperOf2: Integer;
    FperOf2_Specified: boolean;
    FperOut: Double;
    FperOut_Specified: boolean;
    FperSeg: Double;
    FperSeg_Specified: boolean;
    FporNa1: string;
    FporNa1_Specified: boolean;
    FporNa2: string;
    FporNa2_Specified: boolean;
    FporSi1: string;
    FporSi1_Specified: boolean;
    FporSi2: string;
    FporSi2_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    FqtdChs: Integer;
    FqtdChs_Specified: boolean;
    FqtdDcv: Integer;
    FqtdDcv_Specified: boolean;
    FqtdPrt: Integer;
    FqtdPrt_Specified: boolean;
    FrecDtj: Integer;
    FrecDtj_Specified: boolean;
    FrecDtm: Integer;
    FrecDtm_Specified: boolean;
    FrecJmm: Double;
    FrecJmm_Specified: boolean;
    FrecMul: Double;
    FrecMul_Specified: boolean;
    FrecTjr: string;
    FrecTjr_Specified: boolean;
    FseqCob: Integer;
    FseqCob_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FvlrAcr: Double;
    FvlrAcr_Specified: boolean;
    FvlrLim: Double;
    FvlrLim_Specified: boolean;
    FvlrPrt: Double;
    FvlrPrt_Specified: boolean;
    procedure SetacePar(Index: Integer; const Astring: string);
    function  acePar_Specified(Index: Integer): boolean;
    procedure SetacrDia(Index: Integer; const AInteger: Integer);
    function  acrDia_Specified(Index: Integer): boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetavaAti(Index: Integer; const Astring: string);
    function  avaAti_Specified(Index: Integer): boolean;
    procedure SetavaMot(Index: Integer; const AInteger: Integer);
    function  avaMot_Specified(Index: Integer): boolean;
    procedure SetavaObs(Index: Integer; const Astring: string);
    function  avaObs_Specified(Index: Integer): boolean;
    procedure SetavaVlr(Index: Integer; const ADouble: Double);
    function  avaVlr_Specified(Index: Integer): boolean;
    procedure SetavaVls(Index: Integer; const ADouble: Double);
    function  avaVls_Specified(Index: Integer): boolean;
    procedure SetavaVlu(Index: Integer; const ADouble: Double);
    function  avaVlu_Specified(Index: Integer): boolean;
    procedure SetcatCli(Index: Integer; const AInteger: Integer);
    function  catCli_Specified(Index: Integer): boolean;
    procedure SetccbCli(Index: Integer; const Astring: string);
    function  ccbCli_Specified(Index: Integer): boolean;
    procedure SetcifFob(Index: Integer; const Astring: string);
    function  cifFob_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
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
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFcr(Index: Integer; const Astring: string);
    function  codFcr_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMar(Index: Integer; const Astring: string);
    function  codMar_Specified(Index: Integer): boolean;
    procedure SetcodRed(Index: Integer; const AInteger: Integer);
    function  codRed_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodRve(Index: Integer; const Astring: string);
    function  codRve_Specified(Index: Integer): boolean;
    procedure SetcodTab(Index: Integer; const Astring: string);
    function  codTab_Specified(Index: Integer): boolean;
    procedure SetcodTic(Index: Integer; const Astring: string);
    function  codTic_Specified(Index: Integer): boolean;
    procedure SetcodTpr(Index: Integer; const Astring: string);
    function  codTpr_Specified(Index: Integer): boolean;
    procedure SetcodTra(Index: Integer; const AInteger: Integer);
    function  codTra_Specified(Index: Integer): boolean;
    procedure SetcodTrd(Index: Integer; const Astring: string);
    function  codTrd_Specified(Index: Integer): boolean;
    procedure SetcodVen(Index: Integer; const AInteger: Integer);
    function  codVen_Specified(Index: Integer): boolean;
    procedure SetconFin(Index: Integer; const Astring: string);
    function  conFin_Specified(Index: Integer): boolean;
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
    procedure SetctrPad(Index: Integer; const AInteger: Integer);
    function  ctrPad_Specified(Index: Integer): boolean;
    procedure SetdatLim(Index: Integer; const Astring: string);
    function  datLim_Specified(Index: Integer): boolean;
    procedure SetdatPmr(Index: Integer; const Astring: string);
    function  datPmr_Specified(Index: Integer): boolean;
    procedure SetdiaEsp(Index: Integer; const Astring: string);
    function  diaEsp_Specified(Index: Integer): boolean;
    procedure SetdiaMe1(Index: Integer; const AInteger: Integer);
    function  diaMe1_Specified(Index: Integer): boolean;
    procedure SetdiaMe2(Index: Integer; const AInteger: Integer);
    function  diaMe2_Specified(Index: Integer): boolean;
    procedure SetdiaMe3(Index: Integer; const AInteger: Integer);
    function  diaMe3_Specified(Index: Integer): boolean;
    procedure SetdscPrd(Index: Integer; const Astring: string);
    function  dscPrd_Specified(Index: Integer): boolean;
    procedure SetecpCnp(Index: Integer; const Astring: string);
    function  ecpCnp_Specified(Index: Integer): boolean;
    procedure SetexiAge(Index: Integer; const Astring: string);
    function  exiAge_Specified(Index: Integer): boolean;
    procedure SetexiLcp(Index: Integer; const Astring: string);
    function  exiLcp_Specified(Index: Integer): boolean;
    procedure SetfveCpg(Index: Integer; const Astring: string);
    function  fveCpg_Specified(Index: Integer): boolean;
    procedure SetfveFpg(Index: Integer; const Astring: string);
    function  fveFpg_Specified(Index: Integer): boolean;
    procedure SetfveTns(Index: Integer; const Astring: string);
    function  fveTns_Specified(Index: Integer): boolean;
    procedure SetgerTcc(Index: Integer; const Astring: string);
    function  gerTcc_Specified(Index: Integer): boolean;
    procedure SetindOrf(Index: Integer; const Astring: string);
    function  indOrf_Specified(Index: Integer): boolean;
    procedure SetlimApr(Index: Integer; const Astring: string);
    function  limApr_Specified(Index: Integer): boolean;
    procedure SetperAqa(Index: Integer; const AInteger: Integer);
    function  perAqa_Specified(Index: Integer): boolean;
    procedure SetperCcr(Index: Integer; const Astring: string);
    function  perCcr_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const AInteger: Integer);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDs1(Index: Integer; const ADouble: Double);
    function  perDs1_Specified(Index: Integer): boolean;
    procedure SetperDs2(Index: Integer; const ADouble: Double);
    function  perDs2_Specified(Index: Integer): boolean;
    procedure SetperDs3(Index: Integer; const ADouble: Double);
    function  perDs3_Specified(Index: Integer): boolean;
    procedure SetperDs4(Index: Integer; const ADouble: Double);
    function  perDs4_Specified(Index: Integer): boolean;
    procedure SetperDs5(Index: Integer; const ADouble: Double);
    function  perDs5_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const ADouble: Double);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperEmb(Index: Integer; const ADouble: Double);
    function  perEmb_Specified(Index: Integer): boolean;
    procedure SetperEnc(Index: Integer; const ADouble: Double);
    function  perEnc_Specified(Index: Integer): boolean;
    procedure SetperFre(Index: Integer; const ADouble: Double);
    function  perFre_Specified(Index: Integer): boolean;
    procedure SetperIss(Index: Integer; const ADouble: Double);
    function  perIss_Specified(Index: Integer): boolean;
    procedure SetperOf1(Index: Integer; const AInteger: Integer);
    function  perOf1_Specified(Index: Integer): boolean;
    procedure SetperOf2(Index: Integer; const AInteger: Integer);
    function  perOf2_Specified(Index: Integer): boolean;
    procedure SetperOut(Index: Integer; const ADouble: Double);
    function  perOut_Specified(Index: Integer): boolean;
    procedure SetperSeg(Index: Integer; const ADouble: Double);
    function  perSeg_Specified(Index: Integer): boolean;
    procedure SetporNa1(Index: Integer; const Astring: string);
    function  porNa1_Specified(Index: Integer): boolean;
    procedure SetporNa2(Index: Integer; const Astring: string);
    function  porNa2_Specified(Index: Integer): boolean;
    procedure SetporSi1(Index: Integer; const Astring: string);
    function  porSi1_Specified(Index: Integer): boolean;
    procedure SetporSi2(Index: Integer; const Astring: string);
    function  porSi2_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure SetqtdChs(Index: Integer; const AInteger: Integer);
    function  qtdChs_Specified(Index: Integer): boolean;
    procedure SetqtdDcv(Index: Integer; const AInteger: Integer);
    function  qtdDcv_Specified(Index: Integer): boolean;
    procedure SetqtdPrt(Index: Integer; const AInteger: Integer);
    function  qtdPrt_Specified(Index: Integer): boolean;
    procedure SetrecDtj(Index: Integer; const AInteger: Integer);
    function  recDtj_Specified(Index: Integer): boolean;
    procedure SetrecDtm(Index: Integer; const AInteger: Integer);
    function  recDtm_Specified(Index: Integer): boolean;
    procedure SetrecJmm(Index: Integer; const ADouble: Double);
    function  recJmm_Specified(Index: Integer): boolean;
    procedure SetrecMul(Index: Integer; const ADouble: Double);
    function  recMul_Specified(Index: Integer): boolean;
    procedure SetrecTjr(Index: Integer; const Astring: string);
    function  recTjr_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const AInteger: Integer);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SetvlrAcr(Index: Integer; const ADouble: Double);
    function  vlrAcr_Specified(Index: Integer): boolean;
    procedure SetvlrLim(Index: Integer; const ADouble: Double);
    function  vlrLim_Specified(Index: Integer): boolean;
    procedure SetvlrPrt(Index: Integer; const ADouble: Double);
    function  vlrPrt_Specified(Index: Integer): boolean;
  published
    property acePar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacePar write SetacePar stored acePar_Specified;
    property acrDia:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacrDia write SetacrDia stored acrDia_Specified;
    property antDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property avaAti:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaAti write SetavaAti stored avaAti_Specified;
    property avaMot:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaMot write SetavaMot stored avaMot_Specified;
    property avaObs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaObs write SetavaObs stored avaObs_Specified;
    property avaVlr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlr write SetavaVlr stored avaVlr_Specified;
    property avaVls:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVls write SetavaVls stored avaVls_Specified;
    property avaVlu:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlu write SetavaVlu stored avaVlu_Specified;
    property catCli:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatCli write SetcatCli stored catCli_Specified;
    property ccbCli:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbCli write SetccbCli stored ccbCli_Specified;
    property cifFob:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcifFob write SetcifFob stored cifFob_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCpg write SetcodCpg stored codCpg_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFcr write SetcodFcr stored codFcr_Specified;
    property codFil:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codIn1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMar write SetcodMar stored codMar_Specified;
    property codRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRed write SetcodRed stored codRed_Specified;
    property codRep:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codRve:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRve write SetcodRve stored codRve_Specified;
    property codTab:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTab write SetcodTab stored codTab_Specified;
    property codTic:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTic write SetcodTic stored codTic_Specified;
    property codTpr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpr write SetcodTpr stored codTpr_Specified;
    property codTra:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTra write SetcodTra stored codTra_Specified;
    property codTrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTrd write SetcodTrd stored codTrd_Specified;
    property codVen:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodVen write SetcodVen stored codVen_Specified;
    property conFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FconFin write SetconFin stored conFin_Specified;
    property criEdv:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriEdv write SetcriEdv stored criEdv_Specified;
    property ctaAad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAad write SetctaAad stored ctaAad_Specified;
    property ctaAux:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAux write SetctaAux stored ctaAux_Specified;
    property ctaFcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFcr write SetctaFcr stored ctaFcr_Specified;
    property ctaFdv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFdv write SetctaFdv stored ctaFdv_Specified;
    property ctaRcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRcr write SetctaRcr stored ctaRcr_Specified;
    property ctaRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrPad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrPad write SetctrPad stored ctrPad_Specified;
    property datLim:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLim write SetdatLim stored datLim_Specified;
    property datPmr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPmr write SetdatPmr stored datPmr_Specified;
    property diaEsp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaEsp write SetdiaEsp stored diaEsp_Specified;
    property diaMe1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe1 write SetdiaMe1 stored diaMe1_Specified;
    property diaMe2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe2 write SetdiaMe2 stored diaMe2_Specified;
    property diaMe3:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe3 write SetdiaMe3 stored diaMe3_Specified;
    property dscPrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscPrd write SetdscPrd stored dscPrd_Specified;
    property ecpCnp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FecpCnp write SetecpCnp stored ecpCnp_Specified;
    property exiAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiAge write SetexiAge stored exiAge_Specified;
    property exiLcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiLcp write SetexiLcp stored exiLcp_Specified;
    property fveCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveCpg write SetfveCpg stored fveCpg_Specified;
    property fveFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveFpg write SetfveFpg stored fveFpg_Specified;
    property fveTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveTns write SetfveTns stored fveTns_Specified;
    property gerTcc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTcc write SetgerTcc stored gerTcc_Specified;
    property indOrf:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindOrf write SetindOrf stored indOrf_Specified;
    property limApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimApr write SetlimApr stored limApr_Specified;
    property perAqa:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAqa write SetperAqa stored perAqa_Specified;
    property perCcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCcr write SetperCcr stored perCcr_Specified;
    property perCom:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDs1:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs1 write SetperDs1 stored perDs1_Specified;
    property perDs2:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs2 write SetperDs2 stored perDs2_Specified;
    property perDs3:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs3 write SetperDs3 stored perDs3_Specified;
    property perDs4:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs4 write SetperDs4 stored perDs4_Specified;
    property perDs5:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs5 write SetperDs5 stored perDs5_Specified;
    property perDsc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perEmb:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEmb write SetperEmb stored perEmb_Specified;
    property perEnc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEnc write SetperEnc stored perEnc_Specified;
    property perFre:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFre write SetperFre stored perFre_Specified;
    property perIss:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIss write SetperIss stored perIss_Specified;
    property perOf1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf1 write SetperOf1 stored perOf1_Specified;
    property perOf2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf2 write SetperOf2 stored perOf2_Specified;
    property perOut:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOut write SetperOut stored perOut_Specified;
    property perSeg:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperSeg write SetperSeg stored perSeg_Specified;
    property porNa1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa1 write SetporNa1 stored porNa1_Specified;
    property porNa2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa2 write SetporNa2 stored porNa2_Specified;
    property porSi1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi1 write SetporSi1 stored porSi1_Specified;
    property porSi2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi2 write SetporSi2 stored porSi2_Specified;
    property prdDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property qtdChs:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdChs write SetqtdChs stored qtdChs_Specified;
    property qtdDcv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDcv write SetqtdDcv stored qtdDcv_Specified;
    property qtdPrt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdPrt write SetqtdPrt stored qtdPrt_Specified;
    property recDtj:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtj write SetrecDtj stored recDtj_Specified;
    property recDtm:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtm write SetrecDtm stored recDtm_Specified;
    property recJmm:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJmm write SetrecJmm stored recJmm_Specified;
    property recMul:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecMul write SetrecMul stored recMul_Specified;
    property recTjr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecTjr write SetrecTjr stored recTjr_Specified;
    property seqCob:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property seqEnt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property tolDsc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property vlrAcr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAcr write SetvlrAcr stored vlrAcr_Specified;
    property vlrLim:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLim write SetvlrLim stored vlrLim_Specified;
    property vlrPrt:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPrt write SetvlrPrt stored vlrPrt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega = class(TRemotable)
  private
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcepEnt: string;
    FcepEnt_Specified: boolean;
    FcgcEnt: string;
    FcgcEnt_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FiniEnt: string;
    FiniEnt_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FprxEnt: string;
    FprxEnt_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FsitReg: string;
    FsitReg_Specified: boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const Astring: string);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const Astring: string);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetiniEnt(Index: Integer; const Astring: string);
    function  iniEnt_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetprxEnt(Index: Integer; const Astring: string);
    function  prxEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetsitReg(Index: Integer; const Astring: string);
    function  sitReg_Specified(Index: Integer): boolean;
  published
    property baiEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cepEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cgcEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cplEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property endEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property estEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property iniEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FiniEnt write SetiniEnt stored iniEnt_Specified;
    property insEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property nenEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property prxEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprxEnt write SetprxEnt stored prxEnt_Specified;
    property seqEnt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property sitReg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitReg write SetsitReg stored sitReg_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica = class(TRemotable)
  private
    FcidNat: string;
    FcidNat_Specified: boolean;
    FcodSex: string;
    FcodSex_Specified: boolean;
    FdatNas: string;
    FdatNas_Specified: boolean;
    FdatRge: string;
    FdatRge_Specified: boolean;
    FestCiv: Integer;
    FestCiv_Specified: boolean;
    FnomMae: string;
    FnomMae_Specified: boolean;
    FnomPai: string;
    FnomPai_Specified: boolean;
    FnumRge: string;
    FnumRge_Specified: boolean;
    ForgRge: string;
    ForgRge_Specified: boolean;
    FrefCm1: string;
    FrefCm1_Specified: boolean;
    procedure SetcidNat(Index: Integer; const Astring: string);
    function  cidNat_Specified(Index: Integer): boolean;
    procedure SetcodSex(Index: Integer; const Astring: string);
    function  codSex_Specified(Index: Integer): boolean;
    procedure SetdatNas(Index: Integer; const Astring: string);
    function  datNas_Specified(Index: Integer): boolean;
    procedure SetdatRge(Index: Integer; const Astring: string);
    function  datRge_Specified(Index: Integer): boolean;
    procedure SetestCiv(Index: Integer; const AInteger: Integer);
    function  estCiv_Specified(Index: Integer): boolean;
    procedure SetnomMae(Index: Integer; const Astring: string);
    function  nomMae_Specified(Index: Integer): boolean;
    procedure SetnomPai(Index: Integer; const Astring: string);
    function  nomPai_Specified(Index: Integer): boolean;
    procedure SetnumRge(Index: Integer; const Astring: string);
    function  numRge_Specified(Index: Integer): boolean;
    procedure SetorgRge(Index: Integer; const Astring: string);
    function  orgRge_Specified(Index: Integer): boolean;
    procedure SetrefCm1(Index: Integer; const Astring: string);
    function  refCm1_Specified(Index: Integer): boolean;
  published
    property cidNat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidNat write SetcidNat stored cidNat_Specified;
    property codSex: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSex write SetcodSex stored codSex_Specified;
    property datNas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNas write SetdatNas stored datNas_Specified;
    property datRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatRge write SetdatRge stored datRge_Specified;
    property estCiv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCiv write SetestCiv stored estCiv_Specified;
    property nomMae: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomMae write SetnomMae stored nomMae_Specified;
    property nomPai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomPai write SetnomPai stored nomPai_Specified;
    property numRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRge write SetnumRge stored numRge_Specified;
    property orgRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read ForgRge write SetorgRge stored orgRge_Specified;
    property refCm1: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrefCm1 write SetrefCm1 stored refCm1_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2InDadosGeraisCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2InDadosGeraisCliente = class(TRemotable)
  private
    FapeCli: string;
    FapeCli_Specified: boolean;
    FbaiCli: string;
    FbaiCli_Specified: boolean;
    FbaiCob: string;
    FbaiCob_Specified: boolean;
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcadastroCEP: Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP;
    FcadastroCEP_Specified: boolean;
    FcalFun: string;
    FcalFun_Specified: boolean;
    FcepCli: string;
    FcepCli_Specified: boolean;
    FcepCob: Integer;
    FcepCob_Specified: boolean;
    FcepEnt: Integer;
    FcepEnt_Specified: boolean;
    FcepFre: Integer;
    FcepFre_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcgcCob: Double;
    FcgcCob_Specified: boolean;
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcgcEnt: Double;
    FcgcEnt_Specified: boolean;
    FcidCli: string;
    FcidCli_Specified: boolean;
    FcidCob: string;
    FcidCob_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcliCon: string;
    FcliCon_Specified: boolean;
    FcliFor: string;
    FcliFor_Specified: boolean;
    FcliPrx: string;
    FcliPrx_Specified: boolean;
    FcliRep: Integer;
    FcliRep_Specified: boolean;
    FcliTra: Integer;
    FcliTra_Specified: boolean;
    FclientePessoaFisica: Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica;
    FclientePessoaFisica_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodGre: string;
    FcodGre_Specified: boolean;
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
    FcplCob: string;
    FcplCob_Specified: boolean;
    FcplEnd: string;
    FcplEnd_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FcxaPst: Integer;
    FcxaPst_Specified: boolean;
    FdatSuf: string;
    FdatSuf_Specified: boolean;
    FdefinicoesCliente: Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente;
    FdefinicoesCliente_Specified: boolean;
    FeenCli: string;
    FeenCli_Specified: boolean;
    FeenCob: string;
    FeenCob_Specified: boolean;
    FeenEnt: string;
    FeenEnt_Specified: boolean;
    FemaNfe: string;
    FemaNfe_Specified: boolean;
    FendCli: string;
    FendCli_Specified: boolean;
    FendCob: string;
    FendCob_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FenderecosEntrega: Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega;
    FenderecosEntrega_Specified: boolean;
    FentCor: string;
    FentCor_Specified: boolean;
    FestCob: string;
    FestCob_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FfaxCli: string;
    FfaxCli_Specified: boolean;
    FfonCl2: string;
    FfonCl2_Specified: boolean;
    FfonCl3: string;
    FfonCl3_Specified: boolean;
    FfonCl4: string;
    FfonCl4_Specified: boolean;
    FfonCl5: string;
    FfonCl5_Specified: boolean;
    FfonCli: string;
    FfonCli_Specified: boolean;
    FideCli: string;
    FideCli_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    FindCoo: string;
    FindCoo_Specified: boolean;
    FinsAnp: Integer;
    FinsAnp_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FinsEst: string;
    FinsEst_Specified: boolean;
    FinsMun: string;
    FinsMun_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FlimRet: string;
    FlimRet_Specified: boolean;
    FmarCli: string;
    FmarCli_Specified: boolean;
    FnatCof: Integer;
    FnatCof_Specified: boolean;
    FnatPis: Integer;
    FnatPis_Specified: boolean;
    FnatRet: Integer;
    FnatRet_Specified: boolean;
    FnenCli: string;
    FnenCli_Specified: boolean;
    FnenCob: string;
    FnenCob_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FnumIdf: string;
    FnumIdf_Specified: boolean;
    FobsMot: string;
    FobsMot_Specified: boolean;
    FperAin: Integer;
    FperAin_Specified: boolean;
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
    FseqRoe: Integer;
    FseqRoe_Specified: boolean;
    FsigUfs: string;
    FsigUfs_Specified: boolean;
    FsitCli: string;
    FsitCli_Specified: boolean;
    FtipAce: Integer;
    FtipAce_Specified: boolean;
    FtipCli: string;
    FtipCli_Specified: boolean;
    FtipEmc: Integer;
    FtipEmc_Specified: boolean;
    FtipEmp: Integer;
    FtipEmp_Specified: boolean;
    FtipMer: string;
    FtipMer_Specified: boolean;
    FtriCof: string;
    FtriCof_Specified: boolean;
    FtriIcm: string;
    FtriIcm_Specified: boolean;
    FtriIpi: string;
    FtriIpi_Specified: boolean;
    FtriPis: string;
    FtriPis_Specified: boolean;
    FzipCod: string;
    FzipCod_Specified: boolean;
    FzonFra: Integer;
    FzonFra_Specified: boolean;
    procedure SetapeCli(Index: Integer; const Astring: string);
    function  apeCli_Specified(Index: Integer): boolean;
    procedure SetbaiCli(Index: Integer; const Astring: string);
    function  baiCli_Specified(Index: Integer): boolean;
    procedure SetbaiCob(Index: Integer; const Astring: string);
    function  baiCob_Specified(Index: Integer): boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP);
    function  cadastroCEP_Specified(Index: Integer): boolean;
    procedure SetcalFun(Index: Integer; const Astring: string);
    function  calFun_Specified(Index: Integer): boolean;
    procedure SetcepCli(Index: Integer; const Astring: string);
    function  cepCli_Specified(Index: Integer): boolean;
    procedure SetcepCob(Index: Integer; const AInteger: Integer);
    function  cepCob_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const AInteger: Integer);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcepFre(Index: Integer; const AInteger: Integer);
    function  cepFre_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcgcCob(Index: Integer; const ADouble: Double);
    function  cgcCob_Specified(Index: Integer): boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const ADouble: Double);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidCli(Index: Integer; const Astring: string);
    function  cidCli_Specified(Index: Integer): boolean;
    procedure SetcidCob(Index: Integer; const Astring: string);
    function  cidCob_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcliCon(Index: Integer; const Astring: string);
    function  cliCon_Specified(Index: Integer): boolean;
    procedure SetcliFor(Index: Integer; const Astring: string);
    function  cliFor_Specified(Index: Integer): boolean;
    procedure SetcliPrx(Index: Integer; const Astring: string);
    function  cliPrx_Specified(Index: Integer): boolean;
    procedure SetcliRep(Index: Integer; const AInteger: Integer);
    function  cliRep_Specified(Index: Integer): boolean;
    procedure SetcliTra(Index: Integer; const AInteger: Integer);
    function  cliTra_Specified(Index: Integer): boolean;
    procedure SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica);
    function  clientePessoaFisica_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodGre(Index: Integer; const Astring: string);
    function  codGre_Specified(Index: Integer): boolean;
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
    procedure SetcplCob(Index: Integer; const Astring: string);
    function  cplCob_Specified(Index: Integer): boolean;
    procedure SetcplEnd(Index: Integer; const Astring: string);
    function  cplEnd_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetcxaPst(Index: Integer; const AInteger: Integer);
    function  cxaPst_Specified(Index: Integer): boolean;
    procedure SetdatSuf(Index: Integer; const Astring: string);
    function  datSuf_Specified(Index: Integer): boolean;
    procedure SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente);
    function  definicoesCliente_Specified(Index: Integer): boolean;
    procedure SeteenCli(Index: Integer; const Astring: string);
    function  eenCli_Specified(Index: Integer): boolean;
    procedure SeteenCob(Index: Integer; const Astring: string);
    function  eenCob_Specified(Index: Integer): boolean;
    procedure SeteenEnt(Index: Integer; const Astring: string);
    function  eenEnt_Specified(Index: Integer): boolean;
    procedure SetemaNfe(Index: Integer; const Astring: string);
    function  emaNfe_Specified(Index: Integer): boolean;
    procedure SetendCli(Index: Integer; const Astring: string);
    function  endCli_Specified(Index: Integer): boolean;
    procedure SetendCob(Index: Integer; const Astring: string);
    function  endCob_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega);
    function  enderecosEntrega_Specified(Index: Integer): boolean;
    procedure SetentCor(Index: Integer; const Astring: string);
    function  entCor_Specified(Index: Integer): boolean;
    procedure SetestCob(Index: Integer; const Astring: string);
    function  estCob_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetfaxCli(Index: Integer; const Astring: string);
    function  faxCli_Specified(Index: Integer): boolean;
    procedure SetfonCl2(Index: Integer; const Astring: string);
    function  fonCl2_Specified(Index: Integer): boolean;
    procedure SetfonCl3(Index: Integer; const Astring: string);
    function  fonCl3_Specified(Index: Integer): boolean;
    procedure SetfonCl4(Index: Integer; const Astring: string);
    function  fonCl4_Specified(Index: Integer): boolean;
    procedure SetfonCl5(Index: Integer; const Astring: string);
    function  fonCl5_Specified(Index: Integer): boolean;
    procedure SetfonCli(Index: Integer; const Astring: string);
    function  fonCli_Specified(Index: Integer): boolean;
    procedure SetideCli(Index: Integer; const Astring: string);
    function  ideCli_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetindCoo(Index: Integer; const Astring: string);
    function  indCoo_Specified(Index: Integer): boolean;
    procedure SetinsAnp(Index: Integer; const AInteger: Integer);
    function  insAnp_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetinsEst(Index: Integer; const Astring: string);
    function  insEst_Specified(Index: Integer): boolean;
    procedure SetinsMun(Index: Integer; const Astring: string);
    function  insMun_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetlimRet(Index: Integer; const Astring: string);
    function  limRet_Specified(Index: Integer): boolean;
    procedure SetmarCli(Index: Integer; const Astring: string);
    function  marCli_Specified(Index: Integer): boolean;
    procedure SetnatCof(Index: Integer; const AInteger: Integer);
    function  natCof_Specified(Index: Integer): boolean;
    procedure SetnatPis(Index: Integer; const AInteger: Integer);
    function  natPis_Specified(Index: Integer): boolean;
    procedure SetnatRet(Index: Integer; const AInteger: Integer);
    function  natRet_Specified(Index: Integer): boolean;
    procedure SetnenCli(Index: Integer; const Astring: string);
    function  nenCli_Specified(Index: Integer): boolean;
    procedure SetnenCob(Index: Integer; const Astring: string);
    function  nenCob_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetnumIdf(Index: Integer; const Astring: string);
    function  numIdf_Specified(Index: Integer): boolean;
    procedure SetobsMot(Index: Integer; const Astring: string);
    function  obsMot_Specified(Index: Integer): boolean;
    procedure SetperAin(Index: Integer; const AInteger: Integer);
    function  perAin_Specified(Index: Integer): boolean;
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
    procedure SetseqRoe(Index: Integer; const AInteger: Integer);
    function  seqRoe_Specified(Index: Integer): boolean;
    procedure SetsigUfs(Index: Integer; const Astring: string);
    function  sigUfs_Specified(Index: Integer): boolean;
    procedure SetsitCli(Index: Integer; const Astring: string);
    function  sitCli_Specified(Index: Integer): boolean;
    procedure SettipAce(Index: Integer; const AInteger: Integer);
    function  tipAce_Specified(Index: Integer): boolean;
    procedure SettipCli(Index: Integer; const Astring: string);
    function  tipCli_Specified(Index: Integer): boolean;
    procedure SettipEmc(Index: Integer; const AInteger: Integer);
    function  tipEmc_Specified(Index: Integer): boolean;
    procedure SettipEmp(Index: Integer; const AInteger: Integer);
    function  tipEmp_Specified(Index: Integer): boolean;
    procedure SettipMer(Index: Integer; const Astring: string);
    function  tipMer_Specified(Index: Integer): boolean;
    procedure SettriCof(Index: Integer; const Astring: string);
    function  triCof_Specified(Index: Integer): boolean;
    procedure SettriIcm(Index: Integer; const Astring: string);
    function  triIcm_Specified(Index: Integer): boolean;
    procedure SettriIpi(Index: Integer; const Astring: string);
    function  triIpi_Specified(Index: Integer): boolean;
    procedure SettriPis(Index: Integer; const Astring: string);
    function  triPis_Specified(Index: Integer): boolean;
    procedure SetzipCod(Index: Integer; const Astring: string);
    function  zipCod_Specified(Index: Integer): boolean;
    procedure SetzonFra(Index: Integer; const AInteger: Integer);
    function  zonFra_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property apeCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FapeCli write SetapeCli stored apeCli_Specified;
    property baiCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCli write SetbaiCli stored baiCli_Specified;
    property baiCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCob write SetbaiCob stored baiCob_Specified;
    property baiEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cadastroCEP:         Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FcadastroCEP write SetcadastroCEP stored cadastroCEP_Specified;
    property calFun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcalFun write SetcalFun stored calFun_Specified;
    property cepCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCli write SetcepCli stored cepCli_Specified;
    property cepCob:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCob write SetcepCob stored cepCob_Specified;
    property cepEnt:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cepFre:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFre write SetcepFre stored cepFre_Specified;
    property cepIni:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cgcCob:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCob write SetcgcCob stored cgcCob_Specified;
    property cgcCpf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property cgcEnt:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCli write SetcidCli stored cidCli_Specified;
    property cidCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCob write SetcidCob stored cidCob_Specified;
    property cidEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cliCon:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliCon write SetcliCon stored cliCon_Specified;
    property cliFor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliFor write SetcliFor stored cliFor_Specified;
    property cliPrx:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliPrx write SetcliPrx stored cliPrx_Specified;
    property cliRep:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliRep write SetcliRep stored cliRep_Specified;
    property cliTra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliTra write SetcliTra stored cliTra_Specified;
    property clientePessoaFisica: Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FclientePessoaFisica write SetclientePessoaFisica stored clientePessoaFisica_Specified;
    property codCli:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codFor:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codGre:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodGre write SetcodGre stored codGre_Specified;
    property codMot:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMot write SetcodMot stored codMot_Specified;
    property codPai:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPai write SetcodPai stored codPai_Specified;
    property codRam:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRam write SetcodRam stored codRam_Specified;
    property codRoe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRoe write SetcodRoe stored codRoe_Specified;
    property codRtr:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRtr write SetcodRtr stored codRtr_Specified;
    property codSro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSro write SetcodSro stored codSro_Specified;
    property codSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSuf write SetcodSuf stored codSuf_Specified;
    property cplCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplCob write SetcplCob stored cplCob_Specified;
    property cplEnd:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnd write SetcplEnd stored cplEnd_Specified;
    property cplEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property cxaPst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcxaPst write SetcxaPst stored cxaPst_Specified;
    property datSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatSuf write SetdatSuf stored datSuf_Specified;
    property definicoesCliente:   Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente    Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdefinicoesCliente write SetdefinicoesCliente stored definicoesCliente_Specified;
    property eenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCli write SeteenCli stored eenCli_Specified;
    property eenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCob write SeteenCob stored eenCob_Specified;
    property eenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenEnt write SeteenEnt stored eenEnt_Specified;
    property emaNfe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FemaNfe write SetemaNfe stored emaNfe_Specified;
    property endCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCli write SetendCli stored endCli_Specified;
    property endCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCob write SetendCob stored endCob_Specified;
    property endEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property enderecosEntrega:    Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega     Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FenderecosEntrega write SetenderecosEntrega stored enderecosEntrega_Specified;
    property entCor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FentCor write SetentCor stored entCor_Specified;
    property estCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCob write SetestCob stored estCob_Specified;
    property estEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property faxCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxCli write SetfaxCli stored faxCli_Specified;
    property fonCl2:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl2 write SetfonCl2 stored fonCl2_Specified;
    property fonCl3:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl3 write SetfonCl3 stored fonCl3_Specified;
    property fonCl4:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl4 write SetfonCl4 stored fonCl4_Specified;
    property fonCl5:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl5 write SetfonCl5 stored fonCl5_Specified;
    property fonCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCli write SetfonCli stored fonCli_Specified;
    property ideCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideCli write SetideCli stored ideCli_Specified;
    property ideExt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property indCoo:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCoo write SetindCoo stored indCoo_Specified;
    property insAnp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsAnp write SetinsAnp stored insAnp_Specified;
    property insEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property insEst:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEst write SetinsEst stored insEst_Specified;
    property insMun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsMun write SetinsMun stored insMun_Specified;
    property intNet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property limRet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimRet write SetlimRet stored limRet_Specified;
    property marCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmarCli write SetmarCli stored marCli_Specified;
    property natCof:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatCof write SetnatCof stored natCof_Specified;
    property natPis:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatPis write SetnatPis stored natPis_Specified;
    property natRet:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatRet write SetnatRet stored natRet_Specified;
    property nenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCli write SetnenCli stored nenCli_Specified;
    property nenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCob write SetnenCob stored nenCob_Specified;
    property nenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property numIdf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumIdf write SetnumIdf stored numIdf_Specified;
    property obsMot:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMot write SetobsMot stored obsMot_Specified;
    property perAin:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAin write SetperAin stored perAin_Specified;
    property regEst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FregEst write SetregEst stored regEst_Specified;
    property retCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCof write SetretCof stored retCof_Specified;
    property retCsl:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCsl write SetretCsl stored retCsl_Specified;
    property retIrf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretIrf write SetretIrf stored retIrf_Specified;
    property retOur:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretOur write SetretOur stored retOur_Specified;
    property retPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPis write SetretPis stored retPis_Specified;
    property retPro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPro write SetretPro stored retPro_Specified;
    property seqRoe:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRoe write SetseqRoe stored seqRoe_Specified;
    property sigUfs:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigUfs write SetsigUfs stored sigUfs_Specified;
    property sitCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCli write SetsitCli stored sitCli_Specified;
    property tipAce:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipAce write SettipAce stored tipAce_Specified;
    property tipCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCli write SettipCli stored tipCli_Specified;
    property tipEmc:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmc write SettipEmc stored tipEmc_Specified;
    property tipEmp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmp write SettipEmp stored tipEmp_Specified;
    property tipMer:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMer write SettipMer stored tipMer_Specified;
    property triCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriCof write SettriCof stored triCof_Specified;
    property triIcm:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIcm write SettriIcm stored triIcm_Specified;
    property triIpi:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIpi write SettriIpi stored triIpi_Specified;
    property triPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriPis write SettriPis stored triPis_Specified;
    property zipCod:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzipCod write SetzipCod stored zipCod_Specified;
    property zonFra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzonFra write SetzonFra stored zonFra_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes2InDadosGeraisClienteCadastroCEP, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes2InDadosGeraisClienteCadastroCEP = class(TRemotable)
  private
    FbaiCid: string;
    FbaiCid_Specified: boolean;
    FcepFim: string;
    FcepFim_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcepPol: string;
    FcepPol_Specified: boolean;
    FcodRai: Integer;
    FcodRai_Specified: boolean;
    FendCid: string;
    FendCid_Specified: boolean;
    FnomCid: string;
    FnomCid_Specified: boolean;
    procedure SetbaiCid(Index: Integer; const Astring: string);
    function  baiCid_Specified(Index: Integer): boolean;
    procedure SetcepFim(Index: Integer; const Astring: string);
    function  cepFim_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcepPol(Index: Integer; const Astring: string);
    function  cepPol_Specified(Index: Integer): boolean;
    procedure SetcodRai(Index: Integer; const AInteger: Integer);
    function  codRai_Specified(Index: Integer): boolean;
    procedure SetendCid(Index: Integer; const Astring: string);
    function  endCid_Specified(Index: Integer): boolean;
    procedure SetnomCid(Index: Integer; const Astring: string);
    function  nomCid_Specified(Index: Integer): boolean;
  published
    property baiCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCid write SetbaiCid stored baiCid_Specified;
    property cepFim: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFim write SetcepFim stored cepFim_Specified;
    property cepIni: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cepPol: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepPol write SetcepPol stored cepPol_Specified;
    property codRai: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRai write SetcodRai stored codRai_Specified;
    property endCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCid write SetendCid stored endCid_Specified;
    property nomCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCid write SetnomCid stored nomCid_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3InDadosGeraisCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3InDadosGeraisCliente = class(TRemotable)
  private
    FapeCli: string;
    FapeCli_Specified: boolean;
    FbaiCli: string;
    FbaiCli_Specified: boolean;
    FbaiCob: string;
    FbaiCob_Specified: boolean;
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcadastroCEP: Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP;
    FcadastroCEP_Specified: boolean;
    FcalFun: string;
    FcalFun_Specified: boolean;
    FcepCli: string;
    FcepCli_Specified: boolean;
    FcepCob: Integer;
    FcepCob_Specified: boolean;
    FcepEnt: Integer;
    FcepEnt_Specified: boolean;
    FcepFre: Integer;
    FcepFre_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcgcCob: Double;
    FcgcCob_Specified: boolean;
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcgcEnt: Double;
    FcgcEnt_Specified: boolean;
    FcidCli: string;
    FcidCli_Specified: boolean;
    FcidCob: string;
    FcidCob_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcliCon: string;
    FcliCon_Specified: boolean;
    FcliFor: string;
    FcliFor_Specified: boolean;
    FcliPrx: string;
    FcliPrx_Specified: boolean;
    FcliRep: Integer;
    FcliRep_Specified: boolean;
    FcliTra: Integer;
    FcliTra_Specified: boolean;
    FclientePessoaFisica: Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica;
    FclientePessoaFisica_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodGre: string;
    FcodGre_Specified: boolean;
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
    FcplCob: string;
    FcplCob_Specified: boolean;
    FcplEnd: string;
    FcplEnd_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FcxaPst: Integer;
    FcxaPst_Specified: boolean;
    FdatSuf: string;
    FdatSuf_Specified: boolean;
    FdefinicoesCliente: Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente;
    FdefinicoesCliente_Specified: boolean;
    FeenCli: string;
    FeenCli_Specified: boolean;
    FeenCob: string;
    FeenCob_Specified: boolean;
    FeenEnt: string;
    FeenEnt_Specified: boolean;
    FemaNfe: string;
    FemaNfe_Specified: boolean;
    FendCli: string;
    FendCli_Specified: boolean;
    FendCob: string;
    FendCob_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FenderecosEntrega: Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega;
    FenderecosEntrega_Specified: boolean;
    FentCor: string;
    FentCor_Specified: boolean;
    FestCob: string;
    FestCob_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FfaxCli: string;
    FfaxCli_Specified: boolean;
    FfonCl2: string;
    FfonCl2_Specified: boolean;
    FfonCl3: string;
    FfonCl3_Specified: boolean;
    FfonCl4: string;
    FfonCl4_Specified: boolean;
    FfonCl5: string;
    FfonCl5_Specified: boolean;
    FfonCli: string;
    FfonCli_Specified: boolean;
    FideCli: string;
    FideCli_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    FindCoo: string;
    FindCoo_Specified: boolean;
    FinsAnp: Integer;
    FinsAnp_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FinsEst: string;
    FinsEst_Specified: boolean;
    FinsMun: string;
    FinsMun_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FlimRet: string;
    FlimRet_Specified: boolean;
    FmarCli: string;
    FmarCli_Specified: boolean;
    FnatCof: Integer;
    FnatCof_Specified: boolean;
    FnatPis: Integer;
    FnatPis_Specified: boolean;
    FnatRet: Integer;
    FnatRet_Specified: boolean;
    FnenCli: string;
    FnenCli_Specified: boolean;
    FnenCob: string;
    FnenCob_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FnumIdf: string;
    FnumIdf_Specified: boolean;
    FobsMot: string;
    FobsMot_Specified: boolean;
    FperAin: Integer;
    FperAin_Specified: boolean;
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
    FseqRoe: Integer;
    FseqRoe_Specified: boolean;
    FsigUfs: string;
    FsigUfs_Specified: boolean;
    FsitCli: string;
    FsitCli_Specified: boolean;
    FtipAce: Integer;
    FtipAce_Specified: boolean;
    FtipCli: string;
    FtipCli_Specified: boolean;
    FtipEmc: Integer;
    FtipEmc_Specified: boolean;
    FtipEmp: Integer;
    FtipEmp_Specified: boolean;
    FtipMer: string;
    FtipMer_Specified: boolean;
    FtriCof: string;
    FtriCof_Specified: boolean;
    FtriIcm: string;
    FtriIcm_Specified: boolean;
    FtriIpi: string;
    FtriIpi_Specified: boolean;
    FtriPis: string;
    FtriPis_Specified: boolean;
    FzipCod: string;
    FzipCod_Specified: boolean;
    FzonFra: Integer;
    FzonFra_Specified: boolean;
    procedure SetapeCli(Index: Integer; const Astring: string);
    function  apeCli_Specified(Index: Integer): boolean;
    procedure SetbaiCli(Index: Integer; const Astring: string);
    function  baiCli_Specified(Index: Integer): boolean;
    procedure SetbaiCob(Index: Integer; const Astring: string);
    function  baiCob_Specified(Index: Integer): boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP);
    function  cadastroCEP_Specified(Index: Integer): boolean;
    procedure SetcalFun(Index: Integer; const Astring: string);
    function  calFun_Specified(Index: Integer): boolean;
    procedure SetcepCli(Index: Integer; const Astring: string);
    function  cepCli_Specified(Index: Integer): boolean;
    procedure SetcepCob(Index: Integer; const AInteger: Integer);
    function  cepCob_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const AInteger: Integer);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcepFre(Index: Integer; const AInteger: Integer);
    function  cepFre_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcgcCob(Index: Integer; const ADouble: Double);
    function  cgcCob_Specified(Index: Integer): boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const ADouble: Double);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidCli(Index: Integer; const Astring: string);
    function  cidCli_Specified(Index: Integer): boolean;
    procedure SetcidCob(Index: Integer; const Astring: string);
    function  cidCob_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcliCon(Index: Integer; const Astring: string);
    function  cliCon_Specified(Index: Integer): boolean;
    procedure SetcliFor(Index: Integer; const Astring: string);
    function  cliFor_Specified(Index: Integer): boolean;
    procedure SetcliPrx(Index: Integer; const Astring: string);
    function  cliPrx_Specified(Index: Integer): boolean;
    procedure SetcliRep(Index: Integer; const AInteger: Integer);
    function  cliRep_Specified(Index: Integer): boolean;
    procedure SetcliTra(Index: Integer; const AInteger: Integer);
    function  cliTra_Specified(Index: Integer): boolean;
    procedure SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica);
    function  clientePessoaFisica_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodGre(Index: Integer; const Astring: string);
    function  codGre_Specified(Index: Integer): boolean;
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
    procedure SetcplCob(Index: Integer; const Astring: string);
    function  cplCob_Specified(Index: Integer): boolean;
    procedure SetcplEnd(Index: Integer; const Astring: string);
    function  cplEnd_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetcxaPst(Index: Integer; const AInteger: Integer);
    function  cxaPst_Specified(Index: Integer): boolean;
    procedure SetdatSuf(Index: Integer; const Astring: string);
    function  datSuf_Specified(Index: Integer): boolean;
    procedure SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente);
    function  definicoesCliente_Specified(Index: Integer): boolean;
    procedure SeteenCli(Index: Integer; const Astring: string);
    function  eenCli_Specified(Index: Integer): boolean;
    procedure SeteenCob(Index: Integer; const Astring: string);
    function  eenCob_Specified(Index: Integer): boolean;
    procedure SeteenEnt(Index: Integer; const Astring: string);
    function  eenEnt_Specified(Index: Integer): boolean;
    procedure SetemaNfe(Index: Integer; const Astring: string);
    function  emaNfe_Specified(Index: Integer): boolean;
    procedure SetendCli(Index: Integer; const Astring: string);
    function  endCli_Specified(Index: Integer): boolean;
    procedure SetendCob(Index: Integer; const Astring: string);
    function  endCob_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega);
    function  enderecosEntrega_Specified(Index: Integer): boolean;
    procedure SetentCor(Index: Integer; const Astring: string);
    function  entCor_Specified(Index: Integer): boolean;
    procedure SetestCob(Index: Integer; const Astring: string);
    function  estCob_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetfaxCli(Index: Integer; const Astring: string);
    function  faxCli_Specified(Index: Integer): boolean;
    procedure SetfonCl2(Index: Integer; const Astring: string);
    function  fonCl2_Specified(Index: Integer): boolean;
    procedure SetfonCl3(Index: Integer; const Astring: string);
    function  fonCl3_Specified(Index: Integer): boolean;
    procedure SetfonCl4(Index: Integer; const Astring: string);
    function  fonCl4_Specified(Index: Integer): boolean;
    procedure SetfonCl5(Index: Integer; const Astring: string);
    function  fonCl5_Specified(Index: Integer): boolean;
    procedure SetfonCli(Index: Integer; const Astring: string);
    function  fonCli_Specified(Index: Integer): boolean;
    procedure SetideCli(Index: Integer; const Astring: string);
    function  ideCli_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetindCoo(Index: Integer; const Astring: string);
    function  indCoo_Specified(Index: Integer): boolean;
    procedure SetinsAnp(Index: Integer; const AInteger: Integer);
    function  insAnp_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetinsEst(Index: Integer; const Astring: string);
    function  insEst_Specified(Index: Integer): boolean;
    procedure SetinsMun(Index: Integer; const Astring: string);
    function  insMun_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetlimRet(Index: Integer; const Astring: string);
    function  limRet_Specified(Index: Integer): boolean;
    procedure SetmarCli(Index: Integer; const Astring: string);
    function  marCli_Specified(Index: Integer): boolean;
    procedure SetnatCof(Index: Integer; const AInteger: Integer);
    function  natCof_Specified(Index: Integer): boolean;
    procedure SetnatPis(Index: Integer; const AInteger: Integer);
    function  natPis_Specified(Index: Integer): boolean;
    procedure SetnatRet(Index: Integer; const AInteger: Integer);
    function  natRet_Specified(Index: Integer): boolean;
    procedure SetnenCli(Index: Integer; const Astring: string);
    function  nenCli_Specified(Index: Integer): boolean;
    procedure SetnenCob(Index: Integer; const Astring: string);
    function  nenCob_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetnumIdf(Index: Integer; const Astring: string);
    function  numIdf_Specified(Index: Integer): boolean;
    procedure SetobsMot(Index: Integer; const Astring: string);
    function  obsMot_Specified(Index: Integer): boolean;
    procedure SetperAin(Index: Integer; const AInteger: Integer);
    function  perAin_Specified(Index: Integer): boolean;
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
    procedure SetseqRoe(Index: Integer; const AInteger: Integer);
    function  seqRoe_Specified(Index: Integer): boolean;
    procedure SetsigUfs(Index: Integer; const Astring: string);
    function  sigUfs_Specified(Index: Integer): boolean;
    procedure SetsitCli(Index: Integer; const Astring: string);
    function  sitCli_Specified(Index: Integer): boolean;
    procedure SettipAce(Index: Integer; const AInteger: Integer);
    function  tipAce_Specified(Index: Integer): boolean;
    procedure SettipCli(Index: Integer; const Astring: string);
    function  tipCli_Specified(Index: Integer): boolean;
    procedure SettipEmc(Index: Integer; const AInteger: Integer);
    function  tipEmc_Specified(Index: Integer): boolean;
    procedure SettipEmp(Index: Integer; const AInteger: Integer);
    function  tipEmp_Specified(Index: Integer): boolean;
    procedure SettipMer(Index: Integer; const Astring: string);
    function  tipMer_Specified(Index: Integer): boolean;
    procedure SettriCof(Index: Integer; const Astring: string);
    function  triCof_Specified(Index: Integer): boolean;
    procedure SettriIcm(Index: Integer; const Astring: string);
    function  triIcm_Specified(Index: Integer): boolean;
    procedure SettriIpi(Index: Integer; const Astring: string);
    function  triIpi_Specified(Index: Integer): boolean;
    procedure SettriPis(Index: Integer; const Astring: string);
    function  triPis_Specified(Index: Integer): boolean;
    procedure SetzipCod(Index: Integer; const Astring: string);
    function  zipCod_Specified(Index: Integer): boolean;
    procedure SetzonFra(Index: Integer; const AInteger: Integer);
    function  zonFra_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property apeCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FapeCli write SetapeCli stored apeCli_Specified;
    property baiCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCli write SetbaiCli stored baiCli_Specified;
    property baiCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCob write SetbaiCob stored baiCob_Specified;
    property baiEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cadastroCEP:         Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FcadastroCEP write SetcadastroCEP stored cadastroCEP_Specified;
    property calFun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcalFun write SetcalFun stored calFun_Specified;
    property cepCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCli write SetcepCli stored cepCli_Specified;
    property cepCob:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCob write SetcepCob stored cepCob_Specified;
    property cepEnt:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cepFre:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFre write SetcepFre stored cepFre_Specified;
    property cepIni:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cgcCob:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCob write SetcgcCob stored cgcCob_Specified;
    property cgcCpf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property cgcEnt:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCli write SetcidCli stored cidCli_Specified;
    property cidCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCob write SetcidCob stored cidCob_Specified;
    property cidEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cliCon:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliCon write SetcliCon stored cliCon_Specified;
    property cliFor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliFor write SetcliFor stored cliFor_Specified;
    property cliPrx:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliPrx write SetcliPrx stored cliPrx_Specified;
    property cliRep:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliRep write SetcliRep stored cliRep_Specified;
    property cliTra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliTra write SetcliTra stored cliTra_Specified;
    property clientePessoaFisica: Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FclientePessoaFisica write SetclientePessoaFisica stored clientePessoaFisica_Specified;
    property codCli:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codFor:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codGre:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodGre write SetcodGre stored codGre_Specified;
    property codMot:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMot write SetcodMot stored codMot_Specified;
    property codPai:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPai write SetcodPai stored codPai_Specified;
    property codRam:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRam write SetcodRam stored codRam_Specified;
    property codRoe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRoe write SetcodRoe stored codRoe_Specified;
    property codRtr:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRtr write SetcodRtr stored codRtr_Specified;
    property codSro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSro write SetcodSro stored codSro_Specified;
    property codSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSuf write SetcodSuf stored codSuf_Specified;
    property cplCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplCob write SetcplCob stored cplCob_Specified;
    property cplEnd:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnd write SetcplEnd stored cplEnd_Specified;
    property cplEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property cxaPst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcxaPst write SetcxaPst stored cxaPst_Specified;
    property datSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatSuf write SetdatSuf stored datSuf_Specified;
    property definicoesCliente:   Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente    Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdefinicoesCliente write SetdefinicoesCliente stored definicoesCliente_Specified;
    property eenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCli write SeteenCli stored eenCli_Specified;
    property eenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCob write SeteenCob stored eenCob_Specified;
    property eenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenEnt write SeteenEnt stored eenEnt_Specified;
    property emaNfe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FemaNfe write SetemaNfe stored emaNfe_Specified;
    property endCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCli write SetendCli stored endCli_Specified;
    property endCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCob write SetendCob stored endCob_Specified;
    property endEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property enderecosEntrega:    Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega     Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FenderecosEntrega write SetenderecosEntrega stored enderecosEntrega_Specified;
    property entCor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FentCor write SetentCor stored entCor_Specified;
    property estCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCob write SetestCob stored estCob_Specified;
    property estEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property faxCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxCli write SetfaxCli stored faxCli_Specified;
    property fonCl2:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl2 write SetfonCl2 stored fonCl2_Specified;
    property fonCl3:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl3 write SetfonCl3 stored fonCl3_Specified;
    property fonCl4:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl4 write SetfonCl4 stored fonCl4_Specified;
    property fonCl5:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl5 write SetfonCl5 stored fonCl5_Specified;
    property fonCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCli write SetfonCli stored fonCli_Specified;
    property ideCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideCli write SetideCli stored ideCli_Specified;
    property ideExt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property indCoo:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCoo write SetindCoo stored indCoo_Specified;
    property insAnp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsAnp write SetinsAnp stored insAnp_Specified;
    property insEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property insEst:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEst write SetinsEst stored insEst_Specified;
    property insMun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsMun write SetinsMun stored insMun_Specified;
    property intNet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property limRet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimRet write SetlimRet stored limRet_Specified;
    property marCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmarCli write SetmarCli stored marCli_Specified;
    property natCof:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatCof write SetnatCof stored natCof_Specified;
    property natPis:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatPis write SetnatPis stored natPis_Specified;
    property natRet:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatRet write SetnatRet stored natRet_Specified;
    property nenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCli write SetnenCli stored nenCli_Specified;
    property nenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCob write SetnenCob stored nenCob_Specified;
    property nenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property numIdf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumIdf write SetnumIdf stored numIdf_Specified;
    property obsMot:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMot write SetobsMot stored obsMot_Specified;
    property perAin:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAin write SetperAin stored perAin_Specified;
    property regEst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FregEst write SetregEst stored regEst_Specified;
    property retCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCof write SetretCof stored retCof_Specified;
    property retCsl:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCsl write SetretCsl stored retCsl_Specified;
    property retIrf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretIrf write SetretIrf stored retIrf_Specified;
    property retOur:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretOur write SetretOur stored retOur_Specified;
    property retPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPis write SetretPis stored retPis_Specified;
    property retPro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPro write SetretPro stored retPro_Specified;
    property seqRoe:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRoe write SetseqRoe stored seqRoe_Specified;
    property sigUfs:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigUfs write SetsigUfs stored sigUfs_Specified;
    property sitCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCli write SetsitCli stored sitCli_Specified;
    property tipAce:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipAce write SettipAce stored tipAce_Specified;
    property tipCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCli write SettipCli stored tipCli_Specified;
    property tipEmc:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmc write SettipEmc stored tipEmc_Specified;
    property tipEmp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmp write SettipEmp stored tipEmp_Specified;
    property tipMer:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMer write SettipMer stored tipMer_Specified;
    property triCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriCof write SettriCof stored triCof_Specified;
    property triIcm:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIcm write SettriIcm stored triIcm_Specified;
    property triIpi:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIpi write SettriIpi stored triIpi_Specified;
    property triPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriPis write SettriPis stored triPis_Specified;
    property zipCod:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzipCod write SetzipCod stored zipCod_Specified;
    property zonFra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzonFra write SetzonFra stored zonFra_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5InDadosGeraisClienteCadastroCEP, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5InDadosGeraisClienteCadastroCEP = class(TRemotable)
  private
    FbaiCid: string;
    FbaiCid_Specified: boolean;
    FcepFim: string;
    FcepFim_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcepPol: string;
    FcepPol_Specified: boolean;
    FcodRai: Integer;
    FcodRai_Specified: boolean;
    FendCid: string;
    FendCid_Specified: boolean;
    FnomCid: string;
    FnomCid_Specified: boolean;
    procedure SetbaiCid(Index: Integer; const Astring: string);
    function  baiCid_Specified(Index: Integer): boolean;
    procedure SetcepFim(Index: Integer; const Astring: string);
    function  cepFim_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcepPol(Index: Integer; const Astring: string);
    function  cepPol_Specified(Index: Integer): boolean;
    procedure SetcodRai(Index: Integer; const AInteger: Integer);
    function  codRai_Specified(Index: Integer): boolean;
    procedure SetendCid(Index: Integer; const Astring: string);
    function  endCid_Specified(Index: Integer): boolean;
    procedure SetnomCid(Index: Integer; const Astring: string);
    function  nomCid_Specified(Index: Integer): boolean;
  published
    property baiCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCid write SetbaiCid stored baiCid_Specified;
    property cepFim: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFim write SetcepFim stored cepFim_Specified;
    property cepIni: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cepPol: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepPol write SetcepPol stored cepPol_Specified;
    property codRai: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRai write SetcodRai stored codRai_Specified;
    property endCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCid write SetendCid stored endCid_Specified;
    property nomCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCid write SetnomCid stored nomCid_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica = class(TRemotable)
  private
    FcidNat: string;
    FcidNat_Specified: boolean;
    FcodSex: string;
    FcodSex_Specified: boolean;
    FdatNas: string;
    FdatNas_Specified: boolean;
    FdatRge: string;
    FdatRge_Specified: boolean;
    FestCiv: Integer;
    FestCiv_Specified: boolean;
    FnomMae: string;
    FnomMae_Specified: boolean;
    FnomPai: string;
    FnomPai_Specified: boolean;
    FnumRge: string;
    FnumRge_Specified: boolean;
    ForgRge: string;
    ForgRge_Specified: boolean;
    FrefCm1: string;
    FrefCm1_Specified: boolean;
    procedure SetcidNat(Index: Integer; const Astring: string);
    function  cidNat_Specified(Index: Integer): boolean;
    procedure SetcodSex(Index: Integer; const Astring: string);
    function  codSex_Specified(Index: Integer): boolean;
    procedure SetdatNas(Index: Integer; const Astring: string);
    function  datNas_Specified(Index: Integer): boolean;
    procedure SetdatRge(Index: Integer; const Astring: string);
    function  datRge_Specified(Index: Integer): boolean;
    procedure SetestCiv(Index: Integer; const AInteger: Integer);
    function  estCiv_Specified(Index: Integer): boolean;
    procedure SetnomMae(Index: Integer; const Astring: string);
    function  nomMae_Specified(Index: Integer): boolean;
    procedure SetnomPai(Index: Integer; const Astring: string);
    function  nomPai_Specified(Index: Integer): boolean;
    procedure SetnumRge(Index: Integer; const Astring: string);
    function  numRge_Specified(Index: Integer): boolean;
    procedure SetorgRge(Index: Integer; const Astring: string);
    function  orgRge_Specified(Index: Integer): boolean;
    procedure SetrefCm1(Index: Integer; const Astring: string);
    function  refCm1_Specified(Index: Integer): boolean;
  published
    property cidNat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidNat write SetcidNat stored cidNat_Specified;
    property codSex: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSex write SetcodSex stored codSex_Specified;
    property datNas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNas write SetdatNas stored datNas_Specified;
    property datRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatRge write SetdatRge stored datRge_Specified;
    property estCiv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCiv write SetestCiv stored estCiv_Specified;
    property nomMae: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomMae write SetnomMae stored nomMae_Specified;
    property nomPai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomPai write SetnomPai stored nomPai_Specified;
    property numRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRge write SetnumRge stored numRge_Specified;
    property orgRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read ForgRge write SetorgRge stored orgRge_Specified;
    property refCm1: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrefCm1 write SetrefCm1 stored refCm1_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5InDadosGeraisCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5InDadosGeraisCliente = class(TRemotable)
  private
    FapeCli: string;
    FapeCli_Specified: boolean;
    FbaiCli: string;
    FbaiCli_Specified: boolean;
    FbaiCob: string;
    FbaiCob_Specified: boolean;
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcadastroCEP: Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP;
    FcadastroCEP_Specified: boolean;
    FcalFun: string;
    FcalFun_Specified: boolean;
    FcepCli: string;
    FcepCli_Specified: boolean;
    FcepCob: Integer;
    FcepCob_Specified: boolean;
    FcepEnt: Integer;
    FcepEnt_Specified: boolean;
    FcepFre: Integer;
    FcepFre_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcgcCob: Double;
    FcgcCob_Specified: boolean;
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcgcEnt: Double;
    FcgcEnt_Specified: boolean;
    FcidCli: string;
    FcidCli_Specified: boolean;
    FcidCob: string;
    FcidCob_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcliCon: string;
    FcliCon_Specified: boolean;
    FcliFor: string;
    FcliFor_Specified: boolean;
    FcliPrx: string;
    FcliPrx_Specified: boolean;
    FcliRep: Integer;
    FcliRep_Specified: boolean;
    FcliTra: Integer;
    FcliTra_Specified: boolean;
    FclientePessoaFisica: Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica;
    FclientePessoaFisica_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodCnv: Integer;
    FcodCnv_Specified: boolean;
    FcodFor: Integer;
    FcodFor_Specified: boolean;
    FcodGre: string;
    FcodGre_Specified: boolean;
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
    FcplCob: string;
    FcplCob_Specified: boolean;
    FcplEnd: string;
    FcplEnd_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FcxaPst: Integer;
    FcxaPst_Specified: boolean;
    FdatSuf: string;
    FdatSuf_Specified: boolean;
    FdefinicoesCliente: Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente;
    FdefinicoesCliente_Specified: boolean;
    FeenCli: string;
    FeenCli_Specified: boolean;
    FeenCob: string;
    FeenCob_Specified: boolean;
    FeenEnt: string;
    FeenEnt_Specified: boolean;
    FemaNfe: string;
    FemaNfe_Specified: boolean;
    FendCli: string;
    FendCli_Specified: boolean;
    FendCob: string;
    FendCob_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FenderecosEntrega: Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega;
    FenderecosEntrega_Specified: boolean;
    FentCor: string;
    FentCor_Specified: boolean;
    FestCob: string;
    FestCob_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FfaxCli: string;
    FfaxCli_Specified: boolean;
    FfonCl2: string;
    FfonCl2_Specified: boolean;
    FfonCl3: string;
    FfonCl3_Specified: boolean;
    FfonCl4: string;
    FfonCl4_Specified: boolean;
    FfonCl5: string;
    FfonCl5_Specified: boolean;
    FfonCli: string;
    FfonCli_Specified: boolean;
    FideCli: string;
    FideCli_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    FindCoo: string;
    FindCoo_Specified: boolean;
    FindNif: Integer;
    FindNif_Specified: boolean;
    FinsAnp: Integer;
    FinsAnp_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FinsEst: string;
    FinsEst_Specified: boolean;
    FinsMun: string;
    FinsMun_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FlimRet: string;
    FlimRet_Specified: boolean;
    FmarCli: string;
    FmarCli_Specified: boolean;
    FnatCof: Integer;
    FnatCof_Specified: boolean;
    FnatPis: Integer;
    FnatPis_Specified: boolean;
    FnatRet: Integer;
    FnatRet_Specified: boolean;
    FnenCli: string;
    FnenCli_Specified: boolean;
    FnenCob: string;
    FnenCob_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FnumIdf: string;
    FnumIdf_Specified: boolean;
    FobsMot: string;
    FobsMot_Specified: boolean;
    FperAin: Integer;
    FperAin_Specified: boolean;
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
    FseqRoe: Integer;
    FseqRoe_Specified: boolean;
    FsigUfs: string;
    FsigUfs_Specified: boolean;
    FsitCli: string;
    FsitCli_Specified: boolean;
    FtipAce: Integer;
    FtipAce_Specified: boolean;
    FtipCli: string;
    FtipCli_Specified: boolean;
    FtipEmc: Integer;
    FtipEmc_Specified: boolean;
    FtipEmp: Integer;
    FtipEmp_Specified: boolean;
    FtipMer: string;
    FtipMer_Specified: boolean;
    FtriCof: string;
    FtriCof_Specified: boolean;
    FtriIcm: string;
    FtriIcm_Specified: boolean;
    FtriIpi: string;
    FtriIpi_Specified: boolean;
    FtriPis: string;
    FtriPis_Specified: boolean;
    FzipCod: string;
    FzipCod_Specified: boolean;
    FzonFra: Integer;
    FzonFra_Specified: boolean;
    procedure SetapeCli(Index: Integer; const Astring: string);
    function  apeCli_Specified(Index: Integer): boolean;
    procedure SetbaiCli(Index: Integer; const Astring: string);
    function  baiCli_Specified(Index: Integer): boolean;
    procedure SetbaiCob(Index: Integer; const Astring: string);
    function  baiCob_Specified(Index: Integer): boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP);
    function  cadastroCEP_Specified(Index: Integer): boolean;
    procedure SetcalFun(Index: Integer; const Astring: string);
    function  calFun_Specified(Index: Integer): boolean;
    procedure SetcepCli(Index: Integer; const Astring: string);
    function  cepCli_Specified(Index: Integer): boolean;
    procedure SetcepCob(Index: Integer; const AInteger: Integer);
    function  cepCob_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const AInteger: Integer);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcepFre(Index: Integer; const AInteger: Integer);
    function  cepFre_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcgcCob(Index: Integer; const ADouble: Double);
    function  cgcCob_Specified(Index: Integer): boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const ADouble: Double);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidCli(Index: Integer; const Astring: string);
    function  cidCli_Specified(Index: Integer): boolean;
    procedure SetcidCob(Index: Integer; const Astring: string);
    function  cidCob_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcliCon(Index: Integer; const Astring: string);
    function  cliCon_Specified(Index: Integer): boolean;
    procedure SetcliFor(Index: Integer; const Astring: string);
    function  cliFor_Specified(Index: Integer): boolean;
    procedure SetcliPrx(Index: Integer; const Astring: string);
    function  cliPrx_Specified(Index: Integer): boolean;
    procedure SetcliRep(Index: Integer; const AInteger: Integer);
    function  cliRep_Specified(Index: Integer): boolean;
    procedure SetcliTra(Index: Integer; const AInteger: Integer);
    function  cliTra_Specified(Index: Integer): boolean;
    procedure SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica);
    function  clientePessoaFisica_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodCnv(Index: Integer; const AInteger: Integer);
    function  codCnv_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const AInteger: Integer);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetcodGre(Index: Integer; const Astring: string);
    function  codGre_Specified(Index: Integer): boolean;
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
    procedure SetcplCob(Index: Integer; const Astring: string);
    function  cplCob_Specified(Index: Integer): boolean;
    procedure SetcplEnd(Index: Integer; const Astring: string);
    function  cplEnd_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetcxaPst(Index: Integer; const AInteger: Integer);
    function  cxaPst_Specified(Index: Integer): boolean;
    procedure SetdatSuf(Index: Integer; const Astring: string);
    function  datSuf_Specified(Index: Integer): boolean;
    procedure SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente);
    function  definicoesCliente_Specified(Index: Integer): boolean;
    procedure SeteenCli(Index: Integer; const Astring: string);
    function  eenCli_Specified(Index: Integer): boolean;
    procedure SeteenCob(Index: Integer; const Astring: string);
    function  eenCob_Specified(Index: Integer): boolean;
    procedure SeteenEnt(Index: Integer; const Astring: string);
    function  eenEnt_Specified(Index: Integer): boolean;
    procedure SetemaNfe(Index: Integer; const Astring: string);
    function  emaNfe_Specified(Index: Integer): boolean;
    procedure SetendCli(Index: Integer; const Astring: string);
    function  endCli_Specified(Index: Integer): boolean;
    procedure SetendCob(Index: Integer; const Astring: string);
    function  endCob_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega);
    function  enderecosEntrega_Specified(Index: Integer): boolean;
    procedure SetentCor(Index: Integer; const Astring: string);
    function  entCor_Specified(Index: Integer): boolean;
    procedure SetestCob(Index: Integer; const Astring: string);
    function  estCob_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetfaxCli(Index: Integer; const Astring: string);
    function  faxCli_Specified(Index: Integer): boolean;
    procedure SetfonCl2(Index: Integer; const Astring: string);
    function  fonCl2_Specified(Index: Integer): boolean;
    procedure SetfonCl3(Index: Integer; const Astring: string);
    function  fonCl3_Specified(Index: Integer): boolean;
    procedure SetfonCl4(Index: Integer; const Astring: string);
    function  fonCl4_Specified(Index: Integer): boolean;
    procedure SetfonCl5(Index: Integer; const Astring: string);
    function  fonCl5_Specified(Index: Integer): boolean;
    procedure SetfonCli(Index: Integer; const Astring: string);
    function  fonCli_Specified(Index: Integer): boolean;
    procedure SetideCli(Index: Integer; const Astring: string);
    function  ideCli_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure SetindCoo(Index: Integer; const Astring: string);
    function  indCoo_Specified(Index: Integer): boolean;
    procedure SetindNif(Index: Integer; const AInteger: Integer);
    function  indNif_Specified(Index: Integer): boolean;
    procedure SetinsAnp(Index: Integer; const AInteger: Integer);
    function  insAnp_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetinsEst(Index: Integer; const Astring: string);
    function  insEst_Specified(Index: Integer): boolean;
    procedure SetinsMun(Index: Integer; const Astring: string);
    function  insMun_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetlimRet(Index: Integer; const Astring: string);
    function  limRet_Specified(Index: Integer): boolean;
    procedure SetmarCli(Index: Integer; const Astring: string);
    function  marCli_Specified(Index: Integer): boolean;
    procedure SetnatCof(Index: Integer; const AInteger: Integer);
    function  natCof_Specified(Index: Integer): boolean;
    procedure SetnatPis(Index: Integer; const AInteger: Integer);
    function  natPis_Specified(Index: Integer): boolean;
    procedure SetnatRet(Index: Integer; const AInteger: Integer);
    function  natRet_Specified(Index: Integer): boolean;
    procedure SetnenCli(Index: Integer; const Astring: string);
    function  nenCli_Specified(Index: Integer): boolean;
    procedure SetnenCob(Index: Integer; const Astring: string);
    function  nenCob_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetnumIdf(Index: Integer; const Astring: string);
    function  numIdf_Specified(Index: Integer): boolean;
    procedure SetobsMot(Index: Integer; const Astring: string);
    function  obsMot_Specified(Index: Integer): boolean;
    procedure SetperAin(Index: Integer; const AInteger: Integer);
    function  perAin_Specified(Index: Integer): boolean;
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
    procedure SetseqRoe(Index: Integer; const AInteger: Integer);
    function  seqRoe_Specified(Index: Integer): boolean;
    procedure SetsigUfs(Index: Integer; const Astring: string);
    function  sigUfs_Specified(Index: Integer): boolean;
    procedure SetsitCli(Index: Integer; const Astring: string);
    function  sitCli_Specified(Index: Integer): boolean;
    procedure SettipAce(Index: Integer; const AInteger: Integer);
    function  tipAce_Specified(Index: Integer): boolean;
    procedure SettipCli(Index: Integer; const Astring: string);
    function  tipCli_Specified(Index: Integer): boolean;
    procedure SettipEmc(Index: Integer; const AInteger: Integer);
    function  tipEmc_Specified(Index: Integer): boolean;
    procedure SettipEmp(Index: Integer; const AInteger: Integer);
    function  tipEmp_Specified(Index: Integer): boolean;
    procedure SettipMer(Index: Integer; const Astring: string);
    function  tipMer_Specified(Index: Integer): boolean;
    procedure SettriCof(Index: Integer; const Astring: string);
    function  triCof_Specified(Index: Integer): boolean;
    procedure SettriIcm(Index: Integer; const Astring: string);
    function  triIcm_Specified(Index: Integer): boolean;
    procedure SettriIpi(Index: Integer; const Astring: string);
    function  triIpi_Specified(Index: Integer): boolean;
    procedure SettriPis(Index: Integer; const Astring: string);
    function  triPis_Specified(Index: Integer): boolean;
    procedure SetzipCod(Index: Integer; const Astring: string);
    function  zipCod_Specified(Index: Integer): boolean;
    procedure SetzonFra(Index: Integer; const AInteger: Integer);
    function  zonFra_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property apeCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FapeCli write SetapeCli stored apeCli_Specified;
    property baiCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCli write SetbaiCli stored baiCli_Specified;
    property baiCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCob write SetbaiCob stored baiCob_Specified;
    property baiEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cadastroCEP:         Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FcadastroCEP write SetcadastroCEP stored cadastroCEP_Specified;
    property calFun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcalFun write SetcalFun stored calFun_Specified;
    property cepCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCli write SetcepCli stored cepCli_Specified;
    property cepCob:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepCob write SetcepCob stored cepCob_Specified;
    property cepEnt:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cepFre:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFre write SetcepFre stored cepFre_Specified;
    property cepIni:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cgcCob:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCob write SetcgcCob stored cgcCob_Specified;
    property cgcCpf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property cgcEnt:              Double                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCli write SetcidCli stored cidCli_Specified;
    property cidCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidCob write SetcidCob stored cidCob_Specified;
    property cidEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cliCon:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliCon write SetcliCon stored cliCon_Specified;
    property cliFor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliFor write SetcliFor stored cliFor_Specified;
    property cliPrx:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliPrx write SetcliPrx stored cliPrx_Specified;
    property cliRep:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliRep write SetcliRep stored cliRep_Specified;
    property cliTra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcliTra write SetcliTra stored cliTra_Specified;
    property clientePessoaFisica: Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FclientePessoaFisica write SetclientePessoaFisica stored clientePessoaFisica_Specified;
    property codCli:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codCnv:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCnv write SetcodCnv stored codCnv_Specified;
    property codFor:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property codGre:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodGre write SetcodGre stored codGre_Specified;
    property codMot:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMot write SetcodMot stored codMot_Specified;
    property codPai:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPai write SetcodPai stored codPai_Specified;
    property codRam:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRam write SetcodRam stored codRam_Specified;
    property codRoe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRoe write SetcodRoe stored codRoe_Specified;
    property codRtr:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRtr write SetcodRtr stored codRtr_Specified;
    property codSro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSro write SetcodSro stored codSro_Specified;
    property codSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSuf write SetcodSuf stored codSuf_Specified;
    property cplCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplCob write SetcplCob stored cplCob_Specified;
    property cplEnd:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnd write SetcplEnd stored cplEnd_Specified;
    property cplEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property cxaPst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcxaPst write SetcxaPst stored cxaPst_Specified;
    property datSuf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatSuf write SetdatSuf stored datSuf_Specified;
    property definicoesCliente:   Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente    Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdefinicoesCliente write SetdefinicoesCliente stored definicoesCliente_Specified;
    property eenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCli write SeteenCli stored eenCli_Specified;
    property eenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenCob write SeteenCob stored eenCob_Specified;
    property eenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FeenEnt write SeteenEnt stored eenEnt_Specified;
    property emaNfe:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FemaNfe write SetemaNfe stored emaNfe_Specified;
    property endCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCli write SetendCli stored endCli_Specified;
    property endCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCob write SetendCob stored endCob_Specified;
    property endEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property enderecosEntrega:    Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega     Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FenderecosEntrega write SetenderecosEntrega stored enderecosEntrega_Specified;
    property entCor:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FentCor write SetentCor stored entCor_Specified;
    property estCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCob write SetestCob stored estCob_Specified;
    property estEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property faxCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxCli write SetfaxCli stored faxCli_Specified;
    property fonCl2:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl2 write SetfonCl2 stored fonCl2_Specified;
    property fonCl3:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl3 write SetfonCl3 stored fonCl3_Specified;
    property fonCl4:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl4 write SetfonCl4 stored fonCl4_Specified;
    property fonCl5:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCl5 write SetfonCl5 stored fonCl5_Specified;
    property fonCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCli write SetfonCli stored fonCli_Specified;
    property ideCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideCli write SetideCli stored ideCli_Specified;
    property ideExt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property indCoo:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindCoo write SetindCoo stored indCoo_Specified;
    property indNif:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindNif write SetindNif stored indNif_Specified;
    property insAnp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsAnp write SetinsAnp stored insAnp_Specified;
    property insEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property insEst:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEst write SetinsEst stored insEst_Specified;
    property insMun:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsMun write SetinsMun stored insMun_Specified;
    property intNet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property limRet:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimRet write SetlimRet stored limRet_Specified;
    property marCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmarCli write SetmarCli stored marCli_Specified;
    property natCof:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatCof write SetnatCof stored natCof_Specified;
    property natPis:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatPis write SetnatPis stored natPis_Specified;
    property natRet:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnatRet write SetnatRet stored natRet_Specified;
    property nenCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCli write SetnenCli stored nenCli_Specified;
    property nenCob:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenCob write SetnenCob stored nenCob_Specified;
    property nenEnt:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property numIdf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumIdf write SetnumIdf stored numIdf_Specified;
    property obsMot:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FobsMot write SetobsMot stored obsMot_Specified;
    property perAin:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAin write SetperAin stored perAin_Specified;
    property regEst:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FregEst write SetregEst stored regEst_Specified;
    property retCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCof write SetretCof stored retCof_Specified;
    property retCsl:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretCsl write SetretCsl stored retCsl_Specified;
    property retIrf:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretIrf write SetretIrf stored retIrf_Specified;
    property retOur:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretOur write SetretOur stored retOur_Specified;
    property retPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPis write SetretPis stored retPis_Specified;
    property retPro:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FretPro write SetretPro stored retPro_Specified;
    property seqRoe:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqRoe write SetseqRoe stored seqRoe_Specified;
    property sigUfs:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigUfs write SetsigUfs stored sigUfs_Specified;
    property sitCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCli write SetsitCli stored sitCli_Specified;
    property tipAce:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipAce write SettipAce stored tipAce_Specified;
    property tipCli:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCli write SettipCli stored tipCli_Specified;
    property tipEmc:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmc write SettipEmc stored tipEmc_Specified;
    property tipEmp:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEmp write SettipEmp stored tipEmp_Specified;
    property tipMer:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipMer write SettipMer stored tipMer_Specified;
    property triCof:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriCof write SettriCof stored triCof_Specified;
    property triIcm:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIcm write SettriIcm stored triIcm_Specified;
    property triIpi:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriIpi write SettriIpi stored triIpi_Specified;
    property triPis:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtriPis write SettriPis stored triPis_Specified;
    property zipCod:              string                                                                   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzipCod write SetzipCod stored zipCod_Specified;
    property zonFra:              Integer                                                                  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FzonFra write SetzonFra stored zonFra_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesConsultarOutRetornosConsultas, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesConsultarOutRetornosConsultas = class(TRemotable)
  private
    FcgcCpf: Integer;
    FcgcCpf_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FsitCli: string;
    FsitCli_Specified: boolean;
    FtipCli: string;
    FtipCli_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const AInteger: Integer);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetsitCli(Index: Integer; const Astring: string);
    function  sitCli_Specified(Index: Integer): boolean;
    procedure SettipCli(Index: Integer; const Astring: string);
    function  tipCli_Specified(Index: Integer): boolean;
  published
    property cgcCpf: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property nomCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property sitCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCli write SetsitCli stored sitCli_Specified;
    property tipCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipCli write SettipCli stored tipCli_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5In, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5In = class(TRemotable)
  private
    FdadosGeraisCliente: Array_Of_clientesGravarClientes5InDadosGeraisCliente;
    FdadosGeraisCliente_Specified: boolean;
    FdataBuild: string;
    FdataBuild_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FidtReq: string;
    FidtReq_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    procedure SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisCliente: Array_Of_clientesGravarClientes5InDadosGeraisCliente);
    function  dadosGeraisCliente_Specified(Index: Integer): boolean;
    procedure SetdataBuild(Index: Integer; const Astring: string);
    function  dataBuild_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetidtReq(Index: Integer; const Astring: string);
    function  idtReq_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGeraisCliente: Array_Of_clientesGravarClientes5InDadosGeraisCliente  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGeraisCliente write SetdadosGeraisCliente stored dadosGeraisCliente_Specified;
    property dataBuild:          string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdataBuild write SetdataBuild stored dataBuild_Specified;
    property flowInstanceID:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property idtReq:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FidtReq write SetidtReq stored idtReq_Specified;
    property sigInt:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente = class(TRemotable)
  private
    FacePar: string;
    FacePar_Specified: boolean;
    FacrDia: Integer;
    FacrDia_Specified: boolean;
    FantDsc: string;
    FantDsc_Specified: boolean;
    FavaAti: string;
    FavaAti_Specified: boolean;
    FavaMot: Integer;
    FavaMot_Specified: boolean;
    FavaObs: string;
    FavaObs_Specified: boolean;
    FavaVlr: Double;
    FavaVlr_Specified: boolean;
    FavaVls: Double;
    FavaVls_Specified: boolean;
    FavaVlu: Double;
    FavaVlu_Specified: boolean;
    FcatCli: Integer;
    FcatCli_Specified: boolean;
    FccbCli: string;
    FccbCli_Specified: boolean;
    FcifFob: string;
    FcifFob_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
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
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFcr: string;
    FcodFcr_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMar: string;
    FcodMar_Specified: boolean;
    FcodRed: Integer;
    FcodRed_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodRve: string;
    FcodRve_Specified: boolean;
    FcodTab: string;
    FcodTab_Specified: boolean;
    FcodTic: string;
    FcodTic_Specified: boolean;
    FcodTpr: string;
    FcodTpr_Specified: boolean;
    FcodTra: Integer;
    FcodTra_Specified: boolean;
    FcodTrd: string;
    FcodTrd_Specified: boolean;
    FcodVen: Integer;
    FcodVen_Specified: boolean;
    FconFin: string;
    FconFin_Specified: boolean;
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
    FctrPad: Integer;
    FctrPad_Specified: boolean;
    FdatLim: string;
    FdatLim_Specified: boolean;
    FdatPmr: string;
    FdatPmr_Specified: boolean;
    FdiaEsp: string;
    FdiaEsp_Specified: boolean;
    FdiaMe1: Integer;
    FdiaMe1_Specified: boolean;
    FdiaMe2: Integer;
    FdiaMe2_Specified: boolean;
    FdiaMe3: Integer;
    FdiaMe3_Specified: boolean;
    FdscPrd: string;
    FdscPrd_Specified: boolean;
    FecpCnp: string;
    FecpCnp_Specified: boolean;
    FexiAge: string;
    FexiAge_Specified: boolean;
    FexiLcp: string;
    FexiLcp_Specified: boolean;
    FfveCpg: string;
    FfveCpg_Specified: boolean;
    FfveFpg: string;
    FfveFpg_Specified: boolean;
    FfveTns: string;
    FfveTns_Specified: boolean;
    FgerTcc: string;
    FgerTcc_Specified: boolean;
    FindOrf: string;
    FindOrf_Specified: boolean;
    FlimApr: string;
    FlimApr_Specified: boolean;
    FperAqa: Integer;
    FperAqa_Specified: boolean;
    FperCcr: string;
    FperCcr_Specified: boolean;
    FperCom: Integer;
    FperCom_Specified: boolean;
    FperDs1: Double;
    FperDs1_Specified: boolean;
    FperDs2: Double;
    FperDs2_Specified: boolean;
    FperDs3: Double;
    FperDs3_Specified: boolean;
    FperDs4: Double;
    FperDs4_Specified: boolean;
    FperDs5: Double;
    FperDs5_Specified: boolean;
    FperDsc: Double;
    FperDsc_Specified: boolean;
    FperEmb: Double;
    FperEmb_Specified: boolean;
    FperEnc: Double;
    FperEnc_Specified: boolean;
    FperFre: Double;
    FperFre_Specified: boolean;
    FperIss: Double;
    FperIss_Specified: boolean;
    FperOf1: Integer;
    FperOf1_Specified: boolean;
    FperOf2: Integer;
    FperOf2_Specified: boolean;
    FperOut: Double;
    FperOut_Specified: boolean;
    FperSeg: Double;
    FperSeg_Specified: boolean;
    FporNa1: string;
    FporNa1_Specified: boolean;
    FporNa2: string;
    FporNa2_Specified: boolean;
    FporSi1: string;
    FporSi1_Specified: boolean;
    FporSi2: string;
    FporSi2_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    FqtdChs: Integer;
    FqtdChs_Specified: boolean;
    FqtdDcv: Integer;
    FqtdDcv_Specified: boolean;
    FqtdPrt: Integer;
    FqtdPrt_Specified: boolean;
    FrecDtj: Integer;
    FrecDtj_Specified: boolean;
    FrecDtm: Integer;
    FrecDtm_Specified: boolean;
    FrecJmm: Double;
    FrecJmm_Specified: boolean;
    FrecMul: Double;
    FrecMul_Specified: boolean;
    FrecTjr: string;
    FrecTjr_Specified: boolean;
    FseqCob: Integer;
    FseqCob_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FvlrAcr: Double;
    FvlrAcr_Specified: boolean;
    FvlrLim: Double;
    FvlrLim_Specified: boolean;
    FvlrPrt: Double;
    FvlrPrt_Specified: boolean;
    procedure SetacePar(Index: Integer; const Astring: string);
    function  acePar_Specified(Index: Integer): boolean;
    procedure SetacrDia(Index: Integer; const AInteger: Integer);
    function  acrDia_Specified(Index: Integer): boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetavaAti(Index: Integer; const Astring: string);
    function  avaAti_Specified(Index: Integer): boolean;
    procedure SetavaMot(Index: Integer; const AInteger: Integer);
    function  avaMot_Specified(Index: Integer): boolean;
    procedure SetavaObs(Index: Integer; const Astring: string);
    function  avaObs_Specified(Index: Integer): boolean;
    procedure SetavaVlr(Index: Integer; const ADouble: Double);
    function  avaVlr_Specified(Index: Integer): boolean;
    procedure SetavaVls(Index: Integer; const ADouble: Double);
    function  avaVls_Specified(Index: Integer): boolean;
    procedure SetavaVlu(Index: Integer; const ADouble: Double);
    function  avaVlu_Specified(Index: Integer): boolean;
    procedure SetcatCli(Index: Integer; const AInteger: Integer);
    function  catCli_Specified(Index: Integer): boolean;
    procedure SetccbCli(Index: Integer; const Astring: string);
    function  ccbCli_Specified(Index: Integer): boolean;
    procedure SetcifFob(Index: Integer; const Astring: string);
    function  cifFob_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
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
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFcr(Index: Integer; const Astring: string);
    function  codFcr_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMar(Index: Integer; const Astring: string);
    function  codMar_Specified(Index: Integer): boolean;
    procedure SetcodRed(Index: Integer; const AInteger: Integer);
    function  codRed_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodRve(Index: Integer; const Astring: string);
    function  codRve_Specified(Index: Integer): boolean;
    procedure SetcodTab(Index: Integer; const Astring: string);
    function  codTab_Specified(Index: Integer): boolean;
    procedure SetcodTic(Index: Integer; const Astring: string);
    function  codTic_Specified(Index: Integer): boolean;
    procedure SetcodTpr(Index: Integer; const Astring: string);
    function  codTpr_Specified(Index: Integer): boolean;
    procedure SetcodTra(Index: Integer; const AInteger: Integer);
    function  codTra_Specified(Index: Integer): boolean;
    procedure SetcodTrd(Index: Integer; const Astring: string);
    function  codTrd_Specified(Index: Integer): boolean;
    procedure SetcodVen(Index: Integer; const AInteger: Integer);
    function  codVen_Specified(Index: Integer): boolean;
    procedure SetconFin(Index: Integer; const Astring: string);
    function  conFin_Specified(Index: Integer): boolean;
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
    procedure SetctrPad(Index: Integer; const AInteger: Integer);
    function  ctrPad_Specified(Index: Integer): boolean;
    procedure SetdatLim(Index: Integer; const Astring: string);
    function  datLim_Specified(Index: Integer): boolean;
    procedure SetdatPmr(Index: Integer; const Astring: string);
    function  datPmr_Specified(Index: Integer): boolean;
    procedure SetdiaEsp(Index: Integer; const Astring: string);
    function  diaEsp_Specified(Index: Integer): boolean;
    procedure SetdiaMe1(Index: Integer; const AInteger: Integer);
    function  diaMe1_Specified(Index: Integer): boolean;
    procedure SetdiaMe2(Index: Integer; const AInteger: Integer);
    function  diaMe2_Specified(Index: Integer): boolean;
    procedure SetdiaMe3(Index: Integer; const AInteger: Integer);
    function  diaMe3_Specified(Index: Integer): boolean;
    procedure SetdscPrd(Index: Integer; const Astring: string);
    function  dscPrd_Specified(Index: Integer): boolean;
    procedure SetecpCnp(Index: Integer; const Astring: string);
    function  ecpCnp_Specified(Index: Integer): boolean;
    procedure SetexiAge(Index: Integer; const Astring: string);
    function  exiAge_Specified(Index: Integer): boolean;
    procedure SetexiLcp(Index: Integer; const Astring: string);
    function  exiLcp_Specified(Index: Integer): boolean;
    procedure SetfveCpg(Index: Integer; const Astring: string);
    function  fveCpg_Specified(Index: Integer): boolean;
    procedure SetfveFpg(Index: Integer; const Astring: string);
    function  fveFpg_Specified(Index: Integer): boolean;
    procedure SetfveTns(Index: Integer; const Astring: string);
    function  fveTns_Specified(Index: Integer): boolean;
    procedure SetgerTcc(Index: Integer; const Astring: string);
    function  gerTcc_Specified(Index: Integer): boolean;
    procedure SetindOrf(Index: Integer; const Astring: string);
    function  indOrf_Specified(Index: Integer): boolean;
    procedure SetlimApr(Index: Integer; const Astring: string);
    function  limApr_Specified(Index: Integer): boolean;
    procedure SetperAqa(Index: Integer; const AInteger: Integer);
    function  perAqa_Specified(Index: Integer): boolean;
    procedure SetperCcr(Index: Integer; const Astring: string);
    function  perCcr_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const AInteger: Integer);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDs1(Index: Integer; const ADouble: Double);
    function  perDs1_Specified(Index: Integer): boolean;
    procedure SetperDs2(Index: Integer; const ADouble: Double);
    function  perDs2_Specified(Index: Integer): boolean;
    procedure SetperDs3(Index: Integer; const ADouble: Double);
    function  perDs3_Specified(Index: Integer): boolean;
    procedure SetperDs4(Index: Integer; const ADouble: Double);
    function  perDs4_Specified(Index: Integer): boolean;
    procedure SetperDs5(Index: Integer; const ADouble: Double);
    function  perDs5_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const ADouble: Double);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperEmb(Index: Integer; const ADouble: Double);
    function  perEmb_Specified(Index: Integer): boolean;
    procedure SetperEnc(Index: Integer; const ADouble: Double);
    function  perEnc_Specified(Index: Integer): boolean;
    procedure SetperFre(Index: Integer; const ADouble: Double);
    function  perFre_Specified(Index: Integer): boolean;
    procedure SetperIss(Index: Integer; const ADouble: Double);
    function  perIss_Specified(Index: Integer): boolean;
    procedure SetperOf1(Index: Integer; const AInteger: Integer);
    function  perOf1_Specified(Index: Integer): boolean;
    procedure SetperOf2(Index: Integer; const AInteger: Integer);
    function  perOf2_Specified(Index: Integer): boolean;
    procedure SetperOut(Index: Integer; const ADouble: Double);
    function  perOut_Specified(Index: Integer): boolean;
    procedure SetperSeg(Index: Integer; const ADouble: Double);
    function  perSeg_Specified(Index: Integer): boolean;
    procedure SetporNa1(Index: Integer; const Astring: string);
    function  porNa1_Specified(Index: Integer): boolean;
    procedure SetporNa2(Index: Integer; const Astring: string);
    function  porNa2_Specified(Index: Integer): boolean;
    procedure SetporSi1(Index: Integer; const Astring: string);
    function  porSi1_Specified(Index: Integer): boolean;
    procedure SetporSi2(Index: Integer; const Astring: string);
    function  porSi2_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure SetqtdChs(Index: Integer; const AInteger: Integer);
    function  qtdChs_Specified(Index: Integer): boolean;
    procedure SetqtdDcv(Index: Integer; const AInteger: Integer);
    function  qtdDcv_Specified(Index: Integer): boolean;
    procedure SetqtdPrt(Index: Integer; const AInteger: Integer);
    function  qtdPrt_Specified(Index: Integer): boolean;
    procedure SetrecDtj(Index: Integer; const AInteger: Integer);
    function  recDtj_Specified(Index: Integer): boolean;
    procedure SetrecDtm(Index: Integer; const AInteger: Integer);
    function  recDtm_Specified(Index: Integer): boolean;
    procedure SetrecJmm(Index: Integer; const ADouble: Double);
    function  recJmm_Specified(Index: Integer): boolean;
    procedure SetrecMul(Index: Integer; const ADouble: Double);
    function  recMul_Specified(Index: Integer): boolean;
    procedure SetrecTjr(Index: Integer; const Astring: string);
    function  recTjr_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const AInteger: Integer);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SetvlrAcr(Index: Integer; const ADouble: Double);
    function  vlrAcr_Specified(Index: Integer): boolean;
    procedure SetvlrLim(Index: Integer; const ADouble: Double);
    function  vlrLim_Specified(Index: Integer): boolean;
    procedure SetvlrPrt(Index: Integer; const ADouble: Double);
    function  vlrPrt_Specified(Index: Integer): boolean;
  published
    property acePar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacePar write SetacePar stored acePar_Specified;
    property acrDia:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacrDia write SetacrDia stored acrDia_Specified;
    property antDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property avaAti:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaAti write SetavaAti stored avaAti_Specified;
    property avaMot:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaMot write SetavaMot stored avaMot_Specified;
    property avaObs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaObs write SetavaObs stored avaObs_Specified;
    property avaVlr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlr write SetavaVlr stored avaVlr_Specified;
    property avaVls:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVls write SetavaVls stored avaVls_Specified;
    property avaVlu:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlu write SetavaVlu stored avaVlu_Specified;
    property catCli:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatCli write SetcatCli stored catCli_Specified;
    property ccbCli:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbCli write SetccbCli stored ccbCli_Specified;
    property cifFob:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcifFob write SetcifFob stored cifFob_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCpg write SetcodCpg stored codCpg_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFcr write SetcodFcr stored codFcr_Specified;
    property codFil:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codIn1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMar write SetcodMar stored codMar_Specified;
    property codRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRed write SetcodRed stored codRed_Specified;
    property codRep:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codRve:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRve write SetcodRve stored codRve_Specified;
    property codTab:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTab write SetcodTab stored codTab_Specified;
    property codTic:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTic write SetcodTic stored codTic_Specified;
    property codTpr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpr write SetcodTpr stored codTpr_Specified;
    property codTra:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTra write SetcodTra stored codTra_Specified;
    property codTrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTrd write SetcodTrd stored codTrd_Specified;
    property codVen:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodVen write SetcodVen stored codVen_Specified;
    property conFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FconFin write SetconFin stored conFin_Specified;
    property criEdv:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriEdv write SetcriEdv stored criEdv_Specified;
    property ctaAad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAad write SetctaAad stored ctaAad_Specified;
    property ctaAux:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAux write SetctaAux stored ctaAux_Specified;
    property ctaFcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFcr write SetctaFcr stored ctaFcr_Specified;
    property ctaFdv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFdv write SetctaFdv stored ctaFdv_Specified;
    property ctaRcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRcr write SetctaRcr stored ctaRcr_Specified;
    property ctaRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrPad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrPad write SetctrPad stored ctrPad_Specified;
    property datLim:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLim write SetdatLim stored datLim_Specified;
    property datPmr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPmr write SetdatPmr stored datPmr_Specified;
    property diaEsp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaEsp write SetdiaEsp stored diaEsp_Specified;
    property diaMe1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe1 write SetdiaMe1 stored diaMe1_Specified;
    property diaMe2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe2 write SetdiaMe2 stored diaMe2_Specified;
    property diaMe3:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe3 write SetdiaMe3 stored diaMe3_Specified;
    property dscPrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscPrd write SetdscPrd stored dscPrd_Specified;
    property ecpCnp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FecpCnp write SetecpCnp stored ecpCnp_Specified;
    property exiAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiAge write SetexiAge stored exiAge_Specified;
    property exiLcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiLcp write SetexiLcp stored exiLcp_Specified;
    property fveCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveCpg write SetfveCpg stored fveCpg_Specified;
    property fveFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveFpg write SetfveFpg stored fveFpg_Specified;
    property fveTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveTns write SetfveTns stored fveTns_Specified;
    property gerTcc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTcc write SetgerTcc stored gerTcc_Specified;
    property indOrf:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindOrf write SetindOrf stored indOrf_Specified;
    property limApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimApr write SetlimApr stored limApr_Specified;
    property perAqa:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAqa write SetperAqa stored perAqa_Specified;
    property perCcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCcr write SetperCcr stored perCcr_Specified;
    property perCom:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDs1:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs1 write SetperDs1 stored perDs1_Specified;
    property perDs2:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs2 write SetperDs2 stored perDs2_Specified;
    property perDs3:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs3 write SetperDs3 stored perDs3_Specified;
    property perDs4:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs4 write SetperDs4 stored perDs4_Specified;
    property perDs5:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs5 write SetperDs5 stored perDs5_Specified;
    property perDsc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perEmb:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEmb write SetperEmb stored perEmb_Specified;
    property perEnc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEnc write SetperEnc stored perEnc_Specified;
    property perFre:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFre write SetperFre stored perFre_Specified;
    property perIss:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIss write SetperIss stored perIss_Specified;
    property perOf1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf1 write SetperOf1 stored perOf1_Specified;
    property perOf2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf2 write SetperOf2 stored perOf2_Specified;
    property perOut:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOut write SetperOut stored perOut_Specified;
    property perSeg:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperSeg write SetperSeg stored perSeg_Specified;
    property porNa1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa1 write SetporNa1 stored porNa1_Specified;
    property porNa2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa2 write SetporNa2 stored porNa2_Specified;
    property porSi1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi1 write SetporSi1 stored porSi1_Specified;
    property porSi2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi2 write SetporSi2 stored porSi2_Specified;
    property prdDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property qtdChs:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdChs write SetqtdChs stored qtdChs_Specified;
    property qtdDcv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDcv write SetqtdDcv stored qtdDcv_Specified;
    property qtdPrt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdPrt write SetqtdPrt stored qtdPrt_Specified;
    property recDtj:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtj write SetrecDtj stored recDtj_Specified;
    property recDtm:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtm write SetrecDtm stored recDtm_Specified;
    property recJmm:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJmm write SetrecJmm stored recJmm_Specified;
    property recMul:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecMul write SetrecMul stored recMul_Specified;
    property recTjr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecTjr write SetrecTjr stored recTjr_Specified;
    property seqCob:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property seqEnt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property tolDsc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property vlrAcr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAcr write SetvlrAcr stored vlrAcr_Specified;
    property vlrLim:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLim write SetvlrLim stored vlrLim_Specified;
    property vlrPrt:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPrt write SetvlrPrt stored vlrPrt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5OutRetornosEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5OutRetornosEnderecosEntrega = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: string;
    FcodCli_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    FseqEnt: string;
    FseqEnt_Specified: boolean;
    FseqEnv: string;
    FseqEnv_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const Astring: string);
    function  codCli_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const Astring: string);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnv(Index: Integer; const Astring: string);
    function  seqEnv_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property retorno: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property seqEnt:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property seqEnv:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnv write SetseqEnv stored seqEnv_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesExcluirClientesIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesExcluirClientesIn = class(TRemotable)
  private
    FdadosGeraisCliente: Array_Of_clientesExcluirClientesInDadosGeraisCliente;
    FdadosGeraisCliente_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FsigInt: string;
    FsigInt_Specified: boolean;
    procedure SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesExcluirClientesInDadosGeraisCliente: Array_Of_clientesExcluirClientesInDadosGeraisCliente);
    function  dadosGeraisCliente_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetsigInt(Index: Integer; const Astring: string);
    function  sigInt_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosGeraisCliente: Array_Of_clientesExcluirClientesInDadosGeraisCliente  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosGeraisCliente write SetdadosGeraisCliente stored dadosGeraisCliente_Specified;
    property flowInstanceID:     string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:           string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property sigInt:             string                                                Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsigInt write SetsigInt stored sigInt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5OutRetornosClientes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5OutRetornosClientes = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFor:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property ideExt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega = class(TRemotable)
  private
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcepEnt: string;
    FcepEnt_Specified: boolean;
    FcgcEnt: string;
    FcgcEnt_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FiniEnt: string;
    FiniEnt_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FprxEnt: string;
    FprxEnt_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FseqEnv: string;
    FseqEnv_Specified: boolean;
    FsitReg: string;
    FsitReg_Specified: boolean;
    FtipEnt: string;
    FtipEnt_Specified: boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const Astring: string);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const Astring: string);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetiniEnt(Index: Integer; const Astring: string);
    function  iniEnt_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetprxEnt(Index: Integer; const Astring: string);
    function  prxEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnv(Index: Integer; const Astring: string);
    function  seqEnv_Specified(Index: Integer): boolean;
    procedure SetsitReg(Index: Integer; const Astring: string);
    function  sitReg_Specified(Index: Integer): boolean;
    procedure SettipEnt(Index: Integer; const Astring: string);
    function  tipEnt_Specified(Index: Integer): boolean;
  published
    property baiEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cepEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cgcEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cplEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property endEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property estEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property iniEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FiniEnt write SetiniEnt stored iniEnt_Specified;
    property insEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property nenEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property prxEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprxEnt write SetprxEnt stored prxEnt_Specified;
    property seqEnt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property seqEnv: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnv write SetseqEnv stored seqEnv_Specified;
    property sitReg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitReg write SetsitReg stored sitReg_Specified;
    property tipEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEnt write SettipEnt stored tipEnt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes5Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesGravarClientes5Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosClientes: Array_Of_clientesGravarClientes5OutRetornosClientes;
    FretornosClientes_Specified: boolean;
    FretornosEnderecosEntrega: Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega;
    FretornosEnderecosEntrega_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes5OutRetornosClientes: Array_Of_clientesGravarClientes5OutRetornosClientes);
    function  retornosClientes_Specified(Index: Integer): boolean;
    procedure SetretornosEnderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes5OutRetornosEnderecosEntrega: Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega);
    function  retornosEnderecosEntrega_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:             string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:          string                                                       Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosClientes:         Array_Of_clientesGravarClientes5OutRetornosClientes          Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosClientes write SetretornosClientes stored retornosClientes_Specified;
    property retornosEnderecosEntrega: Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosEnderecosEntrega write SetretornosEnderecosEntrega stored retornosEnderecosEntrega_Specified;
    property tipoRetorno:              Integer                                                      Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesConsultarOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesConsultarOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    FretornosConsultas: Array_Of_clientesConsultarOutRetornosConsultas;
    FretornosConsultas_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SetretornosConsultas(Index: Integer; const AArray_Of_clientesConsultarOutRetornosConsultas: Array_Of_clientesConsultarOutRetornosConsultas);
    function  retornosConsultas_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:      string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property retorno:           string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property retornosConsultas: Array_Of_clientesConsultarOutRetornosConsultas  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosConsultas write SetretornosConsultas stored retornosConsultas_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega = class(TRemotable)
  private
    FbaiEnt: string;
    FbaiEnt_Specified: boolean;
    FcepEnt: string;
    FcepEnt_Specified: boolean;
    FcgcEnt: string;
    FcgcEnt_Specified: boolean;
    FcidEnt: string;
    FcidEnt_Specified: boolean;
    FcplEnt: string;
    FcplEnt_Specified: boolean;
    FendEnt: string;
    FendEnt_Specified: boolean;
    FestEnt: string;
    FestEnt_Specified: boolean;
    FiniEnt: string;
    FiniEnt_Specified: boolean;
    FinsEnt: string;
    FinsEnt_Specified: boolean;
    FnenEnt: string;
    FnenEnt_Specified: boolean;
    FnomCli: string;
    FnomCli_Specified: boolean;
    FprxEnt: string;
    FprxEnt_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FsitReg: string;
    FsitReg_Specified: boolean;
    FtipEnt: string;
    FtipEnt_Specified: boolean;
    procedure SetbaiEnt(Index: Integer; const Astring: string);
    function  baiEnt_Specified(Index: Integer): boolean;
    procedure SetcepEnt(Index: Integer; const Astring: string);
    function  cepEnt_Specified(Index: Integer): boolean;
    procedure SetcgcEnt(Index: Integer; const Astring: string);
    function  cgcEnt_Specified(Index: Integer): boolean;
    procedure SetcidEnt(Index: Integer; const Astring: string);
    function  cidEnt_Specified(Index: Integer): boolean;
    procedure SetcplEnt(Index: Integer; const Astring: string);
    function  cplEnt_Specified(Index: Integer): boolean;
    procedure SetendEnt(Index: Integer; const Astring: string);
    function  endEnt_Specified(Index: Integer): boolean;
    procedure SetestEnt(Index: Integer; const Astring: string);
    function  estEnt_Specified(Index: Integer): boolean;
    procedure SetiniEnt(Index: Integer; const Astring: string);
    function  iniEnt_Specified(Index: Integer): boolean;
    procedure SetinsEnt(Index: Integer; const Astring: string);
    function  insEnt_Specified(Index: Integer): boolean;
    procedure SetnenEnt(Index: Integer; const Astring: string);
    function  nenEnt_Specified(Index: Integer): boolean;
    procedure SetnomCli(Index: Integer; const Astring: string);
    function  nomCli_Specified(Index: Integer): boolean;
    procedure SetprxEnt(Index: Integer; const Astring: string);
    function  prxEnt_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SetsitReg(Index: Integer; const Astring: string);
    function  sitReg_Specified(Index: Integer): boolean;
    procedure SettipEnt(Index: Integer; const Astring: string);
    function  tipEnt_Specified(Index: Integer): boolean;
  published
    property baiEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiEnt write SetbaiEnt stored baiEnt_Specified;
    property cepEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepEnt write SetcepEnt stored cepEnt_Specified;
    property cgcEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcEnt write SetcgcEnt stored cgcEnt_Specified;
    property cidEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidEnt write SetcidEnt stored cidEnt_Specified;
    property cplEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcplEnt write SetcplEnt stored cplEnt_Specified;
    property endEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendEnt write SetendEnt stored endEnt_Specified;
    property estEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestEnt write SetestEnt stored estEnt_Specified;
    property iniEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FiniEnt write SetiniEnt stored iniEnt_Specified;
    property insEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FinsEnt write SetinsEnt stored insEnt_Specified;
    property nenEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnenEnt write SetnenEnt stored nenEnt_Specified;
    property nomCli: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCli write SetnomCli stored nomCli_Specified;
    property prxEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprxEnt write SetprxEnt stored prxEnt_Specified;
    property seqEnt: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property sitReg: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitReg write SetsitReg stored sitReg_Specified;
    property tipEnt: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipEnt write SettipEnt stored tipEnt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3Out, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesGravarClientes3Out = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosClientes: Array_Of_clientesGravarClientes3OutRetornosClientes;
    FretornosClientes_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes3OutRetornosClientes: Array_Of_clientesGravarClientes3OutRetornosClientes);
    function  retornosClientes_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:     string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:  string                                               Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosClientes: Array_Of_clientesGravarClientes3OutRetornosClientes  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosClientes write SetretornosClientes stored retornosClientes_Specified;
    property tipoRetorno:      Integer                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente = class(TRemotable)
  private
    FacePar: string;
    FacePar_Specified: boolean;
    FacrDia: Integer;
    FacrDia_Specified: boolean;
    FantDsc: string;
    FantDsc_Specified: boolean;
    FavaAti: string;
    FavaAti_Specified: boolean;
    FavaMot: Integer;
    FavaMot_Specified: boolean;
    FavaObs: string;
    FavaObs_Specified: boolean;
    FavaVlr: Double;
    FavaVlr_Specified: boolean;
    FavaVls: Double;
    FavaVls_Specified: boolean;
    FavaVlu: Double;
    FavaVlu_Specified: boolean;
    FcatCli: Integer;
    FcatCli_Specified: boolean;
    FccbCli: string;
    FccbCli_Specified: boolean;
    FcifFob: string;
    FcifFob_Specified: boolean;
    FcnpjFilial: string;
    FcnpjFilial_Specified: boolean;
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
    FcodEmp: Integer;
    FcodEmp_Specified: boolean;
    FcodFcr: string;
    FcodFcr_Specified: boolean;
    FcodFil: Integer;
    FcodFil_Specified: boolean;
    FcodFpg: Integer;
    FcodFpg_Specified: boolean;
    FcodFrj: string;
    FcodFrj_Specified: boolean;
    FcodIn1: string;
    FcodIn1_Specified: boolean;
    FcodIn2: string;
    FcodIn2_Specified: boolean;
    FcodMar: string;
    FcodMar_Specified: boolean;
    FcodRed: Integer;
    FcodRed_Specified: boolean;
    FcodRep: Integer;
    FcodRep_Specified: boolean;
    FcodRve: string;
    FcodRve_Specified: boolean;
    FcodTab: string;
    FcodTab_Specified: boolean;
    FcodTic: string;
    FcodTic_Specified: boolean;
    FcodTpr: string;
    FcodTpr_Specified: boolean;
    FcodTra: Integer;
    FcodTra_Specified: boolean;
    FcodTrd: string;
    FcodTrd_Specified: boolean;
    FcodVen: Integer;
    FcodVen_Specified: boolean;
    FconFin: string;
    FconFin_Specified: boolean;
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
    FctrPad: Integer;
    FctrPad_Specified: boolean;
    FdatLim: string;
    FdatLim_Specified: boolean;
    FdatPmr: string;
    FdatPmr_Specified: boolean;
    FdiaEsp: string;
    FdiaEsp_Specified: boolean;
    FdiaMe1: Integer;
    FdiaMe1_Specified: boolean;
    FdiaMe2: Integer;
    FdiaMe2_Specified: boolean;
    FdiaMe3: Integer;
    FdiaMe3_Specified: boolean;
    FdscPrd: string;
    FdscPrd_Specified: boolean;
    FecpCnp: string;
    FecpCnp_Specified: boolean;
    FexiAge: string;
    FexiAge_Specified: boolean;
    FexiLcp: string;
    FexiLcp_Specified: boolean;
    FfveCpg: string;
    FfveCpg_Specified: boolean;
    FfveFpg: string;
    FfveFpg_Specified: boolean;
    FfveTns: string;
    FfveTns_Specified: boolean;
    FgerTcc: string;
    FgerTcc_Specified: boolean;
    FindOrf: string;
    FindOrf_Specified: boolean;
    FlimApr: string;
    FlimApr_Specified: boolean;
    FperAqa: Integer;
    FperAqa_Specified: boolean;
    FperCcr: string;
    FperCcr_Specified: boolean;
    FperCom: Integer;
    FperCom_Specified: boolean;
    FperDs1: Double;
    FperDs1_Specified: boolean;
    FperDs2: Double;
    FperDs2_Specified: boolean;
    FperDs3: Double;
    FperDs3_Specified: boolean;
    FperDs4: Double;
    FperDs4_Specified: boolean;
    FperDs5: Double;
    FperDs5_Specified: boolean;
    FperDsc: Double;
    FperDsc_Specified: boolean;
    FperEmb: Double;
    FperEmb_Specified: boolean;
    FperEnc: Double;
    FperEnc_Specified: boolean;
    FperFre: Double;
    FperFre_Specified: boolean;
    FperIss: Double;
    FperIss_Specified: boolean;
    FperOf1: Integer;
    FperOf1_Specified: boolean;
    FperOf2: Integer;
    FperOf2_Specified: boolean;
    FperOut: Double;
    FperOut_Specified: boolean;
    FperSeg: Double;
    FperSeg_Specified: boolean;
    FporNa1: string;
    FporNa1_Specified: boolean;
    FporNa2: string;
    FporNa2_Specified: boolean;
    FporSi1: string;
    FporSi1_Specified: boolean;
    FporSi2: string;
    FporSi2_Specified: boolean;
    FprdDsc: string;
    FprdDsc_Specified: boolean;
    FqtdChs: Integer;
    FqtdChs_Specified: boolean;
    FqtdDcv: Integer;
    FqtdDcv_Specified: boolean;
    FqtdPrt: Integer;
    FqtdPrt_Specified: boolean;
    FrecDtj: Integer;
    FrecDtj_Specified: boolean;
    FrecDtm: Integer;
    FrecDtm_Specified: boolean;
    FrecJmm: Double;
    FrecJmm_Specified: boolean;
    FrecMul: Double;
    FrecMul_Specified: boolean;
    FrecTjr: string;
    FrecTjr_Specified: boolean;
    FseqCob: Integer;
    FseqCob_Specified: boolean;
    FseqEnt: Integer;
    FseqEnt_Specified: boolean;
    FtolDsc: Integer;
    FtolDsc_Specified: boolean;
    FvlrAcr: Double;
    FvlrAcr_Specified: boolean;
    FvlrLim: Double;
    FvlrLim_Specified: boolean;
    FvlrPrt: Double;
    FvlrPrt_Specified: boolean;
    procedure SetacePar(Index: Integer; const Astring: string);
    function  acePar_Specified(Index: Integer): boolean;
    procedure SetacrDia(Index: Integer; const AInteger: Integer);
    function  acrDia_Specified(Index: Integer): boolean;
    procedure SetantDsc(Index: Integer; const Astring: string);
    function  antDsc_Specified(Index: Integer): boolean;
    procedure SetavaAti(Index: Integer; const Astring: string);
    function  avaAti_Specified(Index: Integer): boolean;
    procedure SetavaMot(Index: Integer; const AInteger: Integer);
    function  avaMot_Specified(Index: Integer): boolean;
    procedure SetavaObs(Index: Integer; const Astring: string);
    function  avaObs_Specified(Index: Integer): boolean;
    procedure SetavaVlr(Index: Integer; const ADouble: Double);
    function  avaVlr_Specified(Index: Integer): boolean;
    procedure SetavaVls(Index: Integer; const ADouble: Double);
    function  avaVls_Specified(Index: Integer): boolean;
    procedure SetavaVlu(Index: Integer; const ADouble: Double);
    function  avaVlu_Specified(Index: Integer): boolean;
    procedure SetcatCli(Index: Integer; const AInteger: Integer);
    function  catCli_Specified(Index: Integer): boolean;
    procedure SetccbCli(Index: Integer; const Astring: string);
    function  ccbCli_Specified(Index: Integer): boolean;
    procedure SetcifFob(Index: Integer; const Astring: string);
    function  cifFob_Specified(Index: Integer): boolean;
    procedure SetcnpjFilial(Index: Integer; const Astring: string);
    function  cnpjFilial_Specified(Index: Integer): boolean;
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
    procedure SetcodEmp(Index: Integer; const AInteger: Integer);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFcr(Index: Integer; const Astring: string);
    function  codFcr_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const AInteger: Integer);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodFpg(Index: Integer; const AInteger: Integer);
    function  codFpg_Specified(Index: Integer): boolean;
    procedure SetcodFrj(Index: Integer; const Astring: string);
    function  codFrj_Specified(Index: Integer): boolean;
    procedure SetcodIn1(Index: Integer; const Astring: string);
    function  codIn1_Specified(Index: Integer): boolean;
    procedure SetcodIn2(Index: Integer; const Astring: string);
    function  codIn2_Specified(Index: Integer): boolean;
    procedure SetcodMar(Index: Integer; const Astring: string);
    function  codMar_Specified(Index: Integer): boolean;
    procedure SetcodRed(Index: Integer; const AInteger: Integer);
    function  codRed_Specified(Index: Integer): boolean;
    procedure SetcodRep(Index: Integer; const AInteger: Integer);
    function  codRep_Specified(Index: Integer): boolean;
    procedure SetcodRve(Index: Integer; const Astring: string);
    function  codRve_Specified(Index: Integer): boolean;
    procedure SetcodTab(Index: Integer; const Astring: string);
    function  codTab_Specified(Index: Integer): boolean;
    procedure SetcodTic(Index: Integer; const Astring: string);
    function  codTic_Specified(Index: Integer): boolean;
    procedure SetcodTpr(Index: Integer; const Astring: string);
    function  codTpr_Specified(Index: Integer): boolean;
    procedure SetcodTra(Index: Integer; const AInteger: Integer);
    function  codTra_Specified(Index: Integer): boolean;
    procedure SetcodTrd(Index: Integer; const Astring: string);
    function  codTrd_Specified(Index: Integer): boolean;
    procedure SetcodVen(Index: Integer; const AInteger: Integer);
    function  codVen_Specified(Index: Integer): boolean;
    procedure SetconFin(Index: Integer; const Astring: string);
    function  conFin_Specified(Index: Integer): boolean;
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
    procedure SetctrPad(Index: Integer; const AInteger: Integer);
    function  ctrPad_Specified(Index: Integer): boolean;
    procedure SetdatLim(Index: Integer; const Astring: string);
    function  datLim_Specified(Index: Integer): boolean;
    procedure SetdatPmr(Index: Integer; const Astring: string);
    function  datPmr_Specified(Index: Integer): boolean;
    procedure SetdiaEsp(Index: Integer; const Astring: string);
    function  diaEsp_Specified(Index: Integer): boolean;
    procedure SetdiaMe1(Index: Integer; const AInteger: Integer);
    function  diaMe1_Specified(Index: Integer): boolean;
    procedure SetdiaMe2(Index: Integer; const AInteger: Integer);
    function  diaMe2_Specified(Index: Integer): boolean;
    procedure SetdiaMe3(Index: Integer; const AInteger: Integer);
    function  diaMe3_Specified(Index: Integer): boolean;
    procedure SetdscPrd(Index: Integer; const Astring: string);
    function  dscPrd_Specified(Index: Integer): boolean;
    procedure SetecpCnp(Index: Integer; const Astring: string);
    function  ecpCnp_Specified(Index: Integer): boolean;
    procedure SetexiAge(Index: Integer; const Astring: string);
    function  exiAge_Specified(Index: Integer): boolean;
    procedure SetexiLcp(Index: Integer; const Astring: string);
    function  exiLcp_Specified(Index: Integer): boolean;
    procedure SetfveCpg(Index: Integer; const Astring: string);
    function  fveCpg_Specified(Index: Integer): boolean;
    procedure SetfveFpg(Index: Integer; const Astring: string);
    function  fveFpg_Specified(Index: Integer): boolean;
    procedure SetfveTns(Index: Integer; const Astring: string);
    function  fveTns_Specified(Index: Integer): boolean;
    procedure SetgerTcc(Index: Integer; const Astring: string);
    function  gerTcc_Specified(Index: Integer): boolean;
    procedure SetindOrf(Index: Integer; const Astring: string);
    function  indOrf_Specified(Index: Integer): boolean;
    procedure SetlimApr(Index: Integer; const Astring: string);
    function  limApr_Specified(Index: Integer): boolean;
    procedure SetperAqa(Index: Integer; const AInteger: Integer);
    function  perAqa_Specified(Index: Integer): boolean;
    procedure SetperCcr(Index: Integer; const Astring: string);
    function  perCcr_Specified(Index: Integer): boolean;
    procedure SetperCom(Index: Integer; const AInteger: Integer);
    function  perCom_Specified(Index: Integer): boolean;
    procedure SetperDs1(Index: Integer; const ADouble: Double);
    function  perDs1_Specified(Index: Integer): boolean;
    procedure SetperDs2(Index: Integer; const ADouble: Double);
    function  perDs2_Specified(Index: Integer): boolean;
    procedure SetperDs3(Index: Integer; const ADouble: Double);
    function  perDs3_Specified(Index: Integer): boolean;
    procedure SetperDs4(Index: Integer; const ADouble: Double);
    function  perDs4_Specified(Index: Integer): boolean;
    procedure SetperDs5(Index: Integer; const ADouble: Double);
    function  perDs5_Specified(Index: Integer): boolean;
    procedure SetperDsc(Index: Integer; const ADouble: Double);
    function  perDsc_Specified(Index: Integer): boolean;
    procedure SetperEmb(Index: Integer; const ADouble: Double);
    function  perEmb_Specified(Index: Integer): boolean;
    procedure SetperEnc(Index: Integer; const ADouble: Double);
    function  perEnc_Specified(Index: Integer): boolean;
    procedure SetperFre(Index: Integer; const ADouble: Double);
    function  perFre_Specified(Index: Integer): boolean;
    procedure SetperIss(Index: Integer; const ADouble: Double);
    function  perIss_Specified(Index: Integer): boolean;
    procedure SetperOf1(Index: Integer; const AInteger: Integer);
    function  perOf1_Specified(Index: Integer): boolean;
    procedure SetperOf2(Index: Integer; const AInteger: Integer);
    function  perOf2_Specified(Index: Integer): boolean;
    procedure SetperOut(Index: Integer; const ADouble: Double);
    function  perOut_Specified(Index: Integer): boolean;
    procedure SetperSeg(Index: Integer; const ADouble: Double);
    function  perSeg_Specified(Index: Integer): boolean;
    procedure SetporNa1(Index: Integer; const Astring: string);
    function  porNa1_Specified(Index: Integer): boolean;
    procedure SetporNa2(Index: Integer; const Astring: string);
    function  porNa2_Specified(Index: Integer): boolean;
    procedure SetporSi1(Index: Integer; const Astring: string);
    function  porSi1_Specified(Index: Integer): boolean;
    procedure SetporSi2(Index: Integer; const Astring: string);
    function  porSi2_Specified(Index: Integer): boolean;
    procedure SetprdDsc(Index: Integer; const Astring: string);
    function  prdDsc_Specified(Index: Integer): boolean;
    procedure SetqtdChs(Index: Integer; const AInteger: Integer);
    function  qtdChs_Specified(Index: Integer): boolean;
    procedure SetqtdDcv(Index: Integer; const AInteger: Integer);
    function  qtdDcv_Specified(Index: Integer): boolean;
    procedure SetqtdPrt(Index: Integer; const AInteger: Integer);
    function  qtdPrt_Specified(Index: Integer): boolean;
    procedure SetrecDtj(Index: Integer; const AInteger: Integer);
    function  recDtj_Specified(Index: Integer): boolean;
    procedure SetrecDtm(Index: Integer; const AInteger: Integer);
    function  recDtm_Specified(Index: Integer): boolean;
    procedure SetrecJmm(Index: Integer; const ADouble: Double);
    function  recJmm_Specified(Index: Integer): boolean;
    procedure SetrecMul(Index: Integer; const ADouble: Double);
    function  recMul_Specified(Index: Integer): boolean;
    procedure SetrecTjr(Index: Integer; const Astring: string);
    function  recTjr_Specified(Index: Integer): boolean;
    procedure SetseqCob(Index: Integer; const AInteger: Integer);
    function  seqCob_Specified(Index: Integer): boolean;
    procedure SetseqEnt(Index: Integer; const AInteger: Integer);
    function  seqEnt_Specified(Index: Integer): boolean;
    procedure SettolDsc(Index: Integer; const AInteger: Integer);
    function  tolDsc_Specified(Index: Integer): boolean;
    procedure SetvlrAcr(Index: Integer; const ADouble: Double);
    function  vlrAcr_Specified(Index: Integer): boolean;
    procedure SetvlrLim(Index: Integer; const ADouble: Double);
    function  vlrLim_Specified(Index: Integer): boolean;
    procedure SetvlrPrt(Index: Integer; const ADouble: Double);
    function  vlrPrt_Specified(Index: Integer): boolean;
  published
    property acePar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacePar write SetacePar stored acePar_Specified;
    property acrDia:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FacrDia write SetacrDia stored acrDia_Specified;
    property antDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FantDsc write SetantDsc stored antDsc_Specified;
    property avaAti:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaAti write SetavaAti stored avaAti_Specified;
    property avaMot:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaMot write SetavaMot stored avaMot_Specified;
    property avaObs:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaObs write SetavaObs stored avaObs_Specified;
    property avaVlr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlr write SetavaVlr stored avaVlr_Specified;
    property avaVls:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVls write SetavaVls stored avaVls_Specified;
    property avaVlu:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FavaVlu write SetavaVlu stored avaVlu_Specified;
    property catCli:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcatCli write SetcatCli stored catCli_Specified;
    property ccbCli:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FccbCli write SetccbCli stored ccbCli_Specified;
    property cifFob:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcifFob write SetcifFob stored cifFob_Specified;
    property cnpjFilial: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcnpjFilial write SetcnpjFilial stored cnpjFilial_Specified;
    property codAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodAge write SetcodAge stored codAge_Specified;
    property codBan:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodBan write SetcodBan stored codBan_Specified;
    property codCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCpg write SetcodCpg stored codCpg_Specified;
    property codCrp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrp write SetcodCrp stored codCrp_Specified;
    property codCrt:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFcr write SetcodFcr stored codFcr_Specified;
    property codFil:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codFpg:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFpg write SetcodFpg stored codFpg_Specified;
    property codFrj:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFrj write SetcodFrj stored codFrj_Specified;
    property codIn1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn1 write SetcodIn1 stored codIn1_Specified;
    property codIn2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodIn2 write SetcodIn2 stored codIn2_Specified;
    property codMar:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodMar write SetcodMar stored codMar_Specified;
    property codRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRed write SetcodRed stored codRed_Specified;
    property codRep:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRep write SetcodRep stored codRep_Specified;
    property codRve:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRve write SetcodRve stored codRve_Specified;
    property codTab:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTab write SetcodTab stored codTab_Specified;
    property codTic:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTic write SetcodTic stored codTic_Specified;
    property codTpr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpr write SetcodTpr stored codTpr_Specified;
    property codTra:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTra write SetcodTra stored codTra_Specified;
    property codTrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTrd write SetcodTrd stored codTrd_Specified;
    property codVen:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodVen write SetcodVen stored codVen_Specified;
    property conFin:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FconFin write SetconFin stored conFin_Specified;
    property criEdv:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcriEdv write SetcriEdv stored criEdv_Specified;
    property ctaAad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAad write SetctaAad stored ctaAad_Specified;
    property ctaAux:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaAux write SetctaAux stored ctaAux_Specified;
    property ctaFcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFcr write SetctaFcr stored ctaFcr_Specified;
    property ctaFdv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaFdv write SetctaFdv stored ctaFdv_Specified;
    property ctaRcr:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRcr write SetctaRcr stored ctaRcr_Specified;
    property ctaRed:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctaRed write SetctaRed stored ctaRed_Specified;
    property ctrPad:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FctrPad write SetctrPad stored ctrPad_Specified;
    property datLim:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatLim write SetdatLim stored datLim_Specified;
    property datPmr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatPmr write SetdatPmr stored datPmr_Specified;
    property diaEsp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaEsp write SetdiaEsp stored diaEsp_Specified;
    property diaMe1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe1 write SetdiaMe1 stored diaMe1_Specified;
    property diaMe2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe2 write SetdiaMe2 stored diaMe2_Specified;
    property diaMe3:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdiaMe3 write SetdiaMe3 stored diaMe3_Specified;
    property dscPrd:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdscPrd write SetdscPrd stored dscPrd_Specified;
    property ecpCnp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FecpCnp write SetecpCnp stored ecpCnp_Specified;
    property exiAge:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiAge write SetexiAge stored exiAge_Specified;
    property exiLcp:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FexiLcp write SetexiLcp stored exiLcp_Specified;
    property fveCpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveCpg write SetfveCpg stored fveCpg_Specified;
    property fveFpg:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveFpg write SetfveFpg stored fveFpg_Specified;
    property fveTns:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfveTns write SetfveTns stored fveTns_Specified;
    property gerTcc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FgerTcc write SetgerTcc stored gerTcc_Specified;
    property indOrf:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FindOrf write SetindOrf stored indOrf_Specified;
    property limApr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FlimApr write SetlimApr stored limApr_Specified;
    property perAqa:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperAqa write SetperAqa stored perAqa_Specified;
    property perCcr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCcr write SetperCcr stored perCcr_Specified;
    property perCom:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperCom write SetperCom stored perCom_Specified;
    property perDs1:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs1 write SetperDs1 stored perDs1_Specified;
    property perDs2:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs2 write SetperDs2 stored perDs2_Specified;
    property perDs3:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs3 write SetperDs3 stored perDs3_Specified;
    property perDs4:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs4 write SetperDs4 stored perDs4_Specified;
    property perDs5:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDs5 write SetperDs5 stored perDs5_Specified;
    property perDsc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperDsc write SetperDsc stored perDsc_Specified;
    property perEmb:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEmb write SetperEmb stored perEmb_Specified;
    property perEnc:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperEnc write SetperEnc stored perEnc_Specified;
    property perFre:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperFre write SetperFre stored perFre_Specified;
    property perIss:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperIss write SetperIss stored perIss_Specified;
    property perOf1:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf1 write SetperOf1 stored perOf1_Specified;
    property perOf2:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOf2 write SetperOf2 stored perOf2_Specified;
    property perOut:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperOut write SetperOut stored perOut_Specified;
    property perSeg:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FperSeg write SetperSeg stored perSeg_Specified;
    property porNa1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa1 write SetporNa1 stored porNa1_Specified;
    property porNa2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporNa2 write SetporNa2 stored porNa2_Specified;
    property porSi1:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi1 write SetporSi1 stored porSi1_Specified;
    property porSi2:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FporSi2 write SetporSi2 stored porSi2_Specified;
    property prdDsc:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprdDsc write SetprdDsc stored prdDsc_Specified;
    property qtdChs:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdChs write SetqtdChs stored qtdChs_Specified;
    property qtdDcv:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdDcv write SetqtdDcv stored qtdDcv_Specified;
    property qtdPrt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FqtdPrt write SetqtdPrt stored qtdPrt_Specified;
    property recDtj:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtj write SetrecDtj stored recDtj_Specified;
    property recDtm:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecDtm write SetrecDtm stored recDtm_Specified;
    property recJmm:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecJmm write SetrecJmm stored recJmm_Specified;
    property recMul:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecMul write SetrecMul stored recMul_Specified;
    property recTjr:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrecTjr write SetrecTjr stored recTjr_Specified;
    property seqCob:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCob write SetseqCob stored seqCob_Specified;
    property seqEnt:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqEnt write SetseqEnt stored seqEnt_Specified;
    property tolDsc:     Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtolDsc write SettolDsc stored tolDsc_Specified;
    property vlrAcr:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrAcr write SetvlrAcr stored vlrAcr_Specified;
    property vlrLim:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrLim write SetvlrLim stored vlrLim_Specified;
    property vlrPrt:     Double   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FvlrPrt write SetvlrPrt stored vlrPrt_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3InDadosGeraisClienteCadastroCEP, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3InDadosGeraisClienteCadastroCEP = class(TRemotable)
  private
    FbaiCid: string;
    FbaiCid_Specified: boolean;
    FcepFim: string;
    FcepFim_Specified: boolean;
    FcepIni: string;
    FcepIni_Specified: boolean;
    FcepPol: string;
    FcepPol_Specified: boolean;
    FcodRai: Integer;
    FcodRai_Specified: boolean;
    FendCid: string;
    FendCid_Specified: boolean;
    FnomCid: string;
    FnomCid_Specified: boolean;
    procedure SetbaiCid(Index: Integer; const Astring: string);
    function  baiCid_Specified(Index: Integer): boolean;
    procedure SetcepFim(Index: Integer; const Astring: string);
    function  cepFim_Specified(Index: Integer): boolean;
    procedure SetcepIni(Index: Integer; const Astring: string);
    function  cepIni_Specified(Index: Integer): boolean;
    procedure SetcepPol(Index: Integer; const Astring: string);
    function  cepPol_Specified(Index: Integer): boolean;
    procedure SetcodRai(Index: Integer; const AInteger: Integer);
    function  codRai_Specified(Index: Integer): boolean;
    procedure SetendCid(Index: Integer; const Astring: string);
    function  endCid_Specified(Index: Integer): boolean;
    procedure SetnomCid(Index: Integer; const Astring: string);
    function  nomCid_Specified(Index: Integer): boolean;
  published
    property baiCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FbaiCid write SetbaiCid stored baiCid_Specified;
    property cepFim: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepFim write SetcepFim stored cepFim_Specified;
    property cepIni: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepIni write SetcepIni stored cepIni_Specified;
    property cepPol: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcepPol write SetcepPol stored cepPol_Specified;
    property codRai: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodRai write SetcodRai stored codRai_Specified;
    property endCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FendCid write SetendCid stored endCid_Specified;
    property nomCid: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCid write SetnomCid stored nomCid_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica = class(TRemotable)
  private
    FcidNat: string;
    FcidNat_Specified: boolean;
    FcodSex: string;
    FcodSex_Specified: boolean;
    FdatNas: string;
    FdatNas_Specified: boolean;
    FdatRge: string;
    FdatRge_Specified: boolean;
    FestCiv: Integer;
    FestCiv_Specified: boolean;
    FnomMae: string;
    FnomMae_Specified: boolean;
    FnomPai: string;
    FnomPai_Specified: boolean;
    FnumRge: string;
    FnumRge_Specified: boolean;
    ForgRge: string;
    ForgRge_Specified: boolean;
    FrefCm1: string;
    FrefCm1_Specified: boolean;
    procedure SetcidNat(Index: Integer; const Astring: string);
    function  cidNat_Specified(Index: Integer): boolean;
    procedure SetcodSex(Index: Integer; const Astring: string);
    function  codSex_Specified(Index: Integer): boolean;
    procedure SetdatNas(Index: Integer; const Astring: string);
    function  datNas_Specified(Index: Integer): boolean;
    procedure SetdatRge(Index: Integer; const Astring: string);
    function  datRge_Specified(Index: Integer): boolean;
    procedure SetestCiv(Index: Integer; const AInteger: Integer);
    function  estCiv_Specified(Index: Integer): boolean;
    procedure SetnomMae(Index: Integer; const Astring: string);
    function  nomMae_Specified(Index: Integer): boolean;
    procedure SetnomPai(Index: Integer; const Astring: string);
    function  nomPai_Specified(Index: Integer): boolean;
    procedure SetnumRge(Index: Integer; const Astring: string);
    function  numRge_Specified(Index: Integer): boolean;
    procedure SetorgRge(Index: Integer; const Astring: string);
    function  orgRge_Specified(Index: Integer): boolean;
    procedure SetrefCm1(Index: Integer; const Astring: string);
    function  refCm1_Specified(Index: Integer): boolean;
  published
    property cidNat: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcidNat write SetcidNat stored cidNat_Specified;
    property codSex: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSex write SetcodSex stored codSex_Specified;
    property datNas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNas write SetdatNas stored datNas_Specified;
    property datRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatRge write SetdatRge stored datRge_Specified;
    property estCiv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FestCiv write SetestCiv stored estCiv_Specified;
    property nomMae: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomMae write SetnomMae stored nomMae_Specified;
    property nomPai: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomPai write SetnomPai stored nomPai_Specified;
    property numRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumRge write SetnumRge stored numRge_Specified;
    property orgRge: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read ForgRge write SetorgRge stored orgRge_Specified;
    property refCm1: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FrefCm1 write SetrefCm1 stored refCm1_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarClientes3OutRetornosClientes, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarClientes3OutRetornosClientes = class(TRemotable)
  private
    FcgcCpf: string;
    FcgcCpf_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodFor: string;
    FcodFor_Specified: boolean;
    FideExt: string;
    FideExt_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const Astring: string);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodFor(Index: Integer; const Astring: string);
    function  codFor_Specified(Index: Integer): boolean;
    procedure SetideExt(Index: Integer; const Astring: string);
    function  ideExt_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  published
    property cgcCpf:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property codCli:  Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codFor:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFor write SetcodFor stored codFor_Specified;
    property ideExt:  string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FideExt write SetideExt stored ideExt_Specified;
    property retorno: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarContatosOutRetornosContatos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarContatosOutRetornosContatos = class(TRemotable)
  private
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    FseqCto: Integer;
    FseqCto_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
    procedure SetseqCto(Index: Integer; const AInteger: Integer);
    function  seqCto_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  published
    property codCli:      Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property retorno:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
    property seqCto:      Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FseqCto write SetseqCto stored seqCto_Specified;
    property tipoRetorno: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesConsultarIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesConsultarIn = class(TRemotable)
  private
    FcgcCpf: Integer;
    FcgcCpf_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetcgcCpf(Index: Integer; const AInteger: Integer);
    function  cgcCpf_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property cgcCpf:         Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcgcCpf write SetcgcCpf stored cgcCpf_Specified;
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarContatosOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  clientesGravarContatosOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FmensagemRetorno: string;
    FmensagemRetorno_Specified: boolean;
    FretornosContatos: Array_Of_clientesGravarContatosOutRetornosContatos;
    FretornosContatos_Specified: boolean;
    FtipoRetorno: Integer;
    FtipoRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetmensagemRetorno(Index: Integer; const Astring: string);
    function  mensagemRetorno_Specified(Index: Integer): boolean;
    procedure SetretornosContatos(Index: Integer; const AArray_Of_clientesGravarContatosOutRetornosContatos: Array_Of_clientesGravarContatosOutRetornosContatos);
    function  retornosContatos_Specified(Index: Integer): boolean;
    procedure SettipoRetorno(Index: Integer; const AInteger: Integer);
    function  tipoRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property erroExecucao:     string                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property mensagemRetorno:  string                                              Index (IS_OPTN or IS_NLBL or IS_UNQL) read FmensagemRetorno write SetmensagemRetorno stored mensagemRetorno_Specified;
    property retornosContatos: Array_Of_clientesGravarContatosOutRetornosContatos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FretornosContatos write SetretornosContatos stored retornosContatos_Specified;
    property tipoRetorno:      Integer                                             Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtipoRetorno write SettipoRetorno stored tipoRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarContatosIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarContatosIn = class(TRemotable)
  private
    FdadosContatos: Array_Of_clientesGravarContatosInDadosContatos;
    FdadosContatos_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetdadosContatos(Index: Integer; const AArray_Of_clientesGravarContatosInDadosContatos: Array_Of_clientesGravarContatosInDadosContatos);
    function  dadosContatos_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property dadosContatos:  Array_Of_clientesGravarContatosInDadosContatos  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FdadosContatos write SetdadosContatos stored dadosContatos_Specified;
    property flowInstanceID: string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                                          Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : clientesGravarContatosInDadosContatos, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  clientesGravarContatosInDadosContatos = class(TRemotable)
  private
    FcarCto: string;
    FcarCto_Specified: boolean;
    FcodCli: Integer;
    FcodCli_Specified: boolean;
    FcodNiv: Integer;
    FcodNiv_Specified: boolean;
    FdatNas: string;
    FdatNas_Specified: boolean;
    FfaxCto: string;
    FfaxCto_Specified: boolean;
    FfonCt2: string;
    FfonCt2_Specified: boolean;
    FfonCt3: string;
    FfonCt3_Specified: boolean;
    FfonCto: string;
    FfonCto_Specified: boolean;
    FhobCon: string;
    FhobCon_Specified: boolean;
    FintNet: string;
    FintNet_Specified: boolean;
    FnivCto: string;
    FnivCto_Specified: boolean;
    FnomCto: string;
    FnomCto_Specified: boolean;
    FramCt2: Integer;
    FramCt2_Specified: boolean;
    FramCt3: Integer;
    FramCt3_Specified: boolean;
    FramCto: Integer;
    FramCto_Specified: boolean;
    FsetCto: string;
    FsetCto_Specified: boolean;
    FsitCto: string;
    FsitCto_Specified: boolean;
    FtimCon: string;
    FtimCon_Specified: boolean;
    procedure SetcarCto(Index: Integer; const Astring: string);
    function  carCto_Specified(Index: Integer): boolean;
    procedure SetcodCli(Index: Integer; const AInteger: Integer);
    function  codCli_Specified(Index: Integer): boolean;
    procedure SetcodNiv(Index: Integer; const AInteger: Integer);
    function  codNiv_Specified(Index: Integer): boolean;
    procedure SetdatNas(Index: Integer; const Astring: string);
    function  datNas_Specified(Index: Integer): boolean;
    procedure SetfaxCto(Index: Integer; const Astring: string);
    function  faxCto_Specified(Index: Integer): boolean;
    procedure SetfonCt2(Index: Integer; const Astring: string);
    function  fonCt2_Specified(Index: Integer): boolean;
    procedure SetfonCt3(Index: Integer; const Astring: string);
    function  fonCt3_Specified(Index: Integer): boolean;
    procedure SetfonCto(Index: Integer; const Astring: string);
    function  fonCto_Specified(Index: Integer): boolean;
    procedure SethobCon(Index: Integer; const Astring: string);
    function  hobCon_Specified(Index: Integer): boolean;
    procedure SetintNet(Index: Integer; const Astring: string);
    function  intNet_Specified(Index: Integer): boolean;
    procedure SetnivCto(Index: Integer; const Astring: string);
    function  nivCto_Specified(Index: Integer): boolean;
    procedure SetnomCto(Index: Integer; const Astring: string);
    function  nomCto_Specified(Index: Integer): boolean;
    procedure SetramCt2(Index: Integer; const AInteger: Integer);
    function  ramCt2_Specified(Index: Integer): boolean;
    procedure SetramCt3(Index: Integer; const AInteger: Integer);
    function  ramCt3_Specified(Index: Integer): boolean;
    procedure SetramCto(Index: Integer; const AInteger: Integer);
    function  ramCto_Specified(Index: Integer): boolean;
    procedure SetsetCto(Index: Integer; const Astring: string);
    function  setCto_Specified(Index: Integer): boolean;
    procedure SetsitCto(Index: Integer; const Astring: string);
    function  sitCto_Specified(Index: Integer): boolean;
    procedure SettimCon(Index: Integer; const Astring: string);
    function  timCon_Specified(Index: Integer): boolean;
  published
    property carCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcarCto write SetcarCto stored carCto_Specified;
    property codCli: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCli write SetcodCli stored codCli_Specified;
    property codNiv: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodNiv write SetcodNiv stored codNiv_Specified;
    property datNas: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FdatNas write SetdatNas stored datNas_Specified;
    property faxCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfaxCto write SetfaxCto stored faxCto_Specified;
    property fonCt2: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCt2 write SetfonCt2 stored fonCt2_Specified;
    property fonCt3: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCt3 write SetfonCt3 stored fonCt3_Specified;
    property fonCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FfonCto write SetfonCto stored fonCto_Specified;
    property hobCon: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FhobCon write SethobCon stored hobCon_Specified;
    property intNet: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FintNet write SetintNet stored intNet_Specified;
    property nivCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnivCto write SetnivCto stored nivCto_Specified;
    property nomCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnomCto write SetnomCto stored nomCto_Specified;
    property ramCt2: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FramCt2 write SetramCt2 stored ramCt2_Specified;
    property ramCt3: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FramCt3 write SetramCt3 stored ramCt3_Specified;
    property ramCto: Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FramCto write SetramCto stored ramCto_Specified;
    property setCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsetCto write SetsetCto stored setCto_Specified;
    property sitCto: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FsitCto write SetsitCto stored sitCto_Specified;
    property timCon: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FtimCon write SettimCon stored timCon_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Synccom_senior_g5_co_ger_cad_clientesPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Synccom_senior_g5_co_ger_cad_clientesPort
  // URL       : http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_cad_clientes
  // ************************************************************************ //
  sapiens_Synccom_senior_g5_co_ger_cad_clientes = interface(IInvokable)
  ['{8CFC1089-90EA-83E9-EB73-52FFF9162CE3}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarClientes(const user: string; const password: string; const encryption: Integer; const parameters: clientesGravarClientesIn): clientesGravarClientesOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarClientes_2(const user: string; const password: string; const encryption: Integer; const parameters: clientesGravarClientes2In): clientesGravarClientes2Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarClientes_3(const user: string; const password: string; const encryption: Integer; const parameters: clientesGravarClientes3In): clientesGravarClientes3Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarClientes_4(const user: string; const password: string; const encryption: Integer; const parameters: clientesGravarClientes4In): clientesGravarClientes4Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarClientes_5(const user: string; const password: string; const encryption: Integer; const parameters: clientesGravarClientes5In): clientesGravarClientes5Out; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  Consultar(const user: string; const password: string; const encryption: Integer; const parameters: clientesConsultarIn): clientesConsultarOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GravarContatos(const user: string; const password: string; const encryption: Integer; const parameters: clientesGravarContatosIn): clientesGravarContatosOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ExcluirClientes(const user: string; const password: string; const encryption: Integer; const parameters: clientesExcluirClientesIn): clientesExcluirClientesOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  obterCliente(const user: string; const password: string; const encryption: Integer; const parameters: clientesobterClienteIn): clientesobterClienteOut; stdcall;
  end;

function Getsapiens_Synccom_senior_g5_co_ger_cad_clientes(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Synccom_senior_g5_co_ger_cad_clientes;


implementation
  uses System.SysUtils;

function Getsapiens_Synccom_senior_g5_co_ger_cad_clientes(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Synccom_senior_g5_co_ger_cad_clientes;
const
  defWSDL = 'http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_cad_clientes?wsdl';
  defURL  = 'http://senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_cad_clientes';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Synccom_senior_g5_co_ger_cad_clientesPort';
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
    Result := (RIO as sapiens_Synccom_senior_g5_co_ger_cad_clientes);
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


destructor clientesGravarClientes3In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGeraisCliente)-1 do
    System.SysUtils.FreeAndNil(FdadosGeraisCliente[I]);
  System.SetLength(FdadosGeraisCliente, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes3In.SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisCliente: Array_Of_clientesGravarClientes3InDadosGeraisCliente);
begin
  FdadosGeraisCliente := AArray_Of_clientesGravarClientes3InDadosGeraisCliente;
  FdadosGeraisCliente_Specified := True;
end;

function clientesGravarClientes3In.dadosGeraisCliente_Specified(Index: Integer): boolean;
begin
  Result := FdadosGeraisCliente_Specified;
end;

procedure clientesGravarClientes3In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function clientesGravarClientes3In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure clientesGravarClientes3In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesGravarClientes3In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesGravarClientes3In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesGravarClientes3In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesGravarClientes3In.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function clientesGravarClientes3In.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure clientesGravarClientes3In.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function clientesGravarClientes3In.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure clientesGravarClientes4OutRetornosEnderecosEntrega.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes4OutRetornosEnderecosEntrega.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes4OutRetornosEnderecosEntrega.SetcodCli(Index: Integer; const Astring: string);
begin
  FcodCli := Astring;
  FcodCli_Specified := True;
end;

function clientesGravarClientes4OutRetornosEnderecosEntrega.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes4OutRetornosEnderecosEntrega.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientes4OutRetornosEnderecosEntrega.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarClientes4OutRetornosEnderecosEntrega.SetseqEnt(Index: Integer; const Astring: string);
begin
  FseqEnt := Astring;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes4OutRetornosEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes4OutRetornosEnderecosEntrega.SetseqEnv(Index: Integer; const Astring: string);
begin
  FseqEnv := Astring;
  FseqEnv_Specified := True;
end;

function clientesGravarClientes4OutRetornosEnderecosEntrega.seqEnv_Specified(Index: Integer): boolean;
begin
  Result := FseqEnv_Specified;
end;

destructor clientesGravarClientes4In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGeraisCliente)-1 do
    System.SysUtils.FreeAndNil(FdadosGeraisCliente[I]);
  System.SetLength(FdadosGeraisCliente, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes4In.SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisCliente: Array_Of_clientesGravarClientes4InDadosGeraisCliente);
begin
  FdadosGeraisCliente := AArray_Of_clientesGravarClientes4InDadosGeraisCliente;
  FdadosGeraisCliente_Specified := True;
end;

function clientesGravarClientes4In.dadosGeraisCliente_Specified(Index: Integer): boolean;
begin
  Result := FdadosGeraisCliente_Specified;
end;

procedure clientesGravarClientes4In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function clientesGravarClientes4In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure clientesGravarClientes4In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesGravarClientes4In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesGravarClientes4In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesGravarClientes4In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesGravarClientes4In.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function clientesGravarClientes4In.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure clientesGravarClientes4In.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function clientesGravarClientes4In.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

destructor clientesGravarClientesIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGeraisCliente)-1 do
    System.SysUtils.FreeAndNil(FdadosGeraisCliente[I]);
  System.SetLength(FdadosGeraisCliente, 0);
  inherited Destroy;
end;

procedure clientesGravarClientesIn.SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisCliente: Array_Of_clientesGravarClientesInDadosGeraisCliente);
begin
  FdadosGeraisCliente := AArray_Of_clientesGravarClientesInDadosGeraisCliente;
  FdadosGeraisCliente_Specified := True;
end;

function clientesGravarClientesIn.dadosGeraisCliente_Specified(Index: Integer): boolean;
begin
  Result := FdadosGeraisCliente_Specified;
end;

procedure clientesGravarClientesIn.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function clientesGravarClientesIn.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure clientesGravarClientesIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesGravarClientesIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesGravarClientesIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesGravarClientesIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesGravarClientesIn.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function clientesGravarClientesIn.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure clientesGravarClientesIn.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function clientesGravarClientesIn.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure clientesobterClienteIn.SetcodigoCliente(Index: Integer; const AInteger: Integer);
begin
  FcodigoCliente := AInteger;
  FcodigoCliente_Specified := True;
end;

function clientesobterClienteIn.codigoCliente_Specified(Index: Integer): boolean;
begin
  Result := FcodigoCliente_Specified;
end;

procedure clientesobterClienteIn.SetcodigoEmpresa(Index: Integer; const AInteger: Integer);
begin
  FcodigoEmpresa := AInteger;
  FcodigoEmpresa_Specified := True;
end;

function clientesobterClienteIn.codigoEmpresa_Specified(Index: Integer): boolean;
begin
  Result := FcodigoEmpresa_Specified;
end;

procedure clientesobterClienteIn.SetcodigoFilial(Index: Integer; const AInteger: Integer);
begin
  FcodigoFilial := AInteger;
  FcodigoFilial_Specified := True;
end;

function clientesobterClienteIn.codigoFilial_Specified(Index: Integer): boolean;
begin
  Result := FcodigoFilial_Specified;
end;

procedure clientesobterClienteIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesobterClienteIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesobterClienteIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesobterClienteIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor clientesobterClienteOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure clientesobterClienteOut.SetbloqueiaCredito(Index: Integer; const Astring: string);
begin
  FbloqueiaCredito := Astring;
  FbloqueiaCredito_Specified := True;
end;

function clientesobterClienteOut.bloqueiaCredito_Specified(Index: Integer): boolean;
begin
  Result := FbloqueiaCredito_Specified;
end;

procedure clientesobterClienteOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesobterClienteOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesobterClienteOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesobterClienteOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesobterClienteOut.SetmotivoSituacoCliente(Index: Integer; const Astring: string);
begin
  FmotivoSituacoCliente := Astring;
  FmotivoSituacoCliente_Specified := True;
end;

function clientesobterClienteOut.motivoSituacoCliente_Specified(Index: Integer): boolean;
begin
  Result := FmotivoSituacoCliente_Specified;
end;

procedure clientesobterClienteOut.SetnomeCliente(Index: Integer; const Astring: string);
begin
  FnomeCliente := Astring;
  FnomeCliente_Specified := True;
end;

function clientesobterClienteOut.nomeCliente_Specified(Index: Integer): boolean;
begin
  Result := FnomeCliente_Specified;
end;

procedure clientesobterClienteOut.SetobservacaoMotivo(Index: Integer; const Astring: string);
begin
  FobservacaoMotivo := Astring;
  FobservacaoMotivo_Specified := True;
end;

function clientesobterClienteOut.observacaoMotivo_Specified(Index: Integer): boolean;
begin
  Result := FobservacaoMotivo_Specified;
end;

procedure clientesobterClienteOut.SetsaldoCreditos(Index: Integer; const ADouble: Double);
begin
  FsaldoCreditos := ADouble;
  FsaldoCreditos_Specified := True;
end;

function clientesobterClienteOut.saldoCreditos_Specified(Index: Integer): boolean;
begin
  Result := FsaldoCreditos_Specified;
end;

procedure clientesobterClienteOut.SetsaldoDuplicatas(Index: Integer; const ADouble: Double);
begin
  FsaldoDuplicatas := ADouble;
  FsaldoDuplicatas_Specified := True;
end;

function clientesobterClienteOut.saldoDuplicatas_Specified(Index: Integer): boolean;
begin
  Result := FsaldoDuplicatas_Specified;
end;

procedure clientesobterClienteOut.SetsaldoOutros(Index: Integer; const ADouble: Double);
begin
  FsaldoOutros := ADouble;
  FsaldoOutros_Specified := True;
end;

function clientesobterClienteOut.saldoOutros_Specified(Index: Integer): boolean;
begin
  Result := FsaldoOutros_Specified;
end;

procedure clientesobterClienteOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesobterClienteOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure clientesobterClienteOut.SetvalorLimiteCredito(Index: Integer; const ADouble: Double);
begin
  FvalorLimiteCredito := ADouble;
  FvalorLimiteCredito_Specified := True;
end;

function clientesobterClienteOut.valorLimiteCredito_Specified(Index: Integer): boolean;
begin
  Result := FvalorLimiteCredito_Specified;
end;

constructor clientesGravarClientes2Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesGravarClientes2Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosClientes)-1 do
    System.SysUtils.FreeAndNil(FretornosClientes[I]);
  System.SetLength(FretornosClientes, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes2Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesGravarClientes2Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesGravarClientes2Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesGravarClientes2Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesGravarClientes2Out.SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes2OutRetornosClientes: Array_Of_clientesGravarClientes2OutRetornosClientes);
begin
  FretornosClientes := AArray_Of_clientesGravarClientes2OutRetornosClientes;
  FretornosClientes_Specified := True;
end;

function clientesGravarClientes2Out.retornosClientes_Specified(Index: Integer): boolean;
begin
  Result := FretornosClientes_Specified;
end;

procedure clientesGravarClientes2Out.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarClientes2Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

constructor clientesGravarClientes4Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesGravarClientes4Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosClientes)-1 do
    System.SysUtils.FreeAndNil(FretornosClientes[I]);
  System.SetLength(FretornosClientes, 0);
  for I := 0 to System.Length(FretornosEnderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FretornosEnderecosEntrega[I]);
  System.SetLength(FretornosEnderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes4Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesGravarClientes4Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesGravarClientes4Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesGravarClientes4Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesGravarClientes4Out.SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes4OutRetornosClientes: Array_Of_clientesGravarClientes4OutRetornosClientes);
begin
  FretornosClientes := AArray_Of_clientesGravarClientes4OutRetornosClientes;
  FretornosClientes_Specified := True;
end;

function clientesGravarClientes4Out.retornosClientes_Specified(Index: Integer): boolean;
begin
  Result := FretornosClientes_Specified;
end;

procedure clientesGravarClientes4Out.SetretornosEnderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes4OutRetornosEnderecosEntrega: Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega);
begin
  FretornosEnderecosEntrega := AArray_Of_clientesGravarClientes4OutRetornosEnderecosEntrega;
  FretornosEnderecosEntrega_Specified := True;
end;

function clientesGravarClientes4Out.retornosEnderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FretornosEnderecosEntrega_Specified;
end;

procedure clientesGravarClientes4Out.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarClientes4Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetcepEnt(Index: Integer; const Astring: string);
begin
  FcepEnt := Astring;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetcgcEnt(Index: Integer; const Astring: string);
begin
  FcgcEnt := Astring;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetiniEnt(Index: Integer; const Astring: string);
begin
  FiniEnt := Astring;
  FiniEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.iniEnt_Specified(Index: Integer): boolean;
begin
  Result := FiniEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetprxEnt(Index: Integer; const Astring: string);
begin
  FprxEnt := Astring;
  FprxEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.prxEnt_Specified(Index: Integer): boolean;
begin
  Result := FprxEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetseqEnv(Index: Integer; const Astring: string);
begin
  FseqEnv := Astring;
  FseqEnv_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.seqEnv_Specified(Index: Integer): boolean;
begin
  Result := FseqEnv_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SetsitReg(Index: Integer; const Astring: string);
begin
  FsitReg := Astring;
  FsitReg_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.sitReg_Specified(Index: Integer): boolean;
begin
  Result := FsitReg_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.SettipEnt(Index: Integer; const Astring: string);
begin
  FtipEnt := Astring;
  FtipEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega.tipEnt_Specified(Index: Integer): boolean;
begin
  Result := FtipEnt_Specified;
end;

procedure clientesGravarClientes4OutRetornosClientes.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes4OutRetornosClientes.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes4OutRetornosClientes.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes4OutRetornosClientes.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes4OutRetornosClientes.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function clientesGravarClientes4OutRetornosClientes.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes4OutRetornosClientes.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes4OutRetornosClientes.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes4OutRetornosClientes.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientes4OutRetornosClientes.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetacePar(Index: Integer; const Astring: string);
begin
  FacePar := Astring;
  FacePar_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.acePar_Specified(Index: Integer): boolean;
begin
  Result := FacePar_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetacrDia(Index: Integer; const AInteger: Integer);
begin
  FacrDia := AInteger;
  FacrDia_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.acrDia_Specified(Index: Integer): boolean;
begin
  Result := FacrDia_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetavaAti(Index: Integer; const Astring: string);
begin
  FavaAti := Astring;
  FavaAti_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.avaAti_Specified(Index: Integer): boolean;
begin
  Result := FavaAti_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetavaMot(Index: Integer; const AInteger: Integer);
begin
  FavaMot := AInteger;
  FavaMot_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.avaMot_Specified(Index: Integer): boolean;
begin
  Result := FavaMot_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetavaObs(Index: Integer; const Astring: string);
begin
  FavaObs := Astring;
  FavaObs_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.avaObs_Specified(Index: Integer): boolean;
begin
  Result := FavaObs_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetavaVlr(Index: Integer; const ADouble: Double);
begin
  FavaVlr := ADouble;
  FavaVlr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.avaVlr_Specified(Index: Integer): boolean;
begin
  Result := FavaVlr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetavaVls(Index: Integer; const ADouble: Double);
begin
  FavaVls := ADouble;
  FavaVls_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.avaVls_Specified(Index: Integer): boolean;
begin
  Result := FavaVls_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetavaVlu(Index: Integer; const ADouble: Double);
begin
  FavaVlu := ADouble;
  FavaVlu_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.avaVlu_Specified(Index: Integer): boolean;
begin
  Result := FavaVlu_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcatCli(Index: Integer; const AInteger: Integer);
begin
  FcatCli := AInteger;
  FcatCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.catCli_Specified(Index: Integer): boolean;
begin
  Result := FcatCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetccbCli(Index: Integer; const Astring: string);
begin
  FccbCli := Astring;
  FccbCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ccbCli_Specified(Index: Integer): boolean;
begin
  Result := FccbCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcifFob(Index: Integer; const Astring: string);
begin
  FcifFob := Astring;
  FcifFob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.cifFob_Specified(Index: Integer): boolean;
begin
  Result := FcifFob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodCpg(Index: Integer; const Astring: string);
begin
  FcodCpg := Astring;
  FcodCpg_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codCpg_Specified(Index: Integer): boolean;
begin
  Result := FcodCpg_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodFcr(Index: Integer; const Astring: string);
begin
  FcodFcr := Astring;
  FcodFcr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codFcr_Specified(Index: Integer): boolean;
begin
  Result := FcodFcr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodMar(Index: Integer; const Astring: string);
begin
  FcodMar := Astring;
  FcodMar_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codMar_Specified(Index: Integer): boolean;
begin
  Result := FcodMar_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodRed(Index: Integer; const AInteger: Integer);
begin
  FcodRed := AInteger;
  FcodRed_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codRed_Specified(Index: Integer): boolean;
begin
  Result := FcodRed_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodRve(Index: Integer; const Astring: string);
begin
  FcodRve := Astring;
  FcodRve_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codRve_Specified(Index: Integer): boolean;
begin
  Result := FcodRve_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodTab(Index: Integer; const Astring: string);
begin
  FcodTab := Astring;
  FcodTab_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codTab_Specified(Index: Integer): boolean;
begin
  Result := FcodTab_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodTic(Index: Integer; const Astring: string);
begin
  FcodTic := Astring;
  FcodTic_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codTic_Specified(Index: Integer): boolean;
begin
  Result := FcodTic_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodTpr(Index: Integer; const Astring: string);
begin
  FcodTpr := Astring;
  FcodTpr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codTpr_Specified(Index: Integer): boolean;
begin
  Result := FcodTpr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodTra(Index: Integer; const AInteger: Integer);
begin
  FcodTra := AInteger;
  FcodTra_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codTra_Specified(Index: Integer): boolean;
begin
  Result := FcodTra_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodTrd(Index: Integer; const Astring: string);
begin
  FcodTrd := Astring;
  FcodTrd_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codTrd_Specified(Index: Integer): boolean;
begin
  Result := FcodTrd_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcodVen(Index: Integer; const AInteger: Integer);
begin
  FcodVen := AInteger;
  FcodVen_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.codVen_Specified(Index: Integer): boolean;
begin
  Result := FcodVen_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetconFin(Index: Integer; const Astring: string);
begin
  FconFin := Astring;
  FconFin_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.conFin_Specified(Index: Integer): boolean;
begin
  Result := FconFin_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetcriEdv(Index: Integer; const Astring: string);
begin
  FcriEdv := Astring;
  FcriEdv_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.criEdv_Specified(Index: Integer): boolean;
begin
  Result := FcriEdv_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctaAad(Index: Integer; const AInteger: Integer);
begin
  FctaAad := AInteger;
  FctaAad_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctaAad_Specified(Index: Integer): boolean;
begin
  Result := FctaAad_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctaAux(Index: Integer; const AInteger: Integer);
begin
  FctaAux := AInteger;
  FctaAux_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctaAux_Specified(Index: Integer): boolean;
begin
  Result := FctaAux_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctaFcr(Index: Integer; const AInteger: Integer);
begin
  FctaFcr := AInteger;
  FctaFcr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctaFcr_Specified(Index: Integer): boolean;
begin
  Result := FctaFcr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctaFdv(Index: Integer; const AInteger: Integer);
begin
  FctaFdv := AInteger;
  FctaFdv_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctaFdv_Specified(Index: Integer): boolean;
begin
  Result := FctaFdv_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctaRcr(Index: Integer; const AInteger: Integer);
begin
  FctaRcr := AInteger;
  FctaRcr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctaRcr_Specified(Index: Integer): boolean;
begin
  Result := FctaRcr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetctrPad(Index: Integer; const AInteger: Integer);
begin
  FctrPad := AInteger;
  FctrPad_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ctrPad_Specified(Index: Integer): boolean;
begin
  Result := FctrPad_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdatLim(Index: Integer; const Astring: string);
begin
  FdatLim := Astring;
  FdatLim_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.datLim_Specified(Index: Integer): boolean;
begin
  Result := FdatLim_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdatPmr(Index: Integer; const Astring: string);
begin
  FdatPmr := Astring;
  FdatPmr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.datPmr_Specified(Index: Integer): boolean;
begin
  Result := FdatPmr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdiaEsp(Index: Integer; const Astring: string);
begin
  FdiaEsp := Astring;
  FdiaEsp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.diaEsp_Specified(Index: Integer): boolean;
begin
  Result := FdiaEsp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdiaMe1(Index: Integer; const AInteger: Integer);
begin
  FdiaMe1 := AInteger;
  FdiaMe1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.diaMe1_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdiaMe2(Index: Integer; const AInteger: Integer);
begin
  FdiaMe2 := AInteger;
  FdiaMe2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.diaMe2_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdiaMe3(Index: Integer; const AInteger: Integer);
begin
  FdiaMe3 := AInteger;
  FdiaMe3_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.diaMe3_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe3_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetdscPrd(Index: Integer; const Astring: string);
begin
  FdscPrd := Astring;
  FdscPrd_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.dscPrd_Specified(Index: Integer): boolean;
begin
  Result := FdscPrd_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetecpCnp(Index: Integer; const Astring: string);
begin
  FecpCnp := Astring;
  FecpCnp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.ecpCnp_Specified(Index: Integer): boolean;
begin
  Result := FecpCnp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetexiAge(Index: Integer; const Astring: string);
begin
  FexiAge := Astring;
  FexiAge_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.exiAge_Specified(Index: Integer): boolean;
begin
  Result := FexiAge_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetexiLcp(Index: Integer; const Astring: string);
begin
  FexiLcp := Astring;
  FexiLcp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.exiLcp_Specified(Index: Integer): boolean;
begin
  Result := FexiLcp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetfveCpg(Index: Integer; const Astring: string);
begin
  FfveCpg := Astring;
  FfveCpg_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.fveCpg_Specified(Index: Integer): boolean;
begin
  Result := FfveCpg_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetfveFpg(Index: Integer; const Astring: string);
begin
  FfveFpg := Astring;
  FfveFpg_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.fveFpg_Specified(Index: Integer): boolean;
begin
  Result := FfveFpg_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetfveTns(Index: Integer; const Astring: string);
begin
  FfveTns := Astring;
  FfveTns_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.fveTns_Specified(Index: Integer): boolean;
begin
  Result := FfveTns_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetgerTcc(Index: Integer; const Astring: string);
begin
  FgerTcc := Astring;
  FgerTcc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.gerTcc_Specified(Index: Integer): boolean;
begin
  Result := FgerTcc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetindOrf(Index: Integer; const Astring: string);
begin
  FindOrf := Astring;
  FindOrf_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.indOrf_Specified(Index: Integer): boolean;
begin
  Result := FindOrf_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetlimApr(Index: Integer; const Astring: string);
begin
  FlimApr := Astring;
  FlimApr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.limApr_Specified(Index: Integer): boolean;
begin
  Result := FlimApr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperAqa(Index: Integer; const AInteger: Integer);
begin
  FperAqa := AInteger;
  FperAqa_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perAqa_Specified(Index: Integer): boolean;
begin
  Result := FperAqa_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperCcr(Index: Integer; const Astring: string);
begin
  FperCcr := Astring;
  FperCcr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perCcr_Specified(Index: Integer): boolean;
begin
  Result := FperCcr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperCom(Index: Integer; const AInteger: Integer);
begin
  FperCom := AInteger;
  FperCom_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperDs1(Index: Integer; const ADouble: Double);
begin
  FperDs1 := ADouble;
  FperDs1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perDs1_Specified(Index: Integer): boolean;
begin
  Result := FperDs1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperDs2(Index: Integer; const ADouble: Double);
begin
  FperDs2 := ADouble;
  FperDs2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perDs2_Specified(Index: Integer): boolean;
begin
  Result := FperDs2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperDs3(Index: Integer; const ADouble: Double);
begin
  FperDs3 := ADouble;
  FperDs3_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perDs3_Specified(Index: Integer): boolean;
begin
  Result := FperDs3_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperDs4(Index: Integer; const ADouble: Double);
begin
  FperDs4 := ADouble;
  FperDs4_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perDs4_Specified(Index: Integer): boolean;
begin
  Result := FperDs4_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperDs5(Index: Integer; const ADouble: Double);
begin
  FperDs5 := ADouble;
  FperDs5_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perDs5_Specified(Index: Integer): boolean;
begin
  Result := FperDs5_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperDsc(Index: Integer; const ADouble: Double);
begin
  FperDsc := ADouble;
  FperDsc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperEmb(Index: Integer; const ADouble: Double);
begin
  FperEmb := ADouble;
  FperEmb_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perEmb_Specified(Index: Integer): boolean;
begin
  Result := FperEmb_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperEnc(Index: Integer; const ADouble: Double);
begin
  FperEnc := ADouble;
  FperEnc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perEnc_Specified(Index: Integer): boolean;
begin
  Result := FperEnc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperFre(Index: Integer; const ADouble: Double);
begin
  FperFre := ADouble;
  FperFre_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perFre_Specified(Index: Integer): boolean;
begin
  Result := FperFre_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperIss(Index: Integer; const ADouble: Double);
begin
  FperIss := ADouble;
  FperIss_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perIss_Specified(Index: Integer): boolean;
begin
  Result := FperIss_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperOf1(Index: Integer; const AInteger: Integer);
begin
  FperOf1 := AInteger;
  FperOf1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perOf1_Specified(Index: Integer): boolean;
begin
  Result := FperOf1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperOf2(Index: Integer; const AInteger: Integer);
begin
  FperOf2 := AInteger;
  FperOf2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perOf2_Specified(Index: Integer): boolean;
begin
  Result := FperOf2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperOut(Index: Integer; const ADouble: Double);
begin
  FperOut := ADouble;
  FperOut_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perOut_Specified(Index: Integer): boolean;
begin
  Result := FperOut_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetperSeg(Index: Integer; const ADouble: Double);
begin
  FperSeg := ADouble;
  FperSeg_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.perSeg_Specified(Index: Integer): boolean;
begin
  Result := FperSeg_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetporNa1(Index: Integer; const Astring: string);
begin
  FporNa1 := Astring;
  FporNa1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.porNa1_Specified(Index: Integer): boolean;
begin
  Result := FporNa1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetporNa2(Index: Integer; const Astring: string);
begin
  FporNa2 := Astring;
  FporNa2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.porNa2_Specified(Index: Integer): boolean;
begin
  Result := FporNa2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetporSi1(Index: Integer; const Astring: string);
begin
  FporSi1 := Astring;
  FporSi1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.porSi1_Specified(Index: Integer): boolean;
begin
  Result := FporSi1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetporSi2(Index: Integer; const Astring: string);
begin
  FporSi2 := Astring;
  FporSi2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.porSi2_Specified(Index: Integer): boolean;
begin
  Result := FporSi2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetqtdChs(Index: Integer; const AInteger: Integer);
begin
  FqtdChs := AInteger;
  FqtdChs_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.qtdChs_Specified(Index: Integer): boolean;
begin
  Result := FqtdChs_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetqtdDcv(Index: Integer; const AInteger: Integer);
begin
  FqtdDcv := AInteger;
  FqtdDcv_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.qtdDcv_Specified(Index: Integer): boolean;
begin
  Result := FqtdDcv_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetqtdPrt(Index: Integer; const AInteger: Integer);
begin
  FqtdPrt := AInteger;
  FqtdPrt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.qtdPrt_Specified(Index: Integer): boolean;
begin
  Result := FqtdPrt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetrecDtj(Index: Integer; const AInteger: Integer);
begin
  FrecDtj := AInteger;
  FrecDtj_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.recDtj_Specified(Index: Integer): boolean;
begin
  Result := FrecDtj_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetrecDtm(Index: Integer; const AInteger: Integer);
begin
  FrecDtm := AInteger;
  FrecDtm_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.recDtm_Specified(Index: Integer): boolean;
begin
  Result := FrecDtm_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetrecJmm(Index: Integer; const ADouble: Double);
begin
  FrecJmm := ADouble;
  FrecJmm_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.recJmm_Specified(Index: Integer): boolean;
begin
  Result := FrecJmm_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetrecMul(Index: Integer; const ADouble: Double);
begin
  FrecMul := ADouble;
  FrecMul_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.recMul_Specified(Index: Integer): boolean;
begin
  Result := FrecMul_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetrecTjr(Index: Integer; const Astring: string);
begin
  FrecTjr := Astring;
  FrecTjr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.recTjr_Specified(Index: Integer): boolean;
begin
  Result := FrecTjr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetseqCob(Index: Integer; const AInteger: Integer);
begin
  FseqCob := AInteger;
  FseqCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetvlrAcr(Index: Integer; const ADouble: Double);
begin
  FvlrAcr := ADouble;
  FvlrAcr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.vlrAcr_Specified(Index: Integer): boolean;
begin
  Result := FvlrAcr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetvlrLim(Index: Integer; const ADouble: Double);
begin
  FvlrLim := ADouble;
  FvlrLim_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.vlrLim_Specified(Index: Integer): boolean;
begin
  Result := FvlrLim_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.SetvlrPrt(Index: Integer; const ADouble: Double);
begin
  FvlrPrt := ADouble;
  FvlrPrt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente.vlrPrt_Specified(Index: Integer): boolean;
begin
  Result := FvlrPrt_Specified;
end;

procedure clientesGravarClientes2OutRetornosClientes.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes2OutRetornosClientes.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes2OutRetornosClientes.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes2OutRetornosClientes.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes2OutRetornosClientes.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function clientesGravarClientes2OutRetornosClientes.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes2OutRetornosClientes.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes2OutRetornosClientes.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes2OutRetornosClientes.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientes2OutRetornosClientes.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

destructor clientesGravarClientes4InDadosGeraisCliente.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FcadastroCEP)-1 do
    System.SysUtils.FreeAndNil(FcadastroCEP[I]);
  System.SetLength(FcadastroCEP, 0);
  for I := 0 to System.Length(FclientePessoaFisica)-1 do
    System.SysUtils.FreeAndNil(FclientePessoaFisica[I]);
  System.SetLength(FclientePessoaFisica, 0);
  for I := 0 to System.Length(FdefinicoesCliente)-1 do
    System.SysUtils.FreeAndNil(FdefinicoesCliente[I]);
  System.SetLength(FdefinicoesCliente, 0);
  for I := 0 to System.Length(FenderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FenderecosEntrega[I]);
  System.SetLength(FenderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetapeCli(Index: Integer; const Astring: string);
begin
  FapeCli := Astring;
  FapeCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.apeCli_Specified(Index: Integer): boolean;
begin
  Result := FapeCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetbaiCli(Index: Integer; const Astring: string);
begin
  FbaiCli := Astring;
  FbaiCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.baiCli_Specified(Index: Integer): boolean;
begin
  Result := FbaiCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetbaiCob(Index: Integer; const Astring: string);
begin
  FbaiCob := Astring;
  FbaiCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.baiCob_Specified(Index: Integer): boolean;
begin
  Result := FbaiCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP);
begin
  FcadastroCEP := AArray_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP;
  FcadastroCEP_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cadastroCEP_Specified(Index: Integer): boolean;
begin
  Result := FcadastroCEP_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcalFun(Index: Integer; const Astring: string);
begin
  FcalFun := Astring;
  FcalFun_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.calFun_Specified(Index: Integer): boolean;
begin
  Result := FcalFun_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcepCli(Index: Integer; const Astring: string);
begin
  FcepCli := Astring;
  FcepCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cepCli_Specified(Index: Integer): boolean;
begin
  Result := FcepCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcepCob(Index: Integer; const AInteger: Integer);
begin
  FcepCob := AInteger;
  FcepCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cepCob_Specified(Index: Integer): boolean;
begin
  Result := FcepCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcepEnt(Index: Integer; const AInteger: Integer);
begin
  FcepEnt := AInteger;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcepFre(Index: Integer; const AInteger: Integer);
begin
  FcepFre := AInteger;
  FcepFre_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cepFre_Specified(Index: Integer): boolean;
begin
  Result := FcepFre_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcgcCob(Index: Integer; const ADouble: Double);
begin
  FcgcCob := ADouble;
  FcgcCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cgcCob_Specified(Index: Integer): boolean;
begin
  Result := FcgcCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcgcEnt(Index: Integer; const ADouble: Double);
begin
  FcgcEnt := ADouble;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcidCli(Index: Integer; const Astring: string);
begin
  FcidCli := Astring;
  FcidCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cidCli_Specified(Index: Integer): boolean;
begin
  Result := FcidCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcidCob(Index: Integer; const Astring: string);
begin
  FcidCob := Astring;
  FcidCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cidCob_Specified(Index: Integer): boolean;
begin
  Result := FcidCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcliCon(Index: Integer; const Astring: string);
begin
  FcliCon := Astring;
  FcliCon_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cliCon_Specified(Index: Integer): boolean;
begin
  Result := FcliCon_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcliFor(Index: Integer; const Astring: string);
begin
  FcliFor := Astring;
  FcliFor_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cliFor_Specified(Index: Integer): boolean;
begin
  Result := FcliFor_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcliPrx(Index: Integer; const Astring: string);
begin
  FcliPrx := Astring;
  FcliPrx_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cliPrx_Specified(Index: Integer): boolean;
begin
  Result := FcliPrx_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcliRep(Index: Integer; const AInteger: Integer);
begin
  FcliRep := AInteger;
  FcliRep_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cliRep_Specified(Index: Integer): boolean;
begin
  Result := FcliRep_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcliTra(Index: Integer; const AInteger: Integer);
begin
  FcliTra := AInteger;
  FcliTra_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cliTra_Specified(Index: Integer): boolean;
begin
  Result := FcliTra_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica);
begin
  FclientePessoaFisica := AArray_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica;
  FclientePessoaFisica_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.clientePessoaFisica_Specified(Index: Integer): boolean;
begin
  Result := FclientePessoaFisica_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodGre(Index: Integer; const Astring: string);
begin
  FcodGre := Astring;
  FcodGre_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codGre_Specified(Index: Integer): boolean;
begin
  Result := FcodGre_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodMot(Index: Integer; const AInteger: Integer);
begin
  FcodMot := AInteger;
  FcodMot_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codMot_Specified(Index: Integer): boolean;
begin
  Result := FcodMot_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodPai(Index: Integer; const Astring: string);
begin
  FcodPai := Astring;
  FcodPai_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codPai_Specified(Index: Integer): boolean;
begin
  Result := FcodPai_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodRam(Index: Integer; const Astring: string);
begin
  FcodRam := Astring;
  FcodRam_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codRam_Specified(Index: Integer): boolean;
begin
  Result := FcodRam_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodRoe(Index: Integer; const Astring: string);
begin
  FcodRoe := Astring;
  FcodRoe_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codRoe_Specified(Index: Integer): boolean;
begin
  Result := FcodRoe_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodRtr(Index: Integer; const AInteger: Integer);
begin
  FcodRtr := AInteger;
  FcodRtr_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codRtr_Specified(Index: Integer): boolean;
begin
  Result := FcodRtr_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodSro(Index: Integer; const Astring: string);
begin
  FcodSro := Astring;
  FcodSro_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codSro_Specified(Index: Integer): boolean;
begin
  Result := FcodSro_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcodSuf(Index: Integer; const Astring: string);
begin
  FcodSuf := Astring;
  FcodSuf_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.codSuf_Specified(Index: Integer): boolean;
begin
  Result := FcodSuf_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcplCob(Index: Integer; const Astring: string);
begin
  FcplCob := Astring;
  FcplCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cplCob_Specified(Index: Integer): boolean;
begin
  Result := FcplCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcplEnd(Index: Integer; const Astring: string);
begin
  FcplEnd := Astring;
  FcplEnd_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cplEnd_Specified(Index: Integer): boolean;
begin
  Result := FcplEnd_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetcxaPst(Index: Integer; const AInteger: Integer);
begin
  FcxaPst := AInteger;
  FcxaPst_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.cxaPst_Specified(Index: Integer): boolean;
begin
  Result := FcxaPst_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetdatSuf(Index: Integer; const Astring: string);
begin
  FdatSuf := Astring;
  FdatSuf_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.datSuf_Specified(Index: Integer): boolean;
begin
  Result := FdatSuf_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente);
begin
  FdefinicoesCliente := AArray_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente;
  FdefinicoesCliente_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.definicoesCliente_Specified(Index: Integer): boolean;
begin
  Result := FdefinicoesCliente_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SeteenCli(Index: Integer; const Astring: string);
begin
  FeenCli := Astring;
  FeenCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.eenCli_Specified(Index: Integer): boolean;
begin
  Result := FeenCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SeteenCob(Index: Integer; const Astring: string);
begin
  FeenCob := Astring;
  FeenCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.eenCob_Specified(Index: Integer): boolean;
begin
  Result := FeenCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SeteenEnt(Index: Integer; const Astring: string);
begin
  FeenEnt := Astring;
  FeenEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.eenEnt_Specified(Index: Integer): boolean;
begin
  Result := FeenEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetemaNfe(Index: Integer; const Astring: string);
begin
  FemaNfe := Astring;
  FemaNfe_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.emaNfe_Specified(Index: Integer): boolean;
begin
  Result := FemaNfe_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetendCli(Index: Integer; const Astring: string);
begin
  FendCli := Astring;
  FendCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.endCli_Specified(Index: Integer): boolean;
begin
  Result := FendCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetendCob(Index: Integer; const Astring: string);
begin
  FendCob := Astring;
  FendCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.endCob_Specified(Index: Integer): boolean;
begin
  Result := FendCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega);
begin
  FenderecosEntrega := AArray_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega;
  FenderecosEntrega_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.enderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FenderecosEntrega_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetentCor(Index: Integer; const Astring: string);
begin
  FentCor := Astring;
  FentCor_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.entCor_Specified(Index: Integer): boolean;
begin
  Result := FentCor_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetestCob(Index: Integer; const Astring: string);
begin
  FestCob := Astring;
  FestCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.estCob_Specified(Index: Integer): boolean;
begin
  Result := FestCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetfaxCli(Index: Integer; const Astring: string);
begin
  FfaxCli := Astring;
  FfaxCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.faxCli_Specified(Index: Integer): boolean;
begin
  Result := FfaxCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetfonCl2(Index: Integer; const Astring: string);
begin
  FfonCl2 := Astring;
  FfonCl2_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.fonCl2_Specified(Index: Integer): boolean;
begin
  Result := FfonCl2_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetfonCl3(Index: Integer; const Astring: string);
begin
  FfonCl3 := Astring;
  FfonCl3_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.fonCl3_Specified(Index: Integer): boolean;
begin
  Result := FfonCl3_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetfonCl4(Index: Integer; const Astring: string);
begin
  FfonCl4 := Astring;
  FfonCl4_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.fonCl4_Specified(Index: Integer): boolean;
begin
  Result := FfonCl4_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetfonCl5(Index: Integer; const Astring: string);
begin
  FfonCl5 := Astring;
  FfonCl5_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.fonCl5_Specified(Index: Integer): boolean;
begin
  Result := FfonCl5_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetfonCli(Index: Integer; const Astring: string);
begin
  FfonCli := Astring;
  FfonCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.fonCli_Specified(Index: Integer): boolean;
begin
  Result := FfonCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetideCli(Index: Integer; const Astring: string);
begin
  FideCli := Astring;
  FideCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.ideCli_Specified(Index: Integer): boolean;
begin
  Result := FideCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetindCoo(Index: Integer; const Astring: string);
begin
  FindCoo := Astring;
  FindCoo_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.indCoo_Specified(Index: Integer): boolean;
begin
  Result := FindCoo_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetinsAnp(Index: Integer; const AInteger: Integer);
begin
  FinsAnp := AInteger;
  FinsAnp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.insAnp_Specified(Index: Integer): boolean;
begin
  Result := FinsAnp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetinsEst(Index: Integer; const Astring: string);
begin
  FinsEst := Astring;
  FinsEst_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.insEst_Specified(Index: Integer): boolean;
begin
  Result := FinsEst_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetinsMun(Index: Integer; const Astring: string);
begin
  FinsMun := Astring;
  FinsMun_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.insMun_Specified(Index: Integer): boolean;
begin
  Result := FinsMun_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetlimRet(Index: Integer; const Astring: string);
begin
  FlimRet := Astring;
  FlimRet_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.limRet_Specified(Index: Integer): boolean;
begin
  Result := FlimRet_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetmarCli(Index: Integer; const Astring: string);
begin
  FmarCli := Astring;
  FmarCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.marCli_Specified(Index: Integer): boolean;
begin
  Result := FmarCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnatCof(Index: Integer; const AInteger: Integer);
begin
  FnatCof := AInteger;
  FnatCof_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.natCof_Specified(Index: Integer): boolean;
begin
  Result := FnatCof_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnatPis(Index: Integer; const AInteger: Integer);
begin
  FnatPis := AInteger;
  FnatPis_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.natPis_Specified(Index: Integer): boolean;
begin
  Result := FnatPis_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnatRet(Index: Integer; const AInteger: Integer);
begin
  FnatRet := AInteger;
  FnatRet_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.natRet_Specified(Index: Integer): boolean;
begin
  Result := FnatRet_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnenCli(Index: Integer; const Astring: string);
begin
  FnenCli := Astring;
  FnenCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.nenCli_Specified(Index: Integer): boolean;
begin
  Result := FnenCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnenCob(Index: Integer; const Astring: string);
begin
  FnenCob := Astring;
  FnenCob_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.nenCob_Specified(Index: Integer): boolean;
begin
  Result := FnenCob_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetnumIdf(Index: Integer; const Astring: string);
begin
  FnumIdf := Astring;
  FnumIdf_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.numIdf_Specified(Index: Integer): boolean;
begin
  Result := FnumIdf_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetobsMot(Index: Integer; const Astring: string);
begin
  FobsMot := Astring;
  FobsMot_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.obsMot_Specified(Index: Integer): boolean;
begin
  Result := FobsMot_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetperAin(Index: Integer; const AInteger: Integer);
begin
  FperAin := AInteger;
  FperAin_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.perAin_Specified(Index: Integer): boolean;
begin
  Result := FperAin_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetregEst(Index: Integer; const AInteger: Integer);
begin
  FregEst := AInteger;
  FregEst_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.regEst_Specified(Index: Integer): boolean;
begin
  Result := FregEst_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetretCof(Index: Integer; const Astring: string);
begin
  FretCof := Astring;
  FretCof_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.retCof_Specified(Index: Integer): boolean;
begin
  Result := FretCof_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetretCsl(Index: Integer; const Astring: string);
begin
  FretCsl := Astring;
  FretCsl_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.retCsl_Specified(Index: Integer): boolean;
begin
  Result := FretCsl_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetretIrf(Index: Integer; const Astring: string);
begin
  FretIrf := Astring;
  FretIrf_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.retIrf_Specified(Index: Integer): boolean;
begin
  Result := FretIrf_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetretOur(Index: Integer; const Astring: string);
begin
  FretOur := Astring;
  FretOur_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.retOur_Specified(Index: Integer): boolean;
begin
  Result := FretOur_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetretPis(Index: Integer; const Astring: string);
begin
  FretPis := Astring;
  FretPis_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.retPis_Specified(Index: Integer): boolean;
begin
  Result := FretPis_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetretPro(Index: Integer; const Astring: string);
begin
  FretPro := Astring;
  FretPro_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.retPro_Specified(Index: Integer): boolean;
begin
  Result := FretPro_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetseqRoe(Index: Integer; const AInteger: Integer);
begin
  FseqRoe := AInteger;
  FseqRoe_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.seqRoe_Specified(Index: Integer): boolean;
begin
  Result := FseqRoe_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetsigUfs(Index: Integer; const Astring: string);
begin
  FsigUfs := Astring;
  FsigUfs_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.sigUfs_Specified(Index: Integer): boolean;
begin
  Result := FsigUfs_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetsitCli(Index: Integer; const Astring: string);
begin
  FsitCli := Astring;
  FsitCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.sitCli_Specified(Index: Integer): boolean;
begin
  Result := FsitCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettipAce(Index: Integer; const AInteger: Integer);
begin
  FtipAce := AInteger;
  FtipAce_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.tipAce_Specified(Index: Integer): boolean;
begin
  Result := FtipAce_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettipCli(Index: Integer; const Astring: string);
begin
  FtipCli := Astring;
  FtipCli_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.tipCli_Specified(Index: Integer): boolean;
begin
  Result := FtipCli_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettipEmc(Index: Integer; const AInteger: Integer);
begin
  FtipEmc := AInteger;
  FtipEmc_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.tipEmc_Specified(Index: Integer): boolean;
begin
  Result := FtipEmc_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettipEmp(Index: Integer; const AInteger: Integer);
begin
  FtipEmp := AInteger;
  FtipEmp_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.tipEmp_Specified(Index: Integer): boolean;
begin
  Result := FtipEmp_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettipMer(Index: Integer; const Astring: string);
begin
  FtipMer := Astring;
  FtipMer_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.tipMer_Specified(Index: Integer): boolean;
begin
  Result := FtipMer_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettriCof(Index: Integer; const Astring: string);
begin
  FtriCof := Astring;
  FtriCof_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.triCof_Specified(Index: Integer): boolean;
begin
  Result := FtriCof_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettriIcm(Index: Integer; const Astring: string);
begin
  FtriIcm := Astring;
  FtriIcm_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.triIcm_Specified(Index: Integer): boolean;
begin
  Result := FtriIcm_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettriIpi(Index: Integer; const Astring: string);
begin
  FtriIpi := Astring;
  FtriIpi_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.triIpi_Specified(Index: Integer): boolean;
begin
  Result := FtriIpi_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SettriPis(Index: Integer; const Astring: string);
begin
  FtriPis := Astring;
  FtriPis_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.triPis_Specified(Index: Integer): boolean;
begin
  Result := FtriPis_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetzipCod(Index: Integer; const Astring: string);
begin
  FzipCod := Astring;
  FzipCod_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.zipCod_Specified(Index: Integer): boolean;
begin
  Result := FzipCod_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisCliente.SetzonFra(Index: Integer; const AInteger: Integer);
begin
  FzonFra := AInteger;
  FzonFra_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisCliente.zonFra_Specified(Index: Integer): boolean;
begin
  Result := FzonFra_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetcidNat(Index: Integer; const Astring: string);
begin
  FcidNat := Astring;
  FcidNat_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.cidNat_Specified(Index: Integer): boolean;
begin
  Result := FcidNat_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetcodSex(Index: Integer; const Astring: string);
begin
  FcodSex := Astring;
  FcodSex_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.codSex_Specified(Index: Integer): boolean;
begin
  Result := FcodSex_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetdatNas(Index: Integer; const Astring: string);
begin
  FdatNas := Astring;
  FdatNas_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.datNas_Specified(Index: Integer): boolean;
begin
  Result := FdatNas_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetdatRge(Index: Integer; const Astring: string);
begin
  FdatRge := Astring;
  FdatRge_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.datRge_Specified(Index: Integer): boolean;
begin
  Result := FdatRge_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetestCiv(Index: Integer; const AInteger: Integer);
begin
  FestCiv := AInteger;
  FestCiv_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.estCiv_Specified(Index: Integer): boolean;
begin
  Result := FestCiv_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetnomMae(Index: Integer; const Astring: string);
begin
  FnomMae := Astring;
  FnomMae_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.nomMae_Specified(Index: Integer): boolean;
begin
  Result := FnomMae_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetnomPai(Index: Integer; const Astring: string);
begin
  FnomPai := Astring;
  FnomPai_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.nomPai_Specified(Index: Integer): boolean;
begin
  Result := FnomPai_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetnumRge(Index: Integer; const Astring: string);
begin
  FnumRge := Astring;
  FnumRge_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.numRge_Specified(Index: Integer): boolean;
begin
  Result := FnumRge_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetorgRge(Index: Integer; const Astring: string);
begin
  ForgRge := Astring;
  ForgRge_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.orgRge_Specified(Index: Integer): boolean;
begin
  Result := ForgRge_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.SetrefCm1(Index: Integer; const Astring: string);
begin
  FrefCm1 := Astring;
  FrefCm1_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica.refCm1_Specified(Index: Integer): boolean;
begin
  Result := FrefCm1_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetbaiCid(Index: Integer; const Astring: string);
begin
  FbaiCid := Astring;
  FbaiCid_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.baiCid_Specified(Index: Integer): boolean;
begin
  Result := FbaiCid_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetcepFim(Index: Integer; const Astring: string);
begin
  FcepFim := Astring;
  FcepFim_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.cepFim_Specified(Index: Integer): boolean;
begin
  Result := FcepFim_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetcepPol(Index: Integer; const Astring: string);
begin
  FcepPol := Astring;
  FcepPol_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.cepPol_Specified(Index: Integer): boolean;
begin
  Result := FcepPol_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetcodRai(Index: Integer; const AInteger: Integer);
begin
  FcodRai := AInteger;
  FcodRai_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.codRai_Specified(Index: Integer): boolean;
begin
  Result := FcodRai_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetendCid(Index: Integer; const Astring: string);
begin
  FendCid := Astring;
  FendCid_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.endCid_Specified(Index: Integer): boolean;
begin
  Result := FendCid_Specified;
end;

procedure clientesGravarClientes4InDadosGeraisClienteCadastroCEP.SetnomCid(Index: Integer; const Astring: string);
begin
  FnomCid := Astring;
  FnomCid_Specified := True;
end;

function clientesGravarClientes4InDadosGeraisClienteCadastroCEP.nomCid_Specified(Index: Integer): boolean;
begin
  Result := FnomCid_Specified;
end;

procedure clientesExcluirClientesInDadosGeraisCliente.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesExcluirClientesInDadosGeraisCliente.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetcepEnt(Index: Integer; const Astring: string);
begin
  FcepEnt := Astring;
  FcepEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetcgcEnt(Index: Integer; const Astring: string);
begin
  FcgcEnt := Astring;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetiniEnt(Index: Integer; const Astring: string);
begin
  FiniEnt := Astring;
  FiniEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.iniEnt_Specified(Index: Integer): boolean;
begin
  Result := FiniEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetprxEnt(Index: Integer; const Astring: string);
begin
  FprxEnt := Astring;
  FprxEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.prxEnt_Specified(Index: Integer): boolean;
begin
  Result := FprxEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.SetsitReg(Index: Integer; const Astring: string);
begin
  FsitReg := Astring;
  FsitReg_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteEnderecosEntrega.sitReg_Specified(Index: Integer): boolean;
begin
  Result := FsitReg_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetacePar(Index: Integer; const Astring: string);
begin
  FacePar := Astring;
  FacePar_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.acePar_Specified(Index: Integer): boolean;
begin
  Result := FacePar_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetacrDia(Index: Integer; const AInteger: Integer);
begin
  FacrDia := AInteger;
  FacrDia_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.acrDia_Specified(Index: Integer): boolean;
begin
  Result := FacrDia_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetavaAti(Index: Integer; const Astring: string);
begin
  FavaAti := Astring;
  FavaAti_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.avaAti_Specified(Index: Integer): boolean;
begin
  Result := FavaAti_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetavaMot(Index: Integer; const AInteger: Integer);
begin
  FavaMot := AInteger;
  FavaMot_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.avaMot_Specified(Index: Integer): boolean;
begin
  Result := FavaMot_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetavaObs(Index: Integer; const Astring: string);
begin
  FavaObs := Astring;
  FavaObs_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.avaObs_Specified(Index: Integer): boolean;
begin
  Result := FavaObs_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetavaVlr(Index: Integer; const ADouble: Double);
begin
  FavaVlr := ADouble;
  FavaVlr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.avaVlr_Specified(Index: Integer): boolean;
begin
  Result := FavaVlr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetavaVls(Index: Integer; const ADouble: Double);
begin
  FavaVls := ADouble;
  FavaVls_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.avaVls_Specified(Index: Integer): boolean;
begin
  Result := FavaVls_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetavaVlu(Index: Integer; const ADouble: Double);
begin
  FavaVlu := ADouble;
  FavaVlu_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.avaVlu_Specified(Index: Integer): boolean;
begin
  Result := FavaVlu_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcatCli(Index: Integer; const AInteger: Integer);
begin
  FcatCli := AInteger;
  FcatCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.catCli_Specified(Index: Integer): boolean;
begin
  Result := FcatCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetccbCli(Index: Integer; const Astring: string);
begin
  FccbCli := Astring;
  FccbCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ccbCli_Specified(Index: Integer): boolean;
begin
  Result := FccbCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcifFob(Index: Integer; const Astring: string);
begin
  FcifFob := Astring;
  FcifFob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.cifFob_Specified(Index: Integer): boolean;
begin
  Result := FcifFob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodCpg(Index: Integer; const Astring: string);
begin
  FcodCpg := Astring;
  FcodCpg_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codCpg_Specified(Index: Integer): boolean;
begin
  Result := FcodCpg_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodFcr(Index: Integer; const Astring: string);
begin
  FcodFcr := Astring;
  FcodFcr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codFcr_Specified(Index: Integer): boolean;
begin
  Result := FcodFcr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodMar(Index: Integer; const Astring: string);
begin
  FcodMar := Astring;
  FcodMar_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codMar_Specified(Index: Integer): boolean;
begin
  Result := FcodMar_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodRed(Index: Integer; const AInteger: Integer);
begin
  FcodRed := AInteger;
  FcodRed_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codRed_Specified(Index: Integer): boolean;
begin
  Result := FcodRed_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodRve(Index: Integer; const Astring: string);
begin
  FcodRve := Astring;
  FcodRve_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codRve_Specified(Index: Integer): boolean;
begin
  Result := FcodRve_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodTab(Index: Integer; const Astring: string);
begin
  FcodTab := Astring;
  FcodTab_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codTab_Specified(Index: Integer): boolean;
begin
  Result := FcodTab_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodTic(Index: Integer; const Astring: string);
begin
  FcodTic := Astring;
  FcodTic_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codTic_Specified(Index: Integer): boolean;
begin
  Result := FcodTic_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodTpr(Index: Integer; const Astring: string);
begin
  FcodTpr := Astring;
  FcodTpr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codTpr_Specified(Index: Integer): boolean;
begin
  Result := FcodTpr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodTra(Index: Integer; const AInteger: Integer);
begin
  FcodTra := AInteger;
  FcodTra_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codTra_Specified(Index: Integer): boolean;
begin
  Result := FcodTra_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodTrd(Index: Integer; const Astring: string);
begin
  FcodTrd := Astring;
  FcodTrd_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codTrd_Specified(Index: Integer): boolean;
begin
  Result := FcodTrd_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcodVen(Index: Integer; const AInteger: Integer);
begin
  FcodVen := AInteger;
  FcodVen_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.codVen_Specified(Index: Integer): boolean;
begin
  Result := FcodVen_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetconFin(Index: Integer; const Astring: string);
begin
  FconFin := Astring;
  FconFin_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.conFin_Specified(Index: Integer): boolean;
begin
  Result := FconFin_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetcriEdv(Index: Integer; const Astring: string);
begin
  FcriEdv := Astring;
  FcriEdv_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.criEdv_Specified(Index: Integer): boolean;
begin
  Result := FcriEdv_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctaAad(Index: Integer; const AInteger: Integer);
begin
  FctaAad := AInteger;
  FctaAad_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctaAad_Specified(Index: Integer): boolean;
begin
  Result := FctaAad_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctaAux(Index: Integer; const AInteger: Integer);
begin
  FctaAux := AInteger;
  FctaAux_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctaAux_Specified(Index: Integer): boolean;
begin
  Result := FctaAux_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctaFcr(Index: Integer; const AInteger: Integer);
begin
  FctaFcr := AInteger;
  FctaFcr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctaFcr_Specified(Index: Integer): boolean;
begin
  Result := FctaFcr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctaFdv(Index: Integer; const AInteger: Integer);
begin
  FctaFdv := AInteger;
  FctaFdv_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctaFdv_Specified(Index: Integer): boolean;
begin
  Result := FctaFdv_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctaRcr(Index: Integer; const AInteger: Integer);
begin
  FctaRcr := AInteger;
  FctaRcr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctaRcr_Specified(Index: Integer): boolean;
begin
  Result := FctaRcr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetctrPad(Index: Integer; const AInteger: Integer);
begin
  FctrPad := AInteger;
  FctrPad_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ctrPad_Specified(Index: Integer): boolean;
begin
  Result := FctrPad_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdatLim(Index: Integer; const Astring: string);
begin
  FdatLim := Astring;
  FdatLim_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.datLim_Specified(Index: Integer): boolean;
begin
  Result := FdatLim_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdatPmr(Index: Integer; const Astring: string);
begin
  FdatPmr := Astring;
  FdatPmr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.datPmr_Specified(Index: Integer): boolean;
begin
  Result := FdatPmr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdiaEsp(Index: Integer; const Astring: string);
begin
  FdiaEsp := Astring;
  FdiaEsp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.diaEsp_Specified(Index: Integer): boolean;
begin
  Result := FdiaEsp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdiaMe1(Index: Integer; const AInteger: Integer);
begin
  FdiaMe1 := AInteger;
  FdiaMe1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.diaMe1_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe1_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdiaMe2(Index: Integer; const AInteger: Integer);
begin
  FdiaMe2 := AInteger;
  FdiaMe2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.diaMe2_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdiaMe3(Index: Integer; const AInteger: Integer);
begin
  FdiaMe3 := AInteger;
  FdiaMe3_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.diaMe3_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe3_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetdscPrd(Index: Integer; const Astring: string);
begin
  FdscPrd := Astring;
  FdscPrd_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.dscPrd_Specified(Index: Integer): boolean;
begin
  Result := FdscPrd_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetecpCnp(Index: Integer; const Astring: string);
begin
  FecpCnp := Astring;
  FecpCnp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.ecpCnp_Specified(Index: Integer): boolean;
begin
  Result := FecpCnp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetexiAge(Index: Integer; const Astring: string);
begin
  FexiAge := Astring;
  FexiAge_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.exiAge_Specified(Index: Integer): boolean;
begin
  Result := FexiAge_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetexiLcp(Index: Integer; const Astring: string);
begin
  FexiLcp := Astring;
  FexiLcp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.exiLcp_Specified(Index: Integer): boolean;
begin
  Result := FexiLcp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetfveCpg(Index: Integer; const Astring: string);
begin
  FfveCpg := Astring;
  FfveCpg_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.fveCpg_Specified(Index: Integer): boolean;
begin
  Result := FfveCpg_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetfveFpg(Index: Integer; const Astring: string);
begin
  FfveFpg := Astring;
  FfveFpg_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.fveFpg_Specified(Index: Integer): boolean;
begin
  Result := FfveFpg_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetfveTns(Index: Integer; const Astring: string);
begin
  FfveTns := Astring;
  FfveTns_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.fveTns_Specified(Index: Integer): boolean;
begin
  Result := FfveTns_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetgerTcc(Index: Integer; const Astring: string);
begin
  FgerTcc := Astring;
  FgerTcc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.gerTcc_Specified(Index: Integer): boolean;
begin
  Result := FgerTcc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetindOrf(Index: Integer; const Astring: string);
begin
  FindOrf := Astring;
  FindOrf_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.indOrf_Specified(Index: Integer): boolean;
begin
  Result := FindOrf_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetlimApr(Index: Integer; const Astring: string);
begin
  FlimApr := Astring;
  FlimApr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.limApr_Specified(Index: Integer): boolean;
begin
  Result := FlimApr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperAqa(Index: Integer; const AInteger: Integer);
begin
  FperAqa := AInteger;
  FperAqa_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perAqa_Specified(Index: Integer): boolean;
begin
  Result := FperAqa_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperCcr(Index: Integer; const Astring: string);
begin
  FperCcr := Astring;
  FperCcr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perCcr_Specified(Index: Integer): boolean;
begin
  Result := FperCcr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperCom(Index: Integer; const AInteger: Integer);
begin
  FperCom := AInteger;
  FperCom_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperDs1(Index: Integer; const ADouble: Double);
begin
  FperDs1 := ADouble;
  FperDs1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perDs1_Specified(Index: Integer): boolean;
begin
  Result := FperDs1_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperDs2(Index: Integer; const ADouble: Double);
begin
  FperDs2 := ADouble;
  FperDs2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perDs2_Specified(Index: Integer): boolean;
begin
  Result := FperDs2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperDs3(Index: Integer; const ADouble: Double);
begin
  FperDs3 := ADouble;
  FperDs3_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perDs3_Specified(Index: Integer): boolean;
begin
  Result := FperDs3_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperDs4(Index: Integer; const ADouble: Double);
begin
  FperDs4 := ADouble;
  FperDs4_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perDs4_Specified(Index: Integer): boolean;
begin
  Result := FperDs4_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperDs5(Index: Integer; const ADouble: Double);
begin
  FperDs5 := ADouble;
  FperDs5_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perDs5_Specified(Index: Integer): boolean;
begin
  Result := FperDs5_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperDsc(Index: Integer; const ADouble: Double);
begin
  FperDsc := ADouble;
  FperDsc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperEmb(Index: Integer; const ADouble: Double);
begin
  FperEmb := ADouble;
  FperEmb_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perEmb_Specified(Index: Integer): boolean;
begin
  Result := FperEmb_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperEnc(Index: Integer; const ADouble: Double);
begin
  FperEnc := ADouble;
  FperEnc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perEnc_Specified(Index: Integer): boolean;
begin
  Result := FperEnc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperFre(Index: Integer; const ADouble: Double);
begin
  FperFre := ADouble;
  FperFre_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perFre_Specified(Index: Integer): boolean;
begin
  Result := FperFre_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperIss(Index: Integer; const ADouble: Double);
begin
  FperIss := ADouble;
  FperIss_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perIss_Specified(Index: Integer): boolean;
begin
  Result := FperIss_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperOf1(Index: Integer; const AInteger: Integer);
begin
  FperOf1 := AInteger;
  FperOf1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perOf1_Specified(Index: Integer): boolean;
begin
  Result := FperOf1_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperOf2(Index: Integer; const AInteger: Integer);
begin
  FperOf2 := AInteger;
  FperOf2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perOf2_Specified(Index: Integer): boolean;
begin
  Result := FperOf2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperOut(Index: Integer; const ADouble: Double);
begin
  FperOut := ADouble;
  FperOut_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perOut_Specified(Index: Integer): boolean;
begin
  Result := FperOut_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetperSeg(Index: Integer; const ADouble: Double);
begin
  FperSeg := ADouble;
  FperSeg_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.perSeg_Specified(Index: Integer): boolean;
begin
  Result := FperSeg_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetporNa1(Index: Integer; const Astring: string);
begin
  FporNa1 := Astring;
  FporNa1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.porNa1_Specified(Index: Integer): boolean;
begin
  Result := FporNa1_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetporNa2(Index: Integer; const Astring: string);
begin
  FporNa2 := Astring;
  FporNa2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.porNa2_Specified(Index: Integer): boolean;
begin
  Result := FporNa2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetporSi1(Index: Integer; const Astring: string);
begin
  FporSi1 := Astring;
  FporSi1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.porSi1_Specified(Index: Integer): boolean;
begin
  Result := FporSi1_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetporSi2(Index: Integer; const Astring: string);
begin
  FporSi2 := Astring;
  FporSi2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.porSi2_Specified(Index: Integer): boolean;
begin
  Result := FporSi2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetqtdChs(Index: Integer; const AInteger: Integer);
begin
  FqtdChs := AInteger;
  FqtdChs_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.qtdChs_Specified(Index: Integer): boolean;
begin
  Result := FqtdChs_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetqtdDcv(Index: Integer; const AInteger: Integer);
begin
  FqtdDcv := AInteger;
  FqtdDcv_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.qtdDcv_Specified(Index: Integer): boolean;
begin
  Result := FqtdDcv_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetqtdPrt(Index: Integer; const AInteger: Integer);
begin
  FqtdPrt := AInteger;
  FqtdPrt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.qtdPrt_Specified(Index: Integer): boolean;
begin
  Result := FqtdPrt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetrecDtj(Index: Integer; const AInteger: Integer);
begin
  FrecDtj := AInteger;
  FrecDtj_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.recDtj_Specified(Index: Integer): boolean;
begin
  Result := FrecDtj_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetrecDtm(Index: Integer; const AInteger: Integer);
begin
  FrecDtm := AInteger;
  FrecDtm_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.recDtm_Specified(Index: Integer): boolean;
begin
  Result := FrecDtm_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetrecJmm(Index: Integer; const ADouble: Double);
begin
  FrecJmm := ADouble;
  FrecJmm_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.recJmm_Specified(Index: Integer): boolean;
begin
  Result := FrecJmm_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetrecMul(Index: Integer; const ADouble: Double);
begin
  FrecMul := ADouble;
  FrecMul_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.recMul_Specified(Index: Integer): boolean;
begin
  Result := FrecMul_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetrecTjr(Index: Integer; const Astring: string);
begin
  FrecTjr := Astring;
  FrecTjr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.recTjr_Specified(Index: Integer): boolean;
begin
  Result := FrecTjr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetseqCob(Index: Integer; const AInteger: Integer);
begin
  FseqCob := AInteger;
  FseqCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetvlrAcr(Index: Integer; const ADouble: Double);
begin
  FvlrAcr := ADouble;
  FvlrAcr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.vlrAcr_Specified(Index: Integer): boolean;
begin
  Result := FvlrAcr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetvlrLim(Index: Integer; const ADouble: Double);
begin
  FvlrLim := ADouble;
  FvlrLim_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.vlrLim_Specified(Index: Integer): boolean;
begin
  Result := FvlrLim_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.SetvlrPrt(Index: Integer; const ADouble: Double);
begin
  FvlrPrt := ADouble;
  FvlrPrt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteDefinicoesCliente.vlrPrt_Specified(Index: Integer): boolean;
begin
  Result := FvlrPrt_Specified;
end;

constructor clientesGravarClientesOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesGravarClientesOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosClientes)-1 do
    System.SysUtils.FreeAndNil(FretornosClientes[I]);
  System.SetLength(FretornosClientes, 0);
  inherited Destroy;
end;

procedure clientesGravarClientesOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesGravarClientesOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesGravarClientesOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesGravarClientesOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesGravarClientesOut.SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientesOutRetornosClientes: Array_Of_clientesGravarClientesOutRetornosClientes);
begin
  FretornosClientes := AArray_Of_clientesGravarClientesOutRetornosClientes;
  FretornosClientes_Specified := True;
end;

function clientesGravarClientesOut.retornosClientes_Specified(Index: Integer): boolean;
begin
  Result := FretornosClientes_Specified;
end;

procedure clientesGravarClientesOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarClientesOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure clientesGravarClientesOutRetornosClientes.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientesOutRetornosClientes.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientesOutRetornosClientes.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientesOutRetornosClientes.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientesOutRetornosClientes.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function clientesGravarClientesOutRetornosClientes.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientesOutRetornosClientes.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientesOutRetornosClientes.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientesOutRetornosClientes.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientesOutRetornosClientes.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetcidNat(Index: Integer; const Astring: string);
begin
  FcidNat := Astring;
  FcidNat_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.cidNat_Specified(Index: Integer): boolean;
begin
  Result := FcidNat_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetcodSex(Index: Integer; const Astring: string);
begin
  FcodSex := Astring;
  FcodSex_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.codSex_Specified(Index: Integer): boolean;
begin
  Result := FcodSex_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetdatNas(Index: Integer; const Astring: string);
begin
  FdatNas := Astring;
  FdatNas_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.datNas_Specified(Index: Integer): boolean;
begin
  Result := FdatNas_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetdatRge(Index: Integer; const Astring: string);
begin
  FdatRge := Astring;
  FdatRge_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.datRge_Specified(Index: Integer): boolean;
begin
  Result := FdatRge_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetestCiv(Index: Integer; const AInteger: Integer);
begin
  FestCiv := AInteger;
  FestCiv_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.estCiv_Specified(Index: Integer): boolean;
begin
  Result := FestCiv_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetnomMae(Index: Integer; const Astring: string);
begin
  FnomMae := Astring;
  FnomMae_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.nomMae_Specified(Index: Integer): boolean;
begin
  Result := FnomMae_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetnomPai(Index: Integer; const Astring: string);
begin
  FnomPai := Astring;
  FnomPai_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.nomPai_Specified(Index: Integer): boolean;
begin
  Result := FnomPai_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetnumRge(Index: Integer; const Astring: string);
begin
  FnumRge := Astring;
  FnumRge_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.numRge_Specified(Index: Integer): boolean;
begin
  Result := FnumRge_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetorgRge(Index: Integer; const Astring: string);
begin
  ForgRge := Astring;
  ForgRge_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.orgRge_Specified(Index: Integer): boolean;
begin
  Result := ForgRge_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.SetrefCm1(Index: Integer; const Astring: string);
begin
  FrefCm1 := Astring;
  FrefCm1_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteClientePessoaFisica.refCm1_Specified(Index: Integer): boolean;
begin
  Result := FrefCm1_Specified;
end;

procedure clientesExcluirClientesOutRetornosClientes.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesExcluirClientesOutRetornosClientes.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesExcluirClientesOutRetornosClientes.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesExcluirClientesOutRetornosClientes.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesExcluirClientesOutRetornosClientes.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesExcluirClientesOutRetornosClientes.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

constructor clientesExcluirClientesOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesExcluirClientesOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosClientes)-1 do
    System.SysUtils.FreeAndNil(FretornosClientes[I]);
  System.SetLength(FretornosClientes, 0);
  inherited Destroy;
end;

procedure clientesExcluirClientesOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesExcluirClientesOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesExcluirClientesOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesExcluirClientesOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesExcluirClientesOut.SetretornosClientes(Index: Integer; const AArray_Of_clientesExcluirClientesOutRetornosClientes: Array_Of_clientesExcluirClientesOutRetornosClientes);
begin
  FretornosClientes := AArray_Of_clientesExcluirClientesOutRetornosClientes;
  FretornosClientes_Specified := True;
end;

function clientesExcluirClientesOut.retornosClientes_Specified(Index: Integer): boolean;
begin
  Result := FretornosClientes_Specified;
end;

procedure clientesExcluirClientesOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesExcluirClientesOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetbaiCid(Index: Integer; const Astring: string);
begin
  FbaiCid := Astring;
  FbaiCid_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.baiCid_Specified(Index: Integer): boolean;
begin
  Result := FbaiCid_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetcepFim(Index: Integer; const Astring: string);
begin
  FcepFim := Astring;
  FcepFim_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.cepFim_Specified(Index: Integer): boolean;
begin
  Result := FcepFim_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetcepPol(Index: Integer; const Astring: string);
begin
  FcepPol := Astring;
  FcepPol_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.cepPol_Specified(Index: Integer): boolean;
begin
  Result := FcepPol_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetcodRai(Index: Integer; const AInteger: Integer);
begin
  FcodRai := AInteger;
  FcodRai_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.codRai_Specified(Index: Integer): boolean;
begin
  Result := FcodRai_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetendCid(Index: Integer; const Astring: string);
begin
  FendCid := Astring;
  FendCid_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.endCid_Specified(Index: Integer): boolean;
begin
  Result := FendCid_Specified;
end;

procedure clientesGravarClientesInDadosGeraisClienteCadastroCEP.SetnomCid(Index: Integer; const Astring: string);
begin
  FnomCid := Astring;
  FnomCid_Specified := True;
end;

function clientesGravarClientesInDadosGeraisClienteCadastroCEP.nomCid_Specified(Index: Integer): boolean;
begin
  Result := FnomCid_Specified;
end;

destructor clientesGravarClientesInDadosGeraisCliente.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FcadastroCEP)-1 do
    System.SysUtils.FreeAndNil(FcadastroCEP[I]);
  System.SetLength(FcadastroCEP, 0);
  for I := 0 to System.Length(FclientePessoaFisica)-1 do
    System.SysUtils.FreeAndNil(FclientePessoaFisica[I]);
  System.SetLength(FclientePessoaFisica, 0);
  for I := 0 to System.Length(FdefinicoesCliente)-1 do
    System.SysUtils.FreeAndNil(FdefinicoesCliente[I]);
  System.SetLength(FdefinicoesCliente, 0);
  for I := 0 to System.Length(FenderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FenderecosEntrega[I]);
  System.SetLength(FenderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetapeCli(Index: Integer; const Astring: string);
begin
  FapeCli := Astring;
  FapeCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.apeCli_Specified(Index: Integer): boolean;
begin
  Result := FapeCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetbaiCli(Index: Integer; const Astring: string);
begin
  FbaiCli := Astring;
  FbaiCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.baiCli_Specified(Index: Integer): boolean;
begin
  Result := FbaiCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetbaiCob(Index: Integer; const Astring: string);
begin
  FbaiCob := Astring;
  FbaiCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.baiCob_Specified(Index: Integer): boolean;
begin
  Result := FbaiCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP);
begin
  FcadastroCEP := AArray_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP;
  FcadastroCEP_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cadastroCEP_Specified(Index: Integer): boolean;
begin
  Result := FcadastroCEP_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcalFun(Index: Integer; const Astring: string);
begin
  FcalFun := Astring;
  FcalFun_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.calFun_Specified(Index: Integer): boolean;
begin
  Result := FcalFun_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcepCli(Index: Integer; const Astring: string);
begin
  FcepCli := Astring;
  FcepCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cepCli_Specified(Index: Integer): boolean;
begin
  Result := FcepCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcepCob(Index: Integer; const AInteger: Integer);
begin
  FcepCob := AInteger;
  FcepCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cepCob_Specified(Index: Integer): boolean;
begin
  Result := FcepCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcepEnt(Index: Integer; const AInteger: Integer);
begin
  FcepEnt := AInteger;
  FcepEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcepFre(Index: Integer; const AInteger: Integer);
begin
  FcepFre := AInteger;
  FcepFre_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cepFre_Specified(Index: Integer): boolean;
begin
  Result := FcepFre_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcgcCob(Index: Integer; const ADouble: Double);
begin
  FcgcCob := ADouble;
  FcgcCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cgcCob_Specified(Index: Integer): boolean;
begin
  Result := FcgcCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcgcEnt(Index: Integer; const ADouble: Double);
begin
  FcgcEnt := ADouble;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcidCli(Index: Integer; const Astring: string);
begin
  FcidCli := Astring;
  FcidCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cidCli_Specified(Index: Integer): boolean;
begin
  Result := FcidCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcidCob(Index: Integer; const Astring: string);
begin
  FcidCob := Astring;
  FcidCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cidCob_Specified(Index: Integer): boolean;
begin
  Result := FcidCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcliCon(Index: Integer; const Astring: string);
begin
  FcliCon := Astring;
  FcliCon_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cliCon_Specified(Index: Integer): boolean;
begin
  Result := FcliCon_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcliFor(Index: Integer; const Astring: string);
begin
  FcliFor := Astring;
  FcliFor_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cliFor_Specified(Index: Integer): boolean;
begin
  Result := FcliFor_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcliPrx(Index: Integer; const Astring: string);
begin
  FcliPrx := Astring;
  FcliPrx_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cliPrx_Specified(Index: Integer): boolean;
begin
  Result := FcliPrx_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcliRep(Index: Integer; const AInteger: Integer);
begin
  FcliRep := AInteger;
  FcliRep_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cliRep_Specified(Index: Integer): boolean;
begin
  Result := FcliRep_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcliTra(Index: Integer; const AInteger: Integer);
begin
  FcliTra := AInteger;
  FcliTra_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cliTra_Specified(Index: Integer): boolean;
begin
  Result := FcliTra_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica);
begin
  FclientePessoaFisica := AArray_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica;
  FclientePessoaFisica_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.clientePessoaFisica_Specified(Index: Integer): boolean;
begin
  Result := FclientePessoaFisica_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodGre(Index: Integer; const Astring: string);
begin
  FcodGre := Astring;
  FcodGre_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codGre_Specified(Index: Integer): boolean;
begin
  Result := FcodGre_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodMot(Index: Integer; const AInteger: Integer);
begin
  FcodMot := AInteger;
  FcodMot_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codMot_Specified(Index: Integer): boolean;
begin
  Result := FcodMot_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodPai(Index: Integer; const Astring: string);
begin
  FcodPai := Astring;
  FcodPai_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codPai_Specified(Index: Integer): boolean;
begin
  Result := FcodPai_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodRam(Index: Integer; const Astring: string);
begin
  FcodRam := Astring;
  FcodRam_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codRam_Specified(Index: Integer): boolean;
begin
  Result := FcodRam_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodRoe(Index: Integer; const Astring: string);
begin
  FcodRoe := Astring;
  FcodRoe_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codRoe_Specified(Index: Integer): boolean;
begin
  Result := FcodRoe_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodRtr(Index: Integer; const AInteger: Integer);
begin
  FcodRtr := AInteger;
  FcodRtr_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codRtr_Specified(Index: Integer): boolean;
begin
  Result := FcodRtr_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodSro(Index: Integer; const Astring: string);
begin
  FcodSro := Astring;
  FcodSro_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codSro_Specified(Index: Integer): boolean;
begin
  Result := FcodSro_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcodSuf(Index: Integer; const Astring: string);
begin
  FcodSuf := Astring;
  FcodSuf_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.codSuf_Specified(Index: Integer): boolean;
begin
  Result := FcodSuf_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcplCob(Index: Integer; const Astring: string);
begin
  FcplCob := Astring;
  FcplCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cplCob_Specified(Index: Integer): boolean;
begin
  Result := FcplCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcplEnd(Index: Integer; const Astring: string);
begin
  FcplEnd := Astring;
  FcplEnd_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cplEnd_Specified(Index: Integer): boolean;
begin
  Result := FcplEnd_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetcxaPst(Index: Integer; const AInteger: Integer);
begin
  FcxaPst := AInteger;
  FcxaPst_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.cxaPst_Specified(Index: Integer): boolean;
begin
  Result := FcxaPst_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetdatSuf(Index: Integer; const Astring: string);
begin
  FdatSuf := Astring;
  FdatSuf_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.datSuf_Specified(Index: Integer): boolean;
begin
  Result := FdatSuf_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente);
begin
  FdefinicoesCliente := AArray_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente;
  FdefinicoesCliente_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.definicoesCliente_Specified(Index: Integer): boolean;
begin
  Result := FdefinicoesCliente_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SeteenCli(Index: Integer; const Astring: string);
begin
  FeenCli := Astring;
  FeenCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.eenCli_Specified(Index: Integer): boolean;
begin
  Result := FeenCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SeteenCob(Index: Integer; const Astring: string);
begin
  FeenCob := Astring;
  FeenCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.eenCob_Specified(Index: Integer): boolean;
begin
  Result := FeenCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SeteenEnt(Index: Integer; const Astring: string);
begin
  FeenEnt := Astring;
  FeenEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.eenEnt_Specified(Index: Integer): boolean;
begin
  Result := FeenEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetemaNfe(Index: Integer; const Astring: string);
begin
  FemaNfe := Astring;
  FemaNfe_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.emaNfe_Specified(Index: Integer): boolean;
begin
  Result := FemaNfe_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetendCli(Index: Integer; const Astring: string);
begin
  FendCli := Astring;
  FendCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.endCli_Specified(Index: Integer): boolean;
begin
  Result := FendCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetendCob(Index: Integer; const Astring: string);
begin
  FendCob := Astring;
  FendCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.endCob_Specified(Index: Integer): boolean;
begin
  Result := FendCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega);
begin
  FenderecosEntrega := AArray_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega;
  FenderecosEntrega_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.enderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FenderecosEntrega_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetentCor(Index: Integer; const Astring: string);
begin
  FentCor := Astring;
  FentCor_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.entCor_Specified(Index: Integer): boolean;
begin
  Result := FentCor_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetestCob(Index: Integer; const Astring: string);
begin
  FestCob := Astring;
  FestCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.estCob_Specified(Index: Integer): boolean;
begin
  Result := FestCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetfaxCli(Index: Integer; const Astring: string);
begin
  FfaxCli := Astring;
  FfaxCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.faxCli_Specified(Index: Integer): boolean;
begin
  Result := FfaxCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetfonCl2(Index: Integer; const Astring: string);
begin
  FfonCl2 := Astring;
  FfonCl2_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.fonCl2_Specified(Index: Integer): boolean;
begin
  Result := FfonCl2_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetfonCl3(Index: Integer; const Astring: string);
begin
  FfonCl3 := Astring;
  FfonCl3_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.fonCl3_Specified(Index: Integer): boolean;
begin
  Result := FfonCl3_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetfonCl4(Index: Integer; const Astring: string);
begin
  FfonCl4 := Astring;
  FfonCl4_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.fonCl4_Specified(Index: Integer): boolean;
begin
  Result := FfonCl4_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetfonCl5(Index: Integer; const Astring: string);
begin
  FfonCl5 := Astring;
  FfonCl5_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.fonCl5_Specified(Index: Integer): boolean;
begin
  Result := FfonCl5_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetfonCli(Index: Integer; const Astring: string);
begin
  FfonCli := Astring;
  FfonCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.fonCli_Specified(Index: Integer): boolean;
begin
  Result := FfonCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetideCli(Index: Integer; const Astring: string);
begin
  FideCli := Astring;
  FideCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.ideCli_Specified(Index: Integer): boolean;
begin
  Result := FideCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetindCoo(Index: Integer; const Astring: string);
begin
  FindCoo := Astring;
  FindCoo_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.indCoo_Specified(Index: Integer): boolean;
begin
  Result := FindCoo_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetinsAnp(Index: Integer; const AInteger: Integer);
begin
  FinsAnp := AInteger;
  FinsAnp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.insAnp_Specified(Index: Integer): boolean;
begin
  Result := FinsAnp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetinsEst(Index: Integer; const Astring: string);
begin
  FinsEst := Astring;
  FinsEst_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.insEst_Specified(Index: Integer): boolean;
begin
  Result := FinsEst_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetinsMun(Index: Integer; const Astring: string);
begin
  FinsMun := Astring;
  FinsMun_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.insMun_Specified(Index: Integer): boolean;
begin
  Result := FinsMun_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetlimRet(Index: Integer; const Astring: string);
begin
  FlimRet := Astring;
  FlimRet_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.limRet_Specified(Index: Integer): boolean;
begin
  Result := FlimRet_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetmarCli(Index: Integer; const Astring: string);
begin
  FmarCli := Astring;
  FmarCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.marCli_Specified(Index: Integer): boolean;
begin
  Result := FmarCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnatCof(Index: Integer; const AInteger: Integer);
begin
  FnatCof := AInteger;
  FnatCof_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.natCof_Specified(Index: Integer): boolean;
begin
  Result := FnatCof_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnatPis(Index: Integer; const AInteger: Integer);
begin
  FnatPis := AInteger;
  FnatPis_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.natPis_Specified(Index: Integer): boolean;
begin
  Result := FnatPis_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnatRet(Index: Integer; const AInteger: Integer);
begin
  FnatRet := AInteger;
  FnatRet_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.natRet_Specified(Index: Integer): boolean;
begin
  Result := FnatRet_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnenCli(Index: Integer; const Astring: string);
begin
  FnenCli := Astring;
  FnenCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.nenCli_Specified(Index: Integer): boolean;
begin
  Result := FnenCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnenCob(Index: Integer; const Astring: string);
begin
  FnenCob := Astring;
  FnenCob_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.nenCob_Specified(Index: Integer): boolean;
begin
  Result := FnenCob_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetnumIdf(Index: Integer; const Astring: string);
begin
  FnumIdf := Astring;
  FnumIdf_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.numIdf_Specified(Index: Integer): boolean;
begin
  Result := FnumIdf_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetobsMot(Index: Integer; const Astring: string);
begin
  FobsMot := Astring;
  FobsMot_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.obsMot_Specified(Index: Integer): boolean;
begin
  Result := FobsMot_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetperAin(Index: Integer; const AInteger: Integer);
begin
  FperAin := AInteger;
  FperAin_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.perAin_Specified(Index: Integer): boolean;
begin
  Result := FperAin_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetregEst(Index: Integer; const AInteger: Integer);
begin
  FregEst := AInteger;
  FregEst_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.regEst_Specified(Index: Integer): boolean;
begin
  Result := FregEst_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetretCof(Index: Integer; const Astring: string);
begin
  FretCof := Astring;
  FretCof_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.retCof_Specified(Index: Integer): boolean;
begin
  Result := FretCof_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetretCsl(Index: Integer; const Astring: string);
begin
  FretCsl := Astring;
  FretCsl_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.retCsl_Specified(Index: Integer): boolean;
begin
  Result := FretCsl_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetretIrf(Index: Integer; const Astring: string);
begin
  FretIrf := Astring;
  FretIrf_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.retIrf_Specified(Index: Integer): boolean;
begin
  Result := FretIrf_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetretOur(Index: Integer; const Astring: string);
begin
  FretOur := Astring;
  FretOur_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.retOur_Specified(Index: Integer): boolean;
begin
  Result := FretOur_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetretPis(Index: Integer; const Astring: string);
begin
  FretPis := Astring;
  FretPis_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.retPis_Specified(Index: Integer): boolean;
begin
  Result := FretPis_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetretPro(Index: Integer; const Astring: string);
begin
  FretPro := Astring;
  FretPro_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.retPro_Specified(Index: Integer): boolean;
begin
  Result := FretPro_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetseqRoe(Index: Integer; const AInteger: Integer);
begin
  FseqRoe := AInteger;
  FseqRoe_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.seqRoe_Specified(Index: Integer): boolean;
begin
  Result := FseqRoe_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetsigUfs(Index: Integer; const Astring: string);
begin
  FsigUfs := Astring;
  FsigUfs_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.sigUfs_Specified(Index: Integer): boolean;
begin
  Result := FsigUfs_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetsitCli(Index: Integer; const Astring: string);
begin
  FsitCli := Astring;
  FsitCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.sitCli_Specified(Index: Integer): boolean;
begin
  Result := FsitCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettipAce(Index: Integer; const AInteger: Integer);
begin
  FtipAce := AInteger;
  FtipAce_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.tipAce_Specified(Index: Integer): boolean;
begin
  Result := FtipAce_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettipCli(Index: Integer; const Astring: string);
begin
  FtipCli := Astring;
  FtipCli_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.tipCli_Specified(Index: Integer): boolean;
begin
  Result := FtipCli_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettipEmc(Index: Integer; const AInteger: Integer);
begin
  FtipEmc := AInteger;
  FtipEmc_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.tipEmc_Specified(Index: Integer): boolean;
begin
  Result := FtipEmc_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettipEmp(Index: Integer; const AInteger: Integer);
begin
  FtipEmp := AInteger;
  FtipEmp_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.tipEmp_Specified(Index: Integer): boolean;
begin
  Result := FtipEmp_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettipMer(Index: Integer; const Astring: string);
begin
  FtipMer := Astring;
  FtipMer_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.tipMer_Specified(Index: Integer): boolean;
begin
  Result := FtipMer_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettriCof(Index: Integer; const Astring: string);
begin
  FtriCof := Astring;
  FtriCof_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.triCof_Specified(Index: Integer): boolean;
begin
  Result := FtriCof_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettriIcm(Index: Integer; const Astring: string);
begin
  FtriIcm := Astring;
  FtriIcm_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.triIcm_Specified(Index: Integer): boolean;
begin
  Result := FtriIcm_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettriIpi(Index: Integer; const Astring: string);
begin
  FtriIpi := Astring;
  FtriIpi_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.triIpi_Specified(Index: Integer): boolean;
begin
  Result := FtriIpi_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SettriPis(Index: Integer; const Astring: string);
begin
  FtriPis := Astring;
  FtriPis_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.triPis_Specified(Index: Integer): boolean;
begin
  Result := FtriPis_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetzipCod(Index: Integer; const Astring: string);
begin
  FzipCod := Astring;
  FzipCod_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.zipCod_Specified(Index: Integer): boolean;
begin
  Result := FzipCod_Specified;
end;

procedure clientesGravarClientesInDadosGeraisCliente.SetzonFra(Index: Integer; const AInteger: Integer);
begin
  FzonFra := AInteger;
  FzonFra_Specified := True;
end;

function clientesGravarClientesInDadosGeraisCliente.zonFra_Specified(Index: Integer): boolean;
begin
  Result := FzonFra_Specified;
end;

destructor clientesGravarClientes2In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGeraisCliente)-1 do
    System.SysUtils.FreeAndNil(FdadosGeraisCliente[I]);
  System.SetLength(FdadosGeraisCliente, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes2In.SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisCliente: Array_Of_clientesGravarClientes2InDadosGeraisCliente);
begin
  FdadosGeraisCliente := AArray_Of_clientesGravarClientes2InDadosGeraisCliente;
  FdadosGeraisCliente_Specified := True;
end;

function clientesGravarClientes2In.dadosGeraisCliente_Specified(Index: Integer): boolean;
begin
  Result := FdadosGeraisCliente_Specified;
end;

procedure clientesGravarClientes2In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function clientesGravarClientes2In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure clientesGravarClientes2In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesGravarClientes2In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesGravarClientes2In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesGravarClientes2In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesGravarClientes2In.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function clientesGravarClientes2In.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure clientesGravarClientes2In.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function clientesGravarClientes2In.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetacePar(Index: Integer; const Astring: string);
begin
  FacePar := Astring;
  FacePar_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.acePar_Specified(Index: Integer): boolean;
begin
  Result := FacePar_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetacrDia(Index: Integer; const AInteger: Integer);
begin
  FacrDia := AInteger;
  FacrDia_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.acrDia_Specified(Index: Integer): boolean;
begin
  Result := FacrDia_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetavaAti(Index: Integer; const Astring: string);
begin
  FavaAti := Astring;
  FavaAti_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.avaAti_Specified(Index: Integer): boolean;
begin
  Result := FavaAti_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetavaMot(Index: Integer; const AInteger: Integer);
begin
  FavaMot := AInteger;
  FavaMot_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.avaMot_Specified(Index: Integer): boolean;
begin
  Result := FavaMot_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetavaObs(Index: Integer; const Astring: string);
begin
  FavaObs := Astring;
  FavaObs_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.avaObs_Specified(Index: Integer): boolean;
begin
  Result := FavaObs_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetavaVlr(Index: Integer; const ADouble: Double);
begin
  FavaVlr := ADouble;
  FavaVlr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.avaVlr_Specified(Index: Integer): boolean;
begin
  Result := FavaVlr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetavaVls(Index: Integer; const ADouble: Double);
begin
  FavaVls := ADouble;
  FavaVls_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.avaVls_Specified(Index: Integer): boolean;
begin
  Result := FavaVls_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetavaVlu(Index: Integer; const ADouble: Double);
begin
  FavaVlu := ADouble;
  FavaVlu_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.avaVlu_Specified(Index: Integer): boolean;
begin
  Result := FavaVlu_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcatCli(Index: Integer; const AInteger: Integer);
begin
  FcatCli := AInteger;
  FcatCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.catCli_Specified(Index: Integer): boolean;
begin
  Result := FcatCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetccbCli(Index: Integer; const Astring: string);
begin
  FccbCli := Astring;
  FccbCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ccbCli_Specified(Index: Integer): boolean;
begin
  Result := FccbCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcifFob(Index: Integer; const Astring: string);
begin
  FcifFob := Astring;
  FcifFob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.cifFob_Specified(Index: Integer): boolean;
begin
  Result := FcifFob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodCpg(Index: Integer; const Astring: string);
begin
  FcodCpg := Astring;
  FcodCpg_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codCpg_Specified(Index: Integer): boolean;
begin
  Result := FcodCpg_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodFcr(Index: Integer; const Astring: string);
begin
  FcodFcr := Astring;
  FcodFcr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codFcr_Specified(Index: Integer): boolean;
begin
  Result := FcodFcr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodMar(Index: Integer; const Astring: string);
begin
  FcodMar := Astring;
  FcodMar_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codMar_Specified(Index: Integer): boolean;
begin
  Result := FcodMar_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodRed(Index: Integer; const AInteger: Integer);
begin
  FcodRed := AInteger;
  FcodRed_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codRed_Specified(Index: Integer): boolean;
begin
  Result := FcodRed_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodRve(Index: Integer; const Astring: string);
begin
  FcodRve := Astring;
  FcodRve_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codRve_Specified(Index: Integer): boolean;
begin
  Result := FcodRve_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodTab(Index: Integer; const Astring: string);
begin
  FcodTab := Astring;
  FcodTab_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codTab_Specified(Index: Integer): boolean;
begin
  Result := FcodTab_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodTic(Index: Integer; const Astring: string);
begin
  FcodTic := Astring;
  FcodTic_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codTic_Specified(Index: Integer): boolean;
begin
  Result := FcodTic_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodTpr(Index: Integer; const Astring: string);
begin
  FcodTpr := Astring;
  FcodTpr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codTpr_Specified(Index: Integer): boolean;
begin
  Result := FcodTpr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodTra(Index: Integer; const AInteger: Integer);
begin
  FcodTra := AInteger;
  FcodTra_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codTra_Specified(Index: Integer): boolean;
begin
  Result := FcodTra_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodTrd(Index: Integer; const Astring: string);
begin
  FcodTrd := Astring;
  FcodTrd_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codTrd_Specified(Index: Integer): boolean;
begin
  Result := FcodTrd_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcodVen(Index: Integer; const AInteger: Integer);
begin
  FcodVen := AInteger;
  FcodVen_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.codVen_Specified(Index: Integer): boolean;
begin
  Result := FcodVen_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetconFin(Index: Integer; const Astring: string);
begin
  FconFin := Astring;
  FconFin_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.conFin_Specified(Index: Integer): boolean;
begin
  Result := FconFin_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetcriEdv(Index: Integer; const Astring: string);
begin
  FcriEdv := Astring;
  FcriEdv_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.criEdv_Specified(Index: Integer): boolean;
begin
  Result := FcriEdv_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctaAad(Index: Integer; const AInteger: Integer);
begin
  FctaAad := AInteger;
  FctaAad_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctaAad_Specified(Index: Integer): boolean;
begin
  Result := FctaAad_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctaAux(Index: Integer; const AInteger: Integer);
begin
  FctaAux := AInteger;
  FctaAux_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctaAux_Specified(Index: Integer): boolean;
begin
  Result := FctaAux_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctaFcr(Index: Integer; const AInteger: Integer);
begin
  FctaFcr := AInteger;
  FctaFcr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctaFcr_Specified(Index: Integer): boolean;
begin
  Result := FctaFcr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctaFdv(Index: Integer; const AInteger: Integer);
begin
  FctaFdv := AInteger;
  FctaFdv_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctaFdv_Specified(Index: Integer): boolean;
begin
  Result := FctaFdv_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctaRcr(Index: Integer; const AInteger: Integer);
begin
  FctaRcr := AInteger;
  FctaRcr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctaRcr_Specified(Index: Integer): boolean;
begin
  Result := FctaRcr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetctrPad(Index: Integer; const AInteger: Integer);
begin
  FctrPad := AInteger;
  FctrPad_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ctrPad_Specified(Index: Integer): boolean;
begin
  Result := FctrPad_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdatLim(Index: Integer; const Astring: string);
begin
  FdatLim := Astring;
  FdatLim_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.datLim_Specified(Index: Integer): boolean;
begin
  Result := FdatLim_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdatPmr(Index: Integer; const Astring: string);
begin
  FdatPmr := Astring;
  FdatPmr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.datPmr_Specified(Index: Integer): boolean;
begin
  Result := FdatPmr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdiaEsp(Index: Integer; const Astring: string);
begin
  FdiaEsp := Astring;
  FdiaEsp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.diaEsp_Specified(Index: Integer): boolean;
begin
  Result := FdiaEsp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdiaMe1(Index: Integer; const AInteger: Integer);
begin
  FdiaMe1 := AInteger;
  FdiaMe1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.diaMe1_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe1_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdiaMe2(Index: Integer; const AInteger: Integer);
begin
  FdiaMe2 := AInteger;
  FdiaMe2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.diaMe2_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdiaMe3(Index: Integer; const AInteger: Integer);
begin
  FdiaMe3 := AInteger;
  FdiaMe3_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.diaMe3_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe3_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetdscPrd(Index: Integer; const Astring: string);
begin
  FdscPrd := Astring;
  FdscPrd_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.dscPrd_Specified(Index: Integer): boolean;
begin
  Result := FdscPrd_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetecpCnp(Index: Integer; const Astring: string);
begin
  FecpCnp := Astring;
  FecpCnp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.ecpCnp_Specified(Index: Integer): boolean;
begin
  Result := FecpCnp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetexiAge(Index: Integer; const Astring: string);
begin
  FexiAge := Astring;
  FexiAge_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.exiAge_Specified(Index: Integer): boolean;
begin
  Result := FexiAge_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetexiLcp(Index: Integer; const Astring: string);
begin
  FexiLcp := Astring;
  FexiLcp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.exiLcp_Specified(Index: Integer): boolean;
begin
  Result := FexiLcp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetfveCpg(Index: Integer; const Astring: string);
begin
  FfveCpg := Astring;
  FfveCpg_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.fveCpg_Specified(Index: Integer): boolean;
begin
  Result := FfveCpg_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetfveFpg(Index: Integer; const Astring: string);
begin
  FfveFpg := Astring;
  FfveFpg_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.fveFpg_Specified(Index: Integer): boolean;
begin
  Result := FfveFpg_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetfveTns(Index: Integer; const Astring: string);
begin
  FfveTns := Astring;
  FfveTns_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.fveTns_Specified(Index: Integer): boolean;
begin
  Result := FfveTns_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetgerTcc(Index: Integer; const Astring: string);
begin
  FgerTcc := Astring;
  FgerTcc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.gerTcc_Specified(Index: Integer): boolean;
begin
  Result := FgerTcc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetindOrf(Index: Integer; const Astring: string);
begin
  FindOrf := Astring;
  FindOrf_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.indOrf_Specified(Index: Integer): boolean;
begin
  Result := FindOrf_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetlimApr(Index: Integer; const Astring: string);
begin
  FlimApr := Astring;
  FlimApr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.limApr_Specified(Index: Integer): boolean;
begin
  Result := FlimApr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperAqa(Index: Integer; const AInteger: Integer);
begin
  FperAqa := AInteger;
  FperAqa_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perAqa_Specified(Index: Integer): boolean;
begin
  Result := FperAqa_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperCcr(Index: Integer; const Astring: string);
begin
  FperCcr := Astring;
  FperCcr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perCcr_Specified(Index: Integer): boolean;
begin
  Result := FperCcr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperCom(Index: Integer; const AInteger: Integer);
begin
  FperCom := AInteger;
  FperCom_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperDs1(Index: Integer; const ADouble: Double);
begin
  FperDs1 := ADouble;
  FperDs1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perDs1_Specified(Index: Integer): boolean;
begin
  Result := FperDs1_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperDs2(Index: Integer; const ADouble: Double);
begin
  FperDs2 := ADouble;
  FperDs2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perDs2_Specified(Index: Integer): boolean;
begin
  Result := FperDs2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperDs3(Index: Integer; const ADouble: Double);
begin
  FperDs3 := ADouble;
  FperDs3_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perDs3_Specified(Index: Integer): boolean;
begin
  Result := FperDs3_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperDs4(Index: Integer; const ADouble: Double);
begin
  FperDs4 := ADouble;
  FperDs4_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perDs4_Specified(Index: Integer): boolean;
begin
  Result := FperDs4_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperDs5(Index: Integer; const ADouble: Double);
begin
  FperDs5 := ADouble;
  FperDs5_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perDs5_Specified(Index: Integer): boolean;
begin
  Result := FperDs5_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperDsc(Index: Integer; const ADouble: Double);
begin
  FperDsc := ADouble;
  FperDsc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperEmb(Index: Integer; const ADouble: Double);
begin
  FperEmb := ADouble;
  FperEmb_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perEmb_Specified(Index: Integer): boolean;
begin
  Result := FperEmb_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperEnc(Index: Integer; const ADouble: Double);
begin
  FperEnc := ADouble;
  FperEnc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perEnc_Specified(Index: Integer): boolean;
begin
  Result := FperEnc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperFre(Index: Integer; const ADouble: Double);
begin
  FperFre := ADouble;
  FperFre_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perFre_Specified(Index: Integer): boolean;
begin
  Result := FperFre_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperIss(Index: Integer; const ADouble: Double);
begin
  FperIss := ADouble;
  FperIss_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perIss_Specified(Index: Integer): boolean;
begin
  Result := FperIss_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperOf1(Index: Integer; const AInteger: Integer);
begin
  FperOf1 := AInteger;
  FperOf1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perOf1_Specified(Index: Integer): boolean;
begin
  Result := FperOf1_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperOf2(Index: Integer; const AInteger: Integer);
begin
  FperOf2 := AInteger;
  FperOf2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perOf2_Specified(Index: Integer): boolean;
begin
  Result := FperOf2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperOut(Index: Integer; const ADouble: Double);
begin
  FperOut := ADouble;
  FperOut_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perOut_Specified(Index: Integer): boolean;
begin
  Result := FperOut_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetperSeg(Index: Integer; const ADouble: Double);
begin
  FperSeg := ADouble;
  FperSeg_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.perSeg_Specified(Index: Integer): boolean;
begin
  Result := FperSeg_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetporNa1(Index: Integer; const Astring: string);
begin
  FporNa1 := Astring;
  FporNa1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.porNa1_Specified(Index: Integer): boolean;
begin
  Result := FporNa1_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetporNa2(Index: Integer; const Astring: string);
begin
  FporNa2 := Astring;
  FporNa2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.porNa2_Specified(Index: Integer): boolean;
begin
  Result := FporNa2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetporSi1(Index: Integer; const Astring: string);
begin
  FporSi1 := Astring;
  FporSi1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.porSi1_Specified(Index: Integer): boolean;
begin
  Result := FporSi1_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetporSi2(Index: Integer; const Astring: string);
begin
  FporSi2 := Astring;
  FporSi2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.porSi2_Specified(Index: Integer): boolean;
begin
  Result := FporSi2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetqtdChs(Index: Integer; const AInteger: Integer);
begin
  FqtdChs := AInteger;
  FqtdChs_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.qtdChs_Specified(Index: Integer): boolean;
begin
  Result := FqtdChs_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetqtdDcv(Index: Integer; const AInteger: Integer);
begin
  FqtdDcv := AInteger;
  FqtdDcv_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.qtdDcv_Specified(Index: Integer): boolean;
begin
  Result := FqtdDcv_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetqtdPrt(Index: Integer; const AInteger: Integer);
begin
  FqtdPrt := AInteger;
  FqtdPrt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.qtdPrt_Specified(Index: Integer): boolean;
begin
  Result := FqtdPrt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetrecDtj(Index: Integer; const AInteger: Integer);
begin
  FrecDtj := AInteger;
  FrecDtj_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.recDtj_Specified(Index: Integer): boolean;
begin
  Result := FrecDtj_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetrecDtm(Index: Integer; const AInteger: Integer);
begin
  FrecDtm := AInteger;
  FrecDtm_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.recDtm_Specified(Index: Integer): boolean;
begin
  Result := FrecDtm_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetrecJmm(Index: Integer; const ADouble: Double);
begin
  FrecJmm := ADouble;
  FrecJmm_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.recJmm_Specified(Index: Integer): boolean;
begin
  Result := FrecJmm_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetrecMul(Index: Integer; const ADouble: Double);
begin
  FrecMul := ADouble;
  FrecMul_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.recMul_Specified(Index: Integer): boolean;
begin
  Result := FrecMul_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetrecTjr(Index: Integer; const Astring: string);
begin
  FrecTjr := Astring;
  FrecTjr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.recTjr_Specified(Index: Integer): boolean;
begin
  Result := FrecTjr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetseqCob(Index: Integer; const AInteger: Integer);
begin
  FseqCob := AInteger;
  FseqCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetvlrAcr(Index: Integer; const ADouble: Double);
begin
  FvlrAcr := ADouble;
  FvlrAcr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.vlrAcr_Specified(Index: Integer): boolean;
begin
  Result := FvlrAcr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetvlrLim(Index: Integer; const ADouble: Double);
begin
  FvlrLim := ADouble;
  FvlrLim_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.vlrLim_Specified(Index: Integer): boolean;
begin
  Result := FvlrLim_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.SetvlrPrt(Index: Integer; const ADouble: Double);
begin
  FvlrPrt := ADouble;
  FvlrPrt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente.vlrPrt_Specified(Index: Integer): boolean;
begin
  Result := FvlrPrt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetcepEnt(Index: Integer; const Astring: string);
begin
  FcepEnt := Astring;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetcgcEnt(Index: Integer; const Astring: string);
begin
  FcgcEnt := Astring;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetiniEnt(Index: Integer; const Astring: string);
begin
  FiniEnt := Astring;
  FiniEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.iniEnt_Specified(Index: Integer): boolean;
begin
  Result := FiniEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetprxEnt(Index: Integer; const Astring: string);
begin
  FprxEnt := Astring;
  FprxEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.prxEnt_Specified(Index: Integer): boolean;
begin
  Result := FprxEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.SetsitReg(Index: Integer; const Astring: string);
begin
  FsitReg := Astring;
  FsitReg_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega.sitReg_Specified(Index: Integer): boolean;
begin
  Result := FsitReg_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetcidNat(Index: Integer; const Astring: string);
begin
  FcidNat := Astring;
  FcidNat_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.cidNat_Specified(Index: Integer): boolean;
begin
  Result := FcidNat_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetcodSex(Index: Integer; const Astring: string);
begin
  FcodSex := Astring;
  FcodSex_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.codSex_Specified(Index: Integer): boolean;
begin
  Result := FcodSex_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetdatNas(Index: Integer; const Astring: string);
begin
  FdatNas := Astring;
  FdatNas_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.datNas_Specified(Index: Integer): boolean;
begin
  Result := FdatNas_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetdatRge(Index: Integer; const Astring: string);
begin
  FdatRge := Astring;
  FdatRge_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.datRge_Specified(Index: Integer): boolean;
begin
  Result := FdatRge_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetestCiv(Index: Integer; const AInteger: Integer);
begin
  FestCiv := AInteger;
  FestCiv_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.estCiv_Specified(Index: Integer): boolean;
begin
  Result := FestCiv_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetnomMae(Index: Integer; const Astring: string);
begin
  FnomMae := Astring;
  FnomMae_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.nomMae_Specified(Index: Integer): boolean;
begin
  Result := FnomMae_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetnomPai(Index: Integer; const Astring: string);
begin
  FnomPai := Astring;
  FnomPai_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.nomPai_Specified(Index: Integer): boolean;
begin
  Result := FnomPai_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetnumRge(Index: Integer; const Astring: string);
begin
  FnumRge := Astring;
  FnumRge_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.numRge_Specified(Index: Integer): boolean;
begin
  Result := FnumRge_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetorgRge(Index: Integer; const Astring: string);
begin
  ForgRge := Astring;
  ForgRge_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.orgRge_Specified(Index: Integer): boolean;
begin
  Result := ForgRge_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.SetrefCm1(Index: Integer; const Astring: string);
begin
  FrefCm1 := Astring;
  FrefCm1_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica.refCm1_Specified(Index: Integer): boolean;
begin
  Result := FrefCm1_Specified;
end;

destructor clientesGravarClientes2InDadosGeraisCliente.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FcadastroCEP)-1 do
    System.SysUtils.FreeAndNil(FcadastroCEP[I]);
  System.SetLength(FcadastroCEP, 0);
  for I := 0 to System.Length(FclientePessoaFisica)-1 do
    System.SysUtils.FreeAndNil(FclientePessoaFisica[I]);
  System.SetLength(FclientePessoaFisica, 0);
  for I := 0 to System.Length(FdefinicoesCliente)-1 do
    System.SysUtils.FreeAndNil(FdefinicoesCliente[I]);
  System.SetLength(FdefinicoesCliente, 0);
  for I := 0 to System.Length(FenderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FenderecosEntrega[I]);
  System.SetLength(FenderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetapeCli(Index: Integer; const Astring: string);
begin
  FapeCli := Astring;
  FapeCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.apeCli_Specified(Index: Integer): boolean;
begin
  Result := FapeCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetbaiCli(Index: Integer; const Astring: string);
begin
  FbaiCli := Astring;
  FbaiCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.baiCli_Specified(Index: Integer): boolean;
begin
  Result := FbaiCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetbaiCob(Index: Integer; const Astring: string);
begin
  FbaiCob := Astring;
  FbaiCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.baiCob_Specified(Index: Integer): boolean;
begin
  Result := FbaiCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP);
begin
  FcadastroCEP := AArray_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP;
  FcadastroCEP_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cadastroCEP_Specified(Index: Integer): boolean;
begin
  Result := FcadastroCEP_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcalFun(Index: Integer; const Astring: string);
begin
  FcalFun := Astring;
  FcalFun_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.calFun_Specified(Index: Integer): boolean;
begin
  Result := FcalFun_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcepCli(Index: Integer; const Astring: string);
begin
  FcepCli := Astring;
  FcepCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cepCli_Specified(Index: Integer): boolean;
begin
  Result := FcepCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcepCob(Index: Integer; const AInteger: Integer);
begin
  FcepCob := AInteger;
  FcepCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cepCob_Specified(Index: Integer): boolean;
begin
  Result := FcepCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcepEnt(Index: Integer; const AInteger: Integer);
begin
  FcepEnt := AInteger;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcepFre(Index: Integer; const AInteger: Integer);
begin
  FcepFre := AInteger;
  FcepFre_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cepFre_Specified(Index: Integer): boolean;
begin
  Result := FcepFre_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcgcCob(Index: Integer; const ADouble: Double);
begin
  FcgcCob := ADouble;
  FcgcCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cgcCob_Specified(Index: Integer): boolean;
begin
  Result := FcgcCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcgcEnt(Index: Integer; const ADouble: Double);
begin
  FcgcEnt := ADouble;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcidCli(Index: Integer; const Astring: string);
begin
  FcidCli := Astring;
  FcidCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cidCli_Specified(Index: Integer): boolean;
begin
  Result := FcidCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcidCob(Index: Integer; const Astring: string);
begin
  FcidCob := Astring;
  FcidCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cidCob_Specified(Index: Integer): boolean;
begin
  Result := FcidCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcliCon(Index: Integer; const Astring: string);
begin
  FcliCon := Astring;
  FcliCon_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cliCon_Specified(Index: Integer): boolean;
begin
  Result := FcliCon_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcliFor(Index: Integer; const Astring: string);
begin
  FcliFor := Astring;
  FcliFor_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cliFor_Specified(Index: Integer): boolean;
begin
  Result := FcliFor_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcliPrx(Index: Integer; const Astring: string);
begin
  FcliPrx := Astring;
  FcliPrx_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cliPrx_Specified(Index: Integer): boolean;
begin
  Result := FcliPrx_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcliRep(Index: Integer; const AInteger: Integer);
begin
  FcliRep := AInteger;
  FcliRep_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cliRep_Specified(Index: Integer): boolean;
begin
  Result := FcliRep_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcliTra(Index: Integer; const AInteger: Integer);
begin
  FcliTra := AInteger;
  FcliTra_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cliTra_Specified(Index: Integer): boolean;
begin
  Result := FcliTra_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica);
begin
  FclientePessoaFisica := AArray_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica;
  FclientePessoaFisica_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.clientePessoaFisica_Specified(Index: Integer): boolean;
begin
  Result := FclientePessoaFisica_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodGre(Index: Integer; const Astring: string);
begin
  FcodGre := Astring;
  FcodGre_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codGre_Specified(Index: Integer): boolean;
begin
  Result := FcodGre_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodMot(Index: Integer; const AInteger: Integer);
begin
  FcodMot := AInteger;
  FcodMot_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codMot_Specified(Index: Integer): boolean;
begin
  Result := FcodMot_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodPai(Index: Integer; const Astring: string);
begin
  FcodPai := Astring;
  FcodPai_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codPai_Specified(Index: Integer): boolean;
begin
  Result := FcodPai_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodRam(Index: Integer; const Astring: string);
begin
  FcodRam := Astring;
  FcodRam_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codRam_Specified(Index: Integer): boolean;
begin
  Result := FcodRam_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodRoe(Index: Integer; const Astring: string);
begin
  FcodRoe := Astring;
  FcodRoe_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codRoe_Specified(Index: Integer): boolean;
begin
  Result := FcodRoe_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodRtr(Index: Integer; const AInteger: Integer);
begin
  FcodRtr := AInteger;
  FcodRtr_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codRtr_Specified(Index: Integer): boolean;
begin
  Result := FcodRtr_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodSro(Index: Integer; const Astring: string);
begin
  FcodSro := Astring;
  FcodSro_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codSro_Specified(Index: Integer): boolean;
begin
  Result := FcodSro_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcodSuf(Index: Integer; const Astring: string);
begin
  FcodSuf := Astring;
  FcodSuf_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.codSuf_Specified(Index: Integer): boolean;
begin
  Result := FcodSuf_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcplCob(Index: Integer; const Astring: string);
begin
  FcplCob := Astring;
  FcplCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cplCob_Specified(Index: Integer): boolean;
begin
  Result := FcplCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcplEnd(Index: Integer; const Astring: string);
begin
  FcplEnd := Astring;
  FcplEnd_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cplEnd_Specified(Index: Integer): boolean;
begin
  Result := FcplEnd_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetcxaPst(Index: Integer; const AInteger: Integer);
begin
  FcxaPst := AInteger;
  FcxaPst_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.cxaPst_Specified(Index: Integer): boolean;
begin
  Result := FcxaPst_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetdatSuf(Index: Integer; const Astring: string);
begin
  FdatSuf := Astring;
  FdatSuf_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.datSuf_Specified(Index: Integer): boolean;
begin
  Result := FdatSuf_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente);
begin
  FdefinicoesCliente := AArray_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente;
  FdefinicoesCliente_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.definicoesCliente_Specified(Index: Integer): boolean;
begin
  Result := FdefinicoesCliente_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SeteenCli(Index: Integer; const Astring: string);
begin
  FeenCli := Astring;
  FeenCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.eenCli_Specified(Index: Integer): boolean;
begin
  Result := FeenCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SeteenCob(Index: Integer; const Astring: string);
begin
  FeenCob := Astring;
  FeenCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.eenCob_Specified(Index: Integer): boolean;
begin
  Result := FeenCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SeteenEnt(Index: Integer; const Astring: string);
begin
  FeenEnt := Astring;
  FeenEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.eenEnt_Specified(Index: Integer): boolean;
begin
  Result := FeenEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetemaNfe(Index: Integer; const Astring: string);
begin
  FemaNfe := Astring;
  FemaNfe_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.emaNfe_Specified(Index: Integer): boolean;
begin
  Result := FemaNfe_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetendCli(Index: Integer; const Astring: string);
begin
  FendCli := Astring;
  FendCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.endCli_Specified(Index: Integer): boolean;
begin
  Result := FendCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetendCob(Index: Integer; const Astring: string);
begin
  FendCob := Astring;
  FendCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.endCob_Specified(Index: Integer): boolean;
begin
  Result := FendCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega);
begin
  FenderecosEntrega := AArray_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega;
  FenderecosEntrega_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.enderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FenderecosEntrega_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetentCor(Index: Integer; const Astring: string);
begin
  FentCor := Astring;
  FentCor_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.entCor_Specified(Index: Integer): boolean;
begin
  Result := FentCor_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetestCob(Index: Integer; const Astring: string);
begin
  FestCob := Astring;
  FestCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.estCob_Specified(Index: Integer): boolean;
begin
  Result := FestCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetfaxCli(Index: Integer; const Astring: string);
begin
  FfaxCli := Astring;
  FfaxCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.faxCli_Specified(Index: Integer): boolean;
begin
  Result := FfaxCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetfonCl2(Index: Integer; const Astring: string);
begin
  FfonCl2 := Astring;
  FfonCl2_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.fonCl2_Specified(Index: Integer): boolean;
begin
  Result := FfonCl2_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetfonCl3(Index: Integer; const Astring: string);
begin
  FfonCl3 := Astring;
  FfonCl3_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.fonCl3_Specified(Index: Integer): boolean;
begin
  Result := FfonCl3_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetfonCl4(Index: Integer; const Astring: string);
begin
  FfonCl4 := Astring;
  FfonCl4_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.fonCl4_Specified(Index: Integer): boolean;
begin
  Result := FfonCl4_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetfonCl5(Index: Integer; const Astring: string);
begin
  FfonCl5 := Astring;
  FfonCl5_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.fonCl5_Specified(Index: Integer): boolean;
begin
  Result := FfonCl5_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetfonCli(Index: Integer; const Astring: string);
begin
  FfonCli := Astring;
  FfonCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.fonCli_Specified(Index: Integer): boolean;
begin
  Result := FfonCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetideCli(Index: Integer; const Astring: string);
begin
  FideCli := Astring;
  FideCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.ideCli_Specified(Index: Integer): boolean;
begin
  Result := FideCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetindCoo(Index: Integer; const Astring: string);
begin
  FindCoo := Astring;
  FindCoo_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.indCoo_Specified(Index: Integer): boolean;
begin
  Result := FindCoo_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetinsAnp(Index: Integer; const AInteger: Integer);
begin
  FinsAnp := AInteger;
  FinsAnp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.insAnp_Specified(Index: Integer): boolean;
begin
  Result := FinsAnp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetinsEst(Index: Integer; const Astring: string);
begin
  FinsEst := Astring;
  FinsEst_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.insEst_Specified(Index: Integer): boolean;
begin
  Result := FinsEst_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetinsMun(Index: Integer; const Astring: string);
begin
  FinsMun := Astring;
  FinsMun_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.insMun_Specified(Index: Integer): boolean;
begin
  Result := FinsMun_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetlimRet(Index: Integer; const Astring: string);
begin
  FlimRet := Astring;
  FlimRet_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.limRet_Specified(Index: Integer): boolean;
begin
  Result := FlimRet_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetmarCli(Index: Integer; const Astring: string);
begin
  FmarCli := Astring;
  FmarCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.marCli_Specified(Index: Integer): boolean;
begin
  Result := FmarCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnatCof(Index: Integer; const AInteger: Integer);
begin
  FnatCof := AInteger;
  FnatCof_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.natCof_Specified(Index: Integer): boolean;
begin
  Result := FnatCof_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnatPis(Index: Integer; const AInteger: Integer);
begin
  FnatPis := AInteger;
  FnatPis_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.natPis_Specified(Index: Integer): boolean;
begin
  Result := FnatPis_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnatRet(Index: Integer; const AInteger: Integer);
begin
  FnatRet := AInteger;
  FnatRet_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.natRet_Specified(Index: Integer): boolean;
begin
  Result := FnatRet_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnenCli(Index: Integer; const Astring: string);
begin
  FnenCli := Astring;
  FnenCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.nenCli_Specified(Index: Integer): boolean;
begin
  Result := FnenCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnenCob(Index: Integer; const Astring: string);
begin
  FnenCob := Astring;
  FnenCob_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.nenCob_Specified(Index: Integer): boolean;
begin
  Result := FnenCob_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetnumIdf(Index: Integer; const Astring: string);
begin
  FnumIdf := Astring;
  FnumIdf_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.numIdf_Specified(Index: Integer): boolean;
begin
  Result := FnumIdf_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetobsMot(Index: Integer; const Astring: string);
begin
  FobsMot := Astring;
  FobsMot_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.obsMot_Specified(Index: Integer): boolean;
begin
  Result := FobsMot_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetperAin(Index: Integer; const AInteger: Integer);
begin
  FperAin := AInteger;
  FperAin_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.perAin_Specified(Index: Integer): boolean;
begin
  Result := FperAin_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetregEst(Index: Integer; const AInteger: Integer);
begin
  FregEst := AInteger;
  FregEst_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.regEst_Specified(Index: Integer): boolean;
begin
  Result := FregEst_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetretCof(Index: Integer; const Astring: string);
begin
  FretCof := Astring;
  FretCof_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.retCof_Specified(Index: Integer): boolean;
begin
  Result := FretCof_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetretCsl(Index: Integer; const Astring: string);
begin
  FretCsl := Astring;
  FretCsl_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.retCsl_Specified(Index: Integer): boolean;
begin
  Result := FretCsl_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetretIrf(Index: Integer; const Astring: string);
begin
  FretIrf := Astring;
  FretIrf_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.retIrf_Specified(Index: Integer): boolean;
begin
  Result := FretIrf_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetretOur(Index: Integer; const Astring: string);
begin
  FretOur := Astring;
  FretOur_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.retOur_Specified(Index: Integer): boolean;
begin
  Result := FretOur_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetretPis(Index: Integer; const Astring: string);
begin
  FretPis := Astring;
  FretPis_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.retPis_Specified(Index: Integer): boolean;
begin
  Result := FretPis_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetretPro(Index: Integer; const Astring: string);
begin
  FretPro := Astring;
  FretPro_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.retPro_Specified(Index: Integer): boolean;
begin
  Result := FretPro_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetseqRoe(Index: Integer; const AInteger: Integer);
begin
  FseqRoe := AInteger;
  FseqRoe_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.seqRoe_Specified(Index: Integer): boolean;
begin
  Result := FseqRoe_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetsigUfs(Index: Integer; const Astring: string);
begin
  FsigUfs := Astring;
  FsigUfs_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.sigUfs_Specified(Index: Integer): boolean;
begin
  Result := FsigUfs_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetsitCli(Index: Integer; const Astring: string);
begin
  FsitCli := Astring;
  FsitCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.sitCli_Specified(Index: Integer): boolean;
begin
  Result := FsitCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettipAce(Index: Integer; const AInteger: Integer);
begin
  FtipAce := AInteger;
  FtipAce_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.tipAce_Specified(Index: Integer): boolean;
begin
  Result := FtipAce_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettipCli(Index: Integer; const Astring: string);
begin
  FtipCli := Astring;
  FtipCli_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.tipCli_Specified(Index: Integer): boolean;
begin
  Result := FtipCli_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettipEmc(Index: Integer; const AInteger: Integer);
begin
  FtipEmc := AInteger;
  FtipEmc_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.tipEmc_Specified(Index: Integer): boolean;
begin
  Result := FtipEmc_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettipEmp(Index: Integer; const AInteger: Integer);
begin
  FtipEmp := AInteger;
  FtipEmp_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.tipEmp_Specified(Index: Integer): boolean;
begin
  Result := FtipEmp_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettipMer(Index: Integer; const Astring: string);
begin
  FtipMer := Astring;
  FtipMer_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.tipMer_Specified(Index: Integer): boolean;
begin
  Result := FtipMer_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettriCof(Index: Integer; const Astring: string);
begin
  FtriCof := Astring;
  FtriCof_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.triCof_Specified(Index: Integer): boolean;
begin
  Result := FtriCof_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettriIcm(Index: Integer; const Astring: string);
begin
  FtriIcm := Astring;
  FtriIcm_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.triIcm_Specified(Index: Integer): boolean;
begin
  Result := FtriIcm_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettriIpi(Index: Integer; const Astring: string);
begin
  FtriIpi := Astring;
  FtriIpi_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.triIpi_Specified(Index: Integer): boolean;
begin
  Result := FtriIpi_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SettriPis(Index: Integer; const Astring: string);
begin
  FtriPis := Astring;
  FtriPis_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.triPis_Specified(Index: Integer): boolean;
begin
  Result := FtriPis_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetzipCod(Index: Integer; const Astring: string);
begin
  FzipCod := Astring;
  FzipCod_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.zipCod_Specified(Index: Integer): boolean;
begin
  Result := FzipCod_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisCliente.SetzonFra(Index: Integer; const AInteger: Integer);
begin
  FzonFra := AInteger;
  FzonFra_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisCliente.zonFra_Specified(Index: Integer): boolean;
begin
  Result := FzonFra_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetbaiCid(Index: Integer; const Astring: string);
begin
  FbaiCid := Astring;
  FbaiCid_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.baiCid_Specified(Index: Integer): boolean;
begin
  Result := FbaiCid_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetcepFim(Index: Integer; const Astring: string);
begin
  FcepFim := Astring;
  FcepFim_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.cepFim_Specified(Index: Integer): boolean;
begin
  Result := FcepFim_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetcepPol(Index: Integer; const Astring: string);
begin
  FcepPol := Astring;
  FcepPol_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.cepPol_Specified(Index: Integer): boolean;
begin
  Result := FcepPol_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetcodRai(Index: Integer; const AInteger: Integer);
begin
  FcodRai := AInteger;
  FcodRai_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.codRai_Specified(Index: Integer): boolean;
begin
  Result := FcodRai_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetendCid(Index: Integer; const Astring: string);
begin
  FendCid := Astring;
  FendCid_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.endCid_Specified(Index: Integer): boolean;
begin
  Result := FendCid_Specified;
end;

procedure clientesGravarClientes2InDadosGeraisClienteCadastroCEP.SetnomCid(Index: Integer; const Astring: string);
begin
  FnomCid := Astring;
  FnomCid_Specified := True;
end;

function clientesGravarClientes2InDadosGeraisClienteCadastroCEP.nomCid_Specified(Index: Integer): boolean;
begin
  Result := FnomCid_Specified;
end;

destructor clientesGravarClientes3InDadosGeraisCliente.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FcadastroCEP)-1 do
    System.SysUtils.FreeAndNil(FcadastroCEP[I]);
  System.SetLength(FcadastroCEP, 0);
  for I := 0 to System.Length(FclientePessoaFisica)-1 do
    System.SysUtils.FreeAndNil(FclientePessoaFisica[I]);
  System.SetLength(FclientePessoaFisica, 0);
  for I := 0 to System.Length(FdefinicoesCliente)-1 do
    System.SysUtils.FreeAndNil(FdefinicoesCliente[I]);
  System.SetLength(FdefinicoesCliente, 0);
  for I := 0 to System.Length(FenderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FenderecosEntrega[I]);
  System.SetLength(FenderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetapeCli(Index: Integer; const Astring: string);
begin
  FapeCli := Astring;
  FapeCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.apeCli_Specified(Index: Integer): boolean;
begin
  Result := FapeCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetbaiCli(Index: Integer; const Astring: string);
begin
  FbaiCli := Astring;
  FbaiCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.baiCli_Specified(Index: Integer): boolean;
begin
  Result := FbaiCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetbaiCob(Index: Integer; const Astring: string);
begin
  FbaiCob := Astring;
  FbaiCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.baiCob_Specified(Index: Integer): boolean;
begin
  Result := FbaiCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP);
begin
  FcadastroCEP := AArray_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP;
  FcadastroCEP_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cadastroCEP_Specified(Index: Integer): boolean;
begin
  Result := FcadastroCEP_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcalFun(Index: Integer; const Astring: string);
begin
  FcalFun := Astring;
  FcalFun_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.calFun_Specified(Index: Integer): boolean;
begin
  Result := FcalFun_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcepCli(Index: Integer; const Astring: string);
begin
  FcepCli := Astring;
  FcepCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cepCli_Specified(Index: Integer): boolean;
begin
  Result := FcepCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcepCob(Index: Integer; const AInteger: Integer);
begin
  FcepCob := AInteger;
  FcepCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cepCob_Specified(Index: Integer): boolean;
begin
  Result := FcepCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcepEnt(Index: Integer; const AInteger: Integer);
begin
  FcepEnt := AInteger;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcepFre(Index: Integer; const AInteger: Integer);
begin
  FcepFre := AInteger;
  FcepFre_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cepFre_Specified(Index: Integer): boolean;
begin
  Result := FcepFre_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcgcCob(Index: Integer; const ADouble: Double);
begin
  FcgcCob := ADouble;
  FcgcCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cgcCob_Specified(Index: Integer): boolean;
begin
  Result := FcgcCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcgcEnt(Index: Integer; const ADouble: Double);
begin
  FcgcEnt := ADouble;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcidCli(Index: Integer; const Astring: string);
begin
  FcidCli := Astring;
  FcidCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cidCli_Specified(Index: Integer): boolean;
begin
  Result := FcidCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcidCob(Index: Integer; const Astring: string);
begin
  FcidCob := Astring;
  FcidCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cidCob_Specified(Index: Integer): boolean;
begin
  Result := FcidCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcliCon(Index: Integer; const Astring: string);
begin
  FcliCon := Astring;
  FcliCon_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cliCon_Specified(Index: Integer): boolean;
begin
  Result := FcliCon_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcliFor(Index: Integer; const Astring: string);
begin
  FcliFor := Astring;
  FcliFor_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cliFor_Specified(Index: Integer): boolean;
begin
  Result := FcliFor_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcliPrx(Index: Integer; const Astring: string);
begin
  FcliPrx := Astring;
  FcliPrx_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cliPrx_Specified(Index: Integer): boolean;
begin
  Result := FcliPrx_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcliRep(Index: Integer; const AInteger: Integer);
begin
  FcliRep := AInteger;
  FcliRep_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cliRep_Specified(Index: Integer): boolean;
begin
  Result := FcliRep_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcliTra(Index: Integer; const AInteger: Integer);
begin
  FcliTra := AInteger;
  FcliTra_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cliTra_Specified(Index: Integer): boolean;
begin
  Result := FcliTra_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica);
begin
  FclientePessoaFisica := AArray_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica;
  FclientePessoaFisica_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.clientePessoaFisica_Specified(Index: Integer): boolean;
begin
  Result := FclientePessoaFisica_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodGre(Index: Integer; const Astring: string);
begin
  FcodGre := Astring;
  FcodGre_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codGre_Specified(Index: Integer): boolean;
begin
  Result := FcodGre_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodMot(Index: Integer; const AInteger: Integer);
begin
  FcodMot := AInteger;
  FcodMot_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codMot_Specified(Index: Integer): boolean;
begin
  Result := FcodMot_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodPai(Index: Integer; const Astring: string);
begin
  FcodPai := Astring;
  FcodPai_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codPai_Specified(Index: Integer): boolean;
begin
  Result := FcodPai_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodRam(Index: Integer; const Astring: string);
begin
  FcodRam := Astring;
  FcodRam_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codRam_Specified(Index: Integer): boolean;
begin
  Result := FcodRam_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodRoe(Index: Integer; const Astring: string);
begin
  FcodRoe := Astring;
  FcodRoe_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codRoe_Specified(Index: Integer): boolean;
begin
  Result := FcodRoe_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodRtr(Index: Integer; const AInteger: Integer);
begin
  FcodRtr := AInteger;
  FcodRtr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codRtr_Specified(Index: Integer): boolean;
begin
  Result := FcodRtr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodSro(Index: Integer; const Astring: string);
begin
  FcodSro := Astring;
  FcodSro_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codSro_Specified(Index: Integer): boolean;
begin
  Result := FcodSro_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcodSuf(Index: Integer; const Astring: string);
begin
  FcodSuf := Astring;
  FcodSuf_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.codSuf_Specified(Index: Integer): boolean;
begin
  Result := FcodSuf_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcplCob(Index: Integer; const Astring: string);
begin
  FcplCob := Astring;
  FcplCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cplCob_Specified(Index: Integer): boolean;
begin
  Result := FcplCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcplEnd(Index: Integer; const Astring: string);
begin
  FcplEnd := Astring;
  FcplEnd_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cplEnd_Specified(Index: Integer): boolean;
begin
  Result := FcplEnd_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetcxaPst(Index: Integer; const AInteger: Integer);
begin
  FcxaPst := AInteger;
  FcxaPst_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.cxaPst_Specified(Index: Integer): boolean;
begin
  Result := FcxaPst_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetdatSuf(Index: Integer; const Astring: string);
begin
  FdatSuf := Astring;
  FdatSuf_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.datSuf_Specified(Index: Integer): boolean;
begin
  Result := FdatSuf_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente);
begin
  FdefinicoesCliente := AArray_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente;
  FdefinicoesCliente_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.definicoesCliente_Specified(Index: Integer): boolean;
begin
  Result := FdefinicoesCliente_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SeteenCli(Index: Integer; const Astring: string);
begin
  FeenCli := Astring;
  FeenCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.eenCli_Specified(Index: Integer): boolean;
begin
  Result := FeenCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SeteenCob(Index: Integer; const Astring: string);
begin
  FeenCob := Astring;
  FeenCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.eenCob_Specified(Index: Integer): boolean;
begin
  Result := FeenCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SeteenEnt(Index: Integer; const Astring: string);
begin
  FeenEnt := Astring;
  FeenEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.eenEnt_Specified(Index: Integer): boolean;
begin
  Result := FeenEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetemaNfe(Index: Integer; const Astring: string);
begin
  FemaNfe := Astring;
  FemaNfe_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.emaNfe_Specified(Index: Integer): boolean;
begin
  Result := FemaNfe_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetendCli(Index: Integer; const Astring: string);
begin
  FendCli := Astring;
  FendCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.endCli_Specified(Index: Integer): boolean;
begin
  Result := FendCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetendCob(Index: Integer; const Astring: string);
begin
  FendCob := Astring;
  FendCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.endCob_Specified(Index: Integer): boolean;
begin
  Result := FendCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega);
begin
  FenderecosEntrega := AArray_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega;
  FenderecosEntrega_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.enderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FenderecosEntrega_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetentCor(Index: Integer; const Astring: string);
begin
  FentCor := Astring;
  FentCor_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.entCor_Specified(Index: Integer): boolean;
begin
  Result := FentCor_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetestCob(Index: Integer; const Astring: string);
begin
  FestCob := Astring;
  FestCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.estCob_Specified(Index: Integer): boolean;
begin
  Result := FestCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetfaxCli(Index: Integer; const Astring: string);
begin
  FfaxCli := Astring;
  FfaxCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.faxCli_Specified(Index: Integer): boolean;
begin
  Result := FfaxCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetfonCl2(Index: Integer; const Astring: string);
begin
  FfonCl2 := Astring;
  FfonCl2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.fonCl2_Specified(Index: Integer): boolean;
begin
  Result := FfonCl2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetfonCl3(Index: Integer; const Astring: string);
begin
  FfonCl3 := Astring;
  FfonCl3_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.fonCl3_Specified(Index: Integer): boolean;
begin
  Result := FfonCl3_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetfonCl4(Index: Integer; const Astring: string);
begin
  FfonCl4 := Astring;
  FfonCl4_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.fonCl4_Specified(Index: Integer): boolean;
begin
  Result := FfonCl4_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetfonCl5(Index: Integer; const Astring: string);
begin
  FfonCl5 := Astring;
  FfonCl5_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.fonCl5_Specified(Index: Integer): boolean;
begin
  Result := FfonCl5_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetfonCli(Index: Integer; const Astring: string);
begin
  FfonCli := Astring;
  FfonCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.fonCli_Specified(Index: Integer): boolean;
begin
  Result := FfonCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetideCli(Index: Integer; const Astring: string);
begin
  FideCli := Astring;
  FideCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.ideCli_Specified(Index: Integer): boolean;
begin
  Result := FideCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetindCoo(Index: Integer; const Astring: string);
begin
  FindCoo := Astring;
  FindCoo_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.indCoo_Specified(Index: Integer): boolean;
begin
  Result := FindCoo_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetinsAnp(Index: Integer; const AInteger: Integer);
begin
  FinsAnp := AInteger;
  FinsAnp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.insAnp_Specified(Index: Integer): boolean;
begin
  Result := FinsAnp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetinsEst(Index: Integer; const Astring: string);
begin
  FinsEst := Astring;
  FinsEst_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.insEst_Specified(Index: Integer): boolean;
begin
  Result := FinsEst_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetinsMun(Index: Integer; const Astring: string);
begin
  FinsMun := Astring;
  FinsMun_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.insMun_Specified(Index: Integer): boolean;
begin
  Result := FinsMun_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetlimRet(Index: Integer; const Astring: string);
begin
  FlimRet := Astring;
  FlimRet_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.limRet_Specified(Index: Integer): boolean;
begin
  Result := FlimRet_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetmarCli(Index: Integer; const Astring: string);
begin
  FmarCli := Astring;
  FmarCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.marCli_Specified(Index: Integer): boolean;
begin
  Result := FmarCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnatCof(Index: Integer; const AInteger: Integer);
begin
  FnatCof := AInteger;
  FnatCof_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.natCof_Specified(Index: Integer): boolean;
begin
  Result := FnatCof_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnatPis(Index: Integer; const AInteger: Integer);
begin
  FnatPis := AInteger;
  FnatPis_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.natPis_Specified(Index: Integer): boolean;
begin
  Result := FnatPis_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnatRet(Index: Integer; const AInteger: Integer);
begin
  FnatRet := AInteger;
  FnatRet_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.natRet_Specified(Index: Integer): boolean;
begin
  Result := FnatRet_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnenCli(Index: Integer; const Astring: string);
begin
  FnenCli := Astring;
  FnenCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.nenCli_Specified(Index: Integer): boolean;
begin
  Result := FnenCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnenCob(Index: Integer; const Astring: string);
begin
  FnenCob := Astring;
  FnenCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.nenCob_Specified(Index: Integer): boolean;
begin
  Result := FnenCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetnumIdf(Index: Integer; const Astring: string);
begin
  FnumIdf := Astring;
  FnumIdf_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.numIdf_Specified(Index: Integer): boolean;
begin
  Result := FnumIdf_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetobsMot(Index: Integer; const Astring: string);
begin
  FobsMot := Astring;
  FobsMot_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.obsMot_Specified(Index: Integer): boolean;
begin
  Result := FobsMot_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetperAin(Index: Integer; const AInteger: Integer);
begin
  FperAin := AInteger;
  FperAin_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.perAin_Specified(Index: Integer): boolean;
begin
  Result := FperAin_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetregEst(Index: Integer; const AInteger: Integer);
begin
  FregEst := AInteger;
  FregEst_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.regEst_Specified(Index: Integer): boolean;
begin
  Result := FregEst_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetretCof(Index: Integer; const Astring: string);
begin
  FretCof := Astring;
  FretCof_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.retCof_Specified(Index: Integer): boolean;
begin
  Result := FretCof_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetretCsl(Index: Integer; const Astring: string);
begin
  FretCsl := Astring;
  FretCsl_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.retCsl_Specified(Index: Integer): boolean;
begin
  Result := FretCsl_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetretIrf(Index: Integer; const Astring: string);
begin
  FretIrf := Astring;
  FretIrf_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.retIrf_Specified(Index: Integer): boolean;
begin
  Result := FretIrf_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetretOur(Index: Integer; const Astring: string);
begin
  FretOur := Astring;
  FretOur_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.retOur_Specified(Index: Integer): boolean;
begin
  Result := FretOur_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetretPis(Index: Integer; const Astring: string);
begin
  FretPis := Astring;
  FretPis_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.retPis_Specified(Index: Integer): boolean;
begin
  Result := FretPis_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetretPro(Index: Integer; const Astring: string);
begin
  FretPro := Astring;
  FretPro_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.retPro_Specified(Index: Integer): boolean;
begin
  Result := FretPro_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetseqRoe(Index: Integer; const AInteger: Integer);
begin
  FseqRoe := AInteger;
  FseqRoe_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.seqRoe_Specified(Index: Integer): boolean;
begin
  Result := FseqRoe_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetsigUfs(Index: Integer; const Astring: string);
begin
  FsigUfs := Astring;
  FsigUfs_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.sigUfs_Specified(Index: Integer): boolean;
begin
  Result := FsigUfs_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetsitCli(Index: Integer; const Astring: string);
begin
  FsitCli := Astring;
  FsitCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.sitCli_Specified(Index: Integer): boolean;
begin
  Result := FsitCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettipAce(Index: Integer; const AInteger: Integer);
begin
  FtipAce := AInteger;
  FtipAce_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.tipAce_Specified(Index: Integer): boolean;
begin
  Result := FtipAce_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettipCli(Index: Integer; const Astring: string);
begin
  FtipCli := Astring;
  FtipCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.tipCli_Specified(Index: Integer): boolean;
begin
  Result := FtipCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettipEmc(Index: Integer; const AInteger: Integer);
begin
  FtipEmc := AInteger;
  FtipEmc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.tipEmc_Specified(Index: Integer): boolean;
begin
  Result := FtipEmc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettipEmp(Index: Integer; const AInteger: Integer);
begin
  FtipEmp := AInteger;
  FtipEmp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.tipEmp_Specified(Index: Integer): boolean;
begin
  Result := FtipEmp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettipMer(Index: Integer; const Astring: string);
begin
  FtipMer := Astring;
  FtipMer_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.tipMer_Specified(Index: Integer): boolean;
begin
  Result := FtipMer_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettriCof(Index: Integer; const Astring: string);
begin
  FtriCof := Astring;
  FtriCof_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.triCof_Specified(Index: Integer): boolean;
begin
  Result := FtriCof_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettriIcm(Index: Integer; const Astring: string);
begin
  FtriIcm := Astring;
  FtriIcm_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.triIcm_Specified(Index: Integer): boolean;
begin
  Result := FtriIcm_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettriIpi(Index: Integer; const Astring: string);
begin
  FtriIpi := Astring;
  FtriIpi_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.triIpi_Specified(Index: Integer): boolean;
begin
  Result := FtriIpi_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SettriPis(Index: Integer; const Astring: string);
begin
  FtriPis := Astring;
  FtriPis_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.triPis_Specified(Index: Integer): boolean;
begin
  Result := FtriPis_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetzipCod(Index: Integer; const Astring: string);
begin
  FzipCod := Astring;
  FzipCod_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.zipCod_Specified(Index: Integer): boolean;
begin
  Result := FzipCod_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisCliente.SetzonFra(Index: Integer; const AInteger: Integer);
begin
  FzonFra := AInteger;
  FzonFra_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisCliente.zonFra_Specified(Index: Integer): boolean;
begin
  Result := FzonFra_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetbaiCid(Index: Integer; const Astring: string);
begin
  FbaiCid := Astring;
  FbaiCid_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.baiCid_Specified(Index: Integer): boolean;
begin
  Result := FbaiCid_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetcepFim(Index: Integer; const Astring: string);
begin
  FcepFim := Astring;
  FcepFim_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.cepFim_Specified(Index: Integer): boolean;
begin
  Result := FcepFim_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetcepPol(Index: Integer; const Astring: string);
begin
  FcepPol := Astring;
  FcepPol_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.cepPol_Specified(Index: Integer): boolean;
begin
  Result := FcepPol_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetcodRai(Index: Integer; const AInteger: Integer);
begin
  FcodRai := AInteger;
  FcodRai_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.codRai_Specified(Index: Integer): boolean;
begin
  Result := FcodRai_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetendCid(Index: Integer; const Astring: string);
begin
  FendCid := Astring;
  FendCid_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.endCid_Specified(Index: Integer): boolean;
begin
  Result := FendCid_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteCadastroCEP.SetnomCid(Index: Integer; const Astring: string);
begin
  FnomCid := Astring;
  FnomCid_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteCadastroCEP.nomCid_Specified(Index: Integer): boolean;
begin
  Result := FnomCid_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetcidNat(Index: Integer; const Astring: string);
begin
  FcidNat := Astring;
  FcidNat_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.cidNat_Specified(Index: Integer): boolean;
begin
  Result := FcidNat_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetcodSex(Index: Integer; const Astring: string);
begin
  FcodSex := Astring;
  FcodSex_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.codSex_Specified(Index: Integer): boolean;
begin
  Result := FcodSex_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetdatNas(Index: Integer; const Astring: string);
begin
  FdatNas := Astring;
  FdatNas_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.datNas_Specified(Index: Integer): boolean;
begin
  Result := FdatNas_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetdatRge(Index: Integer; const Astring: string);
begin
  FdatRge := Astring;
  FdatRge_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.datRge_Specified(Index: Integer): boolean;
begin
  Result := FdatRge_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetestCiv(Index: Integer; const AInteger: Integer);
begin
  FestCiv := AInteger;
  FestCiv_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.estCiv_Specified(Index: Integer): boolean;
begin
  Result := FestCiv_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetnomMae(Index: Integer; const Astring: string);
begin
  FnomMae := Astring;
  FnomMae_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.nomMae_Specified(Index: Integer): boolean;
begin
  Result := FnomMae_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetnomPai(Index: Integer; const Astring: string);
begin
  FnomPai := Astring;
  FnomPai_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.nomPai_Specified(Index: Integer): boolean;
begin
  Result := FnomPai_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetnumRge(Index: Integer; const Astring: string);
begin
  FnumRge := Astring;
  FnumRge_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.numRge_Specified(Index: Integer): boolean;
begin
  Result := FnumRge_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetorgRge(Index: Integer; const Astring: string);
begin
  ForgRge := Astring;
  ForgRge_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.orgRge_Specified(Index: Integer): boolean;
begin
  Result := ForgRge_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.SetrefCm1(Index: Integer; const Astring: string);
begin
  FrefCm1 := Astring;
  FrefCm1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica.refCm1_Specified(Index: Integer): boolean;
begin
  Result := FrefCm1_Specified;
end;

destructor clientesGravarClientes5InDadosGeraisCliente.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FcadastroCEP)-1 do
    System.SysUtils.FreeAndNil(FcadastroCEP[I]);
  System.SetLength(FcadastroCEP, 0);
  for I := 0 to System.Length(FclientePessoaFisica)-1 do
    System.SysUtils.FreeAndNil(FclientePessoaFisica[I]);
  System.SetLength(FclientePessoaFisica, 0);
  for I := 0 to System.Length(FdefinicoesCliente)-1 do
    System.SysUtils.FreeAndNil(FdefinicoesCliente[I]);
  System.SetLength(FdefinicoesCliente, 0);
  for I := 0 to System.Length(FenderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FenderecosEntrega[I]);
  System.SetLength(FenderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetapeCli(Index: Integer; const Astring: string);
begin
  FapeCli := Astring;
  FapeCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.apeCli_Specified(Index: Integer): boolean;
begin
  Result := FapeCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetbaiCli(Index: Integer; const Astring: string);
begin
  FbaiCli := Astring;
  FbaiCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.baiCli_Specified(Index: Integer): boolean;
begin
  Result := FbaiCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetbaiCob(Index: Integer; const Astring: string);
begin
  FbaiCob := Astring;
  FbaiCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.baiCob_Specified(Index: Integer): boolean;
begin
  Result := FbaiCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcadastroCEP(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP: Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP);
begin
  FcadastroCEP := AArray_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP;
  FcadastroCEP_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cadastroCEP_Specified(Index: Integer): boolean;
begin
  Result := FcadastroCEP_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcalFun(Index: Integer; const Astring: string);
begin
  FcalFun := Astring;
  FcalFun_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.calFun_Specified(Index: Integer): boolean;
begin
  Result := FcalFun_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcepCli(Index: Integer; const Astring: string);
begin
  FcepCli := Astring;
  FcepCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cepCli_Specified(Index: Integer): boolean;
begin
  Result := FcepCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcepCob(Index: Integer; const AInteger: Integer);
begin
  FcepCob := AInteger;
  FcepCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cepCob_Specified(Index: Integer): boolean;
begin
  Result := FcepCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcepEnt(Index: Integer; const AInteger: Integer);
begin
  FcepEnt := AInteger;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcepFre(Index: Integer; const AInteger: Integer);
begin
  FcepFre := AInteger;
  FcepFre_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cepFre_Specified(Index: Integer): boolean;
begin
  Result := FcepFre_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcgcCob(Index: Integer; const ADouble: Double);
begin
  FcgcCob := ADouble;
  FcgcCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cgcCob_Specified(Index: Integer): boolean;
begin
  Result := FcgcCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcgcEnt(Index: Integer; const ADouble: Double);
begin
  FcgcEnt := ADouble;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcidCli(Index: Integer; const Astring: string);
begin
  FcidCli := Astring;
  FcidCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cidCli_Specified(Index: Integer): boolean;
begin
  Result := FcidCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcidCob(Index: Integer; const Astring: string);
begin
  FcidCob := Astring;
  FcidCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cidCob_Specified(Index: Integer): boolean;
begin
  Result := FcidCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcliCon(Index: Integer; const Astring: string);
begin
  FcliCon := Astring;
  FcliCon_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cliCon_Specified(Index: Integer): boolean;
begin
  Result := FcliCon_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcliFor(Index: Integer; const Astring: string);
begin
  FcliFor := Astring;
  FcliFor_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cliFor_Specified(Index: Integer): boolean;
begin
  Result := FcliFor_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcliPrx(Index: Integer; const Astring: string);
begin
  FcliPrx := Astring;
  FcliPrx_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cliPrx_Specified(Index: Integer): boolean;
begin
  Result := FcliPrx_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcliRep(Index: Integer; const AInteger: Integer);
begin
  FcliRep := AInteger;
  FcliRep_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cliRep_Specified(Index: Integer): boolean;
begin
  Result := FcliRep_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcliTra(Index: Integer; const AInteger: Integer);
begin
  FcliTra := AInteger;
  FcliTra_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cliTra_Specified(Index: Integer): boolean;
begin
  Result := FcliTra_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetclientePessoaFisica(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica: Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica);
begin
  FclientePessoaFisica := AArray_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica;
  FclientePessoaFisica_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.clientePessoaFisica_Specified(Index: Integer): boolean;
begin
  Result := FclientePessoaFisica_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodCnv(Index: Integer; const AInteger: Integer);
begin
  FcodCnv := AInteger;
  FcodCnv_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codCnv_Specified(Index: Integer): boolean;
begin
  Result := FcodCnv_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodFor(Index: Integer; const AInteger: Integer);
begin
  FcodFor := AInteger;
  FcodFor_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodGre(Index: Integer; const Astring: string);
begin
  FcodGre := Astring;
  FcodGre_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codGre_Specified(Index: Integer): boolean;
begin
  Result := FcodGre_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodMot(Index: Integer; const AInteger: Integer);
begin
  FcodMot := AInteger;
  FcodMot_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codMot_Specified(Index: Integer): boolean;
begin
  Result := FcodMot_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodPai(Index: Integer; const Astring: string);
begin
  FcodPai := Astring;
  FcodPai_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codPai_Specified(Index: Integer): boolean;
begin
  Result := FcodPai_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodRam(Index: Integer; const Astring: string);
begin
  FcodRam := Astring;
  FcodRam_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codRam_Specified(Index: Integer): boolean;
begin
  Result := FcodRam_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodRoe(Index: Integer; const Astring: string);
begin
  FcodRoe := Astring;
  FcodRoe_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codRoe_Specified(Index: Integer): boolean;
begin
  Result := FcodRoe_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodRtr(Index: Integer; const AInteger: Integer);
begin
  FcodRtr := AInteger;
  FcodRtr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codRtr_Specified(Index: Integer): boolean;
begin
  Result := FcodRtr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodSro(Index: Integer; const Astring: string);
begin
  FcodSro := Astring;
  FcodSro_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codSro_Specified(Index: Integer): boolean;
begin
  Result := FcodSro_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcodSuf(Index: Integer; const Astring: string);
begin
  FcodSuf := Astring;
  FcodSuf_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.codSuf_Specified(Index: Integer): boolean;
begin
  Result := FcodSuf_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcplCob(Index: Integer; const Astring: string);
begin
  FcplCob := Astring;
  FcplCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cplCob_Specified(Index: Integer): boolean;
begin
  Result := FcplCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcplEnd(Index: Integer; const Astring: string);
begin
  FcplEnd := Astring;
  FcplEnd_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cplEnd_Specified(Index: Integer): boolean;
begin
  Result := FcplEnd_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetcxaPst(Index: Integer; const AInteger: Integer);
begin
  FcxaPst := AInteger;
  FcxaPst_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.cxaPst_Specified(Index: Integer): boolean;
begin
  Result := FcxaPst_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetdatSuf(Index: Integer; const Astring: string);
begin
  FdatSuf := Astring;
  FdatSuf_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.datSuf_Specified(Index: Integer): boolean;
begin
  Result := FdatSuf_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetdefinicoesCliente(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente: Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente);
begin
  FdefinicoesCliente := AArray_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente;
  FdefinicoesCliente_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.definicoesCliente_Specified(Index: Integer): boolean;
begin
  Result := FdefinicoesCliente_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SeteenCli(Index: Integer; const Astring: string);
begin
  FeenCli := Astring;
  FeenCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.eenCli_Specified(Index: Integer): boolean;
begin
  Result := FeenCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SeteenCob(Index: Integer; const Astring: string);
begin
  FeenCob := Astring;
  FeenCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.eenCob_Specified(Index: Integer): boolean;
begin
  Result := FeenCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SeteenEnt(Index: Integer; const Astring: string);
begin
  FeenEnt := Astring;
  FeenEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.eenEnt_Specified(Index: Integer): boolean;
begin
  Result := FeenEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetemaNfe(Index: Integer; const Astring: string);
begin
  FemaNfe := Astring;
  FemaNfe_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.emaNfe_Specified(Index: Integer): boolean;
begin
  Result := FemaNfe_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetendCli(Index: Integer; const Astring: string);
begin
  FendCli := Astring;
  FendCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.endCli_Specified(Index: Integer): boolean;
begin
  Result := FendCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetendCob(Index: Integer; const Astring: string);
begin
  FendCob := Astring;
  FendCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.endCob_Specified(Index: Integer): boolean;
begin
  Result := FendCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetenderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega: Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega);
begin
  FenderecosEntrega := AArray_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega;
  FenderecosEntrega_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.enderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FenderecosEntrega_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetentCor(Index: Integer; const Astring: string);
begin
  FentCor := Astring;
  FentCor_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.entCor_Specified(Index: Integer): boolean;
begin
  Result := FentCor_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetestCob(Index: Integer; const Astring: string);
begin
  FestCob := Astring;
  FestCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.estCob_Specified(Index: Integer): boolean;
begin
  Result := FestCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetfaxCli(Index: Integer; const Astring: string);
begin
  FfaxCli := Astring;
  FfaxCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.faxCli_Specified(Index: Integer): boolean;
begin
  Result := FfaxCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetfonCl2(Index: Integer; const Astring: string);
begin
  FfonCl2 := Astring;
  FfonCl2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.fonCl2_Specified(Index: Integer): boolean;
begin
  Result := FfonCl2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetfonCl3(Index: Integer; const Astring: string);
begin
  FfonCl3 := Astring;
  FfonCl3_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.fonCl3_Specified(Index: Integer): boolean;
begin
  Result := FfonCl3_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetfonCl4(Index: Integer; const Astring: string);
begin
  FfonCl4 := Astring;
  FfonCl4_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.fonCl4_Specified(Index: Integer): boolean;
begin
  Result := FfonCl4_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetfonCl5(Index: Integer; const Astring: string);
begin
  FfonCl5 := Astring;
  FfonCl5_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.fonCl5_Specified(Index: Integer): boolean;
begin
  Result := FfonCl5_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetfonCli(Index: Integer; const Astring: string);
begin
  FfonCli := Astring;
  FfonCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.fonCli_Specified(Index: Integer): boolean;
begin
  Result := FfonCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetideCli(Index: Integer; const Astring: string);
begin
  FideCli := Astring;
  FideCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.ideCli_Specified(Index: Integer): boolean;
begin
  Result := FideCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetindCoo(Index: Integer; const Astring: string);
begin
  FindCoo := Astring;
  FindCoo_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.indCoo_Specified(Index: Integer): boolean;
begin
  Result := FindCoo_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetindNif(Index: Integer; const AInteger: Integer);
begin
  FindNif := AInteger;
  FindNif_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.indNif_Specified(Index: Integer): boolean;
begin
  Result := FindNif_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetinsAnp(Index: Integer; const AInteger: Integer);
begin
  FinsAnp := AInteger;
  FinsAnp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.insAnp_Specified(Index: Integer): boolean;
begin
  Result := FinsAnp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetinsEst(Index: Integer; const Astring: string);
begin
  FinsEst := Astring;
  FinsEst_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.insEst_Specified(Index: Integer): boolean;
begin
  Result := FinsEst_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetinsMun(Index: Integer; const Astring: string);
begin
  FinsMun := Astring;
  FinsMun_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.insMun_Specified(Index: Integer): boolean;
begin
  Result := FinsMun_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetlimRet(Index: Integer; const Astring: string);
begin
  FlimRet := Astring;
  FlimRet_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.limRet_Specified(Index: Integer): boolean;
begin
  Result := FlimRet_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetmarCli(Index: Integer; const Astring: string);
begin
  FmarCli := Astring;
  FmarCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.marCli_Specified(Index: Integer): boolean;
begin
  Result := FmarCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnatCof(Index: Integer; const AInteger: Integer);
begin
  FnatCof := AInteger;
  FnatCof_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.natCof_Specified(Index: Integer): boolean;
begin
  Result := FnatCof_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnatPis(Index: Integer; const AInteger: Integer);
begin
  FnatPis := AInteger;
  FnatPis_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.natPis_Specified(Index: Integer): boolean;
begin
  Result := FnatPis_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnatRet(Index: Integer; const AInteger: Integer);
begin
  FnatRet := AInteger;
  FnatRet_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.natRet_Specified(Index: Integer): boolean;
begin
  Result := FnatRet_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnenCli(Index: Integer; const Astring: string);
begin
  FnenCli := Astring;
  FnenCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.nenCli_Specified(Index: Integer): boolean;
begin
  Result := FnenCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnenCob(Index: Integer; const Astring: string);
begin
  FnenCob := Astring;
  FnenCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.nenCob_Specified(Index: Integer): boolean;
begin
  Result := FnenCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetnumIdf(Index: Integer; const Astring: string);
begin
  FnumIdf := Astring;
  FnumIdf_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.numIdf_Specified(Index: Integer): boolean;
begin
  Result := FnumIdf_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetobsMot(Index: Integer; const Astring: string);
begin
  FobsMot := Astring;
  FobsMot_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.obsMot_Specified(Index: Integer): boolean;
begin
  Result := FobsMot_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetperAin(Index: Integer; const AInteger: Integer);
begin
  FperAin := AInteger;
  FperAin_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.perAin_Specified(Index: Integer): boolean;
begin
  Result := FperAin_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetregEst(Index: Integer; const AInteger: Integer);
begin
  FregEst := AInteger;
  FregEst_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.regEst_Specified(Index: Integer): boolean;
begin
  Result := FregEst_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetretCof(Index: Integer; const Astring: string);
begin
  FretCof := Astring;
  FretCof_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.retCof_Specified(Index: Integer): boolean;
begin
  Result := FretCof_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetretCsl(Index: Integer; const Astring: string);
begin
  FretCsl := Astring;
  FretCsl_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.retCsl_Specified(Index: Integer): boolean;
begin
  Result := FretCsl_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetretIrf(Index: Integer; const Astring: string);
begin
  FretIrf := Astring;
  FretIrf_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.retIrf_Specified(Index: Integer): boolean;
begin
  Result := FretIrf_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetretOur(Index: Integer; const Astring: string);
begin
  FretOur := Astring;
  FretOur_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.retOur_Specified(Index: Integer): boolean;
begin
  Result := FretOur_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetretPis(Index: Integer; const Astring: string);
begin
  FretPis := Astring;
  FretPis_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.retPis_Specified(Index: Integer): boolean;
begin
  Result := FretPis_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetretPro(Index: Integer; const Astring: string);
begin
  FretPro := Astring;
  FretPro_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.retPro_Specified(Index: Integer): boolean;
begin
  Result := FretPro_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetseqRoe(Index: Integer; const AInteger: Integer);
begin
  FseqRoe := AInteger;
  FseqRoe_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.seqRoe_Specified(Index: Integer): boolean;
begin
  Result := FseqRoe_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetsigUfs(Index: Integer; const Astring: string);
begin
  FsigUfs := Astring;
  FsigUfs_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.sigUfs_Specified(Index: Integer): boolean;
begin
  Result := FsigUfs_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetsitCli(Index: Integer; const Astring: string);
begin
  FsitCli := Astring;
  FsitCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.sitCli_Specified(Index: Integer): boolean;
begin
  Result := FsitCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettipAce(Index: Integer; const AInteger: Integer);
begin
  FtipAce := AInteger;
  FtipAce_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.tipAce_Specified(Index: Integer): boolean;
begin
  Result := FtipAce_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettipCli(Index: Integer; const Astring: string);
begin
  FtipCli := Astring;
  FtipCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.tipCli_Specified(Index: Integer): boolean;
begin
  Result := FtipCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettipEmc(Index: Integer; const AInteger: Integer);
begin
  FtipEmc := AInteger;
  FtipEmc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.tipEmc_Specified(Index: Integer): boolean;
begin
  Result := FtipEmc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettipEmp(Index: Integer; const AInteger: Integer);
begin
  FtipEmp := AInteger;
  FtipEmp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.tipEmp_Specified(Index: Integer): boolean;
begin
  Result := FtipEmp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettipMer(Index: Integer; const Astring: string);
begin
  FtipMer := Astring;
  FtipMer_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.tipMer_Specified(Index: Integer): boolean;
begin
  Result := FtipMer_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettriCof(Index: Integer; const Astring: string);
begin
  FtriCof := Astring;
  FtriCof_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.triCof_Specified(Index: Integer): boolean;
begin
  Result := FtriCof_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettriIcm(Index: Integer; const Astring: string);
begin
  FtriIcm := Astring;
  FtriIcm_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.triIcm_Specified(Index: Integer): boolean;
begin
  Result := FtriIcm_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettriIpi(Index: Integer; const Astring: string);
begin
  FtriIpi := Astring;
  FtriIpi_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.triIpi_Specified(Index: Integer): boolean;
begin
  Result := FtriIpi_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SettriPis(Index: Integer; const Astring: string);
begin
  FtriPis := Astring;
  FtriPis_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.triPis_Specified(Index: Integer): boolean;
begin
  Result := FtriPis_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetzipCod(Index: Integer; const Astring: string);
begin
  FzipCod := Astring;
  FzipCod_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.zipCod_Specified(Index: Integer): boolean;
begin
  Result := FzipCod_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisCliente.SetzonFra(Index: Integer; const AInteger: Integer);
begin
  FzonFra := AInteger;
  FzonFra_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisCliente.zonFra_Specified(Index: Integer): boolean;
begin
  Result := FzonFra_Specified;
end;

procedure clientesConsultarOutRetornosConsultas.SetcgcCpf(Index: Integer; const AInteger: Integer);
begin
  FcgcCpf := AInteger;
  FcgcCpf_Specified := True;
end;

function clientesConsultarOutRetornosConsultas.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesConsultarOutRetornosConsultas.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesConsultarOutRetornosConsultas.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesConsultarOutRetornosConsultas.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesConsultarOutRetornosConsultas.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesConsultarOutRetornosConsultas.SetsitCli(Index: Integer; const Astring: string);
begin
  FsitCli := Astring;
  FsitCli_Specified := True;
end;

function clientesConsultarOutRetornosConsultas.sitCli_Specified(Index: Integer): boolean;
begin
  Result := FsitCli_Specified;
end;

procedure clientesConsultarOutRetornosConsultas.SettipCli(Index: Integer; const Astring: string);
begin
  FtipCli := Astring;
  FtipCli_Specified := True;
end;

function clientesConsultarOutRetornosConsultas.tipCli_Specified(Index: Integer): boolean;
begin
  Result := FtipCli_Specified;
end;

destructor clientesGravarClientes5In.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGeraisCliente)-1 do
    System.SysUtils.FreeAndNil(FdadosGeraisCliente[I]);
  System.SetLength(FdadosGeraisCliente, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes5In.SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesGravarClientes5InDadosGeraisCliente: Array_Of_clientesGravarClientes5InDadosGeraisCliente);
begin
  FdadosGeraisCliente := AArray_Of_clientesGravarClientes5InDadosGeraisCliente;
  FdadosGeraisCliente_Specified := True;
end;

function clientesGravarClientes5In.dadosGeraisCliente_Specified(Index: Integer): boolean;
begin
  Result := FdadosGeraisCliente_Specified;
end;

procedure clientesGravarClientes5In.SetdataBuild(Index: Integer; const Astring: string);
begin
  FdataBuild := Astring;
  FdataBuild_Specified := True;
end;

function clientesGravarClientes5In.dataBuild_Specified(Index: Integer): boolean;
begin
  Result := FdataBuild_Specified;
end;

procedure clientesGravarClientes5In.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesGravarClientes5In.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesGravarClientes5In.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesGravarClientes5In.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesGravarClientes5In.SetidtReq(Index: Integer; const Astring: string);
begin
  FidtReq := Astring;
  FidtReq_Specified := True;
end;

function clientesGravarClientes5In.idtReq_Specified(Index: Integer): boolean;
begin
  Result := FidtReq_Specified;
end;

procedure clientesGravarClientes5In.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function clientesGravarClientes5In.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetacePar(Index: Integer; const Astring: string);
begin
  FacePar := Astring;
  FacePar_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.acePar_Specified(Index: Integer): boolean;
begin
  Result := FacePar_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetacrDia(Index: Integer; const AInteger: Integer);
begin
  FacrDia := AInteger;
  FacrDia_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.acrDia_Specified(Index: Integer): boolean;
begin
  Result := FacrDia_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetavaAti(Index: Integer; const Astring: string);
begin
  FavaAti := Astring;
  FavaAti_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.avaAti_Specified(Index: Integer): boolean;
begin
  Result := FavaAti_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetavaMot(Index: Integer; const AInteger: Integer);
begin
  FavaMot := AInteger;
  FavaMot_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.avaMot_Specified(Index: Integer): boolean;
begin
  Result := FavaMot_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetavaObs(Index: Integer; const Astring: string);
begin
  FavaObs := Astring;
  FavaObs_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.avaObs_Specified(Index: Integer): boolean;
begin
  Result := FavaObs_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetavaVlr(Index: Integer; const ADouble: Double);
begin
  FavaVlr := ADouble;
  FavaVlr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.avaVlr_Specified(Index: Integer): boolean;
begin
  Result := FavaVlr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetavaVls(Index: Integer; const ADouble: Double);
begin
  FavaVls := ADouble;
  FavaVls_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.avaVls_Specified(Index: Integer): boolean;
begin
  Result := FavaVls_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetavaVlu(Index: Integer; const ADouble: Double);
begin
  FavaVlu := ADouble;
  FavaVlu_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.avaVlu_Specified(Index: Integer): boolean;
begin
  Result := FavaVlu_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcatCli(Index: Integer; const AInteger: Integer);
begin
  FcatCli := AInteger;
  FcatCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.catCli_Specified(Index: Integer): boolean;
begin
  Result := FcatCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetccbCli(Index: Integer; const Astring: string);
begin
  FccbCli := Astring;
  FccbCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ccbCli_Specified(Index: Integer): boolean;
begin
  Result := FccbCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcifFob(Index: Integer; const Astring: string);
begin
  FcifFob := Astring;
  FcifFob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.cifFob_Specified(Index: Integer): boolean;
begin
  Result := FcifFob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodCpg(Index: Integer; const Astring: string);
begin
  FcodCpg := Astring;
  FcodCpg_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codCpg_Specified(Index: Integer): boolean;
begin
  Result := FcodCpg_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodFcr(Index: Integer; const Astring: string);
begin
  FcodFcr := Astring;
  FcodFcr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codFcr_Specified(Index: Integer): boolean;
begin
  Result := FcodFcr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodMar(Index: Integer; const Astring: string);
begin
  FcodMar := Astring;
  FcodMar_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codMar_Specified(Index: Integer): boolean;
begin
  Result := FcodMar_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodRed(Index: Integer; const AInteger: Integer);
begin
  FcodRed := AInteger;
  FcodRed_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codRed_Specified(Index: Integer): boolean;
begin
  Result := FcodRed_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodRve(Index: Integer; const Astring: string);
begin
  FcodRve := Astring;
  FcodRve_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codRve_Specified(Index: Integer): boolean;
begin
  Result := FcodRve_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodTab(Index: Integer; const Astring: string);
begin
  FcodTab := Astring;
  FcodTab_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codTab_Specified(Index: Integer): boolean;
begin
  Result := FcodTab_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodTic(Index: Integer; const Astring: string);
begin
  FcodTic := Astring;
  FcodTic_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codTic_Specified(Index: Integer): boolean;
begin
  Result := FcodTic_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodTpr(Index: Integer; const Astring: string);
begin
  FcodTpr := Astring;
  FcodTpr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codTpr_Specified(Index: Integer): boolean;
begin
  Result := FcodTpr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodTra(Index: Integer; const AInteger: Integer);
begin
  FcodTra := AInteger;
  FcodTra_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codTra_Specified(Index: Integer): boolean;
begin
  Result := FcodTra_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodTrd(Index: Integer; const Astring: string);
begin
  FcodTrd := Astring;
  FcodTrd_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codTrd_Specified(Index: Integer): boolean;
begin
  Result := FcodTrd_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcodVen(Index: Integer; const AInteger: Integer);
begin
  FcodVen := AInteger;
  FcodVen_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.codVen_Specified(Index: Integer): boolean;
begin
  Result := FcodVen_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetconFin(Index: Integer; const Astring: string);
begin
  FconFin := Astring;
  FconFin_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.conFin_Specified(Index: Integer): boolean;
begin
  Result := FconFin_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetcriEdv(Index: Integer; const Astring: string);
begin
  FcriEdv := Astring;
  FcriEdv_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.criEdv_Specified(Index: Integer): boolean;
begin
  Result := FcriEdv_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctaAad(Index: Integer; const AInteger: Integer);
begin
  FctaAad := AInteger;
  FctaAad_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctaAad_Specified(Index: Integer): boolean;
begin
  Result := FctaAad_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctaAux(Index: Integer; const AInteger: Integer);
begin
  FctaAux := AInteger;
  FctaAux_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctaAux_Specified(Index: Integer): boolean;
begin
  Result := FctaAux_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctaFcr(Index: Integer; const AInteger: Integer);
begin
  FctaFcr := AInteger;
  FctaFcr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctaFcr_Specified(Index: Integer): boolean;
begin
  Result := FctaFcr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctaFdv(Index: Integer; const AInteger: Integer);
begin
  FctaFdv := AInteger;
  FctaFdv_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctaFdv_Specified(Index: Integer): boolean;
begin
  Result := FctaFdv_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctaRcr(Index: Integer; const AInteger: Integer);
begin
  FctaRcr := AInteger;
  FctaRcr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctaRcr_Specified(Index: Integer): boolean;
begin
  Result := FctaRcr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetctrPad(Index: Integer; const AInteger: Integer);
begin
  FctrPad := AInteger;
  FctrPad_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ctrPad_Specified(Index: Integer): boolean;
begin
  Result := FctrPad_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdatLim(Index: Integer; const Astring: string);
begin
  FdatLim := Astring;
  FdatLim_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.datLim_Specified(Index: Integer): boolean;
begin
  Result := FdatLim_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdatPmr(Index: Integer; const Astring: string);
begin
  FdatPmr := Astring;
  FdatPmr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.datPmr_Specified(Index: Integer): boolean;
begin
  Result := FdatPmr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdiaEsp(Index: Integer; const Astring: string);
begin
  FdiaEsp := Astring;
  FdiaEsp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.diaEsp_Specified(Index: Integer): boolean;
begin
  Result := FdiaEsp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdiaMe1(Index: Integer; const AInteger: Integer);
begin
  FdiaMe1 := AInteger;
  FdiaMe1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.diaMe1_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe1_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdiaMe2(Index: Integer; const AInteger: Integer);
begin
  FdiaMe2 := AInteger;
  FdiaMe2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.diaMe2_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdiaMe3(Index: Integer; const AInteger: Integer);
begin
  FdiaMe3 := AInteger;
  FdiaMe3_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.diaMe3_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe3_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetdscPrd(Index: Integer; const Astring: string);
begin
  FdscPrd := Astring;
  FdscPrd_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.dscPrd_Specified(Index: Integer): boolean;
begin
  Result := FdscPrd_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetecpCnp(Index: Integer; const Astring: string);
begin
  FecpCnp := Astring;
  FecpCnp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.ecpCnp_Specified(Index: Integer): boolean;
begin
  Result := FecpCnp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetexiAge(Index: Integer; const Astring: string);
begin
  FexiAge := Astring;
  FexiAge_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.exiAge_Specified(Index: Integer): boolean;
begin
  Result := FexiAge_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetexiLcp(Index: Integer; const Astring: string);
begin
  FexiLcp := Astring;
  FexiLcp_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.exiLcp_Specified(Index: Integer): boolean;
begin
  Result := FexiLcp_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetfveCpg(Index: Integer; const Astring: string);
begin
  FfveCpg := Astring;
  FfveCpg_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.fveCpg_Specified(Index: Integer): boolean;
begin
  Result := FfveCpg_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetfveFpg(Index: Integer; const Astring: string);
begin
  FfveFpg := Astring;
  FfveFpg_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.fveFpg_Specified(Index: Integer): boolean;
begin
  Result := FfveFpg_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetfveTns(Index: Integer; const Astring: string);
begin
  FfveTns := Astring;
  FfveTns_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.fveTns_Specified(Index: Integer): boolean;
begin
  Result := FfveTns_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetgerTcc(Index: Integer; const Astring: string);
begin
  FgerTcc := Astring;
  FgerTcc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.gerTcc_Specified(Index: Integer): boolean;
begin
  Result := FgerTcc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetindOrf(Index: Integer; const Astring: string);
begin
  FindOrf := Astring;
  FindOrf_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.indOrf_Specified(Index: Integer): boolean;
begin
  Result := FindOrf_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetlimApr(Index: Integer; const Astring: string);
begin
  FlimApr := Astring;
  FlimApr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.limApr_Specified(Index: Integer): boolean;
begin
  Result := FlimApr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperAqa(Index: Integer; const AInteger: Integer);
begin
  FperAqa := AInteger;
  FperAqa_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perAqa_Specified(Index: Integer): boolean;
begin
  Result := FperAqa_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperCcr(Index: Integer; const Astring: string);
begin
  FperCcr := Astring;
  FperCcr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perCcr_Specified(Index: Integer): boolean;
begin
  Result := FperCcr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperCom(Index: Integer; const AInteger: Integer);
begin
  FperCom := AInteger;
  FperCom_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperDs1(Index: Integer; const ADouble: Double);
begin
  FperDs1 := ADouble;
  FperDs1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perDs1_Specified(Index: Integer): boolean;
begin
  Result := FperDs1_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperDs2(Index: Integer; const ADouble: Double);
begin
  FperDs2 := ADouble;
  FperDs2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perDs2_Specified(Index: Integer): boolean;
begin
  Result := FperDs2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperDs3(Index: Integer; const ADouble: Double);
begin
  FperDs3 := ADouble;
  FperDs3_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perDs3_Specified(Index: Integer): boolean;
begin
  Result := FperDs3_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperDs4(Index: Integer; const ADouble: Double);
begin
  FperDs4 := ADouble;
  FperDs4_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perDs4_Specified(Index: Integer): boolean;
begin
  Result := FperDs4_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperDs5(Index: Integer; const ADouble: Double);
begin
  FperDs5 := ADouble;
  FperDs5_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perDs5_Specified(Index: Integer): boolean;
begin
  Result := FperDs5_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperDsc(Index: Integer; const ADouble: Double);
begin
  FperDsc := ADouble;
  FperDsc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperEmb(Index: Integer; const ADouble: Double);
begin
  FperEmb := ADouble;
  FperEmb_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perEmb_Specified(Index: Integer): boolean;
begin
  Result := FperEmb_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperEnc(Index: Integer; const ADouble: Double);
begin
  FperEnc := ADouble;
  FperEnc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perEnc_Specified(Index: Integer): boolean;
begin
  Result := FperEnc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperFre(Index: Integer; const ADouble: Double);
begin
  FperFre := ADouble;
  FperFre_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perFre_Specified(Index: Integer): boolean;
begin
  Result := FperFre_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperIss(Index: Integer; const ADouble: Double);
begin
  FperIss := ADouble;
  FperIss_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perIss_Specified(Index: Integer): boolean;
begin
  Result := FperIss_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperOf1(Index: Integer; const AInteger: Integer);
begin
  FperOf1 := AInteger;
  FperOf1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perOf1_Specified(Index: Integer): boolean;
begin
  Result := FperOf1_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperOf2(Index: Integer; const AInteger: Integer);
begin
  FperOf2 := AInteger;
  FperOf2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perOf2_Specified(Index: Integer): boolean;
begin
  Result := FperOf2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperOut(Index: Integer; const ADouble: Double);
begin
  FperOut := ADouble;
  FperOut_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perOut_Specified(Index: Integer): boolean;
begin
  Result := FperOut_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetperSeg(Index: Integer; const ADouble: Double);
begin
  FperSeg := ADouble;
  FperSeg_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.perSeg_Specified(Index: Integer): boolean;
begin
  Result := FperSeg_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetporNa1(Index: Integer; const Astring: string);
begin
  FporNa1 := Astring;
  FporNa1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.porNa1_Specified(Index: Integer): boolean;
begin
  Result := FporNa1_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetporNa2(Index: Integer; const Astring: string);
begin
  FporNa2 := Astring;
  FporNa2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.porNa2_Specified(Index: Integer): boolean;
begin
  Result := FporNa2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetporSi1(Index: Integer; const Astring: string);
begin
  FporSi1 := Astring;
  FporSi1_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.porSi1_Specified(Index: Integer): boolean;
begin
  Result := FporSi1_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetporSi2(Index: Integer; const Astring: string);
begin
  FporSi2 := Astring;
  FporSi2_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.porSi2_Specified(Index: Integer): boolean;
begin
  Result := FporSi2_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetqtdChs(Index: Integer; const AInteger: Integer);
begin
  FqtdChs := AInteger;
  FqtdChs_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.qtdChs_Specified(Index: Integer): boolean;
begin
  Result := FqtdChs_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetqtdDcv(Index: Integer; const AInteger: Integer);
begin
  FqtdDcv := AInteger;
  FqtdDcv_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.qtdDcv_Specified(Index: Integer): boolean;
begin
  Result := FqtdDcv_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetqtdPrt(Index: Integer; const AInteger: Integer);
begin
  FqtdPrt := AInteger;
  FqtdPrt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.qtdPrt_Specified(Index: Integer): boolean;
begin
  Result := FqtdPrt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetrecDtj(Index: Integer; const AInteger: Integer);
begin
  FrecDtj := AInteger;
  FrecDtj_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.recDtj_Specified(Index: Integer): boolean;
begin
  Result := FrecDtj_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetrecDtm(Index: Integer; const AInteger: Integer);
begin
  FrecDtm := AInteger;
  FrecDtm_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.recDtm_Specified(Index: Integer): boolean;
begin
  Result := FrecDtm_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetrecJmm(Index: Integer; const ADouble: Double);
begin
  FrecJmm := ADouble;
  FrecJmm_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.recJmm_Specified(Index: Integer): boolean;
begin
  Result := FrecJmm_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetrecMul(Index: Integer; const ADouble: Double);
begin
  FrecMul := ADouble;
  FrecMul_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.recMul_Specified(Index: Integer): boolean;
begin
  Result := FrecMul_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetrecTjr(Index: Integer; const Astring: string);
begin
  FrecTjr := Astring;
  FrecTjr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.recTjr_Specified(Index: Integer): boolean;
begin
  Result := FrecTjr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetseqCob(Index: Integer; const AInteger: Integer);
begin
  FseqCob := AInteger;
  FseqCob_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetvlrAcr(Index: Integer; const ADouble: Double);
begin
  FvlrAcr := ADouble;
  FvlrAcr_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.vlrAcr_Specified(Index: Integer): boolean;
begin
  Result := FvlrAcr_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetvlrLim(Index: Integer; const ADouble: Double);
begin
  FvlrLim := ADouble;
  FvlrLim_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.vlrLim_Specified(Index: Integer): boolean;
begin
  Result := FvlrLim_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.SetvlrPrt(Index: Integer; const ADouble: Double);
begin
  FvlrPrt := ADouble;
  FvlrPrt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente.vlrPrt_Specified(Index: Integer): boolean;
begin
  Result := FvlrPrt_Specified;
end;

procedure clientesGravarClientes5OutRetornosEnderecosEntrega.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes5OutRetornosEnderecosEntrega.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes5OutRetornosEnderecosEntrega.SetcodCli(Index: Integer; const Astring: string);
begin
  FcodCli := Astring;
  FcodCli_Specified := True;
end;

function clientesGravarClientes5OutRetornosEnderecosEntrega.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes5OutRetornosEnderecosEntrega.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientes5OutRetornosEnderecosEntrega.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarClientes5OutRetornosEnderecosEntrega.SetseqEnt(Index: Integer; const Astring: string);
begin
  FseqEnt := Astring;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes5OutRetornosEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes5OutRetornosEnderecosEntrega.SetseqEnv(Index: Integer; const Astring: string);
begin
  FseqEnv := Astring;
  FseqEnv_Specified := True;
end;

function clientesGravarClientes5OutRetornosEnderecosEntrega.seqEnv_Specified(Index: Integer): boolean;
begin
  Result := FseqEnv_Specified;
end;

destructor clientesExcluirClientesIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosGeraisCliente)-1 do
    System.SysUtils.FreeAndNil(FdadosGeraisCliente[I]);
  System.SetLength(FdadosGeraisCliente, 0);
  inherited Destroy;
end;

procedure clientesExcluirClientesIn.SetdadosGeraisCliente(Index: Integer; const AArray_Of_clientesExcluirClientesInDadosGeraisCliente: Array_Of_clientesExcluirClientesInDadosGeraisCliente);
begin
  FdadosGeraisCliente := AArray_Of_clientesExcluirClientesInDadosGeraisCliente;
  FdadosGeraisCliente_Specified := True;
end;

function clientesExcluirClientesIn.dadosGeraisCliente_Specified(Index: Integer): boolean;
begin
  Result := FdadosGeraisCliente_Specified;
end;

procedure clientesExcluirClientesIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesExcluirClientesIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesExcluirClientesIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesExcluirClientesIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesExcluirClientesIn.SetsigInt(Index: Integer; const Astring: string);
begin
  FsigInt := Astring;
  FsigInt_Specified := True;
end;

function clientesExcluirClientesIn.sigInt_Specified(Index: Integer): boolean;
begin
  Result := FsigInt_Specified;
end;

procedure clientesGravarClientes5OutRetornosClientes.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes5OutRetornosClientes.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes5OutRetornosClientes.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes5OutRetornosClientes.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes5OutRetornosClientes.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function clientesGravarClientes5OutRetornosClientes.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes5OutRetornosClientes.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes5OutRetornosClientes.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes5OutRetornosClientes.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientes5OutRetornosClientes.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetcepEnt(Index: Integer; const Astring: string);
begin
  FcepEnt := Astring;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetcgcEnt(Index: Integer; const Astring: string);
begin
  FcgcEnt := Astring;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetiniEnt(Index: Integer; const Astring: string);
begin
  FiniEnt := Astring;
  FiniEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.iniEnt_Specified(Index: Integer): boolean;
begin
  Result := FiniEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetprxEnt(Index: Integer; const Astring: string);
begin
  FprxEnt := Astring;
  FprxEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.prxEnt_Specified(Index: Integer): boolean;
begin
  Result := FprxEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetseqEnv(Index: Integer; const Astring: string);
begin
  FseqEnv := Astring;
  FseqEnv_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.seqEnv_Specified(Index: Integer): boolean;
begin
  Result := FseqEnv_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SetsitReg(Index: Integer; const Astring: string);
begin
  FsitReg := Astring;
  FsitReg_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.sitReg_Specified(Index: Integer): boolean;
begin
  Result := FsitReg_Specified;
end;

procedure clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.SettipEnt(Index: Integer; const Astring: string);
begin
  FtipEnt := Astring;
  FtipEnt_Specified := True;
end;

function clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega.tipEnt_Specified(Index: Integer): boolean;
begin
  Result := FtipEnt_Specified;
end;

constructor clientesGravarClientes5Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesGravarClientes5Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosClientes)-1 do
    System.SysUtils.FreeAndNil(FretornosClientes[I]);
  System.SetLength(FretornosClientes, 0);
  for I := 0 to System.Length(FretornosEnderecosEntrega)-1 do
    System.SysUtils.FreeAndNil(FretornosEnderecosEntrega[I]);
  System.SetLength(FretornosEnderecosEntrega, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes5Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesGravarClientes5Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesGravarClientes5Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesGravarClientes5Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesGravarClientes5Out.SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes5OutRetornosClientes: Array_Of_clientesGravarClientes5OutRetornosClientes);
begin
  FretornosClientes := AArray_Of_clientesGravarClientes5OutRetornosClientes;
  FretornosClientes_Specified := True;
end;

function clientesGravarClientes5Out.retornosClientes_Specified(Index: Integer): boolean;
begin
  Result := FretornosClientes_Specified;
end;

procedure clientesGravarClientes5Out.SetretornosEnderecosEntrega(Index: Integer; const AArray_Of_clientesGravarClientes5OutRetornosEnderecosEntrega: Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega);
begin
  FretornosEnderecosEntrega := AArray_Of_clientesGravarClientes5OutRetornosEnderecosEntrega;
  FretornosEnderecosEntrega_Specified := True;
end;

function clientesGravarClientes5Out.retornosEnderecosEntrega_Specified(Index: Integer): boolean;
begin
  Result := FretornosEnderecosEntrega_Specified;
end;

procedure clientesGravarClientes5Out.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarClientes5Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

constructor clientesConsultarOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesConsultarOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosConsultas)-1 do
    System.SysUtils.FreeAndNil(FretornosConsultas[I]);
  System.SetLength(FretornosConsultas, 0);
  inherited Destroy;
end;

procedure clientesConsultarOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesConsultarOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesConsultarOut.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesConsultarOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesConsultarOut.SetretornosConsultas(Index: Integer; const AArray_Of_clientesConsultarOutRetornosConsultas: Array_Of_clientesConsultarOutRetornosConsultas);
begin
  FretornosConsultas := AArray_Of_clientesConsultarOutRetornosConsultas;
  FretornosConsultas_Specified := True;
end;

function clientesConsultarOut.retornosConsultas_Specified(Index: Integer): boolean;
begin
  Result := FretornosConsultas_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetbaiEnt(Index: Integer; const Astring: string);
begin
  FbaiEnt := Astring;
  FbaiEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.baiEnt_Specified(Index: Integer): boolean;
begin
  Result := FbaiEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetcepEnt(Index: Integer; const Astring: string);
begin
  FcepEnt := Astring;
  FcepEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.cepEnt_Specified(Index: Integer): boolean;
begin
  Result := FcepEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetcgcEnt(Index: Integer; const Astring: string);
begin
  FcgcEnt := Astring;
  FcgcEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.cgcEnt_Specified(Index: Integer): boolean;
begin
  Result := FcgcEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetcidEnt(Index: Integer; const Astring: string);
begin
  FcidEnt := Astring;
  FcidEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.cidEnt_Specified(Index: Integer): boolean;
begin
  Result := FcidEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetcplEnt(Index: Integer; const Astring: string);
begin
  FcplEnt := Astring;
  FcplEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.cplEnt_Specified(Index: Integer): boolean;
begin
  Result := FcplEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetendEnt(Index: Integer; const Astring: string);
begin
  FendEnt := Astring;
  FendEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.endEnt_Specified(Index: Integer): boolean;
begin
  Result := FendEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetestEnt(Index: Integer; const Astring: string);
begin
  FestEnt := Astring;
  FestEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.estEnt_Specified(Index: Integer): boolean;
begin
  Result := FestEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetiniEnt(Index: Integer; const Astring: string);
begin
  FiniEnt := Astring;
  FiniEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.iniEnt_Specified(Index: Integer): boolean;
begin
  Result := FiniEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetinsEnt(Index: Integer; const Astring: string);
begin
  FinsEnt := Astring;
  FinsEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.insEnt_Specified(Index: Integer): boolean;
begin
  Result := FinsEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetnenEnt(Index: Integer; const Astring: string);
begin
  FnenEnt := Astring;
  FnenEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.nenEnt_Specified(Index: Integer): boolean;
begin
  Result := FnenEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetnomCli(Index: Integer; const Astring: string);
begin
  FnomCli := Astring;
  FnomCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.nomCli_Specified(Index: Integer): boolean;
begin
  Result := FnomCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetprxEnt(Index: Integer; const Astring: string);
begin
  FprxEnt := Astring;
  FprxEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.prxEnt_Specified(Index: Integer): boolean;
begin
  Result := FprxEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SetsitReg(Index: Integer; const Astring: string);
begin
  FsitReg := Astring;
  FsitReg_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.sitReg_Specified(Index: Integer): boolean;
begin
  Result := FsitReg_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.SettipEnt(Index: Integer; const Astring: string);
begin
  FtipEnt := Astring;
  FtipEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega.tipEnt_Specified(Index: Integer): boolean;
begin
  Result := FtipEnt_Specified;
end;

constructor clientesGravarClientes3Out.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesGravarClientes3Out.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosClientes)-1 do
    System.SysUtils.FreeAndNil(FretornosClientes[I]);
  System.SetLength(FretornosClientes, 0);
  inherited Destroy;
end;

procedure clientesGravarClientes3Out.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesGravarClientes3Out.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesGravarClientes3Out.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesGravarClientes3Out.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesGravarClientes3Out.SetretornosClientes(Index: Integer; const AArray_Of_clientesGravarClientes3OutRetornosClientes: Array_Of_clientesGravarClientes3OutRetornosClientes);
begin
  FretornosClientes := AArray_Of_clientesGravarClientes3OutRetornosClientes;
  FretornosClientes_Specified := True;
end;

function clientesGravarClientes3Out.retornosClientes_Specified(Index: Integer): boolean;
begin
  Result := FretornosClientes_Specified;
end;

procedure clientesGravarClientes3Out.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarClientes3Out.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetacePar(Index: Integer; const Astring: string);
begin
  FacePar := Astring;
  FacePar_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.acePar_Specified(Index: Integer): boolean;
begin
  Result := FacePar_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetacrDia(Index: Integer; const AInteger: Integer);
begin
  FacrDia := AInteger;
  FacrDia_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.acrDia_Specified(Index: Integer): boolean;
begin
  Result := FacrDia_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetantDsc(Index: Integer; const Astring: string);
begin
  FantDsc := Astring;
  FantDsc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.antDsc_Specified(Index: Integer): boolean;
begin
  Result := FantDsc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetavaAti(Index: Integer; const Astring: string);
begin
  FavaAti := Astring;
  FavaAti_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.avaAti_Specified(Index: Integer): boolean;
begin
  Result := FavaAti_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetavaMot(Index: Integer; const AInteger: Integer);
begin
  FavaMot := AInteger;
  FavaMot_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.avaMot_Specified(Index: Integer): boolean;
begin
  Result := FavaMot_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetavaObs(Index: Integer; const Astring: string);
begin
  FavaObs := Astring;
  FavaObs_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.avaObs_Specified(Index: Integer): boolean;
begin
  Result := FavaObs_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetavaVlr(Index: Integer; const ADouble: Double);
begin
  FavaVlr := ADouble;
  FavaVlr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.avaVlr_Specified(Index: Integer): boolean;
begin
  Result := FavaVlr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetavaVls(Index: Integer; const ADouble: Double);
begin
  FavaVls := ADouble;
  FavaVls_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.avaVls_Specified(Index: Integer): boolean;
begin
  Result := FavaVls_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetavaVlu(Index: Integer; const ADouble: Double);
begin
  FavaVlu := ADouble;
  FavaVlu_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.avaVlu_Specified(Index: Integer): boolean;
begin
  Result := FavaVlu_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcatCli(Index: Integer; const AInteger: Integer);
begin
  FcatCli := AInteger;
  FcatCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.catCli_Specified(Index: Integer): boolean;
begin
  Result := FcatCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetccbCli(Index: Integer; const Astring: string);
begin
  FccbCli := Astring;
  FccbCli_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ccbCli_Specified(Index: Integer): boolean;
begin
  Result := FccbCli_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcifFob(Index: Integer; const Astring: string);
begin
  FcifFob := Astring;
  FcifFob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.cifFob_Specified(Index: Integer): boolean;
begin
  Result := FcifFob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcnpjFilial(Index: Integer; const Astring: string);
begin
  FcnpjFilial := Astring;
  FcnpjFilial_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.cnpjFilial_Specified(Index: Integer): boolean;
begin
  Result := FcnpjFilial_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodAge(Index: Integer; const Astring: string);
begin
  FcodAge := Astring;
  FcodAge_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codAge_Specified(Index: Integer): boolean;
begin
  Result := FcodAge_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodBan(Index: Integer; const Astring: string);
begin
  FcodBan := Astring;
  FcodBan_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codBan_Specified(Index: Integer): boolean;
begin
  Result := FcodBan_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodCpg(Index: Integer; const Astring: string);
begin
  FcodCpg := Astring;
  FcodCpg_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codCpg_Specified(Index: Integer): boolean;
begin
  Result := FcodCpg_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodCrp(Index: Integer; const Astring: string);
begin
  FcodCrp := Astring;
  FcodCrp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codCrp_Specified(Index: Integer): boolean;
begin
  Result := FcodCrp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodEmp(Index: Integer; const AInteger: Integer);
begin
  FcodEmp := AInteger;
  FcodEmp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodFcr(Index: Integer; const Astring: string);
begin
  FcodFcr := Astring;
  FcodFcr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codFcr_Specified(Index: Integer): boolean;
begin
  Result := FcodFcr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodFil(Index: Integer; const AInteger: Integer);
begin
  FcodFil := AInteger;
  FcodFil_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodFpg(Index: Integer; const AInteger: Integer);
begin
  FcodFpg := AInteger;
  FcodFpg_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codFpg_Specified(Index: Integer): boolean;
begin
  Result := FcodFpg_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodFrj(Index: Integer; const Astring: string);
begin
  FcodFrj := Astring;
  FcodFrj_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codFrj_Specified(Index: Integer): boolean;
begin
  Result := FcodFrj_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodIn1(Index: Integer; const Astring: string);
begin
  FcodIn1 := Astring;
  FcodIn1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codIn1_Specified(Index: Integer): boolean;
begin
  Result := FcodIn1_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodIn2(Index: Integer; const Astring: string);
begin
  FcodIn2 := Astring;
  FcodIn2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codIn2_Specified(Index: Integer): boolean;
begin
  Result := FcodIn2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodMar(Index: Integer; const Astring: string);
begin
  FcodMar := Astring;
  FcodMar_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codMar_Specified(Index: Integer): boolean;
begin
  Result := FcodMar_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodRed(Index: Integer; const AInteger: Integer);
begin
  FcodRed := AInteger;
  FcodRed_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codRed_Specified(Index: Integer): boolean;
begin
  Result := FcodRed_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodRep(Index: Integer; const AInteger: Integer);
begin
  FcodRep := AInteger;
  FcodRep_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codRep_Specified(Index: Integer): boolean;
begin
  Result := FcodRep_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodRve(Index: Integer; const Astring: string);
begin
  FcodRve := Astring;
  FcodRve_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codRve_Specified(Index: Integer): boolean;
begin
  Result := FcodRve_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodTab(Index: Integer; const Astring: string);
begin
  FcodTab := Astring;
  FcodTab_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codTab_Specified(Index: Integer): boolean;
begin
  Result := FcodTab_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodTic(Index: Integer; const Astring: string);
begin
  FcodTic := Astring;
  FcodTic_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codTic_Specified(Index: Integer): boolean;
begin
  Result := FcodTic_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodTpr(Index: Integer; const Astring: string);
begin
  FcodTpr := Astring;
  FcodTpr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codTpr_Specified(Index: Integer): boolean;
begin
  Result := FcodTpr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodTra(Index: Integer; const AInteger: Integer);
begin
  FcodTra := AInteger;
  FcodTra_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codTra_Specified(Index: Integer): boolean;
begin
  Result := FcodTra_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodTrd(Index: Integer; const Astring: string);
begin
  FcodTrd := Astring;
  FcodTrd_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codTrd_Specified(Index: Integer): boolean;
begin
  Result := FcodTrd_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcodVen(Index: Integer; const AInteger: Integer);
begin
  FcodVen := AInteger;
  FcodVen_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.codVen_Specified(Index: Integer): boolean;
begin
  Result := FcodVen_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetconFin(Index: Integer; const Astring: string);
begin
  FconFin := Astring;
  FconFin_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.conFin_Specified(Index: Integer): boolean;
begin
  Result := FconFin_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetcriEdv(Index: Integer; const Astring: string);
begin
  FcriEdv := Astring;
  FcriEdv_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.criEdv_Specified(Index: Integer): boolean;
begin
  Result := FcriEdv_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctaAad(Index: Integer; const AInteger: Integer);
begin
  FctaAad := AInteger;
  FctaAad_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctaAad_Specified(Index: Integer): boolean;
begin
  Result := FctaAad_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctaAux(Index: Integer; const AInteger: Integer);
begin
  FctaAux := AInteger;
  FctaAux_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctaAux_Specified(Index: Integer): boolean;
begin
  Result := FctaAux_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctaFcr(Index: Integer; const AInteger: Integer);
begin
  FctaFcr := AInteger;
  FctaFcr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctaFcr_Specified(Index: Integer): boolean;
begin
  Result := FctaFcr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctaFdv(Index: Integer; const AInteger: Integer);
begin
  FctaFdv := AInteger;
  FctaFdv_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctaFdv_Specified(Index: Integer): boolean;
begin
  Result := FctaFdv_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctaRcr(Index: Integer; const AInteger: Integer);
begin
  FctaRcr := AInteger;
  FctaRcr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctaRcr_Specified(Index: Integer): boolean;
begin
  Result := FctaRcr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctaRed(Index: Integer; const AInteger: Integer);
begin
  FctaRed := AInteger;
  FctaRed_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctaRed_Specified(Index: Integer): boolean;
begin
  Result := FctaRed_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetctrPad(Index: Integer; const AInteger: Integer);
begin
  FctrPad := AInteger;
  FctrPad_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ctrPad_Specified(Index: Integer): boolean;
begin
  Result := FctrPad_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdatLim(Index: Integer; const Astring: string);
begin
  FdatLim := Astring;
  FdatLim_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.datLim_Specified(Index: Integer): boolean;
begin
  Result := FdatLim_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdatPmr(Index: Integer; const Astring: string);
begin
  FdatPmr := Astring;
  FdatPmr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.datPmr_Specified(Index: Integer): boolean;
begin
  Result := FdatPmr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdiaEsp(Index: Integer; const Astring: string);
begin
  FdiaEsp := Astring;
  FdiaEsp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.diaEsp_Specified(Index: Integer): boolean;
begin
  Result := FdiaEsp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdiaMe1(Index: Integer; const AInteger: Integer);
begin
  FdiaMe1 := AInteger;
  FdiaMe1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.diaMe1_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe1_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdiaMe2(Index: Integer; const AInteger: Integer);
begin
  FdiaMe2 := AInteger;
  FdiaMe2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.diaMe2_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdiaMe3(Index: Integer; const AInteger: Integer);
begin
  FdiaMe3 := AInteger;
  FdiaMe3_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.diaMe3_Specified(Index: Integer): boolean;
begin
  Result := FdiaMe3_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetdscPrd(Index: Integer; const Astring: string);
begin
  FdscPrd := Astring;
  FdscPrd_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.dscPrd_Specified(Index: Integer): boolean;
begin
  Result := FdscPrd_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetecpCnp(Index: Integer; const Astring: string);
begin
  FecpCnp := Astring;
  FecpCnp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.ecpCnp_Specified(Index: Integer): boolean;
begin
  Result := FecpCnp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetexiAge(Index: Integer; const Astring: string);
begin
  FexiAge := Astring;
  FexiAge_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.exiAge_Specified(Index: Integer): boolean;
begin
  Result := FexiAge_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetexiLcp(Index: Integer; const Astring: string);
begin
  FexiLcp := Astring;
  FexiLcp_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.exiLcp_Specified(Index: Integer): boolean;
begin
  Result := FexiLcp_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetfveCpg(Index: Integer; const Astring: string);
begin
  FfveCpg := Astring;
  FfveCpg_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.fveCpg_Specified(Index: Integer): boolean;
begin
  Result := FfveCpg_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetfveFpg(Index: Integer; const Astring: string);
begin
  FfveFpg := Astring;
  FfveFpg_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.fveFpg_Specified(Index: Integer): boolean;
begin
  Result := FfveFpg_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetfveTns(Index: Integer; const Astring: string);
begin
  FfveTns := Astring;
  FfveTns_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.fveTns_Specified(Index: Integer): boolean;
begin
  Result := FfveTns_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetgerTcc(Index: Integer; const Astring: string);
begin
  FgerTcc := Astring;
  FgerTcc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.gerTcc_Specified(Index: Integer): boolean;
begin
  Result := FgerTcc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetindOrf(Index: Integer; const Astring: string);
begin
  FindOrf := Astring;
  FindOrf_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.indOrf_Specified(Index: Integer): boolean;
begin
  Result := FindOrf_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetlimApr(Index: Integer; const Astring: string);
begin
  FlimApr := Astring;
  FlimApr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.limApr_Specified(Index: Integer): boolean;
begin
  Result := FlimApr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperAqa(Index: Integer; const AInteger: Integer);
begin
  FperAqa := AInteger;
  FperAqa_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perAqa_Specified(Index: Integer): boolean;
begin
  Result := FperAqa_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperCcr(Index: Integer; const Astring: string);
begin
  FperCcr := Astring;
  FperCcr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perCcr_Specified(Index: Integer): boolean;
begin
  Result := FperCcr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperCom(Index: Integer; const AInteger: Integer);
begin
  FperCom := AInteger;
  FperCom_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perCom_Specified(Index: Integer): boolean;
begin
  Result := FperCom_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperDs1(Index: Integer; const ADouble: Double);
begin
  FperDs1 := ADouble;
  FperDs1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perDs1_Specified(Index: Integer): boolean;
begin
  Result := FperDs1_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperDs2(Index: Integer; const ADouble: Double);
begin
  FperDs2 := ADouble;
  FperDs2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perDs2_Specified(Index: Integer): boolean;
begin
  Result := FperDs2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperDs3(Index: Integer; const ADouble: Double);
begin
  FperDs3 := ADouble;
  FperDs3_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perDs3_Specified(Index: Integer): boolean;
begin
  Result := FperDs3_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperDs4(Index: Integer; const ADouble: Double);
begin
  FperDs4 := ADouble;
  FperDs4_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perDs4_Specified(Index: Integer): boolean;
begin
  Result := FperDs4_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperDs5(Index: Integer; const ADouble: Double);
begin
  FperDs5 := ADouble;
  FperDs5_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perDs5_Specified(Index: Integer): boolean;
begin
  Result := FperDs5_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperDsc(Index: Integer; const ADouble: Double);
begin
  FperDsc := ADouble;
  FperDsc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perDsc_Specified(Index: Integer): boolean;
begin
  Result := FperDsc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperEmb(Index: Integer; const ADouble: Double);
begin
  FperEmb := ADouble;
  FperEmb_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perEmb_Specified(Index: Integer): boolean;
begin
  Result := FperEmb_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperEnc(Index: Integer; const ADouble: Double);
begin
  FperEnc := ADouble;
  FperEnc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perEnc_Specified(Index: Integer): boolean;
begin
  Result := FperEnc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperFre(Index: Integer; const ADouble: Double);
begin
  FperFre := ADouble;
  FperFre_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perFre_Specified(Index: Integer): boolean;
begin
  Result := FperFre_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperIss(Index: Integer; const ADouble: Double);
begin
  FperIss := ADouble;
  FperIss_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perIss_Specified(Index: Integer): boolean;
begin
  Result := FperIss_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperOf1(Index: Integer; const AInteger: Integer);
begin
  FperOf1 := AInteger;
  FperOf1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perOf1_Specified(Index: Integer): boolean;
begin
  Result := FperOf1_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperOf2(Index: Integer; const AInteger: Integer);
begin
  FperOf2 := AInteger;
  FperOf2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perOf2_Specified(Index: Integer): boolean;
begin
  Result := FperOf2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperOut(Index: Integer; const ADouble: Double);
begin
  FperOut := ADouble;
  FperOut_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perOut_Specified(Index: Integer): boolean;
begin
  Result := FperOut_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetperSeg(Index: Integer; const ADouble: Double);
begin
  FperSeg := ADouble;
  FperSeg_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.perSeg_Specified(Index: Integer): boolean;
begin
  Result := FperSeg_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetporNa1(Index: Integer; const Astring: string);
begin
  FporNa1 := Astring;
  FporNa1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.porNa1_Specified(Index: Integer): boolean;
begin
  Result := FporNa1_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetporNa2(Index: Integer; const Astring: string);
begin
  FporNa2 := Astring;
  FporNa2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.porNa2_Specified(Index: Integer): boolean;
begin
  Result := FporNa2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetporSi1(Index: Integer; const Astring: string);
begin
  FporSi1 := Astring;
  FporSi1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.porSi1_Specified(Index: Integer): boolean;
begin
  Result := FporSi1_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetporSi2(Index: Integer; const Astring: string);
begin
  FporSi2 := Astring;
  FporSi2_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.porSi2_Specified(Index: Integer): boolean;
begin
  Result := FporSi2_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetprdDsc(Index: Integer; const Astring: string);
begin
  FprdDsc := Astring;
  FprdDsc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.prdDsc_Specified(Index: Integer): boolean;
begin
  Result := FprdDsc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetqtdChs(Index: Integer; const AInteger: Integer);
begin
  FqtdChs := AInteger;
  FqtdChs_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.qtdChs_Specified(Index: Integer): boolean;
begin
  Result := FqtdChs_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetqtdDcv(Index: Integer; const AInteger: Integer);
begin
  FqtdDcv := AInteger;
  FqtdDcv_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.qtdDcv_Specified(Index: Integer): boolean;
begin
  Result := FqtdDcv_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetqtdPrt(Index: Integer; const AInteger: Integer);
begin
  FqtdPrt := AInteger;
  FqtdPrt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.qtdPrt_Specified(Index: Integer): boolean;
begin
  Result := FqtdPrt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetrecDtj(Index: Integer; const AInteger: Integer);
begin
  FrecDtj := AInteger;
  FrecDtj_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.recDtj_Specified(Index: Integer): boolean;
begin
  Result := FrecDtj_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetrecDtm(Index: Integer; const AInteger: Integer);
begin
  FrecDtm := AInteger;
  FrecDtm_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.recDtm_Specified(Index: Integer): boolean;
begin
  Result := FrecDtm_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetrecJmm(Index: Integer; const ADouble: Double);
begin
  FrecJmm := ADouble;
  FrecJmm_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.recJmm_Specified(Index: Integer): boolean;
begin
  Result := FrecJmm_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetrecMul(Index: Integer; const ADouble: Double);
begin
  FrecMul := ADouble;
  FrecMul_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.recMul_Specified(Index: Integer): boolean;
begin
  Result := FrecMul_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetrecTjr(Index: Integer; const Astring: string);
begin
  FrecTjr := Astring;
  FrecTjr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.recTjr_Specified(Index: Integer): boolean;
begin
  Result := FrecTjr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetseqCob(Index: Integer; const AInteger: Integer);
begin
  FseqCob := AInteger;
  FseqCob_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.seqCob_Specified(Index: Integer): boolean;
begin
  Result := FseqCob_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetseqEnt(Index: Integer; const AInteger: Integer);
begin
  FseqEnt := AInteger;
  FseqEnt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.seqEnt_Specified(Index: Integer): boolean;
begin
  Result := FseqEnt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SettolDsc(Index: Integer; const AInteger: Integer);
begin
  FtolDsc := AInteger;
  FtolDsc_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.tolDsc_Specified(Index: Integer): boolean;
begin
  Result := FtolDsc_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetvlrAcr(Index: Integer; const ADouble: Double);
begin
  FvlrAcr := ADouble;
  FvlrAcr_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.vlrAcr_Specified(Index: Integer): boolean;
begin
  Result := FvlrAcr_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetvlrLim(Index: Integer; const ADouble: Double);
begin
  FvlrLim := ADouble;
  FvlrLim_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.vlrLim_Specified(Index: Integer): boolean;
begin
  Result := FvlrLim_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.SetvlrPrt(Index: Integer; const ADouble: Double);
begin
  FvlrPrt := ADouble;
  FvlrPrt_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente.vlrPrt_Specified(Index: Integer): boolean;
begin
  Result := FvlrPrt_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetbaiCid(Index: Integer; const Astring: string);
begin
  FbaiCid := Astring;
  FbaiCid_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.baiCid_Specified(Index: Integer): boolean;
begin
  Result := FbaiCid_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetcepFim(Index: Integer; const Astring: string);
begin
  FcepFim := Astring;
  FcepFim_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.cepFim_Specified(Index: Integer): boolean;
begin
  Result := FcepFim_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetcepIni(Index: Integer; const Astring: string);
begin
  FcepIni := Astring;
  FcepIni_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.cepIni_Specified(Index: Integer): boolean;
begin
  Result := FcepIni_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetcepPol(Index: Integer; const Astring: string);
begin
  FcepPol := Astring;
  FcepPol_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.cepPol_Specified(Index: Integer): boolean;
begin
  Result := FcepPol_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetcodRai(Index: Integer; const AInteger: Integer);
begin
  FcodRai := AInteger;
  FcodRai_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.codRai_Specified(Index: Integer): boolean;
begin
  Result := FcodRai_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetendCid(Index: Integer; const Astring: string);
begin
  FendCid := Astring;
  FendCid_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.endCid_Specified(Index: Integer): boolean;
begin
  Result := FendCid_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteCadastroCEP.SetnomCid(Index: Integer; const Astring: string);
begin
  FnomCid := Astring;
  FnomCid_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteCadastroCEP.nomCid_Specified(Index: Integer): boolean;
begin
  Result := FnomCid_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetcidNat(Index: Integer; const Astring: string);
begin
  FcidNat := Astring;
  FcidNat_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.cidNat_Specified(Index: Integer): boolean;
begin
  Result := FcidNat_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetcodSex(Index: Integer; const Astring: string);
begin
  FcodSex := Astring;
  FcodSex_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.codSex_Specified(Index: Integer): boolean;
begin
  Result := FcodSex_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetdatNas(Index: Integer; const Astring: string);
begin
  FdatNas := Astring;
  FdatNas_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.datNas_Specified(Index: Integer): boolean;
begin
  Result := FdatNas_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetdatRge(Index: Integer; const Astring: string);
begin
  FdatRge := Astring;
  FdatRge_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.datRge_Specified(Index: Integer): boolean;
begin
  Result := FdatRge_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetestCiv(Index: Integer; const AInteger: Integer);
begin
  FestCiv := AInteger;
  FestCiv_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.estCiv_Specified(Index: Integer): boolean;
begin
  Result := FestCiv_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetnomMae(Index: Integer; const Astring: string);
begin
  FnomMae := Astring;
  FnomMae_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.nomMae_Specified(Index: Integer): boolean;
begin
  Result := FnomMae_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetnomPai(Index: Integer; const Astring: string);
begin
  FnomPai := Astring;
  FnomPai_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.nomPai_Specified(Index: Integer): boolean;
begin
  Result := FnomPai_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetnumRge(Index: Integer; const Astring: string);
begin
  FnumRge := Astring;
  FnumRge_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.numRge_Specified(Index: Integer): boolean;
begin
  Result := FnumRge_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetorgRge(Index: Integer; const Astring: string);
begin
  ForgRge := Astring;
  ForgRge_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.orgRge_Specified(Index: Integer): boolean;
begin
  Result := ForgRge_Specified;
end;

procedure clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.SetrefCm1(Index: Integer; const Astring: string);
begin
  FrefCm1 := Astring;
  FrefCm1_Specified := True;
end;

function clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica.refCm1_Specified(Index: Integer): boolean;
begin
  Result := FrefCm1_Specified;
end;

procedure clientesGravarClientes3OutRetornosClientes.SetcgcCpf(Index: Integer; const Astring: string);
begin
  FcgcCpf := Astring;
  FcgcCpf_Specified := True;
end;

function clientesGravarClientes3OutRetornosClientes.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesGravarClientes3OutRetornosClientes.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarClientes3OutRetornosClientes.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarClientes3OutRetornosClientes.SetcodFor(Index: Integer; const Astring: string);
begin
  FcodFor := Astring;
  FcodFor_Specified := True;
end;

function clientesGravarClientes3OutRetornosClientes.codFor_Specified(Index: Integer): boolean;
begin
  Result := FcodFor_Specified;
end;

procedure clientesGravarClientes3OutRetornosClientes.SetideExt(Index: Integer; const Astring: string);
begin
  FideExt := Astring;
  FideExt_Specified := True;
end;

function clientesGravarClientes3OutRetornosClientes.ideExt_Specified(Index: Integer): boolean;
begin
  Result := FideExt_Specified;
end;

procedure clientesGravarClientes3OutRetornosClientes.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarClientes3OutRetornosClientes.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarContatosOutRetornosContatos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarContatosOutRetornosContatos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarContatosOutRetornosContatos.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function clientesGravarContatosOutRetornosContatos.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

procedure clientesGravarContatosOutRetornosContatos.SetseqCto(Index: Integer; const AInteger: Integer);
begin
  FseqCto := AInteger;
  FseqCto_Specified := True;
end;

function clientesGravarContatosOutRetornosContatos.seqCto_Specified(Index: Integer): boolean;
begin
  Result := FseqCto_Specified;
end;

procedure clientesGravarContatosOutRetornosContatos.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarContatosOutRetornosContatos.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

procedure clientesConsultarIn.SetcgcCpf(Index: Integer; const AInteger: Integer);
begin
  FcgcCpf := AInteger;
  FcgcCpf_Specified := True;
end;

function clientesConsultarIn.cgcCpf_Specified(Index: Integer): boolean;
begin
  Result := FcgcCpf_Specified;
end;

procedure clientesConsultarIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesConsultarIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesConsultarIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesConsultarIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor clientesGravarContatosOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor clientesGravarContatosOut.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FretornosContatos)-1 do
    System.SysUtils.FreeAndNil(FretornosContatos[I]);
  System.SetLength(FretornosContatos, 0);
  inherited Destroy;
end;

procedure clientesGravarContatosOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function clientesGravarContatosOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure clientesGravarContatosOut.SetmensagemRetorno(Index: Integer; const Astring: string);
begin
  FmensagemRetorno := Astring;
  FmensagemRetorno_Specified := True;
end;

function clientesGravarContatosOut.mensagemRetorno_Specified(Index: Integer): boolean;
begin
  Result := FmensagemRetorno_Specified;
end;

procedure clientesGravarContatosOut.SetretornosContatos(Index: Integer; const AArray_Of_clientesGravarContatosOutRetornosContatos: Array_Of_clientesGravarContatosOutRetornosContatos);
begin
  FretornosContatos := AArray_Of_clientesGravarContatosOutRetornosContatos;
  FretornosContatos_Specified := True;
end;

function clientesGravarContatosOut.retornosContatos_Specified(Index: Integer): boolean;
begin
  Result := FretornosContatos_Specified;
end;

procedure clientesGravarContatosOut.SettipoRetorno(Index: Integer; const AInteger: Integer);
begin
  FtipoRetorno := AInteger;
  FtipoRetorno_Specified := True;
end;

function clientesGravarContatosOut.tipoRetorno_Specified(Index: Integer): boolean;
begin
  Result := FtipoRetorno_Specified;
end;

destructor clientesGravarContatosIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FdadosContatos)-1 do
    System.SysUtils.FreeAndNil(FdadosContatos[I]);
  System.SetLength(FdadosContatos, 0);
  inherited Destroy;
end;

procedure clientesGravarContatosIn.SetdadosContatos(Index: Integer; const AArray_Of_clientesGravarContatosInDadosContatos: Array_Of_clientesGravarContatosInDadosContatos);
begin
  FdadosContatos := AArray_Of_clientesGravarContatosInDadosContatos;
  FdadosContatos_Specified := True;
end;

function clientesGravarContatosIn.dadosContatos_Specified(Index: Integer): boolean;
begin
  Result := FdadosContatos_Specified;
end;

procedure clientesGravarContatosIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function clientesGravarContatosIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure clientesGravarContatosIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function clientesGravarContatosIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetcarCto(Index: Integer; const Astring: string);
begin
  FcarCto := Astring;
  FcarCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.carCto_Specified(Index: Integer): boolean;
begin
  Result := FcarCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetcodCli(Index: Integer; const AInteger: Integer);
begin
  FcodCli := AInteger;
  FcodCli_Specified := True;
end;

function clientesGravarContatosInDadosContatos.codCli_Specified(Index: Integer): boolean;
begin
  Result := FcodCli_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetcodNiv(Index: Integer; const AInteger: Integer);
begin
  FcodNiv := AInteger;
  FcodNiv_Specified := True;
end;

function clientesGravarContatosInDadosContatos.codNiv_Specified(Index: Integer): boolean;
begin
  Result := FcodNiv_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetdatNas(Index: Integer; const Astring: string);
begin
  FdatNas := Astring;
  FdatNas_Specified := True;
end;

function clientesGravarContatosInDadosContatos.datNas_Specified(Index: Integer): boolean;
begin
  Result := FdatNas_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetfaxCto(Index: Integer; const Astring: string);
begin
  FfaxCto := Astring;
  FfaxCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.faxCto_Specified(Index: Integer): boolean;
begin
  Result := FfaxCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetfonCt2(Index: Integer; const Astring: string);
begin
  FfonCt2 := Astring;
  FfonCt2_Specified := True;
end;

function clientesGravarContatosInDadosContatos.fonCt2_Specified(Index: Integer): boolean;
begin
  Result := FfonCt2_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetfonCt3(Index: Integer; const Astring: string);
begin
  FfonCt3 := Astring;
  FfonCt3_Specified := True;
end;

function clientesGravarContatosInDadosContatos.fonCt3_Specified(Index: Integer): boolean;
begin
  Result := FfonCt3_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetfonCto(Index: Integer; const Astring: string);
begin
  FfonCto := Astring;
  FfonCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.fonCto_Specified(Index: Integer): boolean;
begin
  Result := FfonCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SethobCon(Index: Integer; const Astring: string);
begin
  FhobCon := Astring;
  FhobCon_Specified := True;
end;

function clientesGravarContatosInDadosContatos.hobCon_Specified(Index: Integer): boolean;
begin
  Result := FhobCon_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetintNet(Index: Integer; const Astring: string);
begin
  FintNet := Astring;
  FintNet_Specified := True;
end;

function clientesGravarContatosInDadosContatos.intNet_Specified(Index: Integer): boolean;
begin
  Result := FintNet_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetnivCto(Index: Integer; const Astring: string);
begin
  FnivCto := Astring;
  FnivCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.nivCto_Specified(Index: Integer): boolean;
begin
  Result := FnivCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetnomCto(Index: Integer; const Astring: string);
begin
  FnomCto := Astring;
  FnomCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.nomCto_Specified(Index: Integer): boolean;
begin
  Result := FnomCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetramCt2(Index: Integer; const AInteger: Integer);
begin
  FramCt2 := AInteger;
  FramCt2_Specified := True;
end;

function clientesGravarContatosInDadosContatos.ramCt2_Specified(Index: Integer): boolean;
begin
  Result := FramCt2_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetramCt3(Index: Integer; const AInteger: Integer);
begin
  FramCt3 := AInteger;
  FramCt3_Specified := True;
end;

function clientesGravarContatosInDadosContatos.ramCt3_Specified(Index: Integer): boolean;
begin
  Result := FramCt3_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetramCto(Index: Integer; const AInteger: Integer);
begin
  FramCto := AInteger;
  FramCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.ramCto_Specified(Index: Integer): boolean;
begin
  Result := FramCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetsetCto(Index: Integer; const Astring: string);
begin
  FsetCto := Astring;
  FsetCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.setCto_Specified(Index: Integer): boolean;
begin
  Result := FsetCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SetsitCto(Index: Integer; const Astring: string);
begin
  FsitCto := Astring;
  FsitCto_Specified := True;
end;

function clientesGravarContatosInDadosContatos.sitCto_Specified(Index: Integer): boolean;
begin
  Result := FsitCto_Specified;
end;

procedure clientesGravarContatosInDadosContatos.SettimCon(Index: Integer; const Astring: string);
begin
  FtimCon := Astring;
  FtimCon_Specified := True;
end;

function clientesGravarContatosInDadosContatos.timCon_Specified(Index: Integer): boolean;
begin
  Result := FtimCon_Specified;
end;

initialization
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), ioLiteral);
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.GravarClientes }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.GravarClientes_2 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_2', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_2', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.GravarClientes_3 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_3', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_3', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.GravarClientes_4 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_4', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_4', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.GravarClientes_5 }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_5', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarClientes_5', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.Consultar }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'Consultar', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'Consultar', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.GravarContatos }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarContatos', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'GravarContatos', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.ExcluirClientes }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'ExcluirClientes', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'ExcluirClientes', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_cad_clientes.obterCliente }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'obterCliente', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_cad_clientes), 'obterCliente', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes2OutRetornosClientes), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes2OutRetornosClientes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4InDadosGeraisCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4InDadosGeraisCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4OutRetornosClientes), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4OutRetornosClientes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4OutRetornosEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes2InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes2InDadosGeraisCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes2InDadosGeraisCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes3InDadosGeraisCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes3InDadosGeraisCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesExcluirClientesInDadosGeraisCliente), 'http://services.senior.com.br', 'Array_Of_clientesExcluirClientesInDadosGeraisCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesExcluirClientesOutRetornosClientes), 'http://services.senior.com.br', 'Array_Of_clientesExcluirClientesOutRetornosClientes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5OutRetornosEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5OutRetornosClientes), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5OutRetornosClientes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientesInDadosGeraisCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientesInDadosGeraisCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientesInDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientesOutRetornosClientes), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientesOutRetornosClientes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientesInDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientesInDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientesInDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes3OutRetornosClientes), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes3OutRetornosClientes');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes3InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarContatosInDadosContatos), 'http://services.senior.com.br', 'Array_Of_clientesGravarContatosInDadosContatos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarClientes5InDadosGeraisCliente), 'http://services.senior.com.br', 'Array_Of_clientesGravarClientes5InDadosGeraisCliente');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesGravarContatosOutRetornosContatos), 'http://services.senior.com.br', 'Array_Of_clientesGravarContatosOutRetornosContatos');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_clientesConsultarOutRetornosConsultas), 'http://services.senior.com.br', 'Array_Of_clientesConsultarOutRetornosConsultas');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3In, 'http://services.senior.com.br', 'clientesGravarClientes3In');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4OutRetornosEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientes4OutRetornosEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4In, 'http://services.senior.com.br', 'clientesGravarClientes4In');
  RemClassRegistry.RegisterXSClass(clientesGravarClientesIn, 'http://services.senior.com.br', 'clientesGravarClientesIn');
  RemClassRegistry.RegisterXSClass(clientesobterClienteIn, 'http://services.senior.com.br', 'clientesobterClienteIn');
  RemClassRegistry.RegisterXSClass(clientesobterClienteOut, 'http://services.senior.com.br', 'clientesobterClienteOut');
  RemClassRegistry.RegisterSerializeOptions(clientesobterClienteOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2Out, 'http://services.senior.com.br', 'clientesGravarClientes2Out');
  RemClassRegistry.RegisterSerializeOptions(clientesGravarClientes2Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4Out, 'http://services.senior.com.br', 'clientesGravarClientes4Out');
  RemClassRegistry.RegisterSerializeOptions(clientesGravarClientes4Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientes4InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4OutRetornosClientes, 'http://services.senior.com.br', 'clientesGravarClientes4OutRetornosClientes');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente, 'http://services.senior.com.br', 'clientesGravarClientes4InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2OutRetornosClientes, 'http://services.senior.com.br', 'clientesGravarClientes2OutRetornosClientes');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4InDadosGeraisCliente, 'http://services.senior.com.br', 'clientesGravarClientes4InDadosGeraisCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica, 'http://services.senior.com.br', 'clientesGravarClientes4InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes4InDadosGeraisClienteCadastroCEP, 'http://services.senior.com.br', 'clientesGravarClientes4InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSClass(clientesExcluirClientesInDadosGeraisCliente, 'http://services.senior.com.br', 'clientesExcluirClientesInDadosGeraisCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientesInDadosGeraisClienteEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientesInDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesGravarClientesInDadosGeraisClienteDefinicoesCliente, 'http://services.senior.com.br', 'clientesGravarClientesInDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientesOut, 'http://services.senior.com.br', 'clientesGravarClientesOut');
  RemClassRegistry.RegisterSerializeOptions(clientesGravarClientesOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientesOutRetornosClientes, 'http://services.senior.com.br', 'clientesGravarClientesOutRetornosClientes');
  RemClassRegistry.RegisterXSClass(clientesGravarClientesInDadosGeraisClienteClientePessoaFisica, 'http://services.senior.com.br', 'clientesGravarClientesInDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSClass(clientesExcluirClientesOutRetornosClientes, 'http://services.senior.com.br', 'clientesExcluirClientesOutRetornosClientes');
  RemClassRegistry.RegisterXSClass(clientesExcluirClientesOut, 'http://services.senior.com.br', 'clientesExcluirClientesOut');
  RemClassRegistry.RegisterSerializeOptions(clientesExcluirClientesOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientesInDadosGeraisClienteCadastroCEP, 'http://services.senior.com.br', 'clientesGravarClientesInDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSClass(clientesGravarClientesInDadosGeraisCliente, 'http://services.senior.com.br', 'clientesGravarClientesInDadosGeraisCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2In, 'http://services.senior.com.br', 'clientesGravarClientes2In');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente, 'http://services.senior.com.br', 'clientesGravarClientes2InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientes2InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica, 'http://services.senior.com.br', 'clientesGravarClientes2InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2InDadosGeraisCliente, 'http://services.senior.com.br', 'clientesGravarClientes2InDadosGeraisCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes2InDadosGeraisClienteCadastroCEP, 'http://services.senior.com.br', 'clientesGravarClientes2InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3InDadosGeraisCliente, 'http://services.senior.com.br', 'clientesGravarClientes3InDadosGeraisCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5InDadosGeraisClienteCadastroCEP, 'http://services.senior.com.br', 'clientesGravarClientes5InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica, 'http://services.senior.com.br', 'clientesGravarClientes5InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5InDadosGeraisCliente, 'http://services.senior.com.br', 'clientesGravarClientes5InDadosGeraisCliente');
  RemClassRegistry.RegisterXSClass(clientesConsultarOutRetornosConsultas, 'http://services.senior.com.br', 'clientesConsultarOutRetornosConsultas');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5In, 'http://services.senior.com.br', 'clientesGravarClientes5In');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente, 'http://services.senior.com.br', 'clientesGravarClientes5InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5OutRetornosEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientes5OutRetornosEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesExcluirClientesIn, 'http://services.senior.com.br', 'clientesExcluirClientesIn');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5OutRetornosClientes, 'http://services.senior.com.br', 'clientesGravarClientes5OutRetornosClientes');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientes5InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes5Out, 'http://services.senior.com.br', 'clientesGravarClientes5Out');
  RemClassRegistry.RegisterSerializeOptions(clientesGravarClientes5Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesConsultarOut, 'http://services.senior.com.br', 'clientesConsultarOut');
  RemClassRegistry.RegisterSerializeOptions(clientesConsultarOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega, 'http://services.senior.com.br', 'clientesGravarClientes3InDadosGeraisClienteEnderecosEntrega');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3Out, 'http://services.senior.com.br', 'clientesGravarClientes3Out');
  RemClassRegistry.RegisterSerializeOptions(clientesGravarClientes3Out, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente, 'http://services.senior.com.br', 'clientesGravarClientes3InDadosGeraisClienteDefinicoesCliente');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3InDadosGeraisClienteCadastroCEP, 'http://services.senior.com.br', 'clientesGravarClientes3InDadosGeraisClienteCadastroCEP');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica, 'http://services.senior.com.br', 'clientesGravarClientes3InDadosGeraisClienteClientePessoaFisica');
  RemClassRegistry.RegisterXSClass(clientesGravarClientes3OutRetornosClientes, 'http://services.senior.com.br', 'clientesGravarClientes3OutRetornosClientes');
  RemClassRegistry.RegisterXSClass(clientesGravarContatosOutRetornosContatos, 'http://services.senior.com.br', 'clientesGravarContatosOutRetornosContatos');
  RemClassRegistry.RegisterXSClass(clientesConsultarIn, 'http://services.senior.com.br', 'clientesConsultarIn');
  RemClassRegistry.RegisterXSClass(clientesGravarContatosOut, 'http://services.senior.com.br', 'clientesGravarContatosOut');
  RemClassRegistry.RegisterSerializeOptions(clientesGravarContatosOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(clientesGravarContatosIn, 'http://services.senior.com.br', 'clientesGravarContatosIn');
  RemClassRegistry.RegisterXSClass(clientesGravarContatosInDadosContatos, 'http://services.senior.com.br', 'clientesGravarContatosInDadosContatos');

end.