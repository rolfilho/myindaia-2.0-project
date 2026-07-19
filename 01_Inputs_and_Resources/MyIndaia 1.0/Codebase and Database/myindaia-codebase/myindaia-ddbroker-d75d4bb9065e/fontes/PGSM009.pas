unit PGSM009;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, PGGP001, DBIProcs;

type
  Tdatm_obs = class(TDataModule)
    ds_obs: TDataSource;
    qry_obs_: TQuery;
    qry_obs_CD_OBS: TStringField;
    qry_obs_TX_DESCRICAO: TStringField;
    qry_obs_TX_OBS: TMemoField;
    qry_ult_obs_: TQuery;
    qry_ult_obs_ULTIMO: TStringField;
    qry_obs_CD_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_obs: Tdatm_obs;

implementation

{$R *.DFM}

end.
