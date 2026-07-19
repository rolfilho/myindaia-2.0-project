unit Integracao;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TdtmIntegracao = class(TDataModule)
    qryDespesaDE: TADOQuery;
    qryDespesaDETP_REGISTRO: TStringField;
    qryDespesaDENR_PROCESSO: TStringField;
    qryDespesaDEDT_PAGTO: TStringField;
    qryDespesaDECD_DESPESA: TStringField;
    qryDespesaDECD_DESPESA_INDAIA: TWideStringField;
    qryDespesaDEVL_DESPESA: TFMTBCDField;
    qryDespesaDENM_ITEM: TWideStringField;
    qryDespesaDEPAGTO_EF_PREV: TStringField;
    qryDespesaDEDESP_IMP: TStringField;
    qryDespesaDEADIANTAMENTO: TStringField;
    qryDespesaDEFILLER: TStringField;
    qryDespesaDI: TADOQuery;
    qryDespesaDITP_REGISTRO_DI: TStringField;
    qryDespesaDInr_processo: TStringField;
    qryDespesaDIDT_CHEGADA: TStringField;
    qryDespesaDINR_REGISTRO_DI: TStringField;
    qryDespesaDIDT_RECEBIMENTO_DOCTOS: TStringField;
    qryDespesaDICD_DESPACHANTE: TStringField;
    qryDespesaDICD_AGENTE: TStringField;
    qryDespesaDIDT_PAGTO_IMPOSTO: TStringField;
    qryDespesaDITX_MERCADORIA: TFloatField;
    qryDespesaDIDT_DESEMBARACO: TStringField;
    qryDespesaDICD_MOEDA_FRETE: TStringField;
    qryDespesaDIVL_FRETE_MOEDA: TFloatField;
    qryDespesaDITX_FRETE: TFloatField;
    qryDespesaDIVL_SEGURO_MOEDA: TFloatField;
    qryDespesaDICD_MOEDA_SEGURO: TStringField;
    qryDespesaDITX_SEGURO: TFloatField;
    qryDespesaDITX_DOLAR: TFloatField;
    qryDespesaDIREF_CLIENTE: TStringField;
    qryDespesaDINR_MASTER: TStringField;
    qryDespesaDITP_DECLARACAO: TStringField;
    qryDespesaDIURF_DESPACHO: TStringField;
    qryDespesaDIURF_ENTRADA: TStringField;
    qryDespesaDICD_RECINTO_ALFAND: TStringField;
    qryDespesaDIMODALIDADE_DESPACHO: TStringField;
    qryDespesaDITP_CONHECIMENTO: TStringField;
    qryDespesaDITP_DOCUMENTO: TStringField;
    qryDespesaDIUTILIZACAO: TStringField;
    qryDespesaDINR_IDENTIFICACAO: TStringField;
    qryDespesaDIPESO_BRUTO: TFloatField;
    qryDespesaDITOT_FOB_MOEDA: TFloatField;
    qryDespesaDINR_FATURA_SERVICO: TIntegerField;
    qryDespesaDINR_NOTA_FISCAL_ENTRADA: TStringField;
    qryDespesaDIDT_NOTA_FISCAL_ENTRADA: TStringField;
    qryDespesaDIVL_TOT_NOTA_FISCAL_ENTRADA: TFloatField;
    qryDespesaDIDT_ENTREGA_MERC: TStringField;
    qryDespesaDIDT_REGISTRO_DI: TStringField;
    qryDespesaDIVL_FRETE_COLLECT_MNEG: TFloatField;
    qryDespesaDIVL_FRETE_TERR_NACIONAL: TFloatField;
    qryDespesaDIOBS: TStringField;
    qryDespesaDILOCAL_DESEMBARACO: TStringField;
    qryDespesaDIUF_DESEMBARACO: TStringField;
    qryDespesaDITP_REGISTRO_TX: TStringField;
    qryDespesaDINR_PROCESSO_1: TStringField;
    qryDespesaDICD_MOEDA: TStringField;
    qryDespesaDITX_MOEDA: TFloatField;
    qryDespesaDIref_cliente_doc: TStringField;
    dspDespesaDE: TDataSetProvider;
    dspDespesaDI: TDataSetProvider;
    dsDespesaDE: TDataSource;
    cds_despesas_de: TClientDataSet;
    cds_despesas_deTP_REGISTRO: TStringField;
    cds_despesas_deNR_PROCESSO: TStringField;
    cds_despesas_deDT_PAGTO: TStringField;
    cds_despesas_deCD_DESPESA: TStringField;
    cds_despesas_deCD_DESPESA_INDAIA: TWideStringField;
    cds_despesas_deVL_DESPESA: TFMTBCDField;
    cds_despesas_deNM_ITEM: TWideStringField;
    cds_despesas_dePAGTO_EF_PREV: TStringField;
    cds_despesas_deDESP_IMP: TStringField;
    cds_despesas_deADIANTAMENTO: TStringField;
    cds_despesas_deFILLER: TStringField;
    cds_despesas_di: TClientDataSet;
    dsDespesaDI: TDataSource;
    cds_despesas_diTP_REGISTRO_DI: TStringField;
    cds_despesas_dinr_processo: TStringField;
    cds_despesas_diDT_CHEGADA: TStringField;
    cds_despesas_diNR_REGISTRO_DI: TStringField;
    cds_despesas_diDT_RECEBIMENTO_DOCTOS: TStringField;
    cds_despesas_diCD_DESPACHANTE: TStringField;
    cds_despesas_diCD_AGENTE: TStringField;
    cds_despesas_diDT_PAGTO_IMPOSTO: TStringField;
    cds_despesas_diTX_MERCADORIA: TFloatField;
    cds_despesas_diDT_DESEMBARACO: TStringField;
    cds_despesas_diCD_MOEDA_FRETE: TStringField;
    cds_despesas_diVL_FRETE_MOEDA: TFloatField;
    cds_despesas_diTX_FRETE: TFloatField;
    cds_despesas_diVL_SEGURO_MOEDA: TFloatField;
    cds_despesas_diCD_MOEDA_SEGURO: TStringField;
    cds_despesas_diTX_SEGURO: TFloatField;
    cds_despesas_diTX_DOLAR: TFloatField;
    cds_despesas_diREF_CLIENTE: TStringField;
    cds_despesas_diNR_MASTER: TStringField;
    cds_despesas_diTP_DECLARACAO: TStringField;
    cds_despesas_diURF_DESPACHO: TStringField;
    cds_despesas_diURF_ENTRADA: TStringField;
    cds_despesas_diCD_RECINTO_ALFAND: TStringField;
    cds_despesas_diMODALIDADE_DESPACHO: TStringField;
    cds_despesas_diTP_CONHECIMENTO: TStringField;
    cds_despesas_diTP_DOCUMENTO: TStringField;
    cds_despesas_diUTILIZACAO: TStringField;
    cds_despesas_diNR_IDENTIFICACAO: TStringField;
    cds_despesas_diPESO_BRUTO: TFloatField;
    cds_despesas_diTOT_FOB_MOEDA: TFloatField;
    cds_despesas_diNR_FATURA_SERVICO: TIntegerField;
    cds_despesas_diNR_NOTA_FISCAL_ENTRADA: TStringField;
    cds_despesas_diDT_NOTA_FISCAL_ENTRADA: TStringField;
    cds_despesas_diVL_TOT_NOTA_FISCAL_ENTRADA: TFloatField;
    cds_despesas_diDT_ENTREGA_MERC: TStringField;
    cds_despesas_diDT_REGISTRO_DI: TStringField;
    cds_despesas_diVL_FRETE_COLLECT_MNEG: TFloatField;
    cds_despesas_diVL_FRETE_TERR_NACIONAL: TFloatField;
    cds_despesas_diOBS: TStringField;
    cds_despesas_diLOCAL_DESEMBARACO: TStringField;
    cds_despesas_diUF_DESEMBARACO: TStringField;
    cds_despesas_diTP_REGISTRO_TX: TStringField;
    cds_despesas_diNR_PROCESSO_1: TStringField;
    cds_despesas_diCD_MOEDA: TStringField;
    cds_despesas_diTX_MOEDA: TFloatField;
    cds_despesas_diref_cliente_doc: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmIntegracao: TdtmIntegracao;

implementation

{$R *.dfm}

uses
  DadosFaturamentoERP;

end.
