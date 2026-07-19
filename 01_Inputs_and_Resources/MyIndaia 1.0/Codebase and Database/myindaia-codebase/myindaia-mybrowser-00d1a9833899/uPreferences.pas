unit uPreferences;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPreferencesFrm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    ProxyTypeCbx: TComboBox;
    ProxyTypeLbl: TLabel;
    ProxyServerLbl: TLabel;
    ProxyServerEdt: TEdit;
    ProxyPortLbl: TLabel;
    ProxyPortEdt: TEdit;
    ProxyUsernameLbl: TLabel;
    ProxyUsernameEdt: TEdit;
    ProxyPasswordLbl: TLabel;
    ProxyPasswordEdt: TEdit;
    ProxyScriptURLEdt: TEdit;
    ProxyScriptURLLbl: TLabel;
    ProxyByPassListEdt: TEdit;
    ProxyByPassListLbl: TLabel;
    GroupBox2: TGroupBox;
    HeaderNameEdt: TEdit;
    HeaderNameLbl: TLabel;
    HeaderValueEdt: TEdit;
    HeaderValueLbl: TLabel;
    ProxySchemeCb: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreferencesFrm: TPreferencesFrm;

implementation

{$R *.dfm}

end.
