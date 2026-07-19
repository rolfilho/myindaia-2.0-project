(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPG026.PAS - Data Module - Geração de TED
DATA: 26/07/2002
*************************************************************************************************)
unit PGPG026;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pagto_gera_ted = class(TDataModule)
    ds_item: TDataSource;
    qry_item_: TQuery;
    sp_proc_itens_solic_pagto: TStoredProc;
    StringField13: TStringField;
    StringField14: TStringField;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    ds_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_LookUnidNeg: TStringField;
    qry_processo_LookProduto: TStringField;
    qry_processo_LookCliente: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_LookServico: TStringField;
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
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_item_IN_SOLIC_CHQ: TStringField;
    qry_param_: TQuery;
    qry_param_HM_PARA_SOLIC_CH: TStringField;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno: TDataSource;
    qry_lib_pagto_item_: TQuery;
    ds_lib_pagto_item: TDataSource;
    ds_destino: TDataSource;
    qry_destino_: TQuery;
    qry_destino_CD_DESTINO: TStringField;
    qry_destino_NM_DESTINO: TStringField;
    ds_calculo: TDataSource;
    qry_calculo_: TQuery;
    qry_calculo_CD_CALCULO: TStringField;
    qry_calculo_NM_CALCULO: TStringField;
    qry_calculo_NM_STORED_PROCEDURE: TStringField;
    qry_calculo_CD_TABELA: TStringField;
    qry_item_IN_ITEM_DI: TStringField;
    sp_atz_solic_pagto: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
    qry_status_solic_pagto_: TQuery;
    qry_status_solic_pagto_DESCRICAO: TStringField;
    ds_status_solic_pagto: TDataSource;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_DT_CALCULO: TDateTimeField;
    sp_di_calculo_: TStoredProc;
    StringField3: TStringField;
    StringField4: TStringField;
    qry_destino_CD_FAVORECIDO: TStringField;
    qry_destino_CD_BANCO: TStringField;
    qry_status_solic_pagto_CODIGO: TStringField;
    qry_lib_pagto_item_NR_REF: TStringField;
    qry_lib_pagto_item_VL_PAGTO: TFloatField;
    qry_lib_pagto_item_NR_PROCESSO: TStringField;
    qry_lib_pagto_item_NM_STATUS: TStringField;
    qry_lib_pagto_item_NM_ITEM: TStringField;
    qry_lib_pagto_: TQuery;
    ds_lib_pagto: TDataSource;
    qry_lib_pagto_NR_REF: TStringField;
    qry_lib_pagto_VL_PAGTO: TFloatField;
    qry_lib_pagto_NM_BANCO: TStringField;
    qry_lib_pagto_NM_FAVORECIDO: TStringField;
    qry_lib_pagto_item_CD_ITEM: TStringField;
    qry_lib_pagto_item_CalcNrProcesso: TStringField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
    qry_banco_CMES: TIntegerField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    qry_lib_pagto_CD_BANCO: TStringField;
    qry_lib_pagto_CD_FAVORECIDO: TStringField;
    ds_solic_pagto: TDataSource;
    qry_solic_pagto_: TQuery;
    qry_solic_pagto_NR_PROCESSO: TStringField;
    qry_solic_pagto_CD_ITEM: TStringField;
    qry_solic_pagto_CD_STATUS_CHEQUE: TStringField;
    qry_lib_pagto_DT_PAGTO: TDateTimeField;
    qry_solic_pagto_NR_DOCTO: TStringField;
    qry_lib_pagto_NR_DOCTO: TStringField;
    qry_solic_pagto_DT_PAGTO: TDateTimeField;
    qry_itens_pendentes_: TQuery;
    StringField7: TStringField;
    FloatField1: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    ds_itens_pendentes: TDataSource;
    ds_solic_pagto_pend: TDataSource;
    qry_solic_pagto_pend_: TQuery;
    qry_solic_pagto_pend_NR_PROCESSO: TStringField;
    qry_solic_pagto_pend_CD_ITEM: TStringField;
    qry_solic_pagto_pend_DT_PAGTO: TDateTimeField;
    qry_solic_pagto_pend_NR_REF: TStringField;
    qry_solic_pagto_CD_STATUS: TStringField;
    qry_lib_pagto_item_CD_STATUS: TStringField;
    qry_solic_pagto_VL_PAGTO: TFloatField;
    sp_distribui_pagto: TStoredProc;
    StringField17: TStringField;
    StringField18: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_lib_pagto_CD_STATUS_CHEQUE: TStringField;
    qry_status_cheque_: TQuery;
    ds_status_cheque: TDataSource;
    qry_status_cheque_CODIGO: TStringField;
    qry_status_cheque_DESCRICAO: TStringField;
    qry_lib_pagto_LookStatusCheque: TStringField;
    qry_solic_pagto_VL_DESCONTO: TFloatField;
    qry_banco_ANOMASK: TStringField;
    qry_solic_pagto_IN_TRANSF_FIN: TStringField;
    sp_cancela_solic_pagto: TStoredProc;
    StringField19: TStringField;
    StringField20: TStringField;
    qry_solic_pagto_NR_REF: TStringField;
    qry_lib_pagto_item_NR_LANCAMENTO: TStringField;
    qry_solic_pagto_NR_LANCAMENTO: TStringField;
    qry_itens_pendentes_NR_LANCAMENTO: TStringField;
    qry_solic_pagto_pend_NR_LANCAMENTO: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_solic_pagto_pend_CD_STATUS: TStringField;
    sp_atualiza_utilizado: TStoredProc;
    qry_banco_NR_CHEQUE: TStringField;
    qry_ult_ref_: TQuery;
    qry_ult_ref_ULT_REF: TStringField;
    sp_reemite_cheque: TStoredProc;
    StringField5: TStringField;
    StringField6: TStringField;
    qry_caixa_ctrl_: TQuery;
    qry_cidade_: TQuery;
    qry_cidade_END_CIDADE: TStringField;
    qry_lib_pagto_CD_UNID_NEG: TStringField;
    qry_unid_neg_CGC_UNID_NEG: TStringField;
    qry_banco_NR_REMESSA: TStringField;
    qry_banco_ted_: TQuery;
    qry_banco_ted_CD_AGENCIA: TStringField;
    qry_banco_ted_NR_CONTA: TStringField;
    qry_banco_ted_NM_BANCO: TStringField;
    qry_banco_ted_NR_BANCO: TStringField;
    qry_banco_ted_DAC_AGENCIA: TStringField;
    qry_favorecido_: TQuery;
    qry_banco_ted_AP_BANCO: TStringField;
    qry_banco_ted_CD_BANCO: TStringField;
    sp_distribui_pagamento: TStoredProc;
    procedure qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
    procedure qry_lib_pagto_item_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pagto_gera_ted: Tdatm_pagto_gera_ted;

implementation

uses GSMLIB, PGGP017, PGPG025;

{$R *.DFM}

procedure Tdatm_pagto_gera_ted.qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsFloat = 0 ) then
  begin
    BoxMensagem( 'Valor do Item não informado! ', 3 );
    Abort;
  end
end;

procedure Tdatm_pagto_gera_ted.qry_lib_pagto_item_CalcFields(DataSet: TDataSet);
begin
  qry_lib_pagto_item_CalcNrProcesso.AsString := Copy( qry_lib_pagto_item_NR_PROCESSO.AsString, 5, 14);
end;



end.
