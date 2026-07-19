unit PGSM060;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ConsOnlineEx;

type
  Tdatm_item = class(TDataModule)
    ds_item: TDataSource;
    qry_item_: TQuery;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_ult_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_CD_TIPO_LANC_FAT: TStringField;
    qry_item_IN_ATIVO: TStringField;
    qry_item_LookAtivo: TStringField;
    qry_ult_item_ULTIMO: TStringField;
    qry_unid_neg_prod_: TQuery;
    qry_unid_neg_prod_CD_UNID_NEG: TStringField;
    qry_unid_neg_prod_CD_PRODUTO: TStringField;
    qry_priori_item_: TQuery;
    qry_priori_item_CD_ITEM: TStringField;
    qry_priori_item_CD_UNID_NEG: TStringField;
    qry_priori_item_CD_PRODUTO: TStringField;
    qry_priori_item_NR_PRIORIDADE: TFloatField;
    qry_deleta_priori_: TQuery;
    ds_tipo_item: TDataSource;
    tbl_tipo_item: TTable;
    tbl_tipo_itemCD_TIPO_ITEM: TStringField;
    tbl_tipo_itemNM_TIPO_ITEM: TStringField;
    qry_item_look_nm_tipo: TStringField;
    tbl_tipo_itemIN_ATIVO: TStringField;
    qry_item_Look_TP_ITEM_ATIVO: TStringField;
    qry_item_CD_FILIAL: TStringField;
    qry_item_NM_APELIDO: TStringField;
    qry_item_NM_ITEM_INGLES: TStringField;
    qry_item_IN_ITEM_DI: TStringField;
    qry_item_IN_CPMF: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_item_CD_ACESSO: TStringField;
    qry_item_CD_AUX: TStringField;
//    qry_item_CD_CT_CONTABIL: TStringField;
    qry_item_LookCtContabil: TStringField;
    qry_item_LookAcesso: TStringField;
    qry_item_LookAux: TStringField;
    qry_item_IN_REEMBOLSO: TStringField;
    qry_item_LookReembolso: TStringField;
    qry_item_IN_DIVERSOS: TStringField;
    qry_item_LookDiversos: TStringField;
    qry_item_IN_CALCULA_IR: TStringField;
    qry_item_NR_ORDEM_FAT: TIntegerField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_param_: TQuery;
    qry_item_LookCtContabilRM: TStringField;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_gerencial_: TQuery;
    qry_ct_gerencialRM_: TQuery;
    qry_ct_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencial_NM_CT_GERENCIAL: TStringField;
    qry_ct_gerencialRM_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencialRM_NM_CT_GERENCIAL: TStringField;
    qry_item_CD_CT_GERENCIAL: TStringField;
    qry_item_LookCtGerencial: TStringField;
    qry_item_LookCtGerencialRM: TStringField;
    qry_item_IN_TRIBUTAVEL: TStringField;
    qry_item_IN_SOLIC_PAGTO: TStringField;
    qry_item_area_: TQuery;
    ds_item_area_: TDataSource;
    qry_area_: TQuery;
    qry_moeda_: TQuery;
    qry_item_area_CD_ITEM: TStringField;
    qry_item_area_CD_AREA: TStringField;
    qry_item_area_TP_RATEIO_DESP: TStringField;
    qry_item_area_VL_NUN_INDICE: TFloatField;
    qry_item_area_VL_DEN_INDICE: TFloatField;
    qry_item_area_CD_MOEDA_INDICE: TStringField;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_item_area_LookNmArea: TStringField;
    qry_item_area_LookNmMoeda: TStringField;
    qry_tp_rateio_desp: TQuery;
    qry_tp_rateio_despTP_RATEIO_DESP: TStringField;
    qry_tp_rateio_despNM_TP_RATEIO_DESP: TStringField;
    ds_tp_rateio_desp: TDataSource;
    qry_item_area_CalcIndice: TFloatField;
    qry_deleta_area_: TQuery;
    qry_item_area_LookNmRateioDesp: TStringField;
    qry_pesq_area_: TQuery;
    qry_pesq_area_CD_ITEM: TStringField;
    qry_pesq_area_CD_AREA: TStringField;
    qry_item_area_IN_LI: TStringField;
    qry_item_IN_DESP_ALF: TStringField;
    qry_item_IN_REEMB_FINANC: TStringField;
    qry_item_CD_CT_CUSTO: TStringField;
    qry_item_IN_CONSOLIDA: TStringField;
    qry_item_CD_FORMA_RATEIO: TStringField;
    qry_item_CD_TIPO_AVON: TStringField;
    qry_item_IN_DOLAR: TStringField;
    qry_item_IN_FAV_SM: TStringField;
    qry_item_TP_ITEM: TStringField;
    qry_item_CD_IATA: TStringField;
    qry_item_CD_ITEM_CONTABIL: TStringField;
    qry_item_CD_HIST_CONTABIL: TStringField;
    qry_item_IN_CALC_IN381: TStringField;
    qry_item_CD_VIA_TRANSPORTE: TStringField;
    qry_item_TP_FRETE: TStringField;
    ds_base_calc_frete: TDataSource;
    qry_ttp_base_calc_frete: TQuery;
    qry_ttp_base_calc_freteCD_TP_BASE_CALC_FRETE: TStringField;
    qry_ttp_base_calc_freteNM_TP_BASE_CALC_FRETE: TStringField;
    qry_item_TP_BASE_CALCULO: TStringField;
    dts_Item_Rateio: TDataSource;
    qry_Item_Rateio: TQuery;
    qry_Item_RateioCD_UNIDADE: TStringField;
    qry_Item_RateioCD_PRODUTO: TStringField;
    qry_Item_RateioCD_ITEM: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_unid_neg: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    ds_produto: TDataSource;
    qry_Item_RateiolkpNM_Produto: TStringField;
    qry_ContabilCusto: TQuery;
    dts_ContabilCusto: TDataSource;
    qry_Unidade: TQuery;
    dts_Unidade: TDataSource;
    qry_Item_RateiolkpNM_Unidade: TStringField;
    qry_Item_RateioCD_CT_CUSTO: TStringField;
    qry_Item_RateiolkpContabilCusto: TStringField;
    qry_item_CD_CT_CONTABIL: TStringField;
    qry_item_NM_ITEM_ESPANHOL: TStringField;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_item_group_service: TQuery;
    dts_item_group_service: TDataSource;
    qry_item_group_serviceCD_ITEM: TStringField;
    qry_item_group_serviceCD_GROUP_SERVICES: TStringField;
    dts_Group_Service: TDataSource;
    qry_Group_Service: TQuery;
    qry_Group_ServiceCD_GROUP_SERVICES: TStringField;
    qry_Group_ServiceNM_GROUP_SERVICES: TStringField;
    qry_ult_group_service: TQuery;
    qry_ult_group_serviceULTIMO: TStringField;
    qry_item_group_servicecalcNM_GROUP_SERVICE: TStringField;
    qry_item_TP_ITEM_SGA: TStringField;
    qry_item_IN_RECIBO: TStringField;
    procedure qry_item_BeforePost(DataSet: TDataSet);
    procedure qry_item_CD_CT_CONTABILChange(Sender: TField);
    procedure qry_item_area_CalcFields(DataSet: TDataSet);
    procedure qry_item_AfterScroll(DataSet: TDataSet);
    procedure qry_Item_RateioAfterInsert(DataSet: TDataSet);
    procedure qry_item_group_serviceAfterInsert(DataSet: TDataSet);
    procedure qry_item_group_serviceCalcFields(DataSet: TDataSet);
    procedure ds_itemStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_item: Tdatm_item;

