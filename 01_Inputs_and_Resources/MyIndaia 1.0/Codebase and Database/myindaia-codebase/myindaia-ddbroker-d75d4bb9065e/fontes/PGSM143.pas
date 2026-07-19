unit PGSM143;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_col_data = class(TDataModule)
    ds_coligada: TDataSource;
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    sp_contabiliza: TStoredProc;
    qry_contab_: TQuery;
    qry_contab_CD_COLIGADA: TStringField;
    qry_contab_NR_CONTAB: TStringField;
    qry_contab_DT_CONTAB: TDateTimeField;
    qry_contab_CD_USUARIO: TStringField;
    qry_contab_TP_CONTAB: TStringField;
    qry_contab_DT_MOVIMENTO: TDateTimeField;
    qry_contab_lanc_: TQuery;
    qry_contab_lanc_CD_COLIGADA: TStringField;
    qry_contab_lanc_NR_CONTAB: TStringField;
    qry_contab_lanc_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_CD_HISTORICO: TStringField;
    qry_contab_lanc_NM_HISTORICO: TStringField;
    qry_contab_lanc_CD_FILIAL: TStringField;
    qry_contab_lanc_CD_CUSTO: TStringField;
    ds_contab: TDataSource;
    ds_contab_lanc: TDataSource;
    ds_contab_gerencial: TDataSource;
    qry_contab_gerencial_: TQuery;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_contab_CD_UNID_NEG: TStringField;
    qry_contab_CD_PRODUTO: TStringField;
    sp_contabiliza_contmaster: TStoredProc;
    qry_contab_contmaster_: TQuery;
    qry_contab_lanc_contmaster_: TQuery;
    ds_contab_contmaster: TDataSource;
    ds_contab_lanc_contmaster: TDataSource;
    ds_contab_gerencial_contmaster: TDataSource;
    qry_contab_gerencial_contmaster_: TQuery;
    qry_contab_contmaster_NR_CONTAB: TStringField;
    qry_contab_contmaster_DT_CONTAB: TDateTimeField;
    qry_contab_contmaster_CD_USUARIO: TStringField;
    qry_contab_contmaster_TP_CONTAB: TStringField;
    qry_contab_contmaster_DT_MOVIMENTO: TDateTimeField;
    qry_contab_contmaster_CD_UNID_NEG: TStringField;
    qry_contab_contmaster_CD_PRODUTO: TStringField;
    qry_contab_contmaster_CD_CT_CTAAPAGAR: TStringField;
    qry_contab_contmaster_CD_CT_INSS: TStringField;
    qry_contab_lanc_contmaster_NR_CONTAB: TStringField;
    qry_contab_lanc_contmaster_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_contmaster_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_contmaster_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_contmaster_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_contmaster_CD_HISTORICO: TStringField;
    qry_contab_lanc_contmaster_NM_HISTORICO: TStringField;
    qry_contab_lanc_contmaster_CD_FILIAL: TStringField;
    qry_contab_lanc_contmaster_CD_CUSTO: TStringField;
    qry_contab_lanc_contmaster_NM_FORNECEDOR: TStringField;
    qry_contab_gerencial_contmaster_NR_CONTAB: TStringField;
    qry_contab_gerencial_contmaster_NR_LANCAMENTO: TStringField;
    qry_contab_gerencial_contmaster_CT_GERENCIAL: TStringField;
    qry_contab_gerencial_contmaster_VL_GERENCIAL: TFloatField;
    qry_contab_si_: TQuery;
    qry_contab_lanc_si_: TQuery;
    ds_contab_si: TDataSource;
    ds_contab_lanc_si: TDataSource;
    sp_contabiliza_si: TStoredProc;
    qry_contab_si_NR_CONTAB: TStringField;
    qry_contab_si_DT_CONTAB: TDateTimeField;
    qry_contab_si_CD_USUARIO: TStringField;
    qry_contab_si_TP_CONTAB: TStringField;
    qry_contab_si_CD_UNID_NEG: TStringField;
    qry_contab_si_CD_PRODUTO: TStringField;
    qry_contab_si_CD_CT_CTAAPAGAR: TStringField;
    qry_contab_si_CD_CT_INSS: TStringField;
    qry_contab_si_VL_DEBITO: TFloatField;
    qry_contab_si_VL_CREDITO: TFloatField;
    qry_limpa_si_: TQuery;
    qry_contab_lanc_si_NR_CONTAB: TStringField;
    qry_contab_lanc_si_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_si_DT_LANCAMENTO: TDateTimeField;
    qry_contab_lanc_si_NR_DOCTO: TStringField;
    qry_contab_lanc_si_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_si_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_si_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_si_CD_HISTORICO: TStringField;
    qry_contab_lanc_si_NM_HISTORICO: TStringField;
    qry_contab_lanc_si_CD_FILIAL: TStringField;
    qry_contab_lanc_si_CD_CUSTO: TStringField;
    qry_contab_lanc_si_NM_FORNECEDOR: TStringField;
    qry_contab_lanc_si_CD_SIMBOLOGIA: TStringField;
    qry_contab_rm_tito_: TQuery;
    qry_contab_lanc_rm_tito_: TQuery;
    ds_contab_rm_tito: TDataSource;
    ds_contab_lanc_rm_tito: TDataSource;
    ds_contab_ger_rm_tito: TDataSource;
    qry_contab_ger_rm_tito_: TQuery;
    qry_contab_rm_tito_CD_COLIGADA: TStringField;
    qry_contab_rm_tito_NR_CONTAB: TStringField;
    qry_contab_rm_tito_DT_CONTAB: TDateTimeField;
    qry_contab_rm_tito_CD_USUARIO: TStringField;
    qry_contab_rm_tito_TP_CONTAB: TStringField;
    qry_contab_rm_tito_DT_MOVIMENTO: TDateTimeField;
    qry_contab_rm_tito_CD_UNID_NEG: TStringField;
    qry_contab_rm_tito_CD_PRODUTO: TStringField;
    qry_contab_rm_tito_CD_CT_CTAAPAGAR: TStringField;
    qry_contab_rm_tito_CD_CT_INSS: TStringField;
    qry_contab_lanc_rm_tito_CD_COLIGADA: TStringField;
    qry_contab_lanc_rm_tito_NR_CONTAB: TStringField;
    qry_contab_lanc_rm_tito_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_rm_tito_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_rm_tito_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_rm_tito_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_rm_tito_CD_HISTORICO: TStringField;
    qry_contab_lanc_rm_tito_NM_HISTORICO: TStringField;
    qry_contab_lanc_rm_tito_CD_FILIAL: TStringField;
    qry_contab_lanc_rm_tito_CD_CUSTO: TStringField;
    qry_contab_lanc_rm_tito_DT_MOVIMENTO: TDateTimeField;
    qry_contab_ger_rm_tito_NR_CONTAB: TStringField;
    qry_contab_ger_rm_tito_NR_LANCAMENTO: TStringField;
    qry_contab_ger_rm_tito_CT_GERENCIAL: TStringField;
    qry_contab_ger_rm_tito_VL_GERENCIAL: TFloatField;
    sp_contabiliza_rm_tito: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_col_data: Tdatm_sel_col_data;

implementation

{$R *.DFM}












end.
