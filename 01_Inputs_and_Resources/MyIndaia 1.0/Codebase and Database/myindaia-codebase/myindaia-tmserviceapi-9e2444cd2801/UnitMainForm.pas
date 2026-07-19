unit UnitMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    btnIniciar: TButton;
    btnParar: TButton;
    Label1: TLabel;
    procedure btnIniciarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
  private
    Thread: TThread;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses TMWidowsService, TMDataModule;

procedure TFormMain.btnIniciarClick(Sender: TObject);
begin
  btnIniciar.Enabled := not btnIniciar.Enabled;
  btnParar.Enabled := not btnParar.Enabled;
  Thread := TThread.CreateAnonymousThread( procedure
  var
    Started: Boolean;
  begin
    ServiceTMApi.ServiceStart(ServiceTMApi, Started);
    ServiceTMApi.ServiceExecute(ServiceTMApi);
  end);
  Thread.Start();
end;

procedure TFormMain.btnPararClick(Sender: TObject);
var
  Stopped: Boolean;
begin
  btnIniciar.Enabled := not btnIniciar.Enabled;
  btnParar.Enabled := not btnParar.Enabled;
  ServiceTMApi.ServiceStop(ServiceTMApi, Stopped);
  Thread.Terminate;
end;

end.
