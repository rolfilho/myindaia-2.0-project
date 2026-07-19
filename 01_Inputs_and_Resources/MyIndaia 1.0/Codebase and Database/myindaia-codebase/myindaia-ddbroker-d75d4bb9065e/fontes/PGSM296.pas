unit PGSM296;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Funcoes,
  ppBands, ppCtrls, ppReport, ppSubRpt, ppStrtch, ppRegion, ppVar, RxGIF,
  ppPrnabl, ppClass, ppCache, ppProd, ppMemo, ppModule, raCodMod,
  ppParameter;

type
  Tdatm_notificacao = class(TDataModule)
    qry_traz_default_: TQuery;
    qry_pesquisa_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_processo_: TQuery;
    qry_notifica_: TQuery;
    qry_notifica_NR_PROCESSO: TStringField;
    qry_notifica_NR_SOLICITACAO: TStringField;
    qry_notifica_DT_SOLICITACAO: TDateTimeField;
    qry_notifica_CD_USUARIO: TStringField;
    qry_notifica_CD_STATUS: TStringField;
    qry_notifica_TX_NUMERARIO_OBS: TMemoField;
    qry_notifica_TX_NUMERARIO_ASS: TMemoField;
    qry_notifica_VL_SOLICITADO: TFloatField;
    qry_notifica_VL_RECEBIDO: TFloatField;
    qry_notifica_QT_ITENS_SOLIC: TIntegerField;
    qry_notifica_IN_EMITIDO: TStringField;
    qry_notifica_DT_EMISSAO: TDateTimeField;
    qry_notifica_CD_BASE_CALCULO: TStringField;
    qry_notifica_DT_PARIDADE: TDateTimeField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_NM_EMPRESA: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    ds_notifica: TDataSource;
    ds_processo: TDataSource;
    qry_notifica_item_: TQuery;
    qry_notifica_item_NR_PROCESSO: TStringField;
    qry_notifica_item_NR_SOLICITACAO: TStringField;
    qry_notifica_item_NR_LANCAMENTO: TStringField;
    qry_notifica_item_CD_ITEM: TStringField;
    qry_notifica_item_NR_PRIORIDADE: TIntegerField;
    qry_notifica_item_CD_TIPO_CALCULO: TStringField;
    qry_notifica_item_CD_BANCO: TStringField;
    qry_notifica_item_VL_ITEM_CALCULADO: TFloatField;
    qry_notifica_item_VL_SOLICITADO: TFloatField;
    qry_notifica_item_CD_STATUS: TStringField;
    qry_notifica_item_VL_RECEBIDO: TFloatField;
    qry_notifica_item_VL_UTILIZADO: TFloatField;
    qry_notifica_item_IN_CANCELADO: TStringField;
    qry_notifica_item_TP_DESTINO: TStringField;
    qry_notifica_item_CD_FAVORECIDO: TStringField;
    qry_notifica_item_CD_MOEDA_COMPRA: TStringField;
    qry_notifica_item_CD_MOEDA_VENDA: TStringField;
    qry_notifica_item_VL_COMPRA: TFloatField;
    qry_notifica_item_VL_VENDA: TFloatField;
    ds_notifica_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_tp_destino_: TQuery;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_status_: TQuery;
    qry_status_CD_STATUS: TStringField;
    qry_status_NM_STATUS: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_notifica_Look_status: TStringField;
    qry_notifica_Look_nm_usuario: TStringField;
    qry_notifica_item_Look_nm_item: TStringField;
    qry_notifica_item_Look_nm_status: TStringField;
    qry_notifica_item_Look_nm_banco: TStringField;
    qry_notifica_item_Look_tp_destino: TStringField;
    qry_moeda_broker_: TQuery;
    qry_moeda_broker_CD_MOEDA: TStringField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_notifica_item_Look_moeda: TStringField;
    qry_processo_TP_SERVICO: TStringField;
    sp_calc_padrao: TStoredProc;
    sp_atz_num_cpmf: TStoredProc;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    sp_calculo: TStoredProc;
    UPdate_num_item: TUpdateSQL;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_notifica_item_Look_nm_favorecido: TStringField;
    sp_atz_pagto_ag: TStoredProc;
    qry_soma_valores_: TQuery;
    ds_som_valores: TDataSource;
    sp_importa_num_cancelados: TStoredProc;
    sp_soma_solinum_ag: TStoredProc;
    qry_processo_NR_PROCESSO_VINC: TStringField;
    sp_numerario_proc_vinc: TStoredProc;
    qry_notifica_item_calc_origem: TStringField;
    sp_atz_status_solic_pagto_ag: TStoredProc;
    sp_duplica_numerario_ag: TStoredProc;
    StringField9: TStringField;
    StringField10: TStringField;
    qry_imp_notificacao_: TQuery;
    ds_imp_notificacao: TDataSource;
    pp_notificacao: TppBDEPipeline;
    qry_item_TP_ITEM: TStringField;
    qry_imp_notificacao_NR_PROCESSO: TStringField;
    qry_imp_notificacao_NR_SOLICITACAO: TStringField;
    qry_imp_notificacao_NR_LANCAMENTO: TStringField;
    qry_imp_notificacao_CD_ITEM: TStringField;
    qry_imp_notificacao_CD_MOEDA_VENDA: TStringField;
    qry_imp_notificacao_VL_VENDA: TFloatField;
    qry_imp_notificacao_VL_SOLICITADO: TFloatField;
    qry_imp_notificacao_CD_CLIENTE: TStringField;
    qry_imp_notificacao_NM_EMPRESA: TStringField;
    qry_imp_notificacao_END_EMPRESA: TStringField;
    qry_imp_notificacao_END_NUMERO: TStringField;
    qry_imp_notificacao_END_CIDADE: TStringField;
    qry_imp_notificacao_END_BAIRRO: TStringField;
    qry_imp_notificacao_END_COMPL: TStringField;
    qry_imp_notificacao_END_UF: TStringField;
    qry_imp_notificacao_END_CEP: TStringField;
    qry_imp_notificacao_CGC_CPF_EMRPESA: TStringField;
    qry_imp_notificacao_NR_TELEFONE: TStringField;
    qry_imp_notificacao_NR_FAX: TStringField;
    qry_imp_notificacao_REF_CLIENTE: TStringField;
    qry_imp_notificacao_NM_ITEM: TStringField;
    qry_imp_notificacao_TX_NUMERARIO_OBS: TMemoField;
    qry_imp_notificacao_NM_REF_DESEMBARACO: TStringField;
    qry_imp_notificacao_CD_CONTATO: TStringField;
    qry_imp_notificacao_NM_CONTATO: TStringField;
    qry_imp_notificacao_NM_EMP_EST: TStringField;
    qry_imp_notificacao_CIF_REAIS: TFloatField;
    qry_imp_notificacao_CIF_DOLAR: TFloatField;
    qry_imp_notificacao_HAWB_BL: TStringField;
    qry_imp_notificacao_AWB_BL: TStringField;
    qry_imp_notificacao_VL_MLE_MNEG: TFloatField;
    qry_imp_notificacao_VL_FRETE: TFloatField;
    qry_imp_notificacao_VL_SEGURO_MNEG: TFloatField;
    qry_imp_notificacao_MOEDA_MLE: TStringField;
    qry_imp_notificacao_MOEDA_FRETE: TStringField;
    qry_imp_notificacao_MOEDA_SEGURO: TStringField;
    qry_imp_notificacao_NM_VIA_TRANSP: TStringField;
    qry_imp_notificacao_NM_EMBARCACAO: TStringField;
    qry_imp_notificacao_NM_UNID_NEG: TStringField;
    qry_imp_notificacao_CGC_UNID_NEG: TStringField;
    qry_imp_notificacao_END_UNID_NEG: TStringField;
    qry_imp_notificacao_NR_UNID: TStringField;
    qry_imp_notificacao_IE_UNID_NEG: TStringField;
    qry_imp_notificacao_FONE_UNID: TStringField;
    qry_imp_notificacao_CEP_UNID: TStringField;
    qry_imp_notificacao_FAX_UNID: TStringField;
    qry_imp_notificacao_NM_BANCO: TStringField;
    qry_imp_notificacao_NR_BANCO: TStringField;
    qry_imp_notificacao_CD_AGENCIA: TStringField;
    qry_imp_notificacao_NR_CONTA: TStringField;
    qry_imp_notificacao_NR_DECLARACAO_IMP: TStringField;
    qry_imp_notificacao_TX_DOLAR: TFloatField;
    qry_imp_notificacao_CD_LOCAL_EMBARQUE: TStringField;
    qry_imp_notificacao_lOCAL: TStringField;
    qry_imp_notificacao_TP_DESTINO: TStringField;
    qry_imp_notificacao_calc_end_cliente: TStringField;
    qry_imp_notificacao_cacl_nr_processo: TStringField;
    qry_imp_notificacao_calc_nm_usuario: TStringField;
    qry_imp_notificacao_calc_nm_destino: TStringField;
    qry_imp_notificacao_TX_MERCADORIA: TMemoField;
    qry_imp_notificacao_NM_EMAIL: TStringField;
    qry_imp_notificacao_TEL_IMPORTADOR: TStringField;
    qry_imp_notificacao_FAX_IMPORTADOR: TStringField;
    qry_imp_referencias_: TQuery;
    ds_imp_referencias: TDataSource;
    pp_referencias: TppBDEPipeline;
    qry_imp_referencias_CD_REFERENCIA: TStringField;
    UpdNotifica: TUpdateSQL;
    qry_imp_notificacao_exp_: TQuery;
    ds_imp_notificacao_exp: TDataSource;
    pp_notificacao_exp: TppBDEPipeline;
    qry_imp_notificacao_exp_calc_end_cliente: TStringField;
    qry_imp_notificacao_exp_calc_nr_processo: TStringField;
    qry_imp_notificacao_exp_calc_nm_usuario: TStringField;
    qry_imp_notificacao_exp_calc_nm_destino: TStringField;
    qry_imp_notificacao_exp_NR_PROCESSO: TStringField;
    qry_imp_notificacao_exp_NR_SOLICITACAO: TStringField;
    qry_imp_notificacao_exp_NR_LANCAMENTO: TStringField;
    qry_imp_notificacao_exp_CD_ITEM: TStringField;
    qry_imp_notificacao_exp_CD_MOEDA_VENDA: TStringField;
    qry_imp_notificacao_exp_VL_VENDA: TFloatField;
    qry_imp_notificacao_exp_VL_SOLICITADO: TFloatField;
    qry_imp_notificacao_exp_CD_CLIENTE: TStringField;
    qry_imp_notificacao_exp_NM_EMPRESA: TStringField;
    qry_imp_notificacao_exp_END_EMPRESA: TStringField;
    qry_imp_notificacao_exp_END_NUMERO: TStringField;
    qry_imp_notificacao_exp_END_CIDADE: TStringField;
    qry_imp_notificacao_exp_END_BAIRRO: TStringField;
    qry_imp_notificacao_exp_END_COMPL: TStringField;
    qry_imp_notificacao_exp_END_UF: TStringField;
    qry_imp_notificacao_exp_END_CEP: TStringField;
    qry_imp_notificacao_exp_CGC_CPF_EMRPESA: TStringField;
    qry_imp_notificacao_exp_NR_TELEFONE: TStringField;
    qry_imp_notificacao_exp_NR_FAX: TStringField;
    qry_imp_notificacao_exp_REF_CLIENTE: TStringField;
    qry_imp_notificacao_exp_NM_ITEM: TStringField;
    qry_imp_notificacao_exp_TX_NUMERARIO_OBS: TMemoField;
    qry_imp_notificacao_exp_NM_REF_DESEMBARACO: TStringField;
    qry_imp_notificacao_exp_TX_MERCADORIA: TMemoField;
    qry_imp_notificacao_exp_CD_CONTATO: TStringField;
    qry_imp_notificacao_exp_NM_CONTATO: TStringField;
    qry_imp_notificacao_exp_NM_EMAIL: TStringField;
    qry_imp_notificacao_exp_TEL_IMPORTADOR: TStringField;
    qry_imp_notificacao_exp_FAX_IMPORTADOR: TStringField;
    qry_imp_notificacao_exp_NM_EMP_EST: TStringField;
    qry_imp_notificacao_exp_CIF_REAIS: TFloatField;
    qry_imp_notificacao_exp_CIF_DOLAR: TFloatField;
    qry_imp_notificacao_exp_HAWB_BL: TStringField;
    qry_imp_notificacao_exp_AWB_BL: TStringField;
    qry_imp_notificacao_exp_VL_MLE_MNEG: TFloatField;
    qry_imp_notificacao_exp_VL_FRETE: TFloatField;
    qry_imp_notificacao_exp_VL_SEGURO_MNEG: TFloatField;
    qry_imp_notificacao_exp_MOEDA_MLE: TStringField;
    qry_imp_notificacao_exp_MOEDA_FRETE: TStringField;
    qry_imp_notificacao_exp_MOEDA_SEGURO: TStringField;
    qry_imp_notificacao_exp_NM_VIA_TRANSP: TStringField;
    qry_imp_notificacao_exp_NM_EMBARCACAO: TStringField;
    qry_imp_notificacao_exp_NM_UNID_NEG: TStringField;
    qry_imp_notificacao_exp_CGC_UNID_NEG: TStringField;
    qry_imp_notificacao_exp_END_UNID_NEG: TStringField;
    qry_imp_notificacao_exp_NR_UNID: TStringField;
    qry_imp_notificacao_exp_IE_UNID_NEG: TStringField;
    qry_imp_notificacao_exp_FONE_UNID: TStringField;
    qry_imp_notificacao_exp_CEP_UNID: TStringField;
    qry_imp_notificacao_exp_FAX_UNID: TStringField;
    qry_imp_notificacao_exp_NM_BANCO: TStringField;
    qry_imp_notificacao_exp_NR_BANCO: TStringField;
    qry_imp_notificacao_exp_CD_AGENCIA: TStringField;
    qry_imp_notificacao_exp_NR_CONTA: TStringField;
    qry_imp_notificacao_exp_NR_DECLARACAO_IMP: TStringField;
    qry_imp_notificacao_exp_TX_DOLAR: TFloatField;
    qry_imp_notificacao_exp_CD_LOCAL_EMBARQUE: TStringField;
    qry_imp_notificacao_exp_lOCAL: TStringField;
    qry_imp_notificacao_exp_TP_DESTINO: TStringField;
    qry_imp_notificacao_CD_PRODUTO: TStringField;
    qry_imp_notificacao_NM_PRODUTO: TStringField;
    qry_imp_notificacao_exp_CD_PRODUTO: TStringField;
    qry_imp_notificacao_exp_NM_PRODUTO: TStringField;
    qry_imp_notificacao_DT_CHEGADA_CARGA2: TDateTimeField;
    qry_imp_notificacao_exp_DT_CHEGADA_CARGA: TDateTimeField;
    qry_imp_notificacao_exp_CIDADE_UNID: TStringField;
    qry_imp_notificacao_CIDADE_UNID: TStringField;
    dsLCL: TDataSource;
    qryLCL: TQuery;
    qryFCL: TQuery;
    dsFCL: TDataSource;
    qryLCLTEXTO: TStringField;
    qryFCLTEXTO: TStringField;
    qry_imp_notificacao_NM_CONSIG: TStringField;
    qry_imp_notificacao_END_CONSIG: TStringField;
    qry_imp_notificacao_END_NUMERO_CONSIG: TStringField;
    qry_imp_notificacao_END_CIDADE_CONSIG: TStringField;
    qry_imp_notificacao_END_BAIRRO_CONSIG: TStringField;
    qry_imp_notificacao_END_COMPL_CONSIG: TStringField;
    qry_imp_notificacao_END_UF_CONSIG: TStringField;
    qry_imp_notificacao_END_CEP_CONSIG: TStringField;
    qry_imp_notificacao_CGC_CPF_CONSIG: TStringField;
    qry_imp_notificacao_calc_end_consig: TStringField;
    dsItemCliente: TDataSource;
    dsItemIndaia: TDataSource;
    qryItemCliente: TQuery;
    qryItemIndaia: TQuery;
    ppBDEItemCliente: TppBDEPipeline;
    ppBDEItemIndaia: TppBDEPipeline;
    qryItemIndaiaCD_ITEM: TStringField;
    qryItemIndaiaVL_VENDA: TFloatField;
    qryItemIndaiaVL_SOLICITADO: TFloatField;
    qryItemIndaiaNM_ITEM: TStringField;
    qryItemIndaiaNM_BANCO: TStringField;
    qryItemIndaiaNR_BANCO: TStringField;
    qryItemIndaiaCD_AGENCIA: TStringField;
    qryItemIndaiaNR_CONTA: TStringField;
    qryItemClienteCD_ITEM: TStringField;
    qryItemClienteVL_VENDA: TFloatField;
    qryItemClienteVL_SOLICITADO: TFloatField;
    qryItemClienteNM_ITEM: TStringField;
    qryItemClienteNM_BANCO: TStringField;
    qryItemClienteNR_BANCO: TStringField;
    qryItemClienteCD_AGENCIA: TStringField;
    qryItemClienteNR_CONTA: TStringField;
    qry_imp_notificacao_ARMAZEM_DESCAGA: TStringField;
    qry_imp_notificacao_calcMLEDolar: TFloatField;
    qry_imp_notificacao_exp_TP_CONSIGNATARIO: TStringField;
    qry_imp_notificacao_exp_CD_CONSIGNATARIO: TStringField;
    qry_imp_notificacao_exp_calcNmConsig: TStringField;
    qry_imp_notificacao_exp_END_CONSIG: TStringField;
    qry_imp_notificacao_exp_NUMERO_CONSIG: TStringField;
    qry_imp_notificacao_exp_COMPL_CONSIG: TStringField;
    qry_imp_notificacao_exp_CIDADE_CONSIG: TStringField;
    qry_imp_notificacao_exp_EST_CONSIG: TStringField;
    qry_imp_notificacao_exp_calcENDConsig: TStringField;
    qry_imp_notificacao_exp_CGC_CONSIG: TStringField;
    qry_imp_notificacao_exp_calcMLEDolar: TFloatField;
    qry_imp_notificacao_TAXA_CAMBIO: TFloatField;
    qry_imp_notificacao_NM_EMP_EST_FI: TStringField;
    qry_imp_notificacao_DT_NOTIFICACAO: TDateTimeField;
    qry_imp_notificacao_DT_CHEGADA_FI: TDateTimeField;
    qry_imp_notificacao_NR_HOUSE_FI: TStringField;
    qry_imp_notificacao_NM_EMB_FI: TStringField;
    qry_imp_notificacao_NM_ATRAC_FI: TStringField;
    qry_imp_notificacao_NR_PROPOSTA: TStringField;
    qry_imp_notificacao_calcMercadoriaFI: TStringField;
    qry_imp_notificacao_calc_nm_usuario_fi: TStringField;
    qry_imp_notificacao_exp_VL_MLE_MN: TFloatField;
    qry_imp_notificacao_exp_VL_FRETE_MN: TFloatField;
    SqlAux: TQuery;
    qry_notifica_calcDT_BAIXA: TDateField;
    qryMoedas: TQuery;
    ppBDEMoedas: TppBDEPipeline;
    dsMoedas: TDataSource;
    qryMoedasNR_PROCESSO: TStringField;
    qryMoedasCD_MOEDA: TStringField;
    qryMoedasNM_MOEDA: TStringField;
    qryMoedasTX_MOEDA: TFloatField;
    qryMoedascalc_nm_moeda: TStringField;
    qryMoedasAP_MOEDA: TStringField;
    procedure qry_notifica_BeforePost(DataSet: TDataSet);
    procedure qry_notifica_item_BeforePost(DataSet: TDataSet);
    procedure qry_notifica_item_AfterPost(DataSet: TDataSet);
    procedure qry_notifica_item_AfterDelete(DataSet: TDataSet);
    procedure qry_notifica_item_AfterScroll(DataSet: TDataSet);
    procedure qry_notifica_AfterScroll(DataSet: TDataSet);
    procedure qry_notifica_item_CalcFields(DataSet: TDataSet);
    procedure qry_imp_notificacao_CalcFields(DataSet: TDataSet);
    procedure qry_notifica_AfterPost(DataSet: TDataSet);
    procedure qry_notifica_BeforeDelete(DataSet: TDataSet);
    procedure qry_imp_notificacao_exp_CalcFields(DataSet: TDataSet);
    procedure ds_notifica_itemStateChange(Sender: TObject);
    procedure qry_notifica_CalcFields(DataSet: TDataSet);
    procedure qryMoedasCalcFields(DataSet: TDataSet);
    procedure trava_grid_numerario(DataSet: TDataSet);
    procedure qry_notifica_item_AfterCancel(DataSet: TDataSet);
    procedure qry_notifica_item_PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    Nr_solicitacao: String;
  public
    { Public declarations }
    procedure atz_soma_numerario;
  end;

