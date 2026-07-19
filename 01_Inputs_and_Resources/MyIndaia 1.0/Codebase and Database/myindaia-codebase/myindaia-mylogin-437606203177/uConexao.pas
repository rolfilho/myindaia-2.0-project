unit uConexao;

interface

uses
  Windows, Forms, SysUtils, Classes, WideStrings, DBXMsSQL, DBXCommon, SqlExpr,
  Dialogs, DB, FMTBcd, ADODB, DBClient, Provider, ExtCtrls, IniFiles;

type
  TCargo   = record
    Codigo: String;
    Nome  : String;
  end;
  TUsuario = record
    Codigo : String;
    Nome   : String;
    Apelido: String;
    Login  : String;
    Senha  : String;
    Email  : String;
    Manager: Boolean;
    Cargo  : TCargo;
  end;

  TConfigMail = record
    Host: String;
    Port: Integer;
    Username: String;
    Password: String;
  end;

type
  TdtmConexao = class(TDataModule)
    qrySistemas: TSQLQuery;
    qryUsuario: TSQLQuery;
    qrySistemasCD_SISTEMA: TIntegerField;
    qrySistemasNM_SISTEMA: TStringField;
    qrySistemasNM_APLICATIVO: TStringField;
    qrySP_WHO: TSQLQuery;
    qrySistemasNM_PROCESSO: TStringField;
    cmdAlteraSenha: TADOCommand;
    qryUsuarioCD_USUARIO: TStringField;
    qryUsuarioCD_CARGO: TStringField;
    qryUsuarioNM_CARGO: TStringField;
    qryUsuarioNM_USUARIO: TStringField;
    qryUsuarioAP_USUARIO: TStringField;
    qryUsuarioNM_EMAIL: TStringField;
    ADOConnection: TADOConnection;
    qrySenhas: TADOQuery;
    qrySenhasNM_SENHA: TStringField;
    qrySenhasCD_USUARIO: TIntegerField;
    qrySenhasDT_SENHA: TDateTimeField;
    qryUltimaAlteracaosenha: TADOQuery;
    qryUltimaAlteracaosenhaQTD_DIAS: TIntegerField;
    qryParametros: TSQLQuery;
    qryParametrosNM_HOST: TStringField;
    qryParametrosNR_PORTA: TIntegerField;
    qryParametrosNM_LOGIN: TStringField;
    qryParametrosNM_SENHA: TStringField;
    qryUsuarioIN_MANAGER: TStringField;
    dspUsuario: TDataSetProvider;
    dspSP_WHO: TDataSetProvider;
    dspSistemas: TDataSetProvider;
    dspParametros: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    cdsSP_WHO: TClientDataSet;
    cdsSistemas: TClientDataSet;
    cdsParametros: TClientDataSet;
    cdsUsuarioCD_USUARIO: TStringField;
    cdsUsuarioCD_CARGO: TStringField;
    cdsUsuarioNM_CARGO: TStringField;
    cdsUsuarioNM_USUARIO: TStringField;
    cdsUsuarioAP_USUARIO: TStringField;
    cdsUsuarioNM_EMAIL: TStringField;
    cdsUsuarioIN_MANAGER: TStringField;
    cdsSP_WHOspid: TSmallintField;
    cdsSP_WHOecid: TSmallintField;
    cdsSP_WHOstatus: TWideStringField;
    cdsSP_WHOloginame: TWideStringField;
    cdsSP_WHOhostname: TWideStringField;
    cdsSP_WHOblk: TStringField;
    cdsSP_WHOdbname: TWideStringField;
    cdsSP_WHOcmd: TWideStringField;
    cdsSP_WHOrequest_id: TIntegerField;
    cdsSistemasCD_SISTEMA: TIntegerField;
    cdsSistemasNM_SISTEMA: TStringField;
    cdsSistemasNM_APLICATIVO: TStringField;
    cdsSistemasNM_PROCESSO: TStringField;
    cdsParametrosNM_HOST: TStringField;
    cdsParametrosNR_PORTA: TIntegerField;
    cdsParametrosNM_LOGIN: TStringField;
    cdsParametrosNM_SENHA: TStringField;
    qrySistemasParados: TSQLQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    dspSistemasParados: TDataSetProvider;
    cdsSistemasParados: TClientDataSet;
    qrySistemasParadosDT_STOP: TSQLTimeStampField;
    TimerSistemasParados: TTimer;
    cdsSistemasParadosCD_SISTEMA: TIntegerField;
    cdsSistemasParadosNM_SISTEMA: TStringField;
    cdsSistemasParadosNM_APLICATIVO: TStringField;
    cdsSistemasParadosNM_PROCESSO: TStringField;
    cdsSistemasParadosDT_STOP: TSQLTimeStampField;
    TimerParar: TTimer;
    qryConsulta: TSQLQuery;
    Connection: TSQLConnection;
    qrySP_WHOspid: TSmallintField;
    qrySP_WHOecid: TSmallintField;
    qrySP_WHOstatus: TWideStringField;
    qrySP_WHOloginame: TWideStringField;
    qrySP_WHOhostname: TWideStringField;
    qrySP_WHOblk: TStringField;
    qrySP_WHOdbname: TWideStringField;
    qrySP_WHOcmd: TWideStringField;
    qrySP_WHOrequest_id: TIntegerField;
    qrySistemasDT_STOP: TSQLTimeStampField;
    qrySistemasNM_ARQUIVO_SCRIPT: TStringField;
    cdsSistemasDT_STOP: TSQLTimeStampField;
    cdsSistemasNM_ARQUIVO_SCRIPT: TStringField;
    qrySistemasNM_APLICATIVO_PARAM: TStringField;
    cdsSistemasNM_APLICATIVO_PARAM: TStringField;
    ConnectionBroker: TSQLConnection;
    qryTemp: TSQLQuery;
    procedure ConnectionBeforeDisconnect(Sender: TObject);
    procedure TimerSistemasParadosTimer(Sender: TObject);
    procedure TimerPararTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    FConectado: Boolean;
    FUsuario: TUsuario;
    FMsgErro: String;
    FConfig: TIniFile;
    function GetLogin: String;
    function GetSenha: String;
    procedure SetLogin(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetConectado(const Value: Boolean);
    function QuantidadeLogado: Integer;
    function AlteraSenhaServidor(ACodUsuario: Integer; ALogin, ASenhaAntiga, ASenhaNova, AServidor: String; var AMsg: String): Boolean;
    function AlterarSenha(ALogin, ASenhaAntiga, ASenhaNova: String): Boolean;
  public
    function ValidaLogin(ALogin, ASenha: String; ASenhaNova: String = ''): Boolean;
    function GetQtdUltimaAlteracao(ALogin: String): Integer;
    function ConsultaSQL(ASQL: String; ARetornoPadrao: String): String;
    function ConsultaSQLVar(ASQL: String; ARetornoPadrao: Variant): Variant;
    function VerificaConexao(ALogin: String = ''; ASenha: String = ''): Boolean;
    function VerificaConexaoADO: Boolean;
    procedure Connect;
    procedure Disconnect;
    function ConfigMail: TConfigMail;
    property Login: String read GetLogin write SetLogin;
    property Senha: String read GetSenha write SetSenha;
    property Usuario: TUsuario read FUsuario;
    property Conectado: Boolean read FConectado write SetConectado;
    property MsgErro: String read FMsgErro;
    function VerificaUsuarioBloqueado(Nm_Usuario : String; StatusConexao : String) :Boolean;
  end;

var
  dtmConexao: TdtmConexao;

implementation

uses Principal, Funcoes, Mensagens, uFinalizar;

{$R *.dfm}

{ TdtmConexao }

function TdtmConexao.GetLogin: String;
begin
  Result := Connection.Params.Values['User_Name'];
end;

function TdtmConexao.GetQtdUltimaAlteracao(ALogin: String): Integer;
begin
  if VerificaConexaoADO then
    try
      if qryUltimaAlteracaosenha.Active then
        qryUltimaAlteracaosenha.Close;
      qryUltimaAlteracaosenha.Parameters.ParamByName('AP_USUARIO').Value := ALogin;
      qryUltimaAlteracaosenha.Open;
      Result := qryUltimaAlteracaosenhaQTD_DIAS.AsInteger;
      qryUltimaAlteracaosenha.Close;
    finally
      ADOConnection.Close;
    end
  else
    Result := 0;
end;

function TdtmConexao.GetSenha: String;
begin
  Result := Connection.Params.Values['Password'];
end;

function TdtmConexao.QuantidadeLogado: Integer;
var
  Desconectar: Boolean;
begin
  Desconectar := not Connection.Connected;
  if VerificaConexao then
    try
      if cdsSP_WHO.Active then
        cdsSP_WHO.Close;
      cdsSP_WHO.Params[0].AsString := Login;
      cdsSP_WHO.Open;
      Result := 0;
      if cdsSP_WHO.RecordCount > 0 then
      begin
        cdsSP_WHO.First;
        while not cdsSP_WHO.Eof do
        begin
          if SameText(cdsSP_WHOdbname.AsString, 'MYLOGIN') then
            Inc(Result);
          cdsSP_WHO.Next;
        end;
      end;
    finally
      if Desconectar then
        Disconnect;
    end
  else
    Result := 0;
end;

procedure TdtmConexao.SetConectado(const Value: Boolean);
begin
  if Value <> FConectado then
  begin
    FConectado := Value;
    if not Value then
    begin
      Login := '';
      Senha := '';
      FUsuario.Codigo       := '';
      FUsuario.Nome         := '';
      FUsuario.Apelido      := '';
      FUsuario.Login        := '';
      FUsuario.Senha        := '';
      FUsuario.Email        := '';
      FUsuario.Manager      := False;
      FUsuario.Cargo.Codigo := '';
      FUsuario.Cargo.Nome   := '';
    end;
  end;
end;

procedure TdtmConexao.SetLogin(const Value: String);
begin
  Connection.Params.Values['User_Name'] := Value;
end;

procedure TdtmConexao.SetSenha(const Value: String);
begin
  Connection.Params.Values['Password'] := Value;
end;

procedure TdtmConexao.TimerPararTimer(Sender: TObject);
var
  S: String;
begin
  cdsSistemasParados.First;
  S := '';
  while not cdsSistemasParados.Eof do
  begin
    if ProcessoExecutando(cdsSistemasParadosNM_PROCESSO.AsString)  then
      if Now < cdsSistemasParadosDT_STOP.AsDateTime then
        //frmMyLogin.ShowBalloon(bfWarning, 'O Sistema '+cdsSistemasParadosNM_SISTEMA.AsString+ ' será reiniciado em '+TimeToStr(cdsSistemasParadosDT_STOP.AsDateTime - Now)+ ' hrs.' )
        S := S + #13 + 'O Sistema ' + cdsSistemasParadosNM_SISTEMA.AsString+ ' será reiniciado em ' + TimeToStr(cdsSistemasParadosDT_STOP.AsDateTime - Now) + ' hrs.'
      else
      begin
        FinalizaProcesso(cdsSistemasParadosNM_PROCESSO.AsString);
        TimerParar.Enabled := False;
      end;
    cdsSistemasParados.Next;
  end;
  if S <> '' then
  begin
    Delete(S, 1, 1);
    frmMyLogin.ShowBalloon(bfWarning, S);
  end;
end;

procedure TdtmConexao.TimerSistemasParadosTimer(Sender: TObject);
begin
  {if VerificaConexao then
    try
      cdsSistemasParados.Open;
      if cdsSistemasParados.RecordCount > 0 then
        TimerParar.Enabled := True
      else
        TimerParar.Enabled := False;
    finally
      dtmConexao.Connection.Close;
    end;}
end;

function TdtmConexao.AlterarSenha(ALogin, ASenhaAntiga, ASenhaNova: String): Boolean;
var
  S, Msg: String;
  CdUsuario: Integer;
begin
  Result := (ASenhaNova <> ASenhaAntiga);
  if not Result then
    FMsgErro := 'A senha nova deve ser diferente da senha atual.'
  else if VerificaConexao then
    try
      if qrySenhas.Active then
        qrySenhas.Close;
      qrySenhas.Parameters.ParamByName('AP_USUARIO').Value := ALogin;
      qrySenhas.Open;

      CdUsuario := qrySenhasCD_USUARIO.AsInteger;
      while not qrySenhas.Eof do
      begin
        S := Decriptografa(qrySenhasCD_USUARIO.AsInteger, qrySenhasNM_SENHA.AsString);
        if (S = ASenhaNova) then
        begin
          FMsgErro := 'Você não pode utilizar a mesma senha durante o período de 1 ano.'#13'Favor utilizar outra senha.';
          Result := False;
          Break;
        end;
        qrySenhas.Next;
      end;
      qrySenhas.Close;

      if AlteraSenhaServidor(CdUsuario, ALogin, ASenhaAntiga, ASenhaNova, 'INDAIA10', Msg) then
        AlteraSenhaServidor(CdUsuario, ALogin, ASenhaAntiga, ASenhaNova, 'ANTUERPIA', Msg)
      else
      begin
        FMsgErro := 'Erro alterando a senha para ''' + ALogin + '''.'#13'Verifique o login e a senha e tente novamente.'#13 +
           'Mensagem: ' + Msg;
        Result := False;
      end;
    finally
      //Connection.Close;
      if ADOConnection.Connected then
        ADOConnection.Close;
    end;
end;

function TdtmConexao.AlteraSenhaServidor(ACodUsuario: Integer; ALogin, ASenhaAntiga,
   ASenhaNova, AServidor: String; var AMsg: String): Boolean;
begin
  try
    if ADOConnection.Connected then
      ADOConnection.Close;
    ADOConnection.ConnectionString := 'Provider=SQLOLEDB.1;' +
                                      'Password=123;' +
                                      'Persist Security Info=True;' +
                                      'User ID=SA;' +
                                      'Initial Catalog=MYLOGIN;' +
                                      'Data Source=' + AServidor + ';' +
                                      'Use Procedure for Prepare=1;' +
                                      'Auto Translate=True;' +
                                      'Packet Size=4096;' +
                                      'Use Encryption for Data=False;' +
                                      'Tag with column collation when possible=False';
    Result := VerificaConexaoADO;
    if not Result then
      FMsgErro := 'Erro se conectando ao servidor.'#13'Favor, tentar novamente dentro de alguns instantes.'
    else
    begin
      ADOConnection.BeginTrans;
      cmdAlteraSenha.CommandText := 'ALTER LOGIN [' + ALogin + '] WITH PASSWORD = ''' + ASenhaNova + '''';// OLD_PASSWORD = ''' + ASenhaAntiga + '''';
      cmdAlteraSenha.Execute;
      cmdAlteraSenha.CommandText := 'INSERT INTO TB_USUARIO_SENHAS VALUES(''' + FormatFloat('0000', ACodUsuario) + ''', GETDATE(), ''' + Criptografa(ACodUsuario, ASenhaAntiga) + ''');';
      cmdAlteraSenha.Execute;
      ADOConnection.CommitTrans;
      ADOConnection.Close;
      Result := True;
    end;
  except
    on E: Exception do
    begin
      AMsg := E.Message;
      Result := False;
      if ADOConnection.InTransaction then
        ADOConnection.RollbackTrans;
      if ADOConnection.Connected then
        ADOConnection.Close;
    end;
  end;
end;

function TdtmConexao.ConfigMail: TConfigMail;
var
  Desconectar: Boolean;
begin
  Desconectar := not Connection.Connected;
  if VerificaConexao then
    try
      if cdsParametros.Active then
        cdsParametros.Close;
      cdsParametros.Open;
      Result.Host := cdsParametrosNM_HOST.AsString;
      Result.Port := cdsParametrosNR_PORTA.AsInteger;
      Result.Username := cdsParametrosNM_LOGIN.AsString;
      Result.Password := cdsParametrosNM_SENHA.AsString;
      cdsParametros.Close;
    finally
      if Desconectar then
        Disconnect;
    end;
end;

procedure TdtmConexao.Connect;
begin
  if not Connection.Connected then
    Connection.Open;
end;

procedure TdtmConexao.ConnectionBeforeDisconnect(Sender: TObject);
begin
  if cdsUsuario.Active then
    cdsUsuario.Close;
  if cdsSP_WHO.Active then
    cdsSP_WHO.Close;
  if cdsSistemas.Active then
    cdsSistemas.Close;
  if cdsParametros.Active then
    cdsParametros.Close;
  if cdsSistemasParados.Active then
    cdsSistemasParados.Close;
end;

function TdtmConexao.ConsultaSQL(ASQL: String; ARetornoPadrao: String): String;
var
  Desconectar: Boolean;
begin
  Desconectar := not Connection.Connected;
  try
    if qryConsulta.Active then
      qryConsulta.Close;
    qryConsulta.SQL.Text := ASQL;
    try
      qryConsulta.Open;
      Result := qryConsulta.Fields[0].AsString;
    except
      Result := ARetornoPadrao;
    end;
  finally
    if Desconectar then
      Disconnect;
  end;
end;

function TdtmConexao.ConsultaSQLVar(ASQL: String; ARetornoPadrao: Variant): Variant;
var
  Desconectar: Boolean;
begin
  Desconectar := not Connection.Connected;
  try
    if qryConsulta.Active then
      qryConsulta.Close;
    qryConsulta.SQL.Text := ASQL;
    try
      qryConsulta.Open;
      Result := qryConsulta.Fields[0].Value;
    except
      Result := ARetornoPadrao;
    end;
  finally
    if Desconectar then
      Disconnect;
  end;
end;

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  FConectado := False;
  FConfig := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
  Login := FConfig.ReadString('Config', 'Login', '');
  {if SameText(ExtractFileName(Application.ExeName), 'MyLogin_h.exe') then
    Connection.Params.Values['HostName'] := 'ANTUERPIA'
  else
    Connection.Params.Values['HostName'] := 'INDAIA10';}
end;

procedure TdtmConexao.Disconnect;
begin
  if Connection.Connected then
    Connection.Close;
  if ADOConnection.Connected then
    ADOConnection.Close;
end;

function TdtmConexao.ValidaLogin(ALogin, ASenha: String; ASenhaNova: String): Boolean;
begin

  if Conectado then
  begin
    Result := (AnsiUpperCase(ALogin) = AnsiUpperCase(Connection.Params.Values['User_Name'])) and
                             (ASenha = Connection.Params.Values['Password']);

    if not Result then
      FMsgErro := 'Login e/ou senha inválidos.'
    else
    if ASenhaNova <> '' then
    begin
      Result := AlterarSenha(ALogin, ASenha, ASenhaNova);
      if Result then
        Senha := ASenhaNova;
    end;
  end
  else
  begin
    Result := VerificaConexao(ALogin, ASenha);
    if Result then   //se entrou aqui é porque a senha está certa. precisa verificar se está bloqueado
      try
        if VerificaUsuarioBloqueado(ALogin, 'OK') then
        begin
          if ASenhaNova <> '' then
          begin
            Result := AlterarSenha(ALogin, ASenha, ASenhaNova);
            if Result then
            begin
              Connection.Close;
              ASenha := ASenhaNova;
            end
            else
              Exit;
          end;

          Login := ALogin;
          Senha := ASenha;

          if not Conectado then
          begin
            //if QuantidadeLogado > 1 then
            //  raise Exception.Create('Este login já está em uso.');

            cdsUsuario.Close;
            cdsUsuario.Params[0].AsString := Login;
            cdsUsuario.Open;

            if Trim(cdsUsuarioCD_USUARIO.AsString) = '' then
              raise Exception.Create('Usuário não existe ou está desativado.'#13'Solicitar ao TI sua liberação.')
            else
              cdsSistemas.Params[0].AsString := cdsUsuarioCD_CARGO.AsString;

            if not cdsUsuario.Eof then
            begin
              FUsuario.Codigo       := Trim(cdsUsuarioCD_USUARIO.AsString);
              FUsuario.Nome         := Trim(cdsUsuarioNM_USUARIO.AsString);
              FUsuario.Apelido      := Trim(cdsUsuarioAP_USUARIO.AsString);
              Fusuario.Login        := Login;
              Fusuario.Senha        := Senha;
              FUsuario.Email        := Trim(cdsUsuarioNM_EMAIL.AsString);
              FUsuario.Manager      := CompareText(Trim(cdsUsuarioIN_MANAGER.AsString), 'M') = 0;
              FUsuario.Cargo.Codigo := Trim(cdsUsuarioCD_CARGO.AsString);
              FUsuario.Cargo.Nome   := Trim(cdsUsuarioNM_CARGO.AsString);
            end;

            cdsUsuario.Close;
          end;
          Result := (Usuario.Codigo <> '');
        end
        else
          Result := false;
      except
        on E: Exception do
        begin
          FMsgErro := E.Message;
          Result   := False;
          Disconnect;
        end;
      end;

    Conectado := Result;
    Disconnect;
  end;
  if Result then
    FConfig.WriteString('Config', 'Login', ALogin);
end;

function TdtmConexao.VerificaConexao(ALogin: String = ''; ASenha: String = ''): Boolean;
begin
  if Connection.Connected then
    try
      Result := ConsultaSQL('SELECT CD_SISTEMA FROM TB_SISTEMA WHERE CD_SISTEMA = 1', '0') = '1';
    except
      Result := False;
      Connection.Connected := False;
    end
  else
    try
      if (ALogin <> '') and (ASenha <> '') then
      begin
        Login := ALogin;
        Senha := ASenha;
      end;
      Connect;
      Result := True;
    except
      on E: Exception do
      begin
        FMsgErro := E.Message;
        Result := False;
      end;
    end;
end;

function TdtmConexao.VerificaConexaoADO: Boolean;
begin
  if ADOConnection.Connected then
    try
      if qryUltimaAlteracaosenha.Active then
        qryUltimaAlteracaosenha.Close;
      qryUltimaAlteracaosenha.Parameters.ParamByName('AP_USUARIO').Value := 'sa';
      qryUltimaAlteracaosenha.Open;
      qryUltimaAlteracaosenha.Close;
      Result := True;
    except
      Result := False;
      ADOConnection.Connected := False;
    end
  else
    try
      ADOConnection.Open;
      Result := True;
    except
      Result := False;
    end;
end;

function TdtmConexao.VerificaUsuarioBloqueado(Nm_Usuario : String; StatusConexao : String) :Boolean;
var
  qtSenhaErrada, qtTentativas, qtSenhaErradaParam :integer;
  usuarioExiste : Boolean;
begin
  //essa função é usada para verificar se o usuario está bloqueado.
  //por isso, serve para quando o login no banco da erro e para quando o login não da erro
  //isso porque, se der erro, precisamos aumentar as tentativas para bloquear o usuario
  //se nao der erro, precisamos verificar se o usuario está bloqueado antes de permitir o acesso.

  result        := true;
  usuarioExiste := true;

  if not ConnectionBroker.Connected then
    ConnectionBroker.Open;

  //verifica se o usuario existe e quantas vezes ele já tentou digitar a senha/qual o total
  qryTemp.Close;
  qryTemp.sql.Text :=' SELECT QT_SENHA_INCORRETA,                                                                              '+
                     '        ISNULL((SELECT ISNULL(QT_SENHA_ERRADA,5) FROM TPARAMETROS (NOLOCK)),5) AS QT_SENHA_ERRADA_PARAM  '+
                     '   FROM TUSUARIO (NOLOCK)                                                                                '+
                     '  WHERE AP_USUARIO = '''+ Nm_Usuario +''' ';
  qryTemp.Open;
  //achou o usuario. então o problema é a senha
  if not qryTemp.eof then
  begin
    qtSenhaErrada       := qryTemp.fieldByName('QT_SENHA_INCORRETA').AsInteger;
    qtSenhaErradaParam  := qryTemp.fieldByName('QT_SENHA_ERRADA_PARAM').AsInteger;
  end
  else
    usuarioExiste := false;


  //não achou o usuario com o nome informado.
  if not usuarioExiste then
  begin
    MessageDlg('Login e/ou senha inválidos.', mtError, [mbOk], 0);
    result := false;
  end
  else
  begin
    qtTentativas := qtSenhaErradaParam - qtSenhaErrada;

    //se a origem da chamada desse function foi um erro de conexao, então atualiza a quantidade de erros
    //se não, está chamando apenas para saber se o usuario já está bloqueado
    if (qtTentativas > 0) and (StatusConexao = 'ERRO') then
    begin
      //atualiza a quantidade de tentativas erradas
      //não precisa continuar atualizando apos o bloqueio.
      qryTemp.Close;
      qryTemp.sql.Text := ' UPDATE TUSUARIO                                       '+
                          '    SET QT_SENHA_INCORRETA = QT_SENHA_INCORRETA + 1    '+
                          '   FROM TUSUARIO (NOLOCK)                              '+
                          '  WHERE AP_USUARIO = '''+ Nm_Usuario +''' ';
      qryTemp.ExecSql;
    end
    else
    if ((qtTentativas-1) > 0) and (StatusConexao = 'OK')  then  //se conectou, preciso limpar as tentativas
    begin
       //limpa a quantidade, porque o usuario nao ta bloqueado e o login deu certo
      qryTemp.Close;
      qryTemp.sql.Text := ' UPDATE TUSUARIO                                       '+
                          '    SET QT_SENHA_INCORRETA = 0                         '+
                          '   FROM TUSUARIO (NOLOCK)                              '+
                          '  WHERE AP_USUARIO = '''+ Nm_Usuario +''' ';
      qryTemp.ExecSql;
    end;


    if ((qtTentativas-1) <=0) then
    begin
      MessageDlg('Usuario bloqueado.'#13'Favor entrar em contato com o suporte.', mtError, [mbOk], 0);
      if Connection.Connected then
        Connection.Connected := False;
      result := false;
    end
    else
    //se a origem da chamada é um erro de conexão, então avisa o usuario.
    // se não for, entrou aqui apenas para saber se está bloqueado
    if StatusConexao = 'ERRO' then
    begin
      MessageDlg('Erro efetuando login.'+#13+
                 'Verifique seu login e senha.'+#13+
                 'Quantidade de tentativas restantes: '+inttostr(qtTentativas-1), mtError, [mbOk], 0);
      result := false;
    end;
  end;
end;
end.
