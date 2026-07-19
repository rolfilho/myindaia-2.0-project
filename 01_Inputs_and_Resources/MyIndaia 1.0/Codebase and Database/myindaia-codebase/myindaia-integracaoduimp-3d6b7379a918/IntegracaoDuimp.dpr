program IntegracaoDuimp;

uses
  Vcl.Forms,
  DadosGeraisDuimp in 'DadosGeraisDuimp.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  Principal in 'Principal.pas' {Form1},
  dmDuimp in 'dmDuimp.pas' {dtmDuimp: TDataModule},
  DadosItensDuimp in 'DadosItensDuimp.pas',
  uAtributosDuimp in 'uAtributosDuimp.pas' {frmAtributosDuimp},
  uFormDuimpView in 'uFormDuimpView.pas' {FormDuimpView},
  MyDialog in 'MyDialog.pas',
  uJsonAtributosAdicionaisTributos in 'uJsonAtributosAdicionaisTributos.pas',
  uAtributosFundamento in 'uAtributosFundamento.pas' {frmAtributosFundamento},
  uIntegracaoAPIs in 'uIntegracaoAPIs.pas',
  uAtributosTributo in 'uAtributosTributo.pas' {frmAtributosTributo},
  uAtributosTributarios in 'uAtributosTributarios.pas' {frmAtributosTributarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdtmDuimp, dtmDuimp);
  Application.CreateForm(TfrmAtributosDuimp, frmAtributosDuimp);
  Application.CreateForm(TFormDuimpView, FormDuimpView);
  Application.CreateForm(TfrmAtributosTributo, frmAtributosTributo);
  Application.CreateForm(TfrmAtributosFundamento, frmAtributosFundamento);
  Application.CreateForm(TfrmAtributosTributo, frmAtributosTributo);
  Application.CreateForm(TfrmAtributosTributarios, frmAtributosTributarios);
  //  Application.CreateForm(TfrmAtributosTributarios, frmAtributosTributarios);
  //  Application.CreateForm(TfrmAtributosTributarios, frmAtributosTributarios);
  Application.Run;
end.
