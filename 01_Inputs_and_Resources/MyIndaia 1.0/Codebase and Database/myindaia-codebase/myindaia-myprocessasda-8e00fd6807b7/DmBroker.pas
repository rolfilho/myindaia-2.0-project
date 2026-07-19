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
    qryBroker: TFDQuery;
    dbBroker: TFDConnection;
    qryFilaDespachante: TFDQuery;
    qryDadosSDA: TFDQuery;
    qryDespachante: TFDQuery;
    qryInserePgmtoWallet: TFDQuery;
    qryVerificaPgmtoJaLancado: TFDQuery;
    qryUpdateProcessoSDA: TFDQuery;
    qryDespachanteNM_DESPACHANTE: TStringField;
    qryDespachanteNR_REGISTRO: TStringField;
    qryDespachanteCPF_DESPACHANTE: TStringField;
    qryDespachanteDS_SENHA_SDA: TStringField;
    qryDespachanteCPF_FORMATADO: TStringField;
    qryDespachanteDS_SENHA_SDA_RJ: TStringField;
    qryDespachanteNR_REGISTRO_RJ: TStringField;
    qryVerificaPgmtoJaLancadoID: TLargeintField;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    function GetSqlDadosSDA(TipoFiltro : String) : String;
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
                        AAnexos: TStringArray): Boolean;
    function AtualizaProcessoSDA(nr_processo : string) : boolean;
    function VerificarPgmtoWalletJaLancado(nr_processo : string ;ValorDebito : double) : boolean;
    function LancarPgmtoWallet(nr_processo : string ;ValorDebito : double) : boolean;
    procedure PegarDadosSDA(nr_processo : string; Var ValorSDA : Double; var Despachante, EmailUsuario , Empresa: String);
    procedure ProcessarSDABroker(Arquivo : String);
    Const
    FILIAL_SANTOS = '01';
    FILIAL_RIO    = '02';
  end;

var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Utils, Settings, uProcessaSDA, GravaArquivoDigitalizacao;

{$R *.dfm}

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
end;

procedure TdmdBroker.DataModuleCreate(Sender: TObject);
begin
  Try
    dbBroker.Connected := true;
  except on e:exception do
    Log(E.Message, nil);
  End;
end;

function TdmdBroker.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray;
   AAssunto, ACorpo: String; AAnexos: TStringArray): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
begin
  IdSMTP1.Disconnect;
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

