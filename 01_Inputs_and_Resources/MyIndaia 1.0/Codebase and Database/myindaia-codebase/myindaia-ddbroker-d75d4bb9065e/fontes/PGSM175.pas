unit PGSM175;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_hist_padrao = class(TDataModule)
    ds_hist_padrao: TDataSource;
    qry_hist_padrao_: TQuery;
    qry_ult_historico_: TQuery;
    qry_ult_historico_ULTIMO: TStringField;
    qry_hist_padrao_CD_HISTORICO: TStringField;
    qry_hist_padrao_NM_HISTORICO: TStringField;
    qry_hist_padrao_TX_HISTORICO: TMemoField;
    qry_hist_lista_: TQuery;
    ds_hist_lista: TDataSource;
    qry_hist_lista_CD_HISTORICO: TStringField;
    qry_hist_lista_NM_HISTORICO: TStringField;
    procedure qry_hist_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_hist_padrao: Tdatm_hist_padrao;

implementation

{$R *.DFM}




procedure Tdatm_hist_padrao.qry_hist_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_hist_padrao_.Close;
  qry_hist_padrao_.Prepare;
  qry_hist_padrao_.Open;
end;

end.
