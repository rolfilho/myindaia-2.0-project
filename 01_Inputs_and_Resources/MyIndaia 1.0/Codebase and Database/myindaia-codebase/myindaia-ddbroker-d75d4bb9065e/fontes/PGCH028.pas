unit PGCH028;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_imp_ir = class(TDataModule)
    qry_coligada_: TQuery;
    qry_favorecido_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_cd_recol_: TQuery;
    qry_cd_recol_CD_RECOL: TStringField;
    qry_cd_recol_VL_ALIQ: TFloatField;
    qry_cd_recol_NM_NATUREZA: TStringField;
    qry_cd_recol_CD_LAYOUT_IR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_ir: Tdatm_imp_ir;

implementation

{$R *.DFM}





end.
