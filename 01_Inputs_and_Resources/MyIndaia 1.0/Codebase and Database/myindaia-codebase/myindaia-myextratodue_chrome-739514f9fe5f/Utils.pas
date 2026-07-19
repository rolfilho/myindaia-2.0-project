unit Utils;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants;

type
  TLogCallBack = procedure of object;

  function GetLocalPath: string;
  function GetFileAsString(const aFileName: String): String;
  function TokenN(const aTokenList:string; aIndex:integer; aTokenSeparator:char='|'):string;
  function RetDouble(value: String): Double;
  function CompletaComZero(qtd: integer): String;
  function NomeArquivoLog: string;
  procedure Log(const Msg: string; CallBack: TLogCallBack);

implementation


function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function GetFileAsString(const aFileName: String): String;
var
  ts: TStringList;
begin
  ts := TStringList.Create;
  try
     ts.LoadFromFile(aFileName);
     Result := ts.Text;
  finally
     ts.Free;
  end;
end;

function TokenN(const aTokenList:string; aIndex:integer; aTokenSeparator:char='|'):string;
var
  i,m,count:integer;
begin
  Result:='';
  count:=0;
  i:=1;
  while i<=Length(aTokenList) do
  begin
    m:=i;
    while (i<=Length(aTokenList)) and (aTokenList[i]<>aTokenSeparator) do
      Inc(i);
    Inc(count);
    if count=aIndex then
    begin
      Result:=Copy(aTokenList,m,i-m);
      Break;
    end;
    Inc(i);
  end;
end;

function RetDouble(value: String): Double;
begin
  if value <> '' then
    result := StrToFloat(StringReplace(value, '.', '', [rfReplaceAll]))
  else
    result := StrToFloat('0,0');
end;

function CompletaComZero(qtd: integer): String;
var
  i: integer;
begin
  for I := 1 to qtd do
    result := result + '0';
end;


function NomeArquivoLog: string;
begin
  Result := GetLocalPath + 'log\'+ FormatDateTime('yyyy-mm-dd', Now)+ '.log';
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


end.
