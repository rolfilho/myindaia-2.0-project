(*************************************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGFT050.PAS - Data Module - Impressão de Nota Fiscal de Serviço/Indaiá

AUTOR: Bysoft

DATA: 29/01/2002

Manutenção: Leandro Stipanich

*************************************************************************************************)

unit datm_nf_serv;

interface


uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, RAWPrinter;

type
  Tdatm_sel_fat1 = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    ds_grd_sol: TDataSource;
    qry_fat_sol_: TQuery;
    ds_fat_proc: TDataSource;
    qry_ult_fat_: TQuery;
    qry_param_: TQuery;
    ds_processo: TDataSource;
    qry_cliente_: TQuery;
    qry_fat_cc_: TQuery;
    qry_fat_cc_LookNomeItem: TStringField;
    qry_fatura_: TQuery;
    qry_di_: TQuery;
    qry_di_CalcVlrTotalFOB: TFloatField;
    qry_di_CalcVlrTotalCIF: TFloatField;
    qry_item_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_param_VL_ALIQ_IR: TFloatField;
    qry_param_NM_CID_CHEQUE: TStringField;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_di_DT_REGISTRO_DI: TStringField;
    qry_di_PB_CARGA: TFloatField;
    qry_di_IN_MOEDA_UNICA: TBooleanField;
    qry_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_CD_MOEDA_MLE: TStringField;
    qry_di_TX_MLE: TFloatField;
    qry_di_VL_TOTAL_MLE_MN: TFloatField;
    qry_di_VL_TOT_DESPS_MN: TFloatField;
    qry_di_VL_TOTAL_FRETE_MN: TFloatField;
    qry_di_VL_TOTAL_SEG_MN: TFloatField;
    qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField;
    qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField;
    qry_fatura_TX_OBSERVACOES: TMemoField;
    qry_fat_sol_CD_UNID_NEG: TStringField;
    qry_fat_sol_CD_PRODUTO: TStringField;
    qry_fat_sol_NR_SOLICITACAO: TStringField;
    qry_fat_sol_IN_IMPRESSO: TStringField;
    qry_fat_sol_DT_IMPRESSAO: TDateTimeField;
    qry_fat_sol_TP_TIPO_FAT: TStringField;
    qry_fat_sol_NR_NOTA_FATURA: TStringField;
    qry_fat_sol_TX_OBSERVACOES: TMemoField;
    qry_fat_sol_DT_FATURA: TDateTimeField;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_END_EMPRESA: TStringField;
    qry_cliente_END_NUMERO: TStringField;
    qry_cliente_END_CIDADE: TStringField;
    qry_cliente_END_BAIRRO: TStringField;
    qry_cliente_END_UF: TStringField;
    qry_cliente_CGC_EMPRESA: TStringField;
    qry_cliente_CPF_EMPRESA: TStringField;
    qry_fat_cc_DT_LANCAMENTO: TDateTimeField;
    qry_fat_cc_CD_ITEM: TStringField;
    qry_fat_cc_VL_ITEM: TFloatField;
    qry_fat_cc_CD_FORMA_PAGTO: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    qry_ret_proc_: TQuery;
    qry_ret_proc_NR_PROCESSO: TStringField;
    qry_cliente_END_CEP: TStringField;
    qry_cliente_IE_EMPRESA: TStringField;
    qry_fatura_VL_FATURA: TFloatField;
    ds_fat_cc: TDataSource;
    qry_fat_cc_IN_RESTITUI: TStringField;
    qry_fat_cc_NM_ITEM_COMPLEMENTO: TStringField;
    qry_ult_fat_NR_ULT_FATURA: TStringField;
    qry_param_CD_MOD_FAT: TStringField;
    qry_grd_sol_: TQuery;
    qry_grd_sol_CD_UNID_NEG: TStringField;
    qry_grd_sol_CD_PRODUTO: TStringField;
    qry_grd_sol_NR_SOLICITACAO: TStringField;
    qry_grd_sol_TX_YESNO: TStringField;
    qry_grd_sol_NR_NOTA_FATURA: TStringField;
    qry_grd_sol_CalcNrSolicitacao: TStringField;
    ds_grd_adm: TDataSource;
    qry_grd_adm_: TQuery;
    qry_grd_sol_NR_NF_SERV: TStringField;
    qry_grd_adm_TX_YESNO: TStringField;
    qry_grd_adm_NR_DOCTO: TStringField;
    qry_grd_adm_NR_NF_SERV: TStringField;
    qry_grd_adm_NM_FAVORECIDO: TStringField;
    qry_fav_adm_: TQuery;
    qry_grd_adm_VL_NOTA: TFloatField;
    qry_grd_adm_CD_FAVORECIDO: TStringField;
    qry_fat_sol_NR_NF_SERV: TStringField;
    qry_fat_sol_IN_IMP_NF_SERV: TStringField;
    qry_ult_nf_serv_fat_: TQuery;
    qry_ult_nf_serv_fat_NR_ULT_NF_SERV: TStringField;
    qry_ult_nf_serv_adm_: TQuery;
    qry_ult_nf_serv_adm_NR_ULT_NF_SERV: TStringField;
    qry_fat_sol_DT_NF_SERV: TDateTimeField;
    qry_atz_adm_: TQuery;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    qry_fav_adm_NM_FAVORECIDO: TStringField;
    qry_fav_adm_END_FAVORECIDO: TStringField;
    qry_fav_adm_END_CIDADE: TStringField;
    qry_fav_adm_END_UF: TStringField;
    qry_fav_adm_CGC_EMPRESA: TStringField;
    qry_fav_adm_IE_EMPRESA: TStringField;
    qry_tot_comissao_fat_: TQuery;
    qry_tot_comissao_fat_VL_COMISSAO: TFloatField;
    qry_param_CD_MOD_NF_SERV: TStringField;
    qry_fat_sol_CD_USUARIO_IMP: TStringField;
    qry_fat_sol_IN_SELECIONADO: TStringField;
    qry_ult_nota_adm_: TQuery;
    qry_ult_nota_adm_NR_NOTA_ADM: TStringField;
    qry_ult_nota_fat_: TQuery;
    qry_ult_nota_fat_NR_NOTA_FAT: TStringField;
    qry_param_NR_ULT_NOTA: TStringField;
    sp_atz_evento: TStoredProc;
    sp_rel_prev_fat: TStoredProc;
    qry_apaga_dados_: TQuery;
    qry_cliente_representante_: TQuery;
    qry_cliente_representante_NM_EMPRESA: TStringField;
    qry_cliente_representante_IN_DEST_FAT: TStringField;
    qry_cliente_representante_IN_DEST_NF: TStringField;
    qry_cliente_representante_END_EMPRESA: TStringField;
    qry_cliente_representante_END_NUMERO: TStringField;
    qry_cliente_representante_END_BAIRRO: TStringField;
    qry_cliente_representante_END_CIDADE: TStringField;
    qry_cliente_representante_END_UF: TStringField;
    qry_cliente_representante_END_CEP: TStringField;
    qry_cliente_representante_CGC_EMPRESA: TStringField;
    qry_cliente_representante_IE_EMPRESA: TStringField;
    qry_ult_fat_unid_: TQuery;
    qry_ult_fat_unid_NR_NOTA_FATURA: TStringField;
    qry_ir_in_fat_: TQuery;
    qry_ir_in_fat_CD_IR_FAT: TStringField;
    qry_grd_sol_NR_BOLETO: TStringField;
    qry_grd_sol_CalcStatus: TStringField;
    qry_grd_sol_IN_CANCELADO: TStringField;
    qry_grd_sol_IN_LIQUIDADO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_TX_MERCADORIA: TMemoField;
    qry_processo_CD_LOCAL_EMBARQUE: TStringField;
    qry_processo_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_processo_CD_EMBARCACAO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_LookEmbarc: TStringField;
    qry_processo_LookLocalDesem: TStringField;
    qry_processo_LookLocalEmb: TStringField;
    qry_processo_DT_REGISTRO_DI: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_NR_DECLARACAO_IMP: TStringField;
    qry_processo_QT_VOLUMES: TIntegerField;
    qry_processo_PB_CARGA: TFloatField;
    qry_processo_VL_CIF_MN: TFloatField;
    qry_processo_VL_CIF_DOLAR: TFloatField;
    qry_processo_NR_DDE: TStringField;
    qry_fat_proc_: TQuery;
    qry_fat_proc_CalcNrProcesso: TStringField;
    qry_fat_proc_NR_PROCESSO: TStringField;
    qry_fat_proc_CD_CLIENTE: TStringField;
    qry_fat_proc_AP_EMPRESA: TStringField;
    qry_fat_proc_NM_EMPRESA: TStringField;
    qry_fat_proc_END_EMPRESA: TStringField;
    qry_fat_proc_END_CIDADE: TStringField;
    qry_fat_proc_END_UF: TStringField;
    qry_fat_proc_CGC_EMPRESA: TStringField;
    qry_fat_proc_IE_EMPRESA: TStringField;
    qry_fat_proc_CD_REPRESENTANTE: TStringField;
    qry_fat_proc_CD_UNID_NEG: TStringField;
    qry_fat_proc_CD_PRODUTO: TStringField;
    qry_fat_proc_CD_SERVICO: TStringField;
    qry_fat_proc_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_fat_proc_END_CEP: TStringField;
    qry_fat_sol_DT_VENCTO_FATURA: TDateTimeField;
    qry_fat_sol_CD_UNID_NEG_FAT: TStringField;
    procedure qry_di_CalcFields(DataSet: TDataSet);
    procedure qry_fat_proc_CalcFields(DataSet: TDataSet);
    procedure qry_grd_sol_CalcFields(DataSet: TDataSet);
    procedure qry_grd_sol_AfterScroll(DataSet: TDataSet);
    procedure qry_fat_proc_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_fat1: Tdatm_sel_fat1;

