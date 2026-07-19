unit Aurelius.Design.DatasetEditor;

interface

uses
  DBReg, DSDesign, DB, Aurelius.Bind.Dataset;

type
  TAureliusDataSetEditor = class(TDataSetEditor)
  protected
    function Dataset: TAureliusDataset;
    function GetDSDesignerClass: TDSDesignerClass; override;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

  TObjectDatasetDesigner = class(TDSDesigner)
  private
    FSaveFieldDefs: TAureliusDataset;
  public
    constructor Create(DataSet: TDataSet); override;
    destructor Destroy; override;
    procedure BeginUpdateFieldDefs; override;
    procedure EndUpdateFieldDefs; override;
  end;

implementation

uses
  SysUtils, IOUtils, Aurelius.Design.DatasetDesigner;

{ TObjectDataSetEditor }

function TAureliusDataSetEditor.Dataset: TAureliusDataset;
begin
  Result := GetComponent as TAureliusDataset;
end;

procedure TAureliusDataSetEditor.ExecuteVerb(Index: Integer);
begin
  case Index - inherited GetVerbCount of
    0: TfmFieldLoader.Execute(GetComponent as TDataset);
    1: TfmFieldLoader.Reload(GetComponent as TDataset);
  else
    inherited ExecuteVerb(Index);
  end;
end;

function TAureliusDataSetEditor.GetDSDesignerClass: TDSDesignerClass;
begin
  Result := TObjectDatasetDesigner;
end;

function TAureliusDataSetEditor.GetVerb(Index: Integer): string;
begin
  case Index - inherited GetVerbCount of
    0: Result := 'Load Field Definitions...';
    1: Result := Format('Reload from %s', [Dataset.DesignClass]);
  else
    Result := inherited GetVerb(Index);
  end;
end;

function TAureliusDataSetEditor.GetVerbCount: Integer;
begin
  Result := 1 + inherited GetVerbCount;
  if (Dataset.DesignClass <> '') then
    Result := Result + 1;
end;

{ TObjectDatasetDesigner }

procedure TObjectDatasetDesigner.BeginUpdateFieldDefs;
begin
  // Do not update field defs. Just save what's there and retrieve it back after update
  // This code, together with EndUpdateFieldDefs, just avoids that FieldDefs are updated by the designer
  if Dataset <> nil then
    FSaveFieldDefs.FieldDefs.Assign(Dataset.FieldDefs);
  inherited;
end;

constructor TObjectDatasetDesigner.Create(DataSet: TDataSet);
begin
  inherited;
  FSaveFieldDefs := TAureliusDataset.Create(nil);
end;

destructor TObjectDatasetDesigner.Destroy;
begin
  FSaveFieldDefs.Free;
  inherited;
end;

procedure TObjectDatasetDesigner.EndUpdateFieldDefs;
begin
  inherited;
  if Dataset <> nil then
    Dataset.FieldDefs.Assign(FSaveFieldDefs.FieldDefs);
end;

end.
