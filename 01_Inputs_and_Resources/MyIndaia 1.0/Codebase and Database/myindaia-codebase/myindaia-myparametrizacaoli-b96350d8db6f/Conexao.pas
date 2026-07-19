unit Conexao;

interface

uses
  SysUtils, Classes, Variants, DBXMSSQL, DB, SqlExpr, DBXCommon, DBClient,
  FMTBcd, Provider, MaskUtils, IdMessage, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdAttachmentFile, IdText, StrUtils, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

const
  ID_TABELA = 1652005462;

type
  TSQLClientDataSet = class(TClientDataSet)
  private
    function GetSQL: TStrings;
    procedure SetSQL(const Value: TStrings);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Open(AParamValues: array of Variant); reintroduce;
    procedure ReOpen;
    property SQL: TStrings read GetSQL write SetSQL;
  end;

type
  TdtmMyParametrizacaoLI = class(TDataModule)
    DbConnection: TSQLConnection;
    qryConsulta: TSQLQuery;
    dspConsulta: TDataSetProvider;
    qryMail: TSQLQuery;
    qryMailNM_HOST: TStringField;
    qryMailNR_PORTA: TIntegerField;
    qryMailNM_LOGIN: TStringField;
    qryMailNM_SENHA: TStringField;
    qryMailNM_HOST_WEB: TStringField;
    qryMailNR_PORTA_WEB: TIntegerField;
    qryMailNM_LOGIN_WEB: TStringField;
    qryMailNM_SENHA_WEB: TStringField;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    cdsConsulta: TClientDataSet;
    qryPreencheLI: TSQLQuery;
    dspPreencheLI: TDataSetProvider;
    cdsPreencheLI: TClientDataSet;
    qryPreencheLINR_IDENT_USUARIO: TStringField;
    qryPreencheLITP_IMPORTADOR: TStringField;
    qryPreencheLICPNJ_IMPORTADOR: TStringField;
    qryPreencheLICD_PAIS_PROC: TStringField;
    qryPreencheLICD_URF_DESPACHO: TStringField;
    qryPreencheLICD_URF_ENTRADA: TStringField;
    qryPreencheLITX_INFO_COMPL: TStringField;
    qryPreencheLITP_FORNECEDOR: TStringField;
    qryPreencheLINM_FORNECEDOR: TStringField;
    qryPreencheLICD_PAIS_AQUISICAO: TStringField;
    qryPreencheLINM_END_FORNECEDOR: TStringField;
    qryPreencheLINR_END_FORNECEDOR: TStringField;
    qryPreencheLICOMPL_END_FORNECEDOR: TStringField;
    qryPreencheLICIDADE_END_FORNECEDOR: TStringField;
    qryPreencheLIESTADO_END_FORNECEDOR: TStringField;
    cdsPreencheLINR_IDENT_USUARIO: TStringField;
    cdsPreencheLITP_IMPORTADOR: TStringField;
    cdsPreencheLICPNJ_IMPORTADOR: TStringField;
    cdsPreencheLICD_PAIS_PROC: TStringField;
    cdsPreencheLICD_URF_DESPACHO: TStringField;
    cdsPreencheLICD_URF_ENTRADA: TStringField;
    cdsPreencheLITX_INFO_COMPL: TStringField;
    cdsPreencheLITP_FORNECEDOR: TStringField;
    cdsPreencheLINM_FORNECEDOR: TStringField;
    cdsPreencheLICD_PAIS_AQUISICAO: TStringField;
    cdsPreencheLINM_END_FORNECEDOR: TStringField;
    cdsPreencheLINR_END_FORNECEDOR: TStringField;
    cdsPreencheLICOMPL_END_FORNECEDOR: TStringField;
    cdsPreencheLICIDADE_END_FORNECEDOR: TStringField;
    cdsPreencheLIESTADO_END_FORNECEDOR: TStringField;
    qryPreencheLICD_REG_TRIB: TStringField;
    qryPreencheLICD_FUND_LEGAL: TStringField;
    qryPreencheLICD_ACORDO_ALADI: TStringField;
    qryPreencheLICD_COB_CAMBIAL: TStringField;
    qryPreencheLICD_MODALIDADE: TStringField;
    qryPreencheLIQT_DIAS_LIMITE: TIntegerField;
    cdsPreencheLICD_REG_TRIB: TStringField;
    cdsPreencheLICD_FUND_LEGAL: TStringField;
    cdsPreencheLICD_ACORDO_ALADI: TStringField;
    cdsPreencheLICD_COB_CAMBIAL: TStringField;
    cdsPreencheLICD_MODALIDADE: TStringField;
    cdsPreencheLIQT_DIAS_LIMITE: TIntegerField;
    qryPreencheLINR_PROCESSO: TStringField;
    cdsPreencheLINR_PROCESSO: TStringField;
    cdsPreencheLIItens: TClientDataSet;
    qryPreencheLIItens: TSQLQuery;
    dspPreencheLIItens: TDataSetProvider;
    qryPreencheLIItensCD_NCM: TStringField;
    qryPreencheLIItensCD_NALADI: TStringField;
    qryPreencheLIItensQT_UNID_ESTAT: TFloatField;
    qryPreencheLIItensPESO_LIQ: TFloatField;
    qryPreencheLIItensCD_MOEDA_NEG: TStringField;
    qryPreencheLIItensCD_INCOTERM: TStringField;
    qryPreencheLIItensVL_TOTAL_LOCAL_EMB: TFloatField;
    qryPreencheLIItensCD_CONDICAO_MERC: TStringField;
    qryPreencheLIItensNR_DESTAQUE_NCM: TStringField;
    qryPreencheLIItensNR_PROC_ANUENTE: TStringField;
    qryPreencheLIItensSIGLA_ORG_ANUENTE: TStringField;
    qryPreencheLIItensSISTEMA_DRAWBACK: TIntegerField;
    qryPreencheLIItensNM_UNID_COMERC: TStringField;
    qryPreencheLIItensQT_MERC_COMERC: TFloatField;
    qryPreencheLIItensVL_UNIT_COND_VENDA: TFloatField;
    qryPreencheLIItensNM_ESPEC_MERC: TStringField;
    cdsPreencheLIItensCD_NCM: TStringField;
    cdsPreencheLIItensCD_NALADI: TStringField;
    cdsPreencheLIItensQT_UNID_ESTAT: TFloatField;
    cdsPreencheLIItensPESO_LIQ: TFloatField;
    cdsPreencheLIItensCD_MOEDA_NEG: TStringField;
    cdsPreencheLIItensCD_INCOTERM: TStringField;
    cdsPreencheLIItensVL_TOTAL_LOCAL_EMB: TFloatField;
    cdsPreencheLIItensCD_CONDICAO_MERC: TStringField;
    cdsPreencheLIItensNR_DESTAQUE_NCM: TStringField;
    cdsPreencheLIItensNR_PROC_ANUENTE: TStringField;
    cdsPreencheLIItensSIGLA_ORG_ANUENTE: TStringField;
    cdsPreencheLIItensSISTEMA_DRAWBACK: TIntegerField;
    cdsPreencheLIItensNM_UNID_COMERC: TStringField;
    cdsPreencheLIItensQT_MERC_COMERC: TFloatField;
    cdsPreencheLIItensVL_UNIT_COND_VENDA: TFloatField;
    cdsPreencheLIItensNM_ESPEC_MERC: TStringField;
    qryPreencheLINM_FABRICANTE: TStringField;
    qryPreencheLICD_PAIS_ORIGEM: TStringField;
    qryPreencheLINM_END_FABRICANTE: TStringField;
    qryPreencheLINR_END_FABRICANTE: TStringField;
    qryPreencheLICOMPL_END_FABRICANTE: TStringField;
    qryPreencheLICIDADE_END_FABRICANTE: TStringField;
    qryPreencheLIESTADO_END_FABRICANTE: TStringField;
    cdsPreencheLINM_FABRICANTE: TStringField;
    cdsPreencheLICD_PAIS_ORIGEM: TStringField;
    cdsPreencheLINM_END_FABRICANTE: TStringField;
    cdsPreencheLINR_END_FABRICANTE: TStringField;
    cdsPreencheLICOMPL_END_FABRICANTE: TStringField;
    cdsPreencheLICIDADE_END_FABRICANTE: TStringField;
    cdsPreencheLIESTADO_END_FABRICANTE: TStringField;
    qryPreencheLIItensNR_DRAWBACK: TStringField;
    qryPreencheLIItensNR_ITEM_DRAWBACK: TStringField;
    qryPreencheLIItensQT_PRODUTO_DRAWBACK: TFloatField;
    qryPreencheLIItensVL_PRODUTO_DRAWBACK: TFloatField;
    cdsPreencheLIItensNR_DRAWBACK: TStringField;
    cdsPreencheLIItensNR_ITEM_DRAWBACK: TStringField;
    cdsPreencheLIItensQT_PRODUTO_DRAWBACK: TFloatField;
    cdsPreencheLIItensVL_PRODUTO_DRAWBACK: TFloatField;
    qryPreencheLITP_ACORDO_ALADI: TStringField;
    cdsPreencheLITP_ACORDO_ALADI: TStringField;
    qryPreencheLINR_ATO_DRAWBACK: TStringField;
    cdsPreencheLINR_ATO_DRAWBACK: TStringField;
    qryRecuperaLI: TSQLQuery;
    dspRecuperaLI: TDataSetProvider;
    cdsRecuperaLI: TClientDataSet;
    cdsDestaqueNCM: TClientDataSet;
    dspDestaqueNCM: TDataSetProvider;
    cdsOpeTratamento: TClientDataSet;
    qryOpeTratamento: TSQLQuery;
    dspOpeTratamento: TDataSetProvider;
    cdsMercTratamento: TClientDataSet;
    qryMercTratamento: TSQLQuery;
    dspMercTratamento: TDataSetProvider;
    qryDestaqueNCM: TSQLQuery;
    qryDestaqueNCMNR_OPER_TRAT_PREV: TStringField;
    qryDestaqueNCMNR_DESTAQUE_NCM: TStringField;
    cdsDestaqueNCMNR_OPER_TRAT_PREV: TStringField;
    cdsDestaqueNCMNR_DESTAQUE_NCM: TStringField;
    qryOpeTratamentoNR_OPER_TRAT_PREV: TStringField;
    qryOpeTratamentoNR_IDENT_USUARIO: TStringField;
    qryOpeTratamentoNR_OPER_TRAT_PROT: TStringField;
    qryOpeTratamentoCD_AUTORIZ_TRANSM: TStringField;
    qryOpeTratamentoNR_TRAT_IMP_MICRO: TStringField;
    qryOpeTratamentoNR_LI_SUBSTITUIDO: TStringField;
    qryOpeTratamentoCD_ORIGEM_LI: TStringField;
    qryOpeTratamentoNR_DECL_IMP_VINC: TStringField;
    qryOpeTratamentoNR_ADI_IMP_VINC: TStringField;
    qryOpeTratamentoNR_SEQ_RETI_VINC: TStringField;
    qryOpeTratamentoCD_TIPO_IMPORTADOR: TStringField;
    qryOpeTratamentoNR_IMPORTADOR: TStringField;
    qryOpeTratamentoCD_PAIS_IMPORTADOR: TStringField;
    qryOpeTratamentoNM_IMPORTADOR: TStringField;
    qryOpeTratamentoNR_TEL_IMPORTADOR: TStringField;
    qryOpeTratamentoED_LOGR_IMPORTADOR: TStringField;
    qryOpeTratamentoED_NR_IMPORTADOR: TStringField;
    qryOpeTratamentoED_COMPL_IMPO: TStringField;
    qryOpeTratamentoED_BA_IMPORTADOR: TStringField;
    qryOpeTratamentoED_MUN_IMPORTADOR: TStringField;
    qryOpeTratamentoED_UF_IMPORTADOR: TStringField;
    qryOpeTratamentoED_CEP_IMPORTADOR: TStringField;
    qryOpeTratamentoCD_ATIV_ECON_IMPO: TStringField;
    qryOpeTratamentoNR_CPF_REPR_LEGAL: TStringField;
    qryOpeTratamentoCD_URF_ENTR_MERC: TStringField;
    qryOpeTratamentoNM_FORN_ESTR: TStringField;
    qryOpeTratamentoED_LOGR_FORN_ESTR: TStringField;
    qryOpeTratamentoED_NR_FORN_ESTR: TStringField;
    qryOpeTratamentoED_COMPL_FORN_ESTR: TStringField;
    qryOpeTratamentoED_CIDAD_FORN_ESTR: TStringField;
    qryOpeTratamentoED_ESTAD_FORN_ESTR: TStringField;
    qryOpeTratamentoCD_PAIS_AQUIS_MERC: TStringField;
    qryOpeTratamentoCD_MERCADORIA_NCM: TStringField;
    qryOpeTratamentoCD_PAIS_PROC_MERC: TStringField;
    qryOpeTratamentoCD_AUSENCIA_FABRIC: TStringField;
    qryOpeTratamentoNM_FABRICANTE_MERC: TStringField;
    qryOpeTratamentoED_LOGR_FABRIC: TStringField;
    qryOpeTratamentoED_NR_FABRIC: TStringField;
    qryOpeTratamentoED_COMPL_FABRIC: TStringField;
    qryOpeTratamentoED_CIDAD_FABRIC: TStringField;
    qryOpeTratamentoED_ESTADO_FABRIC: TStringField;
    qryOpeTratamentoCD_PAIS_ORIG_MERC: TStringField;
    qryOpeTratamentoCD_MERC_NALADI_NCC: TStringField;
    qryOpeTratamentoCD_MERC_NALADI_SH: TStringField;
    qryOpeTratamentoPL_MERCADORIA: TStringField;
    qryOpeTratamentoQT_UN_ESTATISTICA: TStringField;
    qryOpeTratamentoCD_MOEDA_NEGOCIADA: TStringField;
    qryOpeTratamentoQT_DIA_LIMITE_PGTO: TStringField;
    qryOpeTratamentoCD_INCOTERMS_VENDA: TStringField;
    qryOpeTratamentoVL_MERC_MNEG_EMB: TStringField;
    qryOpeTratamentoVL_TOT_DOLAR_EMB: TStringField;
    qryOpeTratamentoCD_TIPO_ACORDO_TAR: TStringField;
    qryOpeTratamentoCD_ACORDO_ALADI: TStringField;
    qryOpeTratamentoCD_REGIME_TRIBUTAR: TStringField;
    qryOpeTratamentoCD_FUND_LEG_REGIME: TStringField;
    qryOpeTratamentoCD_COBERT_CAMBIAL: TStringField;
    qryOpeTratamentoCD_MODALIDADE_PGTO: TStringField;
    qryOpeTratamentoCD_ORGAO_FIN_INTER: TStringField;
    qryOpeTratamentoCD_MOTIVO_SEM_COB: TStringField;
    qryOpeTratamentoCD_AGENCIA_SECEX: TStringField;
    qryOpeTratamentoCD_URF_DESPACHO: TStringField;
    qryOpeTratamentoIN_REST_DATA_EMB_LI: TStringField;
    qryOpeTratamentoIN_MATERIAL_USADO: TBooleanField;
    qryOpeTratamentoIN_BEM_ENCOMENDA: TBooleanField;
    qryOpeTratamentoNR_ATO_DRAWBACK: TStringField;
    qryOpeTratamentoNR_COMUNIC_COMPRA: TStringField;
    qryOpeTratamentoDT_REG_OPER_TRAT: TStringField;
    qryOpeTratamentoDT_ATU_OPER_MICRO: TStringField;
    qryOpeTratamentoIN_SALVO_DIAG: TBooleanField;
    qryOpeTratamentoIN_SELECAO_DIAG: TBooleanField;
    qryOpeTratamentoTX_INFO_COMPL: TMemoField;
    qryOpeTratamentoCD_SITUAC_OP_TRAT: TStringField;
    qryOpeTratamentoDT_SITUAC_OP_TRAT: TStringField;
    qryOpeTratamentoDT_VALID_OP_TRAT: TStringField;
    qryOpeTratamentoCD_CANCEL_OP_TRAT: TStringField;
    qryOpeTratamentoDT_CANCEL_OP_TRAT: TStringField;
    qryOpeTratamentoNR_CPF_CANC_ANUENC: TStringField;
    qryOpeTratamentoNR_LI_SUBSTITUTIVO: TStringField;
    qryOpeTratamentoIN_REG_DRAWBACK: TStringField;
    qryOpeTratamentoNR_REG_DRAWBACK: TStringField;
    qryOpeTratamentoIN_LI_INCLUIDA: TStringField;
    cdsOpeTratamentoNR_OPER_TRAT_PREV: TStringField;
    cdsOpeTratamentoNR_IDENT_USUARIO: TStringField;
    cdsOpeTratamentoNR_OPER_TRAT_PROT: TStringField;
    cdsOpeTratamentoCD_AUTORIZ_TRANSM: TStringField;
    cdsOpeTratamentoNR_TRAT_IMP_MICRO: TStringField;
    cdsOpeTratamentoNR_LI_SUBSTITUIDO: TStringField;
    cdsOpeTratamentoCD_ORIGEM_LI: TStringField;
    cdsOpeTratamentoNR_DECL_IMP_VINC: TStringField;
    cdsOpeTratamentoNR_ADI_IMP_VINC: TStringField;
    cdsOpeTratamentoNR_SEQ_RETI_VINC: TStringField;
    cdsOpeTratamentoCD_TIPO_IMPORTADOR: TStringField;
    cdsOpeTratamentoNR_IMPORTADOR: TStringField;
    cdsOpeTratamentoCD_PAIS_IMPORTADOR: TStringField;
    cdsOpeTratamentoNM_IMPORTADOR: TStringField;
    cdsOpeTratamentoNR_TEL_IMPORTADOR: TStringField;
    cdsOpeTratamentoED_LOGR_IMPORTADOR: TStringField;
    cdsOpeTratamentoED_NR_IMPORTADOR: TStringField;
    cdsOpeTratamentoED_COMPL_IMPO: TStringField;
    cdsOpeTratamentoED_BA_IMPORTADOR: TStringField;
    cdsOpeTratamentoED_MUN_IMPORTADOR: TStringField;
    cdsOpeTratamentoED_UF_IMPORTADOR: TStringField;
    cdsOpeTratamentoED_CEP_IMPORTADOR: TStringField;
    cdsOpeTratamentoCD_ATIV_ECON_IMPO: TStringField;
    cdsOpeTratamentoNR_CPF_REPR_LEGAL: TStringField;
    cdsOpeTratamentoCD_URF_ENTR_MERC: TStringField;
    cdsOpeTratamentoNM_FORN_ESTR: TStringField;
    cdsOpeTratamentoED_LOGR_FORN_ESTR: TStringField;
    cdsOpeTratamentoED_NR_FORN_ESTR: TStringField;
    cdsOpeTratamentoED_COMPL_FORN_ESTR: TStringField;
    cdsOpeTratamentoED_CIDAD_FORN_ESTR: TStringField;
    cdsOpeTratamentoED_ESTAD_FORN_ESTR: TStringField;
    cdsOpeTratamentoCD_PAIS_AQUIS_MERC: TStringField;
    cdsOpeTratamentoCD_MERCADORIA_NCM: TStringField;
    cdsOpeTratamentoCD_PAIS_PROC_MERC: TStringField;
    cdsOpeTratamentoCD_AUSENCIA_FABRIC: TStringField;
    cdsOpeTratamentoNM_FABRICANTE_MERC: TStringField;
    cdsOpeTratamentoED_LOGR_FABRIC: TStringField;
    cdsOpeTratamentoED_NR_FABRIC: TStringField;
    cdsOpeTratamentoED_COMPL_FABRIC: TStringField;
    cdsOpeTratamentoED_CIDAD_FABRIC: TStringField;
    cdsOpeTratamentoED_ESTADO_FABRIC: TStringField;
    cdsOpeTratamentoCD_PAIS_ORIG_MERC: TStringField;
    cdsOpeTratamentoCD_MERC_NALADI_NCC: TStringField;
    cdsOpeTratamentoCD_MERC_NALADI_SH: TStringField;
    cdsOpeTratamentoPL_MERCADORIA: TStringField;
    cdsOpeTratamentoQT_UN_ESTATISTICA: TStringField;
    cdsOpeTratamentoCD_MOEDA_NEGOCIADA: TStringField;
    cdsOpeTratamentoQT_DIA_LIMITE_PGTO: TStringField;
    cdsOpeTratamentoCD_INCOTERMS_VENDA: TStringField;
    cdsOpeTratamentoVL_MERC_MNEG_EMB: TStringField;
    cdsOpeTratamentoVL_TOT_DOLAR_EMB: TStringField;
    cdsOpeTratamentoCD_TIPO_ACORDO_TAR: TStringField;
    cdsOpeTratamentoCD_ACORDO_ALADI: TStringField;
    cdsOpeTratamentoCD_REGIME_TRIBUTAR: TStringField;
    cdsOpeTratamentoCD_FUND_LEG_REGIME: TStringField;
    cdsOpeTratamentoCD_COBERT_CAMBIAL: TStringField;
    cdsOpeTratamentoCD_MODALIDADE_PGTO: TStringField;
    cdsOpeTratamentoCD_ORGAO_FIN_INTER: TStringField;
    cdsOpeTratamentoCD_MOTIVO_SEM_COB: TStringField;
    cdsOpeTratamentoCD_AGENCIA_SECEX: TStringField;
    cdsOpeTratamentoCD_URF_DESPACHO: TStringField;
    cdsOpeTratamentoIN_REST_DATA_EMB_LI: TStringField;
    cdsOpeTratamentoIN_MATERIAL_USADO: TBooleanField;
    cdsOpeTratamentoIN_BEM_ENCOMENDA: TBooleanField;
    cdsOpeTratamentoNR_ATO_DRAWBACK: TStringField;
    cdsOpeTratamentoNR_COMUNIC_COMPRA: TStringField;
    cdsOpeTratamentoDT_REG_OPER_TRAT: TStringField;
    cdsOpeTratamentoDT_ATU_OPER_MICRO: TStringField;
    cdsOpeTratamentoIN_SALVO_DIAG: TBooleanField;
    cdsOpeTratamentoIN_SELECAO_DIAG: TBooleanField;
    cdsOpeTratamentoTX_INFO_COMPL: TMemoField;
    cdsOpeTratamentoCD_SITUAC_OP_TRAT: TStringField;
    cdsOpeTratamentoDT_SITUAC_OP_TRAT: TStringField;
    cdsOpeTratamentoDT_VALID_OP_TRAT: TStringField;
    cdsOpeTratamentoCD_CANCEL_OP_TRAT: TStringField;
    cdsOpeTratamentoDT_CANCEL_OP_TRAT: TStringField;
    cdsOpeTratamentoNR_CPF_CANC_ANUENC: TStringField;
    cdsOpeTratamentoNR_LI_SUBSTITUTIVO: TStringField;
    cdsOpeTratamentoIN_REG_DRAWBACK: TStringField;
    cdsOpeTratamentoNR_REG_DRAWBACK: TStringField;
    cdsOpeTratamentoIN_LI_INCLUIDA: TStringField;
    qryMercTratamentoNR_OPER_TRAT_PREV: TStringField;
    qryMercTratamentoNR_SEQ_PRODUTO: TStringField;
    qryMercTratamentoQT_MERC_UN_COMERC: TStringField;
    qryMercTratamentoNM_UN_MEDID_COMER: TStringField;
    qryMercTratamentoVL_UNID_COND_VENDA: TStringField;
    qryMercTratamentoTX_DESC_DET_MERC: TMemoField;
    qryMercTratamentoCD_PRODUTO: TStringField;
    qryMercTratamentoNR_ITEM_DRAWBACK: TStringField;
    qryMercTratamentoQT_PROD_DRAWBACK: TStringField;
    qryMercTratamentoVL_PROD_DRAWBACK: TStringField;
    cdsMercTratamentoNR_OPER_TRAT_PREV: TStringField;
    cdsMercTratamentoNR_SEQ_PRODUTO: TStringField;
    cdsMercTratamentoQT_MERC_UN_COMERC: TStringField;
    cdsMercTratamentoNM_UN_MEDID_COMER: TStringField;
    cdsMercTratamentoVL_UNID_COND_VENDA: TStringField;
    cdsMercTratamentoTX_DESC_DET_MERC: TMemoField;
    cdsMercTratamentoCD_PRODUTO: TStringField;
    cdsMercTratamentoNR_ITEM_DRAWBACK: TStringField;
    cdsMercTratamentoQT_PROD_DRAWBACK: TStringField;
    cdsMercTratamentoVL_PROD_DRAWBACK: TStringField;
    qryRecuperaLINR_REGISTRO_LI: TStringField;
    qryRecuperaLINR_IDENT_TRANSMISSAO: TIntegerField;
    cdsRecuperaLINR_REGISTRO_LI: TStringField;
    cdsRecuperaLINR_IDENT_TRANSMISSAO: TIntegerField;
    qryPreencheLICD_MODALIDADE_SEM: TStringField;
    cdsPreencheLICD_MODALIDADE_SEM: TStringField;
    qryPreencheLIItensCD_UN_MED_COMERC: TStringField;
    cdsPreencheLIItensCD_UN_MED_COMERC: TStringField;
    qryPreencheLIItensIntegerField: TIntegerField;
    qryPreencheLIItensIntegerField2: TStringField;
    cdsPreencheLIItensENQ_MAT_USADO: TIntegerField;
    cdsPreencheLIItensOP_NACIONALIZACAO: TStringField;
    qryRecuperaLINR_PROCESSO: TStringField;
    cdsRecuperaLINR_PROCESSO: TStringField;
    qryRecuperaLICD_CLIENTE: TStringField;
    qryRecuperaLINM_EMPRESA: TStringField;
    cdsRecuperaLICD_CLIENTE: TStringField;
    cdsRecuperaLINM_EMPRESA: TStringField;
    FDConnection1: TFDConnection;
    FDQryDestaqueNCM: TFDQuery;
    FDQryOpeTratamento: TFDQuery;
    FDQryMercTratamento: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsDestaqueNCMAfterPost(DataSet: TDataSet);
    procedure dspDestaqueNCMGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspOpeTratamentoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspMercTratamentoGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
  private
    FTransaction: TDBXTransaction;
    FConfig: TIniFile;
  public
    // Consultas
    function VerificaConexao: Boolean;
    function ConsultaLookup(ATabela, ACampoRetorno: String; AValorSeNulo: Variant; ACamposFiltro: array of String; AValoresFiltro: array of Variant): Variant;
    function ConsultaSQL(ASQL: String; AValorSeNulo: Variant; AValoresFiltro: array of Variant): Variant;
    function ExecSQL(ASQL: String; AValoresFiltro: array of Variant): Integer;
    function AtualizaFollowup(AProcesso, AEvento: String; AData: TDateTime; AUsuario: String = '0707'): Boolean;
    function AbreConsulta(ASQL: String; AValoresFiltros: array of Variant): TSQLQuery;
    function AbreDataSet(ASQL: String; AValoresFiltros: array of Variant): TSQLClientDataSet;
    // Transação
    procedure BeginTransaction;
    procedure Commit;
    procedure Rollback;
    function InTransaction: Boolean;
    // Email
    function EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: array of String; AAssunto, ACorpo: String; AAnexos: array of String): Boolean;
    property Config: TIniFile read FConfig;
  end;

  procedure SetParametros(AQuery: TSQLQuery; AValores: array of Variant); overload;
  procedure SetParametros(ADataSet: TClientDataSet; AValores: array of Variant); overload;

