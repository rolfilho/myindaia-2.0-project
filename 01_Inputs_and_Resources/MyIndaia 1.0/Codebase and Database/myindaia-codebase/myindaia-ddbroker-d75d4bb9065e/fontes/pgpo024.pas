(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGPO024.PAS -
DATA:

Manutenção:
Data:
*************************************************************************************************)

unit PGPO024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_gestao_po = class(TDataModule)
    qry_usuario_habilitacao_: TQuery;
    qry_unid_neg_: TQuery;    
    qry_unid_neg_produto_: TQuery;
    qry_unid_neg_produto_look_ativo: TStringField;
    qry_unid_neg_produto_CD_UNID_NEG: TStringField;
    qry_unid_neg_produto_CD_PRODUTO: TStringField;
    qry_unid_neg_produto_IN_ATIVO: TStringField;
    qry_unid_neg_produto_NR_ULT_FATURA: TFloatField;
    qry_unid_neg_produto_NR_ULT_NOTA: TFloatField;
    qry_unid_neg_produto_NR_ULT_PROCESSO: TFloatField;
    qry_unid_neg_produto_NR_ULT_PREVISAO: TStringField;
    qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField;
    qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField;
    qry_unid_neg_produto_look_nm_produto: TStringField;
    qry_unid_neg_produto_look_ap_produto: TStringField;
    qry_unid_neg_produto_look_nm_unid_neg: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    ds_yesno: TDataSource;
    qry_cliente_habilitacao_: TQuery;
    qry_processo_velho_: TQuery;
    qry_ult_processo_: TQuery;
    qry_ult_processo_ULTIMO: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_DT_HABILITACAO: TDateTimeField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_cliente_servico_: TQuery;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    qry_proc_aux_: TQuery;
    qry_proc_aux_NR_PROCESSO: TStringField;
    sp_atz_evento: TStoredProc;
    qry_processo_velho_CD_UNID_NEG: TStringField;
    qry_processo_velho_CD_PRODUTO: TStringField;
    qry_processo_velho_CD_CLIENTE: TStringField;
    qry_processo_velho_DT_ABERTURA: TDateTimeField;
    qry_processo_velho_CD_USUARIO: TStringField;
    qry_processo_velho_CD_SERVICO: TStringField;
    qry_processo_velho_NR_PROC_RISC: TStringField;
    qry_processo_velho_CD_STATUS_SDA: TStringField;
    qry_processo_velho_IN_LIBERADO: TStringField;
    qry_processo_velho_CD_RESTRICAO: TStringField;
    qry_processo_velho_NR_PROCESSO: TStringField;
    qry_proc_aux_CD_CLIENTE: TStringField;
    qry_proc_aux_CD_SERVICO: TStringField;
    qry_proc_aux_CD_UNID_NEG: TStringField;
    qry_proc_aux_CD_PRODUTO: TStringField;
    qry_ref_cli_: TQuery;
    qry_ref_cli_NR_PROCESSO: TStringField;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_ult_ref_cli_: TQuery;
    qry_ult_ref_cli_ULTIMO: TStringField;
    qry_doc_instrucao_: TQuery;
    qry_doc_instrucao_NR_PROCESSO: TStringField;
    qry_doc_instrucao_NR_SEQUENCIA: TIntegerField;
    qry_doc_instrucao_CD_TIPO_DCTO_INSTR: TStringField;
    qry_doc_instrucao_NR_DCTO_INSTRUCAO: TStringField;
    qry_processo_velho_NR_CONHECIMENTO: TStringField;
    qry_processo_velho_NR_CONHECIMENTO_MASTER: TStringField;
    sp_ult_sequencia: TStoredProc;
    qry_processo_velho_CD_AREA: TStringField;
    qry_ult_processo_por_ano_: TQuery;
    StringField1: TStringField;
    qry_unid_neg_CD_PAIS: TStringField;
    qry_processo_velho_CD_PAIS_DESTINO: TStringField;
    qry_processo_velho_CD_PAIS_ORIGEM: TStringField;
    qry_processo_velho_IN_ENTREPOSTO: TStringField;
    qry_parametros_: TQuery;
    qry_parametros_CD_GRUPO_BASF: TStringField;
    qry_processo_velho_CD_ANALISTA_COMISSARIA: TStringField;
    qry_processo_velho_CD_GRUPO: TStringField;
    qry_celula_: TQuery;
    qry_usuario_: TQuery;
    qry_processo_velho_CD_CELULA: TStringField;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_cliente_servico_CD_PREFIXO: TStringField;
    qry_cliente_servico_IN_ATIVO: TStringField;
    qry_cliente_servico_DT_CAPTACAO: TDateTimeField;
    qry_cliente_servico_PZ_PROPOSTA: TIntegerField;
    qry_parametros_CD_GRUPO_BSG: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_NM_UNID_NEG: TStringField;
    qry_usuario_habilitacao_NM_PRODUTO: TStringField;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_CD_UNID_NEG: TStringField;
    qry_cliente_habilitacao_CD_PRODUTO: TStringField;
    qry_cliente_habilitacao_IN_ATIVO: TStringField;
    qry_cliente_habilitacao_IN_RESTRICAO: TStringField;
    qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField;
    qry_cliente_habilitacao_IN_COMPRADOR: TBooleanField;
    qry_cliente_habilitacao_NM_EMPRESA: TStringField;
    qry_cliente_habilitacao_CD_GRUPO: TStringField;
    qry_exportador_: TQuery;
    qry_exportador_NM_EMPRESA: TStringField;
    qry_exportador_CD_EMPRESA: TStringField;
    qry_via_transp_: TQuery;
    qry_via_transp_NM_VIA_TRANSPORTE: TStringField;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_DT_ABERTURA: TDateTimeField;
    qry_processo_CD_USUARIO: TStringField;
    qry_processo_NR_REFERENCIA: TStringField;
    qry_processo_DT_PEDIDO: TDateTimeField;
    qry_processo_HR_PEDIDO: TDateTimeField;
    qry_processo_velho_CD_EXPORTADOR: TStringField;
    qry_processo_velho_HR_PEDIDO: TDateTimeField;
    qry_processo_velho_DT_PEDIDO: TDateTimeField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_velho_HR_ABERTURA: TDateTimeField;
    qry_processo_HR_ABERTURA: TDateTimeField;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_processo_velho_NR_REFERENCIA: TStringField;
    qry_processo_NR_VOO: TStringField;
    qry_processo_NR_VIAGEM: TStringField;
    qry_processo_CD_INCOTERM: TStringField;
    qry_processo_CD_EMBARCACAO: TStringField;
    qry_processo_CD_ANALISTA_COMISSARIA: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_yes_no: TQuery;
    qry_tp_pedido_: TQuery;
    qry_incoterm_: TQuery;
    qry_cliente_contato_: TQuery;
    qry_cliente_contato_NM_CONTATO: TStringField;
    qry_cliente_contato_CD_CLIENTE: TStringField;
    qry_cliente_contato_CD_UNID_NEG: TStringField;
    qry_cliente_contato_CD_PRODUTO: TStringField;
    qry_cliente_contato_CD_CONTATO: TStringField;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_CELULA: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_porto_: TQuery;
    qry_porto_CODIGO: TStringField;
    qry_porto_DESCRICAO: TStringField;
    qry_navio_: TQuery;
    qry_navio_CD_EMBARCACAO: TStringField;
    qry_navio_NM_EMBARCACAO: TStringField;
    qry_viagem_: TQuery;
    qry_viagem_NR_VIAGEM: TStringField;
    qry_processo_CD_TP_PEDIDO: TStringField;
    qry_processo_IN_CONSOLIDADO: TStringField;
    qry_processo_IN_SEGURO: TStringField;
    dsTipoPedido: TDataSource;
    dsIncoterm: TDataSource;
    qry_yes_noCD_YESNO: TStringField;
    qry_yes_noTX_YESNO: TStringField;
    qry_processo_calcCancelado: TStringField;
    qry_processo_IN_URGENTE: TStringField;
    qry_nec_li_: TQuery;
    qry_nec_li_NR_PROCESSO: TStringField;
    qry_nec_li_NR_REFERENCIA: TStringField;
    qry_nec_li_NR_ITEM_CLIENTE: TStringField;
    qry_nec_li_CD_MERCADORIA: TStringField;
    qry_nec_li_CD_NCM_SH: TStringField;
    qry_nec_li_IN_NECESSIDADE_LI: TStringField;
    ds_nec_li: TDataSource;
    qry_mercadoria_: TQuery;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_mercadoria_CD_NCM_SH: TStringField;
    qry_mercadoria_IN_NECESSITA_LI: TBooleanField;
    ds_mercadoria: TDataSource;
    qry_grupo_: TQuery;
    qry_processo_IN_LIBERADO: TStringField;
    updProcesso: TUpdateSQL;
    qry_processo_CD_AREA: TStringField;
    qry_processo_CD_IMPORTADOR: TStringField;
    qry_cliente_habilitacao_IN_IMPORTADOR: TBooleanField;
    qry_processo_NR_ORDEM: TStringField;
    sp_flp_po: TStoredProc;
    sp_flp_po_item: TStoredProc;
    qry_po_item_: TQuery;
    ds_po: TDataSource;
    qry_po_: TQuery;
    updPO: TUpdateSQL;
    qry_po_NR_PROCESSO: TStringField;
    qry_po_DT_ABERTURA: TDateTimeField;
    sp_atz_ev_flp_po: TStoredProc;
    sp_atz_ev_flp_po_item: TStoredProc;
    ds_gestao_item: TDataSource;
    qry_gestao_item_: TQuery;
    updGestao_Item: TUpdateSQL;
    ds_po_item: TDataSource;
    qry_po_CD_SERVICO: TStringField;
    qry_po_NR_IDENT_USUARIO: TStringField;
    qry_po_CD_IMPORTADOR: TStringField;
    qry_po_CD_CONSIGNATARIO: TStringField;
    qry_po_CD_FABRICANTE: TStringField;
    qry_po_CD_EXPORTADOR: TStringField;
    qry_po_CD_VIA_TRANSP: TStringField;
    qry_po_CD_REPRESENTANTE: TStringField;
    qry_po_CD_MOD_PAGAMENTO: TStringField;
    qry_po_CD_PAIS_ORIGEM: TStringField;
    qry_po_CD_REGIME_TRIB: TStringField;
    qry_po_CD_PAIS_PROCEDENCIA: TStringField;
    qry_po_CD_MOEDA_NEG: TStringField;
    qry_po_CD_PAIS_AQUISICAO: TStringField;
    qry_po_CD_TP_DECLARACAO: TStringField;
    qry_po_CD_URF_DESPACHO: TStringField;
    qry_po_CD_INCOTERM: TStringField;
    qry_po_CD_TRANSP_INTERN: TStringField;
    qry_po_CD_BANDEIRA_VEIC: TStringField;
    qry_po_CD_SETOR_ARMAZENAGEM: TStringField;
    qry_po_CD_AGENTE_CARGA: TStringField;
    qry_po_CD_URF_ENTRADA: TStringField;
    qry_po_CD_RECINTO_ALFAND: TStringField;
    qry_po_CD_MOEDA_FRETE: TStringField;
    qry_po_CD_MOEDA_SEGURO: TStringField;
    qry_po_CD_MOEDA_CARGA: TStringField;
    qry_po_CD_LOCAL_INCOTERM: TStringField;
    qry_po_CD_TX_JUROS: TStringField;
    qry_po_CD_INSTIT_FINANC: TStringField;
    qry_po_CD_MOTIVO_CAMBIO_SEM_COBERT: TStringField;
    qry_po_CD_BARRA: TStringField;
    qry_po_CD_MET_VALORACAO_ADUAN: TStringField;
    qry_po_DT_EMISSAO_DOC_CARGA: TDateTimeField;
    qry_po_DT_CHEGADA_CARGA: TDateTimeField;
    qry_po_DT_FATURA: TDateTimeField;
    qry_po_IN_APLICACAO_MERC: TStringField;
    qry_po_IN_COMISSAO: TBooleanField;
    qry_po_IN_DESCONTO: TBooleanField;
    qry_po_IN_TP_COMISSAO: TStringField;
    qry_po_IN_TP_DESCONTO: TStringField;
    qry_po_IN_INDICADOR_CONSIG_IMPORT: TBooleanField;
    qry_po_IN_INDICADOR_PROC: TStringField;
    qry_po_IN_VINC_IMPO_EXPO: TStringField;
    qry_po_IN_COND_MERCADORIA: TStringField;
    qry_po_IN_FABR_EXPOR_IMP: TStringField;
    qry_po_IN_INDIC_MULTMODAL: TBooleanField;
    qry_po_IN_FUNDAP: TBooleanField;
    qry_po_IN_UTILIZ_CARGA: TStringField;
    qry_po_IN_INDIC_TX_JUROS: TBooleanField;
    qry_po_IN_SEGURO: TStringField;
    qry_po_NR_PLACA_VEICULO: TStringField;
    qry_po_NR_MANIFESTO: TStringField;
    qry_po_NR_DOC_MASTER: TStringField;
    qry_po_NR_DOC_HOUSE: TStringField;
    qry_po_NR_BACEN: TStringField;
    qry_po_NR_FATURA: TStringField;
    qry_po_NM_IDENT_CRT: TStringField;
    qry_po_NM_VEICULO: TStringField;
    qry_po_PC_COMISSAO: TFloatField;
    qry_po_PC_DESCONTO: TFloatField;
    qry_po_PC_SEGURO: TFloatField;
    qry_po_PC_COMISSAO_AGENTE: TFloatField;
    qry_po_PL_PO: TFloatField;
    qry_po_PB_PO: TFloatField;
    qry_po_QT_TOTAL_PESO: TFloatField;
    qry_po_QT_PORC_ICMS: TFloatField;
    qry_po_QT_TOTAL_ITENS: TStringField;
    qry_po_QT_PORC_RED_ICMS: TFloatField;
    qry_po_QT_PERIODICIDADE: TStringField;
    qry_po_TP_COBERT_CAMBIO: TStringField;
    qry_po_TP_CAMBIO: TBooleanField;
    qry_po_TP_DOC_CARGA: TStringField;
    qry_po_TP_FRETE: TStringField;
    qry_po_TP_SEGURO: TStringField;
    qry_po_TP_MOD_DESPACHO: TStringField;
    qry_po_TP_MANIFESTO: TStringField;
    qry_po_TX_JUROS: TFloatField;
    qry_po_TX_OBSERVACAO: TMemoField;
    qry_po_VL_COMISSAO: TFloatField;
    qry_po_VL_CARGA: TFloatField;
    qry_po_VL_CAMBIO: TFloatField;
    qry_po_VL_DESCONTO: TFloatField;
    qry_po_VL_FRETE_PREPAID: TFloatField;
    qry_po_VL_FRETE_COLLECT: TFloatField;
    qry_po_VL_FRETE_TERRIT_NAC: TFloatField;
    qry_po_VL_SEGURO: TFloatField;
    qry_po_VL_TOTAL: TFloatField;
    qry_po_VL_TOTAL_PARCELA: TFloatField;
    qry_po_VL_PAGTO_ANTECIPADO: TFloatField;
    qry_po_VL_PAGTO_VISTA: TFloatField;
    qry_po_VL_PERIODIC_MENSAL: TFloatField;
    qry_po_VL_DESPESAS: TFloatField;
    qry_po_VL_DESCONTOS: TFloatField;
    qry_po_IN_SELECIONADO: TStringField;
    qry_po_IN_MONTADO: TStringField;
    qry_po_IN_IND_COND_MERC: TBooleanField;
    qry_po_IN_IND_CAMBIO_ITENS: TBooleanField;
    qry_po_NR_PARCELAS: TStringField;
    qry_po_IN_PERIODICIDADE: TStringField;
    qry_po_QT_TOTAL_DISPONIVEL: TFloatField;
    qry_po_CD_USUARIO_MONTA: TStringField;
    qry_po_CD_AREA: TStringField;
    qry_po_CD_COMPRADOR: TStringField;
    qry_po_CD_TERMO_PAGTO: TStringField;
    qry_po_DT_NECESSIDADE: TDateTimeField;
    qry_po_CD_TIPO_FRETE: TStringField;
    qry_po_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_po_IN_ENTREPOSTO: TStringField;
    qry_po_IN_FATURADO: TStringField;
    qry_po_IN_IMEDIATO: TStringField;
    qry_po_VL_FRETE_INTERNO: TFloatField;
    qry_po_VL_EMBALAGEM: TFloatField;
    qry_po_TX_OBS_INTERNO: TMemoField;
    qry_po_VL_PB_EMBALAGEM: TFloatField;
    qry_po_VL_PL_EMBALAGEM: TFloatField;
    qry_po_NR_DA: TStringField;
    qry_po_TX_VOLUMES: TMemoField;
    qry_po_TX_INF_ENTREPOSTO: TMemoField;
    qry_po_TP_NEGOCIACAO: TStringField;
    qry_po_NR_ARTICULO: TStringField;
    qry_po_NR_ORDEM: TStringField;
    qry_po_CD_USUARIO_INT: TStringField;
    qry_po_CD_AGENTE: TStringField;
    qry_po_CD_BANCO: TStringField;
    qry_po_CD_USUARIO: TStringField;
    qry_po_TX_OBS: TMemoField;
    qry_po_CD_CANAL: TStringField;
    qry_po_IN_CARGA_PERIGOSA: TStringField;
    qry_po_VL_M3: TFloatField;
    qry_po_NM_EMPRESA_BASF: TStringField;
    qry_gestao_item_NR_PROCESSO: TStringField;
    qry_gestao_item_NR_ITEM: TStringField;
    qry_gestao_item_CD_EMBARCACAO: TStringField;
    qry_gestao_item_NR_VIAGEM: TStringField;
    qry_gestao_item_NR_VOO: TStringField;
    qry_gestao_item_IN_CONSOLIDADO: TStringField;
    qry_gestao_item_NR_CONHECIMENTO: TStringField;
    qry_gestao_item_IN_URGENTE: TStringField;
    qry_gestao_item_IN_SEGURO: TStringField;
    qry_po_item_CD_MERCADORIA: TStringField;
    qry_po_item_TX_MERCADORIA: TMemoField;
    qry_po_item_QT_INICIAL: TFloatField;
    qry_gestao_item_TX_MERCADORIA: TMemoField;
    qry_gestao_item_CD_MERCADORIA: TStringField;
    qry_gestao_item_QT_INICIAL: TFloatField;
    qry_processo_IN_DADOS_IGUAIS_ITENS: TStringField;
    qry_ref_cli_NR_SEQUENCIA: TStringField;
    qry_gestao_item_NM_AREA: TStringField;
    qry_processo_CD_ANALISTA_CLIENTE: TStringField;
    qry_processo_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_nec_li_calc_Nec_LI: TStringField;
    qry_processo_calcNrProcesso: TStringField;
    qry_nec_li_calcApMercadoria: TStringField;
    qry_gestao_item_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_po_item_CD_MERC_FORNEC: TStringField;
    procedure ds_processoStateChange(Sender: TObject);
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterClose(DataSet: TDataSet);
    procedure qry_nec_li_BeforePost(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_processo_AfterDelete(DataSet: TDataSet);
    procedure ds_nec_liStateChange(Sender: TObject);
    procedure qry_po_AfterDelete(DataSet: TDataSet);
    procedure qry_po_AfterPost(DataSet: TDataSet);
    procedure qry_gestao_item_AfterDelete(DataSet: TDataSet);
    procedure qry_gestao_item_AfterPost(DataSet: TDataSet);
    procedure ds_gestao_itemStateChange(Sender: TObject);
    procedure qry_processo_BeforePost(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_nec_li_AfterScroll(DataSet: TDataSet);
    procedure ds_processoDataChange(Sender: TObject; Field: TField);
    procedure qry_nec_li_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_gestao_po: Tdatm_gestao_po;

implementation

uses PGPO023, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_gestao_po.ds_processoStateChange(Sender: TObject);
begin
  if qry_processo_.State in [dsEdit,dsInsert] then
    frm_gestao_po.ConfigBotoes(1)
  else frm_gestao_po.ConfigBotoes(0);
end;

procedure Tdatm_gestao_po.qry_processo_CalcFields(DataSet: TDataSet);
begin
  //numero do processo
  qry_processo_.FieldByName('calcNrProcesso').AsString := Copy(qry_processo_.FieldByName('NR_PROCESSO').AsString, 5, 10);
  //processso cancelado
  if qry_processo_.FieldByName('IN_CANCELADO').AsString = '1' then
    qry_processo_.FieldByName('calcCancelado').AsString := 'Sim'
  else                                                          
    qry_processo_.FieldByName('calcCancelado').AsString := 'Não';
end;

procedure Tdatm_gestao_po.qry_processo_AfterClose(DataSet: TDataSet);
begin
  frm_gestao_po.LimpaEdits;
end;

procedure Tdatm_gestao_po.qry_nec_li_BeforePost(DataSet: TDataSet);
begin
  qry_nec_li_NR_PROCESSO.AsString   := qry_processo_NR_PROCESSO.AsString;
  qry_nec_li_NR_REFERENCIA.AsString := qry_processo_NR_REFERENCIA.AsString;
  if frm_gestao_po.dbchk_incide_li.Checked then
    qry_nec_li_IN_NECESSIDADE_LI.AsString := '1'
  else
    qry_nec_li_IN_NECESSIDADE_LI.AsString := '0';
end;

procedure Tdatm_gestao_po.qry_processo_AfterPost(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpdates;
end;

procedure Tdatm_gestao_po.qry_processo_AfterDelete(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpdates;
end;

procedure Tdatm_gestao_po.ds_nec_liStateChange(Sender: TObject);
begin
  if qry_nec_li_.State in [dsEdit,dsInsert] then
    frm_gestao_po.ConfigBotoes(1)
  else frm_gestao_po.ConfigBotoes(0);
end;

procedure Tdatm_gestao_po.qry_po_AfterDelete(DataSet: TDataSet);
begin
  qry_po_.ApplyUpdates;
end;

procedure Tdatm_gestao_po.qry_po_AfterPost(DataSet: TDataSet);
begin
  qry_po_.ApplyUpdates;
end;

procedure Tdatm_gestao_po.qry_gestao_item_AfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_gestao_po.qry_gestao_item_AfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_gestao_po.ds_gestao_itemStateChange(Sender: TObject);
begin
  if qry_gestao_item_.State in [dsEdit,dsInsert] then
    frm_gestao_po.ConfigBotoes(1)
  else frm_gestao_po.ConfigBotoes(0);
end;

procedure Tdatm_gestao_po.qry_processo_BeforePost(DataSet: TDataSet);
begin
  if frm_gestao_po.ckbox_dados_itens.Checked then
    qry_processo_.FieldByName('IN_DADOS_IGUAIS_ITENS').AsString := '1'
  else
    qry_processo_.FieldByName('IN_DADOS_IGUAIS_ITENS').AsString := '0';
end;

procedure Tdatm_gestao_po.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  frm_gestao_po.vNaoEntrar                := True;
  frm_gestao_po.ckbox_dados_itens.Checked := (qry_processo_.FieldByName('IN_DADOS_IGUAIS_ITENS').AsString = '1');
  frm_gestao_po.pnl_atencao.Visible       := (StrToInt(ConsultaLookupSQL('SELECT COUNT(*) TOTAL FROM TGESTAO_PO_NEC_LI WHERE IN_NECESSIDADE_LI = ''1'' AND NR_REFERENCIA = ''' + frm_gestao_po.msk_nr_referencia.text + '''', 'TOTAL')) > 0);
end;

procedure Tdatm_gestao_po.qry_nec_li_AfterScroll(DataSet: TDataSet);
begin
  if ( qry_nec_li_.FieldByName('IN_NECESSIDADE_LI').AsString = '1' ) then
     frm_gestao_po.pnl_atencao.Visible := true
  else
     frm_gestao_po.pnl_atencao.Visible := false;
//  frm_gestao_po.pnl_atencao.Visible := (StrToInt(ConsultaLookupSQL('SELECT COUNT(*) TOTAL FROM TGESTAO_PO_NEC_LI WHERE IN_NECESSIDADE_LI = ''1'' AND NR_REFERENCIA = ''' + frm_gestao_po.msk_nr_referencia.text + '''', 'TOTAL')) > 0);
end;

procedure Tdatm_gestao_po.ds_processoDataChange(Sender: TObject;
  Field: TField);
begin
  if qry_processo_.State in [dsEdit,dsInsert] then
    frm_gestao_po.ConfigBotoes(1)
  else frm_gestao_po.ConfigBotoes(0);
end;

procedure Tdatm_gestao_po.qry_nec_li_CalcFields(DataSet: TDataSet);
begin
  //mercadoria
  qry_nec_li_.FieldByName('calc_AP_MERCADORIA').AsString := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',qry_nec_li_CD_MERCADORIA.AsString,'AP_MERCADORIA');
  //necessidade de LI
  qry_nec_li_.FieldByName('calc_NEC_LI').AsString := '';
  if ( qry_nec_li_.FieldByName('IN_NECESSIDADE_LI').AsString = '1' ) then
    qry_nec_li_.FieldByName('calc_NEC_LI').AsString    := 'ü';
end;

end.
