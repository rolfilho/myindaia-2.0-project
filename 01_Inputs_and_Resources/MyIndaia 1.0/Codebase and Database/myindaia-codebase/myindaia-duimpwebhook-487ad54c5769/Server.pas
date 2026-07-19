unit Server;

interface

uses
  Controle,
  System.SysUtils,
  Sparkle.Middleware.Cors,
  Sparkle.Middleware.Compress,
  Sparkle.HttpSys.Server,
  Sparkle.HttpServer.Context,
  Sparkle.HttpServer.Module,
  Sparkle.WebBroker.Server,
  XData.Service.Common,
  System.JSON,
  System.Generics.Collections,
  REST.Json,
  IniFiles,
  DataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client  ;

type

  TEndpointHandler = reference to procedure(const C: THttpServerContext);

  TDiagnosticoHandler = class
    class procedure Handle(const C: THttpServerContext);
  end;

  TRegistroHandler = class
    class procedure Handle(const C: THttpServerContext);
  end;

  TRetificacaoHandler = class
    class procedure Handle(const C: THttpServerContext);
  end;

  TSituacaoHandler = class
    class procedure Handle(const C: THttpServerContext);
  end;

  TICMSHandler = class
    class procedure Handle(const C: THttpServerContext);
  end;

  TPCCEHandler = class
    class procedure Handle(const C: THttpServerContext);
  end;

  TServer = class
  private
    procedure ValidarEExcluirRegistro(ADuimp: TRegistroDuimp);
    procedure AtualizaDados(Duimp: TRegistroDuimp);
    procedure AtualizaDi(const NumeroProcesso, NumeroDuimp: string;
      Data: TDateTime);
    procedure AtualizaEvento(const NumeroProcesso, CodigoEvento: string; Data: TDateTime);
    function GetNumeroProcesso(const NumeroDuimp: String): String;
    procedure AtualizaCanal(const NumeroProcesso, Canal: string);
  public
    procedure CarregaIni;
    procedure StartServer;
    procedure StopServer;
    procedure RegisterRoutes;
    procedure HandleRequest(const C: THttpServerContext);
    procedure GravarDuimpNoBanco(Duimp: TRegistroDuimp);
  end;

  procedure ProcessaRequisicao(const C: THttpServerContext);
  procedure ValidateSecret(Context: THttpServerContext);
  function BytesToString(const Bytes: TBytes): string;
  function CleanJSON(const JSON: string): string;
  procedure ProcessRequest(const JSONContent: string);

var
  Servidor: TServer;
  Routes: TDictionary<string, TEndpointHandler>;
  SparkleServer: THttpSysServer;
  URL: string;

const
  SECRET_KEY = '7eym0TScxh6JnRQ7Uz0ozSVlwGpsvVkP';

implementation

uses
  System.IOUtils, System.Classes;

procedure ProcessaRequisicao(const C: THttpServerContext);
var
  JSONContent: string;
begin
  ValidateSecret(C);
  JSONContent := BytesToString(C.Request.Content);
  JSONContent := CleanJSON(JSONContent);

  ProcessRequest(JSONContent);

  C.Response.StatusCode := 200;
  C.Response.ContentType := 'text/html';
  C.Response.Close(TEncoding.UTF8.GetBytes('<h1>Boa notícia!</h1><br/>A sua requisição foi processada com sucesso.'));
end;

{ TDiagnosticoHandler }
class procedure TDiagnosticoHandler.Handle(const C: THttpServerContext);
begin
  ProcessaRequisicao(C);
end;

{ TRegistroHandler }
class procedure TRegistroHandler.Handle(const C: THttpServerContext);
begin
  ProcessaRequisicao(C);
end;

{ TRetificacaoHandler }
class procedure TRetificacaoHandler.Handle(const C: THttpServerContext);
begin
  ProcessaRequisicao(C);
end;

{ TSituacaoHandler }
class procedure TSituacaoHandler.Handle(const C: THttpServerContext);
begin
  ProcessaRequisicao(C);
end;

{ TICMSHandler }
class procedure TICMSHandler.Handle(const C: THttpServerContext);
begin
  ProcessaRequisicao(C);
end;

{ TICMSHandler }
class procedure TPCCEHandler.Handle(const C: THttpServerContext);
begin
  ProcessaRequisicao(C);
end;

