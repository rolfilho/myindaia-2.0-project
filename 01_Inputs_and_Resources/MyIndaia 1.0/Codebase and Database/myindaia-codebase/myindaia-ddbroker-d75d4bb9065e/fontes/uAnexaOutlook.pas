unit uAnexaOutlook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Outlook2000, Mapi, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, ShellCtrls, ShellAPI, ShlObj, cxShellCommon, cxControls,
  cxContainer, cxShellListView, StrUtils, Registry, Funcoes;

type
  TTipoEmail = (teOutlook, teOutlookExpress);

  TAttachAccessArray = array [0..0] of TMapiFileDesc;
  PAttachAccessArray = ^TAttachAccessArray;

const
  _OUTLOOK_NAMES: array [0..1] of String = ('Microsoft Outlook', 'Outlook Express');
  _OFFICE_OUTLOOK_EXE  = 'OUTLOOK.EXE';
  _OUTLOOK_EXPRESS_EXE = 'MSIMN.EXE';
  _OFFICE_OUTLOOK_INDEX = 0;
  _OUTLOOK_EXPRESS_INDEX = 1;
  _OUTLOOK_EXES: array [_OFFICE_OUTLOOK_INDEX.._OUTLOOK_EXPRESS_INDEX] of String = (_OFFICE_OUTLOOK_EXE, _OUTLOOK_EXPRESS_EXE);
  _OUTLOOK_TYPES: array[_OFFICE_OUTLOOK_INDEX.._OUTLOOK_EXPRESS_INDEX] of TTipoEmail = (teOutlook, teOutlookExpress);

type
  TfrmAnexaOutlook = class(TForm)
    OutlookApplication1: TOutlookApplication;
    nbTelas: TNotebook;
    rdbAberta: TRadioButton;
    rdbNova: TRadioButton;
    lbMensagens: TListBox;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    btnCancelar: TBitBtn;
    btnConcluir: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlOutlook: TPanel;
    imgOutlook: TImage;
    imgOutlookExpress: TImage;
    cxShellListView1: TcxShellListView;
    procedure FormActivate(Sender: TObject);
    procedure rdbAbertaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure nbTelasPageChanged(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FAnexos: TStrings;
    FTipoEmail: TTipoEmail;
    procedure AnexaOutlook;
    procedure AnexaOutlookExpress;
    procedure AtualizaBotoes;
  public
    function Execute(AAnexos: TStrings): Boolean;
  end;

  function AnexaOutlookExecute(AAnexos: TStrings): Boolean;

var
  frmAnexaOutlook: TfrmAnexaOutlook;

implementation

{$R *.dfm}

type
  TMailItemMethods = class
  public
    procedure DoCloseItem(ASender: TObject; var Cancel: WordBool);
    procedure DoSend(ASender: TObject; var Cancel: WordBool);
    procedure DoAttachmentRead(ASender: TObject; const Attachment: Attachment);
    procedure DoAttachmentSave(ASender: TObject; const Attachment: Attachment; var Cancel: WordBool);
  end;

var
  MailItemMethods: TMailItemMethods;

function AnexaOutlookExecute(AAnexos: TStrings): Boolean;
begin
  if not Assigned(frmAnexaOutlook) then
    Application.CreateForm(TfrmAnexaOutlook, frmAnexaOutlook)
  else
    frmAnexaOutlook.OnCreate(frmAnexaOutlook);
  Result := frmAnexaOutlook.Execute(AAnexos);
  FreeAndNil(frmAnexaOutlook);
end;

procedure TfrmAnexaOutlook.FormActivate(Sender: TObject);
var
  I: Integer;
begin
  lbMensagens.Clear;
  try
    OutlookApplication1.Connect;
    for I := 1 to OutlookApplication1.Inspectors.Count do
      lbMensagens.Items.Add(OutlookApplication1.Inspectors.Item(I).Caption);
  except
  end;
  rdbAberta.Enabled   := (lbMensagens.Count > 0) or (FTipoEmail = teOutlookExpress);
  lbMensagens.Enabled := rdbAberta.Enabled;
  rdbNova.Checked     := rdbNova.Checked or not rdbAberta.Enabled;
end;

procedure TfrmAnexaOutlook.rdbAbertaClick(Sender: TObject);
begin
  lbMensagens.Enabled := rdbAberta.Checked;
  if rdbAberta.Checked and (lbMensagens.ItemIndex < 0) then
    lbMensagens.ItemIndex := 0;
  AtualizaBotoes;
end;

function TfrmAnexaOutlook.Execute(AAnexos: TStrings): Boolean;
var
  I: Integer;
  Path: String;
begin
  if Assigned(AAnexos) then
    FAnexos.Text := AnsiLowerCase(AAnexos.Text);

  Path := cxShellListView1.Root.CustomPath;
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  Path := Path + FormatDateTime('yyyymmddhhmmnn', Now) + '\';
  ForceDirectories(Path);

  for I := 0 to AAnexos.Count -1 do
  begin
    SetFileAttributes(PAnsiChar(AAnexos[I]), GetFileAttributes(PAnsiChar(AAnexos[I])) xor faReadOnly);
    MoveFile(PAnsiChar(AAnexos[I]), PAnsiChar(Path + ExtractFileName(AAnexos[I])));
    SetFileAttributes(PAnsiChar(Path + ExtractFileName(AAnexos[I])), GetFileAttributes(PAnsiChar(Path + ExtractFileName(AAnexos[I]))) or faReadOnly);
    FAnexos[I] := Path + ExtractFileName(AAnexos[I]);
  end;

  cxShellListView1.Root.CustomPath := Path;

  Result := ShowModal = mrOk;
end;

procedure TfrmAnexaOutlook.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  MailPadrao, MailExe: String;
begin
  FAnexos := TStringList.Create;
  nbTelas.PageIndex := 0;

  MailPadrao := '';
  MailExe    := '';
  Reg := TRegistry.Create(KEY_READ);
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  try
    if Reg.OpenKey('SOFTWARE\Clients\Mail', False) then
      MailPadrao := Reg.ReadString('');
  finally
    Reg.CloseKey;
    FreeAndNil(Reg);
  end;

  try
    if (MailPadrao <> '') then
      MailExe := _OUTLOOK_EXES[AnsiIndexText(MailPadrao, _OUTLOOK_NAMES)];
  except
    MailExe := '';
  end;

  // Varifica se o e-mail padrão está executando, caso não esteja verifica pelo MS Office Outlook e por final o Outlook Express - Michel - 20/10/2010
  if (MailExe <> '') and Executando(MailExe) then
    FTipoEmail := _OUTLOOK_TYPES[AnsiIndexText(MailPadrao, _OUTLOOK_NAMES)]
  else if Executando(_OFFICE_OUTLOOK_EXE) then
    FTipoEmail := teOutlook
  else if Executando(_OUTLOOK_EXPRESS_EXE) then
    FTipoEmail := teOutlookExpress
  else
    try
      OutlookApplication1.Connect;
      FTipoEmail := teOutlook;
    except
      FTipoEmail := teOutlookExpress;
    end;
  imgOutlook.Visible        := (FTipoEmail = teOutlook);
  imgOutlookExpress.Visible := (FTipoEmail = teOutlookExpress);
  AtualizaBotoes;
end;

procedure TfrmAnexaOutlook.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FAnexos);
end;

