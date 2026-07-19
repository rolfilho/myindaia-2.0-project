unit DmBroker;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows, Dialogs, System.Generics.Collections,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile, System.StrUtils,
  Datasnap.DBClient, Datasnap.Provider, DueCompletaClasses;

type
  TStringArray = array of String;

  TProcesso = class
    NR_Processo: string;
    NR_Conhecimento: string;
    NomeAtendente: string;
    EmailAtendente: string;
    constructor Create(const ANR_Processo, ANR_Conhecimento, ANomeAtendente, AEmailAtendente: string);
  end;

  TdmdBroker = class(TDataModule)
    dbBroker: TFDConnection;
    qryBroker: TFDQuery;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    qryStatus: TFDQuery;
    qryStatusNR_PROCESSO: TStringField;
    qryStatusCD_DUE: TStringField;
    cdsStatus: TClientDataSet;
    dspStatus: TDataSetProvider;
    cdsStatusNR_PROCESSO: TStringField;
    cdsStatusCD_DUE: TStringField;
    qryStatusDT_REALIZACAO088: TSQLTimeStampField;
    cdsStatusDT_REALIZACAO088: TSQLTimeStampField;
    QryConsulta: TFDQuery;
    qryStatusDESPACHANTE: TStringField;
    qryStatusCD_CLIENTE: TStringField;
  private
    function GetDigitalizacaoPath(const AProcesso: string): string;
    function GetSQLObjectId(const ObjectName: string): Int64;
    procedure IncluirArquivo(const NR_Processo, NomeArquivo,
      DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
    function NomeArquivoPara(ATabela: Int64; const AProcesso, APrefixo, AExt,
      APathDestino: string): string;
  public
    procedure AtualizaCanal(const NR_Processo, Canal: string);
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia,
      ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
      AAnexos: TStringArray): Boolean;
    procedure MontaLista(CdDespachante: String);
    procedure AtualizaEvento(const NR_Processo, Evento: string; Data: TDateTime);
    procedure VerificaEvento088(const NR_Processo: String);
    function AtualizaEventosConsultaCompleta(const NR_Processo: String; RespostaCompleta: TRespostaConsultaCompleta): String;
  end;

var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses KrUtil;

{$R *.dfm}

function TdmdBroker.NomeArquivoPara(ATabela: Int64; const AProcesso, APrefixo, AExt, APathDestino: string): string;
var
  I: Integer;
  PathDestino: string;
begin
  // Pegar o índice para o nome do arquivo
  PathDestino := IncludeTrailingPathDelimiter(APathDestino);
  qryBroker.SQL.Clear;
  qryBroker.SQL.Text :=
    ' SELECT MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, ' + QuotedStr(APrefixo) + ')) ' +
    ' FROM TPROCESSO_DOCTOS ( NOLOCK )' +
    ' WHERE NR_PROCESSO = ' + QuotedStr(AProcesso) +
    '   AND ID_TABELA = ' + IntToStr(ATabela) +
    '   AND NM_ARQUIVO LIKE ' + QuotedStr(APrefixo + '%');
  qryBroker.Open;
  begin
    if qryBroker.Fields[0].IsNull then
      I := 0
    else
      I := qryBroker.Fields[0].AsInteger;
    qryBroker.Close;
  end;
  repeat
    Inc(I);
    Result := APrefixo + FormatFloat('00', I);
  until not FileExists(PathDestino + Result + '.*');
  Result := AnsiUpperCase(Result + AExt);
end;

