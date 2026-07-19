program MyFileManager;

uses
  Forms,
  Windows,
  Principal in 'Principal.pas' {frmMyFileManager},
  Mensagens in 'Mensagens.pas';

{$R *.res}

//var
 // H: HWND;

begin
 { H := FindWindow('TfrmMyFileManager', nil);
  //H := 0;
  if H <> 0 then
  begin
    ShowWindow(H, SW_SHOW);
    SetForegroundWindow(H);
    SetActiveWindow(H);
    Halt;
  end;
  }
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMyFileManager, frmMyFileManager);
  Application.Run;
end.
