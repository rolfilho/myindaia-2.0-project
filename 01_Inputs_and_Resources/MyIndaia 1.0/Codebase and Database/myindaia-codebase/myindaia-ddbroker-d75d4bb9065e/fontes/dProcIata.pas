(*************************************************************************************************

Sistema: DD Broker Cargo - Bysoft

PROGRAMA: PGSM319.PAS - Solicitação de Faturamento - datm_proc_iata

AUTOR: BYSOFT

DATA: dd/mm/yyyy

Manutenção: J.Roberto

Data: 09/12/2003

*************************************************************************************************)
unit dProcIata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  Tdatm_proc_iata = class(TDataModule)
    qry_lista_cia_: TQuery;
    ds_lista_cia: TDataSource;
    qry_traz_default_: TQuery;
    qry_pesquisa_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    sp_receb_cia_aerea: TStoredProc;
    sp_pagto_cia_aerea: TStoredProc;
    Update_Lista: TUpdateSQL;
    qry_lista_cia_CD_MASTER: TStringField;
    qry_lista_cia_CD_UNID_NEG: TStringField;
    qry_lista_cia_CD_PRODUTO: TStringField;
    qry_lista_cia_CD_VIA_TRANSP: TStringField;
    qry_lista_cia_CD_CIA_TRANSP: TStringField;
    qry_lista_cia_DT_EMBARQUE: TDateTimeField;
    qry_lista_cia_DT_EMISSAO_DTA: TDateTimeField;
    qry_lista_cia_NR_MASTER: TStringField;
    qry_lista_cia_CHARG_MASTER: TFloatField;
    qry_lista_cia_TARIFA_IMPRESSA: TFloatField;
    qry_lista_cia_VL_TAXA: TFloatField;
    qry_lista_cia_FRETE_REAL: TFloatField;
    qry_lista_cia_TARIFA_CUSTO_CIA: TFloatField;
    qry_lista_cia_OTHER_CH_AG: TFloatField;
    qry_lista_cia_OTHER_CH_CIA: TFloatField;
    qry_lista_cia_COM_IATA: TFloatField;
    qry_lista_cia_AP_MOEDA: TStringField;
    qry_lista_cia_VL_OVER: TFloatField;
    qry_lista_cia_calc_tt_prepaid: TFloatField;
    qry_lista_armador_: TQuery;
    ds_lista_armador: TDataSource;
    qry_lista_armador_CD_MASTER: TStringField;
    qry_lista_armador_CD_UNID_NEG: TStringField;
    qry_lista_armador_CD_PRODUTO: TStringField;
    qry_lista_armador_CD_VIA_TRANSP: TStringField;
    qry_lista_armador_CD_AGENTE: TStringField;
    qry_lista_armador_CD_ARMADOR: TStringField;
    qry_lista_armador_CD_NOTIFICADOR: TStringField;
    qry_lista_armador_TP_FRETE_MASTER: TStringField;
    qry_lista_armador_VL_COMISSAO: TFloatField;
    qry_lista_armador_CD_MOEDA: TStringField;
    qry_lista_armador_CD_ORIGEM: TStringField;
    qry_lista_armador_CD_DESTINO: TStringField;
    qry_lista_armador_NM_AGENTE: TStringField;
    qry_lista_armador_NM_ARMADOR: TStringField;
    qry_lista_armador_NM_NOTIFICADOR: TStringField;
    qry_lista_armador_AP_MOEDA: TStringField;
    qry_lista_armador_NM_ORIGEM: TStringField;
    qry_lista_armador_NM_DESTINO: TStringField;
    qry_lista_armador_NR_MASTER: TStringField;
    qry_lista_armador_TARIFA_AUX: TFloatField;
    qry_house_: TQuery;
    UpdateSQL1: TUpdateSQL;
    ds_house: TDataSource;
    qry_house_NR_PROCESSO: TStringField;
    qry_house_CD_MASTER: TStringField;
    qry_house_NR_MASTER: TStringField;
    qry_house_CD_HOUSE: TStringField;
    qry_house_NR_HOUSE: TStringField;
    qry_house_VL_OVER: TFloatField;
    qry_house_VL_COMISS_IATA: TFloatField;
    qry_lista_cia_IN_SEL_IATA: TStringField;
    qry_lista_cia_VL_PESO_BRUTO: TFloatField;
    qry_ult_ref_: TQuery;
    qry_ult_ref_ULT_REF: TStringField;
    sp_monta_pagto_ctapagar: TStoredProc;
    qry_ult_ref_receb_: TQuery;
    qry_ult_ref_receb_ULT_REF: TStringField;
    qry_lista_cia_TP_FRETE_MASTER: TStringField;
    qry_lista_cia_calc_tt_collect: TFloatField;
    qry_receb_pendente_: TQuery;
    qry_receb_pendente_NR_REF: TStringField;
    qry_receb_pendente_DT_MONTAGEM: TDateTimeField;
    qry_receb_pendente_CD_CIA: TStringField;
    qry_receb_pendente_VALOR: TFloatField;
    qry_receb_pendente_NM_CIA: TStringField;
    ds_receb_pendente: TDataSource;
    qry_receb_item_pendente_: TQuery;
    ds_receb_item_pendente_: TDataSource;
    qry_receb_item_pendente_NR_REF: TStringField;
    qry_receb_item_pendente_DT_MONTAGEM: TDateTimeField;
    qry_receb_item_pendente_NR_PROCESSO: TStringField;
    qry_receb_item_pendente_CD_ITEM: TStringField;
    qry_receb_item_pendente_CD_CIA: TStringField;
    qry_receb_item_pendente_VL_ITEM: TFloatField;
    qry_receb_item_pendente_CD_FAVORECIDO: TStringField;
    qry_receb_item_pendente_CD_STATUS: TStringField;
    qry_receb_item_pendente_COD_MASTER: TStringField;
    qry_receb_item_pendente_NM_ITEM: TStringField;
    qry_receb_item_pendente_calc_processo: TStringField;
    sp_efetua_recebimento_iata: TStoredProc;
    sp_fatura_relatorio_cia: TStoredProc;
    qry_lista_cia_NR_RELATORIO: TStringField;
    qry_impressao_rel_: TQuery;
    ds_impressa_rel: TDataSource;
    pp_impressao_rel: TppBDEPipeline;
    qry_impressao_rel_CD_MASTER: TStringField;
    qry_impressao_rel_CD_UNID_NEG: TStringField;
    qry_impressao_rel_CD_PRODUTO: TStringField;
    qry_impressao_rel_CD_VIA_TRANSP: TStringField;
    qry_impressao_rel_CD_CIA_TRANSP: TStringField;
    qry_impressao_rel_DT_EMBARQUE: TDateTimeField;
    qry_impressao_rel_IN_SEL_IATA: TStringField;
    qry_impressao_rel_DT_EMISSAO_DTA: TDateTimeField;
    qry_impressao_rel_NR_MASTER: TStringField;
    qry_impressao_rel_CHARG_MASTER: TFloatField;
    qry_impressao_rel_TARIFA_IMPRESSA: TFloatField;
    qry_impressao_rel_NR_RELATORIO: TStringField;
    qry_impressao_rel_VL_TAXA: TFloatField;
    qry_impressao_rel_TP_FRETE_MASTER: TStringField;
    qry_impressao_rel_FRETE_REAL: TFloatField;
    qry_impressao_rel_TARIFA_CUSTO_CIA: TFloatField;
    qry_impressao_rel_OTHER_CH_AG: TFloatField;
    qry_impressao_rel_OTHER_CH_CIA: TFloatField;
    qry_impressao_rel_COM_IATA: TFloatField;
    qry_impressao_rel_VL_PESO_BRUTO: TFloatField;
    qry_impressao_rel_VL_OVER: TFloatField;
    qry_impressao_rel_AP_MOEDA: TStringField;
    qry_impressao_rel_NM_CIA: TStringField;
    qry_impressao_rel_NM_UNID_NEG: TStringField;
    qry_impressao_rel_calc_tt_prepaid: TFloatField;
    qry_impressao_rel_calc_tt_collect: TFloatField;
    qry_impressao_rel_IN_IRRF_FATURA: TStringField;
    qry_impressao_rel_IN_CALC_IR_IATA: TStringField;
    qry_impressao_rel_IN_CALC_IR_OVER: TStringField;
    qry_impressao_rel_calc_vl_ir: TFloatField;
    qry_impressao_rel_vl_tt_relatorio: TFloatField;
    qry_impressao_rel_calc_vl_pp: TFloatField;
    qry_lista_cia_IN_CALC_IR_IATA: TStringField;
    qry_lista_cia_IN_CALC_IR_OVER: TStringField;
    qry_lista_cia_TP_FATURA: TStringField;
    qry_lista_cia_IN_IRRF_MIN: TStringField;
    qry_lista_cia_IN_IRRF_FATURA: TStringField;
    qry_lista_cia_calc_vl_ir: TFloatField;
    qry_param_: TQuery;
    qry_param_VL_MIN_IR: TFloatField;
    qry_param_VL_ALIQ_IR: TFloatField;
    qry_impressao_rel_TP_FATURA: TStringField;
    qry_impressao_rel_IN_IRRF_MIN: TStringField;
    qry_impressao_rel_calc_sinal_ir: TStringField;
    qry_lista_cia_calc_ir_iata: TFloatField;
    qry_lista_cia_calc_ir_over: TFloatField;
    procedure qry_lista_cia_AfterOpen(DataSet: TDataSet);
    procedure qry_lista_cia_CalcFields(DataSet: TDataSet);
    procedure qry_lista_cia_AfterPost(DataSet: TDataSet);
    procedure qry_receb_item_pendente_CalcFields(DataSet: TDataSet);
    procedure qry_impressao_rel_CalcFields(DataSet: TDataSet);
    
  private
    { Private declarations }

  public
    { Public declarations }
    vl_tt_frete, vl_tt_ir :Real;
  end;

