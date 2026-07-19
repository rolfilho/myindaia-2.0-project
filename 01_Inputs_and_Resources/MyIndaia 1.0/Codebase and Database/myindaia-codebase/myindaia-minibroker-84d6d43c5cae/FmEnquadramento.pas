unit FmEnquadramento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule;

type
  TFrameEnquadramento = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsEnquadramentoAfterScroll(DataSet: TDataSet);
  private
    ads: TAureliusDataset;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFrameEnquadramento.adsEnquadramentoAfterScroll(DataSet: TDataSet);
begin
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('CdEnquadOp').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameEnquadramento.edtCodigoChange(Sender: TObject);
begin
  if (string(edtCodigo.Text).Length = 2) and not
    ads.FieldByName('CdEnquadOp').AsString.Equals(edtCodigo.Text) then
  begin
    if ads.Locate('CdEnquadOp', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameEnquadramento.edtCodigoExit(Sender: TObject);
var
  Aux: string;
begin
  Aux := edtCodigo.Text;
  if not Aux.IsEmpty then
  begin
    if Aux.Length = 1 then
    begin
      Aux := '0' + Aux;
      edtCodigo.Text := Aux;
    end;
    if ads.Locate('CdEnquadOp', Aux, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameEnquadramento.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsEnquadramentoAfterScroll;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('CdEnquadOp').AsString
    else
      edtCodigo.Clear;
  end;
end;


end.
