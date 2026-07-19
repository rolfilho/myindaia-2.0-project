unit PGSM133;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_lib_proc = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    ds_produto: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_cliente_habilitacao_: TQuery;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_CD_UNID_NEG: TStringField;
    qry_cliente_habilitacao_CD_PRODUTO: TStringField;
    qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField;
    qry_cliente_habilitacao_DT_CAPTACAO: TDateTimeField;
    qry_cliente_habilitacao_IN_ATIVO: TStringField;
    qry_cliente_habilitacao_TX_NUMERARIO_OBS: TMemoField;
    qry_cliente_habilitacao_QT_ADIANTAMENTO: TFloatField;
    qry_cliente_habilitacao_CD_DT_BASE_CAMBIO: TStringField;
    qry_cliente_habilitacao_CD_TAB_SDA: TStringField;
    qry_cliente_habilitacao_look_nm_cliente: TStringField;
    ds_cliente_habilitacao: TDataSource;
    qry_rel_processo_: TQuery;
    ds_rel_processo: TDataSource;
    qry_ult_processo_: TQuery;
    qry_ult_processo_ULTIMO: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_DT_HABILITACAO: TDateTimeField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    ds_traz_default: TDataSource;
    qry_cliente_servico_: TQuery;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_cliente_servico_IN_ATIVO: TStringField;
    qry_cliente_servico_NR_DPS: TStringField;
    qry_cliente_servico_DT_CAPTACAO: TDateTimeField;
    qry_cliente_servico_IN_INCIDE_SDA: TStringField;
    qry_cliente_servico_PZ_PROPOSTA: TIntegerField;
    qry_cliente_servico_look_nm_servico: TStringField;
    ds_cliente_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    ds_servico: TDataSource;
    qry_rel_processo_NR_PROCESSO: TStringField;
    qry_rel_processo_CD_UNID_NEG: TStringField;
    qry_rel_processo_CD_PRODUTO: TStringField;
    qry_rel_processo_CD_CLIENTE: TStringField;
    qry_rel_processo_CD_USUARIO: TStringField;
    qry_rel_processo_CD_RESTRICAO: TStringField;
    qry_usuario_: TQuery;
    ds_usuario: TDataSource;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_rel_processo_look_ap_usuario: TStringField;
    qry_tp_pend_: TQuery;
    ds_tp_pend: TDataSource;
    qry_tp_pend_CD_PEND: TStringField;
    qry_tp_pend_NM_PEND: TStringField;
    qry_rel_processo_look_nm_pend: TStringField;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_rel_processo_AP_EMPRESA: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_LIBERADOR: TStringField;
    qry_processo_DT_LIBERACAO: TDateTimeField;
    qry_processo_calc_nr_processo: TStringField;
    qry_rel_processo_Calc_Nr_Processo: TStringField;
    qryUpdateProcesso: TQuery;
    procedure qry_rel_processo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_lib_proc: Tdatm_lib_proc;

implementation

{$R *.DFM}
procedure Tdatm_lib_proc.qry_rel_processo_CalcFields(DataSet: TDataSet);
begin
    qry_rel_processo_calc_nr_processo.AsString := Copy( qry_rel_processo_NR_PROCESSO.AsString, 5,14 );
end;

end.
