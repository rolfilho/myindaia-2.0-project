unit uLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TLogType = (ltDefault, ltError, ltSucess, ltSystem);

const
  _LOG_TYPE_COLORS: array[ltDefault..ltSystem] of TColor = (clWindowText, // ltDefault
                                                            clRed,        // ltError
                                                            clBlue,       // ltSucess
                                                            clGreen);     // ltSystem

type
  TfrmMyDigLog = class(TForm)
    reLog: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FFileName: String;
  public
    procedure WriteToLog(AMsg: String; AType: TLogType; AIncludeTime: Boolean = False;
       ASave: Boolean = False);
    procedure SaveLog;
    procedure SaveLogToFile(AFileName: String);
    property FileName: String read FFileName;
  end;

  procedure WriteToLog(AMsg: String; AType: TLogType; AIncludeTime: Boolean = False;
     ASave: Boolean = False);
  procedure SaveLog;
  procedure SaveLogToFile(AFileName: String);
  procedure ShowLog;
  procedure HideLog;

var
  frmMyDigLog: TfrmMyDigLog;

implementation

{$R *.dfm}

procedure WriteToLog(AMsg: String; AType: TLogType; AIncludeTime: Boolean = False;
   ASave: Boolean = False);
begin
  if Assigned(frmMyDigLog) and (frmMyDigLog.ComponentCount > 0) then
    frmMyDigLog.WriteToLog(AMsg, AType, AIncludeTime, ASave);
end;

procedure SaveLog;
begin
  if Assigned(frmMyDigLog) and (frmMyDigLog.ComponentCount > 0) then
    frmMyDigLog.SaveLog;
end;

procedure SaveLogToFile(AFileName: String);
begin
  if Assigned(frmMyDigLog) and (frmMyDigLog.ComponentCount > 0) then
    frmMyDigLog.SaveLogToFile(AFileName);
end;

procedure ShowLog;
begin
  if Assigned(frmMyDigLog) and (frmMyDigLog.ComponentCount > 0) then
    frmMyDigLog.Show;
end;

procedure HideLog;
begin
  if Assigned(frmMyDigLog) and (frmMyDigLog.ComponentCount > 0) then
    frmMyDigLog.Hide;
end;

{ TfrmMyDigLog }

procedure TfrmMyDigLog.SaveLog;
begin
  reLog.Lines.SaveToFile(FFileName);
end;

procedure TfrmMyDigLog.SaveLogToFile(AFileName: String);
begin
  if FFileName <> AFileName then
    FFileName := AFileName;
  SaveLog;
end;

procedure TfrmMyDigLog.WriteToLog(AMsg: String; AType: TLogType;
  AIncludeTime, ASave: Boolean);
begin
  if AIncludeTime then
    AMsg := FormatDateTime('"["hh:nn:ss"]" ', Now) + AMsg;
  reLog.SelStart := Length(reLog.Lines.Text);
  reLog.SelAttributes.Color := _LOG_TYPE_COLORS[AType];
  reLog.Lines.Add(AMsg);
  if ASave then
    SaveLog;
end;

procedure TfrmMyDigLog.FormCreate(Sender: TObject);
begin
  FFileName := ExtractFilePath(Application.ExeName) + FormatDateTime('yyyy-mm-dd', Now) + 'rtf';
end;

procedure TfrmMyDigLog.FormShow(Sender: TObject);
begin
  Left   := Application.MainForm.Left;
  Top    := Application.MainForm.Top + Application.MainForm.Height - 100;
  Width  := Application.MainForm.Width;
  Height := 100;
end;

end.
