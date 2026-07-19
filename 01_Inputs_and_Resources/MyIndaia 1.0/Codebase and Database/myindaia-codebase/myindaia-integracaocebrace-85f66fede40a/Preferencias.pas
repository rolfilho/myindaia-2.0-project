unit Preferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, utils, uManipulacaoArquivos, Vcl.DBCtrls,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, REST.Types, System.JSON, RootUnit, DataModule,
  Configuracoes, uIntegracao, Data.DB, Vcl.Grids, Vcl.DBGrids;

type

  TfrmPreferencias = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl: TPageControl;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    tbsConfig: TTabSheet;
    ilsEditButtons: TImageList;
    TabSheet1: TTabSheet;
    lblConectado: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    MemRespostaEnvio: TMemo;
    btnConectar: TButton;
    edtNrProcesso: TEdit;
    memJsonGerado: TMemo;
    btnEnviar: TButton;
    btnGerar: TButton;
    edtHeaderValor: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtUltimoProcesso: TEdit;
    lbxHorario: TListBox;
    btnIncluirHr: TButton;
    btnExluirHr: TButton;
    dttHorario: TDateTimePicker;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    procedure sbSalvarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnIncluirHrClick(Sender: TObject);
    procedure btnExluirHrClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSFTPConectado: Boolean;
    procedure SalvarConfiguracao;
    procedure LerConfiguracao;
  public


    { Public declarations }
  end;

var
  frmPreferencias: TfrmPreferencias;

implementation

{$R *.dfm}

procedure TfrmPreferencias.btnEnviarClick(Sender: TObject);
begin
  MemRespostaEnvio.Lines.Text := Integracao.Envia(memJsonGerado.Lines.Text);
end;

procedure TfrmPreferencias.btnGerarClick(Sender: TObject);
begin

  memJsonGerado.Lines.Text := Integracao.GetJson;

//  DataModule1.QueryConsulta.Filter := ' PROCESSBROKERID = ' + DataModule1.QueryConsultas.fieldByName('PROCESSBROKERID'). //QuotedStr(edtNrProcesso.Text);
//  DataModule1.QueryConsulta.Filtered := true;
//  memJsonGerado.Lines.Text := Integracao.GetJson;
//  DataModule1.QueryConsulta.Filtered := false;
//  DataModule1.QueryConsulta.Close;
end;

procedure TfrmPreferencias.btnIncluirHrClick(Sender: TObject);
var
  value : string;
begin
  value := formatdatetime('hh:nn' , dttHorario.DateTime);
  lbxHorario.Items.Add(value);
end;

procedure TfrmPreferencias.Button1Click(Sender: TObject);
begin
  DataModule1.QueryConsulta.Locate('PROCESSBROKERID', edtNrProcesso.Text, []);
end;

procedure TfrmPreferencias.btnExluirHrClick(Sender: TObject);
begin
  lbxHorario.DeleteSelected;
end;

procedure TfrmPreferencias.btnConectarClick(Sender: TObject);
begin
  lblConectado.Visible := Integracao.Conecta;
end;

procedure TfrmPreferencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule1.QueryConsulta.Close;
end;

procedure TfrmPreferencias.FormShow(Sender: TObject);
var
  horarios : TStrings;
begin
  PageControl.ActivePageIndex := 0;
  LerConfiguracao;

  DataModule1.QueryConsulta.Close;
  DataModule1.QueryConsulta.Open;
end;

procedure TfrmPreferencias.LerConfiguracao;
begin
  lbxHorario.Items.Delimiter := ';';
  lbxHorario.Items.StrictDelimiter := true;
  lbxHorario.Items.DelimitedText := Integracao.HorariosExecucao;

  edtHeaderValor.Text := Integracao.HeaderValor;
  edtUltimoProcesso.Text := Integracao.UltimoProcesso;
end;

procedure TfrmPreferencias.SalvarConfiguracao;
begin

  Integracao.HeaderValor := edtHeaderValor.Text;
  Integracao.HorariosExecucao := lbxHorario.Items.DelimitedText;
  Integracao.UltimoProcesso := edtUltimoProcesso.Text;

  integracao.PersistirConfiguracoes;
end;

procedure TfrmPreferencias.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPreferencias.sbSalvarClick(Sender: TObject);
begin
  SalvarConfiguracao;
  Close;
end;

end.
