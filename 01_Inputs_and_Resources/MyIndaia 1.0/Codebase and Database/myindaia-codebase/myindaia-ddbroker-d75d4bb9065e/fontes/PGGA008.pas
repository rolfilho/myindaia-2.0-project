unit PGGA008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RAWPrinter;

type
  Tdatm_imp_darf = class(TDataModule)
    qry_banco_: TQuery;
    qry_favorecido_: TQuery;
    qry_solic_ch_: TQuery;
    qry_solic_ch_NR_SOLIC_CH: TStringField;
    qry_solic_ch_CD_FAVORECIDO: TStringField;
    qry_solic_ch_CD_BANCO: TStringField;
    qry_solic_ch_VL_SOLIC_CH: TFloatField;
    qry_solic_ch_IN_EMITIR: TStringField;
    qry_solic_ch_LookFavorecido: TStringField;
    qry_solic_ch_LookBanco: TStringField;
    qry_solic_ch_LookStatus: TStringField;
    qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField;
    qry_solic_ch_CD_STATUS_CHEQUE: TStringField;
    qry_solic_ch_NR_CHEQUE: TStringField;
    tbl_parametro_: TTable;
    tbl_parametro_DT_SOLIC_CH: TDateTimeField;
    tbl_parametro_NR_SOLIC_CH: TIntegerField;
    tbl_parametro_HM_PARA_SOLIC_CH: TStringField;
    tbl_parametro_PATH_RELATORIOS: TStringField;
    tbl_parametro_PATH_SISCOMEX: TStringField;
    tbl_parametro_PATH_RISC: TStringField;
    tbl_parametro_CD_INSTALACAO: TStringField;
    tbl_parametro_NM_SERVIDOR: TStringField;
    tbl_parametro_NM_CID_CHEQUE: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    tbl_parametro_CD_BANCO_CHEQUE: TStringField;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CMES: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_ANOMASK: TStringField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    qry_banco_AP_BANCO: TStringField;
    qry_grupo_: TQuery;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_cliente_END_CIDADE: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_VL_CIF_MN: TFloatField;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_CNPJ_GRUPO: TStringField;
    qry_processo_CD_REFERENCIA: TStringField;
    qry_processo_CD_URF_DESPACHO: TStringField;
    qry_processo_CD_DIGITO: TStringField;
    qry_unid_neg_NR_FONE: TStringField;
    qry_cliente_CGC_EMPRESA: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    rp_darf: TRAWPrinter;
    qry_ajuste_impressao_: TQuery;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_L_PERIODO: TStringField;
    qry_ajuste_impressao_C_PERIODO: TStringField;
    qry_ajuste_impressao_L_CPF_CNPJ: TStringField;
    qry_ajuste_impressao_C_CPF_CNPJ: TStringField;
    qry_ajuste_impressao_L_N_REF: TStringField;
    qry_ajuste_impressao_C_N_REF: TStringField;
    qry_ajuste_impressao_C_CD_RECEITA: TStringField;
    qry_ajuste_impressao_L_NR_REF: TStringField;
    qry_ajuste_impressao_C_NR_REF: TStringField;
    qry_ajuste_impressao_L_S_REF: TStringField;
    qry_ajuste_impressao_C_S_REF: TStringField;
    qry_ajuste_impressao_L_IMPORTADOR: TStringField;
    qry_ajuste_impressao_C_IMPORTADOR: TStringField;
    qry_ajuste_impressao_L_TEL_UNIDADE: TStringField;
    qry_ajuste_impressao_C_TEL_UNIDADE: TStringField;
    qry_ajuste_impressao_L_MASTER: TStringField;
    qry_ajuste_impressao_C_MASTER: TStringField;
    qry_ajuste_impressao_C_FILHOTE: TStringField;
    qry_ajuste_impressao_C_VL_PRINC: TStringField;
    qry_ajuste_impressao_L_LINHA_MOTIVO1: TStringField;
    qry_ajuste_impressao_C_LINHA_MOTIVO1: TStringField;
    qry_ajuste_impressao_L_LINHA_MOTIVO2: TStringField;
    qry_ajuste_impressao_C_LINHA_MOTIVO2: TStringField;
    qry_ajuste_impressao_L_VL_JUROS: TStringField;
    qry_ajuste_impressao_C_VL_JUROS: TStringField;
    qry_ajuste_impressao_L_VL_TOTAL: TStringField;
    qry_ajuste_impressao_C_VL_TOTAL: TStringField;
    qry_ajuste_impressao_C_VL_MULTA: TStringField;
    qry_ajuste_impressao_L_DT_VENCTO: TStringField;
    qry_ajuste_impressao_C_DT_VENCTO: TStringField;
    qry_processo_NR_DCTO_CARGA: TStringField;
    qry_processo_NR_DCTO_CARGA_MAST: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_darf: Tdatm_imp_darf;

implementation

{$R *.DFM}








end.
