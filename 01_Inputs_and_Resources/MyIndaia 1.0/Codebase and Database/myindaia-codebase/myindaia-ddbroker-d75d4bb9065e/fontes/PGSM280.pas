(*******************************************************************************
Sistema: DD Broker - Bysoft
PROGRAMA: PGSM243.PAS - datm_portos
AUTOR: Ricardo Giacomi Lopes
DATA: 05/06/2002
Manutenção: Ricardo Giacomi Lopes
Data: 05/06/2002 - ADBC-0006 - Cadastro de Porto / Aeroporto
********************************************************************************)

unit PGSM280;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ADODB, Inifiles;

type
  Tdatm_recebimento_ag = class(TDataModule)
    qry_pesquisa_: TQuery;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_notificacao_pend_: TQuery;
    qry_notificacao_pend_NR_PROCESSO: TStringField;
    qry_notificacao_pend_VL_SOLICITADO: TFloatField;
    qry_notificacao_pend_DT_SOLICITACAO: TDateTimeField;
    qry_notificacao_pend_NR_SOLICITACAO: TStringField;
    ds_notif_pend: TDataSource;
    qry_notificacao_pend_IN_SELECIONADO: TStringField;
    qry_list_receb_: TQuery;
    ds_list_receb: TDataSource;
    Up_notif_pedent: TUpdateSQL;
    qry_notificacao_pend_NM_EMPRESA: TStringField;
    qry_recebimento_: TQuery;
    qry_recebimento_CD_CLIENTE: TStringField;
    qry_recebimento_DT_RECEBIMENTO: TDateTimeField;
    qry_recebimento_CD_USUARIO: TStringField;
    qry_recebimento_CD_BANCO: TStringField;
    qry_recebimento_VL_RECEBIMENTO: TFloatField;
    qry_recebimento_IN_CANCELADO: TStringField;
    qry_recebimento_DT_CANCELAMENTO: TDateTimeField;
    qry_recebimento_CD_USUARIO_CANC: TStringField;
    qry_recebimento_IN_TRANSFERIDO: TStringField;
    qry_recebimento_QT_ITENS_RECEB: TIntegerField;
    qry_recebimento_IN_TRANSF_CANC: TStringField;
    qry_recebimento_VL_DEVOLVIDO: TFloatField;
    qry_recebimento_IN_FAV_SM: TStringField;
    qry_recebimento_DT_SOLIC_CH: TStringField;
    qry_recebimento_NR_SOLIC_CH: TStringField;
    qry_recebimento_NR_FP: TStringField;
    qry_recebimento_IN_CAMBIO: TStringField;
    qry_recebimento_IN_UNIFICADO: TStringField;
    ds_recebimento: TDataSource;
    qry_recebimento_processo_: TQuery;
    qry_recebimento_processo_NR_PROCESSO: TStringField;
    qry_recebimento_processo_CD_CLIENTE: TStringField;
    qry_recebimento_processo_NR_SOLICITACAO: TStringField;
    qry_recebimento_processo_VL_SOLICITADO: TFloatField;
    qry_recebimento_processo_VL_RECEBIDO: TFloatField;
    qry_recebimento_processo_IN_CANCELADO: TStringField;
    qry_recebimento_processo_VL_UTILIZADO: TFloatField;
    qry_recebimento_processo_VL_DEVOLVIDO: TFloatField;
    qry_recebimento_processo_CD_STATUS: TStringField;
    ds_recb_processo: TDataSource;
    qry_recebimento_NM_BANCO: TStringField;
    Update_receb: TUpdateSQL;
    qry_moeda_tarifario_: TQuery;
    ds_moeda_tarifario: TDataSource;
    Update_tarifario: TUpdateSQL;
    qry_moeda_tarifario_CD_CLIENTE: TStringField;
    qry_moeda_tarifario_CD_MOEDA: TStringField;
    qry_moeda_tarifario_VL_TARIFARIO: TFloatField;
    qry_moeda_tarifario_VL_MANUAL: TFloatField;
    qry_recebimento_processo_DT_TARIFARIO: TDateTimeField;
    qry_recebimento_processo_calc_processo: TStringField;
    qry_moeda_broker_: TQuery;
    qry_moeda_tarifario_Look_nm_moeda: TStringField;
    Update_receb_processo: TUpdateSQL;
    qry_receb_proc_item_: TQuery;
    qry_receb_proc_item_NR_PROCESSO: TStringField;
    qry_receb_proc_item_NR_SOLICITACAO: TStringField;
    qry_receb_proc_item_NR_LANCAMENTO: TStringField;
    qry_receb_proc_item_CD_ITEM: TStringField;
    qry_receb_proc_item_VL_SOLICITADO: TFloatField;
    qry_receb_proc_item_VL_RECEBIDO: TFloatField;
    qry_receb_proc_item_IN_CANCELADO: TStringField;
    qry_receb_proc_item_VL_UTILIZADO: TFloatField;
    qry_receb_proc_item_VL_DEVOLVIDO: TFloatField;
    qry_receb_proc_item_CD_MOEDA_VENDA: TStringField;
    qry_receb_proc_item_VL_VENDA: TFloatField;
    qry_receb_proc_item_CD_MOEDA_COMPRA: TStringField;
    qry_receb_proc_item_VL_COMPRA: TFloatField;
    DDS_RECB_PROC_ITEM: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_receb_proc_item_Look_nm_item: TStringField;
    Update_proc_item: TUpdateSQL;
    qry_receb_proc_item_VL_TARIFARIO: TFloatField;
    qry_receb_proc_item_Look_nm_moeda: TStringField;
    qry_recebimento_VL_TOT_RECEBIDO: TFloatField;
    qry_recebimento_IN_MAIOR: TStringField;
    qry_recebimento_IN_ABERTO: TStringField;
    qry_recebimento_processo_VL_ADICIONAL: TFloatField;
    qry_recebimento_VL_TT_ADICIONAL: TFloatField;
    qry_list_receb_DT_RECEBIMENTO: TDateTimeField;
    qry_list_receb_IN_ABERTO: TStringField;
    qry_list_receb_IN_CANCELADO: TStringField;
    qry_list_receb_CD_USUARIO: TStringField;
    qry_list_receb_CD_USUARIO_CANC: TStringField;
    qry_list_receb_VL_RECEBIMENTO: TFloatField;
    qry_list_receb_CD_BANCO: TStringField;
    qry_list_receb_CD_CLIENTE: TStringField;
    qry_list_receb_DT_CANCELAMENTO: TDateTimeField;
    qry_list_receb_AP_USUARIO: TStringField;
    qry_list_receb_NM_BANCO: TStringField;
    qry_list_receb_NM_CLIENTE: TStringField;
    qry_notificacao_pend_CD_UNID_NEG: TStringField;
    qry_notificacao_pend_CD_PRODUTO: TStringField;
    qry_recebimento_CD_UNID_NEG: TStringField;
    qry_recebimento_processo_CD_UNID_NEG: TStringField;
    qry_receb_proc_item_CD_CLIENTE: TStringField;
    qry_receb_proc_item_CD_UNID_NEG: TStringField;
    qry_recebimento_processo_NR_LANC_RECEB: TStringField;
    qry_receb_proc_item_NR_LANC_RECEB: TStringField;
    qry_list_receb_CD_UNID_NEG: TStringField;
    qry_recebimento_processo_calc_tt_processo: TFloatField;
    qry_receb_proc_item_CD_BANCO_ITEM: TStringField;
    qry_receb_proc_item_VL_ADICIONAL_ITEM: TFloatField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_receb_proc_item_LooK_nm_banco: TStringField;
    sp_distribui_numerario_ag: TStoredProc;
    sp_cancela_recebimento_ag: TStoredProc;
    qry_caixa_ctrl_: TQuery;
    qry_notificacao_pend_CD_CLIENTE: TStringField;
    qry_pesq_notificacao_: TQuery;
    ds_pesq_notificacao: TDataSource;
    qry_pesq_notificacao_NR_SOLICITACAO: TStringField;
    qry_pesq_notificacao_NR_PROCESSO: TStringField;
    qry_pesq_notificacao_VL_SOLICITADO: TFloatField;
    qry_pesq_notificacao_VL_RECEBIDO: TFloatField;
    qry_pesq_notificacao_DT_SOLICITACAO: TDateTimeField;
    qry_pesq_notificacao_DT_EMISSAO: TDateTimeField;
    qry_pesq_notificacao_CD_STATUS: TStringField;
    qry_cgc_favorecido_: TQuery;
    sp_atualiza_receb_num_ag: TStoredProc;
    qry_notificacao_pend_TP_SERVICO: TStringField;
    qry_recebimento_processo_NR_PRIORIDADE: TIntegerField;
    qry_recebimento_TP_RECEBIMENTO: TStringField;
    qry_list_receb_TP_RECEBIMENTO: TStringField;
    qry_recebimento_VL_TOT_UTILIZADO: TFloatField;
    sp_atz_numerario_ag: TStoredProc;
    sp_orig_receb_ag: TStoredProc;
    qry_notificacao_pend_NR_PROCESSO_VINC: TStringField;
    qry_moeda_tarifario_CD_UNID_NEG: TStringField;
    sp_atz_tarifa_desemb: TStoredProc;
    sp_canc_receb_vinc: TStoredProc;
    sp_atz_status_solic_pagto_ag: TStoredProc;
    sp_atz_pagto_ag: TStoredProc;
    sp_distribui_pagto: TStoredProc;
    sp_solic_pagto_vinc_ag: TStoredProc;
    qry_recebimento_IN_FATURADO: TStringField;
    sp_recebimento_filtro: TStoredProc;
    sp_canc_receb_filtro: TStoredProc;
    qry_list_receb_NR_PROCESSO: TStringField;
    qry_fatura_: TQuery;
    ds_fatura: TDataSource;
    qry_fatura_NR_RECEBIMENTO: TStringField;
    qry_fatura_CD_CLIENTE: TStringField;
    qry_fatura_CD_UNID_NEG: TStringField;
    qry_fatura_NR_LANC_RECEB: TStringField;
    qry_fatura_DT_RECEBIMENTO: TDateTimeField;
    qry_fatura_NR_PROCESSO: TStringField;
    qry_fatura_NR_SOLICITACAO: TStringField;
    qry_fatura_DT_TARIFARIO: TDateTimeField;
    qry_fatura_VL_RECEBIDO: TFloatField;
    qry_fatura_VL_SOLICITADO: TFloatField;
    qry_fatura_VL_ADICIONAL: TFloatField;
    qry_fatura_CD_BANCO: TStringField;
    qry_fatura_NM_BANCO: TStringField;
    qry_fatura_NM_UNID_NEG: TStringField;
    qry_fatura_END_UNID_NEG: TStringField;
    qry_fatura_BAIRRO_UNID: TStringField;
    qry_fatura_CEP_UNID: TStringField;
    qry_fatura_CIDADE_UNID: TStringField;
    qry_fatura_UF_UNID: TStringField;
    qry_fatura_PAIS_UNID: TStringField;
    qry_fatura_FONE_UNID: TStringField;
    qry_fatura_FAX_UNID: TStringField;
    qry_fatura_CGC_UNID_NEG: TStringField;
    qry_fatura_NM_CLIENTE: TStringField;
    qry_fatura_END_CLIENTE: TStringField;
    qry_fatura_NUMERO_CLIENTE: TStringField;
    qry_fatura_COMPL_CLIENTE: TStringField;
    qry_fatura_CEP_CLIENTE: TStringField;
    qry_fatura_CIDADE_CLIENTE: TStringField;
    qry_fatura_UF_CLIENTE: TStringField;
    qry_fatura_CGC_CLIENTE: TStringField;
    qry_fatura_CD_ITEM: TStringField;
    qry_fatura_NM_ITEM: TStringField;
    qry_fatura_VL_ITEM_SOLIC: TFloatField;
    qry_fatura_VL_ITEM_RECEB: TFloatField;
    qry_fatura_VENDA_ITEM: TFloatField;
    qry_fatura_VL_TARIFARIO: TFloatField;
    qry_fatura_VL_ADICIONAL_ITEM: TFloatField;
    qry_fatura_AP_MOEDA_ITEM: TStringField;
    pp_fatura: TppBDEPipeline;
    qry_recebimento_NR_FATURA: TStringField;
    qry_fatura_NR_FATURA: TStringField;
    qry_fatura_CD_EMP_EST: TStringField;
    qry_fatura_NM_EMP_EST: TStringField;
    qry_fatura_QTD_VOLUME: TFloatField;
    qry_fatura_CHARGEABLE: TFloatField;
    qry_fatura_VL_PESO_BRUTO: TFloatField;
    qry_fatura_DT_EMBARQUE: TDateTimeField;
    qry_fatura_DT_CHEGADA: TDateTimeField;
    qry_fatura_DESCR_MERCADORIA: TStringField;
    qry_fatura_REF_CLIENTE: TStringField;
    qry_fatura_CD_ORIGEM: TStringField;
    qry_fatura_CD_DESTINO: TStringField;
    qry_fatura_NM_ORIGEM: TStringField;
    qry_fatura_NM_DESTINO: TStringField;
    qry_notificacao_pend_CD_VIA_TRANSPORTE: TStringField;
    qry_notificacao_pend_TP_PRODUTO: TStringField;
    pp_recibo: TppBDEPipeline;
    qry_fatura_VL_RECEBIMENTO: TFloatField;
    qry_fatura_calc_vl_receb_extenso: TStringField;
    qry_fatura_NR_PROCESSO_1: TStringField;
    qry_fatura_calc_nm_usuario: TStringField;
    qry_fatura_NR_RECIBO: TStringField;
    qry_recebimento_NR_RECIBO: TStringField;
    qry_fatura_calc_vl_recebido: TFloatField;
    sp_emissao_fatura_ag: TStoredProc;
    qry_fatura_calc_vl_moeda: TFloatField;
    qry_fatura_calc_vl_item_venda: TFloatField;
    qry_fatura_CD_MOEDA_VENDA: TStringField;
    qry_fatura_CD_AGENCIA: TStringField;
    qry_fatura_CONTA_BANCO: TStringField;
    qry_fatura_NR_HOUSE: TStringField;
    sp_contabiliza_numerario: TStoredProc;
    sp_contabiliza_emissao_fat: TStoredProc;
    sp_contabiliza_emissao_recebido: TStoredProc;
    qry_recebimento_IN_EMITIDO_FAT: TStringField;
    qry_recebimento_DT_FATURA: TDateTimeField;
    qry_fatura_CD_MASTER: TStringField;
    qry_fatura_NR_PROCESSO_VINC: TStringField;
    qry_fatura_calc_nr_proc_vinc: TStringField;
    qry_list_receb_calc_processo: TStringField;
    qry_pesq_notificacao_calc_processo: TStringField;
    qry_pesq_notificacao_STATUS: TStringField;
    qry_list_receb_STATUS: TStringField;
    qry_recebimento_processo_STATUS: TStringField;
    qry_devolucao_: TQuery;
    qry_devolucao_NR_PROCESSO: TStringField;
    qry_devolucao_NR_DEVOLUCAO: TStringField;
    qry_devolucao_DT_DEVOLUCAO: TDateTimeField;
    qry_devolucao_CD_USUARIO: TStringField;
    qry_devolucao_VL_DEVOLUCAO: TFloatField;
    qry_devolucao_IN_CANCELADO: TStringField;
    qry_devolucao_DT_CANCELAMENTO: TDateTimeField;
    qry_devolucao_CD_USUARIO_CANC: TStringField;
    qry_devolucao_IN_TRANSFERIDO: TStringField;
    qry_devolucao_NR_SOLIC_CH: TStringField;
    ds_devolucao_: TDataSource;
    qry_devolucao_Calc_Transferido: TStringField;
    sp_atz_fat_cc_ag: TStoredProc;
    qry_recebimento_processo_NR_RECEBIMENTO: TStringField;
    qry_list_receb_NR_RECEBIMENTO: TStringField;
    qry_moeda_tarifario_NR_RECEBIMENTO: TStringField;
    qry_receb_proc_item_NR_RECEBIMENTO: TStringField;
    sp_distribui_recebimento: TStoredProc;
    qry_recebimento_NR_RECEBIMENTO: TStringField;
    procedure qry_notificacao_pend_AfterPost(DataSet: TDataSet);
    procedure qry_recebimento_AfterPost(DataSet: TDataSet);
    procedure qry_moeda_tarifario_AfterDelete(DataSet: TDataSet);
    procedure qry_moeda_tarifario_AfterPost(DataSet: TDataSet);
    procedure qry_moeda_tarifario_NewRecord(DataSet: TDataSet);
    procedure qry_moeda_tarifario_BeforePost(DataSet: TDataSet);
    procedure qry_moeda_tarifario_CD_MOEDAChange(Sender: TField);
    procedure qry_recebimento_IN_CAMBIOChange(Sender: TField);
    procedure qry_recebimento_processo_CalcFields(DataSet: TDataSet);
    procedure qry_recebimento_processo_AfterPost(DataSet: TDataSet);
    procedure qry_recebimento_processo_NewRecord(DataSet: TDataSet);
    procedure qry_recebimento_processo_BeforeDelete(DataSet: TDataSet);
    procedure qry_recebimento_processo_DT_TARIFARIOChange(Sender: TField);
    procedure qry_receb_proc_item_AfterPost(DataSet: TDataSet);
    procedure qry_receb_proc_item_NewRecord(DataSet: TDataSet);
    procedure qry_receb_proc_item_BeforeDelete(DataSet: TDataSet);
    procedure qry_receb_proc_item_VL_RECEBIDOChange(Sender: TField);
    procedure qry_recebimento_processo_VL_RECEBIDOChange(Sender: TField);
    procedure qry_recebimento_VL_RECEBIMENTOChange(Sender: TField);
    procedure qry_recebimento_processo_VL_ADICIONALChange(Sender: TField);
    procedure qry_list_receb_AfterScroll(DataSet: TDataSet);
    procedure qry_recebimento_AfterScroll(DataSet: TDataSet);
    procedure qry_receb_proc_item_VL_ADICIONAL_ITEMChange(Sender: TField);
    procedure qry_receb_proc_item_VL_UTILIZADOChange(Sender: TField);
    procedure qry_recebimento_processo_VL_UTILIZADOChange(Sender: TField);
    procedure qry_fatura_CalcFields(DataSet: TDataSet);
    procedure qry_list_receb_CalcFields(DataSet: TDataSet);
    procedure qry_pesq_notificacao_CalcFields(DataSet: TDataSet);
    procedure qry_pesq_notificacao_AfterScroll(DataSet: TDataSet);
    procedure qry_devolucao_CalcFields(DataSet: TDataSet);
    procedure qry_devolucao_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure exec_sp_conta_receb_desemb(unid_neg, nr_receb, cd_cliente:String; dt_receb :Tdatetime; Operacao :String );
    procedure exec_sp_conta_emis_fat(unid_neg,nr_receb, cd_cliente, nr_fatura: String; dt_receb: Tdatetime; Operacao: String);
    procedure exec_sp_conta_emis_recibo(unid_neg, nr_receb, cd_cliente, nr_recibo, cd_banco:String; dt_receb :Tdatetime; Operacao :String );
    procedure atz_cpmf;
  end;

