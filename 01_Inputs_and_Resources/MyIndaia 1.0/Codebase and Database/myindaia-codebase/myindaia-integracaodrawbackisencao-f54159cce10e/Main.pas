unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Vcl.StdCtrls,
  Xml.XMLDoc, IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, Vcl.ExtCtrls, uFrmIntegracaoExcel, Vcl.Buttons, uFrmIntegracaoDrawBackIsencao, udmMain;

type
  TfrmMain = class(TForm)
    btnImportarExcel: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btnImportarExcelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  sUsuario  : string;
  sSenha    : string;

implementation

{$R *.dfm}


procedure TfrmMain.btnImportarExcelClick(Sender: TObject);
begin
  Application.CreateForm(TfrmIntegracaoExcel, frmIntegracaoExcel);
  frmIntegracaoExcel.Show;
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmIntegracaoDrawBackIsencao, FrmIntegracaoDrawBackIsencao);
  FrmIntegracaoDrawBackIsencao.Show;
end;

end.
