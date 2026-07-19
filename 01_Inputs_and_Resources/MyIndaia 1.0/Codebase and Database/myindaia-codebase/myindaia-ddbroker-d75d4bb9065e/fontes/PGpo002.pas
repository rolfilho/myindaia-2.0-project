unit PGPO002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_po = class(TDataModule)
    qry_po_: TQuery;
    ds_po: TDataSource;
    qry_ref_cli_: TQuery;
    qry_ref_cli_NR_PROCESSO: TStringField;
    qry_ref_cli_NR_SEQUENCIA: TStringField;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    ds_ref_cli_: TDataSource;
    qry_po_lista_: TQuery;
    ds_po_lista: TDataSource;
    ds_po_itens: TDataSource;
    ds_po_nve: TDataSource;
    qry_po_nve_: TQuery;
    qry_po_nve_NR_PROCESSO: TStringField;
    qry_po_nve_NR_ITEM: TStringField;
    qry_po_nve_CD_NIVEL_NVE: TStringField;
    qry_po_nve_CD_ATRIBUTO_NCM: TStringField;
    qry_po_nve_CD_ESPECIF_NCM: TStringField;
    ds_tp_calc_item: TDataSource;
    tbl_tp_calc_item_: TTable;
    tbl_tp_calc_item_CD_TIPO_CALCULO_ITEM: TStringField;
    tbl_tp_calc_item_DESCRICAO: TStringField;
    qry_po_nve_CD_NCM_ATRIBUTO: TStringField;
    qry_po_nve_CD_NCM_ESPECIF: TStringField;
    qry_po_itens_: TQuery;
    qry_tp_modalidade_: TQuery;
    qry_tp_modalidade_CD_MODALIDADE: TStringField;
    qry_tp_modalidade_NM_MODALIDADE: TStringField;
    ds_tp_modalidade: TDataSource;
    qry_po_NR_PROCESSO: TStringField;
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
    qry_po_CD_LOCAL_EMBARQUE: TStringField;
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
    qry_po_DT_ABERTURA: TDateTimeField;
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
    qry_po_CD_SERVICO: TStringField;
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
    qry_po_itens_NR_PROCESSO: TStringField;
    qry_po_itens_NR_ITEM: TStringField;
    qry_po_itens_CD_EXPORTADOR: TStringField;
    qry_po_itens_CD_NALADI_SH: TStringField;
    qry_po_itens_CD_PAIS_AQUISICAO: TStringField;
    qry_po_itens_CD_MERCADORIA: TStringField;
    qry_po_itens_CD_FABRICANTE: TStringField;
    qry_po_itens_CD_PAIS_ORIGEM: TStringField;
    qry_po_itens_CD_NCM_SH: TStringField;
    qry_po_itens_CD_NALADI_NCCA: TStringField;
    qry_po_itens_CD_MET_VALOR_ADUANEIRA: TStringField;
    qry_po_itens_CD_DISP_LEGAL_EXONERA: TStringField;
    qry_po_itens_CD_MOEDA_NEGOCIADA: TStringField;
    qry_po_itens_CD_INCOTERM: TStringField;
    qry_po_itens_CD_ACORDO_ALADI: TStringField;
    qry_po_itens_CD_REG_TRIB_II: TStringField;
    qry_po_itens_CD_FUND_LEGAL_II: TStringField;
    qry_po_itens_CD_UNID_MEDIDA: TStringField;
    qry_po_itens_CD_UNID_MED_II: TStringField;
    qry_po_itens_CD_UNID_MED_IPI: TStringField;
    qry_po_itens_CD_UNID_MED_AD: TStringField;
    qry_po_itens_CD_AGENTE_CAMBIO: TStringField;
    qry_po_itens_CD_MOD_PAGTO: TStringField;
    qry_po_itens_CD_TX_JUROS: TStringField;
    qry_po_itens_CD_INSTITUICAO_FINANC: TStringField;
    qry_po_itens_CD_MOT_SEM_COBERT_CAMBIAL: TStringField;
    qry_po_itens_CD_EX_II: TStringField;
    qry_po_itens_CD_EX_IPI: TStringField;
    qry_po_itens_CD_VIA_TRANSP: TStringField;
    qry_po_itens_CD_PAIS_PROCEDENCIA: TStringField;
    qry_po_itens_CD_URF_ENTRADA: TStringField;
    qry_po_itens_IN_NECESSITA_LI: TBooleanField;
    qry_po_itens_IN_INDICADOR_COND_MERC: TBooleanField;
    qry_po_itens_IN_COND_MERC: TStringField;
    qry_po_itens_IN_APLIC_MERC: TStringField;
    qry_po_itens_NM_ORGAO_EMISSOR_AL_EX_NALADI: TStringField;
    qry_po_itens_NM_AL_EX_NALADI: TStringField;
    qry_po_itens_NM_ORGAO_EMISSOR_AL_NCM: TStringField;
    qry_po_itens_NM_AL_EX_NALADI_NCCA: TStringField;
    qry_po_itens_NM_ORG_EMISSOR_EX_NALADI_NCCA: TStringField;
    qry_po_itens_NM_AL_II: TStringField;
    qry_po_itens_NM_ORGAO_EMISSOR_II: TStringField;
    qry_po_itens_NM_ORGAO_EMISSOR_IPI: TStringField;
    qry_po_itens_NM_AL_IPI: TStringField;
    qry_po_itens_NM_AL_AD: TStringField;
    qry_po_itens_NM_ORGAO_EMISSOR_AD: TStringField;
    qry_po_itens_NM_IDENTIFICACAO: TStringField;
    qry_po_itens_NR_ANO_EMISSAO_AL_EX_NALADI: TStringField;
    qry_po_itens_NR_AL_EX_NALADI: TStringField;
    qry_po_itens_NR_EX_NCM: TStringField;
    qry_po_itens_NR_AL_EX_NCM: TStringField;
    qry_po_itens_NR_ANO_EMISSAO_AL: TStringField;
    qry_po_itens_NR_ATO_LEGAL: TStringField;
    qry_po_itens_NR_EX_NALADI: TStringField;
    qry_po_itens_NR_EX_NALADI_NCCA: TStringField;
    qry_po_itens_NR_ANO_EMISSAO_EX_NALADI_NCCA: TStringField;
    qry_po_itens_NR_AL_EX_NALADI_NCCA: TStringField;
    qry_po_itens_NR_ANO_II: TStringField;
    qry_po_itens_NR_AL_II: TStringField;
    qry_po_itens_NR_ALIQ_NORMAL_II: TStringField;
    qry_po_itens_NR_ALIQ_ACORDO_II: TStringField;
    qry_po_itens_NR_ALIQ_REDUZIDA_II: TStringField;
    qry_po_itens_NR_ALIQ_PERC_RED_II: TStringField;
    qry_po_itens_NR_ANO_IPI: TStringField;
    qry_po_itens_NR_AL_IPI: TStringField;
    qry_po_itens_NR_NOTA_COMPL_IPI: TStringField;
    qry_po_itens_NR_ALIQ_NORMAL_IPI: TStringField;
    qry_po_itens_NR_ALIQ_REDUZIDA_IPI: TStringField;
    qry_po_itens_NR_ALIQ_PERC_RED_IPI: TStringField;
    qry_po_itens_NR_PROC_LI: TStringField;
    qry_po_itens_NR_EX_AD: TStringField;
    qry_po_itens_NR_ANO_AD: TStringField;
    qry_po_itens_NR_AL_AD: TStringField;
    qry_po_itens_NR_ALIQ_AD: TStringField;
    qry_po_itens_NR_BASE_CALC_AD: TFloatField;
    qry_po_itens_NR_PARCELAS: TStringField;
    qry_po_itens_NR_PERIODICIDADE: TStringField;
    qry_po_itens_NR_ROF_BACEN: TStringField;
    qry_po_itens_NR_FATURA: TStringField;
    qry_po_itens_PC_DESCONTO: TFloatField;
    qry_po_itens_PC_ICMS: TFloatField;
    qry_po_itens_PC_ICMS_REDUCAO: TFloatField;
    qry_po_itens_PC_COMISSAO: TFloatField;
    qry_po_itens_PL_ITEM: TFloatField;
    qry_po_itens_QT_INICIAL: TFloatField;
    qry_po_itens_QT_BAIXADA_DI: TFloatField;
    qry_po_itens_QT_BAIXADA_LI: TFloatField;
    qry_po_itens_QT_ESPEC_II: TFloatField;
    qry_po_itens_QT_ESPEC_IPI: TFloatField;
    qry_po_itens_QT_AD: TFloatField;
    qry_po_itens_QT_MED_ESTATISTICA: TFloatField;
    qry_po_itens_TP_CALCULO: TStringField;
    qry_po_itens_TP_COMISSAO: TStringField;
    qry_po_itens_TP_ACORDO_TARIFARIO: TStringField;
    qry_po_itens_TP_TRIBUTACAO_IPI: TStringField;
    qry_po_itens_TP_CAMBIO: TStringField;
    qry_po_itens_TP_IND_TX_JUROS: TBooleanField;
    qry_po_itens_TP_IND_PERIODICIDADE: TStringField;
    qry_po_itens_TP_RECIPIENTE: TStringField;
    qry_po_itens_TP_IND_MULTIMODAL: TStringField;
    qry_po_itens_TX_MERCADORIA: TMemoField;
    qry_po_itens_TX_JUROS_CAMBIO: TFloatField;
    qry_po_itens_VL_DESPESA_MOEDA: TFloatField;
    qry_po_itens_VL_DESCONTO_MOEDA: TFloatField;
    qry_po_itens_VL_UNITARIO: TFloatField;
    qry_po_itens_VL_TOTAL: TFloatField;
    qry_po_itens_VL_DESCONTO: TFloatField;
    qry_po_itens_VL_COMISSAO: TFloatField;
    qry_po_itens_VL_ESPEC_II: TFloatField;
    qry_po_itens_VL_ESPEC_IPI: TFloatField;
    qry_po_itens_VL_ESPEC_AD: TFloatField;
    qry_po_itens_VL_TOTAL_PARCELAS: TFloatField;
    qry_po_itens_VL_COBERT_ACIMA_360: TFloatField;
    qry_po_itens_VL_PAGTO_ANTECIPADO: TFloatField;
    qry_po_itens_VL_PAGTO_AVISTA: TFloatField;
    qry_po_itens_VL_FRETE_NAC_MOEDA: TFloatField;
    qry_po_itens_VL_SEGURO_MOEDA: TFloatField;
    qry_po_itens_VL_ACRESC_MOEDA: TFloatField;
    qry_po_itens_VL_DEDUC_MOEDA: TFloatField;
    qry_po_itens_VL_FRETE_PREPAID_MOEDA: TFloatField;
    qry_po_itens_VL_FRETE_COLLECT: TFloatField;
    qry_po_itens_IN_SELECIONADO: TStringField;
    qry_po_itens_QT_BAIXAR: TFloatField;
    qry_po_itens_QT_DISPONIVEL: TFloatField;
    qry_po_itens_IN_MONTADO: TStringField;
    qry_po_itens_IN_FABR_EXP_PROD: TStringField;
    qry_po_itens_NR_ANO_EX_NCM: TStringField;
    qry_po_itens_NR_NUM_EX_NCM: TStringField;
    qry_po_itens_IN_IND_COND_MERC: TBooleanField;
    qry_po_itens_NM_LOCAL_INCOTERM: TStringField;
    qry_po_itens_NM_TIPO_AL_AD: TStringField;
    qry_po_itens_IN_IND_PERIODICIDADE: TStringField;
    qry_po_itens_IN_REG_TRIB_IPI: TStringField;
    qry_po_itens_QT_INICIAL_EST: TFloatField;
    qry_po_itens_CD_USUARIO_MONTA: TStringField;
    qry_po_itens_CD_MODALIDADE: TStringField;
    qry_po_itens_NR_ATO_DRAWBACK: TStringField;
    qry_po_itens_IN_AVISO_DB: TStringField;
    qry_po_itens_NR_ITEM_CLIENTE: TStringField;
    qry_po_itens_TX_OBSERVACAO: TMemoField;
    qry_po_IN_CALCULADO: TStringField;
    qry_po_DT_CONHECIMENTO: TDateTimeField;
    qry_po_CD_TRANSP_INTERNAC: TStringField;
    qry_po_NR_VIAGEM: TStringField;
    qry_po_DT_VIAGEM: TDateTimeField;
    qry_po_CD_LOCAL_DESTINO: TStringField;
    qry_po_itens_IN_REEIMPORTACAO: TStringField;
    qry_po_lista_NR_PROCESSO: TStringField;
    qry_po_lista_NM_EMPRESA: TStringField;
    qry_po_lista_IN_CALCULADO: TStringField;
    qry_po_lista_CD_IMPORTADOR: TStringField;
    sp_po_apaga_renum_itens: TStoredProc;
    qry_po_itens_CD_AREA: TStringField;
    qry_po_itens_NR_PARCIAL: TIntegerField;
    qry_po_itens_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_po_itens_CD_EMBARCACAO: TStringField;
    qry_po_itens_CD_AGENTE: TStringField;
    qry_po_itens_NR_VIAGEM: TStringField;
    qry_po_itens_NR_VOO: TStringField;
    qry_po_itens_NR_CONHECIMENTO: TStringField;
    qry_po_itens_NR_COURRIER: TStringField;
    qry_po_itens_IN_CONSOLIDADO: TStringField;
    qry_po_itens_IN_URGENTE: TStringField;
    qry_po_itens_IN_SEGURO: TStringField;
    qry_po_itens_CD_MERC_FORNEC: TStringField;
    qry_po_itens_TP_DRAWBACK: TStringField;
    qry_po_itens_DT_ABERTURA_ITEM: TDateTimeField;
    qry_po_itens_calcNR_PARCIAL: TStringField;
    qry_po_lista_CD_EMPRESA: TStringField;
    qry_po_CD_EMPRESA: TStringField;
    qry_po_itens_IN_UTILIZADO_INSTR_DESEMB: TStringField;
    qry_po_itens_ID_CODIGO_INSTR_DESEMB: TStringField;
    qry_po_itens_DT_FATURA: TDateTimeField;
    qry_po_itens_IN_CORRECAO: TStringField;
    qry_po_itens_CD_EMPRESA: TStringField;
    qry_po_nve_CD_EMPRESA: TStringField;
    qry_ref_cli_CD_REF_EXP: TStringField;
    qry_ref_cli_DT_REFERENCIA: TDateTimeField;
    qry_ref_cli_TP_REFERENCIA: TStringField;
    qry_ref_cli_CD_AREA: TStringField;
    qry_ref_cli_NR_ITEM_PO: TStringField;
    qry_ref_cli_NR_PARCIAL: TIntegerField;
    qry_ref_cli_IN_FLAG_LI: TStringField;
    qry_ref_cli_CD_EMPRESA: TStringField;
    qry_po_lista_NM_CLIENTE: TStringField;
    procedure HabilitaEdicao(Sender: TObject);
    procedure AtualizarDisplayItens(DataSet: TDataSet);
    procedure BeforePostRefCli(DataSet: TDataSet);
    procedure qry_po_AfterOpen(DataSet: TDataSet);
    procedure qry_po_AfterClose(DataSet: TDataSet);
    procedure qry_ref_cli_AfterPost(DataSet: TDataSet);
    procedure TirarCalculoseEditou(DataSet: TDataSet);
    procedure qry_po_AfterEdit(DataSet: TDataSet);
    procedure qry_po_nve_BeforePost(DataSet: TDataSet);
    procedure qry_po_itens_CalcFields(DataSet: TDataSet);
    procedure qry_po_itens_AfterScroll(DataSet: TDataSet);
  end;