procedure TdmdBroker.AtualizaEvento(const NR_Processo, Evento: string; Data: TDateTime);
begin

    qryBroker.Close;
    qryBroker.SQL.Text := 'UPDATE TFOLLOWUP SET DT_REALIZACAO = :DATA WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = :CD_EVENTO ';
    qryBroker.ParamByName('DATA').AsDateTime      := Data;
    qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
    qryBroker.ParamByName('CD_EVENTO').AsString   := Evento;
    qryBroker.ExecSQL;

   { if qryBroker.RowsAffected = 0 then
    begin
        qryBroker.Close;
        qryBroker.SQL.Text := 'INSERT INTO TFOLLOWUP (NR_PROCESSO, CD_RESP_REALIZACAO, CD_EVENTO, DT_REALIZACAO) '+
          'VALUES (:NR_PROCESSO, :CD_RESP_REALIZACAO, :CD_EVENTO, :DATA) ';
        qryBroker.ParamByName('NR_PROCESSO').AsString        := NR_Processo;
        qryBroker.ParamByName('CD_EVENTO').AsString          := Evento;
        qryBroker.ParamByName('CD_RESP_REALIZACAO').AsString := '0707';
        qryBroker.ParamByName('DATA').AsDateTime             := Data;
        qryBroker.ExecSQL;
    end; }

 // Log('Atualizado o evento ' + Evento, nil);
end;

procedure TdmdBroker.VerificaEvento088(const NR_Processo: String);
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT COUNT(*) QTD FROM TFOLLOWUP ' +
                        'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''088'' AND ISNULL(DT_REALIZACAO, '''') = '''' ';
  qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryBroker.Open;

  if qryBroker.FieldByName('QTD').AsInteger > 0 then
  begin
    qryBroker.Close;
    qryBroker.SQL.Text := 'UPDATE TFOLLOWUP SET DT_REALIZACAO = GETDATE() WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''088'' ';
    qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
    qryBroker.ExecSQL;
  end;
end;

function TdmdBroker.AtualizaEventosConsultaCompleta(const NR_Processo: String; RespostaCompleta: TRespostaConsultaCompleta): String;
var
  evt: TEventoHistorico;
  sDataHora: string;
begin

  // procura diretamente no array o timestamp
  for evt in RespostaCompleta.Eventos do
    if SameText(evt.evento, 'Desembaraço') then
    begin
      sDataHora := evt.dataEHoraDoEvento;
      Break;
    end;

  if sDataHora = '' then
  begin
    result := 'não há evento "Desembaraço';
    Exit;
  end;

  sDataHora := Copy(sDataHora, 1, 23);

  // faz update só onde DT_REALIZACAO é NULL
  qryBroker.Close;
  qryBroker.SQL.Text :=
    'UPDATE TFOLLOWUP ' +
    'SET DT_REALIZACAO = :DATA ' +
    'WHERE NR_PROCESSO = :NR_PROCESSO ' +
    '  AND CD_EVENTO = ''088'' ' +
    '  AND DT_REALIZACAO IS NULL';
  qryBroker.ParamByName('DATA').AsDateTime      := JSONDate_To_Datetime(sDataHora);
  qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryBroker.ExecSQL;

  result := 'Processo: ' + NR_Processo + ' / Evento 088 (Desembaraço) atualizado com a data: ' + DateTimeToStr(JSONDate_To_Datetime(sDataHora)) ;
end;


procedure TdmdBroker.AtualizaCanal(const NR_Processo, Canal: string);
var
  vCdCanal: String;
begin
  vCdCanal := '';

  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT CD_CANAL FROM TTP_CANAL WHERE NM_CANAL = :CANAL';
  qryBroker.ParamByName('CANAL').AsString := Canal;
  qryBroker.open;
  vCdCanal := qryBroker.FieldByName('CD_CANAL').AsString;

  qryBroker.Close;
  qryBroker.SQL.Text := 'UPDATE TPROCESSO SET CD_CANAL = :CD_CANAL WHERE NR_PROCESSO = :NR_PROCESSO';
  qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryBroker.ParamByName('CD_CANAL').AsString   := vCdCanal;
  qryBroker.ExecSQL;

end;

procedure TdmdBroker.ConfiguraConexao(const Servidor, Banco, Usuario,
  Senha: string);
begin
  dbBroker.Close;
  dbBroker.Params.Values['Server'] := Servidor;
  dbBroker.Params.Values['Database'] := Banco;
  dbBroker.Params.Values['User_Name'] := Usuario;
  dbBroker.Params.Values['password'] := Senha;
  dbBroker.Params.Values['DriverID'] := 'MSSQL';
  dbBroker.Open;
