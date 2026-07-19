unit uOpenBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, uMyIndaiaNovo.due.ConsultaNfe, Utils, uMiniBrowser,
  Vcl.ExtCtrls, uMyIndaiaNovo.Booking, ConnectionModule;

type
  TfrmOpenBrowser = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    NomeSistema: String;
    ServerName: String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpenBrowser: TfrmOpenBrowser;

implementation

uses
  Vcl.Dialogs;

{$R *.dfm}

procedure TfrmOpenBrowser.FormShow(Sender: TObject);
begin

  if DebugHook = 1 then
  begin
//    NomeSistema := 'MYINDIA_DUE_CONSULTANFE';
    NomeSistema := 'BOOKING';
  end
  else
  begin
    NomeSistema := ParamStr(1);
  end;

  if NomeSistema = 'MYINDIA_DUE_CONSULTANFE' then
  begin
    StartConnection(ServerName);

    ConsultaNfe := TConsultaNfe.Create;
    if DebugHook = 1 then
    begin
      ConsultaNfe.ChaveAcesso := '35190560409075010034550010052001581419340225';
      ConsultaNfe.NrProcesso := '0102EA-000002-19';
    end
    else
    begin
      ConsultaNfe.ChaveAcesso := ParamStr(2);
      ConsultaNfe.NrProcesso := ParamStr(3);
    end;

    MiniBrowserFrm.ShowModal;
    Label1.Caption := 'Finalizando consulta';
    Timer1.Enabled := True;
  end;

  if NomeSistema = 'BOOKING' then
  begin
    TFireDacMSSQLConnection.CreateConnectionDefault;
    Booking := TBooking.Create;
    if DebugHook = 1 then
    begin
      Booking.NrProcesso := '0102EM-015550-21';
    end
    else
    begin
      Booking.NrProcesso := ParamStr(2);
    end;

    MiniBrowserFrm.ShowModal;
    Label1.Caption := 'Finalizando consulta';
    Timer1.Enabled := True;
  end;

end;

procedure TfrmOpenBrowser.Timer1Timer(Sender: TObject);
begin
  Close;
end;

end.
