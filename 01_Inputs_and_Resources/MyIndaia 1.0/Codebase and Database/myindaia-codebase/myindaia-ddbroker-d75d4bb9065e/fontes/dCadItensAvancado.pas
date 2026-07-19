unit dCadItensAvancado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_CadItens_avancado = class(TDataModule)
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_ult_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_CD_TIPO_LANC_FAT: TStringField;
    qry_item_IN_ATIVO: TStringField;
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
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_item_CD_ACESSO: TStringField;
    qry_item_CD_AUX: TStringField;
    qry_item_CD_CT_CONTABIL: TStringField;
    qry_item_LookCtContabil: TStringField;
    qry_item_LookAcesso: TStringField;
    qry_item_LookAux: TStringField;
    qry_item_IN_REEMBOLSO: TStringField;
    qry_item_IN_DIVERSOS: TStringField;
    qry_item_IN_CALCULA_IR: TStringField;
    qry_item_NR_ORDEM_FAT: TIntegerField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
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
    upd_qry_item_: TUpdateSQL;
    upd_qry_priori_item_: TUpdateSQL;
    qry_ttp_frete_: TQuery;
    qry_ttp_frete_CODIGO: TStringField;
    qry_ttp_frete_DESCRICAO: TStringField;
    ds_ttp_frete: TDataSource;
    qry_item_TP_BASE_CALCULO: TStringField;
    qry_item_TP_FRETE: TStringField;
    qry_item_CD_VIA_TRANSPORTE: TStringField;
    qry_item_TP_ORIGEM_DESPESA: TStringField;
    qry_item_VL_BASE_DESPESA: TFloatField;
    ds_base_calc_frete: TDataSource;
    qry_ttp_base_calc_frete: TQuery;
    qry_ttp_base_calc_freteCD_TP_BASE_CALC_FRETE: TStringField;
    qry_ttp_base_calc_freteNM_TP_BASE_CALC_FRETE: TStringField;
    ds_tmoeda: TDataSource;
    qry_moeda_broker_: TQuery;
    ds_torigem_despesa: TDataSource;
    qry_torigem_despesa: TQuery;
    ds_tvia_transporte: TDataSource;
    qry_tvia_transporte: TQuery;
    ds_tmod_frete: TDataSource;
    qry_tmod_frete: TQuery;
    qry_tmod_freteCD_MOD_FRETE: TStringField;
    qry_tmod_freteNM_MOD_FRETE: TStringField;
    qry_torigem_despesaCD_ORIGEM_DESP: TStringField;
    qry_torigem_despesaNM_ORIGEM_DESP: TStringField;
    qry_item_calc_ativo: TStringField;
    qry_item_Look_nm_tp_frete: TStringField;
    qry_item_Look_nm_base_calc: TStringField;
    qry_item_Look_nm_origem_desp: TStringField;
    qry_moeda_broker_cd_moeda: TStringField;
    qry_moeda_broker_nm_moeda: TStringField;
    qry_tvia_transporteCD_VIA_TRANSP: TStringField;
    qry_tvia_transporteNM_VIA_TRANSP: TStringField;
    qry_item_CD_CT_CUSTO: TStringField;
    qry_item_IN_CONSOLIDA: TStringField;
    qry_item_CD_FORMA_RATEIO: TStringField;
    qry_item_CD_TIPO_AVON: TStringField;
    qry_item_IN_DOLAR: TStringField;
    qry_item_IN_FAV_SM: TStringField;
    qry_item_TP_ITEM: TStringField;
    qry_item_CD_IATA: TStringField;
    qry_item_contabil_: TQuery;
    qry_item_contabil_calc_in_contabiliza: TStringField;
    qry_item_CD_ITEM_CONTABIL: TStringField;
    qry_item_CD_HIST_CONTABIL: TStringField;
    qry_item_Look_nm_item_contabil: TStringField;
    qry_item_contabil_CD_ITEM_CONTABIL: TStringField;
    qry_item_contabil_NM_ITEM_CONTABIL: TStringField;
    qry_item_contabil_IN_CONTABILIZA: TStringField;
    procedure qry_item_BeforePost(DataSet: TDataSet);
    procedure qry_item_CD_CT_CONTABILChange(Sender: TField);
    procedure datm_CadItens_avancadoCreate(Sender: TObject);
    procedure qry_priori_item_AfterDelete(DataSet: TDataSet);
    procedure qry_priori_item_AfterPost(DataSet: TDataSet);
    procedure qry_item_CalcFields(DataSet: TDataSet);
    procedure qry_item_AfterScroll(DataSet: TDataSet);
    procedure qry_item_contabil_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_CadItens_avancado: Tdatm_CadItens_avancado;

implementation

uses PGGP001, PGSM059, uCadItensAvancado;

