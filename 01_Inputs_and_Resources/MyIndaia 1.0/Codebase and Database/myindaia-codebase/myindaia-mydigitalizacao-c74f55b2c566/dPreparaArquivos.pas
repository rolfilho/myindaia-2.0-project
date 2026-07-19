unit dPreparaArquivos;

interface

uses
  Forms, Windows, SysUtils, Classes, Graphics, LibTiffDelphi, JPEG, ppParameter,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCtrls,
  ppPrnabl, ppCache, ppTypes, DB, DBTables, ADODB, MemTable, Txtradev, Dialogs;

type
  TRGBArray = array[Word] of TRGBTriple;
  pRGBArray = ^TRGBArray;

type
  TdtmMyDigPreparaArquivos = class(TDataModule)
    ppDBPipeline1: TppDBPipeline;
    memArquivos: TMemoryTable;
    memArquivosFileName: TStringField;
    qryImagens: TADOQuery;
    qryImagensNM_ARQUIVO: TWideStringField;
    qryImagensCD_TIPO_DOCTO: TIntegerField;
    qryImagensNM_ARQUIVO_PAI: TStringField;
    qryImagensNM_TIPO_DOCTO: TStringField;
    qryImagensNM_DESCRICAO: TStringField;
    dsArquivos: TDataSource;
    qryOutros: TADOQuery;
    qryOutrosNM_ARQUIVO: TWideStringField;
    qryOutrosCD_TIPO_DOCTO: TIntegerField;
    qryOutrosNM_ARQUIVO_PAI: TStringField;
    qryOutrosNM_TIPO_DOCTO: TStringField;
    qryOutrosNM_DESCRICAO: TStringField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    qryLinks: TADOQuery;
    qryLinksNM_LINK: TStringField;
    qryLinksNM_ARQUIVO: TStringField;
    qryLinksNM_TIPO_DOCTO: TStringField;
    ppParameterList1: TppParameterList;
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    FPixelFormat: TPixelFormat;
    procedure SmoothResize(Src, Dst: TBitmap);
    procedure ResizeImage(FileName: string; MaxWidth: Integer);
  public
    property PixelFormat: TPixelFormat read FPixelFormat;
  end;

  procedure TiffToBmp(ATiffFileName, ABitMapFileName: PAnsiChar); external 'Convert.dll';
  procedure TiffToJPG(ATiffFileName, AJPGFileName: PAnsiChar); external 'Convert.dll';

var
  dtmMyDigPreparaArquivos: TdtmMyDigPreparaArquivos;

implementation

uses
  dDigitalizacao, Funcoes;

{$R *.dfm}

{ TdtmMyDigPreparaArquivos }

procedure TdtmMyDigPreparaArquivos.SmoothResize(Src, Dst: TBitmap);
var
  x, y: Integer;
  xP, yP: Integer;
  xP2, yP2: Integer;
  SrcLine1, SrcLine2: pRGBArray;
  t3: Integer;
  z, z2, iz2: Integer;
  DstLine: pRGBArray;
  DstGap: Integer;
  w1, w2, w3, w4: Integer;
begin
  Src.PixelFormat := pf24Bit;
  Dst.PixelFormat := pf24Bit;

  if (Src.Width = Dst.Width) and (Src.Height = Dst.Height) then
    Dst.Assign(Src)
  else
  begin
    DstLine := Dst.ScanLine[0];
    DstGap  := Integer(Dst.ScanLine[1]) - Integer(DstLine);

    xP2 := MulDiv(pred(Src.Width), $10000, Dst.Width);
    yP2 := MulDiv(pred(Src.Height), $10000, Dst.Height);
    yP  := 0;

    for y := 0 to pred(Dst.Height) do
    begin
      xP := 0;

      SrcLine1 := Src.ScanLine[yP shr 16];

      if (yP shr 16 < pred(Src.Height)) then
        SrcLine2 := Src.ScanLine[succ(yP shr 16)]
      else
        SrcLine2 := Src.ScanLine[yP shr 16];

      z2  := succ(yP and $FFFF);
      iz2 := succ((not yp) and $FFFF);
      for x := 0 to pred(Dst.Width) do
      begin
        t3 := xP shr 16;
        z  := xP and $FFFF;
        w2 := MulDiv(z, iz2, $10000);
        w1 := iz2 - w2;
        w4 := MulDiv(z, z2, $10000);
        w3 := z2 - w4;
        DstLine[x].rgbtRed := (SrcLine1[t3].rgbtRed * w1 + SrcLine1[t3 + 1].rgbtRed * w2 + SrcLine2[t3].rgbtRed * w3 + SrcLine2[t3 + 1].rgbtRed * w4) shr 16;
        DstLine[x].rgbtGreen := (SrcLine1[t3].rgbtGreen * w1 + SrcLine1[t3 + 1].rgbtGreen * w2 + SrcLine2[t3].rgbtGreen * w3 + SrcLine2[t3 + 1].rgbtGreen * w4) shr 16;
        DstLine[x].rgbtBlue := (SrcLine1[t3].rgbtBlue * w1 + SrcLine1[t3 + 1].rgbtBlue * w2 + SrcLine2[t3].rgbtBlue * w3 + SrcLine2[t3 + 1].rgbtBlue * w4) shr 16;
        Inc(xP, xP2);
      end; {for}
      Inc(yP, yP2);
      DstLine := pRGBArray(Integer(DstLine) + DstGap);
    end; {for}
  end; {if}
