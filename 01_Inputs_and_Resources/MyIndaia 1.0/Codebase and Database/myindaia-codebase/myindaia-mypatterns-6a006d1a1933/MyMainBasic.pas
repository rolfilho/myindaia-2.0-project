unit MyMainBasic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.AnsiStrings,Data.DB,Vcl.Mask,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.Menus, Vcl.ToolWin,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.AppEvnts;

type
  TTranslateHelpFormClass = procedure(var aFormClass,aCaption: string) of object;
  TTranslateExceptionAction = (eaDefault, eaIgnore, eaWarning);

  TformMyMainBasic = class(TformMyForm)
    MainMenu: TMainMenu;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Cadastro1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatorios1: TMenuItem;
    Utilitarios1: TMenuItem;
    Janelas1: TMenuItem;
    EmCascata1: TMenuItem;
    LadoaLado1: TMenuItem;
    Empilhar1: TMenuItem;
    OrganizarIcones1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Janelasativas1: TMenuItem;
    FecharTodas1: TMenuItem;
    pscShortCuts: TPageScroller;
    pnlButtons: TPanel;
    pnlFooter: TPanel;
    PageScroller1: TPageScroller;
    tbrBotoesJanelas: TToolBar;
    aevMain: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure aevMainException(Sender: TObject; E: Exception);
    procedure aevMainMessage(var Msg: tagMSG; var Handled: Boolean);
  private
    procedure JanelasativasNClick(Sender: TObject);
    procedure FRBASICADDCHILDMSG(var Message: TMessage);
      message FRBASIC_ADDCHILD_MSG;
    procedure FRBASICREMOVECHILDMSG(var Message: TMessage);
      message FRBASIC_REMOVECHILD_MSG;
    procedure TratarOnException(E: Exception; const BugReport: string = '');
    procedure HandleException(E: Exception; var Msg: string;
      var Action: TTranslateExceptionAction);
  protected
    function PodeEnviarErros: Boolean; virtual;
  public
    TratarErrosDesconhecidosComoWarning: Boolean;
    procedure AddChild(aForm: TForm);
    procedure CheckWindowsOrder;
    function ChildRegistered(aForm: TForm): Boolean;
    procedure CloseChildren;
    function GetMDIClientRect: TRect;
    procedure RemoveChild(aForm: TForm);
    procedure ExceptionHandler(Sender: TObject; E: Exception);
  end;

var
  formMyMainBasic: TformMyMainBasic;

implementation

{$R *.dfm}

uses MyDialog;

procedure TformMyMainBasic.JanelasativasNClick(Sender: TObject);
var
  f: TForm;
  i: integer;
begin
  f := TForm(TMenuItem(Sender).Tag);
  if f.Enabled then
  begin
    if f.WindowState = wsMinimized then
      f.WindowState := wsNormal;
    f.Show;
    for i := 0 to tbrBotoesJanelas.ButtonCount - 1 do
      tbrBotoesJanelas.Buttons[i].Down := False;
    TToolButton(f.Tag).Down := True;
  end
  else if f is TformMyForm then
    if Assigned(TformMyForm(f).ModalForm) then
      Warning('A tela "' + f.Caption +
        '" não pode ser exibida porque está bloqueada pela tela "' +
        TformMyForm(f).ModalForm.Caption + '".');
end;

function TformMyMainBasic.PodeEnviarErros: Boolean;
begin
  Result := False;
end;

procedure TformMyMainBasic.ExceptionHandler(Sender: TObject; E: Exception);
{var
  wRetVal: Word;
begin
  wRetVal := MessageDlg('ERRO: ' + E.Message, mtError, mbAbortRetryIgnore, 0);
  case wRetVal of
    mrAbort:
      begin
        // handle "Abort" here...
      end;
    mrRetry:
      begin
        // handle "Retry" here...
      end;
    mrIgnore:
      begin
        // handle "Ignore" here...
      end;
  else
    begin
      // handle "other" action here...
    end;
  end;}
const
  MsgErroInesperado  = 'Ocorreu um erro. Entre em contato com o suporte técnico.';
