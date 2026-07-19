unit uAutenticacao;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  IdHTTP,
  IdSSLOpenSSL,
  IdGlobal,
  System.DateUtils,
  System.IOUtils,
  uLog,
  IdCookieManager;

type
  TCredenciaisSessao = record
    TokenAutorizacao: string;   // header: Authorization (valor do 'set-token' do Portal)
    CsrfToken: string;          // header: X-CSRF-Token (retornado pelo Portal)
    CsrfExpiracao: string;      // header: X-CSRF-Expiration (retornado pelo Portal)
    ObtidoEm: TDateTime;   // quando obtivemos estas credenciais
    ExpiraEm: TDateTime;   // quando expira (absoluto, calculado)
  end;

{ Define quem é o despachante "corrente" (por requisição). }
function DefinirDespachanteAtual(const Identificador: string): Boolean;

{ Aplica certificado mTLS do despachante atual no Http e garante sessão:
  - Se já existir token/CSRF em cache para o despachante, apenas aplica nos headers do Http.
  - Se não existir, chama /portal/api/autenticar para obter set-token e CSRF e aplica nos headers.
  Retorna True em caso de sucesso; False se falhar (sem exceção). }
function AutenticarDespachanteAtual(const Http: TIdHTTP): Boolean;

{ (Opcional) Obtém credenciais atuais para inspeção/log interno, se necessário. }
function ObterCredenciaisDespachanteAtual(out Credenciais: TCredenciaisSessao): Boolean;

{ (Opcional) Atualiza o cache de credenciais do despachante corrente lendo headers da ÚLTIMA resposta do Http.
  Útil se você quiser sincronizar o cache depois de qualquer chamada ao Portal. }
procedure AtualizarCredenciaisDoDespachanteAPartirDaResposta(const Http: TIdHTTP);
function InvalidarCredenciaisDespachanteAtual: Boolean;
function ReautenticarDespachanteAtual(const Http: TIdHTTP): Boolean;
function ObterDespachanteAtual: string;
function ListarDespachantesEmCache: TArray<string>;
function TentarObterCredenciaisSemInvalidar(const Despachante: string; out Cred: TCredenciaisSessao): Boolean;
function ReautenticarDespachante(const Despachante: string; out Erro: string): Boolean;

function EstaAutoRenovacaoBloqueada(const Despachante: string): Boolean;
procedure RegistrarFalhaAutoRenovacao(const Despachante: string);
procedure RegistrarSucessoAutoRenovacao(const Despachante: string);
procedure ResetarEstadoParaRequisicaoExterna(const Despachante: string);

function EhErroCooldown60s(const TextoErro: string): Boolean;

function CriarHttpIndy(const Despachante: string): TIdHTTP;
procedure GravarCredenciaisNoCache(const Despachante: string; const Cred: TCredenciaisSessao);
function ObterCredenciaisDoCache(const Despachante: string; out Cred: TCredenciaisSessao): Boolean;
function CalcularExpiraEm(const ValorHeader: string; const Base: TDateTime): TDateTime;

implementation

var
  GDespachanteAtual: string = '';
  GCredenciaisPorDespachante: TDictionary<string, TCredenciaisSessao>;
  GFalhasAutoPorDesp: TDictionary<string, Integer>;
  GBloqueadoAutoPorDesp: TDictionary<string, Boolean>;
  GCookiesPorDesp: TDictionary<string, TIdCookieManager>;
  Pair: TPair<string, TIdCookieManager>;

  const
  URL_BASE_PORTAL       = 'https://portalunico.siscomex.gov.br';
  URL_AUTENTICACAO_PATH = '/portal/api/autenticar';
  HEADER_ROLE_TYPE      = 'role-type';
  ROLE_TYPE_PADRAO      = 'IMPEXP';

{ === Funções utilitárias locais === }

function ObterCookieManager(const Despachante: string): TIdCookieManager;
begin
  if (GCookiesPorDesp = nil) then
    GCookiesPorDesp := TDictionary<string, TIdCookieManager>.Create;

  if not GCookiesPorDesp.TryGetValue(Despachante, Result) then
  begin
    Result := TIdCookieManager.Create(nil); // NÃO atrelado ao Http
    GCookiesPorDesp.Add(Despachante, Result);
  end;
end;

