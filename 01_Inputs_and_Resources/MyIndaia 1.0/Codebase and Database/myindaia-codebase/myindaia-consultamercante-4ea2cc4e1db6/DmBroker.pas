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
  Bde.DBTables;

type
  TStringArray = array of String;

  TdmdBroker = class(TDataModule)
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    qryFila: TFDQuery;
    qryBroker: TFDQuery;
    qryUpdateEvento: TFDQuery;
    dbBroker: TFDConnection;
    qryUpdateProcesso: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function GetDigitalizacaoPath(const AProcesso: string): string;
    function GetSQLObjectId(const ObjectName: string): Int64;
    procedure IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
  public
    procedure GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string; TipoDocumento : integer = 56);
    procedure AtualizaEvento(NR_Processo, NR_Evento: string);
    procedure AtualizaProcesso(NR_Processo: string);
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
                        AAnexos: TStringArray): Boolean;
    function GetSqlFila(Tipo : String ; DiasAnteriores:Integer = 1) :string;
    function GetSqlFilaPorMercante: string;
  end;

var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Utils, uMain, Settings;

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

procedure TdmdBroker.AtualizaEvento(NR_Processo, NR_Evento: string);
begin
  qryUpdateEvento.Close;
  qryUpdateEvento.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryUpdateEvento.ParamByName('CD_EVENTO').AsString   := NR_Evento;
  qryUpdateEvento.ExecSQL;
end;

procedure TdmdBroker.AtualizaProcesso(NR_Processo: string);
begin
  qryUpdateProcesso.Close;
  qryUpdateProcesso.ParamByName('NR_PROCESSO').AsString := NR_Processo;
  qryUpdateProcesso.ExecSQL;
end;

procedure TdmdBroker.ConfiguraConexao(const Servidor, Banco, Usuario,
  Senha: string);
begin
  dbBroker.Close;
  dbBroker.Params.Values['Server']    := Servidor;
  dbBroker.Params.Values['Database']  := Banco;
  dbBroker.Params.Values['User_Name'] := Usuario;
  dbBroker.Params.Values['Password']  := Senha;
  dbBroker.Params.Values['DriverID']  := 'MSSQL';
  dbBroker.Open;

  FormMain.StatusBar.Panels.Items[4].Text := Servidor;
end;

procedure TdmdBroker.DataModuleCreate(Sender: TObject);
begin
  dbBroker.Connected := false;
  if (LocalSettings.Servidor <> '')  and
     (LocalSettings.Banco    <> '')  and
     (LocalSettings.Usuario  <> '')  and
     (LocalSettings.Senha    <> '') then
  begin
    dmdBroker.ConfiguraConexao(LocalSettings.Servidor, LocalSettings.Banco, LocalSettings.Usuario, LocalSettings.Senha);
  end
  else
    dmdBroker.ConfiguraConexao('Indaia10', 'Broker', 'sa', '123');
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

