unit Funcoes;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants;

{ Integração com o myIndaiá Login }
function StartupSystem: Boolean; stdcall;
function GetLoginName: PChar;    stdcall;
function GetPassword: PChar;     stdcall;
function GetUserCode: PChar;     stdcall;
function GetUserName: PChar;     stdcall;
function GetUserEmail: PChar;    stdcall;
function GetCargoCode: PChar;    stdcall;
function GetCargoName: PChar;    stdcall;

function PCharToString(AValue: PChar): String;

function IsNull(AValue: Variant; AReturn: Boolean): Boolean; overload;
function IsNull(AValue: Variant; AReturn: TDateTime): TDateTime; overload;
function IsNull(AValue: Variant; AReturn: Double): Double; overload;
function IsNull(AValue: Variant; AReturn: Integer): Integer; overload;
function IsNull(AValue: Variant; AReturn: Int64): Int64; overload;
function IsNull(AValue: Variant; AReturn: String): String; overload;


type
  TStringArray = array of String;
  RLink = record
    Url: String;
    Nome: String;
  end;
  TLinkArray = array of RLink;

function Executando(AExeName: String): Boolean;
function ContaOcorrencias(AStr, ASubStr: String): Integer;
function ExtraiPalavra(AStr, ADelimitador: String; AIndice: Integer): String;
function StringToArray(AStr, ADelimitador: String): TStringArray;
function StringsToArray(AStrings: TStrings): TStringArray;
function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
function RenomeiaArquivo(ANomeVelho, ANomeNovo: String): Boolean;
function ExcluiArquivo(AArquivo: String): Boolean;
procedure ExcluiPasta(APasta: String);
procedure LimpaPasta(APath: String);
function ExecAndWait(Comando, Parmetros, DiretorioTrabalho: string): string;
function SomenteAlphaNumerico(const AStr: string): string;
function SomenteNumero(const AStr: string): string;

implementation

function StartupSystem: Boolean; external 'MyLoginInt.dll';
function GetLoginName: PChar;    external 'MyLoginInt.dll';
function GetPassword: PChar;     external 'MyLoginInt.dll';
function GetUserCode: PChar;     external 'MyLoginInt.dll';
function GetUserName: PChar;     external 'MyLoginInt.dll';
function GetUserEmail: PChar;    external 'MyLoginInt.dll';
function GetCargoCode: PChar;    external 'MyLoginInt.dll';
function GetCargoName: PChar;    external 'MyLoginInt.dll';

function PCharToString(AValue: PChar): String;
var
  I: Integer;
