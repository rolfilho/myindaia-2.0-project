unit Preferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.DBCtrls,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, REST.Types, System.JSON,
  Data.DB, Vcl.Grids, Vcl.DBGrids, System.IniFiles;

type

  TfrmPreferencias = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl: TPageControl;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    ilsEditButtons: TImageList;
    DataSource1: TDataSource;
    Label5: TLabel;
    lbxHorario: TListBox;
    btnIncluirHr: TButton;
    btnExluirHr: TButton;
    dttHorario: TDateTimePicker;
    procedure sbSalvarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirHrClick(Sender: TObject);
    procedure btnExluirHrClick(Sender: TObject);
  private
    FSFTPConectado: Boolean;
    procedure SalvarConfiguracao;
    procedure LerConfiguracao;
  public
    FPasta: String;
    HorariosExecucao: string;
    Config: TIniFile;
    { Public declarations }
  end;

var
  frmPreferencias: TfrmPreferencias;

implementation

{$R *.dfm}

procedure TfrmPreferencias.btnIncluirHrClick(Sender: TObject);
var
  value : string;
begin
  value := formatdatetime('hh:nn' , dttHorario.DateTime);
  lbxHorario.Items.Add(value);
end;

procedure TfrmPreferencias.btnExluirHrClick(Sender: TObject);
begin
  lbxHorario.DeleteSelected;
end;

procedure TfrmPreferencias.FormShow(Sender: TObject);
var
  horarios : TStrings;
begin
  Config := TIniFile.Create(FPasta + 'Config.ini');
  LerConfiguracao;
end;

procedure TfrmPreferencias.LerConfiguracao;
begin
  lbxHorario.Items.Delimiter := ';';
  lbxHorario.Items.StrictDelimiter := true;
  lbxHorario.Items.DelimitedText := Trim(Config.ReadString('Config', 'HoraExec', ''));
end;

procedure TfrmPreferencias.SalvarConfiguracao;
begin
  Config.WriteString('Config', 'Horaexec', lbxHorario.Items.DelimitedText);
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
