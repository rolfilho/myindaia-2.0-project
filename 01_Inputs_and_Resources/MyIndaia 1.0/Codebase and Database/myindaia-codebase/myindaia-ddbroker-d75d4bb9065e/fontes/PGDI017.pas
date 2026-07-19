(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGDI017.PAS - datm_di - Data Module - Declaração de Importação
AUTOR: Leandro Stipanich
DATA: 09/10/2001
Manutenção:
Data:
*************************************************************************************************)
unit PGDI017;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ServicoNovo,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tdatm_DI = class(TDataModule)
    qry_empresa_: TQuery;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_CD_IMPORTADOR: TStringField;
    qry_tp_decl_: TQuery;
    qry_tp_decl_Codigo: TStringField;
    qry_tp_decl_Descricao: TStringField;
    qry_di_CD_TIPO_DECLARACAO: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_AP_UNID_NEG: TStringField;
    qry_unidade_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    ds_taxa_cambio: TDataSource;
    tbl_taxa_cambio_: TTable;
    tbl_taxa_cambio_Codigo: TStringField;
    tbl_taxa_cambio_Descricao: TStringField;
    tbl_taxa_cambio_Taxa_Conversao: TStringField;
    tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField;
    tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField;
    qry_di_TX_DOLAR: TFloatField;
    qry_di_QT_ADICOES: TIntegerField;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    sp_di_calculo: TStoredProc;
    qry_via_transp_: TQuery;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_LookViaTranspSiscomex: TStringField;
    qry_di_CD_VIA_TRANSP_CARG: TStringField;
    qry_via_transp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_NM_VIA_TRANSP: TStringField;
    qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField;
    qry_via_transp_IN_ATIVO: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_di_NR_DCTO_CARGA: TStringField;
    qry_di_NR_DCTO_CARGA_MAST: TStringField;
    qry_di_CD_TIPO_DCTO_CARGA: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_ev_dt_: TQuery;
    qry_ev_dt_DT_EMBARQUE: TDateTimeField;
    qry_ev_dt_DT_CHEGADA: TDateTimeField;
    qry_di_DT_CHEGADA_CARGA: TStringField;
    qry_di_DT_EMBARQUE: TStringField;
    qry_di_CD_PAIS_PROC_CARGA: TStringField;
    qry_processo_CD_PAIS_ORIGEM: TStringField;
    qry_processo_NM_EMBARCACAO: TStringField;
    qry_di_NM_VEICULO_TRANSP: TStringField;
    qry_processo_CD_TIPO_PESSOA: TStringField;
    qry_di_CD_TIPO_IMPORTADOR: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_di_CD_LOCAL_EMBARQUE: TStringField;
    qry_processo_CD_LOCAL_EMBARQUE: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_di_CD_MOEDA_FRETE: TStringField;
    qry_di_VL_TOT_FRT_COLLECT: TFloatField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_processo_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_di_CD_URF_DESPACHO: TStringField;
    qry_di_CD_URF_ENTR_CARGA: TStringField;
    qry_di_CD_RECINTO_ALFAND: TStringField;
    qry_di_CD_SETOR_ARMAZENAM: TStringField;
    qry_processo_CD_ARMAZEM_DESCARGA: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_di_NR_AGENTE_CARGA: TStringField;
    qry_agente_: TQuery;
    qry_agente_CD_AGENTE: TStringField;
    qry_agente_NR_CGC_AGENTE: TStringField;
    qry_processo_LookAgente: TStringField;
    qry_di_CD_PRESENCA_CARGA: TStringField;
    qry_processo_NR_MANIFESTO: TStringField;
    qry_di_CD_TIPO_MANIFESTO: TStringField;
    qry_di_NR_MANIFESTO: TStringField;
    sp_di_ret_embalagem: TStoredProc;
    qry_processo_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_di_VL_TOT_FRT_PREPAID: TFloatField;
    sp_di_gera_adm_temp: TStoredProc;
    sp_po_exclui: TStoredProc;
    qry_di_NR_VEICULO_TRANSP: TStringField;
    qry_processo_NR_PLACA_VEICULO: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_di_CD_VEICULO_TRANSP: TStringField;
    qry_processo_CD_URF_ENTRADA: TStringField;
    qry_processo_CD_EMBARCACAO: TStringField;
    qry_di_CD_BANDEIRA_TRANSP: TStringField;
    qry_di_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_processo_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_di_CD_TRANSPORTADOR: TStringField;
    qry_processo_CD_TRANSPORTADOR: TStringField;
    qry_processo_CD_PAIS: TStringField;
    sp_da_gera_di: TStoredProc;
    qry_di_CD_MOEDA_MLE: TStringField;
    qry_processo_CD_MOEDA_MLE: TStringField;
    qry_di_IN_MOEDA_UNICA: TBooleanField;
    sp_nac_gera_di: TStoredProc;
    qry_di_CD_INCOTERM: TStringField;
    qry_processo_ID_CODIGO_INSTR_DESEMB: TStringField;
    sp_di_classifica_item: TStoredProc;
    sp_di_classifica_itemNR_ADICAO: TStringField;
    sp_di_classifica_itemNR_ITEM: TStringField;
    qry_processo_CD_TERMO_PAGTO: TStringField;
    qry_di_HR_DI: TStringField;
    qry_di_HR_CALCULO: TStringField;
    qry_di_IN_REPASSA_DADOS_CAMBIO: TBooleanField;
    qryHistCalc: TQuery;
    dsHistcalc: TDataSource;
    qryHistCalcNR_PROCESSO: TStringField;
    qryHistCalcDT_OPERACAO: TDateTimeField;
    qryHistCalcCD_USUARIO: TStringField;
    qryHistCalcID_USUARIO: TIntegerField;
    qryHistCalcVL_TOTAL_AD: TFloatField;
    qryHistCalcDT_CALCULO: TDateTimeField;
    qryHistCalcTX_DOLAR: TFloatField;
    qryHistCalcVL_CIF_MN: TFloatField;
    qryHistCalcCD_MOEDA_MLE: TStringField;
    qryHistCalcTX_MLE: TFloatField;
    qryHistCalcVL_MLE_MN: TFloatField;
    qryHistCalcVL_MLE_MNEG: TFloatField;
    qryHistCalcVL_II: TFloatField;
    qryHistCalcVL_IPI: TFloatField;
    qryHistCalcVL_PIS: TFloatField;
    qryHistCalcVL_COFINS: TFloatField;
    qryHistCalcVL_ICMS: TFloatField;
    qryHistCalcVL_FUNDO_POBREZA: TFloatField;
    qryHistCalcVL_SDA: TFloatField;
    qryHistCalcVL_DESPS_MN: TFloatField;
    qryHistCalcVL_ACRESCIMOS_MN: TFloatField;
    qryHistCalcVL_DEDUCOES_MN: TFloatField;
    qryHistCalcVL_DESPS_MNEG: TFloatField;
    qryHistCalcCD_MOEDA_SEGURO: TStringField;
    qryHistCalcTX_SEGURO: TFloatField;
    qryHistCalcVL_SEG_MN: TFloatField;
    qryHistCalcVL_SEGURO_MNEG: TFloatField;
    qryHistCalcCD_MOEDA_FRETE: TStringField;
    qryHistCalcTX_FRETE: TFloatField;
    qryHistCalcVL_FRETE_MN: TFloatField;
    qryHistCalcVL_FRETE_MNEG: TFloatField;
    qryHistCalcCD_SERVICO: TStringField;
    qryHistCalcCD_RECINTO_ALFAND: TStringField;
    qryHistCalcCD_SETOR_ARMAZENAM: TStringField;
    qryHistCalcCD_URF_ENTR_CARGA: TStringField;
    qryHistCalcCD_APLICACAO: TStringField;
    qryHistCalcCD_AREA: TStringField;
    qryHistCalcCD_TRANSP_NAC: TStringField;
    qryHistCalcCD_EMBARCACAO: TStringField;
    qryHistCalcDT_CHEG_NAVIO: TDateTimeField;
    qryHistCalcNM_USUARIO: TStringField;
    qryHistCalcNM_SERVICO: TStringField;
    qryHistCalcNM_RECINTO: TStringField;
    qryHistCalcNM_APLICACAO: TStringField;
    qryHistCalcNM_AREA: TStringField;
    qryHistCalcNM_EMBARCACAO: TStringField;
    qryHistCalcNM_OPCAO: TStringField;
    qryHistCalcNR_PROCESSO_BASICO: TStringField;
    qryHistCalcNM_TRANSP_ROD: TStringField;
    qryHistCalcVL_TRIBUTO_PAGO: TFloatField;
    qryHistCalcNM_OPERACAO: TStringField;
    qryHistCalcDT_REALIZACAO: TDateTimeField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_processo_VL_PESO_LIQUIDO: TFloatField;
    qry_processo_VL_MLE_MNEG: TFloatField;
    qry_processo_TP_FRETE: TStringField;
    qry_di_PB_CARGA: TFloatField;
    qry_di_PL_CARGA: TFloatField;
    qry_processo_PC_SEGURO_MLE_DI: TFloatField;
    qry_processo_CD_TIPO_BASE_SEGURO_DI: TStringField;
    qry_di_CD_TIPO_BASE_SEGURO: TStringField;
    qry_di_PC_SEGURO_MLE: TFloatField;
    qry_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_CD_MOEDA_SEGURO: TStringField;
    qry_di_IN_EMBUT_FRT_ITENS: TBooleanField;
    qryInsereDoctos: TQuery;
    qryInsereDeducao: TQuery;
    qryInsereEmbalagem: TQuery;
    qry_processo_CD_GRUPO: TStringField;
    qryRefCliente: TQuery;
    qry_di_CD_VINC_IMPO_EXPO: TStringField;
    qry_empresa_CGC_EMPRESA: TStringField;
    procedure qry_di_AfterOpen(DataSet: TDataSet);
    procedure qry_processo_AfterClose(DataSet: TDataSet);
    procedure qry_di_AfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_DI: Tdatm_DI;

