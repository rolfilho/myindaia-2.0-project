unit uGestaoPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBCtrls, Grids, DBGrids, StdCtrls, Mask, ExtCtrls, DateUtils,
  ComCtrls, Buttons, Funcoes, ConsOnLineEx, DB, DBTables, ToolEdit, ComObj, StrUtils,
  dbcgrids, GSMLIB, RxDBComb;

type
  TfrmGestaoPedido = class(TForm)
    pnlGestaoCadastro: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnProcRealiza: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnManutPedido: TSpeedButton;
    pnlAtencaoLI: TPanel;
    lblAtencaoLI: TLabel;
    pgctrlGestaoPedido: TPageControl;
    tsPedido: TTabSheet;
    lblUnidade: TLabel;
    btnConsultaUnidade: TSpeedButton;
    lblProduto: TLabel;
    btnConsultaProduto: TSpeedButton;
    mskCodigoUnidade: TMaskEdit;
    edtNomeUnidade: TEdit;
    mskCodigoProduto: TMaskEdit;
    edtNomeProduto: TEdit;
    tsDadosBasicos: TTabSheet;
    lblNrPedido1: TLabel;
    lblNrProcesso1: TLabel;
    lblContato: TLabel;
    btnConsultaContato: TSpeedButton;
    lblAnalista: TLabel;
    btnConsultaAnalista: TSpeedButton;
    lblTipoPedido: TLabel;
    lblNrOrdem: TLabel;
    lblIncoterm: TLabel;
    shpDadosBasicos: TShape;
    lblLocalDesembarque: TLabel;
    btnConsultaLocalDesembarque: TSpeedButton;
    lblEmbarcacao: TLabel;
    btnConsultaEmbarcacao: TSpeedButton;
    lblNrViagem: TLabel;
    btnConsultaNrViagem: TSpeedButton;
    lblNrVoo: TLabel;
    lblNrConhecimento: TLabel;
    shpDadosIguaisItem: TShape;
    dbedtNrPedido: TDBEdit;
    dbedtNrProcesso: TDBEdit;
    edtNomeContato: TEdit;
    edtNomeAnalista: TEdit;
    dblckTipoPedido: TDBLookupComboBox;
    dbedtNrOrdem: TDBEdit;
    dblckIncoterm: TDBLookupComboBox;
    dbedtCodigoContato: TDBEdit;
    dbedtCodigoAnalista: TDBEdit;
    edtNomeLocalDesembarque: TEdit;
    edtNomeEmbarcacao: TEdit;
    dbedtNrViagem: TDBEdit;
    dbedtNrVoo: TDBEdit;
    dbedtNrConhecimento: TDBEdit;
    dbedtCodigoLocalDesembarque: TDBEdit;
    dbedtCodigoEmbarcacao: TDBEdit;
    tsPedidoItem: TTabSheet;
    pgctrlItem: TPageControl;
    tsGestao: TTabSheet;
    shp10: TShape;
    lblLocalDesembarqueItem: TLabel;
    btnConsultaLocalDesembarqueItem: TSpeedButton;
    lblEmbarcacaoItem: TLabel;
    btnConsultaEmbarcacaoItem: TSpeedButton;
    lblNrViagemItem: TLabel;
    btnConsultaNrViagemItem: TSpeedButton;
    lblNrVooItem: TLabel;
    lblNrConhecimentoItem: TLabel;
    edtNomeLocalDesembarqueItem: TEdit;
    edtNomeEmbarcacaoItem: TEdit;
    dbedtNrViagemItem: TDBEdit;
    dbedtNrVooItem: TDBEdit;
    dbedtNrConhecimentoItem: TDBEdit;
    dbedtCodigoLocalDesembarqueItem: TDBEdit;
    dbedtCodigoEmbarcacaoItem: TDBEdit;
    tsAnalise: TTabSheet;
    dbgrdNecessitaLI: TDBGrid;
    mmGestaoPedido: TMainMenu;
    mniIncluir: TMenuItem;
    mniSalvar: TMenuItem;
    mniCancelar: TMenuItem;
    mniExcluir: TMenuItem;
    mniProcRealiza: TMenuItem;
    mniManutPedido: TMenuItem;
    mniSair: TMenuItem;
    dsPo: TDataSource;
    dsProcesso: TDataSource;
    qryPo: TQuery;
    qryProcesso: TQuery;
    updPo: TUpdateSQL;
    updProcesso: TUpdateSQL;
    qryClienteHabilitacao: TQuery;
    qryClienteHabilitacaoCD_CLIENTE: TStringField;
    qryClienteHabilitacaoCD_UNID_NEG: TStringField;
    qryClienteHabilitacaoCD_PRODUTO: TStringField;
    qryClienteHabilitacaoIN_ATIVO: TStringField;
    qryClienteHabilitacaoIN_RESTRICAO: TStringField;
    qryClienteHabilitacaoDT_VALID_CRED_RF: TDateTimeField;
    qryClienteHabilitacaoIN_COMPRADOR: TBooleanField;
    qryClienteHabilitacaoNM_EMPRESA: TStringField;
    qryClienteHabilitacaoCD_GRUPO: TStringField;
    qryClienteHabilitacaoIN_IMPORTADOR: TBooleanField;
    qryClienteServico: TQuery;
    qryClienteServicoCD_CLIENTE: TStringField;
    qryClienteServicoCD_UNID_NEG: TStringField;
    qryClienteServicoCD_PRODUTO: TStringField;
    qryClienteServicoCD_SERVICO: TStringField;
    qryClienteServicoCD_PREFIXO: TStringField;
    qryClienteServicoIN_ATIVO: TStringField;
    qryClienteServicoDT_CAPTACAO: TDateTimeField;
    qryClienteServicoPZ_PROPOSTA: TIntegerField;
    dsPoItem: TDataSource;
    qryPoItem: TQuery;
    updPoItem: TUpdateSQL;
    qryProcessoNR_PROCESSO: TStringField;
    qryProcessoNR_REFERENCIA: TStringField;
    qryProcessoCD_UNID_NEG: TStringField;
    qryProcessoCD_PRODUTO: TStringField;
    qryProcessoCD_CLIENTE: TStringField;
    qryProcessoCD_SERVICO: TStringField;
    qryProcessoCD_USUARIO: TStringField;
    qryProcessoDT_ABERTURA: TDateTimeField;
    qryProcessoHR_ABERTURA: TDateTimeField;
    qryProcessoDT_PEDIDO: TDateTimeField;
    qryProcessoHR_PEDIDO: TDateTimeField;
    qryProcessoCD_IMPORTADOR: TStringField;
    qryProcessoCD_EXPORTADOR: TStringField;
    qryProcessoCD_AREA: TStringField;
    qryProcessoCD_ANALISTA_COMISSARIA: TStringField;
    qryProcessoCD_ANALISTA_CLIENTE: TStringField;
    qryProcessoCD_INCOTERM: TStringField;
    qryProcessoNR_ORDEM: TStringField;
    qryProcessoNR_VOO: TStringField;
    qryProcessoNR_VIAGEM: TStringField;
    qryProcessoCD_LOCAL_DESEMBARQUE: TStringField;
    qryProcessoCD_EMBARCACAO: TStringField;
    qryProcessoNR_CONHECIMENTO: TStringField;
    qryProcessoCD_TP_PEDIDO: TStringField;
    qryProcessoIN_CANCELADO: TStringField;
    qryProcessoIN_LIBERADO: TStringField;
    qryProcessoIN_CONSOLIDADO: TStringField;
    qryProcessoIN_SEGURO: TStringField;
    qryProcessoIN_URGENTE: TStringField;
    qryProcessoIN_DADOS_IGUAIS_ITENS: TStringField;
    qryProcessoCD_GRUPO: TStringField;
    qryPoNR_PROCESSO: TStringField;
    qryPoCD_IMPORTADOR: TStringField;
    qryPoCD_EXPORTADOR: TStringField;
    qryPoCD_VIA_TRANSP: TStringField;
    qryPoCD_PAIS_ORIGEM: TStringField;
    qryPoCD_INCOTERM: TStringField;
    qryPoIN_SEGURO: TStringField;
    qryPoNR_DOC_HOUSE: TStringField;
    qryPoCD_AREA: TStringField;
    qryPoCD_LOCAL_DESEMBARQUE: TStringField;
    qryPoNR_ORDEM: TStringField;
    qryPoDT_ABERTURA: TDateTimeField;
    qryPoCD_SERVICO: TStringField;
    qryPoNR_VIAGEM: TStringField;
    sp_atz_ev_flp_po: TStoredProc;
    qryProcessocalcNrProcesso: TStringField;
    lblCliente: TLabel;
    edtNomeCliente: TEdit;
    btnConsultaCliente: TSpeedButton;
    lblServico: TLabel;
    edtNomeServico: TEdit;
    btnConsultaServico: TSpeedButton;
    btnAtualizaServico: TSpeedButton;
    lblNrPedido: TLabel;
    mskNrPedido: TMaskEdit;
    lblNrProcesso: TLabel;
    btnConsultaPedido: TSpeedButton;
    mskNrProcesso: TMaskEdit;
    btnConsultaProcesso: TSpeedButton;
    chkUltimosProcessos: TCheckBox;
    bvlPedido: TBevel;
    dbedtCodigoServico: TDBEdit;
    lblArea: TLabel;
    dbedtCodigoArea: TDBEdit;
    edtNomeArea: TEdit;
    btnConsultaArea: TSpeedButton;
    lblNomeUnidade: TLabel;
    lblNomeProduto: TLabel;
    dbedtNomeUnidade: TDBEdit;
    dbedtNomeProduto: TDBEdit;
    dbedtDataAbertura: TDBEdit;
    lblDataAbertura1: TLabel;
    qryProcessocalcNomeUnidade: TStringField;
    qryProcessocalcNomeProduto: TStringField;
    qryProcessocalcModalidade: TStringField;
    qryTipoPedido: TQuery;
    qryIncoterm: TQuery;
    dsIncoterm: TDataSource;
    dsTipoPedido: TDataSource;
    qryPoItemNR_ITEM_CLIENTE: TStringField;
    qryPoItemCD_MERCADORIA: TStringField;
    qryPoItemCD_NCM_SH: TStringField;
    qryPoItemQT_INICIAL: TFloatField;
    qryPoItemIN_NECESSITA_LI: TBooleanField;
    qryPoItemNR_PROCESSO: TStringField;
    qryPoItemNR_ITEM: TStringField;
    qryPoItemCD_AREA: TStringField;
    qryPoItemcalcNomeArea: TStringField;
    qryPoItemcalcMercadoria: TStringField;
    qryPoItemcalcNecessitaLI: TStringField;
    lblImportador: TLabel;
    dbedtCodigoImportador: TDBEdit;
    edtNomeImportador: TEdit;
    btnConsultaImportador: TSpeedButton;
    lblExportador: TLabel;
    dbedtCodigoExportador: TDBEdit;
    edtNomeExportador: TEdit;
    btnConsultaExportador: TSpeedButton;
    lblAgenteCarga: TLabel;
    dbedtCodigoAgenteCarga: TDBEdit;
    edtNomeAgenteCarga: TEdit;
    btnConsultaAgenteCarga: TSpeedButton;
    qryProcessoCD_AGENTE: TStringField;
    lblNrCourrier: TLabel;
    dbedtNrCourrier: TDBEdit;
    qryProcessoNR_COURRIER: TStringField;
    dbchkInConsolidado: TDBCheckBox;
    dbchkInUrgente: TDBCheckBox;
    dbchkInSeguro: TDBCheckBox;
    dbchkInConsolidadoItem: TDBCheckBox;
    dbchkInUrgenteItem: TDBCheckBox;
    dbchkInSeguroItem: TDBCheckBox;
    qryPoItemCD_LOCAL_DESEMBARQUE: TStringField;
    qryPoItemCD_EMBARCACAO: TStringField;
    qryPoItemCD_AGENTE: TStringField;
    qryPoItemNR_VIAGEM: TStringField;
    qryPoItemNR_VOO: TStringField;
    qryPoItemNR_CONHECIMENTO: TStringField;
    qryPoItemNR_COURRIER: TStringField;
    qryPoItemIN_CONSOLIDADO: TStringField;
    qryPoItemIN_URGENTE: TStringField;
    qryPoItemIN_SEGURO: TStringField;
    dbchkInDadosIguaisItem: TDBCheckBox;
    bvlDadosBasicos: TBevel;
    lblAreaItem: TLabel;
    dbedtCodigoAreaItem: TDBEdit;
    edtNomeAreaItem: TEdit;
    btnConsultaAreaItem: TSpeedButton;
    dbnavItemPedido: TDBNavigator;
    lblNrItemAnalise: TLabel;
    dbedtNrItemCliente: TDBEdit;
    lblPartNumber: TLabel;
    dbedtCodigoMercadoria: TDBEdit;
    edtApelidoMercadoria: TEdit;
    btnConsultaMercadoria: TSpeedButton;
    lblEmbalagem: TLabel;
    dbedtCodigoNcmSh: TDBEdit;
    dbchkIncideLI: TDBCheckBox;
    lblQuantidade: TLabel;
    dbedtQtdeMercadoria: TDBEdit;
    lblTipoCalculo: TLabel;
    dblckTipoCalculoItem: TDBLookupComboBox;
    lblDataPedido1: TLabel;
    dbedtDataPedido: TDBEdit;
    lblPedidoCriado: TLabel;
    txtNrPedido: TStaticText;
    lblProcessoCriado: TLabel;
    txtNrProcesso: TStaticText;
    lblAgenteCargaItem: TLabel;
    dbedtCodigoAgenteCargaItem: TDBEdit;
    edtNomeAgenteCargaItem: TEdit;
    btnConsultaAgenteCargaItem: TSpeedButton;
    lblNrCourrierItem: TLabel;
    dbedtNrCourrierItem: TDBEdit;
    dsTipoCalculoItem: TDataSource;
    sp_po_apaga_renum_itens: TStoredProc;
    qryTipoCalculoItem: TQuery;
    qryPoItemTP_CALCULO: TStringField;
    lblValorUnitario: TLabel;
    dbedtValorUnitario: TDBEdit;
    qryPoItemVL_UNITARIO: TFloatField;
    qryPoItemPL_ITEM: TFloatField;
    qryPoItemCD_UNID_MEDIDA: TStringField;
    qryPoItemCD_NALADI_SH: TStringField;
    qryPoItemCD_NALADI_NCCA: TStringField;
    qryPoItemCD_FABRICANTE: TStringField;
    qryPoItemCD_PAIS_ORIGEM: TStringField;
    lblValorItem: TLabel;
    dbedtValorItem: TDBEdit;
    qryPoItemVL_TOTAL: TFloatField;
    qryPoItemPC_DESCONTO: TFloatField;
    qryPoItemVL_DESCONTO: TFloatField;
    qryPoItemIN_REEIMPORTACAO: TStringField;
    qryPoItemQT_BAIXADA_DI: TFloatField;
    qryPoItemQT_BAIXADA_LI: TFloatField;
    qryPoItemIN_MONTADO: TStringField;
    qryPoItemCD_EXPORTADOR: TStringField;
    qryPoItemCD_PAIS_AQUISICAO: TStringField;
    qryPoItemIN_FABR_EXP_PROD: TStringField;
    qryPoCD_PAIS_AQUISICAO: TStringField;
    qryPoCD_FABRICANTE: TStringField;
    qryPoIN_FABR_EXPOR_IMP: TStringField;
    qryPoItemTX_MERCADORIA: TMemoField;
    btnRepassaItens: TSpeedButton;
    sp_atz_ev_flp_po_item: TStoredProc;
    bvlSeparador: TBevel;
    lblUnidMedida: TLabel;
    dbedtCodigoUnidMed: TDBEdit;
    edtNomeUnidMed: TEdit;
    btnConsultaUnidMed: TSpeedButton;
    lblNumeroInvoice: TLabel;
    dbedtNrFatura: TDBEdit;
    dbrgTpDrawback: TDBRadioGroup;
    qryProcessoNR_REF_EXPORTADOR: TStringField;
    lblNrRefExportador: TLabel;
    dbedtNrRefExportador: TDBEdit;
    qryPoItemTP_DRAWBACK: TStringField;
    qryPoItemNR_FATURA: TStringField;
    shpNavigator: TShape;
    lblCodMercFornec: TLabel;
    dbedtCodMercFornec: TDBEdit;
    Label1: TLabel;
    btn_moeda_negociada: TSpeedButton;
    dbedt_moeda_negociada: TDBEdit;
    edt_moeda_negociada: TEdit;
    qryPoItemCD_MOEDA_NEGOCIADA: TStringField;
    tsIntegracao: TTabSheet;
    btnExecuta: TSpeedButton;
    edtPath: TEdit;
    lbl1: TLabel;
    btnDialog: TSpeedButton;
    lblAviso: TLabel;
    lblSimbolo: TLabel;
    dlgOpen: TOpenDialog;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    lstResultado: TListBox;
    pbStatus: TProgressBar;
    lblStatus: TLabel;
    btnSalvarLog: TSpeedButton;
    dbedtCodPaisOrigem: TDBEdit;
    lblPaisOrigem: TLabel;
    edtNmPaisOrigem: TEdit;
    btnConsultaPaisOrigem: TSpeedButton;
    qryProcessoCD_PAIS_ORIGEM: TStringField;
    lblPaisOrigemItem: TLabel;
    dbedtCodPaisOrigemItem: TDBEdit;
    edtNmPaisOrigemItem: TEdit;
    btnConsultaPaisOrigemItem: TSpeedButton;
    qryPoItemNR_PARCIAL: TIntegerField;
    BtnBaixa: TSpeedButton;
    qryPoItemQT_DISPONIVEL: TFloatField;
    Panel1: TPanel;
    qryPoItemParciais: TQuery;
    dtsPoItemParciais: TDataSource;
    qryPoItemParciaisNR_PROCESSO: TStringField;
    qryPoItemParciaisNR_ITEM: TStringField;
    qryPoItemParciaisNR_PARCIAL: TIntegerField;
    qryPoItemParciaisCD_EXPORTADOR: TStringField;
    qryPoItemParciaisCD_NALADI_SH: TStringField;
    qryPoItemParciaisCD_PAIS_AQUISICAO: TStringField;
    qryPoItemParciaisCD_MERCADORIA: TStringField;
    qryPoItemParciaisCD_FABRICANTE: TStringField;
    qryPoItemParciaisCD_PAIS_ORIGEM: TStringField;
    qryPoItemParciaisCD_NCM_SH: TStringField;
    qryPoItemParciaisCD_NALADI_NCCA: TStringField;
    qryPoItemParciaisCD_MET_VALOR_ADUANEIRA: TStringField;
    qryPoItemParciaisCD_DISP_LEGAL_EXONERA: TStringField;
    qryPoItemParciaisCD_MOEDA_NEGOCIADA: TStringField;
    qryPoItemParciaisCD_INCOTERM: TStringField;
    qryPoItemParciaisCD_ACORDO_ALADI: TStringField;
    qryPoItemParciaisCD_REG_TRIB_II: TStringField;
    qryPoItemParciaisCD_FUND_LEGAL_II: TStringField;
    qryPoItemParciaisCD_UNID_MEDIDA: TStringField;
    qryPoItemParciaisCD_UNID_MED_II: TStringField;
    qryPoItemParciaisCD_UNID_MED_IPI: TStringField;
    qryPoItemParciaisCD_UNID_MED_AD: TStringField;
    qryPoItemParciaisCD_AGENTE_CAMBIO: TStringField;
    qryPoItemParciaisCD_MOD_PAGTO: TStringField;
    qryPoItemParciaisCD_TX_JUROS: TStringField;
    qryPoItemParciaisCD_INSTITUICAO_FINANC: TStringField;
    qryPoItemParciaisCD_MOT_SEM_COBERT_CAMBIAL: TStringField;
    qryPoItemParciaisCD_EX_II: TStringField;
    qryPoItemParciaisCD_EX_IPI: TStringField;
    qryPoItemParciaisCD_VIA_TRANSP: TStringField;
    qryPoItemParciaisCD_PAIS_PROCEDENCIA: TStringField;
    qryPoItemParciaisCD_URF_ENTRADA: TStringField;
    qryPoItemParciaisIN_NECESSITA_LI: TBooleanField;
    qryPoItemParciaisIN_INDICADOR_COND_MERC: TBooleanField;
    qryPoItemParciaisIN_COND_MERC: TStringField;
    qryPoItemParciaisIN_APLIC_MERC: TStringField;
    qryPoItemParciaisNM_ORGAO_EMISSOR_AL_EX_NALADI: TStringField;
    qryPoItemParciaisNM_AL_EX_NALADI: TStringField;
    qryPoItemParciaisNM_ORGAO_EMISSOR_AL_NCM: TStringField;
    qryPoItemParciaisNM_AL_EX_NALADI_NCCA: TStringField;
    qryPoItemParciaisNM_ORG_EMISSOR_EX_NALADI_NCCA: TStringField;
    qryPoItemParciaisNM_AL_II: TStringField;
    qryPoItemParciaisNM_ORGAO_EMISSOR_II: TStringField;
    qryPoItemParciaisNM_ORGAO_EMISSOR_IPI: TStringField;
    qryPoItemParciaisNM_AL_IPI: TStringField;
    qryPoItemParciaisNM_AL_AD: TStringField;
    qryPoItemParciaisNM_ORGAO_EMISSOR_AD: TStringField;
    qryPoItemParciaisNM_IDENTIFICACAO: TStringField;
    qryPoItemParciaisNR_ANO_EMISSAO_AL_EX_NALADI: TStringField;
    qryPoItemParciaisNR_AL_EX_NALADI: TStringField;
    qryPoItemParciaisNR_EX_NCM: TStringField;
    qryPoItemParciaisNR_AL_EX_NCM: TStringField;
    qryPoItemParciaisNR_ANO_EMISSAO_AL: TStringField;
    qryPoItemParciaisNR_ATO_LEGAL: TStringField;
    qryPoItemParciaisNR_EX_NALADI: TStringField;
    qryPoItemParciaisNR_EX_NALADI_NCCA: TStringField;
    qryPoItemParciaisNR_ANO_EMISSAO_EX_NALADI_NCCA: TStringField;
    qryPoItemParciaisNR_AL_EX_NALADI_NCCA: TStringField;
    qryPoItemParciaisNR_ANO_II: TStringField;
    qryPoItemParciaisNR_AL_II: TStringField;
    qryPoItemParciaisNR_ALIQ_NORMAL_II: TStringField;
    qryPoItemParciaisNR_ALIQ_ACORDO_II: TStringField;
    qryPoItemParciaisNR_ALIQ_REDUZIDA_II: TStringField;
    qryPoItemParciaisNR_ALIQ_PERC_RED_II: TStringField;
    qryPoItemParciaisNR_ANO_IPI: TStringField;
    qryPoItemParciaisNR_AL_IPI: TStringField;
    qryPoItemParciaisNR_NOTA_COMPL_IPI: TStringField;
    qryPoItemParciaisNR_ALIQ_NORMAL_IPI: TStringField;
    qryPoItemParciaisNR_ALIQ_REDUZIDA_IPI: TStringField;
    qryPoItemParciaisNR_ALIQ_PERC_RED_IPI: TStringField;
    qryPoItemParciaisNR_PROC_LI: TStringField;
    qryPoItemParciaisNR_EX_AD: TStringField;
    qryPoItemParciaisNR_ANO_AD: TStringField;
    qryPoItemParciaisNR_AL_AD: TStringField;
    qryPoItemParciaisNR_ALIQ_AD: TStringField;
    qryPoItemParciaisNR_BASE_CALC_AD: TFloatField;
    qryPoItemParciaisNR_PARCELAS: TStringField;
    qryPoItemParciaisNR_PERIODICIDADE: TStringField;
    qryPoItemParciaisNR_ROF_BACEN: TStringField;
    qryPoItemParciaisNR_FATURA: TStringField;
    qryPoItemParciaisPC_DESCONTO: TFloatField;
    qryPoItemParciaisPC_ICMS: TFloatField;
    qryPoItemParciaisPC_ICMS_REDUCAO: TFloatField;
    qryPoItemParciaisPC_COMISSAO: TFloatField;
    qryPoItemParciaisPL_ITEM: TFloatField;
    qryPoItemParciaisQT_INICIAL: TFloatField;
    qryPoItemParciaisQT_BAIXADA_DI: TFloatField;
    qryPoItemParciaisQT_BAIXADA_LI: TFloatField;
    qryPoItemParciaisQT_ESPEC_II: TFloatField;
    qryPoItemParciaisQT_ESPEC_IPI: TFloatField;
    qryPoItemParciaisQT_AD: TFloatField;
    qryPoItemParciaisQT_MED_ESTATISTICA: TFloatField;
    qryPoItemParciaisTP_CALCULO: TStringField;
    qryPoItemParciaisTP_COMISSAO: TStringField;
    qryPoItemParciaisTP_ACORDO_TARIFARIO: TStringField;
    qryPoItemParciaisTP_TRIBUTACAO_IPI: TStringField;
    qryPoItemParciaisTP_CAMBIO: TStringField;
    qryPoItemParciaisTP_IND_TX_JUROS: TBooleanField;
    qryPoItemParciaisTP_IND_PERIODICIDADE: TStringField;
    qryPoItemParciaisTP_RECIPIENTE: TStringField;
    qryPoItemParciaisTP_IND_MULTIMODAL: TStringField;
    qryPoItemParciaisTX_MERCADORIA: TMemoField;
    qryPoItemParciaisTX_JUROS_CAMBIO: TFloatField;
    qryPoItemParciaisVL_DESPESA_MOEDA: TFloatField;
    qryPoItemParciaisVL_DESCONTO_MOEDA: TFloatField;
    qryPoItemParciaisVL_UNITARIO: TFloatField;
    qryPoItemParciaisVL_TOTAL: TFloatField;
    qryPoItemParciaisVL_DESCONTO: TFloatField;
    qryPoItemParciaisVL_COMISSAO: TFloatField;
    qryPoItemParciaisVL_ESPEC_II: TFloatField;
    qryPoItemParciaisVL_ESPEC_IPI: TFloatField;
    qryPoItemParciaisVL_ESPEC_AD: TFloatField;
    qryPoItemParciaisVL_TOTAL_PARCELAS: TFloatField;
    qryPoItemParciaisVL_COBERT_ACIMA_360: TFloatField;
    qryPoItemParciaisVL_PAGTO_ANTECIPADO: TFloatField;
    qryPoItemParciaisVL_PAGTO_AVISTA: TFloatField;
    qryPoItemParciaisVL_FRETE_NAC_MOEDA: TFloatField;
    qryPoItemParciaisVL_SEGURO_MOEDA: TFloatField;
    qryPoItemParciaisVL_ACRESC_MOEDA: TFloatField;
    qryPoItemParciaisVL_DEDUC_MOEDA: TFloatField;
    qryPoItemParciaisVL_FRETE_PREPAID_MOEDA: TFloatField;
    qryPoItemParciaisVL_FRETE_COLLECT: TFloatField;
    qryPoItemParciaisIN_SELECIONADO: TStringField;
    qryPoItemParciaisQT_BAIXAR: TFloatField;
    qryPoItemParciaisQT_DISPONIVEL: TFloatField;
    qryPoItemParciaisIN_MONTADO: TStringField;
    qryPoItemParciaisIN_FABR_EXP_PROD: TStringField;
    qryPoItemParciaisNR_ANO_EX_NCM: TStringField;
    qryPoItemParciaisNR_NUM_EX_NCM: TStringField;
    qryPoItemParciaisIN_IND_COND_MERC: TBooleanField;
    qryPoItemParciaisNM_LOCAL_INCOTERM: TStringField;
    qryPoItemParciaisNM_TIPO_AL_AD: TStringField;
    qryPoItemParciaisIN_IND_PERIODICIDADE: TStringField;
    qryPoItemParciaisIN_REG_TRIB_IPI: TStringField;
    qryPoItemParciaisQT_INICIAL_EST: TFloatField;
    qryPoItemParciaisCD_USUARIO_MONTA: TStringField;
    qryPoItemParciaisCD_MODALIDADE: TStringField;
    qryPoItemParciaisNR_ATO_DRAWBACK: TStringField;
    qryPoItemParciaisIN_AVISO_DB: TStringField;
    qryPoItemParciaisNR_ITEM_CLIENTE: TStringField;
    qryPoItemParciaisTX_OBSERVACAO: TMemoField;
    qryPoItemParciaisIN_REEIMPORTACAO: TStringField;
    qryPoItemParciaisCD_AREA: TStringField;
    qryPoItemParciaisCD_LOCAL_DESEMBARQUE: TStringField;
    qryPoItemParciaisCD_EMBARCACAO: TStringField;
    qryPoItemParciaisCD_AGENTE: TStringField;
    qryPoItemParciaisNR_VIAGEM: TStringField;
    qryPoItemParciaisNR_VOO: TStringField;
    qryPoItemParciaisNR_CONHECIMENTO: TStringField;
    qryPoItemParciaisNR_COURRIER: TStringField;
    qryPoItemParciaisIN_CONSOLIDADO: TStringField;
    qryPoItemParciaisIN_URGENTE: TStringField;
    qryPoItemParciaisIN_SEGURO: TStringField;
    qryPoItemParciaisCD_MERC_FORNEC: TStringField;
    qryPoItemParciaisTP_DRAWBACK: TStringField;
    qryPoItemParciaisDT_ULT_ALTERACAO: TDateTimeField;
    qryPoItemParciaisNR_PROCESSO_DES: TStringField;
    PnlBaixa: TPanel;
    lbl_ct_gerencial: TLabel;
    btnSalvarEtapa: TSpeedButton;
    btnCancelarEtapa: TSpeedButton;
    shp46: TShape;
    lblTitulo: TLabel;
    EditQTD: TEdit;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Image1: TImage;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    qryPoItemDT_ABERTURA_ITEM: TDateTimeField;
    lblItensPo: TLabel;
    txtItensPo: TStaticText;
    qryPoItemParciaisDT_ABERTURA_ITEM: TDateTimeField;
    Shape3: TShape;
    DBText4: TDBText;
    qryPoItemParciaiscalcNR_PROCESSO_DES: TStringField;
    bvlGestaoItem: TBevel;
    Label7: TLabel;
    DBText5: TDBText;
    qryPoItemParciaisIN_UTILIZADO_INSTR_DESEMB: TStringField;
    qryPoItemParciaisID_CODIGO_INSTR_DESEMB: TStringField;
    Label8: TLabel;
    EditInvoiceNumeroParcial: TEdit;
    Label11: TLabel;
    EditDtFatura: TDateEdit;
    qryPoItemDT_FATURA: TDateTimeField;
    qryTermoPagto: TQuery;
    dtsTermoPagto: TDataSource;
    dbedt_fabricante: TDBEdit;
    lbl_fabricante: TLabel;
    btn_co_nm_fabric: TSpeedButton;
    EditNmFabricante: TEdit;
    qryProcessoCD_TERMO_PAGTO: TStringField;
    qryProcessoDIAS_CONDICAO_PAGTO: TStringField;
    qryProcessoCONDICAO_PAGTO: TStringField;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    CmbCondicao: TRxDBComboBox;
    CmbCondicaoTipo: TRxDBComboBox;
    Label14: TLabel;
    Image2: TImage;
    Label9: TLabel;
    BtnLimpaCondicao: TSpeedButton;
    Label10: TLabel;
    DBText6: TDBText;
    qryPoItemParciaisDT_FATURA: TDateTimeField;
    qryPoItemParciaisIN_CORRECAO: TStringField;
    Label13: TLabel;
    DBText7: TDBText;
    Label15: TLabel;
    qryPoItemCD_MERC_FORNEC: TStringField;
    edtCodigoCliente: TEdit;
    qryPoCD_EMPRESA: TStringField;
    qryPoItemCD_EMPRESA: TStringField;
    qryPoItemParciaisCD_EMPRESA: TStringField;
    lblatencao: TLabel;
    dbchkdrawback: TDBCheckBox;
    qryPoItemIN_DRAWBACK: TStringField;
    qryPoItemcalcHabilitaDrawBack: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnProcRealizaClick(Sender: TObject);
    procedure btnManutPedidoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure pgctrlGestaoPedidoChange(Sender: TObject);
    procedure pgctrlGestaoPedidoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure mskCodigoUnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConsultaUnidadeClick(Sender: TObject);
    procedure btnConsultaProdutoClick(Sender: TObject);
    procedure btnConsultaClienteClick(Sender: TObject);
    procedure btnConsultaServicoClick(Sender: TObject);
    procedure btnConsultaAreaClick(Sender: TObject);
    procedure btnConsultaPedidoClick(Sender: TObject);
    procedure btnConsultaProcessoClick(Sender: TObject);
    procedure mskCodigoUnidadeExit(Sender: TObject);
    procedure mskCodigoProdutoExit(Sender: TObject);
    procedure dbedtCodigoClienteExit(Sender: TObject);
    procedure dbedtCodigoServicoExit(Sender: TObject);
    procedure dbedtCodigoAreaExit(Sender: TObject);
    procedure mskNrPedidoExit(Sender: TObject);
    procedure mskNrProcessoExit(Sender: TObject);
    procedure qryProcessoAfterDelete(DataSet: TDataSet);
    procedure qryProcessoAfterPost(DataSet: TDataSet);
    procedure qryProcessoCalcFields(DataSet: TDataSet);
    procedure btnConsultaImportadorClick(Sender: TObject);
    procedure btnConsultaExportadorClick(Sender: TObject);
    procedure btnConsultaContatoClick(Sender: TObject);
    procedure btnConsultaAnalistaClick(Sender: TObject);
    procedure btnConsultaLocalDesembarqueClick(Sender: TObject);
    procedure btnConsultaEmbarcacaoClick(Sender: TObject);
    procedure btnConsultaNrViagemClick(Sender: TObject);
    procedure dbedtCodigoImportadorExit(Sender: TObject);
    procedure dbedtCodigoExportadorExit(Sender: TObject);
    procedure dbedtCodigoContatoExit(Sender: TObject);
    procedure dbedtCodigoAnalistaExit(Sender: TObject);
    procedure dbedtCodigoLocalDesembarqueExit(Sender: TObject);
    procedure dbedtCodigoEmbarcacaoExit(Sender: TObject);
    procedure dbedtNrViagemExit(Sender: TObject);
    procedure dsProcessoStateChange(Sender: TObject);
    procedure qryPoItemCalcFields(DataSet: TDataSet);
    procedure btnAtualizaServicoClick(Sender: TObject);
    procedure btnConsultaAgenteCargaClick(Sender: TObject);
    procedure dbedtCodigoAgenteCargaExit(Sender: TObject);
    procedure btnConsultaAreaItemClick(Sender: TObject);
    procedure btnConsultaMercadoriaClick(Sender: TObject);
    procedure btnConsultaLocalDesembarqueItemClick(Sender: TObject);
    procedure btnConsultaEmbarcacaoItemClick(Sender: TObject);
    procedure btnConsultaAgenteCargaItemClick(Sender: TObject);
    procedure btnConsultaNrViagemItemClick(Sender: TObject);
    procedure dbedtNrItemClienteExit(Sender: TObject);
    procedure dbedtCodigoAreaItemExit(Sender: TObject);
    procedure dbedtCodigoMercadoriaExit(Sender: TObject);
    procedure dbedtQtdeMercadoriaExit(Sender: TObject);
    procedure dbedtCodigoLocalDesembarqueItemExit(Sender: TObject);
    procedure dbedtCodigoEmbarcacaoItemExit(Sender: TObject);
    procedure dbedtCodigoAgenteCargaItemExit(Sender: TObject);
    procedure dbedtNrViagemItemExit(Sender: TObject);
    procedure qryPoItemAfterScroll(DataSet: TDataSet);
    procedure qryPoItemAfterDelete(DataSet: TDataSet);
    procedure qryPoItemAfterPost(DataSet: TDataSet);
    procedure dbedtValorItemEnter(Sender: TObject);
    procedure dbedtValorUnitarioExit(Sender: TObject);
    procedure dblckTipoCalculoItemClick(Sender: TObject);
    procedure dbedtNrItemClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dsPoItemStateChange(Sender: TObject);
    procedure mskNrPedidoEnter(Sender: TObject);
    procedure dbedtQtdeMercadoriaEnter(Sender: TObject);
    procedure dbedtValorUnitarioEnter(Sender: TObject);
    procedure btnRepassaItensClick(Sender: TObject);
    procedure dbchkInDadosIguaisItemClick(Sender: TObject);
    procedure dbgrdNecessitaLIDblClick(Sender: TObject);
    procedure dbedtCodigoServicoEnter(Sender: TObject);
    procedure qryProcessoAfterScroll(DataSet: TDataSet);
    procedure btnConsultaUnidMedClick(Sender: TObject);
    procedure btn_moeda_negociadaClick(Sender: TObject);
    procedure btnExecutaClick(Sender: TObject);
    procedure btnDialogClick(Sender: TObject);
    procedure btnSalvarLogClick(Sender: TObject);
    procedure dbedtCodPaisOrigemExit(Sender: TObject);
    procedure btnConsultaPaisOrigemClick(Sender: TObject);
    procedure btnConsultaPaisOrigemItemClick(Sender: TObject);
    procedure dbedtCodPaisOrigemItemExit(Sender: TObject);
    procedure qryPoItemNR_ITEM_CLIENTESetText(Sender: TField;
      const Text: String);
    procedure BtnBaixaClick(Sender: TObject);
    procedure btnCancelarEtapaClick(Sender: TObject);
    procedure btnSalvarEtapaClick(Sender: TObject);
    procedure EditQTDKeyPress(Sender: TObject; var Key: Char);
    procedure qryPoItemAfterOpen(DataSet: TDataSet);
    procedure Image1Click(Sender: TObject);
    procedure qryPoItemAfterInsert(DataSet: TDataSet);
    procedure qryPoItemParciaisCalcFields(DataSet: TDataSet);
    procedure btn_co_nm_fabricClick(Sender: TObject);
    procedure dbedt_fabricanteExit(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure BtnLimpaCondicaoClick(Sender: TObject);
    procedure edtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
    procedure mskNrPedidoChange(Sender: TObject);
    procedure dbedtCodigoUnidMedKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCodigoUnidMedExit(Sender: TObject);
    procedure dbedt_moeda_negociadaKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbedt_moeda_negociadaExit(Sender: TObject);
  private
    { Private declarations }
    vUnidadePadrao, vProdutoPadrao: string[2];
    vServicoOld : string[3];
    FlagIncluiRefRepetida, vInserindoNovaGestao, vAlterouServico: Boolean;
    vValorQtdeItem, vValorUnitario: Double;
    vQtdItem : Real;
    procedure AtivaBtnMenu(i, s, c, e, f, m: Boolean);
    procedure ExibeComponente(vAcao: Boolean);
    function ValidaHabilitacao(vUnidade, vProduto: string) : Boolean;
    function Consiste : Boolean;
    function Grava : Boolean;
    procedure Cancelar;
    function ValidaPedido : Boolean;
    procedure VerificaTransporte(vCodigoVia: string);
    procedure AtualizaDisplayItem;
    procedure AtualizaSaldo(const vNrPedido : string; vCdEmpresa: String; const vNrItemCliente : string; const vQtd : Real;
                            const vVlUnit : Real; const vPesoAtual : Real; const vTipoCalculo: Integer);
    procedure AtualizaFlpImport;
  public
    { Public declarations }
    vNrProcessoGestao, vNrPedidoGestao : string[18];
    vCdEmpresaGestao: String[5];
    vNrItemSequencia : string[3];
    vUnidadeGestao, vProdutoGestao: string[2];
    procedure HabilitaCampos(const vHab: Boolean);
    function CalculaValorTotal(AQuantidade, AValorUnitario, APesoLiquido: Double;
       ATipoCalculo: Integer): Double;
  end;

var
  frmGestaoPedido: TfrmGestaoPedido;

implementation

uses PGGP001, PGGP017;

{$R *.dfm}

procedure TfrmGestaoPedido.AtivaBtnMenu(i, s, c, e, f, m: Boolean);
begin
  // habilita/desabilita os botões do form
  btnIncluir.Enabled     := i;  mniIncluir.Enabled     := i;
  btnSalvar.Enabled      := s;  mniSalvar.Enabled      := s;
  btnCancelar.Enabled    := c;  mniCancelar.Enabled    := c;
  btnExcluir.Enabled     := e;  mniExcluir.Enabled     := e;
  btnProcRealiza.Enabled := f;  mniProcRealiza.Enabled := f;
  btnManutPedido.Enabled := m;  mniManutPedido.Enabled := m;
end;

procedure TfrmGestaoPedido.ExibeComponente(vAcao : Boolean);
begin
  //lblCliente.Visible            := vAcao;
  //lblServico.Visible            := vAcao;
  lblArea.Visible               := vAcao;
  lblImportador.Visible         := vAcao;
  lblExportador.Visible         := vAcao;
  //dbedtCodigoCliente.Visible    := vAcao;
  //dbedtCodigoServico.Visible    := vAcao;
  dbedtCodigoArea.Visible       := vAcao;
  dbedtCodigoImportador.Visible := vAcao;
  dbedtCodigoExportador.Visible := vAcao;
  //edtNomeCliente.Visible        := vAcao;
  //edtNomeServico.Visible        := vAcao;
  edtNomeArea.Visible           := vAcao;
  edtNomeImportador.Visible     := vAcao;
  edtNomeExportador.Visible     := vAcao;
  //btnConsultaCliente.Visible    := vAcao;
  //btnConsultaServico.Visible    := vAcao;
  btnConsultaArea.Visible       := vAcao;
  btnConsultaImportador.Visible := vAcao;
  btnConsultaExportador.Visible := vAcao;
  lblProcessoCriado.Visible     := vAcao;
  lblPedidoCriado.Visible       := vAcao;
  txtNrProcesso.Visible         := vAcao;
  txtNrPedido.Visible           := vAcao;

  dbedtCodigoServico.Enabled    := vAcao;
  btnConsultaServico.Enabled    := vAcao;

  if not vAcao then
  begin
    qryPo.Close;
    qryProcesso.Close;
    mskNrProcesso.Clear;
  end;

  {if vAcao then
  begin
    lblNrPedido.Top         := 169;
    lblNrProcesso.Top       := 169;
    mskNrPedido.Top         := 182;
    mskNrProcesso.Top       := 182;
    btnConsultaPedido.Top   := 181;
    btnConsultaProcesso.Top := 181;
    chkUltimosProcessos.Top := 185;
  end
  else
  begin
    lblNrPedido.Top         := 92;
    lblNrProcesso.Top       := 92;
    mskNrPedido.Top         := 105;
    mskNrProcesso.Top       := 105;
    btnConsultaPedido.Top   := 104;
    btnConsultaProcesso.Top := 104;
    chkUltimosProcessos.Top := 107;
  end;}
end;

function TfrmGestaoPedido.ValidaHabilitacao(vUnidade, vProduto : string): Boolean;
var vHabilitacao: Integer;
begin
  ValidaHabilitacao := False;
  //verifica se o usuário tem habilitação para a unidade/produto
  if (vUnidade <> '') and (vProduto <> '') then
  begin
    vHabilitacao := StrToInt(ConsultaLookUPSQL(
      'SELECT COUNT(*) AS VALIDO FROM TUSUARIO_HABILITACAO (NOLOCK) '+
      'WHERE CD_UNID_NEG = '''+ mskCodigoUnidade.Text +''' '+
      '  AND CD_PRODUTO  = '''+ mskCodigoProduto.Text +''' '+
      '  AND CD_USUARIO  = '''+ str_cd_usuario        +''' '+
      '  AND IN_ATIVO    = ''1'' ','VALIDO'));
    if vHabilitacao > 0 then
      ValidaHabilitacao := True
    else
      MessageDlg('Usuário sem habilitação para esta Unidade/Produto!',mtError,[mbOK],0);
  end;
end;

function TfrmGestaoPedido.Consiste : Boolean;
begin
  Consiste := True;
  //Gestão de Pedido //Dados Básicos
  if pgctrlGestaoPedido.ActivePage = tsPedido then
  begin
    if Trim(mskCodigoUnidade.Text) = '' then
    begin
      MessageDlg('Campo "Unidade" deve ser preenchido!',mtError,[mbOK],0);
      mskCodigoUnidade.SetFocus;
      Consiste := False;
      Exit;
    end
    {else
    if Trim(mskCodigoProduto.Text) = '' then
    begin
      MessageDlg('Campo "Produto" deve ser preenchido!',mtError,[mbOK],0);
      mskCodigoProduto.SetFocus;
      Consiste := False;
      Exit;
    end}
    else
    if Trim(edtCodigoCliente.Text) = '' then
    begin
      MessageDlg('Campo "Cliente" deve ser preenchido!',mtError,[mbOK],0);
      edtCodigoCliente.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if Trim(dbedtCodigoServico.Text) = '' then
    begin
      MessageDlg('Campo "Serviço" deve ser preenchido!',mtError,[mbOK],0);
      dbedtCodigoServico.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if Trim(mskNrPedido.Text) = '' then
    begin
      MessageDlg('Campo "Nr. do Pedido" deve ser preenchido!',mtError,[mbOK],0);
      mskNrPedido.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if Trim(dbedtCodigoArea.Text) = '' then
    begin
      MessageDlg('Campo "Área" deve ser preenchido!',mtError,[mbOK],0);
      dbedtCodigoArea.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if Trim(dbedtCodigoImportador.Text) = '' then
    begin
      MessageDlg('Campo "Importador" deve ser preenchido!',mtError,[mbOK],0);
      dbedtCodigoImportador.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if (not qryClienteHabilitacao.IsEmpty) or (not qryClienteServico.IsEmpty) then
    begin
      if (qryClienteHabilitacaoIN_ATIVO.AsString = '0') and
         (not qryClienteHabilitacaoIN_COMPRADOR.AsBoolean) then
      begin
        MessageDlg('Habilitação para o cliente está desativada, você não conseguirá abrir esse processo!',mtError,[mbOK],0);
        edtCodigoCliente.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if (qryClienteServicoIN_ATIVO.AsString = '0') then
      begin
        MessageDlg('Este serviço para o cliente está desativado, você não conseguirá abrir esse processo!',mtError,[mbOK],0);
        dbedtCodigoServico.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      if ((Trim(qryClienteServicoCD_PREFIXO.AsString) = '' ) or (qryClienteServicoCD_PREFIXO.IsNull)) and
         (not qryClienteHabilitacaoIN_COMPRADOR.AsBoolean) then
      begin
        MessageDlg('Prefixo para abertura do processo não cadastrado!' + #13#10 +
                   'Consulte habilitação do cliente!',mtError,[mbOK],0);
        dbedtCodigoServico.SetFocus;
        Consiste := False;
        Exit;
      end;
    end
    else
    begin
      if qryClienteHabilitacao.IsEmpty then
      begin
        MessageDlg('Cliente não possui habilitação para esta Unidade/Produto!',mtError,[mbOK],0);
        edtCodigoCliente.SetFocus;
        Consiste := False;
        Exit;
      end;
      if qryClienteServico.IsEmpty then
      begin
        MessageDlg('Cliente não possui habilitação para este Serviço!',mtError,[mbOK],0);
        dbedtCodigoServico.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    {if btnAtualizaServico.Visible then
    begin
      MessageDlg('O serviço foi alterado, antes de continuar por favor clique no botão para atualizar o follow-up!',mtError,[mbOK],0);
      Consiste := False;
      Exit;
    end;}
  end
  else
  if pgctrlGestaoPedido.ActivePage = tsPedidoItem then
  begin
    // Consistencias para o Item
    if (dbedtNrItemCliente.Text = '') then
    begin
      MessageDlg('É necessário informar o número do Item Cliente.',mtError,[mbOK],0);
      dbedtNrItemCliente.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    if (dbedtCodigoAreaItem.Text = '') or (edtNomeAreaItem.Text='') then
    begin
      MessageDlg('É necessário informar uma ÁREA antes de salvar o Item.',mtError,[mbOK],0);
      dbedtCodigoAreaItem.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (Trim(dbedtCodigoMercadoria.Text)= '') or (edtApelidoMercadoria.Text = '') then
    begin
      MessageDlg('Campo "Part Number" deve ser preenchido!',mtError,[mbOK],0);
      dbedtCodigoMercadoria.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (dbedtCodigoNcmSh.Text = '') then
    begin
      MessageDlg('É necessário informar um NCM/SH antes de salvar o Item.',mtError,[mbOK],0);
      dbedtCodigoNcmSh.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (dbedtQtdeMercadoria.Text = '') then
    begin
      MessageDlg('É necessário informar a quantidade antes de salvar o Item.',mtError,[mbOK],0);
      dbedtQtdeMercadoria.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (qryPoItemVL_UNITARIO.AsFloat = 0) then
    begin
      MessageDlg('É necessário informar o valor unitário antes de salvar o Item.',mtError,[mbOK],0);
      dbedtValorUnitario.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (dbedtCodigoUnidMed.Text = '') or (edtNomeUnidMed.Text = '') then
    begin
      MessageDlg('É necessário informar a unidade de medida antes de salvar o Item.',mtError,[mbOK],0);
      dbedtCodigoUnidMed.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (dbedt_moeda_negociada.Text = '') or (edt_moeda_negociada.Text='') then
    begin
      MessageDlg('É necessário informar a moeda antes de salvar o Item.',mtError,[mbOK],0);
      dbedt_moeda_negociada.SetFocus;
      Consiste := False;
      Exit;
    end
    else if (dbedtValorUnitario.Text = '') then
    begin
      MessageDlg('É necessário informar o valor unitário antes de salvar o Item.',mtError,[mbOK],0);
      dbedtValorUnitario.SetFocus;
      Consiste := False;
      Exit;
    end
    else
    begin
      //verifica se o item do cliente não existe entre os outros itens do cliente desta PO.
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT COUNT(NR_ITEM) FROM TPO_ITEM ( NOLOCK ) WHERE NR_ITEM_CLIENTE = '''+ dbedtNrItemCliente.Text +''' AND NR_PROCESSO = '''+ vNrPedidoGestao + ''' ' +
                ' AND NR_PARCIAL = ''' + qryPoItemNR_PARCIAL.AsString + ''' AND NR_ITEM <> '''+ qryPoItemNR_ITEM.AsString +''' AND CD_EMPRESA = ''' + qryPoItemCD_EMPRESA.AsString + '''');
        Open;
        if Fields[0].AsInteger > 0 then
        begin
          MessageDlg('Já existe um Item com esse número de Item Cliente nesse pedido.', mtError, [mbOK], 0);
          dbedtNrItemCliente.Clear;
          dbedtNrItemCliente.SetFocus;
          Consiste := False;
          Exit;
        end;
        Close;
        Free;
      end;
      //verifica se a mercadoria informada é valida
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT CD_MERCADORIA FROM TMERCADORIA (NOLOCK) WHERE CD_MERCADORIA = :CD_MERCADORIA');
        ParamByName('CD_MERCADORIA').AsString := dbedtCodigoMercadoria.Text;
        Open;
        if RecordCount = 0 then
        begin
          MessageDlg('Mercadoria não cadastrada!',mtError,[mbOK],0);
          dbedtCodigoMercadoria.Text := '';
          dbedtCodigoNcmSh.Text      := '';
          dbchkIncideLI.Checked      := False;
          dbchkdrawback.Checked      := False;
          dbedtCodigoMercadoria.SetFocus;
          Consiste := False;
          Exit;
        end;
        Free;
      end;

      // Verificar se a Unidade de Medida existe - Michel - 23/09/2010
      if (Trim(ConsultaLookUPSQL('SELECT CD_UNID_MEDIDA ' +
                                 'FROM TUNID_MEDIDA_BROKER ' +
                                 'WHERE CD_UNID_MEDIDA = ''' + qryPoItemCD_UNID_MEDIDA.AsString +  '''', 'CD_UNID_MEDIDA')) = '') then
      begin
        dbedtCodigoUnidMed.SetFocus;
        MessageDlg('Unidade de medida inválida.', mtInformation, [mbOk], 0);
        Result := False;
        Exit;
      end;

      // Verificar se a Moeda existe - Michel - 23/09/2010
      if (Trim(ConsultaLookUPSQL('SELECT CD_MOEDA ' +
                                 'FROM TMOEDA_BROKER ' +
                                 'WHERE CD_MOEDA = ''' + qryPoItemCD_MOEDA_NEGOCIADA.AsString +  '''', 'CD_MOEDA')) = '') then
      begin
        dbedt_moeda_negociada.SetFocus;
        MessageDlg('Moeda inválida.', mtInformation, [mbOk], 0);
        Result := False;
        Exit;
      end;

      //verifica se o Item já está sendo utilizado
      {FlagIncluiRefRepetida := False;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('select NR_PROCESSO_DES from TESTAGIO_PROCESSO');
        SQL.Add('where');
        SQL.Add('  NR_REFERENCIA = ''' + mskNrPedido.Text + ''' and NR_ITEM_CLIENTE = ''' + dbedtNrItemCliente.Text + '''');
        Open;
        if FieldByName('NR_PROCESSO_DES').AsString <> '' then
        begin
          if not BoxMensagem('Este pedido/item já está relacionado ao embarque "' + FieldByName('NR_PROCESSO_DES').AsString + '" através da Manutenção do Processo.' + #13#10 +
                             'Confirmando a inclusão, você automaticamente irá relacionar este Pedido/Item da gestão a este embarque.' + #13#10 +
                             'Deseja prosseguir ? ', 1) then
          begin
            Consiste := False;
            Exit;
          end
          else
            FlagIncluiRefRepetida := True;
        end;
        Free;
      end;}
    end;
  end;
end;

function TfrmGestaoPedido.Grava : Boolean;
var
  vPrefixoProcesso : string[2];
  vNumeroProcesso  : Double;
  vNrProcesso      : string[18];
  vNrItem          : Integer;
begin
  Grava := True;
  Screen.Cursor := crHourGlass;
  qryProcesso.DisableControls;

  try
    datm_main.db_broker.StartTransaction;
    if pgctrlGestaoPedido.ActivePage = tsPedido then
    begin
      if vInserindoNovaGestao then
      begin
        //pega o proximo numero de processo dessa unidade/produto/cliente/serviço
        if qryClienteHabilitacaoIN_COMPRADOR.AsBoolean then
          vPrefixoProcesso := 'IT'
        else
          vPrefixoProcesso := qryClienteServicoCD_PREFIXO.AsString;

        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT MAX(NR_PROCESSO)  ');
          SQL.Add('FROM TPROCESSO');
          SQL.Add('WHERE CD_UNID_NEG = '''+ mskCodigoUnidade.Text +''' ');
          SQL.Add('  AND CD_PRODUTO  = '''+ mskCodigoProduto.Text +''' ');
          SQL.Add('  AND DATEPART(yyyy,DT_ABERTURA) = DATEPART(yyyy,GETDATE()) ');
          SQL.Add('  AND SUBSTRING(NR_PROCESSO,5,2) = '''+ vPrefixoProcesso +''' ');
          Open;

          // Até 2013 o processo é constituído de 4 dígitos, a partir de 2014 é constituído de 6 dígitos
          if YearOf(Date) < 2014 then
          begin
            if (Copy(Fields[0].AsString,8,4) = '') or (Copy(Fields[0].AsString,8,4 ) = '9999' ) then
              vNumeroProcesso:= StrToFloat('0001')
            else vNumeroProcesso := StrToFloat(Copy(Fields[0].AsString,8,4 )) + 1;

            vNrProcesso := mskCodigoUnidade.Text + mskCodigoProduto.Text + vPrefixoProcesso +
              '-'+ FormatFloat('0000', vNumeroProcesso) +'-'+ FormatDateTime('YY', dt_server);
          end
          else
          begin
            if (Copy(Fields[0].AsString, 8, 6) = '') or (Copy(Fields[0].AsString, 8, 4) = '999999' ) then
              vNumeroProcesso:= 1
            else
              vNumeroProcesso := StrToFloat(Copy(Fields[0].AsString, 8, 6)) + 1;

            vNrProcesso := mskCodigoUnidade.Text + mskCodigoProduto.Text + vPrefixoProcesso +
              '-' + FormatFloat('000000', vNumeroProcesso) + '-' + FormatDateTime('YY', dt_server);
          end;

          Free;
        end;
        //grava na TPROCESSO
        qryProcessoNR_PROCESSO.AsString   := vNrProcesso;
        qryProcessoCD_UNID_NEG.AsString   := mskCodigoUnidade.Text;
        qryProcessoCD_PRODUTO.AsString    := mskCodigoProduto.Text;
        qryProcessoCD_GRUPO.AsString      := qryClienteHabilitacaoCD_GRUPO.AsString;
        qryProcessoNR_REFERENCIA.AsString := mskNrPedido.Text;
        qryProcessoCD_CLIENTE.AsString    := edtCodigoCliente.Text;
        qryProcessoIN_LIBERADO.AsString   := '1';
        qryProcessoIN_CANCELADO.AsString  := '0';
        qryProcessoDT_ABERTURA.AsDateTime := Date;
        qryProcessoHR_ABERTURA.AsDateTime := Now;
        qryProcessoIN_DADOS_IGUAIS_ITENS.AsString := '1';
        //grava na TPO
        if not qryPo.IsEmpty then
        begin
          qryProcessoCD_PAIS_ORIGEM.AsString  := qryPoCD_PAIS_ORIGEM.AsString;
          qryProcessoCD_INCOTERM.AsString     := qryPoCD_INCOTERM.AsString;
          qryProcessoCD_LOCAL_DESEMBARQUE.AsString := qryPoCD_LOCAL_DESEMBARQUE.AsString;
          qryProcessoNR_ORDEM.AsString        := qryPoNR_ORDEM.AsString;
          qryProcessoNR_CONHECIMENTO.AsString := qryPoNR_DOC_HOUSE.AsString;
          qryProcessoIN_SEGURO.AsString       := qryPoIN_SEGURO.AsString;
          //abre a tabela de itens
          qryPoItem.Close;
          qryPoItem.ParamByName('NR_PROCESSO').AsString := mskNrPedido.Text;
          qryPoItem.ParamByName('CD_EMPRESA').AsString := edtCodigoCliente.Text;
          qryPoItem.Open;
          //se existirem itens para o processo, atualiza informação
          if not qryPoItem.IsEmpty then
          begin
            qryPoItem.First;
            while not qryPoItem.Eof do
            begin
              qryPoItem.Edit;
              qryPoItemCD_PAIS_ORIGEM.AsString := qryProcessoCD_PAIS_ORIGEM.AsString;
              qryPoItemCD_LOCAL_DESEMBARQUE.AsString := qryProcessoCD_LOCAL_DESEMBARQUE.AsString;
              qryPoItemIN_SEGURO.AsString  := qryProcessoIN_SEGURO.AsString;
              qryPoItem.Post;
              qryPoItem.Next;
            end;
          end;
          //edita informação na tabela de pedido
          qryPo.Edit;
          qryPoCD_SERVICO.AsString    := dbedtCodigoServico.Text;
          qryPoCD_AREA.AsString       := dbedtCodigoArea.Text;
          qryPoCD_IMPORTADOR.AsString := dbedtCodigoImportador.Text;
          qryPoCD_EXPORTADOR.AsString := dbedtCodigoExportador.Text;
        end
        else
        begin
          qryPo.Insert;
          qryPoCD_EMPRESA.AsString    := edtCodigoCliente.Text;
          qryPoNR_PROCESSO.AsString   := mskNrPedido.Text;
          qryPoDT_ABERTURA.AsDateTime := Date;
          qryPoCD_SERVICO.AsString    := dbedtCodigoServico.Text;
          qryPoCD_AREA.AsString       := dbedtCodigoArea.Text;
          qryPoCD_IMPORTADOR.AsString := dbedtCodigoImportador.Text;
          qryPoCD_EXPORTADOR.AsString := dbedtCodigoExportador.Text;
        end;
        qryPoCD_EMPRESA.AsString := edtCodigoCliente.Text;
        qryPo.Post;
        qryProcesso.Post;

        vNrPedidoGestao   := Trim(mskNrPedido.Text);
        vNrProcessoGestao := '';
        vCdEmpresaGestao  := Trim(edtCodigoCliente.Text);

        { Comentado por Rodrigo Capra - 18/07/2008 -  A pedido do Vitor Zanin
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('UPDATE TESTAGIO_PROCESSO SET ');
          SQL.Add('  NR_PROCESSO_ADM  = ''' + vNrProcesso + ''' ');
          SQL.Add('WHERE NR_REFERENCIA = ''' + mskNrPedido.Text + ''' ');
          ExecSQL;
          Free;
        end;}

        //atualiza F-UP  - pedido por Rose (01/02/2006)
        with TQuery.Create(Application) do
        begin
          //evento 003 - abertura de processo / evento 022 - observações
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('UPDATE TFLP_PO ');
          //SQL.Add('SET DT_REALIZACAO = '''+ qryProcessoDT_ABERTURA.AsString +''', ');
          //SQL.Add('    DT_PREVISTA   = '''+ qryProcessoDT_ABERTURA.AsString +'''  ');
          SQL.Add('SET DT_REALIZACAO = CONVERT(DATETIME, '''+ FormatDateTime('dd/mm/yyyy', qryProcessoDT_ABERTURA.AsDateTime) + ''', 103),');
          SQL.Add('    DT_PREVISTA   = CONVERT(DATETIME, '''+ FormatDateTime('dd/mm/yyyy', qryProcessoDT_ABERTURA.AsDateTime) + ''', 103)');
          SQL.Add('WHERE CD_EVENTO  IN (''003'',''022'') ');
          //SQL.Add('  AND NR_PROCESSO = ''' + vNrProcesso + ''' ');
          SQL.Add('  AND NR_PROCESSO = ''' + mskNrPedido.Text + ''' ');
          SQL.Add('  AND CD_EMPRESA  = ''' + edtCodigoCliente.Text + ''' ');
          ExecSQL;
          Free;
          // 3 linhas alteradas no UPDATE acima por causa de erro e por estar com condição errada no NR_PROCESSO - Michel - 18/05/2010
        end;
        CloseStoredProc(sp_atz_ev_flp_po);
        sp_atz_ev_flp_po.ParamByName('@nr_processo').AsString  := mskNrPedido.Text;
        sp_atz_ev_flp_po.ParamByName('@cd_empresa').AsString   := edtCodigoCliente.Text;
        ExecStoredProc(sp_atz_ev_flp_po);
        CloseStoredProc(sp_atz_ev_flp_po);
        //Aqui
      end
      else
      begin
        //grava na TPO
        if not qryPo.IsEmpty then
        begin
          qryPo.Edit;
          if dbedtCodigoImportador.Text <> '' then qryPoCD_IMPORTADOR.AsString := dbedtCodigoImportador.Text;
          if dbedtCodigoExportador.Text <> '' then qryPoCD_EXPORTADOR.AsString := dbedtCodigoExportador.Text;
          if dbedtCodigoArea.Text       <> '' then qryPoCD_AREA.AsString       := dbedtCodigoArea.Text;
          if not VarIsNull(dblckIncoterm.KeyValue)  then qryPoCD_INCOTERM.AsString := dblckIncoterm.KeyValue;
          if dbedtCodigoLocalDesembarque.Text <> '' then qryPoCD_LOCAL_DESEMBARQUE.AsString := dbedtCodigoLocalDesembarque.Text;
          qryPoCD_SERVICO.AsString    := dbedtCodigoServico.Text;
          qryPoCD_VIA_TRANSP.AsString := ConsultaLookUP('TSERVICO','CD_SERVICO',dbedtCodigoServico.Text,'CD_VIA_TRANSPORTE');
          qryPo.Post;
        end;
        qryProcesso.Post;
      end;
    end
    else if pgctrlGestaoPedido.ActivePage = tsDadosBasicos then
    begin
      if not qryPo.IsEmpty then
      begin
        qryPo.Edit;
        qryPoCD_IMPORTADOR.AsString := dbedtCodigoImportador.Text;
        qryPoCD_EXPORTADOR.AsString := dbedtCodigoExportador.Text;
        qryPoCD_SERVICO.AsString    := dbedtCodigoServico.Text;
        qryPoCD_AREA.AsString       := dbedtCodigoArea.Text;
        if dblckIncoterm.KeyValue <> null then
          qryPoCD_INCOTERM.AsString   := dblckIncoterm.KeyValue;
        qryPoCD_PAIS_ORIGEM.AsString := dbedtCodPaisOrigem.Text;
        qryPoCD_LOCAL_DESEMBARQUE.AsString := dbedtCodigoLocalDesembarque.Text;
        qryPoCD_VIA_TRANSP.AsString := ConsultaLookUP('TSERVICO','CD_SERVICO',dbedtCodigoServico.Text,'CD_VIA_TRANSPORTE');
        qryPo.Post;
      end;
      qryProcesso.Post;

      if dbchkInDadosIguaisItem.Checked then
      begin
        qryPoItem.Close;
        qryPoItem.ParamByName('NR_PROCESSO').AsString  := vNrPedidoGestao;
        qryPoItem.ParamByName('CD_EMPRESA').AsString := vCdEmpresaGestao;
        qryPoItem.Open;

        if not qryPoItem.IsEmpty then
        begin
          qryPoItem.First;
          while not qryPoItem.Eof do
          begin
            qryPoItem.Edit;
            qryPoItemCD_PAIS_ORIGEM.AsString  := qryProcessoCD_PAIS_ORIGEM.AsString;
            qryPoItemCD_LOCAL_DESEMBARQUE.AsString := qryProcessoCD_LOCAL_DESEMBARQUE.AsString;
            qryPoItemCD_EMBARCACAO.AsString   := qryProcessoCD_EMBARCACAO.AsString;
            qryPoItemCD_AGENTE.AsString       := qryProcessoCD_AGENTE.AsString;
            qryPoItemNR_VIAGEM.AsString       := qryProcessoNR_VIAGEM.AsString;
            qryPoItemNR_VOO.AsString          := qryProcessoNR_VOO.AsString;
            qryPoItemNR_CONHECIMENTO.AsString := qryProcessoNR_CONHECIMENTO.AsString;
            qryPoItemNR_COURRIER.AsString     := qryProcessoNR_COURRIER.AsString;
            qryPoItemIN_CONSOLIDADO.AsString  := qryProcessoIN_CONSOLIDADO.AsString;
            qryPoItemIN_URGENTE.AsString      := qryProcessoIN_URGENTE.AsString;
            qryPoItemIN_SEGURO.AsString       := qryProcessoIN_SEGURO.AsString;
            qryPoItem.Post;
            qryPoItem.Next;
          end;
          qryPoItem.First;
        end;
      end;
    end
    else if pgctrlGestaoPedido.ActivePage = tsPedidoItem then
    begin
      qryPoItem.DisableControls;
      qryPoItemCD_EMPRESA.AsString := edtCodigoCliente.Text;
      qryPoItem.Post;
      if (qryPoItemCD_PAIS_ORIGEM.AsString  <> qryProcessoCD_PAIS_ORIGEM.AsString ) or
         (qryPoItemCD_LOCAL_DESEMBARQUE.AsString <> qryProcessoCD_LOCAL_DESEMBARQUE.AsString) or
         (qryPoItemCD_EMBARCACAO.AsString   <> qryProcessoCD_EMBARCACAO.AsString  ) or
         (qryPoItemCD_AGENTE.AsString       <> qryProcessoCD_AGENTE.AsString      ) or
         (qryPoItemNR_VIAGEM.AsString       <> qryProcessoNR_VIAGEM.AsString      ) or
         (qryPoItemNR_VOO.AsString          <> qryProcessoNR_VOO.AsString         ) or
         (qryPoItemNR_CONHECIMENTO.AsString <> qryProcessoNR_CONHECIMENTO.AsString) or
         (qryPoItemNR_COURRIER.AsString     <> qryProcessoNR_COURRIER.AsString    ) or
         (qryPoItemIN_CONSOLIDADO.AsString  <> qryProcessoIN_CONSOLIDADO.AsString ) or
         (qryPoItemIN_URGENTE.AsString      <> qryProcessoIN_URGENTE.AsString     ) or
         (qryPoItemIN_SEGURO.AsString       <> qryProcessoIN_SEGURO.AsString      ) then
      begin
        if not (dsProcesso.State in [dsEdit]) then qryProcesso.Edit;
        qryProcessoIN_DADOS_IGUAIS_ITENS.AsString := '0';
        qryProcesso.Post;
      end;
      //atualiza a qtde disponínel do item igual a qtde inicial.
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.ADD('UPDATE TPO_ITEM SET QT_DISPONIVEL = QT_INICIAL WHERE NR_PROCESSO = '''+ vNrPedidoGestao +''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + ''' ');
        ExecSQL;
        Free;
      end;
      //atualiza a qtde total disponível da PO
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.ADD('UPDATE TPO SET QT_TOTAL_DISPONIVEL = (SELECT SUM(QT_DISPONIVEL) FROM TPO_ITEM WHERE NR_PROCESSO = '''+ vNrPedidoGestao +''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + ''') WHERE NR_PROCESSO = '''+ vNrPedidoGestao +''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + ''' ');
        ExecSQL;

        //Comentado por Rodrigo Capra em 15/09/2008 - Pois com a nova forma de referências ( com parciais ) este problema não ocorrerá mais
        //Atualiza a TESTAGIO_PROCESSO com o Item que está sendo inserido - Rodrigo Capra - 18/07/2008
        {if FlagIncluiRefRepetida then
        begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE TESTAGIO_PROCESSO SET ');
          SQL.Add('  NR_PROCESSO_DES  = '''  + qryPoItem.FieldByName('NR_PROCESSO').AsString + ''' ');
          SQL.Add('WHERE NR_REFERENCIA = ''' + mskNrPedido.Text + ''' and NR_ITEM_CLIENTE = ''' + dbedtNrItemCliente.Text + '''');
          ExecSQL;
        end;}
        Free;
      end;

      // evitando o lock de registro e por consequencia, o couldnt
      if qryPoItem.FieldByName('NR_ITEM').AsString = '' then
        vNrItem := 1
      else
        vNrItem := qryPoItem.FieldByName('NR_ITEM').AsInteger;
      //atualiza os itens da PO
      qryPoItem.Close;
      qryPoItem.ParamByName('NR_PROCESSO').AsString := vNrPedidoGestao;
      qryPoItem.ParamByName('CD_EMPRESA').AsString  := vCdEmpresaGestao;
      qryPoItem.Open;
      qryPoItem.Locate('NR_ITEM',FormatFloat('000',vNrItem),[]);
      dsPoItem.AutoEdit := not qryPoItem.IsEmpty;
      AtualizaDisplayItem;
      qryPoItem.EnableControls;

      dbedtNrItemCliente.ReadOnly    := True;
      dbedtNrItemCliente.Color       := clMenu;
    end;
    datm_main.db_broker.Commit;
    AtivaBtnMenu(True, False, False, False, True, True);
    vInserindoNovaGestao := False;
    if pgctrlGestaoPedido.ActivePage <> tsPedidoItem then
      mskNrPedidoExit(nil);
  except
    on E: Exception do
    begin
      ShowMessage(e.message);
      if dsProcesso.State in [dsInsert,dsEdit] then qryProcesso.Cancel;
      if dsPo.State       in [dsInsert,dsEdit] then qryPo.Cancel;
      if dsPoItem.State   in [dsInsert,dsEdit] then qryPoItem.Cancel;

      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;

      TrataErro(E);
      Grava := False;
    end;
  end;
  qryProcesso.EnableControls;
  Screen.Cursor := crDefault;
end;

procedure TfrmGestaoPedido.Cancelar;
begin
  try
    if vInserindoNovaGestao then
    begin
      ExibeComponente(False);
      lblNrProcesso.Visible       := True;
      mskNrProcesso.Visible       := True;
      btnConsultaProcesso.Visible := True;
      chkUltimosProcessos.Visible := True;
    end;

    vInserindoNovaGestao := False;
    if dsProcesso.State in [dsInsert,dsEdit] then
      qryProcesso.Cancel;
    if dsPo.State       in [dsInsert,dsEdit] then
      qryPo.Cancel;
    if dsPoItem.State   in [dsInsert,dsEdit] then
    begin
      qryPoItem.Cancel;
      dbedtNrItemCliente.ReadOnly    := True;
      dbedtNrItemCliente.Color       := clMenu;
    end;
    AtivaBtnMenu(True, False, False, False, True, True);
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

function TfrmGestaoPedido.ValidaPedido : Boolean;
var
  vLenPedido : integer;
begin
  ValidaPedido := True;
  //verifica se esse cliente aceita barras
  if RefClienteHabilitacao(mskCodigoUnidade.Text, mskCodigoProduto.Text, edtCodigoCliente.Text, 0) = 0 then
    if pos('/',mskNrPedido.Text) > 0 then
    begin
      MessageDlg('O Nr. do Pedido para esse cliente não podem conter o caracter "/".', mtError, [mbOK], 0);
      mskNrPedido.SelectAll;
      mskNrPedido.SetFocus;
      ValidaPedido := False;
      Exit;
    end;
    
  //verifica o tamanho da referencia
  vLenPedido := RefClienteHabilitacao(mskCodigoUnidade.Text, mskCodigoProduto.Text, edtCodigoCliente.Text, 1);
  if vLenPedido > 0 then
    if Length(mskNrPedido.Text) <> vLenPedido then
    begin
      MessageDlg('O Nr. de Pedido para esse cliente deve ter '+ IntToStr(vLenPedido) +' caracteres.'+ #13#10 +
                 'Verifique se o Nr. do Pedido foi digitado corretamente.', mtError, [mbOK], 0);
      mskNrPedido.SelectAll;
      mskNrPedido.SetFocus;
      ValidaPedido := False;
      Exit;
    end;
end;

procedure TfrmGestaoPedido.VerificaTransporte(vCodigoVia: string);
begin
  if vCodigoVia = '01' then
  begin
    dbedtCodigoEmbarcacao.Enabled     := True;
    dbedtNrViagem.Enabled             := True;
    dbedtNrVoo.Enabled                := False;
    btnConsultaEmbarcacao.Enabled     := True;
    btnConsultaNrViagem.Enabled       := True;
    dbedtCodigoEmbarcacaoItem.Enabled := True;
    dbedtNrViagemItem.Enabled         := True;
    dbedtNrVooItem.Enabled            := False;
    btnConsultaEmbarcacaoItem.Enabled := True;
    btnConsultaNrViagemItem.Enabled   := True;

    dbedtCodigoEmbarcacao.Color       := clWhite;
    dbedtNrViagem.Color               := clWhite;
    dbedtNrVoo.Color                  := clMenu;
    dbedtCodigoEmbarcacaoItem.Color   := clWhite;
    dbedtNrViagemItem.Color           := clWhite;
    dbedtNrVooItem.Color              := clMenu;

    lblEmbarcacao.Font.Color          := clBlack;
    lblNrViagem.Font.Color            := clBlack;
    lblNrVoo.Font.Color               := clGray;
    lblEmbarcacaoItem.Font.Color      := clBlack;
    lblNrViagemItem.Font.Color        := clBlack;
    lblNrVooItem.Font.Color           := clGray;
  end;

  if vCodigoVia = '04' then
  begin
    dbedtCodigoEmbarcacao.Enabled     := False;
    dbedtNrViagem.Enabled             := False;
    dbedtNrVoo.Enabled                := True;
    btnConsultaEmbarcacao.Enabled     := False;
    btnConsultaNrViagem.Enabled       := False;
    dbedtCodigoEmbarcacaoItem.Enabled := False;
    dbedtNrViagemItem.Enabled         := False;
    dbedtNrVooItem.Enabled            := True;
    btnConsultaEmbarcacaoItem.Enabled := False;
    btnConsultaNrViagemItem.Enabled   := False;

    dbedtCodigoEmbarcacao.Color       := clMenu;
    dbedtNrViagem.Color               := clMenu;
    dbedtNrVoo.Color                  := clWhite;
    dbedtCodigoEmbarcacaoItem.Color   := clMenu;
    dbedtNrViagemItem.Color           := clMenu;
    dbedtNrVooItem.Color              := clWhite;

    lblEmbarcacao.Font.Color          := clGray;
    lblNrViagem.Font.Color            := clGray;
    lblNrVoo.Font.Color               := clBlack;
    lblEmbarcacaoItem.Font.Color      := clGray;
    lblNrViagemItem.Font.Color        := clGray;
    lblNrVooItem.Font.Color           := clBlack;
  end;
end;

procedure TfrmGestaoPedido.AtualizaDisplayItem;
var
  vQtdeItem, vItemDisplay,vDrawback,vLi: Integer;
begin
  //atualiza o display dos itens
//
  if qryPoItem.Active then
  begin
    vNrItemSequencia := qryPoItemNR_ITEM.AsString;

    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('SELECT COUNT(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = '''+ (vNrPedidoGestao) +''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''');
      Open;
      vQtdeItem := Fields[0].AsInteger;
      Free;
    end;

    if vNrItemSequencia <> '' then
    begin
       with TQuery.Create(Application) do
       begin
         DataBaseName := 'DBBROKER';
         SQL.ADD('SELECT COUNT(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = '''+ (vNrPedidoGestao) +''' AND NR_ITEM <= ''' + vNrItemSequencia + ''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''');
         Open;
         vItemDisplay := Fields[0].AsInteger;
         Free;
       end;
    end
    else
      vItemDisplay := 0;
    txtItensPo.Caption := FormatFloat('000',vItemDisplay) + ' / ' + FormatFloat('000',vQtdeItem);
    //exibe botão de excluir
    btnExcluir.Enabled := (qryPoItem.RecordCount > 0);
    //exibe o painel de Atenção com LI
    vDrawback:= StrToInt(ConsultaLookupSQL('SELECT COUNT(*) TOTAL FROM TPO_ITEM (NOLOCK) WHERE IN_DRAWBACK = ''1'' AND NR_PROCESSO = '''+ vNrPedidoGestao +''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''', 'TOTAL'));
    vLi:= StrToInt(ConsultaLookupSQL('SELECT COUNT(*) TOTAL FROM TPO_ITEM (NOLOCK) WHERE IN_NECESSITA_LI = ''1'' AND NR_PROCESSO = '''+ vNrPedidoGestao +''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''', 'TOTAL'));
    if (vDrawback > 0) and (vLi > 0) then
    begin
      pnlAtencaoLI.font.color:=clred;
      pnlAtencaoLI.Caption:='Atenção - Solicitar a LI e DrawBack antes da transmissão';
      pnlAtencaoLI.Visible :=true;
    end
    else if  (vDrawback > 0) and (vLi <= 0) then
    begin
      pnlAtencaoLI.font.color:=clred;
      pnlAtencaoLI.Caption:='Atenção - Solicitar DrawBack antes da transmissão';
      pnlAtencaoLI.Visible :=true;
    end
    else if (vDrawback <= 0) and (vLi > 0) then
    begin
      pnlAtencaoLI.font.color:=clred;
      pnlAtencaoLI.Caption:='Atenção - Solicitar a LI antes da transmissão';
      pnlAtencaoLI.Visible :=true;
    end
    else if(vDrawback <= 0) and (vLi <= 0)  then
    begin
      pnlAtencaoLI.Visible :=false;
    end;

    //pnlAtencaoLI.Visible := (StrToInt(ConsultaLookupSQL('SELECT COUNT(*) TOTAL FROM TPO_ITEM (NOLOCK) WHERE IN_NECESSITA_LI = ''1'' AND NR_PROCESSO = '''+ vNrPedidoGestao +''' ' +
    //   ' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''', 'TOTAL')) > 0);
  end;
