(*************************************************************************************************
Sistema: MyIndaia
PROGRAMA: PGGP014.PAS - Data Module da Liberação de Contas a Pagar
Manutenção:
Data: 13/10/2006 - parâmetro CD_UNID_NEG na SqlContasLancamento
*************************************************************************************************)

unit PGGP014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ADODB, Inifiles, Funcoes;

type
  Tdatm_lib_ctaapagar = class(TDataModule)
    ds_coligada: TDataSource;
    qry_unidade_: TQuery;
    ds_ctaapagar: TDataSource;
    qry_ctaapagar_: TQuery;
    qry_liberacao_DT_CTAAPAGAR: TDateTimeField;
    qry_liberacao_NR_CTAAPAGAR: TStringField;
    qry_liberacao_IN_LIBERADO: TStringField;
    qry_liberacao_CD_LIBERADOR: TStringField;
    qry_liberacao_DT_LIBERACAO: TDateTimeField;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_ctaapagar_LookLiberado: TStringField;
    qry_liberacao_DT_PAGAMENTO: TDateTimeField;
    sp_distribui_ctaapagar: TStoredProc;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_liberacao_CD_UNID_NEG: TStringField;
    qry_favorecido_: TQuery;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_ctaapagar_CD_UNID_NEG: TStringField;
    qry_ctaapagar_CD_FAVORECIDO: TStringField;
    qry_ctaapagar_CD_BANCO: TStringField;
    qry_ctaapagar_DT_CTAAPAGAR: TDateTimeField;
    qry_ctaapagar_NR_CTAAPAGAR: TStringField;
    qry_ctaapagar_DT_VENCIMENTO: TDateTimeField;
    qry_ctaapagar_DT_PAGAMENTO: TDateTimeField;
    qry_ctaapagar_NM_HISTORICO: TStringField;
    qry_ctaapagar_IN_LIBERADO: TStringField;
    qry_ctaapagar_IN_DISTRIBUICAO: TStringField;
    qry_ctaapagar_Look_Favorecido: TStringField;
    qry_ctaapagar_Look_Banco: TStringField;
    qry_ctaapagar_CD_FORNECEDOR: TStringField;
    qry_ctaapagar_Look_Fornecedor: TStringField;
    qry_ctaapagar_NR_TITULO: TStringField;
    qry_ctaapagar_IN_OPERACIONAL: TStringField;
    sp_distribui_ctaapagar_ag: TStoredProc;
    qry_ctaapagar_TP_PAGAMENTO: TStringField;
    UpdateSQL1: TUpdateSQL;
    qry_ctaapagar_IN_CONTABILIZADO: TStringField;
    UpdateSQL2: TUpdateSQL;
    qry_ctaapagar_CD_LIBERADOR: TStringField;
    qry_ctaapagar_DT_LIBERACAO: TDateTimeField;
    sp_contabiliza_pagto_dinheiro_ctapagar: TStoredProc;
    sp_baixa_lanc_adm: TStoredProc;
    qry_liberacao_: TQuery;
    qry_ContasAgrupadas: TQuery;
    dts_ContasAgrupadas: TDataSource;
    SqlContasLancamento: TQuery;
    DtsContasLancamento: TDataSource;
    qry_ContasAgrupadasNR_REF: TStringField;
    qry_ContasAgrupadasVL_LANCTO: TFloatField;
    qry_ContasAgrupadasNM_FAVORECIDO: TStringField;
    SqlContasLancamentoDT_CTAAPAGAR: TDateTimeField;
    SqlContasLancamentoNR_CTAAPAGAR: TStringField;
    SqlContasLancamentoCD_CT_CONTABIL: TStringField;
    SqlContasLancamentoCD_FILIAL: TStringField;
    SqlContasLancamentoCD_CT_CUSTO: TStringField;
    SqlContasLancamentoVL_LANCAMENTO: TFloatField;
    SqlContasLancamentoCD_UNID_NEG: TStringField;
    SqlContasLancamentoCD_ACESSO: TStringField;
    SqlContasLancamentoCD_AUX: TStringField;
    SqlContasLancamentoCD_ITEM: TStringField;
    SqlContasLancamentoNM_CT_CONTABIL: TStringField;
    qry_ctaapagar_VL_LIQUIDO: TFloatField;
    qry_ContasAgrupadasDT_MONTAGEM: TDateTimeField;
    qry_ContasAgrupadasDT_PAGAMENTO: TDateTimeField;
    qry_ContasAgrupadasTP_PAGAMENTO: TStringField;
    qry_ContasAgrupadasIN_LIBERADO: TStringField;
    qry_ContasAgrupadascalcTpPagto: TStringField;
    qry_ContasAgrupadascalcLiberado: TStringField;
    qry_ctaapagar_STATUS: TStringField;
    qry_status_solic_adm_: TQuery;
    qry_status_solic_adm_CODIGO: TStringField;
    qry_status_solic_adm_DESCRICAO: TStringField;
    ds_status_solic_adm: TDataSource;
    qry_ContasAgrupadasSTATUS: TStringField;
    qry_ContasAgrupadascalcStatus: TStringField;
    qry_ins_caixa: TQuery;
    StringField1: TStringField;
    qry_ult_lancto_: TQuery;
    sp_distribui_adm: TStoredProc;
    StringField17: TStringField;
    StringField18: TStringField;
    SqlContasLancamentoNR_LANC_CAIXA: TStringField;
    qry_ult_lancto_NR_LANCAMENTO: TIntegerField;
    qry_ContasAgrupadasDT_VENC: TDateTimeField;
    qry_ContasAgrupadasDT_CTAAPAGAR: TDateTimeField;
    SqlContasLancamentoDT_MOVIMENTO_CAIXA: TDateTimeField;
    procedure qry_ctaapagar_BeforeOpen(DataSet: TDataSet);
    procedure qry_ctaapagar_CalcFields(DataSet: TDataSet);
    procedure qry_ctaapagar_AfterPost(DataSet: TDataSet);
    procedure qry_liberacao_AfterPost(DataSet: TDataSet);
    procedure qry_ContasAgrupadasAfterScroll(DataSet: TDataSet);
    procedure qry_ContasAgrupadasCalcFields(DataSet: TDataSet);
  private
    // Private declarations 
  public
    // Public declarations 
    procedure executa_sp_contabiliza_pagto_dinheiro_ctapagar(cd_unid_neg, nr_ctaapagar, cd_banco, nr_docto:String;
                                                             dt_movimento, dt_pagto :Tdatetime);
    procedure exec_sp_baixa_pagto_adm(cd_unid_neg, nr_ctaapagar, cd_banco, nr_docto:String;
                                                             dt_movimento, dt_pagto :Tdatetime);

  end;