var
  datm_notificacao: Tdatm_notificacao;

implementation

uses PGSM295, PGGP001, PGGP017, ConsOnLineEx;

{$R *.DFM}

procedure Tdatm_notificacao.atz_soma_numerario;
var
  BookMark :TBookMark;
  vl_recebido, vl_solicitado:real;
begin
  vl_recebido:=0; vl_solicitado:=0;
  qry_notifica_item_.First;
  while not(qry_notifica_item_.Eof) do
  begin
    if (qry_notifica_item_TP_DESTINO.AsString = '2') or
       (qry_notifica_item_TP_DESTINO.AsString = '3') or
       (qry_notifica_item_TP_DESTINO.AsString = '4') then
    begin
      vl_recebido:=vl_recebido + qry_notifica_item_VL_RECEBIDO.AsFloat;
      vl_solicitado:=vl_solicitado + qry_notifica_item_VL_SOLICITADO.AsFloat;
    end;
    qry_notifica_item_.Next;
  end;
  if not (qry_notifica_.State in [dsEdit]) then
    qry_notifica_.Edit;
  qry_notifica_VL_SOLICITADO.AsFloat:=vl_solicitado;
  qry_notifica_VL_RECEBIDO.AsFloat  := vl_recebido;
  qry_notifica_.Post;
