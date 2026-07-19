unit DmMain;

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
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile, System.StrUtils;

type
  TStringArray = array of String;

  TdmdMain = class(TDataModule)
    dbBroker: TFDConnection;
    qryBroker: TFDQuery;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    qrySDE: TFDQuery;
    dbSDE: TFDConnection;
    dbWallet: TFDConnection;
    qryWallet: TFDQuery;
    qryWalletProcessos: TFDQuery;
    qryUnidNeg: TFDQuery;
    qryWalletSENIORKEY: TWideStringField;
    qryWalletBRANCH_ID: TLargeintField;
    qryWallettaxID: TWideStringField;
  private
    function GetDigitalizacaoPath(const AProcesso: string): string;
    function GetSQLObjectId(const ObjectName: string): Int64;
    procedure IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
    Function VerificaDocumentoJaExiste(const NR_Processo, NomeArquivo :string; TipoDocumento : integer) : Boolean;
  public
    procedure GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string);
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
                        AAnexos: TStringArray): Boolean;
    function GetCodigoIBGEBySIAFI(const Value: string): string;
  end;

var
  dmdMain: TdmdMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Util;

{$R *.dfm}

function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
var
  Stream: TMemoryStream;
begin
  Result := False;
  if not (FileExists(ANovoArquivo) and AFalharSeExiste) then
  begin
    if not DirectoryExists(ExtractFileDir(ANovoArquivo)) then
      ForceDirectories(ExtractFileDir(ANovoArquivo));

    Stream := TMemoryStream.Create;
    try
      Stream.LoadFromFile(AArquivoExistente);
      Stream.Position := 0;
      Stream.SaveToFile(ANovoArquivo);
      Result := True;
    finally
      FreeAndNil(Stream);
    end;
    if Result then
      {$if CompilerVersion >= 22}
      SetFileAttributes(PWideChar(ANovoArquivo), System.SysUtils.faReadOnly);
      {$else}
      SetFileAttributes(PAnsiChar(ANovoArquivo), System.SysUtils.faReadOnly);
      {$ifend}
  end;
end;


procedure TdmdMain.ConfiguraConexao(const Servidor, Banco, Usuario,
  Senha: string);
begin
  dbBroker.Close;
  dbBroker.Params.Values['Server']     := Servidor;
  dbBroker.Params.Values['Database']   := Banco;
  dbBroker.Params.Values['User_Name']  := Usuario;
  dbBroker.Params.Values['Password']   := Senha;
  dbBroker.Params.Values['DriverID']   := 'MSSQL';
  dbBroker.Open;
end;

function TdmdMain.GetCodigoIBGEBySIAFI(const Value: string): string;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT CD_MUNICIPIO FROM TMUNICIPIO (NOLOCK) WHERE CD_MUNICIPIO_SIAFI = :CD_MUNICIPIO_SIAFI ';
  qryBroker.ParamByName('CD_MUNICIPIO_SIAFI').AsString := Value;
  qryBroker.Open;
  Result := qryBroker.FieldByName('CD_MUNICIPIO').AsString;
  qryBroker.Close;
end;

function TdmdMain.GetDigitalizacaoPath(const AProcesso: string): string;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)';
  qryBroker.Open;

  Result := IncludeTrailingPathDelimiter(Trim(qryBroker.Fields[0].AsString));
  Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\';
  qryBroker.Close;
end;

function TdmdMain.GetSQLObjectId(const ObjectName: string): Int64;
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ' + QuotedStr(ObjectName);
  qryBroker.Open;
  Result := qryBroker.FieldByName('OBJECT_ID').AsInteger;
  qryBroker.Close;
end;

procedure TdmdMain.IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
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
  try
    qryBroker.ExecSQL;
  except
  end;
end;
function TdmdMain.VerificaDocumentoJaExiste(const NR_Processo, NomeArquivo :string; TipoDocumento : integer) : boolean;
begin
  result := false;
  qryBroker.Close;
  qryBroker.SQL.Text := ' SELECT NR_PROCESSO                             '+
                        '   FROM TPROCESSO_DOCTOS (NOLOCK)               '+
                        '  WHERE NR_PROCESSO = :NR_PROCESSO              '+
                        '    AND LTRIM(RTRIM(NM_ARQUIVO)) = :NM_ARQUIVO  '+
                        '    AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO          '+
                        '    AND IN_ATIVO      = 1                       ';
  qryBroker.ParamByName('NR_PROCESSO').AsString        := NR_Processo;
  qryBroker.ParamByName('CD_TIPO_DOCTO').AsInteger     := TipoDocumento;
  qryBroker.ParamByName('NM_ARQUIVO').AsString         := NomeArquivo;
  try
    qryBroker.open;
    if qryBroker.RecordCount > 0 then
      result := true;
  except
  end;
end;

procedure TdmdMain.GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string);
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
begin
  DigPath  := GetDigitalizacaoPath(NR_Processo);
  TabelaId := GetSQLObjectId('TPROCESSO');
  //if not FileExists(PathArquivo + NomeArquivo) then
  //  Exit;

  Incluir := not FileExists(DigPath + NomeArquivo);
  if not Incluir then
  begin
    SetFileAttributes(PWideChar(DigPath + NomeArquivo), faNormal);
    if not DeleteFile(PWideChar(DigPath + NomeArquivo)) then
    begin
      raise Exception.Create('Não foi possível remover o arquivo '+ DigPath + NomeArquivo +
                 '.'#13'A operação não foi concluída.');
      Exit;
    end;
  end;
  if not CopiaArquivo(PathArquivo + NomeArquivo, DigPath + NomeArquivo, False) then
  begin
    raise Exception.Create('Erro ao copiar o arquivo ' + PathArquivo + NomeArquivo + ' para '+ DigPath + NomeArquivo +
               '.'#13'A operação não foi concluída.');
  end;
  if Incluir then
    IncluirArquivo(NR_Processo, NomeArquivo, Descricao, 155, TabelaId);
end;

function TdmdMain.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray;
   AAssunto, ACorpo: String; AAnexos: TStringArray): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
begin
  qryBroker.Close;
  qryBroker.sql.Text := 'SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA, EMAIL_TLS FROM VW_CONFIG_MAIL ( NOLOCK )';
  try
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

end.