procedure TdmdBroker.GravaArquivo(const PathArquivo, NomeArquivo, NR_Processo, Descricao: string; TipoDocumento : integer = 56);
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
begin
  try
    DigPath  := GetDigitalizacaoPath(NR_Processo);
    TabelaId := GetSQLObjectId('TPROCESSO');

    if not FileExists(PathArquivo + NomeArquivo) then
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

    if not CopiaArquivo(PathArquivo + NomeArquivo, DigPath + NomeArquivo, False) then
    begin
      raise Exception.Create('Erro ao copiar o arquivo ' + PathArquivo + NomeArquivo + ' para '+ DigPath + NomeArquivo +
                             '.'#13'A operação não foi concluída.');
    end;

    if Incluir then
    begin

      IncluirArquivo(NR_Processo, NomeArquivo, Descricao, TipoDocumento, TabelaId);
      Log('Arquivo enviado para o Digitalizar: ' + NomeArquivo, nil);
    end
    else
      Log('Arquivo não enviado para o Digitalizar: ' + NomeArquivo, nil);

  finally
    if FileExists(PathArquivo + NomeArquivo) then
      DeleteFile(PWideChar(PathArquivo + NomeArquivo));
  end;
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

  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode := sslmClient;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1_2;
  IdSSLIOHandlerSocketOpenSSL1.Port := 587;

  IdSMTP1.Host     := qryBroker.FieldByName('NM_HOST').AsString;//'email-smtp.us-east-1.amazonaws.com';
  IdSMTP1.Port     := qryBroker.FieldByName('NR_PORTA').AsInteger;//587;
  IdSMTP1.Username := qryBroker.FieldByName('NM_LOGIN').AsString;//'AKIAIX5BPVHLHQRKEUTA';
  IdSMTP1.Password := qryBroker.FieldByName('NM_SENHA').AsString;//'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh';

  if (qryBroker.FieldByName('EMAIL_TLS').AsBoolean) then
  begin
    IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdSMTP1.UseTLS    := utUseExplicitTLS;
  end
  else
  begin
    IdSMTP1.IOHandler := nil;
    IdSMTP1.UseTLS    := utNoTLSSupport;
  end;
  qryBroker.Close;
  IdMessage1.Clear;

  NewText1 := TIdText.Create(IdMessage1.MessageParts);

  try
    with NewText1 do
    begin
      ContentType := 'text/html';
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
      IdMessage1.Recipients.EMailAddresses := APara[0];
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

function TdmdBroker.GetSqlFilaPorMercante : string;
var Sql :string;
begin
  Sql :=  'SELECT ' +
          'TP.NR_PROCESSO, ' +
          'TP.NUM_CE AS NR_CE_MERCANTE, ' +
          'EV021.DT_REALIZACAO AS [Dt DI] ' +
          'FROM TPROCESSO TP (NOLOCK) ' +
          'LEFT JOIN TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = TP.NR_PROCESSO AND EV021.CD_EVENTO = ''021'' ' +
          'LEFT JOIN TDADOS_CONHECIMENTO_SITE DC ON DC.NR_PROCESSO = TP.NR_PROCESSO ' +
          'WHERE TP.CD_GRUPO = ''A77'' ' +
          'AND TP.NUM_CE IS NOT NULL ' +
          'AND ( ' +
          '( ( CONVERT(DATE,EV021.DT_REALIZACAO) >= ''2018-03-01'' ' +
          'AND CONVERT(DATE,EV021.DT_REALIZACAO) <= ''2019-06-01'') ) ' +
          'OR ( ( CONVERT(DATE,EV021.DT_REALIZACAO) >= ''2022-06-08'' ' +
          'AND CONVERT(DATE,EV021.DT_REALIZACAO) <= ''2023-03-06'') ) ' +
          ') ' +
          'AND ' +
          'DC.DS_AGENCIA_NAVEGACAO IS NULL AND ' +
          'DC.DS_FRETE_MODALIDADE IS NULL AND ' +
          'DC.VL_FRETE_TOTAL IS NULL AND ' +
          'DC.VL_FRETE_BASICO IS NULL ';

  result := Sql;
end;

function TdmdBroker.GetSqlFila(Tipo : String ; DiasAnteriores:Integer = 1) : string;
var Sql :string;
begin
  if Tipo = 'B' then
  begin
   Sql :=     '   SELECT A.NR_PROCESSO                                AS NR_PROCESSO,                                      '+ sLineBreak +
              '         RIGHT(LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(NR_CONHECIMENTO, ''.'', '''')                           '+ sLineBreak +
              '               ,''-'', '''')),''/'', ''''))),18)                                                            '+ sLineBreak +
              '                                                       AS NR_CONHECIMENTO,                                  '+ sLineBreak +
//              '                                                    ''MEDUDD308943''   AS NR_CONHECIMENTO,                                  '+ sLineBreak +
              '         D.DT_REALIZACAO                               AS DT_REALIZACAO,                                    '+ sLineBreak +
              '         K.DT_INCLUSAO                                 AS DT_INCLUSAO,                                      '+ sLineBreak +
              '         K.NR_CE_MERCANTE                              AS NR_CE_MERCANTE,                                   '+ sLineBreak ;


   if LocalSettings.TPPeriodoConsulta = 'MaiorFinal' then
   begin
     LocalSettings.TPPeriodoConsulta := 'MaiorInicial';

     Sql:= Sql+
              '         DATEADD(DAY, -2, D.DT_REALIZACAO)             AS DATA_INICIAL,                                     '+ sLineBreak +
              '         DATEADD(DAY, 7,  D.DT_REALIZACAO)             AS DATA_FINAL,                                       '+ sLineBreak ;
   end
   else
   begin
     LocalSettings.TPPeriodoConsulta := 'MaiorFinal';

     Sql:= Sql+
              '         DATEADD(DAY, -7, D.DT_REALIZACAO)             AS DATA_INICIAL,                                     '+ sLineBreak +
              '         DATEADD(DAY, 2,  D.DT_REALIZACAO)             AS DATA_FINAL,                                       '+ sLineBreak ;
   end;


   Sql:= Sql+
              '         E.CGC_EMPRESA                                 AS CGC_EMPRESA,                                      '+ sLineBreak ;

              if not FormMain.cbxValidar.Checked then
              begin
   Sql:= Sql+ '         CASE WHEN ISNULL(J.NM_EMAIL_CONSULTA_MERCANTE, '''') = ''''                                        '+ sLineBreak +
              '              THEN I.NM_EMAIL                                                                               '+ sLineBreak +
              '              ELSE REPLACE(J.NM_EMAIL_CONSULTA_MERCANTE,'','', '';'')                                       '+ sLineBreak +
              '         END                                           AS EMAIL_CONSULTA_MERCANTE                           '+ sLineBreak ;
              end
              else
              begin
   Sql:= Sql+ '        '+ QuotedStr(LocalSettings.EmailValidacao) + ' AS EMAIL_CONSULTA_MERCANTE                           '+ sLineBreak ;
              end;

   Sql:= Sql+ '   FROM TPROCESSO                           A WITH(NOLOCK)                                                  '+ sLineBreak +
              '   JOIN TFOLLOWUP                           B WITH(NOLOCK)   ON B.NR_PROCESSO  = A.NR_PROCESSO              '+ sLineBreak +
              '                                                        	   AND B.CD_SERVICO   = A.CD_SERVICO               '+ sLineBreak +
              '                                                        	   AND B.CD_EVENTO    = ''722''                    '+ sLineBreak +
              '                                                        	   AND B.IN_APLICAVEL = 1                          '+ sLineBreak +
              '   JOIN TFOLLOWUP                           C WITH(NOLOCK)   ON C.NR_PROCESSO  = A.NR_PROCESSO              '+ sLineBreak +
              '                                                        	   AND C.CD_SERVICO   = A.CD_SERVICO               '+ sLineBreak +
              '                                                        	   AND C.CD_EVENTO    = ''021''                    '+ sLineBreak +
              '                                                        	   AND C.IN_APLICAVEL = 1                          '+ sLineBreak +
              '                                                        	   AND C.DT_REALIZACAO IS NULL                     '+ sLineBreak +
              '   JOIN TFOLLOWUP                           D WITH(NOLOCK)   ON D.NR_PROCESSO  = A.NR_PROCESSO              '+ sLineBreak +
              '                                                            AND D.CD_SERVICO   = A.CD_SERVICO               '+ sLineBreak +
              '                                                            AND D.CD_EVENTO    = ''161''                    '+ sLineBreak +
              '                                                            AND D.IN_APLICAVEL = 1                          '+ sLineBreak +
              '                                                            AND D.DT_REALIZACAO IS NOT NULL                 '+ sLineBreak +
              '   JOIN TEMPRESA_NAC                        E WITH(NOLOCK)   ON E.CD_EMPRESA   = A.CD_CLIENTE               '+ sLineBreak +
              '   JOIN TFOLLOWUP                           H WITH(NOLOCK) ON H.NR_PROCESSO    = A.NR_PROCESSO              '+ sLineBreak +
              '                                                          AND H.CD_SERVICO     = A.CD_SERVICO               '+ sLineBreak +
              '                                                          AND H.CD_EVENTO      = ''647''                    '+ sLineBreak +
              '                                                          AND H.IN_APLICAVEL   = 1                          '+ sLineBreak +
              '   LEFT                                                                                                     '+ sLineBreak +
              '   JOIN TUSUARIO                            I WITH(NOLOCK) ON I.CD_USUARIO     = A.CD_ANALISTA_COMISSARIA   '+ sLineBreak +
              '   JOIN TGRUPO                              J WITH(NOLOCK) ON J.CD_GRUPO       = A.CD_GRUPO                 '+ sLineBreak +
              '   LEFT JOIN TDADOS_CONHECIMENTO_SITE_TERCEIROS K WITH(NOLOCK) ON K.NR_BL      =                            '+ sLineBreak +
              ' RIGHT(LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(A.NR_CONHECIMENTO, ''.'', ''''),''-'', '''')),''/'', ''''))),18)'+ sLineBreak +
              '   WHERE A.IN_CANCELADO = 0                                                                                 '+ sLineBreak +
              '     AND B.DT_REALIZACAO IS NULL                                                                            '+ sLineBreak +
              '     AND A.CD_SERVICO != ''17''                                                                             '+ sLineBreak +
              '     AND LTRIM(RTRIM(ISNULL(A.NR_CONHECIMENTO,''''))) <> ''''                                               '+ sLineBreak +
              '     AND H.DT_REALIZACAO IS NULL                                                                            '+ sLineBreak +
              '     AND CONVERT(DATE, D.DT_REALIZACAO) <= CONVERT(DATE,DATEADD(DAY, 25, GETDATE()))                        '+ sLineBreak +
              '     AND K.DT_INCLUSAO IS NOT NULL                                                                         '+ sLineBreak +

//                'OR A.NR_PROCESSO = ''0101IM-019614-23  ''' +
              '   ORDER BY DT_CONHECIMENTO                                                                                 '+ sLineBreak ;

  end
  else
  begin
    if Tipo = 'T' then
    begin
     Sql :=      ' SELECT B.CGC_EMPRESA                                                   AS CGC_EMPRESA,             '  + sLineBreak +
                 '        DATEADD(DAY, -'+IntToStr(DiasAnteriores)+', GETDATE())          AS DT_INCLUSAO,             '  + sLineBreak +
                 '        DATEADD(DAY, -1, GETDATE())                                     AS DATA_INICIAL,            '  + sLineBreak +
                 '        DATEADD(DAY, 8,  GETDATE())                                     AS DATA_FINAL,              '  + sLineBreak +
                 '        A.CD_GRUPO                                                      AS CD_GRUPO,                '  + sLineBreak +
                 '        B.CD_EMPRESA                                                    AS CD_EMPRESA,              '  + sLineBreak +
                 '        A.NM_GRUPO                                                      AS NM_GRUPO,                '  + sLineBreak +
                 '        B.NM_EMPRESA                                                    AS NM_EMPRESA,              '  + sLineBreak +
                 '        SUBSTRING(B.CGC_EMPRESA,1,2) + ''.'' +                                                      '  + sLineBreak +
                 '        SUBSTRING(B.CGC_EMPRESA,3,3) + ''.'' +                                                      '  + sLineBreak +
                 '        SUBSTRING(B.CGC_EMPRESA,6,3) + ''/'' +                                                      '  + sLineBreak +
                 '        SUBSTRING(B.CGC_EMPRESA,9,4) + ''-'' +                                                      '  + sLineBreak +
                 '        SUBSTRING(B.CGC_EMPRESA,13,2)                                   AS CGC_EMPRESA_FORMATADO,   '  + sLineBreak ;
     if not FormMain.cbxValidar.Checked then
      Sql:= Sql+ '        REPLACE(ISNULL(A.NM_EMAIL_CONSULTA_MERCANTE,''''),'','', '';'') AS EMAIL_CONSULTA_MERCANTE  '  + sLineBreak
     else
      Sql:= Sql+ '       '+ QuotedStr(LocalSettings.EmailValidacao) + '                   AS EMAIL_CONSULTA_MERCANTE  '  + sLineBreak;

     Sql:= Sql+  ' FROM TGRUPO       A WITH(NOLOCK)                                                                   '  + sLineBreak +
                 '   JOIN TEMPRESA_NAC B WITH(NOLOCK) ON B.CD_GRUPO = A.CD_GRUPO                                      '  + sLineBreak +
                 ' WHERE ISNULL(A.IC_CONSULTA_MERCANTE_TERCEIROS,0) = 1                                               '  + sLineBreak +
//                 '   AND B.CGC_EMPRESA = ''92660604013756'' '+
                 '   AND ISNULL(B.IN_ATIVO, ''1'') = ''1''                                                            '  + sLineBreak +
                 '   AND ISNULL(A.IN_ATIVO, ''1'') = ''1''                                                            '  + sLineBreak +
                 '   AND ISNULL(B.CGC_EMPRESA, '''') <> ''''                                                          '  + sLineBreak;
//                 '   AND CGC_EMPRESA = ''59105999000348'' ';
    end;

  end;
  Result := Sql;

end;

end.