implementation

uses PGFT005, GSMLIB;

{$R *.DFM}

procedure Tdatm_sel_fat1.qry_di_CalcFields(DataSet: TDataSet);
begin
  with datm_sel_fat do
  begin
    qry_di_CalcVlrTotalFOB.AsFloat := 0;
    qry_di_CalcVlrTotalCIF.AsFloat := 0;

    if (qry_di_IN_MOEDA_UNICA.AsBoolean ) and
       (qry_di_VL_TOT_MLE_MNEG.AsFloat > 0) and
       (qry_di_CD_MOEDA_MLE.AsString <> '') then
       qry_di_CalcVlrTotalFOB.AsFloat := Arredondar( qry_di_VL_TOT_MLE_MNEG.AsFloat * qry_di_TX_MLE.AsFloat, 2 );

    qry_di_CalcVlrTotalCIF.AsFloat := qry_di_VL_TOTAL_MLE_MN.AsFloat +
                                      qry_di_VL_TOT_DESPS_MN.AsFloat +
                                      qry_di_VL_TOTAL_FRETE_MN.AsFloat +
                                      qry_di_VL_TOTAL_SEG_MN.AsFloat +
                                      qry_di_VL_TOTAL_ACRESCIMOS_MN.AsFloat +
                                      qry_di_VL_TOTAL_DEDUCOES_MN.AsFloat;
  end;
