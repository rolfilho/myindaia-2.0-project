unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataModule, Server, uAutenticacao, uLog,
  Vcl.ExtCtrls;

type
  TfmServer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    MemoLog: TMemo;
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
var
  GOnNewLine: TProc<string>;
begin
  Servidor := TServer.create;
  Servidor.StartServer;
  Label1.Caption := 'Proxy Portal Único';

  uLog.Inicializar(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))));
  uLog.SetNivelMinimo(llInfo); // se quiser verboso
  uLog.SetOnNewLine(
  TProc<string>(
    procedure(const L: string)
    begin
      TThread.Queue(nil,
        procedure
        begin
          MemoLog.Lines.Add(L);
          // auto-scroll para o fim
          MemoLog.SelStart  := MemoLog.GetTextLen;
          MemoLog.SelLength := 0;
          MemoLog.Perform(EM_SCROLLCARET, 0, 0);
        end);
    end));

  uLog.CarregarLogDeHoje(MemoLog.Lines);

end;

procedure TfmServer.FormDestroy(Sender: TObject);
begin
//  Servidor.StopServer;
//  Servidor.free;

  uLog.Finalizar;
end;

procedure TfmServer.CarregaIni;
var
  Ini: TIniFile;
  Server: String;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    UrlBaseServidor := Ini.ReadString('Geral', 'Url', '');
  finally
    Ini.Free;
  end;
end;

end.
