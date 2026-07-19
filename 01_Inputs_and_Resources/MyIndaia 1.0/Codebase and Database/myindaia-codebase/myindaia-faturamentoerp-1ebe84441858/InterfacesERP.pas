unit InterfacesERP;

interface

uses
  Windows, SysUtils;

type
  IFaturamentoERPDados = interface(IInterface)
    // Transações
    procedure BeginTransaction;
    procedure Commit;
    procedure Rollback;
    function InTransaction: Boolean;
    // Consultas
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: String): String; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Integer): Integer; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Double): Double; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: TDateTime): TDateTime; overload;
    function ConsultaSQL(ASQL: String; AParams: array of Variant; ARetorno: Boolean): Boolean; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: String): String; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Integer): Integer; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Double): Double; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: TDateTime): TDateTime; overload;
    function Consulta(ATabela, ACampo: String; ACamposFiltro: array of String; AParams: array of Variant; ARetorno: Boolean): Boolean; overload;
    // Opções de Nota
    function CancelarNota: Boolean;
  end;

  IFaturamentoERP = interface(IInterface)
    procedure Show(Login, Senha: String); overload;
    procedure Show(Login, Senha, Unidade, Produto, Processo: String); overload;
    function ShowModal(Login, Senha: String): Cardinal; overload;
    function ShowModal(Login, Senha, Unidade, Produto, Processo: String): Cardinal; overload;
    function GetUnidade: String;
    procedure SetUnidade(Unidade: String);
    function GetProduto: String;
    procedure SetProduto(Produto: String);
    function GetProcesso: String;
    procedure SetProcesso(Processo: String);
    function GetUsuario: String;
    function GetLogin: String;
    function GetDados: IFaturamentoERPDados;
    //procedure DestroyWindow;
    property Unidade: String read GetUnidade write SetUnidade;
    property Produto: String read GetProduto write SetProduto;
    property Processo: String read GetProcesso write SetProcesso;
    property Usuario: String read GetUsuario;
    property Login: String read GetLogin;
    property Dados: IFaturamentoERPDados read GetDados;
  end;

//  function GetNewFaturamentoERP: IFaturamentoERP; stdcall; external 'FaturamentoERP.dll';

implementation

//var
//  DLL: Cardinal = 0;

//type
//  TGetNewFaturamentoERP = function: IFaturamentoERP; stdcall;

{uses
  ClassesERP;

function GetNewFaturamentoERP: IFaturamentoERP;
begin
  Result := TfrmFaturamentoERP.Create(nil);
end;}

{function GetProc(AProcName: String): Pointer;
begin
  if DLL = 0 then
    DLL := LoadLibrary(PWideChar(ExtractFilePath(ParamStr(0)) + 'FaturamentoERP.dll'));
  if DLL <> 0 then
    Result := GetProcAddress(DLL, PChar(AProcName))
  else
    Result := nil;
end;

procedure FreeLib;
begin
  FreeLibrary(DLL);
end;

function GetNewFaturamentoERP: IFaturamentoERP;
var
  Proc: TGetNewFaturamentoERP;
begin
  @Proc := GetProc('GetNewFaturamentoERP');
  if @Proc <> nil then
    Result := Proc
  else
    Result := nil;
end;}

end.
