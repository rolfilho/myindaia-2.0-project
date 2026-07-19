unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdTCPConnection, IdTCPClient, IdHTTP,
  IdBaseComponent, IdComponent, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, System.Masks, System.DateUtils;

type
  TLogCallBack = procedure of object;

  TfrmPrincipal = class(TForm)
    idHttp: TIdHTTP;
    Panel1: TPanel;
    btnEnviar: TButton;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Panel2: TPanel;
    memo: TMemo;
    btnPlayPause: TBitBtn;
    lblTimer: TLabel;
    Timer1: TTimer;
    lblStatusHoraExec: TLabel;
    Label1: TLabel;
    lblUltimoEnvio: TLabel;
    FDConnection1: TFDConnection;
    qryConsulta: TFDQuery;
    edtHoraExec: TMaskEdit;
    procedure btnEnviarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtHoraExecChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTempoRestante: Integer;
    procedure Logar;
    procedure LimpaArquivosAntigos(Path, TipoArquivo: String; qt_dias: Integer);
    procedure LogAdd(value: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  Config: TIniFile;
  FPasta: String;
  FPastaLog: String;
  FPastaArquivos: String;

implementation

{$R *.dfm}

procedure ScrollMemo(Memo: TMemo; Direction: Integer);
var
  ScrollMessage: TWMVScroll;
  I: Integer;
begin
  ScrollMessage.Msg := WM_VSCROLL;
  Memo.Lines.BeginUpdate;
  try
    for I := 0 to Memo.Lines.Count do
    begin
     ScrollMessage.ScrollCode := Direction;
     ScrollMessage.Pos := 0;
     Memo.Dispatch(ScrollMessage);
    end;
  finally
    Memo.Lines.EndUpdate;
  end;
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  Result := FPastaLog + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
end;

procedure Log(const Msg: string; CallBack: TLogCallBack);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

procedure TfrmPrincipal.LogAdd(value: String);
begin
  log(value, Logar);
  ScrollMemo(Memo, SB_LINEDOWN);
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
var
  Response: TStringStream;
  XArquivo : TMemoryStream;
  JsonText : TStringStream;
  List: TStringList;
  ListRejeitada: TStringList;
  URL: String;
  RespostaCod, RespostaMsg: String;
  Pasta: string;
  Arquivo: string;
  Token: string;
  i: integer;
begin
  Logadd('Iniciado o envio.');

  URL := 'https://api.inout.d2p.com.br/indaia/atualizaContainerEmbarque';
  Token := 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJnZXJhZG8iOiIyMDIzLTA1LTE2IDE0OjIxOjQxIn0=.2TossfWH2r8wpsIssMI6QQykLEeY6mO5k1QjCbgpSpo=';

  Response := TStringStream.Create('');
  JsonText := TStringStream.Create('');
  XArquivo := TMemoryStream.Create;
  List := TStringList.Create;

  try


    qryConsulta.Open;
    if not (qryConsulta.RecordCount > 0) then
      exit;

    List.add('{"DadosProcesso": [');
    i:=0;
    qryconsulta.First;
    while not qryConsulta.Eof do
    begin
      inc(i);
      if qryConsulta.RecNo > 1 then
        List.add(', ' + qryConsulta.Fields[0].AsString)
      else
        List.add(qryConsulta.Fields[0].AsString);
      qryConsulta.next;
    end;

    List.add(']} ');

    List.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_envio.json');
    LogAdd('Arquivo de envio gerado com ' + intToStr(i) + ' processos.');
    List.SaveToStream(JsonText);

    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    XArquivo.LoadFromStream(JsonText);
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.Referer := URL;

    try
        idHTTP.post(URL , XArquivo, Response);
    except
    on E:EIdHTTPProtocolException do
      begin
        memo.Lines.Add(e.ErrorMessage + #13);
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
//      memo.Lines.Add(UTF8Encode(Response.DataString + #13));
      LogAdd('Enviado com sucesso');
      Response.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno.json');
      Config.WriteString('Config', 'UltimoEnvio', formatDateTime('yyyy-mm-dd', now));
      lblUltimoEnvio.caption := Trim(Config.ReadString('Config', 'UltimoEnvio', ''));
    end
    else
    begin
      LogAdd('Erro no envio');
      Response.SaveToFile(FPastaArquivos + FormatDateTime('yyyy-mm-dd_hhnn', Now) + '_retorno_erro.json');
    end;

    LimpaArquivosAntigos(FPastaLog, 'log', 60);
    LimpaArquivosAntigos(FPastaArquivos, 'json', 60);

  finally
    FreeAndNil(Response);
  end;
end;

procedure TfrmPrincipal.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  Config.WriteString('Config', 'Horaexec', edtHoraExec.Text);
  lblStatusHoraExec.Caption := 'Gravado';
end;

procedure TfrmPrincipal.edtHoraExecChange(Sender: TObject);
begin
  lblStatusHoraExec.visible := true;
  lblStatusHoraExec.caption := 'Alterando(falta gravar)';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogAdd('Sistema Finalizado.');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FTempoRestante := 60000;
  edtHoraExec.Text := Trim(Config.ReadString('Config', 'HoraExec', '08:00'));
  lblUltimoEnvio.caption := Trim(Config.ReadString('Config', 'UltimoEnvio', ''));
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  LogAdd('Sistema Iniciado.');
  lblStatusHoraExec.Visible := false;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
  T: TTime;
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
  Hoje: string;
  UltimoEnvio: TCaption;
begin
  Dec(FTempoRestante, 1000);
  Horas := (FTempoRestante div 60000) div 60;
  if Horas > 0 then
    Minutos := (FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (FTempoRestante div 60000);
  Segundos := (FTempoRestante div 1000) mod 60;
  lblTimer.Caption := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  T := (GetTickCount - FTempoRestante) * 1000;
  if FTempoRestante <= 0 then
  begin
    timer1.Enabled := False;
    try
      //  if not (dayofweek(now)  in [1, 7]) then {se não for sábado e domingo}

      Hoje := formatDateTime('yyyy-mm-dd', now) ;
      UltimoEnvio := lblUltimoEnvio.Caption;
      if (UltimoEnvio < Hoje) and (time >= StrToTime(edtHoraExec.Text))then
        btnEnviar.Click;

      FTempoRestante := 60000;
    finally
      timer1.Enabled := True;
    end;
  end;
end;

procedure TfrmPrincipal.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TfrmPrincipal.LimpaArquivosAntigos(Path, TipoArquivo: String; qt_dias :Integer);
(* Limpa todos os arquivos do TipoArquivo  da Pasta Path e anteriores à qt_dias.
  É necessário ter este formato de data no inicio (2023-05-01.log), podendo haver qualquer texto em seguida (2023-05-01_retorno.json) *)
var
  NomeArquivo , sDataArquivo, SDataLimite : String;
  i:integer;
  ListaArquivosAntigos : TStringList;
  pesquisa: TSearchRec;
begin
  ListaArquivosAntigos := tStringList.Create;
  try
    if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
            NomeArquivo := Copy(pesquisa.Name, 1,12);
              ListaArquivosAntigos.Add(pesquisa.Name);
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 9, 2);

        sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,-qt_dias ));

      if sDataArquivo < sDataLimite then
      begin
        Deletefile(IncludeTrailingPathDelimiter(Path) +  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;

initialization
  FPasta := ExtractFilePath(ParamStr(0));
  FPastaLog := FPasta + 'log\';
  FPastaArquivos := FPasta + 'arquivos\';

  if not DirectoryExists(FPastaLog) then
    ForceDirectories(FPastaLog);
  if not DirectoryExists(FPastaArquivos) then
    ForceDirectories(FPastaArquivos);

  Config := TIniFile.Create(FPasta + 'Config.ini');

finalization
  FreeAndNil(Config);
end.