procedure LimparCookieManager(const Despachante: string);
var
  CM: TIdCookieManager;
begin
  if (GCookiesPorDesp <> nil) and GCookiesPorDesp.TryGetValue(Despachante, CM) then
    CM.CookieCollection.Clear;
end;

function GetUrlBasePortal: string;
begin
  Result := 'https://portalunico.siscomex.gov.br';
end;

function GetUrlAutenticacao: string;
begin
  Result := GetUrlBasePortal + '/portal/api/autenticar';
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function ObterDespachanteAtual: string;
begin
  Result := GDespachanteAtual;
end;

function SoDigitos(const S: string): Boolean;
var
  I: Integer;
begin
  Result := S <> '';
  if not Result then Exit;
  for I := 1 to Length(S) do
    if not CharInSet(S[I], ['0'..'9']) then
      Exit(False);
end;

function CalcularExpiraEm(const ValorHeader: string; const Base: TDateTime): TDateTime;
  function SoDigitos(const S: string): Boolean;
  var I: Integer;
  begin
    Result := S <> '';
    if not Result then Exit;
    for I := 1 to Length(S) do
      if not CharInSet(S[I], ['0'..'9']) then Exit(False);
  end;
var
  S: string;
  N64: Int64;
  N: Integer;
  FS: TFormatSettings;
  DT: TDateTime;
  BaseOk: TDateTime;
begin
  // Base sempre válida
  if Base <= 0 then BaseOk := Now else BaseOk := Base;

  S := Trim(ValorHeader);
  if S = '' then
    Exit(IncMinute(BaseOk, 50)); // fallback: 50 min

  // 1) Millis desde epoch (13 dígitos)
  if SoDigitos(S) and (Length(S) >= 13) and TryStrToInt64(S, N64) then
    Exit(UnixToDateTime(N64 div 1000, False));

  // 2) Segundos desde epoch (10 dígitos)
  if SoDigitos(S) and (Length(S) = 10) and TryStrToInt64(S, N64) then
    Exit(UnixToDateTime(N64, False));

  // 3) TTL em segundos (curto, p.ex. 3600)
  if SoDigitos(S) and TryStrToInt(S, N) and (N > 0) and (N <= 24*3600) then
    Exit(IncSecond(BaseOk, N));

  // 4) TTL em minutos (compatibiliza com portais que mandam "60")
  if SoDigitos(S) and TryStrToInt(S, N) and (N > 0) and (N <= 24*60) then
    Exit(IncMinute(BaseOk, N));

  // 5) ISO 8601 (2025-10-01T18:02:07Z)
  S := StringReplace(S, 'Z', '', [rfIgnoreCase, rfReplaceAll]);
  S := StringReplace(S, 'T', ' ', [rfReplaceAll]);
  FS := TFormatSettings.Create;
  FS.DateSeparator := '-';
  FS.TimeSeparator := ':';
  FS.ShortDateFormat := 'yyyy-mm-dd';
  FS.LongTimeFormat := 'hh:nn:ss';
  if TryStrToDateTime(S, DT, FS) then
    Exit(DT);

  // 6) Fallback final
  Result := IncMinute(BaseOk, 50);
end;

function CriarHttpIndy(const Despachante: string): TIdHTTP;
var
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := TIdHTTP.Create(nil);
  Result.HandleRedirects := False;
  Result.ReadTimeout := 60000;
  Result.ConnectTimeout := 30000;

  Result.Request.Accept := 'application/json';
  Result.Request.ContentType := 'application/json; charset=utf-8';
  Result.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

  // >>> CRÍTICO: cookie store persistente por despachante
  Result.CookieManager := ObterCookieManager(Despachante);

  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(Result);
  SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
  Result.IOHandler := SSL;
end;

procedure PreencherPadroesDeRequisicao(const Http: TIdHTTP);
begin
  // Alguns padrões úteis; o Controle também define os seus. Não há problema em redundância benigna.
  Http.Request.BasicAuthentication := False;
  Http.Request.ContentType         := 'application/json';
  Http.Request.Accept              := 'application/json';
  Http.Request.UserAgent           := 'Mozilla/3.0 (compatible;Indy Library)';
