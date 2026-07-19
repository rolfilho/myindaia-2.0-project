unit MyJSON;

{$IFDEF fpc}
  {$MODE objfpc}
  {$H+}
  {.$DEFINE HAVE_FORMATSETTING}
{$ELSE}
  {$IF RTLVersion > 14.00}
    {$DEFINE HAVE_FORMATSETTING}
  {$IFEND}
{$ENDIF}

interface

{.$DEFINE KOL}
{.$define DOTNET}
{$DEFINE THREADSAFE}
{$DEFINE NEW_STYLE_GENERATE}
{.$DEFINE USE_HASH}

uses windows,
  SysUtils,
  DelphiUP,
{$IFNDEF KOL}
  classes,
{$ELSE}
  kol,
{$ENDIF}
  variants;

type
  TMyJSONtypes = (jsBase, jsNumber, jsString, jsBoolean, jsNull,
    jsList, jsObject);

  TMyJSONObject = class;
{$IFDEF DOTNET}

  TMyJSONdotnetclass = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure AfterConstruction; virtual;
    procedure BeforeDestruction; virtual;
  end;

{$ENDIF DOTNET}

  TMyJSONbase = class{$IFDEF DOTNET}(TMyJSONdotnetclass){$ENDIF}
  protected
    function GetValue: variant; virtual;
    procedure SetValue(const AValue: variant); virtual;
    function GetChild(idx: Integer): TMyJSONbase; virtual;
    procedure SetChild(idx: Integer; const AValue: TMyJSONbase);
      virtual;
    function GetCount: Integer; virtual;
  public
    property Count: Integer read GetCount;
    property Child[idx: Integer]: TMyJSONbase read GetChild
      write SetChild;
    property Value: variant read GetValue write SetValue;
    class function SelfType: TMyJSONtypes; virtual;
    class function SelfTypeName: string; virtual;
  end;

  TMyJSONnumber = class(TMyJSONbase)
  protected
    FValue: extended;
    function GetValue: Variant; override;
    procedure SetValue(const AValue: Variant); override;
  public
    procedure AfterConstruction; override;
    class function Generate(AValue: extended = 0): TMyJSONnumber;
    class function SelfType: TMyJSONtypes; override;
    class function SelfTypeName: string; override;
  end;

  TMyJSONstring = class(TMyJSONbase)
  protected
    FValue: WideString;
    function GetValue: Variant; override;
    procedure SetValue(const AValue: Variant); override;
  public
    procedure AfterConstruction; override;
    class function Generate(const wsValue: WideString = ''):
      TMyJSONstring;
    class function SelfType: TMyJSONtypes; override;
    class function SelfTypeName: string; override;
  end;

  TMyJSONboolean = class(TMyJSONbase)
  protected
    FValue: Boolean;
    function GetValue: Variant; override;
    procedure SetValue(const AValue: Variant); override;
  public
    procedure AfterConstruction; override;
    class function Generate(AValue: Boolean = true): TMyJSONboolean;
    class function SelfType: TMyJSONtypes; override;
    class function SelfTypeName: string; override;
  end;

  TMyJSONnull = class(TMyJSONbase)
  protected
    function GetValue: Variant; override;
    function Generate: TMyJSONnull;
  public
    class function SelfType: TMyJSONtypes; override;
    class function SelfTypeName: string; override;
  end;

  TMyJSONFuncEnum = procedure(ElName: string; Elem: TMyJSONbase;
    data: pointer; var Continue: Boolean) of object;

  TMyJSONcustomlist = class(TMyJSONbase)
  protected
//    FValue: array of TMyJSONbase;
    fList: TList;
    function GetCount: Integer; override;
    function GetChild(idx: Integer): TMyJSONbase; override;
    procedure SetChild(idx: Integer; const AValue: TMyJSONbase);
      override;
    function ForEachElement(idx: Integer; var nm: string):
      TMyJSONbase; virtual;

    function _Add(obj: TMyJSONbase): Integer; virtual;
    procedure _Delete(iIndex: Integer); virtual;
    function _IndexOf(obj: TMyJSONbase): Integer; virtual;
  public
    procedure ForEach(fnCallBack: TMyJSONFuncEnum; pUserData:
      pointer);
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;

    function getInt(idx: Integer): Integer; virtual;
    function getString(idx: Integer): string; virtual;
    function getWideString(idx: Integer): WideString; virtual;
    function getDouble(idx: Integer): Double; virtual;
    function getBoolean(idx: Integer): Boolean; virtual;
    function getObject(idx: Integer): TMyJSONObject; overload;
  end;

  TMyJSONlist = class(TMyJSONcustomlist)
  public
    function Add(obj: TMyJSONbase): Integer; overload;

    function Add(bool: Boolean): Integer; overload;
    function Add(nmb: double): Integer; overload;
    function Add(s: string): Integer; overload;
    function Add(const ws: WideString): Integer; overload;
    function Add(inmb: Integer): Integer; overload;
    function AddObject(const aname: WideString): TMyJSONObject;

    procedure Delete(idx: Integer);
    function IndexOf(obj: TMyJSONbase): Integer;
    class function Generate: TMyJSONlist;
    class function SelfType: TMyJSONtypes; override;
    class function SelfTypeName: string; override;

  end;

  TMyJSONobjectmethod = class(TMyJSONbase)
  protected
    FValue: TMyJSONbase;
    FName: WideString;
    procedure SetName(const AValue: WideString);
  public
    property ObjValue: TMyJSONbase read FValue;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    property Name: WideString read FName write SetName;
    class function Generate(const aname: WideString; aobj: TMyJSONbase):
      TMyJSONobjectmethod;
  end;

{$IFDEF USE_HASH}
  PlkHashItem = ^TMyHashItem;
  TMyHashItem = packed record
    hash: cardinal;
    index: Integer;
  end;

  TMyHashFunction = function(const ws: WideString): cardinal of
    object;

  TMyHashTable = class
  private
    FHashFunction: TMyHashFunction;
    procedure SetHashFunction(const AValue: TMyHashFunction);
  protected
    a_x: array[0..255] of TList;
    procedure hswap(j, k, l: Integer);
    function InTable(const ws: WideString; var i, j, k: cardinal):
      Boolean;
  public
    function counters: string;

    function DefaultHashOf(const ws: WideString): cardinal;
    function SimpleHashOf(const ws: WideString): cardinal;

    property HashOf: TMyHashFunction read FHashFunction write
      SetHashFunction;

    function IndexOf(const ws: WideString): Integer;

    procedure AddPair(const ws: WideString; idx: Integer);
    procedure Delete(const ws: WideString);

    constructor Create;
    destructor Destroy; override;
  end;

{$ELSE}

