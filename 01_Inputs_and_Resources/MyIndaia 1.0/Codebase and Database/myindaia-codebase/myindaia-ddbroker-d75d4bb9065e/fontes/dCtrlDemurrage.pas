unit dCtrlDemurrage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db;

type
  Tdatm_ctrl_demurrage = class(TDataModule)
    qry_demurrage_: TQuery;
    ds_demurrage: TDataSource;
    Update_Demurrage: TUpdateSQL;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_demurrage_NR_PROCESSO: TStringField;
    qry_demurrage_NR_CNTR: TStringField;
    qry_demurrage_NR_LACRE: TStringField;
    qry_demurrage_CD_CLIENTE: TStringField;
    qry_demurrage_NR_HOUSE: TStringField;
    qry_demurrage_NR_MASTER: TStringField;
    qry_demurrage_NM_EMPRESA: TStringField;
    qry_demurrage_DT_DEMURRAGE: TDateTimeField;
    qry_demurrage_DIAS_DEMURRAGE: TIntegerField;
    qry_demurrage_DT_DEV_EFETIVA: TDateTimeField;
    qry_demurrage_NR_FREE_TIME: TIntegerField;
    qry_demurrage_IN_DEVOLVIDO: TStringField;
    qry_demurrage_CD_ARMADOR: TStringField;
    qry_demurrage_DT_DEVOLUCAO_CNTR: TDateTimeField;
    qry_pesquisa_: TQuery;
    qry_demurrage_calc_processo: TStringField;
    qry_demurrage_CODIGO: TStringField;
    qry_demurrage_DESCRICAO: TStringField;
    qry_demurrage_VL_DEMURRAGE: TFloatField;
    qry_demurrage_VL_DESC_DEMURRAGE: TFloatField;
    qry_demurrage_VL_CORRIGIDO: TFloatField;
    qry_demurrage_VL_CUSTO_TOTAL: TFloatField;
    qry_demurrage_VL_VENDA_DEMURRAGE: TFloatField;
    qry_demurrage_VL_VENDA_TOTAL: TFloatField;
    qry_demurrage_TT_DEMURRAGE: TFloatField;
    procedure qry_demurrage_AfterPost(DataSet: TDataSet);
    procedure qry_demurrage_AfterDelete(DataSet: TDataSet);
    procedure qry_consulta_AfterScroll(DataSet: TDataSet);
    procedure qry_demurrage_DIA_FREEChange(Sender: TField);
    procedure qry_demurrage_CalcFields(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    function get_dia:integer;
  end;

var
  datm_ctrl_demurrage: Tdatm_ctrl_demurrage;

implementation

uses Funcoes, uCtrlDemurrage;

{$R *.DFM}

procedure Tdatm_ctrl_demurrage.qry_demurrage_AfterPost(DataSet: TDataSet);
begin
qry_demurrage_.ApplyUpdates;
end;

procedure Tdatm_ctrl_demurrage.qry_demurrage_AfterDelete(
  DataSet: TDataSet);
begin
qry_demurrage_.ApplyUpdates;
end;

procedure Tdatm_ctrl_demurrage.qry_consulta_AfterScroll(DataSet: TDataSet);
begin
frm_ctrl_demurrage.Consulta :=True;
end;

procedure Tdatm_ctrl_demurrage.qry_demurrage_DIA_FREEChange(
  Sender: TField);
begin
// if not(qry_demurrage_.State in [dsInsert, dsEdit]) then exit;
 //  qry_demurrage_DT_DEVOLUCAO.AsDateTime  :=(qry_demurrage_DT_CHEGADA.AsDateTime + qry_demurrage_DIA_FREE.AsInteger);
end;

procedure Tdatm_ctrl_demurrage.qry_demurrage_CalcFields(DataSet: TDataSet);
begin
  qry_demurrage_calc_processo.AsString:=Copy(qry_demurrage_NR_PROCESSO.AsString,5,10);
end;

function Tdatm_ctrl_demurrage.get_dia: integer;
var data:Tdate;
    i:integer;
begin
  data:=qry_demurrage_DT_DEVOLUCAO_CNTR.AsDateTime;
  i:=1;

 if (qry_demurrage_DT_DEV_EFETIVA.AsDateTime) > (qry_demurrage_DT_DEVOLUCAO_CNTR.AsDateTime) then
  begin
    while (data < qry_demurrage_DT_DEV_EFETIVA.AsDateTime) or (data = qry_demurrage_DT_DEV_EFETIVA.AsDateTime)do
     begin
      if (data + i ) = qry_demurrage_DT_DEV_EFETIVA.AsDateTime then
         Break;
      i:= i + 1;
     end;
    get_dia:= qry_demurrage_NR_FREE_TIME.AsInteger + i ;
   end
   else get_dia:=  0 ;

  //get_dia:=(qry_demurrage_DT_DEV_EFETIVA.AsInteger) - (qry_demurrage_DT_DEVOLUCAO_CNTR.AsInteger) ;
end;

end.
