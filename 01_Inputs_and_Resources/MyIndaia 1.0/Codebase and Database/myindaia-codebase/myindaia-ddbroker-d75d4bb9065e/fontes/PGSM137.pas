unit PGSM137;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppProd,
  ppReport, ppEndUsr, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE;

type
  Tdatm_pesq_proc = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    ds_produto: TDataSource;
    qry_cliente_habilitacao_: TQuery;
    qry_empresa_nac_: TQuery;
    qry_servico_: TQuery;
    qry_pais_: TQuery;
    qry_embarc_: TQuery;
    qry_local_emb_: TQuery;
    qry_pesq_: TQuery;
    ds_pesq: TDataSource;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    qry_produto_CD_CT_GERENCIAL: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_pesq_NR_PROCESSO: TStringField;
    qry_pesq_CD_UNID_NEG: TStringField;
    qry_pesq_CD_PRODUTO: TStringField;
    qry_pesq_CD_CLIENTE: TStringField;
    qry_pesq_AP_EMPRESA: TStringField;
    qry_pesq_CD_SERVICO: TStringField;
    qry_pesq_NM_SERVICO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    ds_usuario_habilitacao_: TDataSource;
    qry_pesq_NM_UNID_NEG: TStringField;
    qry_pesq_NM_PRODUTO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_look_nm_unid_neg: TStringField;
    qry_usuario_habilitacao_look_nm_produto: TStringField;
    qry_pesq_calc_nr_processo: TStringField;
    qry_transp_rod_: TQuery;
    qry_amz_: TQuery;
    qry_agente_: TQuery;
    ds_tp_canal: TDataSource;
    qry_grupo_: TQuery;
    qry_evento_: TQuery;
    qry_empresa_est_: TQuery;
    qry_atz_rel_proc_mod1_: TQuery;
    qry_rel_proc_mod1_: TQuery;
    qry_viagem_: TQuery;
    qry_mercadoria_: TQuery;
    qry_mercadoria_exp_: TQuery;
    qry_transportador_: TQuery;
    qry_area_: TQuery;
    qry_cliente_habilitacao: TQuery;
    qry_unid_neg: TQuery;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_CD_UNID_NEG: TStringField;
    qry_cliente_habilitacao_CD_PRODUTO: TStringField;
    qry_cliente_servico_: TQuery;
    qry_cliente_contato_: TQuery;
    qry_cliente_habilitacaoCD_CLIENTE: TStringField;
    qry_cliente_habilitacaoCD_UNID_NEG: TStringField;
    qry_cliente_habilitacaoCD_PRODUTO: TStringField;
    qry_cliente_habilitacaoDT_VALID_CRED_RF: TDateTimeField;
    qry_cliente_habilitacaoDT_CAPTACAO: TDateTimeField;
    qry_cliente_habilitacaoIN_ATIVO: TStringField;
    qry_cliente_habilitacaoTX_NUMERARIO_OBS: TMemoField;
    qry_cliente_habilitacaoCD_TAB_SDA: TStringField;
    qry_cliente_habilitacaoCD_FOLLOW_UP: TStringField;
    qry_cliente_habilitacaoCD_NUMERARIO: TStringField;
    qry_cliente_habilitacaoCD_TP_FOLLOW_UP: TStringField;
    qry_cliente_habilitacaoIN_SD_FAT_ZERO: TStringField;
    qry_cliente_habilitacaoIN_SD_NOTA_ZERO: TStringField;
    qry_cliente_habilitacaoIN_COBRAR_CPMF: TStringField;
    qry_cliente_habilitacaoIN_COBRAR_ISS: TStringField;
    qry_cliente_habilitacaoCD_RESPONSAVEL: TStringField;
    qry_cliente_habilitacaoIN_BOLETO: TStringField;
    qry_cliente_habilitacaoNR_DIAS_VENCTO_FATURA: TIntegerField;
    qry_cliente_habilitacaoIN_COMP_SDA: TStringField;
    qry_cliente_habilitacaoCD_IR_FAT: TStringField;
    qry_cliente_habilitacaoIN_DIVERSOS: TStringField;
    qry_cliente_habilitacaoIN_QUADRO_TOTAL_FAT: TStringField;
    qry_cliente_habilitacaoIN_CC_NUM: TStringField;
    qry_cliente_habilitacaoIN_OBS_UNICA: TStringField;
    qry_cliente_habilitacaoIN_OBS_POR_DATA: TStringField;
    qry_cliente_habilitacaoIN_DIA_UTIL_EMISSAO_FAT: TStringField;
    qry_cliente_habilitacaoTP_PORTADOR: TStringField;
    qry_cliente_habilitacaoCD_BANCO_PORTADOR: TStringField;
    qry_cliente_habilitacaoIN_CPMF_SALDO_CREDOR: TStringField;
    qry_cliente_habilitacaoIN_CALCULA_IRRF_VL_MIN: TStringField;
    qry_cliente_habilitacaoTP_TAB_SDA: TStringField;
    qry_cliente_habilitacaoIN_CPMF_TOTAL: TStringField;
    qry_cliente_habilitacaoIN_NOTA_LIQ: TStringField;
    qry_cliente_habilitacaoIN_FAT_REC: TStringField;
    qry_cliente_habilitacaoIN_EXP_NF: TStringField;
    qry_cliente_habilitacaoNR_CONTRATO_SEGURO: TStringField;
    qry_cliente_habilitacaoNR_ALT_LINHA_FAT_EXP: TIntegerField;
    qry_cliente_habilitacaoNR_PROT_MERCANTE: TStringField;
    qry_cliente_habilitacaoVL_MIN_DI: TFloatField;
    qry_unid_negCD_UNID_NEG: TStringField;
    qry_unid_negNM_UNID_NEG: TStringField;
    qry_cliente_contato_CD_CLIENTE: TStringField;
    qry_cliente_contato_CD_UNID_NEG: TStringField;
    qry_cliente_contato_CD_PRODUTO: TStringField;
    qry_cliente_contato_CD_CONTATO: TStringField;
    qry_cliente_contato_NM_CONTATO: TStringField;
    qry_cliente_contato_TX_CARGO: TStringField;
    qry_cliente_contato_TX_DEPARTAMENTO: TStringField;
    qry_cliente_contato_NR_FONE: TStringField;
    qry_cliente_contato_NR_FAX: TStringField;
    qry_cliente_contato_IN_CONTAS: TBooleanField;
    qry_cliente_contato_IN_FATURAMENTO: TBooleanField;
    qry_cliente_contato_IN_NUMERARIO: TBooleanField;
    qry_cliente_contato_IN_OPERACIONAL: TBooleanField;
    qry_cliente_contato_CD_AREA: TStringField;
    qry_cliente_contato_NM_EMAIL: TStringField;
    qry_cliente_contato_TP_FOLLOWUP: TStringField;
    qry_cliente_contato_IN_DOC: TBooleanField;
    qry_cliente_contato_IN_XLS: TBooleanField;
    qry_cliente_contato_IN_HTML: TBooleanField;
    qry_cliente_contato_IN_FAX: TBooleanField;
    qry_cliente_contato_IN_COM_EXTERIOR: TBooleanField;
    qry_cliente_contato_IN_DRAWBACK: TBooleanField;
    qry_cliente_contato_IN_DEMURRAGE: TBooleanField;
    qry_tp_lead_time_: TQuery;
    qry_tp_lead_time_TP_LEAD_TIME: TStringField;
    qry_tp_lead_time_NM_TP_LEAD_TIME: TStringField;
    ds_tp_lead_time: TDataSource;
    ppBDERelLeadTime: TppBDEPipeline;
    ppDesigner: TppDesigner;
    ppSelUnidProdEmb: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppImage1: TppImage;
    ppTitulo: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLabel13: TppLabel;
    pplblProduto: TppLabel;
    pplblCliente: TppLabel;
    pplblUnidade: TppLabel;
    pplblArea: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    ppVarRodapeEsq: TppVariable;
    ppVarRodapeDir: TppVariable;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppPageStyle1: TppPageStyle;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel12: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    qry_tp_canal_: TQuery;
    qry_tp_canal_CD_CANAL: TStringField;
    qry_tp_canal_NM_CANAL: TStringField;
    qry_tp_referencia_: TQuery;
    qry_tp_referencia_CD_REFERENCIA: TStringField;
    qry_tp_referencia_NM_REFERENCIA: TStringField;
    ds_tp_referencia: TDataSource;
    ds_requerimento: TDataSource;
    qry_requerimento_: TQuery;
    qry_requerimento_NR_PROCESSO: TStringField;
    ds_tp_pessoa_exp: TDataSource;
    qry_tp_pessoa_exp_: TQuery;
    qry_tp_pessoa_exp_CODIGO: TStringField;
    qry_tp_pessoa_exp_DESCRICAO: TStringField;
    qry_pesq_IN_CANCELADO: TStringField;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_empresa_nac_IN_ATIVO: TStringField;
    procedure qry_pesq_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_proc: Tdatm_pesq_proc;

implementation

{$R *.DFM}

{ Tdatm_pesq_proc }

procedure Tdatm_pesq_proc.qry_pesq_CalcFields(DataSet: TDataSet);
begin
  if Not qry_pesq_NR_PROCESSO.IsNull then
  begin
    qry_pesq_calc_nr_processo.AsString := Copy( qry_pesq_NR_PROCESSO.AsString, 5, 14);
  end;
end;



























end.
