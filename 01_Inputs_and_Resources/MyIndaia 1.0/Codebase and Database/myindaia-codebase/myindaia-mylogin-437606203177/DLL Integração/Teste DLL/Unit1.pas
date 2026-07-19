unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblLoginName: TLabel;
    lblPassword: TLabel;
    lblUserCode: TLabel;
    lblUserName: TLabel;
    lblUserEmail: TLabel;
    lblCargoCode: TLabel;
    lblCargoName: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function StartupSystem: Boolean;     stdcall;
  function GetLoginName: PWideChar;    stdcall;
  function GetPassword: PWideChar;     stdcall;
  function GetUserCode: PWideChar;     stdcall;
  function GetUserName: PWideChar;     stdcall;
  function GetUserEmail: PWideChar;    stdcall;
  function GetCargoCode: PWideChar;    stdcall;
  function GetCargoName: PWideChar;    stdcall;

var
  Form1: TForm1;

implementation

{$R *.DFM}

  function StartupSystem: Boolean;     external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetLoginName: PWideChar;    external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetPassword: PWideChar;     external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetUserCode: PWideChar;     external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetUserName: PWideChar;     external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetUserEmail: PWideChar;    external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetCargoCode: PWideChar;    external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';
  function GetCargoName: PWideChar;    external 'C:\Projetos\Delphi\mylogin\DLL Integração\Teste DLL\MyLoginInt.dll';

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['A'..'Z',
                         'a'..'z',
                         '0'..'9',
                         '[', ']', '!', '@',
                         '#', '$', '%', '^',
                         '&', '*', '(', ')',
                         '_', '+', '-', '=',
                         '{', '}', ';', '''',
                         ':', '"', '\', '/',
                         '|', ',', '<', '>',
                         '.', '?',
                         #8, #13, #27
                          ]) then
    Key := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if StartupSystem then
  begin
    lblLoginName.Caption := GetLoginName;
    lblPassword.Caption  := GetPassword;
    lblUserCode.Caption  := GetUserCode;
    lblUserName.Caption  := GetUserName;
    lblUserEmail.Caption := GetUserEmail;
    lblCargoCode.Caption := GetCargoCode;
    lblCargoName.Caption := GetCargoName;
  end;
end;

end.