end;

procedure Tdatm_notificacao.qry_notifica_BeforePost(DataSet: TDataSet);
begin
  if qry_notifica_.State in [dsInsert] then
  begin
    with TQuery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(NR_SOLICITACAO) FROM TNUMERARIO_NOTIFICA (NOLOCK) ');
      Sql.Add(' WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
      Open;
      if Fields[0].AsString = '' then
        qry_notifica_NR_SOLICITACAO.AsString:='001'
      else qry_notifica_NR_SOLICITACAO.AsString:= formatfloat('000',Fields[0].AsInteger + 1 );
    end;
  end;
end;

procedure Tdatm_notificacao.qry_notifica_item_BeforePost(DataSet: TDataSet);
begin
  if qry_notifica_Item_.State in [dsInsert] then
  begin
    with TQuery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(NR_LANCAMENTO) FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK) ');
      Sql.Add(' WHERE NR_PROCESSO = "'+qry_notifica_NR_PROCESSO.AsString+'"');
      Sql.Add(' AND NR_SOLICITACAO = "'+qry_notifica_NR_SOLICITACAO.AsString+'"');
      Open;
      if Fields[0].AsString = '' then
        qry_notifica_Item_NR_LANCAMENTO.AsString := '001'
      else qry_notifica_Item_NR_LANCAMENTO.AsString := formatfloat('000',Fields[0].AsInteger + 1 );
      qry_notifica_item_NR_SOLICITACAO.AsString := qry_notifica_NR_SOLICITACAO.AsString;
    end;
  end;
