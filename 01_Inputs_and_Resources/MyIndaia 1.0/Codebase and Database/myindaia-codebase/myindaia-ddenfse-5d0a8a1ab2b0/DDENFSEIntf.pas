unit DDENFSEIntf;

interface

uses Windows, Classes, SysUtils;

type
  INFSe = interface(IUnknown)
    ['{951FC24D-3180-40F2-AE6D-C012DA49986E}']
    function Eco(const Eco: WideString): WideString;
    function SalvarPDF(const NumeroProcesso: Widestring; Salvar: Boolean = True; Preview: Boolean = True): widestring;
  end;

  TGetNFSeProc = function: INFSe;


function GetNFSeInstance: INFSe;
procedure FreeInstance;

implementation

var
  NFSeHandle: THandle;

function GetNFSeInstance: INFSe;
var
  Proc: TGetNFSeProc;
  Path: string;
begin
  Path := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
  if not FileExists(Path+'DDENFSe.dll') then
    raise Exception.Create(Path+'DDENFSe.dll não encontrada');

  if NFSeHandle = 0 then
    NFSeHandle := LoadLibrary(PChar(Path + 'DDENFSe.dll'));
  if NFSeHandle = 0 then
    NFSeHandle := LoadLibrary(PChar(Path + 'DDENFSe.dll'));
  if NFSeHandle = 0 then
    raise Exception.Create('Não foi possível carregar a DDENFSe.dll, verifique se a mesma não está bloqueada.');

  Proc := TGetNFSeProc(GetProcAddress(NFSeHandle, 'GetNFSe'));
  Result := Proc;
end;

procedure FreeInstance;
begin
  try
    if NFSeHandle <> 0 then
      FreeLibrary(NFSeHandle);
  except
    raise Exception.Create('Erro na destruir da instância da DLL.');
  end;
end;

initialization
  FreeInstance;

finalization


end.