// implementation based on "Arne Andersson, Balanced Search Trees Made Simpler"

  PlkBalNode = ^TMyBalNode;
  TMyBalNode = packed record
    left,right: PlkBalNode;
    level: byte;
    key: Integer;
    nm: WideString;
  end;

  TMyBalTree = class
  protected
    fdeleted,flast,fbottom,froot: PlkBalNode;
    procedure skew(var t:PlkBalNode);
    procedure split(var t:PlkBalNode);
  public
    function counters: string;

    procedure Clear;

    function Insert(const ws: WideString; x: Integer): Boolean;
    function Delete(const ws: WideString): Boolean;

    function IndexOf(const ws: WideString): Integer;

    constructor Create;
    destructor Destroy; override;
  end;
{$ENDIF USE_HASH}

  TMyJSONObject = class(TMyJSONcustomlist)
  protected
{$IFDEF USE_HASH}
    ht: TMyHashTable;
{$ELSE}
    ht: TMyBalTree;
{$ENDIF USE_HASH}
    FUseHash: Boolean;
    function GetFieldByIndex(idx: Integer): TMyJSONbase;
    function GetNameOf(idx: Integer): WideString;
    procedure SetFieldByIndex(idx: Integer; const AValue: TMyJSONbase);
{$IFDEF USE_HASH}
    function GetHashTable: TMyHashTable;
{$ELSE}
    function GetHashTable: TMyBalTree;
{$ENDIF USE_HASH}
    function ForEachElement(idx: Integer; var nm: string): TMyJSONbase;
      override;
  public
    property UseHash: Boolean read FUseHash;
{$IFDEF USE_HASH}
    property HashTable: TMyHashTable read GetHashTable;
{$ELSE}
    property HashTable: TMyBalTree read GetHashTable;
{$ENDIF USE_HASH}
    function GetField(nm: string): TMyJSONbase;
    procedure SetField(nm: string; const AValue: TMyJSONbase);

    function Add(const aname: WideString; aobj: TMyJSONbase): Integer; overload;
    function Add(const aname: WideString; bool: Boolean): Integer; overload;
    function Add(const aname: WideString; nmb: double): Integer; overload;
    function Add(const aname: WideString; s: string): Integer; overload;
    function Add(const aname: WideString; const ws: WideString): Integer; overload;
    function Add(const aname: WideString; inmb: Integer): Integer; overload;
    function AddObject(const aname: WideString): TMyJSONObject;

    procedure Delete(idx: Integer);
    function IndexOfName(const aname: WideString): Integer;
    function IndexOfObject(aobj: TMyJSONbase): Integer;
    property Field[nm: string]: TMyJSONbase read GetField write SetField; default;

    constructor Create(bUseHash: Boolean = true);
    destructor Destroy; override;

    class function Generate(AUseHash: Boolean = true): TMyJSONobject;
    class function SelfType: TMyJSONtypes; override;
    class function SelfTypeName: string; override;

    property FieldByIndex[idx: Integer]: TMyJSONbase read GetFieldByIndex
    write SetFieldByIndex;
    property NameOf[idx: Integer]: WideString read GetNameOf;

    function getDouble(idx: Integer): Double; overload; override;
    function getInt(idx: Integer): Integer; overload; override;
    function getString(idx: Integer): string; overload; override;
    function getWideString(idx: Integer): WideString; overload; override;
    function getBoolean(idx: Integer): Boolean; overload; override;
    function getObject(idx: Integer): TMyJSONObject; overload;

    function getDouble(nm: string): Double; reintroduce; overload;
    function getInt(nm: string): Integer; reintroduce; overload;
    function getString(nm: string): string; reintroduce; overload;
    function getWideString(nm: string): WideString; reintroduce; overload;
    function getBoolean(nm: string): Boolean; reintroduce; overload;
    function getObject(nm: string): TMyJSONObject; overload;
    function getList(nm: string): TMyJSONlist; overload;
  end;

  TMyJSON = class
  public
    class function ParseText(const txt: string): TMyJSONbase;
    class function GenerateText(obj: TMyJSONbase): string;
  end;

{$IFNDEF KOL}
  TMyJSONstreamed = class(TMyJSON)
    class function LoadFromStream(src: TStream): TMyJSONbase;
    class procedure SaveToStream(obj: TMyJSONbase; dst: TStream);
    class function LoadFromFile(srcname: string): TMyJSONbase;
    class procedure SaveToFile(obj: TMyJSONbase; dstname: string);
  end;
{$ENDIF}

function GenerateReadableText(vObj: TMyJSONbase; var vLevel:
  Integer): string;

implementation

uses math,strutils;

type
  ElkIntException = class(Exception)
  public
    idx: Integer;
    constructor Create(idx: Integer; msg: string);
  end;

// author of next two functions is Kusnassriyanto Saiful Bahri

function Indent(vTab: Integer): string;
begin
  result := DupeString('  ', vTab);
end;

function GenerateReadableText(vObj: TMyJSONbase; var vLevel:
  Integer): string;
var
  i: Integer;
  vStr: string;
  xs: TMyJSONstring;
begin
  vLevel := vLevel + 1;
  if vObj is TMyJSONObject then
    begin
      vStr := '';
      for i := 0 to TMyJSONobject(vObj).Count - 1 do
        begin
          if vStr <> '' then
            begin
              vStr := vStr + ','#13#10;
            end;
          vStr := vStr + Indent(vLevel) +
            GenerateReadableText(TMyJSONobject(vObj).Child[i], vLevel);
        end;
      if vStr <> '' then
        begin
          vStr := '{'#13#10 + vStr + #13#10 + Indent(vLevel - 1) + '}';
        end
      else
        begin
          vStr := '{}';
        end;
      result := vStr;
    end
  else if vObj is TMyJSONList then
    begin
      vStr := '';
      for i := 0 to TMyJSONList(vObj).Count - 1 do
        begin
          if vStr <> '' then
            begin
              vStr := vStr + ','#13#10;
            end;
          vStr := vStr + Indent(vLevel) +
              GenerateReadableText(TMyJSONList(vObj).Child[i], vLevel);
        end;
      if vStr <> '' then
        begin
          vStr := '['#13#10 + vStr + #13#10 + Indent(vLevel - 1) + ']';
        end
      else
        begin
          vStr := '[]';
        end;
      result := vStr;
    end
  else if vObj is TMyJSONobjectmethod then
    begin
      vStr := '';
      xs := TMyJSONstring.Create;
      try
        xs.Value := TMyJSONobjectMethod(vObj).Name;
        vStr := GenerateReadableText(xs, vLevel);
        vLevel := vLevel - 1;
        vStr := vStr + ':' + GenerateReadableText(TMyJSONbase(
          TMyJSONobjectmethod(vObj).ObjValue), vLevel);
      //vStr := vStr + ':' + GenerateReadableText(TMyJSONbase(vObj), vLevel);
        vLevel := vLevel + 1;
        result := vStr;
      finally
        xs.Free;
      end;
    end
  else
    begin
      if vObj is TMyJSONobjectmethod then
        begin
          if TMyJSONobjectMethod(vObj).Name <> '' then
            begin
            end;
        end;
      result := TMyJSON.GenerateText(vObj);
    end;
  vLevel := vLevel - 1;
end;

// author of this routine is IVO GELOV

function code2utf(iNumber: Integer): UTF8String;
begin
  if iNumber < 128 then Result := UTF8String(chr(iNumber))
  else if iNumber < 2048 then
    Result := UTF8String(chr((iNumber shr 6) + 192) + chr((iNumber and 63) + 128))
  else if iNumber < 65536 then
    Result := UTF8String(chr((iNumber shr 12) + 224) + chr(((iNumber shr 6) and
      63) + 128) + chr((iNumber and 63) + 128))
  else if iNumber < 2097152 then
    Result := UTF8String(chr((iNumber shr 18) + 240) + chr(((iNumber shr 12) and
      63) + 128) + chr(((iNumber shr 6) and 63) + 128) +
      chr((iNumber and 63) + 128));
end;

{ TMyJSONbase }

function TMyJSONbase.GetChild(idx: Integer): TMyJSONbase;
begin
  result := nil;
end;

function TMyJSONbase.GetCount: Integer;
begin
  result := 0;
end;

function TMyJSONbase.GetValue: variant;
begin
  result := variants.Null;
end;

class function TMyJSONbase.SelfType: TMyJSONtypes;
begin
  result := jsBase;
end;

class function TMyJSONbase.SelfTypeName: string;
begin
  result := 'jsBase';
end;

procedure TMyJSONbase.SetChild(idx: Integer; const AValue:
  TMyJSONbase);
begin

end;

procedure TMyJSONbase.SetValue(const AValue: variant);
begin

end;

{ TMyJSONnumber }

procedure TMyJSONnumber.AfterConstruction;
begin
  inherited;
  FValue := 0;
end;

class function TMyJSONnumber.Generate(AValue: extended):
  TMyJSONnumber;
begin
  result := TMyJSONnumber.Create;
  result.FValue := AValue;
end;

function TMyJSONnumber.GetValue: Variant;
begin
  result := FValue;
end;

class function TMyJSONnumber.SelfType: TMyJSONtypes;
begin
  result := jsNumber;
end;

class function TMyJSONnumber.SelfTypeName: string;
begin
  result := 'jsNumber';
end;

