unit PGFI012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_unid_prod_fin = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    sp_rel_fin: TStoredProc;
    qry_ult_relat_grupo_: TQuery;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_cliente_END_CIDADE: TStringField;
    qry_juros_: TQuery;
    qry_tot_tab_juros_cli_: TQuery;
    qry_tab_juros_cli_: TQuery;
    qry_tab_juros_grupo_: TQuery;
    qry_ult_relat_cli_: TQuery;
    sp_fin_gera_tab_juros: TStoredProc;
    ds_juros: TDataSource;
    qry_juros_CD_MOEDA_JUROS: TStringField;
    qry_juros_DT_JUROS: TDateTimeField;
    qry_juros_VL_INDICE: TFloatField;
    qry_juros_VL_JUROS: TFloatField;
    qry_juros_VL_ACUMULADO: TFloatField;
    qry_rel_fin_: TQuery;
    qry_rel_fin_CD_REFERENCIA: TStringField;
    qry_rel_fin_NM_EMBARCACAO: TStringField;
    qry_rel_fin_NR_FATURA: TStringField;
    qry_rel_fin_NR_PROCESSO: TStringField;
    qry_rel_fin_NM_ITEM: TStringField;
    qry_rel_fin_VL_ITEM: TFloatField;
    qry_rel_fin_VL_CPMF: TFloatField;
    qry_rel_fin_DT_PAGTO: TDateTimeField;
    qry_rel_fin_NR_DIAS: TIntegerField;
    qry_rel_fin_VL_REEMBOLSO: TFloatField;
    qry_tot_desp_: TQuery;
    qry_rel_fin_desp_: TQuery;
    qry_rel_fin_resumo_: TQuery;
    qry_rel_fin_totais_: TQuery;
    qry_tot_resumo_: TQuery;
    qry_rel_fin_juros_: TQuery;
    qry_tot_juros_: TQuery;
    sp_rel_dem_cliente: TStoredProc;
    qry_rel_dem_cliente_: TQuery;
    qry_rel_dem_cliente_exp_: TQuery;
    qry_rel_dem_cliente_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_dem_cliente_NR_PROCESSO: TStringField;
    qry_rel_dem_cliente_VL_REMESSA: TFloatField;
    qry_rel_dem_cliente_DT_REMESSA: TDateTimeField;
    qry_rel_dem_cliente_CD_REFERENCIA: TStringField;
    qry_rel_dem_cliente_VL_DESPESA: TFloatField;
    qry_rel_dem_cliente_exp_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_dem_cliente_exp_NR_PROCESSO: TStringField;
    qry_rel_dem_cliente_exp_VL_REMESSA: TFloatField;
    qry_rel_dem_cliente_exp_DT_REMESSA: TDateTimeField;
    qry_rel_dem_cliente_exp_CD_REFERENCIA: TStringField;
    qry_rel_dem_cliente_exp_VL_DESPESA: TFloatField;
    sp_rel_rec_liq: TStoredProc;
    qry_rel_rec_liq_: TQuery;
    qry_rel_rec_liq_NM_GRUPO: TStringField;
    qry_rel_rec_liq_NM_CLIENTE: TStringField;
    qry_rel_rec_liq_NR_PROCESSO: TStringField;
    qry_rel_rec_liq_VL_RECEITA: TFloatField;
    qry_rel_rec_liq_VL_SALDO: TFloatField;
    qry_rel_rec_liq_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_rec_liq_CD_GRUPO: TStringField;
    qry_rel_rec_liq_CD_CLIENTE: TStringField;
    sp_rel_fluxo_op: TStoredProc;
    qry_rel_recebiveis_: TQuery;
    qry_rel_recebiveis_NR_PROCESSO: TStringField;
    qry_rel_recebiveis_NR_NOTA: TStringField;
    qry_rel_recebiveis_CD_REFERENCIA: TStringField;
    qry_rel_recebiveis_ADTO_NUM: TFloatField;
    qry_rel_recebiveis_RECEITAS: TFloatField;
    qry_rel_recebiveis_DESPESAS: TFloatField;
    qry_rel_recebiveis_IMPOSTOS: TFloatField;
    qry_rel_recebiveis_DT_FATURA: TStringField;
    qry_rel_recebiveis_DT_ADTO_NUM: TStringField;
    qry_rel_recebiveis_NM_EMPRESA: TStringField;
    qry_rel_recebiveis_DT_VENCTO_FATURA: TStringField;
    qry_rel_recebiveis_DT_LIQUIDACAO: TStringField;
    qry_rel_recebiveis_VL_LIQUIDACAO: TFloatField;
    qry_rel_fin_desp_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_fin_desp_CD_UNID_NEG: TStringField;
    qry_rel_fin_desp_CD_PRODUTO: TStringField;
    qry_rel_fin_desp_NR_SOLICITACAO: TStringField;
    qry_rel_fin_desp_NR_PROCESSO: TStringField;
    qry_rel_fin_desp_CD_ITEM: TStringField;
    qry_rel_fin_desp_NM_ITEM: TStringField;
    qry_rel_fin_desp_CD_REFERENCIA: TStringField;
    qry_rel_fin_desp_NM_EMBARCACAO: TStringField;
    qry_rel_fin_desp_VL_ITEM: TFloatField;
    qry_rel_fin_desp_VL_CPMF: TFloatField;
    qry_rel_fin_desp_VL_REEMBOLSO: TFloatField;
    qry_rel_fin_desp_DT_FATURA: TDateTimeField;
    qry_rel_fin_desp_DT_PAGTO: TDateTimeField;
    qry_rel_fin_desp_NR_DIAS: TIntegerField;
    qry_rel_fin_desp_NR_FATURA: TStringField;
    qry_rel_fin_desp_NM_AREA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_prod_fin: Tdatm_sel_unid_prod_fin;

implementation

{$R *.DFM}

 //ANDRÉ 21/07/2010

end.
