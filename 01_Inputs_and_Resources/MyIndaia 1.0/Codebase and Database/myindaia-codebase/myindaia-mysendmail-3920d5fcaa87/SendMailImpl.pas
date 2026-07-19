unit SendMailImpl;

interface

uses System.SysUtils, SendMailIntf,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdMessage, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdText, IdAttachmentFile;

type
  TMail = class(TInterfacedObject, IMail)
  private
    FHost: WideString;
    FUsername: WideString;
    FPassword: WideString;
    FPort: Integer;
    FSSL: Boolean;
    procedure GaranteConfiguracao;
  public
    function Eco(const Eco: WideString): WideString;
    procedure SetConfig(const Host, Username, Password: WideString; Port: Integer; SSL: Boolean);
    function Send(const From, Recipeients, CCList, BccList, Subject, Body: WideString; Attachment: array of WideString): Boolean;
  end;

implementation

uses FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

{ TMail }

function TMail.Eco(const Eco: WideString): WideString;
begin
  Result := Eco;
end;

procedure TMail.GaranteConfiguracao;
var
  C: TFDConnection;
  Q: TFDQuery;
begin
  if FHost = '' then
  begin
    C := TFDConnection.Create(nil);
    Q := TFDQuery.Create(nil);
    try
      C.ConnectionName := 'Broker';
      C.Params.Values['Database'] := 'Broker';
      C.Params.Values['User_Name'] := 'sa';
      C.Params.Values['Password'] := '123';
      C.Params.Values['Server'] := 'INDAIA10';
      C.Params.Values['DriverID'] := 'MSSQL';
      C.LoginPrompt := False;
      Q.Connection := C;
      Q.Open('SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA, EMAIL_TLS FROM VW_CONFIG_MAIL ( NOLOCK )');
      FHost := Trim(Q.FieldByName('NM_HOST').AsString);
      FUsername := Trim(Q.FieldByName('NM_LOGIN').AsString);
      FPassword := Trim(Q.FieldByName('NM_SENHA').AsString);
      FPort := Q.FieldByName('NR_PORTA').AsInteger;
      FSSL := Q.FieldByName('EMAIL_TLS').AsBoolean;
    finally
      Q.Free;
      C.Free;
    end;
  end;
end;

function TMail.Send(const From, Recipeients, CCList, BccList, Subject, Body: WideString; Attachment: array of WideString): Boolean;
var
  IdMessage: TIdMessage;
  IdSMTP: TIdSMTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  NewText : TIdText;
  I: Integer;
begin
  Result := False;
  GaranteConfiguracao;
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    IdSMTP.Host     := FHost;
    IdSMTP.Port     := FPort;
    IdSMTP.Username := FUsername;
    IdSMTP.Password := FPassword;

    IdSSL.SSLOptions.Mode := sslmClient;
    IdSSL.SSLOptions.Method := sslvTLSv1_2;
    IdSSL.Port := 587;

    if FSSL then
    begin
      IdSMTP.IOHandler := IdSSL;
      IdSMTP.UseTLS := utUseExplicitTLS;
    end
    else
    begin
      IdSMTP.IOHandler := nil;
      IdSMTP.UseTLS := utNoTLSSupport;
    end;
    IdMessage.Clear;
    NewText := TIdText.Create(IdMessage.MessageParts);
    try
      NewText.ContentType:='text/html';
      for I := Low(Attachment) to High(Attachment) do
      if FileExists(Attachment[I]) then
          TIdAttachmentFile.Create(IdMessage.MessageParts, Attachment[I]);
      NewText.Body.Add('<html>');
      NewText.Body.Add('<body>');
      NewText.Body.Add(Body);
      NewText.Body.Add('<br>');
      NewText.Body.Add('<br>');
      NewText.Body.Add('</body>');
      NewText.Body.Add('</html>');
      IdMessage.From.Address := From;
      IdMessage.Recipients.EMailAddresses := Recipeients;
      IdMessage.CCList.EMailAddresses := CCList;
      IdMessage.BccList.EMailAddresses := BccList;
      IdMessage.Subject := Subject;
      IdSMTP.Connect;
      //IdSMTP.SendCmd('STARTTLS', 220);
      IdSMTP.Send(IdMessage);
      Result := True;
    finally
      FreeAndNil(NewText);
      IdSMTP.Disconnect;
      IdMessage.Clear;
    end;
  finally
    IdSMTP.Free;
    IdMessage.Free;
    IdSSL.Free;
  end;
end;

procedure TMail.SetConfig(const Host, Username, Password: WideString;
  Port: Integer; SSL: Boolean);
begin
  FHost := Host;
  FUsername := Username;
  FPassword := Password;
  FPort := Port;
  FSSL := SSL;
end;

end.
