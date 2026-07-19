unit PGSM161;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_enquad_op = class(TDataModule)
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_enquad_op_: TQuery;
    ds_enquad_op: TDataSource;
    qry_enquad_op_CD_ENQUAD_OP: TStringField;
    qry_enquad_op_NM_ENQUAD_OP: TStringField;
    qry_enquad_op_IN_ATIVO: TStringField;
    qry_enquad_op_LookAtivo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_enquad_op: Tdatm_enquad_op;

implementation

uses PGGP017;

{$R *.DFM}


end.
