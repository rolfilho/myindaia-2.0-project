unit Sistemas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, sBitBtn, sSkinProvider, AdvToolBar, ShellAPI,
  IdBaseComponent, ExtCtrls, sPanel, DB, AdvGlowButton, acPNG, TLHelp32, PsAPI,
  FileButton, StrUtils;

const
  _PROCESSOS_AUTOMATICOS: array[0..2] of String = ('SuporteMy.exe',
                                                   'MySenhas.exe',
                                                   'myInterDoc.exe');
  _SISTEMAS_AUTOMATICOS: array[0..2] of String = ('C:\DDBROKER\SuporteMy.exe',
                                                  'C:\DDBROKER\MySenhas\MySenhas.exe',
                                                  'C:\DDBROKER\myInterDoc\myInterDoc.exe');


type
  RSistemaTimer = record
    Path: String;
    Nome: String;
    Form: String;
    Count: Integer;
  end;

type
  TSize = record
    Width: Integer;
    Height: Integer;
  end;

type
  TfrmMySistemas = class(TForm)
    sSkinProvider1: TsSkinProvider;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FButtonList: TFileButtonList;
    function MouseInForm: Boolean;
    function ArrangeIcons(ArrangeType: TArrangeType): TSize;
    procedure FileButtonClick(Sender: TObject; Code: Integer; Script: String;
       var FileName, Param: String; var Execute: Boolean);
    procedure RemoverComponentes;
  public
    function SistemasExecutando: TStrings;
    function QuantidadeSistemasExecutando: Integer;
    function ExecutaProcesso(AProcesso: String): Boolean;
    function ExecutaAplicativo(AAplicativo: String): Boolean;
    function ProcessoExiste(AProcesso: String): Boolean;
    procedure Show;
    procedure ListarComponentes;
  end;

  //procedure RunForm(ASourceFile: String); stdcall; external 'Interpreter.dll';
  procedure RunForm(ASourceFile: String);

var
  frmMySistemas: TfrmMySistemas;
  _SISTEMAS_TIMER: array of RSistemaTimer;

implementation

uses uConexao, Funcoes, Principal, DashBoardUserProperties;

{$R *.dfm}

procedure RunForm(ASourceFile: String);
type
  TRunForm = procedure(ASourceFile: String);
var
  HDLL: HModule;
  RF: TRunForm;
begin
  HDLL := LoadLibrary('C:\DDBROKER\Interpreter.dll');
  RF := GetProcAddress(HDLL, 'RunForm');
  if Assigned(RF) then
    RF(ASourceFile);
  FreeLibrary(HDLL);
end;

{ TfrmMySistemas }

function TfrmMySistemas.ArrangeIcons(ArrangeType: TArrangeType): TSize;
begin
  FButtonList.ArrangeIcons(ArrangeType);
end;

function TfrmMySistemas.ExecutaAplicativo(AAplicativo: String): Boolean;
begin
  Result := AnsiIndexText(ExtractFileName(AAplicativo), _PROCESSOS_AUTOMATICOS) >= 0;
  if Result then
  begin
    if not ProcessoExecutando(AAplicativo) then
      ShellExecute(0, nil, PWideChar(AAplicativo), nil, PWideChar(ExtractFileDir(AAplicativo)), SW_SHOW);
  end
  else
    Result := FButtonList.ExecuteFile(AAplicativo);
end;

function TfrmMySistemas.ExecutaProcesso(AProcesso: String): Boolean;
begin
  Result := FButtonList.ExecuteProcess(AProcesso);
end;

procedure TfrmMySistemas.FileButtonClick(Sender: TObject; Code: Integer; Script: String;
   var FileName, Param: String; var Execute: Boolean);
begin
  if FileExists(Script) then
    RunForm(Script);
  //  RunForm('C:\mylogin\Forms\Local.pas');  {para teste}

  if SameText(FileName, 'C:\DashBoard\DashBoard.exe') then
    FileName := ExtractFilePath(FileName) + 'dbu.exe';
  if AnsiContainsText(FileName, ':NM_LOGIN') then
    FileName := StringReplace(FileName, ':NM_LOGIN', dtmConexao.Login, [rfReplaceAll]);
  if AnsiContainsText(FileName, ':NM_SENHA') then
    FileName := StringReplace(FileName, ':NM_SENHA', dtmConexao.Senha, [rfReplaceAll]);
  if AnsiContainsText(Param, ':NM_LOGIN') then
    Param := StringReplace(Param, ':NM_LOGIN', dtmConexao.Login, [rfReplaceAll]);
  if AnsiContainsText(Param, ':NM_SENHA') then
    Param := StringReplace(Param, ':NM_SENHA', dtmConexao.Senha, [rfReplaceAll]);
end;

procedure TfrmMySistemas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Self.AlphaBlendValue := 255;
  Self.AlphaBlend := True;
  while Self.AlphaBlendValue > 1 do
  begin
    Self.AlphaBlendValue := Self.AlphaBlendValue - 2;
    Self.Update;
    Application.ProcessMessages;
  end;
  Self.Hide;
  Self.AlphaBlend := False;
  Action := caHide;
  SetWindowPos(Self.Handle, HWND_NOTOPMOST, Self.Left, Self.Top, Self.Width, Self.Height, 0);
end;

