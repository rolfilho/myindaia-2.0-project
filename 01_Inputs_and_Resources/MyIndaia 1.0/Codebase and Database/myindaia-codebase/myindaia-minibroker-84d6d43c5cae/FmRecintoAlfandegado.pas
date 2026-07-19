unit FmRecintoAlfandegado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule;

type
  TFrameRecintoAlfandegado = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsFrameAfterRefresh(DataSet: TDataSet);
  private
    ads: TAureliusDataset;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFrameRecintoAlfandegado.adsFrameAfterRefresh(
  DataSet: TDataSet);
begin
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('Codigo').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameRecintoAlfandegado.edtCodigoChange(Sender: TObject);
begin
  if (string(edtCodigo.Text).Length = 7) and not
    ads.FieldByName('Codigo').AsString.Equals(edtCodigo.Text) then
  begin
    if ads.Locate('Codigo', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameRecintoAlfandegado.edtCodigoExit(Sender: TObject);
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

procedure TFrameRecintoAlfandegado.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsFrameAfterRefresh;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('Codigo').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
