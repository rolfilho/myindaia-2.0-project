unit PGSM087;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_emb = class(TDataModule)
    ds_emb: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_emb_: TQuery;
    qry_ult_emb_: TQuery;
    qry_emb_CD_EMBARCACAO: TStringField;
    qry_emb_NM_EMBARCACAO: TStringField;
    qry_emb_IN_RORO: TStringField;
    qry_emb_IN_ATIVO: TStringField;
    qry_emb_look_ativo: TStringField;
    qry_emb_look_roro: TStringField;
    qry_ult_emb_ULTIMO: TStringField;
    qry_emb_CD_BANDEIRA: TStringField;
    qry_pais_: TQuery;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_emb_LookPais: TStringField;
    procedure qry_emb_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_emb: Tdatm_emb;

implementation

uses PGSM088;

{$R *.DFM}


procedure Tdatm_emb.qry_emb_AfterPost(DataSet: TDataSet);
var Codigo : String;
begin
    Codigo := qry_emb_CD_EMBARCACAO.asString;
    qry_emb_.Close;
    qry_emb_.Open;
    qry_emb_.Locate('CD_EMBARCACAO',Codigo,[]);
end;

end.
