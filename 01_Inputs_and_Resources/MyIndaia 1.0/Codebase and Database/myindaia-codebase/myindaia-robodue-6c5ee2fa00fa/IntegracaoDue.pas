{
Tabela de situação da DU-E
Código	Descrição
1	Em elaboração
10	Registrada
11	Declaração Apresentada para Despacho
15	ACD em processamento
20	Liberada sem conferência Aduaneira canal verde
21	Selecionada para conferência canal laranja ou vermelho
25	Embarque antecipado autorizado
26	Embarque antecipado pendente de autorização
30	Em análise fiscal
35	Concluída análise fiscal
40	Desembaraçada
70	Averbada
80	Cancelada pelo Exportador
81	Cancelada por Expiração de Prazo
82	Cancelada pela Aduana
83	Cancelada pela Aduana a pedido do exportador
86	Interrompida

Tabela de indicação de bloqueio - indicadorBloqueio:
Código	Descrição
1	Bloqueado
2	Desbloqueado

Tabela de situação da carga - situacaoCarga:
Código	Descrição
1	Estocada
2	Em Trânsito
3	Carga Completamente Exportada
4	Não se aplica

Tabela de controle administrativo - controleAdministrativo:
Código	Descrição
1	Deferido
2	Dispensado
3	Pendente
4	Em processamento
5	Impedido
}
unit IntegracaoDue;

interface

uses System.Classes, System.SysUtils, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  DueClasses, DueCompletaClasses;


type

  TTpConsulta = (tcCompleta, tcResumida);

  TDue = class
  private
    FProducao: Boolean;
    FHttp: TIdHTTP;
    FIOHandler: TIdSSLIOHandlerSocketOpenSSL;
    FRespostaStr: string;
    FCodigoResposta: Integer;
    FAutenticado: Boolean;
    FResposta: TRespostaConsultaResumida;
    FRespostaCompleta: TRespostaConsultaCompleta;
  protected
    Token: string;
    CSRF: string;
    function GetUrlBase: string;
    function GetUrlAutenticacao: string;
    function GetUrlConsulta: string;
    function GetUrlConsultaCompleta: string;
    function GetUrlEnvio: string;
    procedure GaranteAutenticacao(ForceAtutenticao: Boolean = false);
  public
    property RespostaStr: string read FRespostaStr;
    property Resposta: TRespostaConsultaResumida read FResposta;
    property RespostaCompleta: TRespostaConsultaCompleta read FRespostaCompleta;
    property CodigoRespost: Integer read FCodigoResposta;
  public
    function Autenticar: Boolean;
    procedure Consulta(const Due: string; tpConsulta: TtpConsulta ; ForceAtutenticao: Boolean = false);
    procedure Enviar(const NrProcesso, XML: string);
    constructor Create(Producao: Boolean);
    destructor Destroy; override;
  end;

implementation

{ TDue }

uses KrUtil, uPreferencias, Settings, Main;

function TDue.Autenticar: Boolean;
var
  StringList: TStrings;
  vNomeCertificado: String;
