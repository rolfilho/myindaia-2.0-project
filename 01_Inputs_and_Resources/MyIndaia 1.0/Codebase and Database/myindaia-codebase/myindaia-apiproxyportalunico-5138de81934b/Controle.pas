unit Controle;

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  IdHTTP, IdSSLOpenSSL, IdSSLOpenSSLHeaders, IdGlobal, IdURI, uLog, System.DateUtils, uAutenticacao;

type
  TResultadoProxy = record
    CodigoStatus: Integer;
    CorpoRespostaJson: string;
    Sucesso: Boolean;
  end;

function ProcessarProxyPortalUnico(const Cabecalhos: TStrings;
                                   const CorpoJsonBruto: string): TResultadoProxy;

implementation

const
  URL_BASE_PORTAL = 'https://portalunico.siscomex.gov.br';

var
  // Mantidos apenas no escopo do servidor (NÃO retornados ao cliente)
  vTokenAutorizacao: string = '';         // Preencha conforme sua lógica atual
  vCsrfToken: string = '';
  vCsrfExpiracao: string = '';

function NovoReqId: string;
begin
  Result := Copy(StringReplace(TGuid.NewGuid.ToString, '{', '', []), 1, 8);
end;

  function MensagemCsrfExpirado(const JsonErro: string): Boolean;
var
  V: TJSONValue;
  O, Det: TJSONObject;
  Msg: string;
begin
  Result := False;
  if JsonErro.Trim = '' then Exit;

  V := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JsonErro), 0);
  try
    if not (V is TJSONObject) then Exit;
    O := TJSONObject(V);

    Det := O.Values['detalhes'] as TJSONObject;
    if Assigned(Det) and Assigned(Det.Values['message']) then
      Msg := Det.Values['message'].Value
    else if Assigned(O.Values['mensagem']) then
      Msg := O.Values['mensagem'].Value;

    Msg := LowerCase(Msg);
    // tolerante a variações: "x-csrf-token ... expirad"
    Result :=
      ((Pos('x-csrf-token', Msg) > 0) or (Pos('csrf', Msg) > 0)) and
      ((Pos('expirad', Msg) > 0) or (Pos('expira', Msg) > 0));
  finally
    V.Free;
  end;
end;

function ObterHeader(const Cabecalhos: TStrings; const Nome: string): string;
begin
  Result := Cabecalhos.Values[Nome];
  if Result = '' then
    Result := Cabecalhos.Values[UpperCase(Nome)]; // tolerância a maiúsculas
end;

function MetodoValido(const Metodo: string): Boolean;
begin
  Result := SameText(Metodo, 'GET') or SameText(Metodo, 'POST') or
            SameText(Metodo, 'PUT') or SameText(Metodo, 'DELETE');
end;

function JsonValido(const Texto: string): Boolean;
var
  V: TJSONValue;
begin
  if Texto.Trim = '' then
    Exit(True);
  V := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Texto), 0);
  try
    Result := V <> nil;
  finally
    V.Free;
  end;
end;

procedure AtualizarCsrfDeResposta(const Http: TIdHTTP; Despachante: String);
var
  Valor: string;
  Cred: TCredenciaisSessao;
begin

  uLog.LogInfo('RAW HEADERS',
    Format('rawHeaders = %s ', [Http.Response.RawHeaders.Text]));

  ObterCredenciaisDoCache(Despachante, Cred);

  if not Assigned(Http) then Exit;

  Valor := Http.Response.RawHeaders.Values['X-CSRF-Token'];
  if Valor = '' then
  Valor := Http.Response.RawHeaders.Values['x-csrf-token'];

  if Valor <> '' then
    Cred.CsrfToken := Valor;

  Valor := '';

  Valor := Http.Response.RawHeaders.Values['X-CSRF-Expiration'];
  if Valor = '' then
  Valor := Http.Response.RawHeaders.Values['x-csrf-expiration'];

  if Valor <> '' then
  begin
    Cred.CsrfExpiracao := Valor;
    Cred.ObtidoEm := Now;
    Cred.ExpiraEm := CalcularExpiraEm(Cred.CsrfExpiracao, Cred.ObtidoEm);
  end;

  GravarCredenciaisNoCache(Despachante, Cred)

end;

function MontarUrlCompleta(const PathRelativo: string): string;
var
  Caminho: string;
