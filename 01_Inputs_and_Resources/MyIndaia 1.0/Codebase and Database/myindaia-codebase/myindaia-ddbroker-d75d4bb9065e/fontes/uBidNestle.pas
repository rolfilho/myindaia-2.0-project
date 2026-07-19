unit uBidNestle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Variants, ConsOnlineEx, ppDB, ppDBPipe, ppDBBDE, MemTable,
  ppVar, ppBands, ppStrtch, ppMemo, ppCtrls, RxGIF, jpeg, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppParameter,
  ppRegion, StrUtils, ServicoNovo,
  FormsLog, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, Grids, DBGrids, Buttons, StdCtrls,
  Mask, DBCtrls;

type
  TfrmBidNestle = class(TForm)
    Panel1: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbDestFinal: TDBEdit;
    dbCdDestFinal: TDBEdit;
    dbCdLocalEmbarque: TDBEdit;
    dbLocalEmbarque: TDBEdit;
    dbCdCity: TDBEdit;
    dbCity: TDBEdit;
    btn_salvar: TSpeedButton;
    btn_co_local_desemb_em: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CARRIER: TcxGridDBColumn;
    cxGrid1DBTableView1COMMODITY: TcxGridDBColumn;
    cxGrid1DBTableView1AREA: TcxGridDBColumn;
    cxGrid1DBTableView1UNIQUE_IDENTIFIER: TcxGridDBColumn;
    cxGrid1DBTableView1ORIGIN_SERVICE: TcxGridDBColumn;
    cxGrid1DBTableView1DESTINATION_SERVICE: TcxGridDBColumn;
    cxGrid1DBTableView1ORIG_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1DEST_COUNTRY: TcxGridDBColumn;
    cxGrid1DBTableView1ORIGIN_CITY: TcxGridDBColumn;
    cxGrid1DBTableView1DEST_CITY: TcxGridDBColumn;
    cxGrid1DBTableView1PORT_LOAD: TcxGridDBColumn;
    cxGrid1DBTableView1PORT_DISCHARGE: TcxGridDBColumn;
    cxGrid1DBTableView1EQUIPMENT: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView1PRICE_CURRENCY: TcxGridDBColumn;
    cxGrid1DBTableView1BASE_RATE: TcxGridDBColumn;
    cxGrid1DBTableView1BASE_RATE_CURRENCY: TcxGridDBColumn;
    cxGrid1DBTableView1TRANSIT_TIME: TcxGridDBColumn;
    cxGrid1DBTableView1DEST_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1CD_ORIG_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1ORIG_NEST: TcxGridDBColumn;
    cxGrid1DBTableView1PRODUCT: TcxGridDBColumn;
    cxGrid1DBTableView1SHIPPING_TERMS: TcxGridDBColumn;
    cxGrid1DBTableView1TRAFFIC_TYPE: TcxGridDBColumn;
    cxGrid1DBTableView1CARRIER_AWARD: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btn_co_pais_dest_em: TSpeedButton;
    btn_co_local_emb_em: TSpeedButton;
    cxGrid1DBTableView1CD_CARRIER: TcxGridDBColumn;
    dbCdCarrier: TDBEdit;
    dbCarrier: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure tpainelDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure db_bid_nestDblClick(Sender: TObject);
    procedure btn_co_local_desemb_emClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_co_pais_dest_emClick(Sender: TObject);
    procedure btn_co_local_emb_emClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBidNestle: TfrmBidNestle;

implementation

uses PGGP001, PGSM131, PGGP017, GSMLIB, PGSM018, PGSM010, PGSM104, PGSM022,
  PGGP015, PGGP018, PGSM026, PGSM136, PGSM212, PGGA003,
  PGSM242, uAg, PGSM249, PGSM019, uInstrucaoEmbarque, uPedidoInstrucao,
  uPortos, PGSM044, Funcoes, uFollowUp, ComObj,
  DateUtils;


{$R *.dfm}

procedure TfrmBidNestle.tpainelDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  a:string;
begin

end;

procedure TfrmBidNestle.FormShow(Sender: TObject);
begin
     Application.CreateForm(Tdatm_abre_proc, datm_abre_proc);
     datm_abre_proc.qry_BID_Nestle.Close;
     datm_abre_proc.qry_BID_Nestle.open;
end;

procedure TfrmBidNestle.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  a:string;
begin
  a := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, a);
  showmessage(a);
end;

procedure TfrmBidNestle.db_bid_nestDblClick(Sender: TObject);
var
  PaisFinal,nomepais,LocalDesembarque,nomeLocalDesembarque:string;
begin
end;

procedure TfrmBidNestle.btn_co_local_desemb_emClick(Sender: TObject);
begin
  if not (datm_abre_proc.qry_BID_Nestle.State in [dsEdit, dsInsert]) then
      datm_abre_proc.qry_BID_Nestle.Edit;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_abre_proc.qry_BID_Nestle) then exit;
    If (Sender as TSpeedButton).Enabled Then
      dbCdLocalEmbarque.text:=ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbCdLocalEmbarque.text);
      datm_abre_proc.qry_BID_NestleCD_PORT_DISCHARGE.asstring:= dbCdLocalEmbarque.text;
  end
  else dbLocalEmbarque.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbCdLocalEmbarque.Text,'DESCRICAO');
end;

procedure TfrmBidNestle.btn_salvarClick(Sender: TObject);
begin
   FastExecSQL('UPDATE TBID SET CD_PORT_DISCHARGE='''+dbCdLocalEmbarque.Text+''' WHERE PORT_DISCHARGE='''+dbLocalEmbarque.Text+''' ');
   FastExecSQL('UPDATE TBID SET CD_DEST_NEST='''+dbCdDestFinal.Text+''' WHERE DEST_NEST='''+dbDestFinal.Text+''' ');
   FastExecSQL('UPDATE TBID SET CD_ORIGIN_CITY='''+dbCdCity.Text+''' WHERE ORIGIN_CITY='''+dbCity.Text+''' ');
   datm_abre_proc.qry_BID_Nestle.Close;
   datm_abre_proc.qry_BID_Nestle.Open;
end;

procedure TfrmBidNestle.btn_co_pais_dest_emClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_abre_proc.qry_BID_Nestle) then exit;
    If (Sender as TSpeedButton).Enabled Then
      dbCdDestFinal.text := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, dbCdDestFinal.text);
  end
  else dbDestFinal.Text := ConsultaLookUP('TPAIS','CODIGO',dbCdDestFinal.text,'DESCRICAO')
end;

procedure TfrmBidNestle.btn_co_local_emb_emClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_abre_proc.qry_BID_Nestle) then exit;
    If (Sender as TSpeedButton).Enabled Then
      dbCdCity.text := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbCdCity.text)
  end
  else dbCity.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbCdCity.Text,'DESCRICAO');
end;

end.
