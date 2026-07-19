unit FrSQLMonitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.StdCtrls, Vcl.ExtCtrls,
   Aurelius.Mapping.Explorer, Aurelius.Events.Manager;

type
  TformSQLMonitor = class(TformMyForm)
    Memo: TMemo;
    PanelBottom: TPanel;
    btClear: TButton;
    cbEnable: TCheckBox;
    procedure btClearClick(Sender: TObject);
    procedure cbEnableClick(Sender: TObject);
  private
    FSqlExecutingProc: TSQLExecutingProc;
    procedure BreakLine;
    procedure SqlExecutingHandler(Args: TSQLExecutingArgs);
    procedure SubscribeListeners;
    procedure UnsubscribeListeners;
    procedure Log(const S: string);
  protected
    procedure DoCreate; override;
  public

  end;

var
  formSQLMonitor: TformSQLMonitor;

implementation

{$R *.dfm}

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Global.Utils;

procedure TformSQLMonitor.BreakLine;
begin
  Memo.Lines.Add('================================================');
end;

procedure TformSQLMonitor.btClearClick(Sender: TObject);
begin
  inherited;
  Memo.Clear;
end;

procedure TformSQLMonitor.cbEnableClick(Sender: TObject);
begin
  inherited;
  if cbEnable.Checked then
    SubscribeListeners
  else
    UnsubscribeListeners;
end;

procedure TformSQLMonitor.DoCreate;
begin
  inherited;
  FSqlExecutingProc := SqlExecutingHandler;
  SubscribeListeners;
end;

procedure TformSQLMonitor.Log(const S: string);
begin
  Memo.Lines.Add(S);
end;

procedure TformSQLMonitor.SqlExecutingHandler(Args: TSQLExecutingArgs);
var
  Param: TDBParam;
begin
  Log(Args.SQL);
  if Args.Params <> nil then
    for Param in Args.Params do
      Log(Param.ToString);
  BreakLine;
end;

procedure TformSQLMonitor.SubscribeListeners;
var
  E: TManagerEvents;
begin
  E := TMappingExplorer.Default.Events;
  E.OnSQLExecuting.Subscribe(FSqlExecutingProc);
end;

procedure TformSQLMonitor.UnsubscribeListeners;
var
  E: TManagerEvents;
begin
  E := TMappingExplorer.Default.Events;
  E.OnSqlExecuting.Unsubscribe(FSqlExecutingProc);
end;

end.
