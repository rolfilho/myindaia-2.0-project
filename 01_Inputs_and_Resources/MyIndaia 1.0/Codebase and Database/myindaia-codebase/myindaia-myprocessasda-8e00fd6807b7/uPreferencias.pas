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
    leInicio: TMaskEdit;
    leFim: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    chbGerarArquivoSTS: TCheckBox;
    chbProcessaBrokerSTS: TCheckBox;
    chbTransmitirArquivoSTS: TCheckBox;
    chbBaixarGuiaSTS: TCheckBox;
    chbGerarArquivoRJ: TCheckBox;
    chbProcessaBrokerRJ: TCheckBox;
    chbTransmitirArquivoRJ: TCheckBox;
    chbBaixarGuiaRJ: TCheckBox;
    Label1: TLabel;
    Label4: TLabel;
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
  leIntevalo.Text                 := IntToStr(LocalSettings.Intervalo);

  lblEmailValidacao.text          := LocalSettings.EmailValidacao;
  leInicio.Text                   := LocalSettings.InicioIntegracao;
  leFim.text                      := LocalSettings.FimIntegracao;
  leIntevalo.Text                 := inttostr(LocalSettings.Intervalo);

  chbBaixarGuiaSTS.Checked        := LocalSettings.BaixarGuiaSTS;
  chbProcessaBrokerSTS.Checked    := LocalSettings.ProcessarBrokerSTS;
  chbGerarArquivoSTS.Checked      := LocalSettings.GeraArquivoSTS;
  chbTransmitirArquivoSTS.Checked := LocalSettings.TransmiteArquivoSTS;

  chbBaixarGuiaRJ.Checked         := LocalSettings.BaixarGuiaRJ;
  chbProcessaBrokerRJ.Checked     := LocalSettings.ProcessarBrokerRJ;
  chbGerarArquivoRJ.Checked       := LocalSettings.GeraArquivoRJ;
  chbTransmitirArquivoRJ.Checked  := LocalSettings.TransmiteArquivoRJ;
end;

procedure TfrmPreferencia.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferencia.SalvaConfiguracao;
begin
  LocalSettings.Intervalo            := StrToIntDef(leIntevalo.Text, 0);

  LocalSettings.EmailValidacao       := lblEmailValidacao.text;
  LocalSettings.InicioIntegracao     := leInicio.Text;
  LocalSettings.FimIntegracao        := leFim.text;
  LocalSettings.Intervalo            := strtoint(leIntevalo.Text);

  LocalSettings.GeraArquivoSTS       := chbGerarArquivoSTS.Checked;
  LocalSettings.BaixarGuiaSTS        := chbBaixarGuiaSTS.Checked;
  LocalSettings.ProcessarBrokerSTS   := chbProcessaBrokerSTS.Checked;
  LocalSettings.TransmiteArquivoSTS  := chbTransmitirArquivoSTS.Checked;

  LocalSettings.GeraArquivoRJ        := chbGerarArquivoRJ.Checked;
  LocalSettings.BaixarGuiaRJ         := chbBaixarGuiaRJ.Checked;
  LocalSettings.ProcessarBrokerRJ    := chbProcessaBrokerRJ.Checked;
  LocalSettings.TransmiteArquivoRJ   := chbTransmitirArquivoRJ.Checked;

  LocalSettings.SaveConfig;
end;

end.