var
  datm_proc_iata: Tdatm_proc_iata;

implementation

uses PGGP001, Funcoes, uProcIata;

{$R *.DFM}

procedure Tdatm_proc_iata.qry_lista_cia_AfterOpen(DataSet: TDataSet);
begin

//frm_proc_iata.edt_tt_frete.text := Formatfloat('0.00',vl_tt_frete );
//frm_proc_iata.edt_tt_iata.text  := Formatfloat('0.00',vl_tt_iata );
//frm_proc_iata.edt_tt_over.text  := Formatfloat('0.00',vl_tt_over );
end;

procedure Tdatm_proc_iata.qry_lista_cia_CalcFields(DataSet: TDataSet);
begin
 if qry_lista_cia_TP_FRETE_MASTER.AsString = '1' then
   begin
    qry_lista_cia_calc_tt_collect.AsFloat := 0;
    qry_lista_cia_calc_tt_prepaid.AsFloat := (qry_lista_cia_FRETE_REAL.AsFloat + qry_lista_cia_OTHER_CH_CIA.AsFloat) -
          (qry_lista_cia_VL_OVER.Asfloat + qry_lista_cia_OTHER_CH_AG.AsFloat + qry_lista_cia_COM_IATA.AsFloat);
   end
 else
   begin
   qry_lista_cia_calc_tt_prepaid.AsFloat := 0;
   qry_lista_cia_calc_tt_collect.AsFloat :=  (qry_lista_cia_VL_OVER.Asfloat + qry_lista_cia_OTHER_CH_AG.AsFloat + qry_lista_cia_COM_IATA.AsFloat);
   end;

 qry_lista_cia_calc_ir_iata.AsFloat := 0;
 qry_lista_cia_calc_ir_over.AsFloat := 0;

 if qry_lista_cia_IN_CALC_IR_IATA.AsString = '1' then
   qry_lista_cia_calc_ir_iata.AsFloat :=  (qry_lista_cia_COM_IATA.Asfloat * (qry_param_VL_ALIQ_IR.AsFloat )/100);

 if qry_lista_cia_IN_CALC_IR_OVER.AsString = '1' then
   qry_lista_cia_calc_ir_over.AsFloat :=   (qry_lista_cia_VL_OVER.Asfloat * (qry_param_VL_ALIQ_IR.AsFloat )/100);

  qry_lista_cia_calc_vl_ir.AsFloat := qry_lista_cia_calc_ir_over.AsFloat + qry_lista_cia_calc_ir_iata.AsFloat ;

 IF qry_lista_cia_IN_SEL_IATA.AsString = '1' then
  begin
    vl_tt_frete := vl_tt_frete + (qry_lista_cia_calc_tt_prepaid.AsFloat - qry_lista_cia_calc_tt_collect.AsFloat);
    vl_tt_ir    := vl_tt_ir + qry_lista_cia_calc_vl_ir.AsFloat;
  end;


