unit FrIntegracaoDUE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.AnsiStrings,
  Xml.xmldom, Xml.XMLIntf, Data.DB, Xml.XMLDoc,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Aurelius.Sql.MSSQL, Aurelius.Engine.DatabaseManager, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Aurelius.Criteria.Base, Aurelius.Drivers.Interfaces,
  Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  Generics.Collections, FireDac.DApt,
  Aurelius.Bind.BaseDataset, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TformIntegracaoDue = class(Tform)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    txtXML: TMemo;
    Panel4: TPanel;
    Label1: TLabel;
    txtResposta: TMemo;
    Panel5: TPanel;
    btnConectar: TButton;
    btnEnviar: TButton;
    SplitterDetail: TSplitter;
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    XMLDocument1: TXMLDocument;
    Button1: TButton;
    Button2: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button3: TButton;
    procedure btnConectarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure txtRespostaDblClick(Sender: TObject);
    procedure txtXMLDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    Token: String;
    CSRF: String;
    NrProcesso : String;
    FNrDue: String;
    NomeDespachante: string;
    AmbienteProducao: Boolean;
    procedure LerRespostaSucesso(Resposta: String; ResponseCode: Integer; ResponseDate: TDate);
    procedure GerarXML;
    procedure LerRespostaErro(Resposta: String);
    { Private declarations }
  public
//    procedure AtualizaEventoFollowup(Processo, Evento: string);
//    class function Execute(aTipoIntegracao: TIntegracaoDue; aNrProcesso, NomeDespachante: string; aAmbienteProducao: Boolean): Boolean; static;
  end;

var
  formIntegracaoDue: TformIntegracaoDue;
  NrProcesso: String;

implementation


{$R *.dfm}

function FileExistsForce(aFile: String): String;
begin
  if not FileExists(aFile) then
    ForceDirectories(aFile);

  result := aFile;
end;

function GetPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
end;

procedure TformIntegracaoDue.btnConectarClick(Sender: TObject);
var
  URL: String;
  StringList: TStringList;
  vPastaCertificados: string;
begin
  inherited;

  if AmbienteProducao then
    URL := 'https://portalunico.siscomex.gov.br/portal/api/autenticar'
  else
    URL := 'https://val.portalunico.siscomex.gov.br/portal/api/autenticar';

  StringList := TStringList.Create;
  try