procedure TServer.StartServer;
var
  Module: TAnonymousServerModule;
begin
  Servidor.CarregaIni;
  if Assigned(SparkleServer) then
    Exit;

  SparkleServer := THttpSysServer.Create;

  RegisterRoutes;

  Module := TAnonymousServerModule.Create(Url,
    procedure(const C: THttpServerContext)
    begin
      try
        HandleRequest(C);
      except
        on E: Exception do
        begin
          C.Response.StatusCode := 500;
          C.Response.ContentType := 'text/html';
          C.Response.Close(TEncoding.UTF8.GetBytes('<h1>Lamentamos!</h1><br/>Ocorreu um erro no processamento da sua requisição.'));
        end;
      end;
    end);

  SparkleServer.AddModule(Module);
  SparkleServer.Start;
end;

procedure TServer.StopServer;
begin
  FreeAndNil(SparkleServer);
end;

procedure TServer.CarregaIni;
var
  Ini: TIniFile;
  Server: String;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    Server := Ini.ReadString('Database', 'Server', 'INDAIA10');
    DataModule1.Connection.Params.Values['Server'] := Server;
    Url := Ini.ReadString('Geral', 'Url', '');
  finally
    Ini.Free;
  end;
end;

procedure TServer.HandleRequest(const C: THttpServerContext);
var
  Handler: TEndpointHandler;
begin
  if Routes.TryGetValue(C.Request.URI.Path, Handler) then
    Handler(C)
  else
  begin
    C.Response.StatusCode := 404;
    C.Response.ContentType := 'text/html';
    C.Response.Close(TEncoding.UTF8.GetBytes('<h1>Atenção!</h1><br/>Endpoint não encontrado.'));
  end;
end;


procedure TServer.RegisterRoutes;
begin
  Routes := TDictionary<string, TEndpointHandler>.Create;
  Routes.Add('/webhook/portalunico/duimp/diagnostico', TDiagnosticoHandler.Handle);
  Routes.Add('/webhook/portalunico/duimp/registro', TRegistroHandler.Handle);
  Routes.Add('/webhook/portalunico/duimp/retificacao', TRetificacaoHandler.Handle);
  Routes.Add('/webhook/portalunico/duimp/situacao', TSituacaoHandler.Handle);
  Routes.Add('/webhook/portalunico/duimp/icms', TICMSHandler.Handle);
  Routes.Add('/webhook/portalunico/duimp/pcce', TICMSHandler.Handle);
end;

