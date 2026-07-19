unit FmIncoterm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule, MyDialog;

type
  TFrameIncoterm = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoChange(Sender: TObject);
    procedure adsIncotermAfterScroll(DataSet: TDataSet);
    procedure edtCodigoExit(Sender: TObject);
  private
    ads: TAureliusDataset;
    procedure Locate;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFrameIncoterm.adsIncotermAfterScroll(DataSet: TDataSet);
begin
  SetDataset;
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('Codigo').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameIncoterm.Locate;
begin
  SetDataset;
  if (string(edtCodigo.Text).Length = 3) and not
    ads.FieldByName('Codigo').AsString.Equals(edtCodigo.Text) then
  begin
    if not ads.Locate('Codigo', edtCodigo.Text, []) then
      Warning('Código inválido!')
    else
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameIncoterm.edtCodigoChange(Sender: TObject);
begin
  Locate;
end;

procedure TFrameIncoterm.edtCodigoExit(Sender: TObject);
begin
  Locate;
end;

procedure TFrameIncoterm.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsIncotermAfterScroll;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('Codigo').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