end;

procedure Tdatm_notificacao.qry_notifica_item_AfterPost(DataSet: TDataSet);
begin
  {by carlos - destrava o grid dos itens do numerario}
  frm_notificacao.dbgrid_numerario.Enabled:=True;
  
  qry_notifica_item_.ApplyUpdates;
end;

procedure Tdatm_notificacao.qry_notifica_item_AfterDelete(DataSet: TDataSet);
begin
  qry_notifica_item_.ApplyUpdates;
end;

procedure Tdatm_notificacao.qry_notifica_item_AfterScroll(DataSet: TDataSet);
begin
  if qry_notifica_item_TP_DESTINO.AsString = '0' then
  begin
    frm_notificacao.dbedt_cd_favorecido.Color    := clWindow;
    frm_notificacao.dbedt_cd_favorecido.ReadOnly := False;
    frm_notificacao.dbedt_cd_favorecido.TabStop  := True;
    frm_notificacao.btn_co_favorecido.Enabled    := True;
  end else begin
    frm_notificacao.dbedt_cd_favorecido.Color    := clMenu;
    frm_notificacao.dbedt_cd_favorecido.ReadOnly := True;
    frm_notificacao.dbedt_cd_favorecido.TabStop  := False;
    frm_notificacao.btn_co_favorecido.Enabled    := False;
  end;
  if (qry_notifica_item_CD_MOEDA_COMPRA.AsString <> '') and
     (frm_notificacao.pgctrl_notif_numerario.activePage = frm_notificacao.ts_numerario) then
    ds_notifica_item.AutoEdit:=false
  else ds_notifica_item.AutoEdit:=frm_notificacao.st_modificar;
  if qry_notifica_IN_EMITIDO.AsString = '1' then
    ds_notifica_item.AutoEdit:=false;
