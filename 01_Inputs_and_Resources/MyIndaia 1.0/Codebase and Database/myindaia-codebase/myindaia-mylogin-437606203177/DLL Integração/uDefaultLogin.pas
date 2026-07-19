unit uDefaultLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBXMSSQL, DB, SqlExpr, FMTBcd, ADODB, ActiveX;

type
  TfrmDefaultLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    Con: TADOConnection;
    qryUsuario: TADOQuery;
    qryUsuarioCD_USUARIO: TStringField;
    qryUsuarioNM_USUARIO: TStringField;
    qryUsuarioNM_EMAIL: TStringField;
    qryUsuarioCD_CARGO: TStringField;
    qryUsuarioIN_ATIVO: TStringField;
    qryUsuarioNM_CARGO: TStringField;
    qryUsuarioQT_SENHA_INCORRETA: TIntegerField;
    qryUsuarioQT_SENHA_ERRADA_PARAM: TIntegerField;
    procedure edtLoginKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ExecuteLoginDialog: Boolean;

  function GetLoginName: String;
  function GetPassword: String;
  function GetUserCode: String;
  function GetUserName: String;
  function GetUserEmail: String;
  function GetCargoCode: String;
  function GetCargoName: String;

var
  frmDefaultLogin: TfrmDefaultLogin;

implementation

const
  _CONNECTION_STRING = 'Provider=SQLOLEDB.1;Password=%P;Persist Security Info=True;User ID=%U;Initial Catalog=BROKER;Data Source=INDAIA10';

var
  FLoginName: String = '';
  FPassword: String = '';
  FUserCode: String = '';
  FUserName: String = '';
  FUserEmail: String = '';
  FCargoCode: String = '';
  FCargoName: String = '';

{$R *.dfm}

function ExecuteLoginDialog: Boolean;
begin
  Application.CreateForm(TfrmDefaultLogin, frmDefaultLogin);
  try
    Result := frmDefaultLogin.ShowModal = mrOk;
  finally
    FreeAndNil(frmDefaultLogin);
  end;
end;

function GetLoginName: String;
begin
  Result := FLoginName;
end;

function GetPassword: String;
begin
  Result := FPassword;
end;

function GetUserCode: String;
begin
  Result := FUserCode;
end;

function GetUserName: String;
begin
  Result := FUserName;
end;

function GetUserEmail: String;
begin
  Result := FUserEmail;
end;

function GetCargoCode: String;
begin
  Result := FCargoCode;
end;

function GetCargoName: String;
begin
  Result := FCargoName;
end;

{ TfrmDefaultLogin }

procedure TfrmDefaultLogin.btnOkClick(Sender: TObject);
var
  qtTentativas : integer;