var
  datm_lib_ctaapagar: Tdatm_lib_ctaapagar;

implementation

{$R *.DFM}

uses PGGP001, PGGP017, PGCH005, PGGP013, GSMLIB;

procedure Tdatm_lib_ctaapagar.executa_sp_contabiliza_pagto_dinheiro_ctapagar(
  cd_unid_neg, nr_ctaapagar, cd_banco, nr_docto: String; dt_movimento,
  dt_pagto: Tdatetime);
var
  IniFile: Tinifile;
  path, vConnectionString: String;
begin
  (* path := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create( path + 'RM.INI');
  vConnectionString := IniFile.ReadString('CONNECTION', 'STRING', 'ERROR');
  IniFile.Free;

  sp_contabiliza_pagto_dinheiro_ctapagar.ConnectionString := vConnectionString;

  sp_contabiliza_pagto_dinheiro_ctapagar.Parameters.ParamByName('@cd_unid_neg').VAlue  := cd_unid_neg;
  sp_contabiliza_pagto_dinheiro_ctapagar.Parameters.ParamByName('@nr_cta_pagar').VAlue := nr_ctaapagar;
  sp_contabiliza_pagto_dinheiro_ctapagar.Parameters.ParamByName('@cd_banco').VAlue     := cd_banco;
  sp_contabiliza_pagto_dinheiro_ctapagar.Parameters.ParamByName('@nr_docto').VAlue     := nr_docto;
  sp_contabiliza_pagto_dinheiro_ctapagar.Parameters.ParamByName('@dt_movimento').VAlue := dt_movimento;
  sp_contabiliza_pagto_dinheiro_ctapagar.Parameters.ParamByName('@dt_pagto').VAlue     := dt_pagto;

  sp_contabiliza_pagto_dinheiro_ctapagar.ExecProc;
  sp_contabiliza_pagto_dinheiro_ctapagar.close;   *)

  CloseStoredProc( sp_contabiliza_pagto_dinheiro_ctapagar );
  sp_contabiliza_pagto_dinheiro_ctapagar.ParamByName('@cd_unid_neg').AsString    := cd_unid_neg;
  sp_contabiliza_pagto_dinheiro_ctapagar.ParamByName('@nr_cta_pagar').AsString   := nr_ctaapagar;
  sp_contabiliza_pagto_dinheiro_ctapagar.ParamByName('@cd_banco').AsString       := cd_banco;
  sp_contabiliza_pagto_dinheiro_ctapagar.ParamByName('@nr_docto').AsString       := nr_docto;
  sp_contabiliza_pagto_dinheiro_ctapagar.ParamByName('@dt_movimento').AsDAteTime := dt_movimento;
  sp_contabiliza_pagto_dinheiro_ctapagar.ParamByName('@dt_pagto').AsDAteTime     := dt_pagto;
  ExecStoredProc( sp_contabiliza_pagto_dinheiro_ctapagar );
  CloseStoredProc( sp_contabiliza_pagto_dinheiro_ctapagar );