var
  datm_recebimento_ag: Tdatm_recebimento_ag;
  str_cd_ultimo : string;

implementation

uses  GSMLIB, PGGP001, PGSM292, ConsOnlineEx;

{$R *.DFM}

procedure Tdatm_recebimento_ag.qry_notificacao_pend_AfterPost(DataSet: TDataSet);
begin
  qry_notificacao_pend_.ApplyUpdates;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_AfterPost(DataSet: TDataSet);
begin
  qry_recebimento_.ApplyUpdates;
end;

procedure Tdatm_recebimento_ag.qry_moeda_tarifario_AfterDelete(DataSet: TDataSet);
begin
  qry_moeda_tarifario_.ApplyUpdates;
end;

procedure Tdatm_recebimento_ag.qry_moeda_tarifario_AfterPost(DataSet: TDataSet);
begin
  qry_moeda_tarifario_.ApplyUpdates;
end;

procedure Tdatm_recebimento_ag.qry_moeda_tarifario_NewRecord(DataSet: TDataSet);
begin
  qry_moeda_tarifario_NR_RECEBIMENTO.AsString:= qry_recebimento_NR_RECEBIMENTO.AsString;
  qry_moeda_tarifario_CD_CLIENTE.AsString    := qry_recebimento_CD_CLIENTE.AsString;
  qry_moeda_tarifario_CD_UNID_NEG.AsString  := qry_recebimento_CD_UNID_NEG.AsString;