implementation

uses PGGP001, PGSM059;

{$R *.DFM}

procedure Tdatm_item.qry_item_BeforePost(DataSet: TDataSet);
begin
  if datm_item.qry_item_CD_TIPO_ITEM.AsString = 'N' then
    datm_item.qry_item_CD_FILIAL.AsString := '002';
end;

procedure Tdatm_item.qry_item_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_item.dbedt_cd_ct_contabil.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then {ContMaster/SI}
  begin
    qry_item_CD_ACESSO.AsString  := qry_item_LookAcesso.AsString;
    qry_item_CD_AUX.AsString     := qry_item_LookAux.AsString;
  end;
end;


procedure Tdatm_item.qry_item_area_CalcFields(DataSet: TDataSet);
begin
  if qry_item_area_VL_DEN_INDICE.AsFloat > 0 then
     qry_item_area_CalcIndice.AsFloat := qry_item_area_VL_NUN_INDICE.AsFloat / qry_item_area_VL_DEN_INDICE.AsFloat;
end;

procedure Tdatm_item.qry_item_AfterScroll(DataSet: TDataSet);
begin
  frm_item.ts_Rateio.TabVisible := qry_item_IN_TRIBUTAVEL.AsString = '1';
end;

procedure Tdatm_item.qry_Item_RateioAfterInsert(DataSet: TDataSet);
begin
  qry_Item_RateioCD_ITEM.AsString := qry_item_CD_ITEM.AsString;
end;

procedure Tdatm_item.qry_item_group_serviceAfterInsert(DataSet: TDataSet);
begin
  qry_item_group_serviceCD_ITEM.AsString := qry_item_CD_ITEM.AsString;
end;

procedure Tdatm_item.qry_item_group_serviceCalcFields(DataSet: TDataSet);
begin
  qry_item_group_servicecalcNM_GROUP_SERVICE.AsString := ConsultaLookUp('TTP_GROUP_SERVICES','CD_GROUP_SERVICES',qry_item_group_service.FieldByName('CD_GROUP_SERVICES').AsString,'NM_GROUP_SERVICES');
end;

procedure Tdatm_item.ds_itemStateChange(Sender: TObject);
begin
  if ( qry_item_.State in [dsEdit, dsInsert]) then
    frm_item.btn_mi( False, True, True, False )
  else
    frm_item.btn_mi( True, False, False, True );
end;

end.
