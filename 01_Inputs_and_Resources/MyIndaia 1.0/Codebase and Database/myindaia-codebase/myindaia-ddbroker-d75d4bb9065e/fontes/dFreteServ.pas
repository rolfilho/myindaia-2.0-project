unit dFreteServ;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables, RxDBComb, COnsOnlineEx;

type
  Tdatm_frete_serv = class(TDataModule)
    qry_pesquisa_: TQuery;
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_frete_: TQuery;
    qry_frete_DESC_TAB_FRETE: TStringField;
    qry_frete_DT_TAB_FRETE: TDateTimeField;
    qry_frete_CD_EMPRESA: TStringField;
    qry_frete_QTD_DIAS_TAB_FRETE: TFloatField;
    qry_frete_CD_CIA_TRANSP_TAB_FRETE: TStringField;
    qry_frete_CD_MOEDA_TAB_FRETE: TStringField;
    qry_frete_TRANSIT_TIME_TAB_FRETE: TStringField;
    qry_frete_TP_FREQUENCIA_TAB_FRETE: TStringField;
    qry_frete_CD_ORIGEM_TAB_FRETE: TStringField;
    qry_frete_CD_DESTINO_TAB_FRETE: TStringField;
    qry_frete_TP_EMP_FRETE: TStringField;
    qry_frete_CD_ARMADOR: TStringField;
    qry_frete_CD_VIA_TRANSP: TStringField;
    qry_frete_NM_AGENTE: TStringField;
    qry_frete_NM_ARMADOR: TStringField;
    qry_frete_NM_EMPRESA: TStringField;
    qry_frete_NM_CIA_TRANSP: TStringField;
    ds_frete: TDataSource;
    UpDAte_frete: TUpdateSQL;
    qry_ult_frete_: TQuery;
    qry_ult_frete_ULTIMO: TStringField;
    qry_tipo_frequencia_: TQuery;
    qry_ult_tarifas_: TQuery;
    qry_frete_TP_CARGA: TStringField;
    qry_frete_Look_nm_tp_Freg: TStringField;
    qry_frete_NM_MOEDA: TStringField;
    qry_tarifa_aerea_: TQuery;
    qry_tarifa_aerea_CD_TAB_FRETE: TStringField;
    qry_tarifa_aerea_PESO_TAB_FRETE: TFloatField;
    qry_tarifa_aerea_VOLUME_TAB_FRETE: TStringField;
    qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE: TStringField;
    qry_tarifa_aerea_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_tarifa_aerea_VL_VENDA_TAB_FRETE: TFloatField;
    qry_tarifa_aerea_PERC_VENDA_TAB_FRETE: TFloatField;
    qry_tarifa_aerea_VL_DIFERENCA: TFloatField;
    qry_tarifa_aerea_VL_COMPRA_CIA_ARMADOR: TFloatField;
    ds_tarifa_aerea: TDataSource;
    qry_ult_tarifas_ULTIMO: TStringField;
    qry_tarifa_aerea_CD_ITEM_TAB_FRETE: TStringField;
    UpDate_tarifa_aerea: TUpdateSQL;
    qry_tarifa_aerea_TP_FRETE: TStringField;
    qry_frete_CD_TAB_FRETE: TStringField;
    qry_tarifa_aerea_CD_TAB_REF: TStringField;
    qry_frete_despesas_: TQuery;
    ds_despesas: TDataSource;
    UpDate_despesas: TUpdateSQL;
    qry_frete_despesas_CD_TAB_FRETE: TStringField;
    qry_frete_despesas_CD_ITEM: TStringField;
    qry_frete_despesas_TP_BASE_CALCULO: TStringField;
    qry_frete_despesas_CD_MOEDA: TStringField;
    qry_frete_despesas_TP_ORIGEM_DESPESA: TStringField;
    qry_frete_despesas_VL_BASE_DESPESA: TFloatField;
    qry_frete_despesas_VL_COMPRA_AG: TFloatField;
    qry_frete_despesas_VL_COMPRA_CIA: TFloatField;
    qry_frete_despesas_VL_VENDA: TFloatField;
    qry_frete_despesas_IN_DESPESA: TStringField;
    qry_frete_despesas_IN_MENCIONADO: TStringField;
    qry_moeda_broker_: TQuery;
    qry_item_: TQuery;
    qry_origem_custo_: TQuery;
    qry_depesa_por_: TQuery;
    qry_moeda_broker_NM_MOEDA: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_origem_custo_NM_ORIGEM_DESP: TStringField;
    qry_depesa_por_NM_ORIGEM_DESP: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_TX_YESNO: TStringField;
    qry_depesa_por_CD_ORIGEM_DESP: TStringField;
    qry_frete_despesas_Look_nm_depesa_por: TStringField;
    qry_yes_no_CD_YESNO: TStringField;
    qry_frete_despesas_Look_nm_mencionado: TStringField;
    qry_origem_custo_CD_ORIGEM_DESP: TStringField;
    qry_frete_despesas_Look_nm_origem_custo: TStringField;
    qry_item_CD_ITEM: TStringField;
    qry_moeda_broker_CD_MOEDA: TStringField;
    qry_tp_base_calc_: TQuery;
    qry_tp_base_calc_CD_TP_BASE_CALC_FRETE: TStringField;
    qry_tp_base_calc_NM_TP_BASE_CALC_FRETE: TStringField;
    qry_frete_despesas_Look_nm_tp_base: TStringField;
    qry_frete_despesas_CD_TAB_REF: TStringField;
    qry_frete_TX_OBS_TAB_FRETE: TStringField;
    qry_frete_despesas_TP_FRETE: TStringField;
    qry_tarifas_FCL_: TQuery;
    ds_tarifas_FCL: TDataSource;
    Update_tarifas_FCL: TUpdateSQL;
    qry_tarifas_FCL_CD_TAB_FRETE: TStringField;
    qry_tarifas_FCL_CD_ITEM_TAB_FRETE: TStringField;
    qry_tarifas_FCL_VOLUME_TAB_FRETE: TStringField;
    qry_tarifas_FCL_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_tarifas_FCL_VL_VENDA_TAB_FRETE: TFloatField;
    qry_tarifas_FCL_VL_COMPRA_CIA_ARMADOR: TFloatField;
    qry_tarifas_FCL_TP_FRETE: TStringField;
    qry_tarifas_FCL_CD_TAB_REF: TStringField;
    qry_cntr_: TQuery;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_tarifas_FCL_Look_nm_cntr: TStringField;
    qry_despesa_FCL_: TQuery;
    ds_desepsa_FCL: TDataSource;
    Update_despesa_FCL: TUpdateSQL;
    qry_despesa_FCL_CD_TAB_FRETE: TStringField;
    qry_despesa_FCL_CD_ITEM: TStringField;
    qry_despesa_FCL_TP_BASE_CALCULO: TStringField;
    qry_despesa_FCL_CD_MOEDA: TStringField;
    qry_despesa_FCL_TP_ORIGEM_DESPESA: TStringField;
    qry_despesa_FCL_CD_TAB_REF: TStringField;
    qry_despesa_FCL_TP_ESTUFAGEM: TStringField;
    qry_despesa_FCL_VL_BASE_DESPESA: TFloatField;
    qry_despesa_FCL_VL_COMPRA_AG: TFloatField;
    qry_despesa_FCL_VL_COMPRA_CIA: TFloatField;
    qry_despesa_FCL_VL_VENDA: TFloatField;
    qry_despesa_FCL_IN_DESPESA: TStringField;
    qry_despesa_FCL_IN_MENCIONADO: TStringField;
    qry_despesa_FCL_TP_FRETE: TStringField;
    qry_despesa_FCL_Look_nm_despesa: TStringField;
    qry_despesa_FCL_Look_nm_origem: TStringField;
    qry_despesa_FCL_Look_nm_mencionado: TStringField;
    qry_despesa_FCL_Look_nm_tp_base: TStringField;
    qry_tarifas_FCL_TP_ESTUFAGEM: TStringField;
    qry_tarifa_aerea_TP_ESTUFAGEM: TStringField;
    qry_frete_despesas_TP_ESTUFAGEM: TStringField;
    qry_frete_VL_OTHER_CHARGE: TFloatField;
    qry_frete_despesas_VL_INTERVALO_INICIAL: TFloatField;
    qry_frete_despesas_VL_INTERVALO_FINAL: TFloatField;
    qry_frete_NR_TRANSIT_TIME: TFloatField;
    qry_frete_NR_FRQUENCIA: TFloatField;
    qry_frete_despesas_CODIGO: TStringField;
    qry_despesa_FCL_CODIGO: TStringField;
    qry_ult_despesa_: TQuery;
    qry_ult_despesa_ULTIMO: TStringField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_frete_calc_tp_tarifa: TStringField;
    qry_frete_TARIFA: TStringField;
    qry_tarifa_aerea_calc_tp_simb_maritimo: TStringField;
    qry_despesa_FCL_VL_INTERVALO_INICIAL: TFloatField;
    qry_despesa_FCL_VL_INTERVALO_FINAL: TFloatField;
    qry_lista_iata: TQuery;
    qry_lista_iataCD_TAB_FRETE: TStringField;
    qry_lista_iataCD_ORIGEM_TAB_FRETE: TStringField;
    qry_lista_iataCD_DESTINO_TAB_FRETE: TStringField;
    qry_lista_iataCD_MOEDA_TAB_FRETE: TStringField;
    ds_lista_iata: TDataSource;
    qry_lista_iataAP_ORIGEM: TStringField;
    qry_lista_iataNM_ORIGEM: TStringField;
    qry_lista_iataAP_DESTINO: TStringField;
    qry_lista_iataNM_DESTINO: TStringField;
    qry_item_iata_: TQuery;
    ds_item_iata: TDataSource;
    update_item_iata: TUpdateSQL;
    update_list_iata: TUpdateSQL;
    qry_lista_iataLook_nm_moeda: TStringField;
    qry_lista_iataTP_EMP_FRETE: TStringField;
    qry_lista_iataDESC_TAB_FRETE: TStringField;
    qry_item_iata_CD_TAB_FRETE: TStringField;
    qry_item_iata_CD_ITEM_TAB_FRETE: TStringField;
    qry_item_iata_PESO_TAB_FRETE: TFloatField;
    qry_item_iata_TP_FRETE: TStringField;
    qry_item_iata_TP_ESTUFAGEM: TStringField;
    qry_item_iata_VOLUME_TAB_FRETE: TStringField;
    qry_item_iata_TTIPO_SIMBOLO_TAB_FRETE: TStringField;
    qry_item_iata_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_item_iata_CD_TAB_REF: TStringField;
    qry_item_iata_VL_VENDA_TAB_FRETE: TFloatField;
    qry_item_iata_PERC_VENDA_TAB_FRETE: TFloatField;
    qry_item_iata_VL_DIFERENCA: TFloatField;
    qry_item_iata_VL_COMPRA_CIA_ARMADOR: TFloatField;
    qry_frete_IN_ATIVO: TStringField;
    qry_frete_despesas_calcItem: TStringField;
    qry_frete_despesas_calcMoeda: TStringField;
    qry_despesa_FCL_calcItem: TStringField;
    qry_despesa_FCL_calcMoeda: TStringField;
    qry_frete_IN_DESEMBARACO: TIntegerField;
    qry_frete_CD_AGENTE_TAB_FRETE: TStringField;
    qry_frete_despesas_TP_CNTR: TStringField;
    qryTpCntr: TQuery;
    qryTpCntrTP_CNTR: TStringField;
    qryTpCntrNM_TP_CNTR: TStringField;
    qry_frete_despesas_lookTpCntr: TStringField;
    qry_despesa_FCL_TP_CNTR: TStringField;
    qry_despesa_FCL_lookTpCntr: TStringField;
    qry_lista_cd_tab_frete: TStringField;
    qry_lista_desc_tab_frete: TStringField;
    qry_lista_cd_origem_tab_frete: TStringField;
    qry_lista_cd_destino_tab_frete: TStringField;
    qry_lista_TP_EMP_FRETE: TStringField;
    qry_lista_CD_VIA_TRANSP: TStringField;
    qry_lista_CODIGO: TStringField;
    qry_lista_IN_DESEMBARACO: TIntegerField;
    qry_lista_NM_REF: TStringField;
    qry_lista_CD_ARMADOR: TStringField;
    qry_lista_NM_ARM: TStringField;
    qry_lista_CD_CIA_TRANSP_TAB_FRETE: TStringField;
    qry_lista_NM_CIA: TStringField;
    procedure qry_frete_aplica(DataSet: TDataSet);
    procedure qry_frete_BeforePost(DataSet: TDataSet);
    procedure qry_tarifa_aerea_Aplica(DataSet: TDataSet);
    procedure qry_tarifa_aerea_BeforePost(DataSet: TDataSet);
    procedure qry_tarifa_aerea_NewRecord(DataSet: TDataSet);
    procedure qry_tarifa_aerea_AfterScroll(DataSet: TDataSet);
    procedure qry_frete_despesas_AfterDelete(DataSet: TDataSet);
    procedure qry_frete_despesas_AfterPost(DataSet: TDataSet);
    procedure qry_frete_despesas_NewRecord(DataSet: TDataSet);
    procedure qry_frete_despesas_AfterScroll(DataSet: TDataSet);
    procedure qry_tarifas_FCL_Aplica(DataSet: TDataSet);
    procedure qry_tarifas_FCL_NewRecord(DataSet: TDataSet);
    procedure qry_tarifas_FCL_BeforePost(DataSet: TDataSet);
    procedure qry_tarifas_FCL_AfterScroll(DataSet: TDataSet);
    procedure qry_despesa_FCL_Aplica(DataSet: TDataSet);
    procedure qry_despesa_FCL_NewRecord(DataSet: TDataSet);
    procedure qry_tarifa_aerea_VL_VENDA_TAB_FRETEChange(Sender: TField);
    procedure qry_tarifa_aerea_VL_COMPRA_TAB_FRETEChange(Sender: TField);
    procedure qry_frete_despesas_CD_ITEMChange(Sender: TField);
    procedure qry_despesa_FCL_CD_ITEMChange(Sender: TField);
    procedure qry_frete_despesas_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_FCL_BeforeDelete(DataSet: TDataSet);
    procedure qry_tarifa_aerea_BeforeDelete(DataSet: TDataSet);
    procedure qry_tarifas_FCL_BeforeDelete(DataSet: TDataSet);
    procedure qry_tarifas_FCL_VL_VENDA_TAB_FRETEChange(Sender: TField);
    procedure qry_frete_despesas_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_despesa_FCL_VL_VENDAChange(Sender: TField);
    procedure qry_despesa_FCL_AfterScroll(DataSet: TDataSet);
    procedure qry_frete_despesas_BeforePost(DataSet: TDataSet);
    procedure qry_despesa_FCL_BeforePost(DataSet: TDataSet);
    procedure qry_frete_CalcFields(DataSet: TDataSet);
    procedure qry_despesa_FCL_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_frete_despesas_TP_ORIGEM_DESPESAChange(Sender: TField);
    procedure qry_tarifa_aerea_CalcFields(DataSet: TDataSet);
    procedure qry_frete_despesas_IN_DESPESAChange(Sender: TField);
    procedure qry_despesa_FCL_IN_DESPESAChange(Sender: TField);
    procedure qry_tarifas_FCL_VL_COMPRA_TAB_FRETEChange(Sender: TField);
    procedure qry_despesa_FCL_VL_COMPRA_AGChange(Sender: TField);
    procedure qry_frete_despesas_VL_COMPRA_AGChange(Sender: TField);
    procedure qry_lista_iata_aplica(DataSet: TDataSet);
    procedure qry_lista_iataBeforePost(DataSet: TDataSet);
    procedure qry_item_iata_NewRecord(DataSet: TDataSet);
    procedure qry_item_iata_Aplica(DataSet: TDataSet);
    procedure qry_item_iata_AfterScroll(DataSet: TDataSet);
    procedure qry_item_iata_BeforePost(DataSet: TDataSet);
    procedure qry_frete_despesas_CalcFields(DataSet: TDataSet);
    procedure qry_frete_despesas_CD_ITEMSetText(Sender: TField;
      const Text: String);
    procedure qry_despesa_FCL_CalcFields(DataSet: TDataSet);
    procedure qry_frete_despesas_CD_MOEDASetText(Sender: TField;
      const Text: String);
    procedure qry_frete_AfterScroll(DataSet: TDataSet);
    procedure ds_listaDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    vPreencheu: Boolean;
  public
    { Public declarations }
  end;

