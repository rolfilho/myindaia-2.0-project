unit PGGA026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_rel_and_servico = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    sp_rel_and_servico: TStoredProc;
    qry_cliente_servico_: TQuery;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_analistas_: TQuery;
    qry_analistas_CD_USUARIO: TStringField;
    qry_analistas_NM_USUARIO: TStringField;
    sp_atz_obs_rel: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_rel_and_servico: Tdatm_rel_and_servico;

implementation

{$R *.DFM}











end.
