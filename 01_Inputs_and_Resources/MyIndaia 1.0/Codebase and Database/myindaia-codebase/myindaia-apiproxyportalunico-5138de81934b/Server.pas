unit Server;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.IniFiles,
  Sparkle.HttpSys.Server,
  Sparkle.HttpServer.Context,
  Sparkle.HttpServer.Module,
  Sparkle.Middleware.Cors,
  Sparkle.Middleware.Compress,
  Sparkle.WebBroker.Server,
  System.IOUtils,
  Controle, uLog;

type
  TEndpointHandler = reference to procedure(const C: THttpServerContext);

  TServer = class
  private
    procedure AdicionarMiddlewares(const Modulo: THttpServerModule);
  public
    procedure CarregaIni;
    procedure StartServer;
    procedure StopServer;
    procedure RegisterRoutes;
    procedure HandleRequest(const C: THttpServerContext);
  end;

  procedure ValidateSecret(Context: THttpServerContext);
  function NovoReqId: string;

var
  Servidor: TServer;
  SparkleServer: THttpSysServer;
  Rotas: TDictionary<string, TEndpointHandler>;
  UrlBaseServidor: string;
  ListaDespachantesIni: string;
//RenovadorCSRF: TRenovadorCSRFThread;

const
  // Mantenha sua chave como já usa hoje
  SECRET_KEY = '2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2';

implementation


{ ============================ Utilitários ============================ }

function NovoReqId: string;
begin
  Result := Copy(StringReplace(TGuid.NewGuid.ToString, '{', '', []), 1, 8);
end;

function CaminhoLocal: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure ValidateSecret(Context: THttpServerContext);
var
  ChaveRecebida: string;
begin
  // Se quiser desativar temporariamente, comente estas linhas
  ChaveRecebida := Context.Request.Headers.Get('secret');
  if ChaveRecebida <> SECRET_KEY then
  begin
    uLog.LogWarn('ValidateSecret - auth', 'motivo = secret-invalido | path= ' + Context.Request.Uri.Path);
    raise Exception.Create('Acesso não autorizado: secret inválida.');
  end;

end;

procedure CopiarHeadersParaStrings(const Context: THttpServerContext; Destino: TStrings);
begin
  Destino.Clear;

  // Só os headers que o Controle realmente usa:
  Destino.Values['Despachante'] := Context.Request.Headers.Get('Despachante');
  Destino.Values['PU-Method']    := Context.Request.Headers.Get('PU-Method');
  Destino.Values['PU-Path']      := Context.Request.Headers.Get('PU-Path');

  // (Opcional) Se quiser manter a 'secret' no TStrings:
  Destino.Values['secret']       := Context.Request.Headers.Get('secret');
end;

function LerCorpoComoUtf8(const Context: THttpServerContext): string;
var
  Bytes: TBytes;
begin
  Result := '';
  // Em Sparkle antigo, o corpo já vem como TBytes
  Bytes := Context.Request.Content;
  if Length(Bytes) > 0 then
    Result := TEncoding.UTF8.GetString(Bytes);
end;

{ ============================ Handlers ============================ }

type
  TProxyPortalUnicoHandler = class
  public
    class procedure Handle(const C: THttpServerContext); static;
  end;

class procedure TProxyPortalUnicoHandler.Handle(const C: THttpServerContext);
var
  Cabecalhos: TStringList;
  CorpoBruto: string;
  Resultado: TResultadoProxy;
  ReqId: string;
  Desp, Met, PathRel: string;
begin
  // 1) Validação de acesso (secret)
  ValidateSecret(C);
  ReqId := NovoReqId;
  // 2) Ler headers e body
  Cabecalhos := TStringList.Create;
  try
    try
    CopiarHeadersParaStrings(C, Cabecalhos);
    Desp    := C.Request.Headers.Get('Despachante');
    Met     := C.Request.Headers.Get('PU-Method');
    PathRel := C.Request.Headers.Get('PU-Path');
    uLog.LogInfo('Handle - req-in',
      Format('reqId = %s | desp = %s | m = %s | path = %s | bodyLen = %d',
             [ReqId, Desp, Met, PathRel, C.Request.ContentLength]));

    CorpoBruto := LerCorpoComoUtf8(C);

    // 3) Processar via núcleo (Controle)
    Resultado := ProcessarProxyPortalUnico(Cabecalhos, CorpoBruto);

    // 4) Responder ao cliente
    C.Response.StatusCode := Resultado.CodigoStatus;
    C.Response.ContentType := 'application/json; charset=utf-8';
    C.Response.Close(TEncoding.UTF8.GetBytes(Resultado.CorpoRespostaJson));

    // OBS.: Não devolver headers sensíveis (Authorization, X-CSRF-Token, X-CSRF-Expiration)
    uLog.LogInfo('Handle - handler-end', 'ok');
    except
      on E: Exception do
      begin
        uLog.LogError('Handle - handler-fail',
          Format('ex = %s | msg = %s', [E.ClassName, uLog.Truncar(E.Message, 300)]));
        raise; // deixa o HandleRequest responder 500
      end;
    end;
  finally
    Cabecalhos.Free;
  end;
