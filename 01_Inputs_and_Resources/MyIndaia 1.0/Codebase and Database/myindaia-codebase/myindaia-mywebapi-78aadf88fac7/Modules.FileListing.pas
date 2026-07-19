unit Modules.FileListing;

interface

uses
  Generics.Collections, SysUtils,
  Sparkle.HttpServer.Context,
  Sparkle.HttpServer.Module,
  WinApi.Windows;

type
  TFileListingModule = class(THttpServerModule)
  private
    FBaseDir: string;
    FBlockListFiles: Boolean;
    FContentTypes: TDictionary<string, string>;
    function BuildRelativePath(const Segs: TArray<string>;
      IgnoreTrailing: integer = 0): string;
    procedure ProcessFile(C: THttpServerContext; const FileName: string);
    procedure ProcessDir(C: THttpServerContext; const Dir: string);
  public
    constructor Create(const ABaseUri: string; BlockListFiles: Boolean);
      reintroduce;
    destructor Destroy; override;

    // ProcessRequest is the main method of this class.
    // It's the one to be called to process all Http requests
    procedure ProcessRequest(const C: THttpServerContext); override;

    property BaseDir: string read FBaseDir write FBaseDir;
  end;

implementation

uses
  Classes, IOUtils, Security;

{ TFileListingModule }

function TFileListingModule.BuildRelativePath(const Segs: TArray<string>;
  IgnoreTrailing: integer = 0): string;
var
  I: integer;
begin
  Result := '/';
  for I := 0 to Length(Segs) - 1 - IgnoreTrailing do
    Result := Result + Segs[I] + '/';
end;

constructor TFileListingModule.Create(const ABaseUri: string;
  BlockListFiles: Boolean);
begin
  inherited Create(ABaseUri);
  FBlockListFiles := BlockListFiles;
  FContentTypes := TDictionary<string, string>.Create;
  FContentTypes.Add('.txt', 'text/plain');
  FContentTypes.Add('.htm', 'text/html');
  FContentTypes.Add('.html', 'text/html');
  FContentTypes.Add('.ini', 'text/plain');
  FContentTypes.Add('.log', 'text/plain');
  FContentTypes.Add('.xml', 'application/xml');
  FContentTypes.Add('.pdf', 'application/pdf');
  FContentTypes.Add('.gif', 'image/gif');
  FContentTypes.Add('.jpg', 'image/jpeg');
  FContentTypes.Add('.jpeg', 'image/jpg');
  FContentTypes.Add('.png', 'image/png');
  FContentTypes.Add('.bmp', 'image/bmp');
end;

destructor TFileListingModule.Destroy;
begin
  FContentTypes.Free;
  inherited;
end;

procedure TFileListingModule.ProcessDir(C: THttpServerContext;
  const Dir: string);
var
  Writer: TStreamWriter;
  RelativePath: string;
  ParentPath: string;
  FileName: string;
  DisplayFileName: string;
  SearchRec: TSearchRec;
begin
  // this function provides an html listing all files in the directory
  C.Response.StatusCode := 200;
  C.Response.ContentType := 'text/html;charset=UTF8';
  RelativePath := BuildRelativePath(GetRelativeSegments(C.Request.Uri));
  ParentPath := BuildRelativePath(GetRelativeSegments(C.Request.Uri), 1);

  if FBlockListFiles then
    if RelativePath.Equals('/') or RelativePath.EndsWith('/') then
    begin
      C.Response.StatusCode := 404; // Bad Request
      Writer := TStreamWriter.Create(C.Response.Content, TEncoding.UTF8);
      try
        Writer.Write('<html><head><title>404 - Not Found</title></head><body>' +
          '<h2>Not Found</h2>' +
          '<hr><p>HTTP Error 404. The requested resource is not found.</p>' +
          '<h2><p>Opss. Provavelmente você não deveria ter feito isso.</h2>' +
          '</body></html>');
        C.Response.Close;
      finally
        Writer.Free;
      end;
      Exit;
    end;

  // build the html response
  Writer := TStreamWriter.Create(C.Response.Content, TEncoding.UTF8);
  try
    // html header with directory name
    Writer.Write
      (Format('<html><head><title>Index of %s</title></head><body><h1>Index of %s</h1>',
      [RelativePath, RelativePath]));

    Writer.Write('<pre>      Name<hr>');

    if FindFirst(TPath.Combine(Dir, '*'), faAnyFile, SearchRec) = 0 then
      try
        repeat
          FileName := SearchRec.Name;
          if FileName = '.' then
            Continue;
          if (FileName = '..') and (RelativePath = '/') then
            Continue;

