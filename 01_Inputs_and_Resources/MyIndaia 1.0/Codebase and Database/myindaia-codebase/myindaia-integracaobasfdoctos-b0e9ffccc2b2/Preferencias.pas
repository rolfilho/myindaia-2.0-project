unit Preferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, dmPrincipal,
  System.ImageList, Vcl.ImgList, utils, uManipulacaoArquivos, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type

  TfrmPreferenciasBanco = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl: TPageControl;
    tbsDadosIntegracao: TTabSheet;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    Label1: TLabel;
    edtDiretorioOrigem: TButtonedEdit;
    tbsConfig: TTabSheet;
    edtIntervaloMinutos: TLabeledEdit;
    ilsEditButtons: TImageList;
    Label5: TLabel;
    edtDiasLog: TLabeledEdit;
    Label6: TLabel;
    edtDiretorioDestino: TButtonedEdit;
    Label4: TLabel;
    procedure sbSalvarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDiretorioOrigemRightButtonClick(Sender: TObject);
    procedure edtDiretorioDestinoRightButtonClick(Sender: TObject);
  private
    procedure SalvarConfiguracao;
    procedure LerConfiguracao;
    procedure PersistirConfiguracoes;
  public
    FUltimaExecucao: TDateTime;
    FTempoRestante: Integer;
    { Public declarations }
  end;

var
  frmPreferenciasBanco: TfrmPreferenciasBanco;

implementation

{$R *.dfm}

procedure TfrmPreferenciasBanco.edtDiretorioDestinoRightButtonClick(
  Sender: TObject);
var
  FileOpenDialog: TFileOpenDialog;
begin
  FileOpenDialog := TFileOpenDialog.Create(nil);
  try
    FileOpenDialog.Options := [fdoPickFolders];
    if FileOpenDialog.Execute then
      edtDiretorioDestino.Text := FileOpenDialog.FileName;
  finally
    FileOpenDialog.Free;
  end;
end;

procedure TfrmPreferenciasBanco.edtDiretorioOrigemRightButtonClick(
  Sender: TObject);
var
  FileOpenDialog: TFileOpenDialog;
begin
  FileOpenDialog := TFileOpenDialog.Create(nil);
  try
    FileOpenDialog.Options := [fdoPickFolders];
    if FileOpenDialog.Execute then
      edtDiretorioOrigem.Text := FileOpenDialog.FileName;
  finally
    FileOpenDialog.Free;
  end;
end;

procedure TfrmPreferenciasBanco.FormShow(Sender: TObject);
begin
  LerConfiguracao;
end;

procedure TfrmPreferenciasBanco.LerConfiguracao;
begin
  edtDiretorioOrigem.Text := DataModule1.DirOrigem;
  edtDiretorioDestino.Text := DataModule1.DirDestino;
  edtIntervaloMinutos.text := DataModule1.IntervaloMinutos;
  edtDiasLog.text := DataModule1.DiasLog;
end;

procedure TfrmPreferenciasBanco.SalvarConfiguracao;
begin
  DataModule1.DirOrigem := edtDiretorioOrigem.Text;
  DataModule1.DirDestino := edtDiretorioDestino.Text;
  DataModule1.IntervaloMinutos := edtIntervaloMinutos.Text;
  DataModule1.DiasLog := edtDiasLog.Text;
  PersistirConfiguracoes;
end;

procedure TfrmPreferenciasBanco.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPreferenciasBanco.sbSalvarClick(Sender: TObject);
begin
  SalvarConfiguracao;
  Close;
end;

//procedure TfrmPreferenciasBanco.VerificaHoraDeleteArquivos;
//begin
//  if (Time >= StrToTime('07:00:00')) and (Time <= StrToTime('08:00:00')) and
//    (FUltimaExecucao < Date)then
//  begin
//    DeletaArquivos(CaminhosArquivos.ArquivosLog, '.txt', 60);
//    FUltimaExecucao := Date;
//  end;
//end;


procedure TfrmPreferenciasBanco.PersistirConfiguracoes;
begin
    DataModule1.EscreveConfiguracao(cfgBasfDoctos_DirOrigem, DataModule1.DirOrigem);
    DataModule1.EscreveConfiguracao(cfgBasfDoctos_DirDestino, DataModule1.DirDestino);
    DataModule1.EscreveConfiguracao(cfgBasfDoctos_IntervaloMinutos, DataModule1.IntervaloMinutos);
    DataModule1.EscreveConfiguracao(cfgBasfDoctos_DiasLog, DataModule1.DiasLog);
end;

end.
