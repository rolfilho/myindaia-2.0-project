unit uManipulacaoArquivos;

interface

uses
  System.SysUtils, System.DateUtils;

  function GetLocalPath: string;
  function FileExistsForce(aFile: String): String;
  function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
  function MoverArquivo(Origem, Destino: String): Boolean;
  procedure DeletaArquivos(Path, TipoArquivo: String; MaxDias : Integer);

implementation

uses
  System.Classes;


function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function FileExistsForce(aFile: String): String;
begin
  if not FileExists(aFile) then
    ForceDirectories(aFile);

  result := aFile;
end;

function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

function MoverArquivo(Origem, Destino: String): Boolean;
var
  tentativas: integer;

  Copiado: boolean;

begin

  tentativas := 0;

  result := false;

  if FileExists(Origem) then

  begin
    Copiado := CopyFile(Origem, Destino);
    while (not FileExists(Destino)) or (tentativas = 100) do
    begin
      sleep(100);
      inc(tentativas);
    end;
    if FileExists(Destino) and Copiado then
    begin
      DeleteFile(Origem);
      result := true;
    end;
  end

end;

procedure DeletaArquivos(Path, TipoArquivo: String; MaxDias : Integer);
var
  pesquisa: TSearchRec;
  dataLimite, dataArquivo: TDateTime;
  ageArquivo : Integer;
  excluidos : integer;
begin
  dataLimite  := IncDay(now,-MaxDias);
  excluidos   := 0;

  if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
  begin
    repeat
      if (pesquisa.Attr <> faDirectory) then
      begin
        ageArquivo := FileAge(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
        if ageArquivo > -1  then
        begin
          dataArquivo := FileDateToDateTime(ageArquivo);
          if dataArquivo < dataLimite then
          begin
//            log('Excluindo: ' + IncludeTrailingPathDelimiter(Path)+  pesquisa.Name
//              + '  Data: ' + formatDateTime('dd/mm/yyyy', dataArquivo), logar);

            Deletefile(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
            inc(excluidos);
          end;
        end;
      end;
    until FindNext(pesquisa) <> 0;
    FindClose(pesquisa);
  end;
end;

//function NomeArquivoLog: string;
//begin
//  Result := ArquivosLog + '\' + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
//end;

//procedure Log(const Msg: string; CallBack: TLogCallBack; SkipLine: Boolean = false);
//var
//  Filename: string;
//  LogFile: TextFile;
//begin
//  Filename := NomeArquivoLog;
//  AssignFile (LogFile, Filename);
//  if FileExists (FileName) then
//    Append (LogFile)
//  else
//    Rewrite (LogFile);
//  try
//    if SkipLine then
//      Writeln (LogFile, '')
//    else
//      Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);
//  finally
//    CloseFile (LogFile);
//    if Assigned(CallBack) then
//      CallBack;
//  end;
//end;

end.
