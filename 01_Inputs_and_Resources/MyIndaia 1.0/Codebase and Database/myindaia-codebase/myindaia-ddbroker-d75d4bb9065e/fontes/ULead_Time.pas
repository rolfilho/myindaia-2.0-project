unit ULead_Time;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, DBTables, DBCtrls, StdCtrls, Buttons,
  ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  Tfrm_lead_time = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    qry_lead_time_exp: TQuery;
    ds_lead_time_exp: TDataSource;
    cxgridlead_cliente: TcxGridDBColumn;
    cxgridlead_local_desembarque: TcxGridDBColumn;    
    cxgridlead_vl_lead_time: TcxGridDBColumn;
    qry_lead_time_expCD_CLIENTE: TStringField;
    qry_lead_time_expCLIENTE: TStringField;
    qry_lead_time_expCD_LOCAL_DESEMBARQUE: TStringField;
    qry_lead_time_expLOCAL_DESEMBARQUE: TStringField;
    qry_lead_time_expVL_LEAD_TIME: TIntegerField;
    qry_lead_time_expCD_USUARIO: TStringField;
    qry_lead_time_expNR_PROCESSO_CRIACAO: TStringField;
    up_lead_time_exp: TUpdateSQL;
    procedure FormShow(Sender: TObject);
    procedure qry_lead_time_expAfterPost(DataSet: TDataSet);
    procedure btn_sairClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_lead_time: Tfrm_lead_time;

implementation

uses
  Funcoes, GSMLIB;

{$R *.dfm}

procedure Tfrm_lead_time.FormShow(Sender: TObject);
var
  st_modificar, st_incluir, st_excluir: Boolean;
begin
  qry_lead_time_exp.Close;
  qry_lead_time_exp.Open;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  ds_lead_time_exp.AutoEdit := st_modificar;
end;

procedure Tfrm_lead_time.qry_lead_time_expAfterPost(DataSet: TDataSet);
begin
  if (qry_lead_time_expVL_LEAD_TIME.AsString ='')  then
  begin
   qry_lead_time_exp.edit;
   qry_lead_time_expVL_LEAD_TIME.AsString:='0';
  end;
  qry_lead_time_exp.ApplyUpdates;
end;

procedure Tfrm_lead_time.btn_sairClick(Sender: TObject);
begin
  Close;
end;

end.
