unit PGNM026; 

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_print_recibo = class(TDataModule)
    qry_ref_: TQuery;
    qry_ref_CD_REFERENCIA: TStringField;
    qry_ref_TX_REFERENCIA: TMemoField;
    ds_ref_: TDataSource;
    qry_max_: TQuery;
    qry_max_MAX_CODIGO: TStringField;
    qry_ref_CD_USUARIO: TStringField;
    procedure qry_ref_AfterInsert(DataSet: TDataSet);
    procedure qry_ref_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_print_recibo: Tdatm_print_recibo;

implementation

uses PGNM025, GSMLIB;

{$R *.DFM}

procedure Tdatm_print_recibo.qry_ref_AfterInsert(DataSet: TDataSet);
Var Cod_Int : Integer;
begin
  with datm_print_recibo do
  begin
     qry_max_.Close;
     qry_max_.Open;
     cod_int := qry_max_MAX_CODIGO.asInteger + 1;
     qry_max_.Close;
     qry_ref_CD_REFERENCIA.asString := FStrZero( InttoStr(cod_int), 4 );
  end;
end;

procedure Tdatm_print_recibo.qry_ref_BeforePost(DataSet: TDataSet);
begin
  if Trim(qry_ref_TX_REFERENCIA.asString) = '' then
    if Application.MessageBox('Deseja deixar a Referência em branco ?','Atenção',MB_ICONQUESTION+MB_YESNO) = ID_YES then
      Exit
    else
      Abort;
end;

end.