var
  datm_frete_serv: Tdatm_frete_serv;

implementation

uses GSMLIB, uFreteServ;

{$R *.DFM}

procedure Tdatm_frete_serv.qry_frete_aplica(DataSet: TDataSet);
begin
  qry_frete_.ApplyUpdates;
end;

procedure Tdatm_frete_serv.qry_frete_BeforePost(DataSet: TDataSet);
begin
  if qry_frete_.State in [dsinsert] then
    qry_frete_CD_TAB_FRETE.AsString := UltCod(qry_ult_frete_, qry_ult_frete_ULTIMO);

  qry_frete_DESC_TAB_FRETE.AsString := frm_frete_serv.str_ap_origem+'/'+frm_frete_serv.str_ap_destino+'/'+qry_frete_NM_MOEDA.AsString +'/'+ frm_frete_serv.str_tp_carga;

end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_Aplica(DataSet: TDataSet);
begin
  qry_tarifa_aerea_.ApplyUpdates;
end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_BeforePost(DataSet: TDataSet);
begin
  if qry_tarifa_aerea_.State in [dsInsert] then begin
    qry_ult_tarifas_.DataSource := ds_tarifa_aerea;
    qry_tarifa_aerea_CD_ITEM_TAB_FRETE.AsString := UltCod(qry_ult_tarifas_,qry_ult_tarifas_ULTIMO);
  end;