end;

procedure Tdatm_proc_iata.qry_lista_cia_AfterPost(DataSet: TDataSet);
begin
qry_lista_cia_.ApplyUpdates;
end;

procedure Tdatm_proc_iata.qry_receb_item_pendente_CalcFields(
  DataSet: TDataSet);
begin
qry_receb_item_pendente_calc_processo.AsString := copy(qry_receb_item_pendente_NR_PROCESSO.AsString, 5,10);
end;

procedure Tdatm_proc_iata.qry_impressao_rel_CalcFields(DataSet: TDataSet);
begin
 if qry_impressao_rel_TP_FRETE_MASTER.AsString = '1' then
   begin
    qry_impressao_rel_calc_tt_collect.AsFloat := 0;
    qry_impressao_rel_calc_tt_prepaid.AsFloat := (qry_impressao_rel_FRETE_REAL.AsFloat + qry_impressao_rel_OTHER_CH_CIA.AsFloat) -
          (qry_impressao_rel_VL_OVER.Asfloat + qry_impressao_rel_OTHER_CH_AG.AsFloat + qry_impressao_rel_COM_IATA.AsFloat);

    qry_impressao_rel_calc_vl_pp.AsFloat := (qry_impressao_rel_FRETE_REAL.AsFloat + qry_impressao_rel_OTHER_CH_CIA.AsFloat);

   end
 else
   begin
    qry_impressao_rel_calc_vl_pp.AsFloat :=  qry_impressao_rel_OTHER_CH_CIA.AsFloat ;


   qry_impressao_rel_calc_tt_prepaid.AsFloat := 0;
   qry_impressao_rel_calc_tt_collect.AsFloat :=  (qry_impressao_rel_VL_OVER.Asfloat + qry_impressao_rel_OTHER_CH_AG.AsFloat + qry_impressao_rel_COM_IATA.AsFloat);
   end;

 qry_impressao_rel_calc_vl_ir.AsFloat := 0 ;

 if qry_impressao_rel_IN_CALC_IR_IATA.AsString = '1' then
      qry_impressao_rel_calc_vl_ir.AsFloat :=  qry_impressao_rel_calc_vl_ir.AsFloat + (qry_impressao_rel_COM_IATA.Asfloat * (qry_param_VL_ALIQ_IR.AsFloat )/100);

 if qry_impressao_rel_IN_CALC_IR_OVER.AsString = '1' then
   qry_impressao_rel_calc_vl_ir.AsFloat :=  qry_impressao_rel_calc_vl_ir.AsFloat + (qry_impressao_rel_VL_OVER.Asfloat * (qry_param_VL_ALIQ_IR.AsFloat )/100);

 if strtofloat(frm_proc_iata.edt_vl_tt_ir.text ) = 0 then
   qry_impressao_rel_calc_vl_ir.AsFloat := 0 ;

 if  qry_impressao_rel_IN_IRRF_FATURA.AsString = '0' then //demostrativo
   begin
    qry_impressao_rel_vl_tt_relatorio.AsFloat := (qry_impressao_rel_calc_vl_pp.AsFloat  - qry_impressao_rel_calc_tt_collect.AsFloat);

                                                   ;
    //                    (qry_impressao_rel_COM_IATA.AsFloat + qry_impressao_rel_VL_OVER.AsFloat);
    qry_impressao_rel_calc_sinal_ir.AsString := '';
   end;


  if  qry_impressao_rel_IN_IRRF_FATURA.AsString = '1' then //credito
   begin
    qry_impressao_rel_vl_tt_relatorio.AsFloat :=
                        ( qry_impressao_rel_calc_vl_pp.AsFloat ) -
                        (qry_impressao_rel_COM_IATA.AsFloat + qry_impressao_rel_VL_OVER.AsFloat) +
                         qry_impressao_rel_calc_vl_ir.AsFloat;
    qry_impressao_rel_calc_sinal_ir.AsString := '+';
   end;

  if  qry_impressao_rel_IN_IRRF_FATURA.AsString = '2' then //debito
   begin
    qry_impressao_rel_vl_tt_relatorio.AsFloat :=
                       ( qry_impressao_rel_calc_vl_pp.AsFloat ) -
                        (qry_impressao_rel_COM_IATA.AsFloat + qry_impressao_rel_VL_OVER.AsFloat) -
                         qry_impressao_rel_calc_vl_ir.AsFloat;
   qry_impressao_rel_calc_sinal_ir.AsString := '-';
   end;

  qry_impressao_rel_vl_tt_relatorio.AsFloat := qry_impressao_rel_vl_tt_relatorio.AsFloat +  (qry_impressao_rel_OTHER_CH_CIA.AsFloat - qry_impressao_rel_OTHER_CH_AG.AsFloat);





end;

end.
