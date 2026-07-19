unit PGGP064;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pesq_lote = class(TDataModule)
    qry_pesq_lote_: TQuery;
    ds_pesq_lote: TDataSource;
    qry_pesq_lote_NR_LOTE: TStringField;
    qry_pesq_lote_CD_MERCADORIA: TStringField;
    qry_pesq_lote_AP_MERCADORIA: TStringField;
    qry_pesq_lote_NR_REF: TStringField;
    qry_pesq_lote_QT_DISPONIVEL: TIntegerField;
    qry_pesq_lote_PL_DISPONIVEL: TFloatField;
    qry_pesq_lote_PL_MERCADORIA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_lote: Tdatm_pesq_lote;

implementation

{$R *.DFM}

uses PGGP063;

end.
