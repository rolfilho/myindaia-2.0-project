unit uPreferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons;

type
  TFormPreferencias = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    leLocalArquivosTaxaCambio: TLabeledEdit;
    leSenha: TLabeledEdit;
    leBanco: TLabeledEdit;
    leServidor: TLabeledEdit;
    leUsuario: TLabeledEdit;
    btTestarGR: TBitBtn;
    leLocalArquivosAliquota: TLabeledEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btTestarGRClick(Sender: TObject);
  private
    procedure Salvar;
    procedure Carregar;
  public
    { Public declarations }
  end;

var
  FormPreferencias: TFormPreferencias;

implementation

{$R *.dfm}

uses Settings, KrConnection;

procedure TFormPreferencias.btTestarGRClick(Sender: TObject);
begin
  Salvar;
  BrokerConnection.Open;
  BrokerConnection.Close;
  ShowMessage('Conexão efetuada com sucesso.');
end;

procedure TFormPreferencias.Button1Click(Sender: TObject);
begin
  Salvar;
  Close;
end;

procedure TFormPreferencias.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormPreferencias.Carregar;
begin
  LocalSettings.DefaulValue;
  LocalSettings.ReadConfig;
  //
  leServidor.Text := LocalSettings.BrokerServerName;
  leBanco.Text := LocalSettings.BrokerDatabaseName;
  leUsuario.Text := LocalSettings.BrokerUserName;
  leSenha.Text := LocalSettings.BrokerPassword;
  leLocalArquivosTaxaCambio.Text := LocalSettings.LocalArquivosTaxaCambio;
  leLocalArquivosAliquota.Text := LocalSettings.LocalArquivosAliquota;
end;

procedure TFormPreferencias.FormShow(Sender: TObject);
begin
  Carregar;
end;

procedure TFormPreferencias.Salvar;
begin
  LocalSettings.BrokerServerName := leServidor.Text;
  LocalSettings.BrokerDatabaseName := leBanco.Text;
  LocalSettings.BrokerUserName := leUsuario.Text;
  LocalSettings.BrokerPassword := leSenha.Text;
  LocalSettings.LocalArquivosTaxaCambio := leLocalArquivosTaxaCambio.Text;
  LocalSettings.LocalArquivosAliquota := leLocalArquivosAliquota.Text;
  //
  LocalSettings.SaveConfig;
end;

end.
