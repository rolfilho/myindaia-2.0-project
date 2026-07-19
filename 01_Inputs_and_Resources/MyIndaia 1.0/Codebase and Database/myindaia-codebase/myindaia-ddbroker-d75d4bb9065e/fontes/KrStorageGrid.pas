unit KrStorageGrid;

interface

uses Classes, cxGridDBTableView, cxGridCustomView;

(*type
  TStorageGrid = class
  private
    procedure InternalStoreTo(AWriter: TcxCustomWriter; const ADefaultObjectName: string);
    procedure BeginWrite;
    procedure BeginWriteObject(const AObjectName, AClassName: string);
    function EncodeString(const S: string): string;
    procedure EndWrite;
    procedure WriteProperty(const AObjectName, AClassName, AName: string;
      AValue: Variant);
  public
    function GetLeiaute(cxGridDBTableView: TcxGridDBTableView): string;
    constructor Create(const AStorageName: string; AStream: TStream;
      AReCreate: Boolean);
  end;

implementation

procedure TStorageGrid.InternalStoreTo(AWriter: TcxCustomWriter; const ADefaultObjectName: string);
var
  AProperties: TStringList;
  AStorage: TcxStorage;
  I: Integer;
  AObjectFullName: string;
  AObjectName: string;
  APropertyValue: Variant;
  AChildren: TStringList;
begin
  AProperties := TStringList.Create;
  try
    if ADefaultObjectName <> '' then
      AObjectName := ADefaultObjectName
    else
      AObjectName := GetObjectName(nil);
    if FNamePrefix <> '' then
      AObjectName := FNamePrefix + '.' + AObjectName;

    AObjectFullName := FObjectNamePrefix + AObjectName;
    AWriter.BeginWriteObject(AObjectFullName, FStoredObject.ClassName);

    GetProperties(AProperties);
    for I := 0 to AProperties.Count - 1 do
    begin
      APropertyValue := GetPropertyValue(AProperties[I]);
      if not (VarIsEmpty(APropertyValue) or VarIsNull(APropertyValue)) then
        AWriter.WriteProperty(AObjectFullName, FStoredObject.ClassName, AProperties[I], APropertyValue);
    end;

    AChildren := TStringList.Create;
    try
      GetChildren(AChildren);
      for I := 0 to AChildren.Count - 1 do
      begin
        AStorage := TcxStorage.Create('');
        AStorage.FObjectNamePrefix := AObjectFullName + '/';
        AStorage.FNamePrefix := '';
        AStorage.FStoredObject := AChildren.Objects[I];
        AStorage.OnTestClassProperty := FOnTestClassProperty;
        AStorage.OnGetComponentByName := FOnGetComponentByName;
        AStorage.Modes := Modes;
        AStorage.SaveComponentPropertiesByName := FSaveComponentPropertiesByName;
        try
          AStorage.InternalStoreTo(AWriter, AChildren[I]);
        finally
          AStorage.Free;
        end;
      end;
    finally
      AChildren.Free;
    end;
    AWriter.EndWriteObject(AObjectFullName, FStoredObject.ClassName);
  finally
    AProperties.Free;
  end;
end;

constructor TStorageGrid.Create(const AStorageName: string; AStream: TStream; AReCreate: Boolean = True);
begin
  //inherited Create(AStorageName, AStream, AReCreate);

  FIniFile := TMemIniFile.Create(AStorageName);
  {$IFDEF DELPHI12}FIniFile.Encoding := TEncoding.UTF8;{$ENDIF}
  if FReCreate then
    FIniFile.Clear;
  FIniFile.CaseSensitive := False;
end;

procedure TStorageGrid.BeginWriteObject(const AObjectName, AClassName: string);
begin
  IniFile.WriteString(AObjectName + ': ' + AClassName, '', '');
end;

procedure TStorageGrid.WriteProperty(const AObjectName, AClassName, AName: string;
  AValue: Variant);
var
  ASectionName: string;
begin
  ASectionName := AObjectName + ': ' + AClassName;
  case VarType(AValue) of
    varShortInt, varWord, varLongWord, varInt64,
    varSmallInt, varInteger, varByte:
      IniFile.WriteInteger(ASectionName, AName, AValue);
    varSingle, varDouble, varCurrency:
      IniFile.WriteFloat(ASectionName, AName, AValue);
  {$IFDEF DELPHI12}
    varUString,
  {$ENDIF}
    varString, varOleStr:
      IniFile.WriteString(ASectionName, AName, EncodeString(AValue));
    varDate:
      IniFile.WriteDateTime(ASectionName, AName, AValue);
  end;
end;

const
  cxIniFileStorageVersion = 2;

procedure TStorageGrid.BeginWrite;
begin
  IniFile.WriteInteger('Main', 'Version', cxIniFileStorageVersion);
end;

procedure TStorageGrid.EndWrite;
begin
  IniFile.UpdateFile;
end;

function TStorageGrid.EncodeString(const S: string): string;
begin
  Result := StringReplace(S, '\', '\\', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '\n', [rfReplaceAll]);
  Result := StringReplace(Result, #9, '\t', [rfReplaceAll]);
  Result := cxQuotedStr(Result);
end;

function TStorageGrid.GetLeiaute(
  cxGridDBTableView: TcxGridDBTableView): string;
begin

end;

*)

type
  TcxXMLReader = class
  private
    procedure BeginRead;
    procedure EndRead;
    procedure ReadChildren(const AObjectName, AClassName: string; AChildrenNames, AChildrenClassNames: TStrings);
    procedure ReadProperties(const AObjectName, AClassName: string; AProperties: TStrings);
    function ReadProperty(const AObjectName, AClassName, AName: string): Variant;
  public
    constructor Create(const AStorageName: string; AStorageStream: TStream);
    destructor Destroy;
  end;

  TcxXMLWriter = class
  private
    procedure BeginWrite;
    procedure EndWrite;
    procedure BeginWriteObject(const AObjectName, AClassName: string);
    procedure WriteProperty(const AObjectName, AClassName, AName: string; AValue: Variant);
  public
    constructor Create(const AStorageName: string; AStream: TStream; AReCreate: Boolean);
    destructor Destroy;
  end;

  TcxGridDBBandedTableViewXMLStore = class
  private
  public
    procedure StoreToXML(AStream: TStream; AOptions: TcxGridStorageOptions; const ASaveViewName, AOwnerName: string);
    procedure RestoreFromXML(AStream: TStream; AChildrenCreating, AChildrenDeleting: Boolean;
              AOptions: TcxGridStorageOptions; const ARestoreViewName, AOwnerName: string);
  end;

function GetGridStorage(GridView: TcxGridDBBandedTableView) : string;
var
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create;
  TcxGridDBBandedTableViewXMLStore(GridView).StoreToXML(StrStream, [gsoUseFilter]);
  result := StrStream.DataString;
  StrStream.Free;
end;

procedure SetGridStorageEx(const Value: string; GridView: TcxGridDBBandedTableView);
var
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create(Value);
  StrStream.Position := 0;
  TcxGridDBBandedTableViewXMLStore(GridView).RestoreFromXML(StrStream, True, False, [gsoUseFilter]);
  StrStream.Free;
end;

{ TcxXMLReader }

procedure TcxXMLReader.BeginRead;
begin
  inherited;
  if FXMLDoc.ChildNodes.Count < 1 then
    raise Exception.Create('Wrong XML format for Grid Storage');
  AParentNode := FXMLDoc.ChildNodes[0];
end;

constructor TcxXMLReader.Create(const AStorageName: string;
  AStorageStream: TStream);
begin
  inherited Create(AStorageName, AStorageStream);

  if AStorageStream is TStringStream then
    FXMLDoc := LoadXMLData(TStringStream(AStorageStream).DataString)
  else
  begin
    FXMLDoc := TXMLDocument.Create(nil);
    FXMLDoc.LoadFromStream(StorageStream);
  end;
end;

destructor TcxXMLReader.Destroy;
begin
  inherited;
end;

procedure TcxXMLReader.EndRead;
begin
  inherited;
end;

procedure ExtractObjectFullName(const AObjectFullName: string; AParents: TStrings; var AObjectName: string);
var
  I: Integer;
  AName: string;
begin
  if AParents <> nil then
  begin
    AObjectName := '';
    AName := '';
    for I := 1 to Length(AObjectFullName) do
    begin
      if AObjectFullName[I] = '/' then
      begin
        AParents.Add(AName);
        AName := '';
      end
      else
        AName := AName + AObjectFullName[I];
    end;
    AObjectName := AName;
  end;
end;

procedure TcxXMLReader.ReadChildren(const AObjectName, AClassName: string;
  AChildrenNames, AChildrenClassNames: TStrings);
var
  i: integer;
begin
  inherited;
  if Assigned(ACurrentNode) then
    for i := 0 to ACurrentNode.ChildNodes.Count - 1 do
    begin
      if ACurrentNode.ChildNodes[i].ChildNodes.Count > 0 then
      begin
        AChildrenNames.Add(ACurrentNode.ChildNodes[i].NodeName);
        AChildrenClassNames.Add(ACurrentNode.ChildNodes[i].Attributes['ClassName']);
      end;
    end;
end;

procedure TcxXMLReader.ReadProperties(const AObjectName, AClassName: string;
  AProperties: TStrings);
var
  i: integer;
  AParents: TStrings;
  AName: string;
begin
  inherited;
  AParents := TStringList.Create;
  try
    ExtractObjectFullName(AObjectName, AParents, AName);
    ACurrentNode := AParentNode;
    for i := 0 to AParents.Count - 1 do
    begin
      if Assigned(ACurrentNode.ChildNodes.FindNode(AParents[i])) then
        ACurrentNode := ACurrentNode.ChildNodes.FindNode(AParents[i]);
    end;
  finally
    AParents.Free;
  end;
  ACurrentNode := ACurrentNode.ChildNodes.FindNode(AName);
  if Assigned(ACurrentNode) then
    for i := 0 to ACurrentNode.ChildNodes.Count - 1 do
    begin
      if ACurrentNode.ChildNodes[i].ChildNodes.Count = 0 then
        AProperties.Add(ACurrentNode.ChildNodes[i].NodeName);
    end;
end;

function TcxXMLReader.ReadProperty(const AObjectName, AClassName,
  AName: string): Variant;
var
  ANode: IXMLNode;
begin
  if Assigned(ACurrentNode) then
    ANode := ACurrentNode.ChildNodes.FindNode(AName);
  if Assigned(ANode) then
    result := ANode.Attributes['Value'];
end;

{ TcxXMLWriter }

procedure TcxXMLWriter.BeginWrite;
begin
  inherited;
  FXMLDoc.ChildNodes.Clear;
  AParentNode := FXMLDoc.AddChild('GridSetup');
end;

procedure TcxXMLWriter.BeginWriteObject(const AObjectName, AClassName: string);
var
  AParents: TStrings;
  AName: string;
  i: integer;
begin
  AParents := TStringList.Create;
  try
    ExtractObjectFullName(AObjectName, AParents, AName);
    ACurrentNode := AParentNode;
    for i := 0 to AParents.Count - 1 do
    begin
      if Assigned(ACurrentNode.ChildNodes.FindNode(AParents[i])) then
        ACurrentNode := ACurrentNode.ChildNodes.FindNode(AParents[i]);
    end;
  finally
    AParents.Free;
  end;
  ACurrentNode := ACurrentNode.AddChild(AName);
  ACurrentNode.Attributes['ClassName'] := AClassName;
end;

constructor TcxXMLWriter.Create(const AStorageName: string; AStream: TStream;
  AReCreate: Boolean);
begin
  inherited Create(AStorageName, AStream, AReCreate);

  FXMLDoc := TXMLDocument.Create(nil);
  FXMLDoc.Active := true;
end;

destructor TcxXMLWriter.Destroy;
begin
  inherited;
end;

procedure TcxXMLWriter.EndWrite;
begin
  if not Assigned(StorageStream) then
    DoSetStream(TStringStream.Create);
  FXMLDoc.SaveToStream(StorageStream);
  inherited;
end;

procedure TcxXMLWriter.WriteProperty(const AObjectName, AClassName,
  AName: string; AValue: Variant);
var
  ANode: IXMLNode;
begin
  ANode := ACurrentNode.AddChild(AName);
  ANode.Attributes['Value'] := AValue;
end;

{ TcxGridDBBandedTableViewXMLStore }

procedure TcxGridDBBandedTableViewXMLStore.RestoreFromXML(AStream: TStream;
  AChildrenCreating, AChildrenDeleting: Boolean;
  AOptions: TcxGridStorageOptions; const ARestoreViewName, AOwnerName: string);
begin
  RestoreFrom('', AStream, TcxXMLReader, AChildrenCreating,
    AChildrenDeleting, AOptions, ARestoreViewName, AOwnerName);
end;

procedure TcxGridDBBandedTableViewXMLStore.StoreToXML(AStream: TStream;
  AOptions: TcxGridStorageOptions; const ASaveViewName, AOwnerName: string);
begin
  StoreTo('', AStream, TcxXMLWriter, True, AOptions, ASaveViewName, AOwnerName);
end;

end.
