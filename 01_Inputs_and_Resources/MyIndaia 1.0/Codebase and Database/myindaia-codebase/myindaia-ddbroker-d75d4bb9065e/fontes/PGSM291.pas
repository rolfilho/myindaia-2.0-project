unit PGSM291;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cntr = class(TDataModule)
    qry_cntr_: TQuery;
    ds_cntr: TDataSource;
    IpDate_cntr: TUpdateSQL;
    qry_ult_cntr_: TQuery;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_cntr_IN_ATIVO: TStringField;
    qry_ult_cntr_ULTIMO: TStringField;
    qry_cntr_TP_PESO: TStringField;
    qry_cntr_CD_ISO: TStringField;
    procedure qry_cntr_AfterDelete(DataSet: TDataSet);
    procedure qry_cntr_AfterPost(DataSet: TDataSet);
    procedure qry_cntr_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cntr: Tdatm_cntr;

implementation

uses GSMLIB;

{$R *.DFM}

procedure Tdatm_cntr.qry_cntr_AfterDelete(DataSet: TDataSet);
begin
qry_cntr_.ApplyUpDAtes;
end;

procedure Tdatm_cntr.qry_cntr_AfterPost(DataSet: TDataSet);
begin
qry_cntr_.ApplyUpDAtes;
end;

procedure Tdatm_cntr.qry_cntr_BeforePost(DataSet: TDataSet);
begin
  if qry_cntr_.state = dsInsert then
    begin
     qry_cntr_TP_CNTR.AsString:=UltCod(qry_ult_cntr_,qry_ult_cntr_ULTIMO);

    end;
end;

end.
