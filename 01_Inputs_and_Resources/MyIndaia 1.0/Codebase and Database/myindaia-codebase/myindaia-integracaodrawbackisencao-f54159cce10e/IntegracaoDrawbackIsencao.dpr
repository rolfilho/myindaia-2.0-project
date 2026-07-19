program IntegracaoDrawbackIsencao;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  udmMain in 'udmMain.pas' {dmMain: TDataModule},
  uFrmIntegracaoExcel in 'uFrmIntegracaoExcel.pas' {frmIntegracaoExcel},
  utils in 'utils.pas',
  uIntegracaoWebServiceRest in 'uIntegracaoWebServiceRest.pas',
  uFrmIntegracaoDrawBackIsencao in 'uFrmIntegracaoDrawBackIsencao.pas' {FrmIntegracaoDrawBackIsencao},
  uManipulacaoArquivos in 'uManipulacaoArquivos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
