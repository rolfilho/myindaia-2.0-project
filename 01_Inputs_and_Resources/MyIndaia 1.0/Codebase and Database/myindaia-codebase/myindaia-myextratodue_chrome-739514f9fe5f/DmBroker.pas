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
  Datasnap.DBClient, Datasnap.Provider;

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
    qryStatus: TFDQuery;
    qryStatusNR_PROCESSO: TStringField;
    qryStatusCD_DUE: TStringField;
    cdsStatus: TClientDataSet;
    dspStatus: TDataSetProvider;
    cdsStatusNR_PROCESSO: TStringField;
    cdsStatusCD_DUE: TStringField;
    qryStatusQT_TOTAL: TIntegerField;
    cdsStatusQT_TOTAL: TIntegerField;
  private
    function GetDigitalizacaoPath(const AProcesso: string): string;
    function GetSQLObjectId(const ObjectName: string): Int64;
    procedure IncluirArquivo(const NR_Processo, NomeArquivo,
      DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
    function GetNomeArquivo(AProcesso :String; TipoDocumento : Integer; IdTabela : Integer; ADigPath : String): String;
  public
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    procedure MontaLista;
    procedure GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string);

  end;

var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Utils, uMiniBrowser;

{$R *.dfm}


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
      Log('Arquivo copiado para: ' + ANovoArquivo, nil);
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

procedure TdmdBroker.GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo,
  Descricao: string);
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
  NovoNomeArquivo : String;
begin
  try
    try
     // dbBroker.Connected := false;
    //  dbBroker.Connected := true;

      DigPath := GetDigitalizacaoPath(NR_Processo);
      TabelaId := 1652005462;
      NovoNomeArquivo := GetNomeArquivo(NR_Processo, 164, TabelaId, DigPath) + ExtractFileExt(NomeArquivo);

      if not FileExists(PathArquivo + NomeArquivo) then
        Exit;

      Incluir := not FileExists(DigPath + NovoNomeArquivo);
      if not Incluir then
      begin
        SetFileAttributes(PWideChar(DigPath + NovoNomeArquivo), faNormal);
        if not DeleteFile(PWideChar(DigPath + NovoNomeArquivo)) then
        begin
          raise Exception.Create('Não foi possível remover o arquivo '+ DigPath + NovoNomeArquivo +
                     '.'#13'A operação não foi concluída.');
          Exit;
        end;
      end;

      if not CopiaArquivo(PathArquivo + NomeArquivo, DigPath + NovoNomeArquivo, False) then
      begin
        raise Exception.Create('Erro ao copiar o arquivo ' + PathArquivo + NomeArquivo + ' para '+ DigPath + NovoNomeArquivo +
                   '.'#13'A operação não foi concluída.');
      end;

      if Incluir then
      begin
        IncluirArquivo(NR_Processo, NovoNomeArquivo, Descricao, 164, TabelaId);
        Log('Arquivo enviado para o Digitalizar: ' + NovoNomeArquivo, nil);
        if FileExists(DigPath + 'ExtratoDue.pdf') then
          DeleteFile(PWideChar(DigPath + 'ExtratoDue.pdf'));
      end
      else
        Log('Arquivo não enviado para o Digitalizar: ' + NovoNomeArquivo, nil);
    finally
      if FileExists(PathArquivo + NomeArquivo) then
        DeleteFile(PWideChar(PathArquivo + NomeArquivo));
    end;
  except on e:exception do
    log(e.Message, nil);
  end;
end;

procedure TdmdBroker.IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
begin
  qryBroker.Close;
  qryBroker.SQL.Text := 'INSERT INTO TPROCESSO_DOCTOS '+
    '(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA) '+
    'VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :DT_CRIACAO, 1 , :ID_TABELA) ';
  qryBroker.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryBroker.ParamByName('CD_TIPO_DOCTO').AsInteger := TipoDocumento;
  qryBroker.ParamByName('NM_DESCRICAO').AsString := DescricaoArquivo;
  qryBroker.ParamByName('NM_ARQUIVO').AsString := NomeArquivo;
  qryBroker.ParamByName('CD_USUARIO_CRIACAO').Asstring := '0707'; //Departamento de Software
  qryBroker.ParamByName('DT_CRIACAO').AsDateTime := Now;
  qryBroker.ParamByName('ID_TABELA').AsInteger := Tabela;
  qryBroker.ExecSQL;
end;

procedure TdmdBroker.MontaLista;
begin
  cdsStatus.Close;
  qryStatus.Close;
  cdsStatus.Open;
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



function TdmdBroker.GetNomeArquivo(AProcesso :String; TipoDocumento : Integer; IdTabela : Integer; ADigPath : String): String;
var
  OrdemDoc: Integer;
  Prefixo, NomeArquivo: String;

begin
  qryBroker.Connection := dbBroker;

  qryBroker.Close;
  qryBroker.sql.text := ' SELECT NM_PREFIXO_ARQ                  '+
                        '   FROM TTP_DOCTO_DIGITALIZADO (NOLOCK) '+
                        '   WHERE ID_TABELA     = :ID_TABELA     '+
                        '     AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO ';
  qryBroker.ParamByName('ID_TABELA').AsInteger     := IdTabela;
  qryBroker.ParamByName('CD_TIPO_DOCTO').asInteger := TipoDocumento;
  qryBroker.open;
  Prefixo := qryBroker.FieldByName('NM_PREFIXO_ARQ').asString;

  qryBroker.Close;
  qryBroker.sql.text := ' SELECT ISNULL(MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, '+QuotedStr(Prefixo)+' )), 0) AS ORDEM ' +
                        ' FROM TPROCESSO_DOCTOS                                                         ' +
                        ' WHERE NR_PROCESSO = '+QuotedStr(AProcesso)+'                                  ' +
                        '   AND ID_TABELA   = '+IntToStr(IdTabela)+'                                    ' +
                        '   AND NM_ARQUIVO LIKE '+QuotedStr(Prefixo + '%')+'                            ';
  qryBroker.Params.Clear;
  qryBroker.open;
  OrdemDoc := qryBroker.FieldByName('ORDEM').asInteger;
  qryBroker.Close;
  repeat
    Inc(OrdemDoc);
  NomeArquivo := Prefixo + FormatFloat('00', OrdemDoc);
  until not FileExists(ADigPath + NomeArquivo + '.pdf');

  Result := AnsiUpperCase(NomeArquivo);
end;

end.