procedure TMyJSONnumber.SetValue(const AValue: Variant);
begin
  FValue := VarAsType(AValue, varDouble);
end;

{ TMyJSONstring }

procedure TMyJSONstring.AfterConstruction;
begin
  inherited;
  FValue := '';
end;

class function TMyJSONstring.Generate(const wsValue: WideString):
  TMyJSONstring;
begin
  result := TMyJSONstring.Create;
  result.FValue := wsValue;
end;

function TMyJSONstring.GetValue: Variant;
begin
  result := FValue;
end;

class function TMyJSONstring.SelfType: TMyJSONtypes;
begin
  result := jsString;
end;

class function TMyJSONstring.SelfTypeName: string;
begin
  result := 'jsString';
end;

procedure TMyJSONstring.SetValue(const AValue: Variant);
begin
  FValue := VarToWideStr(AValue);
end;

{ TMyJSONboolean }

procedure TMyJSONboolean.AfterConstruction;
begin
  FValue := false;
end;

class function TMyJSONboolean.Generate(AValue: Boolean):
  TMyJSONboolean;
begin
  result := TMyJSONboolean.Create;
  result.Value := AValue;
end;

function TMyJSONboolean.GetValue: Variant;
begin
  result := FValue;
end;

class function TMyJSONboolean.SelfType: TMyJSONtypes;
begin
  Result := jsBoolean;
end;

class function TMyJSONboolean.SelfTypeName: string;
begin
  Result := 'jsBoolean';
end;

procedure TMyJSONboolean.SetValue(const AValue: Variant);
begin
  FValue := boolean(AValue);
end;

{ TMyJSONnull }

function TMyJSONnull.Generate: TMyJSONnull;
begin
  result := TMyJSONnull.Create;
end;

function TMyJSONnull.GetValue: Variant;
begin
  result := variants.Null;
end;

class function TMyJSONnull.SelfType: TMyJSONtypes;
begin
  result := jsNull;
end;

class function TMyJSONnull.SelfTypeName: string;
begin
  result := 'jsNull';
end;

{ TMyJSONcustomlist }

function TMyJSONcustomlist._Add(obj: TMyJSONbase): Integer;
begin
  if not Assigned(obj) then
    begin
      result := -1;
      exit;
    end;
  result := fList.Add(obj);
end;

procedure TMyJSONcustomlist.AfterConstruction;
begin
  inherited;
  fList := TList.Create;
end;

procedure TMyJSONcustomlist.BeforeDestruction;
var
  i: Integer;
begin
  for i := (Count - 1) downto 0 do _Delete(i);
  fList.Free;
  inherited;
end;

// renamed

procedure TMyJSONcustomlist._Delete(iIndex: Integer);
begin
  if not ((iIndex < 0) or (iIndex >= Count)) then
    begin
      if fList.Items[iIndex] <> nil then
        TMyJSONbase(fList.Items[iIndex]).Free;
      fList.Delete(iIndex);
    end;
end;

function TMyJSONcustomlist.GetChild(idx: Integer): TMyJSONbase;
begin
  if (idx < 0) or (idx >= Count) then
    begin
      result := nil;
    end
  else
    begin
      result := fList.Items[idx];
    end;
end;

function TMyJSONcustomlist.GetCount: Integer;
begin
  result := fList.Count;
end;

function TMyJSONcustomlist._IndexOf(obj: TMyJSONbase): Integer;
//var
//  i: Integer;
begin
  result := fList.IndexOf(obj);
end;

procedure TMyJSONcustomlist.SetChild(idx: Integer; const AValue:
  TMyJSONbase);
begin
  if not ((idx < 0) or (idx >= Count)) then
    begin
      if fList.Items[idx] <> nil then
        TMyJSONbase(fList.Items[idx]).Free;
      fList.Items[idx] := AValue;
    end;
end;

procedure TMyJSONcustomlist.ForEach(fnCallBack: TMyJSONFuncEnum;
  pUserData:
  pointer);
var
  iCount: Integer;
  IsContinue: Boolean;
  anJSON: TMyJSONbase;
  wsObject: string;
begin
  if not assigned(fnCallBack) then exit;
  IsContinue := true;
  for iCount := 0 to GetCount - 1 do
    begin
      anJSON := ForEachElement(iCount, wsObject);
      if assigned(anJSON) then
        fnCallBack(wsObject, anJSON, pUserData, IsContinue);
      if not IsContinue then break;
    end;
end;

///---- renamed to here

function TMyJSONcustomlist.ForEachElement(idx: Integer; var nm:
  string): TMyJSONbase;
begin
  nm := inttostr(idx);
  result := GetChild(idx);
end;

function TMyJSONcustomlist.getDouble(idx: Integer): Double;
var
  jn: TMyJSONnumber;
begin
  jn := Child[idx] as TMyJSONnumber;
  if not assigned(jn) then result := 0
  else result := jn.Value;
end;

function TMyJSONcustomlist.getInt(idx: Integer): Integer;
var
  jn: TMyJSONnumber;
begin
  jn := Child[idx] as TMyJSONnumber;
  if not assigned(jn) then result := 0
  else result := round(int(jn.Value));
end;

function TMyJSONcustomlist.getString(idx: Integer): string;
var
  js: TMyJSONstring;
begin
  js := Child[idx] as TMyJSONstring;
  if not assigned(js) then result := ''
  else result := VarToStr(js.Value);
end;

function TMyJSONcustomlist.getWideString(idx: Integer): WideString;
var
  js: TMyJSONstring;
begin
  js := Child[idx] as TMyJSONstring;
  if not assigned(js) then result := ''
  else result := VarToWideStr(js.Value);
end;

function TMyJSONcustomlist.getBoolean(idx: Integer): Boolean;
var
  jb: TMyJSONboolean;
begin
  jb := Child[idx] as TMyJSONboolean;
  if not assigned(jb) then result := false
  else result := jb.Value;
end;

function TMyJSONcustomlist.getObject(idx: Integer): TMyJSONObject;
var
  jb: TMyJSONObject;
begin
  jb := Child[idx] as TMyJSONObject;
  if not assigned(jb) then result := nil
  else result := jb;
end;
  { TMyJSONobjectmethod }

procedure TMyJSONobjectmethod.AfterConstruction;
begin
  inherited;
  FValue := nil;
  FName := '';
end;

procedure TMyJSONobjectmethod.BeforeDestruction;
begin
  FName := '';
  if FValue <> nil then
    begin
      FValue.Free;
      FValue := nil;
    end;
  inherited;
end;

class function TMyJSONobjectmethod.Generate(const aname: WideString;
  aobj: TMyJSONbase): TMyJSONobjectmethod;
begin
  result := TMyJSONobjectmethod.Create;
  result.FName := aname;
  result.FValue := aobj;
end;

procedure TMyJSONobjectmethod.SetName(const AValue: WideString);
begin
  FName := AValue;
end;

{ TMyJSONlist }

function TMyJSONlist.Add(obj: TMyJSONbase): Integer;
begin
  result := _Add(obj);
end;

function TMyJSONlist.Add(nmb: double): Integer;
begin
  Result := self.Add(TMyJSONnumber.Generate(nmb));
end;

function TMyJSONlist.Add(bool: Boolean): Integer;
begin
  Result := self.Add(TMyJSONboolean.Generate(bool));
end;

function TMyJSONlist.Add(inmb: Integer): Integer;
begin
  Result := self.Add(TMyJSONnumber.Generate(inmb));
end;

function TMyJSONlist.AddObject(const aname: WideString): TMyJSONObject;
begin
  Result := TMyJSONObject.Create;
  Add(Result);
end;

function TMyJSONlist.Add(const ws: WideString): Integer;
begin
  Result := self.Add(TMyJSONstring.Generate(ws));
end;

function TMyJSONlist.Add(s: string): Integer;
begin
  Result := self.Add(TMyJSONstring.Generate(s));
end;

procedure TMyJSONlist.Delete(idx: Integer);
begin
  _Delete(idx);
end;

