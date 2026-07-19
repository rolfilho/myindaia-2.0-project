unit PGFT022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_livro_iss = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    sp_rel_fat_livro_fiscal: TStoredProc;
    qry_fatura_: TQuery;
    ds_fatura_: TDataSource;
    qry_fatura_CONTRIBUINTE: TStringField;
    qry_fatura_NR_LAYOUT: TStringField;
    qry_fatura_DT_NF: TStringField;
    qry_fatura_NR_NF_INICIO: TStringField;
    qry_fatura_NR_SERIE_NF: TStringField;
    qry_fatura_NR_NF_FIM: TStringField;
    qry_fatura_SITUACAO: TStringField;
    qry_fatura_VL_TRIB: TFloatField;
    qry_fatura_VL_BASE_CALCULO: TFloatField;
    qry_fatura_ATIVIDADE: TStringField;
    qry_fatura_fESTABELECIDA_MUNICIPIO: TStringField;
    qry_fatura_CD_LOCAL_PRESTACAO: TStringField;
    qry_fatura_NM_EMPRESA: TStringField;
    qry_fatura_CGC_EMPRESA: TStringField;
    qry_fatura_CD_TIPO_CADASTRO: TStringField;
    qry_fatura_INSCR_MUNICIPAL: TStringField;
    qry_fatura_DIGITO_INSCR_MUNICIPAL: TStringField;
    qry_fatura_INSCR_ESTADUAL: TStringField;
    qry_fatura_TP_LOGRAD: TStringField;
    qry_fatura_TITULO_LOGRAD: TStringField;
    qry_fatura_END_EMPRESA: TStringField;
    qry_fatura_END_COMPL: TStringField;
    qry_fatura_END_NUMERO: TStringField;
    qry_fatura_END_CEP: TStringField;
    qry_fatura_END_BAIRRO: TStringField;
    qry_fatura_END_UF: TStringField;
    qry_fatura_END_CIDADE: TStringField;
    qry_fatura_CD_PAIS: TStringField;
    qry_fatura_NM_OBSERVACAO: TStringField;
    qry_fatura_CD_PLANO_CONTA: TStringField;
    qry_fatura_CD_ALVARA: TStringField;
    qry_fatura_IC_ORIGEM_DADOS: TStringField;
    qry_fatura_IC_ENQUADRAMENTO: TStringField;
    qry_fatura_CD_PLANO_CONTA_PAI: TStringField;
    qry_fatura_IC_RECOLHE_IMPOSTO: TStringField;
    qry_fatura_VL_ALIQUOTA: TStringField;
    qry_fatura_fISENTO_INSCR_ESTADUAL: TStringField;
    qry_fatura_FL_SIMPLES: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_livro_iss: Tdatm_livro_iss;

implementation

{$R *.DFM}






end.