end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_NewRecord(DataSet: TDataSet);
begin
  if not frm_frete_serv.st_incluir then begin
    qry_tarifa_aerea_.Cancel;
    Exit;
  end;
  qry_tarifa_aerea_TP_FRETE.AsString      := qry_frete_TP_EMP_FRETE.AsString;
  qry_tarifa_aerea_CD_TAB_FRETE.AsString  := qry_frete_CD_TAB_FRETE.AsString;
  qry_tarifa_aerea_CD_TAB_REF.AsString    := qry_frete_CD_TAB_FRETE.AsString;
  qry_tarifa_aerea_TP_ESTUFAGEM.AsString  := '0';


  with frm_frete_serv do begin
     if pgctrl_frete.ActivePageIndex=1 then begin
        if pcTarifas.ActivePage = TabTarifaAerea then  begin
          if qry_tarifa_aerea_.RecordCount = 0 then
            qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value := 'MIN';

          if qry_tarifa_aerea_.RecordCount = 1 then    begin
             qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value:='-';
             qry_tarifa_aerea_PESO_TAB_FRETE.Value          :=45.0;
          end;

          if qry_tarifa_aerea_.RecordCount > 1 then  begin
             qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value:='+';
             case qry_tarifa_aerea_.RecordCount of
               2:qry_tarifa_aerea_PESO_TAB_FRETE.Value := 45.0;
               3:qry_tarifa_aerea_PESO_TAB_FRETE.Value := 100.0;
               4:qry_tarifa_aerea_PESO_TAB_FRETE.Value := 300.0;
               5:qry_tarifa_aerea_PESO_TAB_FRETE.Value := 500.0;
               6:qry_tarifa_aerea_PESO_TAB_FRETE.Value := 1000.0;
             end;
          end;
        end;

        if pcTarifas.ActivePage = TabTarifaMaritima then  begin
           case qry_tarifa_aerea_.RecordCount of
              0: qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value := '1';  //'Mínimo LCL';
              1: qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value := '0';  //'Tarifa LCL';

              {
              2: qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value := '3';  //'Mínimo Break Bulk';
              3: qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.Value := '2';  //'Tarifa Break Bulk';
              }
           end;
        end;
     end;
  end;

