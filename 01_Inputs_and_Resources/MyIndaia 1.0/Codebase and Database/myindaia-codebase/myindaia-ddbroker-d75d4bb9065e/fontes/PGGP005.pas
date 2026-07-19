unit PGGP005;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs;

type
  Tdlg_about = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlg_about: Tdlg_about;

implementation

uses PGGP017;

{$R *.DFM}

procedure Tdlg_about.FormShow(Sender: TObject);
var
  vStringList : TStrings;
begin
  if FileExists('C:\DDBROKER\Figura.bmp') then
    Image1.Picture.LoadFromFile('C:\DDBROKER\Figura.bmp');

  vStringList := TStringList.Create;
  try
    datm_main.db_broker.Session.GetAliasParams('DBBROKER',vStringList);
    // database
    Label4.Caption := copy(vStringList.Strings[0],Pos('=',vStringList.Strings[0])+1,20);
    // server
    Label2.Caption := copy(vStringList.Strings[1],Pos('=',vStringList.Strings[1])+1,20);
  finally
    vStringList.Free;
  end;
end;

procedure Tdlg_about.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
