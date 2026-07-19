(*************************************************************************************************

Sistema: DDBroker - Indaiá Logística

PROGRAMA: PGSM249.PAS - datm_int_mesquita

AUTOR:

DATA:

Manutenção:

*************************************************************************************************)
unit PGSM249;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_int_mesquita = class(TDataModule)
    ds_int_mesquita005: TDataSource;
    qry_ultimo_: TQuery;
    ds_int_mesquita009: TDataSource;
    qry_int_mesquita005_: TQuery;
    qry_int_mesquita005c_: TQuery;
    qry_int_mesquita009_: TQuery;
    qry_int_mesquita005c_NR_CNPJ: TStringField;
    qry_int_mesquita005c_CH_PRESENCA: TStringField;
    qry_atz_mesquita009_: TQuery;
    qry_atz_mesquita005_: TQuery;
    qry_cd_cliente_: TQuery;
    qry_cd_cliente_CD_EMPRESA: TStringField;
    qry_verif_tprocesso_: TQuery;
    qry_tint_mesquita005_: TQuery;
    ds_tint_mesquita005: TDataSource;
    qry_verif_tprocesso_NR_PROCESSO: TStringField;
    qry_verif_tprocesso_CD_UNID_NEG: TStringField;
    qry_verif_tprocesso_CD_PRODUTO: TStringField;
    qry_verif_tprocesso_CD_CLIENTE: TStringField;
    qry_verif_tprocesso_CD_SERVICO: TStringField;
    qry_verif_tprocesso_CD_USUARIO: TStringField;
    qry_verif_tprocesso_DT_ABERTURA: TDateTimeField;
    qry_verif_tprocesso_CD_RESTRICAO: TStringField;
    qry_verif_tprocesso_CD_LIBERADOR: TStringField;
    qry_verif_tprocesso_DT_LIBERACAO: TDateTimeField;
    qry_verif_tprocesso_IN_CANCELADO: TStringField;
    qry_verif_tprocesso_CD_CANCELADOR: TStringField;
    qry_verif_tprocesso_DT_CANCELAMENTO: TDateTimeField;
    qry_verif_tprocesso_CD_REPRESENTANTE: TStringField;
    qry_verif_tprocesso_NR_PROC_RISC: TStringField;
    qry_verif_tprocesso_NR_PROC_PARCEIRO: TStringField;
    qry_verif_tprocesso_TX_MERCADORIA: TMemoField;
    qry_verif_tprocesso_IN_MERC_PERIGOSA: TStringField;
    qry_verif_tprocesso_TX_OBSERVACOES: TMemoField;
    qry_verif_tprocesso_CD_MOEDA_MLE: TStringField;
    qry_verif_tprocesso_VL_MLE_MNEG: TFloatField;
    qry_verif_tprocesso_VL_MLE_MN: TFloatField;
    qry_verif_tprocesso_CD_MOEDA_FRETE: TStringField;
    qry_verif_tprocesso_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_verif_tprocesso_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_verif_tprocesso_VL_FRETE_MN: TFloatField;
    qry_verif_tprocesso_CD_MOEDA_SEGURO: TStringField;
    qry_verif_tprocesso_VL_SEGURO_MNEG: TFloatField;
    qry_verif_tprocesso_VL_SEGURO_MN: TFloatField;
    qry_verif_tprocesso_CD_AGENTE: TStringField;
    qry_verif_tprocesso_VL_TAXA_FRETE: TFloatField;
    qry_verif_tprocesso_VL_CIF_DOLAR: TFloatField;
    qry_verif_tprocesso_VL_CIF_MN: TFloatField;
    qry_verif_tprocesso_VL_II_MN: TFloatField;
    qry_verif_tprocesso_VL_IPI_MN: TFloatField;
    qry_verif_tprocesso_VL_ICMS_MN: TFloatField;
    qry_verif_tprocesso_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_verif_tprocesso_CD_ARMAZEM_DESCARGA: TStringField;
    qry_verif_tprocesso_CD_ARMAZEM_ESTOCAGEM: TStringField;
    qry_verif_tprocesso_CD_TRANSP_NAC: TStringField;
    qry_verif_tprocesso_CD_EMBARCACAO: TStringField;
    qry_verif_tprocesso_NR_VOO: TStringField;
    qry_verif_tprocesso_NR_CONHECIMENTO: TStringField;
    qry_verif_tprocesso_NR_CONHECIMENTO_MASTER: TStringField;
    qry_verif_tprocesso_CD_PAIS_ORIGEM: TStringField;
    qry_verif_tprocesso_CD_LOCAL_EMBARQUE: TStringField;
    qry_verif_tprocesso_CD_PAIS_DESTINO: TStringField;
    qry_verif_tprocesso_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_verif_tprocesso_NR_DI: TStringField;
    qry_verif_tprocesso_QT_REF_CLIENTE: TIntegerField;
    qry_verif_tprocesso_QT_SOLINUM: TIntegerField;
    qry_verif_tprocesso_QT_RECEBIMENTO: TIntegerField;
    qry_verif_tprocesso_QT_DEVOLUCOES: TIntegerField;
    qry_verif_tprocesso_QT_LANC_FAT: TIntegerField;
    qry_verif_tprocesso_BASE_CALCULO_SDA: TFloatField;
    qry_verif_tprocesso_VL_SDA: TFloatField;
    qry_verif_tprocesso_VL_CONTR_ASSIST: TFloatField;
    qry_verif_tprocesso_DT_DISTRIBUICAO: TDateTimeField;
    qry_verif_tprocesso_CD_DESPACHANTE_SDA: TStringField;
    qry_verif_tprocesso_CD_STATUS_SDA: TStringField;
    qry_verif_tprocesso_VL_FRETE_INTERNO: TFloatField;
    qry_verif_tprocesso_NM_LOCAL_NF_LWW: TStringField;
    qry_verif_tprocesso_DT_CONTABIL_LWW: TDateTimeField;
    qry_verif_tprocesso_TX_OBS_LWW: TMemoField;
    qry_verif_tprocesso_DT_ATRACACAO: TDateTimeField;
    qry_verif_tprocesso_DT_DESCARGA: TDateTimeField;
    qry_verif_tprocesso_DT_ESTOCAGEM: TDateTimeField;
    qry_verif_tprocesso_DT_CONHECIMENTO: TDateTimeField;
    qry_verif_tprocesso_DT_DESEMBARACO: TDateTimeField;
    qry_verif_tprocesso_IN_LIBERADO: TStringField;
    qry_verif_tprocesso_DT_EMBARQUE: TDateTimeField;
    qry_verif_tprocesso_CD_REGIME_TRIB: TStringField;
    qry_verif_tprocesso_IN_CHEQUE_SDA: TStringField;
    qry_verif_tprocesso_IN_LIQUIDADO: TStringField;
    qry_verif_tprocesso_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_verif_tprocesso_IN_PRODUCAO: TStringField;
    qry_verif_tprocesso_NR_DDE: TStringField;
    qry_verif_tprocesso_IN_SDA_PAGO: TStringField;
    qry_verif_tprocesso_TX_OBS_INT: TMemoField;
    qry_verif_tprocesso_CD_CANAL: TStringField;
    qry_verif_tprocesso_IN_URGENTE: TStringField;
    qry_verif_tprocesso_CD_ANALISTA_CLIENTE: TStringField;
    qry_verif_tprocesso_CD_ANALISTA_COMISSARIA: TStringField;
    qry_verif_tprocesso_NR_PRESENCA_CARGA: TStringField;
    qry_verif_tprocesso_DT_PRESENCA_CARGA: TDateTimeField;
    qry_verif_tprocesso_IN_POR_VEICULO: TStringField;
    qry_verif_tprocesso_CD_USUARIO_REPASSA: TStringField;
    qry_verif_tprocesso_NR_VIAGEM: TStringField;
    qry_verif_tprocesso_IN_IMP_ARM: TStringField;
    qry_verif_tprocesso_CD_TRANSP_NAC_DOC: TStringField;
    qry_verif_tprocesso_IN_DI_LIBERADA: TStringField;
    qry_verif_tprocesso_CD_LIBERADOR_DI: TStringField;
    qry_verif_tprocesso_NR_AVERBACAO: TStringField;
    qry_verif_tprocesso_VL_PREMIO_SEGURO: TFloatField;
    qry_verif_tprocesso_TP_BANCO_EXP: TStringField;
    qry_verif_tprocesso_CD_BANCO_EXP: TStringField;
    qry_verif_tprocesso_CD_AGENTE_SEGURO: TStringField;
    qry_verif_tprocesso_VL_COMPL_SDA: TFloatField;
    qry_verif_tprocesso_NR_DA: TStringField;
    qry_verif_tprocesso_CD_CONTATO: TStringField;
    qry_verif_tprocesso_CD_AREA: TStringField;
    qry_verif_tprocesso_NR_MANIFESTO: TStringField;
    qry_verif_tprocesso_NM_CONEXAO: TStringField;
    qry_verif_tprocesso_NR_PROCESSO_EXP_TEMP: TStringField;
    qry_verif_tprocesso_DT_VENC_PROCESSO_EXP_TEMP: TDateTimeField;
    qry_verif_tprocesso_NR_DI_RETORNO: TStringField;
    qry_verif_tprocesso_VL_PESO_LIQUIDO: TFloatField;
    qry_verif_tprocesso_VL_PESO_BRUTO: TFloatField;
    qry_verif_tprocesso_CD_INCOTERM: TStringField;
    qry_verif_tprocesso_NR_PROCESSO_VINC: TStringField;
    qry_verif_tprocesso_TP_MIC_DTA: TStringField;
    qry_verif_tprocesso_TP_DESEMB_MIC_DTA: TStringField;
    qry_verif_tprocesso_CD_UNID_NEG_VINC: TStringField;
    qry_verif_tprocesso_CD_PRODUTO_VINC: TStringField;
    qry_verif_tprocesso_NR_DESPACHO: TStringField;
    qry_verif_tprocesso_DT_CHEGADA: TDateTimeField;
    qry_verif_tprocesso_DT_APRESENTACAO: TDateTimeField;
    qry_verif_tprocesso_DT_CRUZE: TDateTimeField;
    qry_verif_tprocesso_DT_SOL_NUM: TDateTimeField;
    qry_verif_tprocesso_DT_REC_NUM: TDateTimeField;
    qry_verif_tprocesso_DT_RECEB_DOC: TDateTimeField;
    qry_verif_tprocesso_TP_PROCESSO: TStringField;
    qry_verif_tprocesso_NM_ATO_DECLARATORIO: TStringField;
    qry_verif_tprocesso_CD_DESPACHANTE: TStringField;
    qry_verif_tprocesso_DT_REG_DDE: TDateTimeField;
    qry_verif_tprocesso_IN_ETIQUETA: TStringField;
    qry_verif_tprocesso_TP_FRETE: TStringField;
    qry_verif_tprocesso_NR_FATURA: TStringField;
    qry_verif_tprocesso_CD_EMP_EST: TStringField;
    qry_verif_tprocesso_NR_PLACA_VEICULO: TStringField;
    qry_verif_tprocesso_NR_PERIODO_ARMAZENAGEM: TIntegerField;
    qry_verif_tprocesso_DT_VENCTO_ARMAZENAGEM: TDateTimeField;
    qry_verif_tprocesso_VL_FRETE_CUSTO: TFloatField;
    qry_verif_tprocesso_VL_M3: TFloatField;
    qry_verif_tprocesso_CD_IMPORTADOR: TStringField;
    qry_verif_tprocesso_CD_EXPORTADOR: TStringField;
    qry_verif_tprocesso_IN_ENTREPOSTO: TStringField;
    qry_verif_tprocesso_NR_PROCESSO_OR_ENTREPOSTO: TStringField;
    qry_verif_tprocesso_CD_TRANSPORTADOR: TStringField;
    qry_tint_mesquita009_: TQuery;
    ds_tint_mesquita009: TDataSource;
    qry_tprocesso_cntr_: TQuery;
    qry_tp_cntr_: TQuery;
    qry_tp_cntr_TP_CNTR: TStringField;
    qry_tp_cntr_NM_TP_CNTR: TStringField;
    qry_tfollowup_: TQuery;
    qry_tfollowup_DT_REALIZACAO: TDateTimeField;
    qry_int_mesquita005_NR_IDENTIFICADOR: TIntegerField;
    qry_int_mesquita005_NM_CNPJ: TStringField;
    qry_int_mesquita005_NM_NAVIO: TStringField;
    qry_int_mesquita005_NR_VIAGEM: TStringField;
    qry_int_mesquita005_NR_BL: TStringField;
    qry_int_mesquita005_NM_PORTO: TStringField;
    qry_int_mesquita005_NM_ARMADOR: TStringField;
    qry_int_mesquita005_NR_CNPJ: TStringField;
    qry_int_mesquita005_CH_PRESENCA: TStringField;
    qry_int_mesquita005_DT_PRESENCA: TDateTimeField;
    qry_int_mesquita009_NR_IDENTIFICADOR: TIntegerField;
    qry_int_mesquita009_NM_CNPJ: TStringField;
    qry_int_mesquita009_NM_NAVIO: TStringField;
    qry_int_mesquita009_NR_VIAGEM: TStringField;
    qry_int_mesquita009_NR_BL: TStringField;
    qry_int_mesquita009_NM_PORTO: TStringField;
    qry_int_mesquita009_NM_ARMADOR: TStringField;
    qry_int_mesquita009_NR_CNPJ: TStringField;
    qry_int_mesquita009_CH_PRESENCA: TStringField;
    qry_int_mesquita009_NR_CNTR: TStringField;
    qry_int_mesquita009_TP_CNTR: TStringField;
    qry_int_mesquita009_DT_DESOVA: TDateTimeField;
    qry_int_mesquita009_DT_CARREGAMENTO: TDateTimeField;
    qry_int_mesquita009_DT_RET_FABRICA: TDateTimeField;
    qry_int_mesquita009_DT_DEV_CNTR: TDateTimeField;
    qry_int_mesquita009_DT_ATRACACAO: TDateTimeField;
    qry_tint_mesquita009_NR_IDENTIFICADOR: TIntegerField;
    qry_tint_mesquita009_NM_CNPJ: TStringField;
    qry_tint_mesquita009_NM_NAVIO: TStringField;
    qry_tint_mesquita009_NR_VIAGEM: TStringField;
    qry_tint_mesquita009_NR_BL: TStringField;
    qry_tint_mesquita009_NM_PORTO: TStringField;
    qry_tint_mesquita009_NM_ARMADOR: TStringField;
    qry_tint_mesquita009_NR_CNPJ: TStringField;
    qry_tint_mesquita009_CH_PRESENCA: TStringField;
    qry_tint_mesquita009_NR_CNTR: TStringField;
    qry_tint_mesquita009_TP_CNTR: TStringField;
    qry_tint_mesquita009_DT_DESOVA: TDateTimeField;
    qry_tint_mesquita009_DT_CARREGAMENTO: TDateTimeField;
    qry_tint_mesquita009_DT_RET_FABRICA: TDateTimeField;
    qry_tint_mesquita009_DT_DEV_CNTR: TDateTimeField;
    qry_tint_mesquita009_DT_ATRACACAO: TDateTimeField;
    qry_tprocesso_cntr_NR_PROCESSO: TStringField;
    qry_tprocesso_cntr_NR_CNTR: TStringField;
    qry_tprocesso_cntr_DT_ENT_ARM: TDateTimeField;
    qry_tprocesso_cntr_DT_DESOVA: TDateTimeField;
    qry_tprocesso_cntr_DT_DEMURRAGE: TDateTimeField;
    qry_tprocesso_cntr_IN_DESOVA: TStringField;
    qry_tprocesso_cntr_IN_DEMURRAGE: TStringField;
    qry_tprocesso_cntr_NR_LACRE: TStringField;
    qry_tprocesso_cntr_TP_CNTR: TStringField;
    qry_tprocesso_cntr_NR_FREE_TIME: TIntegerField;
    qry_tprocesso_cntr_DRREG: TAutoIncField;
    qry_tprocesso_cntr_IN_REPARO_CNTR: TStringField;
    qry_tprocesso_cntr_IN_PAGTO_EFETIVADO: TBooleanField;
    qry_tprocesso_cntr_NR_CHEQUE_CAUCAO: TStringField;
    qry_tprocesso_cntr_VL_CHEQUE_CAUCAO: TFloatField;
    qry_tprocesso_cntr_DT_EMISSAO_CNTR: TDateTimeField;
    qry_tprocesso_cntr_TX_ESTUFAGEM: TStringField;
    qry_tprocesso_cntr_DT_DEVOLUCAO_CNTR: TDateTimeField;
    qry_tprocesso_cntr_DT_ENT: TDateTimeField;
    qry_tprocesso_cntr_TP_DIAS: TStringField;
    qry_tprocesso_cntr_CD_STATUS_CNTR: TStringField;
    qry_tprocesso_cntr_CD_BANCO_CAUCAO: TStringField;
    qry_tprocesso_cntr_DT_EMISSAO_CAUCAO: TDateTimeField;
    qry_tprocesso_cntr_CD_MOEDA_DEPOSITO: TStringField;
    qry_tprocesso_cntr_TX_DEPOSITO: TFloatField;
    qry_tprocesso_cntr_VL_DEPOSITO: TFloatField;
    qry_tprocesso_cntr_IN_DEPOSITADO: TStringField;
    qry_tprocesso_cntr_IN_DEVOLVIDO: TStringField;
    qry_tprocesso_cntr_IN_AVARIA: TStringField;
    qry_tprocesso_cntr_TX_OBS_AVARIA: TMemoField;
    qry_tprocesso_cntr_VL_AVARIA: TFloatField;
    qry_tprocesso_cntr_IN_LAVAGEM: TStringField;
    qry_tprocesso_cntr_VL_LAVAGEM: TFloatField;
    qry_tprocesso_cntr_DT_ENTREGA_FABRICA: TDateTimeField;
    qry_tprocesso_cntr_DT_RET_CNTR_FABRICA: TDateTimeField;
    qry_tprocesso_cntr_DT_ENTRADA_PATIO_TRANSP: TDateTimeField;
    qry_tprocesso_cntr_DT_CARREGAMENTO: TDateTimeField;
    qry_tint_mesquita005_NR_IDENTIFICADOR: TIntegerField;
    qry_tint_mesquita005_NM_CNPJ: TStringField;
    qry_tint_mesquita005_NM_NAVIO: TStringField;
    qry_tint_mesquita005_NR_VIAGEM: TStringField;
    qry_tint_mesquita005_NR_BL: TStringField;
    qry_tint_mesquita005_NM_PORTO: TStringField;
    qry_tint_mesquita005_NM_ARMADOR: TStringField;
    qry_tint_mesquita005_NR_CNPJ: TStringField;
    qry_tint_mesquita005_CH_PRESENCA: TStringField;
    qry_tint_mesquita005_DT_PRESENCA: TDateTimeField;
    qry_atz_tmesquita009_: TQuery;
    sp_integracao_mesquita: TStoredProc;
    qry_arq_integracao_: TQuery;
    qry_arq_integracao_TX_MOTIVO: TStringField;
    qry_tint_mesquita009_DT_PRESENCA: TDateTimeField;
    qry_tint_mesquita009_DT_ENT_FABRICA: TDateTimeField;
    qry_tint_mesquita009_DT_ENT_PATIO: TDateTimeField;
    qry_tint_mesquita009_TX_OBS_AVARIA: TMemoField;
    qry_int_mesquita009_DT_PRESENCA: TDateTimeField;
    qry_int_mesquita009_DT_ENT_FABRICA: TDateTimeField;
    qry_int_mesquita009_DT_ENT_PATIO: TDateTimeField;
    qry_int_mesquita009_TX_OBS_AVARIA: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_int_mesquita: Tdatm_int_mesquita;

implementation

{$R *.DFM}









end.
