library Convert;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Graphics,
  JPEG;

{$R *.res}

procedure TiffToBmp(ATiffFileName, ABitMapFileName: PAnsiChar); export;
var
  Tiff: TPicture;
  BMP: TBitMap;
begin
  Bmp := TBitMap.Create;
  Bmp.PixelFormat := pf4bit;
  Tiff := TPicture.Create;
  try
    Tiff.LoadFromFile(StrPas(ATiffFileName));
    Bmp.Assign(Tiff.Graphic);
    Bmp.SaveToFile(StrPas(ABitMapFileName));
  finally
    FreeAndNil(Tiff);
    FreeAndNil(Bmp);
  end;
end;

procedure TiffToJPG(ATiffFileName, AJPGFileName: PAnsiChar); export;
var
  Tiff: TPicture;
  Jpg: TJPEGImage;
  Bmp: TBitMap;
begin
  Tiff := TPicture.Create;
  Jpg := TJPEGImage.Create;
  Bmp := TBitMap.Create;
  try
    Tiff.LoadFromFile(StrPas(ATiffFileName));
    Bmp.Assign(Tiff.Graphic);
    Jpg.Assign(Bmp);
    Jpg.SaveToFile(StrPas(AJPGFileName));
  finally
    FreeAndNil(Tiff);
    FreeAndNil(Jpg);
    FreeAndNil(Bmp);
  end;
end;


exports
  TiffToBmp,
  TiffToJPG;

begin
end.
