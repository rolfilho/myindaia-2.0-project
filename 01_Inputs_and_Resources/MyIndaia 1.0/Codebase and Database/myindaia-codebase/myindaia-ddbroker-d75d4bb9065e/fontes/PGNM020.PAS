unit PGNM020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_devolucao = class(TDataModule)
    dsq_n_ref: TDataSource;
    qry_n_ref_: TQuery;
    qry_n_ref_NR_PROCESSO: TStringField;
    qry_n_ref_Look_nr_processo: TStringField;
    qry_n_ref_NR_SOLICITACAO: TStringField;
    qry_n_ref_DT_SOLICITACAO: TDateTimeField;
    qry_n_ref_CD_USUARIO: TStringField;
    qry_n_ref_CD_STATUS: TStringField;
    qry_n_ref_VL_SOLICITADO: TFloatField;
    qry_n_ref_VL_RECEBIDO: TFloatField;
    qry_n_ref_QT_ITENS_SOLIC: TIntegerField;
    qry_n_ref_Status: TStringField;
    tbl_servico_: TTable;
    tbl_servico_CD_SERVICO: TStringField;
    tbl_servico_NM_SERVICO: TStringField;
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
    tbl_processo_w_: TTable;
    tbl_processo_w_NR_PROCESSO: TStringField;
    tbl_processo_w_CD_UNID_NEG: TStringField;
    tbl_processo_w_CD_PRODUTO: TStringField;
    tbl_processo_w_DT_ABERTURA: TDateTimeField;
    tbl_processo_w_CD_CLIENTE: TStringField;
    tbl_processo_w_CD_SERVICO: TStringField;
    tbl_processo_w_CD_USUARIO: TStringField;
    tbl_processo_w_TXT_OBSERVACOES: TMemoField;
    tbl_processo_w_QT_SOLINUM: TIntegerField;
    tbl_processo_w_QT_RECEBIMENTO: TIntegerField;
    tbl_processo_w_QT_DEVOLUCOES: TIntegerField;
    tbl_processo_w_QT_LANC_FAT: TIntegerField;
    tbl_processo_w_NR_PROC_RISC: TStringField;
    dsq_item_cd: TDataSource;
    qry_item_cd: TQuery;
    qry_item_cdCD_ITEM: TStringField;
    qry_item_cdNM_ITEM: TStringField;
    qry_item_cdCD_TIPO_ITEM: TStringField;
    qry_item_cdNR_PRIORIDADE: TIntegerField;
    qry_item_cdCD_TIPO_LANC_FAT: TStringField;
    dsq_item_nm: TDataSource;
    qry_item_nm: TQuery;
    qry_item_nmCD_ITEM: TStringField;
    qry_item_nmNM_ITEM: TStringField;
    qry_item_nmCD_TIPO_ITEM: TStringField;
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
    tbl_unid_neg_produto_: TTable;
    tbl_unid_neg_produto_CD_UNID_NEG: TStringField;
    tbl_unid_neg_produto_CD_PRODUTO: TStringField;
    tbl_unid_neg_produto_IN_ATIVO: TStringField;
    tbl_unid_neg_produto_NR_ULT_FATURA: TFloatField;
    tbl_unid_neg_produto_NR_ULT_NOTA: TFloatField;
    tbl_unid_neg_produto_NR_ULT_PROCESSO: TFloatField;
    ds_usuario: TDataSource;
    tbl_usuario_: TTable;
    tbl_usuario_CD_USUARIO: TStringField;
    tbl_usuario_AP_USUARIO: TStringField;
    tbl_usuario_NM_USUARIO: TStringField;
    tbl_usuario_CD_SENHA: TStringField;
    tbl_usuario_CD_UNID_NEG: TStringField;
    tbl_usuario_CD_PRODUTO: TStringField;
    tbl_usuario_CD_CARGO: TStringField;
    tbl_usuario_IN_ATIVO: TStringField;
    ds_banco: TDataSource;
    tbl_banco_: TTable;
    tbl_banco_CD_BANCO: TStringField;
    tbl_banco_NM_BANCO: TStringField;
    tbl_banco_AP_BANCO: TStringField;
    tbl_banco_NR_CONTA: TStringField;
    tbl_banco_CD_AGENCIA: TStringField;
    tbl_banco_CD_CT_CONTABIL: TStringField;
    ds_recebimento: TDataSource;
    tbl_recebimento_: TTable;
    tbl_recebimento_NR_PROCESSO: TStringField;
    tbl_recebimento_CD_CLIENTE: TStringField;
    tbl_recebimento_CD_BANCO: TStringField;
    tbl_recebimento_CD_USUARIO: TStringField;
    tbl_recebimento_NR_RECEBIMENTO: TStringField;
    tbl_recebimento_DT_RECEBIMENTO: TDateTimeField;
    tbl_recebimento_VL_RECEBIMENTO: TFloatField;
    tbl_recebimento_QT_ITENS_RECEB: TIntegerField;
    tbl_recebimento_IN_CANCELADO: TBooleanField;
    tbl_recebimento_DT_CANCELAMENTO: TDateTimeField;
    tbl_recebimento_CD_USUARIO_CANC: TStringField;
    dsq_itens_receb: TDataSource;
    qry_itens_receb_: TQuery;
    qry_itens_receb_NR_PROCESSO: TStringField;
    qry_itens_receb_NR_RECEBIMENTO: TStringField;
    qry_itens_receb_NR_LANC_RECEB: TStringField;
    qry_itens_receb_NR_SOLICITACAO: TStringField;
    qry_itens_receb_NR_LANCAMENTO: TStringField;
    qry_itens_receb_CD_ITEM: TStringField;
    qry_itens_receb_VL_SOLICITADO: TFloatField;
    qry_itens_receb_VL_RECEBIDO: TFloatField;
    qry_itens_receb_Look_nm_item: TStringField;
    qry_itens_receb_IN_CANCELADO: TBooleanField;
    dsq_itens_por_prioridade_: TDataSource;
    qry_itens_por_prioridade_: TQuery;
    qry_itens_por_prioridade_NR_PROCESSO: TStringField;
    qry_itens_por_prioridade_NR_SOLICITACAO: TStringField;
    qry_itens_por_prioridade_NR_LANCAMENTO: TStringField;
    qry_itens_por_prioridade_CD_ITEM: TStringField;
    qry_itens_por_prioridade_NR_PRIORIDADE: TIntegerField;
    qry_itens_por_prioridade_CD_TIPO_CALCULO: TStringField;
    qry_itens_por_prioridade_TP_SOLIC_INFORM: TStringField;
    qry_itens_por_prioridade_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_por_prioridade_VL_SOLICITADO: TFloatField;
    qry_itens_por_prioridade_CD_STATUS: TStringField;
    qry_itens_por_prioridade_VL_RECEBIDO: TFloatField;
    qry_itens_por_prioridade_VL_UTILIZADO: TFloatField;
    qry_verif_item_999_: TQuery;
    sp_cancela_itens_receb_: TStoredProc;
    StringField3: TStringField;
    StringField4: TStringField;
    sp_soma_todas_solinum_: TStoredProc;
    StringField5: TStringField;
    StringField6: TStringField;
    qry_solinum_: TQuery;
    qry_solinum_NR_PROCESSO: TStringField;
    qry_solinum_NR_SOLICITACAO: TStringField;
    qry_solinum_DT_SOLICITACAO: TDateTimeField;
    qry_solinum_CD_USUARIO: TStringField;
    qry_solinum_VL_SOLICITADO: TFloatField;
    qry_solinum_VL_RECEBIDO: TFloatField;
    qry_solinum_QT_ITENS_SOLIC: TIntegerField;
    qry_solinum_CD_STATUS: TStringField;
    dsq_solinum: TDataSource;
    dsq_itens_solinum: TDataSource;
    qry_itens_solinum_: TQuery;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_NR_PRIORIDADE: TIntegerField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_TP_SOLIC_INFORM: TStringField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    qry_itens_solinum_VL_UTILIZADO: TFloatField;
    qry_itens_solinum_status: TStringField;
    qry_itens_solinum_Look_nm_item: TStringField;
    qry_itens_solinum_Look_nr_prioridade: TIntegerField;
    dsq_devolucao: TDataSource;
    qry_devolucao_: TQuery;
    qry_devolucao_NR_PROCESSO: TStringField;
    qry_devolucao_NR_DEVOLUCAO: TStringField;
    qry_devolucao_CD_CLIENTE: TStringField;
    qry_devolucao_DT_DEVOLUCAO: TDateTimeField;
    qry_devolucao_CD_USUARIO: TStringField;
    qry_devolucao_VL_DEVOLUCAO: TFloatField;
    qry_devolucao_QT_ITENS_DEVOLV: TIntegerField;
    qry_devolucao_IN_CANCELADO: TBooleanField;
    qry_devolucao_DT_CANCELAMENTO: TDateTimeField;
    qry_devolucao_CD_USUARIO_CANC: TStringField;
    qry_devolucao_Look_ap_usuario: TStringField;
    qry_devolucao_Look_Cancelado: TStringField;
    qry_devolucao_Look_usuario_Canc: TStringField;
    dsq_itens_devolucao: TDataSource;
    qry_itens_devolucao_: TQuery;
    qry_itens_devolucao_NR_PROCESSO: TStringField;
    qry_itens_devolucao_NR_DEVOLUCAO: TStringField;
    qry_itens_devolucao_NR_LANC_DEVOL: TStringField;
    qry_itens_devolucao_NR_RECEBIMENTO: TStringField;
    qry_itens_devolucao_NR_LANC_RECEB: TStringField;
    qry_itens_devolucao_NR_SOLINUM: TStringField;
    qry_itens_devolucao_NR_LANC_SOLINUM: TStringField;
    qry_itens_devolucao_CD_ITEM: TStringField;
    qry_itens_devolucao_VL_DEVOLVIDO: TFloatField;
    qry_itens_devolucao_IN_CANCELADO: TStringField;
    qry_itens_devolucao_Look_nm_item: TStringField;
    qry_itens_devolucao_Look_cancelado: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    procedure qry_n_ref_CalcFields(DataSet: TDataSet);
    procedure qry_itens_solinum_CalcFields(DataSet: TDataSet);
    procedure qry_devolucao_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_devolucao: Tdatm_devolucao;