function CleanJSON(const JSON: string): string;
begin
  Result := StringReplace(JSON, #$D#$A, '', [rfReplaceAll]);
  Result := StringReplace(Result, #13, '', [rfReplaceAll]); // Remove CR
  Result := StringReplace(Result, #10, '', [rfReplaceAll]); // Remove LF
end;

function BytesToString(const Bytes: TBytes): string;
var
  TextoAnsi: string;
begin
  Result := TEncoding.UTF8.GetString(Bytes);
end;

procedure ValidateSecret(Context: THttpServerContext);
var
  ReceivedKey: string;
  chave: TStringList;
begin
  ReceivedKey := Context.Request.Headers.Get('secret');

  chave := TStringList.Create;
  try
    chave.Add('secret:' + ReceivedKey);
    chave.Add('destinatario-tipo:' + Context.Request.Headers.Get('destinatario-tipo'));
    chave.Add('destinatario-id:' + Context.Request.Headers.Get('destinatario-id'));
    chave.Add('event-type:' + Context.Request.Headers.Get('event-type'));

    chave.SaveToFile('chave.txt');

  finally
    chave.Free;
  end;

  if ReceivedKey <> SECRET_KEY then
  begin
    Context.Response.StatusCode := 401; // Não autorizado
    raise Exception.Create('Unauthorized access: Invalid secret key');
  end;
end;

procedure TServer.ValidarEExcluirRegistro(ADuimp: TRegistroDuimp);
var
  qryCheck, qryDeleteDetalhe, qryDeleteMaster: TFDQuery;
  DuimpPushId: Integer;
begin
  if (ADuimp.Evento <> 'Solicitação de Diagnóstico') and (ADuimp.Evento <> 'Solicitação de Registro') then
    exit;

  qryCheck := TFDQuery.Create(nil);
  qryDeleteDetalhe := TFDQuery.Create(nil);
  qryDeleteMaster := TFDQuery.Create(nil);
  try
    // Configurações das queries
    qryCheck.Connection := DataModule1.Connection;
    qryDeleteDetalhe.Connection := DataModule1.Connection;
    qryDeleteMaster.Connection := DataModule1.Connection;

    // Verifica se já existe o registro
    qryCheck.SQL.Text :=
      'SELECT id FROM DuimpPush WHERE evento = :evento AND numero = :numero';
    qryCheck.ParamByName('evento').AsString := ADuimp.Evento;
    qryCheck.ParamByName('numero').AsString := ADuimp.Identificacao.Numero;

    qryCheck.Open;

    if not qryCheck.IsEmpty then
    begin
      // Obtém o ID do registro na tabela mestre
      DuimpPushId := qryCheck.FieldByName('id').AsInteger;

      DataModule1.Connection.StartTransaction;
      try
        // Deleta os registros correspondentes na tabela detalhe
        qryDeleteDetalhe.SQL.Text :=
          'DELETE FROM DuimpPushDetalhe WHERE duimpPushId = :duimpPushId';
        qryDeleteDetalhe.ParamByName('duimpPushId').AsInteger := DuimpPushId;
        qryDeleteDetalhe.ExecSQL;

        // Deleta o registro da tabela mestre
        qryDeleteMaster.SQL.Text :=
          'DELETE FROM DuimpPush WHERE id = :id';
        qryDeleteMaster.ParamByName('id').AsInteger := DuimpPushId;
        qryDeleteMaster.ExecSQL;
        DataModule1.Connection.Commit;
      except
        DataModule1.Connection.Rollback;
      end;

    end;
  finally
    qryCheck.Free;
    qryDeleteDetalhe.Free;
    qryDeleteMaster.Free;
  end;
end;

procedure TServer.GravarDuimpNoBanco(Duimp: TRegistroDuimp);
var
  Query: TFDQuery;
  DiagnosticoId: Integer;
  Resultado: TResultado;
begin
  if not Assigned(Duimp) then
    Exit;

  // Insere os dados na tabela Diagnostico
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule1.Connection;
//    DataModule1.Connection.StartTransaction;
//    try
      Query.SQL.Text :=
        'INSERT INTO DuimpPush (code, dataEvento, evento, numero, versao, message, niImportador, situacaoDuimp, situacao, dataGeracao) ' +
        'OUTPUT INSERTED.id ' +
        'VALUES (:code, :dataEvento, :evento, :numero, :versao, :message, :niImportador, :situacaoDuimp, :situacao, :dataGeracao)';

      Query.ParamByName('code').AsString := Duimp.code;
      Query.ParamByName('dataEvento').AsDateTime := Duimp.DataEvento;
      Query.ParamByName('evento').AsString := Duimp.Evento;
      Query.ParamByName('numero').AsString := Duimp.Identificacao.Numero;
      Query.ParamByName('versao').AsString := Duimp.Identificacao.Versao;
      Query.ParamByName('message').AsString := Duimp.Message;
      Query.ParamByName('niImportador').AsString := Duimp.NiImportador;
      Query.ParamByName('situacaoDuimp').AsString := Duimp.SituacaoDuimp;
      if Assigned(Duimp.Diagnostico) then
      begin
        Query.ParamByName('situacao').AsString := Duimp.Diagnostico.Situacao;
        Query.ParamByName('dataGeracao').AsDateTime := Duimp.Diagnostico.DataGeracao;
      end
      else
      begin
        Query.ParamByName('situacao').AsString := '';
        Query.ParamByName('dataGeracao').AsDateTime := 0;
      end;

      Query.open; // Obtém o ID gerado automaticamente
      DiagnosticoId := Query.Fields[0].AsInteger;

      // Insere os resultados na tabela DiagnosticoResultado
      if Assigned(Duimp.Diagnostico) and (Length(Duimp.Diagnostico.Resultado) > 0) then
      begin
        for Resultado in Duimp.Diagnostico.Resultado do
        begin
          Query.Close;
          Query.SQL.Text :=
            'INSERT INTO DuimpPushDetalhe (duimpPushId, item, codigoMensagem, textoMensagem, sistemaOrigem, tipo) ' +
            'VALUES (:duimpPushId, :item, :codigoMensagem, :textoMensagem, :sistemaOrigem, :tipo)';

          Query.ParamByName('duimpPushId').AsInteger := DiagnosticoId;
          Query.ParamByName('item').AsInteger := Resultado.Item;

          if Assigned(Resultado.Mensagem) then
          begin
            Query.ParamByName('codigoMensagem').AsString := Resultado.Mensagem.Codigo;
            Query.ParamByName('textoMensagem').AsString := Resultado.Mensagem.Texto;
          end
          else
          begin
            Query.ParamByName('codigoMensagem').Clear;
            Query.ParamByName('textoMensagem').Clear;
          end;

          Query.ParamByName('sistemaOrigem').AsString := Resultado.SistemaOrigem;
          Query.ParamByName('tipo').AsString := Resultado.Tipo;

          Query.ExecSQL;

        end;
      end;
//      DataModule1.Connection.Commit;
//    except
//      DataModule1.Connection.Rollback;
//    end;
  finally
    Query.Free;
  end;
end;

procedure AdicionarDuimpNaLista_e_Salva(Duimp: TRegistroDuimp; vMensagens: TStringList);
var
  Resultado: TResultado;
  Mensagem: TMensagem;

begin
  if not Assigned(Duimp) then
    Exit;

  vMensagens.Add('Registro Iniciado: ' + BoolToStr(Duimp.RegistroIniciado, True));
  vMensagens.Add('Código: ' + Duimp.Code);
  vMensagens.Add('Mensagem: ' + Duimp.Message);

  if Assigned(Duimp.Identificacao) then
  begin
    vMensagens.Add('Identificação - Número: ' + Duimp.Identificacao.Numero);
    vMensagens.Add('Identificação - Versão: ' + Duimp.Identificacao.Versao);
  end;

  vMensagens.Add('NI Importador: ' + Duimp.NiImportador);
  vMensagens.Add('Situação Duimp: ' + Duimp.SituacaoDuimp);
  vMensagens.Add('Data do Evento: ' + DateTimeToStr(Duimp.DataEvento));

  if Assigned(Duimp.Diagnostico) then
  begin
    vMensagens.Add('Diagnóstico - Situação: ' + Duimp.Diagnostico.Situacao);
    vMensagens.Add('Diagnóstico - Data de Geração: ' + DateTimeToStr(Duimp.Diagnostico.DataGeracao));

    for Resultado in Duimp.Diagnostico.Resultado do
    begin
      vMensagens.Add('  Resultado - Tipo: ' + Resultado.Tipo);
      vMensagens.Add('  Resultado - Item: ' + IntToStr(Resultado.Item));

      if Assigned(Resultado.Mensagem) then
      begin
        vMensagens.Add('    Mensagem - Código: ' + Resultado.Mensagem.Codigo);
        vMensagens.Add('    Mensagem - Texto: ' + Resultado.Mensagem.Texto);
      end;

      vMensagens.Add('  Resultado - Sistema Origem: ' + Resultado.SistemaOrigem);
    end;
  end;

  vMensagens.Add('Evento: ' + Duimp.Evento);

  if Duimp.Canal <> '' then
    vMensagens.Add('Canal: ' + Duimp.Canal);

  vmensagens.SaveToFile('mensagem.txt');

end;

procedure ProcessRequest(const JSONContent: string);
var
  Duimp: TRegistroDuimp;
  JSONStr: string;
  vMensagens: TStringList;
begin

  try
    vMensagens := TStringList.Create;
    Duimp := TRegistroDuimp.Create;
    try
      Duimp.CarregarDeJson(JSONContent);
      AdicionarDuimpNaLista_e_Salva(Duimp, vmensagens);
      Servidor.ValidarEExcluirRegistro(Duimp);
      Servidor.GravarDuimpNoBanco(Duimp);
      Servidor.AtualizaDados(Duimp);
    finally
      Duimp.Free;
      vMensagens.Free;
    end;

  except
    on E: Exception do
      raise Exception.Create('Erro ao processar o JSON: ' + E.Message);
  end;
end;

procedure TServer.AtualizaDados(Duimp: TRegistroDuimp);
var
  numeroProcesso: String;
begin
  numeroProcesso := GetNumeroProcesso(Duimp.Identificacao.Numero);

  if numeroProcesso = '' then
    exit;

  if Duimp.SituacaoDuimp.Contains('REGISTRADA') then
  begin
    AtualizaEvento(numeroProcesso, '021', Duimp.DataEvento);
    AtualizaDI(numeroProcesso, Duimp.Identificacao.Numero, Duimp.DataEvento)
    //Mudar a versão da Duimp
  end;

  if Duimp.SituacaoDuimp.Contains('DESEMBARACADA') then
  begin
    AtualizaEvento(numeroProcesso, '088', Duimp.DataEvento);
    AtualizaCanal(numeroProcesso, Duimp.Canal)
  end;


  if Duimp.SituacaoDuimp.Contains('EM_CONFERENCIA_SELECIONADA') then
  begin
    AtualizaCanal(numeroProcesso, Duimp.Canal)
  end;


//  if Duimp.SituacaoDuimp.Contains('DESEMBARACADA_CARGA_ENTREGUE') then
//  begin
//    AtualizaEvento(numeroProcesso, '315', Duimp.DataEvento);
//  end;

end;

function TServer.GetNumeroProcesso(const NumeroDuimp: String): String;
var
  Query: TFDQuery;
  NumeroProcesso: string;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule1.Connection;

    // Primeiro, localizar o número do processo relacionado ao NumeroDuimp
    Query.SQL.Text := 'SELECT NR_PROCESSO FROM TPROCESSO WHERE CD_DUIMP = :CdDuimp';
    Query.ParamByName('CdDuimp').AsString := NumeroDuimp;
    Query.Open;

    if not Query.IsEmpty then
      result := Query.FieldByName('NR_PROCESSO').AsString;
  finally
    Query.Free;
  end;
end;

procedure TServer.AtualizaEvento(const NumeroProcesso, CodigoEvento: string; Data: TDateTime);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule1.Connection;

    Query.SQL.Text :=
      'UPDATE TFOLLOWUP ' +
      'SET DT_REALIZACAO = :DT_REALIZACAO ' +
      'WHERE NR_PROCESSO = :NR_PROCESSO ' +
      '  AND CD_EVENTO = :CodigoEvento ' +
      '  AND DT_REALIZACAO IS NULL';

    Query.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    Query.ParamByName('CodigoEvento').AsString := CodigoEvento;
    Query.ParamByName('DT_REALIZACAO').AsDateTime := Data;

    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TServer.AtualizaDi(const NumeroProcesso, NumeroDuimp: string; Data: TDateTime);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule1.Connection;

    Query.SQL.Text := 'UPDATE TDECLARACAO_IMPORTACAO SET NR_DECLARACAO_IMP = :NR_DECLARACAO_IMP , DT_REGISTRO_DI = :DT_REGISTRO_DI  WHERE NR_PROCESSO = :NR_PROCESSO';
    Query.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    Query.ParamByName('NR_DECLARACAO_IMP').AsString := NumeroDuimp;
    Query.ParamByName('DT_REGISTRO_DI').AsString := FormatDateTime('ddmmyyyy', Data);
    Query.ExecSQL;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text := 'UPDATE TPROCESSO SET NR_DI = :NR_DI WHERE NR_PROCESSO = :NR_PROCESSO';
    Query.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    Query.ParamByName('NR_DI').AsString := NumeroDuimp;
    Query.ExecSQL;

  finally
    Query.Free;
  end;
end;

procedure TServer.AtualizaCanal(const NumeroProcesso, Canal: string);
var
  Query: TFDQuery;
  vCdCanal: String;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule1.Connection;

    Query.SQL.Text := 'SELECT CD_CANAL, NM_CANAL FROM TTP_CANAL WHERE NM_CANAL = :NM_CANAL';
    Query.ParamByName('NM_CANAL').AsString := Canal;
    Query.Open;
    vCdCanal := Query.FieldByName('CD_CANAL').AsString;

    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text := 'UPDATE TPROCESSO SET CD_CANAL = :CD_CANAL WHERE NR_PROCESSO = :NR_PROCESSO';
    Query.ParamByName('NR_PROCESSO').AsString := NumeroProcesso;
    Query.ParamByName('CD_CANAL').AsString := vCdCanal;
    Query.ExecSQL;

  finally
    Query.Free;
  end;
end;

initialization
  SparkleServer := nil;
finalization
  Servidor.StopServer;
end.
