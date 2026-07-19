unit PGNM006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_devolucao = class(TDataModule)
    sp_atz_devolucao: TStoredProc;
    StringField5: TStringField;
    StringField6: TStringField;
    ds_devolucao: TDataSource;
    qry_devolucao_: TQuery;
    qry_devolucao_NR_PROCESSO: TStringField;
    qry_devolucao_NR_DEVOLUCAO: TStringField;
    qry_devolucao_DT_DEVOLUCAO: TDateTimeField;
    qry_devolucao_CD_USUARIO: TStringField;
    qry_devolucao_VL_DEVOLUCAO: TFloatField;
    qry_devolucao_DT_CANCELAMENTO: TDateTimeField;
    qry_devolucao_CD_USUARIO_CANC: TStringField;
    qry_devolucao_Look_ap_usuario: TStringField;
    qry_devolucao_Look_usuario_Canc: TStringField;
    ds_itens_devol_lista: TDataSource;
    qry_itens_devolucao_: TQuery;
    qry_itens_devolucao_NR_PROCESSO: TStringField;
    qry_itens_devolucao_NR_DEVOLUCAO: TStringField;
    qry_itens_devolucao_NR_LANC_DEVOL: TStringField;
    qry_itens_devolucao_NR_RECEBIMENTO: TStringField;
    qry_itens_devolucao_NR_LANC_RECEB: TStringField;
    qry_itens_devolucao_CD_ITEM: TStringField;
    qry_itens_devolucao_VL_DEVOLVIDO: TFloatField;
    qry_itens_devolucao_Look_nm_item: TStringField;
    dsq_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_CD_TIPO_LANC_FAT: TStringField;
    qry_item_COLUMN4: TIntegerField;
    ds_usuario: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    ds_banco: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    ds_processo: TDataSource;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    ds_itens_receb: TDataSource;
    qry_itens_receb_: TQuery;
    qry_itens_receb_NR_PROCESSO: TStringField;
    qry_itens_receb_NR_RECEBIMENTO: TStringField;
    qry_itens_receb_NR_LANC_RECEB: TStringField;
    qry_itens_receb_NR_SOLICITACAO: TStringField;
    qry_itens_receb_NR_LANCAMENTO: TStringField;
    qry_itens_receb_VL_SOLICITADO: TFloatField;
    qry_itens_receb_VL_RECEBIDO: TFloatField;
    qry_itens_receb_CD_ITEM: TStringField;
    qry_itens_receb_LK_NM_ITEM: TStringField;
    qry_itens_receb_IN_CANCELADO: TStringField;
    qry_itens_receb_LookCancelado: TStringField;
    qry_receb_: TQuery;
    qry_receb_NR_PROCESSO: TStringField;
    qry_receb_NR_RECEBIMENTO: TStringField;
    qry_receb_DT_RECEBIMENTO: TDateTimeField;
    qry_receb_CD_USUARIO: TStringField;
    qry_receb_CD_BANCO: TStringField;
    qry_receb_VL_RECEBIMENTO: TFloatField;
    qry_receb_IN_CANCELADO: TStringField;
    qry_receb_DT_CANCELAMENTO: TDateTimeField;
    qry_receb_CD_USUARIO_CANC: TStringField;
    qry_receb_IN_TRANSFERIDO: TStringField;
    qry_receb_LK_NM_USUARIO: TStringField;
    qry_receb_LK_NM_BANCO: TStringField;
    qry_receb_LK_NM_CANCELADOR: TStringField;
    qry_receb_LookCancelado: TStringField;
    ds_receb: TDataSource;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_CD_SENHA: TStringField;
    qry_usuario_CD_CARGO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_usuario_IN_ATIVO: TStringField;
    qry_tot_devolucao_: TQuery;
    qry_tot_devolucao_TOT_DEVOLVIDO: TFloatField;
    qry_saldo_receb_: TQuery;
    qry_saldo_receb_NR_PROCESSO: TStringField;
    qry_saldo_receb_NR_RECEBIMENTO: TStringField;
    qry_saldo_receb_NR_LANC_RECEB: TStringField;
    qry_saldo_receb_CD_ITEM: TStringField;
    qry_saldo_receb_VL_RECEBIDO: TFloatField;
    qry_saldo_receb_VL_DEVOLUCAO: TFloatField;
    qry_saldo_proc_: TQuery;
    qry_saldo_receb_VL_UTILIZADO: TFloatField;
    qry_devolucao_IN_CANCELADO: TStringField;
    qry_saldo_proc_VL_RECEBIDO: TFloatField;
    qry_saldo_proc_VL_UTILIZADO: TFloatField;
    sp_apaga_devol: TStoredProc;
    qry_itens_devolucao_calc_VL_DISPONIVEL: TFloatField;
    qry_saldo_disponivel_: TQuery;
    qry_saldo_disponivel_VL_RECEBIDO: TFloatField;
    qry_saldo_disponivel_VL_DEVOLUCAO: TFloatField;
    qry_saldo_disponivel_VL_UTILIZADO: TFloatField;
    qry_itens_receb_VL_UTILIZADO: TFloatField;
    qry_itens_receb_VL_DEVOLUCAO: TFloatField;
    qry_itens_receb_calc_VL_DISPONIVEL: TFloatField;
    qry_itens_devol_lista_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField1: TFloatField;
    StringField11: TStringField;
    ds_itens_devolucao: TDataSource;
    qry_itens_devol_lista_VL_DISPONIVEL: TFloatField;
    qry_tot_distribuicao_: TQuery;
    qry_devolucao_look_Cancelado: TStringField;
    qry_devolucao_IN_TRANSFERIDO: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_caixa_ctrl_: TQuery;
    qry_existe_fav_cli_: TQuery;
    qry_existe_fav_cli_CD_FAVORECIDO: TStringField;
    qry_existe_ch_devol_: TQuery;
    qry_existe_ch_devol_CD_STATUS_CHEQUE: TStringField;
    qry_devolucao_NR_SOLIC_CH: TStringField;
    qry_saldos_: TQuery;
    procedure qry_itens_receb_CalcFields(DataSet: TDataSet);
    procedure qry_devolucao_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_devolucao: Tdatm_devolucao;

implementation

{$R *.DFM}

uses PGNM005;

procedure Tdatm_devolucao.qry_itens_receb_CalcFields(DataSet: TDataSet);
begin
  qry_itens_receb_calc_VL_DISPONIVEL.AsFloat :=
    qry_itens_receb_VL_RECEBIDO.AsFloat -
    qry_itens_receb_VL_DEVOLUCAO.AsFloat -
    qry_itens_receb_VL_UTILIZADO.AsFloat;
end;

procedure Tdatm_devolucao.qry_devolucao_AfterScroll(DataSet: TDataSet);
begin
  if ( qry_devolucao_IN_CANCELADO.AsString = '1') or
     ( qry_devolucao_IN_TRANSFERIDO.AsString = '1') then
  begin
    frm_devolucao.btn_cancela_devolucao.Enabled := False;
    frm_devolucao.mi_cancela_devolucao.Enabled  := False;
  end
  else
  begin
    frm_devolucao.btn_cancela_devolucao.Enabled := True;
    frm_devolucao.mi_cancela_devolucao.Enabled  := True;
  end;
end;









end.
