unit PGSM179;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_modalidade_trans = class(TDataModule)
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_modalidade_trans_: TQuery;
    ds_modalidade_trans: TDataSource;
    qry_modalidade_trans_CD_MODALIDADE_TRANS: TStringField;
    qry_modalidade_trans_NM_MODALIDADE_TRANS: TStringField;
    qry_modalidade_trans_IN_ATIVO: TStringField;
    qry_modalidade_trans_LookAtivo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_modalidade_trans: Tdatm_modalidade_trans;

implementation

uses PGGP017;

{$R *.DFM}


end.