end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_AfterScroll(DataSet: TDataSet);
begin
  if (qry_frete_TP_EMP_FRETE.AsString = '0')  then begin
     if qry_tarifa_aerea_TP_FRETE.AsString = '0' then begin
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[1].ReadOnly := false;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[2].ReadOnly := false;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[3].ReadOnly := false;
     end;
  end;

  if (qry_frete_TP_EMP_FRETE.AsString = '1') then  begin
     if qry_tarifa_aerea_TP_FRETE.AsString = '0' then begin
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[0].ReadOnly := true;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[1].ReadOnly := true;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[2].ReadOnly := true;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[3].ReadOnly := false;
     end;
     if qry_tarifa_aerea_TP_FRETE.AsString = '1' then begin
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[0].ReadOnly := true;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[1].ReadOnly := false;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[2].ReadOnly := true;
       frm_frete_serv.dbgrid_tarifa_aerea.Columns[3].ReadOnly := false;
    end;
  end;
  if qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.AsString = 'MIN' then
     frm_frete_serv.dbgrid_tarifa_aerea.Columns[1].ReadOnly := true;

end;

procedure Tdatm_frete_serv.qry_frete_despesas_AfterDelete(DataSet: TDataSet);
begin
  qry_frete_despesas_.ApplyUpdates;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu then
    qry_frete_despesas_.ApplyUpdates
  else
    ShowMessage('Os Dados são inconsistentes! Operação Cancelada!')
end;

procedure Tdatm_frete_serv.qry_frete_despesas_NewRecord(DataSet: TDataSet);
begin
  if not frm_frete_serv.st_incluir then begin
    qry_frete_despesas_.Cancel;
    Exit;
  end;
  qry_frete_despesas_TP_ESTUFAGEM.AsString      := '0';
  qry_frete_despesas_TP_CNTR.AsString           := '';
  qry_frete_despesas_IN_MENCIONADO.AsString     := '0';
  qry_frete_despesas_IN_DESPESA.AsString        := '4';
  qry_frete_despesas_CD_TAB_FRETE.AsString      := qry_frete_CD_TAB_FRETE.AsString;
  qry_frete_despesas_CD_TAB_REF.AsString        := qry_frete_CD_TAB_FRETE.AsString;
  qry_frete_despesas_TP_FRETE.AsString          := qry_frete_TP_EMP_FRETE.AsString;
  qry_frete_despesas_TP_ORIGEM_DESPESA.AsString := '7';
  qry_frete_despesas_VL_COMPRA_AG.AsFloat       := 0;
  qry_frete_despesas_VL_COMPRA_CIA.AsFloat      := 0;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_AfterScroll(DataSet: TDataSet);
