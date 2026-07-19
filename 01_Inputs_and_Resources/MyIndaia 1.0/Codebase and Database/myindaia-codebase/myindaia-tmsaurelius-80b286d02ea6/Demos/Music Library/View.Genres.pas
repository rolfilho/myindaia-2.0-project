unit View.Genres;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Aurelius.Bind.Dataset, Aurelius.Engine.ObjectManager;

type
  TGenresForm = class(TForm)
    DBGrid1: TDBGrid;
    adsGenres: TAureliusDataset;
    dsGenres: TDataSource;
    adsGenresId: TIntegerField;
    adsGenresName: TStringField;
    DBNavigator1: TDBNavigator;
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

{ TViewGenres }

destructor TGenresForm.Destroy;
begin
  adsGenres.Close;
  if FOwnsManager then
    adsGenres.Manager.Free;
  inherited;
end;

class procedure TGenresForm.Display(AManager: TObjectManager; AOwnsManager: Boolean);
var
  Form: TGenresForm;
begin
  Form := TGenresForm.Create(Application);
  try
    Form.FOwnsManager := AOwnsManager;
    Form.adsGenres.Manager := AManager;
    Form.adsGenres.SetSourceCriteria(AManager.Find<TGenre>.OrderBy('Name'));
    Form.adsGenres.Open;
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

end.
