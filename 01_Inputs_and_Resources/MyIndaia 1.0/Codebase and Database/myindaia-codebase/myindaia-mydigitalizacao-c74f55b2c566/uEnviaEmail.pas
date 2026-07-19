unit uEnviaEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ComCtrls, StdCtrls, ExtCtrls,
  Buttons,DBTables ,DB,TXtraDev, ppBands, ppCache, Inifiles, Grids, DBGrids,
  ppEndUsr, ppTypes, ppModule, daDataModule, ppMemo, ppSubRpt, ppStrtch,
  ppRegion, ppCtrls, ppVar, ppPrnabl, ppParameter, Funcoes, RxGIF, raCodMod,
  IdMessage, IdSMTP, OleCtrls, SHDocVw, ADODB, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, StrUtils;

type
  TfrmEnviaEmail = class(TForm)
    Panel1: TPanel;
    pnl_mail: TPanel;
    LstFiles: TListBox;
    reMensagem: TRichEdit;
    Label2: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edtPara: TEdit;
    edtCC: TEdit;
    edtAssunto: TEdit;
    Panel3: TPanel;
    Label9: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    btnEnviar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel4: TPanel;
    lblStatus: TLabel;
    chkCopyMe: TCheckBox;
    Shape8: TShape;
    btnPara: TSpeedButton;
    btnCC: TSpeedButton;
    Shape9: TShape;
    Shape10: TShape;
    Timer1: TTimer;
    IdSMTP1: TIdSMTP;
    qryConfigMail: TADOQuery;
    qryConfigMailNM_HOST: TStringField;
    qryConfigMailNR_PORTA: TIntegerField;
    qryConfigMailNM_LOGIN: TStringField;
    qryConfigMailNM_SENHA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnParaClick(Sender: TObject);
    procedure btnCCClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtParaChange(Sender: TObject);
    procedure edtCCChange(Sender: TObject);
  private
    FRemetente: String;
    FAnexos: TStringArray;
    FLinks: TLinkArray;
    function SelecionaContatos: String;
  public
    function ShowModal(ARemetente: String; AAnexos: TStringArray; ALinks: TLinkArray): Integer;
  end;

  function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; stdcall;
  procedure EnviaEmail(ARemetente: String; AAnexos: TStringArray; ALinks: TLinkArray);

var
  frmEnviaEmail: TfrmEnviaEmail;
  clPnlClaroBroker: TColor;
  clMenuBroker: TColor;

implementation

uses uConsultaOnline, dDigitalizacao, uCatalogoEnderecos;

{$R *.DFM}

function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; external 'MYEMAIL.DLL';

procedure EnviaEmail(ARemetente: String; AAnexos: TStringArray; ALinks: TLinkArray);
begin
  if not Assigned(frmEnviaEmail) then
    Application.CreateForm(TfrmEnviaEmail, frmEnviaEmail);
  try
    frmEnviaEmail.ShowModal(ARemetente, AAnexos, ALinks);
  finally
    FreeAndNil(frmEnviaEmail);
  end;
end;

{ TfrmEnviaEmail }

procedure TfrmEnviaEmail.FormShow(Sender: TObject);
begin
  //frmEnviaEmail.Height := 265;
end;

procedure TfrmEnviaEmail.FormCreate(Sender: TObject);
begin
  clPnlClaroBroker := RGB(GetRValue(ColorToRGB(clBtnFace)) + 20 , GetGValue(ColorToRGB(clBtnFace)) + 20 , GetBValue(ColorToRGB(clBtnFace)) + 20);
  clMenuBroker     := RGB(GetRValue(ColorToRGB(clBtnFace)) - 15, GetGValue(ColorToRGB(clBtnFace)) - 15, GetBValue(ColorToRGB(clBtnFace)) - 8);
  Panel3.Color  := clPnlClaroBroker;
  Panel1.Color  := clMenuBroker;
end;

procedure TfrmEnviaEmail.btnEnviarClick(Sender: TObject);
var
  I: Integer;
  Destinatarios, Copia, Anexos: String;
  Body: TStrings;
  Nome: String;
  N: Integer;
  NS: String;
  pwAssunto, pwHtml, pwDestinatarios, pwCopia, pwRemetente, pwAnexos: PWideChar;