end;

{ ============================ TServer ============================ }

procedure TServer.AdicionarMiddlewares(const Modulo: THttpServerModule);
begin
  Modulo.AddMiddleware(TCorsMiddleware.Create);
  Modulo.AddMiddleware(TCompressMiddleware.Create);
end;


procedure TServer.CarregaIni;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    ListaDespachantesIni := Ini.ReadString('Geral', 'DespachantesIniciais', 'edgar');
    UrlBaseServidor := Ini.ReadString('Geral', 'Url', UrlBaseServidor);
    if UrlBaseServidor.Trim = '' then
      // Padrão caso não exista .ini
      UrlBaseServidor := 'https://+:443/ApiProxyPortalUnico/';
  finally
    Ini.Free;
  end;
end;

procedure TServer.RegisterRoutes;
begin
  if Assigned(Rotas) then
    Rotas.Free;
  Rotas := TDictionary<string, TEndpointHandler>.Create;

  // === Nova rota-proxy ===
  // Método POST, caminho /executar
  Rotas.Add('/ApiProxyPortalUnico/executar',
    procedure(const C: THttpServerContext)
    begin
      if not SameText(C.Request.Method, 'POST') then
      begin
        C.Response.StatusCode := 405; // Method Not Allowed
        C.Response.ContentType := 'application/json; charset=utf-8';
        C.Response.Close(TEncoding.UTF8.GetBytes('{"mensagem":"Método não permitido. Use POST."}'));
        Exit;
      end;
      TProxyPortalUnicoHandler.Handle(C);
    end
  );

  // Se quiser manter outras rotas antigas, registre aqui do mesmo jeito.
  // Exemplo legado (desativado): Rotas.Add('/ApiProxyPortalUnico/executar', TAlgumHandler.Handle);
end;

procedure TServer.HandleRequest(const C: THttpServerContext);
var
  Handler: TEndpointHandler;
  Caminho: string;
begin
  Caminho := C.Request.Uri.Path;

  if not Assigned(Rotas) then
  begin

    C.Response.StatusCode := 500;
    C.Response.ContentType := 'application/json; charset=utf-8';
    C.Response.Close(TEncoding.UTF8.GetBytes('{"mensagem":"Servidor não inicializado."}'));
    Exit;
  end;

  if Rotas.TryGetValue(Caminho, Handler) then
  begin
    try
      Handler(C);
    except
      on E: Exception do
      begin
        uLog.LogError('HandleRequest - handler-exception',
          Format('path = %s | ex = %s | msg = %s', [Caminho, E.ClassName, uLog.Truncar(E.Message, 300)]));        C.Response.StatusCode := 500;
        C.Response.ContentType := 'application/json; charset=utf-8';
        C.Response.Close(TEncoding.UTF8.GetBytes('{"mensagem" : "Erro: '+uLog.Truncar(E.Message, 300)+'"}'));
      end;
    end;
  end
  else
  begin
    uLog.LogWarn('HandleRequest - rota-404', 'path = ' + Caminho);
    C.Response.StatusCode := 404;
    C.Response.ContentType := 'application/json; charset=utf-8';
    C.Response.Close(TEncoding.UTF8.GetBytes('{"mensagem":"Endpoint não encontrado."}'));
  end;
end;

procedure TServer.StartServer;
var
  Module: TAnonymousServerModule;
  PastaLogs: string;
begin
  // 1) pasta de logs segura para serviço
  PastaLogs := TPath.Combine(ExtractFilePath(ParamStr(0)), 'logs');
  TDirectory.CreateDirectory(PastaLogs);
  uLog.Inicializar(IncludeTrailingPathDelimiter(PastaLogs));
  uLog.SetNivelMinimo(llInfo);
  uLog.LogInfo('', '');
  uLog.LogInfo('StartServer - server-boot', 'inicializando');

  Servidor.CarregaIni;
  if Assigned(SparkleServer) then Exit;

  SparkleServer := THttpSysServer.Create;
  RegisterRoutes;

  // (mantenha seu módulo)
  Module := TAnonymousServerModule.Create(UrlBaseServidor,
    procedure(const C: THttpServerContext)
    begin
      HandleRequest(C);
    end);

  SparkleServer.AddModule(Module);

  uLog.LogInfo('StartServer - server-starting', 'url = ' + UrlBaseServidor);
  SparkleServer.Start;
  uLog.LogInfo('StartServer - server-started', 'ok');

end;

procedure TServer.StopServer;
begin
  if Assigned(SparkleServer) then
  begin
    try
      SparkleServer.Stop;
      uLog.LogInfo('StopServer - server-stop', '');
    finally
      SparkleServer.Free;
      SparkleServer := nil;
    end;
  end;

  FreeAndNil(Rotas);

end;

initialization
  Servidor := TServer.Create;
  SparkleServer := nil;
  UrlBaseServidor := '';

finalization
  if Assigned(Servidor) then
  begin
    try
      Servidor.StopServer;
    finally
      Servidor.Free;
      Servidor := nil;
    end;
  end;

end.