end;

procedure Tdatm_recebimento_ag.qry_moeda_tarifario_BeforePost(DataSet: TDataSet);
begin
  if qry_moeda_tarifario_.State in [dsinsert] then
  begin
    if qry_moeda_tarifario_CD_MOEDA.AsString = '' then
    begin
      Boxmensagem('Deve ser informado o Código da Moeda. Openração Cancelada!',2);
      qry_moeda_tarifario_.Cancel;
      Exit;
    end;
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Add('SELECT COUNT(CD_MOEDA) FROM TRECEBIMENTO_TARIFARIO (NOLOCK)');
      Sql.Add(' WHERE  NR_RECEBIMENTO = "'+qry_recebimento_NR_RECEBIMENTO.AsString+'"');
      Sql.Add('  AND CD_CLIENTE = "'+qry_recebimento_CD_CLIENTE.AsString+'"');
      Sql.Add('  AND CD_UNID_NEG = "'+qry_recebimento_CD_UNID_NEG.AsString+'"');
      Sql.Add('  AND CD_MOEDA = "'+qry_moeda_tarifario_CD_MOEDA.AsString+'"');
      open;
      if Fields[0].AsInteger > 0  then
      begin
        Boxmensagem('Esta Moeda já existe. Openração Cancelada!',2);
        qry_moeda_tarifario_.Cancel;
        Exit;
      end;
      Free;
    end;
  end;
