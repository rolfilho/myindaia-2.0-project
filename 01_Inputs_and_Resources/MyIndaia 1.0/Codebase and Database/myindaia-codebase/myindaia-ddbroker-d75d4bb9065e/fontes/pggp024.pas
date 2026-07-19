unit PGGP024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_pe = class(TDataModule)
    qry_pe_: TQuery;
    ds_pe: TDataSource;
    qry_pe_NR_PROCESSO: TStringField;
    qry_pe_CD_EXPORTADOR: TStringField;
    qry_pe_AP_EMPRESA: TStringField;
    qry_pe_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_pe_CD_INCOTERM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_pe: Tdatm_consulta_pe;

implementation

{$R *.DFM}
uses PGGP015;

end.