begin
  if qry_frete_TP_EMP_FRETE.AsString = '0' then
    if qry_frete_despesas_TP_FRETE.AsString = '0' then begin
       frm_frete_serv.dbgrid_despesa_aerea.Columns[0].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[1].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[2].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[3].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[4].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[5].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[6].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[7].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[8].ReadOnly  := true;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[9].ReadOnly  := false;
       frm_frete_serv.dbgrid_despesa_aerea.Columns[10].ReadOnly := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[0].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[1].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[2].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[3].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[4].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[5].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[6].ReadOnly    := FALSE;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[7].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[8].ReadOnly    := true;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[9].ReadOnly    := false;
       frm_frete_serv.dbgrid_despesa_LCL.Columns[10].ReadOnly   := false;
     end;


  if qry_frete_TP_EMP_FRETE.AsString = '1' then  begin
    if qry_frete_despesas_TP_FRETE.AsString = '0' then begin
      frm_frete_serv.dbgrid_despesa_aerea.Columns[0].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[1].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[2].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[3].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[4].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[5].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[6].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[7].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[8].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[9].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[10].ReadOnly := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[0].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[1].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[2].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[3].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[4].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[5].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[6].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[7].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[8].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[9].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[10].ReadOnly   := true;
    end;
    if qry_frete_despesas_TP_FRETE.AsString = '1' then begin
      frm_frete_serv.dbgrid_despesa_aerea.Columns[0].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[1].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[2].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[3].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[4].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[5].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[6].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[7].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[8].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[9].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_aerea.Columns[10].ReadOnly := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[0].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[1].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[2].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[3].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[4].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[5].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[6].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[7].ReadOnly    := true;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[8].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[9].ReadOnly    := false;
      frm_frete_serv.dbgrid_despesa_LCL.Columns[10].ReadOnly   := false;
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_Aplica(DataSet: TDataSet);
begin
  qry_tarifas_FCL_.ApplyUpDates;
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_NewRecord(DataSet: TDataSet);
begin
  if not frm_frete_serv.st_incluir then begin
    qry_tarifas_FCL_.Cancel;
    Exit;
  end;
  qry_tarifas_FCL_TP_FRETE.AsString     := qry_frete_TP_EMP_FRETE.AsString;
  qry_tarifas_FCL_CD_TAB_FRETE.AsString := qry_frete_CD_TAB_FRETE.AsString;
  qry_tarifas_FCL_CD_TAB_REF.AsString   := qry_frete_CD_TAB_FRETE.AsString;
  qry_tarifas_FCL_TP_ESTUFAGEM.AsString := '1';
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_BeforePost(DataSet: TDataSet);
begin
  if qry_tarifas_FCL_.State in [dsInsert] then begin
    qry_ult_tarifas_.DataSource := ds_tarifas_FCL;
    qry_tarifas_FCL_CD_ITEM_TAB_FRETE.AsString := UltCod(qry_ult_tarifas_,qry_ult_tarifas_ULTIMO);
  end;
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_AfterScroll(DataSet: TDataSet);
begin
  if qry_frete_TP_EMP_FRETE.AsString = '0' then begin
    if qry_tarifas_FCL_TP_FRETE.AsString = '0'then begin
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[0].ReadOnly := false;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[1].ReadOnly := false;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[2].ReadOnly := false;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[3].ReadOnly := false;
    end;
  end;
  if qry_frete_TP_EMP_FRETE.AsString = '1' then begin
    if qry_tarifa_aerea_TP_FRETE.AsString = '0'then begin
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[0].ReadOnly := true;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[1].ReadOnly := true;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[2].ReadOnly := true;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[3].ReadOnly := false;
    end;
    if qry_tarifa_aerea_TP_FRETE.AsString= '1'then begin
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[0].ReadOnly := false;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[1].ReadOnly := false;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[2].ReadOnly := true;
      frm_frete_serv.dbgrid_tarifas_FCL.Columns[3].ReadOnly := false;
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_Aplica(DataSet: TDataSet);
begin
  qry_despesa_FCL_.ApplyUpDates;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_NewRecord(DataSet: TDataSet);
begin
  if not frm_frete_serv.st_incluir then begin
    qry_despesa_FCL_.Cancel;
    Exit;
  end;
  qry_despesa_FCL_CD_TAB_FRETE.AsString      := qry_frete_CD_TAB_FRETE.AsString;
  qry_despesa_FCL_CD_TAB_REF.AsString        := qry_frete_CD_TAB_FRETE.AsString;
  qry_despesa_FCL_TP_FRETE.AsString          := qry_frete_TP_EMP_FRETE.AsString;
  qry_despesa_FCL_TP_ESTUFAGEM.AsString      := '1';
  qry_despesa_FCL_TP_CNTR.AsString           := '';
  qry_despesa_FCL_VL_COMPRA_CIA.AsFloat      := 0;
  qry_despesa_FCL_VL_COMPRA_AG.AsFloat       := 0;
  qry_despesa_FCL_IN_MENCIONADO.AsString     := '0';
  qry_despesa_FCL_IN_DESPESA.AsString        := '4';
  qry_despesa_FCL_TP_ORIGEM_DESPESA.AsString := '7';
end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_VL_VENDA_TAB_FRETEChange(Sender: TField);
begin
  if frm_frete_serv.st_tp_frete = '2' then
     if qry_tarifa_aerea_VL_VENDA_TAB_FRETE.Asfloat < qry_tarifa_aerea_VL_COMPRA_TAB_FRETE.Asfloat then begin
        BoxMensagem('O Valor de venda está inferior ao acordado com o Agente!',2);
        qry_tarifa_aerea_.CAncel;
     end;

end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_VL_COMPRA_TAB_FRETEChange(Sender: TField);
begin
  if (frm_frete_serv.st_tp_frete = '1') and not(qry_tarifa_aerea_VL_COMPRA_CIA_ARMADOR.IsNull) then  begin
    if qry_tarifa_aerea_VL_COMPRA_TAB_FRETE.Asfloat < qry_tarifa_aerea_VL_COMPRA_CIA_ARMADOR.Asfloat then begin
      qry_tarifa_aerea_.Cancel;
      BoxMensagem('O Valor de Compra para Agente está inferior ao acordado com a Companhia/Armador!',2);
    end;
    if qry_frete_CD_AGENTE_TAB_FRETE.AsString = '0000' then begin //agente direto
      qry_tarifa_aerea_.Cancel;
      BoxMensagem('Este é um Frete Direto o Valor do Frete não pode ser alterado!',2);
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_CD_ITEMChange(Sender: TField);
var estufagem :string[1];
begin
  if frm_frete_serv.pcTarifas.ActivePage = frm_frete_serv.tabTarifaAerea then
    estufagem := '0'
  else
    estufagem := '1';

  with TQuery.Create(Application) do begin
    DataBasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM = "'+qry_frete_despesas_CD_ITEM.AsString+'"');
    Open;
    if Fields[0].AsString <> '' then
      qry_frete_despesas_TP_BASE_CALCULO.AsString := Fields[0].AsString;
    Free;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_CD_ITEMChange(Sender: TField);
begin
  with TQuery.Create(Application) do begin
    DataBasename:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM ="'+qry_frete_despesas_CD_ITEM.AsString+'"');
    Open;
    if Fields[0].AsString <> '' then
       qry_despesa_FCL_TP_BASE_CALCULO.AsString  :=Fields[0].AsString;
       
    Free;
  end;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_BeforeDelete(DataSet: TDataSet);
begin
  if qry_frete_despesas_TP_FRETE.AsString <> qry_frete_TP_EMP_FRETE.AsString then begin
    qry_frete_despesas_.Cancel;
    BoxMensagem('Não é permitido Excluir essa Despesa!',2);
    abort;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_BeforeDelete(DataSet: TDataSet);
begin
  if qry_despesa_FCL_TP_FRETE.AsString <> qry_frete_TP_EMP_FRETE.AsString then begin
    qry_despesa_FCL_.Cancel;
    BoxMensagem('Não é permitido Excluir essa Despesa!',2);
    abort;
  end;