end;

procedure Tdatm_recebimento_ag.qry_moeda_tarifario_CD_MOEDAChange(Sender: TField);
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Add(' SELECT VL_TAXA FROM TTAXA_FRETE (NOLOCK) WHERE CD_MOEDA = "'+qry_moeda_tarifario_CD_MOEDA.AsString+'" AND ');
    Sql.Add(' DT_INICIO = CONVERT(DATETIME, "'+datetimetostr(dt_server)+'",103)');
    Open;
    qry_moeda_tarifario_VL_TARIFARIO.Asfloat:=Fields[0].AsFloat;
    Free;
  end;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_IN_CAMBIOChange(Sender: TField);
var
  BookMark : TBookMark;
begin
  if qry_recebimento_IN_CAMBIO.AsString = '1' then
  begin
    while not(qry_moeda_tarifario_.Eof) do
      qry_moeda_tarifario_.Delete;
//    frm_recebimento_ag.dbgrid_tarifario.REadOnly  :=true;
      // 16/10/2006
//    frm_recebimento_ag.dbgrid_tarifario.Visible := False;
    frm_recebimento_ag.btn_aplic_tarifario.Enabled:=FALSE;
    frm_recebimento_ag.mi_atz_tarifa.Enabled:=FALSE;
    BookMark:=qry_recebimento_processo_.GetBookmark;
    qry_recebimento_processo_.DisableControls;
    qry_recebimento_processo_.First;
    while not(qry_recebimento_processo_.Eof) do
    begin
      if not(qry_recebimento_processo_.State in[dsEdit]) then
        qry_recebimento_processo_.Edit;
      qry_recebimento_processo_DT_TARIFARIOChange(nil);
      qry_recebimento_processo_.Next;
    end;
    qry_recebimento_processo_.GotoBookmark(BookMark);
    qry_recebimento_processo_.FreeBookmark(BookMark);
    qry_recebimento_processo_.EnableControls;
  end else begin
//    frm_recebimento_ag.dbgrid_tarifario.REadOnly  :=false;
    // 16/10/2006
    // frm_recebimento_ag.dbgrid_tarifario.Visible := True;
    frm_recebimento_ag.btn_aplic_tarifario.Enabled:=true;
    frm_recebimento_ag.mi_atz_tarifa.Enabled:=true;
  end;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_CalcFields(DataSet: TDataSet);
begin
  qry_recebimento_processo_calc_processo.AsString:=copy(qry_recebimento_processo_NR_PROCESSO.AsString,5,10);
  qry_recebimento_processo_calc_tt_processo.AsFloat:= qry_recebimento_processo_VL_ADICIONAL.AsFloat +
                                                      qry_recebimento_processo_VL_RECEBIDO.AsFloat;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_AfterPost(DataSet: TDataSet);
begin
  qry_recebimento_processo_.ApplyUpdates;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_NewRecord(DataSet: TDataSet);
begin
  qry_recebimento_processo_.CAncel;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_BeforeDelete(DataSet: TDataSet);
begin
  qry_recebimento_processo_.Cancel;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_DT_TARIFARIOChange(Sender: TField);
var
  TAxa : String[250];
