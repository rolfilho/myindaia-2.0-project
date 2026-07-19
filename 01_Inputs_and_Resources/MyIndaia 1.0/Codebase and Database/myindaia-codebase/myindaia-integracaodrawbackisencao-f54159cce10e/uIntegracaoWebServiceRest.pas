unit uIntegracaoWebServiceRest;

{ ------

  Instruções
  DLLs:
  Certificado:

--------}

interface

uses
  IdSSLOpenSSL, IdHTTP, Xml.XMLDoc, System.SysUtils, System.Classes, utils;

type
  TIntegradorWebServiceRest = class
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    idHttp: TIdHTTP;
    XMLDocument1: TXMLDocument;
  private
    Token: string;
    CSRF: string;
  public
    function Conectar(url: String; InCertificado: Integer): boolean;
    function Transmitir(var Resposta: String; url: String; StringListXML: TStringList): boolean;
    Constructor Create;
    Destructor Destroy; override;
  end;

var
  IntegradorWebServiceRest: TIntegradorWebServiceRest;

implementation


{ TIntegradorWebServiceRest }

function TIntegradorWebServiceRest.Conectar(url: String; InCertificado: Integer): boolean;
var
  StringList: TStringList;
  vPastaCertificados: string;
begin
  inherited;
  result := false;

  StringList := TStringList.Create;
  try
    vPastaCertificados := FileExistsForce(GetPath + 'Certificados\');
    idHttp.Request.Clear;
    idHttp.Request.ContentType := 'application/xml';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ResponseText := 'UTF-8';
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;

    if InCertificado = 0 then
    begin
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + 'Fabricio.pem';
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + 'Fabricio.pem';
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + 'Fabricio.key';
    end
    else if InCertificado = 1 then
    begin
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
      IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
    end;
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + NomeDespachante + '.key';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method       := sslvSSLv23;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];
    idHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    idHttp.Request.Referer := URL;
    idHttp.Request.CustomHeaders.Values['Role-Type']:= 'IMPEXP';

    try
      idHttp.Post(URL, StringList);
    except
    on E:EIdHTTPProtocolException do
      //ShowMessage(e.ErrorMessage + #13);
    end;

    result := idHttp.Response.ResponseCode = 200;

    Token := idHttp.Response.RawHeaders.Values['Set-Token'];
    CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
  finally
    FreeAndNil(StringList);
  end;
end;

constructor TIntegradorWebServiceRest.Create;
begin
  IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  idHttp := TIdHTTP.Create(nil);;
  XMLDocument1 := TXMLDocument.Create(nil);
end;

destructor TIntegradorWebServiceRest.Destroy;
begin
  FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
  FreeAndNil(idHttp);
  FreeAndNil(XMLDocument1);

  inherited;
end;

function TIntegradorWebServiceRest.Transmitir(var Resposta: String; url: String; StringListXML: TStringList): boolean;
var
  Response: TStringStream;
  XArquivo : TMemoryStream;
  XMLText : TStringStream;
  List: TStringList;
  ListRejeitada: TStringList;
  XML: TXMLDocument;
  RespostaCod, RespostaMsg: String;
  Pasta: string;
  Arquivo: string;
begin

  Response := TStringStream.Create('');
  XMLText := TStringStream.Create('');
  XArquivo := TMemoryStream.Create;
  List := TStringList.Create;
  result := false;
  try

    StringListXML.Text := StringReplace(StringListXML.Text, #$D#$A, '', [rfReplaceAll]);
    StringListXML.SaveToStream(XMLText);


    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    XArquivo.LoadFromStream(XMLText);
    IdHTTP.Request.ContentType := 'application/xml';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/xml';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    try
      idHTTP.Put(URL , XArquivo, Response);
    except
    on E:EIdHTTPProtocolException do
      begin
        Resposta := e.ErrorMessage;
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      result := true;
      Resposta := (UTF8Encode(Response.DataString));
    end;

  finally
    FreeAndNil(Response);
    FreeAndNil(XMLText);
    FreeAndNil(XArquivo);
  end;end;

end.
