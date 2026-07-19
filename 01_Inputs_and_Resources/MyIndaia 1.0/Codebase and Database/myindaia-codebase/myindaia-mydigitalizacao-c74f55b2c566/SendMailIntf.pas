unit SendMailIntf;

interface

uses Windows, Classes, SysUtils;

type
  IMail = interface(IUnknown)
  ['{81F0FA5D-03DC-47B8-B238-AFCBF5FF954F}']
    function Eco(const Eco: WideString): WideString;
    procedure SetConfig(const Host, Username, Password: WideString; Port: Integer; SSL: Boolean);
    function Send(const From, Recipeients, CCList, BccList, Subject, Body: WideString; Attachment: array of WideString): Boolean;
  end;

  TGetMailProc = function: IMail;


function GetMailInstance: IMail;
procedure FreeInstance;

implementation

var
  NFSeHandle: THandle;

function GetMailInstance: IMail;
var
  Proc: TGetMailProc;
  Path: string;
begin

  Path := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
  if not FileExists(Path+'MySendMail.dll') then
    raise Exception.Create(Path+'MySendMail.dll não encontrada');

  if NFSeHandle = 0 then
    NFSeHandle := LoadLibrary(PChar(Path + 'MySendMail.dll'));

  if NFSeHandle = 0 then
    raise Exception.Create('Não foi possível carregar a MySendMail.dll, verifique se a mesma não está bloqueada.');

  Proc := TGetMailProc(GetProcAddress(NFSeHandle, 'GetMail'));

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

finalization
  FreeInstance;


end.