implementation

{$R *.DFM}


procedure Tdatm_devolucao.qry_n_ref_CalcFields(DataSet: TDataSet);
begin
  qry_n_ref_Look_nr_processo.AsString := Copy( qry_n_ref_NR_PROCESSO.AsString, 5, 2 ) + '/' +
  Copy( qry_n_ref_NR_PROCESSO.AsString, 7, 4 ) + '-' + Copy( qry_n_ref_NR_PROCESSO.AsString,11, 1 );
  If qry_n_ref_CD_STATUS.AsString = 'A' then qry_n_ref_Status.AsString := 'Em Aberto';
  If qry_n_ref_CD_STATUS.AsString  = 'B' then qry_n_ref_Status.AsString := 'Baixada';
end;










procedure Tdatm_devolucao.qry_itens_solinum_CalcFields(
  DataSet: TDataSet);
begin
  If qry_itens_solinum_TP_SOLIC_INFORM.AsString = '2' Then
    qry_itens_solinum_status.AsString := 'Informado'
  else
    If qry_itens_solinum_CD_STATUS.AsString = 'B' Then
      qry_itens_solinum_status.AsString := 'Baixado'
    else
      If qry_itens_solinum_CD_STATUS.AsString = 'C' Then
        qry_itens_solinum_status.AsString := 'Cancelado'
      else
        If qry_itens_solinum_VL_RECEBIDO.AsFloat = 0 Then
          qry_itens_solinum_status.AsString := 'Em Aberto'
        else
          If qry_itens_solinum_VL_SOLICITADO.AsFloat > qry_itens_solinum_VL_RECEBIDO.AsFloat Then
            qry_itens_solinum_status.AsString := 'Receb.Parcial';
end;



procedure Tdatm_devolucao.qry_devolucao_CalcFields(DataSet: TDataSet);
begin
  If qry_devolucao_IN_CANCELADO.AsBoolean = False Then
    qry_devolucao_Look_cancelado.AsString := 'Não'
  else
    qry_devolucao_Look_cancelado.AsString := 'Sim';
end;

end.
