(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGA016.PAS - datm_imp_eventos_nao_realizados

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 08/01/2002

*************************************************************************************************)
unit PGGA016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_imp_eventos_nao_realizados = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    sp_atz_ref_cliente: TStoredProc;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    sp_atz_ev_nao_real: TStoredProc;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_eventos_nao_realizados: Tdatm_imp_eventos_nao_realizados;

implementation

{$R *.DFM}







end.
