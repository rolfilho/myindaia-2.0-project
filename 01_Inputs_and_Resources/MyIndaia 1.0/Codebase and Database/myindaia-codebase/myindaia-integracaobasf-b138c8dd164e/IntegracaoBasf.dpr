program IntegracaoBasf;

uses
  Vcl.Forms,
  dmPrincipal in 'dmPrincipal.pas' {DataModule1: TDataModule},
  TelaPrincipal in 'TelaPrincipal.pas' {formIntegracaoBasf},
  NsiInterfaceSOAPPort in 'NsiInterfaceSOAPPort.pas',
  NsiInterfaceSOAPPort1 in 'NsiInterfaceSOAPPort1.pas',
  uManipulacaoArquivos in 'integracoesSource\uManipulacaoArquivos.pas',
  Utils in 'integracoesSource\Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformIntegracaoBasf, formIntegracaoBasf);
  Application.Run;
end.
