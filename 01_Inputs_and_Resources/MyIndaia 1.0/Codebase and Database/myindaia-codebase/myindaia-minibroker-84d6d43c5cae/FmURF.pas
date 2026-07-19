unit FmURF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule;

type
  TFrameURF = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsURFDespachoAfterScroll(DataSet: TDataSet);
  private
    ads: TAureliusDataset;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFrameURF.adsURFDespachoAfterScroll(DataSet: TDataSet);
begin
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('Codigo').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameURF.edtCodigoChange(Sender: TObject);
begin
  if (string(edtCodigo.Text).Length = 7) and not
    ads.FieldByName('Codigo').AsString.Equals(edtCodigo.Text) then
  begin
    if ads.Locate('Codigo', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameURF.edtCodigoExit(Sender: TObject);
var
  Aux: string;
begin
  Aux := edtCodigo.Text;
  if not Aux.IsEmpty then
  begin
    if ads.Locate('Codigo', Aux, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameURF.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsURFDespachoAfterScroll;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('Codigo').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
