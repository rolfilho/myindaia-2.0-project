unit PGRE007;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_rel_ev_critico = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_area_: TQuery;
    qry_area_NM_AREA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_produto_: TQuery;
    qry_evento_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_evento_IN_ATIVO: TStringField;
    qry_area_CD_AREA: TStringField;
    qry_ev_realiz_fora_meta_:      TQuery;
    qry_ev_nao_realiz_fora_meta_: TQuery;
    qry_ev_realizado_: TQuery;
    sp_rel_ev_critico: TStoredProc;
    qry_ev_realiz_fora_meta_NR_PROCESSO: TStringField;
    qry_ev_realiz_fora_meta_NR_DIAS: TIntegerField;
    qry_ev_realiz_fora_meta_DT_INICIO: TDateTimeField;
    qry_ev_realiz_fora_meta_DT_FIM: TDateTimeField;
    qry_ev_nao_realiz_fora_meta_NR_PROCESSO: TStringField;
    qry_ev_nao_realiz_fora_meta_NR_DIAS: TIntegerField;
    qry_ev_nao_realiz_fora_meta_DT_INICIO: TDateTimeField;
    qry_ev_nao_realiz_fora_meta_DT_FIM: TDateTimeField;
    qry_ev_basico_: TQuery;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_ev_realizado_NR_PROCESSO: TStringField;
    qry_ev_realizado_NR_DIAS: TIntegerField;
    qry_ev_realizado_DT_INICIO: TDateTimeField;
    qry_ev_realizado_DT_FIM: TDateTimeField;
    qry_ev_nao_realiz_ainda_na_meta_: TQuery;
    qry_ev_nao_realiz_ainda_na_meta_NR_PROCESSO: TStringField;
    qry_ev_nao_realiz_ainda_na_meta_NR_DIAS: TIntegerField;
    qry_ev_nao_realiz_ainda_na_meta_DT_INICIO: TDateTimeField;
    qry_ev_nao_realiz_ainda_na_meta_DT_FIM: TDateTimeField;
    qry_group_prazos_: TQuery;
    qry_group_prazos_NR_PRAZO: TFloatField;
    sp_rel_ev_critico_po: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_rel_ev_critico: Tdatm_rel_ev_critico;

implementation

{$R *.DFM}

uses GSMLIB, PGGP001, PGGP017, PGRE006;




end.