procedure TfrmMySistemas.FormCreate(Sender: TObject);
begin
  Self.Width := _MIN_WIDTH;
  Self.Height := Screen.WorkAreaHeight;
  FButtonList := TFileButtonList.Create(Self);
  FButtonList.OnButtonClick := FileButtonClick;
end;

procedure TfrmMySistemas.FormDestroy(Sender: TObject);
begin
  FButtonList.Destroy;
end;

procedure TfrmMySistemas.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F5) then
    ListarComponentes;
end;

procedure TfrmMySistemas.FormMouseLeave(Sender: TObject);
begin
  if not MouseInForm then
    Self.Close;
end;

procedure TfrmMySistemas.ListarComponentes;
var
  Desconectar: Boolean;

  function Localizar(APastaInicial, AParteNome, ANomeArquivo: String): String;
  var
    SR: TSearchRec;
  begin
    Result := '';
    if APastaInicial = '' then
      APastaInicial := 'C:\'
    else
      if APastaInicial[Length(APastaInicial)] <> '\' then
        APastaInicial := APastaInicial + '\';
    if FileExists(APastaInicial + ANomeArquivo) then
      Result := APastaInicial + ANomeArquivo
    else
    begin
      if FindFirst(APastaInicial + '*' + AParteNome + '*', faAnyFile, SR) = 0 then
        repeat
          if SR.Attr and faDirectory = faDirectory then
            if (SR.Name <> '.') and (SR.Name <> '..') then
              Result := Localizar(APastaInicial + SR.Name + '\', AParteNome, ANomeArquivo);
        until (FindNext(SR) <> 0) or (Result <> '');
    end;
  end;

  procedure AdicionadashBoard;
  begin
    FButtonList.AddButton(14, 'DashBoard', 'C:\DashBoard\DashBoard.exe', 'DashBoard.exe', '', '');
  end;
  procedure AdicionadashBoardFin;
  begin
    FButtonList.AddButton(17, 'Money DashBoard', 'C:\DashBoard\Financeiro\DashBoard.exe', 'DashBoard.exe', '', '');
  end;
begin
  Desconectar := not dtmConexao.Connection.Connected;
  if dtmConexao.VerificaConexao then
    try
      try
        RemoverComponentes;
        dtmConexao.cdsSistemas.Open;
        dtmConexao.cdsSistemas.First;
        while not dtmConexao.cdsSistemas.Eof do
        begin
          FButtonList.AddButton(dtmConexao.cdsSistemasCD_SISTEMA.AsInteger, dtmConexao.cdsSistemasNM_SISTEMA.AsString,
             dtmConexao.cdsSistemasNM_APLICATIVO.AsString, dtmConexao.cdsSistemasNM_PROCESSO.AsString,
             dtmConexao.cdsSistemasNM_APLICATIVO_PARAM.AsString, dtmConexao.cdsSistemasNM_ARQUIVO_SCRIPT.AsString);
          dtmConexao.cdsSistemas.Next;
        end;
      except
        on E: Exception do
        begin
          MessageDlg('Erro listando sistemas.'#13 + E.Message, mtError, [mbOk], 0);
        end;
      end;
      ArrangeIcons(atRight);
    finally
      if Desconectar then
        dtmConexao.Disconnect;
    end;
end;

function TfrmMySistemas.MouseInForm: Boolean;
var
  X, Y: Integer;
begin
  X := Mouse.CursorPos.X;
  Y := Mouse.CursorPos.Y;
  Result := (X >= (Self.Left +2)) and (X <= (Self.Left + Self.Width)) and
     (Y >= (Self.Top +2)) and (Y <= (Self.Top + Self.Height -3));
end;

function TfrmMySistemas.ProcessoExiste(AProcesso: String): Boolean;
begin
  Result := (AnsiIndexText(ExtractFileName(AProcesso), _PROCESSOS_AUTOMATICOS) >= 0) or FButtonList.ProcessExists(AProcesso);
end;

function TfrmMySistemas.QuantidadeSistemasExecutando: Integer;
begin
  Result := SistemasExecutando.Count;
end;

procedure TfrmMySistemas.RemoverComponentes;
begin
  FButtonList.Clear;
end;

procedure TfrmMySistemas.Show;
begin
  //if FButtonList.Count = 0 then
  //  ListarComponentes;
  FButtonList.VerifyProcesses;
  inherited;
  SetForegroundWindow(Self.Handle);
  SetWindowPos(Self.Handle, HWND_TOPMOST, Self.Left, Self.Top, Self.Width, Self.Height, 0);
end;

function TfrmMySistemas.SistemasExecutando: TStrings;
var
  I: Integer;
begin
  Result := TStringList.Create;
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TFileButton) and ProcessoExecutando(TFileButton(Self.Components[I]).FileName) then
      Result.Add(TFileButton(Self.Components[I]).Caption);
  end;
end;


function GetSistemaTimerFrom(APath, AName, AForm: String): RSistemaTimer;
begin
  Result.Path  := APath;
  Result.Nome  := AName;
  Result.Form  := AForm;
  Result.Count := 0;
end;

initialization
  SetLength(_SISTEMAS_TIMER, 1);
  _SISTEMAS_TIMER[0] := GetSistemaTimerFrom('C:\DDBROKER\', 'SuporteMy.exe', 'TfrmHintChat');

end.
