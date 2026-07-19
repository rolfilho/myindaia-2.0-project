unit uIntegracaoAPIs;

interface
uses
  System.Classes, IdIOHandler, IdIOHandlerSocket, System.SysUtils,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,  IdExceptionCore,  IdException, IdGlobal, IdStack,
  IdURI, System.JSON;

type
  TMetodoHTTP = (Get, Post, Put, Delete);
  TAmbiente = (Producao, Homologacao);

  function ObterTokensIndaia(const Despachante: string): Boolean;
  function Conectar(var vMensagem: String): Boolean;
  function Api_(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;
  function GetApi(uri: String): String overload;
  function Api_viaServidor(const UrlServidor: string;
                           const Despachante: string;
                           const Metodo: TMetodoHTTP;
                           const UriPortalCompleta: string;
                           var ResultText: string;
                           const JsonText: string = ''): Boolean;
var
  Token: String;
  CSRF: String;
  CSRFExpiration: String;
  urlAmbiente: String;
  Ambiente: TAmbiente;
  vPastaCertificados: string;

    Http: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;


implementation

function ObterTokensIndaia(const Despachante: string): Boolean;
var
//  Http: TIdHTTP;
//  SSL : TIdSSLIOHandlerSocketOpenSSL;
  UrlServico : String;
begin
  Result := False;
  Token := '';
  CSRF  := '';
  UrlServico := 'http://localhost:2001/autenticacaoportalunicoapi/autenticar';
//  UrlServico := 'https://api.myindaia.com.br/autenticacaoportalunicoapi/autenticar';

  Http := TIdHTTP.Create(nil);
  SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(Http);
  try
    // --- Configuração do TLS/IOHandler ---
    SSL.SSLOptions.Method      := sslvSSLv23;         // compatível, mas vamos restringir a versão
    SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];      // força TLS 1.2
    SSL.SSLOptions.Mode        := sslmClient;
    SSL.SSLOptions.VerifyMode  := [];
    SSL.SSLOptions.VerifyDepth := 2;
    Http.IOHandler := SSL;

    // --- Timeouts razoáveis ---
    Http.ReadTimeout  := 15000; // 15s
    Http.ConnectTimeout := 10000;

    // --- Cabeçalhos padrão da requisição ---
    Http.Request.Clear;
    Http.Request.UserAgent      := 'Mozilla/5.0 (ClienteTokensServico)';
    Http.Request.Accept         := 'application/json, text/html;q=0.9,*/*;q=0.8';
    Http.Request.AcceptEncoding := 'gzip, deflate, br';
    Http.Request.AcceptLanguage := 'pt-BR,pt;q=0.9,en;q=0.8';
    Http.Request.CacheControl   := 'no-cache';

    // --- Cabeçalhos obrigatórios do seu serviço ---
    Http.Request.CustomHeaders.Values['despachante'] := Despachante;

    // --- (Opcional) Se o seu serviço exigir um segredo/assinatura, descomente e ajuste:
    Http.Request.CustomHeaders.Values['secret'] := '2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2';

    // --- Chamada (GET). Se o seu serviço espera POST, troque para Post com Corpo vazio. ---
    try
      Http.Get(UrlServico);
    except

    end;

    // --- Verificação de resposta ---
//    if Http.Response.ResponseCode <> 200 then
    Result := Http.Response.ResponseCode = 200;

//      raise Exception.CreateFmt('Falha ao obter tokens. HTTP %d - %s',
//        [Http.Response.ResponseCode, Http.ResponseText]);
    if result then
    begin

      Token := Http.Response.RawHeaders.Values['set-token'];
      CSRF  := Http.Response.RawHeaders.Values['x-csrf-token'];

      // Confere se realmente recebemos os dois headers
      Result := (Token <> '') and (CSRF <> '');
  //    if not Result then
        //raise Exception.Create('Serviço respondeu 200, porém sem os headers set-token/x-csrf-token.');
    end;
  finally
    Http.Free; // SSL é destruído junto
  end;
end;

function Conectar(var vMensagem: String): Boolean;
var
  URL: String;
  EmptyStream: TStringStream;
  vPastaCertificados: string;
  vResult: TStringStream;
//  Http: TIdHTTP;
//  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin

  if CSRF <> '' then
    exit(true);

  Http := TIdHTTP.Create(nil);
  SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(Http);
  try
    result := false;

//    if ObterTokensIndaia('edgar') then
//    begin
//      result := true;
//      exit;
//    end;

    URL := 'https://'+urlAmbiente+'/portal/api/autenticar';