var
  dtmMyParametrizacaoLI: TdtmMyParametrizacaoLI;

implementation

uses
  Funcoes;

{$R *.dfm}

procedure SetParametros(AQuery: TSQLQuery; AValores: array of Variant);
var
  I: Integer;
begin
  if High(AValores) <> (AQuery.Params.Count -1) then
    raise Exception.Create('Quantidade de parâmetros incorreta para a consulta.');
  for I := 0 to High(AValores) do
    case VarType(AValores[I]) of
      varEmpty,
      varNull: AQuery.Params[I].Clear;

      varDispatch,
      varError,
      varAny,
      varVariant,
      varUnknown,
      varTypeMask,
      varArray,
      varByRef: ;

      varSmallint,
      varInteger,
      varSingle,
      varShortInt,
      varByte,
      varWord,
      varLongWord,
      varInt64: AQuery.Params[I].AsInteger := AValores[I];

      varDouble,
      varCurrency: AQuery.Params[I].AsFloat := AValores[I];

      varDate: AQuery.Params[I].AsDateTime := AValores[I];

      varOleStr, varString, varUString: AQuery.Params[I].AsString := AValores[I];

      varBoolean: AQuery.Params[I].AsBoolean := AValores[I];
    end;
end;

procedure SetParametros(ADataSet: TClientDataSet; AValores: array of Variant);
var
  I: Integer;
