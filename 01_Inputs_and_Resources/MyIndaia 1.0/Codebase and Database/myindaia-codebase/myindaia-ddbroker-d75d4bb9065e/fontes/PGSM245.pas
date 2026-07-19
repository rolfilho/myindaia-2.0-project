unit PGSM245;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_prop_merc = class(TDataModule)
    ds_prop_merc: TDataSource;
    qry_prop_merc_: TQuery;
    qry_prop_merc_CD_PROPRIETARIO: TStringField;
    qry_prop_merc_NM_PROPRIETARIO: TStringField;
    qry_ult_prop_merc_: TQuery;
    qry_ult_prop_merc_ULTIMO: TStringField;
    us_prop_merc: TUpdateSQL;
    procedure qry_prop_merc_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_prop_merc: Tdatm_prop_merc;

implementation

uses GSMLIB, PGSM244;

{$R *.DFM}

procedure Tdatm_prop_merc.qry_prop_merc_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro(E); 
end;

end.
