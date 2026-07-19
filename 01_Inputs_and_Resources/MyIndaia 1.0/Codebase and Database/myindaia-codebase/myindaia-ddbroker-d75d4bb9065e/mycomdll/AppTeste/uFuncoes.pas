unit uFuncoes;

interface

uses
  ComObj, ActiveX, AspTlb, StdVcl, Windows, SysUtils, TlHelp32, PsAPI, ADODB;
              
type
  TMyArray = array of string;
  TDirecao = (diEsquerda, diDireita);

function AddZero(nCodigo : string; nTamanho : integer; nDirecao : TDirecao) : string;
function ContaOcorrencias(pTexto, pSubString : string) : Integer;
function SplitString(nTexto, nDelimitador: string) : TMyArray;
function TerminarProcesso(sFile: string): Bool;
function ConsultaSQL(AServidor, ABase, ASQL, ACampoRetorno: String): String;

const
  cSUPORTE = '<br>Entre em contato com o suporte(suporte@myindaia.com.br)<br>';

implementation

uses ComServ;

function AddZero(nCodigo : string; nTamanho : integer; nDirecao : TDirecao) : string;
begin
  while Length(nCodigo) < nTamanho do begin
    if nDirecao = diEsquerda then
      nCodigo := '0' + nCodigo;
    if nDirecao = diDireita then
      nCodigo := nCodigo + '0';
  end;
  result := nCodigo;
end;

function ContaOcorrencias(pTexto, pSubString : string) : Integer;
var
  vIntAux, i : Integer;
begin
  vIntAux := 0;
  Result := 0;
  for i := 0 to Length(pTexto) do begin
    if Pos(pSubString, Copy(pTexto,vIntAux+1,Length(pTexto))) > 0 then begin
      vIntAux := vIntAux + Pos(pSubString,Copy(pTexto,vIntAux+1,Length(pTexto)));
      Result := Result + 1;
    end;
  end;
end;

function SplitString(nTexto, nDelimitador: string) : TMyArray;
var
  aNovoArray : TMyArray;
  vItemArray : string;
  i: Integer;
begin
  if Length(nTexto) = 0 then
    raise Exception.Create('A string não pode ter tamanho zero')
  else begin
    i := 0;
    while Length(nTexto) > 0 do begin
      if Pos(nDelimitador,nTexto) > 0 then begin
        vItemArray := Copy(nTexto,0,Pos(nDelimitador,nTexto)-1);
        nTexto := Copy(nTexto,Pos(nDelimitador,nTexto)+1,Length(nTexto));
      end
      else begin
        vItemArray := nTexto;
        nTexto := '';
      end;
      //aumenta o indice do array e copia para o array
      SetLength(aNovoArray,(i+1));
      aNovoArray[i] := vItemArray;
      Inc(i);
    end;
    result := aNovoArray;
  end;
end;

function TerminarProcesso(sFile: string): Bool;
var
  verSystem: TOSVersionInfo;
  hdlSnap,hdlProcess: THandle;
  bPath,bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: array [0..1023] of DWord;
  iC: DWord;
  k,iCount: Integer;
  arrModul: array [0..299] of Char;
  hdlModul: HMODULE;
begin
  result:=false;
  if ExtractFileName(sFile)=sFile then
    bPath:=false
  else
    bPath:=true;
  verSystem.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);

  if verSystem.dwPlatformId=VER_PLATFORM_WIN32_WINDOWS then begin
    hdlSnap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
    peEntry.dwSize:=Sizeof(peEntry);
    bLoop:=Process32First(hdlSnap,peEntry);

    while integer(bLoop)<>0 do begin
      if bPath then begin
        if CompareText(peEntry.szExeFile,sFile)=0 then begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID) ,0);
          result:=true;
        end;
      end
      else begin
        if CompareText(ExtractFileName(peEntry.szExeFile),sFile)=0 then begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID) ,0);
          result:=true;
        end;
      end;
      bLoop:=Process32Next(hdlSnap,peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else
    if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then begin
      EnumProcesses(@arrPid,SizeOf(arrPid),iC);
      iCount:=iC div SizeOf(DWORD);

      for k:=0 to Pred(iCount) do begin
        hdlProcess:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,arrPid [k]);
        if (hdlProcess<>0) then begin
          EnumProcessModules(hdlProcess,@hdlModul,SizeOf(hdlModul),iC);
          GetModuleFilenameEx(hdlProcess,hdlModul,arrModul,SizeOf(arrModul));
          if bPath then begin
            if CompareText(arrModul,sFile)=0 then begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              result:=true;
            end;
          end
          else begin
            if CompareText(ExtractFileName(arrModul),sFile)=0 then begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              result:=true;
            end;
          end;
          CloseHandle(hdlProcess);
        end;
      end;
    end;
end;

function ConsultaSQL(AServidor, ABase, ASQL, ACampoRetorno: String): String;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.ConnectionString := 'Provider=SQLOLEDB.1;Data Source=' + AServidor +';Initial Catalog=' + ABase + ';' +
        'User ID=SA;Password=123;Persist Security Info=True;';
  Query.SQL.Text := ASQL;
  Query.Open;
  Result := Query.FieldByName(ACampoRetorno).AsString;
  Query.Close;
  FreeAndNil(Query);
end;

end.


