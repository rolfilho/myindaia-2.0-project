program EDI;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Dialogs,
  Classes,
  FileCtrl,
  StrUtils,
  Windows,
  Graphics,
  DBTables,
  SysUtils,
  Main in 'Main.pas' {frmMain},
  uGeraRelatorio in 'uGeraRelatorio.pas' {frmGeraRelatorio},
  InterfacesEmail in 'InterfacesEmail.pas',
  Utils in 'Utils.pas',
  GravaArquivoDigitalizacao in 'GravaArquivoDigitalizacao.pas',
  Consultas in 'Consultas.pas';

{$R *.RES}

begin
  Inicio := Now;
  Main.EDI.Texto := TStringList.Create;
  Main.EDI.Filtro:= TStringList.Create;
  SCRIPT := TStringList.Create;
  GUIA_LOG := TStringList.Create;

  Application.Initialize;
  Application.ShowMainForm := False;
  Application.Title := 'Integração de EDI';
  Application.CreateForm(TfrmMain, frmMain);
  if not DirectoryExists('InBkp') then begin
     ShowMessage('Diretório "InBkp" não encontrado. Programa finalizado');
     Exit;
  end;
  {** Verifica se existe o arquivo. Como não foi passado o caminho completo ele
   verifica no diretório que a aplicação está - diretório corrente           **}
  if not DirectoryExists('In') then begin
     ShowMessage('Diretório "In" não encontrado. Programa finalizado');
     Exit;
  end;
  if not DirectoryExists('Out') then begin
     ShowMessage('Diretório "Out" não encontrado. Programa finalizado');
     Exit;
  end;
  if not DirectoryExists('LOG') then begin
     ShowMessage('Diretório "LOG" não encontrado. Programa finalizado');
     Exit;
  end;
  {with TStringList.Create do begin
    try    LoadFromFile('config.txt');
           CAMINHO_EDI := ExtractWord(2,Strings[0],['=']);
           frmMain.WatchTimer.Interval := StrToInt(ExtractWord(2,Strings[1],['=']))*1000;
    except ShowMessage('Erro no arquivo config.txt. Programa finalizado');
           Exit;
    end;
    Free;
  end;}
  with frmMain do begin
    Show;
    stbMain.Panels[0].Text := 'Inicilializando...';
    grfBar.Parent := stbMain;
    VMSG('Integração de EDI BASF  /  Envio automático de emails',msSystem,false);
    VMSG('Conectando com a base de dados do MyIndaiá...',msSystem,false);
    Application.ProcessMessages;
    try
      // Processo de dados principal
      sesEDI.Open;
      db_broker.Open;
    except
      ShowMessage('Erro conectando com a base de dados. O aplicativo será finalizado');
      Exit;
    end;

    VMSG('Conexão completa.',msSystem,false);
    VMSG('Reconfigurando tarefas agendadas...',msSystem, false);

    Main.ReconfigurarAgenda(False);

    VMSG('Processo iniciado em ' + DateTimeToStr(Inicio),msSystem,false);
    VMSG('Aguardando ordens na fila...',msSystem,false);
    memLog.Lines.Add('');
    stbMain.Panels[0].Text := 'Ativo';
    WatchTimer.Enabled := True;
  end;
  Application.Run;
end.

