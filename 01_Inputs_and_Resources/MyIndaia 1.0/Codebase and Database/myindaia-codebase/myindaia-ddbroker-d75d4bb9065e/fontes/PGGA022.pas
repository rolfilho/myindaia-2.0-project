unit PGGA022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_bloqueio_evento = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    ds_processo: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_tfollowup_: TQuery;
    qry_tfollowup_NR_PROCESSO: TStringField;
    qry_tfollowup_CD_SERVICO: TStringField;
    qry_tfollowup_CD_EVENTO: TStringField;
    ds_tfollowup: TDataSource;
    qry_tevento_: TQuery;
    qry_tevento_CD_EVENTO: TStringField;
    qry_tevento_NM_EVENTO: TStringField;
    qry_tfollowup_Look_Evento: TStringField;
    sp_atz_followup: TStoredProc;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_tfollowup_IN_BLOQUEADO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_bloqueio_evento: Tdatm_bloqueio_evento;

implementation

uses PGGA021, PGGP017, GSMLIB, PGGP001;

{$R *.DFM}

end.