begin
  LstFiles.Items.Clear;
  Body := TStringList.Create;
  try
    Destinatarios := edtPara.Text;
    Copia := edtCC.Text;
    FRemetente := Trim(FRemetente);
    if chkCopyMe.Checked and (FRemetente <> '') then
      Copia := Copia + ';' + FRemetente;

    Body.Add('<br>');
    Body.Add(StringReplace(reMensagem.Text, #13#10, '<br>', [rfReplaceAll]));
    Body.Add('<br>');
    Body.Add('<br>');
    if High(FLinks) >= 0 then
    begin
      Body.Add('Segue abaixo os links para os arquivos.<br><br>');
      Nome := '';
      N := 1;
      Body.Add('Segue abaixo os links para os arquivos.<br><br>');
      for I := 0 to High(FLinks) do
      begin
        if Nome <> FLinks[I].Nome then
        begin
          Nome := FLinks[I].Nome;
          Body.Add('<br><br>');
          Body.Add('<b><u>' + Trim(Nome) + '</u></b>');
          Body.Add('<br>');
          N := 1;
        end;
        NS := FormatFloat('00', N);
        Body.Add('<a href="' + FLinks[I].Url + '">');
        Body.Add(Format('<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open2/e%s.gif" style="border:0;">' +
                        '<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open2/d%s.gif" style="border:0;">', [NS[1], NS[2]]));
        Body.Add('</a>&nbsp;');
        Inc(N);
      end;
    end;
    Body.Add('<br>');
    Body.Add('<br>');
    Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>');
    Body.Add('<br>');
    Body.Add(' Este é um email gerado automaticamente pelo myIndaiá Digitalização.<br>');
    Body.Add(' Dúvidas: myindaia@myindaia.com.br<br>');
    Body.Add('<br>');
    Body.Add(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -<br>');
    Body.Add('<br>');

    for I := 0 to High(FAnexos) do
      Anexos := Anexos + FAnexos[I] + ';';

    pwRemetente := PWideChar(WideString(FRemetente));
    pwDestinatarios := PWideChar(WideString(Destinatarios));
    pwCopia := PWideChar(WideString(Copia));
    pwAssunto := PWideChar(WideString(edtAssunto.Text));
    pwHtml := PWideChar(WideString(Body.Text));
    pwAnexos := PWideChar(WideString(Anexos));
    if MySendMail(pwRemetente, pwDestinatarios, pwCopia, '', pwAssunto, pwHtml, pwAnexos) then
      lblStatus.Caption := 'Concluído'
    else
      lblStatus.Caption := 'Erro enviando e-mail.';
  finally
    FreeAndNil(Body);
  end;
end;

procedure TfrmEnviaEmail.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEnviaEmail.btnParaClick(Sender: TObject);
var
  vRetornoFuncao : string;
begin
  vRetornoFuncao := SelecionaContatos;
  if vRetornoFuncao <> '' then
    edtPara.Text := edtPara.Text + vRetornoFuncao + ';';
end;

procedure TfrmEnviaEmail.btnCCClick(Sender: TObject);
var
  vRetornoFuncao : string;
begin
  vRetornoFuncao := SelecionaContatos;
  if vRetornoFuncao <> '' then
    edtCC.Text := edtCC.Text + vRetornoFuncao + ';';
end;

procedure TfrmEnviaEmail.Timer1Timer(Sender: TObject);
begin
  PostMessage(FindWindow(nil,'OUTLOO~1'), WM_CLOSE, 0, 0);
end;

procedure TfrmEnviaEmail.edtParaChange(Sender: TObject);
begin
  edtPara.Hint := StringReplace(edtPara.Text, ';', #13, [rfReplaceAll]);
end;

procedure TfrmEnviaEmail.edtCCChange(Sender: TObject);
begin
  edtCC.Hint := StringReplace(edtCC.Text, ';', #13, [rfReplaceAll]);
end;

function TfrmEnviaEmail.SelecionaContatos: String;
begin
  Result := '';
  frmCatalogoEnderecos := TfrmCatalogoEnderecos.Create(Application);
  try
    frmCatalogoEnderecos.ShowModal;
    Result := frmCatalogoEnderecos.vMailSelecionado;
  finally
    FreeAndNil(frmCatalogoEnderecos);
  end;
end;

function TfrmEnviaEmail.ShowModal(ARemetente: String; AAnexos: TStringArray; ALinks: TLinkArray): Integer;
var
  I: Integer;
begin
  FRemetente := ARemetente;
  LstFiles.Clear;
  SetLength(FAnexos, High(AAnexos) + 1);
  for I := 0 to High(AAnexos) do
  begin
    FAnexos[I] := AAnexos[I];
    LstFiles.Items.Add(AAnexos[I]);
  end;
  FLinks := ALinks;
  Result := inherited ShowModal;
end;

end.
