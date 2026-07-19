unit PGSM098;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_grupo_servico = class(TDataModule)
    us_grupo_servico: TUpdateSQL;
    qry_grupo_servico_: TQuery;
    ds_grupo_servico: TDataSource;
    qry_grupo_servico_CD_GRUPO: TStringField;
    qry_ult_grupo_servico_: TQuery;
    qry_ult_grupo_servico_ULTIMO: TStringField;
    qry_grupo_servico_NM_GRUPO: TStringField;
    qry_grupo_servico_NR_META: TFloatField;
    procedure qry_grupo_servico_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_grupo_servico: Tdatm_grupo_servico;

implementation

uses GSMLIB, PGSM097;

{$R *.DFM}

procedure Tdatm_grupo_servico.qry_grupo_servico_UpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro(E); 
end;


end.
