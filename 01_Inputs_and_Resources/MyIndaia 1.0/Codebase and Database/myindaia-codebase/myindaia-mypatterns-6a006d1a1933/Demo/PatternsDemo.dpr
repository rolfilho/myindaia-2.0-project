program PatternsDemo;

uses
  Vcl.Forms,
  MainDemo in 'MainDemo.pas' {formMainDemo},
  DelphiUp in '..\DelphiUp.pas',
  MyJSON in '..\MyJSON.pas',
  MyMainBasic in '..\MyMainBasic.pas' {formMyMainBasic},
  MyMainEnterprise in '..\MyMainEnterprise.pas' {formMyMainEnterprise},
  MyForm in '..\MyForm.pas' {formMyForm},
  MyCdBasic in '..\MyCdBasic.pas' {formMyCdBasic},
  MyAuditoria in '..\MyAuditoria.pas',
  MyGlobal in '..\MyGlobal.pas',
  MyQuery in '..\MyQuery.pas',
  MyUtil in '..\MyUtil.pas',
  DemoEntities in 'DemoEntities.pas',
  ConnectionModule in 'ConnectionModule.pas' {FireDacMSSQLConnection: TDataModule},
  CdClientes in 'CdClientes.pas' {formCdClientes},
  MyAuditoriaConsulta in '..\MyAuditoriaConsulta.pas' {formMyauditoriaConsulta},
  MyDialog in '..\MyDialog.pas',
  MyCdMasterDetail in '..\MyCdMasterDetail.pas' {formMyCdMasterDetail},
  MvNotas in 'MvNotas.pas' {formMyMvNotasFisais},
  CdProduto in 'CdProduto.pas' {formMyCdProduto},
  SQLiteConnectionModule in 'SQLiteConnectionModule.pas' {SQLiteConnection: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMainDemo, formMainDemo);
  Application.Run;
end.