end;

procedure Tdatm_notificacao.qry_notifica_AfterScroll(DataSet: TDataSet);
begin
  if qry_processo_TP_SERVICO.AsString = '1' then
    exit;//processo agenciamento
  if not qry_notifica_.IsEmpty then
  begin
    if not(qry_notifica_DT_EMISSAO.IsNull) or ((qry_notifica_CD_STATUS.AsString = 'C') and not(qry_notifica_NR_SOLICITACAO.AsString = ConsultaLookUP('TNUMERARIO_NOTIFICA','NR_PROCESSO',qry_notifica_NR_PROCESSO.AsString,'MAX(NR_SOLICITACAO)'))) then
    begin
      //ds_notifica.AutoEdit       := False;
      ds_notifica_item.AutoEdit  := False;
      frm_notificacao.btn_mi (frm_notificacao.st_incluir, False, False, False);
      frm_notificacao.btn_co_favorecido.Enabled := False;
      frm_notificacao.btn_co_item.Enabled       := False;
      frm_notificacao.btn_co_banco.Enabled      := False;
    end else begin
      //ds_notifica.AutoEdit      := frm_notificacao.st_modificar;
      ds_notifica_item.AutoEdit := frm_notificacao.st_modificar;
      frm_notificacao.btn_mi (frm_notificacao.st_incluir, False, False, frm_notificacao.st_excluir);
      frm_notificacao.btn_co_favorecido.Enabled := True;
      frm_notificacao.btn_co_item.Enabled       := True;
      frm_notificacao.btn_co_banco.Enabled      := True;
    end;
    // Alteração para poder editar o campo de descrição - Michel 14/10/2008
    ds_notifica.AutoEdit := (qry_notifica_VL_RECEBIDO.AsFloat = 0) and (qry_notifica_Look_status.AsString <> 'Baixado') and (qry_notifica_Look_status.AsString <> 'Cancelado');
    if qry_notifica_VL_RECEBIDO.AsFloat <= 0 then
    begin
      frm_notificacao.btn_cancela_numerario.Enabled := True;
      frm_notificacao.mi_cancela_numerario.Enabled  := True;
    end else begin
      frm_notificacao.btn_cancela_numerario.Enabled := False;
      frm_notificacao.mi_cancela_numerario.Enabled  := False;
    end;
  end else begin
    ds_notifica.AutoEdit       := False;
    ds_notifica_item.AutoEdit := False;
    frm_notificacao.btn_mi (frm_notificacao.st_incluir, False, False, False);
  end;
