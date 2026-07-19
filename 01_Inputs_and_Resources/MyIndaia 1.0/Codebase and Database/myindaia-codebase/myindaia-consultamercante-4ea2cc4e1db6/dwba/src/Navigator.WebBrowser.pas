unit Navigator.WebBrowser;

interface

uses Classes, System.SysUtils, Winapi.Windows, Vcl.Forms, System.StrUtils,
  Vcl.Controls, WinInet,
  Winapi.ActiveX, SHDocVw, MSHTML,
  WinHttp_TLB,
  Navigator, jQuery.XPath, Navigator.Utils, Navigator.WebBrowser.UI, Utils, Dialogs;

 type

  TNavigatorWebBrowser = class (TInterfacedObject, INavigator)
  private
    FWebBrowser: TWebBrowser;

    //FOnDocumentComplete: TWebBrowserDocumentComplete;
    //FOnNavigateComplete2: TWebBrowserNavigateComplete2;
    //FOnBeforeNavigate2: TWebBrowserBeforeNavigate2;
    FCurDispatch: IDispatch;
    FDocLoaded: Boolean;


    procedure InternalBeforeNavigate2(ASender: TObject; const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure InternalDocumentComplete(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    procedure InternalNavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
  public
    FormWebBrowser: TFormWebBrowser;
    destructor Destroy; override;
    constructor Create;

    property WebBrowser: TWebBrowser read FWebBrowser write FWebBrowser;
    procedure Navegate(const Url: string; Flags : OleVariant);
    procedure Redirect(const Url: string);
    procedure ExecuteScript(Script: string);
    procedure ExecuteScriptInFrame(IndexFrame: Integer; Script: string);
    procedure AddjQuery;
    procedure AddjQueryXPathPlugin;
    function GetFieldValueByXPath(const XPath, FieldName: string): string; overload;
    function GetFieldValueByXPath(const XPath: string): string; overload;
    procedure EventClicByXPath(const XPath: string);
    function GetFieldValueBySelector(Selector, FieldName: string): string; deprecated 'Será removido em breve';
    function GetJSVariableValue(const Value: string): string;
    procedure ClearCache;
    procedure Finish;
    Function GetValueInFrame(IndexFrame: Integer; campo , Script: string; scriptFuncao : String = '') : String;
    function GetJSVariableValueinFrame(IndexFrame :olevariant; const Value: string): string;
    Function GetValuePagina(campo , Script: string; scriptFuncao : string = '') : String;
    function GetPageName: String;
    function GetPageNameComplete: String;
    procedure RedimencionarBrowser;
    procedure PreencheTituloWB(Texto :String);
    function VerificarFramesCarregados(NomeFrame : String) : Boolean;

  end;

implementation

uses uMain;


function TNavigatorWebBrowser.GetJSVariableValue(const Value: string): string;
var
  Window: IHTMLWindow2;
  DispatchIdOfProperty: Integer;
  MyPropertyValue: OleVariant;
  Temp: TExcepInfo;
  Res: Integer;
  Params:TDispParams;
begin
  try
    Window := (FWebBrowser.ControlInterface.Document as IHTMLDocument2).parentWindow;
    Assert(Assigned(Window));

    if (Window as IDispatchEx).GetDispID(PWideChar(Value), fdexNameCaseSensitive, DispatchIdOfProperty) = S_OK then
    begin
      ZeroMemory(@Params, SizeOf(Params));
      Res:=(Window as IDispatchEx).InvokeEx(DispatchIdOfProperty, LOCALE_USER_DEFAULT, DISPATCH_PROPERTYGET, @Params, MyPropertyValue, Temp, nil);
      if Res=S_OK then
      begin
        Result := MyPropertyValue;
      end else
        Result := '-2';
    end
    else
      Result := '-1';
  except on E:Exception do
  end;
end;

function TNavigatorWebBrowser.GetJSVariableValueinFrame(IndexFrame :olevariant; const Value: string): string;
var
  Window: IHTMLWindow2;
  DispatchIdOfProperty: Integer;
  MyPropertyValue: OleVariant;
  Temp: TExcepInfo;
  Res: Integer;
  Params:TDispParams;
  Doc: IHTMLDocument2;
  frame_dispatch: IDispatch;
begin
  try
    Doc            := (FWebBrowser.Document as IHTMLDocument2);
    frame_dispatch := Doc.Frames.Item(IndexFrame);
    Window         := frame_dispatch as IHTMLWindow2;

    Assert(Assigned(Window));

    if (Window as IDispatchEx).GetDispID(PWideChar(Value), fdexNameCaseSensitive, DispatchIdOfProperty) = S_OK then
    begin
      ZeroMemory(@Params, SizeOf(Params));
      Res:=(Window as IDispatchEx).InvokeEx(DispatchIdOfProperty, LOCALE_USER_DEFAULT, DISPATCH_PROPERTYGET, @Params, MyPropertyValue, Temp, nil);
      if Res=S_OK then
      begin
        Result := MyPropertyValue;
      end else
        Result := '-2';
    end
    else
      Result := '-1';
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.InternalBeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  try
    FCurDispatch := nil;
    FDocLoaded   := False;
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.InternalDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  try
    if (pDisp = FCurDispatch) then
    begin
      FDocLoaded := True;
      FCurDispatch := nil;

    end;
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.InternalNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  try
    if FCurDispatch = nil then
      FCurDispatch := pDisp;
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.EventClicByXPath(const XPath: string);
begin
  ExecuteScript('$(document).xpath("'+XPath+'").click();');
end;

procedure TNavigatorWebBrowser.ExecuteScript(Script: string);
var
  Doc: IHTMLDocument2;
begin
  try
    Doc := (FWebBrowser.Document as IHTMLDocument2);
    Doc.parentWindow.execScript(Script, Olevariant('javascript'));
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.ExecuteScriptInFrame(IndexFrame: Integer;
  Script: string);
var
  Doc: IHTMLDocument2;
begin
  try
    Doc := (FWebBrowser.Document as IHTMLDocument2);
    Doc.frames.item(IndexFrame).execScript(Script, Olevariant('javascript'));
  except on E:Exception do
  end;
end;

Function TNavigatorWebBrowser.GetValueInFrame(IndexFrame: Integer; campo , Script: string; scriptFuncao : string = '') : String;
var
  Doc: IHTMLDocument2;
begin
  try
    Doc := (FWebBrowser.Document as IHTMLDocument2);
    Doc.frames.item(IndexFrame).execScript(scriptFuncao + ' var '+campo+' = '+ Script, Olevariant('javascript'));

    Result := GetJSVariableValueinFrame(IndexFrame, campo);

  except on E:Exception do
  end;
end;

Function TNavigatorWebBrowser.GetValuePagina(campo , Script: string; scriptFuncao : string = '') : String;
var
  Doc: IHTMLDocument2;
begin
  try
    Doc := (FWebBrowser.Document as IHTMLDocument2);
    Doc.parentWindow.execScript(scriptFuncao + ' var '+campo+' = '+ Script, Olevariant('javascript'));

    Result := GetJSVariableValue(campo);
  except on E:Exception do
   // ShowMessage( E.Message);
  end;
end;

procedure TNavigatorWebBrowser.Finish;
begin
  try
    FormWebBrowser.Close;
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.AddjQuery;
begin
  ExecuteScript(GetjQueryXPath);
end;

procedure TNavigatorWebBrowser.AddjQueryXPathPlugin;
begin
  ExecuteScript(GetjQueryXPath);
end;

procedure TNavigatorWebBrowser.ClearCache;
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin { DeleteIECache }
  dwEntrySize := 0;

  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);

  GetMem(lpEntryInfo, dwEntrySize);

  if dwEntrySize>0 then
    lpEntryInfo^.dwStructSize := dwEntrySize;

  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);

  if hCacheDir<>0 then
  begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize>0 then
        lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize)
  end; { hCacheDir<>0 }
  FreeMem(lpEntryInfo, dwEntrySize);

  FindCloseUrlCache(hCacheDir)
