unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, IdTCPConnection, IdTCPClient, IdHTTP,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, System.Masks, System.DateUtils, System.JSON,
  REST.Client, REST.Types, IpPeerClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdText, IdMessage, IdAttachmentFile, System.StrUtils, System.IOUtils;

type

  TStringArray = array of String;

  TLogCallBack = procedure of object;

  TfrmPrincipal = class(TForm)
    idHttp: TIdHTTP;
    Panel1: TPanel;
    btnEnviar: TButton;
    Panel2: TPanel;
    memo: TMemo;
    btnPlayPause: TBitBtn;
    lblTimer: TLabel;
    Timer1: TTimer;
    Label1: TLabel;
    lblUltimoEnvioData: TLabel;
    FDConnection1: TFDConnection;
    qryConsulta: TFDQuery;
    Button2: TButton;
    lbxTelaPrincipal: TListBox;
    Label2: TLabel;
    lblUltimoEnvioHora: TLabel;
    qryEmail: TFDQuery;
    IdSMTP1: TIdSMTP;

    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    Button1: TButton;    procedure btnEnviarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FTempoRestante: Integer;
    procedure Logar;
    procedure LimpaArquivosAntigos(Path, TipoArquivo: String; qt_dias: Integer);
    procedure LogAdd(value: String);
    procedure EnviarIntegracaoViaidHttp;
    function EnviarIntegracaoViaRestClient(JsonText: TStringStream): Boolean;
    procedure CarregaHorarios;
    function EnviaEmail(ARemetente: String; APara, ACopia,
      ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
      AAnexos: TStringArray; TrataHTML: Boolean): Boolean;
    procedure PrepararDadosParaIntegracao;
    function TesteRestClient(JsonText: TStringStream): Boolean;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;
  Config: TIniFile;
  FPasta: String;
  FPastaLog: String;
  FPastaArquivos: String;

implementation

{$R *.dfm}

uses
  Preferencias, RootUnit, DadosIndaiaTM, IdGlobal, Vcl.Dialogs;

function ArredondaParaCima(const Valor: Double): Integer;
begin
  Result := Trunc(Valor);
  if Frac(Valor) > 0 then
    Result := Result + 1;
end;

function RemoveCaracteresEstranhosFormularyFill( const AStr: string; ConsideraArroba: Boolean = false): string;
var
  i:integer;