end;

function TdmdBroker.GetDigitalizacaoPath(const AProcesso: string): string;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)';
  qryBroker.Open;
  Result := IncludeTrailingPathDelimiter(Trim(qryBroker.Fields[0].AsString));
  Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\';
  qryBroker.Close;
end;

function TdmdBroker.GetSQLObjectId(const ObjectName: string): Int64;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ' + QuotedStr(ObjectName);
  qryBroker.Open;
  Result := qryBroker.FieldByName('OBJECT_ID').AsInteger;
  qryBroker.Close;
end;


procedure TdmdBroker.IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'INSERT INTO TPROCESSO_DOCTOS '+
    '(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA) '+
    'VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :DT_CRIACAO, 1 , :ID_TABELA) ';
  qryBroker.ParamByName('NR_PROCESSO').AsString        := NR_Processo;
  qryBroker.ParamByName('CD_TIPO_DOCTO').AsInteger     := TipoDocumento;
  qryBroker.ParamByName('NM_DESCRICAO').AsString       := DescricaoArquivo;
  qryBroker.ParamByName('NM_ARQUIVO').AsString         := NomeArquivo;
  qryBroker.ParamByName('CD_USUARIO_CRIACAO').Asstring := '0707'; //Departamento de Software
  qryBroker.ParamByName('DT_CRIACAO').AsDateTime       := Now;
  qryBroker.ParamByName('ID_TABELA').AsInteger         := Tabela;
  qryBroker.ExecSQL;
end;

procedure TdmdBroker.MontaLista(CdDespachante: String);
begin
  cdsStatus.Close;
  qryStatus.Close;
  qryStatus.ParamByName('CD_DESPACHANTE').AsString := CdDespachante;
  cdsStatus.Open;
end;

function TdmdBroker.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray;
   AAssunto, ACorpo: String; AAnexos: TStringArray): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
begin
  qryBroker.Close;
  qryBroker.sql.Text := 'SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA, EMAIL_TLS FROM VW_CONFIG_MAIL ( NOLOCK )';
  qryBroker.Open;
  IdSMTP1.Host     := qryBroker.FieldByName('NM_HOST').AsString;//'email-smtp.us-east-1.amazonaws.com';
  IdSMTP1.Port     := qryBroker.FieldByName('NR_PORTA').AsInteger;//587;
  IdSMTP1.Username := qryBroker.FieldByName('NM_LOGIN').AsString;//'AKIAIX5BPVHLHQRKEUTA';
  IdSMTP1.Password := qryBroker.FieldByName('NM_SENHA').AsString;//'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh';
  if (qryBroker.FieldByName('EMAIL_TLS').AsBoolean) then
  begin
    IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdSMTP1.UseTLS := utUseExplicitTLS;
  end
  else
  begin
    IdSMTP1.IOHandler := nil;
    IdSMTP1.UseTLS := utNoTLSSupport;
  end;
  qryBroker.Close;
  IdMessage1.Clear;

  NewText1 := TIdText.Create(IdMessage1.MessageParts);

  try
    with NewText1 do
    begin
      ContentType:='text/html';
      for I := 0 to High(AAnexos) do
        if FileExists(AAnexos[I]) then
          TIdAttachmentFile.Create(IdMessage1.MessageParts, AAnexos[I]);

      Body.Add('<html>');
      Body.Add('<body>');
      Body.Add(ACorpo);
      Body.Add('<br>');
      Body.Add('<br>');
      Body.Add('Email gerado automaticamente.<br>');
      Body.Add('Duvidas: <a href="mailto:ti@myindaia.com.br">ti@myindaia.com.br</a>');
      Body.Add('</body>');
      Body.Add('</html>');
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
end;

{ TProcesso }

constructor TProcesso.Create(const ANR_Processo, ANR_Conhecimento,
  ANomeAtendente, AEmailAtendente: string);
begin
  NR_Processo := ANR_Processo;
  NR_Conhecimento := ANR_Conhecimento;
  NomeAtendente := ANomeAtendente;
  EmailAtendente := AEmailAtendente;
end;

end.