end;

procedure Tdatm_notificacao.qry_notifica_item_CalcFields(DataSet: TDataSet);
begin
  if  not(qry_notifica_item_CD_MOEDA_VENDA.IsNull) then
    qry_notifica_item_calc_origem.AsString:='Mód. Cargo'
  else qry_notifica_item_calc_origem.AsString:='Mód. Broker';
end;

procedure Tdatm_notificacao.qry_imp_notificacao_CalcFields(DataSet: TDataSet);
var vMoeda:  string[3];
    vTaxa, vTaxaDolar: Real;
begin
  qry_imp_notificacao_calc_end_cliente.AsString := qry_imp_notificacao_END_EMPRESA.AsString + ', '+
                                                   qry_imp_notificacao_END_NUMERO.AsString + #13 +
                                                   qry_imp_notificacao_END_CIDADE.AsString + ' - '+ qry_imp_notificacao_END_UF.AsString;
  qry_imp_notificacao_calc_end_consig.AsString := qry_imp_notificacao_END_CONSIG.AsString + ', '+
                                                   qry_imp_notificacao_END_NUMERO_CONSIG.AsString + #13 +
                                                   qry_imp_notificacao_END_CIDADE_CONSIG.AsString + ' - '+ qry_imp_notificacao_END_UF_CONSIG.AsString;

  qry_imp_notificacao_cacl_nr_processo.AsString := copy(qry_imp_notificacao_NR_PROCESSO.AsString,5,10);
  qry_imp_notificacao_calc_nm_usuario.AsString  := ConsultaLookup('TUSUARIO','CD_USUARIO', str_cd_usuario,'NM_USUARIO');
  qry_imp_notificacao_calc_nm_usuario_fi.AsString := 'Notificado por: ' +
                                                      ConsultaLookup('TUSUARIO','CD_USUARIO', str_cd_usuario,'NM_USUARIO') +
                                                      ', em: ' +  FormatDateTime('dd/mm/yyyy', qry_imp_notificacao_DT_NOTIFICACAO.AsDateTime);
  if qry_imp_notificacao_TP_DESTINO.AsString = '1' then
    qry_imp_notificacao_calc_nm_destino.AsString := 'Cliente'
  else qry_imp_notificacao_calc_nm_destino.AsString := qry_imp_notificacao_NM_UNID_NEG.AsString;

  vMoeda := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', qry_imp_notificacao_NR_PROCESSO.AsString, 'CD_MOEDA_MLE');
  if vMoeda = '220' then
    qry_imp_notificacao_calcMLEDolar.AsFloat := qry_imp_notificacao_VL_MLE_MNEG.AsFloat
  else begin
    vTaxa := StrToFloatDef(ConsultaLookUpSQL('SELECT ISNULL(TX_CAMBIO, 0) TAXA FROM TTAXA_CAMBIO (NOLOCK) ' +
                           ' WHERE GETDATE() BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ' +
                           '   AND CD_MOEDA = "' + vMoeda + '" ', 'TAXA'), 0);
    vTaxaDolar := StrToFloatDef(ConsultaLookUpSQL('SELECT ISNULL(TX_CAMBIO, 0) TAXA FROM TTAXA_CAMBIO (NOLOCK) ' +
                                ' WHERE GETDATE() BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ' +
                                '   AND CD_MOEDA = "220" ', 'TAXA'), 1);
    qry_imp_notificacao_calcMLEDolar.AsFloat := (qry_imp_notificacao_VL_MLE_MNEG.AsFloat*vTaxa)/vTaxaDolar;
  end;

  qry_imp_notificacao_calcMercadoriaFI.AsString := '';
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add(' SELECT RTRIM(LTRIM(TX_MERCADORIA)) + ", " MERC FROM TPROPOSTA_MERCADORIA (NOLOCK) WHERE NR_PROPOSTA = "' + qry_imp_notificacao_NR_PROPOSTA.AsString + '"  AND ISNULL(TX_MERCADORIA, "") <> "" ');
    Open;
    while not Eof do begin
      qry_imp_notificacao_calcMercadoriaFI.AsString := qry_imp_notificacao_calcMercadoriaFI.AsString + Fields[0].AsString;
      Next;
    end;
    Free;
    qry_imp_notificacao_calcMercadoriaFI.AsString := Copy(qry_imp_notificacao_calcMercadoriaFI.AsString, 1, Length(qry_imp_notificacao_calcMercadoriaFI.AsString) - 2);
  end;


