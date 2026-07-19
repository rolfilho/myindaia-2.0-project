(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGFT004.PAS - Data Module Solicitação de Faturamento - datm_fat_sol
Manutenção:
*************************************************************************************************)
unit PGFT004;
    
interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DBTables;
 
type
  Tdatm_fat_sol = class(TDataModule)
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_CD_TIPO_LANC_FAT: TStringField;
    tbl_yesno_: TTable;
    qry_banco_: TQuery;                                                  
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;          
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_fat_: TQuery;
    ds_fat: TDataSource;
    qry_fat_proc_: TQuery;
    ds_fat_proc: TDataSource;
    qry_fat_proc_item_: TQuery;
    ds_fat_proc_item: TDataSource;
    qry_fat_proc_item_CD_UNID_NEG: TStringField;
    qry_fat_proc_item_CD_PRODUTO: TStringField;
    qry_fat_proc_item_NR_SOLICITACAO: TStringField;
    qry_fat_proc_item_NR_PROCESSO: TStringField;
    qry_fat_proc_item_CD_ITEM: TStringField;
    qry_fat_proc_item_VL_CALCULADO: TFloatField;
    qry_fat_proc_item_VL_INFORMADO: TFloatField;
    qry_fat_look_nm_usuario: TStringField;
    qry_fat_look_Calculado: TStringField;
    qry_fat_look_Cancelado: TStringField;
    qry_fat_look_nm_cancelador: TStringField;
    qry_fat_proc_item_look_nm_item: TStringField;
    qry_fat_cc_: TQuery;
    qry_fat_cc_NR_PROCESSO: TStringField;
    qry_fat_cc_NR_LANCAMENTO: TStringField;
    qry_fat_cc_CD_ITEM: TStringField;
    qry_fat_cc_VL_ITEM: TFloatField;
    qry_fat_cc_NM_ITEM_COMPLEMENTO: TStringField;
    qry_fat_cc_calc_vl_lancamento: TFloatField;
    ds_fat_cc: TDataSource;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_controle_: TQuery;
    qry_controle_CD_UNID_NEG: TStringField;
    qry_controle_CD_PRODUTO: TStringField;
    qry_controle_DT_MOVIMENTO: TDateTimeField;
    qry_controle_IN_FECHADO: TStringField;
    qry_controle_CD_USUARIO: TStringField;
    qry_controle_DT_FECHAMENTO: TDateTimeField;
    qry_controle_IN_CONTABILIZADO: TStringField;
    qry_controle_DT_CONTABILIZACAO: TDateTimeField;
    qry_controle_CD_CONTABILIZADOR: TStringField;
    qry_fat_proc_CD_UNID_NEG: TStringField;
    qry_fat_proc_CD_PRODUTO: TStringField;
    qry_fat_proc_NR_SOLICITACAO: TStringField;
    qry_fat_proc_NR_PROCESSO: TStringField;
    qry_fat_proc_Calc_Nr_Processo: TStringField;
    qry_fat_cc_look_nm_item: TStringField;
    qry_cre_deb_cc_: TQuery;
    qry_cre_deb_fat_: TQuery;
    qry_cre_deb_fat_TOT: TFloatField;
    qry_cre_deb_cc_TOTAL: TFloatField;
    qry_cre_deb_cc_CRED_F: TFloatField;
    qry_cre_deb_cc_DEB_F: TFloatField;
    sp_fat_saldos: TStoredProc;
    sp_fat_calc_padrao: TStoredProc;
    sp_fat_calculo: TStoredProc;
    sp_fat_canc: TStoredProc;
    qry_fat_ult_: TQuery;
    qry_fat_proc_item_IN_RESTITUI: TStringField;
    qry_fat_cc_IN_RESTITUI: TStringField;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno_: TDataSource;
    qry_fat_proc_item_look_restitui: TStringField;
    qry_fat_cc_calc_nm_item: TStringField;
    qry_fat_cc_DT_LANCAMENTO: TDateTimeField;
    qry_tipo_item_: TQuery;
    qry_tipo_item_CD_TIPO_ITEM: TStringField;
    qry_tipo_item_NM_TIPO_ITEM: TStringField;
    qry_tipo_item_TP_NATUREZA: TStringField;
    qry_tipo_item_IN_FATURAR: TStringField;
    qry_tipo_item_IN_RESTITUI: TStringField;
    qry_fat_proc_item_look_cd_tipo_item: TStringField;
    qry_fat_proc_item_calc_nm_item: TStringField;
    sp_contabiliza: TStoredProc;
    qry_contab_: TQuery;
    qry_contab_CD_COLIGADA: TStringField;
    qry_contab_NR_CONTAB: TStringField;
    qry_contab_DT_CONTAB: TDateTimeField;
    qry_contab_CD_USUARIO: TStringField;
    qry_contab_TP_CONTAB: TStringField;
    qry_contab_lanc_: TQuery;
    qry_contab_lanc_CD_COLIGADA: TStringField;
    qry_contab_lanc_NR_CONTAB: TStringField;
    qry_contab_lanc_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_CD_HISTORICO: TStringField;
    qry_contab_lanc_NM_HISTORICO: TStringField;
    qry_contab_lanc_CD_FILIAL: TStringField;
    qry_contab_lanc_CD_CUSTO: TStringField;
    ds_contab: TDataSource;
    ds_contab_lanc: TDataSource;
    ds_contab_gerencial: TDataSource;
    qry_contab_gerencial_: TQuery;
    qry_contab_DT_MOVIMENTO: TDateTimeField;
    qry_contab_gerencial_CD_COLIGADA: TStringField;
    qry_contab_gerencial_NR_CONTAB: TStringField;
    qry_contab_gerencial_NR_LANCAMENTO: TStringField;
    qry_contab_gerencial_CT_GERENCIAL: TStringField;
    qry_contab_gerencial_VL_GERENCIAL: TFloatField;
    qry_log_erro_calculo_: TQuery;
    qry_log_erro_calculo_CD_USUARIO: TStringField;
    qry_log_erro_calculo_NM_STORED_PROCEDURE: TStringField;
    qry_log_erro_calculo_CD_ERRO: TSmallintField;
    qry_log_erro_calculo_CD_ITEM: TStringField;
    qry_tot_erro_: TQuery;
    qry_tot_erro_TOT_ERRO: TIntegerField;
    qry_contab_CD_UNID_NEG: TStringField;
    qry_contab_CD_PRODUTO: TStringField;
    qry_tipo_item_IN_FAT_SOLIC: TStringField;
    qry_fat_proc_item_look_in_fat_sol: TStringField;
    qry_fat_proc_item_CD_FAVORECIDO: TStringField;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_fat_proc_item_look_nm_favorecido: TStringField;
    qry_proc_fat_: TQuery;
    qry_proc_fat_NR_SOLICITACAO: TStringField;
    qry_proc_fat_DT_FATURA: TDateTimeField;
    qry_pend_followup_: TQuery;
    qry_pend_followup_TOT_PEND: TIntegerField;
    qry_cliente_habil_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_VL_II_MN: TFloatField;
    qry_processo_VL_IPI_MN: TFloatField;
    qry_processo_VL_ICMS_MN: TFloatField;
    qry_fat_cliente_: TQuery;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_fat_cliente_CD_UNID_NEG: TStringField;
    qry_fat_cliente_CD_PRODUTO: TStringField;
    qry_fat_cliente_NR_SOLICITACAO: TStringField;
    qry_fat_cliente_NR_PROCESSO: TStringField;
    qry_fat_cliente_CD_CLIENTE: TStringField;
    qry_fat_cliente_AP_EMPRESA: TStringField;
    qry_fat_cliente_DT_IMPRESSAO: TDateTimeField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_itens_pago_cli_: TQuery;
    qry_processo_CD_GRUPO: TStringField;
    qry_fat_cc_TX_YESNO: TStringField;
    qry_fat_cc_VL_ASSIST: TFloatField;
    qry_atz_fat_cc_: TQuery;
    qry_fat_cc_IN_SEL_FAT: TStringField;
    sp_rel_fin_controle_num: TStoredProc;
    sp_fat_pagos_cli: TStoredProc;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_tot_fat_proc_: TQuery;
    qry_distinct_cliente_por_fatura_: TQuery;
    qry_fat_proc_item_IN_NAO_FAT: TStringField;
    qry_fat_proc_item_INDICE: TStringField;
    qry_feriado_: TQuery;
    qry_feriado_DT_FERIADO: TDateTimeField;
    qry_feriado_NM_FERIADO: TStringField;
    qry_fat_proc_item_IN_MANUAL: TStringField;
    qry_rel_liq_: TQuery;
    qry_rel_liq_TOT_LIQ: TIntegerField;
    sp_fat_refat: TStoredProc;
    qry_bol_fatura_: TQuery;
    qry_bol_fatura_NR_BOLETO: TStringField;
    qry_bol_fatura_IN_CANCELADO: TStringField;
    sp_fat_duplica: TStoredProc;
    qry_cliente_fat_proc_: TQuery;
    qry_cliente_fat_proc_CD_CLIENTE: TStringField;
    qry_cli_hab_: TQuery;
    qry_cli_hab_IN_NOTA_LIQ: TStringField;
    qry_fat_ult_NR_ULT_SOLICITACAO: TStringField;
    qry_fat_CD_UNID_NEG: TStringField;
    qry_fat_CD_PRODUTO: TStringField;
    qry_fat_NR_SOLICITACAO: TStringField;
    qry_fat_CD_USUARIO: TStringField;
    qry_fat_TP_TIPO_FAT: TStringField;
    qry_fat_NR_NOTA_FATURA: TStringField;
    qry_fat_CD_CANCELADOR: TStringField;
    qry_fat_TX_OBSERVACOES: TMemoField;
    qry_fat_NR_RELATORIO: TStringField;
    qry_fat_NR_ANO: TStringField;
    qry_fat_IN_CALCULADO: TStringField;
    qry_fat_IN_CANCELADO: TStringField;
    qry_fat_IN_LIQ_AUT: TStringField;
    qry_fat_IN_IMP_NF_SERV: TStringField;
    qry_fat_IN_LIQUIDADO: TStringField;
    qry_fat_DT_SOLICITACAO: TDateTimeField;
    qry_fat_DT_FATURA: TDateTimeField;
    qry_fat_DT_VENCTO_FATURA: TDateTimeField;
    qry_fat_DT_CALCULO: TDateTimeField;
    qry_fat_DT_NF_SERV: TDateTimeField;
    qry_fat_DT_CANCELAMENTO: TDateTimeField;
    qry_fat_CalcNrSolicitacao: TStringField;
    qry_fat_NR_NF_SERV: TStringField;
    qry_calculo_rateio_desp_: TQuery;
    ds_calculo_rateio_desp: TDataSource;
    qry_calculo_rateio_desp_NR_IDENTIFICADOR: TIntegerField;
    qry_calculo_rateio_desp_CD_ITEM: TStringField;
    qry_calculo_rateio_desp_CD_AREA: TStringField;
    qry_calculo_rateio_desp_TP_RATEIO_DESP: TStringField;
    qry_area_: TQuery;
    qry_item_rat_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_calculo_rateio_desp_LookNmItem: TStringField;
    qry_calculo_rateio_desp_LookNmArea: TStringField;
    qry_ttp_rateio_desp_: TQuery;
    qry_ttp_rateio_desp_TP_RATEIO_DESP: TStringField;
    qry_ttp_rateio_desp_NM_TP_RATEIO_DESP: TStringField;
    qry_calculo_rateio_desp_LookNmRateioDesp: TStringField;
    qry_calculo_rateio_desp_NR_PROCESSO: TStringField;
    qry_calculo_rateio_desp_Calc_Nr_Processo: TStringField;
    qry_calculo_rateio_desp_OBS: TStringField;
    qry_calculo_rateio_desp_NR_PROC_PO_NR_ITEM_PO: TStringField;
    qry_calculo_rateio_desp_CD_REFERENCIA: TStringField;
    qry_verif_nd_: TQuery;
    qry_verif_nd_IN_ND: TStringField;
    qry_retencao_: TQuery;
    qry_nf_impressa_: TQuery;
    qry_tot_tributavel_: TQuery;
    qry_comissao_: TQuery;
    qry_status_: TQuery;
    qry_status_IN_STATUS: TStringField;
    qry_grupo_cliente_: TQuery;
    qry_retencao_grupo_: TQuery;
    qry_comissao_old: TQuery;
    qry_tot_tributavel_old: TQuery;
    qry_nf_impressa_grupo_: TQuery;
    qry_param_VL_REMESSA: TFloatField;
    ds_fat_docto: TDataSource;
    qry_fat_docto_: TQuery;
    qry_fat_docto_CD_UNID_NEG: TStringField;
    qry_fat_docto_CD_PRODUTO: TStringField;
    qry_fat_docto_NR_SOLICITACAO: TStringField;
    qry_fat_docto_CD_DOCUMENTO: TStringField;
    qry_fat_docto_NR_DOCTO: TStringField;
    qry_fat_docto_LookDocumento: TStringField;
    qry_fat_docto_LookFormaDocto: TStringField;
    qry_docto_: TQuery;
    qry_docto_CODIGO: TStringField;
    qry_docto_DESCRICAO: TStringField;
    qry_tp_forma_doc_: TQuery;
    qry_tp_forma_doc_CD_FORMA_DOC: TStringField;
    qry_tp_forma_doc_NM_FORMA_DOC: TStringField;
    qry_fat_docto_CD_FORMA_DOC: TStringField;
    ds_tp_forma_doc: TDataSource;
    qry_cliente_doc_: TQuery;
    qry_fat_proc_item_CD_CT_CUSTO: TStringField;
    qry_fat_IN_PREVIEW: TStringField;
    procedure qry_fat_proc_BeforeInsert(DataSet: TDataSet);
    procedure qry_fat_proc_BeforeEdit(DataSet: TDataSet);
    procedure qry_fat_proc_BeforePost(DataSet: TDataSet);
    procedure qry_fat_proc_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_proc_CalcFields(DataSet: TDataSet);
    procedure qry_fat_proc_AfterCancel(DataSet: TDataSet);
    procedure qry_fat_proc_AfterOpen(DataSet: TDataSet);
    procedure qry_fat_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_proc_item_BeforeEdit(DataSet: TDataSet);
    procedure qry_fat_proc_item_BeforeInsert(DataSet: TDataSet);
    procedure qry_fat_proc_item_AfterCancel(DataSet: TDataSet);
    procedure qry_fat_proc_item_AfterPost(DataSet: TDataSet);
    procedure qry_fat_proc_item_AfterOpen(DataSet: TDataSet);
    procedure qry_fat_proc_item_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_cc_CalcFields(DataSet: TDataSet);
    procedure qry_controle_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_proc_item_CalcFields(DataSet: TDataSet);
    procedure qry_fat_TP_TIPO_FATChange(Sender: TField);
    procedure qry_fat_proc_BeforeDelete(DataSet: TDataSet);
    procedure qry_fat_CalcFields(DataSet: TDataSet);
    procedure qry_calculo_rateio_desp_CalcFields(DataSet: TDataSet);
    procedure qry_calculo_rateio_desp_AfterOpen(DataSet: TDataSet);
    procedure qry_fat_docto_AfterOpen(DataSet: TDataSet);
  private
  public
  end;

