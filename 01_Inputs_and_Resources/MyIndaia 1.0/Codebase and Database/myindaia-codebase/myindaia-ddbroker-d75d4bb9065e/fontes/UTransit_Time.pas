unit UTransit_Time;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, DBTables, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGridExportLink, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  Tfrm_transit_time = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qry_transit_time_exp: TQuery;
    ds_transit_time_exp: TDataSource;
    cxgridtransit_local_desembarque: TcxGridDBColumn;
    cxgridtransit_local_embarque: TcxGridDBColumn;
    cxgridtransit_agente: TcxGridDBColumn;
    cxgridtransit_vl_transit_time: TcxGridDBColumn;
    cxgridtransit_local_transbordo: TcxGridDBColumn;
    up_transit_time_exp: TUpdateSQL;
    qry_transit_time_expCD_LOCAL_EMBARQUE: TStringField;
    qry_transit_time_expLOCAL_EMBARQUE: TStringField;
    qry_transit_time_expCD_LOCAL_DESEMBARQUE: TStringField;
    qry_transit_time_expLOCAL_DESEMBARQUE: TStringField;
    qry_transit_time_expCD_LOCAL_TRANSBORDO: TStringField;
    qry_transit_time_expLOCAL_TRANSBORDO: TStringField;
    qry_transit_time_expCD_AGENTE: TStringField;
    qry_transit_time_expNM_AGENTE: TStringField;
    qry_transit_time_expCD_VIA_TRANSPORTE: TStringField;
    qry_transit_time_expNM_VIA_TRANSPORTE: TStringField;
    qry_transit_time_expVL_TRANSIT_TIME: TIntegerField;
    qry_transit_time_expCD_USUARIO: TStringField;
    qry_transit_time_expNR_PROCESSO_CRIACAO: TStringField;
    cxggridtransit_via_transporte: TcxGridDBColumn;
    pnlOpcoes: TPanel;
    btnExcel: TSpeedButton;
    sdExcel: TSaveDialog;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeader: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure qry_transit_time_expAfterPost(DataSet: TDataSet);
    procedure btn_sairClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_transit_time: Tfrm_transit_time;

implementation

uses
  Funcoes, GSMLIB;

{$R *.dfm}

procedure Tfrm_transit_time.FormShow(Sender: TObject);
var
  st_modificar, st_incluir, st_excluir: Boolean;
begin
  qry_transit_time_exp.Close;
  qry_transit_time_exp.Open;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  ds_transit_time_exp.AutoEdit := st_modificar;
end;

procedure Tfrm_transit_time.qry_transit_time_expAfterPost(
  DataSet: TDataSet);
begin
  if (qry_transit_time_expVL_TRANSIT_TIME.AsString ='')  then
  begin
   qry_transit_time_exp.edit;
   qry_transit_time_expVL_TRANSIT_TIME.AsString:='0';
  end;
  qry_transit_time_exp.ApplyUpdates;
end;

procedure Tfrm_transit_time.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_transit_time.btnExcelClick(Sender: TObject);
begin
  if cxGrid1DBTableView1.ViewData.RowCount = 0 then
    ShowMessage('Não há dados para serem exportados.'#13'Favor rever os filtros aplicados.')
  else if sdExcel.Execute then
    ExportGridToExcel(sdExcel.FileName, cxGrid1);
end;

end.
