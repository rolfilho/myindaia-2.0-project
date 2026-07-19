unit PGFT026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_imp_receitas_operacionais = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    sp_cria_dados: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_receitas_operacionais: Tdatm_imp_receitas_operacionais;

implementation

{$R *.DFM}




end.