end;

procedure Tdatm_notificacao.qry_notifica_AfterPost(DataSet: TDataSet);
begin
  qry_notifica_.ApplyUpdates;
end;

procedure Tdatm_notificacao.qry_notifica_BeforeDelete(DataSet: TDataSet);
begin
  qry_notifica_.ApplyUpdates;
end;

procedure Tdatm_notificacao.qry_imp_notificacao_exp_CalcFields(DataSet: TDataSet);
var vMoeda:  string[3];
    vTaxa, vTaxaDolar: Real;
begin
  qry_imp_notificacao_exp_calc_end_cliente.AsString := qry_imp_notificacao_exp_END_EMPRESA.AsString + ', '+
                                                       qry_imp_notificacao_exp_END_NUMERO.AsString + #13+
                                                       qry_imp_notificacao_exp_END_CIDADE.AsString + ' - '+  qry_imp_notificacao_exp_END_UF.AsString;
  qry_imp_notificacao_exp_calc_nr_processo.AsString := copy(qry_imp_notificacao_exp_NR_PROCESSO.AsString,5,10);
  qry_imp_notificacao_exp_calc_nm_usuario.AsString  := ConsultaLookup('TUSUARIO','CD_USUARIO', str_cd_usuario,'NM_USUARIO');
  if qry_imp_notificacao_exp_TP_DESTINO.AsString = '1' then
    qry_imp_notificacao_exp_calc_nm_destino.AsString := 'Cliente'
  else qry_imp_notificacao_exp_calc_nm_destino.AsString := qry_imp_notificacao_exp_NM_UNID_NEG.AsString;

  vMoeda := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', qry_imp_notificacao_exp_NR_PROCESSO.AsString, 'CD_MOEDA_MLE');
  if vMoeda = '220' then
    qry_imp_notificacao_exp_calcMLEDolar.AsFloat := qry_imp_notificacao_exp_VL_MLE_MNEG.AsFloat
  else begin
    vTaxa := StrToFloatDef(ConsultaLookUpSQL('SELECT ISNULL(TX_CAMBIO, 0) TAXA FROM TTAXA_CAMBIO (NOLOCK) ' +
                           ' WHERE GETDATE() BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ' +
                           '   AND CD_MOEDA = "' + vMoeda + '" ', 'TAXA'), 0);
    vTaxaDolar := StrToFloatDef(ConsultaLookUpSQL('SELECT ISNULL(TX_CAMBIO, 0) TAXA FROM TTAXA_CAMBIO (NOLOCK) ' +
                                ' WHERE GETDATE() BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ' +
                                '   AND CD_MOEDA = "220" ', 'TAXA'), 1);
    qry_imp_notificacao_exp_calcMLEDolar.AsFloat := (qry_imp_notificacao_exp_VL_MLE_MNEG.AsFloat*vTaxa)/vTaxaDolar;
  end;


  Case StrToIntDef(qry_imp_notificacao_exp_TP_CONSIGNATARIO.ASString, 0) of
  0: qry_imp_notificacao_exp_calcNmConsig.AsString := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST ' +
                                                                        'WHERE CD_EMPRESA = "' + qry_imp_notificacao_exp_CD_CONSIGNATARIO.AsString + '" ' +
                                                                        ' AND IN_IMPORTADOR = ''1'' AND IN_ATIVO = ''1'' ',
                                                                        'NM_EMPRESA');
  1: qry_imp_notificacao_exp_calcNmConsig.AsString := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST ' +
                                                                        'WHERE CD_EMPRESA = "' + qry_imp_notificacao_exp_CD_CONSIGNATARIO.AsString + '" ' +
                                                                        ' AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
                                                                        'NM_EMPRESA');
  3: qry_imp_notificacao_exp_calcNmConsig.AsString := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST ' +
                                                                        'WHERE CD_EMPRESA = "' + qry_imp_notificacao_exp_CD_CONSIGNATARIO.AsString + '" ' +
                                                                        ' AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
                                                                        'NM_EMPRESA');
  2: qry_imp_notificacao_exp_calcNmConsig.AsString := ConsultaLookUP('TTRANSPORTADOR_ITL', 'CODIGO', qry_imp_notificacao_exp_CD_CONSIGNATARIO.AsString, 'DESCRICAO');
  4: qry_imp_notificacao_exp_calcNmConsig.AsString := ConsultaLookUP('TDESPACHANTE', 'CD_DESPACHANTE', qry_imp_notificacao_exp_CD_CONSIGNATARIO.AsString, 'NM_DESPACHANTE');
  end;


  qry_imp_notificacao_exp_calcENDConsig.AsString := qry_imp_notificacao_exp_END_CONSIG.AsString + ', '+
                                                    qry_imp_notificacao_exp_NUMERO_CONSIG.AsString + #13+
                                                    qry_imp_notificacao_exp_CIDADE_CONSIG.AsString + ' - '+  qry_imp_notificacao_exp_EST_CONSIG.AsString;
