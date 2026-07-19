unit FmEmpresaNac;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule, MyDialog,
  Vcl.ExtCtrls;

type
  TFrameEmpresaNac = class(TFrame)
    Label1: TLabel;
    Panel1: TPanel;
    DBLookupComboBox: TDBLookupComboBox;
    edtCodigo: TEdit;
    procedure edtCodigoChange(Sender: TObject);
    procedure adsAfterScroll(DataSet: TDataSet);
    procedure edtCodigoExit(Sender: TObject);
  private
    ads: TAureliusDataset;
    procedure Locate;
  public
    procedure SetDataset;
  end;

implementation

{$R *.dfm}

{ TFrameEmpresaNac }

procedure TFrameEmpresaNac.adsAfterScroll(DataSet: TDataSet);
begin
  SetDataset;
  if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
    edtCodigo.Text := ads.FieldByName('CdEmpresa').AsString
  else
    edtCodigo.Clear;
end;

procedure TFrameEmpresaNac.Locate;
begin
  SetDataset;
  if (string(edtCodigo.Text).Length = 3) and not
    ads.FieldByName('CdEmpresa').AsString.Equals(edtCodigo.Text) then
  begin
    if not ads.Locate('CdEmpresa', edtCodigo.Text, []) then
      Warning('Código inválido!')
    else
      DBLookupComboBox.KeyValue := ads.FieldByName('Self').Value;
  end;
end;

procedure TFrameEmpresaNac.edtCodigoChange(Sender: TObject);
begin
  Locate;
end;

procedure TFrameEmpresaNac.edtCodigoExit(Sender: TObject);
begin
  Locate;
end;

procedure TFrameEmpresaNac.SetDataset;
begin
  if (ads = nil) and
     (DBLookupComboBox.ListSource <> nil) and
     (DBLookupComboBox.ListSource.DataSet is TAureliusDataset) then
  begin
    ads := DBLookupComboBox.ListSource.DataSet as TAureliusDataset;
    ads.AfterScroll := adsAfterScroll;
    if (DBLookupComboBox.DataSource.DataSet.FieldByName(DBLookupComboBox.DataField).AsInteger > 0) then
      edtCodigo.Text := ads.FieldByName('CdEmpresa').AsString
    else
      edtCodigo.Clear;
  end;
end;

end.
