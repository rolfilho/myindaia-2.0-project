unit FmNCMDestaque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule, MyDialog;

type
  TFrameNCMDestaque = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
  private
    ads: TAureliusDataset;
    procedure adsAfterScroll(DataSet: TDataSet);
    procedure Locate;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameNCMDestaque }

procedure TFrameNCMDestaque.adsAfterScroll(DataSet: TDataSet);
begin
  SetDataset;
  if not (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).IsNull) then
    edtCodigo.Text := ads.FieldByName('CdDominio').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameNCMDestaque.Locate;
var
  Aux: string;
begin
  SetDataset;
  Aux := edtCodigo.Text;
  if (Aux.Length = 3) and not ads.FieldByName('CdDominio').AsString.Equals(edtCodigo.Text) then
  begin
    if not ads.Locate('CdDominio', Aux, []) then
      Warning('Código inválido!')
    else
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameNCMDestaque.edtCodigoChange(Sender: TObject);
begin
  Locate;
end;

procedure TFrameNCMDestaque.edtCodigoExit(Sender: TObject);
begin
  Locate;
end;

procedure TFrameNCMDestaque.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsAfterScroll;
    if not (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).IsNull) then
      edtCodigo.Text := ads.FieldByName('CdDominio').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
