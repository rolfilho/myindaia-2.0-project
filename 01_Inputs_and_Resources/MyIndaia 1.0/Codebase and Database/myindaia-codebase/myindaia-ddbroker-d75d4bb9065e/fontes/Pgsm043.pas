unit PGSM043;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DBTables;

type
  Tdatm_recontab_ctaapagar = class(TDataModule)
    qry_contab_: TQuery;
    qry_contab_CD_COLIGADA: TStringField;
    qry_contab_NR_CONTAB: TStringField;
    qry_contab_DT_CONTAB: TDateTimeField;
    qry_contab_CD_USUARIO: TStringField;
    qry_contab_TP_CONTAB: TStringField;
    qry_contab_lanc_: TQuery;
    ds_contab: TDataSource;
    ds_contab_lanc: TDataSource;
    ds_contab_gerencial: TDataSource;
    qry_contab_gerencial_: TQuery;
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
    qry_contab_DT_MOVIMENTO: TDateTimeField;
    qry_contab_CD_UNID_NEG: TStringField;
    qry_contab_CD_PRODUTO: TStringField;
    qry_contab_gerencial_CD_COLIGADA: TStringField;
    qry_contab_gerencial_NR_CONTAB: TStringField;
    qry_contab_gerencial_NR_LANCAMENTO: TStringField;
    qry_contab_gerencial_CT_GERENCIAL: TStringField;
    qry_contab_gerencial_VL_GERENCIAL: TFloatField;
    ds_coligada: TDataSource;
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_coligada_IN_FATURAMENTO: TStringField;
  private
  public
  end;

var
  datm_recontab_ctaapagar: Tdatm_recontab_ctaapagar;

implementation

{$R *.DFM}

uses GSMLIB, PGGP011, PGGP001;

end.
