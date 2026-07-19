unit PGSM110;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_produto = class(TDataModule)
    ds_produto: TDataSource;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    qry_produto_: TQuery;
    qry_produto_IN_ATIVO: TStringField;
    qry_produto_look_ativo: TStringField;
    qry_ult_produto_: TQuery;
    qry_ult_produto_ULTIMO: TStringField;
    sp_ativar_desativar_produto: TStoredProc;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    qry_produto_lista_: TQuery;
    ds_produto_lista: TDataSource;
    qry_produto_lista_CD_PRODUTO: TStringField;
    qry_produto_lista_NM_PRODUTO: TStringField;
    qry_produto_lista_AP_PRODUTO: TStringField;
    qry_produto_lista_IN_ATIVO: TStringField;
    qry_produto_lista_LK_ATIVO: TStringField;
    sp_inc_produto_usuario: TStoredProc;
    qry_produto_TP_FAT_SEM_RECEITA: TStringField;
    qry_produto_CD_CT_GERENCIAL: TStringField;
    qry_produto_TP_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_produto: Tdatm_produto;

implementation

{$R *.DFM}







end.
