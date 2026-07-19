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
    leIntevalo: TLabeledEdit;
    leInicio: TMaskEdit;
    leFim: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblSelectTop: TLabeledEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btTestarGRClick(Sender: TObject);
    procedure lblSelectTopKeyPress(Sender: TObject; var Key: Char);

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
  leIntevalo.Text              := IntToStr(LocalSettings.Intervalo);
  leInicio.Text                := LocalSettings.InicioIntegracao;
  leFim.text                   := LocalSettings.FimIntegracao;
  lblSelectTop.Text            := InttoStr(LocalSettings.QtRegistros);
end;

procedure TfrmPreferencia.FormShow(Sender: TObject);
begin
  Carregaconfiguracao;
end;

procedure TfrmPreferencia.lblSelectTopKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['1','2','3','4','5','6','7','8','9','0']) then
    key :=#0;
end;

procedure TfrmPreferencia.SalvaConfiguracao;
begin
  LocalSettings.Intervalo        := StrToIntDef(leIntevalo.Text, 0);
  LocalSettings.InicioIntegracao := leInicio.Text;
  LocalSettings.FimIntegracao    := leFim.text;
  LocalSettings.QtRegistros      := StrToIntDef(lblSelectTop.Text,200);
  LocalSettings.SaveConfig;
end;

end.