//  Http.Request.AcceptEncoding      := 'gzip, deflate'; // 'br' (brotli) não é nativo no Indy
  Http.Request.AcceptLanguage      := 'en,pt;q=0.9,pt-BR;q=0.8';
  Http.Request.CacheControl        := 'no-cache';
end;

function AplicarCertificadoDoDespachante(const Despachante: string; const Http: TIdHTTP; out Erro: string): Boolean;
var
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  CaminhoPem, CaminhoKey: string;
begin
  Result := False;
  Erro := '';

  if (Http = nil) then
  begin
    Erro := 'Instância de TIdHTTP não informada.';
    Exit;
  end;

  if Despachante.Trim = '' then
  begin
    Erro := 'Despachante não informado.';
    Exit;
  end;

  // Monta caminhos dos arquivos do certificado do cliente (mTLS)
  CaminhoPem := TPath.Combine(GetLocalPath + 'certificados', Despachante + '.pem');
  CaminhoKey := TPath.Combine(GetLocalPath + 'certificados', Despachante + '.key');

  if not TFile.Exists(CaminhoPem) then
  begin
    Erro := Format('Arquivo de certificado (.pem) não encontrado para "%s". Caminho: %s',
                   [Despachante, CaminhoPem]);
    Exit;
  end;

  if not TFile.Exists(CaminhoKey) then
  begin
    Erro := Format('Arquivo de chave (.key) não encontrado para "%s". Caminho: %s',
                   [Despachante, CaminhoKey]);
    Exit;
  end;

  // Limpa request padrão
  Http.Request.CustomHeaders.Clear;
  Http.Request.Clear;

  // Cabeçalhos HTTP padrão para JSON
  Http.Request.Accept           := 'application/json';
  Http.Request.ContentType      := 'application/json; charset=utf-8';
  Http.Request.UserAgent        := 'Mozilla/3.0 (compatible;Indy Library)';
//  Http.Request.AcceptEncoding   := 'gzip, deflate, br';
  Http.Request.AcceptCharSet    := 'UTF-8';
  Http.Request.CacheControl     := 'no-cache';

  // Header de papel/role conforme você já usava
  Http.Request.CustomHeaders.Values['role-type'] := 'IMPEXP';

  // Timeouts e versão do protocolo
  Http.ConnectTimeout  := 15000;   // 15s
  Http.ReadTimeout     := 60000;   // 60s
  Http.ProtocolVersion := pv1_1;   // estável para a maioria dos endpoints

  // Cria/atribui o IOHandler SSL (mTLS)
  // Se já existe um IOHandler, substitui por segurança
  if Assigned(Http.IOHandler) and (Http.IOHandler is TIdSSLIOHandlerSocketOpenSSL) then
  begin
    // Reutiliza a instância existente
    SSL := TIdSSLIOHandlerSocketOpenSSL(Http.IOHandler);
  end
  else
  begin
    SSL := TIdSSLIOHandlerSocketOpenSSL.Create(Http); // owner = Http (libera junto)
    Http.IOHandler := SSL;
  end;

  // Configurações SSL/TLS
  SSL.SSLOptions.Mode        := sslmClient;
  SSL.SSLOptions.SSLVersions := [sslvTLSv1_2]; // ajuste para incluir TLS1.3 se seu Indy suportar
  // Carga dos arquivos do cliente (mTLS)
  SSL.SSLOptions.CertFile     := CaminhoPem; // certificado do cliente (pode conter cadeia)
  SSL.SSLOptions.KeyFile      := CaminhoKey; // chave privada do cliente
  SSL.SSLOptions.RootCertFile := CaminhoPem; // CA/cadeia (se sua .pem inclui cadeia, costuma funcionar)

  // Opcional: verificação
  SSL.SSLOptions.VerifyMode  := [];  // sem validação ativa de servidor por aqui (HTTP.SYS/Windows valida)
  SSL.SSLOptions.VerifyDepth := 2;

  // (Opcional) portas locais
  Http.BoundPortMax := 5000;

  Result := True;

  if result = false then
    uLog.LogError('mtls-cert', 'desp=...|erro=' + Erro);
end;

procedure AplicarCredenciaisNoHttp(const Cred: TCredenciaisSessao; const Http: TIdHTTP);
begin
  // Preenche os headers de sessão para a chamada seguinte ao Portal
  if Cred.TokenAutorizacao <> '' then
    Http.Request.CustomHeaders.Values['Authorization'] := Cred.TokenAutorizacao;

  if Cred.CsrfToken <> '' then
    Http.Request.CustomHeaders.Values['X-CSRF-Token'] := Cred.CsrfToken;
