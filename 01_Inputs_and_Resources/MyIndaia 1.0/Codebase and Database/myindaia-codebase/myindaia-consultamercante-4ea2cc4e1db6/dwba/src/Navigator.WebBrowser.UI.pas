unit Navigator.WebBrowser.UI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Utils;

type
  TFormWebBrowser = class(TForm)
    WebBrowser: TWebBrowser;
    pnlFerramentas: TPanel;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    edtUrl: TEdit;
    Panel2: TPanel;
    Image1: TImage;
    lblTituloSombra: TLabel;
    lblTitulo: TLabel;
    Panel1: TPanel;
    pnlMensagem: TPanel;
    pgbAndamento: TProgressBar;
    pnlHora: TPanel;
    btnReiniciar: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure WebBrowserStatusTextChange(ASender: TObject;
      const Text: WideString);
    procedure WebBrowserProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
    procedure FormShow(Sender: TObject);
    procedure btnReiniciarClick(Sender: TObject);
  private
    { Private declarations }
  function ExtractUrlName(AUrl: String): String;
  public

  end;

var
  FormWebBrowser: TFormWebBrowser;

implementation

{$R *.dfm}

uses uMain;



procedure TFormWebBrowser.btnReiniciarClick(Sender: TObject);
begin
  WebBrowser.GoBack;
end;

procedure TFormWebBrowser.btnSairClick(Sender: TObject);
begin
  FormMain.ResultadoBrowser := mrCancel;
  close;
end;

procedure TFormWebBrowser.WebBrowserProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin
  try
    if not Showing then
      Exit;

    pgbAndamento.Max       := ProgressMax;
    pgbAndamento.Position  := Progress;
  except on E:Exception do
  end;
end;

procedure TFormWebBrowser.WebBrowserStatusTextChange(ASender: TObject;
  const Text: WideString);
begin
  try
    if not Showing then
      Exit;

    pnlMensagem.Caption := Text;
    edtUrl.Text := ExtractUrlName(WebBrowser.LocationURL);
  except on E:Exception do
  end;
end;

function TFormWebBrowser.ExtractUrlName(AUrl: String): String;
var
  P: Integer;
begin
  P := Pos(';', AUrl);
  if P < 1 then
    P := Length(AUrl) +1;
  Result := Copy(AUrl, 1, P -1);
end;

procedure TFormWebBrowser.FormShow(Sender: TObject);
begin
  pnlHora.Caption := FormatDateTime('hh:nn', Now);
end;

end.
