program Demo;

uses
  Vcl.Forms,
  DemoMain in 'DemoMain.pas' {Form2},
  DDENFSeImpl in 'DDENFSeImpl.pas',
  DmMain in 'DmMain.pas' {dmdMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmdMain, dmdMain);
  Application.Run;
end.