var
  datm_fat_sol: Tdatm_fat_sol;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, GSMLIB, PGFT003;

procedure Tdatm_fat_sol.qry_fat_proc_BeforeInsert(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    dbg_processo.Enabled := False;
    HabilitaProc( True );
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_BeforeEdit(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    dbg_processo.Enabled := False;
    HabilitaProc( True );
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_BeforePost(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    dbg_processo.Enabled := True;
    HabilitaProc( True );
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_AfterScroll(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if pgctrl_fat_sol.ActivePage <> ts_solicitacao then  //Rodrigo Capra - 20/03/2008 - Só abrir querys qdo a aba não for a LISTA
    begin
      if qry_fat_proc_.RecordCount <= 0 then
      begin
        msk_vl_cred_proc.Text  := FormatFloat('#0,.00', 0);
        msk_vl_deb_proc.Text   := FormatFloat('#0,.00', 0);
        msk_vl_saldo_proc.Text := FormatFloat('#0,.00', 0);
        msk_vl_cred_sol.Text   := FormatFloat('#0,.00', 0);
        msk_vl_deb_sol.Text    := FormatFloat('#0,.00', 0);
        msk_vl_saldo_sol.Text  := FormatFloat('#0,.00', 0);
        frm_fat_sol.db_dt_venc_fat_.ReadOnly := true;
        qry_fat_cc_.Close;
        Exit;
      end
      else
      begin
        frm_fat_sol.st_exc := True;
      end;

      qry_fat_cc_.Close;
      qry_fat_cc_.ParamByName('CD_UNID_NEG').AsString    := qry_fat_proc_CD_UNID_NEG.AsString;
      qry_fat_cc_.ParamByName('CD_PRODUTO').AsString     := qry_fat_proc_CD_PRODUTO.AsString;
      qry_fat_cc_.ParamByName('NR_PROCESSO').AsString    := qry_fat_proc_NR_PROCESSO.AsString;
      qry_fat_cc_.ParamByName('NR_SOLICITACAO').AsString := qry_fat_proc_NR_SOLICITACAO.AsString;
      qry_fat_cc_.ParamByName('DT_FATURA').AsDateTime    := qry_fat_DT_FATURA.AsDateTime;
      qry_fat_cc_.Prepare;
      qry_fat_cc_.Open;

      msk_nr_processo.Text := Copy( qry_fat_proc_NR_PROCESSO.AsString, 5, 14 );
      frm_fat_sol.db_dt_venc_fat_.ReadOnly := False;

      try
        CloseStoredProc(sp_fat_saldos);

        sp_fat_saldos.ParamByName('@CD_UNID_NEG').AsString := qry_fat_proc_CD_UNID_NEG.AsString;
        sp_fat_saldos.ParamByName('@CD_PRODUTO').AsString  := qry_fat_proc_CD_PRODUTO.AsString;
        sp_fat_saldos.ParamByName('@NR_SOLIC').AsString    := qry_fat_proc_NR_SOLICITACAO.AsString;
        sp_fat_saldos.ParamByName('@NR_PROCESSO').AsString := qry_fat_proc_NR_PROCESSO.AsString;

        ExecStoredProc(sp_fat_saldos);


        msk_vl_cred_proc.Text  := FormatFloat('#0,.00', sp_fat_saldos.ParamByName('@VL_CRED_PROC').AsFloat);
        msk_vl_deb_proc.Text   := FormatFloat('#0,.00', sp_fat_saldos.ParamByName('@VL_DEB_PROC').AsFloat);
        msk_vl_saldo_proc.Text := FormatFloat('#0,.00',
                                  sp_fat_saldos.ParamByName('@VL_CRED_PROC').AsFloat -
                                  sp_fat_saldos.ParamByName('@VL_DEB_PROC').AsFloat );
        msk_vl_cred_sol.Text   := FormatFloat('#0,.00', sp_fat_saldos.ParamByName('@VL_CRED_SOL').AsFloat);
        msk_vl_deb_sol.Text    := FormatFloat('#0,.00', sp_fat_saldos.ParamByName('@VL_DEB_SOL').AsFloat);
        msk_vl_saldo_sol.Text  := FormatFloat('#0,.00',
                                  sp_fat_saldos.ParamByName('@VL_CRED_SOL').AsFloat -
                                  sp_fat_saldos.ParamByName('@VL_DEB_SOL').AsFloat );
        CloseStoredProc(sp_fat_saldos);
      except
        on E: Exception do
        begin
          TrataErro(E);
        end;
      end;
    end;
  end;
  qry_processo_.Close;
  qry_processo_.Prepare;
  qry_processo_.Open;
end;

procedure Tdatm_fat_sol.qry_fat_proc_CalcFields(DataSet: TDataSet);
begin
  if Not qry_fat_proc_NR_PROCESSO.IsNull then
  begin
    qry_fat_proc_Calc_Nr_Processo.AsString := Copy( qry_fat_proc_NR_PROCESSO.AsString, 5, 14 );
  end
end;

procedure Tdatm_fat_sol.qry_fat_proc_AfterCancel(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    msk_nr_processo.Text := Copy( qry_fat_proc_NR_PROCESSO.AsString, 5, 14 );
    dbg_processo.Enabled := True;
    HabilitaProc( True );
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_AfterOpen(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    msk_nr_processo.Text := Copy( qry_fat_proc_NR_PROCESSO.AsString, 5, 14 );
    HabilitaProc( False );
    msk_nr_processo.Text := '';
    msk_cd_grupo.Text    := '';
    msk_cd_grupoExit(nil);
    msk_cd_cliente.Text  := '';
    msk_cd_clienteExit(nil);
    msk_dt_inicio.Text   := '  /  /    ';
    msk_dt_termino.Text  := '  /  /    ';
  end;
end;

procedure Tdatm_fat_sol.qry_fat_AfterScroll(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if ( qry_fat_IN_CALCULADO.AsString = '0' ) and
       ( qry_fat_IN_CANCELADO.AsString = '0' ) and
     // Sistema permite recalcular mesmo com NF pq pode precisar mudar favorecido
       ( qry_controle_IN_FECHADO.AsString = '0' ) then
    begin
      mi_calcular.Enabled       := True;
      btn_calculo.Enabled       := True;
      btnPreviewCalc.Enabled    := True;
      ds_fat.AutoEdit           := True;
      ds_fat_proc.AutoEdit      := True;
      ds_fat_proc_item.AutoEdit := True;
      if ( pgctrl_fat_sol.ActivePage = ts_processo ) or
         ( pgctrl_fat_sol.ActivePage = ts_item ) then
      begin
        btn_excluir.Enabled     := True;
        mi_excluir.Enabled      := True;
      end;
    end
    else
    begin
      mi_calcular.Enabled       := False;
      btn_calculo.Enabled       := False;
      btnPreviewCalc.Enabled    := False;
      ds_fat_proc.AutoEdit      := False;
      ds_fat_proc_item.AutoEdit := False;
      btn_excluir.Enabled       := False;
      mi_excluir.Enabled        := False;
    end;

    if qry_fat_IN_CANCELADO.AsString = '0' then
    begin
      if qry_controle_IN_FECHADO.AsString = '0' then
      begin
        mi_canc_sol.Enabled       := True;
        btn_canc_sol.Enabled      := True;
      end;
      mi_duplicar.Enabled       := False;
      btn_duplicar.Enabled      := False;
    end
    else
    begin
      mi_canc_sol.Enabled       := False;
      btn_canc_sol.Enabled      := False;
      mi_duplicar.Enabled       := True;
      btn_duplicar.Enabled      := True;
    end;

    btn_refat.Enabled := ( ( qry_fat_IN_CALCULADO.AsString = '1' ) and ( qry_fat_IN_CANCELADO.AsString = '0' ) );
    mi_refat.Enabled  := ( ( qry_fat_IN_CALCULADO.AsString = '1' ) and ( qry_fat_IN_CANCELADO.AsString = '0' ) );

    // Qdo existe Nota emitida não permitir refaturar - 21/01/2005
    if ( Length( qry_fat_NR_NOTA_FATURA.AsString ) <> 0 ) then
    begin
      btn_refat.Enabled := False;
      mi_refat.Enabled := False;
    end;

    // Documentos
    qry_fat_docto_.Close;
    qry_fat_docto_.Prepare;
    qry_fat_docto_.Open;
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_BeforeEdit(DataSet: TDataSet);
begin
  frm_fat_sol.dbg_item.Enabled := False;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_BeforeInsert(DataSet: TDataSet);
begin
  frm_fat_sol.dbg_item.Enabled := False;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_AfterCancel(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    dbg_item.Enabled := True;
    if qry_fat_proc_item_.RecordCount > 0 then
      pnl_item.Enabled := True
    else
      pnl_item.Enabled := False;
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_AfterPost(DataSet: TDataSet);
begin
  frm_fat_sol.dbg_item.Enabled := True;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_AfterOpen(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if qry_fat_proc_item_.RecordCount > 0 then
      pnl_item.Enabled := True
    else
      pnl_item.Enabled := False;
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_AfterScroll(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if ( qry_fat_IN_CALCULADO.AsString = '0' ) and
       ( qry_controle_IN_FECHADO.AsString = '0' ) and
       ( qry_fat_IN_IMP_NF_SERV.AsString = '0' ) and
       ( qry_fat_IN_CANCELADO.AsString = '0' ) then
    begin
      if ( pgctrl_fat_sol.ActivePage = ts_processo ) or
         ( pgctrl_fat_sol.ActivePage = ts_item ) then
      begin
        btn_excluir.Enabled := True;
        mi_excluir.Enabled  := True;
      end;
    end
    else
    begin
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end;

    if qry_fat_proc_item_NR_SOLICITACAO.AsString <> '' then
    begin
      if ( ( qry_tipo_item_.Locate('CD_TIPO_ITEM',
                   qry_fat_proc_item_look_cd_tipo_item.AsString ,[loCaseInsensitive]) ) and
           ( qry_tipo_item_IN_RESTITUI.AsString = '1' ) ) then
      begin
        dblkpcbox_restitui.Enabled := True;
        dblkpcbox_restitui.Color := clWindow;
        dblkpcbox_restitui.ReadOnly := False;
      end
      else
      begin
        dblkpcbox_restitui.Enabled := False;
        dblkpcbox_restitui.Color := clMenu;
        dblkpcbox_restitui.ReadOnly := True;
        if qry_fat_proc_item_IN_RESTITUI.AsString <> '0' then
        begin
          if Not ( qry_fat_proc_item_.State in [dsEdit, dsInsert] ) then qry_fat_proc_item_.Edit;
          qry_fat_proc_item_IN_RESTITUI.AsString := '0';
          dbedt_cd_itemChange(nil);
        end;
      end;
    end;

    if qry_fat_proc_item_IN_MANUAL.AsString = '0' then
    begin
      dbchk_cliente.Enabled := False;
    end
    else
    begin
      dbchk_cliente.Enabled := True;
    end;
  end;
end;

procedure Tdatm_fat_sol.qry_fat_cc_CalcFields(DataSet: TDataSet);
var
  vl_lanc : Double;
begin
  vl_lanc := 0;
  if Not qry_fat_cc_VL_ITEM.IsNull then
     vl_lanc := vl_lanc + qry_fat_cc_VL_ITEM.AsFloat;
  if Not qry_fat_cc_VL_ASSIST.IsNull then
     vl_lanc := vl_lanc + qry_fat_cc_VL_ASSIST.AsFloat;
  qry_fat_cc_calc_vl_lancamento.AsFloat := vl_lanc;

  if qry_fat_cc_IN_RESTITUI.AsString = '1' then
    if qry_fat_cc_NM_ITEM_COMPLEMENTO.AsString = 'ESTORNO' then
      qry_fat_cc_calc_nm_item.AsString := 'ESTORNO/' + qry_fat_cc_look_nm_item.AsString
    else
      qry_fat_cc_calc_nm_item.AsString := 'REST./' + qry_fat_cc_look_nm_item.AsString
  else
    qry_fat_cc_calc_nm_item.AsString := qry_fat_cc_look_nm_item.AsString
end;

procedure Tdatm_fat_sol.qry_controle_AfterScroll(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if qry_controle_IN_FECHADO.AsString = '1' then
    begin
      mi_fechar.Enabled  := False;
      btn_fechar.Enabled := False;
    end
    else
    begin
      mi_fechar.Enabled  := True;
      btn_fechar.Enabled := True;
    end;
  end;
end;

procedure Tdatm_fat_sol.qry_fat_proc_item_CalcFields(DataSet: TDataSet);
begin
  if qry_fat_proc_item_IN_RESTITUI.AsString = '1' then
    qry_fat_proc_item_calc_nm_item.AsString := 'REST./' + qry_fat_proc_item_look_nm_item.AsString
  else
    qry_fat_proc_item_calc_nm_item.AsString := qry_fat_proc_item_look_nm_item.AsString;
end;

procedure Tdatm_fat_sol.qry_fat_TP_TIPO_FATChange(Sender: TField);
begin
  if qry_fat_TP_TIPO_FAT.AsString = 'N' then
    frm_fat_sol.lbl_doc_hist.Caption := 'Histórico'
  else
    frm_fat_sol.lbl_doc_hist.Caption := 'Documentos anexos'
end;

procedure Tdatm_fat_sol.qry_fat_proc_BeforeDelete(DataSet: TDataSet);
begin
  qry_processo_.Close;
  qry_processo_.Prepare;
  qry_processo_.Open;
end;

procedure Tdatm_fat_sol.qry_fat_CalcFields(DataSet: TDataSet);
begin
  qry_fat_CalcNrSolicitacao.AsString := Copy( qry_fat_NR_SOLICITACAO.AsString, 1, 2 ) + '/' +
                                        Copy( qry_fat_NR_SOLICITACAO.AsString, 3, 4 );
end;

procedure Tdatm_fat_sol.qry_calculo_rateio_desp_CalcFields(
  DataSet: TDataSet);
begin
  if Not qry_calculo_rateio_desp_NR_PROCESSO.IsNull then
  begin
    qry_calculo_rateio_desp_Calc_Nr_Processo.AsString := Copy( qry_calculo_rateio_desp_NR_PROCESSO.AsString, 5, 14 );
  end
end;

procedure Tdatm_fat_sol.qry_calculo_rateio_desp_AfterOpen(
  DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if ( Trim( msk_cd_produto.Text ) = '01' ) or
       ( Trim( msk_cd_produto.Text ) = '03' ) then
      dbgrd_item_area.Columns[5].Title.Caption := 'Nº PO'
    else
      dbgrd_item_area.Columns[5].Title.Caption := 'Nº Remessa';
  end;
end;

procedure Tdatm_fat_sol.qry_fat_docto_AfterOpen(DataSet: TDataSet);
begin
  with frm_fat_sol do
  begin
    if qry_fat_docto_.RecordCount > 0 then
    begin
      mi_excluir.Enabled    := True;
      btn_excluir.Enabled   := True;
      pnl_documento.Enabled := True;
    end;
  end;
end;

end.