end;

function ObterCredenciaisDoCache(const Despachante: string; out Cred: TCredenciaisSessao): Boolean;
var
  Agora, LimiteRenovacao: TDateTime;
begin
  Result := False;
  FillChar(Cred, SizeOf(Cred), 0);
  if (Despachante = '') or (not Assigned(GCredenciaisPorDespachante)) then Exit(False);
  if not GCredenciaisPorDespachante.TryGetValue(Despachante, Cred) then Exit(False);

  uLog.LogDebug('ObterCredenciaisDoCache',
  Format('TokenAutorizacao = %s | CsrfToken = %s | rawExp = %s | expiraEm = %s',
         [Cred.TokenAutorizacao, Cred.CsrfToken, Cred.CsrfExpiracao, DateTimeToStr(Cred.ExpiraEm)]));

  Agora := Now;

  if Cred.ExpiraEm > 0 then
  begin
    LimiteRenovacao := IncMinute(Cred.ExpiraEm, -2); // margem
    if (Agora >= LimiteRenovacao) then
    begin
      GCredenciaisPorDespachante.Remove(Despachante);
      uLog.LogInfo('ObterCredenciaisDoCache - cache-expirado',
        Format('desp = %s | expiraEm = %s | acao = invalidar',
               [Despachante, DateTimeToStr(Cred.ExpiraEm)]));
      FillChar(Cred, SizeOf(Cred), 0);
      Exit(False);
    end;
  end
  else
  begin
    // Fallback: se não sabemos ExpiraEm, use ObtidoEm + 50 min a partir de Now
    if (Cred.ObtidoEm <= 0) then Cred.ObtidoEm := Agora;
    if MinutesBetween(Agora, Cred.ObtidoEm) >= 50 then
    begin
      GCredenciaisPorDespachante.Remove(Despachante);
      FillChar(Cred, SizeOf(Cred), 0);
      Exit(False);
    end;
  end;

  // Só aqui é hit
  uLog.LogDebug('ObterCredenciaisDoCache - cache-hit',
    Format('desp = %s | obtidoEm = %s | expiraEm = %s',
           [Despachante, DateTimeToStr(Cred.ObtidoEm), DateTimeToStr(Cred.ExpiraEm)]));
  Result := True;
end;

procedure GravarCredenciaisNoCache(const Despachante: string; const Cred: TCredenciaisSessao);
begin
  if not Assigned(GCredenciaisPorDespachante) then
    GCredenciaisPorDespachante := TDictionary<string, TCredenciaisSessao>.Create;

  GCredenciaisPorDespachante.AddOrSetValue(Despachante, Cred);

  uLog.LogDebug('GravarCredenciaisNoCache',
  Format('TokenAutorizacao = %s | CsrfToken = %s | rawExp = %s | expiraEm = %s',
         [Cred.TokenAutorizacao, Cred.CsrfToken, Cred.CsrfExpiracao, DateTimeToStr(Cred.ExpiraEm)]));
end;

function AutenticarNoPortal(const Despachante: string; const Http: TIdHTTP;
  out Credenciais: TCredenciaisSessao; out Erro: string): Boolean;
var
  CorpoVazio: TStrings;
  RespStream: TStringStream;
  Codigo: Integer;
  BodyErro: string;
