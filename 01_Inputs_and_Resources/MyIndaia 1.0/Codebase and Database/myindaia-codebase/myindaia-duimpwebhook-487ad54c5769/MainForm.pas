unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataModule, Server;

type
  TfmServer = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure CarregaIni;
  public
  end;

var
  fmServer: TfmServer;

implementation

uses
  System.IniFiles;


{$R *.dfm}

procedure TfmServer.FormCreate(Sender: TObject);
begin
  Servidor := TServer.create;
  Servidor.StartServer;
  if Pos('val.', URL) > 0 then
    Label1.Caption := 'Notificações da Duimp Validação'
  else
    Label1.Caption := 'Notificações da Duimp Produção'
end;

procedure TfmServer.FormDestroy(Sender: TObject);
begin
  Servidor.StopServer;
  Servidor.free;
end;

procedure TfmServer.CarregaIni;
var
  Ini: TIniFile;
  Server: String;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    Server := Ini.ReadString('Database', 'Server', 'INDAIA10');
    DataModule1.Connection.Params.Values['Server'] := Server;
    Url := Ini.ReadString('Geral', 'Url', '');
  finally
    Ini.Free;
  end;
end;

end.
