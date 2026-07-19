program integracaoCebrace;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  RootUnit in 'RootUnit.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Preferencias in 'Preferencias.pas' {frmPreferencias},
  uManipulacaoArquivos in 'uManipulacaoArquivos.pas',
  Utils in 'Utils.pas',
  uIntegracao in 'uIntegracao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
