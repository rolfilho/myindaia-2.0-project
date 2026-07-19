unit FmPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule;

type
  TFramePais = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsPaisAfterScroll(DataSet: TDataSet);
  private
    ads: TAureliusDataset;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFramePais.adsPaisAfterScroll(DataSet: TDataSet);
begin
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('CdPais').AsString
  else
    edtCodigo.Clear;
end;

procedure TFramePais.edtCodigoChange(Sender: TObject);
begin
  if (string(edtCodigo.Text).Length = 3) and not
    ads.FieldByName('CdPais').AsString.Equals(edtCodigo.Text) then
  begin
    if ads.Locate('CdPais', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFramePais.edtCodigoExit(Sender: TObject);
var
  Aux: string;
begin
  Aux := edtCodigo.Text;
  if not Aux.IsEmpty then
  begin
    Aux := FormatFloat('000', Aux.ToInteger);
    if ads.Locate('CdPais', Aux, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFramePais.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsPaisAfterScroll;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('CdPais').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
