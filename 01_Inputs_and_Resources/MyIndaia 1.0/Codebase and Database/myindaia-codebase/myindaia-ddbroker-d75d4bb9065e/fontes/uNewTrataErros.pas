unit uNewTrataErros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, IdMessage, IdSMTP;

type
  TfrmNewTrataErros = class(TForm)
    pnl1: TPanel;
    img1: TImage;
    btnClose: TSpeedButton;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    shp4: TShape;
    shp5: TShape;
    nbPassos: TNotebook;
    lbl1: TLabel;
    edNome: TEdit;
    edEmail: TEdit;
    edSetor: TEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    mmo1: TMemo;
    lbl10: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure ScreenShot;
    function EnviaMail: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewTrataErros: TfrmNewTrataErros;

implementation

{$R *.dfm}

uses GSMLIB, PGGP017;

procedure TfrmNewTrataErros.btnEnviarClick(Sender: TObject);
begin
  halt;
end;

procedure TfrmNewTrataErros.ScreenShot;
var
  FScreenBitmap : TBitmap;
  ScreenDC : Integer;
begin
  FScreenBitmap := TBitmap.Create;
  ScreenDC := GetWindowDC(0);
  FScreenBitmap.Width := Screen.Width;
  FScreenBitmap.Height := Screen.Height;
  ShowCursor(False);
  BitBlt(FScreenBitmap.Canvas.Handle, 0, 0,
  FScreenBitmap.Width, FScreenBitmap.Height, ScreenDC,0, 0, SRCCOPY);
  ShowCursor(true);
  fscreenbitmap.SaveToFile('C:\errotemp~.bmp');
  ReleaseDC(0, ScreenDC);
  FScreenBitmap.free;
end;

procedure TfrmNewTrataErros.btnCloseClick(Sender: TObject);
begin
  if nbPassos.PageIndex = 0 then
  begin
    ScreenShot;
    nbPassos.PageIndex := nbPassos.PageIndex + 1;
    lbl3.Caption := 'Digite corretamente suas informações nos campos abaixo:';
  end else
  if nbPassos.PageIndex = 1 then
  begin
    if (edNome.Text = '') or (edEmail.Text = '') or (edSetor.Text = '') then
      BoxMensagem('Preencha todos os campos !',2)
    else begin
      nbPassos.PageIndex := nbPassos.PageIndex + 1;
      lbl3.Caption := 'ATENÇÃO! Relate detalhadamente no campo abaixo, o momento em que ocorreu o erro:';
    end;
  end else
  if nbPassos.PageIndex = 2 then
  begin
    if Trim(mmo1.Lines.Text) = '' then
      BoxMensagem('Relate corretamente o momento do erro!',2)
    else begin
      lbl10.Visible := True;
      Application.ProcessMessages;
      if EnviaMail then
        BoxMensagem('Seu email foi enviado ao suporte com sucesso. Obrigado!', 3);
      Close;
    end;
  end;
end;

procedure TfrmNewTrataErros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmNewTrataErros.EnviaMail : Boolean;
{var
  IdMessage1 : TIdMessage;
  IdSMTP1    : TIdSMTP;}
begin
  Result := GSMLIB.EnviaEmail('[myErrorMail] ' + edNome.Text + ' / ' + edSetor.Text + ' - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now),
     ''#13 +
     mmo1.Lines.Text +
     ''#13 +
     '----------------------------------'#13 +
     ' CÓDIGO DO USUÁRIO LOGADO: "' + str_cd_usuario + '"'#13 +
     '----------------------------------'#13, 'myindaia@myindaia.com.br');
  //envia e-mail tanto para gerenciador como para apenas e-mail
  {IdMessage1 := TIdMessage.Create(application);
  IdSMTP1    := TIdSMTP.Create(application);

  TIdAttachment.Create(IdMessage1.MessageParts, 'C:\errotemp~.bmp');

  with IdMessage1 do
  begin
     Body.Add('');
     Body.Add(mmo1.Lines.Text );
     Body.Add('');
     Body.Add('----------------------------------');
     Body.Add(' CÓDIGO DO USUÁRIO LOGADO: "' + str_cd_usuario + '"');
     Body.Add('----------------------------------');
     From.Text := edEmail.Text;
     ReplyTo.EMailAddresses := edEmail.Text;
     Recipients.EMailAddresses := 'myindaia@myindaia.com.br';
     Subject := '[myErrorMail] ' + edNome.Text + ' / ' + edSetor.Text + ' - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
  end;
  IdSMTP1.Host := 'mail.indaialogistica.com.br';
  IdSMTP1.Port := 25;
  IdSMTP1.Connect;
  IdSMTP1.Send(IdMessage1);
  IdSMTP1.Disconnect;
  IdMessage1.MessageParts.Clear;
  IdMessage1.Clear;}

end;

procedure TfrmNewTrataErros.FormCreate(Sender: TObject);
begin
  nbPassos.PageIndex := 0;
  nbPassos.Color := clMenuBroker;
  shp1.Brush.Color := clMenuBroker;
  shp3.Brush.Color := clPnlClaroBroker;
end;

end.