class function TMyJSONlist.Generate: TMyJSONlist;
begin
  result := TMyJSONlist.Create;
end;

function TMyJSONlist.IndexOf(obj: TMyJSONbase): Integer;
begin
  result := _IndexOf(obj);
end;

class function TMyJSONlist.SelfType: TMyJSONtypes;
begin
  result := jsList;
end;

class function TMyJSONlist.SelfTypeName: string;
begin
  result := 'jsList';
end;

{ TMyJSONobject }

function TMyJSONobject.Add(const aname: WideString; aobj:
  TMyJSONbase):
  Integer;
var
  mth: TMyJSONobjectmethod;
begin
  if not assigned(aobj) then
    begin
      result := -1;
      exit;
    end;
  mth := TMyJSONobjectmethod.Create;
  mth.FName := aname;
  mth.FValue := aobj;
  result := self._Add(mth);
  if FUseHash then
{$IFDEF USE_HASH}
    ht.AddPair(aname, result);
{$ELSE}
    ht.Insert(aname, result);
{$ENDIF USE_HASH}
end;

procedure TMyJSONobject.Delete(idx: Integer);
var
  mth: TMyJSONobjectmethod;
begin
  if (idx >= 0) and (idx < Count) then
    begin
//      mth := FValue[idx] as TMyJSONobjectmethod;
      mth := TMyJSONobjectmethod(fList.Items[idx]);
      if FUseHash then ht.Delete(mth.FName);
    end;
  _Delete(idx);
end;

class function TMyJSONobject.Generate(AUseHash: Boolean = true):
  TMyJSONobject;
begin
  result := TMyJSONobject.Create(AUseHash);
end;

function TMyJSONobject.GetField(nm: string): TMyJSONbase;
var
  mth: TMyJSONobjectmethod;
  i: Integer;
begin
  i := IndexOfName(nm);
  if i = -1 then
    begin
      result := nil;
    end
  else
    begin
//      mth := TMyJSONobjectmethod(FValue[i]);
      mth := TMyJSONobjectmethod(fList.Items[i]);
      result := mth.FValue;
    end;
end;

function TMyJSONobject.IndexOfName(const aname: WideString): Integer;
var
  mth: TMyJSONobjectmethod;
  i: Integer;
begin
  if not FUseHash then
    begin
      result := -1;
      for i := 0 to Count - 1 do
        begin
//          mth := TMyJSONobjectmethod(FValue[i]);
          mth := TMyJSONobjectmethod(fList.Items[i]);
          if mth.Name = aname then
            begin
              result := i;
              break;
            end;
        end;
    end
  else
    begin
      result := ht.IndexOf(aname);
    end;
end;

function TMyJSONobject.IndexOfObject(aobj: TMyJSONbase): Integer;
var
  mth: TMyJSONobjectmethod;
  i: Integer;
begin
  result := -1;
  for i := 0 to Count - 1 do
    begin
//      mth := TMyJSONobjectmethod(FValue[i]);
      mth := TMyJSONobjectmethod(fList.Items[i]);
      if mth.FValue = aobj then
        begin
          result := i;
          break;
        end;
    end;
end;

procedure TMyJSONobject.SetField(nm: string; const AValue:
  TMyJSONbase);
var
  mth: TMyJSONobjectmethod;
  i: Integer;
begin
  i := IndexOfName(nm);
  if i <> -1 then
    begin
//      mth := TMyJSONobjectmethod(FValue[i]);
      mth := TMyJSONobjectmethod(fList.Items[i]);
      mth.FValue := AValue;
    end;
end;

function TMyJSONobject.Add(const aname: WideString; nmb: double):
  Integer;
begin
  Result := self.Add(aname, TMyJSONnumber.Generate(nmb));
end;

function TMyJSONobject.Add(const aname: WideString; bool: Boolean):
  Integer;
begin
  Result := self.Add(aname, TMyJSONboolean.Generate(bool));
end;

function TMyJSONobject.Add(const aname: WideString; s: string):
  Integer;
begin
  Result := self.Add(aname, TMyJSONstring.Generate(s));
end;

function TMyJSONobject.Add(const aname: WideString; inmb: Integer):
  Integer;
begin
  Result := self.Add(aname, TMyJSONnumber.Generate(inmb));
end;

function TMyJSONobject.Add(const aname, ws: WideString): Integer;
begin
  Result := self.Add(aname, TMyJSONstring.Generate(ws));
end;

function TMyJSONObject.AddObject(const aname: WideString): TMyJSONObject;
begin
  Result := TMyJSONObject.Create;
  Add(aname, Result)
end;

class function TMyJSONobject.SelfType: TMyJSONtypes;
begin
  Result := jsObject;
end;

class function TMyJSONobject.SelfTypeName: string;
begin
  Result := 'jsObject';
end;

function TMyJSONobject.GetFieldByIndex(idx: Integer): TMyJSONbase;
var
  nm: WideString;
begin
  nm := GetNameOf(idx);
  if nm <> '' then
    begin
      result := Field[nm];
    end
  else
    begin
      result := nil;
    end;
end;

function TMyJSONobject.GetNameOf(idx: Integer): WideString;
var
  mth: TMyJSONobjectmethod;
begin
  if (idx < 0) or (idx >= Count) then
    begin
      result := '';
    end
  else
    begin
      mth := Child[idx] as TMyJSONobjectmethod;
      result := mth.Name;
    end;
end;

procedure TMyJSONobject.SetFieldByIndex(idx: Integer;
  const AValue: TMyJSONbase);
var
  nm: WideString;
begin
  nm := GetNameOf(idx);
  if nm <> '' then
    begin
      Field[nm] := AValue;
    end;
end;

function TMyJSONobject.ForEachElement(idx: Integer;
  var nm: string): TMyJSONbase;
begin
  nm := GetNameOf(idx);
  result := GetFieldByIndex(idx);
end;

{$IFDEF USE_HASH}
function TMyJSONobject.GetHashTable: TMyHashTable;
{$ELSE}
function TMyJSONobject.GetHashTable: TMyBalTree;
{$ENDIF USE_HASH}
begin
  result := ht;
end;

constructor TMyJSONobject.Create(bUseHash: Boolean);
begin
  inherited Create;
  FUseHash := bUseHash;
{$IFDEF USE_HASH}
  ht := TMyHashTable.Create;
{$ELSE}
  ht := TMyBalTree.Create;
{$ENDIF}
end;

destructor TMyJSONobject.Destroy;
begin
  if assigned(ht) then FreeAndNil(ht);
  inherited;
end;

function TMyJSONobject.getDouble(idx: Integer): Double;
var
  jn: TMyJSONnumber;
begin
  jn := FieldByIndex[idx] as TMyJSONnumber;
  if not assigned(jn) then result := 0
  else result := jn.Value;
end;

function TMyJSONobject.getInt(idx: Integer): Integer;
var
  jn: TMyJSONnumber;
begin
  jn := FieldByIndex[idx] as TMyJSONnumber;
  if not assigned(jn) then result := 0
  else result := round(int(jn.Value));
end;

function TMyJSONobject.getString(idx: Integer): string;
var
  js: TMyJSONstring;
begin
  js := FieldByIndex[idx] as TMyJSONstring;
  if not assigned(js) then result := ''
  else result := vartostr(js.Value);
end;

function TMyJSONobject.getWideString(idx: Integer): WideString;
var
  js: TMyJSONstring;
begin
  js := FieldByIndex[idx] as TMyJSONstring;
  if not assigned(js) then result := ''
  else result := VarToWideStr(js.Value);
end;

function TMyJSONobject.getDouble(nm: string): Double;
begin
  result := getDouble(IndexOfName(nm));
end;

function TMyJSONobject.getInt(nm: string): Integer;
begin
  result := getInt(IndexOfName(nm));
end;

function TMyJSONobject.getString(nm: string): string;
begin
  result := getString(IndexOfName(nm));
end;

function TMyJSONobject.getWideString(nm: string): WideString;
begin
  result := getWideString(IndexOfName(nm));
end;

