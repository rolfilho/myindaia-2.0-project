unit MyMainEnterprise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyMainBasic, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.ExtCtrls, Vcl.AppEvnts;

type
  TformMyMainEnterprise = class(TformMyMainBasic)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMyMainEnterprise: TformMyMainEnterprise;

implementation

{$R *.dfm}

end.