end;

procedure Tdatm_lib_ctaapagar.exec_sp_baixa_pagto_adm(cd_unid_neg,
  nr_ctaapagar, cd_banco, nr_docto: String; dt_movimento,
  dt_pagto: Tdatetime);
var
  IniFile: Tinifile;
  path, vConnectionString: String;
begin
  (* path := ExtractFilePath(Application.ExeName);
  IniFile := TIniFile.Create( path + 'RM.INI');
  vConnectionString := IniFile.ReadString('CONNECTION', 'STRING', 'ERROR');
  IniFile.Free;

  sp_baixa_lanc_adm.ConnectionString := vConnectionString;

  sp_baixa_lanc_adm.Parameters.ParamByName('@cd_unid_neg').VAlue  := cd_unid_neg;
  sp_baixa_lanc_adm.Parameters.ParamByName('@nr_cta_pagar').VAlue := nr_ctaapagar;
  sp_baixa_lanc_adm.Parameters.ParamByName('@cd_banco').VAlue     := cd_banco;
  sp_baixa_lanc_adm.Parameters.ParamByName('@nr_docto').VAlue     := nr_docto;
  sp_baixa_lanc_adm.Parameters.ParamByName('@dt_movimento').VAlue := dt_movimento;
  sp_baixa_lanc_adm.Parameters.ParamByName('@dt_pagto').VAlue     := dt_pagto;

  sp_baixa_lanc_adm.ExecProc;
  sp_baixa_lanc_adm.close; *)

  CloseStoredProc( sp_baixa_lanc_adm );
  sp_baixa_lanc_adm.ParamByName('@cd_unid_neg').AsString    := cd_unid_neg;
  sp_baixa_lanc_adm.ParamByName('@nr_cta_pagar').AsString   := nr_ctaapagar;
  sp_baixa_lanc_adm.ParamByName('@cd_banco').AsString       := cd_banco;
  sp_baixa_lanc_adm.ParamByName('@nr_docto').AsString       := nr_docto;
  sp_baixa_lanc_adm.ParamByName('@dt_movimento').AsDAteTime := dt_movimento;
  sp_baixa_lanc_adm.ParamByName('@dt_pagto').AsDAteTime     := dt_pagto;
  ExecStoredProc( sp_baixa_lanc_adm );
  CloseStoredProc( sp_baixa_lanc_adm );
