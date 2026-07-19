program TesteMyCom;

uses
  Forms,
  frmTesteMyCom in 'frmTesteMyCom.pas' {formTesteMyCom},
  IntegraSG in 'bin\IntegraSG.pas',
  MyCOM_TLB in 'bin\MyCOM_TLB.pas',
  uFuncoes in 'bin\uFuncoes.pas',
  uIntegraPlan in 'bin\uIntegraPlan.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformTesteMyCom, formTesteMyCom);
  Application.Run;
end.