begin
  Result := False;
  FillChar(Credenciais, SizeOf(Credenciais), 0);
  Erro := '';

  PreencherPadroesDeRequisicao(Http);
  Http.Request.Referer := GetUrlAutenticacao;
  Http.Request.CustomHeaders.Values[HEADER_ROLE_TYPE] := ROLE_TYPE_PADRAO;

  uLog.LogInfo('AutenticarNoPortal - autenticaini', Format('desp=%s', [Despachante]));

  CorpoVazio := TStringList.Create;
  RespStream := TStringStream.Create('', TEncoding.UTF8);
  try
    try
      Http.Post(GetUrlAutenticacao, CorpoVazio, RespStream);

      Codigo := Http.Response.ResponseCode;

      if Codigo = 200 then
      begin
        Credenciais.TokenAutorizacao := Http.Response.RawHeaders.Values['set-token'];

        Credenciais.CsrfToken := Http.Response.RawHeaders.Values['x-csrf-token'];
        if Credenciais.CsrfToken = '' then
          Credenciais.CsrfToken := Http.Response.RawHeaders.Values['X-CSRF-Token'];

        Credenciais.CsrfExpiracao := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
        if Credenciais.CsrfExpiracao = '' then
          Credenciais.CsrfExpiracao := Http.Response.RawHeaders.Values['x-csrf-expiration'];

        Credenciais.ObtidoEm := Now;
        Credenciais.ExpiraEm := CalcularExpiraEm(Credenciais.CsrfExpiracao, Credenciais.ObtidoEm);

        // Log único, já com rawExp + expiraEm calculado (sem “1899”)
        uLog.LogInfo('AutenticarNoPortal - autenticar-ok',
//          Format('desp = %s | rawExp = %s | expiraEm = %s',
//                 [Despachante, Credenciais.CsrfExpiracao, DateTimeToStr(Credenciais.ExpiraEm)]));
          Format('TokenAutorizacao = %s | CsrfToken = %s | rawExp = %s | expiraEm = %s',
                 [Credenciais.TokenAutorizacao, Credenciais.CsrfToken, Credenciais.CsrfExpiracao, DateTimeToStr(Credenciais.ExpiraEm)]));


        AplicarCredenciaisNoHttp(Credenciais, Http);
        GravarCredenciaisNoCache(Despachante, Credenciais);

        Exit(True);
      end;

      // ERRO sem exceção
      BodyErro := RespStream.DataString;
      uLog.LogError('AutenticarNoPortal - autenticar-erro',
        Format('rota = autenticar | desp = %s | http = %d | body = %s',
          [Despachante, Codigo, uLog.Truncar(BodyErro, 900)]));

      if (Codigo = 422) and EhErroCooldown60s(BodyErro) then
        Erro := 'Cooldown de 60s do Portal (PLAT-ER2033). Aguarde e tente novamente.'
      else
        Erro := Format('Falha na autenticação (HTTP %d). %s', [Codigo, Http.ResponseText]);

      Result := False;

    except
      on E: EIdHTTPProtocolException do
      begin
        Codigo := E.ErrorCode;
        BodyErro := RespStream.DataString;

        if BodyErro = '' then
          BodyErro := E.ErrorMessage;

        uLog.LogError('AutenticarNoPortal - autenticar-erro',
          Format('rota = autenticar | desp = %s | http = %d | body = %s',
            [Despachante, Codigo, uLog.Truncar(BodyErro, 900)]));

        if (Codigo = 422) and EhErroCooldown60s(BodyErro) then
          Erro := 'Cooldown de 60s do Portal (PLAT-ER2033). Aguarde e tente novamente.'
        else
          Erro := E.Message;

        Result := False;
      end;

      on E: Exception do
      begin
        uLog.LogError('AutenticarNoPortal - autenticar-erro',
          Format('rota = autenticar | desp = %s | ex = %s | msg = %s',
                 [Despachante, E.ClassName, uLog.Truncar(E.Message, 300)]));
        Erro := 'Exceção ao autenticar: ' + E.Message;
        Result := False;
      end;
    end;

  finally
    RespStream.Free;
    CorpoVazio.Free;
  end;
end;

{ === API pública === }

function DefinirDespachanteAtual(const Identificador: string): Boolean;
begin
  GDespachanteAtual := Identificador.Trim;
  Result := GDespachanteAtual <> '';
end;

function AutenticarDespachanteAtual(const Http: TIdHTTP): Boolean;
var
  Erro: string;
  Cred, CredAnterior: TCredenciaisSessao;
  TemCredAnterior: Boolean;