end;

procedure Tdatm_notificacao.ds_notifica_itemStateChange(Sender: TObject);
begin
  frm_notificacao.btnDuplicaSolic.Enabled := not (qry_notifica_item_.State in [dsInsert, dsEdit]);
end;

procedure Tdatm_notificacao.qry_notifica_CalcFields(DataSet: TDataSet);
begin
//Rodrigo Capra - 05484/07
  qry_notifica_calcDT_BAIXA.AsString :=
      ConsultaLookUPSQL('SELECT TR.DT_RECEBIMENTO FROM TRECEBIMENTO_AG TR (NOLOCK), TRECEBIMENTO_PROCESSO P (NOLOCK) ' +
                        'WHERE ' +
                        '   TR.NR_RECEBIMENTO = P.NR_RECEBIMENTO AND TR.CD_CLIENTE = P.CD_CLIENTE AND TR.CD_UNID_NEG = P.CD_UNID_NEG ' +
                        '   AND TR.IN_ABERTO = ''B'' and P.NR_PROCESSO =  ''' + qry_notifica_NR_PROCESSO.AsString + ''' ' +
                        '   and P.NR_SOLICITACAO = ''' + qry_notifica_NR_SOLICITACAO.AsString + '''','DT_RECEBIMENTO');
end;

procedure Tdatm_notificacao.qryMoedasCalcFields(DataSet: TDataSet);
var
  nmMoeda: String;
begin
  nmMoeda := AnsiLowerCase(qryMoedasNM_MOEDA.AsString);
  if nmMoeda <> '' then
    nmMoeda[1] := UpCase(nmMoeda[1]);
  qryMoedascalc_nm_moeda.AsString := nmMoeda + ':';
end;

procedure Tdatm_notificacao.trava_grid_numerario(
  DataSet: TDataSet);
begin
  {by carlos - trava o grid dos itens do numerario}
  frm_notificacao.dbgrid_numerario.Enabled:=False;
end;

procedure Tdatm_notificacao.qry_notifica_item_AfterCancel(
  DataSet: TDataSet);
begin
  {by carlos - destrava o grid dos itens do numerario}
  frm_notificacao.dbgrid_numerario.Enabled:=True;
end;

procedure Tdatm_notificacao.qry_notifica_item_PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  {by carlos - destrava o grid dos itens do numerario}
  frm_notificacao.dbgrid_numerario.Enabled:=True;
end;

end.