procedure TfrmAnexaOutlook.AnexaOutlook;
var
  MailItem: TMailItem;
  I: Integer;
begin
  if rdbAberta.Checked and (lbMensagens.ItemIndex < 0) then
  begin
    MessageDlg('É necessário selecionar uma mensagem.', mtInformation, [mbOk], 0);
    Exit;
  end;
  // Conecta no outlook
  try
    OutlookApplication1.Connect;
  except
    MessageDlg('Erro se conectando ao outlook.'#13'Verifique se elestá aberto e tente novamente.', mtError, [mbOk], 0);
    Exit;
  end;
  MailItem := TMailItem.Create(Self);
  // Conecta na tela escolhida
  try
    if rdbNova.Checked then
    begin
      MailItem.ConnectTo(OutlookApplication1.CreateItem(olMailItem) as _MailItem);
      MailItem.Display(olUser);
    end
    else
      MailItem.ConnectTo(OutlookApplication1.Inspectors.Item(lbMensagens.ItemIndex + 1).CurrentItem as _MailItem);
  except
    on E: SysUtils.Exception do
    begin
      MessageDlg('Não há mensagem aberta para anexar o arquivo.'#13 + E.Message, mtInformation, [mbOk], 0);
      FreeAndNil(MailItem);
      OutlookApplication1.Disconnect;
      Exit;
    end;
  end;
  // Anexa os arquivos
  try
    for I := 0 to FAnexos.Count - 1 do
      MailItem.Attachments.Add(FAnexos[I], EmptyParam, EmptyParam, EmptyParam);
  except
    on E: SysUtils.Exception do
    begin
      MessageDlg('Erro anexando o arquivo.'#13 + E.Message, mtInformation, [mbOk], 0);
      FreeAndNil(MailItem);
      OutlookApplication1.Disconnect;
      Exit;
    end;
  end;
  MailItem.Disconnect;
  FreeAndNil(MailItem);
  OutlookApplication1.Disconnect;
  ModalResult := mrOk;
end;

procedure TfrmAnexaOutlook.AnexaOutlookExpress;
var
  MapiMessage: TMapiMessage;
  Receip: TMapiRecipDesc;
  Attachments: PAttachAccessArray;
  I: integer;
  FileName: string;
  dwRet: Cardinal;
  MAPI_Session: Cardinal;
  WndList: Pointer;
begin
  dwRet := MapiLogon(Handle, PChar(''), PChar(''), MAPI_USE_DEFAULT, 0, @MAPI_Session);
  if (dwRet <> SUCCESS_SUCCESS) then
    MessageDlg('Erro tentando enviar e-mail...', mtError, [mbOk], 0)
  else
  begin
    FillChar(MapiMessage, SizeOf(MapiMessage), #0);
    Attachments := nil;
    FillChar(Receip, SizeOf(Receip), #0);
    if FAnexos.Count > 0 then
    begin
      GetMem(Attachments, SizeOf(TMapiFileDesc) * FAnexos.Count);
      for I := 0 to FAnexos.Count - 1 do
      begin
        FileName                    := FAnexos[I];
        Attachments[I].ulReserved   := 0;
        Attachments[I].flFlags      := 0;
        Attachments[I].nPosition    := ULONG($FFFFFFFF);
        Attachments[I].lpszPathName := StrNew(PChar(FileName));
        Attachments[I].lpszFileName := StrNew(PChar(ExtractFileName(FileName)));
        Attachments[I].lpFileType   := nil;
      end;
      MapiMessage.nFileCount := FAnexos.Count;
      MapiMessage.lpFiles    := @Attachments^;
    end;
    WndList := DisableTaskWindows(0);
    try
      MapiSendMail(MAPI_Session, Handle, MapiMessage, MAPI_DIALOG, 0);
      ModalResult := mrOk;
    except
      on E: SysUtils.Exception do
        MessageDlg('Erro enviando e-mail.'#13 + E.Message, mtError, [mbOk], 0);
    end;
    EnableTaskWindows(WndList);
    for I := 0 to FAnexos.Count - 1 do
    begin
      StrDispose(Attachments[I].lpszPathName);
      StrDispose(Attachments[I].lpszFileName);
    end;
    if Assigned(MapiMessage.lpszSubject) then
      StrDispose(MapiMessage.lpszSubject);
    if Assigned(MapiMessage.lpszNoteText) then
      StrDispose(MapiMessage.lpszNoteText);
    if Assigned(Receip.lpszAddress) then
      StrDispose(Receip.lpszAddress);
    if Assigned(Receip.lpszName) then
      StrDispose(Receip.lpszName);
    MapiLogOff(MAPI_Session, Handle, 0, 0);
  end;
end;

procedure TfrmAnexaOutlook.btnVoltarClick(Sender: TObject);
begin
  case nbTelas.PageIndex of
    1, 2: nbTelas.PageIndex := 0;
  end;
end;

procedure TfrmAnexaOutlook.nbTelasPageChanged(Sender: TObject);
begin
  AtualizaBotoes;
end;

procedure TfrmAnexaOutlook.btnAvancarClick(Sender: TObject);
begin
  if rdbAberta.Checked  then
    case FTipoEmail of
      teOutlook       : nbTelas.PageIndex := 1;
      teOutlookExpress: nbTelas.PageIndex := 2;
    end;
end;

procedure TfrmAnexaOutlook.AtualizaBotoes;
begin
  btnVoltar.Enabled   := nbTelas.PageIndex > 0;
  btnConcluir.Visible := ((nbTelas.PageIndex = 0) and rdbNova.Checked) or ((nbTelas.PageIndex > 0) and rdbAberta.Checked);
end;

procedure TfrmAnexaOutlook.btnConcluirClick(Sender: TObject);
begin
  case FTipoEmail of
    teOutlook: AnexaOutlook;
    teOutlookExpress: if rdbNova.Checked then
                        AnexaOutlookExpress
                      else
                        Close;
  end;
end;

procedure TfrmAnexaOutlook.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

{ TMailItemMethods }

procedure TMailItemMethods.DoAttachmentRead(ASender: TObject; const Attachment: Attachment);
begin
  
end;

procedure TMailItemMethods.DoAttachmentSave(ASender: TObject; const Attachment: Attachment; var Cancel: WordBool);
begin

end;

procedure TMailItemMethods.DoCloseItem(ASender: TObject; var Cancel: WordBool);
var
  I: Integer;
begin
  for I := 1 to TMailItem(ASender).Attachments.Count do
    if FileExists(TMailItem(ASender).Attachments.Item(I).FileName) then
      DeleteFile(TMailItem(ASender).Attachments.Item(I).FileName);
end;

procedure TMailItemMethods.DoSend(ASender: TObject; var Cancel: WordBool);
begin

end;

initialization
  MailItemMethods := TMailItemMethods.Create;

finalization
  FreeAndNil(MailItemMethods);

end.