begin
  if (edtLogin.Text = '') or SameText(edtLogin.Text, 'sa') then
  begin
    MessageDlg('Login inválido.'#13'Favor verificar se login e tentar novamente.', mtInformation, [mbOk], 0);
    edtLogin.SetFocus;
  end
  else if edtSenha.Text = '' then
  begin
    MessageDlg('Favor digitar sua senha e tentar novamente.', mtInformation, [mbOk], 0);
    edtSenha.SetFocus;
  end
  else
  begin
    if Con.Connected then
      Con.Close;

    Con.ConnectionString := StringReplace(StringReplace(_CONNECTION_STRING, '%U', edtLogin.Text, [rfIgnoreCase]), '%P', edtSenha.Text, [rfIgnoreCase]);

    try
      Con.Open;
    except
      on E: Exception do
      begin

        if Con.Connected then
          Con.Close;
        //conecta com o usuario sa para verificar se o usuario existe. se existe, conta a quantidade de tentativas erradas pra bloquear o usuario
        Con.ConnectionString := StringReplace(StringReplace(_CONNECTION_STRING, '%U', 'SA', [rfIgnoreCase]), '%P', '123', [rfIgnoreCase]);
        Con.Open;

        if qryUsuario.Active then
          qryUsuario.Close;

        qryUsuario.Parameters.ParamByName('NM_LOGIN').Value := edtLogin.Text;
        qryUsuario.Open;

        //usuario existe!
        if qryUsuario.RecordCount > 0 then
        begin
          qtTentativas := ((qryUsuario.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger -
                            (qryUsuario.FieldByName('QT_SENHA_INCORRETA').asinteger)));

          if qtTentativas > 0 then
          with TAdoQuery.Create(Application) do
          begin
            Connection := Con;
            Close;
            SQL.Add(' UPDATE TUSUARIO                                       '+
                    '    SET QT_SENHA_INCORRETA = QT_SENHA_INCORRETA + 1    '+
                    '   FROM TUSUARIO (NOLOCK)                              '+
                    '  WHERE CD_USUARIO = '''+ qryUsuarioCD_USUARIO.AsString  +''' ');
            ExecSql;
            Free;
          end;

          if ((qtTentativas-1) <=0) then
          begin
            MessageDlg('Usuario bloqueado.'#13'Favor entrar em contato com o suporte.', mtError, [mbOk], 0);
            exit;
          end
          else
          begin
            MessageDlg('Erro efetuando login.'+#13+
                       'Verifique seu login e senha.'+#13+
                       'Quantidade de tentativas restantes: '+inttostr(qtTentativas-1), mtError, [mbOk], 0);
            exit;
          end;
        end
        else
        begin
          MessageDlg('Erro efetuando login.'#13'Favor verificar seu login e senha.', mtError, [mbOk], 0);
          Exit;
        end;
      end;
    end;

    // se chegou aqui, é porque o login estava certo.
    //agora precisa verificar se o usuario está bloqueado

    if qryUsuario.Active then
      qryUsuario.Close;
    qryUsuario.Parameters.ParamByName('NM_LOGIN').Value := edtLogin.Text;
    try
      qryUsuario.Open;
    except
      on E: Exception do
      begin
        MessageDlg('Erro recuperando dados do usuário.'#13'Favor tentar novamente dentro de alguns instantes.'#13 + E.Message, mtError, [mbOk], 0);
        Exit;
      end;
    end;

    if qryUsuarioIN_ATIVO.AsString <> '1' then
    begin
      MessageDlg('Conta de usuário inativa.', mtInformation, [mbOk], 0);
      Exit;
    end;

    qtTentativas := ((qryUsuario.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger -
                      qryUsuario.FieldByName('QT_SENHA_INCORRETA').asinteger));

    if qtTentativas <= 0 then
    begin
      MessageDlg('Usuario bloqueado.'#13'Favor entrar em contato com o suporte.', mtInformation, [mbOk], 0);
      Exit;
    end;

    if qtTentativas <> qryUsuario.FieldByName('QT_SENHA_ERRADA_PARAM').asinteger then
    with TAdoQuery.Create(Application) do
    begin
      Connection := Con;
      Close;
      SQL.Add(' UPDATE TUSUARIO                '+
              '    SET QT_SENHA_INCORRETA = 0  '+
              '   FROM TUSUARIO (NOLOCK)       '+
              '  WHERE CD_USUARIO = '''+ qryUsuarioCD_USUARIO.AsString  +''' ');
      ExecSql;
      Free;
    end;

    FLoginName := edtLogin.Text;
    FPassword  := edtSenha.Text;
    FUserCode  := qryUsuarioCD_USUARIO.AsString;
    FUserName  := qryUsuarioNM_USUARIO.AsString;
    FUserEmail := qryUsuarioNM_EMAIL.AsString;
    FCargoCode := qryUsuarioCD_CARGO.AsString;
    FCargoName := qryUsuarioNM_CARGO.AsString;

    qryUsuario.Close;
    Con.Close;

    ModalResult := mrOk;
  end;
end;

procedure TfrmDefaultLogin.edtLoginKeyPress(Sender: TObject; var Key: Char);
begin
 { if not CharInSet(Key, ['A'..'Z', 'a'..'z', '0'..'9', '.', '_', #8, #13, #27, #17]) then}
  {alterado por agatha nigro 27/03/2018}
  if not CharInSet(Key, ['A'..'Z',
                         'a'..'z',
                         '0'..'9',
                         '[', ']', '!', '@',
                         '#', '$', '%', '^',
                         '&', '*', '(', ')',
                         '_', '+', '-', '=',
                         '{', '}', ';', '''',
                         ':', '"', '\', '/',
                         '|', ',', '<', '>',
                         '.', '?',
                         #8, #13, #27
                          ]) then
    Key := #0;
end;

initialization
  CoInitialize(nil);

finalization
  CoUninitialize;

end.
