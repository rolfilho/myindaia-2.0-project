unit PGCH003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_pesq_solic_ch = class(TDataModule)
    ds_solic_ch: TDataSource;
    qry_solic_ch_: TQuery;
    qry_solic_ch_DT_SOLIC_CH: TStringField;
    qry_solic_ch_NR_SOLIC_CH: TStringField;
    qry_solic_ch_HM_SOLIC_CH: TStringField;
    qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField;
    qry_solic_ch_CD_BANCO: TStringField;
    qry_solic_ch_CD_FAVORECIDO: TStringField;
    qry_solic_ch_VL_SOLIC_CH: TFloatField;
    qry_solic_ch_NR_CHEQUE: TStringField;
    qry_solic_ch_LookStatusSolicCh: TStringField;
    qry_solic_ch_LookBanco: TStringField;
    qry_solic_ch_LookFavorecido: TStringField;
    qry_solic_ch_CD_USUARIO: TStringField;
    qry_solic_ch_CD_TIPO_LANC: TStringField;
    qry_solic_ch_CD_STATUS_CHEQUE: TStringField;
    ds_solic_ch_itens: TDataSource;
    qry_solic_ch_itens_: TQuery;
    qry_solic_ch_itens_NR_LANCAMENTO: TStringField;
    qry_solic_ch_itens_NR_PROCESSO: TStringField;
    qry_solic_ch_itens_CD_ITEM: TStringField;
    qry_solic_ch_itens_VL_ITEM: TFloatField;
    qry_solic_ch_itens_DT_SOLIC_CH: TStringField;
    qry_solic_ch_itens_NR_SOLIC_CH: TStringField;
    qry_solic_ch_itens_CD_STATUS: TStringField;
    qry_solic_ch_itens_VL_IR: TFloatField;
    qry_solic_ch_itens_VL_ASSIST: TFloatField;
    qry_solic_ch_itens_CD_DESPACHANTE: TStringField;
    qry_solic_ch_itens_LookItem: TStringField;
    qry_solic_ch_itens_LookStSolicChItens: TStringField;
    qry_solic_ch_itens_CD_CLIENTE: TStringField;
    qry_solic_ch_itens_LookCli: TStringField;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_IN_CONTROLA_IR: TBooleanField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    tbl_status_solic_ch_: TTable;
    tbl_status_solic_ch_CODIGO: TStringField;
    tbl_status_solic_ch_DESCRICAO: TStringField;
    ds_status_solic_ch: TDataSource;
    ds_usuario: TDataSource;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    ds_status_item_solic_ch: TDataSource;
    tbl_status_item_solic_ch_: TTable;
    tbl_status_item_solic_ch_CODIGO: TStringField;
    tbl_status_item_solic_ch_DESCRICAO: TStringField;
    qry_solic_ch_itens_CalcNrProcesso: TStringField;
    ds_desp: TDataSource;
    qry_desp_: TQuery;
    qry_desp_CD_DESPACHANTE: TStringField;
    qry_desp_NM_DESPACHANTE: TStringField;
    qry_solic_ch_itens_LookDespachante: TStringField;
    ds_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_proc_co_: TQuery;
    qry_proc_co_NR_PROCESSO: TStringField;
    qry_proc_co_CD_UNID_NEG: TStringField;
    qry_proc_co_CD_PRODUTO: TStringField;
    qry_proc_co_CD_SERVICO: TStringField;
    qry_proc_co_CD_CLIENTE: TStringField;
    qry_proc_co_LookUnidade: TStringField;
    qry_proc_co_LookProduto: TStringField;
    qry_proc_co_LookCliente: TStringField;
    qry_proc_co_LookServico: TStringField;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_solic_ch_IN_TRANSFERIDO: TStringField;
    sp_cancela_solic_ch: TStoredProc;
    StringField11: TStringField;
    StringField12: TStringField;
    qry_solic_ch_look_usuario: TStringField;
    procedure qry_solic_ch_AfterScroll(DataSet: TDataSet);
    procedure qry_solic_ch_itens_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pesq_solic_ch: Tdatm_pesq_solic_ch;

implementation

{$R *.DFM}

procedure Tdatm_pesq_solic_ch.qry_solic_ch_AfterScroll(DataSet: TDataSet);
begin
  qry_solic_ch_itens_.Close;
  qry_solic_ch_itens_.ParamByName('DT_SOLIC_CH').AsString := qry_solic_ch_DT_SOLIC_CH.AsString;
  qry_solic_ch_itens_.ParamByName('NR_SOLIC_CH').AsString := qry_solic_ch_NR_SOLIC_CH.AsString;
  qry_solic_ch_itens_.Prepare;
  qry_solic_ch_itens_.Open;
end;

procedure Tdatm_pesq_solic_ch.qry_solic_ch_itens_CalcFields(DataSet: TDataSet);
begin
  if Not qry_solic_ch_itens_NR_PROCESSO.IsNull then
  begin
    qry_solic_ch_itens_CalcNrProcesso.AsString := Copy( qry_solic_ch_itens_NR_PROCESSO.AsString, 5, 14 );
  end
end;


end.