function TMyJSONobject.getBoolean(idx: Integer): Boolean;
var
  jb: TMyJSONboolean;
begin
  jb := FieldByIndex[idx] as TMyJSONboolean;
  if not assigned(jb) then result := false
  else result := jb.Value;
end;

function TMyJSONobject.getBoolean(nm: string): Boolean;
begin
  result := getBoolean(IndexOfName(nm));
end;

function TMyJSONobject.getObject(idx: Integer): TMyJSONObject;
var
  jo: TMyJSONobject;
begin
  jo := FieldByIndex[idx] as TMyJSONobject;
  if not assigned(jo) then result := nil
  else result := jo;
end;

function TMyJSONobject.getObject(nm: string): TMyJSONObject;
begin
  Result := Field[nm] as TMyJSONObject;
end;

function TMyJSONobject.getList(nm: string): TMyJSONlist;
begin
  Result := Field[nm] as TMyJSONlist;
end;

{ TMyJSON }

class function TMyJSON.GenerateText(obj: TMyJSONbase): string;
var
{$IFDEF HAVE_FORMATSETTING}
  fs: TFormatSettings;
{$ENDIF}
  pt1, pt0, pt2: PAnsiChar;
  ptsz: cardinal;

{$IFNDEF NEW_STYLE_GENERATE}

  function gn_base(obj: TMyJSONbase): string;
  var
    ws: string;
    i, j: Integer;
    xs: TMyJSONstring;
  begin
    result := '';
    if not assigned(obj) then exit;
    if obj is TMyJSONnumber then
      begin
{$IFDEF HAVE_FORMATSETTING}
        result := FloatToStr(TMyJSONnumber(obj).FValue, fs);
{$ELSE}
        result := FloatToStr(TMyJSONnumber(obj).FValue);
        i := pos(DecimalSeparator, result);
        if (DecimalSeparator <> '.') and (i > 0) then
          result[i] := '.';
{$ENDIF}
      end
    else if obj is TMyJSONstring then
      begin
        ws := UTF8Encode(TMyJSONstring(obj).FValue);
        i := 1;
        result := '"';
        while i <= length(ws) do
          begin
            case ws[i] of
              '/', '\', '"': result := result + '\' + ws[i];
              #8: result := result + '\b';
              #9: result := result + '\t';
              #10: result := result + '\n';
              #13: result := result + '\r';
              #12: result := result + '\f';
            else
              if ord(ws[i]) < 32 then
                result := result + '\u' + inttohex(ord(ws[i]), 4)
              else
                result := result + ws[i];
            end;
            inc(i);
          end;
        result := result + '"';
      end
    else if obj is TMyJSONboolean then
      begin
        if TMyJSONboolean(obj).FValue then
          result := 'true'
        else
          result := 'false';
      end
    else if obj is TMyJSONnull then
      begin
        result := 'null';
      end
    else if obj is TMyJSONlist then
      begin
        result := '[';
        j := TMyJSONobject(obj).Count - 1;
        for i := 0 to j do
          begin
            if i > 0 then result := result + ',';
            result := result + gn_base(TMyJSONlist(obj).Child[i]);
          end;
        result := result + ']';
      end
    else if obj is TMyJSONobjectmethod then
      begin
        try
          xs := TMyJSONstring.Create;
          xs.FValue := TMyJSONobjectmethod(obj).FName;
          result := gn_base(TMyJSONbase(xs)) + ':';
          result := result +
            gn_base(TMyJSONbase(TMyJSONobjectmethod(obj).FValue));
        finally
          if assigned(xs) then FreeAndNil(xs);
        end;
      end
    else if obj is TMyJSONobject then
      begin
        result := '{';
        j := TMyJSONobject(obj).Count - 1;
        for i := 0 to j do
          begin
            if i > 0 then result := result + ',';
            result := result + gn_base(TMyJSONobject(obj).Child[i]);
          end;
        result := result + '}';
      end;
  end;
{$ELSE}

  procedure get_more_memory;
  var
    delta: Cardinal;
  begin
    delta := 20000;
    if pt0 = nil then
      begin
        pt0 := AllocMem(delta);
        ptsz := 0;
        pt1 := pt0;
      end
    else
      begin
        ReallocMem(pt0, ptsz + delta);
        pt1 := pointer(cardinal(pt0) + ptsz);
      end;
    ptsz := ptsz + delta;
    pt2 := pointer(cardinal(pt1) + delta);
  end;

  procedure mem_ch(ch: Ansichar);
  begin
    if pt1 >= pt2 then get_more_memory;
    pt1^ := ch;
    inc(pt1);
  end;

  procedure mem_write(rs: AnsiString);
  var
    i: Integer;
  begin
    for i := 1 to length(rs) do
      begin
        if pt1 >= pt2 then get_more_memory;
        pt1^ := rs[i];
        inc(pt1);
      end;
  end;

  procedure gn_base(obj: TMyJSONbase);
  var
    ws: AnsiString;
    i, j: Integer;
    xs: TMyJSONstring;
  begin
    if not assigned(obj) then exit;
    if obj is TMyJSONnumber then
      begin
{$IFDEF HAVE_FORMATSETTING}
        mem_write(AnsiString(FloatToStr(TMyJSONnumber(obj).FValue, fs)));
{$ELSE}
        ws := FloatToStr(TMyJSONnumber(obj).FValue);
        i := pos(DecimalSeparator, ws);
        if (DecimalSeparator <> '.') and (i > 0) then ws[i] := '.';
        mem_write(ws);
{$ENDIF}
      end
    else if obj is TMyJSONstring then
      begin
        ws := UTF8Encode(TMyJSONstring(obj).FValue);
        i := 1;
        mem_ch('"');
        while i <= length(ws) do
          begin
            case ws[i] of
              '/', '\', '"':
                begin
                  mem_ch('\');
                  mem_ch(ws[i]);
                end;
              #8: mem_write('\b');
              #9: mem_write('\t');
              #10: mem_write('\n');
              #13: mem_write('\r');
              #12: mem_write('\f');
            else
              if ord(ws[i]) < 32 then
                mem_write('\u' + AnsiString(inttohex(ord(ws[i]), 4)))
              else
                mem_ch(ws[i]);
            end;
            inc(i);
          end;
        mem_ch('"');
      end
    else if obj is TMyJSONboolean then
      begin
        if TMyJSONboolean(obj).FValue then
          mem_write('true')
        else
          mem_write('false');
      end
    else if obj is TMyJSONnull then
      begin
        mem_write('null');
      end
    else if obj is TMyJSONlist then
      begin
        mem_ch('[');
        j := TMyJSONobject(obj).Count - 1;
        for i := 0 to j do
          begin
            if i > 0 then mem_ch(',');
            gn_base(TMyJSONlist(obj).Child[i]);
          end;
        mem_ch(']');
      end
    else if obj is TMyJSONobjectmethod then
      begin
        try
          xs := TMyJSONstring.Create;
          xs.FValue := TMyJSONobjectmethod(obj).FName;
          gn_base(TMyJSONbase(xs));
          mem_ch(':');
          gn_base(TMyJSONbase(TMyJSONobjectmethod(obj).FValue));
        finally
          if assigned(xs) then FreeAndNil(xs);
        end;
      end
    else if obj is TMyJSONobject then
      begin
        mem_ch('{');
        j := TMyJSONobject(obj).Count - 1;
        for i := 0 to j do
          begin
            if i > 0 then mem_ch(',');
            gn_base(TMyJSONobject(obj).Child[i]);
          end;
        mem_ch('}');
      end;
  end;
{$ENDIF NEW_STYLE_GENERATE}

begin
{$IFDEF HAVE_FORMATSETTING}
  {$if CompilerVersion >= 22}
  fs := TFormatSettings.Create(GetThreadLocale);
  {$else}
  GetLocaleFormatSettings(GetThreadLocale, fs);
  {$ifend}
  fs.DecimalSeparator := '.';
{$ENDIF}
{$IFDEF NEW_STYLE_GENERATE}
  pt0 := nil;
  get_more_memory;
  gn_base(obj);
  mem_ch(#0);
  result := string(pt0);
  freemem(pt0);
{$ELSE}
  result := gn_base(obj);
{$ENDIF}
end;

class function TMyJSON.ParseText(const txt: string): TMyJSONbase;
{$IFDEF HAVE_FORMATSETTING}
var
  fs: TFormatSettings;
{$ENDIF}

  function js_base(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean; forward;

  function xe(idx: Integer): Boolean;
  {$IFDEF FPC}inline;
  {$ENDIF}
  begin
    result := idx <= length(txt);
  end;

  procedure skip_spc(var idx: Integer);
  {$IFDEF FPC}inline;
  {$ENDIF}
  begin
    while (xe(idx)) and (ord(txt[idx]) < 33) do
      inc(idx);
  end;

  procedure add_child(var o, c: TMyJSONbase);
  var
    i: Integer;
  begin
    if o = nil then
      begin
        o := c;
      end
    else
      begin
        if o is TMyJSONobjectmethod then
          begin
            TMyJSONobjectmethod(o).FValue := c;
          end
        else if o is TMyJSONlist then
          begin
            TMyJSONlist(o)._Add(c);
          end
        else if o is TMyJSONobject then
          begin
            i := TMyJSONobject(o)._Add(c);
            if TMyJSONobject(o).UseHash then
{$IFDEF USE_HASH}
              TMyJSONobject(o).ht.AddPair(TMyJSONobjectmethod(c).Name, i);
{$ELSE}
              TMyJSONobject(o).ht.Insert(TMyJSONobjectmethod(c).Name, i);
{$ENDIF USE_HASH}
          end;
      end;
  end;

  function js_boolean(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    js: TMyJSONboolean;
  begin
    skip_spc(idx);
    if copy(txt, idx, 4) = 'true' then
      begin
        result := true;
        ridx := idx + 4;
        js := TMyJSONboolean.Create;
        js.FValue := true;
        add_child(o, TMyJSONbase(js));
      end
    else if copy(txt, idx, 5) = 'false' then
      begin
        result := true;
        ridx := idx + 5;
        js := TMyJSONboolean.Create;
        js.FValue := false;
        add_child(o, TMyJSONbase(js));
      end
    else
      begin
        result := false;
      end;
  end;

  function js_null(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    js: TMyJSONnull;
  begin
    skip_spc(idx);
    if copy(txt, idx, 4) = 'null' then
      begin
        result := true;
        ridx := idx + 4;
        js := TMyJSONnull.Create;
        add_child(o, TMyJSONbase(js));
      end
    else
      begin
        result := false;
      end;
  end;

  function js_integer(idx: Integer; var ridx: Integer): Boolean;
  begin
    result := false;
    while (xe(idx)) and CharInSet(txt[idx], ['0'..'9']) do
      begin
        result := true;
        inc(idx);
      end;
    if result then ridx := idx;
  end;

  function js_number(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    js: TMyJSONnumber;
    ws: string;
  {$IFNDEF HAVE_FORMATSETTING}
    i: Integer;
  {$ENDIF}
  begin
    skip_spc(idx);
    result := xe(idx);
    if not result then exit;
    if CharInSet(txt[idx], ['+', '-']) then
      begin
        inc(idx);
        result := xe(idx);
      end;
    if not result then exit;
    result := js_integer(idx, idx);
    if not result then exit;
    if (xe(idx)) and (txt[idx] = '.') then
      begin
        inc(idx);
        result := js_integer(idx, idx);
        if not result then exit;
      end;
    if (xe(idx)) and CharInSet(txt[idx], ['e', 'E']) then
      begin
        inc(idx);
        if (xe(idx)) and CharInSet(txt[idx], ['+', '-']) then inc(idx);
        result := js_integer(idx, idx);
        if not result then exit;
      end;
    if not result then exit;
    js := TMyJSONnumber.Create;
    ws := copy(txt, ridx, idx - ridx);
{$IFDEF HAVE_FORMATSETTING}
    js.FValue := StrToFloat(ws, fs);
{$ELSE}
    i := pos('.', ws);
    if (DecimalSeparator <> '.') and (i > 0) then
      ws[pos('.', ws)] := DecimalSeparator;
    js.FValue := StrToFloat(ws);
{$ENDIF}
    add_child(o, TMyJSONbase(js));
    ridx := idx;
  end;

  function js_string(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    js: TMyJSONstring;
    fin: Boolean;
    //ws: WideString;
    ws: RawByteString;
  begin
    skip_spc(idx);
    ws := '';
    result := xe(idx);
    if not result then exit;
    result := txt[idx] = '"';
    if not result then exit;
    inc(idx);
    result := false;
    repeat
      fin := not xe(idx);
      if not fin then
        begin
          if txt[idx] = '\' then
            begin
              inc(idx);
              if not xe(idx) then exit;
              case txt[idx] of
                '\': ws := ws + '\';
                '"': ws := ws + '"'; //Deve ficar Aspas Duplas (") para não alterar o texto recebido. (08/04/2013 - Feito por: Efraim, Revisado por: Fred/Marcos Rodrigues)
                '/': ws := ws + '/';
                'b': ws := ws + #8;
                'f': ws := ws + #12;
                'n': ws := ws + #10;
                'r': ws := ws + #13;
                't': ws := ws + #9;
                'u':
                  begin
//                    ws := ws + widechar(strtoint('$' +
//                      copy(txt, idx + 1, 4)));
                    ws := ws + code2utf(strtoint('$' + copy(txt, idx
                      + 1, 4)));
                    idx := idx + 4;
                  end;
              end;
            end
          else if txt[idx] <> '"' then
            begin
              ws := ws + AnsiString(txt[idx]);
            end
          else
            begin
              fin := true;
              result := true;
            end;
          inc(idx);
        end;
    until fin;
    if not result then exit;
    js := TMyJSONstring.Create;
    js.FValue := UTF8ToString(ws);
    add_child(o, TMyJSONbase(js));
    ridx := idx;
  end;

  function js_list(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    js: TMyJSONlist;
  begin
    result := false;
    try
      js := TMyJSONlist.Create;
      skip_spc(idx);
      result := xe(idx);
      if not result then exit;
      result := txt[idx] = '[';
      if not result then exit;
      inc(idx);
      while js_base(idx, idx, TMyJSONbase(js)) do
        begin
          skip_spc(idx);
          if (xe(idx)) and (txt[idx] = ',') then inc(idx);
        end;
      result := (xe(idx)) and (txt[idx] = ']');
      if not result then exit;
      inc(idx);
    finally
      if not result then
        begin
          js.Free;
        end
      else
        begin
          add_child(o, TMyJSONbase(js));
          ridx := idx;
        end;
    end;
  end;

  function js_method(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    mth: TMyJSONobjectmethod;
    ws: TMyJSONstring;
  begin
    result := false;
    try
      ws := nil;
      mth := TMyJSONobjectmethod.Create;
      skip_spc(idx);
      result := xe(idx);
      if not result then exit;
      result := js_string(idx, idx, TMyJSONbase(ws));
      if not result then exit;
      skip_spc(idx);
      result := xe(idx) and (txt[idx] = ':');
      if not result then exit;
      inc(idx);
      mth.FName := ws.FValue;
      result := js_base(idx, idx, TMyJSONbase(mth));
    finally
      if ws <> nil then ws.Free;
      if result then
        begin
          add_child(o, TMyJSONbase(mth));
          ridx := idx;
        end
      else
        begin
          mth.Free;
        end;
    end;
  end;

  function js_object(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  var
    js: TMyJSONobject;
  begin
    result := false;
    try
      js := TMyJSONobject.Create;
      skip_spc(idx);
      result := xe(idx);
      if not result then exit;
      result := txt[idx] = '{';
      if not result then exit;
      inc(idx);
      while js_method(idx, idx, TMyJSONbase(js)) do
        begin
          skip_spc(idx);
          if (xe(idx)) and (txt[idx] = ',') then inc(idx);
        end;
      result := (xe(idx)) and (txt[idx] = '}');
      if not result then exit;
      inc(idx);
    finally
      if not result then
        begin
          js.Free;
        end
      else
        begin
          add_child(o, TMyJSONbase(js));
          ridx := idx;
        end;
    end;
  end;

  function js_base(idx: Integer; var ridx: Integer; var o:
    TMyJSONbase): Boolean;
  begin
    skip_spc(idx);
    result := js_boolean(idx, idx, o);
    if not result then result := js_null(idx, idx, o);
    if not result then result := js_number(idx, idx, o);
    if not result then result := js_string(idx, idx, o);
    if not result then result := js_list(idx, idx, o);
    if not result then result := js_object(idx, idx, o);
    if result then ridx := idx;
  end;

var
  idx: Integer;
begin
{$IFDEF HAVE_FORMATSETTING}
  {$if CompilerVersion >= 22}
  fs := TFormatSettings.Create(GetThreadLocale);
  {$else}
  GetLocaleFormatSettings(GetThreadLocale, fs);
  {$ifend}
  fs.DecimalSeparator := '.';
{$ENDIF}

  result := nil;
  if txt = '' then exit;
  try
    idx := 1;
    if not js_base(idx, idx, result) then FreeAndNil(result);
  except
    if assigned(result) then FreeAndNil(result);
  end;
end;

{ ElkIntException }

constructor ElkIntException.Create(idx: Integer; msg: string);
begin
  self.idx := idx;
  inherited Create(msg);
end;

{ TMyHashTable }

{$IFDEF USE_HASH}
procedure TMyHashTable.AddPair(const ws: WideString; idx: Integer);
var
  i, j, k: cardinal;
  p, p2: PlkHashItem;
begin
  if InTable(ws, i, j, k) then
    begin
// if string is already in table, changing index
//      a_h[j, k].index := idx;
      PlkHashItem(a_x[j].Items[k])^.index := idx;
    end
  else
    begin
//      k := length(a_h[j]);
//      SetLength(a_h[j], k + 1);
//      a_h[j, k].hash := i;
//      a_h[j, k].index := idx;
//// sorting array of hashes
//      while (k > 0) and (a_h[j, k].hash < a_h[j, k - 1].hash) do
//        begin
//          hswap(j, k, k - 1);
//          dec(k);
//        end;
//--- new version
      GetMem(p, sizeof(TMyHashItem));
      k := a_x[j].Add(p);
      p^.hash := i;
      p^.index := idx;
      while (k > 0) and (PlkHashItem(a_x[j].Items[k])^.hash <
        PlkHashItem(a_x[j].Items[k - 1])^.hash) do
        begin
          a_x[j].Exchange(k, k - 1);
          dec(k);
        end;
    end;
end;

function TMyHashTable.counters: string;
var
  i, j: Integer;
  ws: string;
begin
  ws := '';
  for i := 0 to 15 do
    begin
      for j := 0 to 15 do
//        ws := ws + format('%.3d ', [length(a_h[i * 16 + j])]);
        ws := ws + format('%.3d ', [a_x[i * 16 + j].Count]);
      ws := ws + #13#10;
    end;
  result := ws;
end;

procedure TMyHashTable.Delete(const ws: WideString);
var
  i, j, k: cardinal;
begin
  if InTable(ws, i, j, k) then
    begin
//      while k < high(a_h[j]) do
//        begin
//          hswap(j, k, k + 1);
//          inc(k);
//        end;
//      SetLength(a_h[j], k);
      FreeMem(a_x[j].Items[k]);
      a_x[j].Delete(k);
    end;
end;

{$IFDEF THREADSAFE}
const
  rnd_table: array[0..255] of byte =
  (216, 191, 234, 201, 12, 163, 190, 205, 128, 199, 210, 17, 52, 43,
    38, 149, 40, 207, 186, 89, 92, 179, 142, 93, 208, 215, 162,
    161, 132, 59, 246, 37, 120, 223, 138, 233, 172, 195, 94, 237, 32,
    231, 114, 49, 212, 75, 198, 181, 200, 239, 90, 121, 252, 211,
    46, 125, 112, 247, 66, 193, 36, 91, 150, 69, 24, 255, 42, 9, 76,
    227, 254, 13, 192, 7, 18, 81, 116, 107, 102, 213, 104, 15, 250,
    153, 156, 243, 206, 157, 16, 23, 226, 225, 196, 123, 54, 101,
    184, 31, 202, 41, 236, 3, 158, 45, 96, 39, 178, 113, 20, 139, 6,
    245, 8, 47, 154, 185, 60, 19, 110, 189, 176, 55, 130, 1, 100,
    155, 214, 133, 88, 63, 106, 73, 140, 35, 62, 77, 0, 71, 82, 145,
    180,
    171, 166, 21, 168, 79, 58, 217, 220, 51, 14, 221, 80, 87, 34, 33,
    4, 187, 118, 165, 248, 95, 10, 105, 44, 67, 222, 109, 160, 103,
    242, 177, 84, 203, 70, 53, 72, 111, 218, 249, 124, 83, 174, 253,
    240, 119, 194, 65, 164, 219, 22, 197, 152, 127, 170, 137, 204,
    99, 126, 141, 64, 135, 146, 209, 244, 235, 230, 85, 232, 143,
    122, 25, 28, 115, 78, 29, 144, 151, 98, 97, 68, 251, 182, 229,
    56,
    159, 74, 169, 108, 131, 30, 173, 224, 167, 50, 241, 148, 11, 134,
    117, 136, 175, 26, 57, 188, 147, 238, 61, 48, 183, 2, 129,
    228, 27, 86, 5);
{$ELSE}
var
  rnd_table: array[0..255] of byte;
{$ENDIF}

function TMyHashTable.DefaultHashOf(const ws: WideString): cardinal;
{$IFDEF DOTNET}
var
  i, j: Integer;
  x1, x2, x3, x4: byte;
begin
  result := 0;
//  result := 0;
  x1 := 0;
  x2 := 1;
  for i := 1 to length(ws) do
    begin
      j := ord(ws[i]);
// first version of hashing
      x1 := (x1 + j) {and $FF};
      x2 := (x2 + 1 + (j shr 8)) {and $FF};
      x3 := rnd_table[x1];
      x4 := rnd_table[x3];
      result := ((x1 * x4) + (x2 * x3)) xor result;
    end;
end;
{$ELSE}
var
  x1, x2, x3, x4: byte;
  p: PWideChar;
begin
  result := 0;
  x1 := 0;
  x2 := 1;
  p := PWideChar(ws);
  while p^ <> #0 do
    begin
      inc(x1, ord(p^)) {and $FF};
      inc(x2, 1 + (ord(p^) shr 8)) {and $FF};
      x3 := rnd_table[x1];
      x4 := rnd_table[x3];
      result := ((x1 * x4) + (x2 * x3)) xor result;
      inc(p);
    end;
end;
{$ENDIF}

procedure TMyHashTable.hswap(j, k, l: Integer);
var
  h: TMyHashItem;
begin
//  h := a_h[j, k];
//  a_h[j, k] := a_h[j, l];
//  a_h[j, l] := h;
  a_x[j].Exchange(k, l);
end;

function TMyHashTable.IndexOf(const ws: WideString): Integer;
var
  i, j, k: Cardinal;
begin
  if not InTable(ws, i, j, k) then
    begin
      result := -1;
    end
  else
    begin
//      result := a_h[j, k].index;
      result := PlkHashItem(a_x[j].Items[k])^.index;
    end;
end;

function TMyHashTable.InTable(const ws: WideString; var i, j, k:
  cardinal):
  Boolean;
var
  l, wu, wl: Integer;
  x: Cardinal;
  fin: Boolean;
begin
  i := HashOf(ws);
  j := i and $FF;
  result := false;
//  if length(a_h[j]) < 25 then
  if a_x[j].Count < 25 then
    begin
//// for small array use linear search
//      for l := 0 to high(a_h[j]) do
//        if a_h[j, l].hash = i then
//          begin
//            k := l;
//            result := true;
//            break;
//          end;
      for l := 0 to a_x[j].Count - 1 do
        if PlkHashItem(a_x[j].Items[l])^.hash = i then
          begin
            k := l;
            result := true;
            break;
          end;
    end
  else
    begin
// for larger array use "binary" search, becouse array is sorted
//      wl := low(a_h[j]);
//      wu := high(a_h[j]);
      wl := 0;
      wu := a_x[j].Count - 1;
      repeat
        fin := true;
        if PlkHashItem(a_x[j].Items[wl])^.hash = i then
          begin
            k := wl;
            result := true;
          end
        else if PlkHashItem(a_x[j].Items[wu])^.hash = i then
          begin
            k := wu;
            result := true;
          end
        else if (wu - wl) > 1 then
          begin
            fin := false;
            x := (wl + wu) shr 1;
            if PlkHashItem(a_x[j].Items[x])^.hash > i then
              begin
                wu := x;
              end
            else
              begin
                wl := x;
              end;
          end;
      until fin;
    end;
end;
{$IFNDEF THREADSAFE}

procedure init_rnd;
var
  x0: Integer;
  i: Integer;
begin
  x0 := 5;
  for i := 0 to 255 do
    begin
      x0 := (x0 * 29 + 71) and $FF;
      rnd_table[i] := x0;
    end;
end;
{$ENDIF}

procedure TMyHashTable.SetHashFunction(const AValue:
  TMyHashFunction);
begin
  FHashFunction := AValue;
end;

constructor TMyHashTable.Create;
var
  i: Integer;
begin
  inherited;
//  for i := 0 to 255 do SetLength(a_h[i], 0);
  for i := 0 to 255 do a_x[i] := TList.Create;
  HashOf := {$IFDEF FPC}@{$ENDIF}DefaultHashOf;
end;

destructor TMyHashTable.Destroy;
var
  i, j: Integer;
begin
//  for i := 0 to 255 do SetLength(a_h[i], 0);
  for i := 0 to 255 do
    begin
      for j := 0 to a_x[i].Count - 1 do Freemem(a_x[i].Items[j]);
      a_x[i].Free;
    end;
  inherited;
end;

function TMyHashTable.SimpleHashOf(const ws: WideString): cardinal;
var
  i: Integer;
begin
  result := length(ws);
  for i := 1 to length(ws) do result := result + ord(ws[i]);
end;
{$ENDIF USE_HASH}

{ TMyJSONstreamed }
{$IFNDEF KOL}

class function TMyJSONstreamed.LoadFromFile(srcname: string):
  TMyJSONbase;
var
  fs: TFileStream;
begin
  result := nil;
  if not FileExists(srcname) then exit;
  try
    fs := TFileStream.Create(srcname, fmOpenRead);
    result := LoadFromStream(fs);
  finally
    if Assigned(fs) then FreeAndNil(fs);
  end;
end;

class function TMyJSONstreamed.LoadFromStream(src: TStream):
  TMyJSONbase;
var
  ws: string;
  len: int64;
begin
  result := nil;
  if not assigned(src) then exit;
  len := src.Size - src.Position;
  SetLength(ws, len);
  src.Read(pchar(ws)^, len);
  result := ParseText(ws);
end;

class procedure TMyJSONstreamed.SaveToFile(obj: TMyJSONbase;
  dstname: string);
var
  fs: TFileStream;
begin
  if not assigned(obj) then exit;
  try
    fs := TFileStream.Create(dstname, fmCreate);
    SaveToStream(obj, fs);
  finally
    if Assigned(fs) then FreeAndNil(fs);
  end;
end;

class procedure TMyJSONstreamed.SaveToStream(obj: TMyJSONbase;
  dst: TStream);
var
  ws: string;
begin
  if not assigned(obj) then exit;
  if not assigned(dst) then exit;
  ws := GenerateText(obj);
  dst.Write(pchar(ws)^, length(ws));
end;

{$ENDIF}

{ TMyJSONdotnetclass }

{$IFDEF DOTNET}

procedure TMyJSONdotnetclass.AfterConstruction;
begin

end;

procedure TMyJSONdotnetclass.BeforeDestruction;
begin

end;

constructor TMyJSONdotnetclass.Create;
begin
  inherited;
  AfterConstruction;
end;

destructor TMyJSONdotnetclass.Destroy;
begin
  BeforeDestruction;
  inherited;
end;
{$ENDIF DOTNET}

{ TMyBalTree }

{$IFNDEF USE_HASH}
procedure TMyBalTree.Clear;

  procedure rec(t: PlkBalNode);
  begin
    if t.left <> fbottom then rec(t.left);
    if t.right <> fbottom then rec(t.right);
    t.nm := '';
    dispose(t);
  end;

begin
  if froot <> fbottom then rec(froot);
  froot := fbottom;
  fdeleted := fbottom;
end;

function TMyBalTree.counters: string;
begin
  result := format('Balanced tree root node level is %d',[froot.level]);
end;

constructor TMyBalTree.Create;
begin
  inherited Create;
  new(fbottom);
  fbottom.left := fbottom;
  fbottom.right := fbottom;
  fbottom.level := 0;
  fdeleted := fbottom;
  froot := fbottom;
end;

function TMyBalTree.Delete(const ws: WideString): Boolean;

  function del(var t: PlkBalNode): Boolean;
  begin
    result := false;
    if t<>fbottom then
      begin
        flast := t;
        if ws<t.nm then
          result := del(t.left)
        else
          begin
            fdeleted := t;
            result := del(t.right);
          end;
        if (t = flast) and (fdeleted<>fbottom) and (ws = t.nm) then
          begin
            fdeleted.key := t.key;
            fdeleted.nm := t.nm;
            t := t.right;
            flast.nm := '';
            dispose(flast);
            result := true;
          end
        else if (t.left.level<(t.level-1)) or (t.right.level<(t.level-1)) then
          begin
            t.level := t.level-1;
            if t.right.level>t.level then t.right.level := t.level;
            skew(t);
            skew(t.right);
            skew(t.right.right);
            split(t);
            split(t.right);
          end;
      end;
  end;

begin
  result := del(froot);
end;

destructor TMyBalTree.Destroy;
begin
  Clear;
  dispose(fbottom);
  inherited;
end;

function TMyBalTree.IndexOf(const ws: WideString): Integer;
var
  tk: PlkBalNode;
begin
  result := -1;
  tk := froot;
  while (result=-1) and (tk<>fbottom) do
    begin
      if tk.nm = ws then result := tk.key
      else if ws<tk.nm then tk := tk.left
      else tk := tk.right;
    end;
end;

function TMyBalTree.Insert(const ws: WideString; x: Integer): Boolean;

  function ins(var t: PlkBalNode): Boolean;
  begin
    if t = fbottom then
      begin
        new(t);
        t.key := x;
        t.nm := ws;
        t.left := fbottom;
        t.right := fbottom;
        t.level := 1;
        result := true;
      end
    else
      begin
        if ws < t.nm then
          result := ins(t.left)
        else if ws > t.nm then
          result := ins(t.right)
        else result := false;
        skew(t);
        split(t);
      end;
  end;

begin
  result := ins(froot);
end;

procedure TMyBalTree.skew(var t: PlkBalNode);
var
  temp: PlkBalNode;
begin
  if t.left.level = t.level then
    begin
      temp := t;
      t := t.left;
      temp.left := t.right;
      t.right := temp;
    end;
end;

procedure TMyBalTree.split(var t: PlkBalNode);
var
  temp: PlkBalNode;
begin
  if t.right.right.level = t.level then
    begin
      temp := t;
      t := t.right;
      temp.right := t.left;
      t.left := temp;
      t.level := t.level+1;
    end;
end;
{$ENDIF USE_HASH}

initialization
{$IFNDEF THREADSAFE}
{$IFDEF USE_HASH}
  init_rnd;
{$ENDIF USE_HASH}
{$ENDIF THREADSAFE}

end.

