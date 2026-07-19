unit uPreferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.FileCtrl, System.ImageList, Vcl.ImgList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;

type
  TfrmPreferencia = class(TForm)
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
    leUnidade: TLabeledEdit;
    leProduto: TLabeledEdit;
    ilsEditButtons: TImageList;
    leEmailErro: TLabeledEdit;
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
  DmMain, Settings;

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
  dmdMain.ConfiguraConexaoBroker(leServidor.Text, leBanco.Text, leUsuario.Text, leSenha.Text);
  if dmdMain.dbBroker.Connected then
    ShowMessage('Conexão efetuada com sucesso.')
  else
    ShowMessage('Erro.')
end;

procedure TfrmPreferencia.Carregaconfiguracao;
begin
  LocalSettings.ReadConfig;
  leServidor.Text := LocalSettings.ServidorBroker;
  leBanco.Text := LocalSettings.BancoBroker;
  leUsuario.Text := LocalSettings.UsuarioBroker;
  leSenha.Text := LocalSettings.SenhaBroker;
  leIntevalo.Text := IntToStr(LocalSettings.Intervalo);
  leCodigoCliente.Text := LocalSettings.CodigoCliente;
  leUnidade.Text := LocalSettings.Unidade;
  leProduto.Text := LocalSettings.Produto;
  leEmailErro.Text := LocalSettings.EmailErro;
end;

procedure TfrmPreferencia.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferencia.SalvaConfiguracao;
begin
  LocalSettings.ServidorBroker := leServidor.Text;
  LocalSettings.BancoBroker := leBanco.Text;
  LocalSettings.UsuarioBroker := leUsuario.Text;
  LocalSettings.SenhaBroker := leSenha.Text;
  LocalSettings.Intervalo := StrToIntDef(leIntevalo.Text, 0);
  LocalSettings.CodigoCliente := leCodigoCliente.Text;
  LocalSettings.Unidade := leUnidade.Text;
  LocalSettings.Produto := leProduto.Text;
  LocalSettings.EmailErro := leEmailErro.Text;
  //
  LocalSettings.SaveConfig;
end;

end.
