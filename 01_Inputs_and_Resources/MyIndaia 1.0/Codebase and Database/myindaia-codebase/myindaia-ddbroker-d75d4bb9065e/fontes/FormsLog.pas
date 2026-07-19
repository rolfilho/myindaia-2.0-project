unit FormsLog;

interface

uses
  Forms, Messages, Windows, Classes;

{type
  TForm = class(Forms.TForm)
  private
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
  protected
    procedure DoLog(AMsg: String);
    procedure DoClose(var Action: TCloseAction); override;
    procedure DoCreate; override;
    procedure DoDestroy; override;
    procedure DoHide; override;
    procedure DoShow; override;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
  end;

  TDataModule = class(Classes.TDataModule)
  protected
    procedure DoLog(AMsg: String);
    procedure DoCreate; override;
    procedure DoDestroy; override;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
  end;

  function Path: String;
  function GetLogPath: String;
  function GetLogFileName: String;}

implementation

(*uses SysUtils;

var
  FPath: String;
  FLogPath: String;
  FDataLog: TDateTime;
  FLogFileName: String;

function Path: String;
begin
  Result := FPath;
end;

function GetLogPath: String;
begin
  Result := FLogPath;
end;

procedure SetLogPath(APath: String);
begin
  APath := Trim(APath);
  if APath <> '' then
  begin
    if APath[Length(APath)] <> '\' then
      APath := APath + '\';
    if not DirectoryExists(APath) then
      ForceDirectories(APath);
    FLogPath := APath;
  end;
end;

function GetLogFileName: String;
begin
  Result := FLogFileName;
end;

procedure WriteToLog(AMsg: String; AIncludeDate: Boolean = True);
var
  FLogFile: TextFile;
begin
  FDataLog := Date;
  FLogFileName := FLogPath + FormatDateTime('yyyy-mm-dd', FDataLog) + '.txt';
  try
    AssignFile(FLogFile, FLogFileName);
    try
      if FileExists(FLogFileName) then
        Append(FLogFile)
      else
        Rewrite(FLogFile);
      if AIncludeDate then
        AMsg := '[' + FormatDateTime('hh:nn:ss:zzz', Now) + '] ' + AMsg;
      Writeln(FLogFile, AMsg);
    finally
      CloseFile(FLogFile);
    end;
  except
  end;
end;

{ TForm }

constructor TForm.Create(AOwner: TComponent);
begin
  DoLog('Before Create');
  inherited;
  DoLog('After Create');
end;

constructor TForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  DoLog('Before CreateNew');
  inherited;
  DoLog('After CreateNew');
end;

destructor TForm.Destroy;
begin
  DoLog('Before Destroy');
  inherited;
  DoLog('After Destroy');
end;

procedure TForm.DoClose(var Action: TCloseAction);
begin
  DoLog('DoClose');
  inherited;
end;

procedure TForm.DoCreate;
begin
  DoLog('DoCreate');
  inherited;
end;

procedure TForm.DoDestroy;
begin
  DoLog('DoDestroy');
  inherited;
end;

procedure TForm.DoHide;
begin
  DoLog('DoHide');
  inherited;
end;

procedure TForm.DoLog(AMsg: String);
begin
  if Name <> '' then
    WriteToLog(Name + '.' + AMsg)
  else
    WriteToLog(ClassName + '.' + AMsg);
end;

procedure TForm.DoShow;
begin
  if fsModal in Self.FormState then
    DoLog('ShowModal')
  else
    DoLog('Show');
  inherited;
end;

procedure TForm.WMActivate(var Message: TWMActivate);
begin
  if Message.Active = WA_INACTIVE then
    DoLog('Deactivate')
  else if Message.Active = WA_ACTIVE then
    DoLog('Activate');
end;


{ TDataModule }

constructor TDataModule.Create(AOwner: TComponent);
begin
  DoLog('Before Create');
  inherited;
  DoLog('After Create');
end;

constructor TDataModule.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  DoLog('Before CreateNew');
  inherited;
  DoLog('After CreateNew');
end;

destructor TDataModule.Destroy;
begin
  DoLog('Before Destroy');
  inherited;
  DoLog('After Destroy');
end;

procedure TDataModule.DoCreate;
begin
  DoLog('DoCreate');
  inherited;
end;

procedure TDataModule.DoDestroy;
begin
  DoLog('DoDestroy');
  inherited;
end;

procedure TDataModule.DoLog(AMsg: String);
begin
  if Name <> '' then
    WriteToLog(Name + '.' + AMsg)
  else
    WriteToLog(ClassName + '.' + AMsg);
end;

initialization
  FPath := ExtractFilePath(ParamStr(0));
  SetLogPath(FPath + 'Logs\');
  FDataLog := Date;
  FLogFileName := FLogPath + FormatDateTime('yyyy-mm-dd', FDataLog) + '.txt';
  if FileExists(FLogFileName) then
    WriteToLog('', False);
  WriteToLog('Sistema Inicializado');

finalization
  WriteToLog('Sistema Finalizado');*)

end.
