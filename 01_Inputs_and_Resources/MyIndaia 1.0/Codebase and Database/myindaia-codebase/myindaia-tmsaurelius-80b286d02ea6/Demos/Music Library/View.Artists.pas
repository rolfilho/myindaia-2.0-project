unit View.Artists;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Aurelius.Engine.ObjectManager,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TArtistsForm = class(TForm)
    DBGrid1: TDBGrid;
    adsArtists: TAureliusDataset;
    dsArtists: TDataSource;
    adsArtistsId: TIntegerField;
    adsArtistsName: TStringField;
    edtSearch: TLabeledEdit;
    DBNavigator1: TDBNavigator;
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure adsArtistsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    FOwnsManager: Boolean;
  public
    class procedure Display(AManager: TObjectManager; AOwnsManager: Boolean);
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  MusicEntities;

procedure TArtistsForm.adsArtistsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  Accept := Pos(UpperCase(edtSearch.Text), UpperCase(Dataset.FieldByName('Name').AsString)) > 0;
end;

destructor TArtistsForm.Destroy;
begin
  adsArtists.Close;
  if FOwnsManager then
    adsArtists.Manager.Free;
  inherited;
end;

class procedure TArtistsForm.Display(AManager: TObjectManager; AOwnsManager: Boolean);
var
  Form: TArtistsForm;
begin
  Form := TArtistsForm.Create(Application);
  try
    Form.FOwnsManager := AOwnsManager;
    Form.adsArtists.Close;
    Form.adsArtists.Manager := AManager;
    Form.adsArtists.SetSourceCriteria(AManager.Find<TArtist>.OrderBy('Name'));
    Form.adsArtists.Open;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TArtistsForm.edtSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    adsArtists.Filtered := False;
    adsArtists.Filtered := edtSearch.Text <> '';
  end;
end;

end.