var
  datm_po: Tdatm_po;
  UN_CALCULO_PROCESSO: String;

implementation

uses PGPO001;

{$R *.DFM}

// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= //
//  30.08.2002                                                               //
//  Reconstruido e otimizado por Eduardo Faraco e Vítor Zanin                //
// =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= //

procedure Tdatm_po.HabilitaEdicao(Sender: TObject);
begin
  // Verificar disponibilidade de edição
  with frm_po do
  begin
    btn_incluir.Enabled     := TDataSource(Sender).DataSet.State = dsBrowse;
    btn_salvar.Enabled      := TDataSource(Sender).DataSet.State in [dsEdit, dsInsert];
    btn_cancelar.Enabled    := TDataSource(Sender).DataSet.State in [dsEdit, dsInsert];
    btn_excluir.Enabled     := (TDataSource(Sender).DataSet.State = dsBrowse) and (TDataSource(Sender).DataSet.RecordCount > 0);
    edt_nr_processo.Enabled := (TDataSource(Sender).DataSet.State = dsInsert);
    if edt_nr_processo.Enabled then
      edt_nr_processo.Color := clWindow
    else
      edt_nr_processo.Color := clBtnFace;
    if TDataSource(Sender).DataSet.State = dsInsert then
    begin
      dbedt_cd_cliente.ReadOnly := False;
      dbedt_cd_cliente.Color    := clWindow;
      btn_co_cliente.Enabled    := True;
    end
    else
    begin
      dbedt_cd_cliente.ReadOnly := True;
      dbedt_cd_cliente.Color    := clBtnFace;
      btn_co_cliente.Enabled    := False;
    end;
    SincronizarMenu;
  end;