{$R *.DFM}

procedure Tdatm_CadItens_avancado.datm_CadItens_avancadoCreate(Sender: TObject);
begin
  qry_param_.Close;
  qry_param_.Prepare;
  qry_param_.Open;
  if qry_param_CD_SISTEMA_CONTABIL.AsString = '0' then
  begin
    qry_item_CD_CT_CONTABIL.EditMask := ''; {RM}
  end
  else
  begin
    qry_item_CD_CT_CONTABIL.EditMask := '999.99.99999;0;_'; {ContMaster/SI}
  end;
  qry_param_.Close;
end;

procedure Tdatm_CadItens_avancado.qry_item_BeforePost(DataSet: TDataSet);
begin
  if datm_CadItens_avancado.qry_item_CD_TIPO_ITEM.AsString = 'N' then
    datm_CadItens_avancado.qry_item_CD_FILIAL.AsString := '002';
end;

procedure Tdatm_CadItens_avancado.qry_item_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_Caditens_Avancado.dbedt_cd_ct_contabil.Visible ) and ( qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString <> '0' ) then {ContMaster/SI}
  begin
    qry_item_CD_ACESSO.AsString  := qry_item_LookAcesso.AsString;
    qry_item_CD_AUX.AsString     := qry_item_LookAux.AsString;
  end;
end;


procedure Tdatm_CadItens_avancado.qry_priori_item_AfterDelete(DataSet: TDataSet);
begin
  qry_priori_item_.ApplyUpdates;  //by Paulo - 07/05/2002
end;

procedure Tdatm_CadItens_avancado.qry_priori_item_AfterPost(DataSet: TDataSet);
begin
  qry_priori_item_.ApplyUpdates;  //by Paulo - 07/05/2002
end;

procedure Tdatm_CadItens_avancado.qry_item_CalcFields(DataSet: TDataSet);
begin
  if qry_item_IN_ATIVO.Value = '1' then 
     qry_item_calc_ativo.Value:='Sim'
  else
     qry_item_calc_ativo.Value:='Não';
end;

procedure Tdatm_CadItens_avancado.qry_item_AfterScroll(DataSet: TDataSet);
var aux:Boolean;
begin
    if (frm_Caditens_Avancado.rdbgoup_tp_item.ItemIndex = 0) then
     aux:=true;
  if (frm_Caditens_Avancado.rdbgoup_tp_item.ItemIndex = 1) then
     aux:=false;
  if (frm_Caditens_Avancado.rdbgoup_tp_item.ItemIndex = 2) then
     aux:=true;

    frm_Caditens_Avancado.lbl_ct_contabil.Visible      := aux;
    frm_Caditens_Avancado.dbedt_cd_ct_contabil.Visible := aux;
    frm_Caditens_Avancado.dbedt_nm_ct_contabil.Visible := aux;
    frm_Caditens_Avancado.btn_co_ct_contabil.Visible   := aux;
    frm_Caditens_Avancado.lbl_ct_gerencial.Visible     := aux;
    frm_Caditens_Avancado.dbedt_cd_ct_gerencial.Visible:= aux;
    frm_Caditens_Avancado.dbedt_nm_ct_gerencial.Visible:= aux;
    frm_Caditens_Avancado.btn_co_ct_gerencial.Visible  := aux;

  if (frm_Caditens_Avancado.rdbgoup_tp_item.ItemIndex = 2) then
    frm_Caditens_Avancado.grp_box_ag.Visible           :=  aux
  else frm_Caditens_Avancado.grp_box_ag.Visible           :=  not aux;


  if ((frm_Caditens_Avancado.rdbgoup_tp_item.ItemIndex = 1) or (frm_Caditens_Avancado.rdbgoup_tp_item.ItemIndex = 2)) and
        ((frm_Caditens_Avancado.dbcombo_via_transp.ItemIndex = 0 ) or (frm_Caditens_Avancado.dbcombo_via_transp.ItemIndex = 2))then
    begin
        frm_Caditens_Avancado.dbedt_sigla_iata.Visible:=true;
        frm_Caditens_Avancado.lb_sigla_iata.Visible:=true;
    end
   else
    begin
        frm_Caditens_Avancado.dbedt_sigla_iata.Visible:=false;
        frm_Caditens_Avancado.lb_sigla_iata.Visible:=false;
    end;                 
end;

procedure Tdatm_CadItens_avancado.qry_item_contabil_CalcFields(DataSet: TDataSet);
begin
  if qry_item_contabil_IN_CONTABILIZA.AsString = '1' then
      qry_item_contabil_calc_in_contabiliza.AsString := 'Sim'
  else qry_item_contabil_calc_in_contabiliza.AsString := 'Não';
end;

end.