end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_BeforeDelete(DataSet: TDataSet);
begin
  if qry_tarifa_aerea_TP_FRETE.AsString <> qry_frete_TP_EMP_FRETE.AsString then begin
    qry_tarifa_aerea_.Cancel;
    BoxMensagem('Não é Permitido a exclusão dessa Tarifa',2);
    abort;
  end;
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_BeforeDelete(DataSet: TDataSet);
begin
  if qry_tarifas_FCL_TP_FRETE.AsString <> qry_frete_TP_EMP_FRETE.AsString then begin
    qry_tarifas_FCL_.Cancel;
    BoxMensagem('Não é Permitido a exclusão dessa Tarifa',2);
    abort;
  end;
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_VL_VENDA_TAB_FRETEChange(Sender: TField);
begin
  if frm_frete_serv.st_tp_frete = '2' then
    if qry_tarifas_FCL_VL_VENDA_TAB_FRETE.Asfloat  <  qry_tarifas_FCL_VL_COMPRA_TAB_FRETE.Asfloat then begin
      BoxMensagem('O Valor de venda está inferior ao acordado com o Agente!',2);
      qry_tarifas_FCL_.CAncel;
    end;

end;

procedure Tdatm_frete_serv.qry_frete_despesas_TP_BASE_CALCULOChange(Sender: TField);
begin
  if (qry_frete_despesas_TP_BASE_CALCULO.AsString = '08') or (qry_frete_despesas_TP_BASE_CALCULO.AsString = '09') then begin
    frm_frete_serv.dbgrid_despesa_aerea.Columns[5].visible := true;
    frm_frete_serv.dbgrid_despesa_aerea.Columns[6].visible := true;
  end else begin
    frm_frete_serv.dbgrid_despesa_aerea.Columns[5].visible := false;
    frm_frete_serv.dbgrid_despesa_aerea.Columns[6].visible := false;
    qry_frete_despesas_VL_INTERVALO_INICIAL.AsFloat              := 0;
    qry_frete_despesas_VL_INTERVALO_FINAL.AsFloat                := 0;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_VL_VENDAChange(Sender: TField);
var
  aux : real;
  BookMark : TBookMark;
begin
  if frm_frete_serv.st_tp_frete = '2' then begin
    if qry_despesa_FCL_VL_VENDA.Asfloat < qry_despesa_FCL_VL_COMPRA_AG.Asfloat then begin
      BoxMensagem('O Valor de venda está inferior ao acordado com o Agente!',2);
      qry_despesa_FCL_.CAncel;
    end;
  end;
  if qry_despesa_FCL_.State in [dsInsert] then
    exit;

  if qry_frete_TP_EMP_FRETE.AsString = '2' then begin
    aux := 0;
    BookMark := qry_frete_despesas_.GetBookmark;
    qry_despesa_FCL_.DisableControls;
    qry_despesa_FCL_.First;
    while not (qry_despesa_FCL_.EOF) do begin
      if qry_despesa_FCL_IN_MENCIONADO.AsString = '1' then
        aux := aux + qry_despesa_FCL_VL_VENDA.AsFloat;

      qry_despesa_FCL_.Next;
    end;
    qry_despesa_FCL_.GotoBookmark(BookMark);
    qry_despesa_FCL_.FreeBookmark(BookMark);
    qry_despesa_FCL_.EnableControls;
    if not(qry_frete_.State = dsEdit) then
      qry_frete_.Edit;

    qry_frete_VL_OTHER_CHARGE.AsFloat := aux;
    if not(frm_frete_serv.GRava) then
      exit;

    if not(qry_despesa_FCL_.State in [dsEdit,dsInsert]) then
      qry_despesa_FCL_.Edit;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_AfterScroll(DataSet: TDataSet);
begin

  if qry_frete_TP_EMP_FRETE.AsString = '0' then
    if qry_despesa_FCL_TP_FRETE.AsString = '0' then begin
      frm_frete_serv.dbgrid_despesa_FCL.Columns[00].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[01].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[02].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[03].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[04].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[05].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[06].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[07].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[08].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[09].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[10].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[11].ReadOnly  := false;
    end;

  if qry_frete_TP_EMP_FRETE.AsString = '1' then begin
    if qry_despesa_FCL_TP_FRETE.AsString = '0' then begin
      frm_frete_serv.dbgrid_despesa_FCL.Columns[00].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[01].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[02].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[03].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[04].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[05].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[06].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[07].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[08].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[09].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[10].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[11].ReadOnly  := true;
    end;

    if qry_despesa_FCL_TP_FRETE.AsString = '1' then begin
      frm_frete_serv.dbgrid_despesa_FCL.Columns[00].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[01].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[02].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[03].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[04].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[05].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[06].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[07].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[08].ReadOnly  := true;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[09].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[10].ReadOnly  := false;
      frm_frete_serv.dbgrid_despesa_FCL.Columns[11].ReadOnly  := false;
    end;

  end;


end;