begin
  StringList := TStringList.Create;
  try
    LogDebug('FHttp.Request.Clear;');
    FHttp.Request.Clear;
    {FHttp.Request.BasicAuthentication := False;
    FHttp.Request.Connection := 'keep-alive';
    FHttp.Request.CacheControl := 'max-age=0';
    FHttp.Request.Accept := 'application/json, text/plain, */*';
    FHttp.Request.AcceptEncoding := 'gzip, deflate, br';
    FHttp.Request.AcceptLanguage := 'en,pt;q=0.9,pt-BR;q=0.8';
    FHttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36';
    FHttp.Request.AcceptEncoding := 'gzip, deflate';
    FHttp.Request.AcceptLanguage := 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4';
    }
    FHttp.Request.BasicAuthentication := False;
    FHttp.Request.ContentType := 'application/json';
    FHttp.Request.Accept := 'application/json, text/plain, */*';
    //FHttp.Request.AcceptCharSet := 'UTF-8';
    //FHttp.Response.ResponseText := 'UTF-8';
    FHttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36';
    FHttp.Request.AcceptEncoding := 'gzip, deflate, br';
    FHttp.Request.AcceptLanguage := 'en,pt;q=0.9,pt-BR;q=0.8';
    FHttp.Request.CacheControl := 'no-cache';
    FHttp.BoundPortMax := 5000;

    LogDebug('GetPath='+GetLocalPath);

    if LocalSettings.CdDespachante <> '' then
    begin

      if LocalSettings.CdDespachante = '003' then vNomeCertificado := 'Luiz';
      if LocalSettings.CdDespachante = '031' then vNomeCertificado := 'Edgar';
      if LocalSettings.CdDespachante = '042' then vNomeCertificado := 'Vanessa';
      if LocalSettings.CdDespachante = '027' then vNomeCertificado := 'Mello';
      if LocalSettings.CdDespachante = '028' then vNomeCertificado := 'Cristiano';
      if LocalSettings.CdDespachante = '001' then vNomeCertificado := 'Fabricio';

      FIOHandler.SSLOptions.CertFile     :=  GetLocalPath +'certificado\'+  vNomeCertificado+'.pem';
      FIOHandler.SSLOptions.RootCertFile :=  GetLocalPath +'certificado\'+  vNomeCertificado+'.pem';
      FIOHandler.SSLOptions.KeyFile      :=  GetLocalPath +'certificado\'+  vNomeCertificado+'.key';
    end
    else
    begin
      FIOHandler.SSLOptions.CertFile     :=  GetLocalPath +'certificado\'+ 'LuizHenrique.pem';
      FIOHandler.SSLOptions.RootCertFile :=  GetLocalPath +'certificado\'+  'LuizHenrique.pem';
      FIOHandler.SSLOptions.KeyFile      :=  GetLocalPath +'certificado\'+  'LuizHenrique.key';
    end;


    FIOHandler.SSLOptions.Method       := sslvSSLv23;
    FIOHandler.SSLOptions.Mode         := sslmClient;
    FIOHandler.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
    FIOHandler.SSLOptions.VerifyDepth  := 2;
    FIOHandler.SSLOptions.VerifyMode   := [];
    FHttp.Request.Referer := GetUrlAutenticacao;
    FHttp.Request.CustomHeaders.Values['role-type']:= 'IMPEXP';

    FHttp.Post(GetUrlAutenticacao, StringList);
    LogDebug('FHttp.Response.ResponseCode = '+FHttp.Response.ResponseCode.ToString);
    if FHttp.Response.ResponseCode = 200 then
    begin
      FAutenticado := True;
      Result := True;
      Token := FHttp.Response.RawHeaders.Values['set-token'];
      LogDebug('Token='+Token);
      CSRF := FHttp.Response.RawHeaders.Values['x-csrf-token'];
      LogDebug('CSRF='+CSRF)
    end
    else
    begin
      FAutenticado := False;
      Result := False;
      FRespostaStr := FHttp.ResponseText;
    end;
  finally
    StringList.Free;
  end;
end;

function StreamToString(aStream: TStream): string;
var
  SS: TStringStream;
begin
  if aStream <> nil then
  begin
    SS := TStringStream.Create('');
    try
      SS.CopyFrom(aStream, 0);  // No need to position at 0 nor provide size
      Result := SS.DataString;
    finally
      SS.Free;
    end;
  end else
  begin
    Result := '';
  end;
end;

{
procedure TDue.Consulta(const Due: string);
var
  Response: TStringStream;
begin
  GaranteAutenticacao;
  Response := TStringStream.Create('');
  try
    FHttp.Request.CustomHeaders.Clear;
    FHttp.Request.Clear;
    FHttp.Request.ContentType := 'application/json';
    FHttp.Request.ContentEncoding := 'raw';
    FHttp.Request.BasicAuthentication := False;
    FHttp.Request.AcceptCharSet := 'UTF-8';
    FHttp.Request.Accept := 'application/json, text/plain, */*';
    FHttp.Response.CharSet := 'UTF-8';
    FHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    //FHttp.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36';
    FHttp.Request.AcceptEncoding := 'gzip, deflate';
    FHttp.Request.AcceptLanguage := 'pt-BR,pt;q=0.8,en-US;q=0.6,en;q=0.4';
    FHttp.Request.CustomHeaders.Values['Authorization']:= Token;
    FHttp.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    //FHttp.Request.CustomHeaders.Values['numero']:= Due;
    //FHttp.Request.Referer := GetUrlConsulta;
    //FHttp.Get(GetUrlConsulta+'?numero='+Due, Response);
    FHttp.Get('https://portalunico.siscomex.gov.br/due/api/due/listar-due-consulta?due=18BR0003548065', Response);
    FRespostaStr := Response.DataString;
    //FResposta := TRespostaConsultaResumida.FromJsonString(FRespostaStr);
    //FResposta := FHttp.ResponseText;
    LogDebug('FResposta='+FRespostaStr);
  finally
    Response.Free;
  end;
end;
}

procedure TDue.Consulta(const Due: string; tpConsulta: TtpConsulta; ForceAtutenticao: Boolean);
var
  Response: TStringStream;
  RespostaVazia : TRespostaConsultaResumida;
  RespostaVaziaC : TRespostaConsultaCompleta;
