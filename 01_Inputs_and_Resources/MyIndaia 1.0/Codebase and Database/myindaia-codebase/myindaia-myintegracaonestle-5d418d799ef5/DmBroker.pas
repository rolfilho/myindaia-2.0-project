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
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile, System.StrUtils;

type
  TStringArray = array of String;

  TdmdBroker = class(TDataModule)
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    qryBroker: TFDQuery;
    dbBroker: TFDConnection;
    qryTRAP: TFDQuery;
    qryTRAP_FORNECIMENTO: TFDQuery;
    qryTRAP_FORNECIMENTO_LOTE: TFDQuery;
    qryRetorno: TFDQuery;
    qryRetornoOrdem: TFDQuery;
    qryRetornoAdicao: TFDQuery;
    qryTINSTRUCAO_DESEMBARACO: TFDQuery;
    qryTINSTRUCAO_DESEMBARACO_PEDIDO: TFDQuery;
    qryTPO: TFDQuery;
    qryTPO_ITEM: TFDQuery;
    qryTemp: TFDQuery;
    qryTemp2: TFDQuery;
    qryProcesso: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    procedure ConfiguraConexao(const Servidor, Banco, Usuario, Senha: string);
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: TStringArray; AAssunto, ACorpo: String;
                        AAnexos: TStringArray): Boolean;


  end;

var
  dmdBroker: TdmdBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Utils, Settings, Main;

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

    IdSMTP1.Disconnect;
    IdSMTP1.Connect;

    try
      IdSMTP1.Send(IdMessage1);
      Result := True;
    except
      on E: Exception do
      begin
        IdSMTP1.Disconnect;
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

end.
