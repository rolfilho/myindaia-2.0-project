unit PGPG006;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_lib_pagto = class(TDataModule)
    ds_item: TDataSource;
    qry_item_: TQuery;
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
    qry_lib_pagto_item_VL_BLOQUEADO: TFloatField;
    qry_lib_pagto_item_NR_PROCESSO: TStringField;
    qry_lib_pagto_item_NM_STATUS: TStringField;
    qry_lib_pagto_item_NM_ITEM: TStringField;
    qry_lib_pagto_: TQuery;
    ds_lib_pagto: TDataSource;
    qry_lib_pagto_NR_REF: TStringField;
    qry_lib_pagto_VL_PAGTO: TFloatField;
    qry_lib_pagto_VL_BLOQUEADO: TFloatField;
    qry_lib_pagto_NM_BANCO: TStringField;
    qry_lib_pagto_NM_FAVORECIDO: TStringField;
    sp_liberar_solic_pagto: TStoredProc;
    StringField5: TStringField;
    StringField6: TStringField;
    qry_lib_pagto_item_CD_ITEM: TStringField;
    qry_lib_pagto_item_CalcNrProcesso: TStringField;
    qry_itens_liberados_: TQuery;
    ds_itens_liberados_: TDataSource;
    qry_itens_liberados_CalcNrProcesso: TStringField;
    qry_itens_liberados_NR_REF: TStringField;
    qry_itens_liberados_VL_PAGTO: TFloatField;
    qry_itens_liberados_CD_ITEM: TStringField;
    qry_itens_liberados_VL_BLOQUEADO: TFloatField;
    qry_itens_liberados_NR_PROCESSO: TStringField;
    qry_itens_liberados_NM_STATUS: TStringField;
    qry_itens_liberados_NM_ITEM: TStringField;
    qry_lib_pagto_DT_PAGTO: TDateTimeField;
    qry_lib_pagto_item_NR_LANCAMENTO: TStringField;
    qry_itens_liberados_NR_LANCAMENTO: TStringField;
    qry_lib_pagto_CD_UNID_NEG: TStringField;
    qry_lib_pagto_IN_TED: TStringField;
    qry_solic_item_: TQuery;
    qry_solic_item_NR_PROCESSO: TStringField;
    qry_solic_item_NR_LANCAMENTO: TStringField;
    qry_solic_item_CD_ITEM: TStringField;
    qry_solic_item_CD_STATUS: TStringField;
    qry_solic_item_VL_PAGTO: TFloatField;
    qry_solic_item_VL_DESCONTO: TFloatField;
    qry_solic_item_DT_PAGTO: TDateTimeField;
    qry_solic_item_LookItem: TStringField;
    sp_cancela_item_solic_pagto: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
    sp_cancela_solic_pagto: TStoredProc;
    StringField19: TStringField;
    StringField20: TStringField;
    qry_lib_pagto_AP_EMPRESA: TStringField;
    qry_lib_pagto_NR_DOCTO: TStringField;
    procedure qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
    procedure qry_lib_pagto_item_CalcFields(DataSet: TDataSet);
    procedure qry_itens_liberados_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_lib_pagto: Tdatm_lib_pagto;

implementation

uses GSMLIB, PGGP017, PGPG005;

{$R *.DFM}

procedure Tdatm_lib_pagto.qry_itens_solic_ch_VL_ITEMValidate(Sender: TField);
begin
  if ( Sender.IsNull ) or ( Sender.AsFloat = 0 ) then
  begin
    BoxMensagem( 'Valor do Item não informado! ', 3 );
    Abort;
  end
end;


procedure Tdatm_lib_pagto.qry_lib_pagto_item_CalcFields(DataSet: TDataSet);
begin
  qry_lib_pagto_item_CalcNrProcesso.AsString := Copy( qry_lib_pagto_item_NR_PROCESSO.AsString, 5, 14);
end;


procedure Tdatm_lib_pagto.qry_itens_liberados_CalcFields(
  DataSet: TDataSet);
begin
  qry_itens_liberados_CalcNrProcesso.AsString := Copy( qry_itens_liberados_NR_PROCESSO.AsString, 5, 14);
end;






end.