end;

procedure TfrmGestaoPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if str_cd_rotina = '1820' then str_cd_rotina := '';
  //fecha as tabelas
  qryProcesso.Close;
  qryPo.Close;
  qryPoItem.Close;
  qryClienteHabilitacao.Close;
  qryClienteServico.Close;
  qryTipoCalculoItem.Close;
  qryIncoterm.Close;
  qryTipoPedido.Close;
  //libera da memoria
  Action := caFree;
end;

procedure TfrmGestaoPedido.FormCreate(Sender: TObject);
begin
  vStr_cd_modulo := '18';
  str_cd_rotina  := '1820';
  //procura a unidade e produto padrão do usuário
  vUnidadePadrao := ConsultaLookUPSQL('SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''' AND IN_DEFAULT = ''1'' ','CD_UNID_NEG');
  vProdutoPadrao := ConsultaLookUPSQL('SELECT CD_PRODUTO  FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''' AND IN_DEFAULT = ''1'' ','CD_PRODUTO');
end;

procedure TfrmGestaoPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
  if Key = #27 then
  begin
    if not PnlBaixa.Visible then
      btnSairClick(nil)
    else
      btnCancelarEtapa.Click;
  end;
end;

procedure TfrmGestaoPedido.FormShow(Sender: TObject);
begin
  pnlGestaoCadastro.Color       := clMenuBroker;
  pgctrlGestaoPedido.ActivePage := tsPedido;

  if mniManutPedido.Visible then mniManutPedido.ShortCut := TextToShortCut('F2');
  if mniProcRealiza.Visible then mniProcRealiza.ShortCut := TextToShortCut('Ctrl+F2');

  AtivaBtnMenu(True, False, False, False, True, True);
  ExibeComponente(False);

  lblNrProcesso.Visible       := True;
  mskNrProcesso.Visible       := True;
  btnConsultaProcesso.Visible := True;
  chkUltimosProcessos.Visible := True;
//  btnAtualizaServico.Visible  := False;

  vInserindoNovaGestao  := False;
  vAlterouServico := False;
  if Trim(cd_unid_neg_gestao) <> '' then
    mskCodigoUnidade.Text := cd_unid_neg_gestao
  else
    mskCodigoUnidade.Text := vUnidadePadrao;
  mskCodigoProduto.Text := '06';//vProdutoPadrao;

  if Trim(cd_cliente_gestao) <> '' then
    edtCodigoCliente.Text := cd_cliente_gestao
  else
    edtCodigoCliente.Text;

  if Trim(nr_po_gestao) <> '' then
  begin
    mskNrPedido.Text   := nr_po_gestao;
    mskNrProcesso.Text := '';
    mskNrPedidoExit(nil);
  end
  else
  if Trim(nr_processo_po) <> '' then
  begin
    mskNrProcesso.Text := Copy(nr_processo_po, 5, 13);
    mskNrPedido.Text   := '';
    mskNrProcessoExit(nil);
  end;
  mskCodigoUnidade.SetFocus;
end;

procedure TfrmGestaoPedido.btnIncluirClick(Sender: TObject);
begin
  If pgctrlGestaoPedido.ActivePage = tsPedido then
  begin
    ExibeComponente(True);
    vInserindoNovaGestao := True;
    mskCodigoUnidade.SetFocus;
    mskNrPedido.Text      := '';
    mskNrProcesso.Text    := '';
    edtCodigoCliente.Text := '';
    qryProcesso.Open;
    qryProcesso.Insert;
    qryProcessoIN_DADOS_IGUAIS_ITENS.AsString := '1';
    qryProcessoIN_CONSOLIDADO.AsString := '0';
    qryProcessoIN_URGENTE.AsString     := '0';
    qryProcessoIN_SEGURO.AsString      := '0';
    lblNrProcesso.Visible       := False;
    mskNrProcesso.Visible       := False;
    btnConsultaProcesso.Visible := False;
    chkUltimosProcessos.Visible := False;
//    btnAtualizaServico.Visible  := False;
    lblProcessoCriado.Visible   := False;
    lblPedidoCriado.Visible     := False;
    txtNrProcesso.Visible       := False;
    txtNrPedido.Visible         := False;
    pnlAtencaoLI.Visible        := False;
  end else if pgctrlGestaoPedido.ActivePage = tsDadosBasicos then
  begin
    pgctrlGestaoPedido.ActivePage := tsPedido;
    btnIncluirClick(nil);
  end else if pgctrlGestaoPedido.ActivePage = tsPedidoItem then
  begin
    pgctrlItem.ActivePage := tsGestao;
    qryPoItem.Insert;
    qryPoItemNR_PARCIAL.AsInteger := 0;
    qryPoItemNR_PROCESSO.AsString := vNrPedidoGestao;
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.ADD('SELECT MAX(NR_ITEM) FROM TPO_ITEM WHERE NR_PROCESSO = ''' + vNrPedidoGestao + ''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''');
      Open;
      if Fields[0].AsString = '' then
        qryPoItemNR_ITEM.AsString := '001'
      else
        qryPoItemNR_ITEM.AsString := FormatFloat('000',Fields[0].AsInteger+1);
      Free;
    end;
    qryPoItemIN_REEIMPORTACAO.AsString  := 'N';
    qryPoItemIN_NECESSITA_LI.AsBoolean  := False;
    qryPoItemIN_DRAWBACK.AsString       :='0';
    qryPoItemQT_BAIXADA_DI.AsString     := '0';
    qryPoItemQT_BAIXADA_LI.AsString     := '0';
    qryPoItemIN_MONTADO.AsBoolean       := False;
    qryPoItemPL_ITEM.AsFloat            := 0;
    qryPoItemQT_INICIAL.AsFloat         := 0;
    qryPoItemVL_UNITARIO.AsFloat        := 0;
    qryPoItemVL_TOTAL.AsFloat           := 0;
    qryPoItemTP_CALCULO.AsInteger       := 1;
    qryPoItemTP_DRAWBACK.AsString       := '0';
    qryPoItemCD_AREA.AsString           := qryPoCD_AREA.AsString;
    qryPoItemCD_EXPORTADOR.AsString     := qryPoCD_EXPORTADOR.AsString;
    qryPoItemCD_PAIS_AQUISICAO.AsString := qryPoCD_PAIS_AQUISICAO.AsString;
    qryPoItemCD_FABRICANTE.AsString     := qryPoCD_FABRICANTE.AsString;
    qryPoItemCD_PAIS_ORIGEM.AsString    := qryPoCD_PAIS_ORIGEM.AsString;
    qryPoItemIN_FABR_EXP_PROD.AsString  := qryPoIN_FABR_EXPOR_IMP.AsString;
    if qryProcessoIN_DADOS_IGUAIS_ITENS.AsString = '1' then
    begin
      qryPoItemCD_PAIS_ORIGEM.AsString  := qryProcessoCD_PAIS_ORIGEM.AsString;
      qryPoItemCD_LOCAL_DESEMBARQUE.AsString := qryProcessoCD_LOCAL_DESEMBARQUE.AsString;
      qryPoItemCD_EMBARCACAO.AsString   := qryProcessoCD_EMBARCACAO.AsString;
      qryPoItemCD_AGENTE.AsString       := qryProcessoCD_AGENTE.AsString;
      qryPoItemNR_VIAGEM.AsString       := qryProcessoNR_VIAGEM.AsString;
      qryPoItemNR_VOO.AsString          := qryProcessoNR_VOO.AsString;
      qryPoItemNR_CONHECIMENTO.AsString := qryProcessoNR_CONHECIMENTO.AsString;
      qryPoItemNR_COURRIER.AsString     := qryProcessoNR_COURRIER.AsString;
      qryPoItemIN_CONSOLIDADO.AsString  := qryProcessoIN_CONSOLIDADO.AsString;
      qryPoItemIN_URGENTE.AsString      := qryProcessoIN_URGENTE.AsString;
      qryPoItemIN_SEGURO.AsString       := qryProcessoIN_SEGURO.AsString;
    end;
    dbedtNrItemCliente.ReadOnly    := False;
    dbedtNrItemCliente.Color       := clWindow;

    dbedtNrItemCliente.SetFocus;
    dblckTipoCalculoItem.KeyValue  := 1;
    dbchkInConsolidadoItem.Checked := (qryProcessoIN_CONSOLIDADO.AsString = '1');
    dbchkInUrgenteItem.Checked     := (qryProcessoIN_URGENTE.AsString = '1');
    dbchkInSeguroItem.Checked      := (qryProcessoIN_SEGURO.AsString = '1');
  end;
  AtivaBtnMenu(False, True, True, False, False, False);
end;

procedure TfrmGestaoPedido.btnSalvarClick(Sender: TObject);
var
  vQryAux: TQuery;
begin
  ActiveControl := nil;
  qryClienteHabilitacao.Close;
  qryClienteHabilitacao.ParamByName('CD_CLIENTE').AsString  := edtCodigoCliente.Text;
  qryClienteHabilitacao.ParamByName('CD_UNID_NEG').AsString := mskCodigoUnidade.Text;
  qryClienteHabilitacao.ParamByName('CD_PRODUTO').AsString  := mskCodigoProduto.Text;
  qryClienteHabilitacao.Open;

  qryClienteServico.Close;
  qryClienteServico.ParamByName('CD_CLIENTE').AsString  := edtCodigoCliente.Text;
  qryClienteServico.ParamByName('CD_SERVICO').AsString  := dbedtCodigoServico.Text;
  qryClienteServico.ParamByName('CD_UNID_NEG').AsString := mskCodigoUnidade.Text;
  qryClienteServico.ParamByName('CD_PRODUTO').AsString  := mskCodigoProduto.Text;
  qryClienteServico.Open;
  
  if not Consiste then Exit;
  if not Grava then Exit;

  if vAlterouServico then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      // Refaz o followup com os eventos novos mantendo as informações dos eventos atuais - Michel - 23/08/2010
      SQL.Clear;
      SQL.Add('EXEC SP_MUDA_SERVICO_PO_ITEM :NR_PROCESSO, :CD_EMPRESA');
      ParamByName('NR_PROCESSO').AsString := mskNrPedido.Text;
      ParamByName('CD_EMPRESA').AsString  := edtCodigoCliente.Text;
      ExecSql;

      //atualiza ordem e previsão
      SQL.Clear;
      SQL.Add(' EXEC SP_ATZ_FLP_PO '''+ mskNrPedido.Text +''', ''' + edtCodigoCliente.Text + '''');
      ExecSQL;

      //atualiza ordem e previsão dos itens
      vQryAux := TQuery.Create(Application);
      vQryAux.DatabaseName := 'DBBroker';
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Add('SELECT DISTINCT(NR_ITEM) FROM TFLP_PO_ITEM WHERE NR_PROCESSO = ''' + mskNrPedido.Text + ''' AND CD_EMPRESA = ''' + edtCodigoCliente.Text + '''');
      vQryAux.Open;
      while not vQryAux.Eof do
      begin
        SQL.Clear;
        SQL.Add(' EXEC SP_ATZ_FLP_PO_ITEM '''+ mskNrPedido.Text +''', ''' + edtCodigoCliente.Text + ''', '''+ vQryAux.Fields[0].AsString +''' ');
        ExecSQL;
        vQryAux.Next;
      end;
      vQryAux.Free;
      Free;
    end;
  end;
  {
  if (pgctrlGestaoPedido.ActivePage = tsPedido) and vInserindoNovaGestao then
  begin
    if MessageDlg('Deseja editar os dados básicos dessa gestão?' +#13#10+
                  ' * Clique em "Sim" para editar os dados básicos do processo criado;' +#13#10+
                  ' * Clique em "Não" para iniciar a abertura de um novo processo de gestão.',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      mskNrPedidoExit(nil);
      pgctrlGestaoPedido.ActivePage := tsDadosBasicos;
    end
    else
      btnIncluirClick(nil);
  end;  }
  vInserindoNovaGestao := False;
end;

procedure TfrmGestaoPedido.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
  AtivaBtnMenu(True, False, False, False, True, True);
end;

procedure TfrmGestaoPedido.btnExcluirClick(Sender: TObject);
begin
  AtivaBtnMenu(True, False, False, False, True, True);
end;

procedure TfrmGestaoPedido.btnProcRealizaClick(Sender: TObject);
begin
  if (dsProcesso.State in [dsInsert, dsEdit]) or (dsPo.State in [dsInsert, dsEdit]) or (dsPoItem.State in [dsInsert, dsEdit]) then
  begin
    if MessageDlg('Você está em modo de edição, deseja salvar e visualizar a realização por processo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      btnSalvarClick(nil)
    else
      btnCancelarClick(nil);
  end;
  // Botão Realização do Processo
  str_cd_rotina_atalho := '1807';
  nr_po_gestao         := mskNrPedido.Text;
  cd_cliente_gestao    := edtCodigoCliente.Text;
  nr_processo_gestao   := mskNrProcesso.Text;
  cd_unid_neg_gestao   := mskCodigoUnidade.Text;
  Close;
end;

procedure TfrmGestaoPedido.btnManutPedidoClick(Sender: TObject);
begin
  if (dsProcesso.State in [dsInsert, dsEdit]) or (dsPo.State in [dsInsert, dsEdit]) or (dsPoItem.State in [dsInsert, dsEdit]) then
  begin
    if MessageDlg('Você está em modo de edição, deseja salvar e visualizar a manutenção de Pedido?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      btnSalvarClick(nil)
    else
      btnCancelarClick(nil);
  end;
  // Botão Manutenção do Processo
  str_cd_rotina_atalho := '1801';
  nr_po_gestao         := mskNrPedido.Text;
  cd_cliente_gestao    := edtCodigoCliente.Text;
  nr_processo_gestao   := mskNrProcesso.Text;
  cd_unid_neg_gestao   := mskCodigoUnidade.Text;
  Close;
end;

procedure TfrmGestaoPedido.btnSairClick(Sender: TObject);
begin
  if (dsProcesso.State in [dsInsert, dsEdit]) or (dsPo.State in [dsInsert, dsEdit]) or (dsPoItem.State in [dsInsert, dsEdit]) then
  begin
    if MessageDlg('Você está em modo de edição, deseja salvar e sair?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      btnSalvarClick(nil)
    else
      btnCancelarClick(nil);
  end;
  // Sai da Gestão e limpa rotina de atalho
  Close;
  str_cd_rotina_atalho := '';
  nr_po_gestao         := '';
  cd_cliente_gestao    := '';
  nr_processo_gestao   := '';
end;

procedure TfrmGestaoPedido.pgctrlGestaoPedidoChange(Sender: TObject);
begin
  btnExcluir.Enabled      := False;
  dbnavItemPedido.Visible := False;
  shpNavigator.Visible    := False;
  btnRepassaItens.Enabled := (qryProcessoIN_DADOS_IGUAIS_ITENS.AsString = '0');

  // Abertura
  if pgctrlGestaoPedido.ActivePage = tsPedido then
  begin
    if (mskNrPedido.Text <> '') and (mskNrPedido.Text <> vNrPedidoGestao) then
      mskNrPedidoExit(nil)
    else
    if (mskNrProcesso.Text <> '') and (mskNrProcesso.Text <> vNrProcessoGestao) then
      mskNrProcessoExit(nil)
    else
      mskCodigoUnidade.SetFocus;
  end;

  //Dados Básicos
  if pgctrlGestaoPedido.ActivePage = tsDadosBasicos then
  begin
    // abre incoterm
    qryIncoterm.Close;
    qryIncoterm.Open;
    // abre tabela tipo pedido
    qryTipoPedido.Close;
    qryTipoPedido.Open;
  end;

  //itens do pedido
  if pgctrlGestaoPedido.ActivePage = tsPedidoItem then
  begin
    pgctrlItem.ActivePage := tsAnalise;
    // abre tabela tipo de calculo
    qryTipoCalculoItem.Close;
    qryTipoCalculoItem.Open;

    dbnavItemPedido.Visible := True;
    shpNavigator.Visible    := True;
    AtualizaDisplayItem;
  end;
end;

procedure TfrmGestaoPedido.pgctrlGestaoPedidoChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if vInserindoNovaGestao then
  begin
    MessageDlg('Para sair é necessário salvar ou cancelar a nova gestão de pedido!',mtError,[mbOk],0);
    AllowChange := False;
  end
  else
  begin
    if pgctrlGestaoPedido.ActivePage = tsPedidoItem then
      AllowChange := (not (dsPoItem.State in [dsInsert, dsEdit]))
    else
      AllowChange := (not (dsProcesso.State in [dsInsert, dsEdit]));

    if not AllowChange then
      MessageDlg('Para sair é necessário salvar ou cancelar!',mtError,[mbOk],0);
  end;
end;

procedure TfrmGestaoPedido.mskCodigoUnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if pgctrlGestaoPedido.ActivePage = tsPedido then
    begin
      if Sender = mskCodigoUnidade      then btnConsultaUnidadeClick(btnConsultaUnidade);
      if Sender = mskNrPedido           then btnConsultaPedidoClick(btnConsultaPedido);
      if Sender = mskNrProcesso         then btnConsultaProcessoClick(btnConsultaProcesso);
      if Sender = edtCodigoCliente      then btnConsultaClienteClick(btnConsultaCliente);
      if Sender = dbedtCodigoServico    then btnConsultaServicoClick(btnConsultaServico);
      if Sender = dbedtCodigoArea       then btnConsultaAreaClick(btnConsultaArea);
      if Sender = dbedtCodigoImportador then btnConsultaImportadorClick(btnConsultaImportador);
      if Sender = dbedtCodigoExportador then btnConsultaExportadorClick(btnConsultaExportador);
    end
    else
    if pgctrlGestaoPedido.ActivePage = tsDadosBasicos then
    begin
      if Sender = dbedtCodigoContato     then btnConsultaContatoClick(btnConsultaContato);
      if Sender = dbedtCodigoAnalista    then btnConsultaAnalistaClick(btnConsultaAnalista);
      if Sender = dbedtCodigoLocalDesembarque then btnConsultaLocalDesembarqueClick(btnConsultaLocalDesembarque);
      if Sender = dbedtCodigoEmbarcacao  then btnConsultaEmbarcacaoClick(btnConsultaEmbarcacao);
      if Sender = dbedtCodigoAgenteCarga then btnConsultaAgenteCargaClick(btnConsultaAgenteCarga);
      if Sender = dbedtNrViagem          then btnConsultaNrViagemClick(btnConsultaNrViagem);
      if Sender = dbedtCodPaisOrigem     then btnConsultaPaisOrigemClick(btnConsultaPaisOrigem);
    end
    else if pgctrlGestaoPedido.ActivePage = tsPedidoItem then
    begin
      if Sender   = dbedt_fabricante           then btn_co_nm_fabricClick(btn_co_nm_fabric);

      if pgctrlItem.ActivePage = tsGestao      then
      begin
        if Sender = dbedtCodigoMercadoria      then btnConsultaMercadoriaClick(btnConsultaMercadoria);
        if Sender = dbedtCodigoAreaItem        then btnConsultaAreaItemClick(btnConsultaAreaItem);
        if Sender = dbedtCodigoLocalDesembarqueItem then btnConsultaLocalDesembarqueItemClick(btnConsultaLocalDesembarqueItem);
        if Sender = dbedtCodigoEmbarcacaoItem  then btnConsultaEmbarcacaoItemClick(btnConsultaEmbarcacaoItem);
        if Sender = dbedtCodigoAgenteCargaItem then btnConsultaAgenteCargaItemClick(btnConsultaAgenteCargaItem);
        if Sender = dbedtNrViagemItem          then btnConsultaNrViagemItemClick(btnConsultaNrViagemItem);
        if Sender = dbedtCodigoUnidMed         then btnConsultaUnidMedClick(btnConsultaUnidMed);
        if Sender = dbedt_moeda_negociada      then btn_moeda_negociadaClick(btn_moeda_negociada);
        if Sender = dbedtCodPaisOrigemItem     then btnConsultaPaisOrigemItemClick(btnConsultaPaisOrigemItem);
      end;
    end;
  end;
end;

procedure TfrmGestaoPedido.btnConsultaUnidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskCodigoUnidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edtNomeUnidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',mskCodigoUnidade.Text,'NM_UNID_NEG')
end;

procedure TfrmGestaoPedido.btnConsultaProdutoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskCodigoProduto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  else
    edtNomeProduto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO',mskCodigoProduto.Text,'NM_PRODUTO')
end;

procedure TfrmGestaoPedido.btnConsultaClienteClick(Sender: TObject);
begin
  {if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
      qryProcessoCD_CLIENTE.Value := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',
        ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
        ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'],'CD_EMPRESA',nil);
  end
  else
    edtNomeCliente.Text := ConsultaLookup('TEMPRESA_NAC','CD_EMPRESA',dbedtCodigoCliente.Text,'NM_EMPRESA');}
  if Sender is TSpeedButton then
  begin
    edtCodigoCliente.Text := ConsultaOnLineExFiltro('TEMPRESA_NAC', 'Clientes',
        ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
        ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'], 'CD_EMPRESA',
        'CD_EMPRESA IN (SELECT CD_CLIENTE FROM TCLIENTE_HABILITACAO WHERE IN_ATIVO = ''1'' AND CD_UNID_NEG = ''' + mskCodigoUnidade.Text + ''' AND CD_PRODUTO = ''06'')', nil);
    if vInserindoNovaGestao then
      qryProcessoCD_CLIENTE.AsString := edtCodigoCliente.Text;
    edtCodigoCliente.SetFocus;
  end
  else
    edtNomeCliente.Text := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', edtCodigoCliente.Text, 'NM_EMPRESA');
  if not vInserindoNovaGestao then
  begin
    if qryProcesso.Active then
    begin
      qryProcesso.Close;
      mskNrPedido.Clear;
    end;
    ExibeComponente(False);
  end;
  if edtNomeCliente.Text <> '' then
    cd_cliente_gestao := edtCodigoCliente.Text
  else
    cd_cliente_gestao := '';
end;

procedure TfrmGestaoPedido.btnConsultaServicoClick(Sender: TObject);
var
  vSQLText : string;
begin
  vSQLText :=
      'SELECT CD_SERVICO, NM_SERVICO FROM TSERVICO S (NOLOCK) '+
      'WHERE S.CD_SERVICO IN ( '+
      '        SELECT C.CD_SERVICO FROM TCLIENTE_SERVICO C (NOLOCK) '+
      '        WHERE C.IN_ATIVO    = ''1'' '+
      '          AND C.CD_CLIENTE  = ''' + edtCodigoCliente.Text + ''' ' +
      '          AND C.CD_UNID_NEG = ''' + mskCodigoUnidade.Text   + ''' ' +
      '          AND C.CD_PRODUTO  = ''' + mskCodigoProduto.Text   + ''')' +
      '  AND S.IN_ATIVO    = ''1'' ';

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then
      Exit;
    qryProcessoCD_SERVICO.Value := ConsultaOnLineExSQL(vSQLText, 'Serviços', ['CD_SERVICO', 'NM_SERVICO'], ['Código', 'Nome'], 'CD_SERVICO', nil);
    vAlterouServico := True; // Incluido por Michel em 23/08/2010 para atualizar automaticamente o followup
  end
  else
    edtNomeServico.Text := ConsultaLookup('TSERVICO', 'CD_SERVICO', dbedtCodigoServico.Text, 'NM_SERVICO');
end;

procedure TfrmGestaoPedido.btnConsultaAreaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    qryProcessoCD_AREA.Value := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA'],['Código','Área'],'CD_AREA',nil);
  end
  else
    edtNomeArea.Text := ConsultaLookUp('TAREA','CD_AREA',dbedtCodigoArea.Text,'NM_AREA');
end;

procedure TfrmGestaoPedido.btnConsultaPedidoClick(Sender: TObject);
var
  vListAux: TStringList;
begin
  if vInserindoNovaGestao then
  begin
    vListAux := TStringList.Create;
    vListAux.Add('SELECT NR_PROCESSO, DT_ABERTURA');
    vListAux.Add('FROM TPO (NOLOCK)');
    vListAux.Add('WHERE NR_PROCESSO NOT IN (SELECT NR_REFERENCIA FROM TPROCESSO (NOLOCK) WHERE NR_REFERENCIA IS NOT NULL)');

    mskNrPedido.Text := ConsultaOnLineExSQLList(vListAux,'Pedidos',['NR_PROCESSO','DT_ABERTURA'],['Pedido','Dt Abertura'],'NR_PROCESSO',nil);
    vListAux.Free;
  end
  else
  begin
    mskNrPedido.Text := ConsultaOnLineExSQL(
      'SELECT NR_REFERENCIA, NR_PROCESSO, '+
      '  (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, DT_ABERTURA '+
      'FROM TPROCESSO (NOLOCK) '+
      'WHERE CD_UNID_NEG = '''+ mskCodigoUnidade.Text +''' '+
      '  AND CD_PRODUTO  = '''+ mskCodigoProduto.Text +''' '+
      '  AND ISNULL(NR_REFERENCIA, '''') <> '''' ','Pedidos',
      ['NR_REFERENCIA','NR_PROCESSO','NM_EMPRESA','DT_ABERTURA'],
      ['Pedido','Processo','Cliente','Dt. Abertura'],'NR_REFERENCIA',nil);
  end;
  mskNrPedidoExit(nil);
end;

procedure TfrmGestaoPedido.btnConsultaProcessoClick(Sender: TObject);
var vUltimosProcesso: string;
begin
  if chkUltimosProcessos.Checked then
    vUltimosProcesso := '  AND DT_ABERTURA > GETDATE() - '+ IntToStr(vQtdeDiasConsProc)
  else
    vUltimosProcesso := '';

  mskNrProcesso.Text := ConsultaOnLineExSQL(
    'SELECT SUBSTRING(NR_PROCESSO,5,14) NR_PROCESSO, NR_REFERENCIA, '+
    '  (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_CLIENTE) NM_EMPRESA, DT_ABERTURA '+
    'FROM TPROCESSO (NOLOCK) '+
    'WHERE CD_UNID_NEG = '''+ mskCodigoUnidade.Text +''' '+
    '  AND CD_PRODUTO  = '''+ mskCodigoProduto.Text +''' '+
    '  AND ISNULL(NR_REFERENCIA, '''') <> '''' '+ vUltimosProcesso,'Pedidos',
    ['NR_PROCESSO','NR_REFERENCIA','NM_EMPRESA','DT_ABERTURA'],
    ['Processo','Pedido','Cliente','Dt. Abertura'],'NR_PROCESSO',nil);
  mskNrProcessoExit(nil);
end;

procedure TfrmGestaoPedido.mskCodigoUnidadeExit(Sender: TObject);
begin
  ValCodEdt(mskCodigoUnidade);
  if Trim(edtNomeUnidade.Text) = '' then
  begin
    MessageDlg('Unidade não encontrada, sem habilitação ou desativada!',mtError,[mbOK],0);
    mskCodigoUnidade.SetFocus;
  end
  else
  if Trim(edtNomeProduto.Text) <> '' then
    if not ValidaHabilitacao(mskCodigoUnidade.Text, mskCodigoProduto.Text) then mskCodigoUnidade.SetFocus;
end;

procedure TfrmGestaoPedido.mskCodigoProdutoExit(Sender: TObject);
begin
 {ValCodEdt(mskCodigoProduto);
  if Trim(edtNomeProduto.Text) = '' then
  begin
    MessageDlg('Produto não encontrado, sem habilitação ou desativado!',mtError,[mbOK],0);
    mskCodigoProduto.SetFocus;
  end
  else
  if Trim(edtNomeUnidade.Text) <> '' then
    if not ValidaHabilitacao(mskCodigoUnidade.Text, mskCodigoProduto.Text) then mskCodigoProduto.SetFocus; }
end;

procedure TfrmGestaoPedido.dbedtCodigoClienteExit(Sender: TObject);
var
  vHabilitacao: Integer;
begin
  //ValidCodigo(edtCodigoCliente);

  if Length(Trim(edtCodigoCliente.Text)) in [1..4] then
    edtCodigoCliente.Text := Copy('0000' + Trim(edtCodigoCliente.Text), Length(Trim(edtCodigoCliente.Text)), 5);

  if (Trim(mskNrPedido.Text) = '')  or (Trim(edtCodigoCliente.Text) = '') then
  begin
    vNrPedidoGestao   := '';
    vNrProcessoGestao := '';
    vCdEmpresaGestao  := '';
    Exit;
  end;

  vHabilitacao := StrToInt(ConsultaLookUPSQL(
      'SELECT COUNT(*) AS VALIDO FROM TCLIENTE_HABILITACAO (NOLOCK) '+
      'WHERE CD_CLIENTE  = '''+ edtCodigoCliente.Text +''' '+
      '  AND CD_UNID_NEG = '''+ mskCodigoUnidade.Text   +''' '+
      '  AND CD_PRODUTO  = '''+ mskCodigoProduto.Text   +''' '+
      '  AND IN_ATIVO    = ''1'' ','VALIDO'));
  if vHabilitacao < 1 then
  begin
    MessageDlg('Cliente sem habilitação para esta Unidade/Produto!', mtError, [mbOK], 0);
    edtNomeCliente.Text := '';
    if edtCodigoCliente.Enabled then
      edtCodigoCliente.SetFocus;
  end
  else
    mskNrPedidoExit(mskNrPedido);
end;

procedure TfrmGestaoPedido.dbedtCodigoServicoExit(Sender: TObject);
var
  vHabilitacao: Integer;
begin
  ValidCodigo(dbedtCodigoServico);

  if Trim(edtNomeServico.Text) <> '' then
  begin
    vHabilitacao := StrToInt(ConsultaLookUPSQL(
      'SELECT COUNT(*) AS VALIDO FROM TCLIENTE_SERVICO (NOLOCK) '+
      'WHERE CD_SERVICO  = '''+ dbedtCodigoServico.Text +''' '+
      '  AND CD_CLIENTE  = '''+ edtCodigoCliente.Text +''' '+
      '  AND CD_UNID_NEG = '''+ mskCodigoUnidade.Text   +''' '+
      '  AND CD_PRODUTO  = '''+ mskCodigoProduto.Text   +''' '+
      '  AND IN_ATIVO    = ''1'' ','VALIDO'));
    if vHabilitacao < 1 then
    begin
      MessageDlg('Serviço sem habilitação para esta unidade/produto/cliente!',mtError,[mbOK],0);
      edtNomeServico.Text := '';
      dbedtCodigoServico.SetFocus;
    end
    else
    begin
      {if not vInserindoNovaGestao and (vServicoOld <> dbedtCodigoServico.Text) then
        btnAtualizaServico.Visible := True;}
    end;
  end;
end;

procedure TfrmGestaoPedido.dbedtCodigoAreaExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoArea)
end;

procedure TfrmGestaoPedido.mskNrPedidoExit(Sender: TObject);
var
  vProc: string;
  vQtdPedidos: Integer;
begin
  if vInserindoNovaGestao then
  begin
    if (Trim(mskNrPedido.Text) = '') or (Trim(edtCodigoCliente.Text) = '') or (Trim(dbedtCodigoServico.Text) = '') then
    begin
      if (Trim(mskNrPedido.Text) = '') then
      begin
        MessageDlg('Para continuar com a abertura do processo é necessário informar o número do Pedido!',mtError,[mbOK],0);
        if mskNrPedido.Enabled then
          mskNrPedido.SetFocus;
      end
      else if (Trim(edtCodigoCliente.Text) = '') then
      begin
        MessageDlg('Para continuar com a abertura do processo é necessário informar o Cliente!',mtError,[mbOK],0);
        if edtCodigoCliente.Enabled then edtCodigoCliente.SetFocus;
      end
      else if (Trim(dbedtCodigoServico.Text) = '') then
      begin
        MessageDlg('Para continuar com a abertura do processo é necessário informar o Serviço!',mtError,[mbOK],0);
        if dbedtCodigoServico.Enabled then
          dbedtCodigoServico.SetFocus;
      end;
    end
    else
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT NR_PROCESSO, IN_CANCELADO FROM TPROCESSO (NOLOCK) ');
        SQL.Add('WHERE CD_UNID_NEG   = :CD_UNID_NEG ');
        SQL.Add('  AND CD_PRODUTO    = :CD_PRODUTO ');
        SQL.Add('  AND NR_REFERENCIA = :NR_REFERENCIA ');
        SQL.Add('  AND CD_CLIENTE    = :CD_CLIENTE ');
        ParamByName('CD_UNID_NEG').AsString   := Trim(mskCodigoUnidade.Text);
        ParamByName('CD_PRODUTO').AsString    := Trim(mskCodigoProduto.Text);
        ParamByName('NR_REFERENCIA').AsString := Trim(mskNrPedido.Text);
        ParamByName('CD_CLIENTE').AsString    := Trim(edtCodigoCliente.Text);
        Open;
        vProc := Fields[0].AsString;
        if not IsEmpty then
        begin
          //verifica se o processo esta cancelado
          if Fields[1].AsString = '1' then
            if MessageDlg('Essa referência está atribuída a um processo cancelado.' + #13#10 +
                          'Deseja desvincular a referência do processo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              Close;
              SQL.Clear;
              SQL.Add('UPDATE TPROCESSO SET NR_REFERENCIA = NULL ');
              SQL.Add('WHERE NR_PROCESSO = '''+ vProc +'''');
              ExecSQL;
              Free;
              mskNrPedidoExit(nil);
              Exit;
            end
            else
            begin
              MessageDlg('Processo cancelado! Informe outro Nr. de Pedido.', mtError, [mbOK], 0);
              mskNrPedido.SelectAll;
              mskNrPedido.SetFocus;
              Free;
              Exit;
            end
          else
            if MessageDlg('Já existem dados para esta referência.' + #13#10 +
                          'Deseja visualizar os dados para consulta/alteração?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              //cancela operação de inclusão e abre a gestão
              Cancelar;
              mskNrPedidoExit(nil);
              Free;
              Exit;
            end
            else
            begin
              mskNrPedido.SelectAll;
              mskNrPedido.SetFocus;
              Free;
              Exit;
            end;
        end;
        Free;
        if ValidaPedido then
        begin
          qryPo.Close;
          qryPo.ParamByName('NR_PROCESSO').AsString := mskNrPedido.Text;
          qryPo.ParamByName('CD_EMPRESA').AsString := edtCodigoCliente.Text;
          qryPo.Open;

          qryProcessoCD_AREA.Value       := qryPoCD_AREA.AsString;
          qryProcessoCD_IMPORTADOR.Value := qryPoCD_IMPORTADOR.AsString;
          qryProcessoCD_EXPORTADOR.Value := qryPoCD_EXPORTADOR.AsString;
        end;
      end;
    end;
  end
  else
  begin
    if Trim(mskNrPedido.Text) = '' then
    begin
      vNrPedidoGestao   := '';
      vNrProcessoGestao := '';
      vCdEmpresaGestao  := '';
      Exit;
    end;

    // Verifica se a referencia existe e quantas existem iguais
    vQtdPedidos := 0;
    // Incluido abaixo nas consultas o filtro por Unidade, para exibir apenas os pedidos da Unidade selecionada - Michel - 29/07/2010
    if Trim(edtCodigoCliente.Text) = '' then
    begin
      vQtdPedidos := StrToInt(ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                                ' FROM TPO  PO (NOLOCK) ' +
                                                '    INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = PO.NR_PROCESSO ' +
                                                '                                   AND P.CD_CLIENTE    = PO.CD_EMPRESA ' +
                                                ' WHERE PO.NR_PROCESSO = ''' + mskNrPedido.Text + ''' ' +
                                                '   AND P.CD_UNID_NEG = ''' + mskCodigoUnidade.Text + ''' ' +
                                                '   AND P.IN_CANCELADO = ''0''', 'QTD'));
      if vQtdPedidos > 1 then
      begin
        {edtCodigoCliente.Text := ConsultaOnLineExSQL(' SELECT PO.NR_PROCESSO, PO.CD_EMPRESA, EN.NM_EMPRESA ' +
                                                     ' FROM TPO PO INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PO.CD_EMPRESA ' +
                                                     ' WHERE PO.NR_PROCESSO = ''' + mskNrPedido.Text + ''' ' +
                                                     '   AND EXISTS (SELECT TOP 1 EP.NR_REFERENCIA ' +
                                                     '               FROM TESTAGIO_PROCESSO EP INNER JOIN TPROCESSO P ON P.NR_PROCESSO = EP.NR_PROCESSO_ADM ' +
                                                     '               WHERE EP.NR_REFERENCIA = PO.NR_PROCESSO ' +
                                                     '                 AND EP.CD_EMPRESA    = PO.CD_EMPRESA ' +
                                                     '                 AND P.IN_CANCELADO   = ''0'' ' +
                                                     '                 AND P.CD_UNID_NEG    = ''' + mskCodigoUnidade.Text + ''') ', 'Selecione o pedido',
                                                     ['NR_PROCESSO', 'CD_EMPRESA', 'NM_EMPRESA'], ['Pedido', 'Cód Cliente', 'Nome Cliente'], 'CD_EMPRESA', nil, edtCodigoCliente.Text);}
        // Comentado acima e utilizando abaixo para não fazer JOIN com a TESTAGIO_PROCESSO e que retirava itens da consulta - Michel - 29/07/2010
        edtCodigoCliente.Text := ConsultaOnLineExSQL(' SELECT PO.NR_PROCESSO, PO.CD_EMPRESA, EN.NM_EMPRESA ' +
                                                     ' FROM TPO PO INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PO.CD_EMPRESA ' +
                                                     ' WHERE PO.NR_PROCESSO = ''' + mskNrPedido.Text + ''' ' +
                                                     '   AND EXISTS (SELECT TOP 1 NR_REFERENCIA ' +
                                                     '               FROM TPROCESSO P ' +
                                                     '               WHERE NR_REFERENCIA  = PO.NR_PROCESSO ' +
                                                     '                 AND CD_CLIENTE     = PO.CD_EMPRESA ' +
                                                     '                 AND IN_CANCELADO   = ''0'' ' +
                                                     '                 AND CD_UNID_NEG    = ''' + mskCodigoUnidade.Text + ''') ', 'Selecione o pedido',
                                                     ['NR_PROCESSO', 'CD_EMPRESA', 'NM_EMPRESA'], ['Pedido', 'Cód Cliente', 'Nome Cliente'], 'CD_EMPRESA', nil, edtCodigoCliente.Text);
      end
      else if vQtdPedidos = 1 then
        //edtCodigoCliente.Text := ConsultaLookUP('TPO', 'NR_PROCESSO', mskNrPedido.Text, 'CD_EMPRESA');
        // Comentado acima e utilizando abaixo para trazer apenas o não cancelado - Michel - 29/07/2010
        edtCodigoCliente.Text := ConsultaLookUPSQL(' SELECT PO.CD_EMPRESA ' +
                                                   ' FROM TPO  PO (NOLOCK) ' +
                                                   '    INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_REFERENCIA = PO.NR_PROCESSO ' +
                                                   '                                   AND P.CD_CLIENTE    = PO.CD_EMPRESA ' +
                                                   ' WHERE PO.NR_PROCESSO = ''' + mskNrPedido.Text + ''' ' +
                                                   '   AND P.CD_UNID_NEG = ''' + mskCodigoUnidade.Text + ''' ' +
                                                   '   AND P.IN_CANCELADO = ''0''', 'CD_EMPRESA');
    end;
//    if Trim(mskNrPedido.Text) = vNrPedidoGestao then Exit;

    //mskNrPedido.Text := UpperCase(mskNrPedido.Text);
    mskNrProcesso.Clear;

    qryProcesso.Close;
    qryProcesso.ParamByName('CD_UNID_NEG').AsString   := Trim(mskCodigoUnidade.Text);
    qryProcesso.ParamByName('CD_PRODUTO').AsString    := Trim(mskCodigoProduto.Text);
    qryProcesso.ParamByName('NR_REFERENCIA').AsString := Trim(mskNrPedido.Text);
    if Trim(edtCodigoCliente.Text) <> '' then
      qryProcesso.ParamByName('CD_CLIENTE').AsString    := Trim(edtCodigoCliente.Text)
    else
      qryProcesso.ParamByName('CD_CLIENTE').AsString    := '00000';
    qryProcesso.Open;

    if qryProcesso.IsEmpty then
    begin
      if MessageDlg('Não existe gestão para este Cliente com esse Nr. de Pedido.' +#13#10+
                    'Deseja abrir um processo de gestão com esse pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        vNrPedidoGestao   := Trim(mskNrPedido.Text);
        vNrProcessoGestao := '';
        vCdEmpresaGestao  := Trim(edtCodigoCliente.Text);
        qryPo.Close;
        qryPo.ParamByName('NR_PROCESSO').AsString := vNrPedidoGestao;
        qryPo.ParamByName('CD_EMPRESA').AsString := vCdEmpresaGestao;
        qryPo.Open;
        btnIncluirClick(nil);
        mskNrPedido.Text      := vNrPedidoGestao;
        edtCodigoCliente.Text := vCdEmpresaGestao;
      end
      else
      begin
        mskNrPedido.SelectAll;
        mskNrPedido.SetFocus;
        ExibeComponente(False);
        Exit;
      end;
    end
    else
    if qryProcessoIN_CANCELADO.AsString = '1' then
    begin
      MessageDlg('Processo cancelado, por favor digite outro Pedido!', mtInformation, [mbOK], 0);
      mskNrPedido.SelectAll;
      mskNrPedido.SetFocus;
      ExibeComponente(False);
      Exit;
    end
    else
    begin
      qryPo.Close;
      qryPo.ParamByName('NR_PROCESSO').AsString := Trim(mskNrPedido.Text);
      qryPo.ParamByName('CD_EMPRESA').AsString  := Trim(edtCodigoCliente.Text);
      qryPo.Open;

      qryPoItem.Close;
      qryPoItem.ParamByName('NR_PROCESSO').AsString := Trim(mskNrPedido.Text);
      qryPoItem.ParamByName('CD_EMPRESA').AsString  := Trim(edtCodigoCliente.Text);
      qryPoItem.Open;
      dsPoItem.AutoEdit := not qryPoItem.IsEmpty;

      vNrPedidoGestao       := mskNrPedido.Text;
      vNrProcessoGestao     := qryProcessoNR_PROCESSO.AsString;
      vServicoOld           := qryProcessoCD_SERVICO.AsString;
      vCdEmpresaGestao      := qryProcessoCD_CLIENTE.AsString;
      mskNrProcesso.Text    := Copy(vNrProcessoGestao,5,14);
      txtNrProcesso.Caption := Copy(vNrProcessoGestao,5,14);
      txtNrPedido.Caption   := vNrPedidoGestao;
      edtCodigoCliente.Text := vCdEmpresaGestao;
      ExibeComponente(True);

      btnAtualizaServico.Visible := Str_Cd_Cargo = '001';
    end;
  end;
end;

procedure TfrmGestaoPedido.mskNrProcessoExit(Sender: TObject);
var
  vNrProcesso: string[18];
begin
  //faz a pesquisa pelo numero de processo digitado
  if Trim(mskNrProcesso.Text) = '' then
  begin
    vNrPedidoGestao   := '';
    vNrProcessoGestao := '';
    vCdEmpresaGestao  := '';
    Exit;
  end;
  vNrProcesso := mskCodigoUnidade.Text + mskCodigoProduto.Text + Trim(mskNrProcesso.Text);
  if vNrProcesso = vNrProcessoGestao then
    Exit;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT NR_REFERENCIA, CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = '''+ vNrProcesso +''' ');
    Open;
    vNrPedidoGestao  := Fields[0].AsString;
    vCdEmpresaGestao := Fields[1].AsString;
    Free;
  end;
  mskNrPedido.Clear;

  qryProcesso.Close;
  qryProcesso.ParamByName('CD_UNID_NEG').AsString   := Trim(mskCodigoUnidade.Text);
  qryProcesso.ParamByName('CD_PRODUTO').AsString    := Trim(mskCodigoProduto.Text);
  qryProcesso.ParamByName('NR_REFERENCIA').AsString := Trim(vNrPedidoGestao);
  qryProcesso.ParamByName('CD_CLIENTE').AsString    := Trim(vCdEmpresaGestao);
  qryProcesso.Open;

  if qryProcesso.IsEmpty then
  begin
    MessageDlg('Nr. de Processo não encontrado!',mtError,[mbOk],0);
    mskNrProcesso.SelectAll;
    mskNrProcesso.SetFocus;
    ExibeComponente(False);
    Exit;
  end
  else
  begin
    if qryProcessoIN_CANCELADO.AsString = '1' then
    begin
      MessageDlg('Processo cancelado, por favor digite outro Processo!',mtInformation,[mbOK],0);
      mskNrProcesso.SelectAll;
      mskNrProcesso.SetFocus;
      ExibeComponente(False);
      Exit;
    end
    else
    begin
      {qryPo.Close;
      qryPo.ParamByName('NR_PROCESSO').AsString := Trim(vNrPedidoGestao);
      qryPo.ParamByName('CD_EMPRESA').AsString  := Trim(vCdEmpresaGestao);
      qryPo.Open;

      qryPoItem.Close;
      qryPoItem.ParamByName('NR_PROCESSO').AsString := Trim(vNrPedidoGestao);
      qryPoItem.ParamByName('CD_EMPRESA').AsString  := Trim(vCdEmpresaGestao);
      qryPoItem.Open;
      dsPoItem.AutoEdit := not qryPoItem.IsEmpty;

      vNrPedidoGestao       := qryProcessoNR_REFERENCIA.AsString;
      vNrProcessoGestao     := qryProcessoNR_PROCESSO.AsString;
      vCdEmpresaGestao      := qryProcessoCD_CLIENTE.AsString;
      vServicoOld           := qryProcessoCD_SERVICO.AsString;
      mskNrPedido.Text      := vNrPedidoGestao;
      txtNrPedido.Caption   := vNrPedidoGestao;
      edtCodigoCliente.Text := vCdEmpresaGestao;
      txtNrProcesso.Caption := Copy(vNrProcessoGestao, 5, 14);
      ExibeComponente(True);}

      // Comentado acima e utilizando abaixo para chamar o tratamento do Pedido e preencher os campos da mesma forma - Michel - 26/05/2010
      mskNrPedido.Text      := vNrPedidoGestao;
      txtNrPedido.Caption   := vNrPedidoGestao;
      edtCodigoCliente.Text := vCdEmpresaGestao;
      mskNrPedidoExit(nil);
    end;
  end;
end;

procedure TfrmGestaoPedido.qryProcessoAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmGestaoPedido.qryProcessoAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmGestaoPedido.qryProcessoCalcFields(DataSet: TDataSet);
begin
  //numero do processo
  qryProcessocalcNrProcesso.AsString  := Copy(qryProcessoNR_PROCESSO.AsString, 5, 10);
  qryProcessocalcNomeUnidade.AsString := ConsultaLookup('TUNID_NEG','CD_UNID_NEG',qryProcessoCD_UNID_NEG.Value,'AP_UNID_NEG');
  qryProcessocalcNomeProduto.AsString := ConsultaLookup('TPRODUTO','CD_PRODUTO',qryProcessoCD_PRODUTO.Value,'AP_PRODUTO');
  qryProcessocalcModalidade.AsString  := ConsultaLookup('TVIA_TRANSP_BROKER','CD_VIA_TRANSP',ConsultaLookup('TSERVICO','CD_SERVICO', qryProcessoCD_SERVICO.Value,'CD_VIA_TRANSPORTE'),'NM_VIA_TRANSP');
end;

procedure TfrmGestaoPedido.btnConsultaExportadorClick(Sender: TObject);
var
vExportador:string;
begin
  vExportador:= ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedtCodigoExportador.Text,'IN_DECLARACAO_DETENTOR');
  if vExportador='1' then
  begin
    lblatencao.Visible:=true;
  end
  else
  begin
    lblatencao.Visible:=false;
  end;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    qryProcessoCD_EXPORTADOR.Value := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, SUBSTRING(P.NM_PAIS,1,35), RTRIM(END_EMPRESA) + '', '' + END_NUMERO ENDERECO ' +
    ' FROM TEMPRESA_EST E, TPAIS_BROKER P WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = ''1'' AND IN_ATIVO = ''1''','Exportadores',['CD_EMPRESA', 'NR_CLIENTE', 'NM_EMPRESA', 'NM_PAIS', 'ENDERECO'],['Código', 'Cod. no Cliente', 'Nome', 'País', 'Endereço'],'CD_EMPRESA',nil)
  end
  else
    edtNomeExportador.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA = ''' + dbedtCodigoExportador.Text + ''' AND IN_ATIVO = ''1''', 'NM_EMPRESA');
end;

procedure TfrmGestaoPedido.btnConsultaImportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    qryProcessoCD_IMPORTADOR.Value := ConsultaOnLineExFiltro('TEMPRESA_NAC','Importadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA', 'IN_ATIVO = ''1''', nil);
  end
  else
    edtNomeImportador.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = ''' + dbedtCodigoImportador.Text + ''' AND IN_ATIVO = ''1''', 'NM_EMPRESA');
end;

procedure TfrmGestaoPedido.btnConsultaContatoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not vInserindoNovaGestao then
      if not PoeEmEdicao(qryProcesso) then Exit;
    qryProcessoCD_ANALISTA_CLIENTE.Value := ConsultaOnLineExSQL(
      'SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO (NOLOCK) '+
      'WHERE CD_CARGO IN (''040'')','Analistas Cliente',
      ['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil);
  end
  else
    edtNomeContato.Text := ConsultaLookup('TUSUARIO','CD_USUARIO',dbedtCodigoContato.Text,'NM_USUARIO');
end;

procedure TfrmGestaoPedido.btnConsultaAnalistaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not vInserindoNovaGestao then
      if not PoeEmEdicao(qryProcesso) then Exit;
    qryProcessoCD_ANALISTA_COMISSARIA.Value := ConsultaOnLineExSQL(
      'SELECT CD_USUARIO, NM_USUARIO, NM_EMAIL FROM TUSUARIO (NOLOCK) '+
      'WHERE CD_CARGO <> ''040''','Analistas Indaiá',
      ['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil);
  end
  else
    edtNomeAnalista.Text := ConsultaLookup('TUSUARIO','CD_USUARIO',dbedtCodigoAnalista.Text,'NM_USUARIO');
end;

procedure TfrmGestaoPedido.btnConsultaLocalDesembarqueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      qryProcessoCD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end
  else
    edtNomeLocalDesembarque.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedtCodigoLocalDesembarque.Text,'DESCRICAO');
