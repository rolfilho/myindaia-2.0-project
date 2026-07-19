unit Funcoes;

interface

uses
  SysUtils, IniFiles;

const
  // Tipo de Envio
  _Incluir  = 1;
  _Alterar  = 2;
  _Cancelar = 3;

  // Sistemas
  _Homologacao = 1;
  _Producao    = 2;

  // Status
  _Numerario_Baixado    = 'APPROVED';
  _Numerario_Cancelado  = 'CANCELED';
  _Numerario_Aberto     = 'OPEN';
  _Numerario_Aguardando = 'WAIT';

  _Pagamento_Baixado    = 'APPROVED';
  _Pagamento_Cancelado  = 'CANCELED';
  _Pagamento_Aberto     = 'OPEN';
  _Pagamento_Aguardando = 'WAIT';
  _Pagamento_Bloqueado  = 'BLOCKED';

  _NotaFiscal_Aberta    = 'OPEN';
  _NotaFiscal_Fechada   = 'CLOSED';
  _NotaFiscal_Faturada  = 'INVOICED';
  _NotaFiscal_Liquidada = 'FINISHED';

  // Tipos Fatura
  _NotaFiscal_Servico = 'TAX_INVOICE';
  _NotaFiscal_Despesa = 'TAX_RECEIPT';

type
  IConnection = interface(IInterface)
    function Provider(DefaultValue: String): String;
    function Password(DefaultValue: String): String;
    function Persist_Security_Info(DefaultValue: String): String;
    function User_ID(DefaultValue: String): String;
    function Initial_Catalog(DefaultValue: String): String;
    function Use_Procedure_For_Prepare(DefaultValue: String): String;
    function Auto_Translate(DefaultValue: String): String;
    function Packet_Size(DefaultValue: String): String;
    function Workstation_ID(DefaultValue: String): String;
    function Use_Encryption_For_Data(DefaultValue: String): String;
    function Tag_with_Column_Collation_When_Possible(DefaultValue: String): String;
  end;

  IServer = interface(IInterface)
    function GetProducao: String;
    procedure SetProducao(AServidor: String);
    function GetHomologacao: String;
    procedure SetHomologacao(AServidor: String);
    function PorIndice(AServidor: Integer; ADefault: String = ''): String;
    function PorNome(AServidor: String; ADefault: String = ''): String;
    property Producao: String read GetProducao write SetProducao;
    property Homologacao: String read GetHomologacao write SetHomologacao;
    function Section: String;
  end;

type
  TConnection = class(TInterfacedObject, IConnection)
  public
    function Provider(DefaultValue: String): String;
    function Password(DefaultValue: String): String;
    function Persist_Security_Info(DefaultValue: String): String;
    function User_ID(DefaultValue: String): String;
    function Initial_Catalog(DefaultValue: String): String;
    function Use_Procedure_For_Prepare(DefaultValue: String): String;
    function Auto_Translate(DefaultValue: String): String;
    function Packet_Size(DefaultValue: String): String;
    function Workstation_ID(DefaultValue: String): String;
    function Use_Encryption_For_Data(DefaultValue: String): String;
    function Tag_with_Column_Collation_When_Possible(DefaultValue: String): String;
  end;

const
  Sections: array[_Homologacao.._Producao] of String = ('Homologação', 'Produção');

type
  TServer = class(TInterfacedObject, IServer)
  private
    FSection: String;
    FHomologacao: String;
    FProducao: String;
  public
    constructor Create(ASection, AHomologacao, AProducao: String); virtual;
  public
    function GetProducao: String; virtual;
    procedure SetProducao(AServidor: String); virtual;
    function GetHomologacao: String; virtual;
    procedure SetHomologacao(AServidor: String); virtual;
    function PorIndice(AServidor: Integer; ADefault: String = ''): String; virtual;
    function PorNome(AServidor: String; ADefault: String = ''): String; virtual;
    property Producao: String read GetProducao write SetProducao;
    property Homologacao: String read GetHomologacao write SetHomologacao;
    function Section: String;
  end;

  TWebService = class(TServer)
  public
    procedure SetProducao(AServidor: String); override;
    procedure SetHomologacao(AServidor: String); override;
    function PorNome(AServidor: String; ADefault: String = ''): String; override;
    function PorIndice(AServidor: Integer; ADefault: String = ''): String; override;
  end;

function ConnectionInf: IConnection;
function ServerInf: IServer;
function WebServiceInf: IServer;
function WebServiceJavaInf: IServer;
function JustificaString(Campo : String; Tamanho : Integer): String;
function FStrSpace(Str : String; i : Integer) : String;
function Space(pTamanho : Integer) :String;
function FStrZero(s : String; i : Integer) : String;

function Path: String;
function Config: TIniFile;

implementation

var
  FConfig: TIniFile;
  FPath: String;

function ConnectionInf: IConnection;
begin
  Result := TConnection.Create;
end;

function ServerInf: IServer;
begin
  Result := TServer.Create('Servidor', 'ANTUERPIA', 'INDAIA10');
end;

function WebServiceInf: IServer;
begin
  Result := TWebService.Create('WebService', 'http://senior-hmlg:8080', 'http://senior:8080');
end;

function WebServiceJavaInf: IServer;
begin
  Result := TWebService.Create('WebServiceJava', 'http://139.22.7.34', 'http://139.22.7.34');;
end;

function Path: String;
begin
  Result := FPath;
end;

function Config: TIniFile;
begin
  Result := FConfig;
