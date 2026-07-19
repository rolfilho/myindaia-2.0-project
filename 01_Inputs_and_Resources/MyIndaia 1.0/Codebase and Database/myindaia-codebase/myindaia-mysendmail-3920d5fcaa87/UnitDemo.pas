unit UnitDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses SendMailIntf;

procedure TForm2.Button1Click(Sender: TObject);
var
  Mail: IMail;
begin
  Mail := GetMailInstance;
  {Mail.SetConfig(
      'email-smtp.us-east-1.amazonaws.com',
      'AKIAIX5BPVHLHQRKEUTA',
      'ArDzRv3zLp+wJyYyFjwWka9oiryB3dgBhcS5X2JXijbh',
      587, True);}
  if Mail.Send(
      'marcio.martins@myindaia.com.br',
      'mm.marciomartins@gmail.com',
      '', '', 'Assunto teste de email',
      'Corpo teste de email',
      ['D:\Temp\NFSe-58156084000137-265227-99-05102016120627.pdf']) then
    ShowMessage('Deu certo.')
  else
    ShowMessage('Deu merda.')

end;

end.