begin
  Result := False;

  if GDespachanteAtual = '' then
    Exit(False);

  // aplica mTLS
  if not AplicarCertificadoDoDespachante(GDespachanteAtual, Http, Erro) then
  begin
    uLog.LogError('AutenticarDespachanteAtual - autenticar-despachante',
      Format('desp = %s | etapa = mtls | msg = %s', [GDespachanteAtual, uLog.Truncar(Erro, 200)]));
    Exit(False);
  end;

  // pega "anterior" sem invalidar (para fallback no cooldown 60s)
  TemCredAnterior := TentarObterCredenciaisSemInvalidar(GDespachanteAtual, CredAnterior);

  // cache válido (com regra de expiração)
  if ObterCredenciaisDoCache(GDespachanteAtual, Cred) then
  begin
    PreencherPadroesDeRequisicao(Http);
    AplicarCredenciaisNoHttp(Cred, Http);

    uLog.LogInfo('AutenticarNoPortal - autenticar-ok',
    Format('TokenAutorizacao = %s | CsrfToken = %s | rawExp = %s | expiraEm = %s',
           [Cred.TokenAutorizacao, Cred.CsrfToken, Cred.CsrfExpiracao, DateTimeToStr(Cred.ExpiraEm)]));

    Exit(True);
  end;

  // não tem cache válido -> autentica agora
  Result := AutenticarNoPortal(GDespachanteAtual, Http, Cred, Erro);

  if Result then
    Exit(True);

  // Fallback: se o Portal recusou por cooldown 60s, tenta reaproveitar credencial anterior
  if EhErroCooldown60s(Erro) and TemCredAnterior and
     (CredAnterior.TokenAutorizacao <> '') and (CredAnterior.CsrfToken <> '') then
  begin
    PreencherPadroesDeRequisicao(Http);
    AplicarCredenciaisNoHttp(CredAnterior, Http);

    uLog.LogWarn('AutenticarNoPortal - cooldown-reuse',
      Format('desp = %s | acao = reusar-token-cache | msg = %s', [GDespachanteAtual, uLog.Truncar(Erro, 200)]));

    Exit(True);
  end;

  // erro real
  uLog.LogError('AutenticarNoPortal - autenticar-despachante',
    Format('desp = %s | msg = %s', [GDespachanteAtual, uLog.Truncar(Erro, 250)]));
  Result := False;
end;

function ObterCredenciaisDespachanteAtual(out Credenciais: TCredenciaisSessao): Boolean;
begin
  Result := ObterCredenciaisDoCache(GDespachanteAtual, Credenciais);
end;

procedure AtualizarCredenciaisDoDespachanteAPartirDaResposta(const Http: TIdHTTP);
var
  Novo, Antigo: TCredenciaisSessao;
  TemToken, TemCsrf, TemExp: Boolean;
begin
  if GDespachanteAtual = '' then Exit;

  FillChar(Novo, SizeOf(Novo), 0);
  TemToken := False; TemCsrf := False; TemExp := False;

  Novo.TokenAutorizacao := Http.Response.RawHeaders.Values['set-token'];
  TemToken := Novo.TokenAutorizacao <> '';

  Novo.CsrfToken := Http.Response.RawHeaders.Values['X-CSRF-Token'];
  if Novo.CsrfToken = '' then
    Novo.CsrfToken := Http.Response.RawHeaders.Values['x-csrf-token'];
  TemCsrf := Novo.CsrfToken <> '';

  Novo.CsrfExpiracao := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
  if Novo.CsrfExpiracao = '' then
    Novo.CsrfExpiracao := Http.Response.RawHeaders.Values['x-csrf-expiration'];
  TemExp := Novo.CsrfExpiracao <> '';

  if not ObterCredenciaisDoCache(GDespachanteAtual, Antigo) then
    FillChar(Antigo, SizeOf(Antigo), 0);

  // Mescla preservando o que não veio
  if not TemToken then Novo.TokenAutorizacao := Antigo.TokenAutorizacao;
  if not TemCsrf  then Novo.CsrfToken        := Antigo.CsrfToken;
  if not TemExp   then Novo.CsrfExpiracao    := Antigo.CsrfExpiracao;

  // Se chegou Expiration novo, recompute ExpiraEm com base no Now
  if TemExp then
  begin
    Novo.ObtidoEm := Now;
    Novo.ExpiraEm := CalcularExpiraEm(Novo.CsrfExpiracao, Novo.ObtidoEm);
    uLog.LogInfo('csrf-atualizado',
      Format('desp=%s|rawExp=%s|novoExpiraEm=%s',
             [GDespachanteAtual, Novo.CsrfExpiracao, DateTimeToStr(Novo.ExpiraEm)]));

  end
  else
  begin
    Novo.ObtidoEm := Antigo.ObtidoEm;
    Novo.ExpiraEm := Antigo.ExpiraEm;
  end;

  GravarCredenciaisNoCache(GDespachanteAtual, Novo);
