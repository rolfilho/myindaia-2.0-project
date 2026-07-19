program MyEnviaEmail;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  StrUtils,
  funcoes in '..\..\Envio de email\funcoes.pas';

var
  Host, Login, Senha: String;
  Porta: Integer;
  Para, Assunto, Mensagem: String;
  De: String;
  S: String;
  I: Integer;

function DecodeParams(AParams: String): Boolean;
var
  P: Integer;
begin
  Host     := '';
  Porta    := 0;
  Login    := '';
  Senha    := '';
  De       := '';
  Para     := '';
  Assunto  := '';
  Mensagem := '';
  P := Pos(';', AParams);
  Result := (P > 0);
  if Result then
  begin
    // Host --------------------------------------------------------------------
    Host := AnsiLowerCase(Copy(AParams, 1, P -1));
//    Writeln('Host: ' + Host);
    Result := (Host <> '');
    if Result then
    begin
      Delete(AParams, 1, P);
      AParams := Trim(AParams);
      P := Pos(';', AParams);
      Result := (P > 0);
    end
    else
    begin
      Writeln('Host não informado');
      Exit;
    end;
    // Porta -------------------------------------------------------------------
    if Result then
    begin
      S := AnsiLowerCase(Copy(AParams, 1, P -1));
//      Writeln('Porta: ' + S);
      Result := (S <> '') and TryStrToInt(S, Porta) and (Porta > 0);
      if Result then
      begin
        Delete(AParams, 1, P);
        AParams := Trim(AParams);
        P := Pos(';', AParams);
        Result := (P > 0);
      end
      else
      begin
        Writeln('Porta inválida ou não informada');
        Exit;
      end;
    end
    else
    begin
      Writeln('Porta não informada');
      Exit;
    end;
    // Login -------------------------------------------------------------------
    if Result then
    begin
      Login := Trim(AnsiLowerCase(Copy(AParams, 1, P -1)));
//      Writeln('Login: ' + Login);
      Result := (Login <> '') and (Pos('@myindaia.com.br', Login) > 0);
      if Result then
      begin
        Delete(AParams, 1, P);
        AParams := Trim(AParams);
        P := Pos(';', AParams);
        Result := (P > 0);
      end
      else
      begin
        Writeln('Porta inválida ou não informada');
        Exit;
      end;
    end
    else
    begin
      Writeln('Senha não informada');
      Exit;
    end;
    // Senha -------------------------------------------------------------------
    if Result then
    begin
      Senha := Trim(AnsiLowerCase(Copy(AParams, 1, P -1)));
//      Writeln('Senha: ' + Senha);
      Result := (Senha <> '');
      if Result then
      begin
        Delete(AParams, 1, P);
        AParams := Trim(AParams);
        P := Pos(';', AParams);
        Result := (P > 0);
      end
      else
      begin
        Writeln('Porta inválida ou não informada');
        Exit;
      end;
    end
    else
    begin
      Writeln('Porta não informada');
      Exit;
    end;
    // De ----------------------------------------------------------------------
    if Result then
    begin
      De := AnsiLowerCase(Copy(AParams, 1, P -1));
//      Writeln('De: ' + De);
      Result := (De <> '') and (Pos('@myindaia.com.br', De) > 0);
      if Result then
      begin
        Delete(AParams, 1, P);
        AParams := Trim(AParams);
        P := Pos(';', AParams);
        Result := (P > 0);
      end
      else
      begin
        Writeln('Remetente inválido ou não informado.');
        Exit;
      end;
    end
    else
    begin
      Writeln('Remetente não informado');
      Exit;
    end;
    // Para --------------------------------------------------------------------
    if Result then
    begin
      Para := Copy(AParams, 1, P -1);
//      Writeln('Para: ' + Para);
      Result := (Para <> '') and (Pos('@', Para) > 0);
      if Result then
      begin
        Delete(AParams, 1, P);
        AParams := Trim(AParams);
        P := Pos(';', AParams);
        Result := (P > 0);
      end
      else
      begin
        Writeln('Destinatario inválido ou não informado.');
        Exit;
      end;
    end
    else
    begin
      Writeln('Destinatário não informado');
      Exit;
    end;
    // Assunto -----------------------------------------------------------------
    if Result then
    begin
      Assunto := Trim(Copy(AParams, 1, P -1));
//      Writeln('Assunto: ' + Assunto);
      Delete(AParams, 1, P);
      AParams := Trim(AParams);
      P := Pos(';', AParams);
      if AParams[Length(AParams)] = ';' then
        AParams := Copy(AParams, 1, Length(AParams) - 1);
    end
    else
    begin
      Writeln('Assunto não informado');
      Exit;
    end;
    // Mensagem ----------------------------------------------------------------
//    Writeln('Mensagem: ' + AParams);
    if Result then
      Mensagem := AParams
    else
    begin
      Writeln('Mensagem não informado');
      Exit;
    end;
  end;
end;


begin
  S := '';
  try
    for I := 1 to ParamCount do
      S := S + #32 + ParamStr(I);
    S := Trim(S);

    if S = '/?' then
    begin
      Writeln('Parametros:                                                                                                                                                 ');
      Writeln('   HOST;PORTA;LOGIN;SENHA;DE;PARA;ASSUNTO;MENSAGEM                                                                                                           ');
      Writeln('O parametro DE deve ser um e-mail apenas de myindaia.com.br                                                                                                 ');
      Writeln('                                                                                                                                                            ');
      Writeln('Ex:                                                                                                                                                         ');
      Writeln('   mail.myindaia.com.br;25;ti@myindaia.com.br;senha;remetente@myindaia.com.br;destinatario@provedor.com.br;Recebimento de mensagem;<b>Mensagem recebida</b> ');
    end
    else
    begin
      if DecodeParams(S) then
      begin
        Writeln('Enviando e-mail');
        Writeln('De: ' + De);
        Writeln('Para: ' + Para);
        Writeln('Assunto: ' + Assunto);
        Writeln('Mensagem: ' + Mensagem);
        if EnviaEmailGeral(Host, Login, Senha, Porta, Mensagem, Assunto, De, StrToArray(Para, ',')) then
          Writeln('Mensagem enviada com sucesso')
        else
          Writeln('Erro enviando mensagem.');
      end
      else
        Writeln('Erro nos parâmetros.');
    end;
  except
    on E: Exception do
      Writeln('Erro enviando e-mail.'#13'Parâmetros: ' + S + #13'Mensagem: ' + E.Message);
  end;
end.