begin
  Caminho := PathRelativo;
  if (Caminho = '') or (Caminho[1] <> '/') then
    Caminho := '/' + Caminho;
  Result := URL_BASE_PORTAL + Caminho;
end;

procedure AplicarHeadersDeAutenticacao(const Http: TIdHTTP);
begin
  Http.Request.CustomHeaders.Values['role-type'] := 'IMPEXP';

  // Authorization (se sua lógica usar)
  if vTokenAutorizacao <> '' then
    Http.Request.CustomHeaders.Values['Authorization'] := vTokenAutorizacao;

  // CSRF atual (se houver guardado)
  if vCsrfToken <> '' then
    Http.Request.CustomHeaders.Values['X-CSRF-Token'] := vCsrfToken;
end;

function EnviarAoPortal(const Metodo, Url, Despachante: string; const CorpoJson: string;
                        out CodigoStatus: Integer; out CorpoResposta: string): Boolean;
var
  Http: TIdHTTP;
  StreamEnvio, StreamResposta: TStringStream;
  ReqIdLocal: string;
  CacheInfo: string;
begin
  ReqIdLocal := NovoReqId;

  Result := False;
  CodigoStatus := 0;
  CorpoResposta := '';

  Http := uAutenticacao.CriarHttpIndy(Despachante);
  try
    CacheInfo := '';
    if not uAutenticacao.AutenticarDespachanteAtual(Http) then
      raise Exception.Create('Não foi possível autenticar o despachante para mTLS.');

    CacheInfo := 'cacheHit=' + BoolToStr(True, True); // se souber; senão deixe vazio
    uLog.LogInfo('EnviarAoPortal - proxy-call',
      Format('reqId = %s | desp = %s | m=%s | url = %s', [ReqIdLocal, ObterDespachanteAtual, Metodo, Url]));

    AplicarHeadersDeAutenticacao(Http);

    StreamResposta := TStringStream.Create('', TEncoding.UTF8);
    try
      if SameText(Metodo, 'GET') then
        Http.Get(Url, StreamResposta)
      else if SameText(Metodo, 'DELETE') then
        Http.Delete(Url, StreamResposta)
      else if SameText(Metodo, 'POST') then
      begin
        StreamEnvio := TStringStream.Create(CorpoJson, TEncoding.UTF8);
        try
          Http.Post(Url, StreamEnvio, StreamResposta);
        finally
          StreamEnvio.Free;
        end;
      end
      else if SameText(Metodo, 'PUT') then
      begin
        StreamEnvio := TStringStream.Create(CorpoJson, TEncoding.UTF8);
        try
          Http.Put(Url, StreamEnvio, StreamResposta);
        finally
          StreamEnvio.Free;
        end;
      end
      else
        raise Exception.Create('Método HTTP não suportado.');

      CodigoStatus   := Http.Response.ResponseCode;
      CorpoResposta  := StreamResposta.DataString;

      uLog.LogInfo('EnviarAoPortal - proxy-resp',
        Format('reqId = %s | status = %d | len = %d', [ReqIdLocal, CodigoStatus, Length(CorpoResposta)]));

      // >>> Atualiza CSRF somente quando 2xx <<<
      Result := (CodigoStatus >= 200) and (CodigoStatus <= 299);
      if Result then
        AtualizarCsrfDeResposta(Http, Despachante);

    except
      on E: EIdHTTPProtocolException do
      begin
        uLog.LogError('EnviarAoPortal - proxy-http-error',
          Format('reqId = %s | status = %d | msg = %s',
         [ReqIdLocal, E.ErrorCode, uLog.Truncar(CorpoResposta, 300)]));

        CodigoStatus  := E.ErrorCode;       // 4xx / 5xx
        CorpoResposta := E.ErrorMessage;    // corpo bruto, quando houver

        // >>> Se o Portal indicar CSRF expirado, renova as credenciais AGORA <<<
        if MensagemCsrfExpirado(CorpoResposta) then
        begin
          uAutenticacao.InvalidarCredenciaisDespachanteAtual;

          uLog.LogWarn('EnviarAoPortal - csrf-expirado',
            Format('reqId = %s | desp = %s | acao = reautenticar', [ReqIdLocal, ObterDespachanteAtual]));

          // força nova autenticação (NÃO reenvia a operação original)
          uAutenticacao.ReautenticarDespachanteAtual(Http);


          uLog.LogInfo('EnviarAoPortal - reautenticado',
            Format('reqId = %s | desp = %s | resultado = ok', [ReqIdLocal, ObterDespachanteAtual]));

          // (opcional) se você mantiver variáveis internas vCsrfToken/vCsrfExpiracao,
          // pode sincronizá-las com o cache recém-atualizado:
          { var Cred: TCredenciaisSessao;  // Delphi 10.3+
            if uAutenticacao.ObterCredenciaisDespachanteAtual(Cred) then
            begin
              if Cred.CsrfToken <> '' then vCsrfToken := Cred.CsrfToken;
              if Cred.CsrfExpiracao <> '' then vCsrfExpiracao := Cred.CsrfExpiracao;
            end;
          }
        end;

        Result := False;
      end;
      on E: Exception do
      begin

        uLog.LogError('EnviarAoPortal - proxy-transport-ex',
          Format('reqId = %s | ex = %s | msg = %s', [ReqIdLocal, E.ClassName, uLog.Truncar(E.Message, 300)]));

        CodigoStatus  := 504; // timeout/transport
        CorpoResposta := '{"mensagem" : "Falha na comunicação. Tente novamente."}';
        Result := False;
      end;
    end;
  finally
    Http.Free;
  end;
