unit PGGA028;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_proc_vinc_realiza = class(TDataModule)
    qry_tfollowup_: TQuery;
    ds_tfollowup: TDataSource;
    qry_processo_: TQuery;
    qry_processo_CD_UNID_NEG_VINC: TStringField;
    qry_processo_CD_PRODUTO_VINC: TStringField;
    qry_processo_NR_PROCESSO_VINC: TStringField;
    ds_processo: TDataSource;
    qry_tfollowup_NR_PROCESSO: TStringField;
    qry_tfollowup_CD_EVENTO: TStringField;
    qry_tfollowup_DT_REALIZACAO: TDateTimeField;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_tfollowup_LookEvento: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_proc_vinc_realiza: Tdatm_proc_vinc_realiza;

implementation

{$R *.DFM}

end.
