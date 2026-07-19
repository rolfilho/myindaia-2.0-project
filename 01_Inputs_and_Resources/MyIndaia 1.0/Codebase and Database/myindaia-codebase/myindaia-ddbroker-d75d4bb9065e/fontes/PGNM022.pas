unit PGNM022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_Impressao_Numerario = class(TDataModule)
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    ds_cliente_hab: TDataSource;
    qry_cliente_hab_: TQuery;
    qry_cliente_hab_CD_CLIENTE: TStringField;
    qry_cliente_hab_CD_UNID_NEG: TStringField;
    qry_cliente_hab_CD_PRODUTO: TStringField;
    qry_cliente_hab_DT_VALID_CRED_RF: TDateTimeField;
    qry_cliente_hab_DT_CAPTACAO: TDateTimeField;
    qry_cliente_hab_IN_ATIVO: TStringField;
    qry_cliente_hab_TX_NUMERARIO_OBS: TMemoField;
    qry_cliente_hab_QT_ADIANTAMENTO: TFloatField;
    qry_cliente_hab_CD_DT_BASE_CAMBIO: TStringField;
    qry_cliente_hab_CD_TAB_SDA: TStringField;
    qry_unid_neg_produto_: TQuery;
    qry_unid_neg_produto_CD_UNID_NEG: TStringField;
    qry_unid_neg_produto_CD_PRODUTO: TStringField;
    qry_unid_neg_produto_IN_ATIVO: TStringField;
    qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField;
    qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField;
    qry_numerario_: TQuery;
    qry_numerario_NR_PROCESSO: TStringField;
    qry_numerario_NR_SOLICITACAO: TStringField;
    qry_numerario_CD_USUARIO: TStringField;
    qry_numerario_CD_STATUS: TStringField;
    qry_numerario_TX_NUMERARIO_OBS: TMemoField;
    qry_numerario_TX_NUMERARIO_ASS: TMemoField;
    qry_numerario_VL_SOLICITADO: TFloatField;
    qry_numerario_VL_RECEBIDO: TFloatField;
    qry_numerario_QT_ITENS_SOLIC: TIntegerField;
    qry_numerario_IN_EMITIDO: TStringField;
    qry_numerario_DT_EMISSAO: TDateTimeField;
    ds_numerario: TDataSource;
    qry_cont_num_: TQuery;
    qry_cont_num_QT_REGISTROS: TIntegerField;
    qry_numerario_Calc_Nr_Processo: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_calc_nr_processo: TStringField;
    qry_emp_nac_CD_NUMERARIO: TStringField;
    qry_ref_cli_: TQuery;
    qry_avon_: TQuery;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_avon_nr_processo: TStringField;
    qry_avon_nr_solicitacao: TStringField;
    qry_avon_vl_armazen: TFloatField;
    qry_avon_vl_cap: TFloatField;
    qry_avon_vl_frete: TFloatField;
    qry_avon_vl_icms: TFloatField;
    qry_avon_vl_ii: TFloatField;
    qry_avon_vl_ipi: TFloatField;
    qry_avon_vl_afrmm: TFloatField;
    qry_avon_vl_sda: TFloatField;
    qry_avon_vl_siscomex: TFloatField;
    qry_numerario_DT_SOLICITACAO: TDateTimeField;
    qry_numerario_item_: TQuery;
    qry_numerario_item_NR_PROCESSO: TStringField;
    qry_numerario_item_DT_SOLICITACAO: TDateTimeField;
    qry_numerario_item_CD_ITEM: TStringField;
    qry_numerario_item_NM_ITEM: TStringField;
    qry_numerario_item_VL_TOT_ITEM: TFloatField;
    qry_numerario_item_IN_SM: TStringField;
    qry_numerario_item_NR_BANCO: TStringField;
    qry_numerario_item_CD_AGENCIA: TStringField;
    sp_atz_num_imp: TStoredProc;
    qry_apaga_dados: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_cliente_contato_: TQuery;
    qry_cliente_contato_CD_CLIENTE: TStringField;
    qry_cliente_contato_CD_UNID_NEG: TStringField;
    qry_cliente_contato_CD_PRODUTO: TStringField;
    qry_cliente_contato_NM_CONTATO: TStringField;
    qry_cliente_contato_NR_FAX: TStringField;
    qry_numerario_item_NM_APELIDO: TStringField;
    qry_numerario_item_CalcNrProcesso: TStringField;
    qry_fob_: TQuery;
    ds_numerario_item: TDataSource;
    qry_fob_NR_PROCESSO: TStringField;
    qry_fob_VL_MLE_MN: TFloatField;
    qry_fob_TX_DOLAR: TFloatField;
    qry_fob_CalcValorFOB: TFloatField;
    qry_itens_distintos_: TQuery;
    qry_proc_item_num_: TQuery;
    StringField11: TStringField;
    DateTimeField2: TDateTimeField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    qry_itens_distintos_CD_ITEM: TStringField;
    qry_proc_distintos_: TQuery;
    ds_proc_distintos: TDataSource;
    qry_itens_distintos_NM_APELIDO: TStringField;
    qry_proc_distintos_NR_PROCESSO: TStringField;
    qry_proc_item_num_VL_TOT_ITEM: TFloatField;
    procedure qry_numerario_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_numerario_item_CalcFields(DataSet: TDataSet);
    procedure qry_fob_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_Impressao_Numerario: Tdatm_Impressao_Numerario;

implementation

uses GSMLIB, PGGP001, PGGP017, PGNM021;

{$R *.DFM}

procedure Tdatm_Impressao_Numerario.qry_numerario_CalcFields(DataSet: TDataSet);
begin
  qry_numerario_Calc_Nr_Processo.AsString := Copy( qry_numerario_NR_PROCESSO.AsString, 5, 14 );
end;

procedure Tdatm_Impressao_Numerario.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_calc_nr_processo.Text := Copy( qry_processo_NR_PROCESSO.Text, 5, 14 );
end;

procedure Tdatm_Impressao_Numerario.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  if datm_Impressao_Numerario.qry_numerario_.State in [dsEdit] then
     datm_Impressao_Numerario.qry_numerario_.Post;
  qry_numerario_.Close;
  qry_numerario_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_numerario_.ParamByName('DT_SOLIC').AsDateTime  := StrToDate( frm_Impressao_Numerario.msk_dt_movimento.Text );
  qry_numerario_.Prepare;
  qry_numerario_.Open;
end;

procedure Tdatm_Impressao_Numerario.qry_numerario_item_CalcFields(DataSet: TDataSet);
begin
  qry_numerario_item_CalcNrProcesso.AsString := Copy( qry_numerario_item_NR_PROCESSO.AsString, 5, 14 );
end;

procedure Tdatm_Impressao_Numerario.qry_fob_CalcFields(DataSet: TDataSet);
begin
  if qry_fob_TX_DOLAR.AsFloat = 0 then
     qry_fob_CalcValorFOB.AsFloat := 0
  else
     qry_fob_CalcValorFOB.AsFloat :=
        Arredondar( ( qry_fob_VL_MLE_MN.AsFloat / qry_fob_TX_DOLAR.AsFloat ), 2 );
end;


end.
