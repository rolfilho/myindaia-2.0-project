unit PGSM221;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_duplica_unid = class(TDataModule)
    qry_unid_neg_: TQuery;
    sp_duplica_unid: TStoredProc;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_: TQuery;
    qry_usuario_habilitacao_unidade_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_NM_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_AP_UNID_NEG: TStringField;
    qry_usuario_habilitacao_unidade_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_unidade_look_ativo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_duplica_unid: Tdatm_duplica_unid;

implementation

{$R *.DFM}









end.
