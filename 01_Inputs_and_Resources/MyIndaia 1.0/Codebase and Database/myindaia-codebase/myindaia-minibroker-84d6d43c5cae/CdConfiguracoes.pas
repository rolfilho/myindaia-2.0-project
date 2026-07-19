unit CdConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, MyGlobal, dmConfiguracoes;

type

  TformConfiguracoes = class(TformMyForm)
    pnlPrincipal: TPanel;
    PageControl1: TPageControl;
    tbsDraft: TTabSheet;
    Panel1: TPanel;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    Panel2: TPanel;
    rdgDraftAmbiente: TRadioGroup;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    edtDraftEndFTPProducao: TEdit;
    Label13: TLabel;
    edtDraftUsuarioFTPProducao: TEdit;
    edtDraftSenhaFTPProducao: TEdit;
    Label12: TLabel;
    GroupBox2: TGroupBox;
    edtDraftEndFTPHomologacao: TEdit;
    Label10: TLabel;
    Label1: TLabel;
    edtDraftUsuarioFTPHomologacao: TEdit;
    edtDraftSenhaFTPHomologacao: TEdit;
    Label2: TLabel;
    procedure sbSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure IniciaConfiguracao;
    procedure SalvarConfiguracao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfiguracoes: TformConfiguracoes;

implementation

{$R *.dfm}



procedure TformConfiguracoes.sbSalvarClick(Sender: TObject);
begin
  inherited;
  SalvarConfiguracao;
  Close;
end;

procedure TformConfiguracoes.SalvarConfiguracao;
begin

  //Draft
  if rdgDraftAmbiente.ItemIndex = 0 then
    Config.DraftAmbiente := 'P'
  else
    Config.DraftAmbiente := 'H';

  Config.DraftEndFtpProducao := edtDraftEndFTPProducao.Text;
  Config.DraftEndFtpHomologacao := edtDraftEndFTPHomologacao.Text;
  Config.DraftUsuarioFtpProducao := edtDraftUsuarioFTPProducao.Text;
  Config.DraftUsuarioFtpHomologacao := edtDraftUsuarioFTPHomologacao.Text;
  Config.DraftSenhaFtpProducao := edtDraftSenhaFTPProducao.Text;
  Config.DraftSenhaFtpHomologacao := edtDraftSenhaFTPHomologacao.Text;

  dtmConfiguracoes.PersistirConfiguracoes;
end;

procedure TformConfiguracoes.FormShow(Sender: TObject);
begin
  inherited;
  IniciaConfiguracao;
end;

procedure TformConfiguracoes.IniciaConfiguracao;
begin
  //FIESP
  dtmConfiguracoes.CarregarConfiguracoes;
  if Config.DraftAmbiente.Equals('P') then
    rdgDraftAmbiente.ItemIndex := 0
  else
    rdgDraftAmbiente.ItemIndex := 1;

  edtDraftEndFTPProducao.Text := Config.DraftEndFtpProducao;
  edtDraftEndFTPHomologacao.Text := Config.DraftEndFtpHomologacao;
  edtDraftUsuarioFTPProducao.Text := Config.DraftUsuarioFtpProducao;
  edtDraftUsuarioFTPHomologacao.Text := Config.DraftUsuarioFtpHomologacao;
  edtDraftSenhaFTPProducao.Text := Config.DraftSenhaFtpProducao;
  edtDraftSenhaFTPHomologacao.Text := Config.DraftSenhaFtpHomologacao;

end;





end.
