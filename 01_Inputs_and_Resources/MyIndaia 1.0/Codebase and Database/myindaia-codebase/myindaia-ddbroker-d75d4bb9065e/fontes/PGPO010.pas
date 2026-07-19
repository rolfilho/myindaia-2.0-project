unit PGPO010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_po = class(TDataModule)
    ds_po: TDataSource;
    qry_po_: TQuery;
    qry_po_NR_PROCESSO: TStringField;
    qry_po_CD_IMPORTADOR: TStringField;
    qry_po_DT_ABERTURA: TDateTimeField;
    qry_po_NR_DA: TStringField;
    qry_po_AP_EMPRESA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_po: Tdatm_consulta_po;

implementation

{$R *.DFM}


end.