end;

procedure TfrmGestaoPedido.btnConsultaEmbarcacaoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    if (Sender as TSpeedButton).Enabled then
      qryProcessoCD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',nil)
  end
  else
    edtNomeEmbarcacao.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',dbedtCodigoEmbarcacao.Text,'NM_EMBARCACAO');
end;

procedure TfrmGestaoPedido.btnConsultaNrViagemClick(Sender: TObject);
begin
  if Trim(edtNomeEmbarcacao.Text) = '' then
  begin
    MessageDlg('Embarcação inválida! Verifique o código digitado.',mtError,[],0);
    dbedtCodigoEmbarcacao.SetFocus;
    Exit;
  end;
  if not PoeEmEdicao(qryProcesso) then Exit;

  qryProcessoNR_VIAGEM.AsString := ConsultaOnLineExSQL(
    'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, V.NR_MANIFESTO ' +
    'FROM   TVIAGEM V ( NOLOCK ), TARMAZEM A ( NOLOCK ), TLOCAL_EMBARQUE E ( NOLOCK ) ' +
    'WHERE V.CD_UNID_NEG           = ''' + mskCodigoUnidade.Text +''' '+
    '  AND V.CD_PRODUTO            = ''' + mskCodigoProduto.Text +''' '+
    '  AND V.CD_EMBARCACAO         = ''' + dbedtCodigoEmbarcacao.Text +''' '+
    '  AND V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM ' +
    '  AND V.CD_LOCAL              = E.CODIGO ',
    'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO','NM_ARMAZEM','NR_MANIFESTO'],
    ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Nº Manifesto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem);
end;

procedure TfrmGestaoPedido.dbedtCodigoImportadorExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoImportador);
end;

procedure TfrmGestaoPedido.dbedtCodigoExportadorExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoExportador);
end;

procedure TfrmGestaoPedido.dbedtCodigoContatoExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoContato);
end;

procedure TfrmGestaoPedido.dbedtCodigoAnalistaExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoAnalista);
end;

procedure TfrmGestaoPedido.dbedtCodigoLocalDesembarqueExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoLocalDesembarque);
end;

procedure TfrmGestaoPedido.dbedtCodigoEmbarcacaoExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoEmbarcacao);
end;

procedure TfrmGestaoPedido.dbedtNrViagemExit(Sender: TObject);
begin
  if Trim(dbedtNrViagem.Text) = '' then Exit;
  //verifica se o local de desembarque é válido
  if Trim(edtNomeLocalDesembarque.Text) = '' then
  begin
    MessageDlg('Local de Desembarque inválido! Verifique o código digitado.',mtError,[mbOk],0);
    dbedtCodigoLocalDesembarque.SetFocus;
    Exit;
  end;
  //verifica se a embarcação é válida
  if Trim(edtNomeEmbarcacao.Text) = '' then
  begin
    MessageDlg('Embarcação inválida! Verifique o código digitado.',mtError,[mbOk],0);
    dbedtCodigoEmbarcacao.SetFocus;
    Exit;
  end;
  //verifica se o numero da viagem é valido para os dados informados
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT NR_VIAGEM ');
    SQL.Add('FROM TVIAGEM (NOLOCK)');
    SQL.Add('WHERE CD_UNID_NEG   = '''+ mskCodigoUnidade.Text +''' ');
    SQL.Add('  AND CD_PRODUTO    = '''+ mskCodigoProduto.Text +''' ');
    SQL.Add('  AND CD_EMBARCACAO = '''+ dbedtCodigoEmbarcacao.Text +''' ');
    SQL.Add('  AND CD_LOCAL      = '''+ dbedtCodigoLocalDesembarque.Text +''' ');
    SQL.Add('  AND NR_VIAGEM     = '''+ dbedtNrViagem.Text +''' ');
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('Viagem inexistente ou inválida para essa embarcação/local desembarque.',mtError,[mbOk],0);
      dbedtNrViagem.SetFocus;
    end;
    Free;
  end;
end;

procedure TfrmGestaoPedido.dsProcessoStateChange(Sender: TObject);
begin
  if dsProcesso.State in [dsEdit] then
    AtivaBtnMenu(False, True, True, False, False, False);
end;

procedure TfrmGestaoPedido.qryPoItemCalcFields(DataSet: TDataSet);
begin
  qryPoItem.FieldByName('calcNomeArea').AsString    := ConsultaLookUP('TAREA','CD_AREA',qryPoItemCD_AREA.AsString,'NM_AREA');
  qryPoItem.FieldByName('calcMERCADORIA').AsString  := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',qryPoItemCD_MERCADORIA.AsString,'AP_MERCADORIA');
  qryPoItem.FieldByName('calcNecessitaLI').AsString := '';
  qryPoItem.FieldByName('calcHabilitaDrawBack').AsString:='';
  if qryPoItemIN_DRAWBACK.AsString ='1' then qryPoItem.FieldByName('calcHabilitaDrawBack').AsString := 'ü';
  if qryPoItemIN_NECESSITA_LI.AsBoolean then qryPoItem.FieldByName('calcNecessitaLI').AsString := 'ü' ;
end;

procedure TfrmGestaoPedido.btnAtualizaServicoClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente atualizar o FollowUp com os eventos desse serviço?'+#13#10+
                'Essa operação irá limpar as datas de realização dos '+#13#10+
                'eventos que não forem comum entre o antigo e o novo serviço!', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
    Exit;

  //atualizando o follow-up
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    //atualiza o followup da po
    SQL.Clear;
    SQL.Add('DELETE FROM TFLP_PO ');
    SQL.Add('WHERE NR_PROCESSO = '''+ mskNrPedido.Text +''' ');
    SQL.Add('  AND CD_EMPRESA  = '''+ edtCodigoCliente.Text +''' ');
//    SQL.Add('  AND CD_EVENTO NOT IN ( SELECT CD_EVENTO FROM TSERVICO_EVENTO (NOLOCK) WHERE CD_SERVICO = '''+ dbedtCodigoServico.Text +''' )');
    ExecSQL;
    SQL.Clear;
    SQL.Add('INSERT TFLP_PO ( NR_PROCESSO, CD_EVENTO, IN_APLICAVEL, NR_ORDEM, CD_EMPRESA ) ');
    SQL.Add('SELECT PO.NR_PROCESSO, SE.CD_EVENTO ,''1'', SE.NR_ORDEM, PO.CD_EMPRESA ');
    SQL.Add('FROM TSERVICO_EVENTO SE (NOLOCK), TPO PO (NOLOCK)');
    SQL.Add('WHERE SE.CD_SERVICO = '''+ dbedtCodigoServico.Text +''' ');
    SQL.Add('  AND SE.CD_TIPO_EVENTO = ''00'' ');
//    SQL.Add('  AND SE.CD_EVENTO NOT IN ( SELECT CD_EVENTO FROM TSERVICO_EVENTO (NOLOCK) WHERE CD_SERVICO = '''+ vServicoOld + ''')');
    SQL.Add('  AND PO.NR_PROCESSO = '''+ mskNrPedido.Text +''' ');
    SQL.Add('  AND PO.CD_EMPRESA = '''+ edtCodigoCliente.Text +''' ');
    ExecSQL;

    //atualiza o followup de itens
    {SQL.Clear;
    SQL.Add('DELETE FROM TFLP_PO_ITEM ');
    SQL.Add('WHERE NR_PROCESSO = '''+ mskNrPedido.Text +''' ');
    SQL.Add('  AND CD_EMPRESA  = '''+ edtCodigoCliente.Text +''' ');
//    SQL.Add('  AND CD_EVENTO NOT IN ( SELECT CD_EVENTO FROM TSERVICO_EVENTO (NOLOCK) WHERE CD_SERVICO = ''' + dbedtCodigoServico.Text + ''' )');
    ExecSQL;
    SQL.Clear;
    SQL.Add('INSERT TFLP_PO_ITEM ( NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, CD_EVENTO, IN_APLICAVEL, NR_ORDEM, NR_PARCIAL, CD_EMPRESA ) ');
    SQL.Add('SELECT POI.NR_PROCESSO, POI.NR_ITEM, POI.NR_ITEM_CLIENTE, SE.CD_EVENTO ,''1'', SE.NR_ORDEM, POI.NR_PARCIAL, POI.CD_EMPRESA');
    SQL.Add('FROM TSERVICO_EVENTO SE (NOLOCK), TPO_ITEM POI (NOLOCK) ');
    SQL.Add('WHERE SE.CD_SERVICO = '''+ dbedtCodigoServico.Text +''' ');
    SQL.Add('  AND SE.CD_TIPO_EVENTO = ''01'' ');
//    SQL.Add('  AND SE.CD_EVENTO NOT IN ( SELECT CD_EVENTO FROM TSERVICO_EVENTO (NOLOCK) WHERE CD_SERVICO = ''' + vServicoOld + ''')');
    SQL.Add('  AND POI.NR_PROCESSO = ''' + mskNrPedido.Text + ''' ');
    SQL.Add('  AND POI.CD_EMPRESA = ''' + edtCodigoCliente.Text + ''' ');
    SQL.Add('  AND POI.CD_EMPRESA = '''+ edtCodigoCliente.Text +''' ');
    ExecSQL;}

    // Comentado acima e utilizando a chamada abaixo mantendo as informações dos eventos atuais - Michel - 23/08/2010
    SQL.Clear;
    SQL.Add('EXEC SP_MUDA_SERVICO_PO_ITEM :NR_PROCESSO, :CD_EMPRESA');
    ParamByName('NR_PROCESSO').AsString := mskNrPedido.Text;
    ParamByName('CD_EMPRESA').AsString  := edtCodigoCliente.Text;
    ExecSql;

    vAlterouServico := True;

    Free;
  end;
  //após a mudança de serviço limpa dados de acordo com a via de transporte
  if not (dsProcesso.State in [dsInsert, dsEdit]) then qryProcesso.Edit;
  if ConsultaLookUP('TSERVICO','CD_SERVICO',qryProcessoCD_SERVICO.AsString,'CD_VIA_TRANSPORTE') = '01' then
  begin
    qryProcessoNR_VOO.AsString := '';
  end;
  if ConsultaLookUP('TSERVICO','CD_SERVICO',qryProcessoCD_SERVICO.AsString,'CD_VIA_TRANSPORTE') = '04' then
  begin
    qryProcessoCD_EMBARCACAO.AsString := '';
    qryProcessoNR_VIAGEM.AsString     := '';
  end;

  vServicoOld := dbedtCodigoServico.Text;
  MessageDlg('O FollowUp foi atualizado com sucesso. '+#13#10+
             'Salve as alterações para prosseguir!', mtInformation, [mbOK], 0);
  btnAtualizaServico.Visible := False;
end;

procedure TfrmGestaoPedido.btnConsultaAgenteCargaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    if (Sender as TSpeedButton).Enabled then
      qryProcessoCD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agente de Carga',['CD_AGENTE','NM_AGENTE'],['Código','Nome'],'CD_AGENTE',nil)
  end
  else
    edtNomeAgenteCarga.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedtCodigoAgenteCarga.Text,'NM_AGENTE');
end;

procedure TfrmGestaoPedido.dbedtCodigoAgenteCargaExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoAgenteCarga);
end;

procedure TfrmGestaoPedido.btnConsultaAreaItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then Exit;
    qryPoItemCD_AREA.Value := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA'],['Código','Área'],'CD_AREA',nil)
  end
  else
    edtNomeAreaItem.Text := ConsultaLookUp('TAREA','CD_AREA',dbedtCodigoAreaItem.Text,'NM_AREA');
end;

procedure TfrmGestaoPedido.btnConsultaMercadoriaClick(Sender: TObject);
var
vDrawBack,vLi:string;
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then Exit;
    qryPoItemCD_MERCADORIA.AsString := ConsultaOnLineExSQL('SELECT CD_MERCADORIA,AP_MERCADORIA,CD_NCM_SH,CD_AREA,VL_UNITARIO FROM TMERCADORIA WHERE ( ( CD_IMPORTADOR = ''' + qryProcessoCD_IMPORTADOR.AsString + ''' AND ''' + qryProcessoCD_IMPORTADOR.AsString + ''' <> '''' ) OR ( CD_GRUPO = ''' + ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',qryProcessoCD_IMPORTADOR.AsString,'CD_GRUPO') + ''' AND ''' + ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA',qryProcessoCD_IMPORTADOR.AsString,'CD_GRUPO') + ''' <> '''' ) )','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH', 'CD_AREA', 'VL_UNITARIO'],['Código','Nome', 'NCM', 'Área', 'Valor Unitário'],'CD_MERCADORIA',frm_main.mi_cad_merc);
    //CarregarMercadoria(DBedtLookMercadoria);
    dbedtQtdeMercadoriaExit(nil);
  end
  else
    edtApelidoMercadoria.Text := ConsultaLookUP('TMERCADORIA','CD_MERCADORIA',dbedtCodigoMercadoria.Text,'AP_MERCADORIA');
end;

procedure TfrmGestaoPedido.btnConsultaLocalDesembarqueItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      qryPoItemCD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end
  else
    edtNomeLocalDesembarqueItem.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedtCodigoLocalDesembarqueItem.Text,'DESCRICAO');
end;

procedure TfrmGestaoPedido.btnConsultaEmbarcacaoItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then Exit;
    if (Sender as TSpeedButton).Enabled then
      qryPoItemCD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',nil)
  end
  else
    edtNomeEmbarcacaoItem.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',dbedtCodigoEmbarcacaoItem.Text,'NM_EMBARCACAO');
end;

procedure TfrmGestaoPedido.btnConsultaAgenteCargaItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then Exit;
    if (Sender as TSpeedButton).Enabled then
      qryPoItemCD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agente de Carga',['CD_AGENTE','NM_AGENTE'],['Código','Nome'],'CD_AGENTE',nil)
  end
  else
    edtNomeAgenteCargaItem.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedtCodigoAgenteCargaItem.Text,'NM_AGENTE');
end;

procedure TfrmGestaoPedido.btnConsultaNrViagemItemClick(Sender: TObject);
begin
  if Trim(edtNomeEmbarcacaoItem.Text) = '' then
  begin
    MessageDlg('Embarcação inválida! Verifique o código digitado.',mtError,[],0);
    dbedtCodigoEmbarcacaoItem.SetFocus;
    Exit;
  end;
  if not PoeEmEdicao(qryPoItem) then Exit;

  qryPoItemNR_VIAGEM.AsString := ConsultaOnLineExSQL(
    'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, V.NR_MANIFESTO ' +
    'FROM   TVIAGEM V ( NOLOCK ), TARMAZEM A ( NOLOCK ), TLOCAL_EMBARQUE E ( NOLOCK ) ' +
    'WHERE V.CD_UNID_NEG           = ''' + mskCodigoUnidade.Text +''' '+
    '  AND V.CD_PRODUTO            = ''' + mskCodigoProduto.Text +''' '+
    '  AND V.CD_EMBARCACAO         = ''' + dbedtCodigoEmbarcacaoItem.Text +''' '+
    '  AND V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM ' +
    '  AND V.CD_LOCAL              = E.CODIGO ',
    'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO','NM_ARMAZEM','NR_MANIFESTO'],
    ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Nº Manifesto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem);
end;

procedure TfrmGestaoPedido.dbedtNrItemClienteExit(Sender: TObject);
begin
  if qryPoItem.State in [dsInsert, dsEdit] then
  begin
    ValidCodigo(dbedtNrItemCliente);
    //verifica se o item do pedido existe na PO
    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TPO_ITEM (NOLOCK)');
      SQL.Add('WHERE NR_PROCESSO = '''+ mskNrPedido.Text + ''' AND NR_ITEM_CLIENTE = ''' + dbedtNrItemCliente.Text + ''' AND NR_PARCIAL = ''0'' AND CD_EMPRESA = ''' + edtCodigoCliente.Text + '''');
      Open;

      if Fields[0].AsInteger > 0 then
      begin
        Application.MessageBox('Este item cliente já esta cadastrado para esse pedido!',
          'Informação', MB_OK + MB_ICONSTOP);
        dbedtNrItemCliente.SelectAll;
        dbedtNrItemCliente.SetFocus;
      end;
      Close;
      Free;
    end;
  end;
end;

procedure TfrmGestaoPedido.dbedtCodigoAreaItemExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoAreaItem);
end;

procedure TfrmGestaoPedido.dbedtCodigoMercadoriaExit(Sender: TObject);
var qryMercadoria: TQuery;
begin
  if not (dsPoItem.State in [dsEdit, dsInsert]) then Exit;
  qryMercadoria := TQuery.Create(Application);
  qryMercadoria.DataBaseName := 'DBBROKER';
  qryMercadoria.SQL.Add('SELECT * FROM TMERCADORIA WHERE CD_MERCADORIA = '''+ dbedtCodigoMercadoria.Text +''' ');
  qryMercadoria.Open;
  if qryMercadoria.IsEmpty then
  begin
    MessageDlg('Mercadoria "' + dbedtCodigoMercadoria.Text + '" não cadastrada',mtError,[mbOk],0);
    Exit;
  end;
  qryPoItemVL_UNITARIO.AsFloat := qryMercadoria.FieldByName('VL_UNITARIO').AsFloat;
  if (qryPoItemPL_ITEM.AsFloat = 0) and (qryPoItemQT_INICIAL.AsFloat > 0) then
    qryPoItemPL_ITEM.AsFloat := qryPoItemQT_INICIAL.AsFloat * qryMercadoria.FieldByName('PL_MERCADORIA').AsFloat;

  if qryMercadoria.FieldByName('CD_TIPO_CALCULO').AsString <> '' then
    qryPoItemTP_CALCULO.AsString := qryMercadoria.FieldByName('CD_TIPO_CALCULO').AsString
  else
    qryPoItemTP_CALCULO.AsString := '1';

  qryPoItemCD_UNID_MEDIDA.AsString  := qryMercadoria.FieldByName('CD_UN_MED_COMERC').AsString;
  qryPoItemCD_NCM_SH.AsString       := qryMercadoria.FieldByName('CD_NCM_SH').AsString;
  qryPoItemCD_NALADI_SH.AsString    := qryMercadoria.FieldByName('CD_NALADI_SH').AsString;
  qryPoItemCD_NALADI_NCCA.AsString  := qryMercadoria.FieldByName('CD_NALADI_NCCA').AsString;
  qryPoItemIN_DRAWBACK.AsString     := qryMercadoria.FieldByName('IN_DRAWBACK').AsString;
  qryPoItemIN_NECESSITA_LI.AsString := qryMercadoria.FieldByName('IN_NECESSITA_LI').AsString;
  if qryMercadoria.FieldByName('CD_FABR_EXPO').AsString = '1' then
  begin
    if Trim(qryMercadoria.FieldByName('CD_EXPORTADOR').AsString)     <> '' then qryPoItemCD_FABRICANTE.AsString  := qryMercadoria.FieldByName('CD_EXPORTADOR').AsString;
    if Trim(qryMercadoria.FieldByName('CD_PAIS_AQUISICAO').AsString) <> '' then qryPoItemCD_PAIS_ORIGEM.AsString := qryMercadoria.FieldByName('CD_PAIS_AQUISICAO').AsString;
  end
  else
  if qryMercadoria.FieldByName('CD_FABR_EXPO').AsString = '2' then
  begin
    if Trim(qryMercadoria.FieldByName('CD_EXPORTADOR').AsString) <> '' then qryPoItemCD_FABRICANTE.AsString  := qryMercadoria.FieldByName('CD_FABRICANTE').AsString;
    qryPoItemCD_PAIS_ORIGEM.AsString := qryMercadoria.FieldByName('CD_PAIS_ORIGEM').AsString;
  end
  else
  if qryMercadoria.FieldByName('CD_FABR_EXPO').AsString = '3' then
  begin
    qryPoItemCD_FABRICANTE.AsString  := '';
    if Trim(qryMercadoria.FieldByName('CD_PAIS_AQUISICAO').AsString) <> '' then qryPoItemCD_PAIS_ORIGEM.AsString := qryMercadoria.FieldByName('CD_PAIS_ORIGEM').AsString;
  end;
  qryPoItem.FieldByName('TX_MERCADORIA').asString := qryMercadoria.FieldByName('NM_MERCADORIA').asString;

  Application.ProcessMessages;
  //CalcularQtdInicialDoItem(nil);
end;

procedure TfrmGestaoPedido.dbedtQtdeMercadoriaExit(Sender: TObject);
begin
  if vValorQtdeItem <> StrToFloat(dbedtQtdeMercadoria.Text) then
    dbedtValorItemEnter(nil);
end;

procedure TfrmGestaoPedido.dbedtCodigoLocalDesembarqueItemExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoLocalDesembarqueItem);
end;

procedure TfrmGestaoPedido.dbedtCodigoEmbarcacaoItemExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoEmbarcacaoItem);
end;

procedure TfrmGestaoPedido.dbedtCodigoAgenteCargaItemExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoAgenteCargaItem);
end;

procedure TfrmGestaoPedido.dbedtNrViagemItemExit(Sender: TObject);
begin
  if Trim(dbedtNrViagemItem.Text) = '' then Exit;
  //verifica se o local de desembarque é válido
  if Trim(edtNomeLocalDesembarqueItem.Text) = '' then
  begin
    MessageDlg('Local de Desembarque inválido! Verifique o código digitado.',mtError,[mbOk],0);
    dbedtCodigoLocalDesembarqueItem.SetFocus;
    Exit;
  end;
  //verifica se a embarcação é válida
  if Trim(edtNomeEmbarcacaoItem.Text) = '' then
  begin
    MessageDlg('Embarcação inválida! Verifique o código digitado.',mtError,[mbOk],0);
    dbedtCodigoEmbarcacaoItem.SetFocus;
    Exit;
  end;
  //verifica se o numero da viagem é valido para os dados informados
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT NR_VIAGEM ');
    SQL.Add('FROM TVIAGEM (NOLOCK)');
    SQL.Add('WHERE CD_UNID_NEG   = '''+ mskCodigoUnidade.Text +''' ');
    SQL.Add('  AND CD_PRODUTO    = '''+ mskCodigoProduto.Text +''' ');
    SQL.Add('  AND CD_EMBARCACAO = '''+ dbedtCodigoEmbarcacaoItem.Text +''' ');
    SQL.Add('  AND CD_LOCAL      = '''+ dbedtCodigoLocalDesembarqueItem.Text +''' ');
    SQL.Add('  AND NR_VIAGEM     = '''+ dbedtNrViagemItem.Text +''' ');
    Open;
    if RecordCount = 0 then
    begin
      MessageDlg('Viagem inexistente ou inválida para essa embarcação/local desembarque.',mtError,[mbOk],0);
      dbedtNrViagemItem.SetFocus;
    end;
    Free;
  end;end;

procedure TfrmGestaoPedido.qryPoItemAfterScroll(DataSet: TDataSet);
begin
  AtualizaDisplayItem;
  if not qryPoItemParciais.IsEmpty then
  begin
    HabilitaCampos(False);
    dbedtQtdeMercadoria.Color    := clWindow;
    dbedtQtdeMercadoria.ReadOnly := False;
  end
  else
    HabilitaCampos(True);
end;

procedure TfrmGestaoPedido.HabilitaCampos(const vHab : Boolean);
var
  vCor : TColor;
begin
  if vHab then
    vCor := clWindow
  else
    vCor := clBtnFace;

  dbedtNrItemCliente.Color              := vCor;
  dbedtCodigoAreaItem.Color             := vCor;
  dbedtCodigoMercadoria.Color           := vCor;
  edtApelidoMercadoria.Color            := clBtnFace;
  dbedtCodigoNcmSh.Color                := vCor;
  dbedtQtdeMercadoria.Color             := vCor;
  dbedtCodigoUnidMed.Color              := vCor;
  dbedt_fabricante.Color                := vCor;
  edtNomeUnidMed.Color                  := clBtnFace;
  dbedt_moeda_negociada.Color           := vCor;
  edt_moeda_negociada.Color             := clBtnFace;
  dbedtValorUnitario.Color              := vCor;
  dbedtValorItem.Color                  := vCor;
  dblckTipoCalculoItem.Color            := vCor;
  dbedtNrFatura.Color                   := vCor;
  dbedtCodMercFornec.Color              := vCor;
  dbedtCodPaisOrigemItem.Color          := vCor;
  dbedtCodigoLocalDesembarqueItem.Color := vCor;
  dbedtCodigoEmbarcacaoItem.Color       := vCor;
  dbedtCodigoAgenteCargaItem.Color      := vCor;
  dbedtNrViagemItem.Color               := vCor;
  dbedtNrVooItem.Color                  := vCor;
  dbedtNrConhecimentoItem.Color         := vCor;
  dbedtNrCourrierItem.Color             := vCor;

  dbedtNrItemCliente.ReadOnly              := not vHab;
  dbedtCodigoAreaItem.ReadOnly             := not vHab;
  dbedtCodigoMercadoria.ReadOnly           := not vHab;
  //edtApelidoMercadoria.ReadOnly            := not vHab;
  dbedtCodigoNcmSh.ReadOnly                := not vHab;
  dbedtQtdeMercadoria.ReadOnly             := not vHab;
  dbedtCodigoUnidMed.ReadOnly              := not vHab;
  dbedt_fabricante.ReadOnly                := not vHab;
  //edtNomeUnidMed.ReadOnly                  := not vHab;
  dbedt_moeda_negociada.ReadOnly           := not vHab;
  //edt_moeda_negociada.ReadOnly             := not vHab;
  dbedtValorUnitario.ReadOnly              := not vHab;
  dbedtValorItem.ReadOnly                  := not vHab;
  dblckTipoCalculoItem.ReadOnly            := not vHab;
  dbedtNrFatura.ReadOnly                   := not vHab;
  dbedtCodMercFornec.ReadOnly              := not vHab;
  dbedtCodPaisOrigemItem.ReadOnly          := not vHab;
  dbedtCodigoLocalDesembarqueItem.ReadOnly := not vHab;
  dbedtCodigoEmbarcacaoItem.ReadOnly       := not vHab;
  dbedtCodigoAgenteCargaItem.ReadOnly      := not vHab;
  dbedtNrViagemItem.ReadOnly               := not vHab;
  dbedtNrVooItem.ReadOnly                  := not vHab;
  dbedtNrConhecimentoItem.ReadOnly         := not vHab;
  dbedtNrCourrierItem.ReadOnly             := not vHab;
  dbrgTpDrawback.ReadOnly                  := not vHab;
  dbchkIncideLI.ReadOnly                   := not vHab;
  dbchkdrawback.ReadOnly                   := not vHab;
  dbchkInUrgenteItem.ReadOnly              := not vHab;

  //Botões
  btnConsultaAreaItem.Enabled              := vHab;
  btnConsultaMercadoria.Enabled            := vHab;
  btnConsultaUnidMed.Enabled               := vHab;
  btn_moeda_negociada.Enabled              := vHab;
  btn_co_nm_fabric.Enabled                 := vHab;
  btnConsultaPaisOrigemItem.Enabled        := vHab;
  btnConsultaLocalDesembarqueItem.Enabled  := vHab;
  btnConsultaEmbarcacaoItem.Enabled        := vHab;
  btnConsultaAgenteCargaItem.Enabled       := vHab;
  btnConsultaNrViagemItem.Enabled          := vHab;
  btnRepassaItens.Enabled                  := vHab;

end;

procedure TfrmGestaoPedido.qryPoItemAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmGestaoPedido.qryPoItemAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure TfrmGestaoPedido.dbedtValorItemEnter(Sender: TObject);
begin
  if dsPoItem.State in [dsEdit, dsInsert] then
  begin
    dbedtValorItem.ReadOnly := True;
    dbedtValorItem.Color    := clSilver;

    { Valor será digitado pelo usuário }
    if qryPoItemTP_CALCULO.AsInteger = 5 then
    begin
      dbedtValorItem.ReadOnly := False;
      dbedtValorItem.Color    := clWindow;
    end
    else
      qryPoItemVL_TOTAL.AsFloat := CalculaValorTotal(qryPoItemQT_INICIAL.AsFloat,
         qryPoItemVL_UNITARIO.AsFloat, qryPoItemPL_ITEM.AsFloat, qryPoItemTP_CALCULO.AsInteger);

    if qryPoItemPC_DESCONTO.AsFloat > 0 then
    begin
      qryPoItemVL_DESCONTO.AsFloat := Arredondar( qryPoItemVL_TOTAL.AsFloat * qryPoItemPC_DESCONTO.AsFloat /100, 2 );
      qryPoItemVL_TOTAL.AsFloat    := qryPoItemVL_TOTAL.AsFloat - qryPoItemVL_DESCONTO.AsFloat;
    end;
  end;
end;

procedure TfrmGestaoPedido.dbedtValorUnitarioExit(Sender: TObject);
begin
  if vValorUnitario <> StrToFloat(StringReplace(dbedtValorUnitario.Text, '.', '', [rfReplaceAll])) then
    dbedtValorItemEnter(nil);
end;

procedure TfrmGestaoPedido.dblckTipoCalculoItemClick(Sender: TObject);
begin
  qryPoItemVL_TOTAL.AsFloat := 0;
  dbedtValorItemEnter(nil);
end;

procedure TfrmGestaoPedido.dbedtNrItemClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
//not (IsNumeric(Key)) and   
//  if (Key <> chr(VK_RETURN)) and (Key <> chr(VK_BACK)) then  Key := #0;
end;

procedure TfrmGestaoPedido.dsPoItemStateChange(Sender: TObject);
begin
  if dsPoItem.State in [dsEdit] then
    AtivaBtnMenu(False, True, True, False, False, False);
end;

procedure TfrmGestaoPedido.mskNrPedidoEnter(Sender: TObject);
begin
  if vInserindoNovaGestao and (vNrPedidoGestao <> '') and (vNrProcessoGestao = '') then
    mskNrPedido.Text := vNrPedidoGestao;
end;

procedure TfrmGestaoPedido.dbedtQtdeMercadoriaEnter(Sender: TObject);
begin
  vValorQtdeItem := StrToFloat(dbedtQtdeMercadoria.Text);
end;

procedure TfrmGestaoPedido.dbedtValorUnitarioEnter(Sender: TObject);
begin
  vValorUnitario := StrToFloat(StringReplace(dbedtValorUnitario.Text, '.', '', [rfReplaceAll]));
end;

procedure TfrmGestaoPedido.btnRepassaItensClick(Sender: TObject);
begin                             
  //verifica se esta em modo de edição
  if not (dsPoItem.State in [dsInsert, dsEdit]) then qryPoItem.Edit;
  //verifica se é edição, se for pergunta se quer mesmo fazer isso.
  if dsPoItem.State in [dsEdit] then
  begin
    if MessageDlg('Deseja copiar as informações do pedido para o item?' +#10#13+
                  'Nota: As informações já digitadas serão substituídas.',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      Exit;
  end;
  //copia da gestão para o item
  qryPoItemCD_PAIS_ORIGEM.AsString  := qryProcessoCD_PAIS_ORIGEM.AsString;
  qryPoItemCD_LOCAL_DESEMBARQUE.AsString := qryProcessoCD_LOCAL_DESEMBARQUE.AsString;
  qryPoItemCD_EMBARCACAO.AsString   := qryProcessoCD_EMBARCACAO.AsString;
  qryPoItemCD_AGENTE.AsString       := qryProcessoCD_AGENTE.AsString;
  qryPoItemNR_VIAGEM.AsString       := qryProcessoNR_VIAGEM.AsString;
  qryPoItemNR_VOO.AsString          := qryProcessoNR_VOO.AsString;
  qryPoItemNR_CONHECIMENTO.AsString := qryProcessoNR_CONHECIMENTO.AsString;
  qryPoItemNR_COURRIER.AsString     := qryProcessoNR_COURRIER.AsString;
  qryPoItemIN_CONSOLIDADO.AsString  := qryProcessoIN_CONSOLIDADO.AsString;
  qryPoItemIN_URGENTE.AsString      := qryProcessoIN_URGENTE.AsString;
  qryPoItemIN_SEGURO.AsString       := qryProcessoIN_SEGURO.AsString;
end;

procedure TfrmGestaoPedido.dbchkInDadosIguaisItemClick(Sender: TObject);
begin
  if dbchkInDadosIguaisItem.Checked and (pgctrlGestaoPedido.ActivePage = tsDadosBasicos) then
    if MessageDlg('Será copiado para todos os itens as informações do pedido, deseja continuar?' +#10#13+
                  'Nota: As informações já digitadas serão substituídas.',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      dbchkInDadosIguaisItem.Checked := False;
end;

procedure TfrmGestaoPedido.dbgrdNecessitaLIDblClick(Sender: TObject);
begin
  pgctrlItem.ActivePage := tsGestao;
end;

procedure TfrmGestaoPedido.dbedtCodigoServicoEnter(Sender: TObject);
begin
  vServicoOld := dbedtCodigoServico.Text;
end;

procedure TfrmGestaoPedido.qryProcessoAfterScroll(DataSet: TDataSet);
begin
  VerificaTransporte(ConsultaLookUP('TSERVICO','CD_SERVICO',qryProcessoCD_SERVICO.AsString,'CD_VIA_TRANSPORTE'));
end;

procedure TfrmGestaoPedido.btnConsultaUnidMedClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not (qryPoItem.State in [dsEdit, dsInsert]) then qryPoItem.Edit;
    qryPoItemCD_UNID_MEDIDA.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidades de Medida',['CD_UNID_MEDIDA','NM_UNID_MEDIDA'],['Código','Descrição'],'CD_UNID_MEDIDA',nil);
  end else
    edtNomeUnidMed.Text := ConsultaLookUp('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',dbedtCodigoUnidMed.Text,'NM_UNID_MEDIDA');
end;

procedure TfrmGestaoPedido.btn_moeda_negociadaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then exit;
    If (Sender as TSpeedButton).Enabled Then
      qryPoItemCD_MOEDA_NEGOCIADA.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, dbedt_moeda_negociada.text)
  end
  else
    edt_moeda_negociada.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_moeda_negociada.Text,'NM_MOEDA')
end;

procedure TfrmGestaoPedido.btnExecutaClick(Sender: TObject);
var
  Excel, xlWorkB, oSheet: OleVariant;
  i, vUltimaLinha : Integer;
  vUltimaPO, vPOAtual, vNrProcesso, vServico, vItem, vPOIgnorada, vEmpresa : string;
  vNovaPO : Boolean;
  vNumeroProcesso : Real;
  vQryIntegra : TQuery;

  function VerificaUltimaLinhaPreenchida ( var poSheet : OleVariant; pColuna, pLinhaInicial, pUltimaLinha : Integer; pAchouLimite : Boolean ) : Integer;
  var
    i : Integer;
  begin
    if pLinhaInicial = pUltimaLinha then
    begin
      vUltimaLinha := pUltimaLinha;
      Exit;
    end else begin
      if ( poSheet.Cells[ IntToStr(pUltimaLinha), pColuna ].Text = '' ) or ( pAchouLimite ) then
      begin
        for i := pLinhaInicial to pUltimaLinha do
        begin
          if poSheet.Cells[ IntToStr(i), pColuna ].Text <> '' then
            continue;
          VerificaUltimaLinhaPreenchida(poSheet,1,i,i,True);
          break;
        end;
      end else VerificaUltimaLinhaPreenchida(poSheet,1,pUltimaLinha,pUltimaLinha+100, False);
    end;
  end;

  function VerificaPO ( pPO : string ) : Boolean;
  begin
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(NR_PROCESSO) FROM TPO ( NOLOCK ) WHERE NR_PROCESSO = ''' + pPO + ''' AND CD_EMPRESA = ''' + vEmpresa + '''');
      Open;
      Result := ( Fields[0].AsInteger > 0 );
      Close;
      Free;
    end;
  end;

begin
  try
    lblStatus.Visible := True;
    pbStatus.Visible  := True;
    Excel := CreateOLEObject('Excel.Application');
    xlWorkB := Excel.Workbooks.Open(Trim(edtPath.Text));
    oSheet :=  Excel.WorkBooks[1].Worksheets[1];
    lstResultado.Items.Add('Abrindo planilha...: ' + Trim(edtPath.Text));
    Application.ProcessMessages;
  except
    Application.MessageBox('Erro na abertura da Planilha! Verifique o arquivo!', 'MyIndaiá', MB_OK + MB_ICONERROR);
    Exit;
  end;
  vUltimaPO := '';
  // procura ultima linha do excel
  VerificaUltimaLinhaPreenchida(oSheet,1,4,5,False);
  pbStatus.Max := vUltimaLinha;
  // leitura linha a linha para inclusao dos pedidos e itens
  for i := 4 to vUltimaLinha do
  begin
    try
      with TQuery.Create(Application) do
      begin
        try
          Databasename := 'DBBROKER';
          datm_main.db_broker.StartTransaction;
          lblStatus.Caption := 'Linha ' + IntToStr(i) + ' de ' + IntToStr(vUltimaLinha);
          pbStatus.StepIt;
          lstResultado.Items.Add('-------------------------------------------------------------------------------------');
          lstResultado.Items.Add('Linha : ' + IntToStr(i));
          Application.ProcessMessages;
          if (oSheet.Cells[ IntToStr(i), 1 ].Text = '') then
          begin
            lblStatus.Visible := False;
            pbStatus.Visible  := False;
            Break;
          end;
          vPOAtual := oSheet.Cells[i,1].Value;
          // verifica se ela está ignorada
          if vPOIgnorada = vPOAtual then
            continue;
          // se trata de uma nova PO, ou de alguma que ja foi feita na linha anterior
          if vPOAtual <> vUltimaPO then
          begin
            vUltimaPO := vPOAtual;
            vNovaPO   := True;
          end;
          lstResultado.Items.Add('PO : ' + vPOAtual);
          Application.ProcessMessages;
          // verifica se a PO ja existe no banco
          if ( VerificaPO( vPOAtual ) ) and ( vNovaPO ) then
          begin
            lstResultado.Items.Add('O pedido ja existe. Ele deverá ser excluído para que a planilha leia corretamente.');
            Application.ProcessMessages;
            vPOIgnorada := vPOAtual;
            // excluindo pedido e tabelas relacionadas
//            SQL.Clear;
//            SQL.Add('DELETE FROM TPO WHERE NR_PROCESSO = ''' + vPOAtual + '''');
//            lstResultado.Items.Add('Apagando TPO');
//            Application.ProcessMessages;
//            ExecSQL;
//            SQL.Clear;
//            SQL.Add('DELETE FROM TPO_ITEM WHERE NR_PROCESSO = ''' + vPOAtual + '''');
//            lstResultado.Items.Add('Apagando TPO_ITEM');
//            Application.ProcessMessages;
//            ExecSQL;
//            SQL.Clear;
//            SQL.Add('DELETE FROM TFLP_PO WHERE NR_PROCESSO = ''' + vPOAtual + '''');
//            lstResultado.Items.Add('Apagando TFLP_PO');
//            Application.ProcessMessages;
//            ExecSQL;
//            SQL.Clear;
//            SQL.Add('DELETE FROM TFLP_PO_ITEM WHERE NR_PROCESSO = ''' + vPOAtual + '''');
//            lstResultado.Items.Add('Apagando TFLP_PO_ITEM');
//            Application.ProcessMessages;
//            ExecSQL;
//            // PO excluída
//            lstResultado.Items.Add('**** PO EXCLUÍDA : ' + vPOAtual + ' ****');
          // ou, se ela não existir
          end;
          // verificando serviço compatível
          if oSheet.Cells[ IntToStr(i), 3 ].Text = 'SEA' then
            vServico := '475'
          else if oSheet.Cells[ IntToStr(i), 3 ].Text = 'AIR' then
            vServico := '477'
          else if oSheet.Cells[ IntToStr(i), 3 ].Text = 'RODO' then
            vServico := '478';
          // inserindo nova PO
          if vNovaPO then
          begin
            lstResultado.Items.Add('Inserindo nova PO.');
            Application.ProcessMessages;
            // insere nova po e abre SG ( gestão do pedido )
            vNovaPO := False;
            //pega o proximo numero de processo dessa unidade/produto/cliente/serviço
            SQL.Clear;
            SQL.Add('SELECT MAX(NR_PROCESSO) FROM TPROCESSO ');
            SQL.Add(' WHERE CD_UNID_NEG = ''01'' ');
            SQL.Add('   AND CD_PRODUTO  = ''06'' ');
            SQL.Add('   AND DATEPART(yyyy,DT_ABERTURA) = DATEPART(yyyy,GETDATE()) ');
            SQL.Add('   AND SUBSTRING(NR_PROCESSO,5,2) = ''SG''');
            Open;
            if (Copy(Fields[0].AsString,8,4) = '') or (Copy(Fields[0].AsString,8,4 ) = '9999' ) then
              vNumeroProcesso:= StrToFloat('0001')
            else vNumeroProcesso := StrToFloat(Copy(Fields[0].AsString,8,4 )) + 1;
            vNrProcesso := '0106SG-'+ FormatFloat('0000', vNumeroProcesso) +'-'+ FormatDateTime('YY', dt_server);
            vEmpresa := oSheet.Cells[ IntToStr(i), 29 ].Text;

            // TPROCESSO
            SQL.Clear;
            SQL.Add(' INSERT INTO TPROCESSO ( IN_DADOS_IGUAIS_ITENS, IN_CONSOLIDADO, IN_URGENTE, IN_SEGURO, NR_PROCESSO, ');
            SQL.Add('                         CD_UNID_NEG, CD_PRODUTO, CD_GRUPO, NR_REFERENCIA, IN_LIBERADO, IN_CANCELADO, ');
            SQL.Add('                         DT_ABERTURA, HR_ABERTURA, CD_SERVICO, CD_AREA, CD_IMPORTADOR, CD_EXPORTADOR, CD_CLIENTE, ');
            SQL.Add('                         NR_REF_EXPORTADOR, CD_ANALISTA_CLIENTE, CD_ANALISTA_COMISSARIA, CD_INCOTERM, CD_TP_PEDIDO, ');
            SQL.Add('                         CD_LOCAL_DESEMBARQUE, CD_AGENTE, NR_CONHECIMENTO, CD_EMBARCACAO, NR_VOO ) ');
            SQL.Add('                VALUES ( :IN_DADOS_IGUAIS_ITENS, :IN_CONSOLIDADO, :IN_URGENTE, :IN_SEGURO, :NR_PROCESSO, ');
            SQL.Add('                         :CD_UNID_NEG, :CD_PRODUTO, :CD_GRUPO, :NR_REFERENCIA, :IN_LIBERADO, :IN_CANCELADO, ');
            SQL.Add('                         :DT_ABERTURA, :HR_ABERTURA, :CD_SERVICO, :CD_AREA, :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_CLIENTE, ');
            SQL.Add('                         :NR_REF_EXPORTADOR, :CD_ANALISTA_CLIENTE, :CD_ANALISTA_COMISSARIA, :CD_INCOTERM, :CD_TP_PEDIDO, ');
            SQL.Add('                         :CD_LOCAL_DESEMBARQUE, :CD_AGENTE, :NR_CONHECIMENTO, :CD_EMBARCACAO, :NR_VOO ) ');
            ParamByName('IN_DADOS_IGUAIS_ITENS').AsString  := '1';
            ParamByName('IN_CONSOLIDADO').AsString         := '0';
            ParamByName('IN_URGENTE').AsString             := '0';
            ParamByName('IN_SEGURO').AsString              := '0';
            ParamByName('NR_PROCESSO').AsString            := vNrProcesso;
            ParamByName('CD_UNID_NEG').AsString            := '01';
            ParamByName('CD_PRODUTO').AsString             := '06';
            ParamByName('CD_GRUPO').AsString               := '329';
            ParamByName('NR_REFERENCIA').AsString          := vPOAtual;
            ParamByName('IN_LIBERADO').AsString            := '1';
            ParamByName('IN_CANCELADO').AsString           := '0';
            ParamByName('DT_ABERTURA').AsDateTime          := Date;
            ParamByName('HR_ABERTURA').AsDateTime          := Now;
            ParamByName('CD_SERVICO').AsString             := vServico;
            ParamByName('CD_AREA').AsString                := '45';
            ParamByName('CD_IMPORTADOR').AsString          := oSheet.Cells[ IntToStr(i), 29 ].Text;
            ParamByName('CD_CLIENTE').AsString             := oSheet.Cells[ IntToStr(i), 29 ].Text;
            ParamByName('CD_EXPORTADOR').AsString          := oSheet.Cells[ IntToStr(i), 26 ].Text;
            ParamByName('NR_REF_EXPORTADOR').AsString      := oSheet.Cells[ IntToStr(i), 12 ].Text;
            ParamByName('CD_ANALISTA_CLIENTE').AsString    := '1134';
            ParamByName('CD_ANALISTA_COMISSARIA').AsString := '0666';
            ParamByName('CD_INCOTERM').AsString            := oSheet.Cells[ IntToStr(i), 33 ].Text;
            ParamByName('CD_TP_PEDIDO').AsString           := oSheet.Cells[ IntToStr(i), 32 ].Text;
            ParamByName('CD_LOCAL_DESEMBARQUE').AsString   := '0002';
            ParamByName('CD_AGENTE').AsString              := oSheet.Cells[ IntToStr(i), 35 ].Text;
            ParamByName('NR_CONHECIMENTO').AsString        := oSheet.Cells[ IntToStr(i), 20 ].Text;
            ParamByName('CD_EMBARCACAO').AsString          := IIF(oSheet.Cells[ IntToStr(i), 3 ].Text = 'SEA',oSheet.Cells[ IntToStr(i), 18 ].Text,'');
            ParamByName('NR_VOO').AsString                 := IIF(oSheet.Cells[ IntToStr(i), 3 ].Text = 'AIR',oSheet.Cells[ IntToStr(i), 18 ].Text,'');
            ExecSQL;
            // TPO
            SQL.Clear;
            SQL.Add(' INSERT INTO TPO ( NR_PROCESSO, DT_ABERTURA, CD_SERVICO, CD_AREA, CD_IMPORTADOR, CD_EXPORTADOR, CD_EMPRESA ) ');
            SQL.Add('          VALUES ( :NR_PROCESSO, :DT_ABERTURA, :CD_SERVICO, :CD_AREA, :CD_IMPORTADOR, :CD_EXPORTADOR, :CD_EMPRESA ) ');
            ParamByName('NR_PROCESSO').AsString           := vPOAtual;
            ParamByName('DT_ABERTURA').AsDateTime         := Date;
            ParamByName('CD_SERVICO').AsString            := vServico;
            ParamByName('CD_AREA').AsString               := '45';
            ParamByName('CD_IMPORTADOR').AsString         := '00060';
            ParamByName('CD_EXPORTADOR').AsString         := '03272';
            ParamByName('CD_EMPRESA').AsString            := vEmpresa;
            ExecSQL;
            // Atualiza FUP
            SQL.Clear;
            SQL.Add(' exec sp_atz_flp_po ''' + vPOAtual + ''', ''' + vEmpresa + '''');
            ExecSQL;
          end;
          // insere itens
          vItem := ConsultaLookUpSQL('SELECT ISNULL( MAX(NR_ITEM), 0 ) + 1 ITEM FROM TPO_ITEM WHERE NR_PROCESSO = ''' + vPOAtual + ''' AND CD_EMPRESA = ''' + vEmpresa + '''','ITEM');
          vItem := Copy('000',1,3-Length(vItem)) + vItem;
          SQL.Clear;
          SQL.Add(' INSERT INTO TPO_ITEM ( NR_PROCESSO, NR_ITEM, NR_ITEM_CLIENTE, QT_INICIAL, VL_UNITARIO, VL_TOTAL, CD_UNID_MEDIDA, ');
          SQL.Add('                        CD_MERCADORIA, CD_NCM_SH, CD_AREA, TP_CALCULO, CD_EXPORTADOR, CD_PAIS_AQUISICAO, CD_MOEDA_NEGOCIADA, ');
          SQL.Add('                        CD_AGENTE, NR_FATURA, NR_CONHECIMENTO, CD_LOCAL_DESEMBARQUE, CD_MERC_FORNEC, CD_EMBARCACAO, NR_VOO, TP_DRAWBACK, CD_EMPRESA ) ');
          SQL.Add('               VALUES ( :NR_PROCESSO, :NR_ITEM, :NR_ITEM_CLIENTE, :QT_INICIAL, :VL_UNITARIO, :VL_TOTAL, :CD_UNID_MEDIDA, ');
          SQL.Add('                        :CD_MERCADORIA, :CD_NCM_SH, :CD_AREA, :TP_CALCULO, :CD_EXPORTADOR, :CD_PAIS_AQUISICAO, :CD_MOEDA_NEGOCIADA, ');
          SQL.Add('                        :CD_AGENTE, :NR_FATURA, :NR_CONHECIMENTO, :CD_LOCAL_DESEMBARQUE, :CD_MERC_FORNEC, :CD_EMBARCACAO, :NR_VOO, :TP_DRAWBACK, :CD_EMPRESA ) ');
          ParamByName('NR_PROCESSO').AsString          := vPOAtual;
          ParamByName('NR_ITEM').AsString              := vItem;
          ParamByName('NR_ITEM_CLIENTE').AsString      := oSheet.Cells[ IntToStr(i), 2 ].Text;
          ParamByName('QT_INICIAL').AsFloat            := StrToFloat( StringReplace( oSheet.Cells[ IntToStr(i), 6 ].Text,'.','',[rfReplaceAll] ) );
          ParamByName('VL_UNITARIO').AsFloat           :=  StrToFloat( StringReplace( oSheet.Cells[ IntToStr(i), 8 ].Text / ( oSheet.Cells[ IntToStr(i), 6 ].Text ),'.','',[rfReplaceAll] ) );
          ParamByName('VL_TOTAL').AsFloat              :=  StrToFloat( StringReplace( oSheet.Cells[ IntToStr(i), 8 ].Text,'.','',[rfReplaceAll] ) );
          ParamByName('CD_UNID_MEDIDA').AsString       := '110';
          ParamByName('CD_MERCADORIA').AsString        := 'MPB'+oSheet.Cells[ IntToStr(i), 11 ].Text;
          ParamByName('CD_NCM_SH').AsString            := ConsultaLookup('TMERCADORIA','CD_MERCADORIA','MPB'+oSheet.Cells[ IntToStr(i), 11 ].Text,'CD_NCM_SH');
          ParamByName('CD_AREA').AsString              := '45';
          ParamByName('TP_CALCULO').AsString           := ConsultaLookup('TMERCADORIA','CD_MERCADORIA','MPB'+oSheet.Cells[ IntToStr(i), 11 ].Text,'CD_TIPO_CALCULO');
          ParamByName('CD_EXPORTADOR').AsString        := oSheet.Cells[ IntToStr(i), 26 ].Text;
          ParamByName('CD_PAIS_AQUISICAO').AsString    := '023';
          ParamByName('CD_MOEDA_NEGOCIADA').AsString   := oSheet.Cells[ IntToStr(i), 31 ].Text;
          ParamByName('CD_AGENTE').AsString            := oSheet.Cells[ IntToStr(i), 35 ].Text;
          ParamByName('NR_FATURA').AsString            := oSheet.Cells[ IntToStr(i), 21 ].Text;
          ParamByName('NR_CONHECIMENTO').AsString      := oSheet.Cells[ IntToStr(i), 20 ].Text;
          ParamByName('CD_LOCAL_DESEMBARQUE').AsString := '0002';
          ParamByName('CD_MERC_FORNEC').AsString       := oSheet.Cells[ IntToStr(i), 34 ].Text;
          ParamByName('CD_EMBARCACAO').AsString        := IIF(oSheet.Cells[ IntToStr(i), 3 ].Text = 'SEA',oSheet.Cells[ IntToStr(i), 18 ].Text,'');
          ParamByName('NR_VOO').AsString               := IIF(oSheet.Cells[ IntToStr(i), 3 ].Text = 'AIR',oSheet.Cells[ IntToStr(i), 18 ].Text,'');
          ParamByName('TP_DRAWBACK').AsString          := oSheet.Cells[ IntToStr(i), 36 ].Text;
          ParamByName('CD_EMPRESA').AsString           := vEmpresa;
          lstResultado.Items.Add('Inserindo item : ' + ParamByName('NR_ITEM_CLIENTE').AsString);
          Application.ProcessMessages;
          ExecSQL;
          // Atualiza FUP Itens
          SQL.Clear;
          SQL.Add(' exec sp_atz_flp_po_item ''' + vPOAtual + ''',''' + vEmpresa + ''', ''' + vItem + '''');
          ExecSQL;
          // INSERE STATUS
          SQL.Clear;
          SQL.Add(' INSERT INTO TFLP_PO_ITEM_ETAPA ( NR_PROCESSO, NR_ITEM, CD_FLP_PO_ITEM_ETAPA, CD_ETAPA, CD_USUARIO, DT_ALTERACAO, CD_EMPRESA ) ');
          SQL.Add('                         VALUES ( :NR_PROCESSO, :NR_ITEM, :CD_FLP_PO_ITEM_ETAPA, :CD_ETAPA, :CD_USUARIO, GETDATE(), :CD_EMPRESA ) ');
          ParamByName('NR_PROCESSO').AsString          := vPOAtual;
          ParamByName('NR_ITEM').AsString              := vItem;
          ParamByName('CD_FLP_PO_ITEM_ETAPA').AsString := '1';
          ParamByName('CD_ETAPA').AsString             := oSheet.Cells[ IntToStr(i), 30 ].Text;
          ParamByName('CD_USUARIO').AsString           := '0666';
          ParamByName('CD_EMPRESA').AsString           := vEmpresa;
          lstResultado.Items.Add('Inserindo Status : ' + oSheet.Cells[ IntToStr(i), 30 ].Text );
          Application.ProcessMessages;
          ExecSQL;
          // insere na TESTAGIO_PROCESSO
//          SQL.Clear;
//          SQL.Add(' INSERT INTO TESTAGIO_PROCESSO ( NR_REFERENCIA, NR_ITEM_CLIENTE, DT_ULT_ALTERACAO, NR_PROCESSO_ADM, NR_PROCESSO_DES, NR_PROCESSO_FI ) ');
//          SQL.Add('                        VALUES ( :NR_REFERENCIA, :NR_ITEM_CLIENTE, :DT_ULT_ALTERACAO, :NR_PROCESSO_ADM, :NR_PROCESSO_DES, :NR_PROCESSO_FI ) ');
//          ParamByName('NR_REFERENCIA').AsString      := vPOAtual;
//          ParamByName('NR_ITEM_CLIENTE').AsString    := oSheet.Cells[ IntToStr(i), 2 ].Text;
//          ParamByName('DT_ULT_ALTERACAO').AsDateTime := Date;
//          ParamByName('NR_PROCESSO_ADM').AsString    := vNrProcesso;
//          ParamByName('NR_PROCESSO_DES').AsString    := '';
//          ParamByName('NR_PROCESSO_FI').AsString     := '';
//          lstResultado.Items.Add('Inserindo na TESTAGIO_PROCESSO : ' + ParamByName('NR_ITEM_CLIENTE').AsString);
//          Application.ProcessMessages;
//          ExecSQL;
          // realiza eventos do FUP
          SQL.Clear;
          SQL.Add(' UPDATE TFLP_PO SET DT_REALIZACAO = :DATA ');
          SQL.Add('  WHERE NR_PROCESSO = ''' + vPOAtual + ''' ');
          SQL.Add('    AND CD_EMPRESA  = ''' + vEmpresa + '''');
          SQL.Add('    AND CD_EVENTO   = ''168''');
          if ( oSheet.Cells[ IntToStr(i), 5 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 5 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 5 ].Text);
            lstResultado.Items.Add('FUP : 168');
            Application.ProcessMessages;
            ExecSQL;
          end;
          SQL.Clear;
          SQL.Add(' UPDATE TFLP_PO_ITEM SET DT_REALIZACAO = :DATA ');
          SQL.Add('  WHERE NR_PROCESSO = ''' + vPOAtual + ''' AND NR_ITEM = ''' + vItem + '''');
          SQL.Add('    AND CD_EVENTO   = :EVENTO AND CD_EMPRESA = ''' + vEmpresa + '''');
          if ( oSheet.Cells[ IntToStr(i), 4 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 4 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 4 ].Text);
            ParamByName('EVENTO').AsString := '354';
            lstResultado.Items.Add('FUP : 354');
            Application.ProcessMessages;
            ExecSQL;
          end;
          if ( oSheet.Cells[ IntToStr(i), 13 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 13 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 13 ].Text);
            ParamByName('EVENTO').AsString := '500';
            lstResultado.Items.Add('FUP : 500');
            Application.ProcessMessages;
            ExecSQL;
          end;
          if ( oSheet.Cells[ IntToStr(i), 14 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 14 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 14 ].Text);
            ParamByName('EVENTO').AsString := '460';
            lstResultado.Items.Add('FUP : 460');
            Application.ProcessMessages;
            ExecSQL;
          end;
          if ( oSheet.Cells[ IntToStr(i), 15 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 15 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 15 ].Text);
            ParamByName('EVENTO').AsString := '297';
            lstResultado.Items.Add('FUP : 297');
            Application.ProcessMessages;
            ExecSQL;
          end;
          if ( oSheet.Cells[ IntToStr(i), 16 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 16 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 16 ].Text);
            ParamByName('EVENTO').AsString := '161';
            lstResultado.Items.Add('FUP : 161');
            Application.ProcessMessages;
            ExecSQL;
          end;
          if ( oSheet.Cells[ IntToStr(i), 17 ].Text <> '' ) and ( StrToDateDef(oSheet.Cells[ IntToStr(i), 17 ].Text,0) <> 0 ) then
          begin
            ParamByName('DATA').AsDateTime := StrToDate(oSheet.Cells[ IntToStr(i), 17 ].Text);
            ParamByName('EVENTO').AsString := '146';
            lstResultado.Items.Add('FUP : 146');
            Application.ProcessMessages;
            ExecSQL;
          end;
          datm_main.db_broker.Commit;
        finally
          Free;
        end;
      end;
    except
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      lstResultado.Items.Add('--------------------------------------------------');
      lstResultado.Items.Add(' PO NÃO INTEGRADA CORRETAMENTE : ' + vPOAtual );
      lstResultado.Items.Add('--------------------------------------------------');
      Application.ProcessMessages;
    end;
  end;
  Application.MessageBox('Leitura da Planilha realizada com sucesso', 'MyIndaiá', MB_OK + MB_ICONEXCLAMATION);
  Excel.Visible := True;
  Excel.Quit;
end;

procedure TfrmGestaoPedido.btnDialogClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    edtPath.Text := dlgOpen.FileName;
end;

procedure TfrmGestaoPedido.btnSalvarLogClick(Sender: TObject);
begin
  lstResultado.Items.SaveToFile('C:\IntegracaoLog.txt');
end;

procedure TfrmGestaoPedido.btnConsultaPaisOrigemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      qryProcessoCD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS_BROKER','País de Origem',['CD_PAIS','NM_PAIS'],['Código','Descrição'],'CD_PAIS',nil)
  end
  else
    edtNmPaisOrigem.Text := ConsultaLookUP('TPAIS_BROKER','CD_PAIS',dbedtCodPaisOrigem.Text,'NM_PAIS');
end;

procedure TfrmGestaoPedido.btnConsultaPaisOrigemItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryProcesso) then Exit;
    if (Sender as TSpeedButton).Enabled Then
      qryPoItemCD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS_BROKER','País de Origem',['CD_PAIS','NM_PAIS'],['Código','Descrição'],'CD_PAIS',nil)
  end
  else
    edtNmPaisOrigemItem.Text := ConsultaLookUP('TPAIS_BROKER','CD_PAIS',dbedtCodPaisOrigemItem.Text,'NM_PAIS');
end;

procedure TfrmGestaoPedido.dbedtCodPaisOrigemExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodPaisOrigem);
end;

procedure TfrmGestaoPedido.dbedtCodPaisOrigemItemExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodPaisOrigemItem);
end;

procedure TfrmGestaoPedido.qryPoItemNR_ITEM_CLIENTESetText(Sender: TField; const Text: String);
var
  vProcesso: string;
  vQryAux: TQuery;
begin
  if qryPoItem.State = dsEdit then begin
    //primeiro na manutenção
    vQryAux := TQuery.Create(application);
    vQryAux.DataBaseName := 'DBBROKER';
    vQryAux.Close;
    vQryAux.SQL.Clear;
    vQryAux.SQL.Add('SELECT ISNULL(SUBSTRING(RC.NR_PROCESSO, 5, 10), '''') FROM TREF_CLIENTE RC (NOLOCK) ');
    vQryAux.SQL.Add('   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = RC.NR_PROCESSO');
    vQryAux.SQL.Add('                                  AND P.IN_CANCELADO = ''0'' ');
    vQryAux.SQL.Add('                                  AND P.CD_PRODUTO = ''01'' ');
    vQryAux.SQL.Add(' WHERE RC.CD_REFERENCIA =  ''' + qryProcessoNR_REFERENCIA.AsString + ''' ');
    vQryAux.SQL.Add('   AND RC.NR_ITEM_PO = ''' + Sender.AsString + ''' ');
    vQryAux.SQL.Add('   AND RC.CD_EMPRESA = ''' + qryProcessoCD_CLIENTE.AsString + ''' ');
    vQryAux.Open;
    if vQryAux.IsEmpty then
    begin
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Add('SELECT ISNULL(SUBSTRING(DM.NR_PROCESSO, 5, 10) + ''/'' + DM.NR_ADICAO + ''/'' + DM.NR_ITEM , '''')');
      vQryAux.SQL.Add('FROM TDETALHE_MERCADORIA DM (NOLOCK) ');
      vQryAux.SQL.Add('   INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = DM.NR_PROCESSO');
      vQryAux.SQL.Add('                                  AND P.IN_CANCELADO = ''0'' ');
      vQryAux.SQL.Add('                                  AND P.CD_PRODUTO = ''01'' ');
      vQryAux.SQL.Add(' WHERE DM.NR_PROC_PO =  ''' + qryProcessoNR_REFERENCIA.AsString + ''' ');
      vQryAux.SQL.Add('   AND DM.NR_ITEM_PO = ''' + Sender.AsString + ''' ');
      vQryAux.SQL.Add('   AND DM.CD_EMPRESA = ''' + qryProcessoCD_CLIENTE.AsString + ''' ');
      vQryAux.Open;
      if vQryAux.IsEmpty then
      begin
        Sender.AsString := Text;
      end
      else
      begin //tem esse pedido + item na DI
        vProcesso := '';
        while not vQryAux.Eof do
        begin
          vProcesso := vProcesso + ', ' + vQryAux.Fields[0].AsString;
          vQryAux.Next;
        end;
        vProcesso := Copy(vProcesso, 3, Length(vProcesso) - 2);
        Application.MessageBox(PChar('ATENÇÂO! Esta Referência + Item é utilizada na DI nos seguintes processos/adição/item:'
                           + #13#10 + vProcesso + '.'), 'Bloqueio de Alteração de Item', MB_OK + MB_ICONERROR);
      end;


    end
    else
    begin //tem esse pedido + item na Manutenção
      vProcesso := '';
      while not vQryAux.Eof do
      begin
        vProcesso := vProcesso + ', ' + vQryAux.Fields[0].AsString;
        vQryAux.Next;
      end;
      vProcesso := Copy(vProcesso, 3, Length(vProcesso) - 2);
      Application.MessageBox(PChar('ATENÇÂO! Esta Referência + Item é utilizada na Manutenção nos seguintes processos:'
                         + #13#10 + vProcesso + '.'
                         + #13#10 + 'Verifique também a DI destes processos!'), 'Bloqueio de Alteração de Item', MB_OK + MB_ICONERROR);
    end;

    vQryAux.Free;
  end
  else
  begin //caso não seja edição, deixa alterar o valor
    Sender.AsString := Text;
  end;
end;

procedure TfrmGestaoPedido.BtnBaixaClick(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT QT_INICIAL FROM TPO_ITEM');
    SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ITEM = :NR_ITEM AND NR_PARCIAL = 0 AND CD_EMPRESA = :CD_EMPRESA');
    ParamByName('NR_PROCESSO').AsString := qryPoItemNR_PROCESSO.AsString;
    ParamByName('NR_ITEM').AsString     := qryPoItemNR_ITEM.AsString;
    ParamByName('CD_EMPRESA').AsString  := qryPoItemCD_EMPRESA.AsString;
    Open;
    vQtdItem     := FieldByName('QT_INICIAL').AsFloat;
    if vQtdItem <> 0 then
    begin
      EditQTD.Color    := clWindow;
      EditQTD.Enabled  := True;

      EditQTD.Text := FloatToStr(FieldByName('QT_INICIAL').AsFloat);
      PnlBaixa.Top     := 24;
      PnlBaixa.Left    := 168;

      EditInvoiceNumeroParcial.Clear;
      EditDtFatura.Clear;

      PnlBaixa.Visible           := True;
      pgctrlItem.ActivePageIndex := 0;
      EditInvoiceNumeroParcial.SetFocus;
    end
    else
      BoxMensagem('Não há mais saldo para criar parciais !', 3);
  end;
end;

procedure TfrmGestaoPedido.btnCancelarEtapaClick(Sender: TObject);
begin
  PnlBaixa.Visible := False;
end;

procedure TfrmGestaoPedido.AtualizaSaldo(const vNrPedido : string; vCdEmpresa: String;
  const vNrItemCliente : string; const vQtd : Real; const vVlUnit : Real;
  const vPesoAtual : Real; const vTipoCalculo: Integer);
begin
  //Atualiza o Item principal, subtraindo a quantidade passada por parâmetro
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';

    Close;
    SQL.Clear;
    SQL.ADD('UPDATE TPO_ITEM set QT_INICIAL = QT_INICIAL + :QT_INICIAL,');
    SQL.ADD('                    PL_ITEM    = PL_ITEM    + :PL_ITEM, ');
    SQL.ADD('                    VL_TOTAL   = VL_TOTAL   + :VL_TOTAL');

    SQL.ADD('WHERE NR_PROCESSO = ''' + vNrPedido + ''' AND NR_ITEM_CLIENTE = ''' + vNrItemCliente + ''' AND NR_PARCIAL = 0 AND CD_EMPRESA = ''' + vCdEmpresa + '''');
    ParamByName('QT_INICIAL').AsFloat   := vQtd;
    ParamByName('PL_ITEM').AsFloat      := vPesoAtual;
    //ParamByName('VL_TOTAL').AsFloat     := vVlUnit * vQtd;
    ParamByName('VL_TOTAL').AsFloat     := CalculaValorTotal(vQtd, vVlUnit, vPesoAtual, vTipoCalculo);
    ExecSql;
    Free;
  end;
end;

procedure TfrmGestaoPedido.btnSalvarEtapaClick(Sender: TObject);
var
  vQtdBaixada : Real;
  procedure IncluiItem;
  var
    vNrItem, vNrItemCliente : string;
    vQtAtual, vQtDisp, vVlUnit, vPesoDisp, vPesoAtual : Real;
  begin
    vNrItemCliente := qryPoItemNR_ITEM_CLIENTE.AsString;
    qryPoItem.Insert;

    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      Close;
      //Pega o próximo número do NR_ITEM para aquele Pedido/Item
      //    vNrItem        := IntToStr(qryPoItemNR_ITEM.AsInteger + 1);
      //    vNrItem := Copy('000' + vNrItem,Length('000' + vNrItem)-2,3);
      SQL.Clear;
      SQL.ADD('SELECT RIGHT(''000'' + CONVERT(VARCHAR, MAX(NR_ITEM)+1),3) NR_ITEM');
      SQL.ADD('FROM TPO_ITEM WHERE NR_PROCESSO = ''' + vNrPedidoGestao + ''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''');
      Open;
      vNrItem := FieldByName('NR_ITEM').AsString;

      //Pega o próximo número do NR_PARCIAL para aquele Pedido/Item
      Close;
      SQL.Clear;
      SQL.ADD('SELECT MAX(NR_PARCIAL) FROM TPO_ITEM WHERE NR_PROCESSO = '''+ vNrPedidoGestao +''' ');
      SQL.ADD('AND NR_ITEM_CLIENTE = ''' + vNrItemCliente + ''' AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''');
      Open;
      qryPoItemNR_PARCIAL.AsInteger := Fields[0].AsInteger + 1;

      Close;
      SQL.Clear;
      SQL.ADD('SELECT *');
      SQL.ADD('FROM TPO_ITEM WHERE NR_PROCESSO = '''+ vNrPedidoGestao +''' ');
      SQL.ADD('AND NR_ITEM_CLIENTE = ''' + vNrItemCliente + '''');
      SQL.ADD('AND NR_PARCIAL = 0');
      SQL.ADD('AND CD_EMPRESA = ''' + vCdEmpresaGestao + '''');
      Open;

      vQtDisp    := FieldByName('QT_INICIAL').AsFloat;
      vQtAtual   := StrToFloat(EditQTD.Text);
      vVlUnit    := FieldByName('VL_UNITARIO').AsFloat;
      vPesoDisp  := FieldByName('PL_ITEM').AsFloat;

      vPesoAtual := (vQtAtual * vPesoDisp) / vQtDisp;

      qryPoItemNR_PROCESSO.AsString        := vNrPedidoGestao;
      qryPoItemNR_ITEM.AsString            := vNrItem;
      qryPoItemNR_ITEM_CLIENTE.AsString    := FieldByName('NR_ITEM_CLIENTE').AsString;
      qryPoItemCD_MERCADORIA.AsString      := FieldByName('CD_MERCADORIA').AsString;

      qryPoItemCD_MERCADORIA.AsString      := FieldByName('CD_MERCADORIA').AsString;
      qryPoItemCD_NCM_SH.AsString          := FieldByName('CD_NCM_SH').AsString;
      qryPoItemCD_UNID_MEDIDA.AsString     := FieldByName('CD_UNID_MEDIDA').AsString;
      qryPoItemCD_MOEDA_NEGOCIADA.AsString := FieldByName('CD_MOEDA_NEGOCIADA').AsString;
      qryPoItemCD_MERC_FORNEC.AsString     := FieldByName('CD_MERC_FORNEC').AsString;

      qryPoItemIN_REEIMPORTACAO.AsString     := FieldByName('IN_REEIMPORTACAO').AsString;
      qryPoItemIN_NECESSITA_LI.AsBoolean     :=FieldByName('IN_NECESSITA_LI').AsBoolean;
      qryPoItemIN_DRAWBACK.AsString          :=FieldByName('IN_DRAWBACK').AsString;
      qryPoItemQT_BAIXADA_DI.AsString        := FieldByName('QT_BAIXADA_DI').AsString;
      qryPoItemQT_BAIXADA_LI.AsString        := FieldByName('QT_BAIXADA_LI').AsString;
      qryPoItemIN_MONTADO.AsBoolean          := FieldByName('IN_MONTADO').AsBoolean;

      qryPoItemQT_INICIAL.AsFloat            := vQtAtual;
      qryPoItemQT_DISPONIVEL.AsFloat         := vQtAtual;
      qryPoItemPL_ITEM.AsFloat               := vPesoAtual;
      //qryPoItemVL_TOTAL.AsFloat              := vQtAtual * vVlUnit;
      qryPoItemVL_TOTAL.AsFloat              := CalculaValorTotal(vQtAtual, vVlUnit, vPesoAtual, FieldByName('TP_CALCULO').AsInteger);

      qryPoItemVL_UNITARIO.AsFloat           := FieldByName('VL_UNITARIO').AsFloat;
      qryPoItemTP_CALCULO.AsString           := FieldByName('TP_CALCULO').AsString;
      qryPoItemTP_DRAWBACK.AsString          := FieldByName('TP_DRAWBACK').AsString;
      qryPoItemCD_AREA.AsString              := FieldByName('CD_AREA').AsString;
      qryPoItemCD_EXPORTADOR.AsString        := FieldByName('CD_EXPORTADOR').AsString;
      qryPoItemCD_PAIS_AQUISICAO.AsString    := FieldByName('CD_PAIS_AQUISICAO').AsString;
      qryPoItemCD_FABRICANTE.AsString        := FieldByName('CD_FABRICANTE').AsString;
      qryPoItemCD_PAIS_ORIGEM.AsString       := FieldByName('CD_PAIS_ORIGEM').AsString;
      qryPoItemIN_FABR_EXP_PROD.AsString     := FieldByName('IN_FABR_EXP_PROD').AsString;
      qryPoItemCD_PAIS_ORIGEM.AsString       := FieldByName('CD_PAIS_ORIGEM').AsString;
      qryPoItemCD_LOCAL_DESEMBARQUE.AsString := FieldByName('CD_LOCAL_DESEMBARQUE').AsString;
      qryPoItemCD_EMBARCACAO.AsString        := FieldByName('CD_EMBARCACAO').AsString;
      qryPoItemCD_AGENTE.AsString            := FieldByName('CD_AGENTE').AsString;
      qryPoItemNR_VIAGEM.AsString            := FieldByName('NR_VIAGEM').AsString;
      qryPoItemNR_VOO.AsString               := FieldByName('NR_VOO').AsString;
      qryPoItemNR_CONHECIMENTO.AsString      := FieldByName('NR_CONHECIMENTO').AsString;
      qryPoItemNR_COURRIER.AsString          := FieldByName('NR_COURRIER').AsString;
      qryPoItemIN_CONSOLIDADO.AsString       := FieldByName('IN_CONSOLIDADO').AsString;
      qryPoItemIN_URGENTE.AsString           := FieldByName('IN_URGENTE').AsString;
      qryPoItemIN_SEGURO.AsString            := FieldByName('IN_SEGURO').AsString;
      qryPoItemTX_MERCADORIA.AsString        := FieldByName('TX_MERCADORIA').AsString;

      //Campos da tela de Baixa Parcial
//      qryPoItemNR_CONHECIMENTO.AsString      := EditNrBLParcial.Text;  campos agora são preenchidos na Instrução de Desemb - 25/09/2008
//      qryPoItemCD_EMBARCACAO.AsString        := EditNavioParcial.Text;

      qryPoItemNR_FATURA.AsString            := EditInvoiceNumeroParcial.Text;
      qryPoItemDT_FATURA.AsDateTime          := EditDtFatura.Date;

      qryPoItemCD_EMPRESA.AsString           := vCdEmpresaGestao;

      qryPoItem.Post;


      //Atualiza o Item principal, subtraindo a quantidade
      AtualizaSaldo(vNrPedidoGestao, vCdEmpresaGestao, vNrItemCliente, -vQtAtual, vVlUnit, -vPesoAtual, FieldByName('TP_CALCULO').AsInteger);

      //Ao gerar Parciais, alimentar os eventos 219, 354, 123 com as datas do Saldo
      AtualizaFlpImport;

      //Atualiza tela com os itens
      qryPoItem.Close;
      qryPoItem.Open;
      qryPoItem.Locate('NR_ITEM_CLIENTE', vNrItemCliente, []);

      Free;
    end;
  end;
begin
  if EditQTD.Enabled then
  begin
    if Trim(EditQTD.Text) <> '' then
    begin
      vQtdBaixada := StrToFloat(EditQTD.Text);
      if vQtdBaixada > vQtdItem then
      begin
        BoxMensagem('A quantidade ultrapassa o valor permitido!', 3);
        EditQTD.SetFocus;
      end
      else
      begin
        //Inclui o novo Registro
        IncluiItem;
        PnlBaixa.Visible := False;
      end;
    end
    else
    begin
      BoxMensagem('A quantidade deve ser preenchida !', 3);
      EditQTD.SetFocus;
    end;
  end
  else
  begin
    if Trim(EditInvoiceNumeroParcial.Text) <> '' then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('UPDATE TPO_ITEM SET ');
        SQL.Add('  NR_FATURA  =:NR_FATURA, ');
        SQL.Add('  DT_FATURA  =:DT_FATURA');
        SQL.Add('WHERE NR_PROCESSO =:NR_PROCESSO AND NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE and');
        SQL.Add('   NR_PARCIAL =:NR_PARCIAL and CD_EMPRESA = :CD_EMPRESA');

        ParamByName('NR_FATURA').AsString       := EditInvoiceNumeroParcial.Text;
        ParamByName('DT_FATURA').AsDateTime     := EditDtFatura.Date;

        ParamByName('NR_PROCESSO').AsString     := qryPoItemParciaisNR_PROCESSO.AsString;
        ParamByName('NR_ITEM_CLIENTE').AsString := qryPoItemParciaisNR_ITEM_CLIENTE.AsString;
        ParamByName('NR_PARCIAL').AsString      := qryPoItemParciaisNR_PARCIAL.AsString;
        ParamByName('CD_EMPRESA').AsString      := qryPoItemParciaisCD_EMPRESA.AsString;
        ExecSQL;
        Free;
        qryPoItem.Close;
        qryPoItem.Open;
      end;                            
      {qryPoItem.Edit;
      qryPoItem.FieldByName('NR_FATURA').AsString := EditInvoiceNumeroParcial.Text;
      qryPoItem.FieldByName('DT_FATURA').AsDateTime := EditDtFatura.Date;
      qryPoItem.Post;}
      PnlBaixa.Visible := False;
      AtivaBtnMenu(True, False, False, False, True, True);
    end
    else
    begin
      BoxMensagem('O campo "Invoice Número" deve ser preenchido !', 3);
      EditInvoiceNumeroParcial.SetFocus;
    end;
  end;
end;

procedure TfrmGestaoPedido.EditQTDKeyPress(Sender: TObject; var Key: Char);
begin
  if not ( IsNumeric(Key) ) and ( Key <> chr(VK_RETURN) ) and ( Key <> chr(VK_BACK) ) then
    Key := #0;
end;

procedure TfrmGestaoPedido.qryPoItemAfterOpen(DataSet: TDataSet);
begin
  qryPoItemParciais.Open;
end;

procedure TfrmGestaoPedido.Image1Click(Sender: TObject);
var
  vNrItemCliente : string;
  vQtd, vPesoAtual, vVlUnit : Real;
begin
  if qryPoItemParciaisNR_PROCESSO_DES.AsString = '' then
  begin
    if not qryPoItemParciais.IsEmpty then
    begin
      if Application.MessageBox('Deseja excluir esta parcial ?','Atenção',MB_IconQuestion + Mb_YesNo + MB_DEFBUTTON2) = idYes then
      begin
        vQtd       := qryPoItemParciaisQT_INICIAL.AsFloat;
        vPesoAtual := qryPoItemParciaisPL_ITEM.AsFloat;
        vVlUnit    := qryPoItemParciaisVL_UNITARIO.AsFloat;

        datm_main.db_broker.StartTransaction;
        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          Sql.Add('DELETE FROM TPO_ITEM');
          Sql.Add('WHERE');
          Sql.Add('  NR_PROCESSO =:NR_PROCESSO AND');
          Sql.Add('  NR_ITEM     =:NR_ITEM     AND');
          Sql.Add('  NR_PARCIAL  =:NR_PARCIAL  AND');
          Sql.Add('  CD_EMPRESA  =:CD_EMPRESA');
          ParamByName('NR_PROCESSO').AsString := qryPoItemParciaisNR_PROCESSO.AsString;
          ParamByName('NR_ITEM').AsString     := qryPoItemParciaisNR_ITEM.AsString;
          ParamByName('NR_PARCIAL').AsInteger := qryPoItemParciaisNR_PARCIAL.AsInteger;
          ParamByName('CD_EMPRESA').AsString := qryPoItemParciaisCD_EMPRESA.AsString;
          ExecSql;
        end;
        //Atualiza o Item principal, somando a quantidade
        AtualizaSaldo(vNrPedidoGestao, vCdEmpresaGestao, qryPoItemParciaisNR_ITEM_CLIENTE.AsString, vQtd, vVlUnit, vPesoAtual, qryPoItemTP_CALCULO.AsInteger);
        datm_main.db_broker.Commit;
      end;
      vNrItemCliente := qryPoItemNR_ITEM_CLIENTE.AsString;
      qryPoItem.Close;
      qryPoItem.Open;
      qryPoItem.Locate('NR_ITEM_CLIENTE', vNrItemCliente, []);
    end
    else
      BoxMensagem('Não existem Parciais para serem excluídas !!', 3);
  end
  else
    BoxMensagem('Não é possível excluir esta parcial pois já existe processo de desembaraço atrelado ao Pedido/Item !', 3);
end;

procedure TfrmGestaoPedido.qryPoItemAfterInsert(DataSet: TDataSet);
begin
  qryPoItemDT_ABERTURA_ITEM.AsDateTime := Date;
end;

procedure TfrmGestaoPedido.qryPoItemParciaisCalcFields(DataSet: TDataSet);
begin
  qryPoItemParciais.FieldByName('calcNR_PROCESSO_DES').AsString := Copy(qryPoItemParciais.FieldByName('NR_PROCESSO_DES').AsString, 5, 13);  
end;

procedure TfrmGestaoPedido.btn_co_nm_fabricClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryPoItem) then Exit;
//      qryPoItemCD_FABRICANTE.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Empresa'],'CD_EMPRESA',nil)
    qryPoItemCD_FABRICANTE.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NR_CLIENTE, NM_EMPRESA, SUBSTRING(P.NM_PAIS,1,35), RTRIM(END_EMPRESA) + '', '' + END_NUMERO ENDERECO ' +
    ' FROM TEMPRESA_EST E, TPAIS_BROKER P WHERE P.CD_PAIS = E.CD_PAIS AND IN_EXPORTADOR = ''1''','Exportadores',['CD_EMPRESA', 'NR_CLIENTE', 'NM_EMPRESA', 'NM_PAIS', 'ENDERECO'],['Código', 'Cod. no Cliente', 'Nome', 'País', 'Endereço'],'CD_EMPRESA',nil)
  end
  else
    EditNmFabricante.Text := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', dbedt_fabricante.Text, 'NM_EMPRESA');
