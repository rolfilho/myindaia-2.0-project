unit PGSM167;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_duplica_ct_contabil_gerencial = class(TDataModule)
    sp_duplica_ct_contabil_gerencial: TStoredProc;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_meses_: TQuery;
    qry_meses_CD_MES: TStringField;
    qry_meses_NM_MES: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_duplica_ct_contabil_gerencial: Tdatm_duplica_ct_contabil_gerencial;

implementation

{$R *.DFM}











end.
