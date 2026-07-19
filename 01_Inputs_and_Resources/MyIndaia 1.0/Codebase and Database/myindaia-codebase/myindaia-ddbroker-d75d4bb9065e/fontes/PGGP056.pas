unit PGGP056;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_rel_com_ind_por = class(TDataModule)
    qry_indicado_: TQuery;
    qry_depto_: TQuery;
    qry_depto_CD_DEPTO: TStringField;
    qry_depto_NM_DEPTO: TStringField;
    qry_indicado_CD_CLIENTE_INDICADO: TStringField;
    qry_indicado_NM_CLIENTE_INDICADO: TStringField;
    qry_indicado_CD_DEPTO: TStringField;
    sp_rel_com_ind_por: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_rel_com_ind_por: Tdatm_rel_com_ind_por;

implementation

{$R *.DFM}

end.