end;

function InvalidarCredenciaisDespachanteAtual: Boolean;
begin
  Result := False;
  if (GDespachanteAtual <> '') and Assigned(GCredenciaisPorDespachante) then
  begin
    Result := GCredenciaisPorDespachante.ContainsKey(GDespachanteAtual);
    if Result then
      GCredenciaisPorDespachante.Remove(GDespachanteAtual);
  end;
end;

function ReautenticarDespachanteAtual(const Http: TIdHTTP): Boolean;
var
  Erro: string;
  CredNova, CredAnterior: TCredenciaisSessao;
  TemCredAnterior: Boolean;
begin
  Result := False;
  if GDespachanteAtual = '' then
    Exit;

  // 1) aplica mTLS do despachante
  if not AplicarCertificadoDoDespachante(GDespachanteAtual, Http, Erro) then
  begin
    uLog.LogError('reautenticar-falha',
      Format('desp=%s|etapa=mtls|msg=%s', [GDespachanteAtual, uLog.Truncar(Erro, 200)]));
    Exit(False);
  end;

  // 2) guarda credencial anterior (para fallback no cooldown 60s)
  TemCredAnterior := TentarObterCredenciaisSemInvalidar(GDespachanteAtual, CredAnterior);

  // 3) força autenticação no portal (ignora cache válido de propósito)
  Result := AutenticarNoPortal(GDespachanteAtual, Http, CredNova, Erro);

  if Result then
  begin
    uLog.LogInfo('reautenticar-ok',
      Format('desp=%s|expiraEm=%s', [GDespachanteAtual, DateTimeToStr(CredNova.ExpiraEm)]));
    Exit(True);
  end;

  // 4) >>> NOVO: se for cooldown 60s, reaproveita token anterior (se existir)
  if EhErroCooldown60s(Erro) then
  begin
    if TemCredAnterior and (CredAnterior.TokenAutorizacao <> '') and (CredAnterior.CsrfToken <> '') then
    begin
      AplicarCredenciaisNoHttp(CredAnterior, Http);

      uLog.LogWarn('reautenticar-cooldown',
        Format('desp=%s|acao=reusar-token-cache|msg=%s',
          [GDespachanteAtual, uLog.Truncar(Erro, 220)]));

      Exit(True);
    end;

    // não tem o que reaproveitar
    uLog.LogWarn('reautenticar-cooldown',
      Format('desp=%s|acao=aguardar|msg=%s', [GDespachanteAtual, uLog.Truncar(Erro, 220)]));
    Exit(False);
  end;

  // 5) erro real
  uLog.LogError('reautenticar-falha',
    Format('desp=%s|msg=%s', [GDespachanteAtual, uLog.Truncar(Erro, 220)]));
  Result := False;
end;

{ === Funções para automatizar renovação do certificado === }

function ListarDespachantesEmCache: TArray<string>;
var
  K: string;
  I: Integer;
begin
  SetLength(Result, 0);
  if not Assigned(GCredenciaisPorDespachante) then Exit;

  SetLength(Result, GCredenciaisPorDespachante.Count);
  I := 0;
  for K in GCredenciaisPorDespachante.Keys do
  begin
    Result[I] := K;
    Inc(I);
  end;
end;

function TentarObterCredenciaisSemInvalidar(const Despachante: string; out Cred: TCredenciaisSessao): Boolean;
begin
  Result := False;
  FillChar(Cred, SizeOf(Cred), 0);
  if (Despachante = '') or (not Assigned(GCredenciaisPorDespachante)) then Exit;
  Result := GCredenciaisPorDespachante.TryGetValue(Despachante, Cred);
end;

function ReautenticarDespachante(const Despachante: string; out Erro: string): Boolean;
var
  Http: TIdHTTP;
  Cred: TCredenciaisSessao;
