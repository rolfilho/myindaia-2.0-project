unit uPreferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Registry, Vcl.Mask;

type
  TfrmPreferencia = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tsGR: TTabSheet;
    lblEmailValidacao: TLabeledEdit;
    leIntevalo: TLabeledEdit;
    lbledtEndereco: TLabeledEdit;
    lbledtPorta: TLabeledEdit;
    lbledtUsuario: TLabeledEdit;
    lbledtSenha: TLabeledEdit;
    lbledtPastaDownload: TLabeledEdit;
    Label1: TLabel;
    lbledtPastaUpload: TLabeledEdit;
    chbIntegracao: TCheckBox;
    chbRetornoExpo: TCheckBox;
    chbRetornoImpo: TCheckBox;
    leInicio: TMaskEdit;
    leFim: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    chbIntegracaoImpo: TCheckBox;
    chbIntegracaoExpo: TCheckBox;
    chbMoverArquivosErroImpo: TCheckBox;
    chbMoverArquivosErroExpo: TCheckBox;
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
  if dmdBroker.dbBroker.Connected then
    ShowMessage('Conexão efetuada com sucesso.')
  else
    ShowMessage('Erro.')
end;

procedure TfrmPreferencia.Carregaconfiguracao;
begin
  LocalSettings.ReadConfig;
  leIntevalo.Text            := IntToStr(LocalSettings.Intervalo);
  chbIntegracao.Checked      := LocalSettings.Integracao;
  chbRetornoExpo.Checked     := LocalSettings.RetornoExpo;
  chbRetornoImpo.Checked     := LocalSettings.RetornoImpo;
  lbledtEndereco.Text        := LocalSettings.FTPEndereco;
  lbledtPorta.Text           := LocalSettings.FTPPorta;
  lbledtPastaDownload.Text   := LocalSettings.FTPPastaDownload;
  lbledtPastaUpload.Text     := LocalSettings.FTPPastaUpload;
  lbledtUsuario.Text         := LocalSettings.FTPUsuario;
  lbledtSenha.Text           := LocalSettings.FTPSenha;
  lblEmailValidacao.text     := LocalSettings.EmailValidacao;
  leInicio.Text              := LocalSettings.InicioIntegracao;
  leFim.text                 := LocalSettings.FimIntegracao;
  chbIntegracaoExpo.Checked  := LocalSettings.IntegracaoExpo;
  chbIntegracaoImpo.Checked  := LocalSettings.IntegracaoImpo;
  chbMoverArquivosErroExpo.Checked := LocalSettings.MoverArquivosErroImpo;
  chbMoverArquivosErroImpo.Checked := LocalSettings.MoverArquivosErroExpo;
end;

procedure TfrmPreferencia.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferencia.SalvaConfiguracao;
begin
  LocalSettings.Intervalo        := StrToIntDef(leIntevalo.Text, 0);
  LocalSettings.Integracao       := chbIntegracao.Checked;
  LocalSettings.RetornoExpo      := chbRetornoExpo.Checked;
  LocalSettings.RetornoImpo      := chbRetornoImpo.Checked;
  LocalSettings.FTPEndereco      := lbledtEndereco.Text;
  LocalSettings.FTPPorta         := lbledtPorta.Text;
  LocalSettings.FTPPastaDownload := lbledtPastaDownload.Text;
  LocalSettings.FTPPastaUpload   := lbledtPastaUpload.Text;
  LocalSettings.FTPUsuario       := lbledtUsuario.Text;
  LocalSettings.FTPSenha         := lbledtSenha.Text;
  LocalSettings.EmailValidacao   := lblEmailValidacao.text;
  LocalSettings.InicioIntegracao := leInicio.Text;
  LocalSettings.FimIntegracao    := leFim.text;
  LocalSettings.IntegracaoExpo   := chbIntegracaoExpo.Checked;
  LocalSettings.IntegracaoImpo   := chbIntegracaoImpo.Checked;
  LocalSettings.MoverArquivosErroImpo  :=chbMoverArquivosErroImpo.Checked;
  LocalSettings.MoverArquivosErroExpo  :=chbMoverArquivosErroExpo.Checked;
  LocalSettings.SaveConfig;
end;

end.
