unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvGlowButton, sSkinManager, sLabel, StdCtrls, sEdit,
  sSkinProvider, Menus, Funcoes, Mensagens, ImgList, ShellAPI, TypInfo, sPanel,
  sButton, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, AdvSysKeyboardHook,
  idMessage, idMessageClient, IdSMTP, IdText, IdAttachmentFile, Buttons,
  sSpeedButton;

type
  TfrmMyLogin = class(TForm)
    sSkinManager1: TsSkinManager;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    edtLogin: TsEdit;
    edtSenha: TsEdit;
    sLabelFX3: TsLabelFX;
    sSkinProvider1: TsSkinProvider;
    popTray: TPopupMenu;
    mniLogin: TMenuItem;
    mniSistemas: TMenuItem;
    mniSair: TMenuItem;
    TrayIcon1: TTrayIcon;
    N2: TMenuItem;
    ImageList1: TImageList;
    pnlAlterarSenha: TsPanel;
    sLabelFX4: TsLabelFX;
    edtNovaSenha: TsEdit;
    sLabelFX5: TsLabelFX;
    edtConfirmarNovaSenha: TsEdit;
    mniAlterarSenha: TMenuItem;
    sLabelFX6: TsLabelFX;
    ActionManager: TActionManager;
    actLogin: TAction;
    actAlterarSenha: TAction;
    actSistemas: TAction;
    actSair: TAction;
    tmrSistemas: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtLoginEnter(Sender: TObject);
    procedure edtLoginExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure popTrayPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtConfirmarNovaSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure actLoginExecute(Sender: TObject);
    procedure actAlterarSenhaExecute(Sender: TObject);
    procedure actSistemasExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure tmrSistemasTimer(Sender: TObject);
  private
    FExecFiles: TStrings;
    FCanClose: Boolean;
    FEndSession: Boolean;
    FDataReinicio: TDateTime;
    FPathMySenhasExists: Boolean;
    procedure MsgWM_EXIBIRLOGIN(var Msg: TMessage); message WM_EXIBIRLOGIN;
    procedure MsgWM_CONECTADO(var Msg: TMessage); message WM_CONECTADO;
    procedure MsgWM_GET_USER_CODE(var Msg: TMessage); message WM_GET_USER_CODE;
    procedure MsgWM_COPYDATA(var Msg: TWMCopyData); message WM_COPYDATA;
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QueryEndSession;
    procedure WMEndSession(var Msg : TWMEndSession); message WM_ENDSESSION;
    function ValidaCaracteresSenha(const s: AnsiString; tipoValida : string): Boolean;
  protected
  public
    procedure ShowBalloon(BalloonFlags: TBalloonFlags; BalloonHint: String);
    procedure Show;
    procedure EnviaEmail(vTitulo, vAssunto, vTo, vCc, vCco : String; vAnexos: Array of String);
  end;

var
  frmMyLogin: TfrmMyLogin;

implementation

uses uConexao, Sistemas, Splash;

