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
    qryFila: TFDQuery;
    qryUpdateNrNF: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    function GetSqlFila(QtRegistros : Integer) : string;
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
                        AAnexos: TStringArray): Boolean;
  end;
var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Utils, Settings;

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

function TdmdBroker.GetSqlFila(QtRegistros : Integer) : string;
begin
  result:=
    ' WITH DADOS AS(                                                                                                 ' + sLineBreak +
    '    SELECT DISTINCT TOP '+InttoStr(QtRegistros)+' CC.ID, CC.CUSTOMID AS NR_PROCESSO , B.CREATED                 ' + sLineBreak +
    '      FROM MYINDAIAV2.DBO.BILLING                  B	    (NOLOCK)                                               ' + sLineBreak +
    ' INNER JOIN MYINDAIAV2.DBO.BRANCH                  BRA   (NOLOCK) ON BRA.ID            = B.BRANCH_ID            ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED     BII   (NOLOCK) ON BII.BILLING_ID    = B.ID                   ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED             II    (NOLOCK) ON II.ID             = BII.ITENSINVOICED_ID   ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE          CC    (NOLOCK) ON CC.ID             = II.CUSTOMCLEARANCE_ID  ' + sLineBreak +
    ' LEFT JOIN MYINDAIAV2.DBO.BILLING_PAYMENTREQUESTED BPR   (NOLOCK) ON BPR.BILLING_ID    = B.ID			             ' + sLineBreak +
    ' LEFT JOIN SENIOR.SAPIENS.DBO.E140IDE          N     (NOLOCK) ON N.CODEMP          = 1                      ' + sLineBreak +
    '                                                                 AND N.CODFIL          = BRA.SENIORKEY          ' + sLineBreak +
    '                                                                 AND N.NUMNFV          = B.SENIORKEY            ' + sLineBreak +
    ' WHERE B.STATUS       = ''INVOICED''                                                                            ' + sLineBreak +
    '   AND B.TYPE         = ''TAX_INVOICE''                                                                         ' + sLineBreak +
    '   AND B.CREATED     >=''2018/01/01''                                                                           ' + sLineBreak +
    '   AND B.NR_NOTA IS NULL                                                                                        ' + sLineBreak +
    '   AND ISNULL(N.NUMDFS, 0) <> 0                                                                                 ' + sLineBreak +
    ' ORDER BY B.CREATED                                                                                             ' + sLineBreak +
    ' )                                                                                                              ' + sLineBreak +
    '                                                                                                                ' + sLineBreak +
    ' SELECT X.*,  DOC_155.NR_PROCESSO /*ISNULL(DOC_155.NR_PROCESSO,DOC_63.NR_PROCESSO)*/ AS DOC_DIGITALIZADO                                ' + sLineBreak +
    ' FROM DADOS X                                                                                                   ' + sLineBreak +
    '   OUTER APPLY (SELECT TOP 1 D.NR_PROCESSO                                                                      ' + sLineBreak +
    '                FROM TPROCESSO_DOCTOS D (NOLOCK)                                                                ' + sLineBreak +
    '               WHERE D.NR_PROCESSO = X.NR_PROCESSO                                                              ' + sLineBreak +
    '                 AND D.CD_TIPO_DOCTO = ''155''                                                                  ' + sLineBreak +
    '                 AND ISNULL(D.IN_ATIVO, ''1'') = ''1''                                                          ' + sLineBreak +
    '              ) DOC_155                                                                                         ' + sLineBreak +
    ' /*OUTER APPLY (SELECT TOP 1 D_.NR_PROCESSO                                                                       ' + sLineBreak +
    '                FROM TPROCESSO_DOCTOS D_ (NOLOCK)                                                               ' + sLineBreak +
    '               WHERE D_.NR_PROCESSO = X.NR_PROCESSO                                                             ' + sLineBreak +
    '                 AND D_.CD_TIPO_DOCTO = ''63''                                                                  ' + sLineBreak +
    '                 AND UPPER(D_.NM_DESCRICAO) LIKE ''%NOTA DE SERVIÇO%''                                          ' + sLineBreak +
    '                 AND ISNULL(D_.IN_ATIVO, ''1'') = ''1''                                                         ' + sLineBreak +
    '              ) DOC_63  */                                                                                      ' + sLineBreak +
    '                                                                                                                ' + sLineBreak ;
end;

end.