begin
  if qry_recebimento_IN_CAMBIO.AsString = '0' then exit;
  if frm_recebimento_ag.pgctrl_recebimento_ag.ActivePage = frm_recebimento_ag.ts_rec_ag then
  begin
    with TQuery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add(' SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO, PR.TP_PRODUTO,  S.CD_VIA_TRANSPORTE ');
      Sql.Add(' FROM TPROCESSO P (NOLOCK), TPRODUTO PR (NOLOCK), TSERVICO S (NOLOCK)');
      Sql.Add(' WHERE NR_PROCESSO = "'+qry_recebimento_processo_NR_PROCESSO.AsString+'"');
      Sql.Add(' AND P.CD_PRODUTO =  PR.CD_PRODUTO AND P.CD_SERVICO = S.CD_SERVICO ');
      Open;
      if (Fields[3].AsString = '02') and (Fields[4].AsString = '04') then
        Taxa := 'VL_VENDA * (SELECT TM.VL_TAXA FROM TTAXA_IATA TM (NOLOCK) WHERE '
      else Taxa := 'VL_VENDA * (SELECT TM.VL_TAXA_UTIL FROM TTAXA_FRETE TM  (NOLOCK) WHERE ';
      Sql.Clear;
      Sql.Add('UPDATE TRECEBIMENTO_PROCESSO_ITEM SET VL_RECEBIDO = ');
      Sql.Add( Taxa );
      Sql.Add(' TM.CD_MOEDA = CD_MOEDA_VENDA AND ');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+qry_recebimento_processo_DT_TARIFARIO.AsString+'",103))');
      Sql.Add(' WHERE NR_RECEBIMENTO="'+qry_recebimento_processo_NR_RECEBIMENTO.AsString+'" AND  ');
      Sql.Add(' CD_UNID_NEG="'+qry_recebimento_processo_CD_UNID_NEG.AsString+'" ');
      Sql.Add(' AND CD_CLIENTE = "'+qry_recebimento_processo_CD_CLIENTE.AsString+'" ');
      Sql.Add(' AND NR_LANC_RECEB = "'+qry_recebimento_processo_NR_LANC_RECEB.AsString+'" ');
      Sql.Add(' AND CD_MOEDA_VENDA <> "790" AND ISNULL(CD_MOEDA_VENDA,"") <> ""');
      ExecSql;
      atz_cpmf;
      Sql.Clear;
      Sql.Add('SELECT SUM(VL_RECEBIDO) FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ');
      Sql.Add(' WHERE NR_RECEBIMENTO="'+qry_recebimento_processo_NR_RECEBIMENTO.AsString+'" AND  ');
      Sql.Add(' CD_UNID_NEG="'+qry_recebimento_processo_CD_UNID_NEG.AsString+'" ');
      Sql.Add(' AND CD_CLIENTE = "'+qry_recebimento_processo_CD_CLIENTE.AsString+'" ');
      Sql.Add(' AND NR_LANC_RECEB = "'+qry_recebimento_processo_NR_LANC_RECEB.AsString+'" ');
      Open;
      qry_recebimento_processo_VL_RECEBIDO.AsFloat:=Fields[0].AsFloat;
      Free;
    end;
  end else begin
    with TQuery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('UPDATE TRECEBIMENTO_PROCESSO_ITEM SET VL_UTILIZADO = ');
      Sql.Add(' VL_VENDA * (SELECT TM.VL_TAXA_UTIL FROM TTAXA_FRETE TM (NOLOCK) WHERE ');
      Sql.Add(' TM.CD_MOEDA = CD_MOEDA_VENDA AND ');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+qry_recebimento_processo_DT_TARIFARIO.AsString+'",103))');
      Sql.Add(' WHERE NR_RECEBIMENTO="'+qry_recebimento_processo_NR_RECEBIMENTO.AsString+'" AND  ');
      Sql.Add(' CD_UNID_NEG="'+qry_recebimento_processo_CD_UNID_NEG.AsString+'" ');
      Sql.Add(' AND CD_CLIENTE = "'+qry_recebimento_processo_CD_CLIENTE.AsString+'" ');
      Sql.Add(' AND NR_LANC_RECEB = "'+qry_recebimento_processo_NR_LANC_RECEB.AsString+'" ');
      Sql.Add(' AND CD_MOEDA_VENDA <> "790" AND ISNULL(CD_MOEDA_VENDA,"") <> ""');
      ExecSql;
      Sql.Clear;
      Sql.Add('SELECT SUM(VL_UTILIZADO) FROM TRECEBIMENTO_PROCESSO_ITEM (NOLOCK) ');
      Sql.Add(' WHERE NR_RECEBIMENTO="'+qry_recebimento_processo_NR_RECEBIMENTO.AsString+'" AND  ');
      Sql.Add(' CD_UNID_NEG="'+qry_recebimento_processo_CD_UNID_NEG.AsString+'" ');
      Sql.Add(' AND CD_CLIENTE = "'+qry_recebimento_processo_CD_CLIENTE.AsString+'" ');
      Sql.Add(' AND NR_LANC_RECEB = "'+qry_recebimento_processo_NR_LANC_RECEB.AsString+'" ');
      Open;
      qry_recebimento_processo_VL_UTILIZADO.AsFloat:=Fields[0].AsFloat;
      Free;
    end;
  end;
end;

procedure Tdatm_recebimento_ag.qry_receb_proc_item_AfterPost(DataSet: TDataSet);
begin
  qry_receb_proc_item_.ApplyUpdates;
end;

procedure Tdatm_recebimento_ag.qry_receb_proc_item_NewRecord(DataSet: TDataSet);
begin
  qry_receb_proc_item_.cancel;
end;

procedure Tdatm_recebimento_ag.qry_receb_proc_item_BeforeDelete(DataSet: TDataSet);
begin
  qry_receb_proc_item_.cancel;
end;

procedure Tdatm_recebimento_ag.qry_receb_proc_item_VL_RECEBIDOChange(Sender: TField);
var
  BookMark :TBookMark;
  aux      :Real;
begin
  aux := 0;
  BookMark := qry_receb_proc_item_.GetBookmark;
  qry_receb_proc_item_.DisableControls;
  qry_receb_proc_item_.First;
  while not (qry_receb_proc_item_.EOF) do
  begin
    aux:= aux + qry_receb_proc_item_VL_RECEBIDO.AsFloat;
    qry_receb_proc_item_.Next;
  end;
  qry_receb_proc_item_.GotoBookmark(BookMark);
  qry_receb_proc_item_.FreeBookmark(BookMark);
  qry_receb_proc_item_.EnableControls;
  if not (qry_recebimento_processo_.State in [dsEdit]) then
    qry_recebimento_processo_.Edit;
  qry_recebimento_processo_VL_RECEBIDO.AsFloat:= aux;
  if qry_recebimento_processo_.State in [dsEdit] then
    qry_recebimento_processo_.Post;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_VL_RECEBIDOChange(Sender: TField);
var
  BookMark:TBookMark;
  aux:real;
begin
  aux:=0;
  BookMark:=qry_recebimento_processo_.GetBookmark;
  qry_recebimento_processo_.DisableControls;
  qry_recebimento_processo_.First;
  while not (qry_recebimento_processo_.EOF) do
  begin
    aux:= aux + qry_recebimento_processo_VL_RECEBIDO.AsFloat;
    qry_recebimento_processo_.Next;
  end;
  qry_recebimento_processo_.GotoBookmark(BookMark);
  qry_recebimento_processo_.FreeBookmark(BookMark);
  qry_recebimento_processo_.EnableControls;
  if not (qry_recebimento_.State in [dsEdit]) then
  begin
    qry_recebimento_.Edit;
    qry_recebimento_VL_TOT_RECEBIDO.AsFloat:= aux;
    qry_recebimento_.post;
  end else
    qry_recebimento_VL_TOT_RECEBIDO.AsFloat:= aux;
  if  qry_recebimento_VL_RECEBIMENTO.AsFloat > qry_recebimento_VL_TOT_RECEBIDO.AsFloat then
    frm_recebimento_ag.lb_restante.Caption:=formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat -
                                                       (qry_recebimento_VL_TT_ADICIONAL.AsFloat + aux));
