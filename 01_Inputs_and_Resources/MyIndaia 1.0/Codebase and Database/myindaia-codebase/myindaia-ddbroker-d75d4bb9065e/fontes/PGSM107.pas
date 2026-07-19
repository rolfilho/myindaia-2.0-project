unit PGSM107;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_local_embarque = class(TDataModule)
    ds_local_embarque: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_local_embarque_: TQuery;
    qry_local_embarque_CODIGO: TStringField;
    qry_local_embarque_DESCRICAO: TStringField;
    qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField;
    qry_local_embarque_LK_AP_UNID_NEG: TStringField;
    qry_ult_local_embarque_: TQuery;
    qry_ult_local_embarque_ULTIMO: TStringField;
    qry_local_embarque_CD_PAIS: TStringField;
    qry_local_embarque_CD_UF: TStringField;
    qry_local_embarque_CD_SIGLA: TStringField;
    qry_local_embarque_NM_CIDADE: TStringField;
    qry_local_embarque_FIESP_Id: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_local_embarque: Tdatm_local_embarque;

implementation

{$R *.DFM}





end.
