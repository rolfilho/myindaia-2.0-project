unit MyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CtlPanel, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Aurelius.Engine.ObjectManager,
  System.Math, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, MyUtil, Vcl.DBGrids;

const
  FRBASIC_ACTIVATE_MSG = WM_USER + 1;
  FRBASIC_ADDCHILD_MSG = WM_USER + 2;
  FRBASIC_REMOVECHILD_MSG = WM_USER + 3;

type
  TformMyForm = class(TForm)
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FActivated:Boolean;
    FHasChildShortCut: Boolean;
    procedure FRBASICACTIVATEMSG(var Message:TMessage); message FRBASIC_ACTIVATE_MSG;
    procedure Tab_Enter(var Msg: TMsg; var Handled: Boolean);
    procedure GetInputParents(aList: TList);
  protected
    FOwnsManager: Boolean;
    FFormStyle: TFormStyle;
    FObjectManager: TObjectManager;
    procedure SetFormStyle(const Value: TFormStyle);
    procedure ResetFormStyle;
    procedure RegisterChild;
    procedure UnregisterChild;
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure DoActivate; virtual;
    procedure DoClose(var Action: TCloseAction); override;
    function CanIntercept(aControl: TWinControl): boolean; virtual;
  public
    ModalForm: TForm;
    procedure Show; reintroduce;
    procedure ShowAsChild;
    procedure ShowAndWait;
    procedure ShowAsModal(ACaller: TformMyForm);
    procedure CloseChildren;

    constructor Create(AOwner: TComponent; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False); reintroduce; virtual;

    class function xInstance(AOwner:TComponent=nil): TformMyForm; virtual;
    class function xCreate(AOwner: TComponent = nil; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False): TformMyForm; overload;
    class function xCreateInto(var ADest; AOwner: TComponent = nil; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False): TformMyForm; virtual;
    class function xCreateChild(AParent: TWinControl; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False): TformMyForm; virtual;
    //
    class function xShow(AOwner: TComponent = nil; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False): TformMyForm; virtual;
    class function xShowAt(AControl: TComponent; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False): TformMyForm; virtual;
    class function xShowModal(AOwner: TComponent = nil; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False; ATag:Integer=0):TModalResult; virtual;
    //
    class function xExecute(AOwner: TComponent = nil; AObjectManager: TObjectManager = nil; AOwnsManager: Boolean = False; ATag:Integer=0):Boolean; virtual;
    //
    class procedure xGetInstance(AOwner: TComponent; var aForm); virtual;
    const
    COR_CAMPO_OBRIGATORIO = $00AEA9F5;
  published
    property FormStyle: TFormStyle read fFormStyle write SetFormStyle;
    property HasChildShortCut:Boolean read fHasChildShortCut write fHasChildShortCut default True;
    property fmManager : TObjectManager read FObjectManager write FObjectManager;
  end;


var
  formMyForm: TformMyForm;

implementation

{$R *.dfm}

uses MyDialog;

{ TformMyForm }

type
  TPublicWinControl=class(TWinControl)
  end;

  DoubleWord=packed record
    Lo,Hi:word;
  end;


function FindForm(const aFormClass: TFormClass; aOwner: TComponent):TForm;
var
  i: Integer;
begin
  with aOwner do
  begin
    i := 0;
    while (i <= ComponentCount-1) and not (Components[i].ClassType = aFormClass) do
      Inc(i);
    if i <= ComponentCount-1 then
      Result := TForm(Components[i])
    else
      Result := nil;
  end;
end;

procedure TformMyForm.Tab_Enter(var Msg: TMsg; var Handled: Boolean );
var
  wActive:TWinControl;
  tLin   :integer;
  nLin   :integer;
  lParts :TList;
  PgControl: TPageControl;
begin
  if MSg.message = WM_KeyDown then
    if Msg.wParam = VK_Return then
      keybd_event(VK_Tab,0,0,0);

  (*if Msg.wParam in [vk_up,vk_down] then
  else
    Exit;

  wActive:=ActiveControl;
  if wActive=nil then
    Exit;

  case Msg.wParam of
    VK_UP:   begin
               TabPrior(wActive);
             end;
    VK_DOWN: begin
               if wActive is TCustomMemo then
               begin
                 {if Pos('WINDOWS NT',UpperCase(OSVersion))>0 then
                 begin
                   tLin:=SendMessage(wActive.Handle,EM_GETLINECOUNT,0,0);
                   nLin:=SendMessage(wActive.Handle,EM_GETSEL,0,0);
                   nLin:=SendMessage(wActive.Handle,EM_LINEFROMCHAR,Lo(nLin),0);
                   if nLin<tLin-1 then
                     Exit;
                 end
                 else
                 begin
                   tLin:=SendMessage(wActive.Handle,EM_GETLINECOUNT,0,0);
                   nLin:=SendMessage(wActive.Handle,EM_LINEFROMCHAR,word(-1),0);
                   if nLin<tLin-1 then
                     Exit;
                 end;
                 if TCustomMemo(wActive).CaretPos.y > 0 then
                 Exit;}
               end;
               TabNext(wActive);
             end;
  else
    Exit;
  end;*)