begin
  if High(AValores) <> (ADataSet.Params.Count -1) then
    raise Exception.Create('Quantidade de parâmetros incorreta para a consulta.');
  for I := 0 to High(AValores) do
    case VarType(AValores[I]) of
      varEmpty,
      varNull: ADataSet.Params[I].Clear;

      varDispatch,
      varError,
      varAny,
      varVariant,
      varUnknown,
      varTypeMask,
      varArray,
      varByRef: ;

      varSmallint,
      varInteger,
      varSingle,
      varShortInt,
      varByte,
      varWord,
      varLongWord,
      varInt64: ADataSet.Params[I].AsInteger := AValores[I];

      varDouble,
      varCurrency: ADataSet.Params[I].AsFloat := AValores[I];

      varDate: ADataSet.Params[I].AsDateTime := AValores[I];

      varOleStr, varString, varUString: ADataSet.Params[I].AsString := AValores[I];

      varBoolean: ADataSet.Params[I].AsBoolean := AValores[I];
    end;
end;

{ TSQLClientDataSet }

constructor TSQLClientDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FetchOnDemand := False;
end;

function TSQLClientDataSet.GetSQL: TStrings;
var
  Provider: TComponent;
begin
  Result := nil;
  if (ProviderName <> '') then
  begin
    Provider := Owner.FindComponent(ProviderName);
    if Assigned(Provider) and (Provider is TDataSetProvider) and Assigned(TDataSetProvider(Provider).DataSet) and (TDataSetProvider(Provider).DataSet is TSQLQuery) then
      Result := TSQLQuery(TDataSetProvider(Provider).DataSet).SQL;
  end;
