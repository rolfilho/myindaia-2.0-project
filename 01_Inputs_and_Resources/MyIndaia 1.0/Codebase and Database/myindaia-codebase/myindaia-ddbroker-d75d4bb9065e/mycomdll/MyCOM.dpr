library MyCOM;

{%File 'IntegraPlan.asp'}

uses

  ComServ,
  MyCOM_TLB in 'MyCOM_TLB.pas',
  uIntegraPlan in 'uIntegraPlan.pas' {IntegraPlan: CoClass},
  uFuncoes in 'uFuncoes.pas',
  IntegraSG in 'IntegraSG.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin

  Log('Iniciou DLL');

end.



