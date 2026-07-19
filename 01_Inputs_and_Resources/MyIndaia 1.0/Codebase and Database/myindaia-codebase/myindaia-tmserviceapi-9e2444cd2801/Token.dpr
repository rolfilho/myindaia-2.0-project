program Token;

uses
  Vcl.Forms,
  UnitLoginMain in 'UnitLoginMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