end;

procedure TfrmGestaoPedido.dbedt_fabricanteExit(Sender: TObject);
begin
  ValidCodigo(dbedt_fabricante);
end;

procedure TfrmGestaoPedido.AtualizaFlpImport;
var
  QryUpdate : TQuery;
begin
  try
    QryUpdate := TQuery.Create(Application);
    QryUpdate.DatabaseName := 'DBBROKER';
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_EVENTO, DT_REALIZACAO FROM TFLP_PO_ITEM(NOLOCK)');
      SQL.Add('WHERE NR_PROCESSO =:NR_PROCESSO AND NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE');
      SQL.Add('AND NR_PARCIAL =:NR_PARCIAL ');
      SQL.Add('AND CD_EMPRESA  =:CD_EMPRESA');
      ParamByName('NR_PROCESSO').AsString     := qryPoItem.FieldByName('NR_PROCESSO').AsString;
      ParamByName('NR_ITEM_CLIENTE').AsString := qryPoItem.FieldByName('NR_ITEM_CLIENTE').AsString;
      ParamByName('NR_PARCIAL').AsInteger     := 0;
      ParamByName('CD_EMPRESA').AsString      := qryPoItem.FieldByName('CD_EMPRESA').AsString;
      Open;
      while not Eof do
      begin
        if FieldByName('DT_REALIZACAO').AsDateTime <> 0 then
        begin
          QryUpdate.Close;
          QryUpdate.SQL.Add('UPDATE TFLP_PO_ITEM');
          QryUpdate.SQL.Add('SET');
          QryUpdate.SQL.Add('   DT_REALIZACAO      =:DT_REALIZACAO,    ');
          QryUpdate.SQL.Add('   CD_RESP_REALIZACAO =:CD_RESP_REALIZACAO');
          QryUpdate.SQL.Add('WHERE');
          QryUpdate.SQL.Add('   NR_PROCESSO =:NR_PROCESSO AND NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE and');
          QryUpdate.SQL.Add('   NR_PARCIAL  =:NR_PARCIAL AND CD_EVENTO =:CD_EVENTO AND');
          QryUpdate.SQL.Add('   CD_EMPRESA  =:CD_EMPRESA');
          QryUpdate.ParamByName('DT_REALIZACAO').AsDateTime     := FieldByName('DT_REALIZACAO').AsDateTime;
          QryUpdate.ParamByName('CD_RESP_REALIZACAO').AsString  := str_cd_usuario;
          QryUpdate.ParamByName('NR_PROCESSO').AsString         := qryPoItem.FieldByName('NR_PROCESSO').AsString;
          QryUpdate.ParamByName('NR_ITEM_CLIENTE').AsString     := qryPoItem.FieldByName('NR_ITEM_CLIENTE').AsString;
          QryUpdate.ParamByName('NR_PARCIAL').AsInteger         := qryPoItem.FieldByName('NR_PARCIAL').AsInteger;
          QryUpdate.ParamByName('CD_EVENTO').AsString           := FieldByName('CD_EVENTO').AsString;
          QryUpdate.ParamByName('CD_EMPRESA').AsString          := qryPoItem.FieldByName('CD_EMPRESA').AsString;
          QryUpdate.ExecSql;
        end;
        Next;
      end;
    end;
  finally
    QryUpdate.Free;
  end;
