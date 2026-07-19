unit dGerarRemessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_gerar_remessa = class(TDataModule)
    qry_pesquisa_: TQuery;
    qry_disp_remessa_: TQuery;
    qry_disp_remessa_DT_DISP: TDateTimeField;
    qry_disp_remessa_CD_BANCO: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_tt_saldo_disp_: TQuery;
    qry_tt_saldo_disp_VL_DISP: TFloatField;
    qry_tt_saldo_disp_VL_UTILIZADO: TFloatField;
    qry_disp_remessa_VL_DISP: TFloatField;
    qry_disp_remessa_VL_UTILIZADO: TFloatField;
    qry_processo_faturas_: TQuery;
    qry_processo_faturas_NR_PROCESSO: TStringField;
    qry_processo_faturas_CD_CLIENTE: TStringField;
    qry_processo_faturas_NM_EMPRESA: TStringField;
    qry_processo_faturas_TOTAL: TFloatField;
    qry_processo_faturas_IN_SELECIONADO: TStringField;
    qry_processo_faturas_CD_AGENTE: TStringField;
    qry_processo_faturas_NM_AGENTE: TStringField;
    ds_processo_faturas: TDataSource;
    Update_disp: TUpdateSQL;
    qry_processo_faturas_calc_tp_fatura: TStringField;
    qry_processo_faturas_NR_MASTER: TStringField;
    qry_processo_faturas_NR_HOUSE: TStringField;
    procedure qry_processo_faturas_CalcFields(DataSet: TDataSet);
    procedure qry_processo_faturas_AfterPost(DataSet: TDataSet);
    procedure qry_disp_remessa_AfterPost(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    in_calc_vl_total:Boolean;
    vl_calc_tt_account:Real;
  end;

var
  datm_gerar_remessa: Tdatm_gerar_remessa;
   ctrl_acesso:Boolean;//variave que controla as rotinas Changes dos campos

implementation
  Uses GSMLIB, PGGP017, uGerarRemessa;

{$R *.DFM}



procedure Tdatm_gerar_remessa.qry_processo_faturas_CalcFields(
  DataSet: TDataSet);
begin
  if  qry_processo_faturas_IN_SELECIONADO.AsString = '1' then
      vl_calc_tt_account := vl_calc_tt_account + qry_processo_faturas_TOTAL.AsFloat;


  if qry_processo_faturas_TOTAL.AsFloat > 0 then
   qry_processo_faturas_calc_tp_fatura.AsString := 'D'
  else
   qry_processo_faturas_calc_tp_fatura.AsString := 'C';
end;

procedure Tdatm_gerar_remessa.qry_processo_faturas_AfterPost(
  DataSet: TDataSet);
begin
  qry_processo_faturas_.ApplyUpdates;
end;

procedure Tdatm_gerar_remessa.qry_disp_remessa_AfterPost(
  DataSet: TDataSet);
begin
qry_disp_remessa_.ApplyUpdates;
end;

end.
