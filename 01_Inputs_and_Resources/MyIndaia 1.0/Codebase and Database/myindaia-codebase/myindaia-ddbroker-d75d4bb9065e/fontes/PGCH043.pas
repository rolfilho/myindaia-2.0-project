unit PGCH043;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_rel_desp_pag = class(TDataModule)
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
    qry_param_: TQuery;
    qry_param_CD_ITEM_COMISSAO: TStringField;
    qry_param_CD_ITEM_EXPED: TStringField;
    qry_flp_plan_: TQuery;
    qry_flp_plan_NR_PROCESSO: TStringField;
    qry_flp_plan_CD_UNID_NEG: TStringField;
    qry_flp_plan_CD_PRODUTO: TStringField;
    qry_flp_plan_CD_CLIENTE: TStringField;
    qry_flp_plan_DT_ABERTURA: TDateTimeField;
    qry_flp_plan_TX_MERCADORIA: TMemoField;
    qry_flp_plan_TX_OBSERVACOES: TMemoField;
    qry_flp_plan_NR_VOO: TStringField;
    qry_flp_plan_CD_EMPRESA: TStringField;
    qry_flp_plan_NM_EMPRESA: TStringField;
    qry_flp_plan_NM_EMBARCACAO: TStringField;
    qry_flp_plan_DT_PREV_DESEMB: TDateTimeField;
    qry_flp_plan_DT_PREV_CHEGADA: TDateTimeField;
    qry_flp_plan_DT_ETD: TDateTimeField;
    qry_flp_plan_DT_DESEMB: TDateTimeField;
    qry_flp_plan_DT_CHEGADA: TDateTimeField;
    qry_flp_plan_DT_REG_DI: TDateTimeField;
    qry_ref_cli_: TQuery;
    ds_flp_plan: TDataSource;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_exp_: TQuery;
    qry_exp_NM_FORN_ESTR: TStringField;
    qry_embalagem_: TQuery;
    qry_embalagem_NR_PROCESSO: TStringField;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_embalagem_PB_EMBALAGEM: TFloatField;
    qry_embalagem_QT_EMBALAGEM: TIntegerField;
    qry_li_: TQuery;
    qry_li_TOT_LI: TIntegerField;
    qry_ord_ref_cli_: TQuery;
    qry_ord_ref_cli_NR_PROCESSO: TStringField;
    qry_ord_ref_cli_MENOR: TStringField;
    ds_ord_ref_cli_: TDataSource;
    qry_flp_plan_NR_CONHECIMENTO: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_embalagem_NM_EMBALAGEM_P: TStringField;
    sp_tot_serv_cli_periodo: TStoredProc;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    sp_rel_desp_pagto: TStoredProc;
    sp_rel_nao_desemb_di: TStoredProc;
    qry_apaga_dados_: TQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    sp_andamento_: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_rel_desp_pag: Tdatm_rel_desp_pag;

implementation

{$R *.DFM}








end.
