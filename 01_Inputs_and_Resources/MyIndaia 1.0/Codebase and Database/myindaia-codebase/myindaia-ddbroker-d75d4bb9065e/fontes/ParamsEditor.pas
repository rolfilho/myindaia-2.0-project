unit ParamsEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvInspector, DB;

type
  TfrmParamsEditor = class(TForm)
    lbParams: TListBox;
    procedure lbParamsClick(Sender: TObject);
  private
    FOldObject: TObject;
    FParams: TParams;
  public
    procedure Execute(AParams: TParams);
  end;

  procedure ExecuteParamsEditor(AParams: TParams);
  procedure CloseParamsEditor;

var
  frmParamsEditor: TfrmParamsEditor;

implementation

uses
  ObjectInspector;

{$R *.dfm}

procedure ExecuteParamsEditor(AParams: TParams);
begin
  if not Assigned(frmParamsEditor) then
    Application.CreateForm(TfrmParamsEditor, frmParamsEditor);
  frmParamsEditor.Execute(AParams);
end;

procedure CloseParamsEditor;
begin
  if Assigned(frmParamsEditor) then
    frmParamsEditor.Close;
end;

{ TfrmParamsEditor }

procedure TfrmParamsEditor.Execute(AParams: TParams);
var
  I: Integer;
begin
  lbParams.Clear;
  for I := 0 to AParams.Count -1 do
    lbParams.Items.Add(IntToStr(I) + ' - ' + AParams[I].DisplayName);
  FOldObject := frmObjectInspector.InspectObject;
  FParams := AParams;
  lbParams.ItemIndex := 0;
  lbParamsClick(lbParams);
  Show;
end;

procedure TfrmParamsEditor.lbParamsClick(Sender: TObject);
begin
  if lbParams.ItemIndex < 0 then
    frmObjectInspector.InspectObject := nil
  else
    frmObjectInspector.InspectObject := FParams[lbParams.ItemIndex];
end;

end.
