unit uPreferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.FileCtrl, System.ImageList, Vcl.ImgList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, uConexoesIntegracoes,
  IdFTP;

type
  TfrmPreferenciaCfg = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tsBanco: TTabSheet;
    leSenha: TLabeledEdit;
    leBanco: TLabeledEdit;
    leServidor: TLabeledEdit;
    leUsuario: TLabeledEdit;
    btTestarGR: TBitBtn;
    tsGeral: TTabSheet;
    leIntevalo: TLabeledEdit;
    leCodigoCliente: TLabeledEdit;
    leURLFtp: TLabeledEdit;
    leUsuarioFtp: TLabeledEdit;
    leSenhaFtp: TLabeledEdit;
    leUnidade: TLabeledEdit;
    leProduto: TLabeledEdit;
    lePathFTP: TLabeledEdit;
    bePathLocal: TButtonedEdit;
    Label1: TLabel;
    ilsEditButtons: TImageList;
    lePathFTPUpload: TLabeledEdit;
    btnTestarPrefGeralCFG: TBitBtn;
    IdFTP: TIdFTP;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btTestarGRClick(Sender: TObject);
    procedure bePathLocalRightButtonClick(Sender: TObject);
    procedure btnTestarPrefGeralCFGClick(Sender: TObject);
  private
    procedure Carregaconfiguracao;
    procedure SalvaConfiguracao;
  public
    { Public declarations }
  end;

var
  frmPreferenciaCfg: TfrmPreferenciaCfg;

implementation

uses
  dmPrincipal, Settings;

{$R *.dfm}

procedure TfrmPreferenciaCfg.BitBtn1Click(Sender: TObject);
begin
  Close;
end;


procedure TfrmPreferenciaCfg.btnTestarPrefGeralCFGClick(Sender: TObject);
begin

  IntegracaoSFTP := TIntegracaoSFTP.Create;

//  if DataModule1.LerConfiguracao(cfgDraftAmbiente).Equals('P') then
//    IntegracaoSFTP.Ambiente := Producao;
//  else
//    IntegracaoSFTP.Ambiente := Homologacao;

  IntegracaoSFTP.Usuario := leUsuarioFtp.Text;
  IntegracaoSFTP.Senha := leSenhaFtp.Text;
  IntegracaoSFTP.Endereco := leURLFtp.Text;
//  IntegracaoSFTP.Porta := 22;

//  IntegracaoSFTP.HomologUsuario := DataModule1.LerConfiguracao(cfgDraftUsuarioFtpHomologacao);//'i0003534';
//  IntegracaoSFTP.HomologSenha := DataModule1.LerConfiguracao(cfgDraftSenhaFtpHomologacao);//'LS0htJiu';
//  IntegracaoSFTP.HomologEndereco := DataModule1.LerConfiguracao(cfgDraftEndFtpHomologacao);//'ftp.cvt.inttra.com';
//  IntegracaoSFTP.HomologPorta := 22;

  if IntegracaoSFTP.Conectar then
    ShowMessage('Conectado com sucesso ao FTP.')
  else
    ShowMessage('ERRO ao tentar conectar ao FTP.');


//  IdFTP.Host := leURLFtp.Text;
//  IdFTP.Username := leUsuarioFtp.Text;
//  IdFTP.Password := leSenhaFtp.Text;
//
//  try
//    try
//      IdFTP.Connect;
//      if IdFTP.Connected then
//        ShowMessage('Conectado com sucesso ao FTP.')
//      else
//        ShowMessage('ERRO ao tentar conectar ao FTP.');
//
//    finally
//      IdFTP.Disconnect;
//    end;
//
//  except
//    on E: Exception do
//      ShowMessage('ERRO ao tentar conectar ao FTP.' + #13#10 + e.Message);
//  end;
end;

procedure TfrmPreferenciaCfg.BitBtn3Click(Sender: TObject);
begin
  SalvaConfiguracao;
  Close;
end;

procedure TfrmPreferenciaCfg.btTestarGRClick(Sender: TObject);
begin
  DataModule1.ConfiguraConexaoBroker(leServidor.Text, leBanco.Text, leUsuario.Text, leSenha.Text);
  if DataModule1.FDConnection1.Connected then
    ShowMessage('Conexão efetuada com sucesso.')
  else
    ShowMessage('Erro.')
end;

procedure TfrmPreferenciaCfg.bePathLocalRightButtonClick(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
    try
      Options := [fdoPickFolders];
      if Execute then
        bePathLocal.Text := FileName;
    finally
      Free;
    end;
end;

procedure TfrmPreferenciaCfg.Carregaconfiguracao;
begin
  LocalSettings.ReadConfig;
  leServidor.Text := LocalSettings.ServidorBroker;
  leBanco.Text := LocalSettings.BancoBroker;
  leUsuario.Text := LocalSettings.UsuarioBroker;
  leSenha.Text := LocalSettings.SenhaBroker;
  leIntevalo.Text := IntToStr(LocalSettings.Intervalo);
  leCodigoCliente.Text := LocalSettings.CodigoCliente;
  leURLFtp.Text := LocalSettings.URLFTP_TESTE;
  leUsuarioFtp.Text := LocalSettings.UsuarioFTP;
  leSenhaFtp.Text := LocalSettings.SenhaFTP;
  leUnidade.Text := LocalSettings.Unidade;
  leProduto.Text := LocalSettings.Produto;
  lePathFTP.Text := LocalSettings.PathFTPDownload;
  lePathFTPUpload.Text := LocalSettings.PathFTPUpload;
  bePathLocal.Text := LocalSettings.PathLocal;
end;

procedure TfrmPreferenciaCfg.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferenciaCfg.SalvaConfiguracao;
begin
  LocalSettings.ServidorBroker := leServidor.Text;
  LocalSettings.BancoBroker := leBanco.Text;
  LocalSettings.UsuarioBroker := leUsuario.Text;
  LocalSettings.SenhaBroker := leSenha.Text;
  LocalSettings.Intervalo := StrToIntDef(leIntevalo.Text, 0);
  LocalSettings.CodigoCliente := leCodigoCliente.Text;
  LocalSettings.URLFTP_TESTE := leURLFtp.Text;
  LocalSettings.UsuarioFTP := leUsuarioFtp.Text;
  LocalSettings.SenhaFTP := leSenhaFtp.Text;
  LocalSettings.Unidade := leUnidade.Text;
  LocalSettings.Produto := leProduto.Text;
  LocalSettings.PathFTPDownload := lePathFTP.Text;
  LocalSettings.PathFTPUpload := lePathFTPUpload.Text;
  LocalSettings.PathLocal := bePathLocal.Text;
  //
  LocalSettings.SaveConfig;
end;

end.
