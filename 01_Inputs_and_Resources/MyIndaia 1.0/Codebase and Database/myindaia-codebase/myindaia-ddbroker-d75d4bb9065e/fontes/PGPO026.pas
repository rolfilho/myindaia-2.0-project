unit PGPO026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables;


type
  Tdatm_evento_critico = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_tevento_: TQuery;
    qry_tevento_CD_EVENTO: TStringField;
    qry_tevento_NM_EVENTO: TStringField;
    qry_tevento_IN_INSPECIONAVEL: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_NR_PROCESSO: TStringField;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_servico: TQuery;
    qry_servicoCD_SERVICO: TStringField;
    qry_servicoNM_SERVICO: TStringField;
    qry_verifica_evento_: TQuery;
    qry_verifica_evento_NR_PROCESSO: TStringField;
    qry_verifica_evento_CD_SERVICO: TStringField;
    qry_verifica_evento_CD_EVENTO: TStringField;
    qry_verifica_evento_DT_PREVISTA: TDateTimeField;
    qry_verifica_evento_LookServico: TStringField;
    qry_verifica_evento_LookCliente: TStringField;
    ds_verifica_evento: TDataSource;
    qry_verifica_evento_nr_processo_calc: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    ds_processo: TDataSource;
    procedure qry_verifica_evento_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_evento_critico: Tdatm_evento_critico;

implementation

uses GSMLIB, PGGA003, PGGP017, PGPO025, PGGP001;

{$R *.DFM}


procedure Tdatm_evento_critico.qry_verifica_evento_CalcFields(
  DataSet: TDataSet);
begin
  qry_verifica_evento_nr_processo_calc.AsString := Copy( qry_verifica_evento_NR_PROCESSO.AsString, 5, 14);
end;


end.