{$WARNINGS OFF}
          if (SearchRec.Attr and faSymLink) <> 0 then
            Continue;
{$WARNINGS ON}
          DisplayFileName := FileName;
          if (SearchRec.Attr and faDirectory) <> 0 then
          begin
            Writer.Write('[DIR] ');
            FileName := FileName + '/';
          end
          else
            Writer.Write('      ');
          Writer.Write(Format('<a href="%s">%s</a>'#13#10,
            [Crypt(caCrypt, FileName), DisplayFileName]));
        until FindNext(SearchRec) <> 0;
      finally
        System.SysUtils.FindClose(SearchRec);
      end;

    Writer.Write
      ('<hr></pre><I>TMS Sparkle - FileListingServer demo</I></body></html>');
  finally
    Writer.Free;
  end;
end;


function GetFileSize(const aFilename: String): Int64;
var
  info: TWin32FileAttributeData;
begin
  Result := -1;
  if NOT GetFileAttributesEx(PWideChar(aFilename), GetFileExInfoStandard, @info)
  then
    Exit;
  Result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
end;

procedure TFileListingModule.ProcessFile(C: THttpServerContext;
  const FileName: string);
var
  ContentType: string;
  FileStream: TFileStream;
begin
  C.Response.StatusCode := 200;
  if not FContentTypes.TryGetValue(Lowercase(TPath.GetExtension(FileName)), ContentType) then
    ContentType := 'application/octect-stream';
//  C.Response.Headers.AddValue('Content-Description', 'File Transfer');
//  C.Response.Headers.AddValue('Content-Type', ContentType);
//  C.Response.Headers.AddValue('Content-Disposition', 'attachment; filename="' +FileName + '"');
//  C.Response.Headers.AddValue('Content-Transfer-Encoding', 'binary');
//  C.Response.Headers.AddValue('Expires', '0');
//  C.Response.Headers.AddValue('Cache-Control','must-revalidate, post-check=0, pre-check=0');
  C.Response.Headers.AddValue('Set-Cookie', 'fileDownload=true; path=/');
  C.Response.Headers.AddValue('Content-Length', GetFileSize(FileName).ToString);

  C.Response.ContentType := ContentType;
  FileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    C.Response.ContentLength := FileStream.Size;
    C.Response.Content.CopyFrom(FileStream, 0);
  finally
    FileStream.Free;
  end;
end;

procedure TFileListingModule.ProcessRequest(const C: THttpServerContext);
var
  PathSegment: string;
  Aux: string;
  Dir: string;
  IsFile: Boolean;
  FullUri: string;
begin
  Dir := BaseDir;
  IsFile := false;
  for PathSegment in GetRelativeSegments(C.Request.Uri) do
  begin
    if IsFile then
    // if it was a file, it should not be remaining path segments!
    begin
      C.Response.StatusCode := 404;
      C.Response.Close;
      Exit;
    end;

    // Tratar URL
    if FContentTypes.TryGetValue(Lowercase(TPath.GetExtension(PathSegment)), Aux) then
      Aux := PathSegment
    else
      Aux := Crypt(caDecrypt, PathSegment);
    Dir := TPath.Combine(Dir, Aux);
    //if TFile.Exists(Dir) then
    if FContentTypes.TryGetValue(Lowercase(TPath.GetExtension(PathSegment)), Aux) then
      // it's a file. Mark the flag as true, and continue to see if there is
      // any remaining path segments. If it does, it must fail.
      IsFile := true
    else if not TDirectory.Exists(Dir) then
    begin
      C.Response.StatusCode := 404;
      C.Response.Close;
      Exit;
    end;
  end;

  if IsFile then
    ProcessFile(C, Dir)
  else
  begin
    FullUri := C.Request.Uri.OriginalUri;
    if FullUri[Length(FullUri)] = '/' then
      ProcessDir(C, Dir)
    else
    begin
      // if it's a dir and there is no trailing slash, then redirect to an address with trailing slash
      C.Response.StatusCode := 301;
      C.Response.Headers.SetValue('Location', FullUri + '/');
      C.Response.Close;
    end;
  end;
end;

end.