//    URL := 'https://api.myindaia.com.br/autenticacaoportalunicoapi/autenticar';

    vPastaCertificados := 'C:\DDBROKER\Certificados\';
    Http.Request.Clear;
    Http.Request.ContentType := 'application/xml';
    Http.Request.AcceptCharSet := 'UTF-8';
    Http.Request.BasicAuthentication := False;
    Http.Response.ResponseText := 'UTF-8';
    Http.BoundPortMax := 5000;
    Http.IOHandler := SSL;
    SSL.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
    SSL.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
    SSL.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
    SSL.SSLOptions.Method       := sslvSSLv23;
    SSL.SSLOptions.Mode         := sslmClient;
    SSL.SSLOptions.SSLVersions  := [sslvTLSv1_2];
    SSL.SSLOptions.VerifyDepth  := 2;
    SSL.SSLOptions.VerifyMode   := [];
    Http.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    Http.Request.Referer := URL;
    Http.Request.CustomHeaders.Values['Role-Type']:= 'IMPEXP';

    EmptyStream := TStringStream.Create('', TEncoding.UTF8);
    vResult := TStringStream.Create('', TEncoding.UTF8);
    try
      try
        Http.Post(URL, EmptyStream, vResult);
      except
          on E: EIdHTTPProtocolException do
            vMensagem := 'Erro HTTP: ' + E.ErrorMessage;
          on E: EIdSocketError do
            vMensagem := 'Erro de rede: ' + E.Message;
          on E: Exception do
            vMensagem := 'Erro inesperado: ' + E.Message;
      end;
    finally
      EmptyStream.free;
      vResult.free;
    end;

    if Http.Response.ResponseCode = 200 then
    begin
      result :=  true;
      vMensagem := 'Conectado';
      Token := Http.Response.RawHeaders.Values['Set-Token'];
      CSRF := Http.Response.RawHeaders.Values['X-CSRF-Token'];
      CSRFExpiration := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
    end
    else
      vMensagem := Http.ResponseText;
  finally
//    Http.Free; // SSL é destruído junto
  end;
end;

function GetApi(uri: String): String overload;
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
  vHttp: TIdHTTP;
  vSSL: TIdSSLIOHandlerSocketOpenSSL;
begin

  vHttp := TIdHTTP.Create(nil);
  vSSL  := TIdSSLIOHandlerSocketOpenSSL.Create(vHttp);
  URL := uri;

  Response := TStringStream.Create('');
  try
    vHttp.Request.CustomHeaders.Clear;
    vHttp.Request.Clear;
    vHttp.Request.ContentType := 'application/json';
    vHttp.Response.ContentType := 'application/zip';
    vHttp.Request.ContentEncoding := 'raw';
    vHttp.Request.AcceptCharSet := 'UTF-8';
    vHttp.Request.Accept := 'application/json';
    vHttp.Response.CharSet := 'UTF-8';
    vHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    vHttp.Request.CustomHeaders.Values['Authorization']:= Token;
    vHttp.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    vHttp.Request.Referer := URL;


    vHttp.IOHandler := SSL;
//    SSL.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
//    SSL.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
//    SSL.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
    vSSL.SSLOptions.Method       := sslvSSLv23;
    vSSL.SSLOptions.Mode         := sslmClient;
    vSSL.SSLOptions.SSLVersions  := [sslvTLSv1_2];
    vSSL.SSLOptions.VerifyDepth  := 2;
    vSSL.SSLOptions.VerifyMode   := [];

    try
        vHttp.get(URL ,Response);
    except
    on E:EIdHTTPProtocolException do
      begin
        Result := e.ErrorMessage;
      end;
    end;

//    if vHttp.Response.ResponseCode = 200 then
//    begin
//      result := Utf8ToString(Response.DataString);
//    end;

    if (Http.Response.ResponseCode >= 200) and (Http.Response.ResponseCode <= 299) then
    begin
      result := Utf8ToString(response.DataString);
//      result := true;
      CSRF := Http.Response.RawHeaders.Values['X-CSRF-Token'];
      CSRFExpiration := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
    end
    else
    begin
      if Http.Response.ResponseCode = 422 then
      begin
        CSRF := Http.Response.RawHeaders.Values['X-CSRF-Token'];
        CSRFExpiration := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
      end;

      if result = '' then
        result := Utf8ToString(response.DataString);
  //    result := false;

    end;

//    result := Utf8ToString(Response.DataString);
  finally
    FreeAndNil(Response);
  end;
end;