end;

procedure Tdatm_lib_ctaapagar.qry_ctaapagar_BeforeOpen(DataSet: TDataSet);
begin
  qry_banco_.Close;
  qry_banco_.Prepare;
  qry_banco_.Open;

  qry_favorecido_.Close;
  qry_favorecido_.Prepare;
  qry_favorecido_.Open;
end;

procedure Tdatm_lib_ctaapagar.qry_ctaapagar_CalcFields(DataSet: TDataSet);
begin
  (* qry_ctaapagar_VL_PAGAMENTO.Value := ( MyRound(qry_ctaapagar_VL_DESPESA.Value,2)   -
                                        MyRound(qry_ctaapagar_VL_DESCONTO.Value,2) +
                                        MyRound(qry_ctaapagar_VL_ACRESCIMO.Value,2) -
                                        MyRound(qry_ctaapagar_VL_IR.Value,2)       -
                                        MyRound(qry_ctaapagar_VL_INSS.Value,2) -
                                        MyRound(qry_ctaapagar_VL_PISCOFINS.Value,2) -
                                        MyRound(qry_ctaapagar_VL_ISS.Value,2)); *)
end;

procedure Tdatm_lib_ctaapagar.qry_ctaapagar_AfterPost(DataSet: TDataSet);
begin
  // qry_ctaapagar_.ApplyUpdates;
end;

procedure Tdatm_lib_ctaapagar.qry_liberacao_AfterPost(DataSet: TDataSet);
begin
  // qry_liberacao_.ApplyUpdates;
end;

procedure Tdatm_lib_ctaapagar.qry_ContasAgrupadasAfterScroll(DataSet: TDataSet);
begin
  qry_ctaapagar_.Close;
  qry_ctaapagar_.ParamByName('CD_UNID_NEG').AsString    := qry_ContasAgrupadas.ParamByName('CD_UNID_NEG').AsString;
  qry_ctaapagar_.ParamByName('NR_REF').AsString         := qry_ContasAgrupadasNR_REF.AsString;
  qry_ctaapagar_.ParamByName('DT_INICIO').AsDateTime    := qry_ContasAgrupadas.ParamByName('DT_INICIO').AsDateTime;
  qry_ctaapagar_.ParamByName('DT_FIM').AsDateTime       := qry_ContasAgrupadas.ParamByName('DT_FIM').AsDateTime;
  qry_ctaapagar_.ParamByName('DT_CTAAPAGAR').AsDateTime := qry_ContasAgrupadasDT_CTAAPAGAR.AsDateTime;
  qry_ctaapagar_.Open;
end;

procedure Tdatm_lib_ctaapagar.qry_ContasAgrupadasCalcFields(DataSet: TDataSet);
begin
  If qry_ContasAgrupadasTP_PAGAMENTO.AsString = 'C' Then
    qry_ContasAgrupadascalcTpPagto.AsString := 'Cheque'
  Else If qry_ContasAgrupadasTP_PAGAMENTO.AsString = '$' Then
    qry_ContasAgrupadascalcTpPagto.AsString := 'Dinheiro'
  Else If qry_ContasAgrupadasTP_PAGAMENTO.AsString = 'D' Then
    qry_ContasAgrupadascalcTpPagto.AsString := 'DOC / Débito Conta'
  Else If qry_ContasAgrupadasTP_PAGAMENTO.AsString = 'T' Then
    qry_ContasAgrupadascalcTpPagto.AsString := 'TED';
  qry_ContasAgrupadascalcLiberado.AsString := IIF(qry_ContasAgrupadasIN_LIBERADO.AsString = '0','Não','Sim');
end;                                                                  

end.