implementation

uses PGDI003, PGGP017, ConsOnlineEx;

{$R *.DFM}

procedure Tdatm_DI.qry_di_AfterOpen(DataSet: TDataSet);
var
  in_Admissao: Boolean;
begin
  frm_DI.btn_trans_DI.Enabled := (Trim(qry_di_NR_DECLARACAO_IMP.AsString) = '') or (str_cd_cargo = '001');
  in_Admissao := ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                   ' FROM TADICAO_DE_IMPORTACAO (NOLOCK) ' +
                                   ' WHERE NR_PROCESSO = ' + QuotedStr(qry_di_NR_PROCESSO.AsString) +
                                   '   AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                   '   AND CD_FUND_LEG_REGIME = ''37''', 'QTD') <> '0';
  frm_DI.btn_Retificar.Visible := (Trim(qry_di_NR_DECLARACAO_IMP.AsString) <> '') and in_Admissao;
  if frm_DI.btn_Retificar.Visible then
    frm_DI.btn_Retificar.Enabled := ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                                      ' FROM TFOLLOWUP (NOLOCK) ' +
                                                      ' WHERE NR_PROCESSO = ' + QuotedStr(qry_di_NR_PROCESSO.AsString) +
                                                      '   AND CD_EVENTO = ''088'' ' +
                                                      '   AND DT_REALIZACAO IS NOT NULL', 'QTD') = '0';
  if qryHistCalc.Active then
    qryHistCalc.Close;
  qryHistCalc.ParamByName('NR_PROCESSO').AsString := qry_di_NR_PROCESSO.AsString;
  qryHistCalc.Open;
end;

procedure Tdatm_DI.qry_processo_AfterClose(DataSet: TDataSet);
begin
  frm_DI.btn_trans_DI.Enabled := False;
end;

procedure Tdatm_DI.qry_di_AfterClose(DataSet: TDataSet);
begin
  if qryHistCalc.Active then
    qryHistCalc.Close;
end;

end.
