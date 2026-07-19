unit Utils;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants,
  printers, winspool;

type
  TLogCallBack = procedure of object;

function ExecAndWait(Comando, Parmetros, DiretorioTrabalho: string): string;
function GetLocalPath: string;
function NomeArquivoLog: string;
procedure Log(const Msg: string; CallBack: TLogCallBack);
function StripNonAlphaNumeric(const AValue: string): string;
function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
function GetDefaultPrinterName: string;

Function PegarPosicaoImpressoraPadrao : Integer;
procedure SetPrinterScale(escalaImpressao : integer);

implementation

function ExecAndWait(Comando, Parmetros, DiretorioTrabalho: string): string;
var
  saSegunranca: TSecurityAttributes;
  siInformacoesInicializacao: TStartupInfo;
  piInformacaoDoProcesso: TProcessInformation;
  hLeitura, hEscrita: THandle;
  bOk, bHandle: Boolean;
  Buffer: array [0 .. 255] of AnsiChar;
  BytesLidos: Cardinal;
  Diretorio: string;
begin
  Result := '';
  with saSegunranca do
  begin
    nLength := SizeOf(saSegunranca);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(hLeitura, hEscrita, @saSegunranca, 0);
  try
    with siInformacoesInicializacao do
    begin
      FillChar(siInformacoesInicializacao,
        SizeOf(siInformacoesInicializacao), 0);
      cb := SizeOf(siInformacoesInicializacao);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_Hide;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := hEscrita;
      hStdError := hEscrita;
    end;
    Diretorio := DiretorioTrabalho;
    bHandle := CreateProcess(nil, PWideChar(Comando + ' ' + Parmetros), nil, nil,
      True, 0, nil, PChar(Diretorio), siInformacoesInicializacao,
      piInformacaoDoProcesso);
    CloseHandle(hEscrita);
    if bHandle then
    begin
      try
        repeat
          bOk := ReadFile(hLeitura, Buffer, 255, BytesLidos, nil);
          if BytesLidos > 0 then
          begin
            Buffer[BytesLidos] := #0;
            Result := Result + string(Buffer);
          end;
        until not bOk or (BytesLidos = 0);
        WaitForSingleObject(piInformacaoDoProcesso.hProcess, INFINITE);
      finally
        CloseHandle(piInformacaoDoProcesso.hThread);
        CloseHandle(piInformacaoDoProcesso.hProcess);
      end;
    end;
  finally
    CloseHandle(hLeitura);
  end;
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  ForceDirectories(GetLocalPath +'Log\');
  Result := GetLocalPath +'Log\'+ FormatDateTime('yyyy-mm-dd', Now)+ '.log';
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

function StripNonAlphaNumeric(const AValue: string): string;
begin
  Result := AValue;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '', [rfReplaceAll]);
end;

function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
 if Expressao then
    Result := ParteTRUE
 else
    Result := ParteFALSE;
end;

function GetDefaultPrinterName: string;
var ResStr: array[0..255] of Char;
begin
  GetProfileString('Windows', 'device', '', ResStr, 255);
  Result := StrPas(ResStr);
end;

Function PegarPosicaoImpressoraPadrao : Integer;
var
  j: Integer;
  myPrinterName : String;
Begin
  Result := -1;
  myPrinterName := GetDefaultPrinterName;
  for j := 0 to Printer.printers.Count-1 do
  begin
     if Printer.printers[j] = myPrinterName then
     begin
       Result := j;
       break;
     end;
  end;
end;

procedure SetPrinterScale(escalaImpressao : integer);
  Const
    Defaults: TPrinterDefaults = (
      pDatatype : nil;
      pDevMode  : nil;
      DesiredAccess : PRINTER_ACCESS_USE or PRINTER_ACCESS_ADMINISTER );
var
  hPrinter: THandle;
  Device : array[0..255] of char;
  Driver : array[0..255] of char;
  Port   : array[0..255] of char;
  hDeviceMode: THandle;
  bytesNeeded: Cardinal;
  pPI: PPrinterInfo2;
  retval: BOOL;
begin
  Printer.PrinterIndex := PegarPosicaoImpressoraPadrao;
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);

  if not WinSpool.OpenPrinter(@Device, hPrinter, @Defaults) then
    RaiseLastWin32Error;

  try
    retval := WinSpool.GetPrinter( hPrinter,  2,  Nil, 0, @bytesNeeded );
    GetMem( pPI, bytesNeeded );
    try
      retval := WinSpool.GetPrinter(hPrinter, 2, pPI, bytesNeeded, @bytesNeeded );

      If not retval Then
        RaiseLastWin32Error;

      pPI^.pDevMode^.dmScale        := escalaImpressao;
      pPI^.pDevMode^.dmOrientation  := DMORIENT_PORTRAIT;
      pPI^.pDevMode^.dmPaperSize    := DMPAPER_A4;
      pPI^.pSecurityDescriptor := nil;

      If not WinSpool.SetPrinter(hPrinter, 2, pPI, 0) Then
        RaiseLastWin32error;
    finally
      FreeMem( pPI );
    end;
  finally
    WinSpool.ClosePrinter( hPrinter );
  end;
end;

end.


