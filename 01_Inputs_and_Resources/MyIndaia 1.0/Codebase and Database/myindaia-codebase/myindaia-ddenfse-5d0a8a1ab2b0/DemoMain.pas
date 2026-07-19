unit DemoMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    edtnr_processo: TEdit;
    btn1: TButton;
    btn02: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure btn02Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses DDENFSEIntf, DDENFSeImpl;

procedure TForm2.btn02Click(Sender: TObject);
var
  nfse : TNFSe;
begin
  nfse := TNFSe.Create;
  nfse.SalvarPDF(edtnr_processo.text, false, true);
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  Msg: string;
begin
  Msg := GetNFSeInstance.SalvarPDF(edtnr_processo.text, false, true);//('0101IA-002311-18');//('0101IA-007175-17');//
  if Msg.IsEmpty then
    ShowMessage('Concluído.')
  else
    ShowMessage(Msg);

end;

end.