begin
  Result := '';
  for i:=1 to length(AStr) do
   if (AStr[i] in ['A'..'Z','a'..'z','0'..'9','-','_',' ',',',';','.',':','?','<', '>','"', '{', '}', '[', ']', '(', ')', '*', '&', '$', '!', '/','\','|','%','=','+',#13,#10,'º','ª','¹','²','³', '@']) then
  Result := Result + AStr[i];
end;

function RemoveAccents(const sValue: string): string;
var
  i : integer;
begin
  Result:=sValue;
  for i:=1 to Length(Result) do
  begin
    case Result[i] of
      'º':                 Result[i]:='o';
      'ª':                 Result[i]:='a';
      'Á','À','Ã','Â','Ä': Result[i]:='A';
      'á','à','ã','â','ä': Result[i]:='a';
      'É','Ê','È','Ë':     Result[i]:='E';
      'é','ê','è','ë':     Result[i]:='e';
      'Í','Ì','Î','Ï':     Result[i]:='I';
      'í','ì','î','ï':     Result[i]:='i';
      'Ó','Ô','Õ','Ò':     Result[i]:='O';
      'ó','ô','õ','ò':     Result[i]:='o';
      'Ú','Ù','Ü','Û':     Result[i]:='U';
      'ú','ù','ü','û':     Result[i]:='u';
      'Ç':                 Result[i]:='C';
      'ç':                 Result[i]:='c';
    end;
  end;
end;

procedure ScrollMemo(Memo: TMemo; Direction: Integer);
var
  ScrollMessage: TWMVScroll;
  I: Integer;
begin
  ScrollMessage.Msg := WM_VSCROLL;
  Memo.Lines.BeginUpdate;
  try
    for I := 0 to Memo.Lines.Count do
    begin
     ScrollMessage.ScrollCode := Direction;
     ScrollMessage.Pos := 0;
     Memo.Dispatch(ScrollMessage);
    end;
  finally
    Memo.Lines.EndUpdate;
  end;
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  Result := FPastaLog + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
end;

procedure Log(const Msg: string; CallBack: TLogCallBack);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

procedure TfrmPrincipal.LogAdd(value: String);
begin
  log(value, Logar);
  ScrollMemo(Memo, SB_LINEDOWN);
end;

procedure TfrmPrincipal.EnviarIntegracaoViaidHttp;
var
  Response: TStringStream;
  XArquivo : TMemoryStream;
  JsonText : TStringStream;
  response2 : TStream;
  List: TStringList;
  ListRejeitada: TStringList;
  Dados: TStrings;
  URL: String;
  RespostaCod, RespostaMsg: String;
  Pasta: string;
  Arquivo: string;
  Token: string;
  i: integer;
  id: IIdTextEncoding;
  StreamReader: TStreamReader;
begin
  Logadd('Iniciado o envio.');

//  URL := 'https://api.myindaia.com.br/tm/v1/Service/InfoBroker';
  URL := 'http://localhost/tm/v1/Service/InfoBroker';
  Token := 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsInVzZXJuYW1lIjoidG0iLCJjbnBqIjoiNTgxNTYwODQwMDAxMzciLCJ0aXBvIjoiRCJ9.q_HL1T5xuonkySSmanVzwskVM2VPu_79wprbgEApyFY';

  Response := TStringStream.Create('');
  JsonText := TStringStream.Create('');
  XArquivo := TMemoryStream.Create;
  List := TStringList.Create;
  Dados := TStrings.Create;
  response2 := TStream.Create;

  try
    qryConsulta.Open;
    if not (qryConsulta.RecordCount > 0) then
      exit;

//    List.add('[');
//    i:=0;
//    qryconsulta.First;
//    while not qryConsulta.Eof do
//    begin
//      inc(i);
//      if qryConsulta.RecNo > 1 then
//        List.add(', ' + qryConsulta.Fields[0].AsString)
//      else
//        List.add(qryConsulta.Fields[0].AsString);
//      qryConsulta.next;
//    end;
//
//    List.add('] ');
//
//    List.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_envio.json');
//    LogAdd('Arquivo de envio gerado com ' + intToStr(i) + ' processos.');
//    List.SaveToStream(JsonText);


    StreamReader := TStreamReader.Create(FPasta + 'Teste.json', TEncoding.UTF8);
//    List.LoadFromStream(StreamReader.BaseStream);

//    List.LoadFromFile(FPasta + 'Teste.json', TEncoding.UTF8WithoutBOM); // TESTE

    qryConsulta.close;
//    List.Text := StringReplace(List.Text, #$D#$A, '', [rfReplaceAll]);
//    List.Text := StringReplace(List.Text, #$D, '', [rfReplaceAll]);
//    List.Text := StringReplace(List.Text, #9, '', [rfReplaceAll]);
//    List.Text := StringReplace(List.Text, #13#10, '', [rfReplaceAll]);
//    List.Text := StringReplace(List.Text, '  ', '', [rfReplaceAll]);
//    List.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_envio.json');
//    LogAdd('Arquivo de envio gerado com ' + intToStr(i) + ' processos.');

//    JsonDadosIndaiaTM := TRootDadosIndaiaTM.Create;
//    JsonDadosIndaiaTM.AsJson := List.Text;
//    List.Text := JsonDadosIndaiaTM.Items.ToString;
//    List.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_envio_2.json');

//    List.SaveToStream(JsonText, TEncoding.UTF8);
//    Dados.Text := List.Text;



    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    XArquivo.LoadFromStream(StreamReader.BaseStream);
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'UTF-8';
    idHttp.Request.AcceptEncoding := 'UTF-8';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.CharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.Referer := URL;
    id := IndyTextEncoding('utf-8');
    try
        idHTTP.post(URL ,StreamReader.BaseStream  , response);
    except
    on E:EIdHTTPProtocolException do
      begin
        memo.Lines.Add(e.ErrorMessage + #13);
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      LogAdd('Enviado com sucesso');
      LogAdd(Response.DataString);
      Response.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno.json');
      Config.WriteString('Config', 'UltimoEnvioData', formatDateTime('yyyy-mm-dd', now));
      Config.WriteString('Config', 'UltimoEnvioHora', formatDateTime('hh:nn', now));
      lblUltimoEnvioData.caption := Trim(Config.ReadString('Config', 'UltimoEnvioData', ''));
      lblUltimoEnvioHora.caption := Trim(Config.ReadString('Config', 'UltimoEnvioHora', ''));
    end
    else
    begin
      LogAdd('Erro no envio');
      LogAdd(Response.DataString);
      Response.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno_erro.json');
    end;

    LimpaArquivosAntigos(FPastaLog, 'log', 60);
    LimpaArquivosAntigos(FPastaArquivos, 'json', 60);

  finally
    FreeAndNil(Response);
  end;
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
//  EnviarIntegracaoViaidHttp;   //outra opção.
  PrepararDadosParaIntegracao;
end;

procedure TfrmPrincipal.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  JsonText: TStringList;
  JsonStream: TStringStream;
begin

  JsonText := TStringList.Create;
  JsonStream := TStringStream.Create;
  try
    JsonText.text :=  '[' +
    '{'+
    '        "Servico": "01",'+
    '        "BU": "",'+
    '        "CNPJ": "48539407010180",'+
    '        "Pedidos": "",'+
    '        "TipoContainer": "",'+
    '        "ContainerCargaSolta": "UTCU4615668",'+
    '        "CTE": "140317",'+
    '        "TerminalCarga": "PORTO SEGURO",'+
    '        "LocalEntrega": "STOLT TANK",'+
    '        "ChegadaSaida": "24/11/2024",'+
    '        "PresencaCarga": "2024-11-14",'+
    '        "Desembaraco": "2024-11-14",'+
    '        "HoraLiberacaoDoc": "00:11",'+
    '        "EfetivaLiberacaoDoc": "2024-11-14",'+
    '        "RetiradaDocumento": "2024-11-14",'+
    '        "Terminal": "2024-11-14",'+
    '        "ProgramacaoEntrega": "2024-11-14",'+
    '        "EfetivaEntrega": "2024-11-14",'+
    '        "NomeClienteTdc": "TESTE",'+
    '        "NomeCidadeTdc": "SANTOS",'+
    '        "Observacao": "TESTE",'+
    '        "DataColetaVazio": "2024-11-14",'+
    '        "EfetivaEntregaVazio": "2024-11-14",'+
    '        "NomeTranspDevolucao": "NELCAR",'+
    '        "NomeDepotEntrega": "TESTE",'+
    '        "NrDiBooking": "2200404513",'+
    '        "K10": "0"'+
    ''+
    '    }'+
    '    ]';

    JsonText.SaveToStream(JsonStream);
    TesteRestClient(JsonStream);
  finally
    JsonText.Free;
    JsonStream.Free;
  end;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  form: TfrmPreferencias;
begin
  Timer1.Enabled := not Timer1.Enabled;
  Form := TfrmPreferencias.Create(self);
  try
    form.FPasta := FPasta;
    Form.ShowModal;
  finally
    Form.Free;
    Timer1.Enabled := not Timer1.Enabled;
    CarregaHorarios;
  end;
end;

procedure TfrmPrincipal.PrepararDadosParaIntegracao;
var
  List: TStringList;
  ListaErrosTag: TStringList;
  JsonText : TStringStream;
  StreamReader : TStreamReader;
  mfila: TFDMemTable;
  i: integer;
  QtdEnvios: Integer;
  QtdPorEnvio: Integer;
  iEnvios: integer;
  vMensagemErroTag: String;
begin
  QtdPorEnvio := 300;
  JsonText := TStringStream.Create('');
  List := TStringList.Create;
  mfila := TFDMemTable.Create(nil);
  ListaErrosTag := TStringList.Create;
  try
    qryConsulta.close;
    qryConsulta.Open;

    qryConsulta.FetchAll;
    mFila.Data := qryConsulta.Data;

    qryConsulta.close;
    qryConsulta.UnPrepare;

    if mfila.IsEmpty then
      exit;

    List.add('[');
    i:=0;
    while (not mFila.Eof) do
    begin
      inc(i);
      if mFila.Fields[0].AsString <> '' then
      begin
        if i > 1 then
          List.add(',' + RemoveAccents(mFila.Fields[0].AsString))
        else
          List.add(RemoveAccents(mFila.Fields[0].AsString));
      end
      else
      begin
        if (mFila.FieldByName('TP_ESTUFAGEM').AsString = '1') and
           (mFila.FieldByName('NR_CNTR').AsString = '') then
          vMensagemErroTag := 'ERRO ao ler a tag do Processo ' + mFila.FieldByName('NR_PROCESSO').AsString +
                              '. NÃO EXISTE CONTAINER VINCULADO AO PROCESSO. <br>'
        else
          vMensagemErroTag := 'ERRO ao ler a tag do Processo ' + mFila.FieldByName('NR_PROCESSO').AsString +
                              '. O Container está preenchido corretamente. <br>';
        LogAdd(vMensagemErroTag);
        ListaErrosTag.Add(vMensagemErroTag);
      end;

      mFila.next;
    end;
    List.add('] ');

  //    StreamReader := TStreamReader.Create(FPasta + 'Teste.json', TEncoding.UTF8);
  //    List.LoadFromStream(StreamReader.BaseStream);
    List.Text := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(List.Text));
    List.Text := StringReplace(List.Text, #$D#$A, '', [rfReplaceAll]);
    List.Text := StringReplace(List.Text, #$D, '', [rfReplaceAll]);
    List.Text := StringReplace(List.Text, #9, '', [rfReplaceAll]);
    List.Text := StringReplace(List.Text, #13#10, '', [rfReplaceAll]);
    List.Text := StringReplace(List.Text, '  ', '', [rfReplaceAll]);
    List.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_envio.json');
    LogAdd('Arquivo de envio gerado com ' + intToStr(i) + ' processos.');
    List.SaveToStream(JsonText);

    EnviarIntegracaoViaRestClient(JsonText);

    if ListaErrosTag.Text <> '' then
    begin
      if EnviaEmail('ti@myindaia.com.br', ['transporte.basf@myindaia.com.br'], [], [], 'Integração Indaiá TM',
                    ListaErrosTag.Text, [], true) then
        LogAdd('Email enviado com as tags que deram erro.')
      else
        LogAdd('Erro ao tentar enviar e-mail com as tags que deram erro.');
    end;

  finally
    List.Free;
    mfila.Free;
    JsonText.Free;
    ListaErrosTag.Free;
  end;
end;

function TfrmPrincipal.TesteRestClient(JsonText: TStringStream): Boolean;
var
  vRestClient : TRestClient;
  vRestRequest : TRestRequest;
  vRestResponse : TRestResponse;
  token: String;

  ListResponse: TStringList;
  i: Integer;
  JsonRoot: TRoot;
  JsonDadosIndaiaTM: TRootDadosIndaiaTM;
  vCorpoEmail: string;
  JSONString: string;

begin
  result := False;
  token := 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MzIxLCJ1c2VybmFtZSI6Im5lbGNhciIsImNucGoiOiI2MjM3OTgxMzAwMDE5MSIsInRpcG8iOiJUIn0.d5tLQeg9IZNQFECGicOGRnPjWMloTznyI17TTQFhIB0';

//  vRestClient := TRestClient.Create('https://api.myindaia.com.br:443/tm/v1/Service/InfoBroker');
//  vRestClient := TRestClient.Create('http://localhost/tm/v1/Service/InfoBroker'); // TESTE LOCAL
  vRestClient := TRestClient.Create('http://localhost/tm/v1/Service/InfoTransport');
//  vRestClient := TRestClient.Create('https://api.myindaia.com.br:443/tm/v1h/Service/InfoTransport');
  vRestRequest := TRestRequest.Create(nil);
  vRestResponse := TRestResponse.Create(nil);
  ListResponse := TStringList.Create;



  try

    vRestClient.Accept := 'application/json';
    vRestClient.AcceptCharset := 'UTF-8';
    vRestClient.AcceptEncoding := 'UTF-8';
    vRestClient.ContentType := 'application/json; charset=UTF-8 ';
//    vRestRequest.ContentType := TRESTContentType.ctAPPLICATION_JSON;;
    vRestRequest.AcceptCharset := 'UTF-8';
    vRestRequest.AcceptEncoding := 'UTF-8';
    vRestRequest.Client := vRestClient;
    vRestResponse.ContentEncoding := 'UTF-8';
    vRestRequest.Response := vRestResponse;
    vRestRequest.Method := rmPOST;
//    vRestRequest.Params.addHeader('Authorization', token);   //Não funcionou com esta linha neste serviço.
    vRestRequest.AddAuthParameter('Authorization', token, TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    vRestRequest.AddBody(JsonText, ctAPPLICATION_JSON);
    vRestRequest.Timeout := 50000000;

    try
      vRestRequest.Execute;
    except
    on E:Exception do
      begin
        LogAdd('Erro de conexão');
        LogAdd(e.Message);
      end;
    end;

    LogAdd(vRestResponse.Content);
    ListResponse.Text := vRestResponse.Content;
    if vRestResponse.StatusCode = 200 then
    begin
      result := True;
      LogAdd('Enviado com sucesso');

    end
    else
    begin
      LogAdd('Erro no envio');
      ListResponse.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno_erro.json');
    end;

  finally
    vRestClient.Free;
    vRestRequest.Free;
    vRestResponse.Free;
    ListResponse.Free;
  end;
end;

function TfrmPrincipal.EnviarIntegracaoViaRestClient(JsonText: TStringStream): Boolean;
var
  vRestClient : TRestClient;
  vRestRequest : TRestRequest;
  vRestResponse : TRestResponse;
  token: String;

  ListResponse: TStringList;
  i: Integer;
  JsonRoot: TRoot;
  JsonDadosIndaiaTM: TRootDadosIndaiaTM;
  vCorpoEmail: string;
  JSONString: string;

begin
  result := False;
  token := 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MTMsInVzZXJuYW1lIjoidG0iLCJjbnBqIjoiNTgxNTYwODQwMDAxMzciLCJ0aXBvIjoiRCJ9.q_HL1T5xuonkySSmanVzwskVM2VPu_79wprbgEApyFY';

  vRestClient := TRestClient.Create('https://api.myindaia.com.br:443/tm/v1/Service/InfoBroker');
//  vRestClient := TRestClient.Create('http://localhost/tm/v1/Service/InfoBroker'); // TESTE LOCAL
  vRestRequest := TRestRequest.Create(nil);
  vRestResponse := TRestResponse.Create(nil);
  ListResponse := TStringList.Create;

  try

    vRestClient.Accept := 'application/json';
    vRestClient.AcceptCharset := 'UTF-8';
    vRestClient.AcceptEncoding := 'UTF-8';
    vRestClient.ContentType := 'application/json; charset=UTF-8 ';
//    vRestRequest.ContentType := TRESTContentType.ctAPPLICATION_JSON;;
    vRestRequest.AcceptCharset := 'UTF-8';
    vRestRequest.AcceptEncoding := 'UTF-8';
    vRestRequest.Client := vRestClient;
    vRestResponse.ContentEncoding := 'UTF-8';
    vRestRequest.Response := vRestResponse;
    vRestRequest.Method := rmPOST;
//    vRestRequest.Params.addHeader('Authorization', token);   //Não funcionou com esta linha neste serviço.
    vRestRequest.AddAuthParameter('Authorization', token, TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    vRestRequest.AddBody(JsonText, ctAPPLICATION_JSON);
    vRestRequest.Timeout := 120000000;

    try
      vRestRequest.Execute;
    except
    on E:Exception do
      begin
        LogAdd('Erro de conexão');
        LogAdd(e.Message);
      end;
    end;

    LogAdd(vRestResponse.Content);
    ListResponse.Text := vRestResponse.Content;
    if vRestResponse.StatusCode = 200 then
    begin
      result := True;
      LogAdd('Enviado com sucesso');

      ListResponse.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno.json');
      Config.WriteString('Config', 'UltimoEnvioData', formatDateTime('yyyy-mm-dd', now));
      Config.WriteString('Config', 'UltimoEnvioHora', formatDateTime('hh:nn', now));
      lblUltimoEnvioData.caption := Trim(Config.ReadString('Config', 'UltimoEnvioData', ''));
      lblUltimoEnvioHora.caption := Trim(Config.ReadString('Config', 'UltimoEnvioHora', ''));

      JsonRoot := TRoot.Create;
      JsonRoot.AsJson := vRestResponse.Content;
      if JsonRoot.Mensagens.Count > 0 then
      begin
        for i:=0 to JsonRoot.Mensagens.Count -1 do
        begin
          vCorpoEmail := 'Foi encontrado erro nas seguintes linhas da planilha ('+ IntToStr(JsonRoot.Planilha) + '): <br>' +
                         'Linha: ' + IntToStr(JsonRoot.Mensagens[i].Linha) + ' - Mensagem: ' + JsonRoot.Mensagens[i].Mensagem + '<br><br>';
          if EnviaEmail('ti@myindaia.com.br', ['transporte.basf@myindaia.com.br'], [], [], 'Integração Indaiá TM', vCorpoEmail, [], true) then
            LogAdd('Email enviado com as linhas que deram erro.')
          else
            LogAdd('Erro ao tentar enviar e-mail.')
        end;
      end;
    end
    else
    begin
      LogAdd('Erro no envio');
      ListResponse.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno_erro.json');
    end;

    LimpaArquivosAntigos(FPastaLog, 'log', 15);
    LimpaArquivosAntigos(FPastaArquivos, 'json', 15);
  finally
    vRestClient.Free;
    vRestRequest.Free;
    vRestResponse.Free;
    ListResponse.Free;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogAdd('Sistema Finalizado.');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FTempoRestante := 15000;
  lblUltimoEnvioData.caption := Trim(Config.ReadString('Config', 'UltimoEnvioData', ''));
  lblUltimoEnvioHora.caption := Trim(Config.ReadString('Config', 'UltimoEnvioHora', ''));
  CarregaHorarios;


end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  LogAdd('Sistema Iniciado.');
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
  T: TTime;
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
  Hoje: string;
  UltimoEnvio: TCaption;

  function retsomatime(valueTime: TTime; valueSoma: Integer): String;
  var
    hora: Integer;
  begin
    hora := StrToInt(formatdatetime('hh', valuetime));
    hora := hora + valueSoma;
    result := (IntToStr(Hora) + ':' + formatdatetime('nn', valueTime));
  end;

  function VerificaHorario: boolean;
  var
    horaExecucao, HoraExecucaoSomada, UltimoEnvioHora: String;
    horarios : TStringList;
    I: Integer;
    NoHorario, JaExecutado: Boolean;
    UltimoEnvioData: String;
  begin
    horarios := TStringList.Create;
    try
      horarios.Delimiter := ';';
      horarios.StrictDelimiter := true;
      horarios.DelimitedText := Trim(Config.ReadString('Config', 'HoraExec', ''));
      result := false;
      if horarios.Count = 0 then
      begin
        LogAdd('Não tem horário definido para execução');
        result := false;
        exit;
      end;

      for I := 0 to horarios.Count -1 do
      begin
        Hoje := formatDateTime('yyyy-mm-dd', now) ;
        UltimoEnvioHora := Trim(Config.ReadString('Config', 'UltimoEnvioHora', ''));
        UltimoEnvioData := (Trim(Config.ReadString('Config', 'UltimoEnvioData', '')));
        horaExecucao := (horarios.Strings[i]);
        HoraExecucaoSomada := retsomatime(StrToTime(horarios.Strings[i]), 1);
        NoHorario := ((timeToStr(Time) >= (horaExecucao)) and (timeToStr(Time) <= (HoraExecucaoSomada)));
        JaExecutado := (((UltimoEnvioHora) >= (horaExecucao)) and ((HoraExecucaoSomada) >= (UltimoEnvioHora)));
        if NoHorario then
          if (UltimoEnvioData < Hoje) or (not JaExecutado) then
         begin
          result := true;
          break;
         end;
      end;
    finally
      horarios.free;
    end;
  end;
begin
  Dec(FTempoRestante, 1000);
  Horas := (FTempoRestante div 60000) div 60;
  if Horas > 0 then
    Minutos := (FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (FTempoRestante div 60000);
  Segundos := (FTempoRestante div 1000) mod 60;
  lblTimer.Caption := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  T := (GetTickCount - FTempoRestante) * 1000;
  if FTempoRestante <= 0 then
  begin
    timer1.Enabled := False;
    try
      //  if not (dayofweek(now)  in [1, 7]) then {se não for sábado e domingo}

      if VerificaHorario then
        btnEnviar.Click;

    finally
      FTempoRestante := 60000;
      timer1.Enabled := True;
    end;
  end;
end;

procedure TfrmPrincipal.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TfrmPrincipal.LimpaArquivosAntigos(Path, TipoArquivo: String; qt_dias :Integer);
(* Limpa todos os arquivos do TipoArquivo  da Pasta Path e anteriores à qt_dias.
  É necessário ter este formato de data no inicio (2023-05-01.log), podendo haver qualquer texto em seguida (2023-05-01_retorno.json) *)
var
  NomeArquivo , sDataArquivo, SDataLimite : String;
  i:integer;
  ListaArquivosAntigos : TStringList;
  pesquisa: TSearchRec;
begin
  ListaArquivosAntigos := tStringList.Create;
  try
    if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
            NomeArquivo := Copy(pesquisa.Name, 1,12);
              ListaArquivosAntigos.Add(pesquisa.Name);
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 9, 2);

        sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,-qt_dias ));

      if sDataArquivo < sDataLimite then
      begin
        Deletefile(IncludeTrailingPathDelimiter(Path) +  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;

procedure TfrmPrincipal.CarregaHorarios;
begin
  lbxTelaPrincipal.Items.Delimiter := ';';
  lbxTelaPrincipal.Items.StrictDelimiter := true;
  lbxTelaPrincipal.Items.DelimitedText :=  Trim(Config.ReadString('Config', 'HoraExec', ''));
end;

function TfrmPrincipal.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray;
   AAssunto, ACorpo: String; AAnexos: TStringArray; TrataHTML: Boolean): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
begin
  qryEmail.Close;
  qryEmail.sql.Text := 'SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA, EMAIL_TLS FROM VW_CONFIG_MAIL ( NOLOCK )';
  try
    qryEmail.Open;
    IdSMTP1.Host     := qryEmail.FieldByName('NM_HOST').AsString;//'email-smtp.us-east-1.amazonaws.com';
    IdSMTP1.Port     := qryEmail.FieldByName('NR_PORTA').AsInteger;//587;
    IdSMTP1.Username := qryEmail.FieldByName('NM_LOGIN').AsString;//'AKIAIX5BPVHLHQRKEUTA';
    IdSMTP1.Password := qryEmail.FieldByName('NM_SENHA').AsString;//'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh';
    if (qryEmail.FieldByName('EMAIL_TLS').AsBoolean) then
    begin
      IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
      IdSMTP1.UseTLS := utUseExplicitTLS;
    end
    else
    begin
      IdSMTP1.IOHandler := nil;
      IdSMTP1.UseTLS := utNoTLSSupport;
    end;
    qryEmail.Close;
    IdMessage1.Clear;

    NewText1 := TIdText.Create(IdMessage1.MessageParts);

    try
      with NewText1 do
      begin
        ContentType:='text/html';
        for I := 0 to High(AAnexos) do
          if FileExists(AAnexos[I]) then
            TIdAttachmentFile.Create(IdMessage1.MessageParts, AAnexos[I]);
        if TrataHTML then
        begin
          Body.Add('<html>');
          Body.Add('<body>');
          Body.Add(ACorpo);
          Body.Add('<br>');
          Body.Add('<br>');
          Body.Add('Email gerado automaticamente.<br>');
          Body.Add('Duvidas: <a href="mailto:ti@myindaia.com.br">ti@myindaia.com.br</a>');
          Body.Add('</body>');
          Body.Add('</html>');
        end
        else
          Body.Add(ACorpo);
      end;

      if ARemetente = '' then
        ARemetente := 'ti@myindaia.com.br';

      with IdMessage1 do
      begin
        From.Text := ARemetente;

        // Eliminar Destitário inserido mais de uma vez
        for I := 0 to High(APara) do
          if (APara[I] <> '') and (AnsiIndexText(APara[I], APara) = I) then
            Recipients.Add.Text := APara[I];

        // Eliminar Cópia inserido mais de uma vez ou inserido em ADestinatarios
        for I := 0 to High(ACopia) do
          if (ACopia[I] <> '') and (AnsiIndexText(ACopia[I], ACopia) = I)
             and (AnsiIndexText(ACopia[I], APara) < 0) then
            CCList.Add.Text := ACopia[I];

        // Eliminar Cópia Oculta inserido mais de uma vez ou inserido em ADestinatarios ou inserido em ACopia
        for I := 0 to High(ACopiaOculta) do
          if (ACopiaOculta[I] <> '') and (AnsiIndexText(ACopiaOculta[I], ACopiaOculta) = I)
             and (AnsiIndexText(ACopiaOculta[I], APara) < 0) and (AnsiIndexText(ACopiaOculta[I], ACopia) < 0) then
            BccList.Add.Text := ACopiaOculta[I];
        Subject := AAssunto;
      end;
      IdSMTP1.Connect;
      try
        IdSMTP1.Send(IdMessage1);
        Result := True;
      except
        on E: Exception do
        begin
          Log(E.Message, nil);
          Result := False;
        end;
      end;
    finally
      FreeAndNil(NewText1);
      IdSMTP1.Disconnect;
      IdMessage1.Clear;
    end;
  finally
    //qryConfigMail.Close;
    //Connection.Close;
  end;
end;

initialization
  FPasta := ExtractFilePath(ParamStr(0));
  FPastaLog := FPasta + 'log\';
  FPastaArquivos := FPasta + 'arquivos\';

  if not DirectoryExists(FPastaLog) then
    ForceDirectories(FPastaLog);
  if not DirectoryExists(FPastaArquivos) then
    ForceDirectories(FPastaArquivos);

  Config := TIniFile.Create(FPasta + 'Config.ini');

finalization
  FreeAndNil(Config);
end.