end; {SmoothResize}

procedure TdtmMyDigPreparaArquivos.ResizeImage(FileName: string; MaxWidth: Integer);
var
  OldBitmap: TBitmap;
  NewBitmap: TBitmap;
begin
  OldBitmap := TBitmap.Create;
  OldBitmap.LoadFromFile(FileName);
  try
    begin
      if (OldBitmap.Width > MaxWidth) then
      begin
        NewBitmap := TBitmap.Create;
        try
          NewBitmap.Width  := MaxWidth;
          NewBitmap.Height := MulDiv(MaxWidth, OldBitmap.Height, OldBitmap.Width);
          SmoothResize(OldBitmap, NewBitmap);
          RenameFile(FileName, ChangeFileExt(FileName, '.$$$'));
          NewBitmap.SaveToFile(FileName);
        finally
          NewBitmap.Free;
        end; {try}
      end; {if}
    end; {if}
  finally
    OldBitmap.Free;
  end; {try}
end;

procedure TdtmMyDigPreparaArquivos.ppDetailBand1BeforePrint(Sender: TObject);
var
  BMP: TBitmap;
  JPG: TJPEGImage;
  FN: array[0..3000] of Char;
  I: Integer;

  function ReadTiffIntoBitmap(FileName: String): TBitmap;
  var
    OpenTiff: PTIFF;
    FirstPageWidth, FirstPageHeight: Cardinal;

    procedure TIFFReadRGBAImageSwapRB(Width,Height: Cardinal; Memory: Pointer);
    var
      M: PCardinal;
      N: Cardinal;
      O: Cardinal;
    begin
      M := Memory;
      for N := 0 to Width * Height -1 do
      begin
        O := M^;
        M^ := (O and $FF00FF00) or                {G and A}
             ((O and $00FF0000) shr 16) or        {B}
             ((O and $000000FF) shl 16);          {R}
        Inc(M);
      end;
    end;
  begin
    OpenTiff := TIFFOpen(FileName, 'r');
    TIFFGetField(OpenTiff, TIFFTAG_IMAGEWIDTH, @FirstPageWidth);
    TIFFGetField(OpenTiff, TIFFTAG_IMAGELENGTH, @FirstPageHeight);
    Result := TBitmap.Create;
    Result.PixelFormat := FPixelFormat;
    Result.Width := FirstPageWidth;
    Result.Height := FirstPageHeight;
    TIFFReadRGBAImage(OpenTiff, FirstPageWidth, FirstPageHeight, Result.Scanline[FirstPageHeight-1], 0);
    TIFFClose(OpenTiff);
    TIFFReadRGBAImageSwapRB(FirstPageWidth, FirstPageheight, Result.Scanline[FirstPageHeight-1]);
    Result.SaveToFile('C:\Teste.bmp');
  end;

begin
  ForceDirectories('C:\ConvertImages\');
  //FN := 'C:\ConvertImages\' + ExtractFileName(memArquivosFileName.AsString);
  try
    if SameText(ExtractFileExt(memArquivosFileName.AsString), '.tif') then
    begin
      //BMP := ReadTiffIntoBitmap(memArquivosFileName.AsString)
      FillChar(FN, 3000, 0);
      for I := 1 to Length(memArquivosFileName.AsString) do
        FN[I-1] := memArquivosFileName.AsString[I];

      TiffToBmp(@FN, 'C:\Image.bmp');
      BMP := TBitmap.Create;
      BMP.LoadFromFile('C:\Image.bmp');
    end
    else if SameText(ExtractFileExt(memArquivosFileName.AsString), '.jpg') then
    begin
      BMP := TBitmap.Create;
      JPG := TJPEGImage.Create;
      JPG.LoadFromFile(memArquivosFileName.AsString);
      BMP.Width  := JPG.Width;
      BMP.Height := JPG.Height;
      BMP.Canvas.Draw(0, 0, JPG);
      JPG.Free;
      BMP.PixelFormat := FPixelFormat;
    end
    else if SameText(ExtractFileExt(memArquivosFileName.AsString), '.bmp') then
    begin
      BMP := TBitmap.Create;
      BMP.LoadFromFile(memArquivosFileName.AsString);
      BMP.PixelFormat := FPixelFormat;
    end
    else
      BMP := nil; // Incluído apenas para eliminar a mensagem [DCC Warning]
    BMP.SaveToFile('C:\Image' + IntToStr(Application.Handle) + '.bmp');
    ResizeImage('C:\Image' + IntToStr(Application.Handle) + '.bmp', 780);
    BMP.LoadFromFile('C:\Image' + IntToStr(Application.Handle) + '.bmp');
    ppImage1.Picture.Assign(BMP);
    //DeleteFile('C:\Image' + IntToStr(Application.Handle) + '.bmp');
    ExcluiArquivo('C:\Image' + IntToStr(Application.Handle) + '.bmp');
    BMP.Free;
  except
    on E: Exception do
      ShowMessage(E.Message);
    //ppImage1.Picture.Assign(nil);
  end;
end;

end.
