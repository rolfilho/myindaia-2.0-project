program ExtratorDeDadosSiscomex;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  DiLeituraXML in 'DiLeituraXML.pas',
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule},
  DueConsultaCompleta in 'DueConsultaCompleta.pas',
  IntegracaoDue in 'IntegracaoDue.pas',
  ParametrosDoSistema in 'ParametrosDoSistema.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  uCadastroDespachantes in 'uCadastroDespachantes.pas' {frmCadastroDespachante},
  uGerarCertificado in 'uGerarCertificado.pas' {frmGerarCertificado},
  uIntegracaoDI in 'uIntegracaoDI.pas' {frmIntegracaoDI},
  uRelatorioImpo in 'uRelatorioImpo.pas' {frmRelatorioImpo},
  uIntegracaoDue in 'uIntegracaoDue.pas' {frmIntegracaoDueNovo},
  uRelatorioExpo in 'uRelatorioExpo.pas' {frmRelatorioExpo},
  DateTimePicker.Interposer in 'DateTimePicker.Interposer.pas',
  KrUtil in 'KrUtil.pas',
  uConsultaAtoConcessorio in 'uConsultaAtoConcessorio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
