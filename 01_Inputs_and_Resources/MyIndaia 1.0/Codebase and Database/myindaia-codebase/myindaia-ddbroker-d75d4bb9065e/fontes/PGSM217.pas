unit PGSM217;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_evento_po = class(TDataModule)
    ds_evento_po: TDataSource;
    ds_evento: TDataSource;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_ult_ordem_: TQuery;
    qry_ev_base_: TQuery;
    qry_ev_futuro_: TQuery;
    sp_ordena_evento_po: TStoredProc;
    qry_evento_po_: TQuery;
    qry_evento_po_CD_EVENTO: TStringField;
    qry_evento_po_CD_EV_BASICO: TStringField;
    qry_evento_po_PZ_DO_EV_BASICO: TFloatField;
    qry_evento_po_CD_EV_FUTURO: TStringField;
    qry_evento_po_PZ_ATE_EV_FUTURO: TFloatField;
    qry_evento_po_LookEvento: TStringField;
    qry_evento_po_LookEventoBase: TStringField;
    qry_evento_po_LookEventoFuturo: TStringField;
    qry_ult_ordem_ULTIMO: TIntegerField;
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_lista_NR_ORDEM: TIntegerField;
    qry_lista_CD_EVENTO: TStringField;
    qry_lista_NM_EVENTO: TStringField;
    qry_evento_po_NR_ORDEM: TIntegerField;
    sp_exclui_evento_po: TStoredProc;
    qry_ev_base_NR_ORDEM: TIntegerField;
    qry_ev_futuro_NR_ORDEM: TIntegerField;
    procedure qry_evento_po_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Nr_Ordem : Integer;
    { Public declarations }
  end;

var
  datm_evento_po: Tdatm_evento_po;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGSM216;

procedure Tdatm_evento_po.qry_evento_po_AfterScroll(DataSet: TDataSet);
begin
  Nr_Ordem := qry_evento_po_NR_ORDEM.AsInteger;
end;

procedure Tdatm_evento_po.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  with qry_evento_po_ do
  begin
    Close;
    ParamByName('CD_EVENTO').AsString := qry_lista_CD_EVENTO.AsString;
    Prepare;
    Open;
  end;
end;

end.