begin
  GaranteAutenticacao(ForceAtutenticao);
  Response := TStringStream.Create('');
  RespostaVazia :=  TRespostaConsultaResumida.Create;
  try
    FHttp.Request.CustomHeaders.Clear;
    FHttp.Request.CustomHeaders.Values['authorization']:= Token;
    FHttp.Request.CustomHeaders.Values['x-csrf-token']:= CSRF;

    if tpConsulta = tcCompleta then
    begin
      if DebugHook > 0 then
        log(GetUrlConsultaCompleta + Due, FormMain.Logar);

      FHttp.Get(GetUrlConsultaCompleta + Due, Response);
      FRespostaStr := Response.DataString;
      if not FRespostaStr.IsEmpty then
        FRespostaCompleta := TRespostaConsultaCompleta.FromJsonString(Utf8ToString(FRespostaStr))
      else
      begin
        FRespostaCompleta := RespostaVaziac;
      end;
    end
    else
    begin
      if DebugHook > 0 then
        log(GetUrlConsulta+'?numero='+Due, FormMain.Logar);

      FHttp.Get(GetUrlConsulta+'?numero='+Due, Response);
  //    FHttp.Get('https://portalunico.siscomex.gov.br/due/api/due/relatorio/pdf/19BR0000289085/2', Response);
      FRespostaStr := Response.DataString;
      if not FRespostaStr.IsEmpty then
        FResposta := TRespostaConsultaResumida.FromJsonString(Utf8ToString(FRespostaStr))
      else
      begin
        FResposta := RespostaVazia;
      end;
    end;

  finally
    Response.Free;
    RespostaVazia.Free;
  end;
end;

constructor TDue.Create(Producao: Boolean);
begin
  FProducao := Producao;
  FHttp := TidHttp.Create(nil);
  FIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FHttp.IOHandler := FIOHandler;
  FResposta := TRespostaConsultaResumida.Create;
end;

destructor TDue.Destroy;
begin
  FResposta.Free;
  inherited;
end;

procedure TDue.Enviar(const NrProcesso, XML: string);
var
  Response: TStringStream;
  XArquivo : TMemoryStream;
  XMLText : TStringStream;
  List: TStringList;
  ListRejeitada: TStringList;
  XMLDoc: TXMLDocument;
  URL: String;
  RespostaCod, RespostaMsg: String;
  //Criteria: TCriteria;
  Pasta: string;
  Arquivo: string;
begin
  GaranteAutenticacao;
  Response := TStringStream.Create('');
  XMLText := TStringStream.Create('');
  XArquivo := TMemoryStream.Create;
  XMLDoc := TXMLDocument.Create(nil);
  List := TStringList.Create;
  try
    XMLDoc.LoadFromXML(XML);
    List.Text :=  XML;
    List.Text := StringReplace(List.Text, '#$D#$A', '', [rfReplaceAll]);
    List.SaveToStream(XMLText);
    XArquivo.LoadFromStream(XMLText);

    FHttp.Request.CustomHeaders.Clear;
    FHttp.Request.Clear;
    FHttp.Request.ContentType := 'application/xml';
    FHttp.Request.ContentEncoding := 'raw';
    FHttp.Request.AcceptCharSet := 'UTF-8';
    FHttp.Request.Accept := 'application/xml';
    FHttp.Response.CharSet := 'UTF-8';
    FHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    FHttp.Request.CustomHeaders.Values['authorization']:= Token;
    FHttp.Request.CustomHeaders.Values['x-csrf-token']:= CSRF;
    FHttp.Request.Referer := URL;

    Pasta := GetLocalPath + 'TransmissorDUE\xml\Rejeitados';
    ForceDirectories(Pasta);
    Arquivo := Pasta + '\' + NrProcesso + '.xml';
    try
      FHttp.Post(URL , XArquivo, Response);
      FCodigoResposta := FHttp.Response.ResponseCode;
      if FCodigoResposta = 200 then
      begin
        FRespostaStr := UTF8Encode(Response.DataString + #13);
        //LerRespostaSucesso(UTF8Encode(Response.DataString), FHttp.Response.ResponseCode, FHttp.Response.Date);
      end;
    except
    on E:EIdHTTPProtocolException do
      begin
        FCodigoResposta := FHttp.Response.ResponseCode;
        FRespostaStr := e.ErrorMessage + #13;
      end;
    end;
  finally
    FreeAndNil(Response);
    FreeAndNil(XMLText);
    FreeAndNil(XArquivo);
    FreeAndNil(XMLDoc);
    FreeAndNil(List);
  end;
end;

procedure TDue.GaranteAutenticacao(ForceAtutenticao: Boolean);
begin
  if ForceAtutenticao or not FAutenticado then
    if not Autenticar then
      raise Exception.Create('Não foi possível autenticar.'+#13#10+FHttp.ResponseText);
end;

function TDue.GetUrlAutenticacao: string;
begin
   Result := GetUrlBase + '/portal/api/autenticar';
end;

function TDue.GetUrlBase: string;
begin
  if FProducao then
    Result := 'https://portalunico.siscomex.gov.br'
  else
    Result := 'https://val.portalunico.siscomex.gov.br';
end;

function TDue.GetUrlConsulta: string;
begin
  Result := GetUrlBase + '/due/api/ext/due/consultarDadosResumidosDUE';
end;

function TDue.GetUrlConsultaCompleta: string;
begin
  Result := GetUrlBase + '/due/api/ext/due/numero-da-due/';
end;

function TDue.GetUrlEnvio: string;
begin
  Result := GetUrlBase + '/due/api/ext/due';
end;

end.
