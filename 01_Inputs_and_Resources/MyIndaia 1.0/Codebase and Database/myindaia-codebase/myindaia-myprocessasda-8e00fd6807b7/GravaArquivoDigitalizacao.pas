unit GravaArquivoDigitalizacao;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows,
  Dialogs, System.Generics.Collections , DateUtils,  Db, DBTables,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Comp.UI, Data.Win.ADODB, FireDAC.Stan.StorageBin;

  function GravaArquivo(var Conexao : TFDConnection; const Arquivo, NR_Processo, Descricao: string; TipoDocumento : integer = 56) :string;
  function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
  procedure IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
  function GetSQLObjectId(const ObjectName: string): Int64;
  function GetDigitalizacaoPath(const AProcesso: string): string;
  function GetNomeArquivo(AProcesso :String; TipoDocumento : Integer; IdTabela : Integer; ADigPath , Extensao: String): String;

  var
  dbBroker : TFDConnection;
implementation

function GravaArquivo(var Conexao : TFDConnection; const Arquivo, NR_Processo, Descricao: string; TipoDocumento : integer = 56) :string;
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
  NomeArquivo, CaminhoArquivo : String;
begin
  try
    dbBroker := Conexao;

    DigPath     := GetDigitalizacaoPath(NR_Processo);
    TabelaId    := GetSQLObjectId('TPROCESSO');
    NomeArquivo := GetNomeArquivo(NR_Processo, TipoDocumento, TabelaId, DigPath, ExtractFileExt(Arquivo)) + ExtractFileExt(Arquivo);

    if not FileExists(Arquivo) then
      Exit;

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

    if not CopiaArquivo(Arquivo, DigPath + NomeArquivo, False) then
    begin
      raise Exception.Create('Erro ao copiar o arquivo ' + Arquivo + ' para '+ DigPath + NomeArquivo +
                             '.'#13'A operação não foi concluída.');
    end;

    if Incluir then
    begin
      IncluirArquivo(NR_Processo, NomeArquivo, Descricao, TipoDocumento, TabelaId);
      result:= 'Arquivo enviado para o Digitalizar: ' + NomeArquivo;
    end
    else
      result := 'Arquivo não enviado para o Digitalizar: ' + NomeArquivo;

  finally
    if FileExists(Arquivo) then
      DeleteFile(PWideChar(Arquivo));
  end;
end;


function GetDigitalizacaoPath(const AProcesso: string): string;
var
  qryBroker :TFDQuery;
begin
  qryBroker := TFDQuery.Create(nil);
  try
    qryBroker.Connection := dbBroker;
    qryBroker.Close;
    qryBroker.SQL.Text := 'SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)';
    qryBroker.Open;
    Result := IncludeTrailingPathDelimiter(Trim(qryBroker.Fields[0].AsString));
    Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\';
    qryBroker.Close;
  finally
    qryBroker.Free;
  end;
end;

function GetSQLObjectId(const ObjectName: string): Int64;
var
  qryBroker :TFDQuery;
begin
  qryBroker := TFDQuery.Create(nil);
  try
    qryBroker.Connection := dbBroker;
    qryBroker.Close;
    qryBroker.SQL.Text := 'SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ' + QuotedStr(ObjectName);
    qryBroker.Open;
    Result := qryBroker.FieldByName('OBJECT_ID').AsInteger;
    qryBroker.Close;
  finally
    qryBroker.Free;
  end;
end;

procedure IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
var
  qryBroker :TFDQuery;
begin
  qryBroker := TFDQuery.Create(nil);
  try
    qryBroker.Connection := dbBroker;
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
  finally
    qryBroker.Free;
  end;
end;

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

function GetNomeArquivo(AProcesso :String; TipoDocumento : Integer; IdTabela : Integer; ADigPath, Extensao : String): String;
var
  OrdemDoc: Integer;
  Prefixo, NomeArquivo: String;
  qryBroker :TFDQuery;
begin
  qryBroker := TFDQuery.Create(nil);
  try
    qryBroker.Connection := dbBroker;

    qryBroker.Close;
    qryBroker.sql.text := ' SELECT NM_PREFIXO_ARQ                  '+
                          '   FROM TTP_DOCTO_DIGITALIZADO (NOLOCK) '+
                          '   WHERE ID_TABELA = :ID_TABELA         '+
                          '     AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO ';
    qryBroker.ParamByName('ID_TABELA').AsInteger     := IdTabela;
    qryBroker.ParamByName('CD_TIPO_DOCTO').asInteger := TipoDocumento;
    qryBroker.open;
    Prefixo := qryBroker.FieldByName('NM_PREFIXO_ARQ').asString;
    qryBroker.Close;

    qryBroker.sql.text := ' SELECT ISNULL(MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, :NM_PREFIXO_1 )), 0) AS ORDEM ' +
                          ' FROM TPROCESSO_DOCTOS                                                         ' +
                          ' WHERE NR_PROCESSO = :NR_PROCESSO' +
                          '   AND ID_TABELA   = :ID_TABELA' +
                          '   AND NM_ARQUIVO LIKE :NM_PREFIXO';
    qryBroker.ParamByName('NR_PROCESSO').asString  := AProcesso;
    qryBroker.ParamByName('ID_TABELA').AsInteger   := IdTabela;
    qryBroker.ParamByName('NM_PREFIXO').asString   := Prefixo + '%';
    qryBroker.ParamByName('NM_PREFIXO_1').asString   := Prefixo ;
    qryBroker.open;
    OrdemDoc := qryBroker.FieldByName('ORDEM').asInteger;
    qryBroker.Close;
  finally
    qryBroker.Free;
  end;

  repeat
    Inc(OrdemDoc);
    NomeArquivo := Prefixo + FormatFloat('00', OrdemDoc);
  until not FileExists(ADigPath + NomeArquivo + '.'+Extensao);

  Result := AnsiUpperCase(NomeArquivo);
end;

end.