var
  Msg:string;
  Titulo: string;
  MsgType: TMyMsgDlgType;
  Action: TTranslateExceptionAction;
  Path: string;
  Arquivo: string;
  Erro: TStringList;
  PathImagem: String;
  Enviou: Boolean;
begin
  Path := ExtractFilePath(ParamStr(0));
  //Log(e.ClassName+' '+UnformatMemo(e.Message));
  if E is EDBEditError and E.Message.Equals('Invalid input value.  Use escape key to abandon changes') then
    Abort
  else if E is EAbort then
  else if (E is EExpected) or (E is EAbortar) then
    Warning(E.Message)
  else
  begin
    Msg := e.Message;
    Action := eaDefault;
    HandleException(E, Msg, Action);
    case Action of
      eaIgnore:;
      eaWarning: Warning(Msg);
      eaDefault:
      begin
        if TratarErrosDesconhecidosComoWarning then
        begin
          MsgType := dmtWarning;
          Titulo := 'Atenção';
        end
        else
        begin
          MsgType := dmtError;
          Titulo := 'Erro';
        end;
        if FindCmdLineSwitch('debug') then
          Warning(MsgErroInesperado + #13#13 + Msg);
      end;
    end;
  end;
end;

procedure TformMyMainBasic.AddChild(aForm: TForm);
var
  m: TMenuItem;
  ToolButton: TToolButton;
  i: integer;
begin
  if ChildRegistered(aForm) then
    Exit;
  // Menuitems
  m := TMenuItem.Create(Self);
  m.Caption := '&_ ' + aForm.Caption;
  m.Tag := integer(aForm);
  m.OnClick := JanelasativasNClick;
  Janelasativas1.Add(m);
  CheckWindowsOrder;
  // Toolbar
  for i := 0 to tbrBotoesJanelas.ButtonCount - 1 do
    tbrBotoesJanelas.Buttons[i].Down := False;
  ToolButton := TToolButton.Create(Self);
  ToolButton.Caption := aForm.Caption;
  ToolButton.Tag := integer(aForm);
  ToolButton.Down := True;
  ToolButton.OnClick := JanelasativasNClick;
  ToolButton.Left := tbrBotoesJanelas.ButtonCount *
    tbrBotoesJanelas.ButtonWidth + 1;
  ToolButton.Parent := tbrBotoesJanelas;
  aForm.Tag := integer(ToolButton);
end;

function TformMyMainBasic.ChildRegistered(aForm: TForm): Boolean;
var
  i: integer;
begin
  Result := True;
  for i := Janelasativas1.Count - 1 downto 0 do
    if Janelasativas1.Items[i].Tag = integer(aForm) then
      Exit;
  Result := False;
end;

procedure TformMyMainBasic.RemoveChild(aForm: TForm);
var
  i: integer;
begin
  with Janelasativas1 do
    for i := Count - 1 downto 0 do
    begin
      if Items[i].Tag = integer(aForm) then
        Items[i].free;
      if tbrBotoesJanelas.Buttons[i].Tag = integer(aForm) then
        tbrBotoesJanelas.Buttons[i].free;
    end;
  CheckWindowsOrder;
end;

procedure TformMyMainBasic.aevMainException(Sender: TObject; E: Exception);
begin
  inherited;
  TratarOnException(E);
end;

procedure TformMyMainBasic.aevMainMessage(var Msg: tagMSG;
  var Handled: Boolean);
var
  key:integer;
  sft:TShiftState;
begin
  inherited;
  if Msg.Message = WM_KEYDOWN then
  begin
    key := Msg.wParam;
    sft := KeyDataToShiftState(Msg.lParam);
    if key = VK_F1 then
    begin
      if ssCtrl in sft then
        //HelpAtControl
      else
        //HelpAtForm;
      Handled:=true;
    end
    else if (ssCtrl in sft) then
      if (key=32) then
      begin
        //ShootActiveForm(CmdLineValue('snap'));
        Handled:=true;
      end;
  end;
end;

function ExecutadoPelaRede(Caminho: String): Boolean;
begin
	Caminho:=StringReplace(Caminho, '"', '', [rfReplaceAll]);
	if Caminho<>'' then
	begin
		if LeftStr(Caminho, 2)='\\' then
			Result:=True
		else
		begin
			Caminho:=LeftStr(Caminho, 3);
			Result:=(GetDriveType(PChar(Caminho))=DRIVE_REMOTE);
		end;
	end
	else
	  Result := False;
end;

procedure TformMyMainBasic.HandleException(E: Exception; var Msg: string; var Action: TTranslateExceptionAction);
var
  p1,p2:integer;
begin
  if AnsiContainsText(E.Message, 'External exception C0000006') and ExecutadoPelaRede(ExtractFilePath(Application.ExeName)) then
  begin
    Warning('Falha na conexão com o servidor. O sistema será encerrado.'#13+
             'Identificamos que o sistema está sendo executado pela rede.'#13+
             'Este problema aconteceu provavelmente porque:'#13+
             ''#13+
             '- houve uma falha de rede; ou'#13+
             '- o servidor de aplicação saiu do ar.'#13+
             ''#13+
             'Tente executar novamente o sistema. Se o problema persistir, contate o responsável. '+
             'Se este erro tem acontecido de forma frequente, é provável que sua rede esteja instável. Peça para o responsável verificar.');
    Application.Terminate;
    Abort;
  end;

  if AnsiContainsText(E.Message, 'Unable to complete network request to host') or
     AnsiContainsText(E.Message, 'Error reading data from the connection') or
     AnsiContainsText(E.Message, 'Possible network error') or
     AnsiContainsText(E.Message, 'connection lost to database') or
     AnsiContainsText(E.Message, 'Lost communication with SQL server') or
     AnsiContainsText(E.Message, 'Cannot locate or connect to SQL server') or
     AnsiContainsText(E.Message, 'SQL Server is unavailable or does not exist') then
  begin
    Warning('Não foi possível acessar o servidor. O sistema será encerrado.'#13+
             ''#13+
             'Este erro aconteceu provavelmente porque:'#13+
             ''#13+
             '- houve uma falha de rede; ou'#13+
             '- o servidor saiu do ar.'#13+
             ''#13+
             'Tente executar novamente o sistema. Se o problema persistir, contate o responsável. '+
             'Se este erro tem acontecido de forma frequente, é provável que sua rede esteja instável. Peça para o responsável verificar.');
    Application.Terminate;
    Abort;
  end;
  if AnsiContainsText(E.Message, 'SQL Server connection timed out') then
  begin
    Warning('A consulta demorou e o Servidor de Banco de Dados cancelou a operação.'#13+
             ''#13+
             'Este erro aconteceu provavelmente porque:'#13+
             ''#13+
             '- os indices estão fragmentados; ou'#13+
             '- as estatísticas estão desatualizadas; ou'#13+
             '- existem muitos usuários conectados e o Servidor não conseguiu atender neste momento.'#13+
             ''#13+
             'Tente executar novamente a operação. Se o problema persistir, contate o responsável.'+
             'Se este erro tem acontecido de forma frequente, é provável que seu servidor esteja instável. Peça para o responsável verificar.');
    Abort;
  end;
  if AnsiContainsText(E.Message, 'ZIMFDRV.dll') or
     (AnsiContainsText(E.Message, 'KMXL') and AnsiContainsText(E.Message, '.dll')) or //KMXL30AQ.DLL, KMXL31EM.dll, KMXL42E9.dll
     AnsiContainsText(E.Message, 'IMFNT5.DLL') then
  begin
    Msg := 'Ocorreu um erro durante a impressão.'#13+
           '- verifique se a impressora selecionada está ligada;'#13+
           '- se a impressora estiver ligada a outro computador verifique se este está ligado;'#13#13+
           'Se o problema persistir verifique se é possível imprimir de outro aplicativo (ex: editor de textos ou planilhas), '#13+
           'caso contrário pode haver um problema na instalação de sua impressora tente reinstalar a impressora.|'+Msg;
  end
  else
  if AnsiContainsText(E.Message, 'database file appears corrupt') or AnsiContainsText(E.Message, 'internal gds software consistency check') then
  begin
    Msg := 'Foram detectadas inconsistências no seu banco de dados.'#13+
           ''#13+
           'Este erro aconteceu provavelmente porque:'#13+
           ''#13+
           '- existe alguma falha na estrutura do banco de dados; ou'#13+
           '- os dados apresentam algum tipo de corrupção.'#13+
           ''#13+
           'Se o sistema continuar a ser utilizado, o problema pode se agravar para uma corrupção severa dos dados, com risco de perda de informações.'#13+
           ''#13+
           'Para solucionar o problema siga as instruções:'#13+
           ''#13+
           '- desative o servidor Firebird;'#13+
           '- faça uma cópia do arquivo do banco de dados;'#13+
           '- ative o servidor Firebird e utilize as ferramentas de administração do Firebird (gfix) para tentar reparar o arquivo;'#13+
           '- execute novamente a funcionalidade do sistema que ocasionou este aviso;'#13+
           '- se o aviso continuar aparecendo, tente realizar um "backup" e "restore" do banco de dados utilizando a ferramenta do Firebird (gbak);'#13+
           '- execute novamente a funcionalidade do sistema que ocasionou este aviso;'#13+
           '- se o aviso continuar aparecendo, restaure sua última cópia de segurança.'#13+
           ''#13+
           'Qualquer dúvida entre em contato com o suporte da Fortes Informática.|'+Msg;
    //EDBEngineError E:13059 General SQL error. database file appears corrupt () bad checksum checksum error on database page 78114
    //EDBEngineError E:13059 General SQL error. internal gds software consistency check (can't continue after bugcheck)
  end
  {
  else if (AnsiContainsText(E.Message, 'MAXFILEHANDLE') or
           AnsiContainsText(E.Message, 'At end of Table') or
           AnsiContainsText(E.Message, 'BLOB Already Opened') or
           AnsiContainsText(E.Message, 'BLOB not found') or
           AnsiContainsText(E.Message, 'Lock file has grown too large') or
           AnsiContainsText(E.Message, 'Invalid BLOB handle in record buffer') or
           AnsiContainsText(E.Message, 'Insufficient disk space')) then
  begin
    Warning('Ocorreu uma falha. Encerre a aplicação e inicie novamente. '#13+
            'Se o erro persistir, entre em contato com o suporte.|'+Msg);
    Action := eaIgnore;
    Exit;
  end
  }
  else if AnsiContainsText(E.Message, 'O servidor RPC não está disponível') or
          AnsiContainsText(E.Message, 'O servidor de RPC não está disponível') then
  begin
    Warning('O Windows não pode imprimir devido a um problema na configuração atual da impressora. '#13+
            'Este erro poderá aparecer se uma impressora padrão não tiver sido designada ou se o aplicativo não conseguir localizar uma impressora padrão existente. '#13+
            'Para corrigir o problema, tente um destes procedimentos no Microsoft Windows: '#13#13+
            '- Se não houver nenhuma impressora disponível na caixa de diálogo Imprimir, adicione uma. '#13+
            '- Se o aplicativo não conseguir encontrar uma impressora que já esteja instalada, especifique-a como a impressora padrão. '#13+
            '- Se uma impressora padrão estiver instalada, mas o aplicativo não puder utilizá-la, desinstale o driver da impressora e instale a versão mais recente do driver. '#13+
            '- Se a impressora estiver em um servidor de impressão, verifique se a impressora está disponível, a rede está funcionando, o servidor não está desativado, '#13+
            '  a impressora não está sem papel ou não foi suspensa pelo administrador. Os problemas de impressão associados a uma impressora na rede são mais facilmente '#13+
            '  tratados pelo administrador da rede local. '#13#13+
            'Para obter mais informações sobre como configurar conexões de impressora e solucionar os problemas relacionados, consulte a Ajuda e Suporte do Windows.|'+Msg);
    Action := eaIgnore;
    Exit;
  end
  else if E is EFCreateError then
  begin
    if AnsiContainsText(E.Message, 'Cannot create file') then
      Msg := AnsiReplaceText(E.Message, 'Cannot create file', 'Não foi possível criar o arquivo');
  end
  else if e is EDataBaseError then
  begin
    if pos('must have a value',lowercase(Msg))>0 then
    begin
      p1:=pos('field',lowercase(Msg))+Length('field');
      p2:=pos('must',lowercase(Msg))-1;
      Msg := 'Campo '+Copy(Msg,p1,p2-p1)+' em branco|'+Msg;
    end
    else if pos('has no index',lowercase(Msg))>0 then
      Msg := Msg+' Organize os arquivos'
    else
      Exit;
  end else if e is EDBEditError then
    Msg := 'Texto inválido. Pressione Esc para retornar!'
  else if pos('is not a valid time',lowercase(Msg))>0 then
    Msg := 'Hora inválida|'+Msg
  else
    Exit;
  Action := eaWarning;
end;

procedure TformMyMainBasic.TratarOnException(E: Exception; const BugReport: string);
const
  MsgErroInesperado  = 'Ocorreu um erro. Entre em contato com o suporte técnico.';
var
  Msg:string;
  Titulo: string;
  MsgType: TMyMsgDlgType;
  Action: TTranslateExceptionAction;
  Path: string;
  Arquivo: string;
  Erro: TStringList;
  PathImagem: String;
  Enviou: Boolean;
begin
  Path := ExtractFilePath(ParamStr(0));
  //Log(e.ClassName+' '+UnformatMemo(e.Message));
  if E is EDBEditError and E.Message.Equals('Invalid input value.  Use escape key to abandon changes') then
  else if E is EAbort then
  else if (E is EExpected) or (E is EAbortar) then
    Warning(E.Message)
  else
  begin
    Msg := e.Message;
    Action := eaDefault;
    HandleException(E, Msg, Action);
    case Action of
      eaIgnore:;
      eaWarning: Warning(Msg);
      eaDefault:
      begin
        if TratarErrosDesconhecidosComoWarning then
        begin
          MsgType := dmtWarning;
          Titulo := 'Atenção';
        end
        else
        begin
          MsgType := dmtError;
          Titulo := 'Erro';
        end;
        if FindCmdLineSwitch('debug') then
          Warning(MsgErroInesperado + #13#13 + Msg+'|'+BugReport)
        else
        begin
          Enviou := False;
          Erro := TStringList.Create;
          try
            //ColetarInformacoes(E, Erro, PathImagem, E.ClassName + ': ' + Msg);
            //MadExcept
            if BugReport <> '' then
            begin
              Erro.Add('');
              Erro.Add('<MadExcept>');
              Erro.Add(BugReport);
              Erro.Add('</MadExcept>');
            end;
          finally
            FreeAndNil(Erro);
          end;
        end;
      end;
    end;
  end;
end;

procedure TformMyMainBasic.CheckWindowsOrder;
var
  i: integer;
  c: char;
  m: TMenuItem;
begin
  for i := 0 to Janelasativas1.Count - 1 do
  begin
    if i < 10 then
      c := char(ord('0') + i)
    else
      c := char(ord('A') + i - 10);
    m := Janelasativas1.Items[i];
    m.Caption := '&' + c + copy(m.Caption, 3, length(m.Caption));
  end;
  Janelasativas1.Enabled := Janelasativas1.Count > 0;
end;

function TformMyMainBasic.GetMDIClientRect: TRect;
begin
  Result := ClientRect;
  inc(Result.Top, { pnlHeader.Height + } pnlButtons.Height);
  dec(Result.Bottom, pnlFooter.Height);
end;

procedure TformMyMainBasic.CloseChildren;
var
  i: integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].Close;
end;

procedure TformMyMainBasic.FormCreate(Sender: TObject);
begin
  inherited;
  Application.OnException := ExceptionHandler;
end;

procedure TformMyMainBasic.FRBASICADDCHILDMSG(var Message: TMessage);
begin
  if (TformMyForm(Message.wParam).HasChildShortCut) then
    AddChild(TForm(Message.wParam));
end;

procedure TformMyMainBasic.FRBASICREMOVECHILDMSG(var Message: TMessage);
begin
  if (TformMyForm(Message.wParam).HasChildShortCut) then
    RemoveChild(TForm(Message.wParam));
end;

end.
