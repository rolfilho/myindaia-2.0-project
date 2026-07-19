program Demo;

uses
  Vcl.Forms,
  UnitDemo in 'UnitDemo.pas' {Form2},
  SendMailIntf in 'SendMailIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