end;

procedure TSQLClientDataSet.Open(AParamValues: array of Variant);
begin
  FetchParams;
  SetParametros(Self, AParamValues);
  inherited Open;
end;

procedure TSQLClientDataSet.ReOpen;
begin
  if Active then
    Close;
  inherited Open;
end;

procedure TSQLClientDataSet.SetSQL(const Value: TStrings);
var
  Provider: TComponent;
begin
  if (ProviderName <> '') then
  begin
    Provider := Owner.FindComponent(ProviderName);
    if Assigned(Provider) and (Provider is TDataSetProvider) and Assigned(TDataSetProvider(Provider).DataSet) and (TDataSetProvider(Provider).DataSet is TSQLQuery) then
      TSQLQuery(TDataSetProvider(Provider).DataSet).SQL := Value;
  end;
end;

{ TdtmMyParametrizacao }

function TdtmMyParametrizacaoLI.AbreConsulta(ASQL: String; AValoresFiltros: array of Variant): TSQLQuery;
begin
  Result := TSQLQuery.Create(Self);
  Result.SQLConnection := Self.dbConnection;
  Result.SQL.Text := StringReplace(ASQL, '"', '''', [rfReplaceAll]);
  SetParametros(Result, AValoresFiltros);
  Result.Open;
end;

function TdtmMyParametrizacaoLI.AbreDataSet(ASQL: String; AValoresFiltros: array of Variant): TSQLClientDataSet;
begin
  if qryConsulta.Active then
    qryConsulta.Close;
  qryConsulta.SQL.Text := ASQL;

  Result := TSQLClientDataSet.Create(Self);
  Result.ProviderName := 'dspConsulta';
  Result.Open(AValoresFiltros);
  Result.First;
end;

function TdtmMyParametrizacaoLI.AtualizaFollowup(AProcesso, AEvento: String; AData: TDateTime; AUsuario: String = '0707'): Boolean;
begin
  ExecSQL('UPDATE TFOLLOWUP ' +
          ' SET CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO, ' +
          '     DT_REALIZACAO      = :DT_REALIZACAO ' +
          'WHERE NR_PROCESSO = :NR_PROCESSO ' +
          '  AND CD_EVENTO = :CD_EVENTO', [AUsuario, AData, AProcesso, AEvento]);
  Result := ConsultaSQL('SELECT COUNT(*) ' +
                        'FROM TFOLLOWUP ' +
                        'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                        '  AND CD_EVENTO = :CD_EVENTO ' +
                        '  AND DT_REALIZACAO IS NOT NULL', '0', [AProcesso, AEvento]) = '0';
end;

procedure TdtmMyParametrizacaoLI.BeginTransaction;
begin
  FTransaction := dbConnection.BeginTransaction;
end;

procedure TdtmMyParametrizacaoLI.cdsDestaqueNCMAfterPost(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).ApplyUpdates(-1);
end;

procedure TdtmMyParametrizacaoLI.Commit;
begin
  dbConnection.CommitFreeAndNil(FTransaction);
end;

function TdtmMyParametrizacaoLI.ConsultaLookup(ATabela, ACampoRetorno: String;  AValorSeNulo: Variant; ACamposFiltro: array of String;
  AValoresFiltro: array of Variant): Variant;
var
  SQL: String;
  I: Integer;
begin
  SQL := ' SELECT ' + ACampoRetorno +
         ' FROM ' + ATabela;
  if High(ACamposFiltro) >= 0 then
  begin
    SQL := SQL + ' WHERE ' + ACamposFiltro[0] + ' = :P0';
    for I := 1 to High(ACamposFiltro) do
      SQL := SQL + ' AND ' + ACamposFiltro[I] + ' = :P' + IntToStr(I);
  end;
  Result := ConsultaSQL(SQL, AValorSeNulo, AValoresFiltro);
end;

function TdtmMyParametrizacaoLI.ConsultaSQL(ASQL: String; AValorSeNulo: Variant; AValoresFiltro: array of Variant): Variant;
begin
  if qryConsulta.Active then
    qryConsulta.Close;
  qryConsulta.SQL.Text := ASQL;
  //cdsConsulta.FetchParams;
  SetParametros(qryConsulta, AValoresFiltro);
  qryConsulta.Open;
  if VarIsNull(qryConsulta.Fields[0].Value) or VarIsEmpty(qryConsulta.Fields[0].Value) then
    Result := AValorSeNulo
  else
    Result := qryConsulta.Fields[0].Value;
  qryConsulta.Close;
end;

procedure TdtmMyParametrizacaoLI.DataModuleCreate(Sender: TObject);
begin
  FConfig := TIniFile.Create(DataPath + 'Config.ini');
end;

procedure TdtmMyParametrizacaoLI.DataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(FConfig);
end;


procedure TdtmMyParametrizacaoLI.dspDestaqueNCMGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
  TableName:= 'DESTAQUE_NCM';
end;

procedure TdtmMyParametrizacaoLI.dspMercTratamentoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
  TableName:= 'DETALHE_MERC_COM_TRATAMENTO';
end;

procedure TdtmMyParametrizacaoLI.dspOpeTratamentoGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: string);
begin
  TableName:= 'OPERACAO_COM_TRATAMENTO';
end;

function TdtmMyParametrizacaoLI.EnviaEmail(ARemetente: String; APara, ACopia, ACopiaOculta: array of String; AAssunto, ACorpo: String; AAnexos: array of String): Boolean;
var
  NewText1 : TIdText;
  I: Integer;
begin
  Result := VerificaConexao;
  if Result then
  begin
    if qryMail.Active then
      qryMail.Close;
    qryMail.Open;

    IdSMTP1.Host     := qryMailNM_HOST.AsString;
    IdSMTP1.Port     := qryMailNR_PORTA.AsInteger;
    IdSMTP1.Username := qryMailNM_LOGIN.AsString;
    IdSMTP1.Password := qryMailNM_SENHA.AsString;

    IdMessage1.Clear;

    NewText1 := TIdText.Create(IdMessage1.MessageParts);

    try
      with NewText1 do
      begin
        ContentType:='text/html';
        CharSet := 'UTF-8';
        for I := 0 to High(AAnexos) do
          if FileExists(AAnexos[I]) then
            TIdAttachmentFile.Create(IdMessage1.MessageParts, AAnexos[I]);

        Body.Add('<html>');
        Body.Add('<body>');
        Body.Add(ACorpo);
        Body.Add('<br>');
        Body.Add('<br>');
        Body.Add('Email gerado automaticamente.<br>');
        Body.Add('Dúvidas: <a href="mailto:ti@myindaia.com.br">ti@myindaia.com.br</a>');
        Body.Add('</body>');
        Body.Add('</html>');
      end;

      with IdMessage1 do
      begin
        From.Text := ARemetente;

        // Eliminar Destitário inserido mais de uma vez
        for I := 0 to High(APara) do
          if (APara[I] <> '') and (AnsiIndexText(APara[I], APara) = I) then
            Recipients.Add.Text := APara[I];

        // Eliminar Cópia inserido mais de uma vez ou inserido em ADestinatarios
        for I := 0 to High(ACopia) do
          if (ACopia[I] <> '') and (AnsiIndexText(ACopia[I], ACopia) = I)
             and (AnsiIndexText(ACopia[I], APara) < 0) then
            CCList.Add.Text := ACopia[I];

        // Eliminar Cópia Oculta inserido mais de uma vez ou inserido em ADestinatarios ou inserido em ACopia
        for I := 0 to High(ACopiaOculta) do
          if (ACopiaOculta[I] <> '') and (AnsiIndexText(ACopiaOculta[I], ACopiaOculta) = I)
             and (AnsiIndexText(ACopiaOculta[I], APara) < 0) and (AnsiIndexText(ACopiaOculta[I], ACopia) < 0) then
            BccList.Add.Text := ACopiaOculta[I];

        Subject := Trim(AAssunto);
      end;
      with IdSMTP1 do
      begin
        Connect;
        try
          IdSMTP1.Send(IdMessage1);
          Result := True;
        except
        end;
      end;
    finally
      FreeAndNil(NewText1);
      IdSMTP1.Disconnect;
      IdMessage1.Clear;
    end;
  end;
end;

function TdtmMyParametrizacaoLI.ExecSQL(ASQL: String; AValoresFiltro: array of Variant): Integer;
begin
  if qryConsulta.Active then
    qryConsulta.Close;
  qryConsulta.SQL.Text := ASQL;
  SetParametros(qryConsulta, AValoresFiltro);
  Result := qryConsulta.ExecSQL;
end;

function TdtmMyParametrizacaoLI.InTransaction: Boolean;
begin
  Result := dbConnection.InTransaction;
end;

procedure TdtmMyParametrizacaoLI.Rollback;
begin
  dbConnection.RollbackFreeAndNil(FTransaction);
end;

function TdtmMyParametrizacaoLI.VerificaConexao: Boolean;
begin
  Result := dbConnection.Connected;
  if Result then
    try
      if qryConsulta.Active then
        qryConsulta.Close;
      qryConsulta.SQL.Text := 'SELECT 1';
      qryConsulta.Open;
    except
      Result := False;
      dbConnection.Close;
    end;
  if not dbConnection.Connected then
    try
      dbConnection.Open;
      Result := True;
    except
      Result := False;
    end;
end;

end.
