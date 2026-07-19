unit DebugUtils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Menus;

type
  TFormDebugUtils = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    PopupMenu1: TPopupMenu;
    ExportarparaCSV1: TMenuItem;
    procedure ExportarparaCSV1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDebugUtils: TFormDebugUtils;

procedure ShowDataSet(DataSet: TDataSet);

implementation

uses
  KrCSV;

{$R *.dfm}

procedure ShowDataSet(DataSet: TDataSet);
var
  Form: TFormDebugUtils;
begin
  Form := TFormDebugUtils.Create(nil);
  try
    Form.DataSource.DataSet := DataSet;
    Form.ShowModal;
    DataSet.First;
  finally
    Form.Free;
  end;
end;

procedure TFormDebugUtils.ExportarparaCSV1Click(Sender: TObject);
var
  CSV: TCSV;
begin
  CSV := TCSV.Create();
  try
    CSV.ConvertCSV(DataSource.DataSet, 'C:\Temp\DebugUtils.csv');
  finally
    CSV.Free;
  end;
end;

end.
