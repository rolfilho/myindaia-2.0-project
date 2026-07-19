unit Unit1;

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

uses
  Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Get_RemessaXls('99999109', 'INDAIA07', ExtractFilePath(ParamStr(0)) + '..\fornec_99999109_14122009_135333.xls');
end;

end.