//    vPastaCertificados := FileExistsForce(GetPath + 'Certificados\');
    idHttp.Request.Clear;
    idHttp.Request.ContentType := 'application/xml';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ResponseText := 'UTF-8';
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  GetPath + 'LuizHenrique.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  GetPath + 'LuizHenrique.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  GetPath + 'LuizHenrique.key';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + NomeDespachante + '.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + NomeDespachante + '.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + NomeDespachante + '.key';
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
      ShowMessage(e.ErrorMessage + #13);
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      btnConectar.Caption := 'Conectado';
      btnConectar.Enabled := false;
      if AmbienteProducao then
        txtResposta.Lines.Add('Conectado no ambiente de PRODUÇÃO do Portal Único.' + #13)
      else
        txtResposta.Lines.Add('Conectado no ambiente VALIDAÇÃO do Portal Único.' + #13);
    end
    else
      txtResposta.Lines.Add(idHttp.ResponseText + #13);

    Token := idHttp.Response.RawHeaders.Values['Set-Token'];
    CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
  finally
    FreeAndNil(StringList);
  end;
end;

function respostateste: String;
begin
  result :=


            '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
            '<pucomexReturn>'+
            '    <message>Operação realizada com sucesso.</message>'+
            '    <due>18BR0000073368</due>'+
            '    <ruc>8BR04298106100017400000000002018060</ruc>'+
            '    <chaveDeAcesso>18QZN073360</chaveDeAcesso>'+
            '    <date>2018-06-29 17:33:54.0</date>'+
            '    <cpf>92710824868</cpf>'+
            '</pucomexReturn>';
end;

procedure TformIntegracaoDue.btnEnviarClick(Sender: TObject);
var
  Response: TStringStream;
  XArquivo : TMemoryStream;
  XMLText : TStringStream;
  List: TStringList;
  ListRejeitada: TStringList;
  XML: TXMLDocument;
  URL: String;
  RespostaCod, RespostaMsg: String;
  Criteria: TCriteria;
  Pasta: string;
  Arquivo: string;
begin

    if AmbienteProducao then
      URL := 'https://portalunico.siscomex.gov.br/due/api/ext/due'
    else
      URL := 'https://val.portalunico.siscomex.gov.br/due/api/ext/due';


  Response := TStringStream.Create('');
  XMLText := TStringStream.Create('');
  XArquivo := TMemoryStream.Create;
  XML := TXMLDocument.Create(self);
  List := TStringList.Create;

  try

    XML.LoadFromXML(txtXML.Lines.Text);

    List.Text :=  List.Text + txtXML.Lines.Text;
    List.Text := StringReplace(List.Text, '#$D#$A', '', [rfReplaceAll]);
    List.SaveToStream(XMLText);


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

    Pasta := FileExistsForce(GetPath + 'TransmissorDUE\xml\Rejeitados');
    Arquivo := Pasta + '\' + NrProcesso + '.xml';

    try
        idHTTP.post(URL , XArquivo, Response);
//        AtualizaEventoFollowup(NrProcesso, '124');

    except
    on E:EIdHTTPProtocolException do
      begin
        txtResposta.Lines.Add(e.ErrorMessage + #13);
//        adsProcessoExp.Edit;
//        adsProcessoExpCdStatusDue.AsInteger := idHttp.Response.ResponseCode;
//        adsProcessoExp.Post;

        ListRejeitada := TStringList.Create;
        try
          ListRejeitada.Add(e.ErrorMessage);
          LerRespostaErro(ListRejeitada.Text);
//          ListRejeitada.SaveToFile(Arquivo);
        finally
          FreeAndNil(ListRejeitada);
        end;
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      txtResposta.Lines.Add(UTF8Encode(Response.DataString + #13));

//      if FTipoIntegracao = idEnviar then
//        LerRespostaSucesso(UTF8Encode(Response.DataString), idHttp.Response.ResponseCode, idHttp.Response.Date)
//      else
//      if FTipoIntegracao in [idRetificarCargaAntecipada, idRetificarNormal] then
        //Ainda não tenho o xml de retorno para este caso

    end;

  finally
    FreeAndNil(Response);
    FreeAndNil(XMLText);
    FreeAndNil(XArquivo);
    FreeAndNil(XML);
    FreeAndNil(List);
  end;
end;

procedure TformIntegracaoDue.Button1Click(Sender: TObject);
begin
  inherited;
  //LerRespostaSucesso(respostateste, 0, now);
//  AtualizaEventoFollowup('0102EA-000019-18', '124');
end;

procedure TformIntegracaoDue.Button2Click(Sender: TObject);
var
  URL: String;
  StringList: TStringList;
  vPastaCertificados: string;
begin
  inherited;

    URL := 'https://cebraceisq.apimanagement.br10.hana.ondemand.com:443/v2/autenticacao/login';

  StringList := TStringList.Create;
  try
    idHttp.Request.Clear;
    idHttp.Request.ContentType := 'application/json';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ResponseText := 'UTF-8';
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method       := sslvSSLv23;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];
    idHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    idHttp.Request.Referer := URL;
    idHttp.Request.CustomHeaders.Values['x-api-key']:= 'FGKaeyXD7DBpwWihOAqSmWeTGe5AV7Rw';

    try
      idHttp.Post(URL, StringList);
    except
    on E:EIdHTTPProtocolException do
      ShowMessage(e.ErrorMessage + #13);
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      btnConectar.Caption := 'Conectado';
      btnConectar.Enabled := false;
      if AmbienteProducao then
        txtResposta.Lines.Add('Conectado no ambiente de PRODUÇÃO do Portal Único.' + #13)
      else
        txtResposta.Lines.Add('Conectado no ambiente VALIDAÇÃO do Portal Único.' + #13);
    end
    else
      txtResposta.Lines.Add(idHttp.ResponseText + #13);

    Token := idHttp.Response.RawHeaders.Values['token'];

  finally
    FreeAndNil(StringList);
  end;
end;

procedure TformIntegracaoDue.Button3Click(Sender: TObject);
begin
  try
    RESTRequest1.Execute;
  except
    showmessage('ERRO')

  end;

end;

procedure TformIntegracaoDue.FormActivate(Sender: TObject);
begin
  GerarXML;
  inherited;
end;

procedure TformIntegracaoDue.txtRespostaDblClick(Sender: TObject);
begin
  inherited;
  txtResposta.SelectAll;
end;

procedure TformIntegracaoDue.txtXMLDblClick(Sender: TObject);
begin
  inherited;
  txtXML.SelectAll;
end;

procedure TformIntegracaoDue.LerRespostaSucesso(Resposta: String; ResponseCode: Integer; ResponseDate: TDate);
var
  vXMLRetorno: IXMLNode;
  vNrDue, vChaveAcesso: String;
  Criteria: TCriteria;
begin
  XMLDocument1.LoadFromXML(Resposta);
  vXMLRetorno := XMLDocument1.ChildNodes.FindNode('pucomexReturn');
  vNrDue := vXMLRetorno.ChildValues['due'];
  vChaveAcesso := vXMLRetorno.ChildValues['chaveDeAcesso'];

//  adsProcessoExp.Edit;
//  adsProcessoExpCdChaveAcessoDue.AsString := vChaveAcesso;
//  adsProcessoExpCdStatusDue.AsInteger := ResponseCode;
//  adsProcessoExpDtEnvioDue.AsDateTime := ResponseDate;
//  adsProcessoExp.Post;
//
//  adsProcessoCdDue.AsString:= vNrDue;
//  adsProcesso.Post;
end;

procedure TformIntegracaoDue.LerRespostaErro(Resposta: String);
var
  vXMLRetorno: IXMLNode;
  vXMLdetail: IXMLNode;
  vXMLErroItem: IXMLNode;
  vNrDue, vChaveAcesso: String;
  Criteria: TCriteria;
  i: Integer;
  PosIniNr, TamNr: Integer;
  vMensagemItem: string;
  vNrItemDue: Integer;
  TipoErro: String;
begin
  XMLDocument1.LoadFromXML(Resposta);
  vXMLRetorno := XMLDocument1.ChildNodes.FindNode('error');
  if not Assigned(vXMLRetorno) then
    Exit;
  vXMLdetail := vXMLRetorno.ChildNodes.FindNode('detail');
  if Assigned(vXMLdetail) then
  begin
    if (vXMLdetail.ChildNodes.Count > 0) then
    begin
      for i := 0 to vXMLdetail.ChildNodes.Count - 1 do
      begin
        vXMLErroItem := vXMLdetail.ChildNodes[i];
        vMensagemItem := vXMLErroItem.ChildValues['message'];
        if Pos('verificação estatística da Secex',vMensagemItem) > 0 then
        begin
          if TipoErro = '' then
            TipoErro := 'verificação estatística da Secex';
          PosIniNr := 11;
          TamNr := Pos(':', vMensagemItem) - PosIniNr;
          vNrItemDue := StrToIntDef(Copy(vMensagemItem, PosIniNr, TamNr), 0);
//          adsProcessoExpNfItem.First;
          if vNrItemDue > 0  then
          begin
//            CriteriaNfItemVerEst := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
//                                                                            .add(Linq.eq('PNf.NrProcesso', NrProcesso))
//                                                                            .add(Linq.eq('NrItemDue', vNrItemDue));
//            NfItensVerEst := CriteriaNfItemVerEst.UniqueResult;
//
//            NfItensVerEst.InVerificacaoEstatistica.Value := Assigned(NfItensVerEst);
//            FObjectManager.Flush(NfItensVerEst);
          end;
        end;
      end;
    end;
    if TipoErro = 'verificação estatística da Secex' then
      ShowMessage('Itens sujeitos a verificação estatística.' + #13#10 +
                  'Identificamos os números dos itens automaticamente, favor sair da tela para gerar novamente o xml.');
  end;
end;

procedure TformIntegracaoDue.GerarXML;

begin






end;

//class function TformIntegracaoDue.Execute(aTipoIntegracao: TIntegracaoDue; aNrProcesso, NomeDespachante: string; aAmbienteProducao: Boolean): Boolean;
//var
//  form: TformIntegracaoDue;
//begin
//  form := TformIntegracaoDue.Create(nil);
//  try
//    form.NrProcesso := aNrProcesso;
//    form.NomeDespachante := StringReplace(RemoveAccents(NomeDespachante), ' ', '', [rfReplaceAll]);
//    form.AmbienteProducao := aAmbienteProducao;
//    form.FTipoIntegracao := aTipoIntegracao;
//    form.ShowModal;
//  finally
//    form.Free
//  end;
//end;

end.
