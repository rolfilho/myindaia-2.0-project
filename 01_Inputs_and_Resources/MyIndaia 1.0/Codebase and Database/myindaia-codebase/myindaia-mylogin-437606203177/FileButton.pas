unit FileButton;

interface

uses
  Forms, Messages, sBitBtn, Classes, SysUtils, ShellAPI, Windows, Graphics,
  AdvGlowButton, Controls, Funcoes, Dialogs, StrUtils, MSHTML;

const
  crTarget = 1;

var
  _MIN_WIDTH            : Integer = 100;
  _MIN_HEIGHT           : Integer = 0; // Definido no Initialization
  _TOP_INICIAL          : Integer = 10;
  _LEFT_INICIAL         : Integer = 10;
  _DISTANCIA_VERTICAL   : Integer = 10;
  _DISTANCIA_HORIZONTAL : Integer = 10;
  _CAPTION              : Integer = 33;

type
  TFileButtonClick = procedure(Sender: TObject; Code: Integer; Script: String;
     var FileName: String; var Param: String; var Execute: Boolean) of object;
  TArrangeType = (atDefault, atRight,  atTop);

type
  TFileButton = class(TAdvGlowButton)
  private
    FFileName: String;
    FParam: String;
    FOnClick: TFileButtonClick;
    FProcess: String;
    FCode: Integer;
    FScript: String;
    procedure SetFileName(const Value: String);
    procedure SetProcess(const Value: String);
  protected
    procedure DoClick(Sender: TObject);
    procedure UpdateColor(AStatus: Boolean);
    procedure FinalizaProcesso;
  public
    constructor Create(AOwner: TComponent); override;
    function VerifyProcess: Boolean;
    property Code: Integer read FCode write FCode;
    property FileName: String read FFileName write SetFileName;
    property Process: String read FProcess write SetProcess;
    property Param: String read FParam write FParam;
    property Script: String read FScript write FScript;
    property OnClick: TFileButtonClick read FOnClick write FOnClick;
  end;

  TFileButtonList = class(TObject)
  private
    FButtons: array of TFileButton;
    FControl: TWinControl;
    FOnClick: TFileButtonClick;
    FButtonHeight: Integer;
    FButtonWidth: Integer;
    FArrangeType: TArrangeType;
    procedure SetControl(const Value: TWinControl);
    procedure SetButtonHeight(const Value: Integer);
    procedure SetButtonWidth(const Value: Integer);
    function GetCount: Integer;
    procedure SetArrangeType(const Value: TArrangeType);
  protected
    procedure DoChanged;
    procedure DoButtonClick(Sender: TObject; Code: Integer; Script: String;
       var FileName: String; var Param: String; var Execute: Boolean);
  public
    constructor Create(AOwner: TWinControl);
    destructor Destroy; override;
    procedure Clear;
    function AddButton(ACode: Integer; ACaption, AFileName, AProcess, AParam, AScript: String): TFileButton;
    procedure DelButton(AFileName: String); overload;
    procedure DelButton(AIndex: Integer); overload;
    procedure ArrangeIcons(AArrangeType: TArrangeType = atDefault);
    function GetFileNameIndex(AFileName: String): Integer;
    function GetSystemIndex(ASystem: String): Integer;
    function GetProcessIndex(AProcess: String): Integer;
    function ProcessExists(AProcess: String): Boolean;
    function FileNameExists(AFileName: String): Boolean;
    function SystemExists(ASystem: String): Boolean;
    function ExecuteFile(AFileName: String): Boolean;
    function ExecuteSystem(ASystem: String): Boolean;
    function ExecuteProcess(AProcess: String): Boolean;
    function FileNameIsRunning(AFileName: String): Boolean;
    function SystemIsRunning(ASystem: String): Boolean;
    function ProcessIsRunning(AProcess: String): Boolean;
    procedure VerifyProcesses;
    property Control: TWinControl read FControl write SetControl;
    property OnButtonClick: TFileButtonClick read FOnClick write FOnClick;
    property ButtonHeight: Integer read FButtonHeight write SetButtonHeight;
    property ButtonWidth: Integer read FButtonWidth write SetButtonWidth;
    property Count: Integer read GetCount;
    property ArrangeType: TArrangeType read FArrangeType write SetArrangeType;
  end;



implementation

{ TFileButton }

