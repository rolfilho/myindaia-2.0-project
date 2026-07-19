Unit dPedidoInstrucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables, Math, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ConsOnlineEx;

type
  Tdatm_pedido_instrucao = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_EMP_EST: TStringField;
    qry_processo_TP_PROCESSO: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_processo_CD_CIA_TRANSP: TStringField;
    qry_processo_CD_ARMADOR: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_TP_ESTUFAGEM: TStringField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_processo_TP_FRETE: TStringField;
    qry_processo_TP_CARGA: TStringField;
    qry_processo_CD_INCOTERM: TStringField;
    qry_processo_NM_CLIENTE: TStringField;
    qry_processo_NM_IMP: TStringField;
    qry_processo_NM_AGENTE: TStringField;
    qry_processo_NM_CIA: TStringField;
    qry_processo_NM_ARMADOR: TStringField;
    qry_processo_NM_MOEDA: TStringField;
    qry_processo_NM_ORIGEM: TStringField;
    qry_processo_NM_DESTINO: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    ds_processo: TDataSource;
    qry_processo_calc_processo: TStringField;
    qry_processo_AP_DESTINO: TStringField;
    qry_processo_AP_ORIGEM: TStringField;
    qry_processo_calc_tp_processo: TStringField;
    qry_processo_IN_ROUTING: TStringField;
    qry_tp_frete_: TQuery;
    qry_tp_frete_CODIGO: TStringField;
    qry_tp_frete_DESCRICAO: TStringField;
    qry_incoterm_: TQuery;
    qry_incoterm_CODIGO: TStringField;
    qry_incoterm_DESCRICAO: TStringField;
    qry_incoterm_SINAL: TStringField;
    qry_processo_Look_tp_incoterm: TStringField;
    qry_processo_Look_tp_frete: TStringField;
    qry_pesquisa_: TQuery;
    qry_processo_IN_PEDIDO: TStringField;
    qry_processo_carga_: TQuery;
    qry_processo_carga_NR_PROCESSO: TStringField;
    qry_processo_carga_CD_CARGA: TStringField;
    qry_processo_carga_QTDE: TFloatField;
    qry_processo_carga_VL_COMPR: TFloatField;
    qry_processo_carga_VL_LARG: TFloatField;
    qry_processo_carga_CD_VIA_TRANSP: TStringField;
    qry_processo_carga_TP_ESTUFAGEM: TStringField;
    qry_processo_carga_VL_ALT: TFloatField;
    qry_processo_carga_PESO_KG: TFloatField;
    qry_processo_carga_CUBAGEM_VENDA: TFloatField;
    qry_processo_carga_PESO_VOLUMETRICO: TFloatField;
    qry_processo_carga_VL_VENDA: TFloatField;
    ds_processo_carga: TDataSource;
    UpDAte_processo: TUpdateSQL;
    UpDate_proc_carga: TUpdateSQL;
    qry_ult_proc_carga_: TQuery;
    qry_ult_proc_carga_ULTIMO: TStringField;
    qry_via_transp_: TQuery;
    qry_via_transp_CONSTANTE_CUBAGEM: TFloatField;
    qry_processo_IN_CUBAGEM: TStringField;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_processo_CUBAGEM: TFloatField;
    qry_conhecimento_: TQuery;
    qry_conhecimento_NR_MASTER: TStringField;
    ds_conhecimento: TDataSource;
    qry_processo_CHARGEABLE: TFloatField;
    UpDate_conhecimento: TUpdateSQL;
    qry_conhecimento_NR_VOO: TStringField;
    qry_conhecimento_CD_MASTER: TStringField;
    qry_conhecimento_CD_PRODUTO: TStringField;
    qry_conhecimento_CD_UNID_NEG: TStringField;
    qry_conhecimento_CD_VIA_TRANSP: TStringField;
    qry_conhecimento_NR_HOUSE: TStringField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qry_tab_frete_: TQuery;
    qry_tab_frete_CD_TAB_FRETE: TStringField;
    qry_tab_frete_PESO_TAB_FRETE: TFloatField;
    qry_tab_frete_VL_VENDA_TAB_FRETE: TFloatField;
    qry_tab_frete_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_tab_frete_TP_ESTUFAGEM: TStringField;
    qry_tab_frete_TTIPO_SIMBOLO_TAB_FRETE: TStringField;
    qry_processo_VL_TARIFA_FRETE: TFloatField;
    qry_processo_VL_FRETE: TFloatField;
    qry_processo_VL_HOUSE: TFloatField;
    qry_processo_VL_OTHER_CHARGE: TFloatField;
    qry_processo_VL_RATEIO: TFloatField;
    qry_processo_CD_TAB_FRETE_VENDA: TStringField;
    qry_conhecimento_CHARG_MASTER: TFloatField;
    qry_conhecimento_VOL_MASTER: TFloatField;
    qry_conhecimento_TARIFA_CUSTO: TFloatField;
    qry_proc_cntr_: TQuery;
    qry_proc_cntr_NR_PROCESSO: TStringField;
    qry_proc_cntr_NR_CNTR: TStringField;
    qry_proc_cntr_CODIGO: TStringField;
    qry_proc_cntr_TP_CNTR: TStringField;
    qry_proc_cntr_NR_LACRE: TStringField;
    qry_proc_cntr_VL_VENDA: TFloatField;
    qry_proc_cntr_VL_PESO_TON: TFloatField;
    qry_proc_cntr_TP_FRETE: TStringField;
    ds_proc_cntr: TDataSource;
    UpDate_proc_cntr: TUpdateSQL;
    qry_cntr_: TQuery;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_proc_cntr_Look_nm_cntr: TStringField;
    qry_processo_carga_PESO_TON: TFloatField;
    qry_processo_carga_TP_EMBALAGEM: TStringField;
    qry_processo_carga_NM_EMBALAGEM: TStringField;
    qry_ult_proc_cntr_: TQuery;
    qry_ult_proc_cntr_ULTIMO: TStringField;
    qry_conhecimento_NR_BOOKING: TStringField;
    qry_processo_AP_CIDADE_ORIGEM: TStringField;
    qry_processo_AP_CIDADE_DESTINO: TStringField;
    qry_processo_NR_PROPOSTA: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_proc_cntr_VL_CUSTO_TOTAL: TFloatField;
    qry_processo_REF_CLIENTE: TStringField;
    qry_rel_pedido_instr_: TQuery;
    qry_rel_pedido_instr_NR_PROCESSO: TStringField;
    qry_rel_pedido_instr_CD_CLIENTE: TStringField;
    qry_rel_pedido_instr_NM_CLIENTE: TStringField;
    qry_rel_pedido_instr_END_CLIENTE: TStringField;
    qry_rel_pedido_instr_NUMERO_CLIENTE: TStringField;
    qry_rel_pedido_instr_CIDADE_CLIENTE: TStringField;
    qry_rel_pedido_instr_BAIRRO_CLIENTE: TStringField;
    qry_rel_pedido_instr_COMPL_CLIENTE: TStringField;
    qry_rel_pedido_instr_UF_CLIENTE: TStringField;
    qry_rel_pedido_instr_CEP_CLIENTE: TStringField;
    qry_rel_pedido_instr_FONE_CLIENTE: TStringField;
    qry_rel_pedido_instr_FAX_CLIENTE: TStringField;
    qry_rel_pedido_instr_CD_EXP: TStringField;
    qry_rel_pedido_instr_NM_EXP: TStringField;
    qry_rel_pedido_instr_END_EXP: TStringField;
    qry_rel_pedido_instr_NUMERO_EXP: TStringField;
    qry_rel_pedido_instr_COMPL_EXP: TStringField;
    qry_rel_pedido_instr_CIADDE_EXP: TStringField;
    qry_rel_pedido_instr_FONE_EXP: TStringField;
    qry_rel_pedido_instr_FAX_EXP: TStringField;
    qry_rel_pedido_instr_CD_ORIGEM: TStringField;
    qry_rel_pedido_instr_SIGLA_ORIGEM: TStringField;
    qry_rel_pedido_instr_NM_ORIGEM: TStringField;
    qry_rel_pedido_instr_SIGLA_CID_ORIGEM: TStringField;
    qry_rel_pedido_instr_CD_DESTINO: TStringField;
    qry_rel_pedido_instr_SIGLA_DESTINO: TStringField;
    qry_rel_pedido_instr_NM_DESTINO: TStringField;
    qry_rel_pedido_instr_SIGLA_CID_DESTINO: TStringField;
    qry_rel_pedido_instr_CD_AGENTE: TStringField;
    qry_rel_pedido_instr_NM_AGENTE: TStringField;
    qry_rel_pedido_instr_DS_ENDERECO: TStringField;
    qry_rel_pedido_instr_NR_FONE: TStringField;
    qry_rel_pedido_instr_NR_FAX: TStringField;
    qry_rel_pedido_instr_CD_CIA_TRANSP: TStringField;
    qry_rel_pedido_instr_NM_CIA: TStringField;
    qry_rel_pedido_instr_CD_ARMADOR: TStringField;
    qry_rel_pedido_instr_NM_ARMADOR: TStringField;
    qry_rel_pedido_instr_CD_MOEDA_FRETE: TStringField;
    qry_rel_pedido_instr_AP_MOEDA: TStringField;
    qry_rel_pedido_instr_NM_MOEDA: TStringField;
    qry_rel_pedido_instr_CD_INCOTERM: TStringField;
    qry_rel_pedido_instr_NM_INCOTERM: TStringField;
    qry_rel_pedido_instr_TP_CARGA: TStringField;
    qry_rel_pedido_instr_QTD_VOLUME: TFloatField;
    qry_rel_pedido_instr_VL_PESO_BRUTO: TFloatField;
    qry_rel_pedido_instr_CUBAGEM: TFloatField;
    ds_rel_pedido: TDataSource;
    pp_pedido: TppBDEPipeline;
    pp_carga: TppBDEPipeline;
    pp_cntr: TppBDEPipeline;
    qry_rel_pedido_instr_calc_nm_usuario: TStringField;
    qry_rel_pedido_instr_CD_UNID_NEG: TStringField;
    qry_rel_pedido_instr_CHARGEABLE: TFloatField;
    qry_rel_pedido_instr_VL_TARIFA_FRETE: TFloatField;
    qry_rel_pedido_instr_NM_UNID_NEG: TStringField;
    qry_rel_pedido_instr_END_UNID_NEG: TStringField;
    qry_rel_pedido_instr_NUMERO_UNID: TStringField;
    qry_rel_pedido_instr_COMPL_UNID: TStringField;
    qry_rel_pedido_instr_BAIRRO_UNID: TStringField;
    qry_rel_pedido_instr_CIDADE_UNID: TStringField;
    qry_rel_pedido_instr_UF_UNID: TStringField;
    qry_rel_pedido_instr_FONE_UNID: TStringField;
    qry_rel_pedido_instr_FAX_UNID: TStringField;
    qry_rel_pedido_instr_CEP_UNID: TStringField;
    qry_rel_pedido_instr_calc_nm_unidade: TStringField;
    qry_rel_pedido_instr_calc_end_cliente: TStringField;
    qry_rel_pedido_instr_calc_emp_exp: TStringField;
    qry_rel_pedido_instr_calc_voo_viagem: TStringField;
    qry_rel_pedido_instr_calc_dt_voo_viagem: TStringField;
    qry_rel_pedido_instr_VL_FRETE: TFloatField;
    qry_conhecimento_DT_PREV_SAIDA: TDateTimeField;
    qry_conhecimento_DT_DEAD_LINE: TDateTimeField;
    qry_conhecimento_CD_VEICULO: TStringField;
    qry_conhecimento_NM_VEICULO: TStringField;
    qry_conhecimento_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_conhecimento_CD_ARMAZEM_DESCARGA: TStringField;
    qry_conhecimento_NM_ARMAZEM_RETIRADA: TStringField;
    qry_conhecimento_NM_ARMAZEM_DESCARGA: TStringField;
    qry_rel_pedido_instr_DESCR_MERCADORIA: TStringField;
    qry_rel_pedido_instr_NR_BOOKING: TStringField;
    qry_rel_pedido_instr_CD_VEICULO: TStringField;
    qry_rel_pedido_instr_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_CD_ARMAZEM_DESCARGA: TStringField;
    qry_rel_pedido_instr_DT_DEAD_LINE: TDateTimeField;
    qry_rel_pedido_instr_DT_PREV_SAIDA: TDateTimeField;
    qry_rel_pedido_instr_FONE_ARMAZEM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_CONTATO_ARM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_FAX_ARM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_FONE_ARM_ENTREGA: TStringField;
    qry_rel_pedido_instr_CONTATO_ARM_ENTREGA: TStringField;
    qry_rel_pedido_instr_FAX_ARM_ENTREGA: TStringField;
    qry_rel_pedido_instr_CIDADE_ARM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_CIDADE_ARM_ENTREGA: TStringField;
    qry_rel_pedido_instr_NM_VEICULO: TStringField;
    qry_processo_DESCR_MERCADORIA: TStringField;
    qry_rel_pedido_instr_END_ARMAZEM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_NM_ARM_ATRACACAO: TStringField;
    qry_rel_pedido_instr_NM_ARM_ENTREGA: TStringField;
    qry_rel_pedido_instr_END_ARMAZEM_ENTREGA: TStringField;
    qry_proc_cntr_VL_CUBAGEM: TFloatField;
    qry_conhecimento_CD_NOTIFICADOR: TStringField;
    qry_conhecimento_NM_NOTIFICADOR: TStringField;
    qry_consolidadas_: TQuery;
    ds_consolidada: TDataSource;
    qry_consolidadas_CD_MASTER: TStringField;
    qry_consolidadas_CD_UNID_NEG: TStringField;
    qry_consolidadas_CD_PRODUTO: TStringField;
    qry_consolidadas_CD_VIA_TRANSP: TStringField;
    qry_consolidadas_NR_MASTER: TStringField;
    qry_consolidadas_CD_AGENTE: TStringField;
    qry_consolidadas_CD_CIA_TRANSP: TStringField;
    qry_consolidadas_CD_ORIGEM: TStringField;
    qry_consolidadas_CD_DESTINO: TStringField;
    qry_consolidadas_CD_MOEDA: TStringField;
    qry_consolidadas_DT_PREV_SAIDA: TDateTimeField;
    qry_consolidadas_NR_VOO: TStringField;
    qry_consolidadas_NM_UNID_NEG: TStringField;
    qry_consolidadas_NM_PRODUTO: TStringField;
    qry_consolidadas_NM_AGENTE: TStringField;
    qry_consolidadas_NM_CIA_TRANSP: TStringField;
    qry_consolidadas_NM_ORIGEM: TStringField;
    qry_consolidadas_NM_DESTINO: TStringField;
    qry_consolidadas_NM_MOEDA: TStringField;
    qry_houses_: TQuery;
    ds_house: TDataSource;
    qry_houses_CD_MASTER: TStringField;
    qry_houses_CD_HOUSE: TStringField;
    qry_houses_NR_PROCESSO: TStringField;
    qry_houses_CD_CLIENTE: TStringField;
    qry_houses_CHARGEABLE: TFloatField;
    qry_houses_NM_CLIENTE: TStringField;
    qry_houses_NR_HOUSE: TStringField;
    qry_houses_calc_processo: TStringField;
    qry_consolidadas_TP_ESTUFAGEM: TStringField;
    qry_consolidadas_NM_ORIGEM_CID: TStringField;
    qry_consolidadas_NM_DESTINO_CID: TStringField;
    qry_consolidadas_calc_tp_estufagem: TStringField;
    qry_consolidadas_NM_ARMADOR: TStringField;
    qry_consolidadas_NR_BOOKING: TStringField;
    qry_consolidadas_CD_ARMADOR: TStringField;
    qry_consolidadas_CD_VEICULO: TStringField;
    qry_consolidadas_NM_EMBARCACAO: TStringField;
    qry_proc_cntr_calcNomeCNTR: TStringField;
    qry_processo_carga_calcEMBALAGEM: TStringField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_carga_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_carga_AfterPost(DataSet: TDataSet);
    procedure qry_processo_carga_NewRecord(DataSet: TDataSet);
    procedure qry_processo_carga_BeforePost(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_processo_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_carga_QTDEChange(Sender: TField);
    procedure qry_processo_carga_PESO_KGChange(Sender: TField);
    procedure qry_processo_IN_CUBAGEMChange(Sender: TField);
    procedure qry_processo_CUBAGEMChange(Sender: TField);
    procedure qry_conhecimento_AfterPost(DataSet: TDataSet);
    procedure qry_conhecimento_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_CHARGEABLEChange(Sender: TField);
    procedure qry_proc_cntr_BeforePost(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterPost(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_TP_ESTUFAGEMChange(Sender: TField);
    procedure qry_processo_carga_TP_EMBALAGEMChange(Sender: TField);
    procedure qry_proc_cntr_NewRecord(DataSet: TDataSet);
    procedure qry_proc_cntr_VL_PESO_TONChange(Sender: TField);
    procedure qry_proc_cntr_TP_CNTRChange(Sender: TField);
    procedure qry_rel_pedido_instr_CalcFields(DataSet: TDataSet);
    procedure qry_houses_CalcFields(DataSet: TDataSet);
    procedure qry_consolidadas_CalcFields(DataSet: TDataSet);
    procedure qry_proc_cntr_CalcFields(DataSet: TDataSet);
    procedure qry_proc_cntr_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_processo_carga_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    vPreencheu1, vPreencheu2: Boolean;
  public
    { Public declarations }
    controle_calculo:Boolean;
  end;

var
  datm_pedido_instrucao: Tdatm_pedido_instrucao;

implementation

Uses GSMLIB, uPedidoInstrucao, PGGP017, PGGP001;

{$R *.DFM}

procedure Tdatm_pedido_instrucao.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_calc_processo.AsString:=copy(qry_processo_NR_PROCESSO.AsString ,5,10);
  if qry_processo_TP_PROCESSO.AsString = '0' then
    qry_processo_calc_tp_processo.AsString:='D';
  if qry_processo_TP_PROCESSO.AsString = '1' then
    qry_processo_calc_tp_processo.AsString:='C';
end;

procedure Tdatm_pedido_instrucao.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  if qry_processo_TP_PROCESSO.AsString = '0' then
  begin
    frm_pedido_instrucao.dbedt_cd_agente.Visible:=false;
    frm_pedido_instrucao.dbedt_nm_agente.Visible:=false;
    frm_pedido_instrucao.lb_agente.Visible:=false;
    frm_pedido_instrucao.dbedt_cd_ag_marit.Visible:=false;
    frm_pedido_instrucao.dbedt_nm_ag_marit.Visible:=false;
    frm_pedido_instrucao.lb_ag_marit.Visible:=false;

    frm_pedido_instrucao.pnl_master_direto.Visible:=true;
    frm_pedido_instrucao.pn_bc_bc.Visible:=false;

    frm_pedido_instrucao.pnl_book_conso.Visible:=false;
    frm_pedido_instrucao.pnl_book_direto.Visible:=true;

    frm_pedido_instrucao.btn_liberar.Enabled     := true;
    frm_pedido_instrucao.mi_aprova_pedido.Enabled:= true;
  end
  else
  begin
    frm_pedido_instrucao.dbedt_cd_agente.Visible  := true;
    frm_pedido_instrucao.dbedt_nm_agente.Visible  := true;
    frm_pedido_instrucao.lb_agente.Visible        := true;
    frm_pedido_instrucao.dbedt_cd_ag_marit.Visible:= true;
    frm_pedido_instrucao.dbedt_nm_ag_marit.Visible:= true;
    frm_pedido_instrucao.lb_ag_marit.Visible      := true;
    frm_pedido_instrucao.pnl_master_direto.Visible:= false;
    frm_pedido_instrucao.pn_bc_bc.Visible         := true;
    frm_pedido_instrucao.pnl_book_conso.Visible   := true;
    frm_pedido_instrucao.pnl_book_direto.Visible  := false;
    frm_pedido_instrucao.btn_liberar.Enabled      := True;
    frm_pedido_instrucao.mi_aprova_pedido.Enabled := True;
  end;
  if qry_processo_IN_ROUTING.AsString = '1' then
  begin
    frm_pedido_instrucao.dbedt_cd_moeda.Color:=clMenu;
    frm_pedido_instrucao.dbedt_cd_moeda.ReadOnly:=true;
    frm_pedido_instrucao.btn_co_moeda.Visible:=false;
    frm_pedido_instrucao.dbedt_cd_moeda_marit.Color:=clMenu;
    frm_pedido_instrucao.dbedt_cd_moeda_marit.ReadOnly:=true;
    frm_pedido_instrucao.btn_co_moeda_marit.Visible:=false;
  end
  else
  begin
    frm_pedido_instrucao.dbedt_cd_moeda.Color:=clWindow;
    frm_pedido_instrucao.dbedt_cd_moeda.ReadOnly:=false;
    frm_pedido_instrucao.btn_co_moeda.Visible:=true;
    frm_pedido_instrucao.dbedt_cd_moeda_marit.Color:=clWindow;
    frm_pedido_instrucao.dbedt_cd_moeda_marit.ReadOnly:=false;
    frm_pedido_instrucao.btn_co_moeda_marit.Visible:=true;
  end;
  if frm_pedido_instrucao.via_transp = '01' then
  begin
    if qry_processo_TP_ESTUFAGEM.AsString = '1' then
    begin
      //frm_pedido_instrucao.pnl_fcl.Visible:=true;
      //frm_pedido_instrucao.pnl_lcl.Visible:=false;
      frm_pedido_instrucao.nbEstufagem.ActivePage := 'FCL';
      frm_pedido_instrucao.lb_retirada.Visible:=true;
      frm_pedido_instrucao.dbedt_cd_atracacao.Visible:=true;
      frm_pedido_instrucao.dbedt_nm_atracacao.Visible:=true;
      frm_pedido_instrucao.btn_co_arm_retirada.Visible:=true;
    end
    else
    begin
      //frm_pedido_instrucao.pnl_fcl.Visible:=false;
      //frm_pedido_instrucao.pnl_lcl.Visible:=true;
      frm_pedido_instrucao.nbEstufagem.ActivePage := 'LCL';
      frm_pedido_instrucao.lb_retirada.Visible:=false;
      frm_pedido_instrucao.dbedt_cd_atracacao.Visible:=false;
      frm_pedido_instrucao.dbedt_nm_atracacao.Visible:=false;
      frm_pedido_instrucao.btn_co_arm_retirada.Visible:=false;
    end;
  end;
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_AfterDelete(DataSet: TDataSet);
begin
  qry_processo_carga_.ApplyUpdates;
  qry_processo_carga_PESO_KGChange(nil);
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu2 then
    qry_processo_carga_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação será cancelada!');

  qry_processo_carga_.Close;
  qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_processo_NR_PROCESSO.AsString;
  qry_processo_carga_.Prepare;
  qry_processo_carga_.Open;
  qry_processo_carga_.Last;
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_NewRecord(DataSet: TDataSet);
begin
  qry_processo_carga_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
  if frm_pedido_instrucao.via_transp = '04' then
    qry_processo_carga_CUBAGEM_VENDA.AsFloat:=qry_via_transp_CONSTANTE_CUBAGEM.AsFloat;
  qry_processo_carga_CD_VIA_TRANSP.AsString:=frm_pedido_instrucao.via_transp;
  qry_processo_carga_TP_ESTUFAGEM.AsString:='0';
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_BeforePost(DataSet: TDataSet);
begin
  if qry_processo_carga_.State in [dsInsert] then
    qry_processo_carga_CD_CARGA.AsString:=UltCod(qry_ult_proc_carga_,qry_ult_proc_carga_ULTIMO);

  vpreencheu2 := (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S') <> '');

end;

procedure Tdatm_pedido_instrucao.qry_processo_AfterPost(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpdates;
end;

procedure Tdatm_pedido_instrucao.qry_processo_AfterDelete(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpdates;
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_QTDEChange(Sender: TField);
var
  aux:real;
  i:integer;
  st_cubagem:string;
begin
  if frm_pedido_instrucao.via_transp <>'04' then exit;
  // verificação para evitar divisão por 0
  if qry_processo_carga_CUBAGEM_VENDA.AsFloat <> 0 then
    aux := qry_processo_carga_QTDE.AsFloat *
           ((qry_processo_carga_VL_COMPR.AsFloat * qry_processo_carga_VL_LARG.AsFloat * qry_processo_carga_VL_ALT.AsFloat)/
           qry_processo_carga_CUBAGEM_VENDA.AsFloat)
  else
    aux := 0;

  st_cubagem:=floattostr(aux);
  i := 1;

  while  (i <= length(st_cubagem)) do
  begin
    if st_cubagem[i+1] = ',' then
    begin
      st_cubagem:='0'+copy(st_cubagem,I+1,4+I);
      Break;
    end;
    i:=I+1;
  end;
  if (strtofloat(st_cubagem)> 0.5) or (strtofloat(st_cubagem)= 0.0) then
    qry_processo_carga_PESO_VOLUMETRICO.Asfloat:=Round(aux)
  else
  begin
    st_cubagem:=copy(floattostr(aux),1,i)+ ',5' ;
    qry_processo_carga_PESO_VOLUMETRICO.Asfloat:=strtofloat(st_cubagem);
  end;
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_PESO_KGChange(Sender: TField);
var
  qtde, peso_kg, peso_ton, cubagem : real;
  BookMark : TBookMark;
begin
  qtde:=0;peso_TON:=0;peso_KG:=0;cubagem:=0;

  BookMark:=qry_processo_carga_.GetBookmark;
  qry_processo_carga_.DisableControls;
  qry_processo_carga_.First;
  while not (qry_processo_carga_.EOF) do
  begin
    qtde:=qtde + qry_processo_carga_QTDE.AsFloat;
    peso_kg:=peso_kg + qry_processo_carga_PESO_KG.AsFloat;
    peso_ton:=peso_ton + qry_processo_carga_PESO_TON.Asfloat;
    cubagem:=cubagem + qry_processo_carga_PESO_VOLUMETRICO.AsFloat;
    qry_processo_carga_.Next;
  end;
  qry_processo_carga_.GotoBookmark(BookMark);
  qry_processo_carga_.FreeBookmark(BookMark);
  qry_processo_carga_.EnableControls;
  if not(qry_processo_.State in [dsEdit]) then qry_processo_.Edit;
  qry_processo_QTD_VOLUME.AsFloat:=qtde;
  if frm_pedido_instrucao.via_transp = '04' then
    qry_processo_VL_PESO_BRUTO.AsFloat:=peso_kg;

  if frm_pedido_instrucao.via_transp = '01' then
    qry_processo_VL_PESO_BRUTO.AsFloat:=peso_ton;

  qry_processo_CUBAGEM.AsFloat:=cubagem;
  qry_processo_CHARGEABLE.AsFloat:=max(qry_processo_VL_PESO_BRUTO.AsFloat, cubagem);

  try
    if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction
    else exit;
    if qry_processo_.State in [dsEdit] then
      qry_processo_.Post;
    if qry_conhecimento_.State in [dsEdit] then
      qry_conhecimento_.Post;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      qry_processo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  if  not(qry_processo_carga_.State in [dsInsert,dsEdit]) then  qry_processo_carga_.Edit;
end;

procedure Tdatm_pedido_instrucao.qry_processo_IN_CUBAGEMChange(Sender: TField);
begin
  if qry_processo_IN_CUBAGEM.AsString = '1' then
  begin
    Frm_pedido_instrucao.dbgrid_carga.Columns.Items[5].ReadOnly:=true;
  end
  else
  begin
    Frm_pedido_instrucao.dbgrid_carga.Columns.Items[5].ReadOnly:=false;
  end;
end;

procedure Tdatm_pedido_instrucao.qry_processo_CUBAGEMChange(Sender: TField);
begin
  qry_processo_CHARGEABLE.AsFloat:=Max(qry_processo_VL_PESO_BRUTO.AsFloat,qry_processo_CUBAGEM.AsFloat);
end;

procedure Tdatm_pedido_instrucao.qry_conhecimento_AfterPost(DataSet: TDataSet);
begin
  qry_conhecimento_.ApplyUpdates;
end;

procedure Tdatm_pedido_instrucao.qry_conhecimento_AfterDelete(DataSet: TDataSet);
begin
  qry_conhecimento_.ApplyUpdates;
end;

procedure Tdatm_pedido_instrucao.qry_processo_CHARGEABLEChange(Sender: TField);
var
  minimo, chargeable, tarifa : real;
  tarifa_custo, minimo_custo : real;
  BookMark : TBookMark;
begin
  if (qry_processo_IN_ROUTING.AsString = '0') or (qry_processo_CHARGEABLE.AsFloat = 0 ) then exit;
  tarifa:=0;minimo:=0; chargeable:=0;
  if qry_processo_CD_VIA_TRANSPORTE.AsString = '04' then
  begin
    chargeable:=qry_processo_CHARGEABLE.AsFloat;
    qry_tab_frete_.First;//posiciona no minimo
    if qry_tab_frete_TTIPO_SIMBOLO_TAB_FRETE.AsString = 'MIN' then
    begin
      minimo:=qry_tab_frete_VL_VENDA_TAB_FRETE.AsFloat;
      minimo_custo:=qry_tab_frete_VL_COMPRA_TAB_FRETE.Asfloat;
      qry_tab_frete_.Next;
    end;
    while (not(qry_tab_frete_.Eof)) do
    begin
      if (chargeable < qry_tab_frete_PESO_TAB_FRETE.AsFloat) and
         (qry_tab_frete_TTIPO_SIMBOLO_TAB_FRETE.AsString ='-')then
      begin
        tarifa:=qry_tab_frete_VL_VENDA_TAB_FRETE.AsFloat;
        tarifa_custo:=qry_tab_frete_VL_COMPRA_TAB_FRETE.Asfloat;
        Break;
      end;
      if (chargeable < qry_tab_frete_PESO_TAB_FRETE.AsFloat) then
      begin
        qry_tab_frete_.Prior;
        tarifa:=qry_tab_frete_VL_VENDA_TAB_FRETE.AsFloat;
        tarifa_custo:=qry_tab_frete_VL_COMPRA_TAB_FRETE.Asfloat;
        Break;
      end;
      qry_tab_frete_.Next;
      if (qry_tab_frete_.EOF) then
      Begin
        tarifa:=qry_tab_frete_VL_VENDA_TAB_FRETE.AsFloat;
        tarifa_custo:=qry_tab_frete_VL_COMPRA_TAB_FRETE.Asfloat;
      end;
    end;
    if qry_tab_frete_.RecordCount = 0 then//caso seja cotacao busca o valor acordado
    begin
      with TQuery.Create(Application) do
      begin
        databasename:='DBBROKER';
        Sql.Add('SELECT VL_VENDA FROM TPROPOSTA_ITEM NOLOCK WHERE NR_PROPOSTA = "'+qry_processo_NR_PROPOSTA.AsString+'"');
        Open;
        tarifa:=Fields[0].AsFloat;
        Free;
      end;
    end;
    if not (qry_conhecimento_.State in [dsEdit]) and (qry_conhecimento_.RecordCount > 0 )then
    begin
      qry_conhecimento_.Edit;
      qry_conhecimento_CHARG_MASTER.AsFloat :=chargeable;
      qry_conhecimento_VOL_MASTER.AsFloat   :=qry_processo_QTD_VOLUME.Asfloat;
    end;
    //valores de venda
    if (chargeable * tarifa) > minimo then
    begin
      qry_processo_VL_TARIFA_FRETE.Asfloat:= tarifa;
      qry_processo_VL_FRETE.Asfloat       := tarifa * chargeable;
      qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.Asfloat;
      if qry_conhecimento_.State = dsEdit then
         qry_conhecimento_TARIFA_CUSTO.AsFloat:= tarifa;;
    end
    else
    begin
      qry_processo_VL_TARIFA_FRETE.Asfloat:= MInimo;
      qry_processo_VL_FRETE.Asfloat       := MInimo ;
      qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.Asfloat;
      if qry_conhecimento_.State = dsEdit then
        qry_conhecimento_TARIFA_CUSTO.AsFloat:= MInimo;;
    end;
    //valores de custo apenas para processos diretos
    if qry_processo_TP_PROCESSO.AsString = '0' then
    begin
      if (chargeable * tarifa_custo) > minimo_custo then
      begin
        qry_processo_VL_RATEIO.Asfloat       := tarifa_custo * chargeable;
      end
      else
      begin
        qry_processo_VL_RATEIO.Asfloat       := minimo_custo;
      end;
    end;
  end;
  //maritimo
  if qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
  begin
    if (qry_processo_TP_ESTUFAGEM.AsString = '0') or   //lcl ou bb a estufagem fcl não é calcula pelo chargeable mas sim
       (qry_processo_TP_ESTUFAGEM.AsString = '2') then //pela inclusão dos contaniers
    begin
      chargeable:=qry_processo_CHARGEABLE.AsFloat;
      if chargeable < 1 then chargeable := 1;
      with TQuery.Create(Application)do
      begin
        DataBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add(' SELECT VL_VENDA_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TPROPOSTA_FRETE_ITEM WHERE CD_TAB_FRETE = "'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
        Sql.Add(' AND CD_SERVICO = "'+qry_processo_CD_SERVICO.AsString+'"');
        Sql.Add(' AND CD_PRODUTO = "'+qry_processo_CD_PRODUTO.AsString+'"');
        Sql.Add(' AND NR_PROPOSTA= "'+qry_processo_NR_PROPOSTA.AsString+'"');
        if (qry_processo_TP_ESTUFAGEM.AsString = '0') then
        Sql.Add('  AND TTIPO_SIMBOLO_TAB_FRETE ="0" AND TP_ESTUFAGEM = "0"');
        if (qry_processo_TP_ESTUFAGEM.AsString = '2') then
        Sql.Add('  AND TTIPO_SIMBOLO_TAB_FRETE ="2" AND TP_ESTUFAGEM = "0"');
        Open;
        Tarifa :=Fields[0].AsFloat;
        Tarifa_custo:=Fields[1].AsFloat;
        Free;
      end;
      qry_processo_VL_TARIFA_FRETE.Asfloat:= tarifa;
      qry_processo_VL_FRETE.Asfloat       := tarifa * chargeable;
      qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.Asfloat;
      if qry_processo_TP_PROCESSO.AsString = '0' then //processo diretos
      begin
        qry_processo_VL_RATEIO.Asfloat       := tarifa_custo * chargeable;
      end;
    end;
  end;
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_BeforePost(DataSet: TDataSet);
begin
{  if qry_proc_cntr_NR_CNTR.AsString = '' then begin
    DataSet.Cancel;
    qry_proc_cntr_.Close;
    qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString := datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
    qry_proc_cntr_.Prepare;
    qry_proc_cntr_.Open;
  end;    }
  if qry_proc_cntr_.State in [dsInsert] then
    qry_proc_cntr_CODIGO.AsString:=UltCod(qry_ult_proc_cntr_,qry_ult_proc_cntr_ULTIMO);

  vpreencheu1 := (Length(DataSet.FieldbyName('NR_CNTR').AsString) = 11) and
                 (ConsultaLookUP('TTP_CNTR', 'TP_CNTR', DataSet.FieldbyName('TP_CNTR').AsString , 'NM_TP_CNTR') <> '');

end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu1 then
    qry_proc_cntr_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação será cancelada!');

  qry_proc_cntr_.Close;
  qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString := datm_pedido_instrucao.qry_processo_NR_PROCESSO.AsString;
  qry_proc_cntr_.Prepare;
  qry_proc_cntr_.Open;
  qry_proc_cntr_.Last;
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_AfterDelete(DataSet: TDataSet);
begin
  qry_proc_cntr_.ApplyUpdates;
  qry_proc_cntr_VL_PESO_TONChange(nil);
end;

procedure Tdatm_pedido_instrucao.qry_processo_TP_ESTUFAGEMChange(Sender: TField);
var
  other_charge, cubagem, qtde, peso : real;
begin
  if qry_processo_TP_ESTUFAGEM.AsString = '0' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT SUM(QTDE), SUM(PESO_TON), SUM(PESO_VOLUMETRICO) FROM TINSTRUCAO_CARGA');
      Sql.Add(' WHERE NR_PROCESSO ="'+qry_processo_NR_PROCESSO.AsString+'" AND TP_ESTUFAGEM = "0" AND CD_VIA_TRANSP= "01"');
      Open;
      cubagem:=Fields[2].AsFloat; qtde:=Fields[0].AsFloat; peso:=Fields[1].AsFloat;
      Close;
      Sql.Clear;
      Sql.Add(' SELECT SUM(VL_VENDA) FROM TPROPOSTA_FRETE_DESPESA WHERE CD_TAB_FRETE="'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
      Sql.Add(' AND TP_ESTUFAGEM = "0" AND IN_MENCIONADO = "1" ');
      Sql.Add(' AND CD_SERVICO ="'+qry_processo_CD_SERVICO.AsString+'"');
      Sql.Add('AND CD_PRODUTO ="'+qry_processo_CD_PRODUTO.AsString+'"');
      Sql.Add('AND NR_PROPOSTA ="'+qry_processo_NR_PROPOSTA.AsString+'"');
      Open;
      Other_charge:=Fields[0].AsFloat;
      qry_processo_carga_.close;
      qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:= qry_processo_NR_PROCESSO.AsString;
      qry_processo_carga_.Prepare;
      qry_processo_carga_.Open;
      qry_processo_VL_OTHER_CHARGE.AsFloat:=Other_charge;
      qry_processo_CUBAGEM.Asfloat:=cubagem;
      qry_processo_QTD_VOLUME.Asfloat:=qtde;
      qry_processo_VL_PESO_BRUTO.Asfloat:=peso;
      qry_processo_CHARGEABLE.AsFloat:=Max(qry_processo_VL_PESO_BRUTO.AsFloat,qry_processo_CUBAGEM.AsFloat);
      Free
    end;
  end;

  if qry_processo_TP_ESTUFAGEM.AsString = '1' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT  SUM(VL_PESO_TON) FROM TPROCESSO_CNTR ');
      Sql.Add(' WHERE NR_PROCESSO ="'+qry_processo_NR_PROCESSO.AsString+'" ');
      Open;
      cubagem:=0;
      if Fields[0].AsFloat > 0 then
        qtde:=strtofloat(inttostr(RecordCount))
      else qtde:=0;
      peso:=Fields[0].AsFloat;

      Close;
      Sql.Clear;
      Sql.Add(' SELECT SUM(VL_VENDA) FROM TPROPOSTA_FRETE_DESPESA WHERE CD_TAB_FRETE="'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
      Sql.Add(' AND TP_ESTUFAGEM = "1" AND IN_MENCIONADO = "1" ');
      Sql.Add(' AND CD_SERVICO ="'+qry_processo_CD_SERVICO.AsString+'"');
      Sql.Add('AND CD_PRODUTO ="'+qry_processo_CD_PRODUTO.AsString+'"');
      Sql.Add('AND NR_PROPOSTA ="'+qry_processo_NR_PROPOSTA.AsString+'"');
      Open;

      Other_charge:=Fields[0].AsFloat;

//      qry_proc_cntr_.close;
//      qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString:= qry_processo_NR_PROCESSO.AsString;
//      qry_proc_cntr_.Prepare;
//      qry_proc_cntr_.Open;

      qry_processo_VL_OTHER_CHARGE.AsFloat:=Other_charge;
      qry_processo_CUBAGEM.Asfloat:=cubagem;
      qry_processo_QTD_VOLUME.Asfloat:=qtde;
      qry_processo_VL_PESO_BRUTO.Asfloat:=peso;
      qry_processo_CHARGEABLE.AsFloat:=Max(qry_processo_VL_PESO_BRUTO.AsFloat,qry_processo_CUBAGEM.AsFloat);
      Free
    end;
  end;
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_TP_EMBALAGEMChange(Sender: TField);
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+qry_processo_carga_TP_EMBALAGEM.AsString+'"');
    Open;
    qry_processo_carga_NM_EMBALAGEM.AsString:=Fields[0].AsString;
  end;
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_NewRecord(DataSet: TDataSet);
begin
  qry_proc_cntr_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
  frm_pedido_instrucao.dbgrid_fcl.SelectedIndex := 0;
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_VL_PESO_TONChange( Sender: TField);
var
  qtde, peso_ton, venda, custo, cubagem : real;
  BookMark : TBookMark;
begin
  qtde:=0;peso_TON:=0; venda:=0; custo:=0; cubagem:=0;
  BookMark:=qry_proc_cntr_.GetBookmark;
  qry_proc_cntr_.DisableControls;
  qry_proc_cntr_.First;
  while not (qry_proc_cntr_.EOF) do
  begin
    qtde:= qtde + 1 ;
    peso_ton := peso_ton + qry_proc_cntr_VL_PESO_TON.Asfloat;
    venda    := venda    + qry_proc_cntr_VL_VENDA.AsFloat;
    custo    := custo    + qry_proc_cntr_VL_CUSTO_TOTAL.AsFloat;
    cubagem  := cubagem  + qry_proc_cntr_VL_CUBAGEM.AsFloat;
    qry_proc_cntr_.Next;
  end;
  qry_proc_cntr_.GotoBookmark(BookMark);
  qry_proc_cntr_.FreeBookmark(BookMark);
  qry_proc_cntr_.EnableControls;
  if not(qry_processo_.State in [dsEdit])then
    qry_processo_.Edit;
  qry_processo_QTD_VOLUME.AsFloat    := qtde;
  qry_processo_VL_FRETE.AsFloat      := venda;
  qry_processo_VL_HOUSE.AsFloat      := venda + qry_processo_VL_OTHER_CHARGE.AsFloat;
  qry_processo_VL_PESO_BRUTO.AsFloat := peso_ton;
  qry_processo_VL_RATEIO.AsFloat     := custo;
  qry_processo_CHARGEABLE.AsFloat    := qry_processo_VL_PESO_BRUTO.AsFloat;
  qry_processo_CUBAGEM.AsFloat       := cubagem;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction
    else exit;
    if qry_processo_.State in [dsEdit] then
      qry_processo_.Post;
    if qry_conhecimento_.State in [dsEdit] then
      qry_conhecimento_.Post;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      qry_processo_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  if  not(qry_proc_cntr_.State in [dsInsert,dsEdit]) then
    qry_proc_cntr_.Edit;
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_TP_CNTRChange(Sender: TField);
var
  TP_PROPOSTA : TQuery;
  st_tp_proposta : String[1];
begin
  TP_PROPOSTA := TQuery.Create(Application);
  TP_PROPOSTA.DataBaseName:='DBBROKER';
  TP_PROPOSTA.Sql.Clear;
  TP_PROPOSTA.Sql.Add('SELECT TP_PROPOSTA FROM TPROPOSTA NOLOCK WHERE NR_PROPOSTA = "'+qry_processo_NR_PROPOSTA.AsString+'"');
  TP_PROPOSTA.Open;

  st_tp_proposta:= TP_PROPOSTA.Fields[0].AsString;
  TP_PROPOSTA.Free;

  If st_tp_proposta = '0' then //proposta
  begin
    with TQuery.Create(Application) do
    begin
      DAtabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT VL_VENDA_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TPROPOSTA_FRETE_ITEM ');
      Sql.Add('WHERE CD_TAB_FRETE="'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'" ');
      Sql.Add(' AND TP_ESTUFAGEM = "1" ');
      Sql.Add(' AND CD_SERVICO ="'+qry_processo_CD_SERVICO.AsString+'"');
      Sql.Add('AND CD_PRODUTO ="'+qry_processo_CD_PRODUTO.AsString+'"');
      Sql.Add('AND NR_PROPOSTA ="'+qry_processo_NR_PROPOSTA.AsString+'"');
      Sql.Add('AND VOLUME_TAB_FRETE  = "'+qry_proc_cntr_TP_CNTR.AsString+'"');
      Open;
      if recordcount = 0 then
      begin
        qry_proc_cntr_.Cancel;
        Boxmensagem('Contanier não encontrado na Proposta Aprovada!',2);
        Exit;
      end;
      qry_proc_cntr_VL_CUSTO_TOTAL .AsFloat:=Fields[1].AsFloat;
      qry_proc_cntr_VL_VENDA.AsFloat:=Fields[0].AsFloat;

      Free;
    end;
  end;
  If st_tp_proposta = '1' then //cotacao
  begin
    with TQuery.Create(Application) do
    begin
      DAtabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT VL_VENDA, VL_CUSTO FROM TPROPOSTA_MERCADORIA ');
      Sql.Add('WHERE NR_PROPOSTA ="'+qry_processo_NR_PROPOSTA.AsString+'"');
      Sql.Add('AND TP_CNTR  = "'+qry_proc_cntr_TP_CNTR.AsString+'"');
      Open;
      if recordcount = 0 then
      begin
        qry_proc_cntr_.Cancel;
        Boxmensagem('Contanier não encontrado na Cotação Aprovada!',2);
        Exit;
      end;
      qry_proc_cntr_VL_CUSTO_TOTAL .AsFloat:=Fields[1].AsFloat;
      qry_proc_cntr_VL_VENDA.AsFloat:=Fields[0].AsFloat;
      Free;
    end;
  end;
end;

procedure Tdatm_pedido_instrucao.qry_rel_pedido_instr_CalcFields(DataSet: TDataSet);
begin
  qry_rel_pedido_instr_calc_nm_usuario.AsString:= str_nm_usuario;

  qry_rel_pedido_instr_calc_nm_unidade.AsString := qry_rel_pedido_instr_END_UNID_NEG.AsString +', '+
                qry_rel_pedido_instr_NUMERO_UNID.AsString + ' '+qry_rel_pedido_instr_COMPL_UNID.AsString+
                qry_rel_pedido_instr_BAIRRO_UNID.AsString + ' '+ qry_rel_pedido_instr_CIDADE_UNID.AsString+ '-'+
                qry_rel_pedido_instr_UF_UNID.AsString+ #10+
                qry_rel_pedido_instr_CEP_UNID.AsString+#10+
                qry_rel_pedido_instr_FONE_UNID.AsString+#10+
                qry_rel_pedido_instr_FAX_UNID.AsString;

  qry_rel_pedido_instr_calc_end_cliente.AsString := qry_rel_pedido_instr_END_CLIENTE.AsString + ', '+
                qry_rel_pedido_instr_NUMERO_CLIENTE.AsString + ' ' +qry_rel_pedido_instr_COMPL_CLIENTE.AsString +
                qry_rel_pedido_instr_BAIRRO_CLIENTE.AsString + ' ' +qry_rel_pedido_instr_CIDADE_CLIENTE.AsString +
                 '-'+qry_rel_pedido_instr_UF_CLIENTE.AsString;

  qry_rel_pedido_instr_calc_emp_exp.AsString:= qry_rel_pedido_instr_END_EXP.AsString + ', '+
                qry_rel_pedido_instr_NUMERO_EXP.AsString + ' '+ qry_rel_pedido_instr_COMPL_EXP.AsString+ ' '+
                qry_rel_pedido_instr_CIADDE_EXP.AsString + ' '+#10+
                qry_rel_pedido_instr_FONE_EXP.AsString + #10+
                qry_rel_pedido_instr_FAX_EXP.AsString;

  qry_rel_pedido_instr_calc_voo_viagem.AsString   :=qry_conhecimento_NR_VOO.AsString;
  qry_rel_pedido_instr_calc_dt_voo_viagem.AsString:=qry_conhecimento_DT_PREV_SAIDA.AsString;
end;

procedure Tdatm_pedido_instrucao.qry_houses_CalcFields(DataSet: TDataSet);
begin
  qry_houses_calc_processo.AsString := copy(qry_houses_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_pedido_instrucao.qry_consolidadas_CalcFields(DataSet: TDataSet);
begin
  if qry_consolidadas_TP_ESTUFAGEM.AsString = '1' then
    qry_consolidadas_calc_tp_estufagem.AsString := 'FCL'
  else
    qry_consolidadas_calc_tp_estufagem.AsString := 'LCL';
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_CalcFields(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('calcNomeCNTR').AsString := ConsultaLookUP('TTP_CNTR', 'TP_CNTR', DataSet.FieldByName('TP_CNTR').AsString, 'NM_TP_CNTR');
end;

procedure Tdatm_pedido_instrucao.qry_proc_cntr_UpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort ;
  TrataErro(E);
end;

procedure Tdatm_pedido_instrucao.qry_processo_carga_CalcFields(
  DataSet: TDataSet);
begin
  qry_processo_carga_calcEMBALAGEM.AsString := ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S')
end;

end.
