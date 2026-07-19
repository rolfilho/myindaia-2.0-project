unit uWebChromium;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cefvcl, ceflib, ComCtrls;

type

  TWebChromium = class(TForm)
    crm: TChromium;
    pnl1: TPanel;
    edAddress: TEdit;
    btnLoad: TButton;
    StatusBar1: TStatusBar;
    procedure btnLoadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUrlInicial: String;
    procedure SetUrlInicial(const Value: String);
  public
    property UrlInicial: String read FUrlInicial write SetUrlInicial;
    procedure SetStatus(value: String);
  published
  end;

implementation

{$R *.dfm}

{ TWebChromium }

procedure TWebChromium.btnLoadClick(Sender: TObject);
begin
  crm.Load(edAddress.Text);
end;

procedure TWebChromium.SetUrlInicial(const Value: String);
begin
  FUrlInicial := Value;
end;

procedure TWebChromium.FormShow(Sender: TObject);
begin
  SetStatus('Iniciando Navegador');
  crm.Load(FUrlInicial);
  edAddress.Text :=  FUrlInicial;
end;

//edAddress.Text :=  frame.GetUrl;

procedure TWebChromium.SetStatus(value: String);
begin
  StatusBar1.SimpleText := value;
end;


end.
