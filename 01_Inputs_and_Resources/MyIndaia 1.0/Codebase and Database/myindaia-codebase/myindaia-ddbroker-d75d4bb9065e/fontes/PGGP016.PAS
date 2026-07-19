unit PGGP016;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PGGP001,
  Db, DBTables;

type
  Tdatm_abertura_processo = class(TDataModule)
    tbl_processo_: TTable;
    tbl_processo_CD_CLIENTE: TStringField;
    tbl_processo_CD_SERVICO: TStringField;
    tbl_processo_CD_USUARIO: TStringField;
    tbl_processo_CD_UNID_NEG: TStringField;
    tbl_processo_CD_PRODUTO: TStringField;
    tbl_processo_DT_ABERTURA: TDateTimeField;
    tbl_processo_NR_PROC_RISC: TStringField;
    ds_processo: TDataSource;
    tbl_follow_up_: TTable;
    tbl_follow_up_NR_PROCESSO: TStringField;
    tbl_follow_up_CD_SERVICO: TStringField;
    tbl_follow_up_CD_EVENTO: TStringField;
    tbl_follow_up_IN_APLICAVEL: TStringField;
    tbl_follow_up_CD_RESP_APLICACAO: TStringField;
    tbl_follow_up_CD_RESP_REALIZACAO: TStringField;
    tbl_follow_up_CD_RESP_INSPECAO: TStringField;
    tbl_follow_up_DT_APLICACAO: TDateTimeField;
    tbl_follow_up_DT_REALIZACAO: TDateTimeField;
    tbl_follow_up_DT_INSPECAO: TDateTimeField;
    tbl_follow_up_CD_RESULT_INSPECAO: TStringField;
    tbl_follow_up_NR_RNC: TStringField;
    tbl_unid_neg_produto_: TTable;
    tbl_unid_neg_produto_CD_UNID_NEG: TStringField;
    tbl_unid_neg_produto_CD_PRODUTO: TStringField;
    tbl_unid_neg_produto_IN_ATIVO: TStringField;
    tbl_unid_neg_produto_NR_ULT_FATURA: TFloatField;
    tbl_unid_neg_produto_NR_ULT_NOTA: TFloatField;
    tbl_unid_neg_produto_NR_ULT_PROCESSO: TFloatField;
    tbl_unid_neg_: TTable;
    tbl_unid_neg_CD_UNID_NEG: TStringField;
    tbl_unid_neg_NM_UNID_NEG: TStringField;
    tbl_unid_neg_AP_UNID_NEG: TStringField;
    tbl_unid_neg_IN_ATIVO: TStringField;
    tbl_produto_: TTable;
    tbl_produto_CD_PRODUTO: TStringField;
    tbl_produto_NM_PRODUTO: TStringField;
    tbl_produto_AP_PRODUTO: TStringField;
    tbl_produto_IN_ATIVO: TStringField;
    tbl_empresa_: TTable;
    tbl_empresa_CD_EMPRESA: TStringField;
    tbl_empresa_NM_EMPRESA: TStringField;
    tbl_empresa_AP_EMPRESA: TStringField;
    tbl_empresa_END_EMPRESA: TStringField;
    tbl_empresa_END_NUMERO: TStringField;
    tbl_empresa_END_CIDADE: TStringField;
    tbl_empresa_END_BAIRRO: TStringField;
    tbl_empresa_END_UF: TStringField;
    tbl_empresa_END_CEP: TStringField;
    tbl_empresa_CD_TIPO_PESSOA: TStringField;
    tbl_empresa_CGC_EMPRESA: TStringField;
    tbl_empresa_CPF_EMPRESA: TStringField;
    tbl_empresa_IE_EMPRESA: TStringField;
    tbl_empresa_OUTRO_DOC: TStringField;
    tbl_empresa_DT_INCLUSAO: TDateTimeField;
    tbl_empresa_IN_FATURAMENTO: TStringField;
    tbl_empresa_IN_ATIVO: TStringField;
    tbl_empresa_IN_RESTRICAO: TStringField;
    tbl_empresa_IN_EVENTUAL: TStringField;
    tbl_empresa_CD_TIPO_REF: TStringField;
    tbl_empresa_CD_TAB_SDA: TStringField;
    tbl_servico_: TTable;
    tbl_servico_CD_SERVICO: TStringField;
    tbl_servico_NM_SERVICO: TStringField;
    tbl_ref_proc_cliente_: TTable;
    tbl_ref_proc_cliente_NR_PROCESSO: TStringField;
    tbl_ref_proc_cliente_SEQ_REF: TStringField;
    tbl_ref_proc_cliente_CD_REFERENCIA: TStringField;
    tbl_ref_proc_cliente_PB_REFERENCIA: TFloatField;
    tbl_ref_proc_cliente_TX_CLIENTE: TStringField;
    tbl_ref_proc_cliente_QT_CNTR_20: TSmallintField;
    tbl_ref_proc_cliente_QT_CNTR_40: TSmallintField;
    tbl_processo_Look_nr_Processo: TStringField;
    tbl_processo_QT_REF_CLIENTE: TIntegerField;
    tbl_processo_NR_PROCESSO: TStringField;
    procedure tbl_processo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_abertura_processo: Tdatm_abertura_processo;

implementation

{$R *.DFM}

procedure Tdatm_abertura_processo.tbl_processo_CalcFields(
  DataSet: TDataSet);
begin
  tbl_processo_Look_nr_processo.AsString :=
     Copy( tbl_processo_NR_PROCESSO.AsString, 5, 7 );
end;

end.