function TdmdBroker.GetSqlDadosSDA(TipoFiltro : String) : String;
var ssql : string;
begin
    //TipoFiltro = PROCESSO, DESPACHANTE
  ssql :=
    '  DECLARE @CD_DESPACHANTE CHAR(18)                                                                                         ' + sLineBreak +
    '  SET @CD_DESPACHANTE = :CD_DESPACHANTE                                                                                    ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  DECLARE @NR_PROCESSO CHAR(18)                                                                                            ' + sLineBreak +
    '  SET @NR_PROCESSO = :NR_PROCESSO                                                                                          ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  DECLARE @CD_UNID_NEG CHAR(2)                                                                                             ' + sLineBreak +
    '  SET @CD_UNID_NEG = :CD_UNID_NEG                                                                                          ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  SELECT TOP 10  *                                                                                                         ' + sLineBreak +
    '    FROM (                                                                                                                 ' + sLineBreak +
    '  SELECT    TOP 10                                                                                                         ' + sLineBreak +
    '   SD.CD_DESPACHANTE                       AS CD_DESPACHANTE,                                                              ' + sLineBreak +
    '   D.NM_DESPACHANTE                        AS NM_DESPACHANTE,                                                              ' + sLineBreak +
    '   D.CPF_DESPACHANTE                       AS CPF_DESPACHANTE,                                                             ' + sLineBreak +
    '   LTRIM(RTRIM(D.NR_REGISTRO))             AS NR_REGISTRO,                                                                 ' + sLineBreak +
    '   LTRIM(RTRIM(D.NR_REGISTRO_RJ))          AS NR_REGISTRO_RJ,                                                              ' + sLineBreak +
    '   P.NR_PROCESSO                           AS NR_PROCESSO,                                                                 ' + sLineBreak +
    '   RTRIM(SUBSTRING(P.NR_PROCESSO, 5, 14))  AS NR_PROCESSO_FORMATADO,                                                       ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  (SELECT TOP 1 dbo.REMOVE_CHAR_ESPECIAL(CD_REFERENCIA,0)                                                                  ' + sLineBreak +
    '     FROM TREF_CLIENTE R (NOLOCK)                                                                                          ' + sLineBreak +
    '    WHERE NR_PROCESSO = P.NR_PROCESSO)   AS REFERENCIA,                                                                    ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN DI.NR_DECLARACAO_IMP IS NOT NULL                                                                              ' + sLineBreak +
    '        THEN  SUBSTRING(DI.NR_DECLARACAO_IMP, 1,2) + ''/'' +                                                               ' + sLineBreak +
    '              SUBSTRING(DI.NR_DECLARACAO_IMP, 3,7) + ''-'' +                                                               ' + sLineBreak +
    '              SUBSTRING(DI.NR_DECLARACAO_IMP, 10,1)                                                                        ' + sLineBreak +
    '        ELSE  SUBSTRING(P.NR_DI, 1,2) + ''/'' +                                                                            ' + sLineBreak +
    '              SUBSTRING(P.NR_DI, 3,7) + ''-'' +                                                                            ' + sLineBreak +
    '              SUBSTRING(P.NR_DI, 10,1)                                                                                     ' + sLineBreak +
    '   END  AS NR_DECLARACAO,                                                                                                  ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN DI.DT_CHEGADA_CARGA IS NOT NULL                                                                               ' + sLineBreak +
    '        THEN  SUBSTRING(DI.DT_CHEGADA_CARGA, 1,2) + ''/'' +                                                                ' + sLineBreak +
    '              SUBSTRING(DI.DT_CHEGADA_CARGA, 3,2) + ''/'' +                                                                ' + sLineBreak +
    '              SUBSTRING(DI.DT_CHEGADA_CARGA, 5,4)                                                                          ' + sLineBreak +
    '   	   ELSE  CONVERT(VARCHAR(20),E162.DT_REALIZACAO,103)                                                                  ' + sLineBreak +
    '   END AS DT_CHEGADA_CARGA ,                                                                                               ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.NM_EMPRESA,0)  AS NM_EMPRESA,                                                                ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.END_EMPRESA,0) AS END_EMPRESA,                                                               ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.END_CIDADE,0)  AS END_CIDADE,                                                                ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.END_BAIRRO,0)  AS END_BAIRRO,                                                                ' + sLineBreak +
    '   E.END_CEP                                 AS END_CEP,                                                                   ' + sLineBreak +
    '   E.END_UF                                  AS END_UF,                                                                    ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN E.CD_TIPO_PESSOA = ''1''                                                                                      ' + sLineBreak +
    '        THEN CGC_EMPRESA                                                                                                   ' + sLineBreak +
    '        ELSE CPF_EMPRESA                                                                                                   ' + sLineBreak +
    '   END AS CGC_EMPRESA,                                                                                                     ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN E.CD_TIPO_PESSOA = ''1''                                                                                      ' + sLineBreak +
    '        THEN ''CNPJ''                                                                                                      ' + sLineBreak +
    '        ELSE ''CPF''                                                                                                       ' + sLineBreak +
    '   END AS TIPO_PESSOA,                                                                                                     ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   ''CIF''  AS FOB_CIF,                                                                                                    ' + sLineBreak +
    '   ''X''    AS IMPO,                                                                                                       ' + sLineBreak +
    '   '' ''    AS EXPO,                                                                                                       ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN ISNULL( PARAMS.VL_TX_CONTR_SOCIAL_SDA, 0 )  > 0                                                               ' + sLineBreak +
    '        AND IN_COMP_SDA = ''1''                                                                                            ' + sLineBreak +
    '        THEN ''COMPL. CONT. SOCIAL''                                                                                       ' + sLineBreak +
    '        ELSE ''''                                                                                                          ' + sLineBreak +
    '   END AS TX_CONT_SOCIAL,                                                                                                  ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN ISNULL( PARAMS.VL_TX_CONTR_SOCIAL_SDA, 0 )  > 0                                                               ' + sLineBreak +
    '         AND IN_COMP_SDA = ''1''                                                                                           ' + sLineBreak +
    '        THEN REPLICATE('' '', 51) + ''COMPL. CONT. SOCIAL '' + REPLICATE('' '', 3) +                                       ' + sLineBreak +
    '             REPLACE(CONVERT(VARCHAR(20), CONVERT(NUMERIC(15,2),ISNULL(PARAMS.VL_TX_CONTR_SOCIAL_SDA, 0 ))) ,''.'', '','') ' + sLineBreak +
    '             + CHAR(13) + CHAR(10)                                                                                         ' + sLineBreak +
    '        ELSE ''''                                                                                                          ' + sLineBreak +
    '   END AS TX_CONT_SOCIAL_VALOR,                                                                                            ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE SE.CD_VIA_TRANSPORTE                                                                                               ' + sLineBreak +
    '        WHEN ''01'' THEN ISNULL(NM_EMBARCACAO, '''') +'' ''+ ISNULL(NR_VIAGEM, '''')                                       ' + sLineBreak +
    '        WHEN ''04'' THEN ISNULL(NR_VOO, '''')                                                                              ' + sLineBreak +
    '        WHEN ''07'' THEN (SELECT LTRIM(RTRIM(ISNULL(NM_TRANSP_ROD,'''')))                                                  ' + sLineBreak +
    '                            FROM TTRANSP_ROD (NOLOCK) WHERE CD_TRANSP_ROD = P.CD_TRANSP_NAC)                               ' + sLineBreak +
    '        ELSE ''''                                                                                                          ' + sLineBreak +
    '   END   AS DS_VEICULO,                                                                                                    ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   (CONVERT(NUMERIC(15,2),                                                                                                 ' + sLineBreak +
    '   CASE WHEN IN_COMP_SDA = ''1''                                                                                           ' + sLineBreak +
    '        THEN SD.VL_SDA + SD.VL_CONTR_ASSIST + SD.VL_COMPL                                                                  ' + sLineBreak +
    '        ELSE SD.VL_SDA + SD.VL_CONTR_ASSIST                                                                                ' + sLineBreak +
    '   END ))  AS VL_SDA,                                                                                                      ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   ''I''                   AS TIPO_GUIA,                                                                                   ' + sLineBreak +
    '   P.NR_CONHECIMENTO       AS NR_CONHECIMENTO,                                                                             ' + sLineBreak +
    '   CASE P.CD_UNID_NEG                                                                                                      ' + sLineBreak +
    '        WHEN ''01''THEN ''001''                                                                                            ' + sLineBreak +
    '        WHEN ''02''THEN ''341''                                                                                            ' + sLineBreak +
    '   END                     AS BANCO,                                                                                       ' + sLineBreak +
    '   E.AP_EMPRESA,                                                                                                           ' + sLineBreak +
    '   U.NM_EMAIL              AS EMAIL_EMISSOR                                                                                ' + sLineBreak +
    '  ,CONVERT(VARCHAR(20),DATEADD(DAY, 10,GETDATE()),23) AS VENCIMENTO_RJ                                                     ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  FROM TPROCESSO                    P  (NOLOCK)                                                                            ' + sLineBreak +
    '  JOIN TPROCESSO_SDA                SD (NOLOCK) ON SD.NR_PROCESSO   = P.NR_PROCESSO                                        ' + sLineBreak +
    '  JOIN TDESPACHANTE                 D  (NOLOCK) ON D.CD_DESPACHANTE = SD.CD_DESPACHANTE                                    ' + sLineBreak +
    '  LEFT JOIN TDECLARACAO_IMPORTACAO  DI (NOLOCK) ON DI.NR_PROCESSO   = P.NR_PROCESSO                                        ' + sLineBreak +
    '  JOIN TEMPRESA_NAC                 E  (NOLOCK) ON E.CD_EMPRESA     = P.CD_CLIENTE                                         ' + sLineBreak +
    '  JOIN TCLIENTE_HABILITACAO         H  (NOLOCK) ON H.CD_UNID_NEG    = P.CD_UNID_NEG                                        ' + sLineBreak +
    '                                               AND H.CD_PRODUTO     = P.CD_PRODUTO                                         ' + sLineBreak +
    '                                               AND H.CD_CLIENTE     = P.CD_CLIENTE                                         ' + sLineBreak +
    '  JOIN VW_SERVICO_GERAL             SE (NOLOCK) ON SE.CD_SERVICO    = P.CD_SERVICO                                         ' + sLineBreak +
    '  LEFT                                                                                                                     ' + sLineBreak +
    '  JOIN TEMBARCACAO                  EM (NOLOCK) ON EM.CD_EMBARCACAO = P.CD_EMBARCACAO                                      ' + sLineBreak +
    '  LEFT                                                                                                                     ' + sLineBreak +
    '  JOIN TUSUARIO                     U  (NOLOCK) ON U.CD_USUARIO     = CASE WHEN ISNULL(SD.CD_EMISSOR, '''') <> ''''        ' + sLineBreak +
    '                                                                           THEN SD.CD_EMISSOR                              ' + sLineBreak +
    '                                                                           ELSE SD.CD_USUARIO_EMITE                        ' + sLineBreak +
    '                                                                      END                                                  ' + sLineBreak +
    '  LEFT JOIN TFOLLOWUP               E162 (NOLOCK) ON E162.NR_PROCESSO = P.NR_PROCESSO                                      ' + sLineBreak +
    '                                                 AND E162.CD_EVENTO   = ''162''                                            ' + sLineBreak ;
    if TipoFiltro = 'DESPACHANTE' then
      ssql := ssql +
    '  OUTER APPLY ( SELECT DBO.FN_PGMTO_SDA_LANCADO(P.NR_PROCESSO, 0) AS ID  ) PAG                                             ' + sLineBreak ;

      ssql := ssql +
    '   ,TPARAMETROS PARAMS(NOLOCK)                                                                                             ' + sLineBreak +
    '  WHERE P.CD_PRODUTO   = ''01''                                                                                            ' + sLineBreak +
    '    AND P.CD_UNID_NEG  = @CD_UNID_NEG                                                                                      ' + sLineBreak +
    '    AND P.DT_ABERTURA >= ''2017/01/01''                                                                                    ' + sLineBreak +
    '    AND SD.DT_EMISSAO <= DATEADD(MINUTE, -2 , GETDATE())                                                                   ' + sLineBreak + {TENTANDO EVITAR ERROS. ESSE CAMPO É PREENCHIDO COM A DATA ATUAL QUANDO A PESSOA SELECIONAR O PROCESSO NO MYINDAIA. ESPERA 2 MIN PRA PROCESSAR}
    '    AND P.IN_CANCELADO = ''0''                                                                                             ' + sLineBreak +
    '    AND P.IN_LIBERADO  = ''1''                                                                                             ' + sLineBreak ;
    if TipoFiltro = 'DESPACHANTE' then
      ssql := ssql +
    '    AND (PAG.ID IS NULL)                                                                                                   ' + sLineBreak ;

    if TipoFiltro = 'DESPACHANTE' then
      ssql := ssql +
    '    AND SD.CD_DESPACHANTE = @CD_DESPACHANTE  AND SD.IN_EMITE    = ''1''                                                    ' + sLineBreak ;

   if TipoFiltro = 'PROCESSO' then
      ssql := ssql +
    '    AND P.NR_PROCESSO = @NR_PROCESSO                                                                                       ' + sLineBreak ;

      ssql := ssql +
    '  UNION ALL                                                                                                                ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  SELECT  TOP 10                                                                                                           ' + sLineBreak +
    '   SD.CD_DESPACHANTE                       AS CD_DESPACHANTE,                                                              ' + sLineBreak +
    '   D.NM_DESPACHANTE                        AS NM_DESPACHANTE,                                                              ' + sLineBreak +
    '   D.CPF_DESPACHANTE                       AS CPF_DESPACHANTE,                                                             ' + sLineBreak +
    '   LTRIM(RTRIM(D.NR_REGISTRO))             AS NR_REGISTRO,                                                                 ' + sLineBreak +
    '   LTRIM(RTRIM(D.NR_REGISTRO_RJ))          AS NR_REGISTRO_RJ,                                                              ' + sLineBreak +
    '   P.NR_PROCESSO                           AS NR_PROCESSO,                                                                 ' + sLineBreak +
    '   RTRIM(SUBSTRING(P.NR_PROCESSO, 5, 14))  AS NR_PROCESSO_FORMATADO,                                                       ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  (SELECT TOP 1 dbo.REMOVE_CHAR_ESPECIAL(CD_REFERENCIA,0)                                                                  ' + sLineBreak +
    '     FROM TREF_CLIENTE R (NOLOCK)                                                                                          ' + sLineBreak +
    '    WHERE NR_PROCESSO = P.NR_PROCESSO) AS REFERENCIA,                                                                      ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   SUBSTRING(EX.NR_SD, 1,10) + ''-'' +                                                                                     ' + sLineBreak +
    '   SUBSTRING(EX.NR_SD, 11,1)  AS NR_DECLARACAO,                                                                            ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   '''' AS DT_CHEGADA_CARGA ,                                                                                              ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.NM_EMPRESA,0)  AS NM_EMPRESA,                                                                ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.END_EMPRESA,0) AS END_EMPRESA,                                                               ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.END_CIDADE,0)  AS END_CIDADE,                                                                ' + sLineBreak +
    '   dbo.REMOVE_CHAR_ESPECIAL(E.END_BAIRRO,0)  AS END_BAIRRO,                                                                ' + sLineBreak +
    '   E.END_CEP     AS END_CEP,                                                                                               ' + sLineBreak +
    '   E.END_UF      AS END_UF,                                                                                                ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN E.CD_TIPO_PESSOA = ''1''                                                                                      ' + sLineBreak +
    '        THEN CGC_EMPRESA                                                                                                   ' + sLineBreak +
    '        ELSE CPF_EMPRESA                                                                                                   ' + sLineBreak +
    '   END AS CGC_EMPRESA,                                                                                                     ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN E.CD_TIPO_PESSOA = ''1''                                                                                      ' + sLineBreak +
    '        THEN ''CNPJ''                                                                                                      ' + sLineBreak +
    '        ELSE ''CPF''                                                                                                       ' + sLineBreak +
    '   END AS TIPO_PESSOA,                                                                                                     ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   ''CIF''  AS FOB_CIF,                                                                                                    ' + sLineBreak +
    '   '' ''    AS IMPO,                                                                                                       ' + sLineBreak +
    '   ''X''    AS EXPO,                                                                                                       ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN ISNULL( PARAMS.VL_TX_CONTR_SOCIAL_SDA, 0 )  > 0                                                               ' + sLineBreak +
    '        AND IN_COMP_SDA = ''1''                                                                                            ' + sLineBreak +
    '        THEN ''COMPL. CONT. SOCIAL''                                                                                       ' + sLineBreak +
    '        ELSE ''''                                                                                                          ' + sLineBreak +
    '   END AS TX_CONT_SOCIAL,                                                                                                  ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE WHEN ISNULL( PARAMS.VL_TX_CONTR_SOCIAL_SDA, 0 )  > 0                                                               ' + sLineBreak +
    '         AND IN_COMP_SDA = ''1''                                                                                           ' + sLineBreak +
    '        THEN REPLICATE('' '', 51) + ''COMPL. CONT. SOCIAL '' + REPLICATE('' '', 3) +                                       ' + sLineBreak +
    '             REPLACE(CONVERT(VARCHAR(20), CONVERT(NUMERIC(15,2),ISNULL(PARAMS.VL_TX_CONTR_SOCIAL_SDA, 0 ))) ,''.'', '','') ' + sLineBreak +
    '             + CHAR(13) + CHAR(10)                                                                                         ' + sLineBreak +
    '        ELSE ''''                                                                                                          ' + sLineBreak +
    '   END AS TX_CONT_SOCIAL_VALOR,                                                                                            ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   CASE SE.CD_VIA_TRANSPORTE                                                                                               ' + sLineBreak +
    '        WHEN ''01'' THEN ISNULL(NM_EMBARCACAO, '''') +'' ''+ ISNULL(NR_VIAGEM, '''')                                       ' + sLineBreak +
    '        WHEN ''04'' THEN ISNULL(NR_VOO, '''')                                                                              ' + sLineBreak +
    '        WHEN ''07'' THEN (SELECT LTRIM(RTRIM(ISNULL(NM_TRANSP_ROD,''''))) FROM TTRANSP_ROD (NOLOCK)                        ' + sLineBreak +
    '                           WHERE CD_TRANSP_ROD = P.CD_TRANSP_NAC)                                                          ' + sLineBreak +
    '        ELSE ''''                                                                                                          ' + sLineBreak +
    '   END   AS DS_VEICULO,                                                                                                    ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   (CONVERT(NUMERIC(15,2),                                                                                                 ' + sLineBreak +
    '   CASE WHEN IN_COMP_SDA = ''1''                                                                                           ' + sLineBreak +
    '        THEN SD.VL_SDA + SD.VL_CONTR_ASSIST + SD.VL_COMPL                                                                  ' + sLineBreak +
    '        ELSE SD.VL_SDA + SD.VL_CONTR_ASSIST                                                                                ' + sLineBreak +
    '   END ))                                                                                                                  ' + sLineBreak +
    '   AS VL_SDA,                                                                                                              ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '   ''E''                   AS TIPO_GUIA,                                                                                   ' + sLineBreak +
    '   P.NR_CONHECIMENTO       AS NR_CONHECIMENTO,                                                                             ' + sLineBreak +
    '   CASE P.CD_UNID_NEG                                                                                                      ' + sLineBreak +
    '        WHEN ''01''THEN ''001''                                                                                            ' + sLineBreak +
    '        WHEN ''02''THEN ''341''                                                                                            ' + sLineBreak +
    '   END                     AS BANCO,                                                                                       ' + sLineBreak +
    '   E.AP_EMPRESA,                                                                                                           ' + sLineBreak +
    '   U.NM_EMAIL              AS EMAIL_EMISSOR                                                                                ' + sLineBreak +
    '  ,CONVERT(VARCHAR(20),DATEADD(DAY, 10,GETDATE()),23) AS VENCIMENTO_RJ                                                     ' + sLineBreak +
    '                                                                                                                           ' + sLineBreak +
    '  FROM TPROCESSO                  P  (NOLOCK)                                                                              ' + sLineBreak +
    '  JOIN TPROCESSO_SDA              SD (NOLOCK) ON SD.NR_PROCESSO   = P.NR_PROCESSO                                          ' + sLineBreak +
    '  JOIN TDESPACHANTE               D  (NOLOCK) ON D.CD_DESPACHANTE = SD.CD_DESPACHANTE                                      ' + sLineBreak +
    '  JOIN TEMPRESA_NAC               E  (NOLOCK) ON E.CD_EMPRESA     = P.CD_CLIENTE                                           ' + sLineBreak +
    '  JOIN TCLIENTE_HABILITACAO       H  (NOLOCK) ON H.CD_UNID_NEG    = P.CD_UNID_NEG                                          ' + sLineBreak +
    '                                             AND H.CD_PRODUTO     = P.CD_PRODUTO                                           ' + sLineBreak +
    '                                             AND H.CD_CLIENTE     = P.CD_CLIENTE                                           ' + sLineBreak +
    '  JOIN VW_SERVICO_GERAL           SE (NOLOCK) ON SE.CD_SERVICO    = P.CD_SERVICO                                           ' + sLineBreak +
    '  LEFT                                                                                                                     ' + sLineBreak +
    '  JOIN TEMBARCACAO                EM (NOLOCK) ON EM.CD_EMBARCACAO = P.CD_EMBARCACAO                                        ' + sLineBreak +
    '  LEFT                                                                                                                     ' + sLineBreak +
    '  JOIN TPROCESSO_EXP              EX (NOLOCK) ON EX.NR_PROCESSO   = P.NR_PROCESSO                                          ' + sLineBreak +
    '  LEFT                                                                                                                     ' + sLineBreak +
    '  JOIN TUSUARIO                   U  (NOLOCK) ON U.CD_USUARIO     = CASE WHEN ISNULL(SD.CD_EMISSOR, '''') <> ''''          ' + sLineBreak +
    '                                                                         THEN SD.CD_EMISSOR                                ' + sLineBreak +
    '                                                                         ELSE SD.CD_USUARIO_EMITE                          ' + sLineBreak +
    '                                                                    END                                                    ' + sLineBreak ;
    if TipoFiltro = 'DESPACHANTE' then
      ssql := ssql +
    '  OUTER APPLY ( SELECT DBO.FN_PGMTO_SDA_LANCADO(P.NR_PROCESSO, 0) AS ID  ) PAG                                             ' + sLineBreak ;

      ssql := ssql +
    '   ,TPARAMETROS PARAMS(NOLOCK)                                                                                             ' + sLineBreak +
    '  WHERE P.CD_PRODUTO   = ''02''                                                                                            ' + sLineBreak +
    '    AND P.CD_UNID_NEG  = @CD_UNID_NEG                                                                                      ' + sLineBreak +
    '    AND P.DT_ABERTURA >= ''2017/01/01''                                                                                    ' + sLineBreak +
    '    AND SD.DT_EMISSAO <= DATEADD(MINUTE, -2 , GETDATE())                                                                   ' + sLineBreak + {TENTANDO EVITAR ERROS. ESSE CAMPO É PREENCHIDO COM A DATA ATUAL QUANDO A PESSOA SELECIONAR O PROCESSO NO MYINDAIA. ESPERA 2 MIN PRA PROCESSAR}
    '    AND P.IN_CANCELADO = ''0''                                                                                             ' + sLineBreak +
    '    AND P.IN_LIBERADO  = ''1''                                                                                             ' + sLineBreak ;

    if TipoFiltro = 'DESPACHANTE' then
      ssql := ssql +
    '    AND (PAG.ID IS NULL)                                                                                                   ' + sLineBreak ;

    if TipoFiltro = 'DESPACHANTE' then
      ssql := ssql +
    '    AND SD.CD_DESPACHANTE = @CD_DESPACHANTE  AND SD.IN_EMITE    = ''1''                                                    ' + sLineBreak ;

   if TipoFiltro = 'PROCESSO' then
      ssql := ssql +
    '    AND P.NR_PROCESSO = @NR_PROCESSO                                                                                       ' + sLineBreak ;

      ssql := ssql +
    '    ORDER BY E.AP_EMPRESA, P.NR_PROCESSO                                                                                   ' + sLineBreak +
    '    )DADOS                                                                                                                 ' + sLineBreak ;

    result :=ssql;
end;

function TdmdBroker.AtualizaProcessoSDA(nr_processo : string) : boolean;
begin
 try
    result := false;
    dmdBroker.qryUpdateProcessoSDA.Close;
    dmdBroker.qryUpdateProcessoSDA.ParamByName('NR_PROCESSO').Value  := Nr_Processo;
    dmdBroker.qryUpdateProcessoSDA.ExecSQL;
    if dmdBroker.qryUpdateProcessoSDA.RowsAffected > 0 then
      result :=  true;
 finally
    dmdBroker.qryUpdateProcessoSDA.Close;
 end;
end;

procedure TdmdBroker.PegarDadosSDA(nr_processo : string; Var ValorSDA : Double; var Despachante, EmailUsuario , Empresa: String);
begin
  dmdBroker.qryDadosSDA.Close;
  dmdBroker.qryDadosSDA.Sql.Text := dmdBroker.GetSqlDadosSDA('PROCESSO');
  dmdBroker.qryDadosSDA.ParamByName('CD_DESPACHANTE').AsString := '';
  dmdBroker.qryDadosSDA.ParamByName('NR_PROCESSO').AsString    := nr_processo;
  dmdBroker.qryDadosSDA.ParamByName('CD_UNID_NEG').AsString    := copy(nr_processo, 1,2);
  dmdBroker.qryDadosSDA.Prepare;
  dmdBroker.qryDadosSDA.Open;

  Despachante  := dmdBroker.qryDadosSDA.FieldByName('CD_DESPACHANTE').asString + ' '+ dmdBroker.qryDadosSDA.FieldByName('NM_DESPACHANTE').asString;
  ValorSDA     := dmdBroker.qryDadosSDA.FieldByName('VL_SDA').asFloat;
  EmailUsuario := dmdBroker.qryDadosSDA.FieldByName('EMAIL_EMISSOR').asString;
  Empresa      := dmdBroker.qryDadosSDA.FieldByName('NM_EMPRESA').asString;

  dmdBroker.qryDadosSDA.close;
  dmdBroker.qryDadosSDA.unPrepare;
end;

function TdmdBroker.LancarPgmtoWallet(nr_processo : string ;ValorDebito : double) : boolean;
begin
 try
    result := false;
    dmdBroker.qryInserePgmtoWallet.Close;
    dmdBroker.qryInserePgmtoWallet.ParamByName('NR_PROCESSO').Value  := Nr_Processo;
    dmdBroker.qryInserePgmtoWallet.ParamByName('VALOR_DEBITO').Value := ValorDebito;
    dmdBroker.qryInserePgmtoWallet.open;
    if not dmdBroker.qryInserePgmtoWallet.IsEmpty then
      result :=  dmdBroker.qryInserePgmtoWallet.FieldByName('RESULTADO').AsString = 'OK';
 finally
    dmdBroker.qryInserePgmtoWallet.Close;
 end;
end;

function TdmdBroker.VerificarPgmtoWalletJaLancado(nr_processo : string ;ValorDebito : double) : boolean;
begin
 try
    dmdBroker.qryVerificaPgmtoJaLancado.Close;
    dmdBroker.qryVerificaPgmtoJaLancado.ParamByName('NR_PROCESSO').Value  := Nr_Processo;
    dmdBroker.qryVerificaPgmtoJaLancado.ParamByName('VALOR_DEBITO').Value := ValorDebito;
    dmdBroker.qryVerificaPgmtoJaLancado.open;
    if dmdBroker.qryVerificaPgmtoJaLancado.IsEmpty then
      result := false //não ta lançado
    else
      result := (trim(qryVerificaPgmtoJaLancadoID.AsString) <> ''); // se o campo vier preenchido, ta criado
 finally
    dmdBroker.qryVerificaPgmtoJaLancado.Close;
 end;
end;
procedure TdmdBroker.ProcessarSDABroker(Arquivo : String);
var
valorSDA : double;
NrProcesso, ResultadoDigitalizacao, sdespachante, emailusuario, sEmpresa: String;
podedigitalizar : boolean;
begin
  NrProcesso := Copy(ExtractFileName(Arquivo) , 1, pos('_',ExtractFileName(Arquivo))-1);
  if copy(NrProcesso,1,1) <> '0' then
    NrProcesso := copy(NrProcesso, 2, length(NrProcesso)-1);

  dmdBroker.PegarDadosSDA(NrProcesso, valorSDA, sdespachante, emailusuario, sEmpresa );
  if (valorSDA = 0) or (trim(sdespachante) = '') or (trim(emailusuario) = '') then
  begin
    log('Erro ao consultar dados do processo', frmProcessaSDA.logar);
    abort;
  end;

  {$region 'lançar no wallet'}
  if not dmdBroker.VerificarPgmtoWalletJaLancado(NrProcesso,valorSDA) then
  begin
    log('Lançando no wallet', frmProcessaSDA.logar);
    if dmdBroker.LancarPgmtoWallet(NrProcesso,valorSDA) then
      podedigitalizar := true
    else
    begin
      podedigitalizar := false;
      log('Erro ao lançar no wallet.', frmProcessaSDA.logar);
    end;
  end
  else
  begin
    podedigitalizar := true;
    log('Já lançado no wallet.', frmProcessaSDA.logar);
  end;
  {$endregion}

  {$region 'digitalizar'}
  //podedigitalizar :=false;
  if podedigitalizar then
  begin
    copyfile(PChar(Arquivo), PChar(frmProcessaSDA.PastaArquivosGuiasProcessadas + ExtractFileName(Arquivo)), false);
    ResultadoDigitalizacao := GravaArquivo(dmdBroker.dbBroker,Arquivo,NrProcesso, 'Boleto SDA', 76);

    //será processado na proxima integração
     if AnsiContainsStr(ResultadoDigitalizacao, 'não') then
      DeleteFile(PChar(frmProcessaSDA.PastaArquivosGuiasProcessadas + ExtractFileName(Arquivo)));

    log('Processo: ' + NrProcesso + '  ' + ResultadoDigitalizacao, frmProcessaSDA.logar);
  end;
  {$endregion}
end;

end.