end;

procedure Tdatm_sel_fat1.qry_fat_proc_CalcFields(DataSet: TDataSet);
begin
  if Not qry_fat_proc_NR_PROCESSO.IsNull then
  begin
    qry_fat_proc_CalcNrProcesso.AsString := Copy(qry_fat_proc_NR_PROCESSO.AsString,5,14);
  end;
end;

procedure Tdatm_sel_fat1.qry_grd_sol_CalcFields(DataSet: TDataSet);
begin
  if Not ( qry_grd_sol_NR_SOLICITACAO.IsNull ) then
  begin
    qry_grd_sol_CalcNrSolicitacao.AsString := Copy( qry_grd_sol_NR_SOLICITACAO.AsString, 1, 2 ) + '/' +
                                              Copy( qry_grd_sol_NR_SOLICITACAO.AsString, 3, 4 );
  end;
  {Status}
  if qry_grd_sol_IN_CANCELADO.AsString = '1' then
    qry_grd_sol_CalcStatus.AsString := 'Cancelado'
  else
  begin
    if qry_grd_sol_IN_LIQUIDADO.AsString = '1' then
       qry_grd_sol_CalcStatus.AsString := 'Liquidado'
    else
    begin
      if Trim( qry_grd_sol_NR_BOLETO.AsString ) = '' then
         qry_grd_sol_CalcStatus.AsString := 'Em aberto'
      else
         qry_grd_sol_CalcStatus.AsString := 'Faturado';
    end;
  end;
end;

procedure Tdatm_sel_fat1.qry_grd_sol_AfterScroll(DataSet: TDataSet);
begin
  qry_fat_proc_.Close;
  qry_fat_proc_.ParamByName('CD_UNID_NEG').AsString    := qry_grd_sol_CD_UNID_NEG.AsString;
  qry_fat_proc_.ParamByName('CD_PRODUTO').AsString     := qry_grd_sol_CD_PRODUTO.AsString;
  qry_fat_proc_.ParamByName('NR_SOLICITACAO').AsString := qry_grd_sol_NR_SOLICITACAO.AsString;
  qry_fat_proc_.Prepare;
  qry_fat_proc_.Open;
end;

procedure Tdatm_sel_fat1.qry_fat_proc_AfterScroll(DataSet: TDataSet);
begin
  qry_processo_.Close;
  qry_processo_.Unprepare;
  qry_processo_.ParamByName('NR_PROCESSO').AsString := qry_fat_proc_NR_PROCESSO.AsString;
  qry_processo_.Prepare;
  qry_processo_.Open;
end;

end.
