(*************************************************************************************************
Sistema: MyIndaia
PROGRAMA: PGGP012.PAS - Data Module - Movimentação de Contas a Pagar
DATA: dd/mm/yyyy
Data: 24/10/2001 - AMBR-0053/01 - Número do Título
*************************************************************************************************)

unit PGGP012;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DBTables, ADODB, Inifiles, Funcoes, PGGP017;

type
  Tdatm_ctaapagar = class(TDataModule)
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_IN_CONTROLA_IR: TBooleanField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    ds_ct_contabil: TDataSource;
    qry_ct_contabil_: TQuery;
    ds_ct_custo: TDataSource;
    qry_ct_custo_: TQuery;
    ds_ct_distr_gerencial: TDataSource;
    qry_ct_distr_gerencial_: TQuery;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_IN_DISTRIBUI: TStringField;
    qry_ct_custo_CD_CT_CUSTO: TStringField;
    qry_ct_custo_NM_CT_CUSTO: TStringField;
    qry_ct_distr_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_distr_gerencial_NM_CT_GERENCIAL: TStringField;
    ds_contabil_distr: TDataSource;
    qry_contabil_distr_: TQuery;
    qry_contabil_distr_CD_CT_CONTABIL: TStringField;
    qry_contabil_distr_CD_CT_GERENCIAL: TStringField;
    qry_contabil_distr_PC_TAXA: TFloatField;
    ds_tp_forma_pagto: TDataSource;
    tbl_tp_forma_pagto_: TTable;
    qry_ct_custo_CD_COLIGADA: TStringField;
    qry_ct_distr_gerencial_CD_COLIGADA: TStringField;
    qry_contabil_distr_CD_COLIGADA: TStringField;
    qry_contab_: TQuery;
    qry_contab_CD_COLIGADA: TStringField;
    qry_contab_NR_CONTAB: TStringField;
    qry_contab_DT_CONTAB: TDateTimeField;
    qry_contab_CD_USUARIO: TStringField;
    qry_contab_TP_CONTAB: TStringField;
    qry_contab_lanc_: TQuery;
    ds_contab: TDataSource;
    ds_contab_lanc: TDataSource;
    ds_contab_gerencial: TDataSource;
    qry_contab_gerencial_: TQuery;
    qry_contab_lanc_CD_COLIGADA: TStringField;
    qry_contab_lanc_NR_CONTAB: TStringField;
    qry_contab_lanc_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_CD_HISTORICO: TStringField;
    qry_contab_lanc_NM_HISTORICO: TStringField;
    qry_contab_lanc_CD_FILIAL: TStringField;
    qry_contab_lanc_CD_CUSTO: TStringField;
    qry_contab_DT_MOVIMENTO: TDateTimeField;
    qry_contab_CD_UNID_NEG: TStringField;
    qry_contab_CD_PRODUTO: TStringField;
    ds_ctaapagar: TDataSource;
    ds_ctaapagar_ger_: TDataSource;
    qry_ctaapagar_ger_: TQuery;
    ds_ctaapagar_lanc: TDataSource;
    qry_ctaapagar_lanc_: TQuery;
    qry_ctaapagar_lanc_DT_CTAAPAGAR: TDateTimeField;
    qry_ctaapagar_ger_DT_CTAAPAGAR: TDateTimeField;
    qry_ctaapagar_ger_CD_CT_GERENCIAL: TStringField;
    qry_ctaapagar_ger_VL_LANCAMENTO: TFloatField;
    qry_ctaapagar_ger_LookCtContabil: TStringField;
    qry_ctaapagar_ger_LookCtDistrGerencial: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_contab_gerencial_CD_COLIGADA: TStringField;
    qry_contab_gerencial_NR_CONTAB: TStringField;
    qry_contab_gerencial_NR_LANCAMENTO: TStringField;
    qry_contab_gerencial_CT_GERENCIAL: TStringField;
    qry_contab_gerencial_VL_GERENCIAL: TFloatField;
    qry_ult_conta_: TQuery;
    qry_ult_conta_ULTIMO: TIntegerField;
    sp_atz_distr_ger_ctaapagar: TStoredProc;
    qry_tot_distr_gerRM_: TQuery;
    qry_ctaapagar_lanc_NR_CTAAPAGAR: TStringField;
    qry_ctaapagar_ger_NR_CTAAPAGAR: TStringField;
    qry_unid_neg_CD_FILIAL: TStringField;
    qry_tot_distr_lanc_: TQuery;
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_lista_DT_CTAAPAGAR: TDateTimeField;
    qry_lista_NR_CTAAPAGAR: TStringField;
    qry_lista_VL_PAGAMENTO: TFloatField;
    qry_lista_DT_VENCIMENTO: TDateTimeField;
    qry_lista_DT_PAGAMENTO: TDateTimeField;
    sp_contabiliza_ctaapagar: TStoredProc;
    qry_fav_: TQuery;
    qry_fav_CD_FAVORECIDO: TStringField;
    qry_fav_NM_FAVORECIDO: TStringField;
    qry_fav_IN_CONTROLA_IR: TBooleanField;
    qry_fav_CD_TIPO_PESSOA: TStringField;
    qry_fav_CGC_EMPRESA: TStringField;
    qry_fav_CPF_EMPRESA: TStringField;
    qry_fav_AP_FAVORECIDO: TStringField;
    qry_ctaapagar_ger_CD_FILIAL: TStringField;
    qry_favorecido_AP_FAVORECIDO: TStringField;
    qry_lista_ap_fornecedor: TStringField;
    qry_lista_IN_CANCELADO: TStringField;
    qry_lista_IN_DISTRIBUICAO: TStringField;
    qry_lista_LookDistribuicao: TStringField;
    qry_lista_IN_LIBERADO: TStringField;
    qry_lista_LookLiberado: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_ctaapagar_ger_CD_CT_CUSTO: TStringField;
    qry_tot_distr_lanc_ERRO_DISTR_LANC: TFloatField;
    qry_tot_distr_gerRM_ERRO_DISTR_GER: TFloatField;
    qry_ctaapagar_lanc_CD_FILIAL: TStringField;
    qry_ctaapagar_lanc_LookFilial: TStringField;
    qry_fav_NR_BANCO: TStringField;
    qry_fav_CD_AGENCIA: TStringField;
    qry_fav_NR_CONTA: TStringField;
    qry_fav_DAC_AGENCIA: TStringField;
    sp_distribui_ctaapagar: TStoredProc;
    qry_caixa_ctrl_: TQuery;
    qry_cheque_adm_: TQuery;
    qry_ctaapagar_: TQuery;
    qry_ctaapagar_DT_CTAAPAGAR: TDateTimeField;
    qry_ctaapagar_NR_CTAAPAGAR: TStringField;
    qry_ctaapagar_CD_USUARIO: TStringField;
    qry_ctaapagar_CD_FORNECEDOR: TStringField;
    qry_ctaapagar_NM_HISTORICO: TStringField;
    qry_ctaapagar_CalcPagamento: TFloatField;
    qry_ctaapagar_CalcValor: TFloatField;
    qry_ctaapagar_DT_VENCIMENTO: TDateTimeField;
    qry_ctaapagar_DT_PAGAMENTO: TDateTimeField;
    qry_ctaapagar_CD_FAVORECIDO: TStringField;
    qry_ctaapagar_TP_PAGAMENTO: TStringField;
    qry_ctaapagar_CD_BARRAS: TStringField;
    qry_ctaapagar_CD_BANCO: TStringField;
    qry_ctaapagar_NR_CHEQUE: TStringField;
    qry_ctaapagar_NR_DOC_BCO: TStringField;
    qry_ctaapagar_IN_IMP_CHEQUE: TStringField;
    qry_ctaapagar_CD_STATUS_CHEQUE: TStringField;
    qry_ctaapagar_IN_CANCELADO: TStringField;
    qry_ctaapagar_CD_CANCELADOR: TStringField;
    qry_ctaapagar_DT_CANCELAMENTO: TDateTimeField;
    qry_ctaapagar_IN_LIBERADO: TStringField;
    qry_ctaapagar_CD_LIBERADOR: TStringField;
    qry_ctaapagar_DT_LIBERACAO: TDateTimeField;
    qry_ctaapagar_IN_TRANSFERIDO: TStringField;
    qry_ctaapagar_CD_USUARIO_GER: TStringField;
    qry_ctaapagar_IN_DISTRIBUICAO: TStringField;
    qry_ctaapagar_TP_CD_BARRAS: TStringField;
    qry_ctaapagar_IN_CONTABILIZADO: TStringField;
    qry_ctaapagar_CD_LT_CONTAB: TStringField;
    qry_ctaapagar_CD_LT_CONTAB_EXT: TStringField;
    qry_ctaapagar_LookFornecedor: TStringField;
    qry_ctaapagar_LookUsuario: TStringField;
    qry_ctaapagar_LookFavorecido: TStringField;
    qry_ctaapagar_LookBanco: TStringField;
    qry_ctaapagar_LookUsuarioGer: TStringField;
    qry_ctaapagar_LookControlaIR: TBooleanField;
    qry_ctaapagar_CD_UNID_NEG: TStringField;
    qry_ctaapagar_IN_OPERACIONAL: TStringField;
    qry_ctaapagar_NR_REF: TStringField;
    qry_ctaapagar_lanc_CD_UNID_NEG: TStringField;
    qry_ctaapagar_ger_CD_UNID_NEG: TStringField;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ctaapagar_lanc_CD_ACESSO: TStringField;
    qry_ctaapagar_lanc_CD_AUX: TStringField;
    qry_ct_gerencial_: TQuery;
    qry_ct_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencial_NM_CT_GERENCIAL: TStringField;
    qry_ctaapagar_ger_LookCtGerencial: TStringField;
    qry_tot_distr_ger_: TQuery;
    qry_tot_distr_ger_ERRO_DISTR_GER: TFloatField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_IN_DISTRIBUI: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    sp_cria_ctaapagar: TStoredProc;
    qry_ctaapagar_vencto_: TQuery;
    qry_ctaapagar_vencto_NR_CTAAPAGAR: TStringField;
    qry_ctaapagar_vencto_DT_VENCTO: TDateTimeField;
    qry_upd_ctaapagar_: TQuery;
    qry_del_ctaapagar_vencto_: TQuery;
    qry_lista_NR_TITULO: TStringField;
    qry_ctaapagar_NR_TITULO: TStringField;
    ds_ctaapagar_lanc_processo_: TDataSource;
    qry_ctaapagar_lanc_processo_: TQuery;
    qry_ctaapagar_lanc_processo_NR_PROCESSO: TStringField;
    qry_ctaapagar_lanc_processo_CD_ITEM_SOLIC_PAGTO: TStringField;
    qry_ctaapagar_lanc_processo_NM_ITEM: TStringField;
    qry_ctaapagar_lanc_processo_CalcNrProcesso: TStringField;
    qry_ctaapagar_lanc_processo_VL_ITEM: TFloatField;
    qry_ctaapagar_lanc_processo_AP_EMPRESA: TStringField;
    sp_cast_ctaapagar: TStoredProc;
    sp_canc_fat_cc: TStoredProc;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_TP_ITEM: TStringField;
    qry_ctaapagar_lanc_CD_ITEM: TStringField;
    qry_ctaapagar_lanc_Look_nm_item: TStringField;
    qry_ctaapagar_lanc_CD_CT_CUSTO: TStringField;
    qry_ctaapagar_lanc_Look_nome_rateio: TStringField;
    qry_ctaapagar_lanc_CD_CT_CONTABIL: TStringField;
    sp_cont_integracao_contabil4: TADOStoredProc;
    sp_cont_integracao_contabil: TStoredProc;
    qry_custo_aux_: TQuery;
    qry_custo_aux_CODCCUSTO: TStringField;
    qry_custo_aux_NOME: TStringField;
    qry_custo_aux_CODREDUZIDO: TStringField;
    qry_ctaapagar_CD_COLIGADA: TStringField;
    SqlCustosContabil: TQuery;
    SqlCustosContabilCD_COLIGADA: TStringField;
    SqlCustosContabilCD_CT_CUSTO: TStringField;
    SqlCustosContabilNM_CT_CUSTO: TStringField;
    qry_ctaapagar_ger_calcDistribGer: TStringField;
    qry_ult_ref_: TQuery;
    qry_ult_ref_ULT_REF: TStringField;
    qry_lista_CD_FAVORECIDO: TStringField;
    qry_lista_TP_PAGAMENTO: TStringField;
    qry_lista_NR_REF: TStringField;
    qry_ctaapagar_DT_MONTAGEM: TDateTimeField;
    qry_lista_DT_MONTAGEM: TDateTimeField;
    qry_lista_calcTP_PAGTO: TStringField;
    qry_lista_FAVORECIDO: TStringField;
    qry_ctaapagar_lanc_VL_LANCAMENTO: TFloatField;
    qry_ctaapagar_STATUS: TStringField;
    qry_status_solic_adm_: TQuery;
    qry_status_solic_adm_CODIGO: TStringField;
    qry_status_solic_adm_DESCRICAO: TStringField;
    ds_status_solic_adm: TDataSource;
    qry_ctaapagar_LookStatus: TStringField;
    qry_lista_STATUS: TStringField;
    qry_lista_calcStatus: TStringField;
    SqlContasFornecedor: TQuery;
    qry_ctaapagar_VL_LIQUIDO: TFloatField;
    qry_ctaapagar_DT_EMISSAO_DOC: TDateTimeField;
    qry_ctaapagar_lanc_NM_HISTORICO: TMemoField;
    qry_ctaapagar_lanc_CODIGO: TAutoIncField;
    qry_ctaapagar_IN_PISCOFINS: TStringField;
    qry_ctaapagar_VL_DESPESA: TFloatField;
    qry_ctaapagar_VL_DESCONTO: TFloatField;
    qry_ctaapagar_VL_ACRESCIMO: TFloatField;
    qry_ctaapagar_VL_IR: TFloatField;
    qry_ctaapagar_VL_INSS: TFloatField;
    qry_ctaapagar_VL_PISCOFINS: TFloatField;
    qry_ctaapagar_VL_ISS: TFloatField;
    upd_ctaapagar_: TUpdateSQL;
    qry_ctaapagar_IN_LANC_PROVISIONADO: TStringField;
    qry_lista_IN_LANC_PROVISIONADO: TStringField;
    qry_lista_LookLancProvisionado: TStringField;
    qry_lista_CD_BANCO: TStringField;
    qry_ctaapagar_IN_SELECIONADO: TStringField;
    qry_lista_calcIN_SELECIONADO: TStringField;
    qry_lista_IN_SELECIONADO: TStringField;
    qry_lista_NR_CTAAPAGAR_SELECIONADO: TStringField;
    qry_ctaapagar_lanc_NR_LANC_CAIXA: TStringField;
    qry_ctaapagar_lanc_DT_MOVIMENTO_CAIXA: TDateTimeField;
    qry_ctaapagar_lanc_CD_RATEIO: TStringField;
    ds_ctaapagar_rateio: TDataSource;
    qry_ctaapagar_rateio: TQuery;
    qry_ctaapagar_rateioDT_CTAAPAGAR: TDateTimeField;
    qry_ctaapagar_rateioNR_CTAAPAGAR: TStringField;
    qry_ctaapagar_rateioCD_CT_CUSTO: TStringField;
    qry_ctaapagar_rateioVALOR_RATEIO: TFloatField;
    qry_ctaapagar_rateioCD_UNID_NEG: TStringField;
    sqlAux: TQuery;
    qry_ctaapagar_rateioCD_RATEIO: TStringField;
    SqlRateio: TQuery;
    qry_ctaapagar_lanc_Look_nome_ct_custo: TStringField;
    qry_ctaapagar_rateioCODIGO: TIntegerField;
    qry_ctaapagar_rateioLkpNM_Rateio: TStringField;
    SqlPercCusto: TQuery;
    SqlPercCustoCD_CT_CUSTO: TStringField;
    SqlPercCustoPERC: TFloatField;
    qry_ctaapagar_rateioLkpPerc_Rateio: TFloatField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ctaapagar_ger_CD_CT_CONTABIL: TStringField;
    qry_contab_lanc_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_DT_MOVIMENTO: TDateTimeField;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    procedure qry_ctaapagar_CalcFields(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterScroll(DataSet: TDataSet);
    procedure qry_ctaapagar_ger_AfterScroll(DataSet: TDataSet);
    procedure qry_ctaapagar_BeforePost(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterOpen(DataSet: TDataSet);
    procedure qry_ctaapagar_CD_BARRASChange(Sender: TField);
    procedure qry_ctaapagar_lanc_AfterScroll(DataSet: TDataSet);
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
    procedure qry_ctaapagar_CD_FORNECEDORChange(Sender: TField);
    procedure qry_ctaapagar_lanc_processo_CalcFields(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterPost(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterEdit(DataSet: TDataSet);
    procedure qry_ctaapagar_ger_CalcFields(DataSet: TDataSet);
    procedure qry_lista_CalcFields(DataSet: TDataSet);
    procedure qry_ctaapagar_lanc_AfterEdit(DataSet: TDataSet);
    procedure qry_lista_AfterOpen(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterInsert(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterDelete(DataSet: TDataSet);
    procedure qry_ctaapagar_rateioBeforeOpen(DataSet: TDataSet);
  private
//    a_str_indices : Array[0..2] Of String[60];
  public
  procedure exec_contabiliza_pagto_adm(cd_unid_neg, nr_ctaapagar, cd_banco, nr_docto:String;
                                                             dt_movimento, dt_pagto :Tdatetime);
  end;

var
  datm_ctaapagar: Tdatm_ctaapagar;

implementation

{$R *.DFM}

uses GSMLIB, PGGP011, PGGP001, ConsOnLineEx;

procedure Tdatm_ctaapagar.qry_ctaapagar_AfterScroll(DataSet: TDataSet);
begin
  with frm_ctaapagar do
  begin
    qry_ctaapagar_lanc_.Close;
    qry_ctaapagar_lanc_.ParamByName('CD_UNID_NEG').AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
    qry_ctaapagar_lanc_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
    qry_ctaapagar_lanc_.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
    qry_ctaapagar_lanc_.Prepare;
    qry_ctaapagar_lanc_.Open;

    qry_ctaapagar_lanc_processo_.Close;
    qry_ctaapagar_lanc_processo_.ParamByName('CD_UNID_NEG').AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
    qry_ctaapagar_lanc_processo_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
    qry_ctaapagar_lanc_processo_.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
    qry_ctaapagar_lanc_processo_.Prepare;
    qry_ctaapagar_lanc_processo_.Open;

    qry_contab_gerencial_.Close;
(*    qry_contab_gerencial_.ParamByName('CD_COLIGADA').AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
    qry_contab_gerencial_.ParamByName('NR_LANCAMENTO').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
    qry_contab_gerencial_.ParamByName('NR_CONTAB').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString; *)
    qry_contab_gerencial_.Prepare;
    qry_contab_gerencial_.Open;


//    ts_lista_lanc.TabVisible       := qry_ctaapagar_IN_OPERACIONAL.AsString = '1';
//    ts_lista_lanc_adm.TabVisible   := Not(qry_ctaapagar_IN_OPERACIONAL.AsString = '1');

    btn_ContaContabil.Visible     := not(qry_ctaapagar_IN_OPERACIONAL.AsString = '1');
    lb_item.Visible                := not(qry_ctaapagar_IN_OPERACIONAL.AsString = '1');
    dbedt_cd_fornecedor.ReadOnly   := qry_ctaapagar_IN_OPERACIONAL.AsString = '1';
    if (qry_ctaapagar_IN_OPERACIONAL.AsString = '1')then
    begin
      dbedt_cd_fornecedor.Color      := ClMenu;
      dbedt_vl_despesa.Color         := ClMenu;
    end
    eLse
    begin
      dbedt_cd_fornecedor.Color      := ClWindow;
      dbedt_vl_despesa.Color         := ClWindow;
    End;
    btn_co_fornecedor.Enabled      := Not(qry_ctaapagar_IN_OPERACIONAL.AsString = '1');
    dbedt_vl_despesa.ReadOnly      := qry_ctaapagar_IN_OPERACIONAL.AsString = '1';

    // Exibe TabSheet da Distribuição Gerencial e Código do Custo?
(*    if ( ( qry_ctaapagar_lanc_LookInDistribuiRM.AsString = '0' ) and ( frm_ctaapagar.str_cd_sistema_contabil = '0'  ) ) or
       ( ( qry_ctaapagar_lanc_LookInDistribui.AsString   = '0' ) and ( frm_ctaapagar.str_cd_sistema_contabil <> '0' ) ) then
    begin
      //dbedt_cd_ct_custo.Color       := clMenu;
      //dbedt_cd_ct_custo.ReadOnly    := True;
      //dbedt_cd_ct_custo.TabStop     := False;
      //btn_co_ct_custo.Enabled       := False;
      if qry_ctaapagar_lanc_.State in [dsInsert, dsEdit] then
      begin
        qry_ctaapagar_lanc_CD_CT_CUSTO.AsString := '';
      end;
      ts_distr_gerencial.TabVisible := False;
    end
    else
    begin
     // dbedt_cd_ct_custo.Color       := clWindow;
     // dbedt_cd_ct_custo.ReadOnly    := False;
     // dbedt_cd_ct_custo.TabStop     := True;
     // btn_co_ct_custo.Enabled       := True;
      ts_distr_gerencial.TabVisible := True;
    end;*)

    if qry_ctaapagar_LookControlaIR.AsBoolean then
    begin
      dbedt_vl_ir.Color    := clWindow;
      dbedt_vl_ir.ReadOnly := False;
      dbedt_vl_ir.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir.Color    := clMenu;
      dbedt_vl_ir.ReadOnly := True;
      dbedt_vl_ir.TabStop  := False;
    end;

    if qry_ctaapagar_IN_CANCELADO.AsString = '0' then
    begin
      lbl_cancelado.Visible := False;
      btn_canc_lanc.Enabled := ( pgctrl_ctaapagar.ActivePage = ts_lista ) or
                               ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos );
      mi_canc_lanc.Enabled  := btn_canc_lanc.Enabled;
    end
    else
    begin
      lbl_cancelado.Visible := True;
      btn_canc_lanc.Enabled := False;
      mi_canc_lanc.Enabled  := False;
    end;
    // Inibidas próximas 2 linhas - solicitado por Financeiro - 05/10/2005
    //if qry_ctaapagar_IN_LIBERADO.AsString  = '0' then
    //begin
      ds_ctaapagar.AutoEdit      := st_modificar;
      ds_ctaapagar_lanc.AutoEdit := st_modificar;
      ds_ctaapagar_lanc_processo_.AutoEdit := st_modificar;
      lbl_liberado.Visible       := False;
      // Inibidas próximas 8 linhas - solicitado por Financeiro - 05/10/2005
  (*  end
    else
    begin
      ds_ctaapagar.AutoEdit      := false;
      ds_ctaapagar_lanc.AutoEdit := false;
      ds_ctaapagar_lanc_processo_.AutoEdit := false;
      lbl_liberado.Visible       := True;
    end;    *)

    if qry_ctaapagar_IN_CONTABILIZADO.AsString  = '1' then
    begin
      ds_ctaapagar.AutoEdit := false;
      lb_contabiliiza.Visible  := True;
    end
    else
    begin
      ds_ctaapagar.AutoEdit := st_modificar;
      lb_contabiliiza.Visible  := False;
    end;


      //  Inibidas próximas 9 linhas - solicitado por Financeiro - 05/10/2005
 (*  if ( qry_ctaapagar_IN_CANCELADO.AsString = '1' )     or
       ( qry_ctaapagar_IN_LIBERADO.AsString = '1' )      then
   begin
      pnl_ctaapagar.Enabled            := False;
      // pnl_dados_basicos_lanc.Enabled   := False;
      pnl_distr_gerencial.Enabled      := False;
    end
    else
    begin *)

//      pnl_ctaapagar.Enabled            := Not frm_ctaapagar.lPesq;

     (* if ( qry_ctaapagar_IN_CONTABILIZADO.AsString = '1' ) then
      begin
        pnl_dados_basicos_lanc.Enabled := False;
        pnl_distr_gerencial.Enabled    := False;
        dbedt_cd_fornecedor.ReadOnly   := True;
        dbedt_nm_historico.ReadOnly    := True;
        dbedt_dt_vencimento.ReadOnly   := True;
        dbedt_vl_despesa.ReadOnly      := True;
        dbedt_vl_desconto.ReadOnly     := True;
        dbedt_vl_acrescimo.ReadOnly    := True;
        dbedt_vl_ir.ReadOnly           := True;
        dbedt_vl_inss.ReadOnly         := True;
        dbedt_cd_usuario_ger.ReadOnly  := True;
        btn_co_usuario_ger.Enabled     := False;
      end
      else
      begin
        dbedt_cd_fornecedor.ReadOnly   := False;
        dbedt_nm_historico.ReadOnly    := False;
        dbedt_dt_vencimento.ReadOnly   := False;
        dbedt_vl_despesa.ReadOnly      := False;
        dbedt_vl_desconto.ReadOnly     := False;
        dbedt_vl_acrescimo.ReadOnly    := False;
        dbedt_vl_ir.ReadOnly           := False;
        dbedt_vl_inss.ReadOnly         := False;
        dbedt_cd_usuario_ger.ReadOnly  := False;
        btn_co_usuario_ger.Enabled     := True;

        if qry_ctaapagar_lanc_.Active then
          pnl_dados_basicos_lanc.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                                            ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                                            ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                                            ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                                            ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                                            ( Not lPesq )
        else
          pnl_dados_basicos_lanc.Enabled := False;

        if qry_ctaapagar_ger_.Active then
          pnl_distr_gerencial.Enabled := ( qry_ctaapagar_ger_.RecordCount > 0 )           and
                                         ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                                         ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                                         ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                                         ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                                         ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and
                                         ( Not lPesq )
        else
          pnl_distr_gerencial.Enabled    := False;
      end; *)
      // Inibida próximas 1 linha - solicitado por Financeiro - 05/10/2005
    // end;
  end;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_ger_AfterScroll(DataSet: TDataSet);
begin
  with frm_ctaapagar do
  begin
    if ( ( qry_ctaapagar_ger_.RecordCount = 0 ) and ( Not ( qry_ctaapagar_ger_.State in [dsInsert] ) ) ) then
       pnl_distr_gerencial.Enabled := False
    else
      pnl_distr_gerencial.Enabled := ( qry_ctaapagar_ger_.RecordCount > 0 )           and
                                     ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                                     ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                                     ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                                     ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                                     ( qry_ctaapagar_CD_USUARIO_GER.AsString = str_cd_usuario ) and
                                     ( Not lPesq );
  end;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_CalcFields(DataSet: TDataSet);
VAR
   valor:Double;
begin

(*  qry_ctaapagar_CalcPagamento.AsFloat := MyRound(qry_ctaapagar_VL_DESPESA.AsFloat,2)  + MyRound(qry_ctaapagar_VL_ACRESCIMO.AsFloat,2) -
                                         MyRound(qry_ctaapagar_VL_DESCONTO.AsFloat,2) - MyRound(qry_ctaapagar_VL_IR.AsFloat,2) -
                                         MyRound(qry_ctaapagar_VL_INSS.AsFloat,2)     - MyRound(qry_ctaapagar_VL_PISCOFINS.AsFloat,2) -
                                         MyRound(qry_ctaapagar_VL_ISS.AsFloat,2); *)
if frm_ctaapagar.msk_qtde.text = '' then
  valor := 1
else
  valor:=StrToFloat(frm_ctaapagar.msk_qtde.text);


  qry_ctaapagar_CalcPagamento.AsFloat := qry_ctaapagar_VL_DESPESA.AsFloat  + qry_ctaapagar_VL_ACRESCIMO.AsFloat -
                                         qry_ctaapagar_VL_DESCONTO.AsFloat - (qry_ctaapagar_VL_IR.AsFloat ) -
                                         (qry_ctaapagar_VL_INSS.AsFloat )    - (qry_ctaapagar_VL_PISCOFINS.AsFloat ) -
                                         (qry_ctaapagar_VL_ISS.AsFloat ) ;


  qry_ctaapagar_CalcValor.AsFloat     := MyRound(qry_ctaapagar_VL_DESPESA.AsFloat  +
                                                 qry_ctaapagar_VL_ACRESCIMO.AsFloat - qry_ctaapagar_VL_DESCONTO.AsFloat -
                                                 qry_ctaapagar_VL_IR.AsFloat - qry_ctaapagar_VL_INSS.AsFloat -
                                                 qry_ctaapagar_VL_PISCOFINS.AsFloat - qry_ctaapagar_VL_ISS.AsFloat,2);
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_BeforePost(DataSet: TDataSet);
begin
//  qry_ctaapagar_VL_LIQUIDO.AsFloat := datm_ctaapagar.qry_ctaapagar_CalcPagamento.AsFloat;

  qry_ctaapagar_VL_LIQUIDO.AsFloat :=    qry_ctaapagar_VL_DESPESA.AsFloat + qry_ctaapagar_VL_ACRESCIMO.AsFloat -
                                         qry_ctaapagar_VL_DESCONTO.AsFloat - qry_ctaapagar_VL_IR.AsFloat -
                                         qry_ctaapagar_VL_INSS.AsFloat     - qry_ctaapagar_VL_PISCOFINS.AsFloat -
                                         qry_ctaapagar_VL_ISS.AsFloat;

  if qry_ctaapagar_NR_CTAAPAGAR.AsString = '***' then
  begin
    qry_ult_conta_.Close;
    qry_ult_conta_.ParamByName('CD_UNID_NEG').AsString := frm_ctaapagar.msk_cd_unidade.Text;
    qry_ult_conta_.ParamByName('DT_CTAAPAGAR').AsDate  := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
    qry_ult_conta_.Prepare;
    qry_ult_conta_.Open;
    if qry_ult_conta_ULTIMO.AsString = '' then
       qry_ctaapagar_NR_CTAAPAGAR.AsString := '001'
    else
      qry_ctaapagar_NR_CTAAPAGAR.AsString  :=
         StrZero( StrToInt( qry_ult_conta_ULTIMO.AsString ) + 1 , 3 );
    qry_ult_conta_.Close;
  end;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_AfterOpen(DataSet: TDataSet);
begin
  qry_ctaapagar_lanc_.Open;
  qry_ctaapagar_rateio.Open;
  with frm_ctaapagar do
  begin
    if qry_ctaapagar_.RecordCount > 0 then
    begin
      pnl_ctaapagar.Enabled          := Not lPesq;
      btn_canc_lanc.Enabled          := ( qry_ctaapagar_IN_CANCELADO.AsString = '0' ) and
                                        ( ( pgctrl_ctaapagar.ActivePage = ts_lista )   or
                                          ( pgctrl_ctaapagar.ActivePage = ts_dados_basicos ) );
      mi_canc_lanc.Enabled           := btn_canc_lanc.Enabled;
    end
    else
    begin
      pnl_ctaapagar.Enabled          := False;
      // pnl_dados_basicos_lanc.Enabled := False;
      pnl_distr_gerencial.Enabled    := False;
      btn_canc_lanc.Enabled          := False;
      mi_canc_lanc.Enabled           := False;
    end;
  end;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_CD_BARRASChange(Sender: TField);
begin
  if frm_ctaapagar.dbedt_cd_barras.Text <> '' then
     qry_ctaapagar_TP_PAGAMENTO.AsString := 'D';
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_lanc_AfterScroll(DataSet: TDataSet);
begin
  with frm_ctaapagar do
  begin
    (*
    //Inibido em 22/11/2006
    qry_ctaapagar_ger_.Close;
    qry_ctaapagar_ger_.ParamByName('CD_UNID_NEG').AsString    := qry_ctaapagar_lanc_CD_UNID_NEG.AsString;
    qry_ctaapagar_ger_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_lanc_DT_CTAAPAGAR.AsDateTime;
    qry_ctaapagar_ger_.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
    qry_ctaapagar_ger_.ParamByName('CD_CT_CONTABIL').AsString := qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString;
    qry_ctaapagar_ger_.ParamByName('CD_FILIAL').AsString      := qry_ctaapagar_lanc_CD_FILIAL.AsString;
    qry_ctaapagar_ger_.ParamByName('CD_CT_CUSTO').AsString    := qry_ctaapagar_lanc_CD_CT_CUSTO.AsString;
    qry_ctaapagar_ger_.Prepare;
    qry_ctaapagar_ger_.Open;
     *)

  (* if ( ( qry_ctaapagar_lanc_.RecordCount = 0 ) and ( Not ( qry_ctaapagar_lanc_.State in [dsInsert] ) ) ) then
    begin
      pnl_dados_basicos_lanc.Enabled := False;
      pnl_distr_gerencial.Enabled    := False;
    end
    else
    begin
      pnl_dados_basicos_lanc.Enabled := ( qry_ctaapagar_lanc_.RecordCount > 0 )          and
                                        ( qry_ctaapagar_IN_CANCELADO.AsString = '0' )    and
                                        ( qry_ctaapagar_IN_LIBERADO.AsString = '0' )     and
                                        ( qry_ctaapagar_CD_LT_CONTAB.AsString = '' )     and
                                        ( qry_ctaapagar_CD_LT_CONTAB_EXT.AsString = '' ) and
                                        ( Not lPesq );
    end;
    ts_distr_gerencial.TabVisible    := False;
    if ( qry_ctaapagar_ger_.Active ) and
       ( ( ( qry_ctaapagar_lanc_LookInDistribuiRM.AsString = '1' ) and ( frm_ctaapagar.str_cd_sistema_contabil = '0'  ) ) or
         ( ( qry_ctaapagar_lanc_LookInDistribui.AsString   = '1' ) and ( frm_ctaapagar.str_cd_sistema_contabil <> '0' ) ) ) then
       ts_distr_gerencial.TabVisible := True; *)
  end;
end;

procedure Tdatm_ctaapagar.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  qry_ctaapagar_.Close;
  qry_ctaapagar_.ParamByName('CD_UNID_NEG').AsString    := qry_lista_CD_UNID_NEG.AsString;
  qry_ctaapagar_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_lista_DT_CTAAPAGAR.AsDateTime;
  qry_ctaapagar_.ParamByName('NR_CTAAPAGAR').AsString   := qry_lista_NR_CTAAPAGAR.AsString;
  qry_ctaapagar_.Prepare;
  qry_ctaapagar_.Open;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_CD_FORNECEDORChange(Sender: TField);
begin
  if qry_ctaapagar_CD_FAVORECIDO.AsString = '' then
  begin
    qry_ctaapagar_CD_FAVORECIDO.AsString := qry_ctaapagar_CD_FORNECEDOR.AsString;
    frm_ctaapagar.dbedt_cd_favorecidoExit(nil);
  end;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_lanc_processo_CalcFields(
  DataSet: TDataSet);
begin
  qry_ctaapagar_lanc_processo_CalcNrProcesso.AsString :=
     Copy( qry_ctaapagar_lanc_processo_NR_PROCESSO.AsString, 1, 2 ) + '-' +
     Copy( qry_ctaapagar_lanc_processo_NR_PROCESSO.AsString, 3, 2 ) + '-' +
     Copy( qry_ctaapagar_lanc_processo_NR_PROCESSO.AsString, 5, 14 );
end;
procedure Tdatm_ctaapagar.exec_contabiliza_pagto_adm(cd_unid_neg,
  nr_ctaapagar, cd_banco, nr_docto: String; dt_movimento,
  dt_pagto: Tdatetime);
begin
(*  path := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create( path + 'RM.INI');
  vConnectionString := IniFile.ReadString('CONNECTION', 'STRING', 'ERROR');
  IniFile.Free;

  sp_cont_integracao_contabil.ConnectionString := vConnectionString;

  sp_cont_integracao_contabil.Parameters.ParamByName('@cd_unid_neg').VAlue  := cd_unid_neg;
  sp_cont_integracao_contabil.Parameters.ParamByName('@nr_cta_pagar').VAlue := nr_ctaapagar;
  sp_cont_integracao_contabil.Parameters.ParamByName('@cd_banco').VAlue     := cd_banco;
  sp_cont_integracao_contabil.Parameters.ParamByName('@nr_docto').VAlue     := nr_docto;
  sp_cont_integracao_contabil.Parameters.ParamByName('@dt_movimento').VAlue := dt_movimento;
  sp_cont_integracao_contabil.Parameters.ParamByName('@dt_pagto').VAlue     := dt_pagto;

  sp_cont_integracao_contabil.ExecProc;

  sp_cont_integracao_contabil.close; *)

  CloseStoredProc(sp_cont_integracao_contabil);
  sp_cont_integracao_contabil.ParamByName('@cd_unid_neg').VAlue  := cd_unid_neg;
  sp_cont_integracao_contabil.ParamByName('@nr_cta_pagar').VAlue := nr_ctaapagar;
  sp_cont_integracao_contabil.ParamByName('@cd_banco').VAlue     := cd_banco;
  sp_cont_integracao_contabil.ParamByName('@nr_docto').VAlue     := nr_docto;
  sp_cont_integracao_contabil.ParamByName('@dt_movimento').VAlue := dt_movimento;
  sp_cont_integracao_contabil.ParamByName('@dt_pagto').VAlue     := dt_pagto;
  ExecStoredProc(sp_cont_integracao_contabil);
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_AfterPost(DataSet: TDataSet);
begin
  with frm_ctaapagar do
    btn_mi( st_incluir, False, False, st_excluir );
  qry_ctaapagar_.ApplyUpdates;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_AfterEdit(DataSet: TDataSet);
begin
  with frm_ctaapagar do
  Begin
    btn_mi( false, true, true, false );
    Str_Cd_FornAnterior := qry_ctaapagar_CD_FORNECEDOR.AsString;
  End;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_ger_CalcFields(DataSet: TDataSet);
begin
  If frm_ctaapagar.str_cd_sistema_contabil = '0' Then
    qry_ctaapagar_ger_calcDistribGer.AsString := ConsultaLookUp('TCONTABIL_GERENCIAL','CD_CT_GERENCIAL',qry_ctaapagar_ger_CD_CT_GERENCIAL.AsString,'NM_CT_GERENCIAL')
  Else
    qry_ctaapagar_ger_calcDistribGer.AsString := ConsultaLookUp('TCT_GERENCIAL','CD_CT_GERENCIAL',qry_ctaapagar_ger_CD_CT_GERENCIAL.AsString,'NM_CT_GERENCIAL');
end;

procedure Tdatm_ctaapagar.qry_lista_CalcFields(DataSet: TDataSet);
begin
  If qry_lista_TP_PAGAMENTO.AsString = 'C' Then
    qry_lista_calcTP_PAGTO.AsString := 'Cheque'
  Else If qry_lista_TP_PAGAMENTO.AsString = '$' Then
    qry_lista_calcTP_PAGTO.AsString := 'Dinheiro'
  Else If qry_lista_TP_PAGAMENTO.AsString = 'D' Then
    qry_lista_calcTP_PAGTO.AsString := 'DOC / Débito Conta'
  Else If qry_lista_TP_PAGAMENTO.AsString = 'T' Then
    qry_lista_calcTP_PAGTO.AsString := 'TED';
  if qry_lista_IN_SELECIONADO.AsString = '1' then
    qry_lista_calcIN_SELECIONADO.AsString := 'ü'
  else qry_lista_calcIN_SELECIONADO.AsString := '';
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_lanc_AfterEdit(DataSet: TDataSet);
begin
  frm_ctaapagar.btn_mi( false, true, true, false );
  // Atualiza o edit com o valor disponível para ratear as contas
  With TQuery.Create(Application) Do
  Begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('select ISNULL(SUM(VL_LANCAMENTO),0) VALOR from TCTAAPAGAR_LANC');
    SQL.Add('where DT_CTAAPAGAR =:DT_CTAAPAGAR and NR_CTAAPAGAR = :NR_CTAAPAGAR and CD_CT_CONTABIL <> :CD_CT_CONTABIL');
    SQL.Add('and CD_UNID_NEG = :CD_UNID_NEG');
    ParamByName('DT_CTAAPAGAR').AsDateTime := qry_lista_DT_CTAAPAGAR.AsDateTime;
    ParamByName('NR_CTAAPAGAR').AsString   := qry_lista_NR_CTAAPAGAR.AsString;
    ParamByName('CD_CT_CONTABIL').AsString := qry_ctaapagar_lanc_CD_CT_CONTABIL.AsString;
    ParamByName('CD_UNID_NEG').AsString   := qry_lista_CD_UNID_NEG.AsString;
    Open;
    Frm_ctaapagar.EditValDisponivel.Text := FormatFloat('#,##0.00',qry_ctaapagar_CalcPagamento.AsFloat - FieldByname('VALOR').AsFloat);
    Free;
  End;
end;

procedure Tdatm_ctaapagar.qry_lista_AfterOpen(DataSet: TDataSet);
begin
  qry_status_solic_adm_.Open;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_AfterInsert(DataSet: TDataSet);
begin
  frm_ctaapagar.Str_Cd_FornAnterior := 'X';
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_AfterDelete(DataSet: TDataSet);
begin
  qry_ctaapagar_.ApplyUpdates;
end;

procedure Tdatm_ctaapagar.qry_ctaapagar_rateioBeforeOpen(
  DataSet: TDataSet);
begin
  qry_ctaapagar_rateio.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ctaapagar_DT_CTAAPAGAR.AsDateTime;
  qry_ctaapagar_rateio.ParamByName('NR_CTAAPAGAR').AsString   := qry_ctaapagar_NR_CTAAPAGAR.AsString;
  qry_ctaapagar_rateio.ParamByName('CD_UNID_NEG').AsString    := qry_ctaapagar_CD_UNID_NEG.AsString;
end;

end.
