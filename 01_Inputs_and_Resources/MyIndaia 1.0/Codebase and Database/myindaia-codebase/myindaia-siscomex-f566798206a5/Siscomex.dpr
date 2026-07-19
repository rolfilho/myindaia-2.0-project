program Siscomex;

uses
  Vcl.Forms,
  Vcl.SvcMgr,
  SysUtils,
  uService in 'uService.pas' {IntegracaoSiscomex: TService},
  KrTaxaCambio in 'KrTaxaCambio.pas',
  KrUtil in 'KrUtil.pas',
  KrAliquota in 'KrAliquota.pas',
  KrConnection in 'KrConnection.pas',
  KrQuery in 'KrQuery.pas',
  Settings in 'Settings.pas',
  uPreferencias in 'uPreferencias.pas' {FormPreferencias},
  uMain in 'uMain.pas' {FormMain};

{$R *.RES}

begin
  if FindCmdLineSwitch('run') or
     FindCmdLineSwitch('install') or
     FindCmdLineSwitch('uninstall') then
  begin
    if not Vcl.SvcMgr.Application.DelayInitialize or Application.Installing then
      Vcl.SvcMgr.Application.Initialize;
    Vcl.SvcMgr.Application.CreateForm(TIntegracaoSiscomex, IntegracaoSiscomex);
    Vcl.SvcMgr.Application.Run;
  end
  else
  begin
    Vcl.Forms.Application.Initialize;
    Vcl.Forms.Application.Title := 'Siscomex';
    Vcl.Forms.Application.CreateForm(TFormMain, FormMain);
    Vcl.Forms.Application.Run;
  end;
end.
