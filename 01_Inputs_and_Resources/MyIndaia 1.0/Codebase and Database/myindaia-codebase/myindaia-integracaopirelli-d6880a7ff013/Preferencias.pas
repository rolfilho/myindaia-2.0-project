unit Preferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, uConexoesIntegracoes, dmPrincipal, uFuncoesEspecificasClientes,
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
    tbsBanco: TTabSheet;
    sbFechar: TSpeedButton;
    sbSalvar: TSpeedButton;
    Label1: TLabel;
    edtEndFTP: TLabeledEdit;
    edtUsuarioFtp: TLabeledEdit;
    edtSenhaFtp: TLabeledEdit;
    edtDiretorioLocal: TButtonedEdit;
    edtDiretorioFTPUpload: TLabeledEdit;
    btnTesteConexao: TBitBtn;
    leSenha: TLabeledEdit;
    leBanco: TLabeledEdit;
    leServidor: TLabeledEdit;
    leUsuario: TLabeledEdit;
    btTestarGR: TBitBtn;
    tbsConfig: TTabSheet;
    edtIntervaloMinutos: TLabeledEdit;
    ilsEditButtons: TImageList;
    lblStatusConexao: TLabel;
    DataSource1: TDataSource;
    qryFilaProcessosTeste: TFDQuery;
    qryFilaProcessosTesteNR_PROCESSO: TStringField;
    Label5: TLabel;
    edtDiasLog: TLabeledEdit;
    Label6: TLabel;
    TabSheet1: TTabSheet;
    btnTesteEnvio: TBitBtn;
    edtPesquisaProcesso: TEdit;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    lblTextoFila: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure sbSalvarClick(Sender: TObject);
    procedure sbFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTesteConexaoClick(Sender: TObject);
    procedure edtDiretorioLocalRightButtonClick(Sender: TObject);
    procedure btnTesteEnvioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPesquisaProcessoChange(Sender: TObject);
  private
    FSFTPConectado: Boolean;
    procedure SalvarConfiguracao;
    procedure LerConfiguracao;
  public

    { Public declarations }
  end;

var
  frmPreferenciasBanco: TfrmPreferenciasBanco;

implementation

{$R *.dfm}

procedure TfrmPreferenciasBanco.btnTesteConexaoClick(Sender: TObject);
begin
  IntegracaoSFTP := TIntegracaoSFTP.Create;

  IntegracaoSFTP.Endereco := edtEndFTP.Text;
  IntegracaoSFTP.Usuario := edtUsuarioFtp.Text;
  IntegracaoSFTP.Senha := edtSenhaFtp.Text;
  IntegracaoSFTP.DirLocal := edtDiretorioLocal.Text;

//  IntegracaoSFTP.Porta := 22;

  if IntegracaoSFTP.Conectar then
  begin
//    ShowMessage('Conectado com sucesso ao FTP.');
    FSFTPConectado := true;
    lblStatusConexao.Caption := 'Conectado';
    lblStatusConexao.Visible := FSFTPConectado;
  end
  else
    ShowMessage('ERRO ao tentar conectar ao FTP.');

end;

procedure TfrmPreferenciasBanco.btnTesteEnvioClick(Sender: TObject);
var
  vMensagem: String;
begin

  if not FSFTPConectado then
    btnTesteConexao.Click;

  if not FSFTPConectado then
    ShowMessage('Não está sendo possível conectar ao servidor de SFTP no momento.')
  else
  begin
    DataModule1.qryArquivosProcessos.Close;
    DataModule1.qryArquivosProcessos.ParamByName('NR_PROCESSO').AsString := qryFilaProcessosTesteNR_PROCESSO.AsString;
    DataModule1.qryArquivosProcessos.Open;
    while not DataModule1.qryArquivosProcessos.Eof do
    begin
      Memo1.Lines.Add('Enviando arquivo: ' + DataModule1.qryArquivosProcessosNOME_ARQUIVO_DESTINO.AsString +
                      ' do processo: ' + qryFilaProcessosTesteNR_PROCESSO.AsString );
      IntegracaoSFTP.EnviarArquivo(edtDiretorioLocal.Text + '\'+ qryFilaProcessosTesteNR_PROCESSO.AsString +'\' + DataModule1.qryArquivosProcessosNM_ARQUIVO.AsString,
                                   edtDiretorioFTPUpload.Text,
                                   DataModule1.qryArquivosProcessosNOME_ARQUIVO_DESTINO.AsString, vMensagem);

      Memo1.Lines.Add(vMensagem);

      DataModule1.qryArquivosProcessos.Next;
    end;

    Memo1.Lines.Add('Teste finalizado.')
  end;
end;

procedure TfrmPreferenciasBanco.edtDiretorioLocalRightButtonClick(
  Sender: TObject);
var
  FileOpenDialog: TFileOpenDialog;
begin
  FileOpenDialog := TFileOpenDialog.Create(nil);
  try
    FileOpenDialog.Options := [fdoPickFolders];
    if FileOpenDialog.Execute then
      edtDiretorioLocal.Text := FileOpenDialog.FileName;
  finally
    FileOpenDialog.Free;
  end;
end;

procedure TfrmPreferenciasBanco.edtPesquisaProcessoChange(Sender: TObject);
begin
  if edtPesquisaProcesso.Text <> '' then
  begin
    qryFilaProcessosTeste.Filter := ' NR_PROCESSO LIKE ' + QuotedStr('%' + edtPesquisaProcesso.Text +'%');
    qryFilaProcessosTeste.Filtered := True;
  end;
end;

procedure TfrmPreferenciasBanco.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDataModule1, DataModule1);
end;

procedure TfrmPreferenciasBanco.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DataModule1);

end;

procedure TfrmPreferenciasBanco.FormShow(Sender: TObject);
begin
  LerConfiguracao;
  FSFTPConectado := false;
  qryFilaProcessosTeste.Close;
  qryFilaProcessosTeste.Open;
  if qryFilaProcessosTeste.recordCount > 0 then
    lblTextoFila.Caption := IntToStr(qryFilaProcessosTeste.recordCount) + ' processos na fila.'
  else
    lblTextoFila.Caption := 'Nenhum processo na fila';
end;

procedure TfrmPreferenciasBanco.LerConfiguracao;
begin

  edtEndFTP.text := IntegracaoSFTP.Endereco;
  edtUsuarioFTP.text := IntegracaoSFTP.Usuario;
  edtSenhaFTP.text := IntegracaoSFTP.Senha;
  edtDiretorioFTPUpload.text := IntegracaoSFTP.DirEnvioFTP;
  edtDiretorioLocal.text := IntegracaoSFTP.DirLocal;
  edtIntervaloMinutos.text := IntegracaoSFTP.IntervaloMinutos;
  edtDiasLog.text := IntegracaoSFTP.DiasLog;

end;

procedure TfrmPreferenciasBanco.SalvarConfiguracao;
begin

  IntegracaoSFTP.Endereco :=  edtEndFTP.text;
  IntegracaoSFTP.Usuario := edtUsuarioFTP.text;
  IntegracaoSFTP.Senha := edtSenhaFTP.text;
  IntegracaoSFTP.DirEnvioFTP := edtDiretorioFTPUpload.Text;
  IntegracaoSFTP.DirLocal := edtDiretorioLocal.Text;

  IntegracaoSFTP.IntervaloMinutos := edtIntervaloMinutos.Text;
  IntegracaoSFTP.DiasLog := edtDiasLog.Text;

  RegraCliente.PersistirConfiguracoes;
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

end.
