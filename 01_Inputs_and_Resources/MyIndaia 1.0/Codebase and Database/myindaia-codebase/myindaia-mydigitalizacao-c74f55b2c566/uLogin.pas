unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDigitalizacaoLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    procedure edtLoginKeyPress(Sender: TObject; var Key: Char);
    procedure edtLoginChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FConStr: String;
    function GetLogin: String;
    function GetSenha: String;
  public
    function Execute: Boolean;
    property Login: String read GetLogin;
    property Senha: String read GetSenha;
  end;

var
  frmDigitalizacaoLogin: TfrmDigitalizacaoLogin;

implementation

uses dDigitalizacao;

{$R *.dfm}

procedure TfrmDigitalizacaoLogin.edtLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', '_', #8]) then
    Key := #0;
end;

procedure TfrmDigitalizacaoLogin.edtLoginChange(Sender: TObject);
begin
  btnOk.Enabled := (edtLogin.Text <> '') and (edtSenha.Text <> '');
end;

function TfrmDigitalizacaoLogin.Execute: Boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TfrmDigitalizacaoLogin.btnOkClick(Sender: TObject);
begin
  with dtmMyIndaiaDigitalizacao do
  begin
    if FConStr = '' then
      FConStr := Connection.ConnectionString;
    if Connection.Connected then
      Connection.Close;
    Connection.ConnectionString := StringReplace(FConStr, 'User ID=SA', 'User ID=' + edtLogin.Text, [rfReplaceAll]) + ';Password=' + edtSenha.Text;
    try
      Connection.Open;
      ModalResult := mrOk;
    except
      on E: Exception do
        MessageDlg('Erro validando Login/Senha.'#13 + E.Message, mtError, [mbOk], 0);
    end;
  end;
end;

function TfrmDigitalizacaoLogin.GetLogin: String;
begin
  Result := edtLogin.Text;
end;

function TfrmDigitalizacaoLogin.GetSenha: String;
begin
  Result := edtSenha.Text;
end;

end.
