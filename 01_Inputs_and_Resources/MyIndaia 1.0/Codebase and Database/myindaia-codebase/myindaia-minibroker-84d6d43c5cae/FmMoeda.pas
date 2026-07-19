unit FmMoeda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule, Vcl.Mask;

type
  TFrameMoeda = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsMoedaAfterScroll(DataSet: TDataSet);
  private
    ads: TAureliusDataset;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFrameMoeda.adsMoedaAfterScroll(DataSet: TDataSet);
begin
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('CdMoeda').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameMoeda.edtCodigoChange(Sender: TObject);
begin
  if (string(edtCodigo.Text).Length = 3) and not
    ads.FieldByName('CdMoeda').AsString.Equals(edtCodigo.Text) then
  begin
    if ads.Locate('CdMoeda', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameMoeda.edtCodigoExit(Sender: TObject);
var
  Aux: string;
begin
  Aux := edtCodigo.Text;
  if not Aux.IsEmpty then
  begin
    Aux := FormatFloat('000', Aux.ToInteger);
    if ads.Locate('CdMoeda', Aux, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameMoeda.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsMoedaAfterScroll;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('CdMoeda').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
