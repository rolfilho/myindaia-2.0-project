unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmMySplash = class(TForm)
    imgSplash: TImage;
  private
    procedure AdjustImageSize;
    procedure AdjustTransparence;
  public
  end;

  procedure Execute(AFileName: TFileName; ASleep: Integer = 5; ATransparent: Boolean = True);

implementation

{$R *.dfm}

uses
  Mensagens;

procedure TfrmMySplash.AdjustImageSize;
var
  W, H: Integer;
begin
  imgSplash.AutoSize := True;
  imgSplash.AutoSize := False;
  imgSplash.Stretch  := True;
  W := imgSplash.Width;
  H := imgSplash.Height;
  while (H > Screen.Height) or (W > Screen.Width) do
  begin
    H := H - (H div 100);
    W := W - (W div 100);
  end;
  imgSplash.Width  := W;
  imgSplash.Height := H;
  Self.AutoSize := True;
end;

procedure TfrmMySplash.AdjustTransparence;
var
  BMP: TBitMap;
begin
  BMP := TBitmap.Create;
  BMP.Assign(imgSplash.Picture.Graphic);
  if BMP.Height = 0 then
    Self.TransparentColorValue := clNone
  else
    Self.TransparentColorValue := BMP.Canvas.Pixels[0, BMP.Height -1];
  BMP.Free;
end;

procedure Execute(AFileName: TFileName; ASleep: Integer = 5; ATransparent: Boolean = True);
var
  I: Integer;
  frmMySplash: TfrmMySplash;
begin
  frmMySplash := TfrmMySplash.Create(nil);
  with frmMySplash do
  begin
    //imgSplash.Picture.LoadFromFile(AFileName);
    TransparentColor := ATransparent;
    if ATransparent then
      AdjustTransparence;
    AdjustImageSize;
    Position := poDesigned;
    Position := poDesktopCenter;
    Show;
    SetWindowPos(handle, HWND_TOPMOST, Left, Top, Width, Height, 0);
    for I := 0 to 255 do
    begin
      AlphaBlendValue := I;
      Update;
      Application.ProcessMessages;
      Sleep(ASleep);
    end;
    Sleep(10);
    for I := 255 downto 0 do
    begin
      AlphaBlendValue := I;
      Update;
      Application.ProcessMessages;
      Sleep(ASleep);
    end;
    SetWindowPos(handle, HWND_NOTOPMOST, Left, Top, Width, Height, 0);
    Close;
  end;
  frmMySplash.Release;
  FreeAndNil(frmMySplash);
end;

initialization
  if FindWindow('TfrmMyLogin', nil) = 0 then
    Execute(ExtractFilePath(Application.ExeName) + 'Imagens\' + ChangeFileExt(ExtractFileName(Application.ExeName), '.bmp'), 1, True)
  else
  begin
    PostMessage(FindWindow('TfrmMyLogin', nil), WM_EXIBIRLOGIN, 0, 0);
    Halt;
  end;

end.