end;

procedure TfrmGestaoPedido.Image2Click(Sender: TObject);
begin
  if not qryPoItemParciais.IsEmpty then
  begin
    PnlBaixa.Top     := 24;
    PnlBaixa.Left    := 168;
    PnlBaixa.Visible := True;

    EditQTD.Color := clMenu;
    EditQTD.Text := qryPoItemParciais.FieldByName('QT_INICIAL').AsString;
    EditQTD.Enabled  := False;

    EditInvoiceNumeroParcial.Text := qryPoItemParciais.FieldByName('NR_FATURA').AsString;
    EditDtFatura.Text             := qryPoItemParciais.FieldByName('DT_FATURA').AsString;
    EditInvoiceNumeroParcial.SetFocus;
  end
  else
    BoxMensagem('Não existem Parciais para serem alteradas !!', 3);
end;

procedure TfrmGestaoPedido.BtnLimpaCondicaoClick(Sender: TObject);
begin
  if not PoeEmEdicao(qryProcesso) then
    Exit;
  qryProcessoDIAS_CONDICAO_PAGTO.AsString := '';
  qryProcessoCONDICAO_PAGTO.AsString      := '';
  CmbCondicao.ItemIndex                   := -1;
  CmbCondicaoTipo.ItemIndex               := -1;