end;

procedure Tdatm_po.AtualizarDisplayItens(DataSet: TDataSet);
begin

//  frm_po.PnlDados.Enabled := qry_po_itens_NR_PARCIAL.AsInteger = 0;

  // Atualizar o display do item
{  if qry_po_itens_.Active then
    frm_po.NR_ITEM := qry_po_itens_.FieldByName('NR_ITEM').AsString;
  with frm_po do
  begin
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('SELECT COUNT(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO));
      Open;
      DisplayQT_ITEM := Fields[0].AsInteger;
      Free;
    end;
    if NR_ITEM <> '' then
    begin
       with TQuery.Create(Application) do
       begin
         DataBaseName := 'DBBROKER';
         SQL.ADD('SELECT COUNT(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + ' AND NR_ITEM <= ' + QuotedStr(NR_ITEM));
         Open;
         DisplayNR_ITEM := Fields[0].AsInteger;
         Free;
       end;
    end
    else
      DisplayNR_ITEM := 0;
//    pnl_item.Caption := 'Item ' + FormatFloat('000',DisplayNR_ITEM) + ' / ' + FormatFloat('000',DisplayQT_ITEM);
  end;}
end;

procedure Tdatm_po.BeforePostRefCli(DataSet: TDataSet);
begin
  // Amarrar com o processo
  qry_ref_cli_.FieldByName('NR_PROCESSO').AsString := qry_po_.FieldByName('NR_PROCESSO').AsString;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('SELECT MAX(NR_SEQUENCIA) FROM TREF_CLIENTE WHERE NR_PROCESSO = ' + QuotedStr(qry_ref_cli_.FieldByName('NR_PROCESSO').AsString));
    Open;
    if Fields[0].AsString = '' then
       datm_po.qry_ref_cli_.FieldByName('NR_SEQUENCIA').AsString := '001'
    else
       datm_po.qry_ref_cli_.FieldByName('NR_SEQUENCIA').AsString := FormatFloat('000',Fields[0].AsInteger+1);
    Free;
  end;
end;

procedure Tdatm_po.qry_po_AfterOpen(DataSet: TDataSet);
begin
 // Abrir ref cli, se tiver um numero de processo
  qry_ref_cli_.Close;
  if frm_po.edt_nr_processo.Text <> '' then
  begin
    qry_ref_cli_.Params[0].AsString := frm_po.edt_nr_processo.Text;
    qry_ref_cli_.Open;
  end;
end;

procedure Tdatm_po.qry_po_AfterClose(DataSet: TDataSet);
begin
  // fechar ref cli
  qry_ref_cli_.Close;
end;

procedure Tdatm_po.qry_ref_cli_AfterPost(DataSet: TDataSet);
begin
 // Forçando a atualização na qry_ref_cli_
  qry_ref_cli_.Close;
  qry_ref_cli_.Params[0].AsString := frm_po.edt_nr_processo.Text;
  qry_ref_cli_.Open;
  frm_po.dbgrid1.Refresh;
end;


procedure Tdatm_po.TirarCalculoseEditou(DataSet: TDataSet);
begin
  if UN_CALCULO_PROCESSO <> '' then
  begin
     with TQuery.Create(Application) do
     begin
       DataBaseName := 'DBBROKER';
       SQL.ADD('UPDATE TPO SET IN_CALCULADO = ' + QuotedStr('0') + ' WHERE NR_PROCESSO = ' + QuotedStr(UN_CALCULO_PROCESSO));
       ExecSQL;
       Free;
     end;
  end;
  UN_CALCULO_PROCESSO := '';
end;

procedure Tdatm_po.qry_po_AfterEdit(DataSet: TDataSet);
begin
  UN_CALCULO_PROCESSO := DataSet.FieldByName('NR_PROCESSO').ASString;
end;

procedure Tdatm_po.qry_po_nve_BeforePost(DataSet: TDataSet);
begin
  qry_po_nve_NR_ITEM.AsString := qry_po_itens_NR_ITEM.AsString;
  qry_po_nve_NR_PROCESSO.AsString := qry_po_itens_NR_PROCESSO.AsString;
end;

procedure Tdatm_po.qry_po_itens_CalcFields(DataSet: TDataSet);
begin
  if qry_po_itens_NR_PARCIAL.AsInteger = 0 then
    qry_po_itens_calcNR_PARCIAL.AsString := 'S'
  else
    qry_po_itens_calcNR_PARCIAL.AsString := qry_po_itens_NR_PARCIAL.AsString;
end;

procedure Tdatm_po.qry_po_itens_AfterScroll(DataSet: TDataSet);
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.ADD('SELECT count(*) cont FROM TPO_ITEM (NOLOCK) ');
    SQL.ADD('WHERE');
    SQL.ADD('   NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE AND NR_PROCESSO =:NR_PROCESSO AND NR_PARCIAL <> 0');
    ParamByName('NR_PROCESSO').AsString := qry_po_itens_NR_PROCESSO.AsString;
    ParamByName('NR_ITEM_CLIENTE').AsString := qry_po_itens_NR_ITEM_CLIENTE.AsString;
    Open;
    if FieldByName('cont').AsInteger > 0 then
    begin
      frm_po.HabilitaCampos(False);
      if qry_po_itens_NR_PARCIAL.AsInteger = 0 then
      begin
        frm_po.dbedt_qt_mercadoria.Color    := clWindow;
        frm_po.dbedt_qt_mercadoria.ReadOnly := False;
      end;
    end
    else
      frm_po.HabilitaCampos(True);
    Free;
  end;
end;

end.
