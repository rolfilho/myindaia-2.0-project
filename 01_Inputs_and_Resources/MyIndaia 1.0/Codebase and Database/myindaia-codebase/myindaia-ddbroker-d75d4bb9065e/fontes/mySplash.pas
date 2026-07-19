unit mySplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmmyIndaiaSplash = class(TForm)
    Label2: TLabel;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ExecuteSplash;
procedure TerminateSplash;

implementation

var
  frmmyIndaiaSplash: TfrmmyIndaiaSplash;

{$R *.dfm}

procedure ExecuteSplash;
begin
  if not Assigned(frmmyIndaiaSplash) then
  begin
    frmmyIndaiaSplash := TfrmmyIndaiaSplash.Create(nil);
    frmmyIndaiaSplash.Left   := 0;
    frmmyIndaiaSplash.Top    := 0;
    frmmyIndaiaSplash.Width  := Screen.Width;
    frmmyIndaiaSplash.Height := Screen.Height;
    frmmyIndaiaSplash.Show;
    frmmyIndaiaSplash.Update;
    Application.ProcessMessages;
  end;
end;

procedure TerminateSplash;
begin
  if Assigned(frmmyIndaiaSplash) then
    FreeAndNil(frmmyIndaiaSplash);
end;

end.
