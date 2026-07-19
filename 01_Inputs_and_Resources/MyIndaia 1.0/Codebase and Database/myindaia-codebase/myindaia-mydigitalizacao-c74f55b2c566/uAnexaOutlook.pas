unit uAnexaOutlook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, Outlook2000, Mapi, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, ShellAPI, ShlObj, cxShellCommon, cxControls, cxContainer,
  cxShellListView, StrUtils, Registry, Funcoes, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters, cxEdit,
  cxShellControls;

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
    procedure btnVoltarClick(Sender: TObject);
    procedure nbTelasPageChanged(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FAnexos: TStringArray;
    FLinks: TLinkArray;
    FTipoEmail: TTipoEmail;
    procedure AnexaOutlook;
    procedure AnexaOutlookExpress;
    procedure AtualizaBotoes;
  public
    function Execute(AAnexos: TStringArray; ALinks: TLinkArray): Boolean;
  end;

  function AnexaOutlookExecute(AAnexos: TStringArray; ALinks: TLinkArray): Boolean;

var
  frmAnexaOutlook: TfrmAnexaOutlook;

implementation

uses DateUtils;

{$R *.dfm}

function AnexaOutlookExecute(AAnexos: TStringArray; ALinks: TLinkArray): Boolean;
begin
  if not Assigned(frmAnexaOutlook) then
  begin
    Application.CreateForm(TfrmAnexaOutlook, frmAnexaOutlook);
    try
      Result := frmAnexaOutlook.Execute(AAnexos, ALinks);
    finally
      FreeAndNil(frmAnexaOutlook);
    end;
  end
  else
    Result := False;
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

function TfrmAnexaOutlook.Execute(AAnexos: TStringArray; ALinks: TLinkArray): Boolean;
var
  I, C: Integer;
  FN, Path: String;
  SR: TSearchRec;
  DT: TDateTime;
  LFT: TFileTime;
  ST: TSystemTime;
begin
  SetLength(FAnexos, High(AAnexos) + 1);
  for I := 0 to High(AAnexos) do
    FAnexos[I] := AnsiLowerCase(AAnexos[I]);

  FLinks := ALinks;

  Path := cxShellListView1.Root.CustomPath;
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  Path := Path + FormatDateTime('yyyymmdd', Now) + '\';
  ForceDirectories(Path);

  DT := IncHour(Now, -1);
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
    repeat
      FileTimeToLocalFileTime(SR.FindData.ftCreationTime, LFT);
      FileTimeToSystemTime(LFT, ST);
      if SystemTimeToDateTime(ST) < DT then
        //DeleteFile(Path + SR.Name);
        ExcluiArquivo(Path + SR.Name);
    until FindNext(SR) <> 0;

  for I := 0 to High(AAnexos) do
  begin
    if GetFileAttributes(PAnsiChar(AAnexos[I])) and SysUtils.faReadOnly = SysUtils.faReadOnly then
      SetFileAttributes(PAnsiChar(AAnexos[I]), GetFileAttributes(PAnsiChar(AAnexos[I])) xor SysUtils.faReadOnly);
    FN := ChangeFileExt(ExtractFileName(AAnexos[I]), '');
    while (FN <> '') and (FN[Length(FN)] in ['0','1','2','3','4','5','6','7','8','9']) do
      Delete(FN, Length(FN), 1);
    C := 1;
    while FileExists(Path + FN + FormatFloat('00', C) + ExtractFileExt(AAnexos[I])) do
      Inc(C);
    MoveFile(PAnsiChar(AAnexos[I]), PAnsiChar(Path + FN + FormatFloat('00', C) + ExtractFileExt(AAnexos[I])));
    FAnexos[I] := Path + FN + FormatFloat('00', C) + ExtractFileExt(AAnexos[I]);
  end;

  cxShellListView1.Root.CustomPath := Path;

  Result := ShowModal = mrOk;
  if (not Result) or (FTipoEmail = teOutlookExpress) then
    for I := 0 to High(AAnexos) do
      //DeleteFile(FAnexos[I]);
      ExcluiArquivo(FAnexos[I]);
end;

procedure TfrmAnexaOutlook.FormCreate(Sender: TObject);
var
  Reg: TRegistry;
  MailPadrao, MailExe: String;
begin
  SetLength(FAnexos, 0);
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
  //FTipoEmail := teOutlookExpress;
  try
    imgOutlook.Visible        := (FTipoEmail = teOutlook);
    imgOutlookExpress.Visible := (FTipoEmail = teOutlookExpress);
    AtualizaBotoes;
  except
  end;
end;

procedure TfrmAnexaOutlook.AnexaOutlook;
var
  MailItem: TMailItem;
  I: Integer;
  Body: TStrings;
  Nome: String;
  N: Integer;
  NS: String;
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
    for I := 0 to High(FAnexos) do
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
  try
    Body := TStringList.Create;
    try
      Nome := '';
      N := 1;
      if High(FLinks) >= 0 then
        Body.Add('Segue abaixo os links para os arquivos.');
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
      MailItem.HTMLBody := '<html><body>' + Body.Text + '</body></html>' + MailItem.HTMLBody;
    finally
      FreeAndNil(Body);
    end;
  except
    on E: SysUtils.Exception do
    begin
      MessageDlg('Erro incluindo links.'#13 + E.Message, mtInformation, [mbOk], 0);
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
  Body: TStrings;
  FBodyFileName: String;
  Nome: String;
  N: Integer;
  NS: String;
begin
  dwRet := MapiLogon(Handle, PChar(''), PChar(''), MAPI_USE_DEFAULT, 0, @MAPI_Session);
  if (dwRet <> SUCCESS_SUCCESS) then
    MessageDlg('Erro tentando enviar e-mail...', mtError, [mbOk], 0)
  else
  begin
    FillChar(MapiMessage, SizeOf(MapiMessage), #0);
    Attachments := nil;
    FillChar(Receip, SizeOf(Receip), #0);

    GetMem(Attachments, SizeOf(TMapiFileDesc) * ((High(FAnexos) + 1) + (High(FLinks) + 1)));
    if High(FLinks) >= 0 then
    begin
      MapiMessage.lpszNoteText := nil;
      Body := TStringList.Create;
      Nome := '';
      N := 1;
      try
        Body.Add('<html>');
        Body.Add('    <body>');
        Body.Add('        Segue abaixo os links para os arquivos.<br><br>');
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
        Body.Add('    <body>');
        Body.Add('<html>');
        FBodyFileName := 'C:\HTML_Email_' + FormatDateTime('hhmmss', Now) + '.htm';
        Body.SaveToFile(FBodyFileName);
      finally
        FreeAndNil(Body);
      end;
      SetLength(FAnexos, High(FAnexos) + 2);
      for I := 0 to High(FAnexos) - 1 do
        FAnexos[I + 1] := FAnexos[I];
      FAnexos[0] := FBodyFileName;
    end;

    if High(FAnexos) >= 0 then
    begin
      for I := 0 to High(FAnexos) do
      begin
        FileName := FAnexos[I];
        Attachments[I + Integer(MapiMessage.nFileCount)].ulReserved   := 0;
        Attachments[I + Integer(MapiMessage.nFileCount)].flFlags      := 0;
        Attachments[I + Integer(MapiMessage.nFileCount)].nPosition    := ULONG($FFFFFFFF);
        Attachments[I + Integer(MapiMessage.nFileCount)].lpszPathName := StrNew(PAnsiChar(FileName));
        Attachments[I + Integer(MapiMessage.nFileCount)].lpszFileName := StrNew(PAnsiChar(ExtractFileName(FileName)));
        Attachments[I + Integer(MapiMessage.nFileCount)].lpFileType   := nil;
      end;
      MapiMessage.nFileCount := MapiMessage.nFileCount + High(FAnexos) + 1;
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
    for I := 0 to High(FAnexos) do
    begin
      StrDispose(Attachments[I].lpszPathName);
      StrDispose(Attachments[I].lpszFileName);
    end;
    //if FBodyFileName <> '' then
    //  DeleteFile(FBodyFileName);
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


end.
