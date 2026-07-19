unit uPreferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmPreferencia = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tsGR: TTabSheet;
    leSenha: TLabeledEdit;
    leBanco: TLabeledEdit;
    leServidor: TLabeledEdit;
    leUsuario: TLabeledEdit;
    btTestarGR: TBitBtn;
    leIntevalo: TLabeledEdit;
    leIndiceCertificado: TLabeledEdit;
    leFim: TMaskEdit;
    Label1: TLabel;
    leInicio: TMaskEdit;
    Label2: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btTestarGRClick(Sender: TObject);
  private
    procedure Carregaconfiguracao;
    procedure SalvaConfiguracao;
  public
    { Public declarations }
  end;

var
  frmPreferencia: TfrmPreferencia;

implementation

uses
  DmBroker, Settings;

{$R *.dfm}

procedure TfrmPreferencia.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPreferencia.BitBtn3Click(Sender: TObject);
begin
  SalvaConfiguracao;
  Close;
end;

procedure TfrmPreferencia.btTestarGRClick(Sender: TObject);
begin
  dmdBroker.ConfiguraConexao(leServidor.Text, leBanco.Text, leUsuario.Text, leSenha.Text);
  if dmdBroker.dbBroker.Connected then
    ShowMessage('Conexão efetuada com sucesso.')
  else
    ShowMessage('Erro.')
end;

procedure TfrmPreferencia.Carregaconfiguracao;
begin
  LocalSettings.ReadConfig;
  leServidor.Text := LocalSettings.Servidor;
  leBanco.Text := LocalSettings.Banco;
  leUsuario.Text := LocalSettings.Usuario;
  leSenha.Text := LocalSettings.Senha;
  leIntevalo.Text := IntToStr(LocalSettings.Intervalo);
  leIndiceCertificado.Text := IntToStr(LocalSettings.IndiceCertificado);
  leInicio.Text                   := LocalSettings.InicioIntegracao;
  leFim.text                      := LocalSettings.FimIntegracao;
end;

procedure TfrmPreferencia.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferencia.SalvaConfiguracao;
begin
  LocalSettings.Servidor := leServidor.Text;
  LocalSettings.Banco := leBanco.Text;
  LocalSettings.Usuario := leUsuario.Text;
  LocalSettings.Senha := leSenha.Text;
  LocalSettings.Intervalo := StrToIntDef(leIntevalo.Text, 0);
  LocalSettings.IndiceCertificado := StrToIntDef(leIndiceCertificado.Text, 0);
  LocalSettings.InicioIntegracao     := leInicio.Text;
  LocalSettings.FimIntegracao        := leFim.text;
  //
  LocalSettings.SaveConfig;
end;

end.
