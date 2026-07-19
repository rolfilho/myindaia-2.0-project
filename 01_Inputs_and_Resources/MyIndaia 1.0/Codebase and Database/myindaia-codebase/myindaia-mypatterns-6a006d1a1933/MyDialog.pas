unit MyDialog;

interface

uses Vcl.Controls, Vcl.Dialogs, Vcl.Forms, Vcl.Buttons, Vcl.StdCtrls, System.SysUtils;

type
  TMyMsgDlgType = (dmtWarning, dmtError, dmtInformation, dmtConfirmation, dmtCustom);
  TMyMsgDlgBtn  = (dmbYes, dmbNo, dmbOK, dmbCancel, dmbAbort, dmbRetry, dmbIgnore,
                   dmbAll, dmbNoToAll, dmbYesToAll, dmbHelp, dmbDetails, dmbNone);
  TMyMsgDlgButtons = set of TMyMsgDlgBtn;
type
  EExpected = class(Exception)
  end;

  EAbortar = class(Exception)
    constructor Create;
  end;

function Confirm(const Msg: string): Boolean;
procedure Warning(const Msg: string);
procedure Information(const Msg: string);
procedure Error(const Msg: string);
procedure Reject(const Msg: string);


implementation

function xMessageDlg(const Msg: string; DlgType : TMsgDlgType;
                     Buttons : TMsgDlgButtons; const Title: string;
                     Captions: array of string) : Integer;
var
  aMsgDlg: TForm;
  CaptionIndex,
  i : integer;
  dlgButton : TButton; // uses stdctrls
begin
  aMsgDlg := CreateMessageDialog(Msg, DlgType, buttons);
  try
    if Title <> '' then
    aMsgDlg.Caption := Title;
    CaptionIndex := 0;
    for i := 0 to aMsgDlg.ComponentCount - 1 do
    begin
      if (aMsgDlg.Components[i] is TButton) then
      begin
        dlgButton := TButton(aMsgDlg.Components[i]);
        if CaptionIndex > High(Captions) then
          Break;
        dlgButton.Caption := Captions[CaptionIndex];
        Inc(CaptionIndex);
      end;
    end;
    Result := aMsgDlg.ShowModal;
  finally
    FreeAndNil(aMsgDlg);
  end;
end;

function Confirm(const Msg: string): Boolean;
begin
  Result := xMessageDlg(Msg, mtConfirmation, [mbYes, mbNo], 'Confirme', ['Sim', 'Não']) = mrYes;
end;

procedure Warning(const Msg: string);
begin
  xMessageDlg(Msg, mtWarning, [mbOK], 'Atenção', ['&Ok']);
end;

procedure Information(const Msg: string);
begin
  xMessageDlg(Msg, mtInformation, [mbOK], 'Aviso', ['&Ok']);
end;

procedure Error(const Msg: string);
begin
  xMessageDlg(Msg, mtError, [mbOK], 'Opss! Ocorreu algo inesperado.', ['&Ok']);
end;

procedure Reject(const Msg: string);
begin
  Warning(Msg);;
  Abort;
end;

{ EAbortar }

constructor EAbortar.Create;
begin
  inherited Create('Abortado pelo usuário.');
end;

end.