begin
  Result := False;
  Erro := '';

  Http := CriarHttpIndy(Despachante);
  try
    // aplica mTLS do despachante
    if not AplicarCertificadoDoDespachante(Despachante, Http, Erro) then
    begin
      uLog.LogError('renovar-falha', Format('desp=%s|etapa=mtls|msg=%s', [Despachante, uLog.Truncar(Erro, 200)]));
      Exit(False);
    end;

    // tenta autenticar
    if AutenticarNoPortal(Despachante, Http, Cred, Erro) then
    begin
      uLog.LogInfo('renovar-ok', Format('desp=%s|expiraEm=%s', [Despachante, DateTimeToStr(Cred.ExpiraEm)]));
      uLog.LogInfo('cookie-debug', Format('desp=%s|cookies=%d',[Despachante, Http.CookieManager.CookieCollection.Count]));

      Exit(True);
    end;

    // >>> NOVO: cooldown 60s não é falha “grave”
    if EhErroCooldown60s(Erro) then
    begin
      uLog.LogWarn('renovar-cooldown', Format('desp=%s|msg=%s', [Despachante, uLog.Truncar(Erro, 220)]));
      Exit(False);
    end;

    // erro real
    uLog.LogError('renovar-falha', Format('desp=%s|msg=%s', [Despachante, uLog.Truncar(Erro, 220)]));
    Result := False;

  finally
    Http.Free;
  end;
end;

function EhErroCooldown60s(const TextoErro: string): Boolean;
var
  S: string;
begin
  S := LowerCase(TextoErro);
  // PLAT-ER2033: "Usuário realizou autenticação válida nos últimos 60 segundos..."
  Result :=
    (Pos('plat-er2033', S) > 0) or
    (Pos('últimos 60 segundos', S) > 0) or
    (Pos('ultimos 60 segundos', S) > 0);
end;

function EstaAutoRenovacaoBloqueada(const Despachante: string): Boolean;
var
  B: Boolean;
begin
  Result := False;
  if (Despachante = '') or (not Assigned(GBloqueadoAutoPorDesp)) then Exit;

  if GBloqueadoAutoPorDesp.TryGetValue(Despachante, B) then
    Result := B;
end;

procedure RegistrarFalhaAutoRenovacao(const Despachante: string);
var
  V: Integer;
begin
  if (Despachante = '') then Exit;

  if not Assigned(GFalhasAutoPorDesp) then Exit;
  if not Assigned(GBloqueadoAutoPorDesp) then Exit;

  if not GFalhasAutoPorDesp.TryGetValue(Despachante, V) then
    V := 0;

  Inc(V);
  GFalhasAutoPorDesp.AddOrSetValue(Despachante, V);

end;

procedure RegistrarSucessoAutoRenovacao(const Despachante: string);
begin
  if Despachante = '' then Exit;

  if Assigned(GFalhasAutoPorDesp) then
    GFalhasAutoPorDesp.AddOrSetValue(Despachante, 0);

  if Assigned(GBloqueadoAutoPorDesp) then
    GBloqueadoAutoPorDesp.AddOrSetValue(Despachante, False);
end;

procedure ResetarEstadoParaRequisicaoExterna(const Despachante: string);
begin
  // “efeito reiniciar” só para esse despachante (sem reiniciar o serviço)
  if Despachante = '' then Exit;

  // 1) Remove credenciais do cache (se você já tem este método/estrutura)
  if Assigned(GCredenciaisPorDespachante) then
    GCredenciaisPorDespachante.Remove(Despachante);

  // 2) Zera contador e desbloqueia
  RegistrarSucessoAutoRenovacao(Despachante);


  uAutenticacao.LimparCookieManager(Despachante);
  uLog.LogInfo('reset-por-requisicao-externa',
    Format('desp=%s|acao=limpar_cache_e_contadores', [Despachante]));
end;


initialization
  GCredenciaisPorDespachante := TDictionary<string, TCredenciaisSessao>.Create;
  GFalhasAutoPorDesp := TDictionary<string, Integer>.Create;
  GBloqueadoAutoPorDesp := TDictionary<string, Boolean>.Create;

finalization
  GCredenciaisPorDespachante.Free;
  FreeAndNil(GFalhasAutoPorDesp);
  FreeAndNil(GBloqueadoAutoPorDesp);

  if GCookiesPorDesp <> nil then
  begin
    // Delphi sem "inline var"
    for Pair in GCookiesPorDesp do
      Pair.Value.Free;

    GCookiesPorDesp.Free;
    GCookiesPorDesp := nil;
  end;


end.