function Api_(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;
var
  Response: TStringStream;
  vString: TStringStream;
  RespostaCod, RespostaMsg: String;
//  Http: TIdHTTP;
//  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin

//  Http := TIdHTTP.Create(nil);
//  SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(Http);
  try

    Http.Request.CustomHeaders.Clear;
    Http.Request.Clear;
    Http.Request.ContentType := 'application/json';
    Http.Request.ContentEncoding := 'raw';
    Http.Request.AcceptCharSet := 'UTF-8';
    Http.Request.Accept := 'application/json';
    Http.Response.CharSet := 'UTF-8';
    Http.Request.UserAgent := 'Mozilla/5.0 (ClienteTokensServico)';

    Http.BoundPortMax := 5000;
    Http.IOHandler := SSL;
    SSL.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
    SSL.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
    SSL.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
    SSL.SSLOptions.Method       := sslvSSLv23;
    SSL.SSLOptions.Mode         := sslmClient;
    SSL.SSLOptions.SSLVersions  := [sslvTLSv1_2];
    SSL.SSLOptions.VerifyDepth  := 2;
    SSL.SSLOptions.VerifyMode   := [];

    Http.Request.Referer := uri;

    Http.Request.CustomHeaders.Values['Authorization']:= Token;
    Http.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;

    Response := TStringStream.Create('');
    try
      try
        if metodo = post then
        begin
          vString := TStringStream.Create(JsonText);
          try
            Http.post(uri , vString, Response);
          finally
            vstring.Free;
          end;
        end
        else
        if metodo = put then
        begin
          vString := TStringStream.Create(JsonText);
          try
            Http.put(uri , vString, Response);
          finally
            vstring.Free;
          end;
        end
        else
        if metodo = get then
        begin
          Http.get(uri ,Response);
        end;
        if metodo = delete then
        begin
          Http.delete(uri ,Response);
        end;

      except
      on E:EIdHTTPProtocolException do
        begin
          ResultText := e.ErrorMessage;
          result:= false;
        end;
      end;

      if (Http.Response.ResponseCode >= 200) and (Http.Response.ResponseCode <= 299) then
      begin
        ResultText := response.DataString;
        result := true;
        CSRF := Http.Response.RawHeaders.Values['X-CSRF-Token'];
        CSRFExpiration := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
      end
      else
      begin
        if Http.Response.ResponseCode = 422 then
        begin
          CSRF := Http.Response.RawHeaders.Values['X-CSRF-Token'];
          CSRFExpiration := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
        end;

        if ResultText = '' then
          ResultText := response.DataString;
        result := false;

      end;
    finally
      FreeAndNil(Response);
    end;
  finally
    Http.Free;
  end;
end;

const
  // MESMA chave do seu Server.pas (ValidateSecret)
  SECRET_KEY = '2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2';

function MetodoParaStr(M: TMetodoHTTP): string;
begin
  case M of
    get:    Result := 'GET';
    post:   Result := 'POST';
    put:    Result := 'PUT';
    delete: Result := 'DELETE';
  else
    Result := 'GET';
  end;
end;

// extrai "/path?query" a partir de uma URL completa
function ExtrairPathDaUrl(const UrlCompleta: string): string;
var
  U: TIdURI;
  Caminho, Documento, Query: string;
begin
  // Se já vier só o path, devolve como está
  if (UrlCompleta <> '') and (UrlCompleta[1] = '/') then
    Exit(UrlCompleta);

  U := TIdURI.Create(UrlCompleta);
  try
    Caminho   := U.Path;      // ex.: /cadatributos/api/ext/atributo-fundamento-legal/
    Documento := U.Document;  // ex.: 1009
    Query     := U.Params;    // ex.: pagina=1

    if Caminho = '' then
      Caminho := '/';

    // Garante 1 barra entre Path e Document
    if Documento <> '' then
    begin
      if (Caminho = '') or (Caminho[Length(Caminho)] <> '/') then
        Caminho := Caminho + '/';
      Caminho := Caminho + Documento;
    end;

    // Garante que começa com '/'
    if (Caminho = '') or (Caminho[1] <> '/') then
      Caminho := '/' + Caminho;

    if Query <> '' then
      Caminho := Caminho + '?' + Query;

    Result := Caminho;
  finally
    U.Free;
  end;
end;

// garante que termina com "/"
function ComBarraFinal(const Base: string): string;
begin
  Result := Base;
  if (Result <> '') and (Result[Length(Result)] <> '/') then
    Result := Result + '/';
end;

// Detecta no JSON de erro se a mensagem fala de x-csrf-token expirado
function ErroCsrfExpirado(const Json: string): Boolean;
var
  V: TJSONValue;
  O, Det: TJSONObject;
  Msg: string;
begin
  Result := False;
  if Json.Trim = '' then Exit;

  V := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Json), 0);
  try
    if not (V is TJSONObject) then Exit;
    O := TJSONObject(V);

    // Em geral vem em detalhes.message
    Det := O.Values['detalhes'] as TJSONObject;
    if Assigned(Det) then
    begin
      if Assigned(Det.Values['message']) then
        Msg := Det.Values['message'].Value;
    end
    else
    begin
      // fallback: tenta no campo "mensagem"
      if Assigned(O.Values['mensagem']) then
        Msg := O.Values['mensagem'].Value;
    end;

    Msg := LowerCase(Msg);
    // procura termos-chave de forma tolerante
    Result :=
      (Pos('csrf', Msg) > 0) or
      (Pos('x-csrf-token', Msg) > 0)
      and ((Pos('expirad', Msg) > 0) or (Pos('expira', Msg) > 0));
  finally
    V.Free;
  end;