begin
  I := 0;
  Result := '';
  while True do
  begin
    if AValue[I] <> #0 then
      Result := Result + AValue[I]
    else if (AValue[I+1] = #0) then
      Break;
    Inc(I);
  end;
end;


function Executando(AExeName: String): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while ContinueLoop and not Result do
  begin
    Result := AnsiIndexText(AExeName, [ExtractFileName(FProcessEntry32.szExeFile), FProcessEntry32.szExeFile]) >= 0;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function ContaOcorrencias(AStr, ASubStr: String): Integer;
begin
  Result := Length(StringReplace(AStr, ASubStr, ASubStr + '.', [rfReplaceAll])) - Length(AStr);
end;

function ExtraiPalavra(AStr, ADelimitador: String; AIndice: Integer): String;
var
  SA: TStringArray;
begin
  SA := StringToArray(AStr, ADelimitador);
  if (High(SA) >= 0) and (High(SA) < AIndice) then
    Result := SA[AIndice]
  else
    Result := '';
end;

function StringToArray(AStr, ADelimitador: String): TStringArray;
var
  P: Integer;
begin
  SetLength(Result, 0);
  P := PosEx(ADelimitador, AStr);
  if P = 0 then
    P := Length(AStr) + 1;
  while AStr <> '' do
  begin
    SetLength(Result, High(Result) + 2);
    Result[High(Result)] := Copy(AStr, 1, P - 1);
    Delete(AStr, 1, P);
    P := PosEx(ADelimitador, AStr);
    if P = 0 then
      P := Length(AStr) + 1;
  end;
end;

function StringsToArray(AStrings: TStrings): TStringArray;
var
  I: Integer;
begin
  SetLength(Result, AStrings.Count);
  for I := 0 to AStrings.Count - 1 do
    Result[I] := AStrings[I];
end;

{function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
begin
  if not DirectoryExists(ExtractFileDir(ANovoArquivo)) then
    ForceDirectories(ExtractFileDir(ANovoArquivo));
  Result := CopyFile(PAnsiChar(AArquivoExistente), PAnsiChar(ANovoArquivo), AFalharSeExiste);
  if Result then
    SetFileAttributes(PAnsiChar(ANovoArquivo), SysUtils.faReadOnly);
end;}
// Copiava da forma acima, mas em alguns casos falhava. Portanto, ficou mais garantido fazer por Stream - Michel - 06/07/2011
function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
var
  Stream: TMemoryStream;
begin
  Result := False;
  if not (FileExists(ANovoArquivo) and AFalharSeExiste) then
  begin
    if not DirectoryExists(ExtractFileDir(ANovoArquivo)) then
      ForceDirectories(ExtractFileDir(ANovoArquivo));
    Stream := TMemoryStream.Create;
    try
      try
        Stream.LoadFromFile(AArquivoExistente);
        Stream.Position := 0;
        Stream.SaveToFile(ANovoArquivo);
        Result := True;
      finally
        FreeAndNil(Stream);
      end;
    except
      Result := False;
      raise;
    end;
    if Result then
      {$if CompilerVersion >= 22}
      SetFileAttributes(PWideChar(ANovoArquivo), SysUtils.faReadOnly);
      {$else}
      SetFileAttributes(PAnsiChar(ANovoArquivo), SysUtils.faReadOnly);
      {$ifend}
  end;
end;

function RenomeiaArquivo(ANomeVelho, ANomeNovo: String): Boolean;
begin
  {$if CompilerVersion >= 22}
  SetFileAttributes(PWideChar(ANomeVelho), 0);
  {$else}
  SetFileAttributes(PAnsiChar(ANomeVelho), 0);
  {$ifend}
  Result := RenameFile(PAnsiChar(ANomeVelho), PAnsiChar(ANomeNovo));
  if Result then
    {$if CompilerVersion >= 22}
    SetFileAttributes(PWideChar(ANomeNovo), SysUtils.faReadOnly);
    {$else}
    SetFileAttributes(PAnsiChar(ANomeNovo), SysUtils.faReadOnly);
    {$ifend}
end;

function IsNull(AValue: Variant; AReturn: Boolean): Boolean;
begin
  if VarIsNull(AValue) then
    Result := AReturn
  else
    Result := AValue;
end;

function IsNull(AValue: Variant; AReturn: TDateTime): TDateTime;
begin
  if VarIsNull(AValue) then
    Result := AReturn
  else
    Result := AValue;
end;

function IsNull(AValue: Variant; AReturn: Double): Double;
begin
  if VarIsNull(AValue) then
    Result := AReturn
  else
    Result := AValue;
end;

function IsNull(AValue: Variant; AReturn: Integer): Integer;
begin
  if VarIsNull(AValue) then
    Result := AReturn
  else
    Result := AValue;
end;

function IsNull(AValue: Variant; AReturn: Int64): Int64;
begin
  if VarIsNull(AValue) then
    Result := AReturn
  else
    Result := AValue;
end;

function IsNull(AValue: Variant; AReturn: String): String; 
begin
  if VarIsNull(AValue) then
    Result := AReturn
  else
    Result := AValue;
end;

function ExcluiArquivo(AArquivo: String): Boolean;
begin
  {$if CompilerVersion >= 22}
  if GetFileAttributes(PWideChar(AArquivo)) and SysUtils.faReadOnly = SysUtils.faReadOnly then
    SetFileAttributes(PWideChar(AArquivo), GetFileAttributes(PWideChar(AArquivo)) xor SysUtils.faReadOnly);
  {$else}
  if GetFileAttributes(PAnsiChar(AArquivo)) and SysUtils.faReadOnly = SysUtils.faReadOnly then
    SetFileAttributes(PAnsiChar(AArquivo), GetFileAttributes(PAnsiChar(AArquivo)) xor SysUtils.faReadOnly);
  {$ifend}
  Result := DeleteFile(AArquivo);
end;

procedure ExcluiPasta(APasta: String);
var
  SR: TSearchRec;
begin
  if APasta[Length(APasta)] = '\' then
    APasta := Copy(APasta, 1, Length(APasta) - 1);
  if FindFirst(APasta + '\*.*', faAnyFile, SR) = 0 then
    repeat
      if ((SR.Name <> '.') and (SR.Name <> '..')) then
        if (SR.Attr and faDirectory > 0) then
          ExcluiPasta(APasta + '\' + SR.Name)
        else
          ExcluiArquivo(APasta + '\' + SR.Name);
    until FindNext(SR) <> 0;
  {$if CompilerVersion >= 22}  
  if GetFileAttributes(PWideChar(APasta)) and SysUtils.faReadOnly = SysUtils.faReadOnly then
    SetFileAttributes(PWideChar(APasta), GetFileAttributes(PWideChar(APasta)) xor SysUtils.faReadOnly);
  {$else}
  if GetFileAttributes(PAnsiChar(APasta)) and SysUtils.faReadOnly = SysUtils.faReadOnly then
    SetFileAttributes(PAnsiChar(APasta), GetFileAttributes(PAnsiChar(APasta)) xor SysUtils.faReadOnly);
  {$ifend}
  RemoveDir(APasta);
end;

procedure LimpaPasta(APath: String);
var
  SR: TSearchRec;
begin
  APath := Trim(APath);
  if (APath = '') or not DirectoryExists(APath) then
    Exit;
  if RightStr(APath, 1) <> '\' then
    APath := APath + '\';
  if FindFirst(APath + '*.*', faAnyFile, SR) = 0 then
    repeat
      if SR.Attr and SysUtils.faReadOnly = SysUtils.faReadOnly then
        {$if CompilerVersion >= 22}
        SetFileAttributes(PWideChar(APath + SR.Name), SR.Attr xor SysUtils.faReadOnly);
        {$else}
        SetFileAttributes(PAnsiChar(APath + SR.Name), SR.Attr xor SysUtils.faReadOnly);
        {$ifend}
      if SR.Attr and faDirectory = faDirectory then
      begin
        if (SR.Name <> '.') and (SR.Name <> '..') and (SR.Name <> FormatDateTime('yyyymmdd', Now)) then
          ExcluiPasta(APath + SR.Name);
      end
      else
        ExcluiArquivo(APath + SR.Name);
    until FindNext(SR) <> 0;
end;

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
  result := '';
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
    bHandle := CreateProcess(nil, PAnsiChar(Comando + ' ' + Parmetros), nil, nil,
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
            result := result + string(Buffer);
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

function SomenteAlphaNumerico(const AStr: string): string;
var
  i:integer;
begin
  Result := '';
  for i:=1 to length(AStr) do
   if AStr[i] in ['A'..'Z','a'..'z','0'..'9'] then
     Result := Result + AStr[i];
end;

function SomenteNumero(const AStr: string): string;
var
  i:integer;
begin
  Result := '';
  for i:=1 to length(AStr) do
   if AStr[i] in ['0'..'9'] then
     Result := Result + AStr[i];
end;



end.