const
  Height_Normal         = 120;
  Height_Alterar_Senha  = 236;
  Caracteres_Senha      = ['A'..'Z', 'a'..'z', '0'..'9', #8, #13, #27, '[', ']', '!', '@',
                           '#', '$', '%', '^', '&', '*', '(', ')', '_', '+', '-', '=','{', '}',
                           ';', '''',':', '"', '\', '/','|', ',', '<', '>', '.', '?' ];

{$R *.dfm}

{ TfrmMyLogin }

procedure TfrmMyLogin.actAlterarSenhaExecute(Sender: TObject);
begin
  if pnlAlterarSenha.Visible then
    Exit;
  edtLogin.Enabled := (edtLogin.Text = '') or (edtSenha.Text = '');
  edtSenha.Enabled := edtLogin.Enabled;
  if edtLogin.Enabled then
    Self.Show
  else
  begin
    edtNovaSenha.Text          := '';
    edtConfirmarNovaSenha.Text := '';
    if Self.Showing then
    begin
      while Self.Height < Height_Alterar_Senha do
      begin
        Self.Height := Self.Height +2;
        Self.Update;
        pnlAlterarSenha.Repaint;
      end;
    end
    else if Self.Height = Height_Normal then
    begin
      Self.Height := Height_Alterar_Senha;
      Self.Show;
      edtSenha.Text    := dtmConexao.Senha;
    end;
  end;
  if Trim(edtLogin.Text) = '' then
  begin
    Self.SelectFirst;
    ShowBalloon(bfWarning, 'Digite o login para poder alterar a senha.');
  end
  else if Trim(edtSenha.Text) = '' then
  begin
    Self.SelectNext(edtLogin, True, True);
    ShowBalloon(bfWarning, 'Digite sua senha atual para poder alterar a senha.');
  end
  else
    Self.SelectNext(edtSenha, True, True);
end;

procedure TfrmMyLogin.actLoginExecute(Sender: TObject);
begin
  if dtmConexao.Conectado then
  begin
    mniSistemas.Action.Execute;
    Exit;
  end;
  if not Self.Showing then
  begin
    Self.Height := Height_Normal;
    Self.Show;
  end
  else
  begin
    while Self.Height > Height_Normal do
    begin
      Self.Height := Self.Height -1;
      Self.Update;
    end;
  end;
  edtLogin.Enabled := True;
  edtSenha.Enabled := True;
  if edtLogin.Text = '' then
    edtLogin.SetFocus
  else
    edtSenha.SetFocus;
end;

procedure TfrmMyLogin.actSairExecute(Sender: TObject);
var
  SisExec: TStrings;
  I: Integer;
begin
  SisExec := frmMySistemas.SistemasExecutando;
  if SisExec.Count > 0 then
  begin
    for I := 0 to SisExec.Count - 1 do
      SisExec[I] := '>  ' + SisExec[I];
    ShowBalloon(bfInfo, 'O sistema não pode ser fechado porque os seguintes sistemas estão em execução:'#13 + SisExec.Text);
    FreeAndNil(SisExec);
  end
  else
  begin
    tmrSistemas.Enabled := False;
    FreeAndNil(SisExec);
    TrayIcon1.Visible := False;
    FCanClose := True;
    Close;
  end;
end;

procedure TfrmMyLogin.actSistemasExecute(Sender: TObject);
begin
  if Assigned(dtmConexao) and dtmConexao.Conectado then
    frmMySistemas.Show;
end;

procedure TfrmMyLogin.edtConfirmarNovaSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not CharInSet(Key, Caracteres_Senha) then
  begin
    ShowBalloon(bfError, 'Caractere não permitido. Utilize apenas Letras (A..Z), Números (0..9), caracteres especiais (_~^.,;:!?/\{}()[]<>''@#$%&*=+-');
    Key := #0;
  end;
end;

procedure TfrmMyLogin.edtLoginEnter(Sender: TObject);
begin
  TsEdit(Sender).Color := clWhite;
end;

procedure TfrmMyLogin.edtLoginExit(Sender: TObject);
begin
  TsEdit(Sender).Color := $00F9F2ED;
end;

procedure TfrmMyLogin.EnviaEmail(vTitulo, vAssunto, vTo, vCc, vCco: String; vAnexos: array of String);
var
  IdMessage1: TIdMessage;
  IdSMTP1: TIdSMTP;
  I: Integer;
  ConfigMail: TConfigMail;
begin
  ConfigMail := dtmConexao.ConfigMail;
  if ConfigMail.Host <> '' then
  begin
    IdMessage1 := TIdMessage.Create(application);
    IdSMTP1    := TIdSMTP.Create(application);

    with IdMessage1 do
    begin
      ContentType:='text/html';
      for I := 0 to High(vAnexos) do
        TIdAttachmentFile.Create(IdMessage1.MessageParts, vAnexos[I]);
      Body.Add('<html>');
      Body.Add('<body>');
      Body.add('<left><img src=file:///C|/DDBROKER/logopeq.jpg>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</left>');
      Body.Add(''+vAssunto+'');
      Body.Add('<body>');
      Body.Add('<br>');
      if High(vAnexos) >= 0 then
      begin
        Body.Add('<br>');
        Body.Add('Segue arquivo em anexo');
        Body.Add('<br>');
      end;
      Body.Add('<br>');
      Body.Add('Email gerado automaticamente pelo myIndaiá.');
      Body.Add(' Duvidas: <a href="mailto:ti@myindaia.com.br">ti@myindaia.com.br</a>');
      Body.Add('</body>');
      Body.Add('</html>');
    end;
    with IdMessage1 do
    begin
      From.Text                 := 'ti@myindaia.com.br';
      CCList.EMailAddresses     := vCc;
      BccList.EMailAddresses    := vCco;
      Recipients.EMailAddresses := vTo;
      Subject := vTitulo;
    end;
    with IdSMTP1 do
    begin
      Host     := ConfigMail.Host;
      Port     := ConfigMail.Port;
      Username := ConfigMail.Username;
      Password := ConfigMail.Password;
      Connect;
      try
        IdSMTP1.Send(IdMessage1);
      except
      end;
    end;
    Screen.Cursor := crDefault;
    IdSMTP1.Disconnect;
    IdMessage1.MessageParts.Clear;
    IdMessage1.Clear;
    IdMessage1.Free;
    IdSMTP1.Free;
  end;
end;

procedure TfrmMyLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
  while ProcessoExecutando('SuporteMy.exe') do
  begin
    FinalizaProcesso('SuporteMy.exe');
    Sleep(100); // Demora mais sem esse sleep do que com ele
    Application.ProcessMessages;
  end;
end;

procedure TfrmMyLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;
  Self.AlphaBlend := True;
  while Self.AlphaBlendValue > 1 do
  begin
    Self.AlphaBlendValue := Self.AlphaBlendValue - 1;
    Self.Update;
    Application.ProcessMessages;
  end;
  Self.Hide;
  Self.Height := Height_Normal;
  if FCanClose then
    frmMySistemas.Close;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmMyLogin.FormCreate(Sender: TObject);
var
  I: Integer;
  S: String;
begin
  FDataReinicio := Now;
  FPathMySenhasExists := DirectoryExists('\\INDAIA08\AplicClient\MySenhas');
  FCanClose := False;
  FEndSession := False;
  FExecFiles := TStringList.Create;
  Self.Height := Height_Normal;
  S := '';
  for I := 1 to ParamCount do
  begin
    if S = '' then
      S := ParamStr(I)
    else
      S := S + #32 + ParamStr(I);

    if FileExists(S) then
    begin
      FExecFiles.Add(S);
      S := '';
    end;
  end;
end;

procedure TfrmMyLogin.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  S: String;
  I: Integer;
begin
  case Key of
    VK_RETURN: begin
                 // Só para apagar a senha atual para não entrar na alteração de senha
                 if Self.Height = Height_Normal then
                 begin
                   edtNovaSenha.Text := '';
                   edtConfirmarNovaSenha.Text := '';
                 end;
                 if edtLogin.Text = '' then
                 begin
                   MessageDlg('É necessário digitar seu nome de usuário para acessar os sistemas.', mtWarning, [mbOk], 0);
                   edtLogin.SetFocus;
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (edtConfirmarNovaSenha.Text <> edtNovaSenha.Text) then
                 begin
                   MessageDlg('Nova senha e confirmação de senha estão diferentes.', mtWarning, [mbOk], 0);
                   edtConfirmarNovaSenha.SetFocus;
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (edtSenha.Text = edtNovaSenha.Text) then
                 begin
                   MessageDlg ('A nova senha deve ser diferente da senha atual!', mtWarning, [mbOk], 0);
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (length(edtNovaSenha.Text) < 10)  then
                 begin
                   MessageDlg('A senha deve ter pelo menos 10 caracteres.', mtWarning, [mbOk], 0);
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (not ValidaCaracteresSenha(edtNovaSenha.Text, 'Upper')) then
                 begin
                   MessageDlg('A senha deve conter pelo menos um caracter maiúsculo.', mtWarning, [mbOk], 0);
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (not ValidaCaracteresSenha(edtNovaSenha.Text, 'Lower')) then
                 begin
                   MessageDlg('A senha deve conter pelo menos um caracter minúsculo.', mtWarning, [mbOk], 0);
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (not ValidaCaracteresSenha(edtNovaSenha.Text, 'Numero')) then
                 begin
                   MessageDlg('A senha deve conter pelo menos um numero.', mtWarning, [mbOk], 0);
                 end
                 else
                 if (edtNovaSenha.Text <> '') and (not ValidaCaracteresSenha(edtNovaSenha.Text, 'Especial')) then
                 begin
                   MessageDlg('A senha deve conter pelo menos um caracter especial.', mtWarning, [mbOk], 0);
                 end
                 else
                 begin
                   if (Self.Height = Height_Normal) and (dtmConexao.GetQtdUltimaAlteracao(edtLogin.Text) > 60) then
                   begin
                     S := edtSenha.Text;
                     actAlterarSenha.Execute;
                     edtNovaSenha.SetFocus;
                     edtSenha.Text  := S;
                     MessageDlg('Faz muito tempo desde a sua última troca de senha.'#13'Por favor, altere-a para prosseguir.',
                                 mtInformation, [mbOk], 0, mbOk);
                   end
                   else
                   begin
                     if dtmConexao.ValidaLogin(edtLogin.Text, edtSenha.Text, edtNovaSenha.Text) then
                     begin
                       TrayIcon1.Hint := 'myIndaiá'#13'Usuário conectado ''' + dtmConexao.Usuario.Nome + '''';
                       Self.Close;
                       TrayIcon1.IconIndex := 1;
                       frmMySistemas.ListarComponentes;
                       S := '';

                       for I := 0 to High(_SISTEMAS_AUTOMATICOS) do
                         FExecFiles.Add(_SISTEMAS_AUTOMATICOS[I]);

                       if dtmConexao.Usuario.Manager then
                         FExecFiles.Add('C:\DDBROKER\MyHelpDesk.exe');

                       while FExecFiles.Count > 0 do
                       begin
                         if not frmMySistemas.ExecutaAplicativo(FExecFiles[0]) then
                           S := #13'  > ' + FExecFiles[0];

                         FExecFiles.Delete(0);
                       end;

                       if (edtNovaSenha.Text <> '') then
                       begin
                         ShowBalloon(bfInfo, 'Senha alterada com sucesso.');

                         EnviaEmail(' [MyIndaiá] Alteração de Senha - ' + dtmConexao.Usuario.Nome,
                                    ' Dados do Usuário <br/>' +
                                    ' Usuário: ' + edtLogin.Text + '<br/>' +
                                    ' Senha Antiga: ' + edtSenha.Text + '<br/>' +
                                    ' Senha Nova: ' + edtNovaSenha.Text + '<br/>' +
                                    ' Data da Alteração: ' + DatetoStr(Date) + '', 'myindaia@myindaia.com.br', '', '', []);
                       end
                       else
                         ShowBalloon(bfInfo, 'Usuário conectado ''' + dtmConexao.Usuario.Nome + '''');

                       if S <> '' then
                         ShowBalloon(bfError, 'O sistemas abaixo não estão habilitados para o seu cargo.'#13'Solcite liberação ao TI.' + S);

                       tmrSistemas.Enabled := True;
                     end
                     else
                     begin
                       if Pos('Error Code: 18456'#10, dtmConexao.MsgErro) > 0 then
                       begin
                        //deu erro na conexao. Preciso saber se o problema é a senha ou se o usuario nao existe.
                        dtmConexao.VerificaUsuarioBloqueado(edtLogin.Text, 'ERRO');
                       end
                       else
                       if Pos('Error Code: 17'#10, dtmConexao.MsgErro) > 0 then
                         MessageDlg('Problemas de conexão com o banco de dados.', mtError, [mbOk], 0)
                       else
                       if Pos('Error Code: 18487'#10, dtmConexao.MsgErro) > 0 then
                         actAlterarSenha.Execute
                       else
                          if dtmConexao.MsgErro <> '' then
                            MessageDlg(dtmConexao.MsgErro, mtError, [mbOk], 0);

                       if Self.Height = Height_Alterar_Senha then
                       begin
                         if edtNovaSenha.Text = '' then
                           edtNovaSenha.SetFocus
                         else
                           edtConfirmarNovaSenha.SetFocus;
                       end
                       else
                         edtSenha.SetFocus;
                     end;
                   end;
                 end;
               end;

    VK_ESCAPE: Self.Close;
  end;
end;

procedure TfrmMyLogin.FormResize(Sender: TObject);
begin
  if pnlAlterarSenha.Visible <> (Self.Height > Height_Normal) then
    pnlAlterarSenha.Visible := Self.Height > Height_Normal;

  Self.Left := (Screen.Width div 2) - (Self.Width div 2);
  Self.Top  := (Screen.Height div 2) - (Self.Height div 2);
end;

procedure TfrmMyLogin.FormShow(Sender: TObject);
begin
  edtSenha.Text := '';
  edtLogin.Text := dtmConexao.Login;
  if edtLogin.Text = '' then
    Self.SelectFirst
  else
    Self.SelectNext(edtLogin, True, True);
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
end;

procedure TfrmMyLogin.MsgWM_CONECTADO(var Msg: TMessage);
begin
  if dtmConexao.Conectado then
    Msg.Result := mrYes
  else
    Msg.Result := mrNo;
end;

procedure TfrmMyLogin.MsgWM_COPYDATA(var Msg: TWMCopyData);
var
  Text: String;
begin
  Text := MensagemDeDataStruct(Msg.CopyDataStruct);
  if Copy(Text, 1, Length(_USER_LOGIN)) = _USER_LOGIN then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_LOGIN + '=' + dtmConexao.Usuario.Login);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_USER_PASSWORD)) = _USER_PASSWORD then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_PASSWORD + '=' + dtmConexao.Usuario.Senha);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_USER_CODE)) = _USER_CODE then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_CODE + '=' + dtmConexao.Usuario.Codigo);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_USER_NAME)) = _USER_NAME then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_NAME + '=' + dtmConexao.Usuario.Nome);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_USER_EMAIL)) = _USER_EMAIL then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_EMAIl + '=' + dtmConexao.Usuario.Email);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_USER_CARGO_CODE)) = _USER_CARGO_CODE then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_CARGO_CODE + '=' + dtmConexao.Usuario.Cargo.Codigo);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_USER_CARGO_NAME)) = _USER_CARGO_NAME then
  begin
    if dtmConexao.Conectado then
    begin
      Msg.Result := mrYes;
      ResponderMensagem(Self.Handle, Msg.CopyDataStruct, _USER_CARGO_NAME + '=' + dtmConexao.Usuario.Cargo.Nome);
    end
    else
      Msg.Result := mrNo;
  end
  else if Copy(Text, 1, Length(_START_SYSTEM)) = _START_SYSTEM then
  begin
    Delete(Text, 1, Length(_START_SYSTEM) +1); // Apaga o = junto
    Text := Trim(Text);
    if dtmConexao.Conectado then
    begin
      if frmMySistemas.ProcessoExiste(Text) then
        Msg.Result := mrYes
      else
      begin
        Msg.Result := mrNo;
        ShowBalloon(bfInfo, 'O sistema ''' + ChangeFileExt(ExtractFileName(Text), '') + '''' +
           ' não está liberado.'#13'Solicite ao TI sua liberação.');
      end;
    end
    else
    begin
      Msg.Result := mrNo;
      ShowBalloon(bfInfo, 'Você não está conectado.');
      FExecFiles.Add(Text);
      Show;
    end;
  end;
end;

procedure TfrmMyLogin.MsgWM_EXIBIRLOGIN(var Msg: TMessage);
begin
  mniLogin.Action.Execute;
end;

procedure TfrmMyLogin.MsgWM_GET_USER_CODE(var Msg: TMessage);
begin
  if dtmConexao.Usuario.Codigo = '' then
    Msg.Result := 0
  else
    Msg.Result := StrToInt(dtmConexao.Usuario.Codigo);
end;

procedure TfrmMyLogin.popTrayPopup(Sender: TObject);
begin
  mniLogin.Enabled        := (not dtmConexao.Conectado) and ((not Self.Showing) or (Self.Showing and (Self.Height = Height_Alterar_Senha)));
  mniAlterarSenha.Enabled := (Self.Height = Height_Normal);
  mniSistemas.Enabled     := (dtmConexao.Conectado) and (not frmMySistemas.Showing);
end;

procedure TfrmMyLogin.Show;
begin
  inherited;
  Self.AlphaBlend := True;
  while Self.AlphaBlendValue < 255 do
  begin
    Self.AlphaBlendValue := Self.AlphaBlendValue + 1;
    Self.Update;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMyLogin.ShowBalloon(BalloonFlags: TBalloonFlags;
  BalloonHint: String);
begin
  TrayIcon1.BalloonFlags := BalloonFlags;
  TrayIcon1.BalloonHint  := BalloonHint;
  TrayIcon1.ShowBalloonHint;
end;

procedure TfrmMyLogin.tmrSistemasTimer(Sender: TObject);
var
  I: Integer;
begin
  // Verifica sistemas que não podem ser fechados
  tmrSistemas.Enabled := False;
  try
    for I := 0 to High(_SISTEMAS_TIMER) do
    begin
      if (FindWindow(PWideChar(_SISTEMAS_TIMER[I].Form), nil) = 0) and FileExists(_SISTEMAS_TIMER[I].Path + _SISTEMAS_TIMER[I].Nome) then
      begin
        Inc(_SISTEMAS_TIMER[I].Count);
        if _SISTEMAS_TIMER[I].Count mod 3 = 0 then
          frmMySistemas.ExecutaAplicativo(_SISTEMAS_TIMER[I].Path + _SISTEMAS_TIMER[I].Nome);
      end;
    end;

    // Verifica sistemas que precisam ser reiniciados
    {V := dtmConexao.ConsultaSQLVar('SELECT MAX(DT_SENHA) FROM TDESPACHANTE', Date);
    if V > FDataReinicio then
    begin
      FDataReinicio := Now;
      Exit;
      //if DirectoryExists('\\INDAIA08\AplicClient\MySenhas') then
      if FPathMySenhasExists then
        ShellExecute(0, nil, '\\INDAIA08\AplicClient\MySenhas\MSStart.exe', nil, '\\INDAIA08\AplicClient\MySenhas', SW_SHOW);
    end;}
  finally
    if tmrSistemas.Interval > 3000 then
      tmrSistemas.Interval := 3000;
    tmrSistemas.Enabled := True;
  end;
end;

procedure TfrmMyLogin.TrayIcon1DblClick(Sender: TObject);
begin
  popTrayPopup(popTray);
  if mniLogin.Enabled then
    mniLogin.Action.Execute
  else
    mniSistemas.Action.Execute;
end;

procedure TfrmMyLogin.WMEndSession(var Msg: TWMEndSession);
var
  Sistemas: TStrings;
  I: Integer;
begin
  if FEndSession then
  begin
    Sistemas := frmMySistemas.SistemasExecutando;
    try
      I := 0;
      while I < Sistemas.Count do
      begin
        if CompareText(ExtractFileName(Sistemas[I]), 'MyHelpDesk.exe') = 0 then
          Sistemas.Delete(I)
        else
          Inc(I);
      end;
      FCanClose := Sistemas.Count = 0;
    finally
      Sistemas.Free;
    end;
    if FCanClose then
      Close;
  end;
end;

procedure TfrmMyLogin.WMQueryEndSession(var Msg: TWMQueryEndSession);
var
  Sistemas: TStrings;
  I: Integer;
begin
  // No desligamento do Windows verificar se há sistemas em execução
  if not dtmConexao.Conectado then
    Msg.Result := 1
  else
  begin
    Sistemas := frmMySistemas.SistemasExecutando;
    try
      I := 0;
      while I < Sistemas.Count do
      begin
        if CompareText(ExtractFileName(Sistemas[I]), 'MyHelpDesk.exe') = 0 then
          Sistemas.Delete(I)
        else
          Inc(I);
      end;

      if Sistemas.Count = 0 then
        Msg.Result := 1
      else
      begin
        if MessageDlg('Os seguintes sistemas estão em execução:'#13'Continuar o desligamento?',
           mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
           Msg.Result := 1
        else
          Msg.Result := 0;
      end;
    finally
      Sistemas.Free;
    end;
  end;
  FEndSession := Msg.Result = 1;
end;

function TfrmMyLogin.ValidaCaracteresSenha(const s: AnsiString; tipoValida : string): Boolean;
var
  i: integer;
  achou : Boolean;
begin
  achou := false;
  for i := 1 to Length(s) do
  begin
    case s[i] of
      'A'..'Z':begin
                  if tipoValida = 'Upper' then
                    achou := true
               end;

      'a'..'z': begin
                  if tipoValida = 'Lower' then
                    achou := true
                end;

      '0'..'9': begin
                  if tipoValida = 'Numero' then
                    achou := true;
                end;

      '[', ']', '!', '@',
      '#', '$', '%', '^',
      '&', '*', '(', ')',
      '_', '+', '-', '=',
      '{', '}', ';', '''',
      ':', '"', '\', '/',
      '|', ',', '<', '>',
      '.', '?' : begin
                   if tipoValida = 'Especial' then
                    achou := true;
                 end;
    end;

    if achou then
      break;
  end;

  Result := achou;
end;

end.
