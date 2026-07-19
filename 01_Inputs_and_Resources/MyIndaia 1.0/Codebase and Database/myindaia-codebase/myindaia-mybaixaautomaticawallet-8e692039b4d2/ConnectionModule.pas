unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Sql.Register,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Engine.ObjectManager,
  System.SysUtils, System.Classes, FireDac.Stan.Intf, FireDac.Stan.Option,
  FireDac.Stan.Error, FireDac.UI.Intf, FireDac.Phys.Intf, FireDac.Stan.Def,
  FireDac.Stan.Pool, FireDac.Stan.Async, FireDac.Phys, FireDac.VCLUI.Wait,
  Data.DB, FireDac.Comp.Client, FireDAC.DApt, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, MyUtil, MyEntitiesBroker, IdMessage, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdSMTP, IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile,
  StrUtils;

type
  TStringArray = array of String;

type
  TFireDacMSSQLConnection = class(TDataModule)
    Connection: TFDConnection;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    qryBroker: TFDQuery;
    qryUsuario: TFDQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    FDBConnection: IDBConnection;
    FDBConnectionFactory: IDBConnectionFactory;
    FObjectManager: TObjectManager;
  public
    sUsuarioEmail : string;
    SUsuarioProdutoPadrao : string;
    sUsuarioUnidadeNegPadrao : string;
    sUsuarioCargo: string;

    function DBConnection: IDBConnection;
    function DBConnectionFactory: IDBConnectionFactory;
    function ObjectManager: TObjectManager;
    procedure Configura(const Servidor, Banco, Usuario, Senha, DriveID: string);
    function ClienteBroker(nr_processo : string) : string;
    procedure AtualizaFollowUp(nr_processo : string; evento : String; dataRealizacao : TDateTime);
    function ValoresDIProcesso(nr_processo : string) : TVwResumoDi;
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
                        AAnexos: TStringArray): Boolean;
    procedure CarregaUsuario(userbroker : string);

  end;

function FireDacMSSQL: TFireDacMSSQLConnection;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses
  Aurelius.Drivers.Base, Generics.Collections, Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

{$R *.dfm}
{ TMyConnectionModule }

var
  Instance: TFireDacMSSQLConnection;

function FireDacMSSQL: TFireDacMSSQLConnection;
begin
  if not Assigned(Instance) then
  begin
    Instance := TFireDacMSSQLConnection.Create(nil);
    Instance.Connection.Params.Values['Server'] := ServerName;
    (TSQLGeneratorRegister.GetInstance.GetGenerator('MSSQL') as TMSSQLSQLGenerator).UseBoolean := True;
    Instance.CarregaUsuario('0707');

  end;
  Result := Instance;
end;

procedure TFireDacMSSQLConnection.Configura(const Servidor, Banco, Usuario, Senha, DriveID: string);
begin
  Connection.Params.Values['Server']    :=  Servidor;
  Connection.Params.Values['Database']  :=  Banco;
  Connection.Params.Values['User_Name'] :=  Usuario;
  Connection.Params.Values['Password']  :=  Senha;
  Connection.Params.Values['DriverID']  :=  DriveID;
end;

function TFireDacMSSQLConnection.DBConnection: IDBConnection;
begin
  if not Assigned(FDBConnection) then
    FDBConnection := TFireDacConnectionAdapter.Create(Connection, 'MSSQL',  Self);
  Result := FDBConnection;
end;

function TFireDacMSSQLConnection.DBConnectionFactory: IDBConnectionFactory;
begin
  if not Assigned(FDBConnectionFactory) then
    FDBConnectionFactory := TDBConnectionFactory.Create(
      function: IDBConnection
      begin
        Result := DBConnection;
      end);
  Result := FDBConnectionFactory;
end;

procedure TFireDacMSSQLConnection.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FObjectManager) then
    FObjectManager.Free;
end;

function TFireDacMSSQLConnection.ObjectManager: TObjectManager;
begin
  DBConnectionFactory;
  if not Assigned(FObjectManager) then
    FObjectManager := TObjectManager.Create(DBConnection);
  Result := FObjectManager;
end;

procedure TFireDacMSSQLConnection.CarregaUsuario(userbroker : string);
begin
  if userbroker = 'sa' then
    exit;
  try
    qryUsuario.close;
    qryUsuario.ParamByName('AP_USUARIO').Value := userbroker;
    qryUsuario.Open;
    if qryUsuario.RecordCount > 0 then
    begin
      sUsuarioEmail              := qryUsuario.FieldByName('NM_EMAIL').asstring;
      SUsuarioProdutoPadrao      := qryUsuario.FieldByName('CD_PRODUTO_PADRAO').asstring;
      sUsuarioUnidadeNegPadrao   := qryUsuario.FieldByName('CD_UNID_NEG_PADRAO').asstring;
      sUsuarioCargo              := qryUsuario.FieldByName('CD_CARGO').asstring;
    end;
  finally
    qryUsuario.close;
  end;
end;

function TFireDacMSSQLConnection.ValoresDIProcesso(nr_processo : string) : TVwResumoDi;
var valoresDi : TList<TVwResumoDi>;
i : integer;
begin
  valoresDi := ObjectManager.Find<TVwResumoDi>
              .Add(Linq.Eq('NrProcessoCompleto', nr_processo))
              .Refreshing
              .List;
  for I := 0 to valoresDi.Count-1 do
  begin
    result := valoresDi[i];
  end;
end;

function TFireDacMSSQLConnection.ClienteBroker(nr_processo : string) : string;
 var
  processoBroker: TList<TTprocesso>;
  i : integer;
begin
  processoBroker := ObjectManager.Find<TTprocesso>
     .Add(Linq.Eq('NrProcesso', nr_processo))
     .Refreshing
     .List;
  for I := 0 to processoBroker.Count-1 do
  begin
    result := processoBroker[i].cliente.CdEmpresa;
  end;
end;

procedure TFireDacMSSQLConnection.AtualizaFollowUp(nr_processo : string; evento : String; dataRealizacao : TDateTime);
 var
  processoBroker: TList<TTprocesso>;
  followUp : TList<TTfollowup> ;
  p, f : integer;
begin
  processoBroker := ObjectManager.Find<TTprocesso>
     .Add(Linq.Eq('NrProcesso', nr_processo))
     .Refreshing
     .List;
  for p := 0 to processoBroker.Count-1 do
  begin
    followUp := ObjectManager.Find<TTfollowup>
       .Add(Linq.Eq('NrProcesso', nr_processo))
       .Add(Linq.Eq('CdEvento', evento))
       .Refreshing
       .List;
    for f := 0 to followUp.Count-1 do
    begin
      followUp[f].DtRealizacao := dataRealizacao;
      ObjectManager.merge(followUp[f]);
      ObjectManager.Flush;
    end;
  end;
end;


function TFireDacMSSQLConnection.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray;
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
      IdMessage1.CCList.EMailAddresses     := ACopia[0];
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



initialization
  Instance := nil;

finalization
  if Assigned(Instance) then
    Instance.Free;

end.