end;

function JustificaString(Campo : String; Tamanho : Integer): String;
var
  cTexto, cTexto2 : String;
  i, j : Integer;
begin
  campo:= trim(campo);
  if Tamanho <= 0 then
  begin
    JustificaString := Campo;
  end
  else
  begin
    cTexto2 := '';
    Campo   := Campo + ' ';
    while Length(Campo) > 0 do
    begin
      if Length(Campo)<=Tamanho then
      begin
        cTexto2 := cTexto2 + FStrSpace( Trim(Campo), Tamanho);
        Campo   := '';
      end
      else
      begin
        cTexto := Copy(Campo,1,(Tamanho + 1));
        i      := Length(cTexto);
        j      := i;
        while i > 0 do
        begin
          if ( Copy(cTexto, i, 1) = ' ' ) or ( Copy(cTexto, i, 1) = #13 ) then
          begin
            j := i;
            break;
          end;
          i := i - 1;
        end;
        cTexto2 := cTexto2 + FStrSpace( Trim( Copy( cTexto,1,(j-1))), Tamanho );
        Campo   := Copy(Campo,(j),Length(Campo)-i);
      end;
    end;
    JustificaString := cTexto2;
  end;
end;

function FStrSpace(Str : String; i : Integer) : String;
Var
  nr_posicoes : integer;
begin
  { retira ENTERS e PARAGRAFOS do TEXTO }
  str:= StringReplace(str, #13, '', [rfReplaceAll] );
  str:= StringReplace(str, #10, ' ', [rfReplaceAll] );
  //
  nr_posicoes := Length( str );
  if nr_posicoes < i then
    begin
      FStrSpace := str + Space( i - nr_posicoes );  // Completa com espaços
    end
  Else if nr_posicoes > i then
    begin
      FStrSpace := copy( str, 1, i );   // Trunca a string
    end
  Else
    FStrSpace := Str;
end;

function Space( pTamanho : Integer) : String;
var
  s : string;
begin
  s := '';
  While Length( s ) < pTamanho do s := s + ' ';
  Space := s;
end;

function FStrZero(s : String; i : Integer) : String;
begin
  s:= trim(s);
  While Length( s ) < i do s := '0' + s;
  FStrZero := s
end;

{ TConnection }

function TConnection.Auto_Translate(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Auto Translate', DefaultValue);
end;

function TConnection.Initial_Catalog(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Initial Catalog', DefaultValue);
end;

function TConnection.Packet_Size(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Packet Size', DefaultValue);
end;

function TConnection.Password(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Password', DefaultValue);
end;

function TConnection.Persist_Security_Info(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Persist Security Info', DefaultValue);
end;

function TConnection.Provider(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Provider', DefaultValue);
end;

function TConnection.Tag_with_Column_Collation_When_Possible(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Tag with column collation when possible', DefaultValue);
end;

function TConnection.User_ID(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'User ID', DefaultValue);
end;

function TConnection.Use_Encryption_For_Data(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Use Encryption for Data', DefaultValue);
end;

function TConnection.Use_Procedure_For_Prepare(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Use Procedure for Prepare', DefaultValue);
end;

function TConnection.Workstation_ID(DefaultValue: String): String;
begin
  Result := FConfig.ReadString('Connection', 'Workstation ID', DefaultValue);
end;

{ TServer }

constructor TServer.Create(ASection, AHomologacao, AProducao: String);
begin
  FSection := ASection;
  FHomologacao := AHomologacao;
  FProducao := AProducao;
end;

function TServer.GetHomologacao: String;
begin
  Result := PorIndice(_Homologacao, FHomologacao);
end;

function TServer.GetProducao: String;
begin
  Result := PorIndice(_Producao, FProducao);
end;

function TServer.PorIndice(AServidor: Integer; ADefault: String = ''): String;
begin
  Result := FConfig.ReadString(FSection, Sections[AServidor], ADefault);
  if Copy(Result, Length(Result), 1) <> '\' then
end;

function TServer.PorNome(AServidor: String; ADefault: String = ''): String;
begin
  Result := FConfig.ReadString(FSection, AServidor, ADefault);
end;

function TServer.Section: String;
begin
  Result := FSection;
end;

procedure TServer.SetHomologacao(AServidor: String);
begin
  FConfig.ReadString(FSection, Sections[_Homologacao], AServidor);
end;

procedure TServer.SetProducao(AServidor: String);
begin
  FConfig.ReadString(FSection, Sections[_Producao], AServidor);
end;

{ TWebService }

function TWebService.PorIndice(AServidor: Integer; ADefault: String): String;
begin
  Result := inherited;
  if (Result <> '') and (Copy(Result, Length(Result), 1) <> '/') then
    Result := Result + '/';
end;

function TWebService.PorNome(AServidor, ADefault: String): String;
begin
  Result := inherited;
end;


procedure TWebService.SetHomologacao(AServidor: String);
begin
  if (AServidor <> '') and (Copy(AServidor, Length(AServidor), 1) <> '/') then
    AServidor := AServidor + '/';
  inherited;
end;

procedure TWebService.SetProducao(AServidor: String);
begin
  if (AServidor <> '') and (Copy(AServidor, Length(AServidor), 1) <> '/') then
    AServidor := AServidor + '/';
  inherited;
end;

initialization
  FPath := ExtractFilePath(ParamStr(0));
  FConfig := TIniFile.Create(FPath + 'Config.ini');

finalization
  FreeAndNil(FConfig);

end.