end;

function TformMyForm.CanIntercept(aControl: TWinControl): boolean;
begin
  if aControl is TTreeView then
    Result:=False
  else if aControl is TListView then
    Result:=False
  else if aControl is TCustomGrid then
    Result:=False
  else if aControl is TCustomListBox then
    Result:=False
  else if not aControl.TabStop then
    Result:=False
  else if (aControl is TCustomComboBox) and TComboBox(aControl).DroppedDown then
    Result:=False
  else
    Result:=True;
end;

procedure TformMyForm.CloseChildren;
var
  i:Integer;
begin
  for i := 0 to ComponentCount-1 do
    if Components[i] is TForm then
      TForm(Components[i]).Close;
end;

constructor TformMyForm.Create(AOwner: TComponent; AObjectManager: TObjectManager; AOwnsManager: Boolean);
begin
  inherited Create(AOwner);
  FHasChildShortCut := True;
  FOwnsManager := AOwnsManager;
  FObjectManager := AObjectManager;
end;

procedure TformMyForm.ResetFormStyle;
begin
  if inherited FormStyle = fFormStyle then
    exit;
  Position:=succ(high(TPosition));
  inherited FormStyle := fFormStyle;
  {Position := poDesigned;
  if WindowState = wsNormal then
    if Application.MainForm <> nil then
      Application.MainForm.WindowState := wsMaximized;{
      if (Top + Height > Application.MainForm.ClientHeight) or (Left + Width > Application.MainForm.ClientWidth) then
      begin
        Top := Application.MainForm.ClientHeight - (Application.MainForm.ClientHeight + Height) div 2;
        if (Top + Height > Application.MainForm.ClientHeight) or (Top < 0) then
          Top := 5;
        Left := Application.MainForm.ClientWidth - (Application.MainForm.ClientWidth + Width) div 2;
        if (Left + Width > Application.MainForm.ClientWidth) or (Left < 0) then
          Left := 5;
      end;}
end;

procedure TformMyForm.DoActivate;
begin
  fActivated := false;
end;

procedure TformMyForm.DoClose(var Action: TCloseAction);
begin
  inherited;
  if Owner = Application then
    Action := caFree;
end;

procedure TformMyForm.DoCreate;
begin
  inherited;

end;

procedure TformMyForm.DoShow;
begin
  if not fActivated then
    PostMessage(Handle, FRBASIC_ACTIVATE_MSG, 0, 0);
  inherited;
end;

procedure TformMyForm.FormCreate(Sender: TObject);
begin
  //Application.OnMessage := Tab_Enter;
end;

procedure TformMyForm.FormDestroy(Sender: TObject);
begin
  if FOwnsManager and Assigned(FObjectManager) then
  begin
    FObjectManager.Free;
    FObjectManager := nil;
  end;
end;

procedure TformMyForm.GetInputParents(aList:TList);
var
  w:TWinControl;
begin
  aList.Clear;
  w:=ActiveControl;
  while (w<>nil) and (w<>Self) do
  begin
    if (w is TForm) or (w is TFrame) or (w is TPanel) then
      aList.Insert(0,w);
   w:=w.Parent;
  end;
end;

procedure TformMyForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  wActive:TWinControl;
  tLin   :integer;
  nLin   :integer;
  lParts :TList;
  PgControl: TPageControl;
begin
  inherited;
  //
  if Parent=nil then
  begin
    lParts:=TList.Create;
    try
      GetInputParents(lParts);
      while lParts.Count>0 do
      begin
        TPublicWinControl(lParts[lParts.Count-1]).KeyDown(Key,Shift);
        if Key=0 then
          Exit;
        lParts.Delete(lParts.Count-1);
      end;
    finally
      lParts.free;
    end;
  end;
  //

  {Se o usuário teclar "Control + P" move o foco para a aba seguinte do
   pagecontrol selecionado se "Control + O" move o foco para aba anterior. }
{  if Key in [79,80] then  //79 = O e 80 = P
    if Shift = [ssCtrl] then
      if isOnPageControl(ActiveControl,PgControl) then
      begin
        PgControl.SelectNextPage(Key = 80);
        Key := 0;
      end;}

(*  if Key in [vk_up,vk_down] then
  else
    Exit;
  wActive:=ActiveControl;
  if wActive=nil then
    Exit;
{  if not CanIntercept(wActive) then
    Exit;}
  case Key of
    VK_UP:   begin
               if wActive is TCustomGrid then
                 Exit;
               if wActive.ClassName.Contains('Tcx') then
                 Exit;
               if wActive is TCustomMemo then
               begin
                 {if TCustomMemo(wActive).CaretPos.y > 0 then
                   Exit;}
               end;
               TabPrior(wActive);
             end;
    VK_DOWN: begin
               if wActive is TCustomGrid then
                 Exit;
               if wActive.ClassName.Contains('Tcx') then
                 Exit;
               if wActive is TCustomMemo then
               begin
                 if Pos('WINDOWS NT',UpperCase(OSVersion))>0 then
                 begin
                   tLin:=SendMessage(wActive.Handle,EM_GETLINECOUNT,0,0);
                   nLin:=SendMessage(wActive.Handle,EM_GETSEL,0,0);
                   nLin:=SendMessage(wActive.Handle,EM_LINEFROMCHAR,Lo(nLin),0);
                   if nLin<tLin-1 then
                     Exit;
                 end
                 else
                 begin
                   tLin:=SendMessage(wActive.Handle,EM_GETLINECOUNT,0,0);
                   nLin:=SendMessage(wActive.Handle,EM_LINEFROMCHAR,word(-1),0);
                   if nLin<tLin-1 then
                     Exit;
                 end;
               end;
               TabNext(wActive);
             end;
  else
    Exit;
  end;
  Key:=0;*)
end;

procedure TformMyForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  wActive:TWinControl;
  iPos   :integer;
  iRow   :integer;
  iLineFromChar: Integer;
  lParts :TList;
begin
  inherited;
  //
  if Parent=nil then
  begin
    lParts := TList.Create;
    try
      GetInputParents(lParts);
      while lParts.Count>0 do
      begin
        TPublicWinControl(lParts[lParts.Count-1]).KeyPress(Key);
        if Key=#0 then
          Exit;
        lParts.Delete(lParts.Count-1);
      end;
    finally
      lParts.free;
    end;
  end;
  //
  wActive:=ActiveControl;
  if wActive=nil then
    Exit;
  if not CanIntercept(wActive) then
    Exit;
  case Key of
    #13: begin
           if wActive is TCustomMemo then
           begin
             iPos:=SendMessage(wActive.Handle,EM_GETSEL,0,0);
             iPos:=DoubleWord((@iPos)^).Lo;

             {fred correção do enter no memo para windows XP e 2000}
             {iRow:=SendMessage(wActive.Handle,EM_LINEINDEX,word(-1),0); não funciona no XP E 2000}
             iLineFromChar:=SendMessage(wActive.Handle,EM_LINEFROMCHAR,Word(-1),0);
             iRow         :=SendMessage(wActive.Handle,EM_LINEINDEX,Word(iLineFromChar),0);
             {*****************************************************}

             if iPos<>iRow then
               Exit;
           end;
           TabNext(wActive);
           Key:=#0;
         end;
  end;
end;

procedure TformMyForm.FRBASICACTIVATEMSG(var Message: TMessage);
begin
  fActivated:=true;
  DoActivate;
end;

procedure TformMyForm.RegisterChild;
begin
  if ((Self.FormStyle = fsMdiChild) and (Application.MainForm <> nil) {and (not (owner is TDLLookup))}) then
    PostMessage(Application.MainForm.Handle, FRBASIC_ADDCHILD_MSG, Integer(Self), 0);
end;

procedure TformMyForm.UnregisterChild;
begin
  if Application.MainForm <> nil then
    SendMessage(Application.MainForm.Handle, FRBASIC_REMOVECHILD_MSG, Integer(Self),0);
end;

procedure TformMyForm.SetFormStyle(const Value: TFormStyle);
begin
  fFormStyle := Value;
  if fFormStyle<>fsMDIChild then
    ResetFormStyle;
end;

procedure TformMyForm.Show;
begin
  ResetFormStyle;
  inherited Show;
end;

procedure TformMyForm.ShowAndWait;
begin
  ShowAsChild;
  repeat
    {Corrige problema do CPU 100% provocado pelo loop Application.ProcessMessages}
    {begin}
    try
      Application.HandleMessage;
    except
      Application.HandleException(Application);
    end;
    {end}
  until Application.Terminated or not Visible or (WindowState=wsMinimized);
end;

function MaximizedChildren:Boolean;
var
  i:Integer;
  m:TForm;
begin
  result:=true;
  m:=Application.MainForm;
  for i:=0 to m.MDIChildCount-1 do
    if m.MDIChildren[i].WindowState=wsMaximized then
      exit;
  result:=false;
end;

procedure TformMyForm.ShowAsChild;
begin
  if Enabled then
  begin
    FormStyle := fsMDIChild;
    if WindowState = wsMinimized then
      WindowState := wsNormal;
    if MaximizedChildren and (WindowState <> wsMaximized) then
      WindowState := wsMaximized;
    Show;
    SetFocus;
  end
  else if Assigned(ModalForm) then
    Warning('A tela "' + Caption + '" não pode ser exibida porque está bloqueada pela tela "' + ModalForm.Caption + '".');
end;

procedure TformMyForm.ShowAsModal(ACaller: TformMyForm);
begin
  ACaller.Enabled:=false;
  try
    ShowAndWait;
  finally
    ACaller.Enabled:=true;
  end;
  ACaller.Show;
  ACaller.SetFocus;
end;

class function TformMyForm.xCreate(AOwner: TComponent;
  AObjectManager: TObjectManager; AOwnsManager: Boolean): TformMyForm;
begin
  if AOwner = nil then
    AOwner := Application;
  Result := TformMyForm(FindForm(Self, AOwner));

  if Result = nil then
    Result := Create(AOwner, AObjectManager, AOwnsManager);
  {else
    Result.FObjectManager := AObjectManager;}
end;

class function TformMyForm.xCreateChild(AParent: TWinControl;
  AObjectManager: TObjectManager; AOwnsManager: Boolean): TformMyForm;
begin
  Result := xCreate(AParent, AObjectManager, AOwnsManager);
  Result.Parent := AParent;
  Result.Align := alClient;
  Result.BorderStyle := bsNone;
  Result.Visible := true;
end;

class function TformMyForm.xCreateInto(var ADest; AOwner: TComponent;
  AObjectManager: TObjectManager; AOwnsManager: Boolean): TformMyForm;
begin
  Result := xCreate(AOwner, AObjectManager, AOwnsManager);
  TForm(ADest) := Result;
end;

class function TformMyForm.xExecute(AOwner: TComponent;
  AObjectManager: TObjectManager; AOwnsManager: Boolean; ATag: Integer): Boolean;
begin
  Result := (xShowModal(AOwner, AObjectManager, AOwnsManager, ATag) = mrOk);
end;

class procedure TformMyForm.xGetInstance(AOwner: TComponent; var aForm);
begin
  if AOwner = nil then
    AOwner := Application;
  TForm(aForm) := FindForm(Self,AOwner);
end;

class function TformMyForm.xInstance(AOwner: TComponent): TformMyForm;
begin
  if AOwner = nil then
    AOwner := Application;
  Result := TformMyForm(FindForm(Self,AOwner));
end;

class function TformMyForm.xShow(AOwner: TComponent; AObjectManager: TObjectManager; AOwnsManager: Boolean): TformMyForm;
begin
  Result := xCreate(AOwner, AObjectManager, AOwnsManager);
  if Result = nil then
    Exit;
  TformMyForm(Result).ShowAsChild;
end;

function IsOwner(aComponent:TComponent; aOwner:TComponent):Boolean;
var
  c:TComponent;
begin
  result:=true;
  c:=aComponent;
  while c<>nil do
  begin
    if c=aOwner then
      exit;
    c:=c.Owner;
  end;
  result:=false;
end;

class function TformMyForm.xShowAt(AControl: TComponent;
  AObjectManager: TObjectManager; AOwnsManager: Boolean): TformMyForm;
var
  x,y,w,h:Integer;
  Referencia: TPoint;
begin
  result:=xCreate(AControl, AObjectManager, AOwnsManager);
  with result do
  begin
    //WindowState:=wsNormal;
    Referencia := TWinControl(AControl).ClientToScreen(Point(0, 0));
    w := Min(Width, Screen.WorkAreaWidth);
    x := Min(Referencia.x, Screen.WorkAreaWidth - w);
    y := Referencia.y + TWinControl(AControl).Height;
    h := Min(Height, Screen.WorkAreaHeight);
    if y + h > Screen.WorkAreaHeight then
      y := Max(Referencia.y - Height - 5, 0);
    SetBounds(x,y,w,h);
    Show;
    SetFocus;
    repeat
      {Corrige problema do CPU 100% provocado pelo loop Application.ProcessMessages}
      {begin}
      try
        Application.HandleMessage;
      except
        Application.HandleException(Application);
      end;
      {end}
    until Application.Terminated or ((Screen.ActiveForm<>result) and not IsOwner(Screen.ActiveForm,result));
    Close;
  end;
end;

class function TformMyForm.xShowModal(AOwner: TComponent;
  AObjectManager: TObjectManager; AOwnsManager: Boolean; ATag: Integer): TModalResult;
var
  f: TformMyForm;
begin
  if AOwner = nil then
    AOwner := Application;
  f := TformMyForm(xCreate(AOwner, AObjectManager));
  f.Tag := ATag;
  f.BorderIcons:=f.BorderIcons - [biMinimize];
  result := f.ShowModal;
  if AOwner = Application then
    f.free;
end;

end.