constructor TFileButton.Create(AOwner: TComponent);
begin
  inherited;
  FFileName := '';
  FParam    := '';
  Appearance.Gradient := ggRadial;
  Appearance.GradientMirror := ggRadial;
  Appearance.GradientMirrorChecked := ggRadial;
  Appearance.GradientDisabled := ggRadial;
  Appearance.GradientMirrorDisabled := ggRadial;
  Font.Color := clWhite;
  Font.Style := [fsBold];
  Cursor := crHandPoint;
  Hint := 'Finalizar Sistema';
  inherited OnClick := DoClick;
  VerifyProcess;
end;

procedure TFileButton.DoClick(Sender: TObject);
var
  vExecute: Boolean;
  vFileName: String;
  vParam: String;
  vDirectory: PWideChar;
begin
  if Cursor = crHandPoint then
  begin
    Self.Enabled := False;
    vFileName := FileName;
    vParam    := Param;
    vExecute  := True;

    if Assigned(FOnClick) then
      FOnClick(Self, Self.Code, Self.Script, vFileName, vParam, vExecute);

    if Pos('\', vFileName) > 0 then
      vDirectory := PWideChar(ExtractFileDir(vFileName))
    else
      vDirectory := nil;

    if vExecute then
    begin
      ShellExecute(0, nil, PWideChar(vFileName), PWideChar(vParam), vDirectory, SW_SHOW);
      TForm(Self.Parent).Close;
    end;
  end
  else
  begin
    if MessageDlg('Deseja realmente finalizar o sistema ''' + Caption + '''?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      FinalizaProcesso;
      TForm(Parent).Close;
    end;
  end;
end;

procedure TFileButton.FinalizaProcesso;
var
  HWeb, HChild, PChild: HWND;
  W: String;
  IE: IHTMLDocument2;
begin
  if (SameText(LeftStr(FFileName, 4), 'http') or SameText(LeftStr(FFileName, 3), 'www')) then
  begin
    HWeb := FindWindowEx(0, 0, 'IEFrame', nil);
    W := FFileName;
    if Pos('//', W) > 0 then
      Delete(W, 1, Pos('//', W) +1);
    if Pos('/', W) > 0 then
      W := Copy(W, 1, Pos('/', W) -1);
    while (HWeb <> 0) do
    begin
      HChild := GetFirstIEDocument(HWeb, IE);
      while (HChild <> 0) and Assigned(IE) do
      begin
        if AnsiContainsText(IE.url, W) then
        begin
          if AnsiContainsText(IE.url, 'myindaiaweb.com.br') and not AnsiContainsText(IE.url, 'autentica.asp') then
            IE.url := 'https://www.myindaiaweb.com.br/logout.asp'
          else
            SendMessage(HChild, WM_CLOSE, 0, 0);
          //HChild := GetFirstIEDocument(HWeb, IE);
        end;
        HChild := GetNextIEDocument(HWeb, HChild, IE);
      end;
      HWeb := FindWindowEx(0, HWeb, 'IEFrame', nil);
    end;
  end
  else
    Funcoes.FinalizaProcesso(FFileName);
end;

procedure TFileButton.SetFileName(const Value: String);
var
  Ico: TIcon;
  BMP: TBitMap;
  SR: TSearchRec;
begin
  FFileName := Value;
  if FindFirst('H:\DDBroker\MyLogin\Icones\' + ExtractFileName(ChangeFileExt(Value, '.*')), faAnyFile, SR) = 0 then
    Picture.LoadFromFile('H:\DDBroker\MyLogin\Icones\' + SR.Name)
  else
  begin
    Ico := TIcon.Create;
    Ico.Handle := ExtractIcon(0, PWideChar(Value), 0);
    BMP := TBitmap.Create;
    BMP.Height := 32;
    BMP.Width  := 32;
    BMP.Canvas.Draw(0, 0, Ico);
    Picture.Assign(BMP);
    Ico.Free;
    BMP.Free;
  end;
  //if FProcess = '' then
    VerifyProcess;
end;

procedure TFileButton.SetProcess(const Value: String);
var
  SR: TSearchRec;
begin
  FProcess := Value;
  if FindFirst('H:\DDBroker\MyLogin\Icones\' + ExtractFileName(ChangeFileExt(Value, '.*')), faAnyFile, SR) = 0 then
    Picture.LoadFromFile('H:\DDBroker\MyLogin\Icones\' + SR.Name);
  //VerifyProcess;
end;

procedure TFileButton.UpdateColor(AStatus: Boolean);
begin
  if AStatus then
  begin
    Appearance.BorderColor := -1;
    Appearance.BorderColorHot := -1;
    Appearance.BorderColorDown := -1;
    Appearance.BorderColorChecked := -1;
    Appearance.BorderColorDisabled := clSilver;
    Appearance.Color := -1;
    Appearance.ColorTo := 6771016;
    Appearance.ColorChecked := 6771016;
    Appearance.ColorCheckedTo := 6771016;
    Appearance.ColorDisabled := 7697781;
    Appearance.ColorDisabledTo := clSilver;
    Appearance.ColorDown := 6771016;
    Appearance.ColorDownTo := 6771016;
    Appearance.ColorHot := 6771016;
    Appearance.ColorHotTo := -1;
    Appearance.ColorMirror := -1;
    Appearance.ColorMirrorTo := 6771016;
    Appearance.ColorMirrorHot := 6771016;
    Appearance.ColorMirrorHotTo := 16775412;
    Appearance.ColorMirrorDown := 6771016;
    Appearance.ColorMirrorDownTo := 6771016;
    Appearance.ColorMirrorChecked := 6771016;
    Appearance.ColorMirrorCheckedTo := 6771016;
    Appearance.ColorMirrorDisabled := 7697781;
    Appearance.ColorMirrorDisabledTo := clSilver;
  end
  else
  begin
    Appearance.BorderColor := clSilver;
    Appearance.BorderColorHot := clSilver;
    Appearance.BorderColorDown := 9540095;
    Appearance.BorderColorChecked := 9540095;
    Appearance.BorderColorDisabled := clSilver;
    Appearance.Color := 7697781;
    Appearance.ColorTo := clSilver;
    Appearance.ColorChecked := 6974207;
    Appearance.ColorCheckedTo := clSilver;
    Appearance.ColorDisabled := 7697781;
    Appearance.ColorDisabledTo := clSilver;
    Appearance.ColorDown := 6974207;
    Appearance.ColorDownTo := clWhite;
    Appearance.ColorHot := 7697781;
    Appearance.ColorHotTo := clSilver;
    Appearance.ColorMirror := 7697781;
    Appearance.ColorMirrorTo := clSilver;
    Appearance.ColorMirrorHot := 7697781;
    Appearance.ColorMirrorHotTo := clSilver;
    Appearance.ColorMirrorDown := 6974207;
    Appearance.ColorMirrorDownTo := clWhite;
    Appearance.ColorMirrorChecked := 6974207;
    Appearance.ColorMirrorCheckedTo := clSilver;
    Appearance.ColorMirrorDisabled := 7697781;
    Appearance.ColorMirrorDisabledTo := clSilver;
  end;
end;

function TFileButton.VerifyProcess: Boolean;
var
  HWeb, HChild: HWND;
  P1, P2: Integer;
  W, S: String;
  IE: IHtmlDocument2;
begin
  Result := True;
  if (SameText(LeftStr(FFileName, 4), 'http') or SameText(LeftStr(FFileName, 3), 'www')) then
  begin
    HWeb := FindWindowEx(0, 0, 'IEFrame', nil);
    W := FFileName;
    if Pos('//', W) > 0 then
      Delete(W, 1, Pos('//', W) +1);
    if Pos('/', W) > 0 then
      W := Copy(W, 1, Pos('/', W) -1);
    while Result and (HWeb <> 0) do
    begin
      HChild := GetFirstIEDocument(HWeb, IE);
      while Result and (HChild <> 0) and Assigned(IE) do
      begin
        Result := not AnsiContainsText(IE.url, W);
        if AnsiContainsText(IE.url, 'myindaiaweb.com.br') and AnsiContainsText(IE.url, 'autentica.asp') then
          Result := True;
        HChild := GetNextIEDocument(HWeb, HChild, IE);
      end;
      HWeb := FindWindowEx(0, HWeb, 'IEFrame', nil);
    end;
  end;
  if Result then
    Result := not ProcessoExecutando(FFileName);
  ShowHint := not Result;
  if Result then
    Cursor := crHandPoint
  else
    Cursor := crTarget;
  Enabled := True;
  UpdateColor(Result);
end;

{ TFileButtonList }

function TFileButtonList.AddButton(ACode: Integer; ACaption, AFileName, AProcess, AParam, AScript: String): TFileButton;
begin
  Result := TFileButton.Create(FControl);
  Result.Parent := FControl;
  with Result do
  begin
    Caption := ACaption;
    Code := ACode;
    FileName := AFileName;
    Process := AProcess;
    Param := AParam;
    Script := AScript;
    Layout := blGlyphTop;
    Width := FButtonWidth;
    Height := FButtonHeight;
    OnClick := DoButtonClick;
  end;
  SetLength(FButtons, Count + 1);
  FButtons[Count - 1] := Result;
  DoChanged;
end;

procedure TFileButtonList.ArrangeIcons(AArrangeType: TArrangeType = atDefault);
var
  I: Integer;
  L, T: Integer;
  TotalWidth, TotalHeight: Integer;
begin
  if AArrangeType = atDefault then
    AArrangeType := FArrangeType;
  TotalWidth := 0;
  TotalHeight := 0;
  case AArrangeType of
    atRight: begin
              TotalWidth  := _MIN_WIDTH;
              TotalHeight := _MIN_HEIGHT;
              L             := _LEFT_INICIAL;
              T             := _TOP_INICIAL;
              for I := 0 to Count - 1 do
              begin
                //if T + 70 + (2*_DISTANCIA_VERTICAL) > FControl.Height  then
                if T + 70 + _DISTANCIA_VERTICAL > FControl.Height  then
                begin
                  L := L + 80 + _DISTANCIA_HORIZONTAL;
                  T := _TOP_INICIAL;
                  FButtons[I].Top  := T;
                  FButtons[I].Left := L;
                end
                else
                begin
                  FButtons[I].Top  := T;
                  FButtons[I].Left := L;
                  //T := T + 70 + _DISTANCIA_VERTICAL;
                end;
                if T + 70 + _DISTANCIA_VERTICAL > TotalHeight then
                  TotalHeight := T + 70 + _DISTANCIA_VERTICAL;
                if L + 80 + _DISTANCIA_HORIZONTAL > TotalWidth then
                  TotalWidth := L + 80 + _DISTANCIA_HORIZONTAL;
                T := T + 70 + _DISTANCIA_VERTICAL;
                //FButtons[I].Update;
              end;
              TotalHeight := TotalHeight + _CAPTION;
            end;
    atTop: begin
              TotalWidth  := _MIN_WIDTH;
              TotalHeight := _MIN_HEIGHT;
              L := _LEFT_INICIAL;
              T := _TOP_INICIAL;
              for I := 0 to Count - 1 do
              begin
                if L + 70 + (2*_DISTANCIA_HORIZONTAL) > FControl.Width  then
                begin
                  T := T + 70 + _DISTANCIA_VERTICAL;
                  L := 80 + (2*_DISTANCIA_HORIZONTAL);
                  FButtons[I].Top  := T;
                  FButtons[I].Left := _LEFT_INICIAL;
                end
                else
                begin
                  FButtons[I].Top  := T;
                  FButtons[I].Left := L;
                  L := L + 80 + _DISTANCIA_HORIZONTAL;
                end;
                if T + 70 + _DISTANCIA_VERTICAL > TotalHeight then
                  TotalHeight := T + 70 + _DISTANCIA_VERTICAL;
                if L + _DISTANCIA_HORIZONTAL > TotalWidth then
                  TotalWidth := L + _DISTANCIA_HORIZONTAL;
                //FButtons[I].Update;
              end;
              TotalHeight := TotalHeight + _CAPTION;
            end;
  end;
  if ArrangeType = atTop then
  begin
    FControl.Align := alTop;
    FControl.Height := TotalHeight;
  end
  else if ArrangeType = atRight then
  begin
    FControl.Align := alRight;
    FControl.Width  := TotalWidth;
  end;
end;

procedure TFileButtonList.Clear;
begin
  while Count > 0 do
    DelButton(0);
end;

constructor TFileButtonList.Create(AOwner: TWinControl);
begin
  SetLength(FButtons, 0);
  Control := AOwner;
  FButtonHeight := 70;
  FButtonWidth := 80;
  FArrangeType := atRight;
end;

procedure TFileButtonList.DelButton(AFileName: String);
begin
  DelButton(GetFileNameIndex(AFileName));
end;

procedure TFileButtonList.DelButton(AIndex: Integer);
var
  I: Integer;
begin
  FButtons[AIndex].Free;
  for I := AIndex to Count - 2 do
    FButtons[I] := FButtons[I + 1];
  SetLength(FButtons, Count - 1);
  DoChanged;
end;

destructor TFileButtonList.Destroy;
begin
  Clear;
  inherited;
end;

procedure TFileButtonList.DoButtonClick(Sender: TObject; Code: Integer; Script: String;
   var FileName, Param: String; var Execute: Boolean);
begin
  if Execute then
  begin
    Execute := not ProcessoExecutando(FileName);
    if not Execute then
      MessageDlg('Este sistema já está executando.', mtInformation, [mbOk], 0);
  end;
  if Assigned(FOnClick) then
    FOnClick(Self, Code, Script, FileName, Param, Execute);
end;

procedure TFileButtonList.DoChanged;
begin
  ArrangeIcons(atDefault);
end;

function TFileButtonList.ExecuteFile(AFileName: String): Boolean;
var
  I: Integer;
begin
  Result := FileNameExists(AFileName) and FileExists(AFileName);
  if Result then
  begin
    I := GetFileNameIndex(AFileName);
    Result := I >= 0;
    if Result then
      FButtons[I].Click;
  end;
end;

function TFileButtonList.ExecuteProcess(AProcess: String): Boolean;
var
  I: Integer;
begin
  Result := ProcessExists(AProcess);
  if Result then
  begin
    I := GetProcessIndex(AProcess);
    Result := I >= 0;
    if Result then
      FButtons[I].Click;
  end;
end;

function TFileButtonList.ExecuteSystem(ASystem: String): Boolean;
var
  I: Integer;
begin
  Result := SystemExists(ASystem);
  if Result then
  begin
    I := GetSystemIndex(ASystem);
    Result := I >= 0;
    if Result then
      FButtons[I].Click;
  end;
end;

function TFileButtonList.FileNameExists(AFileName: String): Boolean;
begin
  Result := GetFileNameIndex(AFileName) >= 0;
end;

function TFileButtonList.FileNameIsRunning(AFileName: String): Boolean;
begin
  Result := ProcessIsRunning(AFileName);
end;

function TFileButtonList.GetFileNameIndex(AFileName: String): Integer;
begin
  Result := 0;
  while (Result < Count) and (CompareText(FButtons[Result].FileName, AFileName) <> 0) do
    Inc(Result);
  if Result >= Count then
    Result := -1;
end;

function TFileButtonList.GetProcessIndex(AProcess: String): Integer;
begin
  Result := 0;
  if Pos('\', AProcess) > 0 then
    AProcess := ExtractFileName(AProcess);
  while (Result < Count) and (CompareText(FButtons[Result].Process, AProcess) <> 0) do
    Inc(Result);
  if Result >= Count then
    Result := -1;
end;

function TFileButtonList.GetSystemIndex(ASystem: String): Integer;
begin
  Result := 0;
  while (Result < Count) and (CompareText(FButtons[Result].Caption, ASystem) <> 0) do
    Inc(Result);
  if Result >= Count then
    Result := -1;
end;

function TFileButtonList.GetCount: Integer;
begin
  Result := High(FButtons) + 1;
end;

function TFileButtonList.ProcessExists(AProcess: String): Boolean;
begin
  Result := GetProcessIndex(AProcess) >= 0;
end;

function TFileButtonList.ProcessIsRunning(AProcess: String): Boolean;
begin
  Result := Funcoes.ProcessExists(AProcess);
end;

procedure TFileButtonList.SetArrangeType(const Value: TArrangeType);
begin
  if FArrangeType <> Value then
  begin
    FArrangeType := Value;
    ArrangeIcons(Value);
  end;
end;

procedure TFileButtonList.SetButtonHeight(const Value: Integer);
var
  I: Integer;
begin
  FButtonHeight := Value;
  for I := 0 to Count - 1 do
    FButtons[I].Height := Value;
  DoChanged;
end;

procedure TFileButtonList.SetButtonWidth(const Value: Integer);
var
  I: Integer;
begin
  FButtonWidth := Value;
  for I := 0 to Count - 1 do
    FButtons[I].Width := Value;
  DoChanged;
end;

procedure TFileButtonList.SetControl(const Value: TWinControl);
var
  I: Integer;
begin
  FControl := Value;
  for I := 0 to Count - 1 do
    FButtons[I].Parent := Value;
  DoChanged;
end;

function TFileButtonList.SystemExists(ASystem: String): Boolean;
begin
  Result := GetSystemIndex(ASystem) >= 0;
end;

function TFileButtonList.SystemIsRunning(ASystem: String): Boolean;
var
  I: Integer;
begin
  I := GetSystemIndex(ASystem);
  Result := I >= 0;
  if Result then
    Result := ProcessIsRunning(FButtons[I].Process);
end;

procedure TFileButtonList.VerifyProcesses;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    FButtons[I].VerifyProcess;
end;

initialization
  if FileExists(ExtractFilePath(ParamStr(0)) + 'Pirate.cur') then
    Screen.Cursors[crTarget] := crDefault //LoadCursorFromFile(PWideChar(ExtractFilePath(ParamStr(0)) + 'Pirate.cur'))
  else
    Screen.Cursors[crTarget] := crDefault;
  _MIN_HEIGHT := Screen.WorkAreaWidth;

end.
