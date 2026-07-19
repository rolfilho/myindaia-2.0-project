program BrowserTerminal;

uses
  Forms,
  SysUtils,
  uWebTerminal in 'uWebTerminal.pas' {frmBrowserTerminal};

{$R *.res}

var
  I: Integer;
  S, S2, CPF, Senha: String;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  S := '';
  CPF := '';
  Senha := '';
  for I := 1 to ParamCount do
  begin
    S := S + ' ' + ParamStr(I);
  end;
  if S = '' then
    Halt;

  S := Trim(S);
  while (S <> '') do
  begin
    I := Pos(';', S);
    if I = 0 then
      I := Length(S) +1;
    S2 := Trim(Copy(S, 1, I -1));
    Delete(S, 1, I);
    S := Trim(S);
    if SameText(Copy(S2, 1, 4), 'CPF:') then
    begin
      Delete(S2, 1, 4);
      CPF := Trim(S2);
    end
    else if SameText(Copy(S2, 1, 3), 'PW:') then
    begin
      Delete(S2, 1, 3);
      Senha := Trim(S2);
    end;
  end;

  if (CPF = '') or (Senha = '') then
    Halt;
  Application.CreateForm(TfrmBrowserTerminal, frmBrowserTerminal);
  frmBrowserTerminal.CarregaTerminal(CPF, Senha);
  //Application.Run;
end.
