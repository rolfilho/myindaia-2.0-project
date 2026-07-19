program TMService;

uses
  System.SysUtils,
  Vcl.SvcMgr,
  Vcl.Forms,
  TMWidowsService in 'TMWidowsService.pas' {ServiceTMApi: TService},
  TMServiceApi in 'TMServiceApi.pas',
  TMServiceApiImpl in 'TMServiceApiImpl.pas',
  TMDataModule in 'TMDataModule.pas' {DMBroker: TDataModule},
  Utils in 'Utils.pas',
  UnitMainForm in 'UnitMainForm.pas' {FormMain};

{$R *.RES}

begin
  if FindCmdLineSwitch('run') or
     FindCmdLineSwitch('install') or
     FindCmdLineSwitch('uninstall') then
  begin
    Ambiente := Producao;
    if not Vcl.SvcMgr.Application.DelayInitialize or Vcl.SvcMgr.Application.Installing then
      Vcl.SvcMgr.Application.Initialize;
    Vcl.SvcMgr.Application.CreateForm(TServiceTMApi, ServiceTMApi);
    Vcl.SvcMgr.Application.Run;
  end
  else
  begin
//    Ambiente := Homologacao;
    Vcl.Forms.Application.Initialize;
    Vcl.Forms.Application.CreateForm(TFormMain, FormMain);
    Vcl.Forms.Application.CreateForm(TServiceTMApi, ServiceTMApi);
    if UPPERCASE(Config.DBServidor) = 'INDAIA10' then
    begin
      Ambiente := Producao;
      FormMain.Label1.Caption := 'Produção';
    end
    else
    begin
      Ambiente := Homologacao;
      FormMain.Label1.Caption := 'Homologação';
    end;

    Vcl.Forms.Application.Run;
  end;
end.