end;

procedure Tdatm_recebimento_ag.qry_recebimento_VL_RECEBIMENTOChange(Sender: TField);
begin
  if  (qry_recebimento_VL_RECEBIMENTO.AsFloat > qry_recebimento_VL_TOT_RECEBIDO.AsFloat) or
      (qry_recebimento_VL_RECEBIMENTO.AsFloat > qry_recebimento_VL_TOT_UTILIZADO.AsFloat) then
  begin
    frm_recebimento_ag.dbradgrp_in_maior.Visible:=true;
    frm_recebimento_ag.lb_restante.Caption:=formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat -
                                                       (qry_recebimento_VL_TOT_RECEBIDO.AsFloat + qry_recebimento_VL_TT_ADICIONAL.AsFloat));
  end else
    frm_recebimento_ag.dbradgrp_in_maior.Visible:=false;
  if (qry_recebimento_VL_RECEBIMENTO.AsFloat > qry_recebimento_VL_TOT_UTILIZADO.AsFloat) then
  begin
    frm_recebimento_ag.dbradgrp_in_maior2.Visible:=true;
    frm_recebimento_ag.lb_restante2.Caption:=formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat -
                                                        (qry_recebimento_VL_TOT_UTILIZADO.AsFloat + qry_recebimento_VL_TT_ADICIONAL.AsFloat));

    frm_recebimento_ag.dbgrid_item_des.Columns.Items[5].ReadOnly:=false;
  end else begin
    frm_recebimento_ag.dbradgrp_in_maior2.Visible:=false;
    frm_recebimento_ag.dbgrid_item_des.Columns.Items[5].ReadOnly:=true;
  end;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_VL_ADICIONALChange(Sender: TField);
var
  BookMark:TBookMark;
  aux:real;
begin
  aux:=0;
  BookMark:=qry_recebimento_processo_.GetBookmark;
  qry_recebimento_processo_.DisableControls;
  qry_recebimento_processo_.First;
  while not (qry_recebimento_processo_.EOF) do
  begin
    aux:= aux + qry_recebimento_processo_VL_ADICIONAL.AsFloat;
    qry_recebimento_processo_.Next;
  end;
  qry_recebimento_processo_.GotoBookmark(BookMark);
  qry_recebimento_processo_.FreeBookmark(BookMark);
  qry_recebimento_processo_.EnableControls;
  if not (qry_recebimento_.State in [dsEdit]) then
  begin
    qry_recebimento_.Edit;
    qry_recebimento_VL_TT_ADICIONAL.AsFloat:= aux;
    qry_recebimento_.Post;
  end else
    qry_recebimento_VL_TT_ADICIONAL.AsFloat:= aux;
  frm_recebimento_ag.lb_restante.Caption:=formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat -
                                                     (qry_recebimento_VL_TOT_RECEBIDO.AsFloat + aux));
  if qry_recebimento_VL_RECEBIMENTO.AsFloat > qry_recebimento_VL_TOT_UTILIZADO.AsFloat then
    frm_recebimento_ag.lb_restante2.Caption:=formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat -
                                                        (qry_recebimento_VL_TOT_UTILIZADO.AsFloat + aux));
end;

