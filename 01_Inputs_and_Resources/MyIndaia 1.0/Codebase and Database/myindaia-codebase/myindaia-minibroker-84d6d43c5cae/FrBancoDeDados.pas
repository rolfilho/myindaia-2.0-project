unit FrBancoDeDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.ExtCtrls, Vcl.StdCtrls,
  ConnectionModule, DatabaseSettings, MyDialog;

type
  TformFrBancoDados = class(TformMyForm)
    Label1: TLabel;
    edtServidor: TEdit;
    Panel1: TPanel;
    Label2: TLabel;
    edtBanco: TEdit;
    edtSenha: TEdit;
    edtUsuario: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Carrega;
    procedure Salvar;
    procedure Testar;
  public
    { Public declarations }
  end;

var
  formFrBancoDados: TformFrBancoDados;

implementation

{$R *.dfm}

procedure TformFrBancoDados.Button1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TformFrBancoDados.Button2Click(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TformFrBancoDados.Button3Click(Sender: TObject);
begin
  inherited;
  Testar;
end;

procedure TformFrBancoDados.Carrega;
begin
  GetDatabaseSettings.ReadConfig;
  edtServidor.Text := GetDatabaseSettings.BancoServidor;
  edtBanco.Text := GetDatabaseSettings.BancoNome;
  edtUsuario.Text := GetDatabaseSettings.BancoUsuario;
  edtSenha.Text := GetDatabaseSettings.BancoSenha;
end;

procedure TformFrBancoDados.FormShow(Sender: TObject);
begin
  inherited;
  Carrega;
end;

procedure TformFrBancoDados.Salvar;
begin
  GetDatabaseSettings.BancoServidor := edtServidor.Text;
  GetDatabaseSettings.BancoNome := edtBanco.Text;
  GetDatabaseSettings.BancoUsuario := edtUsuario.Text;
  GetDatabaseSettings.BancoSenha := edtSenha.Text;
  GetDatabaseSettings.SaveConfig;
end;

procedure TformFrBancoDados.Testar;
begin
  FireDacMSSQL.Configura(edtServidor.Text, edtBanco.Text, edtUsuario.Text, edtSenha.Text, 'MSSQL');
  try
    FireDacMSSQL.Connection.Open;
    Information('Conexão efetuada com sucesso.');
  except
    raise;
  end;
end;

end.