end;

function TfrmGestaoPedido.CalculaValorTotal(AQuantidade, AValorUnitario,
   APesoLiquido: Double; ATipoCalculo: Integer): Double;
begin
  // Se a quantidade ou o valor unitário for zero retorna zero
  if AQuantidade * AValorUnitario = 0 then
    Result := 0
  else
    case ATipoCalculo of
      1: Result := Arredondar(AQuantidade * AValorUnitario, 2 );
      2: Result := Arredondar(AQuantidade * AValorUnitario / 100, 2 );
      3: Result := Arredondar(AQuantidade * AValorUnitario / 1000, 2 );
      4: Result := Arredondar(APesoLiquido * AValorUnitario, 2 );
      5: Result := 0; // Deve ser digitado pelo usuário
    else
      Result := Arredondar(AQuantidade * AValorUnitario, 2 );
    end;
end;

procedure TfrmGestaoPedido.edtCodigoClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmGestaoPedido.mskNrPedidoChange(Sender: TObject);
begin
  if not vInserindoNovaGestao then
  begin
    if qryProcesso.Active then
    begin
      qryProcesso.Close;
      edtCodigoCliente.Clear;
    end;
    ExibeComponente(False);
  end;
end;

procedure TfrmGestaoPedido.dbedtCodigoUnidMedKeyPress(Sender: TObject; var Key: Char);
begin
  // Apenas Letras, Números e BackSpace - Michel - 23/09/2010
  if not (Key in ['a'..'z', 'A'..'Z', '0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmGestaoPedido.dbedtCodigoUnidMedExit(Sender: TObject);
begin
  if qryPoItem.State in [dsEdit, dsInsert] then
    while Length(qryPoItemCD_UNID_MEDIDA.AsString) < 3 do
      qryPoItemCD_UNID_MEDIDA.AsString := '0' + qryPoItemCD_UNID_MEDIDA.AsString;
end;

procedure TfrmGestaoPedido.dbedt_moeda_negociadaKeyPress(Sender: TObject; var Key: Char);
begin
  // Apenas Números e BackSpace - Michel - 23/09/2010
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmGestaoPedido.dbedt_moeda_negociadaExit(Sender: TObject);
begin
  if qryPoItem.State in [dsEdit, dsInsert] then
    while Length(qryPoItemCD_MOEDA_NEGOCIADA.AsString) < 3 do
      qryPoItemCD_MOEDA_NEGOCIADA.AsString := '0' + qryPoItemCD_MOEDA_NEGOCIADA.AsString;
end;



end.

