unit dCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_centro_custo = class(TDataModule)
    ds_centro_custo: TDataSource;
    qry_centro_custo_: TQuery;
    qry_centro_custo_CD_COLIGADA: TStringField;
    qry_centro_custo_NM_CT_CUSTO: TStringField;
    qry_centro_custo_IN_ATIVO: TStringField;
    qry_centro_custo_CD_CT_CUSTO2: TStringField;
    SqlAux: TQuery;
    procedure qry_centro_custo_AfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_centro_custo: Tdatm_centro_custo;

implementation

{$R *.dfm}

procedure Tdatm_centro_custo.qry_centro_custo_AfterInsert(
  DataSet: TDataSet);
begin
  datm_centro_custo.qry_centro_custo_IN_ATIVO.AsString := '1';
  datm_centro_custo.qry_centro_custo_CD_COLIGADA.AsString := '01';
end;

end.