end;

function RespostaErroPadrao(const CodigoStatus: Integer; const JsonErroPortal: string): TResultadoProxy;
begin
  Result.CodigoStatus := CodigoStatus;
  Result.Sucesso := False;

  if JsonErroPortal.Trim <> '' then
    Result.CorpoRespostaJson := Format(
      '{"mensagem" : "Falha no processamento da requisição ao portal único.","detalhes" : %s}',
      [JsonErroPortal])
  else
    Result.CorpoRespostaJson := '{"mensagem" : "Falha na comunicação com o portal único. Tente novamente."}';
end;

function ProcessarProxyPortalUnico(const Cabecalhos: TStrings;
                                   const CorpoJsonBruto: string): TResultadoProxy;
var
  Despachante, Metodo, PathRelativo, UrlFinal: string;
  Status: Integer;
  CorpoPortal: string;
  EhWrite: Boolean;
begin
  // 1) Validar headers obrigatórios
  Despachante := ObterHeader(Cabecalhos, 'Despachante');
  Metodo      := ObterHeader(Cabecalhos, 'PU-Method');
  PathRelativo:= ObterHeader(Cabecalhos, 'PU-Path');

  if Despachante.Trim = '' then
    Exit(RespostaErroPadrao(400, '{"erro" : "Header Despachante ausente."}'));
  if not MetodoValido(Metodo) then
    Exit(RespostaErroPadrao(400, '{"erro" : "PU-Method inválido. Use GET, POST, PUT ou DELETE."}'));
  if PathRelativo.Trim = '' then
    Exit(RespostaErroPadrao(400, '{"erro" : "PU-Path ausente."}'));
  if PathRelativo[1] <> '/' then
    Exit(RespostaErroPadrao(400, '{"erro" : "PU-Path deve iniciar com /."}'));

  // 2) Validar JSON quando for POST/PUT
  EhWrite := SameText(Metodo, 'POST') or SameText(Metodo, 'PUT');
  if EhWrite and (not JsonValido(CorpoJsonBruto)) then
    Exit(RespostaErroPadrao(400, '{"erro" : "JSON inválido no corpo da requisição."}'));

  // 3) Definir o despachante atual na autenticação (mTLS por despachante)
  //    Importante: a sua uAutenticacao deve reter o "despachante corrente" para
  //    que AutenticarDespachanteAtual(Http) saiba qual certificado aplicar.
  if not uAutenticacao.DefinirDespachanteAtual(Despachante) then
    Exit(RespostaErroPadrao(401, '{"erro" : "Despachante não autorizado ou certificado indisponível."}'));

  // 4) Montar URL final (Produção sempre)
  UrlFinal := MontarUrlCompleta(PathRelativo);

  // 5) Enviar ao Portal
  if EnviarAoPortal(Metodo, UrlFinal, Despachante, CorpoJsonBruto, Status, CorpoPortal) then
  begin
    // Sucesso (2xx) => devolve JSON bruto do Portal
    Result.CodigoStatus := Status;
    Result.CorpoRespostaJson := CorpoPortal;
    Result.Sucesso := True;
  end
  else
  begin
    // Erro: mensagem padrão + detalhes (corpo bruto do Portal, se houver)
    Result := RespostaErroPadrao(Status, CorpoPortal);
  end;
end;

end.