end;

constructor TNavigatorWebBrowser.Create;
begin
  FormWebBrowser                  := TFormWebBrowser.Create(nil);
  FWebBrowser                     := FormWebBrowser.WebBrowser;
end;

destructor TNavigatorWebBrowser.Destroy;
begin
  FormWebBrowser.Free;
  inherited;
end;

function TNavigatorWebBrowser.GetFieldValueByXPath(const XPath, FieldName: string): string;
begin
  ExecuteScript('var '+FieldName+' = $(document).xpath("'+XPath+'").text();');
  Result := GetJSVariableValue(FieldName);
end;

function TNavigatorWebBrowser.GetFieldValueByXPath(const XPath: string): string;
begin
  Result := GetFieldValueByXPath(XPath, 'TempField');
end;

function TNavigatorWebBrowser.GetFieldValueBySelector(Selector, FieldName: string): string;
begin
  try
    ExecuteScript('var element = '+Selector);
    ExecuteScript('element.attr(''id'', '''+FieldName+''');');
    Result := (FWebBrowser.Document as IHTMLDocument3).getElementById(FieldName).innerText;
  except
    Result := '';
  end;
end;

procedure TNavigatorWebBrowser.Navegate(const Url: string; Flags : OleVariant);
begin
  try
    FWebBrowser.Navigate2(Url, Flags);
    FWebBrowser.Silent := True;
    FormWebBrowser.ShowModal;
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.Redirect(const Url: string);
begin
  try
    FWebBrowser.Navigate2(Url);
    FWebBrowser.Silent := True;
  except on E:Exception do
  end;
end;

function TNavigatorWebBrowser.GetPageName: String;
var
  P: Integer;
begin
  try
    Result := FWebBrowser.LocationURL;

    P := Pos('?', Result);
    if P > 0 then
      Result := Copy(Result, 1, P -1);

    P := Pos('/', Result);
    while (Result <> '') and (P > 0) do
    begin
      Delete(Result, 1, P);
      P := Pos('/', Result);
    end;
  except on E:Exception do
  end;
end;

function TNavigatorWebBrowser.GetPageNameComplete: String;
begin
  try
    Result := FWebBrowser.LocationURL;
  except on E:Exception do
  end;
end;

procedure TNavigatorWebBrowser.RedimencionarBrowser;
begin
  FormWebBrowser.WindowState  := wsNormal;
  FormWebBrowser.Left         := 500;
  FormWebBrowser.Top          := 50;
  FormWebBrowser.Width        := 600;
  FormWebBrowser.Height       := 600;
end;

procedure TNavigatorWebBrowser.PreencheTituloWB(Texto :String);
begin
  FormWebBrowser.lblTitulo.Caption := Texto;
  FormWebBrowser.lblTitulo.Visible := true;
end;


function TNavigatorWebBrowser.VerificarFramesCarregados(NomeFrame : String) : Boolean;
var
  qt_frames, i: Integer;
  status_frame_atual, nome_frame_atual : string;
begin
  Result := false;

  qt_frames := strtoint(GetValuePagina('qt_frames','window.frames.length'));

  if qt_frames > 0 then
  begin
    for I := 0 to qt_frames -1 do
    begin
      nome_frame_atual   := GetValuePagina('myframe'+inttostr(i),
                                           'window.frames['+inttostr(i)+'].name;');

      status_frame_atual := GetValuePagina('myframe'+inttostr(i),
                                           'window.frames['+inttostr(i)+'].document.readyState;');

      if Uppercase(Trim(nome_frame_atual)) = Uppercase(Trim(NomeFrame)) then
      begin
        if Uppercase(Trim(status_frame_atual)) = Uppercase('complete') then
        begin
          Result := True;
          break;
        end;
      end;
    end;
  end;
end;

initialization
  OleInitialize(nil);

finalization
  OleUninitialize;

end.
