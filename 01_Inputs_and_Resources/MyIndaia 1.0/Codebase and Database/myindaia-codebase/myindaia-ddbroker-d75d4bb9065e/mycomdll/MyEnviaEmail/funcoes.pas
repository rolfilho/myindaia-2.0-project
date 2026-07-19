unit funcoes;

interface

uses
  SysUtils, IdMessage, IdSMTP;

type
  TStringArray = array of String;

{ Envio de e-mail }
function EnviaEmailGeral(Host, Login, Senha: String; Porta: Integer;
    De, Para, Copia, Assunto, Anexo: String): Boolean;

implementation

{ Envio de e-mail }
function EnviaEmailGeral(Host, Login, Senha: String; Porta: Integer;
    De, Para, Copia, Assunto, Anexo: String): Boolean;
var
  idMessage1 : TIdMessage;
  idSMTP1 : TIdSMTP;
  I: Integer;
begin
  idMessage1 := TIdMessage.Create(nil);
  idSMTP1 := TIdSMTP.Create(nil);

  with idMessage1 do
  begin
    ContentType := 'text/html';
    Body.Text := '<html>'                                                           + #13 +
                 '    <body>'                                                       + #13 +
                 '        <font face = "Bitstream Vera Sans" size = 2>'             + #13 +
                 '            <br/>'                                                + #13 +
                 '            <p>'                                                  + #13 +
                 '                <i>Este é um email gerado automaticamente.</i>'   + #13 +
                 '            </p>'                                                 + #13 +
                 '        </font>'                                                  + #13 +
                 '    </body>'                                                      + #13 +
                 '</html>';

    From.Text := De;
    idMessage1.Recipients.Clear;
    idMessage1.Recipients.Add.Address := Para;
    Subject := Assunto;
  end;

  idSMTP1.AuthenticationType := atLogin;
  idSMTP1.Host := Host;
  idSMTP1.Port := Porta;
  idSMTP1.Username := Login;
  idSMTP1.Password := Senha;
  IdSMTP1.Connect;
  try
    try
      idSMTP1.Send(idMessage1);
      Result := True;
    except
      Result := False;
    end;
  finally
    idSMTP1.Disconnect;
    idMessage1.MessageParts.Clear;
    idMessage1.Clear;
    FreeAndNil(idMessage1);
    FreeAndNil(idSMTP1);
  end;
end;

end.
