unit PGSD008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_relatorio_extrato_honorarios = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    sp_rel_sda_extrato: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_relatorio_extrato_honorarios: Tdatm_relatorio_extrato_honorarios;

implementation

{$R *.DFM}


end.