procedure Tdatm_frete_serv.qry_frete_despesas_BeforePost(DataSet: TDataSet);
var vFiltro: string;
begin
  if qry_frete_IN_DESEMBARACO.AsInteger = 0 then
    vFiltro := 'AND TP_ITEM = "1"'
  else
    vFiltro := '';

  vPreencheu := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE IN_ATIVO = "1" AND CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" ' + vFiltro , 'NM_ITEM') <> '') and
                (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') <> '') ;


  if qry_frete_despesas_CD_ITEM.AsString = '' then begin
    qry_frete_despesas_.Cancel;
    BoxMensagem('Deve ser preecnhido o Item!',2);
    abort;
  end;
  qry_frete_despesas_CD_TAB_FRETE.AsString := qry_frete_CD_TAB_FRETE.AsString;
  if qry_frete_despesas_.State in [dsInsert] then
     qry_frete_despesas_CODIGO.AsString := UltCod(qry_ult_despesa_,qry_ult_despesa_ULTIMO);
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_BeforePost(DataSet: TDataSet);
begin
  if qry_despesa_FCL_CD_ITEM.AsString = '' then begin
    qry_despesa_FCL_.Cancel;
    BoxMensagem('Deve ser preecnhido o Item!',2);
    abort;
  end;
  if qry_despesa_FCL_.State in [dsInsert] then
    qry_despesa_FCL_CODIGO.AsString := UltCod(qry_ult_despesa_,qry_ult_despesa_ULTIMO);
end;

procedure Tdatm_frete_serv.qry_frete_CalcFields(DataSet: TDataSet);
begin
  if qry_frete_TARIFA.AsString = '0' then
    qry_frete_calc_tp_tarifa.AsString := 'NET';
  if qry_frete_TARIFA.AsString = '1' then
    qry_frete_calc_tp_tarifa.AsString := 'NET/NET';
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_TP_BASE_CALCULOChange(Sender: TField);
begin
  if (qry_despesa_FCL_TP_BASE_CALCULO.AsString = '08') or (qry_despesa_FCL_TP_BASE_CALCULO.AsString = '09')then begin
    frm_frete_serv.dbgrid_despesa_aerea.Columns[5].visible := true;
    frm_frete_serv.dbgrid_despesa_aerea.Columns[6].visible := true;
  end else begin
    frm_frete_serv.dbgrid_despesa_aerea.Columns[5].visible := false;
    frm_frete_serv.dbgrid_despesa_aerea.Columns[6].visible := false;
    qry_despesa_FCL_VL_INTERVALO_INICIAL.AsFloat                 := 0;
    qry_despesa_FCL_VL_INTERVALO_FINAL.AsFloat                   := 0;
  end;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_TP_ORIGEM_DESPESAChange(Sender: TField);
begin
  if qry_frete_despesas_TP_ORIGEM_DESPESA.AsString = '7' then
    qry_frete_despesas_IN_MENCIONADO.AsString := '1';
end;

procedure Tdatm_frete_serv.qry_tarifa_aerea_CalcFields(DataSet: TDataSet);
begin
  if qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.AsString = '0' then
    qry_tarifa_aerea_calc_tp_simb_maritimo.AsString := 'Tarifa LCL';
  if qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.AsString = '1' then
    qry_tarifa_aerea_calc_tp_simb_maritimo.AsString := 'Mínimo LCL';
  if qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.AsString = '2' then
    qry_tarifa_aerea_calc_tp_simb_maritimo.AsString := 'Tarifa Break Bulk';
  if qry_tarifa_aerea_TTIPO_SIMBOLO_TAB_FRETE.AsString = '3' then
    qry_tarifa_aerea_calc_tp_simb_maritimo.AsString := 'Mínimo Break Bulk';
end;

procedure Tdatm_frete_serv.qry_frete_despesas_IN_DESPESAChange(Sender: TField);
begin
  if (qry_frete_CD_AGENTE_TAB_FRETE.AsString = '0000') and (qry_frete_despesas_IN_DESPESA.AsString = '3') then begin
    qry_frete_despesas_.Cancel;
    Boxmensagem('Não é permitido inserir uma despesa Consolidada para um Frete Direto!',2);
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_IN_DESPESAChange(Sender: TField);
begin
  if (qry_frete_CD_AGENTE_TAB_FRETE.AsString = '0000') and (qry_despesa_FCL_IN_DESPESA.AsString = '3') then begin
    qry_despesa_FCL_.Cancel;
    Boxmensagem('Não é permitido inserir uma despesa Consolidada para um Frete Direto!',2);
  end;
end;

procedure Tdatm_frete_serv.qry_tarifas_FCL_VL_COMPRA_TAB_FRETEChange(Sender: TField);
begin
  if (frm_frete_serv.st_tp_frete = '1') and not(qry_tarifas_FCL_VL_COMPRA_CIA_ARMADOR.IsNull) then begin
    if qry_tarifas_FCL_VL_COMPRA_TAB_FRETE.Asfloat < qry_tarifas_FCL_VL_COMPRA_CIA_ARMADOR.Asfloat then begin
      qry_tarifas_FCL_.Cancel;
      BoxMensagem('O Valor de Compra para Agente está inferior ao acordado com a Companhia/Armador!',2);
    end;
    if qry_frete_CD_AGENTE_TAB_FRETE.AsString = '0000' then begin //agente direto
      qry_tarifas_FCL_.Cancel;
      BoxMensagem('Este é um Frete Direto o Valor do Frete não pode ser alterado!',2);
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_VL_COMPRA_AGChange(Sender: TField);
begin
  if (frm_frete_serv.st_tp_frete = '1') and not(qry_despesa_FCL_VL_COMPRA_CIA.IsNull) then begin
    if qry_despesa_FCL_VL_COMPRA_AG.Asfloat < qry_despesa_FCL_VL_COMPRA_CIA.Asfloat then begin
      qry_despesa_FCL_.Cancel;
      BoxMensagem('O Valor de Compra para Agente está inferior ao acordado com a Companhia/Armador!',2);
    end;
    if qry_frete_CD_AGENTE_TAB_FRETE.AsString = '0000' then begin //agente direto
      qry_despesa_FCL_.Cancel;
      BoxMensagem('Este é um Frete Direto o Valor do Frete não pode ser alterado!',2);
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_VL_COMPRA_AGChange(Sender: TField);
begin
  if (frm_frete_serv.st_tp_frete = '1') and not(qry_frete_despesas_VL_COMPRA_CIA.IsNull) then begin
    if qry_frete_despesas_VL_COMPRA_AG.Asfloat < qry_frete_despesas_VL_COMPRA_CIA.Asfloat then begin
      qry_frete_despesas_.Cancel;
      BoxMensagem('O Valor de Compra para Agente está inferior ao acordado com a Companhia/Armador!',2);
    end;
    if qry_frete_CD_AGENTE_TAB_FRETE.AsString = '0000' then begin //agente direto
      qry_frete_despesas_.Cancel;
      BoxMensagem('Este é um Frete Direto o Valor do Frete não pode ser alterado!',2);
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_lista_iata_aplica(DataSet: TDataSet);
begin
  qry_lista_iata.ApplyUpdates;
end;

procedure Tdatm_frete_serv.qry_lista_iataBeforePost(DataSet: TDataSet);
begin
  if qry_lista_iata.State in [dsinsert] then begin
    with Tquery.Create(Application) do begin
      DataBasename := 'DBBROKER';
      Sql.Add(' SELECT  RIGHT( "00000" + CONVERT( varchar, ISNULL (MAX(CD_TAB_FRETE)+ 1 , 1 ) ), 5 ) FROM TTAB_FRETE ');
      Open;
      qry_lista_iataCD_TAB_FRETE.AsString   := Fields[0].AsString;
      qry_lista_iataDESC_TAB_FRETE.AsString := 'IATA/'+qry_lista_iataAP_ORIGEM.AsString+'/'+qry_lista_iataAP_DESTINO.AsString+'/'+qry_lista_iataLook_nm_moeda.asString;
      qry_lista_iataTP_EMP_FRETE.AsString   := '6';
      Free;
    end;
  end
end;

procedure Tdatm_frete_serv.qry_item_iata_NewRecord(DataSet: TDataSet);
begin
  qry_item_iata_TP_FRETE.AsString     := qry_lista_iataTP_EMP_FRETE.AsString;
  qry_item_iata_CD_TAB_FRETE.AsString := qry_lista_iataCD_TAB_FRETE.AsString;
  qry_item_iata_TP_ESTUFAGEM.AsString := '0';

  if qry_item_iata_.RecordCount = 0 then
    qry_item_iata_TTIPO_SIMBOLO_TAB_FRETE.Value := 'MIN';

  if qry_item_iata_.RecordCount = 1 then begin
    qry_item_iata_TTIPO_SIMBOLO_TAB_FRETE.Value := '-';
    qry_item_iata_PESO_TAB_FRETE.Value          := 45.0;
  end;

  if qry_item_iata_.RecordCount > 1 then begin
    qry_item_iata_TTIPO_SIMBOLO_TAB_FRETE.Value := '+';
    case qry_item_iata_.RecordCount of
       2: qry_item_iata_PESO_TAB_FRETE.Value := 45.0;
       3: qry_item_iata_PESO_TAB_FRETE.Value := 100.0;
       4: qry_item_iata_PESO_TAB_FRETE.Value := 300.0;
       5: qry_item_iata_PESO_TAB_FRETE.Value := 500.0;
       6: qry_item_iata_PESO_TAB_FRETE.Value := 1000.0;
    end;
  end;
end;

procedure Tdatm_frete_serv.qry_item_iata_Aplica(DataSet: TDataSet);
begin
  qry_item_iata_.ApplyUpdates;
end;

procedure Tdatm_frete_serv.qry_item_iata_AfterScroll(DataSet: TDataSet);
begin
  if qry_item_iata_CD_ITEM_TAB_FRETE.AsString = '' then
    exit;

  if strtofloat(qry_item_iata_CD_ITEM_TAB_FRETE.AsString) > 6 then begin
//    frm_frete_serv.dbgrid_item_iata.Columns[0].ReadOnly := false;
//    frm_frete_serv.dbgrid_item_iata.Columns[1].ReadOnly := false;
  end else begin
//    frm_frete_serv.dbgrid_item_iata.Columns[0].ReadOnly := true;
//    frm_frete_serv.dbgrid_item_iata.Columns[1].ReadOnly := true;
  end;
end;

procedure Tdatm_frete_serv.qry_item_iata_BeforePost(DataSet: TDataSet);
begin
  if qry_item_iata_.State in [dsInsert] then begin
    qry_ult_tarifas_.DataSource              := ds_item_iata;
    qry_item_iata_CD_ITEM_TAB_FRETE.AsString := UltCod(qry_ult_tarifas_,qry_ult_tarifas_ULTIMO);
  end;
end;

procedure Tdatm_frete_serv.qry_frete_despesas_CalcFields(
  DataSet: TDataSet);
begin
  qry_frete_despesas_calcItem.AsString := ConsultaLookUP('TITEM', 'CD_ITEM', qry_frete_despesas_CD_ITEM.AsString, 'NM_ITEM');
  qry_frete_despesas_calcMoeda.AsString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', qry_frete_despesas_CD_MOEDA.AsString, 'NM_MOEDA');
end;

procedure Tdatm_frete_serv.qry_frete_despesas_CD_ITEMSetText(
  Sender: TField; const Text: String);
var vFiltro: string;
begin
  if qry_frete_IN_DESEMBARACO.AsInteger = 0 then
    vFiltro := 'AND TP_ITEM = "1"'
  else
    vFiltro := '';

  if Text = ConsultaLookUPSQL('SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE IN_ATIVO = "1" AND CD_ITEM = "' + Text + '" ' + vFilTro, 'CD_ITEM') then
    Sender.AsString := Text
  else begin
    ShowMessage('Item inexistente ou inválido!');
    Sender.Clear;
  end;
end;

procedure Tdatm_frete_serv.qry_despesa_FCL_CalcFields(DataSet: TDataSet);
begin
  qry_despesa_FCL_calcItem.AsString  := ConsultaLookUP('TITEM', 'CD_ITEM', qry_despesa_FCL_CD_ITEM.AsString, 'NM_ITEM');
  qry_despesa_FCL_calcMoeda.AsString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', qry_despesa_FCL_CD_MOEDA.AsString, 'NM_MOEDA');
end;

procedure Tdatm_frete_serv.qry_frete_despesas_CD_MOEDASetText(
  Sender: TField; const Text: String);
begin
  if Text = ConsultaLookUPSQL('SELECT CD_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = "' + Text + '" ', 'CD_MOEDA') then
    Sender.AsString := Text
  else begin
    ShowMessage('Moeda inexistente ou inválida!');
    Sender.Clear;
  end;
end;

procedure Tdatm_frete_serv.qry_frete_AfterScroll(DataSet: TDataSet);
begin
  frm_frete_serv.dbgrid_despesa_FCL.Columns[4].Visible := (qry_frete_IN_DESEMBARACO.AsInteger in [1,2]);
end;

procedure Tdatm_frete_serv.ds_listaDataChange(Sender: TObject;
  Field: TField);
begin
  if qry_lista_.RecordCount=0 then
    frm_frete_serv.ts_dados_cia_armador.TabVisible:=false
  else
    frm_frete_serv.ts_dados_cia_armador.TabVisible:=True;


end;

end.
