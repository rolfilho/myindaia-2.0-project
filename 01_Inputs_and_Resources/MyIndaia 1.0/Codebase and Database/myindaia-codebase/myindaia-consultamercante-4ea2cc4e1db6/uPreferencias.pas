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
    leSenha: TLabeledEdit;
    leBanco: TLabeledEdit;
    leServidor: TLabeledEdit;
    leUsuario: TLabeledEdit;
    btTestarGR: TBitBtn;
    leIntevalo: TLabeledEdit;
    leIndiceCertificado: TLabeledEdit;
    lblUrl: TLabeledEdit;
    lblPosicaoAtual: TLabeledEdit;
    lblProcessoAtual: TLabeledEdit;
    lblEmailValidacao: TLabeledEdit;
    lblCNPJAtual: TLabeledEdit;
    lblPosicaoCNPJAtual: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    chbAtivoBroker: TCheckBox;
    chbAtivoTerceiros: TCheckBox;
    Label3: TLabel;
    edtUltimaConsulta: TEdit;
    Label4: TLabel;
    mskHoraInicial: TMaskEdit;
    mskHoraFinal: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    rgPeriodo: TRadioGroup;
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
  dmdBroker.ConfiguraConexao(leServidor.Text, leBanco.Text, leUsuario.Text, leSenha.Text);
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
  leServidor.Text           := LocalSettings.Servidor;
  leBanco.Text              := LocalSettings.Banco;
  leUsuario.Text            := LocalSettings.Usuario;
  leSenha.Text              := LocalSettings.Senha;
  leIntevalo.Text           := IntToStr(LocalSettings.Intervalo);
  leIndiceCertificado.Text  := IntToStr(LocalSettings.IndiceCertificado);
  lblUrl.Text               := LocalSettings.URL;
  lblProcessoAtual.Text     := LocalSettings.ProcessoAtual;
  lblPosicaoAtual.Text      := LocalSettings.PosicaoAtual;
  lblEmailValidacao.Text    := LocalSettings.EmailValidacao;
  lblPosicaoCNPJAtual.Text  := LocalSettings.PosicaoCNPJAtual;
  lblCNPJAtual.Text         := LocalSettings.CNPJAtual;
  chbAtivoTerceiros.Checked := LocalSettings.AtivoTerceiros;
  chbAtivoBroker.Checked    := LocalSettings.AtivoBroker;
  edtUltimaConsulta.Text    := LocalSettings.UltimaConsulta;
  mskHoraInicial.Text       := LocalSettings.HoraConsultaInicial;
  mskHoraFinal.Text         := LocalSettings.HoraConsultaFinal;

  if LocalSettings.TPPeriodoConsulta ='MaiorFinal' then
     rgPeriodo.ItemIndex := 0
  else
     rgPeriodo.ItemIndex := 1;

end;

procedure TfrmPreferencia.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferencia.SalvaConfiguracao;
begin
  LocalSettings.Servidor              := leServidor.Text;
  LocalSettings.Banco                 := leBanco.Text;
  LocalSettings.Usuario               := leUsuario.Text;
  LocalSettings.Senha                 := leSenha.Text;
  LocalSettings.Intervalo             := StrToIntDef(leIntevalo.Text, 0);
  LocalSettings.IndiceCertificado     := StrToIntDef(leIndiceCertificado.Text, 0);
  LocalSettings.URL                   := lblUrl.Text;
  LocalSettings.ProcessoAtual         := lblProcessoAtual.Text;
  LocalSettings.PosicaoAtual          := lblPosicaoAtual.Text;
  LocalSettings.EmailValidacao        := lblEmailValidacao.Text;
  LocalSettings.PosicaoCNPJAtual      := lblPosicaoCNPJAtual.Text;
  LocalSettings.CNPJAtual             := lblCNPJAtual.Text;
  LocalSettings.AtivoTerceiros        := chbAtivoTerceiros.Checked;
  LocalSettings.AtivoBroker           := chbAtivoBroker.Checked;
  LocalSettings.UltimaConsulta        := edtUltimaConsulta.Text;
  LocalSettings.HoraConsultaInicial   := mskHoraInicial.Text;
  LocalSettings.HoraConsultaFinal     := mskHoraFinal.Text;

  if rgPeriodo.ItemIndex = 0 then
    LocalSettings.TPPeriodoConsulta := 'MaiorFinal'
  else
    LocalSettings.TPPeriodoConsulta := 'MaiorInicial';

  //
  LocalSettings.SaveConfig;
end;

end.
