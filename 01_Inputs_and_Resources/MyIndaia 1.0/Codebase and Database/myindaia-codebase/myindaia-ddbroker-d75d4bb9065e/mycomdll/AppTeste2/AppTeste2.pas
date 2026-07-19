unit AppTeste2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ComObj;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Obj: OleVariant;
begin
  Obj := CreateOleObject('MyCOM.IntegraPlan');
  Obj.RemessaXls['00070519','241','INDAIA10','D:\sites\myindaia\arquivo\upload\fornec_00070519_08072019_1904491.xls'];
  //ShowMessage(Obj.Echo['Teste']);
  //RemessaXls(00070519,241,"ANTUERPIA","D:\sites\myindaia\arquivo\upload\fornec_00070519_08072019_1904491.xls")
end;

end.

