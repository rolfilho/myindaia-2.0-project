unit PGSM203;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_naladi_ncca_exp = class(TDataModule)
    qry_naladi_: TQuery;
    ds_naladi_: TDataSource;
    qry_naladi_CODIGO: TStringField;
    qry_naladi_DESCRICAO: TStringField;
    qry_verifica_: TQuery;
    qry_verifica_CODIGO: TStringField;
    qry_verifica_NR_SEQ: TIntegerField;
    qry_naladi_NR_SEQ: TIntegerField;
    procedure qry_naladi_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_naladi_ncca_exp: Tdatm_naladi_ncca_exp;

implementation

{$R *.DFM}


procedure Tdatm_naladi_ncca_exp.qry_naladi_AfterPost(DataSet: TDataSet);
var codigo: String;
    descricao: String;

begin
   codigo := qry_naladi_.FieldByname('CODIGO').asString;
   descricao := qry_naladi_.FieldByname('DESCRICAO').asString;
   qry_naladi_.Close;
   qry_naladi_.Open;
   qry_naladi_.Locate('CODIGO;DESCRICAO', VarArrayOf([codigo, descricao]), []);
end;


end.