procedure Tdatm_recebimento_ag.qry_list_receb_AfterScroll(DataSet: TDataSet);
begin
  if ConsultaLookupSQL(' SELECT SE.TP_SERVICO FROM TSERVICO SE ( NOLOCK ), TPROCESSO PR ( NOLOCK ) ' +
                       ' WHERE SE.CD_SERVICO = PR.CD_SERVICO  ' +
                       ' AND PR.NR_PROCESSO = ''' + qry_list_receb_NR_PROCESSO.AsString + '''', 'TP_SERVICO') = '1' then
  begin
    // agenciamento
    if frm_recebimento_ag.pgctrl_recebimento_ag.ActivePage = frm_recebimento_ag.ts_lista then
      frm_recebimento_ag.ts_rec_ag.TabVisible := (qry_list_receb_IN_ABERTO.AsString = 'A') or (qry_list_receb_IN_ABERTO.AsString = 'B') or (qry_list_receb_IN_ABERTO.AsString = 'P');
  end else begin
    // desembaraço
    if frm_recebimento_ag.pgctrl_recebimento_ag.ActivePage = frm_recebimento_ag.ts_lista then
      frm_recebimento_ag.ts_rec_desemb.TabVisible := (qry_list_receb_IN_ABERTO.AsString = 'A') or (qry_list_receb_IN_ABERTO.AsString = 'B') or (qry_list_receb_IN_ABERTO.AsString = 'P');
    frm_recebimento_ag.btn_devolucao.Visible := (qry_list_receb_IN_ABERTO.AsString = 'B');
  end;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_AfterScroll(DataSet: TDataSet);
begin
  if (qry_recebimento_IN_ABERTO.AsString = 'B') or (qry_recebimento_IN_ABERTO.AsString = 'C') then
  begin
    ds_recebimento.AutoEdit      := false;
    ds_recb_processo.AutoEdit    := false;
    ds_moeda_tarifario.AutoEdit  := false;
    DDS_RECB_PROC_ITEM.AutoEdit  := false;
  end else begin
    ds_recebimento.AutoEdit      := frm_recebimento_ag.st_modificar;
    ds_recb_processo.AutoEdit    := (frm_recebimento_ag.st_modificar); // and ( qry_recebimento_IN_EMITIDO_FAT.AsString <> '1');;
    ds_moeda_tarifario.AutoEdit  := (frm_recebimento_ag.st_modificar); // and ( qry_recebimento_IN_EMITIDO_FAT.AsString <> '1');;
    DDS_RECB_PROC_ITEM.AutoEdit  := (frm_recebimento_ag.st_modificar); // and ( qry_recebimento_IN_EMITIDO_FAT.AsString <> '1');;
    if  qry_recebimento_VL_RECEBIMENTO.AsFloat > qry_recebimento_VL_TOT_UTILIZADO.AsFloat then
      frm_recebimento_ag.dbgrid_item_des.Columns.Items[5].ReadOnly:= false
    else frm_recebimento_ag.dbgrid_item_des.Columns.Items[5].ReadOnly:= true;
  end
end;

procedure Tdatm_recebimento_ag.qry_receb_proc_item_VL_ADICIONAL_ITEMChange(Sender: TField);
var
  BookMark:TBookMark;
  aux:real;
begin
  aux:=0;
  BookMark:=qry_receb_proc_item_.GetBookmark;
  qry_receb_proc_item_.DisableControls;
  qry_receb_proc_item_.First;
  while not (qry_receb_proc_item_.EOF) do
  begin
    aux:= aux + qry_receb_proc_item_VL_ADICIONAL_ITEM.AsFloat;
    qry_receb_proc_item_.Next;
  end;
  qry_receb_proc_item_.GotoBookmark(BookMark);
  qry_receb_proc_item_.FreeBookmark(BookMark);
  qry_receb_proc_item_.EnableControls;
  if not (qry_recebimento_processo_.State in [dsEdit]) then
  begin
    qry_recebimento_processo_.Edit;
    qry_recebimento_processo_VL_ADICIONAL.AsFloat:= aux;
  end else
    qry_recebimento_processo_VL_ADICIONAL.AsFloat:= aux;
end;

procedure Tdatm_recebimento_ag.qry_receb_proc_item_VL_UTILIZADOChange(Sender: TField);
var
  BookMark:TBookMark;
  aux:real;
begin
  aux:=0;
  BookMark:=qry_receb_proc_item_.GetBookmark;
  qry_receb_proc_item_.DisableControls;
  qry_receb_proc_item_.First;
  while not (qry_receb_proc_item_.EOF) do
  begin
    aux:= aux + qry_receb_proc_item_VL_UTILIZADO.AsFloat;
    qry_receb_proc_item_.Next;
  end;
  qry_receb_proc_item_.GotoBookmark(BookMark);
  qry_receb_proc_item_.FreeBookmark(BookMark);
  qry_receb_proc_item_.EnableControls;
  if not (qry_recebimento_processo_.State in [dsEdit]) then
    qry_recebimento_processo_.Edit;
  qry_recebimento_processo_VL_UTILIZADO.AsFloat:= aux;
  if qry_recebimento_processo_.State in [dsEdit] then
    qry_recebimento_processo_.Post;
end;

procedure Tdatm_recebimento_ag.qry_recebimento_processo_VL_UTILIZADOChange(Sender: TField);
var
  BookMark:TBookMark;
  aux:real;
begin
  aux:=0;
  BookMark:=qry_recebimento_processo_.GetBookmark;
  qry_recebimento_processo_.DisableControls;
  qry_recebimento_processo_.First;
  while not (qry_recebimento_processo_.EOF) do
  begin
    aux:= aux + qry_recebimento_processo_VL_UTILIZADO.AsFloat;
    qry_recebimento_processo_.Next;
  end;
  qry_recebimento_processo_.GotoBookmark(BookMark);
  qry_recebimento_processo_.FreeBookmark(BookMark);
  qry_recebimento_processo_.EnableControls;
  if not (qry_recebimento_.State in [dsEdit]) then
  begin
    qry_recebimento_.Edit;
    qry_recebimento_VL_TOT_UTILIZADO.AsFloat:= aux;
    qry_recebimento_.post;
  end else
    qry_recebimento_VL_TOT_UTILIZADO.AsFloat:= aux;
  if qry_recebimento_VL_TOT_UTILIZADO.AsFloat < qry_recebimento_VL_RECEBIMENTO.AsFloat then
    frm_recebimento_ag.lb_restante2.Caption:=formatfloat('0.00',qry_recebimento_VL_RECEBIMENTO.AsFloat -
                                                        (qry_recebimento_VL_TT_ADICIONAL.AsFloat + aux));
end;

procedure Tdatm_recebimento_ag.qry_fatura_CalcFields(DataSet: TDataSet);
begin
  qry_fatura_calc_vl_receb_extenso.AsString := Extenso(qry_fatura_VL_RECEBIMENTO.AsFloat);
  qry_fatura_calc_vl_recebido.AsFloat := qry_fatura_VL_ITEM_RECEB.AsFloat + qry_fatura_VL_ADICIONAL_ITEM.AsFloat;
  qry_fatura_calc_nm_usuario.AsString := str_nm_usuario;
  if (qry_recebimento_TP_RECEBIMENTO.AsString = '1') or (qry_recebimento_TP_RECEBIMENTO.AsString = '2') then
    qry_fatura_calc_vl_moeda.AsFloat    := qry_fatura_VL_ITEM_RECEB.AsFloat / qry_fatura_VENDA_ITEM.Asfloat
  else qry_fatura_calc_vl_moeda.AsFloat    := qry_fatura_VL_ITEM_RECEB.AsFloat;
  if qry_fatura_NR_PROCESSO_VINC.AsString <> '' then
    qry_fatura_calc_nr_proc_vinc.AsString := 'Proc Vinculado: '+ qry_fatura_NR_PROCESSO_VINC.AsString;
  if (qry_fatura_CD_MOEDA_VENDA.AsString = '790') or (qry_fatura_CD_MOEDA_VENDA.AsString = '') then
    qry_fatura_calc_vl_item_venda.Asfloat :=  qry_fatura_VL_ITEM_RECEB.AsFloat + qry_fatura_VL_ADICIONAL_ITEM.AsFloat
  else qry_fatura_calc_vl_item_venda.Asfloat := qry_fatura_VENDA_ITEM.AsFloat;
end;

procedure Tdatm_recebimento_ag.exec_sp_conta_receb_desemb(unid_neg, nr_receb, cd_cliente:string; dt_receb :Tdatetime; Operacao :String );
var
  IniFile: Tinifile;
  path, vConnectionString: String;
begin
  CloseStoredProc(sp_contabiliza_numerario);
  sp_contabiliza_numerario.ParamByName('@cd_unid_neg').AsString    := unid_neg;
  sp_contabiliza_numerario.ParamByName('@nr_recebimento').AsString := nr_receb;
  sp_contabiliza_numerario.ParamByName('@cd_cliente').AsString     := cd_cliente;
  sp_contabiliza_numerario.ParamByName('@dt_receb').AsDatetime     := dt_receb;
  sp_contabiliza_numerario.ParamByName('@in_operacao').AsString    := Operacao;
  ExecStoredProc( sp_contabiliza_numerario );
  CloseStoredProc( sp_contabiliza_numerario )
end;

procedure Tdatm_recebimento_ag.exec_sp_conta_emis_fat(unid_neg,nr_receb, cd_cliente, nr_fatura: string; dt_receb: Tdatetime; Operacao: String);
var
  IniFile: Tinifile;
  path, vConnectionString: String;
begin
  CloseStoredProc(sp_contabiliza_emissao_fat);
  sp_contabiliza_emissao_fat.ParamByName('@cd_unid_neg').AsString    := unid_neg;
  sp_contabiliza_emissao_fat.ParamByName('@nr_recebimento').AsString := nr_receb;
  sp_contabiliza_emissao_fat.ParamByName('@cd_cliente').AsString     := cd_cliente;
  sp_contabiliza_emissao_fat.ParamByName('@dt_receb').AsDatetime     := dt_receb;
  sp_contabiliza_emissao_fat.ParamByName('@nr_fatura').AsString      := nr_fatura;
  sp_contabiliza_emissao_fat.ParamByName('@in_operacao').AsString    := Operacao;
  ExecStoredProc( sp_contabiliza_emissao_fat );
  CloseStoredProc( sp_contabiliza_emissao_fat )
end;

procedure Tdatm_recebimento_ag.exec_sp_conta_emis_recibo(unid_neg, nr_receb, cd_cliente, nr_recibo, cd_banco:string; dt_receb :Tdatetime; Operacao :String );
var
  IniFile: Tinifile;
  path, vConnectionString: String;
begin
  CloseStoredProc(sp_contabiliza_emissao_recebido);
  sp_contabiliza_emissao_recebido.ParamByName('@cd_unid_neg').AsString    := unid_neg;
  sp_contabiliza_emissao_recebido.ParamByName('@nr_recebimento').AsString := nr_receb;
  sp_contabiliza_emissao_recebido.ParamByName('@cd_cliente').AsString     := cd_cliente;
  sp_contabiliza_emissao_recebido.ParamByName('@dt_receb').AsDatetime     := dt_receb;
  sp_contabiliza_emissao_recebido.ParamByName('@nr_recibo').AsString      := nr_recibo;
  sp_contabiliza_emissao_recebido.ParamByName('@cd_banco').AsString       := cd_banco;
  ExecStoredProc( sp_contabiliza_emissao_recebido );
  CloseStoredProc( sp_contabiliza_emissao_recebido )
end;

procedure Tdatm_recebimento_ag.atz_cpmf;
var
  CPMF:TQuery;
  cd_cpmf:String[3];
  vl_cpmf :real;
  nr_processo: String[18];
begin
  vl_cpmf :=0 ;
  CPMF:= TQuery.Create(Application);
  CPMF.DataBaseName := 'DBBROKER';
  CPMF.Sql.Add('SELECT CD_ITEM_CPMF FROM TPARAMETROS (NOLOCK)');
  CPMF.open;
  cd_cpmf := CPMF.Fields[0].AsString;
  CPMF.Sql.Clear;
  CPMF.Sql.Add('SELECT R.NR_PROCESSO, R.NR_LANC_RECEB, R.CD_ITEM, R.VL_RECEBIDO ');
  CPMF.Sql.Add(' FROM TRECEBIMENTO_PROCESSO_ITEM R (NOLOCK), TITEM I (NOLOCK)');
  CPMF.Sql.Add(' WHERE R.NR_RECEBIMENTO = "'+qry_recebimento_NR_RECEBIMENTO.AsString+'"');
  CPMF.Sql.Add(' AND R.CD_CLIENTE = "'+qry_recebimento_CD_CLIENTE.AsString+'"');
  CPMF.Sql.Add(' AND R.CD_UNID_NEG = "'+qry_recebimento_CD_UNID_NEG.AsString+'"');
  CPMF.Sql.Add(' AND R.CD_ITEM = I.CD_ITEM AND I.IN_CPMF = "1" ');
  CPMF.Open;
  WHILE not(CPMF.Eof) do
  begin
    vl_cpmf := vl_cpmf + (CPMF.Fields[3].AsFloat * 0.38)/100;
    vl_cpmf := strtofloat(FormatFloat('0.00', vl_cpmf));
    nr_processo := CPMF.Fields[0].AsString;
    CPMF.Next;
    if (nr_processo <> CPMF.Fields[0].AsString) or (CPMF.Eof) then
    begin
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        Sql.Add(' UPDATE TRECEBIMENTO_PROCESSO_ITEM ');
        Sql.Add(' SET VL_RECEBIDO = :VL_RECEBIDO, VL_VENDA = :VL_VENDA ');
        Sql.Add(' WHERE NR_RECEBIMENTO = "'+qry_recebimento_NR_RECEBIMENTO.AsString+'"');
        Sql.Add(' AND CD_CLIENTE = "'+qry_recebimento_CD_CLIENTE.AsString+'"');
        Sql.Add(' AND CD_UNID_NEG = "'+qry_recebimento_CD_UNID_NEG.AsString+'"');
        Sql.Add(' AND NR_PROCESSO = "'+nr_processo+'"');
        Sql.Add(' AND CD_ITEM = "'+cd_cpmf+'"');
        params[0].Asfloat :=vl_cpmf;
        params[1].Asfloat :=vl_cpmf;
        ExecSql;
        Free;
      end;
      Vl_cpmf     := 0 ;
      nr_processo := CPMF.Fields[0].AsString;
    end;
  end;
end;

procedure Tdatm_recebimento_ag.qry_list_receb_CalcFields(DataSet: TDataSet);
begin
  qry_list_receb_.FieldByName('calc_processo').AsString := Trim(copy(qry_list_receb_.FieldByName('NR_PROCESSO').AsString,5,15));
end;

procedure Tdatm_recebimento_ag.qry_pesq_notificacao_CalcFields(DataSet: TDataSet);
begin
  qry_pesq_notificacao_.FieldByName('calc_processo').AsString := Trim(copy(qry_pesq_notificacao_.FieldByName('NR_PROCESSO').AsString,5,15));
end;

procedure Tdatm_recebimento_ag.qry_pesq_notificacao_AfterScroll(DataSet: TDataSet);
begin
  if frm_recebimento_ag.pgctrl_recebimento_ag.ActivePage = frm_recebimento_ag.ts_lista then
    frm_recebimento_ag.ts_rec_pendentes.TabVisible := (qry_pesq_notificacao_CD_STATUS.AsString = 'A') or (qry_pesq_notificacao_CD_STATUS.AsString = 'P');
end;

procedure Tdatm_recebimento_ag.qry_devolucao_CalcFields(DataSet: TDataSet);
begin
  if qry_devolucao_.FieldByName('IN_TRANSFERIDO').AsString = '0' then
    qry_devolucao_.FieldByName('Calc_TRANSFERIDO').AsString := 'Aberto'
  else if qry_devolucao_.FieldByName('IN_TRANSFERIDO').AsString = '1' then
    qry_devolucao_.FieldByName('Calc_TRANSFERIDO').AsString := 'Solicitado'
  else if qry_devolucao_.FieldByName('IN_TRANSFERIDO').AsString = '2' then
    qry_devolucao_.FieldByName('Calc_TRANSFERIDO').AsString := 'Cancelado';
end;

procedure Tdatm_recebimento_ag.qry_devolucao_AfterScroll(DataSet: TDataSet);
begin
  frm_recebimento_ag.btn_pagto.Visible      := ( qry_devolucao_.FieldByName('IN_TRANSFERIDO').AsString = '0' );
  frm_recebimento_ag.btn_canc_receb.Enabled := ( qry_devolucao_.FieldByName('IN_TRANSFERIDO').AsString <> '2' );
end;

end.