end;

// Gera um JSON simples e amigável para o usuário
function JsonErroAmigavelSessaoExpirada: string;
begin
  Result := 'Sessão expirada no Portal Único. Tente novamente.';
end;

// UrlServidor: ex. "http://localhost:2001/proxy-portal-unico"
// Despachante: CPF/CNPJ/Identificador que seu servidor usa para pegar o certificado

function Api_viaServidor(const UrlServidor: string;
                         const Despachante: string;
                         const Metodo: TMetodoHTTP;
                         const UriPortalCompleta: string;
                         var ResultText: string;
                         const JsonText: string = ''): Boolean;
var
  Http: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  UrlChamada, PathPortal: string;
  Resp, Envio: TStringStream;
begin
  Result := False;
  ResultText := '';

  Http := TIdHTTP.Create(nil);
  Resp := TStringStream.Create('', TEncoding.UTF8);
  try
    // >>> NECESSÁRIO PARA HTTPS <<<
    SSL := TIdSSLIOHandlerSocketOpenSSL.Create(Http);
    SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
    Http.IOHandler := SSL;

    // (opcional, mas ajuda) timeouts
    Http.ConnectTimeout := 2400000;
    Http.ReadTimeout    := 2400000;
    Http.ProtocolVersion := pv1_1;

    UrlChamada := ComBarraFinal(UrlServidor) + 'executar';

    Http.Request.CustomHeaders.Clear;
    Http.Request.Clear;
    Http.Request.Accept := 'application/json';
    Http.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    Http.Request.CustomHeaders.Values['secret']      := SECRET_KEY;
    Http.Request.CustomHeaders.Values['Despachante'] := Despachante;
    Http.Request.CustomHeaders.Values['PU-Method']   := MetodoParaStr(Metodo);

    PathPortal := ExtrairPathDaUrl(UriPortalCompleta);
    Http.Request.CustomHeaders.Values['PU-Path']     := PathPortal;

    try
      case Metodo of
        get, delete:
          begin
            Http.Request.ContentType := 'application/json; charset=utf-8';
            Envio := TStringStream.Create('', TEncoding.UTF8);
            try
              Http.Post(UrlChamada, Envio, Resp);
            finally
              Envio.Free;
            end;
          end;
        post, put:
          begin
            Http.Request.ContentType := 'application/json; charset=utf-8';
            Envio := TStringStream.Create(JsonText, TEncoding.UTF8);
            try
              Http.Post(UrlChamada, Envio, Resp);
            finally
              Envio.Free;
            end;
          end;
      end;

      if (Http.Response.ResponseCode >= 200) and (Http.Response.ResponseCode <= 299) then
      begin
        ResultText := Resp.DataString;
        Result := True;
      end
      else
      begin
        ResultText := Resp.DataString;
        if ErroCsrfExpirado(ResultText) then
          ResultText := JsonErroAmigavelSessaoExpirada;
        Result := False;
      end;

    except
      on E: EIdHTTPProtocolException do
      begin
        if Resp.Size > 0 then
          ResultText := Resp.DataString
        else
          ResultText := E.ErrorMessage;

        if ErroCsrfExpirado(ResultText) then
          ResultText := JsonErroAmigavelSessaoExpirada;

        Result := False;
      end;
      on E: Exception do
      begin
        ResultText := '{"mensagem do proxy" : "Erro não identificado no request com o Portal Único. Tente novamente."}';
        Result := False;
      end;
    end;

  finally
    Resp.Free;
    Http.Free; // SSL é owned por Http
  end;
end;


end.
