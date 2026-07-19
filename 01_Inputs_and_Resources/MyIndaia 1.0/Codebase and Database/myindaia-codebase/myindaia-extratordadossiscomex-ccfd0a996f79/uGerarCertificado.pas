unit uGerarCertificado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, ShellAPI,
  Vcl.ExtCtrls;

type
  TfrmGerarCertificado = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    edit1: TMemo;
    edit2: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure ConcluiOperacao;
    { Private declarations }
  public
    { Public declarations }
    ArquivoPFX: String;
    ArquivoPEM: String;
    ArquivoKEY: String;
  end;

var
  frmGerarCertificado: TfrmGerarCertificado;

implementation

uses
  KrUtil, System.SysUtils, Vcl.Clipbrd;

{$R *.dfm}

procedure TfrmGerarCertificado.BitBtn1Click(Sender: TObject);
begin
  StartApp('Open', PChar(GetLocalPath + 'OPENSSL.EXE'), PChar(''), PChar(GetLocalPath), SW_SHOW);
end;

procedure TfrmGerarCertificado.BitBtn2Click(Sender: TObject);
begin
  Clipboard.AsText := Edit1.Text;
end;

procedure TfrmGerarCertificado.BitBtn3Click(Sender: TObject);
begin
  Clipboard.AsText := Edit2.Text;
end;

procedure TfrmGerarCertificado.FormActivate(Sender: TObject);
begin
  Edit1.Text := 'pkcs12 -in ' + ArquivoPFX + ' -out ' + ArquivoPEM + ' -nodes';
  Edit2.Text := 'rsa -in ' + ArquivoPEM + ' -out ' + ArquivoKEY;
end;

procedure TfrmGerarCertificado.Timer1Timer(Sender: TObject);
begin
  if FileExists(ArquivoPEM) and FileExists(ArquivoKEY) then
    ConcluiOperacao;
end;

procedure TfrmGerarCertificado.ConcluiOperacao;
var
  vArquivoPFXnaPasta: String;
begin
  Timer1.Enabled := false;
  showmessage('Arquivos ' + ExtractFileName(ArquivoPEM) + ' e ' + ExtractFileName(ArquivoKEY) + ' criados com sucesso');

  vArquivoPFXnaPasta := GetLocalPath + 'certificados\' + ExtractFileName(ArquivoPFX);
  if FileExists(vArquivoPFXnaPasta) then
    DeleteFile(vArquivoPFXnaPasta);

  Close;
end;

end.
